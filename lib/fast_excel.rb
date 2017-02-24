require_relative './fast_excel/binding'

module FastExcel
  #include Libxlsxwriter

  def self.open(filename)
    filename = filename.to_s if defined?(Pathname) && filename.is_a?(Pathname)
    workbook = Libxlsxwriter.workbook_new(filename)
    Libxlsxwriter::Workbook.new(workbook)
  end

  def self.datetime(time)
    date = Libxlsxwriter::Datetime.new
    date[:year] = time.year
    date[:month] = time.month
    date[:day] = time.day
    date[:hour] = time.hour
    date[:min] = time.minute
    date[:sec] = time.second
    date
  end

  def self.time(time)
    date = Libxlsxwriter::Datetime.new
    date[:year] = time.year
    date[:month] = time.month
    date[:day] = time.day
    date[:hour] = time.hour
    date[:min] = time.min
    date[:sec] = time.sec
    date
  end

  module WorkbookExt

    #def add_worksheet(title = nil)
    #  Libxlsxwriter::Worksheet.new(super(title))
    #end

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
  end

  module WorksheetExt

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
          write_datetime(row_number, index, FastExcel.datetime(value), format)
        elsif value.is_a?(Time)
          write_datetime(row_number, index, FastExcel.time(value), format)
        else
          write_string(row_number, index, value.to_s, format)
        end
      end
    end

  end
end

Libxlsxwriter::Workbook.instance_eval do
  include FastExcel::WorkbookExt
end

Libxlsxwriter::Worksheet.instance_eval do
  include FastExcel::WorksheetExt
end