require_relative 'test_helper'

describe 'FastExcel::Worksheet write_comment_opt' do
  let(:workbook) { FastExcel.open(constant_memory: true) }
  let(:worksheet) { workbook.add_worksheet }
  let(:options) do
    Libxlsxwriter::CommentOptions.new.tap do |options|
      options.author = 'Lolo'
      options.visible = 1
      options.width = 200
      options.height = 100
      options.x_scale = 1.5
      options.y_scale = 1.5
      options.color = '0xFFFF00'
      options.font_name = 'Arial'
      options.font_size = 12.0
      options.font_family = 2
      options.start_row = 0
      options.start_col = 1
      options.x_offset = 10
      options.y_offset = 10
    end
  end

  it 'should write a comment with options' do
    assert_equal(:no_error, worksheet.write_comment_opt(0, 0, 'Hello with options', options))
  end
end
