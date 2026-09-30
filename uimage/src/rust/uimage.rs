// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#![allow(unused_imports)]
#![allow(non_snake_case)]
#![allow(non_camel_case_types)]
#![allow(irrefutable_let_patterns)]
#![allow(unused_comparisons)]

extern crate kaitai;
use kaitai::*;
use std::convert::{TryFrom, TryInto};
use std::cell::{Ref, Cell, RefCell};
use std::rc::{Rc, Weak};

/**
 * The legacy U-Boot image format (uImage), as created by `mkimage`: a 64-byte
 * header followed by the image data (e.g. a Linux kernel, a ramdisk or a
 * script). The header describes the data (OS, CPU architecture, image type,
 * compression, load and entry point addresses, name) and protects both the
 * header and the data with CRC-32 checksums.
 * 
 * U-Boot's newer FIT (Flattened Image Tree) format is not covered by this spec.
 * \sa https://github.com/u-boot/u-boot/blob/ece349ade2973e220f524ce59e59711cc919263f/include/image.h Git tag "v2026.07"
 */

#[derive(Default, Debug, Clone)]
pub struct Uimage {
    pub _root: SharedType<Uimage>,
    pub _parent: SharedType<Uimage>,
    pub _self: SharedType<Self>,
    header: RefCell<OptRc<Uimage_Uheader>>,
    data: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Uimage {
    type Root = Uimage;
    type Parent = Uimage;

    fn read<S: KStream>(
        self_rc: &OptRc<Self>,
        _io: &S,
        _root: SharedType<Self::Root>,
        _parent: SharedType<Self::Parent>,
    ) -> KResult<()> {
        *self_rc._io.borrow_mut() = _io.clone();
        self_rc._root.set(_root.get());
        self_rc._parent.set(_parent.get());
        self_rc._self.set(Ok(self_rc.clone()));
        let _rrc = self_rc._root.get_value().borrow().upgrade();
        let _prc = self_rc._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        let t = Self::read_into::<_, Uimage_Uheader>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.header.borrow_mut() = t;
        *self_rc.data.borrow_mut() = _io.read_bytes(*self_rc.header().len_image() as usize)?.into();
        Ok(())
    }
}
impl Uimage {
}
impl Uimage {
    pub fn header(&self) -> Ref<'_, OptRc<Uimage_Uheader>> {
        self.header.borrow()
    }
}
impl Uimage {
    pub fn data(&self) -> Ref<'_, Vec<u8>> {
        self.data.borrow()
    }
}
impl Uimage {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
#[derive(Debug, PartialEq, Clone)]
pub enum Uimage_MagicTypes {

    /**
     * ALLNET ALL-SG8316M.
     * \sa https://www.allnet.de/ftp-downloads/allnet/switches/all-sg8316m/all-sg8316m-version_2.2.1.zip ALLNET ALL-SG8316M firmware 2.2.1
     */
    AllnetAllSg8316m,

    /**
     * ALLNET ALL-SG8208M. OpenWrt device `allnet_all-sg8208m`.
     * \sa https://github.com/openwrt/openwrt/blob/138fabb79f8d68d65e40c8b8d0c0494b19053d0f/target/linux/realtek/image/rtl838x.mk#L10 OpenWrt, `allnet_all-sg8208m`
     * \sa https://www.allnet.de/ftp-downloads/allnet/switches/all-sg8208m/all-sg8208m-version_2.2.1_vmlinux.bix.zip ALLNET ALL-SG8208M firmware 2.2.1
     */
    AllnetAllSg8208m,

    /**
     * ALLNET ALL-SG8324M.
     * \sa https://www.allnet.de/ftp-downloads/allnet/switches/all-sg8324m/ALL_SG8324M_FW.2.2.1.zip ALLNET ALL-SG8324M firmware 2.2.1
     */
    AllnetAllSg8324m,

    /**
     * OpenWrt device `datto_l8`.
     * \sa https://github.com/openwrt/openwrt/blob/138fabb79f8d68d65e40c8b8d0c0494b19053d0f/target/linux/realtek/image/rtl838x.mk#L102 OpenWrt, `datto_l8`
     * \sa https://downloads.openwrt.org/snapshots/targets/realtek/rtl838x/openwrt-realtek-rtl838x-datto_l8-squashfs-sysupgrade.bin OpenWrt snapshot, `datto_l8`
     */
    DattoL8,

    /**
     * ALLNET ALL-WAPC0450C.
     * \sa https://www.allnet.de/ftp-downloads/allnet/wireless/ALL-WAPC0450C/Firmware-Update_1.01.00_ALL-WAPC0450C.zip ALLNET ALL-WAPC0450C firmware 1.00.04 (in the 1.01.00 update package)
     */
    AllnetAllWapc0450c,

    /**
     * OpenWrt device `engenius_ews2910p-v3`.
     * \sa https://github.com/openwrt/openwrt/blob/138fabb79f8d68d65e40c8b8d0c0494b19053d0f/target/linux/realtek/image/rtl838x.mk#L124 OpenWrt, `engenius_ews2910p-v3`
     * \sa https://downloads.openwrt.org/releases/25.12.5/targets/realtek/rtl838x/openwrt-25.12.5-realtek-rtl838x-engenius_ews2910p-v3-squashfs-sysupgrade.bin OpenWrt 25.12.5, `engenius_ews2910p-v3`
     */
    EngeniusEws2910pV3,

    /**
     * EnGenius EWS1200-28TFP firmware 1.07.16 to 1.07.40.
     * \sa https://www.engeniustech.com/wp_firmware/ews1200-28tfp_fw_1.07.40_c1.9.33_200225-1841.bix EnGenius EWS1200-28TFP firmware 1.07.40
     */
    EngeniusEws120028tfp,

    /**
     * EnGenius EWS7926EFP firmware 1.07.22 to 1.07.27.
     * \sa https://www.engeniustech.com/wp_firmware/ews7926efp_fw_1.07.27_c1.9.37_210312-1805.bix EnGenius EWS7926EFP firmware 1.07.27
     */
    EngeniusEws7926efp,

    /**
     * EnGenius EWS7952P firmware 1.07.16 to 1.07.40.
     * \sa https://www.engeniustech.com/wp_firmware/ews7952p_fw_1.07.40_c1.9.33_200225-1806.bix EnGenius EWS7952P firmware 1.07.40
     */
    EngeniusEws7952p,

    /**
     * EnGenius EWS2908P firmware 1.07.34 to 1.07.43.
     * \sa https://www.engeniustech.com/wp_firmware/ews2908p_fw_1.07.43_c1.9.37_210311-1751.bix EnGenius EWS2908P firmware 1.07.43
     */
    EngeniusEws2908p,

    /**
     * EnGenius EWS7928P v2 firmware 1.07.40 to 1.07.43.
     * \sa https://www.engeniustech.com/wp_firmware/ews7928pv2_fw_1.07.43_c1.9.37_210312-1011.bix EnGenius EWS7928P v2 firmware 1.07.43
     */
    EngeniusEws7928pV2,

    /**
     * EnGenius EWS1200-28TFP v2 firmware 1.07.43.
     * \sa https://www.engeniustech.com/wp_firmware/ews1200-28tfpv2_fw_1.07.43_c1.9.37_210312-1021.bix EnGenius EWS1200-28TFP v2 firmware 1.07.43
     */
    EngeniusEws120028tfpV2,

    /**
     * EnGenius EWS2910P firmware 1.07.16 to 1.07.43. OpenWrt device
     * `engenius_ews2910p-v1`.
     * \sa https://www.engeniustech.com/wp_firmware/ews2910p_fw_1.07.43_c1.9.37_210311-1807.bix EnGenius EWS2910P firmware 1.07.43
     * \sa https://github.com/openwrt/openwrt/blob/138fabb79f8d68d65e40c8b8d0c0494b19053d0f/target/linux/realtek/image/rtl838x.mk#L113 OpenWrt, `engenius_ews2910p-v1`
     */
    EngeniusEws2910p,

    /**
     * EnGenius EWS5912FP firmware 1.07.16 to 1.07.43.
     * \sa https://www.engeniustech.com/wp_firmware/ews5912fp_fw_1.07.43_c1.9.37_210312-0947.bix EnGenius EWS5912FP firmware 1.07.43
     */
    EngeniusEws5912fp,

    /**
     * EnGenius EWS7928P firmware 1.07.16 to 1.07.40.
     * \sa https://www.engeniustech.com/wp_firmware/ews7928p_fw_1.07.40_c1.9.33_200225-1707.bix EnGenius EWS7928P firmware 1.07.40
     */
    EngeniusEws7928p,

    /**
     * EnGenius EWS1200D-10T firmware 1.07.16 to 1.07.22.
     * \sa https://www.engeniustech.com/wp_firmware/ews1200d-10t_fw_1.07.22_c1.9.21_181018-0217.bix EnGenius EWS1200D-10T firmware 1.07.22
     */
    EngeniusEws1200d10t,

    /**
     * EnGenius EWS1200-28T firmware 1.07.16 to 1.07.22.
     * \sa https://www.engeniustech.com/wp_firmware/ews1200-28t_fw_1.07.22_c1.9.21_181018-0206.bix EnGenius EWS1200-28T firmware 1.07.22
     */
    EngeniusEws120028t,

    /**
     * EnGenius EWS7928FP firmware 1.07.16 to 1.07.40.
     * \sa https://www.engeniustech.com/wp_firmware/ews7928fp_fw_1.07.40_c1.9.33_200415-1156.bix EnGenius EWS7928FP firmware 1.07.40
     */
    EngeniusEws7928fp,

    /**
     * EnGenius EWS1200-52T firmware 1.07.16 to 1.07.22.
     * \sa https://www.engeniustech.com/wp_firmware/ews1200-52t_fw_1.07.22_c1.9.21_181018-0154.bix EnGenius EWS1200-52T firmware 1.07.22
     */
    EngeniusEws120052t,

    /**
     * EnGenius EWS7952FP firmware 1.07.16 to 1.07.40.
     * \sa https://www.engeniustech.com/wp_firmware/ews7952fp_fw_1.07.40_c1.9.33_200225-1743.bix EnGenius EWS7952FP firmware 1.07.40
     */
    EngeniusEws7952fp,

    /**
     * OpenWrt devices `youku_x2`, `youku_yk-l1`, `youku_yk-l1c`,
     * `youku_yk-l2`.
     * \sa https://github.com/openwrt/openwrt/blob/138fabb79f8d68d65e40c8b8d0c0494b19053d0f/target/linux/ramips/image/mt7620.mk#L1456 OpenWrt, `youku_x2`
     * \sa https://github.com/openwrt/openwrt/blob/138fabb79f8d68d65e40c8b8d0c0494b19053d0f/target/linux/ramips/image/mt7620.mk#L1469 OpenWrt, `youku_yk-l1`
     * \sa https://github.com/openwrt/openwrt/blob/138fabb79f8d68d65e40c8b8d0c0494b19053d0f/target/linux/ramips/image/mt7620.mk#L1481 OpenWrt, `youku_yk-l1c`
     * \sa https://github.com/openwrt/openwrt/blob/138fabb79f8d68d65e40c8b8d0c0494b19053d0f/target/linux/ramips/image/mt7621.mk#L3702 OpenWrt, `youku_yk-l2`
     * \sa https://downloads.openwrt.org/releases/25.12.5/targets/ramips/mt7620/openwrt-25.12.5-ramips-mt7620-youku_yk-l1-squashfs-sysupgrade.bin OpenWrt 25.12.5, `youku_yk-l1`
     */
    YoukuYkL1,

    /**
     * Generic default of the Realtek switch SDK's U-Boot
     * (`CONFIG_IH_MAGIC_NUMBER`), used e.g. by many TRENDnet switches. OpenWrt
     * device `apresia_aplgs120gtss`.
     * \sa https://github.com/openwrt/openwrt/blob/138fabb79f8d68d65e40c8b8d0c0494b19053d0f/target/linux/realtek/image/rtl838x.mk#L21 OpenWrt, `apresia_aplgs120gtss`
     * \sa https://github.com/halmartin/zyxel-gs1900-gpl/blob/9567911410eb74739dc41cd36934c94b88d53a70/gs1900/u-boot-2011.12/config.in#L217 Realtek SDK U-Boot (ZyXEL GS1900 GPL code)
     * \sa https://downloads.trendnet.com/tpe-1620ws_v2/firmware/fw_ws-2-10-024-all.zip TRENDnet TPE-1620WS v2 firmware 2.10.024
     */
    RealtekSdk,

    /**
     * OpenWrt device `netgear_gs750e`.
     * \sa https://github.com/openwrt/openwrt/blob/138fabb79f8d68d65e40c8b8d0c0494b19053d0f/target/linux/realtek/image/rtl839x.mk#L71 OpenWrt, `netgear_gs750e`
     * \sa https://downloads.openwrt.org/releases/25.12.5/targets/realtek/rtl839x/openwrt-25.12.5-realtek-rtl839x-netgear_gs750e-squashfs-sysupgrade.bin OpenWrt 25.12.5, `netgear_gs750e`
     */
    NetgearGs750e,

    /**
     * NETGEAR GS728TPv2, GS728TPPv2, GS752TPv2 and GS752TPP.
     * \sa https://www.downloads.netgear.com/files/GDC/GS728TPv2/GS728_752_TP_TPP_V6.0.0.37.zip NETGEAR GS728TPv2 firmware 6.0.0.37
     */
    NetgearGs728tpV2,

    /**
     * OpenWrt device `bolt_bl100`.
     * \sa https://github.com/openwrt/openwrt/blob/138fabb79f8d68d65e40c8b8d0c0494b19053d0f/target/linux/ramips/image/mt7620.mk#L158 OpenWrt, `bolt_bl100`
     * \sa https://downloads.openwrt.org/releases/25.12.5/targets/ramips/mt7620/openwrt-25.12.5-ramips-mt7620-bolt_bl100-squashfs-sysupgrade.bin OpenWrt 25.12.5, `bolt_bl100`
     */
    BoltBl100,

    /**
     * The standard U-Boot header magic (`IH_MAGIC`).
     */
    Uimage,

