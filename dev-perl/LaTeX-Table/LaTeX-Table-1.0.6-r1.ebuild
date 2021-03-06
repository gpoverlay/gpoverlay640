# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DIST_AUTHOR=LIMAONE
DIST_VERSION=v1.0.6
DIST_EXAMPLES=("examples/*")
inherit perl-module

DESCRIPTION="Perl extension for the automatic generation of LaTeX tables"

LICENSE="|| ( GPL-1+ Artistic )"
SLOT="0"
KEYWORDS="amd64 ~arm arm64 ppc ppc64 ~riscv x86 ~amd64-linux ~x86-linux"
IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND="
	virtual/perl-Carp
	dev-perl/Module-Pluggable
	dev-perl/Moose
	dev-perl/MooseX-FollowPBP
	virtual/perl-Scalar-List-Utils
	dev-perl/Template-Toolkit
	virtual/perl-version
"
DEPEND="${RDEPEND}
	virtual/perl-File-Spec
	dev-perl/Module-Build
	test? ( dev-perl/Test-NoWarnings )
"
