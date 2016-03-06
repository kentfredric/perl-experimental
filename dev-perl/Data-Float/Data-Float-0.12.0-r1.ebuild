# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$
EAPI=5
MODULE_AUTHOR=ZEFRAM
MODULE_VERSION=0.012
inherit perl-module

DESCRIPTION='details of the floating point data type'

SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
perl_meta_configure() {
	# Module::Build
	echo dev-perl/Module-Build
	# perl 5.006 ( 5.6.0 )
	echo \>=dev-lang/perl-5.6.0
	# strict
	echo dev-lang/perl
	# warnings
	echo dev-lang/perl
}
perl_meta_build() {
	# Module::Build
	echo dev-perl/Module-Build
	# Test::More
	echo virtual/perl-Test-Simple
	# perl 5.006 ( 5.6.0 )
	echo \>=dev-lang/perl-5.6.0
	# strict
	echo dev-lang/perl
	# warnings
	echo dev-lang/perl
}
perl_meta_runtime() {
	# Carp
	# echo dev-perl/Carp
	# Exporter
	echo virtual/perl-Exporter
	# constant
	# echo virtual/perl-constant
	# integer
	echo dev-lang/perl
	# parent
	echo virtual/perl-parent
	# perl 5.006 ( 5.6.0 )
	echo \>=dev-lang/perl-5.6.0
	# strict
	echo dev-lang/perl
	# warnings
	echo dev-lang/perl
}
DEPEND="
	$(perl_meta_configure)
	$(perl_meta_build)
	$(perl_meta_runtime)
"
RDEPEND="
	$(perl_meta_runtime)
"
