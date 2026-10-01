// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

using System;

namespace Kaitai
{

    /// <summary>
    /// The legacy U-Boot image format (uImage), as created by `mkimage`: a 64-byte
    /// header followed by the image data (e.g. a Linux kernel, a ramdisk or a
    /// script). The header describes the data (OS, CPU architecture, image type,
    /// compression, load and entry point addresses, name) and protects both the
    /// header and the data with CRC-32 checksums.
    /// 
    /// U-Boot's newer FIT (Flattened Image Tree) format is not covered by this spec.
    /// </summary>
    /// <remarks>
    /// Reference: <a href="https://github.com/u-boot/u-boot/blob/ece349ade2973e220f524ce59e59711cc919263f/include/image.h">Git tag "v2026.07"</a>
    /// </remarks>
    public partial class Uimage : KaitaiStruct
    {
        public static Uimage FromFile(string fileName)
        {
            return new Uimage(new KaitaiStream(fileName));
        }


        public enum MagicTypes
        {
            AllnetAllSg8316m = 5,
            AllnetAllSg8208m = 6,
            AllnetAllSg8324m = 22,
            DattoL8 = 7353344,
            AllnetAllWapc0450c = 9453568,
            EngeniusEws2910pV3 = 50398464,
            EngeniusEws120028tfp = 50402048,
            EngeniusEws7926efp = 50402050,
            EngeniusEws7952p = 50406401,
            EngeniusEws2908p = 50409728,
            EngeniusEws7928pV2 = 51450112,
            EngeniusEws120028tfpV2 = 51450624,
            EngeniusEws2910p = 58730768,
            EngeniusEws5912fp = 58743058,
            EngeniusEws7928p = 58751272,
            EngeniusEws1200d10t = 59187216,
            EngeniusEws120028t = 59187240,
            EngeniusEws7928fp = 59216527,
            EngeniusEws120052t = 60235858,
            EngeniusEws7952fp = 60265775,
            YoukuYkL1 = 304680960,
            RealtekSdk = 305418240,
            NetgearGs750e = 391006017,
            NetgearGs728tpV2 = 391006018,
            BoltBl100 = 638656533,
            Uimage = 654645590,
            NetgearWnce4004 = 654645607,
            NetgearWnr612V2Early = 808857906,
            NetgearWnr1000V2Vc = 825241648,
            NetgearWnr1000V2 = 825241649,
            NetgearWnr1000V2Vm = 825241650,
            NetgearWnr1000V4 = 825241652,
            NetgearWpn824n = 825307184,
            ZyxelUag50 = 827343191,
            NetgearWnr2000 = 842018865,
            NetgearWnr2000V3 = 842018867,
            NetgearWnr2000V4 = 842018868,
            NetgearWnr612V2 = 842020401,
            NetgearWnr2200 = 842149936,
            NetgearWndr3700 = 859254832,
            NetgearWndr3700V2 = 859254833,
            NetgearWndr3700V4 = 859254835,
            NetgearR6100 = 909127728,
            NetgearWnr612 = 909193778,
            MitrastarComb = 1129270594,
            MitrastarComc = 1129270595,
            NetgearGs308t = 1313293109,
            NetgearNge = 1313293600,
            NetgearNgf = 1313293856,
            NetgearNgg = 1313294112,
            NetgearNgh = 1313294368,
            NetgearNgi = 1313294624,
            NetgearNgp = 1313296416,
            OpenwrtOkli = 1330334793,
            OpenwrtDlinkCovr = 1752396147,
            OpenwrtSenaoOkli = 1936805707,
            EngeniusEcs1112fp = 2155872258,
            EngeniusFitswitch = 2155872259,
            EngeniusEws120028tfpOldFw = 2197885696,
            EngeniusEws7926efpOldFw = 2197885698,
            EngeniusEws7952pOldFw = 2197890049,
            RealtekRtl838x = 2206203904,
            IodataBshG08m = 2206203905,
            IodataBshGp08 = 2206203906,
            IodataBshG16m = 2206203907,
            IodataBshG24m = 2206203908,
            IodataBshG08mb = 2206203920,
            IodataBshGp08mb = 2206203921,
            IodataBshG16mb = 2206203922,
            IodataBshG24mb = 2206203923,
            TrendnetTpe3012ls = 2206210573,
            TrendnetTpe3018ls = 2206210574,
            EngeniusEgs2108pOldFw = 2206212360,
            EngeniusEgs2110pOldFw = 2206212368,
            EngeniusEws2910pOldFw = 2206214416,
            EngeniusEgs5110pOldFw = 2206224656,
            EngeniusEgs5212fpOldFw = 2206224914,
            EngeniusEws5912fpOldFw = 2206226706,
            EngeniusEws7928pOldFw = 2206234920,
            EngeniusEws1200d10tOldFw = 2206670864,
            EngeniusEws120028tOldFw = 2206670888,
            EngeniusEgs7228fpOldFw = 2206671503,
            EngeniusEws7928fpOldFw = 2206700175,
            RealtekRtl839x = 2207252480,
            RealtekRtl8396 = 2207645696,
            EngeniusEws120052tOldFw = 2207719506,
            EngeniusEgs7252fpOldFw = 2207720751,
            EngeniusEws7952fpOldFw = 2207749423,
            RealtekRtl930x = 2466250752,
            ZyxelXgs101012 = 2466254864,
            ZyxelXgs121012 = 2466255376,
            ZyxelXgs125012 = 2466255440,
            NicgigaS1000800sM = 2466447360,
            PlasmacloudPsx28 = 2467299328,
        }

