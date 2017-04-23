require_relative './lib/fast_excel'

workbook = FastExcel.open("chart_ffi.xlsx", constant_memory: true)
worksheet = workbook.add_worksheet

for i in 0..5
  for n in 0..3
    worksheet.write_number(i, n, (i + 1) * (n + 1), nil)
  end
end

chart = workbook.add_chart(Libxlsxwriter::enum_type(:chart_type)[:column])

chart.add_series("Bob", "Sheet1!$A$1:$A$5")
chart.add_series("Alice", "Sheet1!$B$1:$B$5")
chart.add_series("Montgomery", "Sheet1!$C$1:$C$5")

worksheet.insert_chart(1, 7, chart)

workbook.close
