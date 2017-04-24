require_relative 'test_helper'

describe "FastExcel" do

  it "should create temporary file if filename is nil" do
    workbook = FastExcel.open(constant_memory: true)

    assert(workbook.tmp_file)
    assert_match(/fast_excel.xlsx$/, workbook.filename)

    result = workbook.read_string
    assert(result.size > 1000)
  end

  it "should close workbook and delete tmp file when read_string" do
    workbook = FastExcel.open
    workbook.read_string

    refute(File.exist?(workbook.filename))
    refute(workbook.is_open)
  end

end
