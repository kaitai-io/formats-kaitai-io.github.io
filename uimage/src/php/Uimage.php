<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

/**
 * The legacy U-Boot image format (uImage), as created by `mkimage`: a 64-byte
 * header followed by the image data (e.g. a Linux kernel, a ramdisk or a
 * script). The header describes the data (OS, CPU architecture, image type,
 * compression, load and entry point addresses, name) and protects both the
 * header and the data with CRC-32 checksums.
 * 
 * U-Boot's newer FIT (Flattened Image Tree) format is not covered by this spec.
 */

namespace {
    class Uimage extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Kaitai\Struct\Struct $_parent = null, ?\Uimage $_root = null) {
            parent::__construct($_io, $_parent, $_root === null ? $this : $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_header = new \Uimage\Uheader($this->_io, $this, $this->_root);
            $this->_m_data = $this->_io->readBytes($this->header()->lenImage());
        }
        protected $_m_header;
        protected $_m_data;
        public function header() { return $this->_m_header; }
        public function data() { return $this->_m_data; }
    }
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

namespace Uimage {
    class AsusFirmwareInformation extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Uimage\NameOrAsusInfo $_parent = null, ?\Uimage $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_kernelVersion = new \Uimage\Version($this->_io, $this, $this->_root);
            $this->_m_fsVersion = new \Uimage\Version($this->_io, $this, $this->_root);
            $this->_m_productId = \Kaitai\Struct\Stream::bytesToStr(\Kaitai\Struct\Stream::bytesTerminate($this->_io->readBytes(12), 0, false), "UTF-8");
            $this->_m_extraInfo = $this->_io->readBytes(16);
        }
        protected $_m_kernelVersion;
        protected $_m_fsVersion;
        protected $_m_productId;
        protected $_m_extraInfo;
        public function kernelVersion() { return $this->_m_kernelVersion; }
        public function fsVersion() { return $this->_m_fsVersion; }

        /**
         * In the Ralink SDK variant (see `extra_info`), the product ID field is
         * actually 23 bytes long, but no known product ID is longer than 12
         * bytes.
         */
        public function productId() { return $this->_m_productId; }

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
        public function extraInfo() { return $this->_m_extraInfo; }
    }
}

namespace Uimage {
    class NameOrAsusInfo extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Uimage\Uheader $_parent = null, ?\Uimage $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            if (!($this->hasAsusInfo())) {
                $this->_m_name = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytesTerm(0, false, true, false), "UTF-8");
            }
            if ($this->hasAsusInfo()) {
                $this->_m_asusInfo = new \Uimage\AsusFirmwareInformation($this->_io, $this, $this->_root);
            }
        }
        protected $_m_byte0;
        public function byte0() {
            if ($this->_m_byte0 !== null)
                return $this->_m_byte0;
            $_pos = $this->_io->pos();
            $this->_io->seek(0);
            $this->_m_byte0 = $this->_io->readU1();
            $this->_io->seek($_pos);
            return $this->_m_byte0;
        }
        protected $_m_byte4;
        public function byte4() {
            if ($this->_m_byte4 !== null)
                return $this->_m_byte4;
            $_pos = $this->_io->pos();
            $this->_io->seek(4);
            $this->_m_byte4 = $this->_io->readU1();
            $this->_io->seek($_pos);
            return $this->_m_byte4;
        }
        protected $_m_hasAsusInfo;

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
        public function hasAsusInfo() {
            if ($this->_m_hasAsusInfo !== null)
                return $this->_m_hasAsusInfo;
            $this->_m_hasAsusInfo =  (($this->byte0() < 32) && ($this->byte4() >= 32) && ($this->byte4() < 127)) ;
            return $this->_m_hasAsusInfo;
        }
        protected $_m_name;
        protected $_m_asusInfo;
        public function name() { return $this->_m_name; }
        public function asusInfo() { return $this->_m_asusInfo; }
    }
}

