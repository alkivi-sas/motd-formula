/etc/motd:
  file.absent

/var/run/motd.dynamic:
  file.absent

/etc/update-motd.d:
  file.recurse:
    - source: salt://motd/files/update.d
    - dir_mode: 0755
    - file_mode: '0755'

/etc/profile.d/display_motd.sh:
  file.managed:
    - user: root
    - group: root
    - mode: 755
    - source: salt://motd/files/display_motd.sh

/etc/motd.d:
  file.directory:
    - user: root
    - group: root
    - mode: 755
