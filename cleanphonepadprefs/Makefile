include $(THEOS)/makefiles/common.mk

SDKVERSION=11.2
SYSROOT = $(THEOS)/sdks/iPhoneOS11.2.sdk
BUNDLE_NAME = cleanphonepadprefs
cleanphonepadprefs_FILES = fppRootListController.m
cleanphonepadprefs_INSTALL_PATH = /Library/PreferenceBundles
cleanphonepadprefs_FRAMEWORKS = UIKit
cleanphonepadprefs_PRIVATE_FRAMEWORKS = Preferences

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/CleanPhonePad_prefs.plist$(ECHO_END)
