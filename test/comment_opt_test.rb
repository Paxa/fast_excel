require_relative 'test_helper'

describe 'FastExcel::Worksheet write_comment_opt' do
  let(:workbook) { FastExcel.open(constant_memory: true) }
  let(:worksheet) { workbook.add_worksheet }
  let(:options) do
    Libxlsxwriter::CommentOptions.new.tap do |opts|
      opts.author = 'Lolo'
      opts.visible = 1
      opts.width = 200
      opts.height = 100
      opts.x_scale = 1.5
      opts.y_scale = 1.5
      opts.color = '0xFFFF00'
      opts.font_name = 'Arial'
      opts.font_size = 12.0
      opts.font_family = 2
      opts.start_row = 0
      opts.start_col = 1
      opts.x_offset = 10
      opts.y_offset = 10
    end
  end

  it 'should write a comment with options struct' do
    assert_equal(:no_error, worksheet.write_comment_opt(0, 0, 'Hello with options', options))
  end

  it 'should write a comment with hash options' do
    assert_equal(:no_error, worksheet.write_comment_opt(1, 0, 'Comment via hash', author: 'Author1', visible: 1, color: '#FF0000'))
  end

  it 'should write a comment using write_comment with optional options' do
    assert_equal(:no_error, worksheet.write_comment(2, 0, 'Simple comment'))
    assert_equal(:no_error, worksheet.write_comment(3, 0, 'Comment with hash', author: 'Alice', color: 'lime'))
  end

  it 'handles nil author and font_name safely' do
    opts = Libxlsxwriter::CommentOptions.new
    opts.author = nil
    opts.font_name = nil
    assert_nil opts.author
    assert_nil opts.font_name

    opts.author = 'Bob'
    assert_equal 'Bob', opts.author
    opts.author = nil
    assert_nil opts.author
  end

  it 'preserves string pointers across garbage collection' do
    opts = Libxlsxwriter::CommentOptions.new(author: "Temporary #{rand} Author", font_name: 'Courier New')
    # Run full GC cycles to ensure MemoryPointer is not collected prematurely
    10.times { GC.start }

    assert opts.author.start_with?('Temporary')
    assert_equal 'Courier New', opts.font_name
    assert_equal :no_error, worksheet.write_comment_opt(4, 0, 'GC test comment', opts)
  end

  it 'generates a valid excel file with styled comments' do
    temp_file = File.join(Dir.tmpdir, "test_comments_#{Time.now.to_i}.xlsx")
    begin
      wb = FastExcel.open(temp_file)
      ws = wb.add_worksheet
      ws.write_value(0, 0, 'Data')
      ws.write_comment(0, 0, 'Styled comment', author: 'Tester', visible: 1, color: 'yellow', font_name: 'Arial')
      wb.close

      assert File.exist?(temp_file)
      assert File.size(temp_file) > 0
    ensure
      File.delete(temp_file) if File.exist?(temp_file)
    end
  end
end
