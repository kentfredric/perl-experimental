# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $
EAPI=3
MODULE_AUTHOR=KENTNL
MODULE_VERSION="0.01028806"
inherit perl-module

DESCRIPTION="Capture Stdout/Stderr simultaneously as if it were one stream, painlessly"
LICENSE="|| ( Artistic GPL-2 )"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"
COMMON_DEPEND="
	virtual/perl-IO
	>=dev-perl/Sub-Exporter-0.982.0
	>=dev-lang/perl-5.8.0
"
DEPEND="
	${COMMON_DEPEND}
	>=virtual/perl-Test-Simple-0.88
	>=virtual/perl-Module-Build-0.36.01
	virtual/perl-File-Temp
"
RDEPEND="
	${COMMON_DEPEND}
"
SRC_TEST="do"