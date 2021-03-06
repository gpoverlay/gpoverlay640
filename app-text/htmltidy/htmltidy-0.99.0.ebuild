# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=5

MY_PN="tidy"
MY_PV="20090325"
MY_P="${MY_PN}-${MY_PV}"

inherit epatch autotools

DESCRIPTION="Tidy the layout and correct errors in HTML and XML documents"
HOMEPAGE="http://tidy.sourceforge.net/"
SRC_URI="mirror://gentoo/${MY_P}.tar.bz2
	mirror://gentoo/${MY_P}-doc.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~alpha amd64 arm arm64 hppa ~ia64 ~mips ppc ppc64 ~riscv ~s390 sparc x86 ~amd64-linux ~x86-linux ~ppc-macos ~x64-macos"
IUSE="debug doc static-libs"

DEPEND="doc? ( app-doc/doxygen )"
RDEPEND=""

S="${WORKDIR}"/${MY_P}

src_prepare() {
	# Required to setup the source dist for autotools
	einfo "Setting up autotools for source build"
	cp -R  ./build/gnuauto/* . || die "could not prepare autotools environment"

	# Stop tidy from appending -O2 to our CFLAGS
	epatch "${FILESDIR}"/${P}-strip-O2-flag.patch

	# Define /etc/tidyrc for system wide config, bug 154834
	epatch "${FILESDIR}"/${P}-tidyrc.patch

	# Fix security bug 561452
	epatch "${FILESDIR}"/${P}-CVE-2015-5522.patch

	eautoreconf
}

src_compile() {
	default

	if use doc ; then
		doxygen htmldoc/doxygen.cfg  || die "error making apidocs"
	fi
}

src_configure() {
	econf \
		$(use_enable debug) \
		$(use_enable static-libs static)
}

src_install() {
	default

	find "${ED}" -name '*.la' -exec rm -f {} +

	# Now the man page is provided as an xsl file, which
	# we can't use until htmltidy is merged.
	# I have generated the man page and quickref which is on
	# the mirrors. (bug #132429)
	doman "${WORKDIR}"/"${MY_P}"-doc/tidy.1

	# Fix name before installing
	mv "${WORKDIR}"/"${MY_P}"-doc/quickref-html \
		"${WORKDIR}"/"${MY_P}"-doc/quickref.html

	cd "${S}"/htmldoc
	# Install basic html documentation
	dohtml *.html *.css *.gif "${WORKDIR}"/"${MY_P}"-doc/quickref.html

	# If use 'doc' is set, then we also want to install the
	# api documentation
	use doc && dohtml -r api
}
