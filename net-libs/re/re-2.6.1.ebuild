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

src_install() {
	emake DESTDIR="${D}" LIBDIR=/usr/lib64 install
	einstalldocs
}
