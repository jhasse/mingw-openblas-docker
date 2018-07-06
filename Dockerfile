FROM jhasse/mingw:2018-07-06

# OpenBLAS
RUN curl -o /tmp/openblas.zip https://codeload.github.com/xianyi/OpenBLAS/zip/v0.3.0 && \
	pushd /tmp && unzip openblas.zip && cd OpenBLAS* && dnf install -y gcc-c++ && \
	make -j16 HOSTCC=gcc DYNAMIC_ARCH=1 TARGET=NEHALEM NUM_THREADS=32 && \
	make PREFIX=/usr/x86_64-w64-mingw32/sys-root/mingw install && cd - && rm -rf OpenBLAS* && \
	rm openblas.zip && dnf remove -y gcc-c++ && dnf clean all