        public enum UimageArch
        {
            Invalid = 0,
            Alpha = 1,
            Arm = 2,
            I386 = 3,
            Ia64 = 4,
            Mips = 5,
            Mips64 = 6,
            Ppc = 7,
            S390 = 8,
            Sh = 9,
            Sparc = 10,
            Sparc64 = 11,
            M68k = 12,
            Nios = 13,
            Microblaze = 14,
            Nios2 = 15,
            Blackfin = 16,
            Avr32 = 17,
            St200 = 18,
            Sandbox = 19,
            Nds32 = 20,
            Openrisc = 21,
            Arm64 = 22,
            Arc = 23,
            X8664 = 24,
            Xtensa = 25,
            Riscv = 26,
        }

        public enum UimageComp
        {
            None = 0,
            Gzip = 1,
            Bzip2 = 2,
            Lzma = 3,
            Lzo = 4,
            Lz4 = 5,
            Zstd = 6,
            Mz = 9,
            Xip = 10,
        }

        public enum UimageOs
        {
            Invalid = 0,
            Openbsd = 1,
            Netbsd = 2,
            Freebsd = 3,
            Bsd44 = 4,
            Linux = 5,
            Svr4 = 6,
            Esix = 7,
            Solaris = 8,
            Irix = 9,
            Sco = 10,
            Dell = 11,
            Ncr = 12,
            Lynxos = 13,
            Vxworks = 14,
            Psos = 15,
            Qnx = 16,
            UBoot = 17,
            Rtems = 18,
            Artos = 19,
            Unity = 20,
            Integrity = 21,
            Ose = 22,
            Plan9 = 23,
            Openrtos = 24,
            ArmTrustedFirmware = 25,
            Tee = 26,
            Opensbi = 27,
            Efi = 28,
            Elf = 29,
        }

        public enum UimageType
        {
            Invalid = 0,
            Standalone = 1,
            Kernel = 2,
            Ramdisk = 3,
            Multi = 4,
            Firmware = 5,
            Script = 6,
            Filesystem = 7,
            Flatdt = 8,
            Kwbimage = 9,
            Imximage = 10,
            Ublimage = 11,
            Omapimage = 12,
            Aisimage = 13,
            KernelNoload = 14,
            Pblimage = 15,
            Mxsimage = 16,
            Gpimage = 17,
            Atmelimage = 18,
            Socfpgaimage = 19,
            X86Setup = 20,
            Lpc32xximage = 21,
            Loadable = 22,
            Rkimage = 23,
            Rksd = 24,
            Rkspi = 25,
            Zynqimage = 26,
            Zynqmpimage = 27,
            Zynqmpbif = 28,
            Fpga = 29,
            Vybridimage = 30,
            Tee = 31,
            FirmwareIvt = 32,
            Pmmc = 33,
            Stm32image = 34,
            SocfpgaimageV1 = 35,
            Mtkimage = 36,
            Imx8mimage = 37,
            Imx8image = 38,
            Copro = 39,
            SunxiEgon = 40,
            SunxiToc0 = 41,
            FdtLegacy = 42,
            RenesasSpkg = 43,
            StarfiveSpl = 44,
            TfaBl31 = 45,
            Stm32imageV2 = 46,
            Amlimage = 47,
        }
        public Uimage(KaitaiStream p__io, KaitaiStruct p__parent = null, Uimage p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
            _read();
        }
        private void _read()
        {
            _header = new Uheader(m_io, this, m_root);
            _data = m_io.ReadBytes(Header.LenImage);
        }

