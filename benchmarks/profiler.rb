require_relative '../lib/fast_excel'
require 'ruby-prof'

DATA = []
1000.times do |n|
  DATA << [n, "String string #{n}", (n * rand * 10).round, Time.at(n * 1000 + 1492922688)]
end

RubyProf.start

100.times do
  workbook = FastExcel.open(constant_memory: true)
  worksheet = workbook.add_worksheet("benchmark")
  worksheet.auto_width = true

  DATA.each_with_index do |row, i|
    worksheet.write_row(i + 1, row)
  end
  workbook.read_string

  print '.'
end
result = RubyProf.stop

# print a flat profile to text
printer = RubyProf::FlatPrinter.new(result)
printer.print(STDOUT)
