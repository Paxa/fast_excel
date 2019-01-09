require_relative '../lib/fast_excel'

workbook = FastExcel.open("example_auto_width.xlsx", constant_memory: false)

# this is required to make auto-width works correctly
workbook.default_format.set(
  font_size: 13,
  font_family: "Arial"
)

worksheet = workbook.add_worksheet
worksheet.auto_width = true

['Arial', 'Calibri', 'Times New Roman'].each_with_index do |font, index|
  col_format = workbook.add_format(font_family: font, font_size: 17)
  worksheet.set_column(index * 4, index * 4 + 3, 10, col_format)

  worksheet.write_value(0, index * 4 + 2, font)
  worksheet.write_value(1, index * 4, "tini")
  worksheet.write_value(1, index * 4 + 1, "Longer")
  worksheet.write_value(1, index * 4 + 2, "Some longer text!")
  worksheet.write_value(1, index * 4 + 3, "This gem is FFI binding for libxlsxwriter C library")
end

workbook.close
puts "Saved to file example_auto_width.xlsx"
