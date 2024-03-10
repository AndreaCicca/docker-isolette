#!/bin/bash

cd /Isolette/Code

if [[ "$1" == "run" ]]
then
	cd Test
	./run_all_ut.sh && ./run_all_scenarios.sh
else
	./prepare.sh && ./build.sh
	if [[ $? -eq 0 ]]
	then
		echo -e "\e[1;32mBuild successfully\!\e[0m "
	else
		echo -e "\e[1;31mBuild failed\!\e[0m "
	fi
fi
