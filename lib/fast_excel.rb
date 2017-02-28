require_relative './fast_excel/binding'

module FastExcel
  #include Libxlsxwriter

  DEF_COL_WIDTH = 8.43

  def self.open(filename, constant_memory: false)
    filename = filename.to_s if defined?(Pathname) && filename.is_a?(Pathname)

    workbook = if constant_memory
      opt = Libxlsxwriter::WorkbookOptions.new
      opt[:constant_memory] = 1
      Libxlsxwriter.workbook_new_opt(filename, opt)
    else
      Libxlsxwriter.workbook_new(filename)
    end
    Libxlsxwriter::Workbook.new(workbook)
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
  XLSX_DATE_EPOCH_DIFF = 25567

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

  module AttributeHelper
    def set(value)
      value.each do |key, value|
        if respond_to?("#{key}=")
          send("#{key}=", value)
        else
          self[key] = value
        end
      end
    end

    def pretty_print(pp)
      res = {}
      members.each do |key|
        res[key] = respond_to?(key) ? send(key) : self[key]
      end
      pp res
    end
  end

  module WorkbookExt
    include AttributeHelper

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
        else
          write_string(row_number, index, value.to_s, format)
        end
      end
    end

  end

  module FormatExt
    include AttributeHelper

    [:font_size, :font_name, :underline, :font_script, :num_format, :align, :rotation, :indent, :pattern, :border].each do |prop|
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