namespace Uimage {
    class Uheader extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Uimage $_parent = null, ?\Uimage $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_magic = $this->_io->readU4be();
            if (!\Uimage\MagicTypes::isDefined($this->_m_magic)) {
                throw new \Kaitai\Struct\Error\ValidationNotInEnumError($this->_m_magic, $this->_io, "/types/uheader/seq/0");
            }
            $this->_m_headerCrc = $this->_io->readU4be();
            $this->_m_timestamp = $this->_io->readU4be();
            $this->_m_lenImage = $this->_io->readU4be();
            $this->_m_loadAddress = $this->_io->readU4be();
            $this->_m_entryAddress = $this->_io->readU4be();
            $this->_m_dataCrc = $this->_io->readU4be();
            $this->_m_osType = $this->_io->readU1();
            if (!\Uimage\UimageOs::isDefined($this->_m_osType)) {
                throw new \Kaitai\Struct\Error\ValidationNotInEnumError($this->_m_osType, $this->_io, "/types/uheader/seq/7");
            }
            $this->_m_architecture = $this->_io->readU1();
            if (!\Uimage\UimageArch::isDefined($this->_m_architecture)) {
                throw new \Kaitai\Struct\Error\ValidationNotInEnumError($this->_m_architecture, $this->_io, "/types/uheader/seq/8");
            }
            $this->_m_imageType = $this->_io->readU1();
            if (!\Uimage\UimageType::isDefined($this->_m_imageType)) {
                throw new \Kaitai\Struct\Error\ValidationNotInEnumError($this->_m_imageType, $this->_io, "/types/uheader/seq/9");
            }
            $this->_m_compressionType = $this->_io->readU1();
            if (!\Uimage\UimageComp::isDefined($this->_m_compressionType)) {
                throw new \Kaitai\Struct\Error\ValidationNotInEnumError($this->_m_compressionType, $this->_io, "/types/uheader/seq/10");
            }
            $this->_m__raw_nameOrAsusInfo = $this->_io->readBytes(32);
            $_io__raw_nameOrAsusInfo = new \Kaitai\Struct\Stream($this->_m__raw_nameOrAsusInfo);
            $this->_m_nameOrAsusInfo = new \Uimage\NameOrAsusInfo($_io__raw_nameOrAsusInfo, $this, $this->_root);
        }
        protected $_m_magic;
        protected $_m_headerCrc;
        protected $_m_timestamp;
        protected $_m_lenImage;
        protected $_m_loadAddress;
        protected $_m_entryAddress;
        protected $_m_dataCrc;
        protected $_m_osType;
        protected $_m_architecture;
        protected $_m_imageType;
        protected $_m_compressionType;
        protected $_m_nameOrAsusInfo;
        protected $_m__raw_nameOrAsusInfo;

        /**
         * Besides the standard U-Boot magic, some vendors' bootloaders expect
         * their own value (often a different one for each device model), with
         * the rest of the header unchanged. `magic_types` lists the values
         * known so far; images with any other magic are rejected.
         */
        public function magic() { return $this->_m_magic; }
        public function headerCrc() { return $this->_m_headerCrc; }
        public function timestamp() { return $this->_m_timestamp; }
        public function lenImage() { return $this->_m_lenImage; }
        public function loadAddress() { return $this->_m_loadAddress; }
        public function entryAddress() { return $this->_m_entryAddress; }
        public function dataCrc() { return $this->_m_dataCrc; }
        public function osType() { return $this->_m_osType; }
        public function architecture() { return $this->_m_architecture; }
        public function imageType() { return $this->_m_imageType; }
        public function compressionType() { return $this->_m_compressionType; }
        public function nameOrAsusInfo() { return $this->_m_nameOrAsusInfo; }
        public function _raw_nameOrAsusInfo() { return $this->_m__raw_nameOrAsusInfo; }
    }
}

namespace Uimage {
    class Version extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Uimage\AsusFirmwareInformation $_parent = null, ?\Uimage $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_major = $this->_io->readU1();
            $this->_m_minor = $this->_io->readU1();
        }
        protected $_m_major;
        protected $_m_minor;
        public function major() { return $this->_m_major; }
        public function minor() { return $this->_m_minor; }
    }
}

namespace Uimage {
    class MagicTypes {

        /**
         * ALLNET ALL-SG8316M.
         */
        const ALLNET_ALL_SG8316M = 5;

        /**
         * ALLNET ALL-SG8208M. OpenWrt device `allnet_all-sg8208m`.
         */
        const ALLNET_ALL_SG8208M = 6;

        /**
         * ALLNET ALL-SG8324M.
         */
        const ALLNET_ALL_SG8324M = 22;

        /**
         * OpenWrt device `datto_l8`.
         */
        const DATTO_L8 = 7353344;

        /**
         * ALLNET ALL-WAPC0450C.
         */
        const ALLNET_ALL_WAPC0450C = 9453568;

        /**
         * OpenWrt device `engenius_ews2910p-v3`.
         */
        const ENGENIUS_EWS2910P_V3 = 50398464;

        /**
         * EnGenius EWS1200-28TFP firmware 1.07.16 to 1.07.40.
         */
        const ENGENIUS_EWS1200_28TFP = 50402048;

        /**
         * EnGenius EWS7926EFP firmware 1.07.22 to 1.07.27.
         */
        const ENGENIUS_EWS7926EFP = 50402050;

        /**
         * EnGenius EWS7952P firmware 1.07.16 to 1.07.40.
         */
        const ENGENIUS_EWS7952P = 50406401;

        /**
         * EnGenius EWS2908P firmware 1.07.34 to 1.07.43.
         */
        const ENGENIUS_EWS2908P = 50409728;

        /**
         * EnGenius EWS7928P v2 firmware 1.07.40 to 1.07.43.
         */
        const ENGENIUS_EWS7928P_V2 = 51450112;

        /**
         * EnGenius EWS1200-28TFP v2 firmware 1.07.43.
         */
        const ENGENIUS_EWS1200_28TFP_V2 = 51450624;

