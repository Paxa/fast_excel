# Ultra Fast Excel Writter for Ruby

```ruby
require 'fast_excel'

workbook = FastExcel.open("hello_world_ffi.xlsx")
worksheet = workbook.add_worksheet("Garuda Payments")

bold = workbook.bold_cell_format
worksheet.set_column(0, 0, 30, bold)

price = workbook.number_format("#,##0.00")
worksheet.set_column(1, 1, 30, price)

date_format = workbook.number_format("[$-409]m/d/yy h:mm AM/PM;@")
worksheet.set_column(2, 2, 30, date_format)

worksheet.write_row(0, ["message", "price", "date"], bold)

for i in 1..1000
  worksheet.write_row(i, ["Hello", (rand * 10_000_000).round(2), Time.now])

  # Or manually
  # worksheet.write_string(i, 0, "Hello", nil)
  # worksheet.write_number(i, 1, (rand * 10_000_000).round(2), nil)
  # date = Libxlsxwriter::Datetime.new
  # date[:year] = 2017
  # date[:month] = 2
  # date[:day] = 24
  # date[:hour] = i % 24
  # date[:min] = i % 60
  # date[:sec] = i % 60
  # worksheet.write_datetime(i, 2, date, nil)
end

workbook.close
```


# Build

## On Mac

    git clone https://github.com/jmcnamara/libxlsxwriter.git
    cd libxlsxwriter
    make
    cd ..
    cp libxlsxwriter/lib/libxlsxwriter.dylib ./binaries/libxlsxwriter-darwin.dylib
    otool -L ./binaries/libxlsxwriter-darwin.dylib
    #install_name_tool -change /usr/lib/libxlsxwriter.dylib @rpath/libxlsxwriter-darwin.dylib ./binaries/libxlsxwriter-darwin.dylib


## On Linux

    docker build . -f build_alpine_linux.docker -t fast_excel_alpine
    docker run -t fast_excel_alpine ls lib/libxlsxwriter.so
    LAST_CONTAINER_ID=$(docker ps -a | grep fast_excel_alpine | head -1 | awk '{print $1;}')
    docker cp $LAST_CONTAINER_ID:/srv/libxlsxwriter/lib/libxlsxwriter.so ./binaries/libxlsxwriter-alpine.so
    docker rm $LAST_CONTAINER_ID

    docker build . -f build_centos_linux.docker -t fast_excel_centos
    docker run -t fast_excel_centos ls lib/libxlsxwriter.so
    LAST_CONTAINER_ID=$(docker ps -a | grep fast_excel_centos | head -1 | awk '{print $1;}')
    docker cp $LAST_CONTAINER_ID:/srv/libxlsxwriter/lib/libxlsxwriter.so ./binaries/libxlsxwriter-glibc.so
    docker rm $LAST_CONTAINER_ID