#!/bin/bash

ans=$(zenity --width=330 --height=300 --list  --text "¿Cuales equipos desea activar?" --checklist  --column "Seleccione" --column "Equipo" \
	TRUE "Estacion #01 (94:57:a5:b4:d5:18)" \
	TRUE "Estacion #02 (1c:98:ec:52:4a:30)" \
	TRUE "Estacion #03 (1c:98:ec:52:4a:38)" \
	TRUE "Estacion #04 (1c:98:ec:52:4a:60)" \
	TRUE "Estacion #05 (1c:98:ec:52:3e:c0)" \
	TRUE "Estacion #06 (1c:98:ec:52:4a:14)" \
	TRUE "Estacion #07 (1c:98:ec:52:4a:90)" \
	TRUE "Estacion #08 (1c:98:ec:52:4a:cc)" \
	TRUE "Estacion #09 (1c:98:ec:52:48:4c)" \
	TRUE "Estacion #10 (6c:0b:84:98:08:aa)" \
	 --separator=";" 2>/dev/null)

cant=$(echo $ans | gawk -F\; '{print NF}')


for estacion in $(seq $cant)
do
	echo $ans | gawk -v estacion=$estacion -F\; '{print "wakeonlan",substr($estacion,15,17)}' |bash
done
