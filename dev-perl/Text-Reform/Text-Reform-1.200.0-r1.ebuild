# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=5

MY_PN=Text-Reform
MODULE_AUTHOR=CHORNY
MODULE_VERSION=1.20
inherit perl-module

DESCRIPTION="Manual text wrapping and reformatting"

SLOT="0"
KEYWORDS="~alpha amd64 ~arm arm64 ~hppa ~ia64 ppc ppc64 ~riscv ~s390 sparc x86 ~amd64-linux ~x86-linux ~ppc-macos ~x64-macos ~sparc-solaris ~sparc64-solaris ~x64-solaris ~x86-solaris"
IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND=""
DEPEND="dev-perl/Module-Build
	test? ( virtual/perl-Test-Simple )"

SRC_TEST=do

src_test() {
	perl_rm_files t/pod.t
	perl-module_src_test
}
