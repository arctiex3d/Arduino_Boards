#!/bin/bash 
# This bash script is used to prepare the "package_3dxfab_index.json"
# 
# Supported OS: Windows 10, Linux64 bit
# Beta OS: Linux32 bit
#
# 13, Sep 2020, bowee, Initial for 3DXFAB


# Get version from 3dxfabboards.version file
VERSION=$(head -1 3dxfabboards.version|cut -d ' ' -f1)
# rename temporaray "3dxfabboards" folder to include version number
mv 3dxfabboards 3dxfabboards-$VERSION
# compress 3dxfabboards-$VERSION folder
tar -cjf 3dxfabboards-$VERSION.tar.bz2 3dxfabboards-$VERSION
# rename 3dxfabboards-$VERSION back to 3dxfabboards as it makes follow changes easier in Github, cimmits/blame/history
mv 3dxfabboards-$VERSION 3dxfabboards
# get size of the compressed file for JSO
SIZE=$(wc -c 3dxfabboards-$VERSION.tar.bz2|cut -d ' ' -f1)

#get sha256 checksum
SHA256=$(sha256sum 3dxfabboards-$VERSION.tar.bz2|cut -d ' ' -f1)


echo "Version         : "$VERSION" to build"
echo ""
echo "Please don't forget to create new version file 3dxfabboards-"$VERSION".MD"
sleep 5
echo "Please use following values to edit JSON file"
echo ""
echo "ArchiveFileName : 3dxfabboards-"$VERSION".tar.bz2"
echo "SHA256 checksum : "$SHA256
echo "Size            : "$SIZE
echo "online          : 3dxfabboards-"$VERSION".MD"
sleep 30
