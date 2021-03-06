# Provided by meta-lmp-bsp or any other compatible BSP layer
include conf/machine/include/lmp-machine-custom.inc

# Allow customizations per factory level
include conf/machine/include/lmp-factory-custom.inc

# Done as a rootfs post process hook in order to be part of the ostree image
sota_fstab_update() {
	if [ -n "${EFI_PROVIDER}" ]; then
		echo "LABEL=efi /boot/efi vfat umask=0077 0 1" >> ${IMAGE_ROOTFS}/etc/fstab
	fi
}

ROOTFS_POSTPROCESS_COMMAND += "sota_fstab_update; "

# Support initial customized target via GARAGE_CUSTOMIZE_TARGET
# This is set by our CI scripts and allows the initial target to populated by
# the build process so it can be incorporated at the first aktualizr-lite run
IMAGE_CMD_ota_append () {
	if [ -n "${GARAGE_CUSTOMIZE_TARGET}" ]; then
		bbplain "Running command(${GARAGE_CUSTOMIZE_TARGET}) to customize target"
		${GARAGE_CUSTOMIZE_TARGET} \
		${OTA_SYSROOT}/ostree/deploy/${OSTREE_OSNAME}/var/sota/import/installed_versions \
			${GARAGE_TARGET_NAME}-${target_version}
	fi
}
