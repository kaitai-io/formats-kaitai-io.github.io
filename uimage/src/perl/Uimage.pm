# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.011_000;
use Encode;

########################################################################
package Uimage;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

our $MAGIC_TYPES_ALLNET_ALL_SG8316M = 5;
our $MAGIC_TYPES_ALLNET_ALL_SG8208M = 6;
our $MAGIC_TYPES_ALLNET_ALL_SG8324M = 22;
our $MAGIC_TYPES_DATTO_L8 = 7353344;
our $MAGIC_TYPES_ALLNET_ALL_WAPC0450C = 9453568;
our $MAGIC_TYPES_ENGENIUS_EWS2910P_V3 = 50398464;
our $MAGIC_TYPES_ENGENIUS_EWS1200_28TFP = 50402048;
our $MAGIC_TYPES_ENGENIUS_EWS7926EFP = 50402050;
our $MAGIC_TYPES_ENGENIUS_EWS7952P = 50406401;
our $MAGIC_TYPES_ENGENIUS_EWS2908P = 50409728;
our $MAGIC_TYPES_ENGENIUS_EWS7928P_V2 = 51450112;
our $MAGIC_TYPES_ENGENIUS_EWS1200_28TFP_V2 = 51450624;
our $MAGIC_TYPES_ENGENIUS_EWS2910P = 58730768;
our $MAGIC_TYPES_ENGENIUS_EWS5912FP = 58743058;
our $MAGIC_TYPES_ENGENIUS_EWS7928P = 58751272;
our $MAGIC_TYPES_ENGENIUS_EWS1200D_10T = 59187216;
our $MAGIC_TYPES_ENGENIUS_EWS1200_28T = 59187240;
our $MAGIC_TYPES_ENGENIUS_EWS7928FP = 59216527;
our $MAGIC_TYPES_ENGENIUS_EWS1200_52T = 60235858;
our $MAGIC_TYPES_ENGENIUS_EWS7952FP = 60265775;
our $MAGIC_TYPES_YOUKU_YK_L1 = 304680960;
our $MAGIC_TYPES_REALTEK_SDK = 305418240;
our $MAGIC_TYPES_NETGEAR_GS750E = 391006017;
our $MAGIC_TYPES_NETGEAR_GS728TP_V2 = 391006018;
our $MAGIC_TYPES_BOLT_BL100 = 638656533;
our $MAGIC_TYPES_UIMAGE = 654645590;
our $MAGIC_TYPES_NETGEAR_WNCE4004 = 654645607;
our $MAGIC_TYPES_NETGEAR_WNR612_V2_EARLY = 808857906;
our $MAGIC_TYPES_NETGEAR_WNR1000_V2_VC = 825241648;
our $MAGIC_TYPES_NETGEAR_WNR1000_V2 = 825241649;
our $MAGIC_TYPES_NETGEAR_WNR1000_V2_VM = 825241650;
our $MAGIC_TYPES_NETGEAR_WNR1000_V4 = 825241652;
our $MAGIC_TYPES_NETGEAR_WPN824N = 825307184;
our $MAGIC_TYPES_ZYXEL_UAG50 = 827343191;
our $MAGIC_TYPES_NETGEAR_WNR2000 = 842018865;
our $MAGIC_TYPES_NETGEAR_WNR2000_V3 = 842018867;
our $MAGIC_TYPES_NETGEAR_WNR2000_V4 = 842018868;
our $MAGIC_TYPES_NETGEAR_WNR612_V2 = 842020401;
our $MAGIC_TYPES_NETGEAR_WNR2200 = 842149936;
our $MAGIC_TYPES_NETGEAR_WNDR3700 = 859254832;
our $MAGIC_TYPES_NETGEAR_WNDR3700_V2 = 859254833;
our $MAGIC_TYPES_NETGEAR_WNDR3700_V4 = 859254835;
our $MAGIC_TYPES_NETGEAR_R6100 = 909127728;
our $MAGIC_TYPES_NETGEAR_WNR612 = 909193778;
our $MAGIC_TYPES_MITRASTAR_COMB = 1129270594;
our $MAGIC_TYPES_MITRASTAR_COMC = 1129270595;
our $MAGIC_TYPES_NETGEAR_GS308T = 1313293109;
our $MAGIC_TYPES_NETGEAR_NGE = 1313293600;
our $MAGIC_TYPES_NETGEAR_NGF = 1313293856;
our $MAGIC_TYPES_NETGEAR_NGG = 1313294112;
our $MAGIC_TYPES_NETGEAR_NGH = 1313294368;
our $MAGIC_TYPES_NETGEAR_NGI = 1313294624;
our $MAGIC_TYPES_NETGEAR_NGP = 1313296416;
our $MAGIC_TYPES_OPENWRT_OKLI = 1330334793;
our $MAGIC_TYPES_OPENWRT_DLINK_COVR = 1752396147;
our $MAGIC_TYPES_OPENWRT_SENAO_OKLI = 1936805707;
our $MAGIC_TYPES_ENGENIUS_ECS1112FP = 2155872258;
our $MAGIC_TYPES_ENGENIUS_EWS1200_28TFP_OLD_FW = 2197885696;
our $MAGIC_TYPES_ENGENIUS_EWS7926EFP_OLD_FW = 2197885698;
our $MAGIC_TYPES_ENGENIUS_EWS7952P_OLD_FW = 2197890049;
our $MAGIC_TYPES_REALTEK_RTL838X = 2206203904;
our $MAGIC_TYPES_IODATA_BSH_G08M = 2206203905;
our $MAGIC_TYPES_IODATA_BSH_GP08 = 2206203906;
our $MAGIC_TYPES_IODATA_BSH_G16M = 2206203907;
our $MAGIC_TYPES_IODATA_BSH_G24M = 2206203908;
our $MAGIC_TYPES_IODATA_BSH_G08MB = 2206203920;
our $MAGIC_TYPES_IODATA_BSH_GP08MB = 2206203921;
our $MAGIC_TYPES_IODATA_BSH_G16MB = 2206203922;
our $MAGIC_TYPES_IODATA_BSH_G24MB = 2206203923;
our $MAGIC_TYPES_TRENDNET_TPE_3012LS = 2206210573;
our $MAGIC_TYPES_TRENDNET_TPE_3018LS = 2206210574;
our $MAGIC_TYPES_ENGENIUS_EGS2108P_OLD_FW = 2206212360;
our $MAGIC_TYPES_ENGENIUS_EGS2110P_OLD_FW = 2206212368;
our $MAGIC_TYPES_ENGENIUS_EWS2910P_OLD_FW = 2206214416;
our $MAGIC_TYPES_ENGENIUS_EGS5110P_OLD_FW = 2206224656;
our $MAGIC_TYPES_ENGENIUS_EGS5212FP_OLD_FW = 2206224914;
our $MAGIC_TYPES_ENGENIUS_EWS5912FP_OLD_FW = 2206226706;
our $MAGIC_TYPES_ENGENIUS_EWS7928P_OLD_FW = 2206234920;
our $MAGIC_TYPES_ENGENIUS_EWS1200D_10T_OLD_FW = 2206670864;
our $MAGIC_TYPES_ENGENIUS_EWS1200_28T_OLD_FW = 2206670888;
our $MAGIC_TYPES_ENGENIUS_EGS7228FP_OLD_FW = 2206671503;
our $MAGIC_TYPES_ENGENIUS_EWS7928FP_OLD_FW = 2206700175;
our $MAGIC_TYPES_REALTEK_RTL839X = 2207252480;
our $MAGIC_TYPES_REALTEK_RTL8396 = 2207645696;
our $MAGIC_TYPES_ENGENIUS_EWS1200_52T_OLD_FW = 2207719506;
our $MAGIC_TYPES_ENGENIUS_EGS7252FP_OLD_FW = 2207720751;
our $MAGIC_TYPES_ENGENIUS_EWS7952FP_OLD_FW = 2207749423;
our $MAGIC_TYPES_REALTEK_RTL930X = 2466250752;
our $MAGIC_TYPES_ZYXEL_XGS1010_12 = 2466254864;
our $MAGIC_TYPES_ZYXEL_XGS1210_12 = 2466255376;
our $MAGIC_TYPES_ZYXEL_XGS1250_12 = 2466255440;
our $MAGIC_TYPES_NICGIGA_S100_0800S_M = 2466447360;
our $MAGIC_TYPES_PLASMACLOUD_PSX28 = 2467299328;

