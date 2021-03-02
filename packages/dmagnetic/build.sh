TERMUX_PKG_HOMEPAGE=https://www.dettus.net/dMagnetic
TERMUX_PKG_DESCRIPTION="Interpreter for classic text adventure games and interactive fiction"
TERMUX_PKG_LICENSE="BSD 2-Clause"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION=0.30
TERMUX_PKG_REVISION=1
TERMUX_PKG_SRCURL=https://www.dettus.net/dMagnetic/dMagnetic_${TERMUX_PKG_VERSION}.tar.bz2
TERMUX_PKG_SHA256=9eb825290495150b8ae4eeb0ff04aba724c1fd8f6052b0c4cb90865787f922be
TERMUX_PKG_BUILD_IN_SRC=true
TERMUX_PKG_HOSTBUILD=true

termux_step_host_build() {
	cd $TERMUX_PKG_BUILDDIR
	make -j $TERMUX_MAKE_PROCESSES dMagnetic
	mv dMagnetic $TERMUX_PKG_HOSTBUILD_DIR/
	make clean
}

termux_step_post_configure() {
	# find our host-built dMagnetic
	export PATH=$TERMUX_PKG_HOSTBUILD_DIR:$PATH
}
