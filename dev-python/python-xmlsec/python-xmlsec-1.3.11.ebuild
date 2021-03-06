# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..10} )
inherit distutils-r1

DESCRIPTION="Python bindings for the XML Security Library"
HOMEPAGE="https://github.com/mehcode/python-xmlsec"
SRC_URI="https://github.com/mehcode/python-xmlsec/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 ~ppc64 x86"

DEPEND="
	dev-libs/xmlsec:=
"
RDEPEND="${DEPEND}
	dev-python/lxml[${PYTHON_USEDEP}]
"
BDEPEND="${RDEPEND}
	dev-python/pkgconfig[${PYTHON_USEDEP}]
	dev-python/wheel[${PYTHON_USEDEP}]
	test? (
		dev-python/hypothesis[${PYTHON_USEDEP}]
	)"

PATCHES=(
	"${FILESDIR}/${P}-fix-xml-testfail.patch"
)

distutils_enable_tests pytest

python_prepare_all() {
	sed -e "s:use_scm_version=.*:version='${PV}',:" \
		-e "/setup_requires/ d" \
		-i setup.py || die

	distutils-r1_python_prepare_all
}