        /// <summary>
        /// ASUS firmware images [overlay the 32-byte image
        /// name](https://github.com/drag0njoe/RT-AC55U/blob/cf5874684ab6995ee07e91a52dfdd0562fcc2655/release/src/asustools/mkimage.src/include/image.h#L185-L188)
        /// with a [`TAIL`
        /// structure](https://github.com/drag0njoe/RT-AC55U/blob/cf5874684ab6995ee07e91a52dfdd0562fcc2655/release/src/asustools/mkimage.src/include/image.h#L151-L171)
        /// that contains version information and the product ID (model name).
        /// 
        /// The first 16 bytes have the same structure in all three known variants of
        /// the `TAIL` structure. The meaning of the last 16 bytes differs across the
        /// variants - therefore, for simplicity, this Kaitai Struct implementation
        /// treats them as an opaque byte array named `extra_info`. For an overview of
        /// the variants, see the documentation for `extra_info`.
        /// </summary>
        public partial class AsusFirmwareInformation : KaitaiStruct
        {
            public static AsusFirmwareInformation FromFile(string fileName)
            {
                return new AsusFirmwareInformation(new KaitaiStream(fileName));
            }

            public AsusFirmwareInformation(KaitaiStream p__io, Uimage.NameOrAsusInfo p__parent = null, Uimage p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _kernelVersion = new Version(m_io, this, m_root);
                _fsVersion = new Version(m_io, this, m_root);
                _productId = System.Text.Encoding.GetEncoding("UTF-8").GetString(KaitaiStream.BytesTerminate(m_io.ReadBytes(12), 0, false));
                _extraInfo = m_io.ReadBytes(16);
            }
            private Version _kernelVersion;
            private Version _fsVersion;
            private string _productId;
            private byte[] _extraInfo;
            private Uimage m_root;
            private Uimage.NameOrAsusInfo m_parent;
            public Version KernelVersion { get { return _kernelVersion; } }
            public Version FsVersion { get { return _fsVersion; } }

            /// <summary>
            /// In the Ralink SDK variant (see `extra_info`), the product ID field is
            /// actually 23 bytes long, but no known product ID is longer than 12
            /// bytes.
            /// </summary>
            public string ProductId { get { return _productId; } }

