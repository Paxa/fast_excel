require_relative 'init'

HEADERS = ["id", "name", "age", "date", "random"]

DATA = []
20_000.times do |n|
  DATA << [n, "String string #{n}" * 5, (n * rand * 10).round, Time.at(n * 1000 + 1492922688), n * 100]
end

Benchmark.ips do |x|
  x.config(time: 10, warmup: 2)

  x.report("FastExcel") do
    write_fast_excel_20k
  end

  x.report("Axlsx") do
    write_axlsx_20k
  end

  x.report("write_xlsx") do
    write_xlsx_20k
  end

  x.report("xlsxtream") do
    write_xlsxtream_20k
  end

  x.compare!
end
