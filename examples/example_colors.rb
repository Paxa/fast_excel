require_relative '../lib/fast_excel'
require 'pp'

workbook = FastExcel.open("example_colors.xlsx", constant_memory: true)

worksheet = workbook.add_worksheet

color_format = workbook.add_format

# We can use color names as string and symbols, color hex codes and color hex numbers

color_format.set(
  font_color: '9900FF',
  bg_color: '#FFAAAA',

  border_bottom: :medium,
  border_bottom_color: 'green',

  border_left: :slant_dash_dot,
  border_left_color: 0x00FF00,

  border_right: :double,
  border_right_color: :crimson,

  border_top: :border_hair,
  border_top_color: :medium_blue
)

# Possible border styles:
# [:none, :thin, :medium, :dashed, :dotted, :thick, :double, :hair, :medium_dashed,
#  :dash_dot, :medium_dash_dot, :dash_dot_dot, :medium_dash_dot_dot, :slant_dash_dot]

worksheet.set_column_width(1, 30)

worksheet.write_value(1, 1, "Hello", color_format)

workbook.close
puts "Saved to file example_colors.xlsx"
