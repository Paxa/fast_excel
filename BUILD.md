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