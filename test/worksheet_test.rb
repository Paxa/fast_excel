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

  it "should write bigdecimal as a number" do
    require 'bigdecimal'

    @workbook = FastExcel.open(constant_memory: true)
    @worksheet = @workbook.add_worksheet

    @worksheet.append_row([BigDecimal("0.1234")])

    assert_equal([[0.1234]], get_arrays(@workbook))
  end

  it "should set name correctly" do
    workbook = FastExcel.open(constant_memory: true)
    ws1 = workbook.add_worksheet("foo")
    error = assert_raises do
      ws2 = workbook.add_worksheet("")
    end

    assert_equal("foo", ws1[:name])

    assert_equal(ArgumentError, error.class)
    assert_equal("Invalid worksheet name '': (14 - error_sheetname_length_exceeded) Function string parameter is empty.", error.message)
  end

  it "should map fields correctly" do
    workbook = FastExcel.open(constant_memory: true)

    ws = workbook.add_worksheet("1 should map fields correctly")

    ws.set_right_to_left

    assert_equal(ws[:right_to_left], 1)

    ws = workbook.add_worksheet
    ws.center_vertically
    assert_equal(ws[:print_options_changed], 1)
    assert_equal(ws[:vcenter], 1)

    ws = workbook.add_worksheet
    ws.print_row_col_headers
    assert_equal(ws[:print_headers], 1)
    assert_equal(ws[:print_options_changed], 1)

    ws = workbook.add_worksheet
    ws.set_margins(1.5, 2.5, 3.5, 4.5)
    assert_equal(ws[:margin_left], 1.5)
    assert_equal(ws[:margin_right], 2.5)
    assert_equal(ws[:margin_top], 3.5)
    assert_equal(ws[:margin_bottom], 4.5)

    assert_equal(ws[:vbreaks_count], 0)

    breaks = [20, 40, 60, 20, 0]
    FFI::MemoryPointer.new(:uint16, breaks.size) do |buffer|
      buffer.write_array_of_uint16(breaks)
      ws.set_v_pagebreaks(buffer)
    end

    # FastExcel.print_ffi_obj(ws)

    assert_equal(ws[:vbreaks_count], 4)
  end
end
