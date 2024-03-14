#!/bin/bash

cd $2/Isolette/Code

if [[ "$1" == "run" ]]
then
	cd Test
	UT_OUT=$(./run_all_ut.sh)
	if [[ "$UT_OUT" == *"failed"* ]]
	then 
		echo -e '\e[1;31mUt failed!\e[0m \u274c'
	else
		echo -e '\e[1;32mUt ran successfully!\e[0m \u2705'
	fi
	#(./run_all_ut.sh && echo -e '\e[1;32mUt ran successfully!\e[0m \u2705') || echo -e '\e[1;31mUt failed!\\e[0m \u274c'
	(./run_all_scenarios.sh && echo -e '\e[1;32mScenarios ran successfully!\e[0m \u2705') || echo -e '\e[1;31mScenarios failed!\e[0m \u274c'
	#./run_all_ut.sh && ./run_all_scenarios.sh
else
	./prepare.sh && ./build.sh
	if [[ $? -eq 0 ]]
	then
		echo -e '\e[1;32mBuilt successfully!\e[0m \u2705'
	else
		echo -e '\e[1;31mBuild failed!\e[0m \u274c'
	fi
fi
