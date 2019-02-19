require_relative '../lib/fast_excel'

workbook = FastExcel.open("example_hyperlink.xlsx", constant_memory: false)
worksheet = workbook.add_worksheet
worksheet.auto_width = true

url_format = workbook.add_format(underline: :underline_single, font_color: :blue)

worksheet.append_row([
  "Ultra Fast Excel Writer for Ruby",
  FastExcel::URL.new("https://github.com/Paxa/fast_excel"),
  FastExcel::URL.new("postgres://localhost")
], [nil, url_format])

# Same as:
#   worksheet.write_value(0, 0, "Ultra Fast Excel Writer for Ruby")
#   worksheet.write_url(0, 1, "https://github.com/Paxa/fast_excel", url_format)

workbook.close
puts "Saved to file example_hyperlink.xlsx"
