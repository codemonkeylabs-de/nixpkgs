{ stdenv
, fetchFromGitHub
, cmake
, gdk_pixbuf
, gtk3
, gettext
, ninja
, pantheon
, pkgconfig
, json-glib
, libgudev
, libevdev
, libgee
, libsoup
, wrapGAppsHook }:

stdenv.mkDerivation rec {
  pname = "spice-up";
  version = "1.8.0";

  src = fetchFromGitHub {
    owner = "Philip-Scott";
    repo = "Spice-up";
    rev = version;
    sha256 = "0jbqgf936pqss8ha27fcyjbhvkn4ij96b3d87c6gcx90glmq33zb";
  };

  USER = "pbuilder";

  nativeBuildInputs = [
    cmake
    gettext
    ninja
    pkgconfig
    pantheon.vala
    wrapGAppsHook
  ];
  buildInputs = [
    pantheon.elementary-icon-theme
    pantheon.granite
    gdk_pixbuf
    gtk3
    json-glib
    libevdev
    libgee
    libgudev
    libsoup
  ];

  meta = with stdenv.lib; {
    description = "Create simple and beautiful presentations";
    homepage = https://github.com/Philip-Scott/Spice-up;
    maintainers = with maintainers; [ samdroid-apps kjuvi ] ++ pantheon.maintainers;
    platforms = platforms.linux;
    # The COPYING file has GPLv3; some files have GPLv2+ and some have GPLv3+
    license = licenses.gpl3Plus;
  };
}
