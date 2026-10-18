require_relative 'test_helper'

describe "FastExcel::Worksheet" do
  before do
    @workbook = FastExcel.open(constant_memory: true)
  end

  describe "#get_worksheet_by_name" do
    it "should return nil if worksheet does not exist" do
      ws = @workbook.get_worksheet_by_name("Page1")
      assert_nil(ws)

      assert_nil(@workbook.get_worksheet_by_name(nil))
      assert_nil(@workbook.get_worksheet_by_name(:Page1))
    end

    it "should return worksheet if worksheet does exist" do
      @workbook.add_worksheet("Page1")

      ws = @workbook.get_worksheet_by_name("Page1")
      ws.write_row(0, ['1'])
      assert_kind_of(Libxlsxwriter::Worksheet, ws)

      ws_by_sym = @workbook.get_worksheet_by_name(:Page1)
      assert_kind_of(Libxlsxwriter::Worksheet, ws_by_sym)
    end
  end
end
