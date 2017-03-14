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