        /**
         * EnGenius EWS2910P firmware 1.07.16 to 1.07.43. OpenWrt device
         * `engenius_ews2910p-v1`.
         */
        const ENGENIUS_EWS2910P = 58730768;

        /**
         * EnGenius EWS5912FP firmware 1.07.16 to 1.07.43.
         */
        const ENGENIUS_EWS5912FP = 58743058;

        /**
         * EnGenius EWS7928P firmware 1.07.16 to 1.07.40.
         */
        const ENGENIUS_EWS7928P = 58751272;

        /**
         * EnGenius EWS1200D-10T firmware 1.07.16 to 1.07.22.
         */
        const ENGENIUS_EWS1200D_10T = 59187216;

        /**
         * EnGenius EWS1200-28T firmware 1.07.16 to 1.07.22.
         */
        const ENGENIUS_EWS1200_28T = 59187240;

        /**
         * EnGenius EWS7928FP firmware 1.07.16 to 1.07.40.
         */
        const ENGENIUS_EWS7928FP = 59216527;

        /**
         * EnGenius EWS1200-52T firmware 1.07.16 to 1.07.22.
         */
        const ENGENIUS_EWS1200_52T = 60235858;

        /**
         * EnGenius EWS7952FP firmware 1.07.16 to 1.07.40.
         */
        const ENGENIUS_EWS7952FP = 60265775;

        /**
         * OpenWrt devices `youku_x2`, `youku_yk-l1`, `youku_yk-l1c`,
         * `youku_yk-l2`.
         */
        const YOUKU_YK_L1 = 304680960;

        /**
         * Generic default of the Realtek switch SDK's U-Boot
         * (`CONFIG_IH_MAGIC_NUMBER`), used e.g. by many TRENDnet switches. OpenWrt
         * device `apresia_aplgs120gtss`.
         */
        const REALTEK_SDK = 305418240;

        /**
         * OpenWrt device `netgear_gs750e`.
         */
        const NETGEAR_GS750E = 391006017;

        /**
         * NETGEAR GS728TPv2, GS728TPPv2, GS752TPv2 and GS752TPP.
         */
        const NETGEAR_GS728TP_V2 = 391006018;

        /**
         * OpenWrt device `bolt_bl100`.
         */
        const BOLT_BL100 = 638656533;

        /**
         * The standard U-Boot header magic (`IH_MAGIC`).
         */
        const UIMAGE = 654645590;

        /**
         * NETGEAR WNCE4004.
         */
        const NETGEAR_WNCE4004 = 654645607;

        /**
         * "0612" in ASCII. NETGEAR WNR612v2 firmware 1.0.0.2 (later firmware uses
         * "2061").
         */
        const NETGEAR_WNR612_V2_EARLY = 808857906;

        /**
         * "1000" in ASCII. NETGEAR WNR1000v2-VC. OpenWrt used this magic only in
         * its `ar71xx` target, which was
         * [removed](https://github.com/openwrt/openwrt/commit/4e4ee4649553ab536225060a27fc320bf54e458c)
         * after OpenWrt 19.07, so it is missing from the current OpenWrt code.
         */
        const NETGEAR_WNR1000_V2_VC = 825241648;

        /**
         * "1001" in ASCII. OpenWrt device `netgear_wnr1000-v2`.
         */
        const NETGEAR_WNR1000_V2 = 825241649;

        /**
         * "1002" in ASCII. NETGEAR WNR1000v2-VM. No firmware image with this magic
         * was found among the ones surveyed (September 2026), so it may not be
         * used in practice.
         */
        const NETGEAR_WNR1000_V2_VM = 825241650;

        /**
         * "1004" in ASCII. NETGEAR WNR1000v4. No firmware image with this magic
         * was found among the ones surveyed (September 2026), so it may not be
         * used in practice.
         */
        const NETGEAR_WNR1000_V4 = 825241652;

        /**
         * "1100" in ASCII. NETGEAR WPN824N. OpenWrt used this magic only in its
         * `ar71xx` target, which was
         * [removed](https://github.com/openwrt/openwrt/commit/4e4ee4649553ab536225060a27fc320bf54e458c)
         * after OpenWrt 19.07, so it is missing from the current OpenWrt code.
         */
        const NETGEAR_WPN824N = 825307184;

        /**
         * "1PAW" in ASCII. ZyXEL UAG50.
         */
        const ZYXEL_UAG50 = 827343191;

        /**
         * "2001" in ASCII. OpenWrt 19.07 images for the NETGEAR WNR2000 (the stock
         * firmware uses the standard magic). OpenWrt used this magic only in its
         * `ar71xx` target, which was
         * [removed](https://github.com/openwrt/openwrt/commit/4e4ee4649553ab536225060a27fc320bf54e458c)
         * after OpenWrt 19.07, so it is missing from the current OpenWrt code.
         */
        const NETGEAR_WNR2000 = 842018865;

        /**
         * "2003" in ASCII. OpenWrt device `netgear_wnr2000-v3`.
         */
        const NETGEAR_WNR2000_V3 = 842018867;

