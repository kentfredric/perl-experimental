# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"
inherit git

EGIT_REPO_URI='git://github.com/rakudo/rakudo.git'
DESCRIPTION="Rakudo: A Perl6 Runtime"
HOMEPAGE="rakudo.org"
SRC_URI=""

LICENSE="Artistic-2"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="
	>=dev-lang/parrot-9000
"
RDEPEND="${DEPEND}"

src_configure(){
	perl ./Configure.pl --parrot-config="${ROOT}usr/bin/parrot_config" \
		|| die	"Configure failed"
}
src_install(){
	emake install DESTDIR="${D}" DOCDIR="/usr/share/doc/${P}" || die "Cant Install"
}
src_compile(){
	emake all || die "Failed to compile"
}
src_test(){
	emake test || die "Failed Tests"
}
