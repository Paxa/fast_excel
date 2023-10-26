require_relative 'test_helper'

describe "FastExcel text_width" do

  it "should calculate text width" do
    workbook = FastExcel.open(constant_memory: false)
    sheet = workbook.add_worksheet
    sheet.auto_width = true

    sheet.append_row([
      "tini",
      "Longer",
      "Some longer text!",
      "This gem is FFI binding for libxlsxwriter C library"
    ])

    assert_equal(sheet.calculated_column_widths, {0 => 3.52, 1 => 5.28, 2 => 14.96, 3 => 44.88})
  end

  it "should set the default column width for an empty column on close" do
    workbook = FastExcel.open(constant_memory: false)
    sheet = workbook.add_worksheet
    sheet.auto_width = true

    sheet.append_row([
      nil,
      "tini",
      "Longer",
      "Some longer text!",
      "This gem is FFI binding for libxlsxwriter C library"
    ])

    assert_equal(sheet.calculated_column_widths, {0 => nil, 1 => 3.52, 2 => 5.28, 3 => 14.96, 4 => 44.88})

    workbook.close

    assert_equal(sheet.calculated_column_widths, {0 => FastExcel::DEF_COL_WIDTH, 1 => 3.52, 2 => 5.28, 3 => 14.96, 4 => 44.88})
  end
end
