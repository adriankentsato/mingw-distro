#!/usr/bin/env bash

MINGW_DIR=$(dirname $0)
DIS_NAME=$(basename $0)

if [ $DIS_NAME != "set_distro_paths.sh" ]; then
	MINGW_DIR=$(dirname ${BASH_SOURCE[0]})
	DIS_NAME=$(basename ${BASH_SOURCE[0]})
fi

if test -f "$MINGW_DIR/bin/gcc.exe"; then
	if test -f "$MINGW_DIR/git/cmd/git.exe"; then
		PATH=$PATH:$MINGW_DIR/git/cmd
	fi

	PATH=$PATH:$MINGW_DIR/bin

	X_MEOW=$MINGW_DIR/include:$MINGW_DIR/include/freetype2

	if [[ -z $C_INCLUDE_PATH ]]; then
		C_INCLUDE_PATH=$X_MEOW
	else
		C_INCLUDE_PATH=$C_INCLUDE_PATH:$X_MEOW
	fi

	if [[ -z $CPLUS_INCLUDE_PATH ]]; then
		CPLUS_INCLUDE_PATH=$X_MEOW
	else
		CPLUS_INCLUDE_PATH=$CPLUS_INCLUDE_PATH:$X_MEOW
	fi

	X_MEOW=""

else
	echo "ERROR: You must run $DIS_NAME from the root of the distro."
	echo "       Don't copy or move this batch file."
fi