    /**
     * NETGEAR WNCE4004.
     * \sa https://www.downloads.netgear.com/files/GDC/WNCE4004/wnce4004-V1.0.0.32.zip NETGEAR WNCE4004 firmware 1.0.0.32
     */
    NetgearWnce4004,

    /**
     * "0612" in ASCII. NETGEAR WNR612v2 firmware 1.0.0.2 (later firmware uses
     * "2061").
     * \sa https://www.downloads.netgear.com/files/wnr612v2-V1.0.0.2_1.0.3.img NETGEAR WNR612v2 firmware 1.0.0.2
     */
    NetgearWnr612V2Early,

    /**
     * "1000" in ASCII. NETGEAR WNR1000v2-VC. OpenWrt used this magic only in
     * its `ar71xx` target, which was
     * [removed](https://github.com/openwrt/openwrt/commit/4e4ee4649553ab536225060a27fc320bf54e458c)
     * after OpenWrt 19.07, so it is missing from the current OpenWrt code.
     * \sa https://www.downloads.netgear.com/files/WNR1000v2-VC-V1.2.2.56NA.img NETGEAR WNR1000v2-VC firmware 1.2.2.56
     * \sa https://github.com/cidermole/wndr3800-uboot/blob/2a3c20a515bdcfad28f75469784973e8921dcbab/include/configs/wnr1000v2.h#L170 NETGEAR U-Boot (GPL code)
     * \sa https://github.com/openwrt/openwrt/blob/1da2e82c1182a3fd681da5760be96821213afadd/target/linux/ar71xx/image/legacy.mk#L1004 OpenWrt 19.07, `WNR1000V2_VC`
     */
    NetgearWnr1000V2Vc,

    /**
     * "1001" in ASCII. OpenWrt device `netgear_wnr1000-v2`.
     * \sa https://github.com/openwrt/openwrt/blob/138fabb79f8d68d65e40c8b8d0c0494b19053d0f/target/linux/ath79/image/tiny-netgear.mk#L35 OpenWrt, `netgear_wnr1000-v2`
     * \sa https://www.downloads.netgear.com/files/GDC/WNR1000V2/WNR1000v2-V1.1.2.54NA.zip NETGEAR WNR1000v2 firmware 1.1.2.54
     */
    NetgearWnr1000V2,

    /**
     * "1002" in ASCII. NETGEAR WNR1000v2-VM. No firmware image with this magic
     * was found among the ones surveyed (September 2026), so it may not be
     * used in practice.
     * \sa https://github.com/cidermole/wndr3800-uboot/blob/2a3c20a515bdcfad28f75469784973e8921dcbab/include/configs/wnr1000v2.h#L172 NETGEAR U-Boot (GPL code)
     */
    NetgearWnr1000V2Vm,

    /**
     * "1004" in ASCII. NETGEAR WNR1000v4. No firmware image with this magic
     * was found among the ones surveyed (September 2026), so it may not be
     * used in practice.
     * \sa https://github.com/cidermole/wndr3800-uboot/blob/2a3c20a515bdcfad28f75469784973e8921dcbab/include/configs/wnr1000v4.h#L238 NETGEAR U-Boot (GPL code)
     */
    NetgearWnr1000V4,

    /**
     * "1100" in ASCII. NETGEAR WPN824N. OpenWrt used this magic only in its
     * `ar71xx` target, which was
     * [removed](https://github.com/openwrt/openwrt/commit/4e4ee4649553ab536225060a27fc320bf54e458c)
     * after OpenWrt 19.07, so it is missing from the current OpenWrt code.
     * \sa https://www.downloads.netgear.com/files/WPN824N/Firmware/WPN824N-V1.0.0.28NA.img NETGEAR WPN824N firmware 1.0.0.28
     * \sa https://github.com/openwrt/openwrt/blob/1da2e82c1182a3fd681da5760be96821213afadd/target/linux/ar71xx/image/legacy.mk#L1005 OpenWrt 19.07, `WPN824N`
     */
    NetgearWpn824n,

    /**
     * "1PAW" in ASCII. ZyXEL UAG50.
     * \sa https://download.zyxel.com/UAG50/firmware/UAG50_3.00(AAZP.1)C0.zip ZyXEL UAG50 firmware 3.00(AAZP.1)C0
     */
    ZyxelUag50,

    /**
     * "2001" in ASCII. OpenWrt 19.07 images for the NETGEAR WNR2000 (the stock
     * firmware uses the standard magic). OpenWrt used this magic only in its
     * `ar71xx` target, which was
     * [removed](https://github.com/openwrt/openwrt/commit/4e4ee4649553ab536225060a27fc320bf54e458c)
     * after OpenWrt 19.07, so it is missing from the current OpenWrt code.
     * \sa https://github.com/openwrt/openwrt/blob/1da2e82c1182a3fd681da5760be96821213afadd/target/linux/ar71xx/image/legacy.mk#L1000 OpenWrt 19.07, `WNR2000`
     * \sa https://downloads.openwrt.org/releases/19.07.10/targets/ar71xx/tiny/openwrt-19.07.10-ar71xx-tiny-wnr2000-squashfs-factory.img OpenWrt 19.07.10, `wnr2000`
     */
    NetgearWnr2000,

    /**
     * "2003" in ASCII. OpenWrt device `netgear_wnr2000-v3`.
     * \sa https://github.com/openwrt/openwrt/blob/138fabb79f8d68d65e40c8b8d0c0494b19053d0f/target/linux/ath79/image/tiny-netgear.mk#L49 OpenWrt, `netgear_wnr2000-v3`
     * \sa https://www.downloads.netgear.com/files/GDC/WNR2000v3/wnr2000v3-V1.1.2.18.zip NETGEAR WNR2000v3 firmware 1.1.2.18
     */
    NetgearWnr2000V3,

    /**
     * "2004" in ASCII. NETGEAR WNR2000v4. OpenWrt used this magic only in its
     * `ar71xx` target, which was
     * [removed](https://github.com/openwrt/openwrt/commit/4e4ee4649553ab536225060a27fc320bf54e458c)
     * after OpenWrt 19.07, so it is missing from the current OpenWrt code.
     * \sa https://www.downloads.netgear.com/files/GDC/WNR2000V4/WNR2000v4-V1.0.0.40.zip NETGEAR WNR2000v4 firmware 1.0.0.40
     * \sa https://github.com/openwrt/openwrt/blob/1da2e82c1182a3fd681da5760be96821213afadd/target/linux/ar71xx/image/legacy.mk#L999 OpenWrt 19.07, `WNR2000V4`
     */
    NetgearWnr2000V4,

    /**
     * "2061" in ASCII. OpenWrt devices `netgear_wnr612-v2`, `on_n150r`.
     * \sa https://github.com/openwrt/openwrt/blob/138fabb79f8d68d65e40c8b8d0c0494b19053d0f/target/linux/ath79/image/tiny-netgear.mk#L9 OpenWrt, `netgear_wnr612-v2`
     * \sa https://github.com/openwrt/openwrt/blob/138fabb79f8d68d65e40c8b8d0c0494b19053d0f/target/linux/ath79/image/tiny-netgear.mk#L22 OpenWrt, `on_n150r`
     * \sa https://downloads.openwrt.org/releases/19.07.10/targets/ath79/tiny/openwrt-19.07.10-ath79-tiny-netgear_wnr612-v2-squashfs-factory.img OpenWrt 19.07.10, `netgear_wnr612-v2`
     */
    NetgearWnr612V2,

    /**
     * "2200" in ASCII. OpenWrt device `netgear_wnr2200_common`.
     * \sa https://github.com/openwrt/openwrt/blob/138fabb79f8d68d65e40c8b8d0c0494b19053d0f/target/linux/ath79/image/generic.mk#L2356 OpenWrt, `netgear_wnr2200_common`
     * \sa https://downloads.openwrt.org/releases/25.12.5/targets/ath79/generic/openwrt-25.12.5-ath79-generic-netgear_wnr2200-8m-squashfs-factory.img OpenWrt 25.12.5, `netgear_wnr2200-8m`
     */
    NetgearWnr2200,

    /**
     * "3700" in ASCII. OpenWrt device `netgear_wndr3700`.
     * \sa https://github.com/openwrt/openwrt/blob/138fabb79f8d68d65e40c8b8d0c0494b19053d0f/target/linux/ath79/image/generic.mk#L2283 OpenWrt, `netgear_wndr3700`
     * \sa https://www.downloads.netgear.com/files/GDC/WNDR37AVv1/WNDR3700_WNDR37AV%20Firmware%20Version%201.0.16.98NA.zip NETGEAR WNDR3700 firmware 1.0.16.98
     */
    NetgearWndr3700,

    /**
     * "3701" in ASCII. OpenWrt devices `netgear_wndr3700-v2`,
     * `netgear_wndr3800`, `netgear_wndr3800ch`, `netgear_wndrmac-v1`,
     * `netgear_wndrmac-v2`.
     * \sa https://github.com/openwrt/openwrt/blob/138fabb79f8d68d65e40c8b8d0c0494b19053d0f/target/linux/ath79/image/generic.mk#L2297 OpenWrt, `netgear_wndr3700-v2`
     * \sa https://github.com/openwrt/openwrt/blob/138fabb79f8d68d65e40c8b8d0c0494b19053d0f/target/linux/ath79/image/generic.mk#L2308 OpenWrt, `netgear_wndr3800`
     * \sa https://github.com/openwrt/openwrt/blob/138fabb79f8d68d65e40c8b8d0c0494b19053d0f/target/linux/ath79/image/generic.mk#L2319 OpenWrt, `netgear_wndr3800ch`
     * \sa https://github.com/openwrt/openwrt/blob/138fabb79f8d68d65e40c8b8d0c0494b19053d0f/target/linux/ath79/image/generic.mk#L2331 OpenWrt, `netgear_wndrmac-v1`
     * \sa https://github.com/openwrt/openwrt/blob/138fabb79f8d68d65e40c8b8d0c0494b19053d0f/target/linux/ath79/image/generic.mk#L2343 OpenWrt, `netgear_wndrmac-v2`
     * \sa https://www.downloads.netgear.com/files/WNDR3800-V1.0.0.34.img NETGEAR WNDR3800 firmware 1.0.0.34
     */
    NetgearWndr3700V2,

    /**
     * "3703" in ASCII. OpenWrt devices `netgear_wndr3700-v4`,
     * `netgear_wndr4300`, `netgear_wndr4300sw`, `netgear_wndr4300tn`.
     * \sa https://github.com/openwrt/openwrt/blob/138fabb79f8d68d65e40c8b8d0c0494b19053d0f/target/linux/ath79/image/nand.mk#L400 OpenWrt, `netgear_wndr3700-v4`
     * \sa https://github.com/openwrt/openwrt/blob/138fabb79f8d68d65e40c8b8d0c0494b19053d0f/target/linux/ath79/image/nand.mk#L410 OpenWrt, `netgear_wndr4300`
     * \sa https://github.com/openwrt/openwrt/blob/138fabb79f8d68d65e40c8b8d0c0494b19053d0f/target/linux/ath79/image/nand.mk#L420 OpenWrt, `netgear_wndr4300sw`
     * \sa https://github.com/openwrt/openwrt/blob/138fabb79f8d68d65e40c8b8d0c0494b19053d0f/target/linux/ath79/image/nand.mk#L430 OpenWrt, `netgear_wndr4300tn`
     * \sa https://www.downloads.netgear.com/files/GDC/WNDR4300/WNDR4300-V1.0.2.104.zip NETGEAR WNDR4300 firmware 1.0.2.104
     */
    NetgearWndr3700V4,

    /**
     * "6000" in ASCII. OpenWrt device `netgear_r6100`.
     * \sa https://github.com/openwrt/openwrt/blob/138fabb79f8d68d65e40c8b8d0c0494b19053d0f/target/linux/ath79/image/nand.mk#L388 OpenWrt, `netgear_r6100`
     * \sa https://www.downloads.netgear.com/files/GDC/R6100/R6100_V1.0.0.52.zip NETGEAR R6100 firmware 1.0.0.52
     */
    NetgearR6100,

    /**
     * "6122" in ASCII. NETGEAR WNR612. No firmware image with this magic was
     * found among the ones surveyed (September 2026), so it may not be used in
     * practice.
     * \sa https://github.com/cidermole/wndr3800-uboot/blob/2a3c20a515bdcfad28f75469784973e8921dcbab/include/configs/wnr612.h#L169 NETGEAR U-Boot (GPL code)
     */
    NetgearWnr612,

    /**
     * "COMB" in ASCII. Devices made by MitraStar (MSTC), e.g. ZyXEL NBG6604
     * and I-O DATA WN-AX1167GR2, WN-AX2033GR, WN-AX2033GR2, WN-DX1167GR and
     * WN-DX2033GR.
     * \sa https://download.zyxel.com/NBG6604/firmware/NBG6604_V1.01(ABIR.2)C0.zip ZyXEL NBG6604 firmware 1.01(ABIR.2)C0
     * \sa https://lib.iodata.jp/lib/soft/w/wnax2033gr_f203.zip I-O DATA WN-AX2033GR firmware 2.03
     */
    MitrastarComb,

    /**
     * "COMC" in ASCII. Devices made by MitraStar (MSTC), e.g. I-O DATA
     * WN-CS300FR, WN-DX1167R, WN-DX1200GR, WN-DX1300EXP, WN-DX1300GRN,
     * WN-PL1167EX01/02/03, WN-SX300FR and WN-SX300GR.
     * \sa https://lib.iodata.jp/lib/soft/w/wndx1167r_f105.zip I-O DATA WN-DX1167R firmware 1.05
     */
    MitrastarComc,

    /**
     * "NGC5" in ASCII. OpenWrt devices `netgear_gs308t-v1`,
     * `netgear_gs310tp-v1`.
     * \sa https://github.com/openwrt/openwrt/blob/138fabb79f8d68d65e40c8b8d0c0494b19053d0f/target/linux/realtek/image/rtl838x.mk#L287 OpenWrt, `netgear_gs308t-v1`
     * \sa https://github.com/openwrt/openwrt/blob/138fabb79f8d68d65e40c8b8d0c0494b19053d0f/target/linux/realtek/image/rtl838x.mk#L295 OpenWrt, `netgear_gs310tp-v1`
     * \sa https://www.downloads.netgear.com/files/GDC/GS308T/GS308T_GS310TP_V1.0.5.7.zip NETGEAR GS308T firmware 1.0.5.7
     */
    NetgearGs308t,

