THEOS_DEVICE_IP = 192.168.2.6
ARCHS = armv7 arm64

TARGET = iphone:clang:latest:6.0

include theos/makefiles/common.mk

TWEAK_NAME = PowerColor
PowerColor_FILES = Tweak.xm
PowerColor_FRAMEWORKS = UIKit CoreGraphics QuartzCore
PowerColor_LIBRARIES = colorpicker

include $(THEOS_MAKE_PATH)/tweak.mk
THEOS_PACKAGE_BASE_VERSION = 1.2
_THEOS_INTERNAL_PACKAGE_VERSION = 1.2

after-install::
	install.exec "cd /var/mobile/Library/Caches/com.apple.UIStatusBar; rm -R -f images; rm -f version; killall -9 SpringBoard"
SUBPROJECTS += powercolor
include $(THEOS_MAKE_PATH)/aggregate.mk
