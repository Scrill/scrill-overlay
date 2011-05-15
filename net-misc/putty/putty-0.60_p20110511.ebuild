# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit autotools toolchain-funcs

MY_P="${P/_p*/}-2011-05-11"

DESCRIPTION="UNIX port of the famous Telnet and SSH client"
HOMEPAGE="http://www.chiark.greenend.org.uk/~sgtatham/putty/"
SRC_URI="http://tartarus.org/~simon/putty-snapshots/${MY_P}.tar.gz"
LICENSE="MIT"

SLOT="0"
KEYWORDS="~alpha ~amd64 ~ppc ~sparc ~x86"
IUSE="doc ipv6 kerberos"

RDEPEND="
	!net-misc/pssh
	dev-libs/glib
	kerberos? ( virtual/krb5 )
	x11-libs/gdk-pixbuf
	x11-libs/gtk+:2
	x11-libs/libX11
	x11-libs/pango
"
DEPEND="${RDEPEND} dev-lang/perl"

S="${WORKDIR}/${MY_P}"

src_prepare() {
	cd "${S}"/unix || die "cd unix failed"
	sed \
		-i configure.ac \
		-e '/^AM_PATH_GTK(/d' \
		-e 's|-Wall -Werror||g' || die "sed failed"
	eautoreconf
}

src_configure() {
	cd "${S}"/unix || die "cd failed"
	econf \
		$(use_with kerberos gssapi) \
		|| die "econf failed"
}

src_compile() {
	cd "${S}"/unix || die "cd unix failed"
	emake \
		$(use ipv6 || echo COMPAT=-DNO_IPV6) \
		VER=-DSNAPSHOT=${PV} \
		|| die "emake failed"
}

src_install() {
	if use doc; then
		dodoc doc/puttydoc.txt || die "dodoc failed"
		dohtml doc/*.html || die "dohtml failed"
	fi

	cd "${S}"/unix
	emake DESTDIR="${D}" install || die "install failed"

	# install desktop file provided by Gustav Schaffter in #49577
	doicon "${FILESDIR}"/${PN}.xpm
	make_desktop_entry "putty" "PuTTY" putty "Network"
}