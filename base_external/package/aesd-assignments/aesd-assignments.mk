##############################################################
#
# AESD-ASSIGNMENTS
#
##############################################################

# Assignment 3 repository git reference
AESD_ASSIGNMENTS_VERSION = ccf80d9e647ae3148046a29c0f5ab049b0bebeb6
# Use SSH URL to allow access with SSH keys
AESD_ASSIGNMENTS_SITE = git@github.com:cu-ecen-aeld/assignments-3-and-later-juanpgg-git.git
AESD_ASSIGNMENTS_SITE_METHOD = git
AESD_ASSIGNMENTS_GIT_SUBMODULES = YES

define AESD_ASSIGNMENTS_BUILD_CMDS
	# Build your aesdsocket application
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/server aesdsocket
endef

define AESD_ASSIGNMENTS_INSTALL_TARGET_CMDS
	# Install configuration files
	$(INSTALL) -d 0755 $(@D)/conf/ $(TARGET_DIR)/etc/finder-app/conf/
	$(INSTALL) -m 0755 $(@D)/conf/* $(TARGET_DIR)/etc/finder-app/conf/
	
	# Install test and utility scripts
	$(INSTALL) -m 0755 $(@D)/assignment-autotest/test/assignment4/* $(TARGET_DIR)/bin
	$(INSTALL) -m 0755 $(@D)/finder-app/writer $(TARGET_DIR)/usr/bin/
	$(INSTALL) -m 0755 $(@D)/finder-app/finder.sh $(TARGET_DIR)/usr/bin/
	$(INSTALL) -m 0755 $(@D)/finder-app/finder-test.sh $(TARGET_DIR)/usr/bin/
	
	# Install aesdsocket executable
	$(INSTALL) -m 0755 $(@D)/server/aesdsocket $(TARGET_DIR)/usr/bin/aesdsocket
	
	# Install aesdsocket-start-stop script
	$(INSTALL) -D -m 0755 $(@D)/server/aesdsocket-start-stop $(TARGET_DIR)/etc/init.d/S99aesdsocket
endef

$(eval $(generic-package))

