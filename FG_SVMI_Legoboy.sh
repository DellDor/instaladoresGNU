#!/bin/bash
#Guión que descarga e instala escenario de FlightGear de Maiquetía creado por Legoboy (https://github.com/legoboyvdlp/SVMI-fg-CustomScenery)  

#Descarga archivo
archivo=/var/tmp/SVMI-fg-legoboy-master.zip
wget -c https://github.com/legoboyvdlp/SVMI-fg-CustomScenery/archive/master.zip -O $archivo

#Descomprime a temporal
temporal=/tmp
unzip $archivo -d $temporal

#Elimina innecesarios
rm -v $temporal/SVMI-fg-CustomScenery-master/SVMI/*.png

#Copia a destino
sudo cp -vura $temporal/SVMI-fg-CustomScenery-master/SVMI/* /usr/share/games/flightgear
