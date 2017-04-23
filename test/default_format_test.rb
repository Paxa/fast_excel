require_relative 'test_helper'

describe "FastExcel default_format" do

  it "should set default format values on init" do
    workbook = FastExcel.open(default_format: {
      font_size: 17,
      font_family: "ArialFoo",
      bold: true
    })

    #FastExcel.print_ffi_obj(workbook.default_format)

    assert_equal("ArialFoo", workbook.default_format.font_family)
    assert_equal(17, workbook.default_format.font_size)
    assert_equal(1, workbook.default_format.bold)
  end

end