    /**
     * "NGE " in ASCII. OpenWrt device `netgear_nge`.
     * \sa https://github.com/openwrt/openwrt/blob/138fabb79f8d68d65e40c8b8d0c0494b19053d0f/target/linux/realtek/image/rtl838x.mk#L237 OpenWrt, `netgear_nge`
     * \sa https://www.downloads.netgear.com/files/GDC/GS108Tv3/GS108Tv3_GS110TPv3_GS110TPPv1_V7.1.1.17.zip NETGEAR GS108Tv3 firmware 7.1.1.17
     */
    NetgearNge,

    /**
     * "NGF " in ASCII. NETGEAR GC108P and GC108PP.
     * \sa https://www.downloads.netgear.com/files/GDC/GC108P/GC108P_GC108PP_V1.0.2.4.zip NETGEAR GC108P firmware 1.0.2.4
     */
    NetgearNgf,

    /**
     * "NGG " in ASCII. OpenWrt device `netgear_ngg`.
     * \sa https://github.com/openwrt/openwrt/blob/138fabb79f8d68d65e40c8b8d0c0494b19053d0f/target/linux/realtek/image/rtl838x.mk#L256 OpenWrt, `netgear_ngg`
     * \sa https://downloads.openwrt.org/releases/25.12.5/targets/realtek/rtl838x/openwrt-25.12.5-realtek-rtl838x-netgear_gs110tup-v1-squashfs-sysupgrade.bin OpenWrt 25.12.5, `netgear_gs110tup-v1`
     */
    NetgearNgg,

    /**
     * "NGH " in ASCII. NETGEAR GS724TPv2 and GS724TPP.
     * \sa https://www.downloads.netgear.com/files/GDC/GS724TPv2/GS724TPv2_GS724TPP_V2.0.0.16.zip NETGEAR GS724TPv2 firmware 2.0.0.16
     */
    NetgearNgh,

    /**
     * "NGI " in ASCII. NETGEAR GS716TP and GS716TPP.
     * \sa https://www.downloads.netgear.com/files/GDC/GS716TP/GS716TP_GS716TPP_V1.0.0.15.zip NETGEAR GS716TP firmware 1.0.0.15
     */
    NetgearNgi,

    /**
     * "NGP " in ASCII. NETGEAR MS510TXM and MS510TXUP.
     * \sa https://www.downloads.netgear.com/files/GDC/MS510TXM/MS510TXM_MS510TXUP_1.0.5.23.zip NETGEAR MS510TXM firmware 1.0.5.23
     */
    NetgearNgp,

    /**
     * "OKLI" in ASCII. The kernel of OpenWrt images for devices whose
     * bootloader loads a small OpenWrt loader (`lzma-loader`, `loader-okli`)
     * instead, which then boots this kernel.
     * \sa https://github.com/openwrt/openwrt/blob/138fabb79f8d68d65e40c8b8d0c0494b19053d0f/target/linux/ath79/image/common-tp-link.mk#L92 OpenWrt, `tplink-safeloader-okli`
     * \sa https://downloads.openwrt.org/releases/25.12.5/targets/ath79/generic/openwrt-25.12.5-ath79-generic-aruba_ap-105-squashfs-sysupgrade.bin OpenWrt 25.12.5, `aruba_ap-105`
     */
    OpenwrtOkli,

    /**
     * "hsqs" in ASCII. The kernel of OpenWrt images for the D-Link COVR-C1200
     * and COVR-P2500, loaded by OpenWrt's `lzma-loader`.
     * \sa https://downloads.openwrt.org/releases/25.12.5/targets/ath79/generic/openwrt-25.12.5-ath79-generic-dlink_covr-c1200-a1-squashfs-sysupgrade.bin OpenWrt 25.12.5, `dlink_covr-c1200-a1`
     */
    OpenwrtDlinkCovr,

    /**
     * "sqOK" in ASCII. The kernel of OpenWrt images for Senao-based access
     * points (e.g. EnGenius EAP and ENS series, ALLNET ALL-WAP02860AC,
     * WatchGuard AP100/200/300), loaded by OpenWrt's `lzma-loader`.
     * \sa https://downloads.openwrt.org/releases/25.12.5/targets/ath79/generic/openwrt-25.12.5-ath79-generic-engenius_eap1200h-squashfs-factory.bin OpenWrt 25.12.5, `engenius_eap1200h`
     */
    OpenwrtSenaoOkli,

    /**
     * EnGenius ECS1112FP (`image/series_vmlinux.bix` in the tar archive that
     * follows a 64-byte header in the `.imag` firmware file, i.e. at offset
     * 0x240).
     * \sa https://www.engeniustech.com/wp_firmware/ECS1112FP-RTL83xx_fw_1.1.40-2.01.149_20201008-1903.imag EnGenius ECS1112FP firmware
     */
    EngeniusEcs1112fp,

    /**
     * EnGenius EWS1200-28TFP firmware 1.05.45 to 1.06.21.
     * \sa https://www.engeniustech.com/wp_firmware/ews1200-28tfp_fw_1.06.21_c1.8.77_180906-0716.bix EnGenius EWS1200-28TFP firmware 1.06.21
     */
    EngeniusEws120028tfpOldFw,

    /**
     * EnGenius EWS7926EFP firmware 1.06.23.
     * \sa https://www.engeniustech.com/wp_firmware/ews7926efp_fw_1.06.23_c1.8.77_181102-0254.bix EnGenius EWS7926EFP firmware 1.06.23
     */
    EngeniusEws7926efpOldFw,

    /**
     * EnGenius EWS7952P firmware 1.05.52 to 1.06.21.
     * \sa https://www.engeniustech.com/wp_firmware/ews7952p_fw_1.06.21_c1.8.77_180906-0727.bix EnGenius EWS7952P firmware 1.06.21
     */
    EngeniusEws7952pOldFw,

    /**
     * Default of the Realtek switch SDK for RTL838x
     * (`CONFIG_IH_MAGIC_NUMBER`), used e.g. by ZyXEL GS1900 series, Cisco
     * Sx220 series and Ubiquiti UISP-S switches. EnGenius EGS7228P firmware
     * 1.05.05. OpenWrt devices `zyxel_gs1900`, `inaba_aml2-17gp`,
     * `horaco_zx-swtgw2c8f`, `mokerlink_2g080gm`, `mokerlink_10gt080m`.
     * \sa https://github.com/ReFirmLabs/binwalk/commit/f21282bce5b699fe627102a0b647416acd54933b binwalk
     * \sa https://www.engeniustech.com/wp_firmware/egs7228p_fw_1.05.05_141210-1806.bix EnGenius EGS7228P firmware 1.05.05
     * \sa https://github.com/openwrt/openwrt/blob/138fabb79f8d68d65e40c8b8d0c0494b19053d0f/target/linux/realtek/image/common.mk#L93 OpenWrt, `zyxel_gs1900`
     * \sa https://github.com/openwrt/openwrt/blob/138fabb79f8d68d65e40c8b8d0c0494b19053d0f/target/linux/realtek/image/rtl838x.mk#L197 OpenWrt, `inaba_aml2-17gp`
     * \sa https://github.com/openwrt/openwrt/blob/138fabb79f8d68d65e40c8b8d0c0494b19053d0f/target/linux/realtek/image/rtl930x.mk#L148 OpenWrt, `horaco_zx-swtgw2c8f`
     * \sa https://github.com/openwrt/openwrt/blob/138fabb79f8d68d65e40c8b8d0c0494b19053d0f/target/linux/realtek/image/rtl930x.mk#L176 OpenWrt, `mokerlink_2g080gm`
     * \sa https://github.com/openwrt/openwrt/blob/138fabb79f8d68d65e40c8b8d0c0494b19053d0f/target/linux/realtek/image/rtl931x.mk#L33 OpenWrt, `mokerlink_10gt080m`
     * \sa https://github.com/danieltwagner/teg-s750/blob/13b8db10b2600382be2e3126195e456081532862/gpl_oss_of_realtek_sdk3/kernel/uClinux/vendors/Realtek/SDK/defConf/83xx/uboot.config#L194 Realtek SDK, RTL83xx default configuration (TRENDnet TEG-S750 GPL code)
     * \sa https://github.com/halmartin/zyxel-gs1900-gpl/blob/9567911410eb74739dc41cd36934c94b88d53a70/gs1900/turnkey/vendor/ZyXEL/GS1900/config.u-boot#L80 ZyXEL GS1900 GPL code
     * \sa https://dl.ui.com/firmwares/uisps/1.10.2/ESX.1.10.2.bix Ubiquiti UISP-S firmware 1.10.2
     */
    RealtekRtl838x,

    /**
     * I-O DATA BSH-G08M.
     * \sa https://lib.iodata.jp/lib/soft/b/bshg08m_f203.zip I-O DATA BSH-G08M firmware 2.03
     */
    IodataBshG08m,

    /**
     * I-O DATA BSH-GP08 and Ubiquiti UISP-S (RTL838x).
     * \sa https://lib.iodata.jp/lib/soft/b/bshgp08_f204.zip I-O DATA BSH-GP08 firmware 2.04
     * \sa https://dl.ui.com/firmwares/uisps/1.5.0/UISPS.rtl838x.v1.5.0.bix Ubiquiti UISP-S firmware 1.5.0 (RTL838x)
     */
    IodataBshGp08,

    /**
     * I-O DATA BSH-G16M.
     * \sa https://lib.iodata.jp/lib/soft/b/bshg16m_f203.zip I-O DATA BSH-G16M firmware 2.03
     */
    IodataBshG16m,

    /**
     * I-O DATA BSH-G24M.
     * \sa https://lib.iodata.jp/lib/soft/b/bshg24m_f203.zip I-O DATA BSH-G24M firmware 2.03
     */
    IodataBshG24m,

    /**
     * I-O DATA BSH-G08MB.
     * \sa https://lib.iodata.jp/lib/soft/b/bshg08mb_f101.zip I-O DATA BSH-G08MB firmware 1.01
     */
    IodataBshG08mb,

    /**
     * I-O DATA BSH-GP08MB.
     * \sa https://lib.iodata.jp/lib/soft/b/bshgp08mb_f101.zip I-O DATA BSH-GP08MB firmware 1.01
     */
    IodataBshGp08mb,

    /**
     * I-O DATA BSH-G16MB.
     * \sa https://lib.iodata.jp/lib/soft/b/bshg16mb_f101.zip I-O DATA BSH-G16MB firmware 1.01
     */
    IodataBshG16mb,

    /**
     * I-O DATA BSH-G24MB. OpenWrt device `iodata_bsh-g24mb`.
     * \sa https://github.com/openwrt/openwrt/blob/138fabb79f8d68d65e40c8b8d0c0494b19053d0f/target/linux/realtek/image/rtl838x.mk#L206 OpenWrt, `iodata_bsh-g24mb`
     * \sa https://lib.iodata.jp/lib/soft/b/bshg24mb_f101.zip I-O DATA BSH-G24MB firmware 1.01
     */
    IodataBshG24mb,

    /**
     * TRENDnet TPE-3012LS.
     * \sa https://downloads.trendnet.com/TPE-3012LS/firmware/FW_TPE-3012LS_v1(1.01.28).zip TRENDnet TPE-3012LS firmware 1.01.28
     */
    TrendnetTpe3012ls,

    /**
     * TRENDnet TPE-3018LS.
     * \sa https://downloads.trendnet.com/TPE-3018LS/firmware/FW_TPE-3018LS_v1(1.01.28).zip TRENDnet TPE-3018LS firmware 1.01.28
     */
    TrendnetTpe3018ls,

    /**
     * EnGenius EGS2108P firmware 1.05.20.
     * \sa https://www.engeniustech.com/wp_firmware/egs2108p_fw_1.05.20_150810-1740.bix EnGenius EGS2108P firmware 1.05.20
     */
    EngeniusEgs2108pOldFw,

    /**
     * EnGenius EGS2110P firmware 1.05.20.
     * \sa https://www.engeniustech.com/wp_firmware/egs2110p_fw_1.05.20_150810-1754.bix EnGenius EGS2110P firmware 1.05.20
     */
    EngeniusEgs2110pOldFw,

    /**
     * EnGenius EWS2910P firmware 1.05.38 to 1.06.21.
     * \sa https://www.engeniustech.com/wp_firmware/ews2910p_fw_1.06.21_c1.8.77_180906-0547.bix EnGenius EWS2910P firmware 1.06.21
     */
    EngeniusEws2910pOldFw,

    /**
     * EnGenius EGS5110P firmware 1.05.20.
     * \sa https://www.engeniustech.com/wp_firmware/egs5110p_fw_1.05.20_150810-1808.bix EnGenius EGS5110P firmware 1.05.20
     */
    EngeniusEgs5110pOldFw,

    /**
     * EnGenius EGS5212FP firmware 1.05.05.
     * \sa https://www.engeniustech.com/wp_firmware/egs5212fp_fw_1.05.05_141210-1822.bix EnGenius EGS5212FP firmware 1.05.05
     */
    EngeniusEgs5212fpOldFw,

    /**
     * EnGenius EWS5912FP firmware 1.05.38 to 1.06.21.
     * \sa https://www.engeniustech.com/wp_firmware/ews5912fp_fw_1.06.21_c1.8.77_180906-0621.bix EnGenius EWS5912FP firmware 1.06.21
     */
    EngeniusEws5912fpOldFw,

    /**
     * EnGenius EWS7928P firmware 1.05.38 to 1.06.21.
     * \sa https://www.engeniustech.com/wp_firmware/ews7928p_fw_1.06.21_c1.8.77_180906-0632.bix EnGenius EWS7928P firmware 1.06.21
     */
    EngeniusEws7928pOldFw,

