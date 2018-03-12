require_relative 'test_helper'

describe "FastExcel validations" do

  it "should raise error when duplicate sheet name" do
    workbook = FastExcel.open(constant_memory: true)

    worksheet1 = workbook.add_worksheet("Payments Report")
    error = assert_raises do
      workbook.add_worksheet("Payments Report")
    end

    assert_equal(ArgumentError, error.class)
    assert_equal("Worksheet name 'Payments Report' is already in use", error.message)
  end

  it "should not raise error when worksheet name is empty string" do
    workbook = FastExcel.open(constant_memory: true)

    ws1 = workbook.add_worksheet("")
    ws2 = workbook.add_worksheet("")
    ws2.write_value(0, 2, "aaa")

    assert_equal("", ws1[:name])
    assert_equal("", ws2[:name])
  end
end