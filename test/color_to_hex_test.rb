require_relative 'test_helper'

describe "FastExcel.color_to_hex" do
  it "should convert hex number color to hex" do
    assert_equal(FastExcel.color_to_hex(0xFF0000), 0xFF0000)
  end

  it "should convert color name to hex" do
    assert_equal(FastExcel.color_to_hex("color_lime"), 0x00FF00)
  end

  it "should convert color name (extra colors) to hex" do
    assert_equal(FastExcel.color_to_hex("steel_blue"), 0x4682B4)
  end
end
