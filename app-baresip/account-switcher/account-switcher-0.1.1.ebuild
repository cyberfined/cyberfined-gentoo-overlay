# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
DESCRIPTION="Baresip module for switching accounts"
HOMEPAGE="https://github.com/cyberfined/baresip-account-switcher"
SRC_URI="https://github.com/cyberfined/baresip-account-switcher/archive/refs/tags/0.1.1.tar.gz -> baresip-account-switcher-0.1.1.tar.gz"

LICENSE="WTFPL"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="net-voip/baresip"
BDEPEND="virtual/rust"
DEPEND="${RDEPEND}"

src_compile() {
	cargo build --release
}

src_install() {
	local destdir="${D}/usr/lib64/baresip/modules"
	mkdir -p "$destdir"
	cp "target/release/libaccount_switcher.so" "${destdir}/account_switcher.so"
}
