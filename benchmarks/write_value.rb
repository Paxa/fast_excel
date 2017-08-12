require_relative '../lib/fast_excel'
require "benchmark/memory"
require "benchmark/ips"

DATA = []
1000.times do |n|
  DATA << [n, "String string #{n}", (n * rand * 10).round, Time.at(n * 1000 + 1492922688)]
end

5.times do
  workbook = FastExcel.open(constant_memory: true)
  worksheet = workbook.add_worksheet("benchmark")

  DATA.each_with_index do |row, row_num|
    row.each_with_index do |val, cell_num|
      worksheet.write_value(row_num + 1, cell_num + 1, val)
    end
  end
  workbook.read_string
end


workbook = FastExcel.open(constant_memory: true)
worksheet = workbook.add_worksheet("benchmark")

DATA.each_with_index do |row, row_num|
  row.each_with_index do |val, cell_num|
    worksheet.write_value(row_num + 1, cell_num + 1, val)
  end
end
workbook.read_string

Benchmark.ips do |x|
  #x.config(time: 10, warmup: 2)

  x.report("Normal") do
    workbook = FastExcel.open(constant_memory: true)
    worksheet = workbook.add_worksheet("benchmark")

    DATA.each_with_index do |row, row_num|
      row.each_with_index do |val, cell_num|
        worksheet.write_value(row_num + 1, cell_num + 1, val)
      end
    end
    workbook.read_string
  end

  x.report("Auto-width") do
    workbook = FastExcel.open(constant_memory: true)
    worksheet = workbook.add_worksheet("benchmark")
    worksheet.auto_width = true

    DATA.each_with_index do |row, row_num|
      row.each_with_index do |val, cell_num|
        worksheet.write_value(row_num + 1, cell_num + 1, val)
      end
    end
    workbook.read_string
  end

  x.compare!
end
