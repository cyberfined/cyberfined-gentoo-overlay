# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
DESCRIPTION="Generic library for real-time communications with async IO support"
HOMEPAGE="https://github.com/baresip"
SRC_URI="https://github.com/baresip/re/archive/refs/tags/v2.6.1.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="sys-libs/zlib dev-libs/openssl"
DEPEND="${RDEPEND}"

src_build() {
	emake RELEASE=1
}

src_install() {
	local bits="$((get_conf LONG_BIT))"
	local libdir=""
	if [[ "$bits" -eq 64 ]]; then
		libdir="/usr/lib64"
	else
		libdir="/usr/lib"
	fi
	emake DESTDIR="${D}" LIBDIR="${libdir}" RELEASE=1 install
}