    /**
     * EnGenius EWS1200D-10T firmware 1.05.39 to 1.06.21.
     * \sa https://www.engeniustech.com/wp_firmware/ews1200d-10t_fw_1.06.21_c1.8.77_180906-0705.bix EnGenius EWS1200D-10T firmware 1.06.21
     */
    EngeniusEws1200d10tOldFw,

    /**
     * EnGenius EWS1200-28T firmware 1.05.38 to 1.06.21.
     * \sa https://www.engeniustech.com/wp_firmware/ews1200-28t_fw_1.06.21_c1.8.77_180906-0610.bix EnGenius EWS1200-28T firmware 1.06.21
     */
    EngeniusEws120028tOldFw,

    /**
     * EnGenius EGS7228FP firmware 1.05.05.
     * \sa https://www.engeniustech.com/wp_firmware/egs7228fp_fw_1.05.05_141210-1751.bix EnGenius EGS7228FP firmware 1.05.05
     */
    EngeniusEgs7228fpOldFw,

    /**
     * EnGenius EWS7928FP firmware 1.05.42 to 1.06.21.
     * \sa https://www.engeniustech.com/wp_firmware/ews7928fp_fw_1.06.21_c1.8.77_180906-0558.bix EnGenius EWS7928FP firmware 1.06.21
     */
    EngeniusEws7928fpOldFw,

    /**
     * Default of the Realtek switch SDK for RTL839x
     * (`CONFIG_IH_MAGIC_NUMBER`). No firmware image with this magic was found
     * among the ones surveyed (September 2026), so it may not be used in
     * practice.
     * \sa https://github.com/danieltwagner/teg-s750/blob/13b8db10b2600382be2e3126195e456081532862/gpl_oss_of_realtek_sdk3/kernel/uClinux/vendors/Realtek/SDK/defConf/8390/uboot.config#L194 Realtek SDK, RTL8390 default configuration (TRENDnet TEG-S750 GPL code)
     */
    RealtekRtl839x,

    /**
     * Default of the Realtek switch SDK for RTL8396
     * (`CONFIG_IH_MAGIC_NUMBER`). No firmware image with this magic was found
     * among the ones surveyed (September 2026), so it may not be used in
     * practice.
     * \sa https://github.com/danieltwagner/teg-s750/blob/13b8db10b2600382be2e3126195e456081532862/gpl_oss_of_realtek_sdk3/kernel/uClinux/vendors/Realtek/SDK/defConf/8396msc/uboot.config#L165 Realtek SDK, RTL8396 default configuration (TRENDnet TEG-S750 GPL code)
     */
    RealtekRtl8396,

    /**
     * EnGenius EWS1200-52T firmware 1.05.38 to 1.06.21.
     * \sa https://www.engeniustech.com/wp_firmware/ews1200-52t_fw_1.06.21_c1.8.77_180906-0654.bix EnGenius EWS1200-52T firmware 1.06.21
     */
    EngeniusEws120052tOldFw,

    /**
     * EnGenius EGS7252FP firmware 1.05.05.
     * \sa https://www.engeniustech.com/wp_firmware/egs7252fp_fw_1.05.05_141210-1838.bix EnGenius EGS7252FP firmware 1.05.05
     */
    EngeniusEgs7252fpOldFw,

    /**
     * EnGenius EWS7952FP firmware 1.05.38 to 1.06.21.
     * \sa https://www.engeniustech.com/wp_firmware/ews7952fp_fw_1.06.21_c1.8.77_180906-0643.bix EnGenius EWS7952FP firmware 1.06.21
     */
    EngeniusEws7952fpOldFw,

    /**
     * Default of the Realtek switch SDK for RTL930x
     * (`CONFIG_IH_MAGIC_NUMBER`), used e.g. by TRENDnet and Ubiquiti UISP-S
     * switches. EnGenius ECS1528FP (`image/series_vmlinux.bix` in the tar
     * archive that follows a 64-byte header in the `.imag` firmware file, i.e.
     * at offset 0x240). OpenWrt devices `sirivision_sr-st3408f`,
     * `sirivision_sr-st3808f`, `keeplink_kp-9000-8xm`, `plasmacloud-common`,
     * `vimin_vm-s100-0800ms`, `xikestor_sks8300-8t`,
     * `xikestor_sks8300-12e2t2x`, `xikestor_sks8310-8x`,
     * `sirivision_sr-st31212f`.
     * \sa https://www.engeniustech.com/wp_firmware/ECS1528FP-RTL93xx_fw_1.1.40-3.01.149_20201008-1907.imag EnGenius ECS1528FP firmware
     * \sa https://github.com/openwrt/openwrt/blob/138fabb79f8d68d65e40c8b8d0c0494b19053d0f/target/linux/realtek/image/rtl930x.mk#L27 OpenWrt, `sirivision_sr-st3408f`
     * \sa https://github.com/openwrt/openwrt/blob/138fabb79f8d68d65e40c8b8d0c0494b19053d0f/target/linux/realtek/image/rtl930x.mk#L38 OpenWrt, `sirivision_sr-st3808f`
     * \sa https://github.com/openwrt/openwrt/blob/138fabb79f8d68d65e40c8b8d0c0494b19053d0f/target/linux/realtek/image/rtl930x.mk#L165 OpenWrt, `keeplink_kp-9000-8xm`
     * \sa https://github.com/openwrt/openwrt/blob/138fabb79f8d68d65e40c8b8d0c0494b19053d0f/target/linux/realtek/image/rtl930x.mk#L204 OpenWrt, `plasmacloud-common`
     * \sa https://github.com/openwrt/openwrt/blob/138fabb79f8d68d65e40c8b8d0c0494b19053d0f/target/linux/realtek/image/rtl930x.mk#L268 OpenWrt, `vimin_vm-s100-0800ms`
     * \sa https://github.com/openwrt/openwrt/blob/138fabb79f8d68d65e40c8b8d0c0494b19053d0f/target/linux/realtek/image/rtl930x.mk#L305 OpenWrt, `xikestor_sks8300-8t`
     * \sa https://github.com/openwrt/openwrt/blob/138fabb79f8d68d65e40c8b8d0c0494b19053d0f/target/linux/realtek/image/rtl930x.mk#L339 OpenWrt, `xikestor_sks8300-12e2t2x`
     * \sa https://github.com/openwrt/openwrt/blob/138fabb79f8d68d65e40c8b8d0c0494b19053d0f/target/linux/realtek/image/rtl930x.mk#L358 OpenWrt, `xikestor_sks8310-8x`
     * \sa https://github.com/openwrt/openwrt/blob/138fabb79f8d68d65e40c8b8d0c0494b19053d0f/target/linux/realtek/image/rtl931x.mk#L71 OpenWrt, `sirivision_sr-st31212f`
     * \sa https://github.com/danieltwagner/teg-s750/blob/13b8db10b2600382be2e3126195e456081532862/gpl_oss_of_realtek_sdk3/kernel/uClinux/vendors/Realtek/SDK/defConf/9300/uboot.config#L196 Realtek SDK, RTL9300 default configuration (TRENDnet TEG-S750 GPL code)
     * \sa https://dl.ui.com/firmwares/uisps/1.5.0/UISPS.rtl930x.v1.5.0.bix Ubiquiti UISP-S firmware 1.5.0 (RTL930x)
     */
    RealtekRtl930x,

    /**
     * OpenWrt device `zyxel_xgs1010-12`.
     * \sa https://github.com/openwrt/openwrt/blob/138fabb79f8d68d65e40c8b8d0c0494b19053d0f/target/linux/realtek/image/common.mk#L106 OpenWrt, `zyxel_xgs1010-12`
     * \sa https://downloads.openwrt.org/releases/25.12.5/targets/realtek/rtl930x/openwrt-25.12.5-realtek-rtl930x-zyxel_xgs1010-12-a1-squashfs-sysupgrade.bin OpenWrt 25.12.5, `zyxel_xgs1010-12-a1`
     */
    ZyxelXgs101012,

    /**
     * OpenWrt device `zyxel_xgs1210-12`.
     * \sa https://github.com/openwrt/openwrt/blob/138fabb79f8d68d65e40c8b8d0c0494b19053d0f/target/linux/realtek/image/common.mk#L116 OpenWrt, `zyxel_xgs1210-12`
     * \sa https://download.zyxel.com/XGS1210-12/firmware/XGS1210-12_V2.00(ABTY.0)C0.zip ZyXEL XGS1210-12 firmware 2.00(ABTY.0)C0
     */
    ZyxelXgs121012,

    /**
     * OpenWrt device `zyxel_xgs1250-12-common`.
     * \sa https://github.com/openwrt/openwrt/blob/138fabb79f8d68d65e40c8b8d0c0494b19053d0f/target/linux/realtek/image/rtl930x.mk#L402 OpenWrt, `zyxel_xgs1250-12-common`
     * \sa https://download.zyxel.com/XGS1250-12/firmware/XGS1250-12_2.00(ABWE.0)C0.zip ZyXEL XGS1250-12 firmware 2.00(ABWE.0)C0
     */
    ZyxelXgs125012,

    /**
     * OpenWrt devices `nicgiga_s100-0800s-m`, `tplink_tl-st1008f-v2`.
     * \sa https://github.com/openwrt/openwrt/blob/138fabb79f8d68d65e40c8b8d0c0494b19053d0f/target/linux/realtek/image/rtl930x.mk#L193 OpenWrt, `nicgiga_s100-0800s-m`
     * \sa https://github.com/openwrt/openwrt/blob/138fabb79f8d68d65e40c8b8d0c0494b19053d0f/target/linux/realtek/image/rtl930x.mk#L236 OpenWrt, `tplink_tl-st1008f-v2`
     * \sa https://downloads.openwrt.org/snapshots/targets/realtek/rtl930x/openwrt-realtek-rtl930x-nicgiga_s100-0800s-m-squashfs-sysupgrade.bin OpenWrt snapshot, `nicgiga_s100-0800s-m`
     */
    NicgigaS1000800sM,

