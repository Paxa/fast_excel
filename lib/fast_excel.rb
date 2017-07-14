require_relative './fast_excel/binding'

module FastExcel

  class Formula
    attr_accessor :fml
    def initialize(fml)
      @fml = fml
    end
  end

  DEF_COL_WIDTH = 8.43

  def self.open(filename = nil, constant_memory: false, default_format: nil)
    tmp_file = false
    unless filename
      require 'tmpdir'
      filename = "#{Dir.mktmpdir}/fast_excel.xlsx"
      tmp_file = true
    end

    unless filename
      raise ArgumentError, "filename is required"
    end

    filename = filename.to_s if defined?(Pathname) && filename.is_a?(Pathname)

    workbook = if constant_memory
      opt = Libxlsxwriter::WorkbookOptions.new
      opt[:constant_memory] = 1
      Libxlsxwriter.workbook_new_opt(filename, opt)
    else
      Libxlsxwriter.workbook_new(filename)
    end
    result = Libxlsxwriter::Workbook.new(workbook)

    if default_format
      raise "default_format argument must be a hash" unless default_format.is_a?(Hash)
      result.default_format.set(default_format)
    end

    result.tmp_file = tmp_file
    result.filename = filename
    result
  end

  # Creates internal Libxlsxwriter::Datetime from Datetime object
  def self.lxw_datetime(time)
    date = Libxlsxwriter::Datetime.new
    date[:year] = time.year
    date[:month] = time.month
    date[:day] = time.day
    date[:hour] = time.hour
    date[:min] = time.minute
    date[:sec] = time.second
    date
  end

  # Creates internal Libxlsxwriter::Datetime from Time object
  def self.lxw_time(time)
    date = Libxlsxwriter::Datetime.new
    date[:year] = time.year
    date[:month] = time.month
    date[:day] = time.day
    date[:hour] = time.hour
    date[:min] = time.min
    date[:sec] = time.sec
    date
  end

  # seconds in 1 day
  XLSX_DATE_DAY = 86400.0

  # days between 1970-jan-01 and 1900-jan-01
  XLSX_DATE_EPOCH_DIFF = 25569

  # Convert time to number of days, and change beginning point from 1st jan 1970 to 1st jan 1900
  # Offset argument should be number of seconds, if not specified then it will use Time.zone.utc_offset || 0
  #
  # https://support.microsoft.com/en-us/help/214330/differences-between-the-1900-and-the-1904-date-system-in-excel
  def self.date_num(time, offset = nil)
    unless offset
      # Try use Rails' app timezone
      if Time.respond_to?(:zone)
        offset = Time.zone.utc_offset
      else
        offset = 0 # rollback to UTC
      end
    end

    time.to_f / XLSX_DATE_DAY + XLSX_DATE_EPOCH_DIFF + offset / XLSX_DATE_DAY
  end

  def self.print_ffi_obj(value)
    puts "#{value.class}"
    value.members.each do |key|
      field_val = if value[key].is_a?(FFI::Pointer) && value[key].null? || value[key].nil?
        "nil"
      elsif value[key].is_a?(FFI::StructLayout::CharArray)
        value[key].to_str.inspect
      elsif value[key].is_a?(String)
        value[key].inspect
      elsif value[key].is_a?(Symbol)
        value[key].inspect
      else
        value[key]
      end
      puts "* #{key}: #{field_val}"
    end
    nil
  end

  module AttributeHelper
    def set(values)
      values.each do |key, value|
        if respond_to?("#{key}=")
          send("#{key}=", value)
        else
          self[key] = value
        end
      end
    end

    def fields_hash
      res = {}
      members.each do |key|
        #p [key, self[key]]
        res[key] = respond_to?(key) ? send(key) : self[key]
      end
      res
    end

    def pretty_print(pp)
      pp fields_hash
    end
  end

  module WorkbookExt
    include AttributeHelper
    attr_accessor :tmp_file, :is_open, :filename

    def initialize(struct)
      @is_open = true
      super(struct)
    end

    def bold_cell_format
      bold = add_format
      bold.set_bold
      bold
    end

    # "#,##0.00"
    # "[$-409]m/d/yy h:mm AM/PM;@"
    def number_format(pattern)
      format = add_format
      format.set_num_format(pattern)
      format
    end

    def add_worksheet(sheetname = nil)
      super
    end

    def close
      @is_open = false
      super
    end

    def read_string
      close if @is_open
      File.open(filename, 'rb', &:read)
    ensure
      remove_tmp_file
    end

    def remove_tmp_file
      File.delete(filename) if tmp_file
    end
  end

  module WorksheetExt
    include AttributeHelper

    def write_row(row_number, values, formats = nil)
      values.each_with_index do |value, index|
        format = if formats
          formats.is_a?(Array) ? formats[index] : formats
        end

        if value.is_a?(Integer) || value.is_a?(Numeric) || value.is_a?(Float)
          write_number(row_number, index, value, format)
        elsif defined?(BigDecimal) && value.is_a?(BigDecimal)
          write_number(row_number, index, value.to_f, format)
        elsif defined?(DateTime) && value.is_a?(DateTime)
          write_datetime(row_number, index, FastExcel.lxw_datetime(value), format)
        elsif value.is_a?(Time)
          write_datetime(row_number, index, FastExcel.lxw_time(value), format)
        elsif value.is_a?(Formula)
          write_formula(row_number, index, value.fml, format)
        else
          write_string(row_number, index, value.to_s, format)
        end
      end
    end

    def set_column(start_col, end_col, width, format = nil)
      super(start_col, end_col, width, format)
    end

    def set_column_width(col, width)
      set_column(col, col, width, nil)
    end

    def set_columns_width(start_col, end_col, width)
      set_column(start_col, end_col, width, nil)
    end

  end

  module FormatExt
    include AttributeHelper

    [:font_size, :underline, :font_script, :rotation, :indent, :pattern, :border].each do |prop|
      define_method(prop) do
        self[prop]
      end
      define_method("#{prop}=") do |value|
        send("set_#{prop}", value)
      end
    end

    [:bold, :italic, :font_outline, :font_shadow, :hidden, :text_wrap, :font_strikeout, :shrink, :text_justlast].each do |prop|
      define_method(prop) do
        self[prop]
      end
      define_method("#{prop}=") do |value|
        value ? send("set_#{prop}") : self[prop] = false
      end
    end

    [:num_format, :font_name].each do |prop|
      define_method(prop) do
        self[prop].to_ptr.read_string
      end

      define_method("#{prop}=") do |value|
        send("set_#{prop}", value)
      end
    end

    ALIGN_ENUM = Libxlsxwriter.enum_type(:format_alignments)

    # Can be called as:
    #
    #  format.align = :align_center
    #  format.align = "align_center"
    #  format.align = :center
    #  format.align = :align_center
    #  format.align = {v: "center", h: "center"}
    #
    # Possible values:
    #
    #   :align_none, :align_left, :align_center, :align_right, :align_fill, :align_justify,
    #   :align_center_across, :align_distributed, :align_vertical_top, :align_vertical_bottom,
    #   :align_vertical_center, :align_vertical_justify, :align_vertical_distributed
    #
    def align=(value)
      value = value.to_sym if value.is_a?(String)

      if value.is_a?(Symbol)
        if ALIGN_ENUM.find(value)
          set_align(value)
        elsif ALIGN_ENUM.find(prefixed = "align_#{value}".to_sym)
          set_align(prefixed)
        else
          raise ArgumentError, "Can not set align = #{value.inspect}, possible values are: #{ALIGN_ENUM.symbols}"
        end
      elsif value.is_a?(Hash)
        if value[:horizontal]
          self.align = "align_#{value[:horizontal]}".to_sym
        end
        if value[:h]
          self.align = "align_#{value[:h]}".to_sym
        end
        if value[:vertical]
          self.align = "align_vertical_#{value[:vertical]}".to_sym
        end
        if value[:v]
          self.align = "align_vertical_#{value[:v]}".to_sym
        end
        possible = [:horizontal, :h, :vertical, :v]
        extras = value.keys - possible
        if extras.size > 0
          raise ArgumentError, "Not allowed keys for align: #{extras.inspect}, possible keys: #{possible.inspect}"
        end
      else
        raise ArgumentError, "value must be a symbol or a hash"
      end
    end

    def align
      {
        horizontal: ALIGN_ENUM.find(self[:text_h_align]),
        vertical:   ALIGN_ENUM.find(self[:text_v_align])
      }
    end

    def set_font_size(value)
      if value < 0
        raise ArgumentError, "font size should be >= 0 (use 0 for user default font size)"
      end
      super(value)
    end

    def font_family
      font_name
    end

    def font_family=(value)
      self.font_name = value
    end
  end
end

Libxlsxwriter::Workbook.instance_eval do
  include FastExcel::WorkbookExt
end

Libxlsxwriter::Format.instance_eval do
  include FastExcel::FormatExt
end

Libxlsxwriter::Worksheet.instance_eval do
  include FastExcel::WorksheetExt
end
