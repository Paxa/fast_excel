require_relative '../lib/fast_excel'

workbook = FastExcel.open("example_align.xlsx", constant_memory: true)

worksheet = workbook.add_worksheet

row_format = workbook.add_format

row_format.align = {h: :center, v: :center}
# Can also be called as:
# row_format.align = :align_center
# row_format.align = :align_vertical_center

print "Align set as: "
p row_format.align # => {horizontal: :align_center, vertical: :align_vertical_center}

worksheet.set_column_width(0, 30)
worksheet.set_row(0, 30, row_format)

worksheet.write_row(0, ["Hello"])

workbook.close
puts "Saved to file example_align.xlsx"
