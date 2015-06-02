# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $
EAPI=5
MODULE_AUTHOR=ETHER
MODULE_VERSION=1.003005
inherit perl-module

DESCRIPTION='use Cpanel::JSON::XS with a fallback to JSON::XS and JSON::PP'
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+recommended test"

# Scalar::Util -> Scalar-List-Utils
RDEPEND="
	recommended? (
		>=dev-perl/Cpanel-JSON-XS-2.331.0
	)
	virtual/perl-Carp
	>=virtual/perl-JSON-PP-2.272.20
	virtual/perl-Scalar-List-Utils
"
DEPEND="
	>=virtual/perl-ExtUtils-CBuilder-0.270.0
	virtual/perl-ExtUtils-MakeMaker
	virtual/perl-File-Spec
	virtual/perl-File-Temp
	test? (
		>=virtual/perl-Test-Simple-0.880.0
		>=dev-perl/Test-Without-Module-0.170.0
	)
"