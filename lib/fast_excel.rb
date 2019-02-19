require_relative './fast_excel/binding'
require 'set'

# not used for now
#require_relative '../ext/fast_excel/text_width_ext'

module FastExcel

  class Formula
    attr_accessor :fml
    def initialize(fml)
      @fml = fml
    end
  end

  class URL
    attr_accessor :url
    def initialize(url)
      @url = url
    end
  end

  DEF_COL_WIDTH = 8.43

  def self.open(filename = nil, constant_memory: false, default_format: nil)
    tmp_file = false
    if filename
      if File.exist?(filename)
        raise ArgumentError, "File '#{filename}' already exists. FastExcel can not open existing files, only create new files"
      end
    else
      require 'tmpdir'
      filename = "#{Dir.mktmpdir}/fast_excel.xlsx"
      tmp_file = true
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


  COLOR_ENUM = Libxlsxwriter.enum_type(:defined_colors)
  EXTRA_COLORS = {
    alice_blue: 0xF0F8FF,
    antique_white: 0xFAEBD7,
    aqua: 0x00FFFF,
    aquamarine: 0x7FFFD4,
    azure: 0xF0FFFF,
    beige: 0xF5F5DC,
    bisque: 0xFFE4C4,
    black: 0x000000,
    blanched_almond: 0xFFEBCD,
    blue: 0x0000FF,
    blue_violet: 0x8A2BE2,
    brown: 0xA52A2A,
    burly_wood: 0xDEB887,
    cadet_blue: 0x5F9EA0,
    chartreuse: 0x7FFF00,
    chocolate: 0xD2691E,
    coral: 0xFF7F50,
    cornflower_blue: 0x6495ED,
    cornsilk: 0xFFF8DC,
    crimson: 0xDC143C,
    cyan: 0x00FFFF,
    dark_blue: 0x00008B,
    dark_cyan: 0x008B8B,
    dark_golden_rod: 0xB8860B,
    dark_gray: 0xA9A9A9,
    dark_grey: 0xA9A9A9,
    dark_green: 0x006400,
    dark_khaki: 0xBDB76B,
    dark_magenta: 0x8B008B,
    dark_olive_green: 0x556B2F,
    dark_orange: 0xFF8C00,
    dark_orchid: 0x9932CC,
    dark_red: 0x8B0000,
    dark_salmon: 0xE9967A,
    dark_sea_green: 0x8FBC8F,
    dark_slate_blue: 0x483D8B,
    dark_slate_gray: 0x2F4F4F,
    dark_slate_grey: 0x2F4F4F,
    dark_turquoise: 0x00CED1,
    dark_violet: 0x9400D3,
    deep_pink: 0xFF1493,
    deep_sky_blue: 0x00BFFF,
    dim_gray: 0x696969,
    dim_grey: 0x696969,
    dodger_blue: 0x1E90FF,
    fire_brick: 0xB22222,
    floral_white: 0xFFFAF0,
    forest_green: 0x228B22,
    fuchsia: 0xFF00FF,
    gainsboro: 0xDCDCDC,
    ghost_white: 0xF8F8FF,
    gold: 0xFFD700,
    golden_rod: 0xDAA520,
    gray: 0x808080,
    grey: 0x808080,
    green: 0x008000,
    green_yellow: 0xADFF2F,
    honey_dew: 0xF0FFF0,
    hot_pink: 0xFF69B4,
    indian_red: 0xCD5C5C,
    indigo: 0x4B0082,
    ivory: 0xFFFFF0,
    khaki: 0xF0E68C,
    lavender: 0xE6E6FA,
    lavender_blush: 0xFFF0F5,
    lawn_green: 0x7CFC00,
    lemon_chiffon: 0xFFFACD,
    light_blue: 0xADD8E6,
    light_coral: 0xF08080,
    light_cyan: 0xE0FFFF,
    light_golden_rod_yellow: 0xFAFAD2,
    light_gray: 0xD3D3D3,
    light_grey: 0xD3D3D3,
    light_green: 0x90EE90,
    light_pink: 0xFFB6C1,
    light_salmon: 0xFFA07A,
    light_sea_green: 0x20B2AA,
    light_sky_blue: 0x87CEFA,
    light_slate_gray: 0x778899,
    light_slate_grey: 0x778899,
    light_steel_blue: 0xB0C4DE,
    light_yellow: 0xFFFFE0,
    lime: 0x00FF00,
    lime_green: 0x32CD32,
    linen: 0xFAF0E6,
    magenta: 0xFF00FF,
    maroon: 0x800000,
    medium_aqua_marine: 0x66CDAA,
    medium_blue: 0x0000CD,
    medium_orchid: 0xBA55D3,
    medium_purple: 0x9370DB,
    medium_sea_green: 0x3CB371,
    medium_slate_blue: 0x7B68EE,
    medium_spring_green: 0x00FA9A,
    medium_turquoise: 0x48D1CC,
    medium_violet_red: 0xC71585,
    midnight_blue: 0x191970,
    mint_cream: 0xF5FFFA,
    misty_rose: 0xFFE4E1,
    moccasin: 0xFFE4B5,
    navajo_white: 0xFFDEAD,
    navy: 0x000080,
    old_lace: 0xFDF5E6,
    olive: 0x808000,
    olive_drab: 0x6B8E23,
    orange: 0xFFA500,
    orange_red: 0xFF4500,
    orchid: 0xDA70D6,
    pale_golden_rod: 0xEEE8AA,
    pale_green: 0x98FB98,
    pale_turquoise: 0xAFEEEE,
    pale_violet_red: 0xDB7093,
    papaya_whip: 0xFFEFD5,
    peach_puff: 0xFFDAB9,
    peru: 0xCD853F,
    pink: 0xFFC0CB,
    plum: 0xDDA0DD,
    powder_blue: 0xB0E0E6,
    purple: 0x800080,
    rebecca_purple: 0x663399,
    red: 0xFF0000,
    rosy_brown: 0xBC8F8F,
    royal_blue: 0x4169E1,
    saddle_brown: 0x8B4513,
    salmon: 0xFA8072,
    sandy_brown: 0xF4A460,
    sea_green: 0x2E8B57,
    sea_shell: 0xFFF5EE,
    sienna: 0xA0522D,
    silver: 0xC0C0C0,
    sky_blue: 0x87CEEB,
    slate_blue: 0x6A5ACD,
    slate_gray: 0x708090,
    slate_grey: 0x708090,
    snow: 0xFFFAFA,
    spring_green: 0x00FF7F,
    steel_blue: 0x4682B4,
    tan: 0xD2B48C,
    teal: 0x008080,
    thistle: 0xD8BFD8,
    tomato: 0xFF6347,
    turquoise: 0x40E0D0,
    violet: 0xEE82EE,
    wheat: 0xF5DEB3,
    white: 0xFFFFFF,
    white_smoke: 0xF5F5F5,
    yellow: 0xFFFF00,
    yellow_green: 0x9ACD32
  }.freeze

  # Convert hex string, color name or hex number to color hex number
  def self.color_to_hex(value)
    orig_value = value
    value = value.to_s if value.is_a?(Symbol)

    if value.is_a?(String)
      if EXTRA_COLORS[value.to_sym]
        return EXTRA_COLORS[value.to_sym]
      elsif COLOR_ENUM.find(value.to_sym)
        return COLOR_ENUM.find(value.to_sym)
      elsif COLOR_ENUM.find("color_#{value.to_sym}")
        return COLOR_ENUM.find("color_#{value.to_sym}")
      elsif value =~ /^#?(0x)?([\da-f]){6}$/i
        value = value.sub('#', '') if value.start_with?('#')
        return value.start_with?('0x') ? value.to_i(16) : "0x#{value}".to_i(16)
      else
        raise ArgumentError, "Unknown color value #{orig_value.inspect}, expected hex string or color name"
      end
    end

    return value if value.is_a?(Numeric)

    raise ArgumentError, "Can not use #{value.class} (#{value.inspect}) for color value, expected String or Hex Number"
  end

  module AttributeHelper
    def set(values)
      values.each do |key, value|
        if respond_to?("#{key}=")
          send("#{key}=", value)
        elsif respond_to?("set_#{key}=")
          send("set_#{key}=", value)
        else
          self[key] = value
        end
      end

      self
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
      @sheet_names = Set.new
      @sheets = []
      super(struct)
    end

    def add_format(options = nil)
      new_format = super()
      new_format.set(options) if options
      new_format
    end

    def bold_cell_format
      bold = add_format
      bold.set_bold
      bold
    end

    alias_method :bold_format, :bold_cell_format

    # "#,##0.00"
    # "[$-409]m/d/yy h:mm AM/PM;@"
    def number_format(pattern)
      format = add_format
      format.set_num_format(pattern)
      format
    end

    def add_worksheet(sheetname = nil)
      sheetname = nil if sheetname == ""

      if !sheetname.nil? && @sheet_names.include?(sheetname)
        raise ArgumentError, "Worksheet name '#{sheetname}' is already in use"
      end
      @sheet_names << sheetname

      sheet = super
      sheet.workbook = self
      @sheets << sheet
      sheet
    end

    def get_worksheet_by_name(name)
      sheet = super(name)
      sheet.workbook = self

      sheet
    end

    def close
      @is_open = false
      @sheets.each(&:close)
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

    def constant_memory?
      #FastExcel.print_ffi_obj(self[:options])
      @constant_memory ||= self[:options][:constant_memory] != 0
    end
  end

  module WorksheetExt
    attr_accessor :workbook

    include AttributeHelper

    def initialize(struct)
      @is_open = true
      @col_formats = {}
      @last_row_number = -1
      super(struct)
    end

    def write_row(row_number, values, formats = nil)
      values.each_with_index do |value, index|
        format = if formats
          formats.is_a?(Array) ? formats[index] : formats
        end

        write_value(row_number, index, value, format)
      end
    end

    def auto_width?
      defined?(@auto_width) && @auto_width
    end

    def auto_width=(v)
      @auto_width = v
      @column_widths = {}
    end

    def calculated_column_widths
      @column_widths || {}
    end

    def write_value(row_number, cell_number, value, format = nil)

      if workbook.constant_memory? && row_number < @last_row_number
        raise ArgumentError, "Can not write to saved row in constant_memory mode (attempted row: #{row_number}, last saved row: #{last_row_number})"
      end

      if value.is_a?(Numeric)
        write_number(row_number, cell_number, value, format)
      elsif defined?(Date) && value.is_a?(Date)
        write_datetime(row_number, cell_number, FastExcel.lxw_datetime(value.to_datetime), format)
      elsif value.is_a?(Time)
        write_number(row_number, cell_number, FastExcel.date_num(value), format)
      elsif defined?(DateTime) && value.is_a?(DateTime)
        write_number(row_number, cell_number, FastExcel.date_num(value), format)
      elsif value.is_a?(Formula)
        write_formula(row_number, cell_number, value.fml, format)
      elsif value.is_a?(FastExcel::URL)
        write_url(row_number, cell_number, value.url, format)
        add_text_width(value.url, format, cell_number) if auto_width?
      else
        write_string(row_number, cell_number, value.to_s, format)
        add_text_width(value, format, cell_number) if auto_width?
      end

      @last_row_number = row_number > @last_row_number ? row_number : @last_row_number
    end

    def add_text_width(value, format, cell_number)
      font_size = 0
      if format
        font_size = format.font_size
      end

      if font_size == 0
        if @col_formats[cell_number] && @col_formats[cell_number].font_size
          font_size = @col_formats[cell_number].font_size
        end
      end

      if font_size == 0
        font_size = workbook.default_format.font_size
      end

      font_size = 13 if font_size == nil || font_size == 0

      scale = 0.08
      new_width = (scale * font_size * value.to_s.length )
      @column_widths[cell_number] = if new_width > (@column_widths[cell_number] || 0)
        new_width
      else
        @column_widths[cell_number]
      end
    end

    def append_row(values, formats = nil)
      @last_row_number += 1
      write_row(last_row_number, values, formats)
    end

    def <<(values)
      append_row(values)
    end

    def last_row_number
      @last_row_number
    end

    def set_column(start_col, end_col, width = nil, format = nil)
      super(start_col, end_col, width || DEF_COL_WIDTH, format)

      return unless format
      start_col.upto(end_col) do |i|
        @col_formats[i] = format
      end
    end

    def set_column_width(col, width)
      set_column(col, col, width, @col_formats[col])
    end

    def set_columns_width(start_col, end_col, width)
      start_col.upto(end_col) do |i|
        set_column_width(i, width)
      end
    end

    def close
      if auto_width?
        @column_widths.each do |num, width|
          set_column_width(num, width + 0.2)
        end
      end
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
          self.align = "align_#{value[:horizontal].to_s.sub(/^align_/, '')}".to_sym
        end
        if value[:h]
          self.align = "align_#{value[:h].to_s.sub(/^align_/, '')}".to_sym
        end
        if value[:vertical]
          self.align = "align_vertical_#{value[:vertical].to_s.sub(/^align_vertical_/, '')}".to_sym
        end
        if value[:v]
          self.align = "align_vertical_#{value[:v].to_s.sub(/^align_vertical_/, '')}".to_sym
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

    [:font_color, :bg_color, :fg_color, :bottom_color, :diag_color, :left_color, :right_color, :top_color].each do |prop|
      define_method("#{prop}=") do |value|
        send("set_#{prop}", FastExcel.color_to_hex(value))
      end
      define_method(prop) do
        self[prop]
      end
    end

    [:bottom_color, :left_color, :right_color, :top_color].each do |prop|
      alias_method :"border_#{prop}=", :"#{prop}="
      alias_method :"border_#{prop}", :"#{prop}"
    end

    BORDER_ENUM = Libxlsxwriter.enum_type(:format_borders)

    [:bottom, :diag_border, :left, :right, :top].each do |prop|
      define_method("#{prop}=") do |value|

        send("set_#{prop}", border_value(value))
      end
      define_method(prop) do
        BORDER_ENUM.find(self[prop])
      end

      unless prop == :diag_border
        alias_method :"border_#{prop}=", :"#{prop}="
        alias_method :"border_#{prop}", :"#{prop}"
      end
    end

    def border_value(value)
      # if a number
      return value if value.is_a?(Numeric) && BORDER_ENUM.find(value)

      orig_value = value
      value = value.to_sym if value.is_a?(String)

      return BORDER_ENUM.find(value) if BORDER_ENUM.find(value)
      return BORDER_ENUM.find(:"border_#{value}") if BORDER_ENUM.find(:"border_#{value}")

      short_symbols = BORDER_ENUM.symbols.map {|s| s.to_s.sub(/^border_/, '').to_sym }
      raise ArgumentError, "Unknown value #{orig_value.inspect} for border. Possible values: #{short_symbols}"
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
