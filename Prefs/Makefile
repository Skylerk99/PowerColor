ARCHS = armv7 arm64

TARGET = iphone:clang:latest:6.0

include theos/makefiles/common.mk

BUNDLE_NAME = powercolor
powercolor_FILES = powercolor.mm
powercolor_INSTALL_PATH = /Library/PreferenceBundles
powercolor_FRAMEWORKS = UIKit
powercolor_PRIVATE_FRAMEWORKS = Preferences
powercolor_LIBRARIES = colorpicker
include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/powercolor.plist$(ECHO_END)
