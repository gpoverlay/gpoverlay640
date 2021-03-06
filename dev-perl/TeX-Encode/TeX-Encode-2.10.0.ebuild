# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DIST_AUTHOR=ATHREEF
DIST_VERSION=2.010
inherit perl-module

DESCRIPTION="Encode/decode Perl utf-8 strings into TeX"

SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
	virtual/perl-Carp
	>=virtual/perl-Encode-0.100.0
"
BDEPEND="${RDEPEND}
	>=virtual/perl-CPAN-Meta-Requirements-2.120.620
	virtual/perl-ExtUtils-MakeMaker
	virtual/perl-Module-Metadata
	test? (
		virtual/perl-File-Spec
		virtual/perl-IO
		>=virtual/perl-Test-Simple-0.100.0
	)
"
