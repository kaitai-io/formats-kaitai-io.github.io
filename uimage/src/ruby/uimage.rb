# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.11')
  raise "Incompatible Kaitai Struct Ruby API: 0.11 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# The legacy U-Boot image format (uImage), as created by `mkimage`: a 64-byte
# header followed by the image data (e.g. a Linux kernel, a ramdisk or a
# script). The header describes the data (OS, CPU architecture, image type,
# compression, load and entry point addresses, name) and protects both the
# header and the data with CRC-32 checksums.
# 
# U-Boot's newer FIT (Flattened Image Tree) format is not covered by this spec.
# @see https://github.com/u-boot/u-boot/blob/ece349ade2973e220f524ce59e59711cc919263f/include/image.h Git tag "v2026.07"
class Uimage < Kaitai::Struct::Struct

  MAGIC_TYPES = {
    5 => :magic_types_allnet_all_sg8316m,
    6 => :magic_types_allnet_all_sg8208m,
    22 => :magic_types_allnet_all_sg8324m,
    7353344 => :magic_types_datto_l8,
    9453568 => :magic_types_allnet_all_wapc0450c,
    50398464 => :magic_types_engenius_ews2910p_v3,
    50402048 => :magic_types_engenius_ews1200_28tfp,
    50402050 => :magic_types_engenius_ews7926efp,
    50406401 => :magic_types_engenius_ews7952p,
    50409728 => :magic_types_engenius_ews2908p,
    51450112 => :magic_types_engenius_ews7928p_v2,
    51450624 => :magic_types_engenius_ews1200_28tfp_v2,
    58730768 => :magic_types_engenius_ews2910p,
    58743058 => :magic_types_engenius_ews5912fp,
    58751272 => :magic_types_engenius_ews7928p,
    59187216 => :magic_types_engenius_ews1200d_10t,
    59187240 => :magic_types_engenius_ews1200_28t,
    59216527 => :magic_types_engenius_ews7928fp,
    60235858 => :magic_types_engenius_ews1200_52t,
    60265775 => :magic_types_engenius_ews7952fp,
    304680960 => :magic_types_youku_yk_l1,
    305418240 => :magic_types_realtek_sdk,
    391006017 => :magic_types_netgear_gs750e,
    391006018 => :magic_types_netgear_gs728tp_v2,
    638656533 => :magic_types_bolt_bl100,
    654645590 => :magic_types_uimage,
    654645607 => :magic_types_netgear_wnce4004,
    808857906 => :magic_types_netgear_wnr612_v2_early,
    825241648 => :magic_types_netgear_wnr1000_v2_vc,
    825241649 => :magic_types_netgear_wnr1000_v2,
    825241650 => :magic_types_netgear_wnr1000_v2_vm,
    825241652 => :magic_types_netgear_wnr1000_v4,
    825307184 => :magic_types_netgear_wpn824n,
    827343191 => :magic_types_zyxel_uag50,
    842018865 => :magic_types_netgear_wnr2000,
    842018867 => :magic_types_netgear_wnr2000_v3,
    842018868 => :magic_types_netgear_wnr2000_v4,
    842020401 => :magic_types_netgear_wnr612_v2,
    842149936 => :magic_types_netgear_wnr2200,
    859254832 => :magic_types_netgear_wndr3700,
    859254833 => :magic_types_netgear_wndr3700_v2,
    859254835 => :magic_types_netgear_wndr3700_v4,
    909127728 => :magic_types_netgear_r6100,
    909193778 => :magic_types_netgear_wnr612,
    1129270594 => :magic_types_mitrastar_comb,
    1129270595 => :magic_types_mitrastar_comc,
    1313293109 => :magic_types_netgear_gs308t,
    1313293600 => :magic_types_netgear_nge,
    1313293856 => :magic_types_netgear_ngf,
    1313294112 => :magic_types_netgear_ngg,
    1313294368 => :magic_types_netgear_ngh,
    1313294624 => :magic_types_netgear_ngi,
    1313296416 => :magic_types_netgear_ngp,
    1330334793 => :magic_types_openwrt_okli,
    1752396147 => :magic_types_openwrt_dlink_covr,
    1936805707 => :magic_types_openwrt_senao_okli,
    2155872258 => :magic_types_engenius_ecs1112fp,
    2155872259 => :magic_types_engenius_fitswitch,
    2197885696 => :magic_types_engenius_ews1200_28tfp_old_fw,
    2197885698 => :magic_types_engenius_ews7926efp_old_fw,
    2197890049 => :magic_types_engenius_ews7952p_old_fw,
    2206203904 => :magic_types_realtek_rtl838x,
    2206203905 => :magic_types_iodata_bsh_g08m,
    2206203906 => :magic_types_iodata_bsh_gp08,
    2206203907 => :magic_types_iodata_bsh_g16m,
    2206203908 => :magic_types_iodata_bsh_g24m,
    2206203920 => :magic_types_iodata_bsh_g08mb,
    2206203921 => :magic_types_iodata_bsh_gp08mb,
    2206203922 => :magic_types_iodata_bsh_g16mb,
    2206203923 => :magic_types_iodata_bsh_g24mb,
    2206210573 => :magic_types_trendnet_tpe_3012ls,
    2206210574 => :magic_types_trendnet_tpe_3018ls,
    2206212360 => :magic_types_engenius_egs2108p_old_fw,
    2206212368 => :magic_types_engenius_egs2110p_old_fw,
    2206214416 => :magic_types_engenius_ews2910p_old_fw,
    2206224656 => :magic_types_engenius_egs5110p_old_fw,
    2206224914 => :magic_types_engenius_egs5212fp_old_fw,
    2206226706 => :magic_types_engenius_ews5912fp_old_fw,
    2206234920 => :magic_types_engenius_ews7928p_old_fw,
    2206670864 => :magic_types_engenius_ews1200d_10t_old_fw,
    2206670888 => :magic_types_engenius_ews1200_28t_old_fw,
    2206671503 => :magic_types_engenius_egs7228fp_old_fw,
    2206700175 => :magic_types_engenius_ews7928fp_old_fw,
    2207252480 => :magic_types_realtek_rtl839x,
    2207645696 => :magic_types_realtek_rtl8396,
    2207719506 => :magic_types_engenius_ews1200_52t_old_fw,
    2207720751 => :magic_types_engenius_egs7252fp_old_fw,
    2207749423 => :magic_types_engenius_ews7952fp_old_fw,
    2466250752 => :magic_types_realtek_rtl930x,
    2466254864 => :magic_types_zyxel_xgs1010_12,
    2466255376 => :magic_types_zyxel_xgs1210_12,
    2466255440 => :magic_types_zyxel_xgs1250_12,
    2466447360 => :magic_types_nicgiga_s100_0800s_m,
    2467299328 => :magic_types_plasmacloud_psx28,
  }
  I__MAGIC_TYPES = MAGIC_TYPES.invert

  UIMAGE_ARCH = {
    0 => :uimage_arch_invalid,
    1 => :uimage_arch_alpha,
    2 => :uimage_arch_arm,
    3 => :uimage_arch_i386,
    4 => :uimage_arch_ia64,
    5 => :uimage_arch_mips,
    6 => :uimage_arch_mips64,
    7 => :uimage_arch_ppc,
    8 => :uimage_arch_s390,
    9 => :uimage_arch_sh,
    10 => :uimage_arch_sparc,
    11 => :uimage_arch_sparc64,
    12 => :uimage_arch_m68k,
    13 => :uimage_arch_nios,
    14 => :uimage_arch_microblaze,
    15 => :uimage_arch_nios2,
    16 => :uimage_arch_blackfin,
    17 => :uimage_arch_avr32,
    18 => :uimage_arch_st200,
    19 => :uimage_arch_sandbox,
    20 => :uimage_arch_nds32,
    21 => :uimage_arch_openrisc,
    22 => :uimage_arch_arm64,
    23 => :uimage_arch_arc,
    24 => :uimage_arch_x86_64,
    25 => :uimage_arch_xtensa,
    26 => :uimage_arch_riscv,
  }
  I__UIMAGE_ARCH = UIMAGE_ARCH.invert

  UIMAGE_COMP = {
    0 => :uimage_comp_none,
    1 => :uimage_comp_gzip,
    2 => :uimage_comp_bzip2,
    3 => :uimage_comp_lzma,
    4 => :uimage_comp_lzo,
    5 => :uimage_comp_lz4,
    6 => :uimage_comp_zstd,
    9 => :uimage_comp_mz,
    10 => :uimage_comp_xip,
  }
  I__UIMAGE_COMP = UIMAGE_COMP.invert

  UIMAGE_OS = {
    0 => :uimage_os_invalid,
    1 => :uimage_os_openbsd,
    2 => :uimage_os_netbsd,
    3 => :uimage_os_freebsd,
    4 => :uimage_os_bsd4_4,
    5 => :uimage_os_linux,
    6 => :uimage_os_svr4,
    7 => :uimage_os_esix,
    8 => :uimage_os_solaris,
    9 => :uimage_os_irix,
    10 => :uimage_os_sco,
    11 => :uimage_os_dell,
    12 => :uimage_os_ncr,
    13 => :uimage_os_lynxos,
    14 => :uimage_os_vxworks,
    15 => :uimage_os_psos,
    16 => :uimage_os_qnx,
    17 => :uimage_os_u_boot,
    18 => :uimage_os_rtems,
    19 => :uimage_os_artos,
    20 => :uimage_os_unity,
    21 => :uimage_os_integrity,
    22 => :uimage_os_ose,
    23 => :uimage_os_plan9,
    24 => :uimage_os_openrtos,
    25 => :uimage_os_arm_trusted_firmware,
    26 => :uimage_os_tee,
    27 => :uimage_os_opensbi,
    28 => :uimage_os_efi,
    29 => :uimage_os_elf,
  }
  I__UIMAGE_OS = UIMAGE_OS.invert

  UIMAGE_TYPE = {
    0 => :uimage_type_invalid,
    1 => :uimage_type_standalone,
    2 => :uimage_type_kernel,
    3 => :uimage_type_ramdisk,
    4 => :uimage_type_multi,
    5 => :uimage_type_firmware,
    6 => :uimage_type_script,
    7 => :uimage_type_filesystem,
    8 => :uimage_type_flatdt,
    9 => :uimage_type_kwbimage,
    10 => :uimage_type_imximage,
    11 => :uimage_type_ublimage,
    12 => :uimage_type_omapimage,
    13 => :uimage_type_aisimage,
    14 => :uimage_type_kernel_noload,
    15 => :uimage_type_pblimage,
    16 => :uimage_type_mxsimage,
    17 => :uimage_type_gpimage,
    18 => :uimage_type_atmelimage,
    19 => :uimage_type_socfpgaimage,
    20 => :uimage_type_x86_setup,
    21 => :uimage_type_lpc32xximage,
    22 => :uimage_type_loadable,
    23 => :uimage_type_rkimage,
    24 => :uimage_type_rksd,
    25 => :uimage_type_rkspi,
    26 => :uimage_type_zynqimage,
    27 => :uimage_type_zynqmpimage,
    28 => :uimage_type_zynqmpbif,
    29 => :uimage_type_fpga,
    30 => :uimage_type_vybridimage,
    31 => :uimage_type_tee,
    32 => :uimage_type_firmware_ivt,
    33 => :uimage_type_pmmc,
    34 => :uimage_type_stm32image,
    35 => :uimage_type_socfpgaimage_v1,
    36 => :uimage_type_mtkimage,
    37 => :uimage_type_imx8mimage,
    38 => :uimage_type_imx8image,
    39 => :uimage_type_copro,
    40 => :uimage_type_sunxi_egon,
    41 => :uimage_type_sunxi_toc0,
    42 => :uimage_type_fdt_legacy,
    43 => :uimage_type_renesas_spkg,
    44 => :uimage_type_starfive_spl,
    45 => :uimage_type_tfa_bl31,
    46 => :uimage_type_stm32image_v2,
    47 => :uimage_type_amlimage,
  }
  I__UIMAGE_TYPE = UIMAGE_TYPE.invert
  def initialize(_io, _parent = nil, _root = nil)
    super(_io, _parent, _root || self)
    _read
  end

  def _read
    @header = Uheader.new(@_io, self, @_root)
    @data = @_io.read_bytes(header.len_image)
    self
  end

  ##
  # ASUS firmware images [overlay the 32-byte image
  # name](https://github.com/drag0njoe/RT-AC55U/blob/cf5874684ab6995ee07e91a52dfdd0562fcc2655/release/src/asustools/mkimage.src/include/image.h#L185-L188)
  # with a [`TAIL`
  # structure](https://github.com/drag0njoe/RT-AC55U/blob/cf5874684ab6995ee07e91a52dfdd0562fcc2655/release/src/asustools/mkimage.src/include/image.h#L151-L171)
  # that contains version information and the product ID (model name).
  # 
  # The first 16 bytes have the same structure in all three known variants of
  # the `TAIL` structure. The meaning of the last 16 bytes differs across the
  # variants - therefore, for simplicity, this Kaitai Struct implementation
  # treats them as an opaque byte array named `extra_info`. For an overview of
  # the variants, see the documentation for `extra_info`.
  class AsusFirmwareInformation < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @kernel_version = Version.new(@_io, self, @_root)
      @fs_version = Version.new(@_io, self, @_root)
      @product_id = (Kaitai::Struct::Stream::bytes_terminate(@_io.read_bytes(12), 0, false)).force_encoding("UTF-8")
      @extra_info = @_io.read_bytes(16)
      self
    end
    attr_reader :kernel_version
    attr_reader :fs_version

    ##
    # In the Ralink SDK variant (see `extra_info`), the product ID field is
    # actually 23 bytes long, but no known product ID is longer than 12
    # bytes.
    attr_reader :product_id

    ##
    # The structure of these bytes varies among the three known variants of
    # the `TAIL` structure, and the header doesn't say which one is used:
    # 
    # * Plain: 8 hardware versions (using the `version` type) - see
    #   <https://github.com/drag0njoe/RT-AC55U/blob/cf5874684ab6995ee07e91a52dfdd0562fcc2655/release/src/asustools/mkimage.src/include/image.h#L170>
    # 
    #   Sample file: `RT-AC51U_3.0.0.4_380_8591-ga8dd632.trx` from
    #   <https://dlcdnets.asus.com/pub/ASUS/wireless/RT-AC51U/FW_RT_AC51U_30043808591.zip>,
    #   released on 2020-09-22 and listed on
    #   <https://www.asus.com/supportonly/rt-ac51u/helpdesk_bios/>.
    # 
    #   Source code links:
    # 
    #   - [ASUS GPL source, RT-AC55UHP
    #     3.0.0.4.382.51915](https://dlcdnets.asus.com/pub/ASUS/wireless/RT-AC55UHP/GPL_RT_AC55UHP_300438251915.zip)
    #     (`asuswrt/release/src/asustools/mkimage.src/` in
    #     `GPL_RT-AC55UHP_3.0.0.4.382.51915-g4086e57.tgz`)
    #   - [ASUS GPL source, RT-AC55U 3.0.0.4.382.50702 (unofficial
    #     mirror)](https://github.com/drag0njoe/RT-AC55U/tree/cf5874684ab6995ee07e91a52dfdd0562fcc2655/release/src/asustools/mkimage.src)
    # 
    # * `TRX_NEW` (a macro defined when building `mkimage`): the
    #   build number and extended build number (`u2le` each), two key bytes
    #   and 5 hardware versions - see
    #   <https://github.com/drag0njoe/RT-AC55U/blob/cf5874684ab6995ee07e91a52dfdd0562fcc2655/release/src-qca/asustools/mkimage.src/include/image.h#L174-L180>
    # 
    #   `mkimage` [overwrites the first 3 hardware
    #   versions](https://github.com/drag0njoe/RT-AC55U/blob/cf5874684ab6995ee07e91a52dfdd0562fcc2655/release/src-qca/asustools/mkimage.src/mkimage.c#L546-L569)
    #   with values derived from the key bytes.
    # 
    #   Sample file: `RT-AC55UHP_3.0.0.4_382_52236-ga0f880d.trx` (build 382,
    #   extended build 52236) from
    #   <https://dlcdnets.asus.com/pub/ASUS/wireless/RT-AC55UHP/FW_RT_AC55UHP_300438252236.zip>,
    #   released on 2020-06-04 and listed on
    #   <https://www.asus.com/supportonly/rt-ac55uhp/helpdesk_bios/>.
    # 
    #   Source code links:
    # 
    #   - [ASUS GPL source, RT-AC55UHP
    #     3.0.0.4.382.51915](https://dlcdnets.asus.com/pub/ASUS/wireless/RT-AC55UHP/GPL_RT_AC55UHP_300438251915.zip)
    #     (`asuswrt/release/src-qca/asustools/mkimage.src/` in
    #     `GPL_RT-AC55UHP_3.0.0.4.382.51915-g4086e57.tgz`)
    #   - [ASUS GPL source, RT-AC55U 3.0.0.4.382.50702 (unofficial
    #     mirror)](https://github.com/drag0njoe/RT-AC55U/tree/cf5874684ab6995ee07e91a52dfdd0562fcc2655/release/src-qca/asustools/mkimage.src)
    # 
    # * Ralink SDK: the rest of a 23-byte product ID (see `product_id`),
    #   a version suffix letter and the kernel part size (called `ih_ksz`) -
    #   see <https://github.com/andy-padavan/rt-n56u/blob/32a93db4026cc2cff585d7008373432d888fc1aa/trunk/tools/mkimage/include/image.h#L164-L165>
    # 
    #   Sample file: `RP-N12_1.0.1.1f.trx` from
    #   <https://dlcdnets.asus.com/pub/ASUS/wireless/RP-N12/FW_RP-N12_1.0.1.1f.zip>,
    #   released on 2019-11-12 and listed on
    #   <https://www.asus.com/supportonly/rp-n12/helpdesk_bios/>.
    # 
    #   Source code links:
    # 
    #   - [ASUS GPL source, RP-N12
    #     1.0.1.1f](https://dlcdnets.asus.com/pub/ASUS/wireless/RP-N12/GPL_RP_N12_1011f.zip)
    #     (`GPL_RP-N12_source.1011f/user/mkimage/include/image.h` in
    #     `GPL_RP-N12_source.1011f.tar.bz2`)
    #   - [rt-n56u custom firmware by Andy
    #     Padavan](https://github.com/andy-padavan/rt-n56u/blob/32a93db4026cc2cff585d7008373432d888fc1aa/trunk/tools/mkimage/include/image.h)
    # 
    # In the plain and `TRX_NEW` variants, the last 4 bytes may instead
    # contain the offset of the root file system, which is [written by
    # `mkimage -r`](https://github.com/drag0njoe/RT-AC55U/blob/cf5874684ab6995ee07e91a52dfdd0562fcc2655/release/src/asustools/mkimage.src/mkimage.c#L527-L542)
    # as the magic byte 0xA9
    # ([`ROOTFS_OFFSET_MAGIC`](https://github.com/drag0njoe/RT-AC55U/blob/cf5874684ab6995ee07e91a52dfdd0562fcc2655/release/src/asustools/mkimage.src/include/image.h#L154-L159))
    # followed by the offset as a 24-bit big-endian integer.
    attr_reader :extra_info
  end
  class NameOrAsusInfo < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      if !(has_asus_info)
        @name = (@_io.read_bytes_term(0, false, true, false)).force_encoding("UTF-8")
      end
      if has_asus_info
        @asus_info = AsusFirmwareInformation.new(@_io, self, @_root)
      end
      self
    end
    def byte0
      return @byte0 unless @byte0.nil?
      _pos = @_io.pos
      @_io.seek(0)
      @byte0 = @_io.read_u1
      @_io.seek(_pos)
      @byte0
    end
    def byte4
      return @byte4 unless @byte4.nil?
      _pos = @_io.pos
      @_io.seek(4)
      @byte4 = @_io.read_u1
      @_io.seek(_pos)
      @byte4
    end

    ##
    # Whether this type stores ASUS firmware information (`asus_info`)
    # rather than an image name (`name`).
    # 
    # The header doesn't say which one it is, so we infer it using a
    # heuristic based on the layout of the `asus_firmware_information` type.
    # If ASUS firmware info is present, the first byte (the major kernel
    # version number) is a small integer (i.e. not a printable character),
    # and byte 4 (first byte of the product ID/model name) is a printable
    # character. An empty name is not mistaken for ASUS information, because
    # its byte 4 is a null byte.
    # 
    # The highest known major kernel version number is 9 (e.g. in
    # `DSL-N55U_9.0.0.4_380_3925-gad8f412_Annex_A.trx` from
    # <https://dlcdnets.asus.com/pub/ASUS/wireless/DSL-N55U/FW_DSL_N55U_90043803925.zip>,
    # released on 2016-08-04 and listed on
    # <https://www.asus.com/supportonly/dsl-n55u/helpdesk_bios/>). ASUS
    # seems to use such high major versions (9, sometimes 7) for beta
    # releases, whereas regular releases use 3 (or 1 in older firmware).
    # 
    # It can also be 0, in particular due to a bug in the MediaTek MT798X
    # build of ASUS's `mkimage` (it reads the `-V` values from fixed `argv`
    # positions, even though it parses the options using `getopt()` - see
    # <https://github.com/blocktrron/tuf-ax4200-gpl/blob/a4fe37f4d78473f97c6d47cf93d97c3811af90cc/release/src-mtk-MT798X/Uboot-upstream/tools/mkimage.c#L317-L333>).
    # For example, this is the case in
    # `RT-AX52_3.0.0.4_388_34015-g9488655.trx` from
    # <https://dlcdnets.asus.com/pub/ASUS/wireless/RT-AX52/FW_RT-AX52_300438834015.zip>,
    # released on 2026-03-20 and listed on
    # <https://www.asus.com/supportonly/rt-ax52/helpdesk_bios?model2Name=RT-AX52>.
    def has_asus_info
      return @has_asus_info unless @has_asus_info.nil?
      @has_asus_info =  ((byte0 < 32) && (byte4 >= 32) && (byte4 < 127)) 
      @has_asus_info
    end
    attr_reader :name
    attr_reader :asus_info
  end
  class Uheader < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @magic = Kaitai::Struct::Stream::resolve_enum(Uimage::MAGIC_TYPES, @_io.read_u4be)
      raise Kaitai::Struct::ValidationNotInEnumError.new(@magic, @_io, "/types/uheader/seq/0") if not Uimage::I__MAGIC_TYPES.key?(@magic)
      @header_crc = @_io.read_u4be
      @timestamp = @_io.read_u4be
      @len_image = @_io.read_u4be
      @load_address = @_io.read_u4be
      @entry_address = @_io.read_u4be
      @data_crc = @_io.read_u4be
      @os_type = Kaitai::Struct::Stream::resolve_enum(Uimage::UIMAGE_OS, @_io.read_u1)
      raise Kaitai::Struct::ValidationNotInEnumError.new(@os_type, @_io, "/types/uheader/seq/7") if not Uimage::I__UIMAGE_OS.key?(@os_type)
      @architecture = Kaitai::Struct::Stream::resolve_enum(Uimage::UIMAGE_ARCH, @_io.read_u1)
      raise Kaitai::Struct::ValidationNotInEnumError.new(@architecture, @_io, "/types/uheader/seq/8") if not Uimage::I__UIMAGE_ARCH.key?(@architecture)
      @image_type = Kaitai::Struct::Stream::resolve_enum(Uimage::UIMAGE_TYPE, @_io.read_u1)
      raise Kaitai::Struct::ValidationNotInEnumError.new(@image_type, @_io, "/types/uheader/seq/9") if not Uimage::I__UIMAGE_TYPE.key?(@image_type)
      @compression_type = Kaitai::Struct::Stream::resolve_enum(Uimage::UIMAGE_COMP, @_io.read_u1)
      raise Kaitai::Struct::ValidationNotInEnumError.new(@compression_type, @_io, "/types/uheader/seq/10") if not Uimage::I__UIMAGE_COMP.key?(@compression_type)
      _io_name_or_asus_info = @_io.substream(32)
      @name_or_asus_info = NameOrAsusInfo.new(_io_name_or_asus_info, self, @_root)
      self
    end

    ##
    # Besides the standard U-Boot magic, some vendors' bootloaders expect
    # their own value (often a different one for each device model), with
    # the rest of the header unchanged. `magic_types` lists the values
    # known so far; images with any other magic are rejected.
    attr_reader :magic
    attr_reader :header_crc
    attr_reader :timestamp
    attr_reader :len_image
    attr_reader :load_address
    attr_reader :entry_address
    attr_reader :data_crc
    attr_reader :os_type
    attr_reader :architecture
    attr_reader :image_type
    attr_reader :compression_type
    attr_reader :name_or_asus_info
    attr_reader :_raw_name_or_asus_info
  end
  class Version < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @major = @_io.read_u1
      @minor = @_io.read_u1
      self
    end
    attr_reader :major
    attr_reader :minor
  end
  attr_reader :header
  attr_reader :data
end
