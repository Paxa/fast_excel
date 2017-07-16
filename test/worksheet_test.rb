require_relative 'test_helper'

describe "FastExcel::WorksheetExt append_row" do

  before do
    @workbook = FastExcel.open(constant_memory: false)
    @worksheet = @workbook.add_worksheet
  end

  it "should have last_row_number = -1" do
    assert_equal(-1, @worksheet.last_row_number)
  end

  it "should write_value and update last_row_number" do
    @worksheet.write_value(0, 2, "aaa")
    assert_equal(0, @worksheet.last_row_number)
    assert_equal([[nil, nil, "aaa"]], get_arrays(@workbook))
  end

  it "should append row and update last_row_number" do
    @worksheet.append_row(["aaa", "bbb", "ccc"])
    @worksheet.append_row(["ddd", "eee", "fff"])

    assert_equal(1, @worksheet.last_row_number)
    assert_equal([["aaa", "bbb", "ccc"], ["ddd", "eee", "fff"]], get_arrays(@workbook))
  end

  it "should write_row then append and update last_row_number" do
    @worksheet.write_row(3, ["aaa", "bbb", "ccc"])
    @worksheet.append_row(["ddd", "eee", "fff"])

    assert_equal(4, @worksheet.last_row_number)
    assert_equal(
      [
        [nil, nil, nil],
        [nil, nil, nil],
        [nil, nil, nil],
        ["aaa", "bbb", "ccc"],
        ["ddd", "eee", "fff"]
      ],
      get_arrays(@workbook)
    )
  end

  it "should not reduce last_row_number" do
    @worksheet.append_row(["aaa", "bbb", "ccc"])
    @worksheet.append_row(["ddd", "eee", "fff"])
    @worksheet.write_value(0, 4, "foo")
    @worksheet.append_row(["111", "222", "333"])

    assert_equal(2, @worksheet.last_row_number)
    assert_equal(
      [
        ["aaa", "bbb", "ccc", nil, "foo"],
        ["ddd", "eee", "fff", nil, nil],
        ["111", "222", "333", nil, nil]
      ],
      get_arrays(@workbook)
    )
  end

  it "should not allow to write rows that already saved" do
    @workbook = FastExcel.open(constant_memory: true)
    @worksheet = @workbook.add_worksheet

    @worksheet.append_row(["aaa", "bbb", "ccc"])
    @worksheet.append_row(["ddd", "eee", "fff"])

    error = assert_raises(ArgumentError) do
      @worksheet.write_value(0, 4, "foo")
    end

    assert_equal("Can not write to saved row in constant_memory mode (attempted row: 0, last saved row: 1)", error.message)
  end

end
