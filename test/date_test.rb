require_relative 'test_helper'

describe "FastExcel.date_num" do

  it "should save correct date" do
    workbook = FastExcel.open("test.xlsx", constant_memory: true)
    worksheet = workbook.add_worksheet("Payments Report")

    date_format = workbook.number_format("[$-409]m/d/yy h:mm AM/PM;@")
    worksheet.set_column(0, 0, 20, date_format)

    date = DateTime.parse('2017-03-01 15:15:15 +0000').to_time

    worksheet.write_number(0, 0, FastExcel.date_num(date), nil)
    workbook.close

    data = parse_xlsx_as_matrix("test.xlsx")

    assert_equal(data[0][0].to_time, date)
  end

end

describe "FastExcel.write_value" do

  it "should save correct datetime" do
    workbook = FastExcel.open(constant_memory: true)
    worksheet = workbook.add_worksheet

    format = workbook.number_format("yyyy-mm-dd hh:mm:ss")
    value = DateTime.parse('2017-03-01 15:15:15 +0000')

    worksheet.write_value(0, 0, value, format)
    workbook.close

    data = parse_xlsx_as_matrix(workbook.filename)

    assert_equal(data[0][0], value)
  end

  it "should save correct date" do
    workbook = FastExcel.open(constant_memory: true)
    worksheet = workbook.add_worksheet

    format = workbook.number_format("yyyy-mm-dd")
    value = Date.parse('2017-03-01')

    worksheet.write_value(0, 0, value, format)
    workbook.close

    data = parse_xlsx_as_matrix(workbook.filename)

    assert_equal(data[0][0], value)
  end

end

describe "FastExcel.lxw_time" do
  it "should make Libxlsxwriter::Datetime" do
    time = Time.at(610421163).utc
    lxw_time = FastExcel.lxw_time(time)

    assert_equal(lxw_time[:year], 1989)
    assert_equal(lxw_time[:month], 5)
    assert_equal(lxw_time[:day], 6)
    assert_equal(lxw_time[:hour], 1)
    assert_equal(lxw_time[:min], 26)
    assert_equal(lxw_time[:sec], 3.0)
  end
end