            /// <summary>
            /// The structure of these bytes varies among the three known variants of
            /// the `TAIL` structure, and the header doesn't say which one is used:
            /// 
            /// * Plain: 8 hardware versions (using the `version` type) - see
            ///   &lt;https://github.com/drag0njoe/RT-AC55U/blob/cf5874684ab6995ee07e91a52dfdd0562fcc2655/release/src/asustools/mkimage.src/include/image.h#L170&gt;
            /// 
            ///   Sample file: `RT-AC51U_3.0.0.4_380_8591-ga8dd632.trx` from
            ///   &lt;https://dlcdnets.asus.com/pub/ASUS/wireless/RT-AC51U/FW_RT_AC51U_30043808591.zip&gt;,
            ///   released on 2020-09-22 and listed on
            ///   &lt;https://www.asus.com/supportonly/rt-ac51u/helpdesk_bios/&gt;.
            /// 
            ///   Source code links:
            /// 
            ///   - [ASUS GPL source, RT-AC55UHP
            ///     3.0.0.4.382.51915](https://dlcdnets.asus.com/pub/ASUS/wireless/RT-AC55UHP/GPL_RT_AC55UHP_300438251915.zip)
            ///     (`asuswrt/release/src/asustools/mkimage.src/` in
            ///     `GPL_RT-AC55UHP_3.0.0.4.382.51915-g4086e57.tgz`)
            ///   - [ASUS GPL source, RT-AC55U 3.0.0.4.382.50702 (unofficial
            ///     mirror)](https://github.com/drag0njoe/RT-AC55U/tree/cf5874684ab6995ee07e91a52dfdd0562fcc2655/release/src/asustools/mkimage.src)
            /// 
            /// * `TRX_NEW` (a macro defined when building `mkimage`): the
            ///   build number and extended build number (`u2le` each), two key bytes
            ///   and 5 hardware versions - see
            ///   &lt;https://github.com/drag0njoe/RT-AC55U/blob/cf5874684ab6995ee07e91a52dfdd0562fcc2655/release/src-qca/asustools/mkimage.src/include/image.h#L174-L180&gt;
            /// 
            ///   `mkimage` [overwrites the first 3 hardware
            ///   versions](https://github.com/drag0njoe/RT-AC55U/blob/cf5874684ab6995ee07e91a52dfdd0562fcc2655/release/src-qca/asustools/mkimage.src/mkimage.c#L546-L569)
            ///   with values derived from the key bytes.
            /// 
            ///   Sample file: `RT-AC55UHP_3.0.0.4_382_52236-ga0f880d.trx` (build 382,
            ///   extended build 52236) from
            ///   &lt;https://dlcdnets.asus.com/pub/ASUS/wireless/RT-AC55UHP/FW_RT_AC55UHP_300438252236.zip&gt;,
            ///   released on 2020-06-04 and listed on
            ///   &lt;https://www.asus.com/supportonly/rt-ac55uhp/helpdesk_bios/&gt;.
            /// 
            ///   Source code links:
            /// 
            ///   - [ASUS GPL source, RT-AC55UHP
            ///     3.0.0.4.382.51915](https://dlcdnets.asus.com/pub/ASUS/wireless/RT-AC55UHP/GPL_RT_AC55UHP_300438251915.zip)
            ///     (`asuswrt/release/src-qca/asustools/mkimage.src/` in
            ///     `GPL_RT-AC55UHP_3.0.0.4.382.51915-g4086e57.tgz`)
            ///   - [ASUS GPL source, RT-AC55U 3.0.0.4.382.50702 (unofficial
            ///     mirror)](https://github.com/drag0njoe/RT-AC55U/tree/cf5874684ab6995ee07e91a52dfdd0562fcc2655/release/src-qca/asustools/mkimage.src)
            /// 
            /// * Ralink SDK: the rest of a 23-byte product ID (see `product_id`),
            ///   a version suffix letter and the kernel part size (called `ih_ksz`) -
            ///   see &lt;https://github.com/andy-padavan/rt-n56u/blob/32a93db4026cc2cff585d7008373432d888fc1aa/trunk/tools/mkimage/include/image.h#L164-L165&gt;
            /// 
            ///   Sample file: `RP-N12_1.0.1.1f.trx` from
            ///   &lt;https://dlcdnets.asus.com/pub/ASUS/wireless/RP-N12/FW_RP-N12_1.0.1.1f.zip&gt;,
            ///   released on 2019-11-12 and listed on
            ///   &lt;https://www.asus.com/supportonly/rp-n12/helpdesk_bios/&gt;.
            /// 
            ///   Source code links:
            /// 
            ///   - [ASUS GPL source, RP-N12
            ///     1.0.1.1f](https://dlcdnets.asus.com/pub/ASUS/wireless/RP-N12/GPL_RP_N12_1011f.zip)
            ///     (`GPL_RP-N12_source.1011f/user/mkimage/include/image.h` in
            ///     `GPL_RP-N12_source.1011f.tar.bz2`)
            ///   - [rt-n56u custom firmware by Andy
            ///     Padavan](https://github.com/andy-padavan/rt-n56u/blob/32a93db4026cc2cff585d7008373432d888fc1aa/trunk/tools/mkimage/include/image.h)
            /// 
            /// In the plain and `TRX_NEW` variants, the last 4 bytes may instead
            /// contain the offset of the root file system, which is [written by
            /// `mkimage -r`](https://github.com/drag0njoe/RT-AC55U/blob/cf5874684ab6995ee07e91a52dfdd0562fcc2655/release/src/asustools/mkimage.src/mkimage.c#L527-L542)
            /// as the magic byte 0xA9
            /// ([`ROOTFS_OFFSET_MAGIC`](https://github.com/drag0njoe/RT-AC55U/blob/cf5874684ab6995ee07e91a52dfdd0562fcc2655/release/src/asustools/mkimage.src/include/image.h#L154-L159))
            /// followed by the offset as a 24-bit big-endian integer.
            /// </summary>
            public byte[] ExtraInfo { get { return _extraInfo; } }
            public Uimage M_Root { get { return m_root; } }
            public Uimage.NameOrAsusInfo M_Parent { get { return m_parent; } }
        }
        public partial class NameOrAsusInfo : KaitaiStruct
        {
            public static NameOrAsusInfo FromFile(string fileName)
            {
                return new NameOrAsusInfo(new KaitaiStream(fileName));
            }

