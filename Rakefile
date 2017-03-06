namespace :build do
  desc "Build mac binary"
  task :mac do
    Dir.chdir("./libxlsxwriter") do
      system("make clean && make")
      system('cp lib/libxlsxwriter.dylib ../binaries/libxlsxwriter-darwin.dylib')
    end
  end

  desc "Build linux (libc) binary"
  task :linux do
    system("docker build . -f build_centos_linux.docker -t fast_excel_centos")
    system("docker run -t fast_excel_centos readelf -d lib/libxlsxwriter.so")
    last_container_id = `docker ps -a | grep fast_excel_centos | head -1 | awk '{print $1;}'`.strip
    system("docker cp #{last_container_id}:/srv/libxlsxwriter/lib/libxlsxwriter.so ./binaries/libxlsxwriter-glibc.so")
    system("docker rm #{last_container_id}")
  end

  desc "Build linux (musl) binary"
  task :linux_musl do
    system("docker build . -f build_alpine_linux.docker -t fast_excel_alpine")
    system("docker run -t fast_excel_alpine readelf -d lib/libxlsxwriter.so")
    last_container_id = `docker ps -a | grep fast_excel_alpine | head -1 | awk '{print $1;}'`.strip
    system("docker cp #{last_container_id}:/srv/libxlsxwriter/lib/libxlsxwriter.so ./binaries/libxlsxwriter-alpine.so")
    system("docker rm #{last_container_id}")
  end
end

task :sync do
  require 'fileutils'
  FileUtils.rm_rf("./libxlsxwriter")
  system("git clone --depth 10 git@github.com:Paxa/libxlsxwriter.git")
  Dir.chdir("./libxlsxwriter") do
    system("git show --pretty='format:%cd %h' --date=iso --quiet > version.txt")
    FileUtils.rm_rf("./.git")
  end
end