    /**
     * OpenWrt device `plasmacloud-common`.
     * \sa https://github.com/openwrt/openwrt/blob/138fabb79f8d68d65e40c8b8d0c0494b19053d0f/target/linux/realtek/image/rtl931x.mk#L40 OpenWrt, `plasmacloud-common`
     * \sa https://downloads.openwrt.org/releases/25.12.5/targets/realtek/rtl931x/openwrt-25.12.5-realtek-rtl931x-plasmacloud_psx28-squashfs-factory.bin OpenWrt 25.12.5, `plasmacloud_psx28`
     */
    PlasmacloudPsx28,
    Unknown(i64),
}

impl TryFrom<i64> for Uimage_MagicTypes {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<Uimage_MagicTypes> {
        match flag {
            5 => Ok(Uimage_MagicTypes::AllnetAllSg8316m),
            6 => Ok(Uimage_MagicTypes::AllnetAllSg8208m),
            22 => Ok(Uimage_MagicTypes::AllnetAllSg8324m),
            7353344 => Ok(Uimage_MagicTypes::DattoL8),
            9453568 => Ok(Uimage_MagicTypes::AllnetAllWapc0450c),
            50398464 => Ok(Uimage_MagicTypes::EngeniusEws2910pV3),
            50402048 => Ok(Uimage_MagicTypes::EngeniusEws120028tfp),
            50402050 => Ok(Uimage_MagicTypes::EngeniusEws7926efp),
            50406401 => Ok(Uimage_MagicTypes::EngeniusEws7952p),
            50409728 => Ok(Uimage_MagicTypes::EngeniusEws2908p),
            51450112 => Ok(Uimage_MagicTypes::EngeniusEws7928pV2),
            51450624 => Ok(Uimage_MagicTypes::EngeniusEws120028tfpV2),
            58730768 => Ok(Uimage_MagicTypes::EngeniusEws2910p),
            58743058 => Ok(Uimage_MagicTypes::EngeniusEws5912fp),
            58751272 => Ok(Uimage_MagicTypes::EngeniusEws7928p),
            59187216 => Ok(Uimage_MagicTypes::EngeniusEws1200d10t),
            59187240 => Ok(Uimage_MagicTypes::EngeniusEws120028t),
            59216527 => Ok(Uimage_MagicTypes::EngeniusEws7928fp),
            60235858 => Ok(Uimage_MagicTypes::EngeniusEws120052t),
            60265775 => Ok(Uimage_MagicTypes::EngeniusEws7952fp),
            304680960 => Ok(Uimage_MagicTypes::YoukuYkL1),
            305418240 => Ok(Uimage_MagicTypes::RealtekSdk),
            391006017 => Ok(Uimage_MagicTypes::NetgearGs750e),
            391006018 => Ok(Uimage_MagicTypes::NetgearGs728tpV2),
            638656533 => Ok(Uimage_MagicTypes::BoltBl100),
            654645590 => Ok(Uimage_MagicTypes::Uimage),
            654645607 => Ok(Uimage_MagicTypes::NetgearWnce4004),
            808857906 => Ok(Uimage_MagicTypes::NetgearWnr612V2Early),
            825241648 => Ok(Uimage_MagicTypes::NetgearWnr1000V2Vc),
            825241649 => Ok(Uimage_MagicTypes::NetgearWnr1000V2),
            825241650 => Ok(Uimage_MagicTypes::NetgearWnr1000V2Vm),
            825241652 => Ok(Uimage_MagicTypes::NetgearWnr1000V4),
            825307184 => Ok(Uimage_MagicTypes::NetgearWpn824n),
            827343191 => Ok(Uimage_MagicTypes::ZyxelUag50),
            842018865 => Ok(Uimage_MagicTypes::NetgearWnr2000),
            842018867 => Ok(Uimage_MagicTypes::NetgearWnr2000V3),
            842018868 => Ok(Uimage_MagicTypes::NetgearWnr2000V4),
            842020401 => Ok(Uimage_MagicTypes::NetgearWnr612V2),
            842149936 => Ok(Uimage_MagicTypes::NetgearWnr2200),
            859254832 => Ok(Uimage_MagicTypes::NetgearWndr3700),
            859254833 => Ok(Uimage_MagicTypes::NetgearWndr3700V2),
            859254835 => Ok(Uimage_MagicTypes::NetgearWndr3700V4),
            909127728 => Ok(Uimage_MagicTypes::NetgearR6100),
            909193778 => Ok(Uimage_MagicTypes::NetgearWnr612),
            1129270594 => Ok(Uimage_MagicTypes::MitrastarComb),
            1129270595 => Ok(Uimage_MagicTypes::MitrastarComc),
            1313293109 => Ok(Uimage_MagicTypes::NetgearGs308t),
            1313293600 => Ok(Uimage_MagicTypes::NetgearNge),
            1313293856 => Ok(Uimage_MagicTypes::NetgearNgf),
            1313294112 => Ok(Uimage_MagicTypes::NetgearNgg),
            1313294368 => Ok(Uimage_MagicTypes::NetgearNgh),
            1313294624 => Ok(Uimage_MagicTypes::NetgearNgi),
            1313296416 => Ok(Uimage_MagicTypes::NetgearNgp),
            1330334793 => Ok(Uimage_MagicTypes::OpenwrtOkli),
            1752396147 => Ok(Uimage_MagicTypes::OpenwrtDlinkCovr),
            1936805707 => Ok(Uimage_MagicTypes::OpenwrtSenaoOkli),
            2155872258 => Ok(Uimage_MagicTypes::EngeniusEcs1112fp),
            2197885696 => Ok(Uimage_MagicTypes::EngeniusEws120028tfpOldFw),
            2197885698 => Ok(Uimage_MagicTypes::EngeniusEws7926efpOldFw),
            2197890049 => Ok(Uimage_MagicTypes::EngeniusEws7952pOldFw),
            2206203904 => Ok(Uimage_MagicTypes::RealtekRtl838x),
            2206203905 => Ok(Uimage_MagicTypes::IodataBshG08m),
            2206203906 => Ok(Uimage_MagicTypes::IodataBshGp08),
            2206203907 => Ok(Uimage_MagicTypes::IodataBshG16m),
            2206203908 => Ok(Uimage_MagicTypes::IodataBshG24m),
            2206203920 => Ok(Uimage_MagicTypes::IodataBshG08mb),
            2206203921 => Ok(Uimage_MagicTypes::IodataBshGp08mb),
            2206203922 => Ok(Uimage_MagicTypes::IodataBshG16mb),
            2206203923 => Ok(Uimage_MagicTypes::IodataBshG24mb),
            2206210573 => Ok(Uimage_MagicTypes::TrendnetTpe3012ls),
            2206210574 => Ok(Uimage_MagicTypes::TrendnetTpe3018ls),
            2206212360 => Ok(Uimage_MagicTypes::EngeniusEgs2108pOldFw),
            2206212368 => Ok(Uimage_MagicTypes::EngeniusEgs2110pOldFw),
            2206214416 => Ok(Uimage_MagicTypes::EngeniusEws2910pOldFw),
            2206224656 => Ok(Uimage_MagicTypes::EngeniusEgs5110pOldFw),
            2206224914 => Ok(Uimage_MagicTypes::EngeniusEgs5212fpOldFw),
            2206226706 => Ok(Uimage_MagicTypes::EngeniusEws5912fpOldFw),
            2206234920 => Ok(Uimage_MagicTypes::EngeniusEws7928pOldFw),
            2206670864 => Ok(Uimage_MagicTypes::EngeniusEws1200d10tOldFw),
            2206670888 => Ok(Uimage_MagicTypes::EngeniusEws120028tOldFw),
            2206671503 => Ok(Uimage_MagicTypes::EngeniusEgs7228fpOldFw),
            2206700175 => Ok(Uimage_MagicTypes::EngeniusEws7928fpOldFw),
            2207252480 => Ok(Uimage_MagicTypes::RealtekRtl839x),
            2207645696 => Ok(Uimage_MagicTypes::RealtekRtl8396),
            2207719506 => Ok(Uimage_MagicTypes::EngeniusEws120052tOldFw),
            2207720751 => Ok(Uimage_MagicTypes::EngeniusEgs7252fpOldFw),
            2207749423 => Ok(Uimage_MagicTypes::EngeniusEws7952fpOldFw),
            2466250752 => Ok(Uimage_MagicTypes::RealtekRtl930x),
            2466254864 => Ok(Uimage_MagicTypes::ZyxelXgs101012),
            2466255376 => Ok(Uimage_MagicTypes::ZyxelXgs121012),
            2466255440 => Ok(Uimage_MagicTypes::ZyxelXgs125012),
            2466447360 => Ok(Uimage_MagicTypes::NicgigaS1000800sM),
            2467299328 => Ok(Uimage_MagicTypes::PlasmacloudPsx28),
            _ => Ok(Uimage_MagicTypes::Unknown(flag)),
        }
    }
}

impl From<&Uimage_MagicTypes> for i64 {
    fn from(v: &Uimage_MagicTypes) -> Self {
        match *v {
            Uimage_MagicTypes::AllnetAllSg8316m => 5,
            Uimage_MagicTypes::AllnetAllSg8208m => 6,
            Uimage_MagicTypes::AllnetAllSg8324m => 22,
            Uimage_MagicTypes::DattoL8 => 7353344,
            Uimage_MagicTypes::AllnetAllWapc0450c => 9453568,
            Uimage_MagicTypes::EngeniusEws2910pV3 => 50398464,
            Uimage_MagicTypes::EngeniusEws120028tfp => 50402048,
            Uimage_MagicTypes::EngeniusEws7926efp => 50402050,
            Uimage_MagicTypes::EngeniusEws7952p => 50406401,
            Uimage_MagicTypes::EngeniusEws2908p => 50409728,
            Uimage_MagicTypes::EngeniusEws7928pV2 => 51450112,
            Uimage_MagicTypes::EngeniusEws120028tfpV2 => 51450624,
            Uimage_MagicTypes::EngeniusEws2910p => 58730768,
            Uimage_MagicTypes::EngeniusEws5912fp => 58743058,
            Uimage_MagicTypes::EngeniusEws7928p => 58751272,
            Uimage_MagicTypes::EngeniusEws1200d10t => 59187216,
            Uimage_MagicTypes::EngeniusEws120028t => 59187240,
            Uimage_MagicTypes::EngeniusEws7928fp => 59216527,
            Uimage_MagicTypes::EngeniusEws120052t => 60235858,
            Uimage_MagicTypes::EngeniusEws7952fp => 60265775,
            Uimage_MagicTypes::YoukuYkL1 => 304680960,
            Uimage_MagicTypes::RealtekSdk => 305418240,
            Uimage_MagicTypes::NetgearGs750e => 391006017,
            Uimage_MagicTypes::NetgearGs728tpV2 => 391006018,
            Uimage_MagicTypes::BoltBl100 => 638656533,
            Uimage_MagicTypes::Uimage => 654645590,
            Uimage_MagicTypes::NetgearWnce4004 => 654645607,
            Uimage_MagicTypes::NetgearWnr612V2Early => 808857906,
            Uimage_MagicTypes::NetgearWnr1000V2Vc => 825241648,
            Uimage_MagicTypes::NetgearWnr1000V2 => 825241649,
            Uimage_MagicTypes::NetgearWnr1000V2Vm => 825241650,
            Uimage_MagicTypes::NetgearWnr1000V4 => 825241652,
            Uimage_MagicTypes::NetgearWpn824n => 825307184,
            Uimage_MagicTypes::ZyxelUag50 => 827343191,
            Uimage_MagicTypes::NetgearWnr2000 => 842018865,
            Uimage_MagicTypes::NetgearWnr2000V3 => 842018867,
            Uimage_MagicTypes::NetgearWnr2000V4 => 842018868,
            Uimage_MagicTypes::NetgearWnr612V2 => 842020401,
            Uimage_MagicTypes::NetgearWnr2200 => 842149936,
            Uimage_MagicTypes::NetgearWndr3700 => 859254832,
            Uimage_MagicTypes::NetgearWndr3700V2 => 859254833,
            Uimage_MagicTypes::NetgearWndr3700V4 => 859254835,
            Uimage_MagicTypes::NetgearR6100 => 909127728,
            Uimage_MagicTypes::NetgearWnr612 => 909193778,
            Uimage_MagicTypes::MitrastarComb => 1129270594,
            Uimage_MagicTypes::MitrastarComc => 1129270595,
            Uimage_MagicTypes::NetgearGs308t => 1313293109,
            Uimage_MagicTypes::NetgearNge => 1313293600,
            Uimage_MagicTypes::NetgearNgf => 1313293856,
            Uimage_MagicTypes::NetgearNgg => 1313294112,
            Uimage_MagicTypes::NetgearNgh => 1313294368,
            Uimage_MagicTypes::NetgearNgi => 1313294624,
            Uimage_MagicTypes::NetgearNgp => 1313296416,
            Uimage_MagicTypes::OpenwrtOkli => 1330334793,
            Uimage_MagicTypes::OpenwrtDlinkCovr => 1752396147,
            Uimage_MagicTypes::OpenwrtSenaoOkli => 1936805707,
            Uimage_MagicTypes::EngeniusEcs1112fp => 2155872258,
            Uimage_MagicTypes::EngeniusEws120028tfpOldFw => 2197885696,
            Uimage_MagicTypes::EngeniusEws7926efpOldFw => 2197885698,
            Uimage_MagicTypes::EngeniusEws7952pOldFw => 2197890049,
            Uimage_MagicTypes::RealtekRtl838x => 2206203904,
            Uimage_MagicTypes::IodataBshG08m => 2206203905,
            Uimage_MagicTypes::IodataBshGp08 => 2206203906,
            Uimage_MagicTypes::IodataBshG16m => 2206203907,
            Uimage_MagicTypes::IodataBshG24m => 2206203908,
            Uimage_MagicTypes::IodataBshG08mb => 2206203920,
            Uimage_MagicTypes::IodataBshGp08mb => 2206203921,
            Uimage_MagicTypes::IodataBshG16mb => 2206203922,
            Uimage_MagicTypes::IodataBshG24mb => 2206203923,
            Uimage_MagicTypes::TrendnetTpe3012ls => 2206210573,
            Uimage_MagicTypes::TrendnetTpe3018ls => 2206210574,
            Uimage_MagicTypes::EngeniusEgs2108pOldFw => 2206212360,
            Uimage_MagicTypes::EngeniusEgs2110pOldFw => 2206212368,
            Uimage_MagicTypes::EngeniusEws2910pOldFw => 2206214416,
            Uimage_MagicTypes::EngeniusEgs5110pOldFw => 2206224656,
            Uimage_MagicTypes::EngeniusEgs5212fpOldFw => 2206224914,
            Uimage_MagicTypes::EngeniusEws5912fpOldFw => 2206226706,
            Uimage_MagicTypes::EngeniusEws7928pOldFw => 2206234920,
            Uimage_MagicTypes::EngeniusEws1200d10tOldFw => 2206670864,
            Uimage_MagicTypes::EngeniusEws120028tOldFw => 2206670888,
            Uimage_MagicTypes::EngeniusEgs7228fpOldFw => 2206671503,
            Uimage_MagicTypes::EngeniusEws7928fpOldFw => 2206700175,
            Uimage_MagicTypes::RealtekRtl839x => 2207252480,
            Uimage_MagicTypes::RealtekRtl8396 => 2207645696,
            Uimage_MagicTypes::EngeniusEws120052tOldFw => 2207719506,
            Uimage_MagicTypes::EngeniusEgs7252fpOldFw => 2207720751,
            Uimage_MagicTypes::EngeniusEws7952fpOldFw => 2207749423,
            Uimage_MagicTypes::RealtekRtl930x => 2466250752,
            Uimage_MagicTypes::ZyxelXgs101012 => 2466254864,
            Uimage_MagicTypes::ZyxelXgs121012 => 2466255376,
            Uimage_MagicTypes::ZyxelXgs125012 => 2466255440,
            Uimage_MagicTypes::NicgigaS1000800sM => 2466447360,
            Uimage_MagicTypes::PlasmacloudPsx28 => 2467299328,
            Uimage_MagicTypes::Unknown(v) => v
        }
    }
}

impl Default for Uimage_MagicTypes {
    fn default() -> Self { Uimage_MagicTypes::Unknown(0) }
}

#[derive(Debug, PartialEq, Clone)]
pub enum Uimage_UimageArch {

    /**
     * Invalid CPU
     */
    Invalid,

    /**
     * Alpha
     */
    Alpha,

    /**
     * ARM
     */
    Arm,

    /**
     * Intel x86
     */
    I386,

    /**
     * IA64
     */
    Ia64,

    /**
     * MIPS
     */
    Mips,

    /**
     * MIPS 64 Bit
     */
    Mips64,

    /**
     * PowerPC
     */
    Ppc,

    /**
     * IBM S390
     */
    S390,

    /**
     * SuperH
     */
    Sh,

    /**
     * Sparc
     */
    Sparc,

    /**
     * Sparc 64 Bit
     */
    Sparc64,

    /**
     * M68K
     */
    M68k,

    /**
     * Nios-32
     */
    Nios,

    /**
     * MicroBlaze
     */
    Microblaze,

    /**
     * Nios-II
     */
    Nios2,

    /**
     * Blackfin
     */
    Blackfin,

    /**
     * AVR32
     */
    Avr32,

    /**
     * STMicroelectronics ST200
     */
    St200,

    /**
     * Sandbox architecture (test only)
     */
    Sandbox,

    /**
     * ANDES Technology - NDS32
     */
    Nds32,

    /**
     * OpenRISC 1000
     */
    Openrisc,

    /**
     * ARM64
     */
    Arm64,

    /**
     * Synopsys DesignWare ARC
     */
    Arc,

    /**
     * AMD x86_64, Intel and Via
     */
    X8664,

    /**
     * Xtensa
     */
    Xtensa,

