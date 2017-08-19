require_relative '../lib/fast_excel'
require 'pp'

workbook = FastExcel.open("example_styles.xlsx", constant_memory: true)

#workbook.default_format.set(
#  font_size: 0, # user's default
#  #font_family: "Arial"
#)

worksheet = workbook.add_worksheet

worksheet.set_columns_width(0, 11, 11)

worksheet.write_value(0, 0, "Bold",        workbook.add_format(bold: true))
worksheet.write_value(0, 1, "Italic",      workbook.add_format(italic: true))
worksheet.write_value(0, 2, "Underline",   workbook.add_format(underline: :underline_single))
worksheet.write_value(0, 3, "Double line", workbook.add_format(underline: :underline_double))
worksheet.write_value(0, 4, "Indent",      workbook.add_format(indent: 1))
worksheet.write_value(0, 5, "Border",      workbook.add_format(border: :border_thin))
worksheet.write_value(0, 6, "Border2",     workbook.add_format(border: :border_medium))
worksheet.write_value(0, 7, "Pattern",     workbook.add_format(pattern: :pattern_light_up, bg_color: :yellow))
worksheet.write_value(0, 8, "Script",      workbook.add_format(font_script: :font_subscript))
worksheet.write_value(0, 9, "Strike",      workbook.add_format(font_strikeout: true))
worksheet.write_value(0, 10, "Shaddow",    workbook.add_format(font_shadow: true))

workbook.close
puts "Saved to file example_styles.xlsx"