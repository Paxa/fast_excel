require_relative './lib/fast_excel'
require 'pp'

workbook = FastExcel.open("ffi_example_image.xlsx", constant_memory: false)
worksheet = workbook.add_worksheet

def print_str(struct)
  res = {}
  struct.members.each do |key|
    res[key] = struct[key]
  end
  pp res
end

img_options = Libxlsxwriter::ImageOptions.new
img_options[:x_offset] = 0
img_options[:y_offset] = 0

worksheet.insert_image_opt(3, 3, "libxlsxwriter/examples/logo.png", img_options)

workbook.close