    /**
     * RISC-V
     */
    Riscv,
    Unknown(i64),
}

impl TryFrom<i64> for Uimage_UimageArch {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<Uimage_UimageArch> {
        match flag {
            0 => Ok(Uimage_UimageArch::Invalid),
            1 => Ok(Uimage_UimageArch::Alpha),
            2 => Ok(Uimage_UimageArch::Arm),
            3 => Ok(Uimage_UimageArch::I386),
            4 => Ok(Uimage_UimageArch::Ia64),
            5 => Ok(Uimage_UimageArch::Mips),
            6 => Ok(Uimage_UimageArch::Mips64),
            7 => Ok(Uimage_UimageArch::Ppc),
            8 => Ok(Uimage_UimageArch::S390),
            9 => Ok(Uimage_UimageArch::Sh),
            10 => Ok(Uimage_UimageArch::Sparc),
            11 => Ok(Uimage_UimageArch::Sparc64),
            12 => Ok(Uimage_UimageArch::M68k),
            13 => Ok(Uimage_UimageArch::Nios),
            14 => Ok(Uimage_UimageArch::Microblaze),
            15 => Ok(Uimage_UimageArch::Nios2),
            16 => Ok(Uimage_UimageArch::Blackfin),
            17 => Ok(Uimage_UimageArch::Avr32),
            18 => Ok(Uimage_UimageArch::St200),
            19 => Ok(Uimage_UimageArch::Sandbox),
            20 => Ok(Uimage_UimageArch::Nds32),
            21 => Ok(Uimage_UimageArch::Openrisc),
            22 => Ok(Uimage_UimageArch::Arm64),
            23 => Ok(Uimage_UimageArch::Arc),
            24 => Ok(Uimage_UimageArch::X8664),
            25 => Ok(Uimage_UimageArch::Xtensa),
            26 => Ok(Uimage_UimageArch::Riscv),
            _ => Ok(Uimage_UimageArch::Unknown(flag)),
        }
    }
}

impl From<&Uimage_UimageArch> for i64 {
    fn from(v: &Uimage_UimageArch) -> Self {
        match *v {
            Uimage_UimageArch::Invalid => 0,
            Uimage_UimageArch::Alpha => 1,
            Uimage_UimageArch::Arm => 2,
            Uimage_UimageArch::I386 => 3,
            Uimage_UimageArch::Ia64 => 4,
            Uimage_UimageArch::Mips => 5,
            Uimage_UimageArch::Mips64 => 6,
            Uimage_UimageArch::Ppc => 7,
            Uimage_UimageArch::S390 => 8,
            Uimage_UimageArch::Sh => 9,
            Uimage_UimageArch::Sparc => 10,
            Uimage_UimageArch::Sparc64 => 11,
            Uimage_UimageArch::M68k => 12,
            Uimage_UimageArch::Nios => 13,
            Uimage_UimageArch::Microblaze => 14,
            Uimage_UimageArch::Nios2 => 15,
            Uimage_UimageArch::Blackfin => 16,
            Uimage_UimageArch::Avr32 => 17,
            Uimage_UimageArch::St200 => 18,
            Uimage_UimageArch::Sandbox => 19,
            Uimage_UimageArch::Nds32 => 20,
            Uimage_UimageArch::Openrisc => 21,
            Uimage_UimageArch::Arm64 => 22,
            Uimage_UimageArch::Arc => 23,
            Uimage_UimageArch::X8664 => 24,
            Uimage_UimageArch::Xtensa => 25,
            Uimage_UimageArch::Riscv => 26,
            Uimage_UimageArch::Unknown(v) => v
        }
    }
}

impl Default for Uimage_UimageArch {
    fn default() -> Self { Uimage_UimageArch::Unknown(0) }
}

#[derive(Debug, PartialEq, Clone)]
pub enum Uimage_UimageComp {

    /**
     * No Compression Used
     */
    None,
    Gzip,
    Bzip2,
    Lzma,
    Lzo,
    Lz4,
    Zstd,

    /**
     * `IH_COMP_MZ` of the U-Boot fork for SigmaStar (formerly MStar) SoCs,
     * not defined in upstream U-Boot. Used e.g. in I-O DATA TS-NS240W and
     * TS-NS320W network camera firmware.
     * \sa https://github.com/OpenIPC/u-boot-sigmastar/blob/bf77aff5d44f34d14b89b3f4014aa8dda9834794/include/image.h#L253 SigmaStar U-Boot (OpenIPC's copy)
     * \sa https://lib.iodata.jp/lib/soft/t/tsns240w_f10302.exe I-O DATA TS-NS240W firmware 1.03.02
     */
    Mz,

    /**
     * `IH_COMP_XIP` of the U-Boot fork for SigmaStar (formerly MStar) SoCs,
     * not defined in upstream U-Boot. No firmware image with this value was
     * found among the ones surveyed (September 2026), so it may not be used
     * in practice.
     * \sa https://github.com/OpenIPC/u-boot-sigmastar/blob/bf77aff5d44f34d14b89b3f4014aa8dda9834794/include/image.h#L254 SigmaStar U-Boot (OpenIPC's copy)
     */
    Xip,
    Unknown(i64),
}

impl TryFrom<i64> for Uimage_UimageComp {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<Uimage_UimageComp> {
        match flag {
            0 => Ok(Uimage_UimageComp::None),
            1 => Ok(Uimage_UimageComp::Gzip),
            2 => Ok(Uimage_UimageComp::Bzip2),
            3 => Ok(Uimage_UimageComp::Lzma),
            4 => Ok(Uimage_UimageComp::Lzo),
            5 => Ok(Uimage_UimageComp::Lz4),
            6 => Ok(Uimage_UimageComp::Zstd),
            9 => Ok(Uimage_UimageComp::Mz),
            10 => Ok(Uimage_UimageComp::Xip),
            _ => Ok(Uimage_UimageComp::Unknown(flag)),
        }
    }
}

impl From<&Uimage_UimageComp> for i64 {
    fn from(v: &Uimage_UimageComp) -> Self {
        match *v {
            Uimage_UimageComp::None => 0,
            Uimage_UimageComp::Gzip => 1,
            Uimage_UimageComp::Bzip2 => 2,
            Uimage_UimageComp::Lzma => 3,
            Uimage_UimageComp::Lzo => 4,
            Uimage_UimageComp::Lz4 => 5,
            Uimage_UimageComp::Zstd => 6,
            Uimage_UimageComp::Mz => 9,
            Uimage_UimageComp::Xip => 10,
            Uimage_UimageComp::Unknown(v) => v
        }
    }
}

impl Default for Uimage_UimageComp {
    fn default() -> Self { Uimage_UimageComp::Unknown(0) }
}

#[derive(Debug, PartialEq, Clone)]
pub enum Uimage_UimageOs {

    /**
     * Invalid OS
     */
    Invalid,

    /**
     * OpenBSD
     */
    Openbsd,

    /**
     * NetBSD
     */
    Netbsd,

    /**
     * FreeBSD
     */
    Freebsd,

    /**
     * 4.4BSD
     */
    Bsd44,

    /**
     * Linux
     */
    Linux,

    /**
     * SVR4
     */
    Svr4,

    /**
     * Esix
     */
    Esix,

    /**
     * Solaris
     */
    Solaris,

    /**
     * Irix
     */
    Irix,

    /**
     * SCO
     */
    Sco,

    /**
     * Dell
     */
    Dell,

    /**
     * NCR
     */
    Ncr,

    /**
     * LynxOS
     */
    Lynxos,

    /**
     * VxWorks
     */
    Vxworks,

    /**
     * pSOS
     */
    Psos,

    /**
     * QNX
     */
    Qnx,

    /**
     * Firmware
     */
    UBoot,

    /**
     * RTEMS
     */
    Rtems,

    /**
     * ARTOS
     */
    Artos,

    /**
     * Unity OS
     */
    Unity,

    /**
     * INTEGRITY
     */
    Integrity,

    /**
     * OSE
     */
    Ose,

    /**
     * Plan 9
     */
    Plan9,

    /**
     * OpenRTOS
     */
    Openrtos,

    /**
     * ARM Trusted Firmware
     */
    ArmTrustedFirmware,

    /**
     * Trusted Execution Environment
     */
    Tee,

    /**
     * RISC-V OpenSBI
     */
    Opensbi,

    /**
     * EFI Firmware (e.g. GRUB2)
     */
    Efi,

    /**
     * ELF Image (e.g. seL4)
     */
    Elf,
    Unknown(i64),
}

impl TryFrom<i64> for Uimage_UimageOs {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<Uimage_UimageOs> {
        match flag {
            0 => Ok(Uimage_UimageOs::Invalid),
            1 => Ok(Uimage_UimageOs::Openbsd),
            2 => Ok(Uimage_UimageOs::Netbsd),
            3 => Ok(Uimage_UimageOs::Freebsd),
            4 => Ok(Uimage_UimageOs::Bsd44),
            5 => Ok(Uimage_UimageOs::Linux),
            6 => Ok(Uimage_UimageOs::Svr4),
            7 => Ok(Uimage_UimageOs::Esix),
            8 => Ok(Uimage_UimageOs::Solaris),
            9 => Ok(Uimage_UimageOs::Irix),
            10 => Ok(Uimage_UimageOs::Sco),
            11 => Ok(Uimage_UimageOs::Dell),
            12 => Ok(Uimage_UimageOs::Ncr),
            13 => Ok(Uimage_UimageOs::Lynxos),
            14 => Ok(Uimage_UimageOs::Vxworks),
            15 => Ok(Uimage_UimageOs::Psos),
            16 => Ok(Uimage_UimageOs::Qnx),
            17 => Ok(Uimage_UimageOs::UBoot),
            18 => Ok(Uimage_UimageOs::Rtems),
            19 => Ok(Uimage_UimageOs::Artos),
            20 => Ok(Uimage_UimageOs::Unity),
            21 => Ok(Uimage_UimageOs::Integrity),
            22 => Ok(Uimage_UimageOs::Ose),
            23 => Ok(Uimage_UimageOs::Plan9),
            24 => Ok(Uimage_UimageOs::Openrtos),
            25 => Ok(Uimage_UimageOs::ArmTrustedFirmware),
            26 => Ok(Uimage_UimageOs::Tee),
            27 => Ok(Uimage_UimageOs::Opensbi),
            28 => Ok(Uimage_UimageOs::Efi),
            29 => Ok(Uimage_UimageOs::Elf),
            _ => Ok(Uimage_UimageOs::Unknown(flag)),
        }
    }
}

impl From<&Uimage_UimageOs> for i64 {
    fn from(v: &Uimage_UimageOs) -> Self {
        match *v {
            Uimage_UimageOs::Invalid => 0,
            Uimage_UimageOs::Openbsd => 1,
            Uimage_UimageOs::Netbsd => 2,
            Uimage_UimageOs::Freebsd => 3,
            Uimage_UimageOs::Bsd44 => 4,
            Uimage_UimageOs::Linux => 5,
            Uimage_UimageOs::Svr4 => 6,
            Uimage_UimageOs::Esix => 7,
            Uimage_UimageOs::Solaris => 8,
            Uimage_UimageOs::Irix => 9,
            Uimage_UimageOs::Sco => 10,
            Uimage_UimageOs::Dell => 11,
            Uimage_UimageOs::Ncr => 12,
            Uimage_UimageOs::Lynxos => 13,
            Uimage_UimageOs::Vxworks => 14,
            Uimage_UimageOs::Psos => 15,
            Uimage_UimageOs::Qnx => 16,
            Uimage_UimageOs::UBoot => 17,
            Uimage_UimageOs::Rtems => 18,
            Uimage_UimageOs::Artos => 19,
            Uimage_UimageOs::Unity => 20,
            Uimage_UimageOs::Integrity => 21,
            Uimage_UimageOs::Ose => 22,
            Uimage_UimageOs::Plan9 => 23,
            Uimage_UimageOs::Openrtos => 24,
            Uimage_UimageOs::ArmTrustedFirmware => 25,
            Uimage_UimageOs::Tee => 26,
            Uimage_UimageOs::Opensbi => 27,
            Uimage_UimageOs::Efi => 28,
            Uimage_UimageOs::Elf => 29,
            Uimage_UimageOs::Unknown(v) => v
        }
    }
}

impl Default for Uimage_UimageOs {
    fn default() -> Self { Uimage_UimageOs::Unknown(0) }
}

#[derive(Debug, PartialEq, Clone)]
pub enum Uimage_UimageType {

    /**
     * Invalid Image
     */
    Invalid,

    /**
     * Standalone Program
     */
    Standalone,

    /**
     * OS Kernel Image
     */
    Kernel,

    /**
     * RAMDisk Image
     */
    Ramdisk,

    /**
     * Multi-File Image
     */
    Multi,

    /**
     * Firmware Image
     */
    Firmware,

    /**
     * Script file
     */
    Script,

    /**
     * Filesystem Image (any type)
     */
    Filesystem,

    /**
     * Binary Flat Device Tree Blob
     */
    Flatdt,

    /**
     * Kirkwood Boot Image
     */
    Kwbimage,

    /**
     * Freescale IMXBoot Image
     */
    Imximage,

    /**
     * Davinci UBL Image
     */
    Ublimage,

    /**
     * TI OMAP Config Header Image
     */
    Omapimage,

    /**
     * TI Davinci AIS Image
     */
    Aisimage,

    /**
     * OS Kernel Image, can run from any load address
     */
    KernelNoload,

    /**
     * Freescale PBL Boot Image
     */
    Pblimage,

    /**
     * Freescale MXSBoot Image
     */
    Mxsimage,

    /**
     * TI Keystone GPHeader Image
     */
    Gpimage,

    /**
     * ATMEL ROM bootable Image
     */
    Atmelimage,

    /**
     * Altera SOCFPGA CV/AV Preloader
     */
    Socfpgaimage,

    /**
     * x86 setup.bin Image
     */
    X86Setup,

    /**
     * x86 setup.bin Image
     */
    Lpc32xximage,

    /**
     * A list of typeless images
     */
    Loadable,

    /**
     * Rockchip Boot Image
     */
    Rkimage,

    /**
     * Rockchip SD card
     */
    Rksd,

    /**
     * Rockchip SPI image
     */
    Rkspi,

    /**
     * Xilinx Zynq Boot Image
     */
    Zynqimage,

    /**
     * Xilinx ZynqMP Boot Image
     */
    Zynqmpimage,

    /**
     * Xilinx ZynqMP Boot Image (bif)
     */
    Zynqmpbif,

