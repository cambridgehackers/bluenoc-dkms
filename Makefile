PKG_NAME=bluenoc-dkms
VERSION=2015.09

all:
	echo nothing to make

install:
	make -C src install-dkms

spkg:
	git clean -fdx
	git checkout debian
	sed -i s/trusty/precise/g debian/changelog
	git buildpackage --git-upstream-branch=master --git-debian-branch=ubuntu --git-ignore-new -S -tc '--git-upstream-tag=v%(version)s'
	git clean -fdx
	sed -i s/precise/trusty/g debian/changelog
	git buildpackage --git-upstream-branch=master --git-debian-branch=ubuntu --git-ignore-new -S -tc '--git-upstream-tag=v%(version)s'
	git checkout debian
	sed -i s/precise/vivid/g debian/changelog
	git buildpackage --git-upstream-branch=master --git-debian-branch=ubuntu --git-ignore-new -S -tc '--git-upstream-tag=v%(version)s'
	git checkout debian
	sed -i s/precise/stable/g debian/changelog
	git buildpackage --git-upstream-branch=master --git-debian-branch=ubuntu --git-ignore-new -S -tc '--git-upstream-tag=v%(version)s'
	git checkout debian

upload:
	git push origin v$(VERSION)
	rm -fv ../bluenoc-dkms_$(VERSION)*stable*
	dput ppa:jamey-hicks/connectal ../bluenoc-dkms_$(VERSION)-*_source.changes
