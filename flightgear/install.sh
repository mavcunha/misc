#!/bin/bash

FG_APP=/Applications/FlightGear.app/Contents/Resources
FG_DATA=${FG_APP}/data
FG_SONY=${FG_DATA}/Input/Joysticks/Sony

echo "Putting files into place"

cp -v joysticks.xml ${FG_DATA}

[ ! -d ${FG_SONY} ] && mkdir -p ${FG_SONY}

cp -v ps3.xml ${FG_SONY}
