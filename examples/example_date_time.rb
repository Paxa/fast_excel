require_relative '../lib/fast_excel'

require 'date'
require 'time'


File.unlink("example_date_time.xlsx") if File.exist?("example_date_time.xlsx")

workbook = FastExcel.open("example_date_time.xlsx", constant_memory: true)
workbook.default_format.set(
  font_size: 0, # user's default
)
worksheet = workbook.add_worksheet

worksheet.set_columns_width(0, 4, 25)
worksheet.set_column(1, 1, 25, workbook.number_format("[$-409]m/d/yy hh:mm;@"))

intro = "Date and time in excel file stored as decimal number, it show number of days since January 1900, decimal part is for time of the day"
worksheet.merge_range(0, 0, 0, 4, intro, nil)
worksheet.write_value(1, 0, "")

worksheet.append_row(['', 'Formatted as Date', 'No formatting, plain number'])

worksheet.append_row(["Time.now", Time.now, Time.now, 'local timezone'])
worksheet.append_row(["Time.now.utc", Time.now.utc, Time.now.utc, 'UTC timezone'])

worksheet.append_row(["DateTime.now", DateTime.now, DateTime.now, 'local timezone'])
dt = DateTime.now.new_offset("+02:00")
worksheet.append_row(["DateTime new_offset", dt, dt, 'GMT+2 timezone'])

today = Date.today
worksheet.append_row(["Date.today", today, today])

worksheet.append_row(["0 (just zero)", 0, 0, '00 January 1900'])


workbook.close
puts "Saved to file example_date_time.xlsx"
