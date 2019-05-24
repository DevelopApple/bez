ARCHS = arm64 arm64e armv7

include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = Bezon
Bezon_FILES = Bezon.mm
Bezon_INSTALL_PATH = /Library/PreferenceBundles
Bezon_FRAMEWORKS = UIKit MessageUI CoreGraphics AVFoundation AudioToolbox
Bezon_PRIVATE_FRAMEWORKS = Preferences
Bezon_EXTRA_FRAMEWORKS += CepheiPrefs
Bezon_CFLAGS = -Wno-deprecated -Wno-deprecated-declarations -Wno-error

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/Bezon.plist$(ECHO_END)
