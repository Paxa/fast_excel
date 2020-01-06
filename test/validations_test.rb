require_relative 'test_helper'

describe "FastExcel validations" do

  it "should raise error when duplicate sheet name" do
    workbook = FastExcel.open(constant_memory: true)

    workbook.add_worksheet("Payments Report")
    error = assert_raises do
      workbook.add_worksheet("Payments Report")
    end

    assert_equal(ArgumentError, error.class)
    assert_equal("Worksheet name 'Payments Report' is already in use", error.message)
  end

  it "should not raise error when worksheet name is null" do
    workbook = FastExcel.open(constant_memory: true)

    ws1 = workbook.add_worksheet()
    ws2 = workbook.add_worksheet()
    ws2.write_value(0, 2, "aaa")

    assert_equal("Sheet1", ws1[:name])
    assert_equal("Sheet2", ws2[:name])
  end

  it "should raise error when the sheet name exceeds maximum length" do
    workbook = FastExcel.open(constant_memory: true)

    error = assert_raises do
      workbook.add_worksheet("ABCDEFGHIJKLMNOPQRSTUVWXYZ012345")
    end

    assert_equal(ArgumentError, error.class)
    assert_equal("Worksheet name 'ABCDEFGHIJKLMNOPQRSTUVWXYZ012345' exceeds Excel's limit of 31 characters", error.message)
  end

  it "should not raise error when the sheet name is at maximum length" do
    workbook = FastExcel.open(constant_memory: true)

    worksheet = workbook.add_worksheet("ABCDEFGHIJKLMNOPQRSTUVWXYZ01234")
    worksheet.append_row(["aaa", "bbb", "ccc"])

    assert_equal("ABCDEFGHIJKLMNOPQRSTUVWXYZ01234", worksheet[:name])
  end
end
