#!/bin/bash

cd /Isolette/Code
## TODO: Handle build path

if [[ "$1" == "run" ]]
then
	cd Test
	## TODO: Handle ut output (no return value)
	(./run_all_ut.sh && echo -e '\e[1;32mUt ran successfully!\e[0m \U2705') || echo -e '\e[1;31mUt failed!\\e[0m \u274e\nExit code: $?'
	(./run_all_scenarios.sh && echo -e '\e[1;32mScenarios ran successfully!\e[0m \U2705') || echo -e '\e[1;31mScenarios failed!\e[0m \u274e\nExit code: $?'
	#./run_all_ut.sh && ./run_all_scenarios.sh
else
	./prepare.sh && ./build.sh
	if [[ $? -eq 0 ]]
	then
		echo -e "\e[1;32mBuild successfully\!\e[0m "
	else
		echo -e "\e[1;31mBuild failed\!\e[0m "
	fi
fi
