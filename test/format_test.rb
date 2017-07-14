require_relative 'test_helper'

describe "FastExcel::FormatExt" do

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

  def my_assert_raises(*excs)
    error = nil
    assert_raises(*excs) do
      begin
        yield
      rescue => e
        p e
        error = e
        raise e
      end
    end

    return error
  end

end
