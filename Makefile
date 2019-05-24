ARCHS = arm64 arm64e armv7
SDK = iPhoneOS12.1.2
FINALPACKAGE = 1

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = Bezon
Bezon_FILES = Tweak.xm
Bezon_FRAMEWORKS = UIKit CoreGraphics AVFoundation AudioToolbox
Bezon_EXTRA_FRAMEWORKS += Cephei
Bezon += -Wl,-segalign,4000
Bezon_CFLAGS = -Wno-deprecated -Wno-deprecated-declarations -Wno-error

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
SUBPROJECTS += Bezon_prefs
include $(THEOS_MAKE_PATH)/aggregate.mk
