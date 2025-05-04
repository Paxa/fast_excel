require_relative 'test_helper'

describe "FastExcel.date_num" do

  it "should correct save a Date" do
    workbook = FastExcel.open("test.xlsx", constant_memory: true)
    worksheet = workbook.add_worksheet("Payments Report")

    date_format = workbook.number_format("[$-409]m/d/yy h:mm AM/PM;@")
    worksheet.set_column(0, 0, 20, date_format)

    value = DateTime.parse('2017-03-01 15:15:15 +0000').to_time

    worksheet.write_number(0, 0, FastExcel.date_num(value), nil)
    workbook.close

    data = parse_xlsx_as_matrix("test.xlsx")

    assert_equal(value, data[0][0].to_time)
  end

end

describe "FastExcel.write_value" do
  # Write a value to XLSX in a specific format, then parse it and return it.
  def convert_via_xlsx(value, number_format)
    tmp_filename = 'test.xlsx'
    workbook = FastExcel.open(tmp_filename, constant_memory: true)
    worksheet = workbook.add_worksheet("Conversion test")

    format = workbook.number_format(number_format)
    worksheet.write_value(0, 0, value, format)
    workbook.close

    data = parse_xlsx_as_matrix(tmp_filename)

    return data[0][0]
  end

  it "should correctly save a DateTime without zone offset" do
    value = DateTime.parse('2017-03-01 15:15:15 +0000')
    xlsx_value = convert_via_xlsx(value, "yyyy-mm-dd hh:mm:ss")
    assert_equal(value, xlsx_value)
  end

  it "should correctly save and convert a DateTime with offset to +0000" do
    value = DateTime.parse('2017-01-01 15:11:22 +0100')
    utc_value = DateTime.parse('2017-01-01 14:11:22 +0000')
    xlsx_value = convert_via_xlsx(value, "yyyy-mm-dd hh:mm:ss")
    assert_equal(utc_value, xlsx_value)
  end

  it "should correctly save and convert a DateTime with timezone to +0000" do
    value = DateTime.parse('2017-01-01 15:11:22 CET')
    utc_value = DateTime.parse('2017-01-01 14:11:22 +0000')
    xlsx_value = convert_via_xlsx(value, "yyyy-mm-dd hh:mm:ss")
    assert_equal(utc_value, xlsx_value)
  end

  it "should correctly save and convert a DateTime with DST timezone to +0000" do
    value = DateTime.parse('2017-07-01 15:11:22 CEST')
    utc_value = DateTime.parse('2017-07-01 13:11:22 +0000')
    xlsx_value = convert_via_xlsx(value, "yyyy-mm-dd hh:mm:ss")
    assert_equal(utc_value, xlsx_value)
  end

  it "should correctly save a Time without zone offset" do
    value = Time.new(2022, 1, 20, 14, 43, 10, '+00:00')
    xlsx_value = convert_via_xlsx(value, "yyyy-mm-dd hh:mm:ss")
    assert_equal(value.to_datetime, xlsx_value)
  end

  it "should correctly save a Time with zone offset" do
    value = Time.new(2022, 1, 20, 14, 43, 10, '+01:00')
    xlsx_value = convert_via_xlsx(value, "yyyy-mm-dd hh:mm:ss")
    assert_equal(value.to_datetime, xlsx_value)
  end

  it "should correctly save a Date" do
    value = Date.parse('2017-03-01')
    xlsx_value = convert_via_xlsx(value, "yyyy-mm-dd")
    assert_equal(value.to_datetime, xlsx_value)
  end
end