    /**
     * FPGA Image
     */
    Fpga,

    /**
     * VYBRID .vyb Image
     */
    Vybridimage,

    /**
     * Trusted Execution Environment OS Image
     */
    Tee,

    /**
     * Firmware Image with HABv4 IVT
     */
    FirmwareIvt,

    /**
     * TI Power Management Micro-Controller Firmware
     */
    Pmmc,

    /**
     * STMicroelectronics STM32 Image
     */
    Stm32image,

    /**
     * Altera SOCFPGA A10 Preloader
     */
    SocfpgaimageV1,

    /**
     * MediaTek BootROM loadable Image
     */
    Mtkimage,

    /**
     * Freescale IMX8MBoot Image
     */
    Imx8mimage,

    /**
     * Freescale IMX8Boot Image
     */
    Imx8image,

    /**
     * Coprocessor Image for remoteproc
     */
    Copro,

    /**
     * Allwinner eGON Boot Image
     */
    SunxiEgon,

    /**
     * Allwinner TOC0 Boot Image
     */
    SunxiToc0,

    /**
     * Binary Flat Device Tree Blob in a Legacy Image
     */
    FdtLegacy,

    /**
     * Renesas SPKG image
     */
    RenesasSpkg,

    /**
     * StarFive SPL image
     */
    StarfiveSpl,

    /**
     * TFA BL31 image
     */
    TfaBl31,

    /**
     * STMicroelectronics STM32 Image V2.0
     */
    Stm32imageV2,

    /**
     * Amlogic Boot Image
     */
    Amlimage,
    Unknown(i64),
}

impl TryFrom<i64> for Uimage_UimageType {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<Uimage_UimageType> {
        match flag {
            0 => Ok(Uimage_UimageType::Invalid),
            1 => Ok(Uimage_UimageType::Standalone),
            2 => Ok(Uimage_UimageType::Kernel),
            3 => Ok(Uimage_UimageType::Ramdisk),
            4 => Ok(Uimage_UimageType::Multi),
            5 => Ok(Uimage_UimageType::Firmware),
            6 => Ok(Uimage_UimageType::Script),
            7 => Ok(Uimage_UimageType::Filesystem),
            8 => Ok(Uimage_UimageType::Flatdt),
            9 => Ok(Uimage_UimageType::Kwbimage),
            10 => Ok(Uimage_UimageType::Imximage),
            11 => Ok(Uimage_UimageType::Ublimage),
            12 => Ok(Uimage_UimageType::Omapimage),
            13 => Ok(Uimage_UimageType::Aisimage),
            14 => Ok(Uimage_UimageType::KernelNoload),
            15 => Ok(Uimage_UimageType::Pblimage),
            16 => Ok(Uimage_UimageType::Mxsimage),
            17 => Ok(Uimage_UimageType::Gpimage),
            18 => Ok(Uimage_UimageType::Atmelimage),
            19 => Ok(Uimage_UimageType::Socfpgaimage),
            20 => Ok(Uimage_UimageType::X86Setup),
            21 => Ok(Uimage_UimageType::Lpc32xximage),
            22 => Ok(Uimage_UimageType::Loadable),
            23 => Ok(Uimage_UimageType::Rkimage),
            24 => Ok(Uimage_UimageType::Rksd),
            25 => Ok(Uimage_UimageType::Rkspi),
            26 => Ok(Uimage_UimageType::Zynqimage),
            27 => Ok(Uimage_UimageType::Zynqmpimage),
            28 => Ok(Uimage_UimageType::Zynqmpbif),
            29 => Ok(Uimage_UimageType::Fpga),
            30 => Ok(Uimage_UimageType::Vybridimage),
            31 => Ok(Uimage_UimageType::Tee),
            32 => Ok(Uimage_UimageType::FirmwareIvt),
            33 => Ok(Uimage_UimageType::Pmmc),
            34 => Ok(Uimage_UimageType::Stm32image),
            35 => Ok(Uimage_UimageType::SocfpgaimageV1),
            36 => Ok(Uimage_UimageType::Mtkimage),
            37 => Ok(Uimage_UimageType::Imx8mimage),
            38 => Ok(Uimage_UimageType::Imx8image),
            39 => Ok(Uimage_UimageType::Copro),
            40 => Ok(Uimage_UimageType::SunxiEgon),
            41 => Ok(Uimage_UimageType::SunxiToc0),
            42 => Ok(Uimage_UimageType::FdtLegacy),
            43 => Ok(Uimage_UimageType::RenesasSpkg),
            44 => Ok(Uimage_UimageType::StarfiveSpl),
            45 => Ok(Uimage_UimageType::TfaBl31),
            46 => Ok(Uimage_UimageType::Stm32imageV2),
            47 => Ok(Uimage_UimageType::Amlimage),
            _ => Ok(Uimage_UimageType::Unknown(flag)),
        }
    }
}

impl From<&Uimage_UimageType> for i64 {
    fn from(v: &Uimage_UimageType) -> Self {
        match *v {
            Uimage_UimageType::Invalid => 0,
            Uimage_UimageType::Standalone => 1,
            Uimage_UimageType::Kernel => 2,
            Uimage_UimageType::Ramdisk => 3,
            Uimage_UimageType::Multi => 4,
            Uimage_UimageType::Firmware => 5,
            Uimage_UimageType::Script => 6,
            Uimage_UimageType::Filesystem => 7,
            Uimage_UimageType::Flatdt => 8,
            Uimage_UimageType::Kwbimage => 9,
            Uimage_UimageType::Imximage => 10,
            Uimage_UimageType::Ublimage => 11,
            Uimage_UimageType::Omapimage => 12,
            Uimage_UimageType::Aisimage => 13,
            Uimage_UimageType::KernelNoload => 14,
            Uimage_UimageType::Pblimage => 15,
            Uimage_UimageType::Mxsimage => 16,
            Uimage_UimageType::Gpimage => 17,
            Uimage_UimageType::Atmelimage => 18,
            Uimage_UimageType::Socfpgaimage => 19,
            Uimage_UimageType::X86Setup => 20,
            Uimage_UimageType::Lpc32xximage => 21,
            Uimage_UimageType::Loadable => 22,
            Uimage_UimageType::Rkimage => 23,
            Uimage_UimageType::Rksd => 24,
            Uimage_UimageType::Rkspi => 25,
            Uimage_UimageType::Zynqimage => 26,
            Uimage_UimageType::Zynqmpimage => 27,
            Uimage_UimageType::Zynqmpbif => 28,
            Uimage_UimageType::Fpga => 29,
            Uimage_UimageType::Vybridimage => 30,
            Uimage_UimageType::Tee => 31,
            Uimage_UimageType::FirmwareIvt => 32,
            Uimage_UimageType::Pmmc => 33,
            Uimage_UimageType::Stm32image => 34,
            Uimage_UimageType::SocfpgaimageV1 => 35,
            Uimage_UimageType::Mtkimage => 36,
            Uimage_UimageType::Imx8mimage => 37,
            Uimage_UimageType::Imx8image => 38,
            Uimage_UimageType::Copro => 39,
            Uimage_UimageType::SunxiEgon => 40,
            Uimage_UimageType::SunxiToc0 => 41,
            Uimage_UimageType::FdtLegacy => 42,
            Uimage_UimageType::RenesasSpkg => 43,
            Uimage_UimageType::StarfiveSpl => 44,
            Uimage_UimageType::TfaBl31 => 45,
            Uimage_UimageType::Stm32imageV2 => 46,
            Uimage_UimageType::Amlimage => 47,
            Uimage_UimageType::Unknown(v) => v
        }
    }
}

impl Default for Uimage_UimageType {
    fn default() -> Self { Uimage_UimageType::Unknown(0) }
}


/**
 * ASUS firmware images [overlay the 32-byte image
 * name](https://github.com/drag0njoe/RT-AC55U/blob/cf5874684ab6995ee07e91a52dfdd0562fcc2655/release/src/asustools/mkimage.src/include/image.h#L185-L188)
 * with a [`TAIL`
 * structure](https://github.com/drag0njoe/RT-AC55U/blob/cf5874684ab6995ee07e91a52dfdd0562fcc2655/release/src/asustools/mkimage.src/include/image.h#L151-L171)
 * that contains version information and the product ID (model name).
 * 
 * The first 16 bytes have the same structure in all three known variants of
 * the `TAIL` structure. The meaning of the last 16 bytes differs across the
 * variants - therefore, for simplicity, this Kaitai Struct implementation
 * treats them as an opaque byte array named `extra_info`. For an overview of
 * the variants, see the documentation for `extra_info`.
 */

#[derive(Default, Debug, Clone)]
pub struct Uimage_AsusFirmwareInformation {
    pub _root: SharedType<Uimage>,
    pub _parent: SharedType<Uimage_NameOrAsusInfo>,
    pub _self: SharedType<Self>,
    kernel_version: RefCell<OptRc<Uimage_Version>>,
    fs_version: RefCell<OptRc<Uimage_Version>>,
    product_id: RefCell<String>,
    extra_info: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Uimage_AsusFirmwareInformation {
    type Root = Uimage;
    type Parent = Uimage_NameOrAsusInfo;

    fn read<S: KStream>(
        self_rc: &OptRc<Self>,
        _io: &S,
        _root: SharedType<Self::Root>,
        _parent: SharedType<Self::Parent>,
    ) -> KResult<()> {
        *self_rc._io.borrow_mut() = _io.clone();
        self_rc._root.set(_root.get());
        self_rc._parent.set(_parent.get());
        self_rc._self.set(Ok(self_rc.clone()));
        let _rrc = self_rc._root.get_value().borrow().upgrade();
        let _prc = self_rc._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        let t = Self::read_into::<_, Uimage_Version>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.kernel_version.borrow_mut() = t;
        let t = Self::read_into::<_, Uimage_Version>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.fs_version.borrow_mut() = t;
        *self_rc.product_id.borrow_mut() = bytes_to_str(&bytes_terminate(&_io.read_bytes(12 as usize)?.into(), 0, false).into(), "UTF-8")?;
        *self_rc.extra_info.borrow_mut() = _io.read_bytes(16 as usize)?.into();
        Ok(())
    }
}
impl Uimage_AsusFirmwareInformation {
}
impl Uimage_AsusFirmwareInformation {
    pub fn kernel_version(&self) -> Ref<'_, OptRc<Uimage_Version>> {
        self.kernel_version.borrow()
    }
}
impl Uimage_AsusFirmwareInformation {
    pub fn fs_version(&self) -> Ref<'_, OptRc<Uimage_Version>> {
        self.fs_version.borrow()
    }
}

/**
 * In the Ralink SDK variant (see `extra_info`), the product ID field is
 * actually 23 bytes long, but no known product ID is longer than 12
 * bytes.
 */
impl Uimage_AsusFirmwareInformation {
    pub fn product_id(&self) -> Ref<'_, String> {
        self.product_id.borrow()
    }
}

/**
 * The structure of these bytes varies among the three known variants of
 * the `TAIL` structure, and the header doesn't say which one is used:
 * 
 * * Plain: 8 hardware versions (using the `version` type) - see
 *   <https://github.com/drag0njoe/RT-AC55U/blob/cf5874684ab6995ee07e91a52dfdd0562fcc2655/release/src/asustools/mkimage.src/include/image.h#L170>
 * 
 *   Sample file: `RT-AC51U_3.0.0.4_380_8591-ga8dd632.trx` from
 *   <https://dlcdnets.asus.com/pub/ASUS/wireless/RT-AC51U/FW_RT_AC51U_30043808591.zip>,
 *   released on 2020-09-22 and listed on
 *   <https://www.asus.com/supportonly/rt-ac51u/helpdesk_bios/>.
 * 
 *   Source code links:
 * 
 *   - [ASUS GPL source, RT-AC55UHP
 *     3.0.0.4.382.51915](https://dlcdnets.asus.com/pub/ASUS/wireless/RT-AC55UHP/GPL_RT_AC55UHP_300438251915.zip)
 *     (`asuswrt/release/src/asustools/mkimage.src/` in
 *     `GPL_RT-AC55UHP_3.0.0.4.382.51915-g4086e57.tgz`)
 *   - [ASUS GPL source, RT-AC55U 3.0.0.4.382.50702 (unofficial
 *     mirror)](https://github.com/drag0njoe/RT-AC55U/tree/cf5874684ab6995ee07e91a52dfdd0562fcc2655/release/src/asustools/mkimage.src)
 * 
 * * `TRX_NEW` (a macro defined when building `mkimage`): the
 *   build number and extended build number (`u2le` each), two key bytes
 *   and 5 hardware versions - see
 *   <https://github.com/drag0njoe/RT-AC55U/blob/cf5874684ab6995ee07e91a52dfdd0562fcc2655/release/src-qca/asustools/mkimage.src/include/image.h#L174-L180>
 * 
 *   `mkimage` [overwrites the first 3 hardware
 *   versions](https://github.com/drag0njoe/RT-AC55U/blob/cf5874684ab6995ee07e91a52dfdd0562fcc2655/release/src-qca/asustools/mkimage.src/mkimage.c#L546-L569)
 *   with values derived from the key bytes.
 * 
 *   Sample file: `RT-AC55UHP_3.0.0.4_382_52236-ga0f880d.trx` (build 382,
 *   extended build 52236) from
 *   <https://dlcdnets.asus.com/pub/ASUS/wireless/RT-AC55UHP/FW_RT_AC55UHP_300438252236.zip>,
 *   released on 2020-06-04 and listed on
 *   <https://www.asus.com/supportonly/rt-ac55uhp/helpdesk_bios/>.
 * 
 *   Source code links:
 * 
 *   - [ASUS GPL source, RT-AC55UHP
 *     3.0.0.4.382.51915](https://dlcdnets.asus.com/pub/ASUS/wireless/RT-AC55UHP/GPL_RT_AC55UHP_300438251915.zip)
 *     (`asuswrt/release/src-qca/asustools/mkimage.src/` in
 *     `GPL_RT-AC55UHP_3.0.0.4.382.51915-g4086e57.tgz`)
 *   - [ASUS GPL source, RT-AC55U 3.0.0.4.382.50702 (unofficial
 *     mirror)](https://github.com/drag0njoe/RT-AC55U/tree/cf5874684ab6995ee07e91a52dfdd0562fcc2655/release/src-qca/asustools/mkimage.src)
 * 
 * * Ralink SDK: the rest of a 23-byte product ID (see `product_id`),
 *   a version suffix letter and the kernel part size (called `ih_ksz`) -
 *   see <https://github.com/andy-padavan/rt-n56u/blob/32a93db4026cc2cff585d7008373432d888fc1aa/trunk/tools/mkimage/include/image.h#L164-L165>
 * 
 *   Sample file: `RP-N12_1.0.1.1f.trx` from
 *   <https://dlcdnets.asus.com/pub/ASUS/wireless/RP-N12/FW_RP-N12_1.0.1.1f.zip>,
 *   released on 2019-11-12 and listed on
 *   <https://www.asus.com/supportonly/rp-n12/helpdesk_bios/>.
 * 
 *   Source code links:
 * 
 *   - [ASUS GPL source, RP-N12
 *     1.0.1.1f](https://dlcdnets.asus.com/pub/ASUS/wireless/RP-N12/GPL_RP_N12_1011f.zip)
 *     (`GPL_RP-N12_source.1011f/user/mkimage/include/image.h` in
 *     `GPL_RP-N12_source.1011f.tar.bz2`)
 *   - [rt-n56u custom firmware by Andy
 *     Padavan](https://github.com/andy-padavan/rt-n56u/blob/32a93db4026cc2cff585d7008373432d888fc1aa/trunk/tools/mkimage/include/image.h)
 * 
 * In the plain and `TRX_NEW` variants, the last 4 bytes may instead
 * contain the offset of the root file system, which is [written by
 * `mkimage -r`](https://github.com/drag0njoe/RT-AC55U/blob/cf5874684ab6995ee07e91a52dfdd0562fcc2655/release/src/asustools/mkimage.src/mkimage.c#L527-L542)
 * as the magic byte 0xA9
 * ([`ROOTFS_OFFSET_MAGIC`](https://github.com/drag0njoe/RT-AC55U/blob/cf5874684ab6995ee07e91a52dfdd0562fcc2655/release/src/asustools/mkimage.src/include/image.h#L154-L159))
 * followed by the offset as a 24-bit big-endian integer.
 */
