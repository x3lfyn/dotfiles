# Custom packages, that can be defined similarly to ones from nixpkgs
# You can build them using 'nix build .#example' or (legacy) 'nix-build -A example'
{pkgs ? (import ../nixpkgs.nix) {}}: {
  # example = pkgs.callPackage ./example { };

  kanagawa-gtk-theme-lcl = pkgs.stdenv.mkDerivation rec {
    name = "kanagawa-gtk-theme-unstable-lcl";

    src = pkgs.fetchFromGitHub {
      owner = "Fausto-Korpsvart";
      repo = "Kanagawa-GKT-Theme";
      rev = "35936a1e3bbd329339991b29725fc1f67f192c1e";
      sha256 = "sha256-BZRmjVas8q6zsYbXFk4bCk5Ec/3liy9PQ8fqFGHAXe0=";
    };

    propagatedUserEnvPkgs = [pkgs.gtk-engine-murrine];

    dontBuild = true;

    installPhase = ''
            runHook preInstall
      mkdir -p $out/share/themes
      cp -a themes/* $out/share/themes
      runHook postInstall;
    '';
  };
  google-sans-display = pkgs.stdenv.mkDerivation rec {
    name = "Google Sans Display font";
    src = [./google-sans-display.ttf];

    unpackPhase = ''
      for srcFile in $src; do
        cp $srcFile $(stripHash $srcFile)
      done
    '';

    installPhase = ''
      mkdir -p $out/share/fonts/truetype
      cp -a *.ttf $out/share/fonts/truetype/
    '';
  };
  jetbrainsmono-nf-ligs = pkgs.stdenv.mkDerivation rec {
    name = "JetBrains Mono Nerd font with ligatures";
    src = [./jetbrainsmono-nf-ligs.ttf];

    unpackPhase = ''
      for srcFile in $src; do
        cp $srcFile $(stripHash $srcFile)
      done
    '';

    installPhase = ''
      mkdir -p $out/share/fonts/truetype
      cp -a *.ttf $out/share/fonts/truetype/
    '';
  };

  packettracer = pkgs.stdenvNoCC.mkDerivation {
    name = "packettracer";
    pname = "packettracer";
    src = pkgs.requireFile {
      name = "CiscoPacketTracer_820_Ubuntu_64bit.deb";
      sha256 = "sha256-QoM4rDKkdNTJ6TBDPCAs+l17JLnspQFlly9B60hOB7o=";
      url = "http://example.com";
    };
    unpackPhase = ''
      runHook preUnpack

      dpkg-deb -x $src $out
      chmod 755 "$out"

      runHook postUnpack
    '';

    nativeBuildInputs = with pkgs; [
      autoPatchelfHook
      copyDesktopItems
      dpkg
      makeWrapper
      qt5.wrapQtAppsHook
    ];

    buildInputs = with pkgs; [
      alsa-lib
      dbus
      expat
      fontconfig
      glib
      qt5.qtbase
      qt5.qtmultimedia
      qt5.qtnetworkauth
      qt5.qtscript
      qt5.qtspeech
      qt5.qtwebengine
      qt5.qtwebsockets
    ];

    installPhase = ''
      runHook preInstall

      makeWrapper "$out/opt/pt/bin/PacketTracer" "$out/bin/packettracer8" \
        "''${qtWrapperArgs[@]}" \
        --prefix LD_LIBRARY_PATH : "$out/opt/pt/bin"

      install -D $out/opt/pt/art/app.png $out/share/icons/hicolor/128x128/apps/ciscoPacketTracer8.png

      rm $out/opt/pt/bin/libQt5* -f

      runHook postInstall
    '';

    desktopItems = [
      (pkgs.makeDesktopItem {
        name = "cisco-pt8.desktop";
        desktopName = "Cisco Packet Tracer 8";
        icon = "ciscoPacketTracer8";
        exec = "packettracer8 %f";
        mimeTypes = [
          "application/x-pkt"
          "application/x-pka"
          "application/x-pkz"
        ];
      })
    ];

    dontWrapQtApps = true;

    meta = with pkgs.lib; {
      description = "Network simulation tool from Cisco";
      homepage = "https://www.netacad.com/courses/packet-tracer";
      sourceProvenance = with sourceTypes; [binaryNativeCode];
      license = licenses.unfree;
      maintainers = with maintainers; [lucasew];
      platforms = ["x86_64-linux"];
    };
  };
}
