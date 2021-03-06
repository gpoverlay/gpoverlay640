# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

inherit autotools

DESCRIPTION="Software Token for Linux/UNIX"
HOMEPAGE="https://github.com/cernekee/stoken"
SRC_URI="https://github.com/cernekee/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="LGPL-2.1+"
SLOT="0"
KEYWORDS="amd64 arm arm64 ppc64 ~riscv x86"
IUSE="gtk static"

#	|| ( dev-libs/nettle dev-libs/libtomcrypt )    libtomcrypt is not packaged
RDEPEND="
	dev-libs/nettle
	gtk? ( >=x11-libs/gtk+-3.12:3 )"
DEPEND="${RDEPEND}"

src_prepare() {
	eautoreconf
	eapply_user
}

src_configure() {
	econf $(use_with gtk) --enable-static=$(usex static)
}
