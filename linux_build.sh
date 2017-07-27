#!/bin/sh
################################################################################
#      This file is part of unRAID USB Creator - https://github.com/limetech/usb-creator
#      Copyright (C) 2016 Team LibreELEC
#      Copyright (C) 2017 Lime Technology, Inc
#
#  unRAID USB Creator is free software: you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation, either version 2 of the License, or
#  (at your option) any later version.
#
#  unRAID USB Creator is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with unRAID USB Creator.  If not, see <http://www.gnu.org/licenses/>.
################################################################################

set -e

echo ""
if [ "$1" = "32" ]; then
  echo "Building 32 bit version..."
  QT_DIR=~/Qt/5.9-static-32
else
  echo "Building 64 bit version..."
  QT_DIR=~/Qt/5.9-static-64
fi

export PATH=$QT_DIR/bin:$QT_DIR/../5.8/gcc_64/bin:$PATH

echo ""
echo "Creating .qm files"
lrelease creator.pro

echo ""
echo "Running qmake..."
qmake

echo ""
echo "Building..."
make -j4

echo ""
echo "  To run application directly type"
if [ "$1" = "32" ]; then
  mv unRAID.USB.Creator.Linux-bit.bin unRAID.USB.Creator.Linux-32bit.bin
  echo "    sudo ./unRAID.USB.Creator.Linux-32bit.bin"
else
  mv unRAID.USB.Creator.Linux-bit.bin unRAID.USB.Creator.Linux-64bit.bin
  echo "    sudo ./unRAID.USB.Creator.Linux-64bit.bin"
fi
echo ""
echo "Finished..."
echo ""

exit 0
