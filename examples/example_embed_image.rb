require_relative '../lib/fast_excel'

workbook = FastExcel.open("example_embed_image.xlsx", constant_memory: false)
worksheet = workbook.add_worksheet

img_options = Libxlsxwriter::ImageOptions.new
img_options[:x_offset] = 0
img_options[:y_offset] = 0

worksheet.embed_image_opt(3, 3, "examples/logo.png", img_options)

workbook.close
puts "Saved to file example_embed_image.xlsx"