            public NameOrAsusInfo(KaitaiStream p__io, Uimage.Uheader p__parent = null, Uimage p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_byte0 = false;
                f_byte4 = false;
                f_hasAsusInfo = false;
                _read();
            }
            private void _read()
            {
                if (!(HasAsusInfo)) {
                    _name = System.Text.Encoding.GetEncoding("UTF-8").GetString(m_io.ReadBytesTerm(0, false, true, false));
                }
                if (HasAsusInfo) {
                    _asusInfo = new AsusFirmwareInformation(m_io, this, m_root);
                }
            }
            private bool f_byte0;
            private byte _byte0;
            public byte Byte0
            {
                get
                {
                    if (f_byte0)
                        return _byte0;
                    f_byte0 = true;
                    long _pos = m_io.Pos;
                    m_io.Seek(0);
                    _byte0 = m_io.ReadU1();
                    m_io.Seek(_pos);
                    return _byte0;
                }
            }
            private bool f_byte4;
            private byte _byte4;
            public byte Byte4
            {
                get
                {
                    if (f_byte4)
                        return _byte4;
                    f_byte4 = true;
                    long _pos = m_io.Pos;
                    m_io.Seek(4);
                    _byte4 = m_io.ReadU1();
                    m_io.Seek(_pos);
                    return _byte4;
                }
            }
            private bool f_hasAsusInfo;
            private bool _hasAsusInfo;

            /// <summary>
            /// Whether this type stores ASUS firmware information (`asus_info`)
            /// rather than an image name (`name`).
            /// 
            /// The header doesn't say which one it is, so we infer it using a
            /// heuristic based on the layout of the `asus_firmware_information` type.
            /// If ASUS firmware info is present, the first byte (the major kernel
            /// version number) is a small integer (i.e. not a printable character),
            /// and byte 4 (first byte of the product ID/model name) is a printable
            /// character. An empty name is not mistaken for ASUS information, because
            /// its byte 4 is a null byte.
            /// 
            /// The highest known major kernel version number is 9 (e.g. in
            /// `DSL-N55U_9.0.0.4_380_3925-gad8f412_Annex_A.trx` from
            /// &lt;https://dlcdnets.asus.com/pub/ASUS/wireless/DSL-N55U/FW_DSL_N55U_90043803925.zip&gt;,
            /// released on 2016-08-04 and listed on
            /// &lt;https://www.asus.com/supportonly/dsl-n55u/helpdesk_bios/&gt;). ASUS
            /// seems to use such high major versions (9, sometimes 7) for beta
            /// releases, whereas regular releases use 3 (or 1 in older firmware).
            /// 
            /// It can also be 0, in particular due to a bug in the MediaTek MT798X
            /// build of ASUS's `mkimage` (it reads the `-V` values from fixed `argv`
            /// positions, even though it parses the options using `getopt()` - see
            /// &lt;https://github.com/blocktrron/tuf-ax4200-gpl/blob/a4fe37f4d78473f97c6d47cf93d97c3811af90cc/release/src-mtk-MT798X/Uboot-upstream/tools/mkimage.c#L317-L333&gt;).
            /// For example, this is the case in
            /// `RT-AX52_3.0.0.4_388_34015-g9488655.trx` from
            /// &lt;https://dlcdnets.asus.com/pub/ASUS/wireless/RT-AX52/FW_RT-AX52_300438834015.zip&gt;,
            /// released on 2026-03-20 and listed on
            /// &lt;https://www.asus.com/supportonly/rt-ax52/helpdesk_bios?model2Name=RT-AX52&gt;.
            /// </summary>
            public bool HasAsusInfo
            {
                get
                {
                    if (f_hasAsusInfo)
                        return _hasAsusInfo;
                    f_hasAsusInfo = true;
                    _hasAsusInfo = (bool) ( ((Byte0 < 32) && (Byte4 >= 32) && (Byte4 < 127)) );
                    return _hasAsusInfo;
                }
            }
            private string _name;
            private AsusFirmwareInformation _asusInfo;
            private Uimage m_root;
            private Uimage.Uheader m_parent;
            public string Name { get { return _name; } }
            public AsusFirmwareInformation AsusInfo { get { return _asusInfo; } }
            public Uimage M_Root { get { return m_root; } }
            public Uimage.Uheader M_Parent { get { return m_parent; } }
        }
        public partial class Uheader : KaitaiStruct
        {
            public static Uheader FromFile(string fileName)
            {
                return new Uheader(new KaitaiStream(fileName));
            }

