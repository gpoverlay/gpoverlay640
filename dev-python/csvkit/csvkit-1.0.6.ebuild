# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..10} )
DISTUTILS_USE_SETUPTOOLS=rdepend

inherit distutils-r1

DESCRIPTION="A suite of utilities for converting to and working with CSV."
HOMEPAGE="https://github.com/wireservice/csvkit https://pypi.org/project/csvkit/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="+xml"

# Other packages have BDEPEND="test? ( dev-python/csvkit[xml] )"
AGATE_VERSION_DEP=">=dev-python/agate-1.6.1"
TEST_AGAINST_RDEPEND="xml? ( ${AGATE_VERSION_DEP}[xml,${PYTHON_USEDEP}] )"
RDEPEND="
	${AGATE_VERSION_DEP}[${PYTHON_USEDEP}]
	>=dev-python/agate-excel-0.2.2[${PYTHON_USEDEP}]
	>=dev-python/agate-dbf-0.2.0[${PYTHON_USEDEP}]
	>=dev-python/agate-sql-0.5.3[${PYTHON_USEDEP}]
	>=dev-python/six-1.6.1[${PYTHON_USEDEP}]

	${TEST_AGAINST_RDEPEND}
"
BDEPEND="test? ( ${AGATE_VERSION_DEP}[xml,${PYTHON_USEDEP}] )"

distutils_enable_tests pytest

python_test() {
	local deselect=(
		tests/test_utilities/test_in2csv.py::TestIn2CSV::test_convert_dbf
	)
	epytest ${deselect[@]/#/--deselect }
}
