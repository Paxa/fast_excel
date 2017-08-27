desc "Sync github.com:Paxa/libxlsxwriter to ./libxlsxwriter"
task :sync do
  require 'fileutils'
  FileUtils.rm_rf("./libxlsxwriter")
  system("git clone --depth 10 git@github.com:Paxa/libxlsxwriter.git")
  Dir.chdir("./libxlsxwriter") do
    system("git show --pretty='format:%cd %h' --date=iso --quiet > version.txt")
    FileUtils.rm_rf("./.git")
  end
end

require 'rake/testtask'

Rake::TestTask.new do |test|
  test.test_files = Dir.glob('test/**/*_test.rb')
end

#task :default => :test

task :examples do
  Dir.glob('examples/**/*.rb').each do |file|
    require './' + file.sub(/\.rb$/, '')
  end
end

task :windows_gem do
  require 'fileutils'

  puts Dir.glob("**/libgcc_*.dll")

  gcc_dll = Dir.glob("**/libgcc_*.dll")[0]
  raise "Can not find libgcc_*.dll" unless gcc_dll

  puts "Copy #{gcc_dll} -> libxlsxwriter/lib/#{File.basename(gcc_dll)}"
  FileUtils.cp(gcc_dll, "libxlsxwriter/lib/#{File.basename(gcc_dll)}")

  system("gem build fast_excel.gemspec")

  gem_file = Dir.glob("*.gem")[0]
  new_file = gem_file.sub('fast_excel', 'fast_excel-' + RUBY_PLATFORM)
  File.rename(gem_file, new_file)
  puts "Generated: #{new_file}"
end