# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"
ESVN_REPO_URI="https://svn.parrot.org/parrot/trunk"
ESVN_RESTRICT="export"
inherit subversion;

DESCRIPTION="A virtual machine designed to efficiently compile and execute bytecode for dynamic languages"
HOMEPAGE="http://www.parrot.org/"
SRC_URI=""

LICENSE="Artistic-2"
SLOT="0"
KEYWORDS=""
IUSE="opengl nls doc examples gdbm gmp ssl unicode pcre"

RDEPEND="
	opengl?  ( virtual/glut )
	nls?     ( sys-devel/gettext )
	unicode? ( >=dev-libs/icu-2.6 )
	gdbm?    ( >=sys-libs/gdbm-1.8.3-r1 )
	gmp?     ( >=dev-libs/gmp-4.1.4 )
	ssl?     ( dev-libs/openssl )
	pcre?    ( dev-libs/libpcre )
"

DEPEND="
	dev-lang/perl[doc?]
	${RDEPEND}
"

src_unpack(){
	# This is pretty nasty,
	# but svn builds need to have a working ability to call
	# 'svn info' to get revision data
	subversion_src_unpack
	cd "${wc_path}" || die "${ESVN}: can't chdir to ${wc_path}"

	local S="${S}/${S_dest}"
	mkdir -p "${S}"

	# export to the ${WORKDIR}
	#*  "svn export" has a bug.  see http://bugs.gentoo.org/119236
	#* svn export . "${S}" || die "${ESVN}: can't export to ${S}."
	rsync -rlpgo . "${S}/" || die "${ESVN}: can't export to ${S}."

}
src_prepare() {
	sed -e "s:/lib/:/$(get_libdir)/:" -i "${S}/tools/dev/install_files.pl"
}

src_configure() {
	myconf=""
	use unicode || myconf="$myconf --without-icu"
	use ssl || myconf="$myconf --without-crypto"
	use gdbm || myconf="$myconf --without-gdbm"
	use nls || myconf="$myconf --without-gettext"
	use gmp || myconf="$myconf --without-gmp"
	use opengl || myconf="$myconf --without-opengl"
	use pcre || myconf="$myconf --without-pcre"

	perl Configure.pl --prefix=/usr \
		--libdir=/usr/$(get_libdir) \
		--sysconfdir=/etc \
		--sharedstatedir=/var/lib/parrot \
		$myconf
}
src_compile() {
	local parrotv=$( ./parrot_config revision );
	einfo "Building parrot $parrotv";
	emake || die
	use doc && make html
	local parrotv=$( ./parrot_config revision );
	einfo "Successfully build $parrotv";
}
src_install() {
	emake	install-dev DESTDIR="${D}" DOC_DIR="/usr/share/doc/${P}" || die
}
src_test() {
	emake	coretest || die "Tests Failed"
}
