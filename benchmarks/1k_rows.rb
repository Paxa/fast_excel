require_relative 'init'

HEADERS = ["id", "name", "age", "date"].freeze

DATA = []
1000.times do |n|
  DATA << [n, "String string #{n}", (n * rand * 10).round, Time.at(n * 1000 + 1492922688)]
end

Benchmark.ips do |x|
  x.config(time: 10, warmup: 40)

  x.report("FastExcel") do
    workbook = FastExcel.open(constant_memory: true)
    worksheet = workbook.add_worksheet("benchmark")

    worksheet.write_row(0, HEADERS)
    DATA.each do |row|
      worksheet.append_row(row)
    end
    workbook.read_string
  end

  x.report("Axlsx") do
    filename = "#{Dir.mktmpdir}/axlsx.xlsx"
    Axlsx::Package.new do |package|
      package.use_autowidth = false
      package.workbook.add_worksheet do |sheet|
        sheet.add_row(HEADERS)
        DATA.each do |row|
          sheet.add_row(row)
        end
      end
      package.serialize(filename)
      File.open(filename, 'rb', &:read)
      File.delete(filename)
    end
  end

  x.report("write_xlsx") do
    filename = "#{Dir.mktmpdir}/write_xlsx.xlsx"
    workbook = WriteXLSX.new(filename)
    worksheet = workbook.add_worksheet
    HEADERS.each_with_index do |value, i|
      worksheet.write(0, i, value)
    end
    DATA.each_with_index do |row, row_num|
      worksheet.write_number(row_num + 1, 0, row[0])
      worksheet.write_string(row_num + 1, 1, row[1])
      worksheet.write_number(row_num + 1, 2, row[2])
      worksheet.write_number(row_num + 1, 3, row[3])
    end
    workbook.close
    File.open(filename, 'rb', &:read)
    File.delete(filename)
  end

  x.report("xlsxtream") do
    filename = "#{Dir.mktmpdir}/xlsxtream.xlsx"

    Xlsxtream::Workbook.open(filename) do |xlsx|
      xlsx.write_worksheet do |sheet|
        sheet << HEADERS
        DATA.each do |row|
          sheet << row
        end
      end
    end
  end

  x.compare!
end
