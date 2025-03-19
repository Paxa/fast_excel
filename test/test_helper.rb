require "simplecov"

SimpleCov.start do
  add_filter 'test'
end

require 'bundler/setup'
require 'minitest/autorun'
require "minitest/reporters"
require 'pp'
require 'date'


Minitest::Reporters.use!(
  Minitest::Reporters::DefaultReporter.new(color: true)
)

require_relative '../lib/fast_excel'

def parse_xlsx(file_path)
  require 'roo'
  Roo::Excelx.new(file_path)
ensure
  File.delete(file_path)
end

def get_arrays(workbook)
  workbook.close
  parse_xlsx_as_matrix(workbook.filename)
end

def parse_xlsx_as_array(file_path)
  data = parse_xlsx_as_matrix(file_path)
  headers = data.shift

  data.map do |row|
    Hash[ [headers, row].transpose ]
  end
end

def parse_xlsx_as_matrix(file_path)
  excel = parse_xlsx(file_path)

  sheet = excel.sheet(0)

  rows = []
  if sheet.last_row
    1.upto(sheet.last_row) do |row_number|
      row = 1.upto(sheet.last_column).map do |col|
        sheet.cell(row_number, col)
      end

      rows << row
    end
  end

  return rows
end