            public Uheader(KaitaiStream p__io, Uimage p__parent = null, Uimage p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _magic = ((Uimage.MagicTypes) m_io.ReadU4be());
                if (!Enum.IsDefined(typeof(MagicTypes), _magic))
                {
                    throw new ValidationNotInEnumError(_magic, m_io, "/types/uheader/seq/0");
                }
                _headerCrc = m_io.ReadU4be();
                _timestamp = m_io.ReadU4be();
                _lenImage = m_io.ReadU4be();
                _loadAddress = m_io.ReadU4be();
                _entryAddress = m_io.ReadU4be();
                _dataCrc = m_io.ReadU4be();
                _osType = ((Uimage.UimageOs) m_io.ReadU1());
                if (!Enum.IsDefined(typeof(UimageOs), _osType))
                {
                    throw new ValidationNotInEnumError(_osType, m_io, "/types/uheader/seq/7");
                }
                _architecture = ((Uimage.UimageArch) m_io.ReadU1());
                if (!Enum.IsDefined(typeof(UimageArch), _architecture))
                {
                    throw new ValidationNotInEnumError(_architecture, m_io, "/types/uheader/seq/8");
                }
                _imageType = ((Uimage.UimageType) m_io.ReadU1());
                if (!Enum.IsDefined(typeof(UimageType), _imageType))
                {
                    throw new ValidationNotInEnumError(_imageType, m_io, "/types/uheader/seq/9");
                }
                _compressionType = ((Uimage.UimageComp) m_io.ReadU1());
                if (!Enum.IsDefined(typeof(UimageComp), _compressionType))
                {
                    throw new ValidationNotInEnumError(_compressionType, m_io, "/types/uheader/seq/10");
                }
                __raw_nameOrAsusInfo = m_io.ReadBytes(32);
                var io___raw_nameOrAsusInfo = new KaitaiStream(__raw_nameOrAsusInfo);
                _nameOrAsusInfo = new NameOrAsusInfo(io___raw_nameOrAsusInfo, this, m_root);
            }
            private MagicTypes _magic;
            private uint _headerCrc;
            private uint _timestamp;
            private uint _lenImage;
            private uint _loadAddress;
            private uint _entryAddress;
            private uint _dataCrc;
            private UimageOs _osType;
            private UimageArch _architecture;
            private UimageType _imageType;
            private UimageComp _compressionType;
            private NameOrAsusInfo _nameOrAsusInfo;
            private Uimage m_root;
            private Uimage m_parent;
            private byte[] __raw_nameOrAsusInfo;

            /// <summary>
            /// Besides the standard U-Boot magic, some vendors' bootloaders expect
            /// their own value (often a different one for each device model), with
            /// the rest of the header unchanged. `magic_types` lists the values
            /// known so far; images with any other magic are rejected.
            /// </summary>
            public MagicTypes Magic { get { return _magic; } }
            public uint HeaderCrc { get { return _headerCrc; } }
            public uint Timestamp { get { return _timestamp; } }
            public uint LenImage { get { return _lenImage; } }
            public uint LoadAddress { get { return _loadAddress; } }
            public uint EntryAddress { get { return _entryAddress; } }
            public uint DataCrc { get { return _dataCrc; } }
            public UimageOs OsType { get { return _osType; } }
            public UimageArch Architecture { get { return _architecture; } }
            public UimageType ImageType { get { return _imageType; } }
            public UimageComp CompressionType { get { return _compressionType; } }
            public NameOrAsusInfo NameOrAsusInfo { get { return _nameOrAsusInfo; } }
            public Uimage M_Root { get { return m_root; } }
            public Uimage M_Parent { get { return m_parent; } }
            public byte[] M_RawNameOrAsusInfo { get { return __raw_nameOrAsusInfo; } }
        }
        public partial class Version : KaitaiStruct
        {
            public static Version FromFile(string fileName)
            {
                return new Version(new KaitaiStream(fileName));
            }

            public Version(KaitaiStream p__io, Uimage.AsusFirmwareInformation p__parent = null, Uimage p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _major = m_io.ReadU1();
                _minor = m_io.ReadU1();
            }
            private byte _major;
            private byte _minor;
            private Uimage m_root;
            private Uimage.AsusFirmwareInformation m_parent;
            public byte Major { get { return _major; } }
            public byte Minor { get { return _minor; } }
            public Uimage M_Root { get { return m_root; } }
            public Uimage.AsusFirmwareInformation M_Parent { get { return m_parent; } }
        }
        private Uheader _header;
        private byte[] _data;
        private Uimage m_root;
        private KaitaiStruct m_parent;
        public Uheader Header { get { return _header; } }
        public byte[] Data { get { return _data; } }
        public Uimage M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
    }
}
