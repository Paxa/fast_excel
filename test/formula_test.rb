require_relative 'test_helper'

describe "FastExcel::Worksheet write_formula_str" do

  it "should write a formula with a cached string result" do
    workbook = FastExcel.open(constant_memory: true)
    worksheet = workbook.add_worksheet

    assert_equal(:no_error, worksheet.write_formula_str(0, 0, '="A" & "B"', nil, "AB"))
    workbook.close

    sheet = parse_xlsx(workbook.filename).sheet(0)
    assert_equal('"A" & "B"', sheet.formula(1, 1))
    assert_equal("AB", sheet.cell(1, 1))
  ensure
    workbook.remove_tmp_folder if workbook
  end

end
