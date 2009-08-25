# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

MODULE_AUTHOR=ADAMK
inherit perl-module

DESCRIPTION="Extremely light weight SQLite-specific ORM"

SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="|| ( >=dev-lang/perl-5.10.0 >=virtual/File-Path-2.04 )
	>=virtual/perl-File-Temp-0.17
	>=dev-perl/Params-Util-0.33
	>=dev-perl/DBI-1.607
	>=dev-perl/DBD-SQLite-1.25"
RDEPEND="${DEPEND}"

SRC_TEST=do