our $UIMAGE_ARCH_INVALID = 0;
our $UIMAGE_ARCH_ALPHA = 1;
our $UIMAGE_ARCH_ARM = 2;
our $UIMAGE_ARCH_I386 = 3;
our $UIMAGE_ARCH_IA64 = 4;
our $UIMAGE_ARCH_MIPS = 5;
our $UIMAGE_ARCH_MIPS64 = 6;
our $UIMAGE_ARCH_PPC = 7;
our $UIMAGE_ARCH_S390 = 8;
our $UIMAGE_ARCH_SH = 9;
our $UIMAGE_ARCH_SPARC = 10;
our $UIMAGE_ARCH_SPARC64 = 11;
our $UIMAGE_ARCH_M68K = 12;
our $UIMAGE_ARCH_NIOS = 13;
our $UIMAGE_ARCH_MICROBLAZE = 14;
our $UIMAGE_ARCH_NIOS2 = 15;
our $UIMAGE_ARCH_BLACKFIN = 16;
our $UIMAGE_ARCH_AVR32 = 17;
our $UIMAGE_ARCH_ST200 = 18;
our $UIMAGE_ARCH_SANDBOX = 19;
our $UIMAGE_ARCH_NDS32 = 20;
our $UIMAGE_ARCH_OPENRISC = 21;
our $UIMAGE_ARCH_ARM64 = 22;
our $UIMAGE_ARCH_ARC = 23;
our $UIMAGE_ARCH_X86_64 = 24;
our $UIMAGE_ARCH_XTENSA = 25;
our $UIMAGE_ARCH_RISCV = 26;