        /**
         * "2004" in ASCII. NETGEAR WNR2000v4. OpenWrt used this magic only in its
         * `ar71xx` target, which was
         * [removed](https://github.com/openwrt/openwrt/commit/4e4ee4649553ab536225060a27fc320bf54e458c)
         * after OpenWrt 19.07, so it is missing from the current OpenWrt code.
         */
        const NETGEAR_WNR2000_V4 = 842018868;

        /**
         * "2061" in ASCII. OpenWrt devices `netgear_wnr612-v2`, `on_n150r`.
         */
        const NETGEAR_WNR612_V2 = 842020401;

        /**
         * "2200" in ASCII. OpenWrt device `netgear_wnr2200_common`.
         */
        const NETGEAR_WNR2200 = 842149936;

        /**
         * "3700" in ASCII. OpenWrt device `netgear_wndr3700`.
         */
        const NETGEAR_WNDR3700 = 859254832;

        /**
         * "3701" in ASCII. OpenWrt devices `netgear_wndr3700-v2`,
         * `netgear_wndr3800`, `netgear_wndr3800ch`, `netgear_wndrmac-v1`,
         * `netgear_wndrmac-v2`.
         */
        const NETGEAR_WNDR3700_V2 = 859254833;

        /**
         * "3703" in ASCII. OpenWrt devices `netgear_wndr3700-v4`,
         * `netgear_wndr4300`, `netgear_wndr4300sw`, `netgear_wndr4300tn`.
         */
        const NETGEAR_WNDR3700_V4 = 859254835;

        /**
         * "6000" in ASCII. OpenWrt device `netgear_r6100`.
         */
        const NETGEAR_R6100 = 909127728;

        /**
         * "6122" in ASCII. NETGEAR WNR612. No firmware image with this magic was
         * found among the ones surveyed (September 2026), so it may not be used in
         * practice.
         */
        const NETGEAR_WNR612 = 909193778;

        /**
         * "COMB" in ASCII. Devices made by MitraStar (MSTC), e.g. ZyXEL NBG6604
         * and I-O DATA WN-AX1167GR2, WN-AX2033GR, WN-AX2033GR2, WN-DX1167GR and
         * WN-DX2033GR.
         */
        const MITRASTAR_COMB = 1129270594;

        /**
         * "COMC" in ASCII. Devices made by MitraStar (MSTC), e.g. I-O DATA
         * WN-CS300FR, WN-DX1167R, WN-DX1200GR, WN-DX1300EXP, WN-DX1300GRN,
         * WN-PL1167EX01/02/03, WN-SX300FR and WN-SX300GR.
         */
        const MITRASTAR_COMC = 1129270595;

        /**
         * "NGC5" in ASCII. OpenWrt devices `netgear_gs308t-v1`,
         * `netgear_gs310tp-v1`.
         */
        const NETGEAR_GS308T = 1313293109;

        /**
         * "NGE " in ASCII. OpenWrt device `netgear_nge`.
         */
        const NETGEAR_NGE = 1313293600;

        /**
         * "NGF " in ASCII. NETGEAR GC108P and GC108PP.
         */
        const NETGEAR_NGF = 1313293856;

        /**
         * "NGG " in ASCII. OpenWrt device `netgear_ngg`.
         */
        const NETGEAR_NGG = 1313294112;

        /**
         * "NGH " in ASCII. NETGEAR GS724TPv2 and GS724TPP.
         */
        const NETGEAR_NGH = 1313294368;

        /**
         * "NGI " in ASCII. NETGEAR GS716TP and GS716TPP.
         */
        const NETGEAR_NGI = 1313294624;

        /**
         * "NGP " in ASCII. NETGEAR MS510TXM and MS510TXUP.
         */
        const NETGEAR_NGP = 1313296416;

        /**
         * "OKLI" in ASCII. The kernel of OpenWrt images for devices whose
         * bootloader loads a small OpenWrt loader (`lzma-loader`, `loader-okli`)
         * instead, which then boots this kernel.
         */
        const OPENWRT_OKLI = 1330334793;

        /**
         * "hsqs" in ASCII. The kernel of OpenWrt images for the D-Link COVR-C1200
         * and COVR-P2500, loaded by OpenWrt's `lzma-loader`.
         */
        const OPENWRT_DLINK_COVR = 1752396147;

        /**
         * "sqOK" in ASCII. The kernel of OpenWrt images for Senao-based access
         * points (e.g. EnGenius EAP and ENS series, ALLNET ALL-WAP02860AC,
         * WatchGuard AP100/200/300), loaded by OpenWrt's `lzma-loader`.
         */
        const OPENWRT_SENAO_OKLI = 1936805707;

        /**
         * EnGenius ECS1112FP (`image/series_vmlinux.bix` in the tar archive that
         * follows a 64-byte header in the `.imag` firmware file, i.e. at offset
         * 0x240).
         */
        const ENGENIUS_ECS1112FP = 2155872258;

