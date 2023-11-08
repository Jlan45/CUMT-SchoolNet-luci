include $(TOPDIR)/rules.mk

PKG_NAME:=cumtlogin
PKG_VERSION:=1.0.0
PKG_RELEASE:=1

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)

include $(INCLUDE_DIR)/package.mk

define Package/cumtlogin
    SECTION:=utils
    CATEGORY:=Utilities
    TITLE:=Cumtlogin Script
	PKGARCH:=all
    URL:=https://github.com/Jlan45/cumtlogin
    MAINTAINER:=J1an
endef

define Package/cumtlogin/description
    This package contains LuCI configuration pages for cumtlogin.
endef

define Package/cumtlogin/install
    $(INSTALL_DIR) $(1)/etc/config
    $(INSTALL_DIR) $(1)/etc/init.d
    $(INSTALL_DIR) $(1)/usr/lib/lua/luci/model/cbi
    $(INSTALL_DIR) $(1)/usr/lib/lua/luci/controller
    $(INSTALL_DIR) $(1)/usr/sbin

    $(INSTALL_CONF) ./files/config/cumtlogin $(1)/etc/config/cumtlogin
    $(INSTALL_BIN) ./files/init.d/cumtlogin $(1)/etc/init.d/cumtlogin
    $(INSTALL_DATA) ./files/model/cbi/cumtlogin.lua $(1)/usr/lib/lua/luci/model/cbi/cumtlogin.lua
    $(INSTALL_DATA) ./files/controller/cumtlogin.lua $(1)/usr/lib/lua/luci/controller/cumtlogin.lua
    $(INSTALL_BIN) ./files/sbin/cumtlogin $(1)/usr/sbin/cumtlogin
endef

$(eval$(call BuildPackage,$(PKG_NAME)))