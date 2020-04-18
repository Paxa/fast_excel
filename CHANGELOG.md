#### Version 0.3.0 - 18 abr 2020

* [BREAKING CHANGE] Rename `worksheet.right_to_left` to `worksheet.set_right_to_left`:
  - now it will work properly when using the `pry-rails` gem, not forcing the document start from right even when this method is not called.

#### Version 0.2.6 - 26 jan 2019

* Add column auto width (thanks to @duffyjp)

#### Version 0.2.5 - 22 jun 2018

* Update libxlsxwriter to 0.7.7

#### Version 0.2.4 - 13 mar 2018

* Update libxlsxwriter to 0.7.6
* Don’t crash process when duplicated worksheet name

#### Version 0.2.3 - 27 oct 2017

* Allow Date along with DateTime in write_value (thanks to @noxern)

#### Version 0.2.2 - 20 sep 2017

* Nice setters and getters for format.align
* Add nice setters for colors and borders
* Add sheet.append_row, sheet.last_row_number
* Run tests in CI
* Performance optimizations and type check refactoring
* Add styles_example.rb
* Fix assigning align from other format

#### Version 0.2.1 - 20 jun 2017

* Add FastExcel::Formula

#### Version 0.2.0 - 24 apr 2017

* Add FastExcel.date_num
* Add feature to use user default font
* Add benchmarks

#### Version 0.1.0 - 24 feb 2017

Initial