        /**
         * EnGenius EWS1200-28TFP firmware 1.05.45 to 1.06.21.
         */
        const ENGENIUS_EWS1200_28TFP_OLD_FW = 2197885696;

        /**
         * EnGenius EWS7926EFP firmware 1.06.23.
         */
        const ENGENIUS_EWS7926EFP_OLD_FW = 2197885698;

        /**
         * EnGenius EWS7952P firmware 1.05.52 to 1.06.21.
         */
        const ENGENIUS_EWS7952P_OLD_FW = 2197890049;

        /**
         * Default of the Realtek switch SDK for RTL838x
         * (`CONFIG_IH_MAGIC_NUMBER`), used e.g. by ZyXEL GS1900 series, Cisco
         * Sx220 series and Ubiquiti UISP-S switches. EnGenius EGS7228P firmware
         * 1.05.05. OpenWrt devices `zyxel_gs1900`, `inaba_aml2-17gp`,
         * `horaco_zx-swtgw2c8f`, `mokerlink_2g080gm`, `mokerlink_10gt080m`.
         */
        const REALTEK_RTL838X = 2206203904;

        /**
         * I-O DATA BSH-G08M.
         */
        const IODATA_BSH_G08M = 2206203905;

        /**
         * I-O DATA BSH-GP08 and Ubiquiti UISP-S (RTL838x).
         */
        const IODATA_BSH_GP08 = 2206203906;

        /**
         * I-O DATA BSH-G16M.
         */
        const IODATA_BSH_G16M = 2206203907;

        /**
         * I-O DATA BSH-G24M.
         */
        const IODATA_BSH_G24M = 2206203908;

        /**
         * I-O DATA BSH-G08MB.
         */
        const IODATA_BSH_G08MB = 2206203920;

        /**
         * I-O DATA BSH-GP08MB.
         */
        const IODATA_BSH_GP08MB = 2206203921;

        /**
         * I-O DATA BSH-G16MB.
         */
        const IODATA_BSH_G16MB = 2206203922;

        /**
         * I-O DATA BSH-G24MB. OpenWrt device `iodata_bsh-g24mb`.
         */
        const IODATA_BSH_G24MB = 2206203923;

        /**
         * TRENDnet TPE-3012LS.
         */
        const TRENDNET_TPE_3012LS = 2206210573;

        /**
         * TRENDnet TPE-3018LS.
         */
        const TRENDNET_TPE_3018LS = 2206210574;

        /**
         * EnGenius EGS2108P firmware 1.05.20.
         */
        const ENGENIUS_EGS2108P_OLD_FW = 2206212360;

        /**
         * EnGenius EGS2110P firmware 1.05.20.
         */
        const ENGENIUS_EGS2110P_OLD_FW = 2206212368;

        /**
         * EnGenius EWS2910P firmware 1.05.38 to 1.06.21.
         */
        const ENGENIUS_EWS2910P_OLD_FW = 2206214416;

        /**
         * EnGenius EGS5110P firmware 1.05.20.
         */
        const ENGENIUS_EGS5110P_OLD_FW = 2206224656;

        /**
         * EnGenius EGS5212FP firmware 1.05.05.
         */
        const ENGENIUS_EGS5212FP_OLD_FW = 2206224914;

        /**
         * EnGenius EWS5912FP firmware 1.05.38 to 1.06.21.
         */
        const ENGENIUS_EWS5912FP_OLD_FW = 2206226706;

        /**
         * EnGenius EWS7928P firmware 1.05.38 to 1.06.21.
         */
        const ENGENIUS_EWS7928P_OLD_FW = 2206234920;

        /**
         * EnGenius EWS1200D-10T firmware 1.05.39 to 1.06.21.
         */
        const ENGENIUS_EWS1200D_10T_OLD_FW = 2206670864;

        /**
         * EnGenius EWS1200-28T firmware 1.05.38 to 1.06.21.
         */
        const ENGENIUS_EWS1200_28T_OLD_FW = 2206670888;

        /**
         * EnGenius EGS7228FP firmware 1.05.05.
         */
        const ENGENIUS_EGS7228FP_OLD_FW = 2206671503;

        /**
         * EnGenius EWS7928FP firmware 1.05.42 to 1.06.21.
         */
        const ENGENIUS_EWS7928FP_OLD_FW = 2206700175;

        /**
         * Default of the Realtek switch SDK for RTL839x
         * (`CONFIG_IH_MAGIC_NUMBER`). No firmware image with this magic was found
         * among the ones surveyed (September 2026), so it may not be used in
         * practice.
         */
        const REALTEK_RTL839X = 2207252480;

        /**
         * Default of the Realtek switch SDK for RTL8396
         * (`CONFIG_IH_MAGIC_NUMBER`). No firmware image with this magic was found
         * among the ones surveyed (September 2026), so it may not be used in
         * practice.
         */
        const REALTEK_RTL8396 = 2207645696;

        /**
         * EnGenius EWS1200-52T firmware 1.05.38 to 1.06.21.
         */
        const ENGENIUS_EWS1200_52T_OLD_FW = 2207719506;

