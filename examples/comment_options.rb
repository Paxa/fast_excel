require_relative '../lib/fast_excel'

workbook = FastExcel.open('comment_options.xlsx', constant_memory: true)
worksheet = workbook.add_worksheet('Comment Options')

worksheet.write_value(0, 0, 'Cell with basic comment')
worksheet.write_comment(0, 0, 'Very basic comment.')

options = Libxlsxwriter::CommentOptions.new
options.author = 'Lol'
options.visible = 1

worksheet.write_value(2, 0, 'Cell with visible comment and custom author')
worksheet.write_comment_opt(2, 0, 'This comment is visible and has a custom author', options)

options = Libxlsxwriter::CommentOptions.new
options.author = 'Kek'
options.width = 250
options.height = 100
options.color = '#FF0000'
options.font_name = 'Courier New'
options.font_size = 10.0
options.visible = 1

worksheet.write_value(5, 0, 'Cell with styled comment')
worksheet.write_comment_opt(5, 0, 'If a song plants an idea or a feeling in a mind, it has already changed the world.', options)

options = Libxlsxwriter::CommentOptions.new
options.start_row = 10
options.start_col = 2
options.x_offset = 20
options.y_offset = 20
options.visible = 1

worksheet.write_value(10, 0, 'Cell with repositioned comment')
worksheet.write_comment_opt(10, 0, 'This comment is positioned away from the cell.', options)

workbook.close
puts 'Saved to file comment_options.xlsx'
