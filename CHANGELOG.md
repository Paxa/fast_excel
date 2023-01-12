#### Version 0.4.1 - 13 jan 2023

* Support ruby 3.2
* Improve library loading (Thanks to @sly7-7 and @BrianHawley)
* Ensure Time.zone is not nil (Thanks to @ksuh90)
* Get utc_offset from current value if possible (Thanks to @KevinSchiffmann)
* Validate worksheet name using Libxlsxwriter (Thanks to @datbth)
* Fix readme typo (Thanks to @sw4d)

#### Version 0.4.0 - 14 feb 2021

* Support ruby 3.0
* Fix for ffi library loading issue on Windows

#### Version 0.3.0 - 23 jul 2020

* Add support for FastExcel::URL
* Add support for writing boolean values
* Add enable_filters!(end_col: X)
* Allow to open with an empty existing file
* Add missing enums to chart
* Don't change sheet name from "" to nil
* Support build with docker
* Fix crash when sheet name exceeds maximum length.
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
