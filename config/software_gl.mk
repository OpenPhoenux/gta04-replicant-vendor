# Software GL overlay
PRODUCT_PACKAGE_OVERLAYS += vendor/replicant/overlay/software_gl

# Board doesn't feature Hardware GL
BOARD_USES_HGL := false

# Don't use hardware opengl
USE_OPENGL_RENDERER := false

# Use software rendering
PRODUCT_PROPERTY_OVERRIDES += \
	debug.sf.hw=0 \
	ro.config.disable_hw_accel=true

# Disable fancy rotation animation
PRODUCT_PROPERTY_OVERRIDES += \
	persist.sys.rotationanimation=false
