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
    refute(File.exist?(File.dirname(workbook.filename)))
    refute(workbook.is_open)
  end

  it "should delete tmp file after 'remove_tmp_file' method is called" do
      workbook = FastExcel.open

      assert(File.exist?(workbook.filename))
      workbook.remove_tmp_file
      refute(File.exist?(workbook.filename))
  end
end
