require_relative '../lib/fast_excel'

`rm example_filters.xlsx` if File.exist?('example_filters.xlsx')
workbook = FastExcel.open("example_filters.xlsx", constant_memory: false)

workbook.default_format.set(
  font_size: 0, # user's default
  #font_family: "Arial"
)

# pp workbook.default_format

worksheet = workbook.add_worksheet("Payments Report")

p worksheet[:filter_on]
FastExcel.print_ffi_obj(worksheet)

bold = workbook.bold_format
worksheet.set_column(0, 0, FastExcel::DEF_COL_WIDTH, bold)

price = workbook.number_format("#,##0.00")
worksheet.set_column(1, 1, 20, price)

date_format = workbook.number_format("[$-409]m/d/yy h:mm AM/PM;@")
worksheet.set_column(2, 2, 20, date_format)

worksheet.write_row(0, ["message", "price", "date", "complete"], bold)

for i in 1..1000
  worksheet.write_row(i, ["Hello", (rand * 10_000_000).round(2), Time.now, i % 2 == 0])
end

worksheet.enable_filters!(end_col: 3)

workbook.close
puts "Saved to file example_filters.xlsx"