our $UIMAGE_COMP_NONE = 0;
our $UIMAGE_COMP_GZIP = 1;
our $UIMAGE_COMP_BZIP2 = 2;
our $UIMAGE_COMP_LZMA = 3;
our $UIMAGE_COMP_LZO = 4;
our $UIMAGE_COMP_LZ4 = 5;
our $UIMAGE_COMP_ZSTD = 6;
our $UIMAGE_COMP_MZ = 9;
our $UIMAGE_COMP_XIP = 10;

our $UIMAGE_OS_INVALID = 0;
our $UIMAGE_OS_OPENBSD = 1;
our $UIMAGE_OS_NETBSD = 2;
our $UIMAGE_OS_FREEBSD = 3;
our $UIMAGE_OS_BSD4_4 = 4;
our $UIMAGE_OS_LINUX = 5;
our $UIMAGE_OS_SVR4 = 6;
our $UIMAGE_OS_ESIX = 7;
our $UIMAGE_OS_SOLARIS = 8;
our $UIMAGE_OS_IRIX = 9;
our $UIMAGE_OS_SCO = 10;
our $UIMAGE_OS_DELL = 11;
our $UIMAGE_OS_NCR = 12;
our $UIMAGE_OS_LYNXOS = 13;
our $UIMAGE_OS_VXWORKS = 14;
our $UIMAGE_OS_PSOS = 15;
our $UIMAGE_OS_QNX = 16;
our $UIMAGE_OS_U_BOOT = 17;
our $UIMAGE_OS_RTEMS = 18;
our $UIMAGE_OS_ARTOS = 19;
our $UIMAGE_OS_UNITY = 20;
our $UIMAGE_OS_INTEGRITY = 21;
our $UIMAGE_OS_OSE = 22;
our $UIMAGE_OS_PLAN9 = 23;
our $UIMAGE_OS_OPENRTOS = 24;
our $UIMAGE_OS_ARM_TRUSTED_FIRMWARE = 25;
our $UIMAGE_OS_TEE = 26;
our $UIMAGE_OS_OPENSBI = 27;
our $UIMAGE_OS_EFI = 28;
our $UIMAGE_OS_ELF = 29;

