require_relative 'init'

HEADERS = ["id", "name", "age", "date", "random"]

DATA = []
10_000.times do |n|
  DATA << [n, "String string #{n}" * 5, (n * rand * 10).round, Time.at(n * 1000 + 1492922688), n * 100]
end

puts "warm up..."
write_fast_excel_20k
write_axlsx_20k
write_xlsx_20k

DATA.clear
50_000.times do |n|
  DATA << [n, "String string #{n}" * 5, (n * rand * 10).round, Time.at(n * 1000 + 1492922688), n * 100]
end

GC.start
sleep 5

def measure_memory(title)
  puts "Running test: #{title}"
  recorder = ProcessMemory.start_recording
  yield
  puts recorder.print("Done!")
  recorder.stop
  puts recorder.report_per_second_pretty
  puts
end

measure_memory("FastExcel") do
  write_fast_excel_20k
end

GC.start
sleep 5

measure_memory("Axlsx") do
  write_axlsx_20k
end

GC.start
sleep 5

measure_memory("write_xlsx") do
  write_xlsx_20k
end
