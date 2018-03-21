require_relative 'test_helper'

describe "FastExcel::Worksheet" do

  it "should get_worksheet_by_name" do
    workbook = FastExcel.open(constant_memory: false)
    workbook.add_worksheet("Page1")

    ws = workbook.get_worksheet_by_name("Page1")
    ws.write_row(0, ['1'])

    workbook.close

    error = assert_raises do
      FastExcel.open(workbook.filename, constant_memory: false)
    end

    assert_equal(error.class, ArgumentError)
    assert_equal(error.message, "File '#{workbook.filename}' already exists. FastExcel can not open existing files, only create new files")
  end

end