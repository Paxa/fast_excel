require_relative '../lib/fast_excel'

workbook = FastExcel.open("example_formula.xlsx", constant_memory: false)

worksheet = workbook.add_worksheet

worksheet.write_row(0, ["Item", "Weight"])
worksheet.write_row(1, ["Laptop", 1.37])
worksheet.write_row(2, ["Phone", 0.138])
worksheet.write_row(3, ["Mouse", 0.099])
worksheet.write_row(4, ["Speaker", 2.5])
worksheet.write_row(5, ["Camera", 0.383])
worksheet.write_row(6, ["Total", FastExcel::Formula.new("SUM(B2:B6)")], workbook.bold_format)

workbook.close
puts "Saved to file example_formula.xlsx"
