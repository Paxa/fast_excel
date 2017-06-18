# Ultra Fast Excel Writter for Ruby

```ruby
require 'fast_excel'

workbook = FastExcel.open("hello_world_ffi.xlsx", constant_memory: true)
workbook.default_format.set(
  font_size: 0, # user's default
  font_family: "Arial"
)

worksheet = workbook.add_worksheet("Example Report")

bold = workbook.bold_cell_format
worksheet.set_column(0, 0, FastExcel::DEF_COL_WIDTH, bold)

price = workbook.number_format("#,##0.00")
worksheet.set_column(1, 1, 20, price)

date_format = workbook.number_format("[$-409]m/d/yy h:mm AM/PM;@")
worksheet.set_column(2, 2, 20, date_format)

worksheet.write_row(0, ["message", "price", "date"], bold)

for i in 1..1000
  worksheet.write_row(i, ["Hello", (rand * 10_000_000).round(2), Time.now])
end

worksheet.write_row(1001, ["Sum", FastExcel::Formula.new("SUM(B2:B1001)")], bold)

workbook.close
```

This repositiry and gem contain sources of [libxlsxwriter](https://github.com/jmcnamara/libxlsxwriter)

## Benchmarks

1000 rows:
```
Comparison:
           FastExcel:       31.7 i/s
               Axlsx:        8.0 i/s - 3.98x  slower
          write_xlsx:        6.9 i/s - 4.62x  slower
```

20000 rows:
```
Comparison:
           FastExcel:        1.4 i/s
               Axlsx:        0.4 i/s - 3.46x  slower
          write_xlsx:        0.1 i/s - 17.04x  slower
```

Max memory usage, generating 100k rows:
```
FastExcel   - 20 MB
Axlsx       - 60 MB
write_xlsx - 100 MB
```

## Install

```ruby
# Gemfile
gem 'fast_excel'
```
Or
```
gem install fast_excel
```

## API

This gem is FFI binding for libxlsxwriter C library with some syntax sugar. All original functions is avaliable, for example:

```ruby
Libxlsxwriter.worksheet_activate(worksheet) # => will call void worksheet_activate(lxw_worksheet *worksheet)
# or shorter:
worksheet.activate
```

Full libxlsxwriter documentation: [http://libxlsxwriter.github.io/](http://libxlsxwriter.github.io/)

Helper Methods:

* `FastExcel.open(filename = nil, constant_memory: false, default_format: {})` - open new workbook, if `filename` is nil - it will craete tmp file, `default_format` will be called with `workbook.default_format.set(...)`
* `FastExcel.date_num(time, offset = nil)` - generate Excel's internal date value, number of days since 1900-Jan-01, works faster then creating `Libxlsxwriter::Datetime` struct. `offset` argument is number hours from UTC, e.g. `3.5`
* `FastExcel.print_ffi_obj(object)` - print FFI object fields, just for debugging
* `workbook.bold_cell_format` - shortcut for creating bold format
* `workbook.number_format(num_format)` - create number or date format, for money usually: `"#,##0.00"`, for date: `"[$-409]m/d/yy h:mm AM/PM;@"`
* `workbook.read_string` - close workbook, read file to string, delete file (only if tmp file)
* `workbook.remove_tmp_file` - delete tmp file (only if tmp file)
* `worksheet.write_row(row_num, array_of_mixed_value, formats = nil)` - write values one by one, detecting type automatically. `formats` can be array, or Format object or nil
* `format.font_family` - alias for `format.font_name`
* `workbook.default_format.font_size` - set it to 0 if you want to use default font size (that what user set in Excel settings)
