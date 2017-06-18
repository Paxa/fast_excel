require_relative '../lib/fast_excel'
require 'pp'

workbook = FastExcel.open("example.xlsx", constant_memory: true)

workbook.default_format.set(
  font_size: 0, # user's default
  #font_family: "Arial"
)

# pp workbook.default_format

worksheet = workbook.add_worksheet("Payments Report")

bold = workbook.bold_cell_format
worksheet.set_column(0, 0, FastExcel::DEF_COL_WIDTH, bold)

price = workbook.number_format("#,##0.00")
worksheet.set_column(1, 1, 20, price)

date_format = workbook.number_format("[$-409]m/d/yy h:mm AM/PM;@")
worksheet.set_column(2, 2, 20, date_format)

worksheet.write_row(0, ["message", "price", "date"], bold)

for i in 1..1000
  worksheet.write_row(i, ["Hello", (rand * 10_000_000).round(2), Time.now])

  # Or manually
  # worksheet.write_string(i, 0, "Hello", nil)
  # worksheet.write_number(i, 1, (rand * 10_000_000).round(2), nil)
  # date = Libxlsxwriter::Datetime.new
  # date[:year] = 2017
  # date[:month] = 2
  # date[:day] = 24
  # date[:hour] = i % 24
  # date[:min] = i % 60
  # date[:sec] = i % 60
  # worksheet.write_datetime(i, 2, date, nil)
end

workbook.close
puts "Saved to file example.xlsx"