        /**
         * EnGenius EGS7252FP firmware 1.05.05.
         */
        const ENGENIUS_EGS7252FP_OLD_FW = 2207720751;

        /**
         * EnGenius EWS7952FP firmware 1.05.38 to 1.06.21.
         */
        const ENGENIUS_EWS7952FP_OLD_FW = 2207749423;

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
         */
        const REALTEK_RTL930X = 2466250752;

        /**
         * OpenWrt device `zyxel_xgs1010-12`.
         */
        const ZYXEL_XGS1010_12 = 2466254864;

        /**
         * OpenWrt device `zyxel_xgs1210-12`.
         */
        const ZYXEL_XGS1210_12 = 2466255376;

        /**
         * OpenWrt device `zyxel_xgs1250-12-common`.
         */
        const ZYXEL_XGS1250_12 = 2466255440;

        /**
         * OpenWrt devices `nicgiga_s100-0800s-m`, `tplink_tl-st1008f-v2`.
         */
        const NICGIGA_S100_0800S_M = 2466447360;

        /**
         * OpenWrt device `plasmacloud-common`.
         */
        const PLASMACLOUD_PSX28 = 2467299328;

        private const _VALUES = [5 => true, 6 => true, 22 => true, 7353344 => true, 9453568 => true, 50398464 => true, 50402048 => true, 50402050 => true, 50406401 => true, 50409728 => true, 51450112 => true, 51450624 => true, 58730768 => true, 58743058 => true, 58751272 => true, 59187216 => true, 59187240 => true, 59216527 => true, 60235858 => true, 60265775 => true, 304680960 => true, 305418240 => true, 391006017 => true, 391006018 => true, 638656533 => true, 654645590 => true, 654645607 => true, 808857906 => true, 825241648 => true, 825241649 => true, 825241650 => true, 825241652 => true, 825307184 => true, 827343191 => true, 842018865 => true, 842018867 => true, 842018868 => true, 842020401 => true, 842149936 => true, 859254832 => true, 859254833 => true, 859254835 => true, 909127728 => true, 909193778 => true, 1129270594 => true, 1129270595 => true, 1313293109 => true, 1313293600 => true, 1313293856 => true, 1313294112 => true, 1313294368 => true, 1313294624 => true, 1313296416 => true, 1330334793 => true, 1752396147 => true, 1936805707 => true, 2155872258 => true, 2197885696 => true, 2197885698 => true, 2197890049 => true, 2206203904 => true, 2206203905 => true, 2206203906 => true, 2206203907 => true, 2206203908 => true, 2206203920 => true, 2206203921 => true, 2206203922 => true, 2206203923 => true, 2206210573 => true, 2206210574 => true, 2206212360 => true, 2206212368 => true, 2206214416 => true, 2206224656 => true, 2206224914 => true, 2206226706 => true, 2206234920 => true, 2206670864 => true, 2206670888 => true, 2206671503 => true, 2206700175 => true, 2207252480 => true, 2207645696 => true, 2207719506 => true, 2207720751 => true, 2207749423 => true, 2466250752 => true, 2466254864 => true, 2466255376 => true, 2466255440 => true, 2466447360 => true, 2467299328 => true];

        public static function isDefined(int $v): bool {
            return isset(self::_VALUES[$v]);
        }
    }
}

namespace Uimage {
    class UimageArch {

        /**
         * Invalid CPU
         */
        const INVALID = 0;

        /**
         * Alpha
         */
        const ALPHA = 1;

        /**
         * ARM
         */
        const ARM = 2;

        /**
         * Intel x86
         */
        const I386 = 3;

        /**
         * IA64
         */
        const IA64 = 4;

        /**
         * MIPS
         */
        const MIPS = 5;

        /**
         * MIPS 64 Bit
         */
        const MIPS64 = 6;

        /**
         * PowerPC
         */
        const PPC = 7;

        /**
         * IBM S390
         */
        const S390 = 8;

        /**
         * SuperH
         */
        const SH = 9;

        /**
         * Sparc
         */
        const SPARC = 10;

        /**
         * Sparc 64 Bit
         */
        const SPARC64 = 11;

        /**
         * M68K
         */
        const M68K = 12;

        /**
         * Nios-32
         */
        const NIOS = 13;

        /**
         * MicroBlaze
         */
        const MICROBLAZE = 14;

        /**
         * Nios-II
         */
        const NIOS2 = 15;

        /**
         * Blackfin
         */
        const BLACKFIN = 16;

        /**
         * AVR32
         */
        const AVR32 = 17;

        /**
         * STMicroelectronics ST200
         */
        const ST200 = 18;

        /**
         * Sandbox architecture (test only)
         */
        const SANDBOX = 19;

        /**
         * ANDES Technology - NDS32
         */
        const NDS32 = 20;

        /**
         * OpenRISC 1000
         */
        const OPENRISC = 21;

        /**
         * ARM64
         */
        const ARM64 = 22;

        /**
         * Synopsys DesignWare ARC
         */
        const ARC = 23;

