require_relative 'test_helper'
require 'tmpdir'

describe "FastExcel tmpdir option" do
  it "uses system Dir.tmpdir by default without creating extra temp directories" do
    temp_file = File.join(Dir.tmpdir, "test_default_tmpdir_#{Time.now.to_i}.xlsx")
    begin
      wb = FastExcel.open(temp_file, constant_memory: true)
      ws = wb.add_worksheet
      ws.append_row(["test", 123])
      wb.close

      assert File.exist?(temp_file)
      assert File.size(temp_file) > 0
    ensure
      File.delete(temp_file) if File.exist?(temp_file)
    end
  end

  it "accepts custom tmpdir option" do
    Dir.mktmpdir do |custom_tmp|
      temp_file = File.join(custom_tmp, "test_custom_tmpdir.xlsx")
      wb = FastExcel.open(temp_file, constant_memory: true, tmpdir: custom_tmp)
      ws = wb.add_worksheet
      ws.append_row(["hello", "world"])
      wb.close

      assert File.exist?(temp_file)
      assert File.size(temp_file) > 0
    end
  end
end