impl Uimage_AsusFirmwareInformation {
    pub fn extra_info(&self) -> Ref<'_, Vec<u8>> {
        self.extra_info.borrow()
    }
}
impl Uimage_AsusFirmwareInformation {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Uimage_NameOrAsusInfo {
    pub _root: SharedType<Uimage>,
    pub _parent: SharedType<Uimage_Uheader>,
    pub _self: SharedType<Self>,
    name: RefCell<String>,
    asus_info: RefCell<OptRc<Uimage_AsusFirmwareInformation>>,
    _io: RefCell<BytesReader>,
    f_byte0: Cell<bool>,
    byte0: RefCell<u8>,
    f_byte4: Cell<bool>,
    byte4: RefCell<u8>,
    f_has_asus_info: Cell<bool>,
    has_asus_info: RefCell<bool>,
}
impl KStruct for Uimage_NameOrAsusInfo {
    type Root = Uimage;
    type Parent = Uimage_Uheader;

    fn read<S: KStream>(
        self_rc: &OptRc<Self>,
        _io: &S,
        _root: SharedType<Self::Root>,
        _parent: SharedType<Self::Parent>,
    ) -> KResult<()> {
        *self_rc._io.borrow_mut() = _io.clone();
        self_rc._root.set(_root.get());
        self_rc._parent.set(_parent.get());
        self_rc._self.set(Ok(self_rc.clone()));
        let _rrc = self_rc._root.get_value().borrow().upgrade();
        let _prc = self_rc._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if !(*self_rc.has_asus_info()?) {
            *self_rc.name.borrow_mut() = bytes_to_str(&_io.read_bytes_term(0, false, true, false)?.into(), "UTF-8")?;
        }
        if *self_rc.has_asus_info()? {
            let t = Self::read_into::<_, Uimage_AsusFirmwareInformation>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
            *self_rc.asus_info.borrow_mut() = t;
        }
        Ok(())
    }
}
impl Uimage_NameOrAsusInfo {
    pub fn byte0(
        &self
    ) -> KResult<Ref<'_, u8>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_byte0.get() {
            return Ok(self.byte0.borrow());
        }
        self.f_byte0.set(true);
        let _pos = _io.pos();
        _io.seek(0 as usize)?;
        *self.byte0.borrow_mut() = _io.read_u1()?.into();
        _io.seek(_pos)?;
        Ok(self.byte0.borrow())
    }
    pub fn byte4(
        &self
    ) -> KResult<Ref<'_, u8>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_byte4.get() {
            return Ok(self.byte4.borrow());
        }
        self.f_byte4.set(true);
        let _pos = _io.pos();
        _io.seek(4 as usize)?;
        *self.byte4.borrow_mut() = _io.read_u1()?.into();
        _io.seek(_pos)?;
        Ok(self.byte4.borrow())
    }

    /**
     * Whether this type stores ASUS firmware information (`asus_info`)
     * rather than an image name (`name`).
     * 
     * The header doesn't say which one it is, so we infer it using a
     * heuristic based on the layout of the `asus_firmware_information` type.
     * If ASUS firmware info is present, the first byte (the major kernel
     * version number) is a small integer (i.e. not a printable character),
     * and byte 4 (first byte of the product ID/model name) is a printable
     * character. An empty name is not mistaken for ASUS information, because
     * its byte 4 is a null byte.
     * 
     * The highest known major kernel version number is 9 (e.g. in
     * `DSL-N55U_9.0.0.4_380_3925-gad8f412_Annex_A.trx` from
     * <https://dlcdnets.asus.com/pub/ASUS/wireless/DSL-N55U/FW_DSL_N55U_90043803925.zip>,
     * released on 2016-08-04 and listed on
     * <https://www.asus.com/supportonly/dsl-n55u/helpdesk_bios/>). ASUS
     * seems to use such high major versions (9, sometimes 7) for beta
     * releases, whereas regular releases use 3 (or 1 in older firmware).
     * 
     * It can also be 0, in particular due to a bug in the MediaTek MT798X
     * build of ASUS's `mkimage` (it reads the `-V` values from fixed `argv`
     * positions, even though it parses the options using `getopt()` - see
     * <https://github.com/blocktrron/tuf-ax4200-gpl/blob/a4fe37f4d78473f97c6d47cf93d97c3811af90cc/release/src-mtk-MT798X/Uboot-upstream/tools/mkimage.c#L317-L333>).
     * For example, this is the case in
     * `RT-AX52_3.0.0.4_388_34015-g9488655.trx` from
     * <https://dlcdnets.asus.com/pub/ASUS/wireless/RT-AX52/FW_RT-AX52_300438834015.zip>,
     * released on 2026-03-20 and listed on
     * <https://www.asus.com/supportonly/rt-ax52/helpdesk_bios?model2Name=RT-AX52>.
     */
    pub fn has_asus_info(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_has_asus_info.get() {
            return Ok(self.has_asus_info.borrow());
        }
        self.f_has_asus_info.set(true);
        *self.has_asus_info.borrow_mut() = ( ((((*self.byte0()? as u8) < (32 as u8))) && (((*self.byte4()? as u8) >= (32 as u8))) && (((*self.byte4()? as u8) < (127 as u8)))) ) as bool;
        Ok(self.has_asus_info.borrow())
    }
}
impl Uimage_NameOrAsusInfo {
    pub fn name(&self) -> Ref<'_, String> {
        self.name.borrow()
    }
}
impl Uimage_NameOrAsusInfo {
    pub fn asus_info(&self) -> Ref<'_, OptRc<Uimage_AsusFirmwareInformation>> {
        self.asus_info.borrow()
    }
}
impl Uimage_NameOrAsusInfo {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Uimage_Uheader {
    pub _root: SharedType<Uimage>,
    pub _parent: SharedType<Uimage>,
    pub _self: SharedType<Self>,
    magic: RefCell<Uimage_MagicTypes>,
    header_crc: RefCell<u32>,
    timestamp: RefCell<u32>,
    len_image: RefCell<u32>,
    load_address: RefCell<u32>,
    entry_address: RefCell<u32>,
    data_crc: RefCell<u32>,
    os_type: RefCell<Uimage_UimageOs>,
    architecture: RefCell<Uimage_UimageArch>,
    image_type: RefCell<Uimage_UimageType>,
    compression_type: RefCell<Uimage_UimageComp>,
    name_or_asus_info: RefCell<OptRc<Uimage_NameOrAsusInfo>>,
    _io: RefCell<BytesReader>,
    name_or_asus_info_raw: RefCell<Vec<u8>>,
}
impl KStruct for Uimage_Uheader {
    type Root = Uimage;
    type Parent = Uimage;

    fn read<S: KStream>(
        self_rc: &OptRc<Self>,
        _io: &S,
        _root: SharedType<Self::Root>,
        _parent: SharedType<Self::Parent>,
    ) -> KResult<()> {
        *self_rc._io.borrow_mut() = _io.clone();
        self_rc._root.set(_root.get());
        self_rc._parent.set(_parent.get());
        self_rc._self.set(Ok(self_rc.clone()));
        let _rrc = self_rc._root.get_value().borrow().upgrade();
        let _prc = self_rc._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        *self_rc.magic.borrow_mut() = (_io.read_u4be()? as i64).try_into()?;
        *self_rc.header_crc.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.timestamp.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.len_image.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.load_address.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.entry_address.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.data_crc.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.os_type.borrow_mut() = (_io.read_u1()? as i64).try_into()?;
        *self_rc.architecture.borrow_mut() = (_io.read_u1()? as i64).try_into()?;
        *self_rc.image_type.borrow_mut() = (_io.read_u1()? as i64).try_into()?;
        *self_rc.compression_type.borrow_mut() = (_io.read_u1()? as i64).try_into()?;
        *self_rc.name_or_asus_info_raw.borrow_mut() = _io.read_bytes(32 as usize)?.into();
        let name_or_asus_info_raw = self_rc.name_or_asus_info_raw.borrow();
        let _t_name_or_asus_info_raw_io = BytesReader::from(name_or_asus_info_raw.clone());
        let t = Self::read_into::<BytesReader, Uimage_NameOrAsusInfo>(&_t_name_or_asus_info_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.name_or_asus_info.borrow_mut() = t;
        Ok(())
    }
}
impl Uimage_Uheader {
}

/**
 * Besides the standard U-Boot magic, some vendors' bootloaders expect
 * their own value (often a different one for each device model), with
 * the rest of the header unchanged. `magic_types` lists the values
 * known so far; images with any other magic are rejected.
 */
impl Uimage_Uheader {
    pub fn magic(&self) -> Ref<'_, Uimage_MagicTypes> {
        self.magic.borrow()
    }
}
impl Uimage_Uheader {
    pub fn header_crc(&self) -> Ref<'_, u32> {
        self.header_crc.borrow()
    }
}
impl Uimage_Uheader {
    pub fn timestamp(&self) -> Ref<'_, u32> {
        self.timestamp.borrow()
    }
}
impl Uimage_Uheader {
    pub fn len_image(&self) -> Ref<'_, u32> {
        self.len_image.borrow()
    }
}
impl Uimage_Uheader {
    pub fn load_address(&self) -> Ref<'_, u32> {
        self.load_address.borrow()
    }
}
impl Uimage_Uheader {
    pub fn entry_address(&self) -> Ref<'_, u32> {
        self.entry_address.borrow()
    }
}
impl Uimage_Uheader {
    pub fn data_crc(&self) -> Ref<'_, u32> {
        self.data_crc.borrow()
    }
}
impl Uimage_Uheader {
    pub fn os_type(&self) -> Ref<'_, Uimage_UimageOs> {
        self.os_type.borrow()
    }
}
impl Uimage_Uheader {
    pub fn architecture(&self) -> Ref<'_, Uimage_UimageArch> {
        self.architecture.borrow()
    }
}
impl Uimage_Uheader {
    pub fn image_type(&self) -> Ref<'_, Uimage_UimageType> {
        self.image_type.borrow()
    }
}
impl Uimage_Uheader {
    pub fn compression_type(&self) -> Ref<'_, Uimage_UimageComp> {
        self.compression_type.borrow()
    }
}
impl Uimage_Uheader {
    pub fn name_or_asus_info(&self) -> Ref<'_, OptRc<Uimage_NameOrAsusInfo>> {
        self.name_or_asus_info.borrow()
    }
}
impl Uimage_Uheader {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
impl Uimage_Uheader {
    pub fn name_or_asus_info_raw(&self) -> Ref<'_, Vec<u8>> {
        self.name_or_asus_info_raw.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Uimage_Version {
    pub _root: SharedType<Uimage>,
    pub _parent: SharedType<Uimage_AsusFirmwareInformation>,
    pub _self: SharedType<Self>,
    major: RefCell<u8>,
    minor: RefCell<u8>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Uimage_Version {
    type Root = Uimage;
    type Parent = Uimage_AsusFirmwareInformation;

    fn read<S: KStream>(
        self_rc: &OptRc<Self>,
        _io: &S,
        _root: SharedType<Self::Root>,
        _parent: SharedType<Self::Parent>,
    ) -> KResult<()> {
        *self_rc._io.borrow_mut() = _io.clone();
        self_rc._root.set(_root.get());
        self_rc._parent.set(_parent.get());
        self_rc._self.set(Ok(self_rc.clone()));
        let _rrc = self_rc._root.get_value().borrow().upgrade();
        let _prc = self_rc._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        *self_rc.major.borrow_mut() = _io.read_u1()?.into();
        *self_rc.minor.borrow_mut() = _io.read_u1()?.into();
        Ok(())
    }
}
impl Uimage_Version {
}
impl Uimage_Version {
    pub fn major(&self) -> Ref<'_, u8> {
        self.major.borrow()
    }
}
impl Uimage_Version {
    pub fn minor(&self) -> Ref<'_, u8> {
        self.minor.borrow()
    }
}
impl Uimage_Version {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
