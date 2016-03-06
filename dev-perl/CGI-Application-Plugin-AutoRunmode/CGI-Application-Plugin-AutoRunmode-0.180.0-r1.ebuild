# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$
EAPI=5
MODULE_AUTHOR=THILO
MODULE_VERSION=0.18
inherit perl-module

DESCRIPTION="CGI::App plugin to automatically register runmodes"

SLOT="0"
KEYWORDS="~amd64 ~x86"

IUSE=""
RDEPEND="
	>=dev-perl/CGI-Application-3.0.0
"
DEPEND="${RDEPEND}"
