# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DIST_AUTHOR=HAARG
DIST_VERSION=2.003003
inherit perl-module

DESCRIPTION="Minimalist Object Orientation (with Moose compatiblity)"

SLOT="0"
KEYWORDS="amd64 ~arm arm64 ~hppa ~ia64 ~mips ppc ppc64 ~riscv sparc x86 ~amd64-linux ~x86-linux ~ppc-macos ~x64-macos ~x86-solaris"
IUSE="test"
RESTRICT="!test? ( test )"

# needs Scalar::Util
RDEPEND="
	>=dev-perl/Class-Method-Modifiers-1.100.0
	>=dev-perl/Devel-GlobalDestruction-0.110.0
	>=virtual/perl-Exporter-5.570.0
	>=dev-perl/Module-Runtime-0.14.0
	>=dev-perl/Role-Tiny-2.0.4
	>=dev-perl/Sub-Quote-2.3.1
	virtual/perl-Scalar-List-Utils
"
DEPEND="${RDEPEND}
	virtual/perl-ExtUtils-MakeMaker
	test? (
		>=dev-perl/Test-Fatal-0.3.0
		>=virtual/perl-Test-Simple-0.940.0
	)
"
