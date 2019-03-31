include ~/theos/makefiles/common.mk

PACKAGE_VERSION=1.0
TWEAK_NAME = CleanPhonePad
CleanPhonePad_FILES = Tweak.xm

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
SUBPROJECTS += cleanphonepadprefs
include $(THEOS_MAKE_PATH)/aggregate.mk