        /**
         * AMD x86_64, Intel and Via
         */
        const X86_64 = 24;

        /**
         * Xtensa
         */
        const XTENSA = 25;

        /**
         * RISC-V
         */
        const RISCV = 26;

        private const _VALUES = [0 => true, 1 => true, 2 => true, 3 => true, 4 => true, 5 => true, 6 => true, 7 => true, 8 => true, 9 => true, 10 => true, 11 => true, 12 => true, 13 => true, 14 => true, 15 => true, 16 => true, 17 => true, 18 => true, 19 => true, 20 => true, 21 => true, 22 => true, 23 => true, 24 => true, 25 => true, 26 => true];

        public static function isDefined(int $v): bool {
            return isset(self::_VALUES[$v]);
        }
    }
}

namespace Uimage {
    class UimageComp {

        /**
         * No Compression Used
         */
        const NONE = 0;
        const GZIP = 1;
        const BZIP2 = 2;
        const LZMA = 3;
        const LZO = 4;
        const LZ4 = 5;
        const ZSTD = 6;

        /**
         * `IH_COMP_MZ` of the U-Boot fork for SigmaStar (formerly MStar) SoCs,
         * not defined in upstream U-Boot. Used e.g. in I-O DATA TS-NS240W and
         * TS-NS320W network camera firmware.
         */
        const MZ = 9;

        /**
         * `IH_COMP_XIP` of the U-Boot fork for SigmaStar (formerly MStar) SoCs,
         * not defined in upstream U-Boot. No firmware image with this value was
         * found among the ones surveyed (September 2026), so it may not be used
         * in practice.
         */
        const XIP = 10;

        private const _VALUES = [0 => true, 1 => true, 2 => true, 3 => true, 4 => true, 5 => true, 6 => true, 9 => true, 10 => true];

        public static function isDefined(int $v): bool {
            return isset(self::_VALUES[$v]);
        }
    }
}

namespace Uimage {
    class UimageOs {

        /**
         * Invalid OS
         */
        const INVALID = 0;

        /**
         * OpenBSD
         */
        const OPENBSD = 1;

        /**
         * NetBSD
         */
        const NETBSD = 2;

        /**
         * FreeBSD
         */
        const FREEBSD = 3;

        /**
         * 4.4BSD
         */
        const BSD4_4 = 4;

        /**
         * Linux
         */
        const LINUX = 5;

        /**
         * SVR4
         */
        const SVR4 = 6;

        /**
         * Esix
         */
        const ESIX = 7;

        /**
         * Solaris
         */
        const SOLARIS = 8;

        /**
         * Irix
         */
        const IRIX = 9;

        /**
         * SCO
         */
        const SCO = 10;

        /**
         * Dell
         */
        const DELL = 11;

        /**
         * NCR
         */
        const NCR = 12;

        /**
         * LynxOS
         */
        const LYNXOS = 13;

        /**
         * VxWorks
         */
        const VXWORKS = 14;

        /**
         * pSOS
         */
        const PSOS = 15;

        /**
         * QNX
         */
        const QNX = 16;

        /**
         * Firmware
         */
        const U_BOOT = 17;

        /**
         * RTEMS
         */
        const RTEMS = 18;

        /**
         * ARTOS
         */
        const ARTOS = 19;

        /**
         * Unity OS
         */
        const UNITY = 20;

        /**
         * INTEGRITY
         */
        const INTEGRITY = 21;

        /**
         * OSE
         */
        const OSE = 22;

        /**
         * Plan 9
         */
        const PLAN9 = 23;

        /**
         * OpenRTOS
         */
        const OPENRTOS = 24;

        /**
         * ARM Trusted Firmware
         */
        const ARM_TRUSTED_FIRMWARE = 25;

        /**
         * Trusted Execution Environment
         */
        const TEE = 26;

        /**
         * RISC-V OpenSBI
         */
        const OPENSBI = 27;

        /**
         * EFI Firmware (e.g. GRUB2)
         */
        const EFI = 28;

        /**
         * ELF Image (e.g. seL4)
         */
        const ELF = 29;

        private const _VALUES = [0 => true, 1 => true, 2 => true, 3 => true, 4 => true, 5 => true, 6 => true, 7 => true, 8 => true, 9 => true, 10 => true, 11 => true, 12 => true, 13 => true, 14 => true, 15 => true, 16 => true, 17 => true, 18 => true, 19 => true, 20 => true, 21 => true, 22 => true, 23 => true, 24 => true, 25 => true, 26 => true, 27 => true, 28 => true, 29 => true];

        public static function isDefined(int $v): bool {
            return isset(self::_VALUES[$v]);
        }
    }
}

namespace Uimage {
    class UimageType {

        /**
         * Invalid Image
         */
        const INVALID = 0;

        /**
         * Standalone Program
         */
        const STANDALONE = 1;

        /**
         * OS Kernel Image
         */
        const KERNEL = 2;

        /**
         * RAMDisk Image
         */
        const RAMDISK = 3;

