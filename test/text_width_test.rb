require_relative 'test_helper'

describe "FastExcel Arial text_width" do

  it "should calculate width for character" do
    assert_in_delta(FastExcel.arial_text_width('a'), 55.61, 0.1)
  end

  it "should calculate width with kerning" do
    assert_in_delta(FastExcel.arial_text_width('A'), 66.69, 0.1)
    assert_in_delta(FastExcel.arial_text_width('V'), 66.69, 0.1)

    assert_in_delta(FastExcel.arial_text_width('AV'), 125.97, 0.1)

    assert_in_delta(FastExcel.arial_text_width('11'), 103.80, 0.1)
  end

  it "should skip system characters" do
    assert_in_delta(FastExcel.arial_text_width(10.chr), 0.0)
  end

  it "should handle multiline text" do
    assert_in_delta(FastExcel.arial_text_width("More\nThen\nOne Line"), 405.85, 0.1)
  end
end

describe "FastExcel Calibri text_width" do

  it "should calculate width for character" do
    assert_in_delta(FastExcel.calibri_text_width('a'), 47.90, 0.1)
  end

  it "should calculate width with kerning" do
    assert_in_delta(FastExcel.calibri_text_width('A'), 57.86, 0.1)
    assert_in_delta(FastExcel.calibri_text_width('V'), 56.73, 0.1)

    assert_in_delta(FastExcel.calibri_text_width('AV'), 110.25, 0.1)

    assert_in_delta(FastExcel.calibri_text_width('11'), 101.36, 0.1)
  end

  it "should skip system characters" do
    assert_in_delta(FastExcel.calibri_text_width(10.chr), 0.0)
  end

end

describe "FastExcel Times New Roman text_width" do

  it "should calculate width for character" do
    assert_in_delta(FastExcel.times_new_roman_text_width('a'), 44.38, 0.1)
  end

  it "should calculate width with kerning" do
    assert_in_delta(FastExcel.times_new_roman_text_width('A'), 72.21, 0.1)
    assert_in_delta(FastExcel.times_new_roman_text_width('V'), 72.21, 0.1)

    assert_in_delta(FastExcel.times_new_roman_text_width('AV'), 131.54, 0.1)

    assert_in_delta(FastExcel.times_new_roman_text_width('11'), 96.28, 0.1)
  end

  it "should skip system characters" do
    assert_in_delta(FastExcel.times_new_roman_text_width(10.chr), 0.0)
  end

end