our $UIMAGE_TYPE_INVALID = 0;
our $UIMAGE_TYPE_STANDALONE = 1;
our $UIMAGE_TYPE_KERNEL = 2;
our $UIMAGE_TYPE_RAMDISK = 3;
our $UIMAGE_TYPE_MULTI = 4;
our $UIMAGE_TYPE_FIRMWARE = 5;
our $UIMAGE_TYPE_SCRIPT = 6;
our $UIMAGE_TYPE_FILESYSTEM = 7;
our $UIMAGE_TYPE_FLATDT = 8;
our $UIMAGE_TYPE_KWBIMAGE = 9;
our $UIMAGE_TYPE_IMXIMAGE = 10;
our $UIMAGE_TYPE_UBLIMAGE = 11;
our $UIMAGE_TYPE_OMAPIMAGE = 12;
our $UIMAGE_TYPE_AISIMAGE = 13;
our $UIMAGE_TYPE_KERNEL_NOLOAD = 14;
our $UIMAGE_TYPE_PBLIMAGE = 15;
our $UIMAGE_TYPE_MXSIMAGE = 16;
our $UIMAGE_TYPE_GPIMAGE = 17;
our $UIMAGE_TYPE_ATMELIMAGE = 18;
our $UIMAGE_TYPE_SOCFPGAIMAGE = 19;
our $UIMAGE_TYPE_X86_SETUP = 20;
our $UIMAGE_TYPE_LPC32XXIMAGE = 21;
our $UIMAGE_TYPE_LOADABLE = 22;
our $UIMAGE_TYPE_RKIMAGE = 23;
our $UIMAGE_TYPE_RKSD = 24;
our $UIMAGE_TYPE_RKSPI = 25;
our $UIMAGE_TYPE_ZYNQIMAGE = 26;
our $UIMAGE_TYPE_ZYNQMPIMAGE = 27;
our $UIMAGE_TYPE_ZYNQMPBIF = 28;
our $UIMAGE_TYPE_FPGA = 29;
our $UIMAGE_TYPE_VYBRIDIMAGE = 30;
our $UIMAGE_TYPE_TEE = 31;
our $UIMAGE_TYPE_FIRMWARE_IVT = 32;
our $UIMAGE_TYPE_PMMC = 33;
our $UIMAGE_TYPE_STM32IMAGE = 34;
our $UIMAGE_TYPE_SOCFPGAIMAGE_V1 = 35;
our $UIMAGE_TYPE_MTKIMAGE = 36;
our $UIMAGE_TYPE_IMX8MIMAGE = 37;
our $UIMAGE_TYPE_IMX8IMAGE = 38;
our $UIMAGE_TYPE_COPRO = 39;
our $UIMAGE_TYPE_SUNXI_EGON = 40;
our $UIMAGE_TYPE_SUNXI_TOC0 = 41;
our $UIMAGE_TYPE_FDT_LEGACY = 42;
our $UIMAGE_TYPE_RENESAS_SPKG = 43;
our $UIMAGE_TYPE_STARFIVE_SPL = 44;
our $UIMAGE_TYPE_TFA_BL31 = 45;
our $UIMAGE_TYPE_STM32IMAGE_V2 = 46;
our $UIMAGE_TYPE_AMLIMAGE = 47;

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{header} = Uimage::Uheader->new($self->{_io}, $self, $self->{_root});
    $self->{data} = $self->{_io}->read_bytes($self->header()->len_image());
}

sub header {
    my ($self) = @_;
    return $self->{header};
}

sub data {
    my ($self) = @_;
    return $self->{data};
}

########################################################################
package Uimage::AsusFirmwareInformation;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{kernel_version} = Uimage::Version->new($self->{_io}, $self, $self->{_root});
    $self->{fs_version} = Uimage::Version->new($self->{_io}, $self, $self->{_root});
    $self->{product_id} = Encode::decode("UTF-8", IO::KaitaiStruct::Stream::bytes_terminate($self->{_io}->read_bytes(12), 0, 0));
    $self->{extra_info} = $self->{_io}->read_bytes(16);
}

sub kernel_version {
    my ($self) = @_;
    return $self->{kernel_version};
}

sub fs_version {
    my ($self) = @_;
    return $self->{fs_version};
}

