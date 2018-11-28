require 'bundler/setup'
require 'fileutils'
require 'tmpdir'
require_relative '../lib/fast_excel'

# gem install axlsx benchmark-ips write_xlsx

require "benchmark/ips"
require 'axlsx'
require 'write_xlsx'
require 'xlsxtream'
require 'process_memory'

def write_fast_excel_20k
  workbook = FastExcel.open(constant_memory: true)
  worksheet = workbook.add_worksheet("benchmark")

  worksheet.write_row(0, HEADERS)
  DATA.each_with_index do |row, i|
    worksheet.write_row(i + 1, row)
  end
  workbook.read_string
end

def write_xlsx_20k
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
    worksheet.write_number(row_num + 1, 4, row[4])
  end
  workbook.close
  File.open(filename, 'rb', &:read)
  File.delete(filename)
end

def write_axlsx_20k
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

def write_xlsxtream_20k
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