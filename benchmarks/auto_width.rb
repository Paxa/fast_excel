require_relative 'init'

HEADERS = ["id", "name", "age", "date"]

DATA = []
1000.times do |n|
  DATA << [n, "String string #{n}", (n * rand * 10).round, Time.at(n * 1000 + 1492922688)]
end

Benchmark.ips do |x|
  x.config(time: 10, warmup: 2)

  x.report("Normal") do
    workbook = FastExcel.open(constant_memory: true)
    worksheet = workbook.add_worksheet("benchmark")

    worksheet.write_row(0, HEADERS)
    DATA.each_with_index do |row, i|
      worksheet.write_row(i + 1, row)
    end
    workbook.read_string
  end

  x.report("With auto_width") do
    workbook = FastExcel.open(constant_memory: true)
    worksheet = workbook.add_worksheet("benchmark")
    worksheet.auto_width = true

    worksheet.write_row(0, HEADERS)
    DATA.each_with_index do |row, i|
      worksheet.write_row(i + 1, row)
    end
    workbook.read_string
  end

  x.compare!
end
