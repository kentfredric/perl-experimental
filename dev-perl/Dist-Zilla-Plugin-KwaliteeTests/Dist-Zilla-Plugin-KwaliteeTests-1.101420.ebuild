# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $
EAPI=3
MODULE_AUTHOR=MARCEL
inherit perl-module

DESCRIPTION="Release tests for kwalitee"
LICENSE="|| ( Artistic GPL-2 )"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
COMMON_DEPEND="
	dev-perl/Test-Kwalitee
	dev-perl/Dist-Zilla
	dev-perl/Moose
"
DEPEND="
	${COMMON_DEPEND}
	>=virtual/perl-Test-Simple-0.94
	virtual/perl-Scalar-List-Utils
	virtual/perl-File-Temp
	>=virtual/perl-ExtUtils-MakeMaker-6.56
"
RDEPEND="
	${COMMON_DEPEND}
"
SRC_TEST="do"
