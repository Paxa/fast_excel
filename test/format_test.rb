require_relative 'test_helper'

describe "FastExcel::FormatExt align" do

  before do
    workbook = FastExcel.open(constant_memory: true)
    @format = workbook.add_format
  end

  it "should give default aligns" do
    assert_equal({horizontal: :align_none, vertical: :align_none}, @format.align)
  end

  it "should set align by full name" do
    @format.align = :align_center
    assert_equal({horizontal: :align_center, vertical: :align_none}, @format.align)
  end

  it "should set by string" do
    @format.align = "align_center"
    assert_equal({horizontal: :align_center, vertical: :align_none}, @format.align)
  end

  it "should set by short name" do
    @format.align = :center
    assert_equal({horizontal: :align_center, vertical: :align_none}, @format.align)
  end

  it "should set by hash" do
    @format.align = {v: "center", h: "center"}
    assert_equal({horizontal: :align_center, vertical: :align_vertical_center}, @format.align)
  end

  it "should raise exception for unknown value" do
    error = assert_raises(ArgumentError) do
      @format.align = :aaa
    end

    assert_equal(error.message, "Can not set align = :aaa, possible values are: [:align_none, :align_left, "\
      ":align_center, :align_right, :align_fill, :align_justify, :align_center_across, :align_distributed, "\
      ":align_vertical_top, :align_vertical_bottom, :align_vertical_center, :align_vertical_justify, :align_vertical_distributed]")
  end

  it "should raise exception for unknown hash key" do
    error = assert_raises(ArgumentError) do
      @format.align = {aaa: 1}
    end

    assert_equal(error.message, "Not allowed keys for align: [:aaa], possible keys: [:horizontal, :h, :vertical, :v]")
  end

end


describe "FastExcel::FormatExt colors" do

  before do
    workbook = FastExcel.open(constant_memory: true)
    @format = workbook.add_format
  end

  it "should set font color as hex num" do
    @format.font_color = 0xFF0000
    assert_equal(0xFF0000, @format.font_color)
  end

  it "should set font color as hex string" do
    @format.font_color = '0xFF0000'
    assert_equal(0xFF0000, @format.font_color)
  end

  it "should set font color as css hex string" do
    @format.font_color = '#FF0000'
    assert_equal(0xFF0000, @format.font_color)
  end

  it "should set font color as short hex string" do
    @format.font_color = 'FF0000'
    assert_equal(0xFF0000, @format.font_color)
  end

  it "should set font color as name" do
    @format.font_color = 'red'
    assert_equal(0xFF0000, @format.font_color)
  end

  it "should set font css color" do
    @format.font_color = 'alice_blue'
    assert_equal(0xF0F8FF, @format.font_color)
  end

  it "should allow to use symbol" do
    @format.font_color = :alice_blue
    assert_equal(0xF0F8FF, @format.font_color)
  end

  it "should have long method for border colors" do
    @format.border_bottom_color = :alice_blue
    assert_equal(0xF0F8FF, @format.border_bottom_color)
    assert_equal(0xF0F8FF, @format.bottom_color)
  end

  it "should raise for unexpected type" do
    error = assert_raises(ArgumentError) do
      @format.font_color = {aaa: 1}
    end

    assert_equal(error.message, "Can not use Hash ({:aaa=>1}) for color value, expected String or Hex Number")
  end

  it "should raise for unexpected color" do
    error = assert_raises(ArgumentError) do
      @format.font_color = :aaa
    end

    assert_equal(error.message, "Unknown color value :aaa, expected hex string or color name")
  end

end


describe "FastExcel::FormatExt border" do

  before do
    workbook = FastExcel.open(constant_memory: true)
    @format = workbook.add_format
  end

  it "should set border as symbol" do
    @format.bottom = :border_thin
    assert_equal(:border_thin, @format.bottom)
  end

  it "should set border as short symbol" do
    @format.bottom = :thin
    assert_equal(:border_thin, @format.bottom)
  end

  it "should set border as string" do
    @format.bottom = "thin"
    assert_equal(:border_thin, @format.bottom)
  end

  it "should set border as number" do
    @format.bottom = 1
    assert_equal(:border_thin, @format.bottom)
  end

  it "should set border with long prop name" do
    error = assert_raises(ArgumentError) do
      @format.border_bottom = :aaa
    end

    assert_equal(error.message, "Unknown value :aaa for border. Possible values: "\
      "[:none, :thin, :medium, :dashed, :dotted, :thick, :double, :hair, :medium_dashed, "\
      ":dash_dot, :medium_dash_dot, :dash_dot_dot, :medium_dash_dot_dot, :slant_dash_dot]")
  end

  it "should get value with long name" do
    @format.bottom = "thin"
    assert_equal(:border_thin, @format.border_bottom)
  end

end
