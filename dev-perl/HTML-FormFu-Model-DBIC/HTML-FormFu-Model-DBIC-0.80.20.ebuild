# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

MODULE_AUTHOR=CFRANKS
MODULE_VERSION="0.08002"
inherit perl-module

DESCRIPTION="HTML Form Creation, Rendering and Validation Framework"
LICENSE="|| ( Artistic GPL-2 )"

SLOT="0"
KEYWORDS="~amd64 ~x86"

IUSE="test"
COMMON_DEPEND="
	dev-perl/DBD-SQLite
	>=dev-perl/DBIx-Class-0.81.80
	>=dev-perl/HTML-FormFu-0.50.0
	dev-perl/List-MoreUtils
	dev-perl/Task-Weaken
	dev-perl/YAML-Syck
"
DEPEND="
	${COMMON_DEPEND}
	test? (
		dev-perl/DateTime-Format-SQLite
		dev-perl/SQL-Translator
	)
"
RDEPEND="
	${COMMON_DEPEND}
"

SRC_TEST=do
