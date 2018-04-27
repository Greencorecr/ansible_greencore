#!/bin/bash

ans=$(zenity --width=330 --height=300 --list  --text "¿Cuales equipos desea activar?" --checklist  --column "Seleccione" --column "Equipo" \
	TRUE "Estacion #01 (6c:0b:84:09:ff:9e)" \
	TRUE "Estacion #02 (6c:0b:84:09:ff:5c)" \
	TRUE "Estacion #03 (6c:0b:84:09:fb:f5)" \
	TRUE "Estacion #04 (6c:0b:84:0a:03:a6)" \
	TRUE "Estacion #05 (6c:0b:84:09:ff:dd)" \
	TRUE "Estacion #06 (6c:0b:84:09:ff:76)" \
	TRUE "Estacion #07 (6c:0b:84:09:ff:4e)" \
	TRUE "Estacion #08 (6c:0b:84:08:f2:56)" \
	 --separator=";" 2>/dev/null)

cant=$(echo $ans | gawk -F\; '{print NF}')


for estacion in $(seq $cant)
do
	echo $ans | gawk -v estacion=$estacion -F\; '{print "wakeonlan",substr($estacion,15,17)}' |bash
done
