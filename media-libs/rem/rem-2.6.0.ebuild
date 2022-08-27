# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
DESCRIPTION="Audio and video processing media library"
HOMEPAGE="https://github.com/baresip"
SRC_URI="https://github.com/baresip/rem/archive/refs/tags/v2.6.0.tar.gz -> librem-2.6.0.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="net-libs/re"
DEPEND="${RDEPEND}"

src_build() {
	emake RELEASE=1
}

src_install() {
	local bits="$(getconf LONG_BIT)"
	local libdir=""
	if [[ "$bits" -eq 64 ]]; then
		libdir="/usr/lib64"
	else
		libdir="/usr/lib"
	fi
	emake DESTDIR="${D}" LIBDIR="${libdir}" install
}