        /**
         * Multi-File Image
         */
        const MULTI = 4;

        /**
         * Firmware Image
         */
        const FIRMWARE = 5;

        /**
         * Script file
         */
        const SCRIPT = 6;

        /**
         * Filesystem Image (any type)
         */
        const FILESYSTEM = 7;

        /**
         * Binary Flat Device Tree Blob
         */
        const FLATDT = 8;

        /**
         * Kirkwood Boot Image
         */
        const KWBIMAGE = 9;

        /**
         * Freescale IMXBoot Image
         */
        const IMXIMAGE = 10;

        /**
         * Davinci UBL Image
         */
        const UBLIMAGE = 11;

        /**
         * TI OMAP Config Header Image
         */
        const OMAPIMAGE = 12;

        /**
         * TI Davinci AIS Image
         */
        const AISIMAGE = 13;

        /**
         * OS Kernel Image, can run from any load address
         */
        const KERNEL_NOLOAD = 14;

        /**
         * Freescale PBL Boot Image
         */
        const PBLIMAGE = 15;

        /**
         * Freescale MXSBoot Image
         */
        const MXSIMAGE = 16;

        /**
         * TI Keystone GPHeader Image
         */
        const GPIMAGE = 17;

        /**
         * ATMEL ROM bootable Image
         */
        const ATMELIMAGE = 18;

        /**
         * Altera SOCFPGA CV/AV Preloader
         */
        const SOCFPGAIMAGE = 19;

        /**
         * x86 setup.bin Image
         */
        const X86_SETUP = 20;

        /**
         * x86 setup.bin Image
         */
        const LPC32XXIMAGE = 21;

        /**
         * A list of typeless images
         */
        const LOADABLE = 22;

        /**
         * Rockchip Boot Image
         */
        const RKIMAGE = 23;

        /**
         * Rockchip SD card
         */
        const RKSD = 24;

        /**
         * Rockchip SPI image
         */
        const RKSPI = 25;

        /**
         * Xilinx Zynq Boot Image
         */
        const ZYNQIMAGE = 26;

        /**
         * Xilinx ZynqMP Boot Image
         */
        const ZYNQMPIMAGE = 27;

        /**
         * Xilinx ZynqMP Boot Image (bif)
         */
        const ZYNQMPBIF = 28;

        /**
         * FPGA Image
         */
        const FPGA = 29;

        /**
         * VYBRID .vyb Image
         */
        const VYBRIDIMAGE = 30;

        /**
         * Trusted Execution Environment OS Image
         */
        const TEE = 31;

        /**
         * Firmware Image with HABv4 IVT
         */
        const FIRMWARE_IVT = 32;

        /**
         * TI Power Management Micro-Controller Firmware
         */
        const PMMC = 33;

        /**
         * STMicroelectronics STM32 Image
         */
        const STM32IMAGE = 34;

        /**
         * Altera SOCFPGA A10 Preloader
         */
        const SOCFPGAIMAGE_V1 = 35;

        /**
         * MediaTek BootROM loadable Image
         */
        const MTKIMAGE = 36;

        /**
         * Freescale IMX8MBoot Image
         */
        const IMX8MIMAGE = 37;

        /**
         * Freescale IMX8Boot Image
         */
        const IMX8IMAGE = 38;

        /**
         * Coprocessor Image for remoteproc
         */
        const COPRO = 39;

        /**
         * Allwinner eGON Boot Image
         */
        const SUNXI_EGON = 40;

        /**
         * Allwinner TOC0 Boot Image
         */
        const SUNXI_TOC0 = 41;

        /**
         * Binary Flat Device Tree Blob in a Legacy Image
         */
        const FDT_LEGACY = 42;

        /**
         * Renesas SPKG image
         */
        const RENESAS_SPKG = 43;

        /**
         * StarFive SPL image
         */
        const STARFIVE_SPL = 44;

        /**
         * TFA BL31 image
         */
        const TFA_BL31 = 45;

        /**
         * STMicroelectronics STM32 Image V2.0
         */
        const STM32IMAGE_V2 = 46;

        /**
         * Amlogic Boot Image
         */
        const AMLIMAGE = 47;

        private const _VALUES = [0 => true, 1 => true, 2 => true, 3 => true, 4 => true, 5 => true, 6 => true, 7 => true, 8 => true, 9 => true, 10 => true, 11 => true, 12 => true, 13 => true, 14 => true, 15 => true, 16 => true, 17 => true, 18 => true, 19 => true, 20 => true, 21 => true, 22 => true, 23 => true, 24 => true, 25 => true, 26 => true, 27 => true, 28 => true, 29 => true, 30 => true, 31 => true, 32 => true, 33 => true, 34 => true, 35 => true, 36 => true, 37 => true, 38 => true, 39 => true, 40 => true, 41 => true, 42 => true, 43 => true, 44 => true, 45 => true, 46 => true, 47 => true];

        public static function isDefined(int $v): bool {
            return isset(self::_VALUES[$v]);
        }
    }
}
