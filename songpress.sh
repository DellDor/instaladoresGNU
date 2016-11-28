#!/bin/bash
#Instalador con packagekit de manejador de letras con acordes en formato chrodpro
#http://www.skeed.it/songpress
#HACER: como asociar el tipo de archivos .crd .chordpro

#if ! dpkg-query -l python-wxtools > /dev/null; then
if ! LANGUAGE=C pkcon search name python-wxtools| grep Installed > /dev/null; then
echo "Instalando paquete requerido"
pkcon install python-wxtools
fi

archivo=/var/tmp

wget -P $archivo -Nc https://github.com/lallulli/songpress/archive/master.zip

unzip $archivo/master.zip -d /tmp/spress

if [ ! -e /opt/songpress/ ]; then
sudo sh -c "mkdir -p /opt/songpress"
fi

sudo sh -c "cp -vur /tmp/spress/songpress-master/src/* /opt/songpress
chmod a+x /opt/songpress/main.py"

#Crea acceso en escritorio y menú
cat <<EOD >/usr/share/applications/songpress.desktop
#!/usr/bin/env xdg-open
[Desktop Entry]
Version=1.0
Name=Songpress
Comment=Lyrics with chords editor
Comment[es]=Editor de letras con acordes
Path=/opt/songpress
Exec=python main.py
Type=Application
Terminal=false
Icon=/opt/songpress/img/songpress.png
Categories=AudioVideo;
EOD

sudo cp -v /usr/share/applications/songpress.desktop $(xdg-user-dir DESKTOP)/songpress.desktop 
sudo chmod a+x {/usr/share/applications,$(xdg-user-dir DESKTOP)}/songpress.desktop
sudo update-menus; sudo xdg-desktop-menu forceupdate
