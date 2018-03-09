#!/bin/bash

echo "Building and Loading Policy"
set -x
make -f /usr/share/selinux/devel/Makefile web.pp || exit
/usr/sbin/semodule -i web.pp

sepolicy manpage -p . -d web_t
/sbin/restorecon -F -R -v /workshop/website

pwd=$(pwd)
rpmbuild --define "_sourcedir ${pwd}" --define "_specdir ${pwd}" --define "_builddir ${pwd}" --define "_srcrpmdir ${pwd}" --define "_rpmdir ${pwd}" --define "_buildrootdir ${pwd}/.build"  -ba web_selinux.spec