sub product_id {
    my ($self) = @_;
    return $self->{product_id};
}

sub extra_info {
    my ($self) = @_;
    return $self->{extra_info};
}

########################################################################
package Uimage::NameOrAsusInfo;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    if (!($self->has_asus_info())) {
        $self->{name} = Encode::decode("UTF-8", $self->{_io}->read_bytes_term(0, 0, 1, 0));
    }
    if ($self->has_asus_info()) {
        $self->{asus_info} = Uimage::AsusFirmwareInformation->new($self->{_io}, $self, $self->{_root});
    }
}

sub byte0 {
    my ($self) = @_;
    return $self->{byte0} if ($self->{byte0});
    my $_pos = $self->{_io}->pos();
    $self->{_io}->seek(0);
    $self->{byte0} = $self->{_io}->read_u1();
    $self->{_io}->seek($_pos);
    return $self->{byte0};
}

sub byte4 {
    my ($self) = @_;
    return $self->{byte4} if ($self->{byte4});
    my $_pos = $self->{_io}->pos();
    $self->{_io}->seek(4);
    $self->{byte4} = $self->{_io}->read_u1();
    $self->{_io}->seek($_pos);
    return $self->{byte4};
}

sub has_asus_info {
    my ($self) = @_;
    return $self->{has_asus_info} if ($self->{has_asus_info});
    $self->{has_asus_info} =  (($self->byte0() < 32) && ($self->byte4() >= 32) && ($self->byte4() < 127)) ;
    return $self->{has_asus_info};
}

sub name {
    my ($self) = @_;
    return $self->{name};
}

sub asus_info {
    my ($self) = @_;
    return $self->{asus_info};
}

########################################################################
package Uimage::Uheader;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{magic} = $self->{_io}->read_u4be();
    $self->{header_crc} = $self->{_io}->read_u4be();
    $self->{timestamp} = $self->{_io}->read_u4be();
    $self->{len_image} = $self->{_io}->read_u4be();
    $self->{load_address} = $self->{_io}->read_u4be();
    $self->{entry_address} = $self->{_io}->read_u4be();
    $self->{data_crc} = $self->{_io}->read_u4be();
    $self->{os_type} = $self->{_io}->read_u1();
    $self->{architecture} = $self->{_io}->read_u1();
    $self->{image_type} = $self->{_io}->read_u1();
    $self->{compression_type} = $self->{_io}->read_u1();
    $self->{_raw_name_or_asus_info} = $self->{_io}->read_bytes(32);
    my $io__raw_name_or_asus_info = IO::KaitaiStruct::Stream->new($self->{_raw_name_or_asus_info});
    $self->{name_or_asus_info} = Uimage::NameOrAsusInfo->new($io__raw_name_or_asus_info, $self, $self->{_root});
}

sub magic {
    my ($self) = @_;
    return $self->{magic};
}

sub header_crc {
    my ($self) = @_;
    return $self->{header_crc};
}

sub timestamp {
    my ($self) = @_;
    return $self->{timestamp};
}

sub len_image {
    my ($self) = @_;
    return $self->{len_image};
}

sub load_address {
    my ($self) = @_;
    return $self->{load_address};
}

sub entry_address {
    my ($self) = @_;
    return $self->{entry_address};
}

sub data_crc {
    my ($self) = @_;
    return $self->{data_crc};
}

sub os_type {
    my ($self) = @_;
    return $self->{os_type};
}

sub architecture {
    my ($self) = @_;
    return $self->{architecture};
}

sub image_type {
    my ($self) = @_;
    return $self->{image_type};
}

sub compression_type {
    my ($self) = @_;
    return $self->{compression_type};
}

sub name_or_asus_info {
    my ($self) = @_;
    return $self->{name_or_asus_info};
}

sub _raw_name_or_asus_info {
    my ($self) = @_;
    return $self->{_raw_name_or_asus_info};
}

########################################################################
package Uimage::Version;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{major} = $self->{_io}->read_u1();
    $self->{minor} = $self->{_io}->read_u1();
}

sub major {
    my ($self) = @_;
    return $self->{major};
}

sub minor {
    my ($self) = @_;
    return $self->{minor};
}

1;
