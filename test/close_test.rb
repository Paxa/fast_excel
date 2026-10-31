require_relative 'test_helper'

describe "FastExcel close" do

  it "should let other threads run while the workbook is written" do
    workbook = FastExcel.open(constant_memory: true)
    sheet = workbook.add_worksheet
    50_000.times do |i|
      sheet.write_row(i, [i, "row #{i}", i * 1.5, "text #{i * 7}", i % 3])
    end

    ticks = 0
    running = true
    ticker = Thread.new do
      while running
        ticks += 1
        sleep 0.001
      end
    end
    sleep 0.01 until ticks > 0

    before = ticks
    workbook.close
    during = ticks - before

    running = false
    ticker.join

    assert(during > 0, "no other thread ran while workbook_close held the GVL")
    assert_equal(50_000, parse_xlsx(workbook.filename).sheet(0).last_row)
  ensure
    workbook.remove_tmp_folder if workbook
  end

end
