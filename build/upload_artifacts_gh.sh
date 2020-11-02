#!/bin/bash
#
#
# Upload dist artifacts to GH Release assets
#
#

# REPO here is only necessary for forks. It can be removed when this is merged into the original repo
REPO=$1
echo "===> Uploading to GH ${REPO}:${TAG}"

cd dist
files=$(find . -regex ".*\.\(msi\|rpm\|deb\|zip\|tar.gz\)")
echo "===> found files: ${files}"
for package in files;do
  echo "===> Uploading package: ${package}"
  gh release upload ${TAG} ${package} -R ${REPO}
done
