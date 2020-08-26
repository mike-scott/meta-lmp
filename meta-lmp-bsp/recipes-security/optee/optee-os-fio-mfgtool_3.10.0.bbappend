OPTEEMACHINE_apalis-imx6 = "imx-mx6qapalis"

EXTRA_OEMAKE_append_imx = " \
    CFG_CAAM_DBG=0x001 \
    CFG_NXP_WORKAROUND_CAAM_LOCKED_BY_HAB=y \
"
EXTRA_OEMAKE_append_apalis-imx6 = " \
    CFG_NXP_CAAM=y CFG_IMX_CAAM=n \
    CFG_NS_ENTRY_ADDR=0x17800000 CFG_IMX_WDOG_EXT_RESET=y CFG_RNG_PTA=y \
    CFG_TZDRAM_START=0x4e000000 CFG_CORE_DYN_SHM=n CFG_OVERLAY_ADDR=0x16000000 \
    CFG_OVERLAY_RESERVED_MEMORY_ADDRESS_CELLS=1 CFG_OVERLAY_RESERVED_MEMORY_SIZE_CELLS=1 \
"