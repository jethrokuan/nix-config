{config, pkgs, ...}:

{
  environment.systemPackages = with pkgs; [
    gnome3.defaultIconTheme
    gnome3.gnome_themes_standard
    udiskie
    udisks2
  ];

  security.polkit.enable = true;
  
  security.polkit.extraConfig = ''
    polkit.addRule(function(action, subject) {
      var YES = polkit.Result.YES;
      var permission = {
        // required for udisks1:
        "org.freedesktop.udisks.filesystem-mount": YES,
        "org.freedesktop.udisks.luks-unlock": YES,
        "org.freedesktop.udisks.drive-eject": YES,
        "org.freedesktop.udisks.drive-detach": YES,
        // required for udisks2:
        "org.freedesktop.udisks2.filesystem-mount": YES,
        "org.freedesktop.udisks2.filesystem-mount-system": YES,
        "org.freedesktop.udisks2.encrypted-unlock": YES,
        "org.freedesktop.udisks2.eject-media": YES,
        "org.freedesktop.udisks2.power-off-drive": YES,
        // required for udisks2 if using udiskie from another seat (e.g. systemd):
        "org.freedesktop.udisks2.filesystem-mount-other-seat": YES,
        "org.freedesktop.udisks2.filesystem-unmount-others": YES,
        "org.freedesktop.udisks2.encrypted-unlock-other-seat": YES,
        "org.freedesktop.udisks2.eject-media-other-seat": YES,
        "org.freedesktop.udisks2.power-off-drive-other-seat": YES
      };
      if (subject.isInGroup("wheel")) {
        return permission[action.id];
      }
    });
  '';

  systemd.user.services.udiskie = {
    enable = true;
    description = "Removable disk automounter";
    wantedBy = [ "default.target" ];
    path = with pkgs; [
      gnome3.defaultIconTheme
      gnome3.gnome_themes_standard
      udiskie
    ];
    environment.XDG_DATA_DIRS="${pkgs.gnome3.defaultIconTheme}/share:${pkgs.gnome3.gnome_themes_standard}/share";
    serviceConfig = {
      Restart = "always";
      ExecStart = "${pkgs.udiskie}/bin/udiskie --automount";
    };
  };
}
