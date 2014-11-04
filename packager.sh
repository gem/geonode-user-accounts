#!/bin/bash
pkg_vers="$(python -c 'from account import __version__ ; print __version__')"
pkg_name="geonode-user-accounts"
rm -rf dist
python ./setup.py sdist
cd dist
mv "$pkg_name"-"$pkg_vers".tar.gz "$pkg_name"_"$pkg_vers".orig.tar.gz
tar zxvf "$pkg_name"_"$pkg_vers".orig.tar.gz
cd "$pkg_name"-"$pkg_vers"
cp -r ../../debian .
debuild -S

echo
echo
echo "GEM: Sources are located in ./dist directory"

exit 0