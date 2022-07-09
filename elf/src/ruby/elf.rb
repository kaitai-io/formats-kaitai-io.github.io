# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.9')
  raise "Incompatible Kaitai Struct Ruby API: 0.9 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# @see https://sourceware.org/git/?p=glibc.git;a=blob;f=elf/elf.h;hb=0f62fe0532 Source
# @see https://refspecs.linuxfoundation.org/elf/gabi4+/contents.html Source
# @see https://docs.oracle.com/cd/E37838_01/html/E36783/glcfv.html Source
class Elf < Kaitai::Struct::Struct

  SYMBOL_VISIBILITY = {
    0 => :symbol_visibility_default,
    1 => :symbol_visibility_internal,
    2 => :symbol_visibility_hidden,
    3 => :symbol_visibility_protected,
    4 => :symbol_visibility_exported,
    5 => :symbol_visibility_singleton,
    6 => :symbol_visibility_eliminate,
  }
  I__SYMBOL_VISIBILITY = SYMBOL_VISIBILITY.invert

  SYMBOL_BINDING = {
    0 => :symbol_binding_local,
    1 => :symbol_binding_global_symbol,
    2 => :symbol_binding_weak,
    10 => :symbol_binding_os10,
    11 => :symbol_binding_os11,
    12 => :symbol_binding_os12,
    13 => :symbol_binding_proc13,
    14 => :symbol_binding_proc14,
    15 => :symbol_binding_proc15,
  }
  I__SYMBOL_BINDING = SYMBOL_BINDING.invert

  ENDIAN = {
    1 => :endian_le,
    2 => :endian_be,
  }
  I__ENDIAN = ENDIAN.invert

  SH_TYPE = {
    0 => :sh_type_null_type,
    1 => :sh_type_progbits,
    2 => :sh_type_symtab,
    3 => :sh_type_strtab,
    4 => :sh_type_rela,
    5 => :sh_type_hash,
    6 => :sh_type_dynamic,
    7 => :sh_type_note,
    8 => :sh_type_nobits,
    9 => :sh_type_rel,
    10 => :sh_type_shlib,
    11 => :sh_type_dynsym,
    14 => :sh_type_init_array,
    15 => :sh_type_fini_array,
    16 => :sh_type_preinit_array,
    17 => :sh_type_group,
    18 => :sh_type_symtab_shndx,
    19 => :sh_type_relr,
    1879048172 => :sh_type_sunw_symnsort,
    1879048173 => :sh_type_sunw_phname,
    1879048174 => :sh_type_sunw_ancillary,
    1879048175 => :sh_type_sunw_capchain,
    1879048176 => :sh_type_sunw_capinfo,
    1879048177 => :sh_type_sunw_symsort,
    1879048178 => :sh_type_sunw_tlssort,
    1879048179 => :sh_type_sunw_ldynsym,
    1879048180 => :sh_type_sunw_dof,
    1879048181 => :sh_type_sunw_cap,
    1879048182 => :sh_type_sunw_signature,
    1879048183 => :sh_type_sunw_annotate,
    1879048184 => :sh_type_sunw_debugstr,
    1879048185 => :sh_type_sunw_debug,
    1879048186 => :sh_type_sunw_move,
    1879048187 => :sh_type_sunw_comdat,
    1879048188 => :sh_type_sunw_syminfo,
    1879048189 => :sh_type_sunw_verdef,
    1879048190 => :sh_type_sunw_verneed,
    1879048191 => :sh_type_sunw_versym,
    1879048192 => :sh_type_sparc_gotdata,
    1879048193 => :sh_type_amd64_unwind,
    1879048194 => :sh_type_arm_preemptmap,
    1879048195 => :sh_type_arm_attributes,
    1879048196 => :sh_type_arm_debugoverlay,
    1879048197 => :sh_type_arm_overlaysection,
  }
  I__SH_TYPE = SH_TYPE.invert

  OS_ABI = {
    0 => :os_abi_system_v,
    1 => :os_abi_hp_ux,
    2 => :os_abi_netbsd,
    3 => :os_abi_gnu,
    6 => :os_abi_solaris,
    7 => :os_abi_aix,
    8 => :os_abi_irix,
    9 => :os_abi_freebsd,
    10 => :os_abi_tru64,
    11 => :os_abi_modesto,
    12 => :os_abi_openbsd,
    13 => :os_abi_openvms,
    14 => :os_abi_nsk,
    15 => :os_abi_aros,
    16 => :os_abi_fenixos,
    17 => :os_abi_cloudabi,
    18 => :os_abi_openvos,
  }
  I__OS_ABI = OS_ABI.invert

  MACHINE = {
    0 => :machine_no_machine,
    1 => :machine_m32,
    2 => :machine_sparc,
    3 => :machine_x86,
    4 => :machine_m68k,
    5 => :machine_m88k,
    6 => :machine_iamcu,
    7 => :machine_i860,
    8 => :machine_mips,
    9 => :machine_s370,
    10 => :machine_mips_rs3_le,
    15 => :machine_parisc,
    17 => :machine_vpp500,
    18 => :machine_sparc32plus,
    19 => :machine_i960,
    20 => :machine_powerpc,
    21 => :machine_powerpc64,
    22 => :machine_s390,
    23 => :machine_spu,
    36 => :machine_v800,
    37 => :machine_fr20,
    38 => :machine_rh32,
    39 => :machine_rce,
    40 => :machine_arm,
    41 => :machine_old_alpha,
    42 => :machine_superh,
    43 => :machine_sparc_v9,
    44 => :machine_tricore,
    45 => :machine_arc,
    46 => :machine_h8_300,
    47 => :machine_h8_300h,
    48 => :machine_h8s,
    49 => :machine_h8_500,
    50 => :machine_ia_64,
    51 => :machine_mips_x,
    52 => :machine_coldfire,
    53 => :machine_m68hc12,
    54 => :machine_mma,
    55 => :machine_pcp,
    56 => :machine_ncpu,
    57 => :machine_ndr1,
    58 => :machine_starcore,
    59 => :machine_me16,
    60 => :machine_st100,
    61 => :machine_tinyj,
    62 => :machine_x86_64,
    63 => :machine_pdsp,
    64 => :machine_pdp10,
    65 => :machine_pdp11,
    66 => :machine_fx66,
    67 => :machine_st9plus,
    68 => :machine_st7,
    69 => :machine_mc68hc16,
    70 => :machine_mc68hc11,
    71 => :machine_mc68hc08,
    72 => :machine_mc68hc05,
    73 => :machine_svx,
    74 => :machine_st19,
    75 => :machine_vax,
    76 => :machine_cris,
    77 => :machine_javelin,
    78 => :machine_firepath,
    79 => :machine_zsp,
    80 => :machine_mmix,
    81 => :machine_huany,
    82 => :machine_prism,
    83 => :machine_avr,
    84 => :machine_fr30,
    85 => :machine_d10v,
    86 => :machine_d30v,
    87 => :machine_v850,
    88 => :machine_m32r,
    89 => :machine_mn10300,
    90 => :machine_mn10200,
    91 => :machine_picojava,
    92 => :machine_openrisc,
    93 => :machine_arc_compact,
    94 => :machine_xtensa,
    95 => :machine_videocore,
    96 => :machine_tmm_gpp,
    97 => :machine_ns32k,
    98 => :machine_tpc,
    99 => :machine_snp1k,
    100 => :machine_st200,
    101 => :machine_ip2k,
    102 => :machine_max,
    103 => :machine_compact_risc,
    104 => :machine_f2mc16,
    105 => :machine_msp430,
    106 => :machine_blackfin,
    107 => :machine_se_c33,
    108 => :machine_sep,
    109 => :machine_arca,
    110 => :machine_unicore,
    111 => :machine_excess,
    112 => :machine_dxp,
    113 => :machine_altera_nios2,
    114 => :machine_crx,
    115 => :machine_xgate,
    116 => :machine_c166,
    117 => :machine_m16c,
    118 => :machine_dspic30f,
    119 => :machine_freescale_ce,
    120 => :machine_m32c,
    131 => :machine_tsk3000,
    132 => :machine_rs08,
    133 => :machine_sharc,
    134 => :machine_ecog2,
    135 => :machine_score7,
    136 => :machine_dsp24,
    137 => :machine_videocore3,
    138 => :machine_latticemico32,
    139 => :machine_se_c17,
    140 => :machine_ti_c6000,
    141 => :machine_ti_c2000,
    142 => :machine_ti_c5500,
    143 => :machine_ti_arp32,
    144 => :machine_ti_pru,
    160 => :machine_mmdsp_plus,
    161 => :machine_cypress_m8c,
    162 => :machine_r32c,
    163 => :machine_trimedia,
    164 => :machine_qdsp6,
    165 => :machine_i8051,
    166 => :machine_stxp7x,
    167 => :machine_nds32,
    168 => :machine_ecog1x,
    169 => :machine_maxq30,
    170 => :machine_ximo16,
    171 => :machine_manik,
    172 => :machine_craynv2,
    173 => :machine_rx,
    174 => :machine_metag,
    175 => :machine_mcst_elbrus,
    176 => :machine_ecog16,
    177 => :machine_cr16,
    178 => :machine_etpu,
    179 => :machine_sle9x,
    180 => :machine_l10m,
    181 => :machine_k10m,
    183 => :machine_aarch64,
    185 => :machine_avr32,
    186 => :machine_stm8,
    187 => :machine_tile64,
    188 => :machine_tilepro,
    189 => :machine_microblaze,
    190 => :machine_cuda,
    191 => :machine_tilegx,
    192 => :machine_cloudshield,
    193 => :machine_corea_1st,
    194 => :machine_corea_2nd,
    195 => :machine_arcv2,
    196 => :machine_open8,
    197 => :machine_rl78,
    198 => :machine_videocore5,
    199 => :machine_renesas_78kor,
    200 => :machine_freescale_56800ex,
    201 => :machine_ba1,
    202 => :machine_ba2,
    203 => :machine_xcore,
    204 => :machine_mchp_pic,
    205 => :machine_intelgt,
    206 => :machine_intel206,
    207 => :machine_intel207,
    208 => :machine_intel208,
    209 => :machine_intel209,
    210 => :machine_km32,
    211 => :machine_kmx32,
    212 => :machine_kmx16,
    213 => :machine_kmx8,
    214 => :machine_kvarc,
    215 => :machine_cdp,
    216 => :machine_coge,
    217 => :machine_cool,
    218 => :machine_norc,
    219 => :machine_csr_kalimba,
    220 => :machine_z80,
    221 => :machine_visium,
    222 => :machine_ft32,
    223 => :machine_moxie,
    224 => :machine_amd_gpu,
    243 => :machine_riscv,
    244 => :machine_lanai,
    245 => :machine_ceva,
    246 => :machine_ceva_x2,
    247 => :machine_bpf,
    248 => :machine_graphcore_ipu,
    249 => :machine_img1,
    250 => :machine_nfp,
    251 => :machine_ve,
    252 => :machine_csky,
    253 => :machine_arc_compact3_64,
    254 => :machine_mcs6502,
    255 => :machine_arc_compact3,
    256 => :machine_kvx,
    257 => :machine_wdc65816,
    258 => :machine_loongarch,
    259 => :machine_kf32,
    260 => :machine_u16_u8core,
    261 => :machine_tachyum,
    262 => :machine_nxp_56800ef,
    4183 => :machine_avr_old,
    4185 => :machine_msp430_old,
    4643 => :machine_adapteva_epiphany,
    9520 => :machine_mt,
    13104 => :machine_cygnus_fr30,
    16727 => :machine_webassembly,
    18056 => :machine_xc16x,
    19951 => :machine_s12z,
    21569 => :machine_cygnus_frv,
    23205 => :machine_dlx,
    30288 => :machine_cygnus_d10v,
    30326 => :machine_cygnus_d30v,
    33303 => :machine_ip2k_old,
    36901 => :machine_cygnus_powerpc,
    36902 => :machine_alpha,
    36929 => :machine_cygnus_m32r,
    36992 => :machine_cygnus_v850,
    41872 => :machine_s390_old,
    43975 => :machine_xtensa_old,
    44357 => :machine_xstormy16,
    47787 => :machine_microblaze_old,
    48879 => :machine_cygnus_mn10300,
    57005 => :machine_cygnus_mn10200,
    61453 => :machine_cygnus_mep,
    65200 => :machine_m32c_old,
    65210 => :machine_iq2000,
    65211 => :machine_nios32,
    65261 => :machine_moxie_old,
  }
  I__MACHINE = MACHINE.invert

  SYMBOL_TYPE = {
    0 => :symbol_type_no_type,
    1 => :symbol_type_object,
    2 => :symbol_type_func,
    3 => :symbol_type_section,
    4 => :symbol_type_file,
    5 => :symbol_type_common,
    6 => :symbol_type_tls,
    8 => :symbol_type_relc,
    9 => :symbol_type_srelc,
    10 => :symbol_type_gnu_ifunc,
    11 => :symbol_type_os11,
    12 => :symbol_type_os12,
    13 => :symbol_type_proc13,
    14 => :symbol_type_proc14,
    15 => :symbol_type_proc15,
  }
  I__SYMBOL_TYPE = SYMBOL_TYPE.invert

  DYNAMIC_ARRAY_TAGS = {
    0 => :dynamic_array_tags_null,
    1 => :dynamic_array_tags_needed,
    2 => :dynamic_array_tags_pltrelsz,
    3 => :dynamic_array_tags_pltgot,
    4 => :dynamic_array_tags_hash,
    5 => :dynamic_array_tags_strtab,
    6 => :dynamic_array_tags_symtab,
    7 => :dynamic_array_tags_rela,
    8 => :dynamic_array_tags_relasz,
    9 => :dynamic_array_tags_relaent,
    10 => :dynamic_array_tags_strsz,
    11 => :dynamic_array_tags_syment,
    12 => :dynamic_array_tags_init,
    13 => :dynamic_array_tags_fini,
    14 => :dynamic_array_tags_soname,
    15 => :dynamic_array_tags_rpath,
    16 => :dynamic_array_tags_symbolic,
    17 => :dynamic_array_tags_rel,
    18 => :dynamic_array_tags_relsz,
    19 => :dynamic_array_tags_relent,
    20 => :dynamic_array_tags_pltrel,
    21 => :dynamic_array_tags_debug,
    22 => :dynamic_array_tags_textrel,
    23 => :dynamic_array_tags_jmprel,
    24 => :dynamic_array_tags_bind_now,
    25 => :dynamic_array_tags_init_array,
    26 => :dynamic_array_tags_fini_array,
    27 => :dynamic_array_tags_init_arraysz,
    28 => :dynamic_array_tags_fini_arraysz,
    29 => :dynamic_array_tags_runpath,
    30 => :dynamic_array_tags_flags,
    32 => :dynamic_array_tags_preinit_array,
    33 => :dynamic_array_tags_preinit_arraysz,
    34 => :dynamic_array_tags_symtab_shndx,
    35 => :dynamic_array_tags_relrsz,
    36 => :dynamic_array_tags_relr,
    37 => :dynamic_array_tags_relrent,
    117440513 => :dynamic_array_tags_deprecated_sparc_register,
    1610612749 => :dynamic_array_tags_sunw_auxiliary,
    1610612750 => :dynamic_array_tags_sunw_rtldinf,
    1610612751 => :dynamic_array_tags_sunw_filter,
    1610612752 => :dynamic_array_tags_sunw_cap,
    1610612753 => :dynamic_array_tags_sunw_symtab,
    1610612754 => :dynamic_array_tags_sunw_symsz,
    1610612755 => :dynamic_array_tags_sunw_sortent,
    1610612756 => :dynamic_array_tags_sunw_symsort,
    1610612757 => :dynamic_array_tags_sunw_symsortsz,
    1610612758 => :dynamic_array_tags_sunw_tlssort,
    1610612759 => :dynamic_array_tags_sunw_tlssortsz,
    1610612760 => :dynamic_array_tags_sunw_capinfo,
    1610612761 => :dynamic_array_tags_sunw_strpad,
    1610612762 => :dynamic_array_tags_sunw_capchain,
    1610612763 => :dynamic_array_tags_sunw_ldmach,
    1610612764 => :dynamic_array_tags_sunw_symtab_shndx,
    1610612765 => :dynamic_array_tags_sunw_capchainent,
    1610612766 => :dynamic_array_tags_sunw_deferred,
    1610612767 => :dynamic_array_tags_sunw_capchainsz,
    1610612768 => :dynamic_array_tags_sunw_phname,
    1610612769 => :dynamic_array_tags_sunw_parent,
    1610612771 => :dynamic_array_tags_sunw_sx_aslr,
    1610612773 => :dynamic_array_tags_sunw_relax,
    1610612775 => :dynamic_array_tags_sunw_kmod,
    1610612777 => :dynamic_array_tags_sunw_sx_nxheap,
    1610612779 => :dynamic_array_tags_sunw_sx_nxstack,
    1610612781 => :dynamic_array_tags_sunw_sx_adiheap,
    1610612783 => :dynamic_array_tags_sunw_sx_adistack,
    1610612785 => :dynamic_array_tags_sunw_sx_ssbd,
    1610612786 => :dynamic_array_tags_sunw_symnsort,
    1610612787 => :dynamic_array_tags_sunw_symnsortsz,
    1879047668 => :dynamic_array_tags_gnu_flags_1,
    1879047669 => :dynamic_array_tags_gnu_prelinked,
    1879047670 => :dynamic_array_tags_gnu_conflictsz,
    1879047671 => :dynamic_array_tags_gnu_liblistsz,
    1879047672 => :dynamic_array_tags_checksum,
    1879047673 => :dynamic_array_tags_pltpadsz,
    1879047674 => :dynamic_array_tags_moveent,
    1879047675 => :dynamic_array_tags_movesz,
    1879047676 => :dynamic_array_tags_feature_1,
    1879047677 => :dynamic_array_tags_posflag_1,
    1879047678 => :dynamic_array_tags_syminsz,
    1879047679 => :dynamic_array_tags_syminent,
    1879047925 => :dynamic_array_tags_gnu_hash,
    1879047926 => :dynamic_array_tags_tlsdesc_plt,
    1879047927 => :dynamic_array_tags_tlsdesc_got,
    1879047928 => :dynamic_array_tags_gnu_conflict,
    1879047929 => :dynamic_array_tags_gnu_liblist,
    1879047930 => :dynamic_array_tags_config,
    1879047931 => :dynamic_array_tags_depaudit,
    1879047932 => :dynamic_array_tags_audit,
    1879047933 => :dynamic_array_tags_pltpad,
    1879047934 => :dynamic_array_tags_movetab,
    1879047935 => :dynamic_array_tags_syminfo,
    1879048176 => :dynamic_array_tags_versym,
    1879048185 => :dynamic_array_tags_relacount,
    1879048186 => :dynamic_array_tags_relcount,
    1879048187 => :dynamic_array_tags_flags_1,
    1879048188 => :dynamic_array_tags_verdef,
    1879048189 => :dynamic_array_tags_verdefnum,
    1879048190 => :dynamic_array_tags_verneed,
    1879048191 => :dynamic_array_tags_verneednum,
    1879048193 => :dynamic_array_tags_sparc_register,
    2147483645 => :dynamic_array_tags_auxiliary,
    2147483646 => :dynamic_array_tags_used,
    2147483647 => :dynamic_array_tags_filter,
  }
  I__DYNAMIC_ARRAY_TAGS = DYNAMIC_ARRAY_TAGS.invert

  BITS = {
    1 => :bits_b32,
    2 => :bits_b64,
  }
  I__BITS = BITS.invert

  PH_TYPE = {
    0 => :ph_type_null_type,
    1 => :ph_type_load,
    2 => :ph_type_dynamic,
    3 => :ph_type_interp,
    4 => :ph_type_note,
    5 => :ph_type_shlib,
    6 => :ph_type_phdr,
    7 => :ph_type_tls,
    1685382480 => :ph_type_gnu_eh_frame,
    1685382481 => :ph_type_gnu_stack,
    1685382482 => :ph_type_gnu_relro,
    1685382483 => :ph_type_gnu_property,
    1694766464 => :ph_type_pax_flags,
    1879048193 => :ph_type_arm_exidx,
  }
  I__PH_TYPE = PH_TYPE.invert

  OBJ_TYPE = {
    0 => :obj_type_no_file_type,
    1 => :obj_type_relocatable,
    2 => :obj_type_executable,
    3 => :obj_type_shared,
    4 => :obj_type_core,
  }
  I__OBJ_TYPE = OBJ_TYPE.invert

  SECTION_HEADER_IDX_SPECIAL = {
    0 => :section_header_idx_special_undefined,
    65280 => :section_header_idx_special_before,
    65281 => :section_header_idx_special_after,
    65282 => :section_header_idx_special_amd64_lcommon,
    65343 => :section_header_idx_special_sunw_ignore,
    65521 => :section_header_idx_special_abs,
    65522 => :section_header_idx_special_common,
    65535 => :section_header_idx_special_xindex,
  }
  I__SECTION_HEADER_IDX_SPECIAL = SECTION_HEADER_IDX_SPECIAL.invert
  def initialize(_io, _parent = nil, _root = self)
    super(_io, _parent, _root)
    _read
  end

  def _read
    @magic = @_io.read_bytes(4)
    raise Kaitai::Struct::ValidationNotEqualError.new([127, 69, 76, 70].pack('C*'), magic, _io, "/seq/0") if not magic == [127, 69, 76, 70].pack('C*')
    @bits = Kaitai::Struct::Stream::resolve_enum(BITS, @_io.read_u1)
    @endian = Kaitai::Struct::Stream::resolve_enum(ENDIAN, @_io.read_u1)
    @ei_version = @_io.read_u1
    raise Kaitai::Struct::ValidationNotEqualError.new(1, ei_version, _io, "/seq/3") if not ei_version == 1
    @abi = Kaitai::Struct::Stream::resolve_enum(OS_ABI, @_io.read_u1)
    @abi_version = @_io.read_u1
    @pad = @_io.read_bytes(7)
    raise Kaitai::Struct::ValidationNotEqualError.new([0, 0, 0, 0, 0, 0, 0].pack('C*'), pad, _io, "/seq/6") if not pad == [0, 0, 0, 0, 0, 0, 0].pack('C*')
    @header = EndianElf.new(@_io, self, @_root)
    self
  end
  class EndianElf < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      case _root.endian
      when :endian_le
        @_is_le = true
      when :endian_be
        @_is_le = false
      end

      if @_is_le == true
        _read_le
      elsif @_is_le == false
        _read_be
      else
        raise Kaitai::Struct::UndecidedEndiannessError.new("/types/endian_elf")
      end
      self
    end

    def _read_le
      @e_type = Kaitai::Struct::Stream::resolve_enum(Elf::OBJ_TYPE, @_io.read_u2le)
      @machine = Kaitai::Struct::Stream::resolve_enum(Elf::MACHINE, @_io.read_u2le)
      @e_version = @_io.read_u4le
      case _root.bits
      when :bits_b32
        @entry_point = @_io.read_u4le
      when :bits_b64
        @entry_point = @_io.read_u8le
      end
      case _root.bits
      when :bits_b32
        @program_header_offset = @_io.read_u4le
      when :bits_b64
        @program_header_offset = @_io.read_u8le
      end
      case _root.bits
      when :bits_b32
        @section_header_offset = @_io.read_u4le
      when :bits_b64
        @section_header_offset = @_io.read_u8le
      end
      @flags = @_io.read_bytes(4)
      @e_ehsize = @_io.read_u2le
      @program_header_entry_size = @_io.read_u2le
      @qty_program_header = @_io.read_u2le
      @section_header_entry_size = @_io.read_u2le
      @qty_section_header = @_io.read_u2le
      @section_names_idx = @_io.read_u2le
      self
    end

    def _read_be
      @e_type = Kaitai::Struct::Stream::resolve_enum(Elf::OBJ_TYPE, @_io.read_u2be)
      @machine = Kaitai::Struct::Stream::resolve_enum(Elf::MACHINE, @_io.read_u2be)
      @e_version = @_io.read_u4be
      case _root.bits
      when :bits_b32
        @entry_point = @_io.read_u4be
      when :bits_b64
        @entry_point = @_io.read_u8be
      end
      case _root.bits
      when :bits_b32
        @program_header_offset = @_io.read_u4be
      when :bits_b64
        @program_header_offset = @_io.read_u8be
      end
      case _root.bits
      when :bits_b32
        @section_header_offset = @_io.read_u4be
      when :bits_b64
        @section_header_offset = @_io.read_u8be
      end
      @flags = @_io.read_bytes(4)
      @e_ehsize = @_io.read_u2be
      @program_header_entry_size = @_io.read_u2be
      @qty_program_header = @_io.read_u2be
      @section_header_entry_size = @_io.read_u2be
      @qty_section_header = @_io.read_u2be
      @section_names_idx = @_io.read_u2be
      self
    end
    class NoteSection < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = self, _is_le = nil)
        super(_io, _parent, _root)
        @_is_le = _is_le
        _read
      end

      def _read

        if @_is_le == true
          _read_le
        elsif @_is_le == false
          _read_be
        else
          raise Kaitai::Struct::UndecidedEndiannessError.new("/types/endian_elf/types/note_section")
        end
        self
      end

      def _read_le
        @entries = []
        i = 0
        while not @_io.eof?
          @entries << NoteSectionEntry.new(@_io, self, @_root, @_is_le)
          i += 1
        end
        self
      end

      def _read_be
        @entries = []
        i = 0
        while not @_io.eof?
          @entries << NoteSectionEntry.new(@_io, self, @_root, @_is_le)
          i += 1
        end
        self
      end
      attr_reader :entries
    end
    class ProgramHeader < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = self, _is_le = nil)
        super(_io, _parent, _root)
        @_is_le = _is_le
        _read
      end

      def _read

        if @_is_le == true
          _read_le
        elsif @_is_le == false
          _read_be
        else
          raise Kaitai::Struct::UndecidedEndiannessError.new("/types/endian_elf/types/program_header")
        end
        self
      end

      def _read_le
        @type = Kaitai::Struct::Stream::resolve_enum(Elf::PH_TYPE, @_io.read_u4le)
        if _root.bits == :bits_b64
          @flags64 = @_io.read_u4le
        end
        case _root.bits
        when :bits_b32
          @offset = @_io.read_u4le
        when :bits_b64
          @offset = @_io.read_u8le
        end
        case _root.bits
        when :bits_b32
          @vaddr = @_io.read_u4le
        when :bits_b64
          @vaddr = @_io.read_u8le
        end
        case _root.bits
        when :bits_b32
          @paddr = @_io.read_u4le
        when :bits_b64
          @paddr = @_io.read_u8le
        end
        case _root.bits
        when :bits_b32
          @filesz = @_io.read_u4le
        when :bits_b64
          @filesz = @_io.read_u8le
        end
        case _root.bits
        when :bits_b32
          @memsz = @_io.read_u4le
        when :bits_b64
          @memsz = @_io.read_u8le
        end
        if _root.bits == :bits_b32
          @flags32 = @_io.read_u4le
        end
        case _root.bits
        when :bits_b32
          @align = @_io.read_u4le
        when :bits_b64
          @align = @_io.read_u8le
        end
        self
      end

      def _read_be
        @type = Kaitai::Struct::Stream::resolve_enum(Elf::PH_TYPE, @_io.read_u4be)
        if _root.bits == :bits_b64
          @flags64 = @_io.read_u4be
        end
        case _root.bits
        when :bits_b32
          @offset = @_io.read_u4be
        when :bits_b64
          @offset = @_io.read_u8be
        end
        case _root.bits
        when :bits_b32
          @vaddr = @_io.read_u4be
        when :bits_b64
          @vaddr = @_io.read_u8be
        end
        case _root.bits
        when :bits_b32
          @paddr = @_io.read_u4be
        when :bits_b64
          @paddr = @_io.read_u8be
        end
        case _root.bits
        when :bits_b32
          @filesz = @_io.read_u4be
        when :bits_b64
          @filesz = @_io.read_u8be
        end
        case _root.bits
        when :bits_b32
          @memsz = @_io.read_u4be
        when :bits_b64
          @memsz = @_io.read_u8be
        end
        if _root.bits == :bits_b32
          @flags32 = @_io.read_u4be
        end
        case _root.bits
        when :bits_b32
          @align = @_io.read_u4be
        when :bits_b64
          @align = @_io.read_u8be
        end
        self
      end
      def flags_obj
        return @flags_obj unless @flags_obj.nil?
        if @_is_le
          case _root.bits
          when :bits_b32
            @flags_obj = PhdrTypeFlags.new(@_io, self, @_root, flags32)
          when :bits_b64
            @flags_obj = PhdrTypeFlags.new(@_io, self, @_root, flags64)
          end
        else
          case _root.bits
          when :bits_b32
            @flags_obj = PhdrTypeFlags.new(@_io, self, @_root, flags32)
          when :bits_b64
            @flags_obj = PhdrTypeFlags.new(@_io, self, @_root, flags64)
          end
        end
        @flags_obj
      end
      attr_reader :type
      attr_reader :flags64
      attr_reader :offset
      attr_reader :vaddr
      attr_reader :paddr
      attr_reader :filesz
      attr_reader :memsz
      attr_reader :flags32
      attr_reader :align
    end

    ##
    # @see https://docs.oracle.com/cd/E37838_01/html/E36783/chapter6-42444.html Source
    # @see https://refspecs.linuxfoundation.org/elf/gabi4+/ch5.dynamic.html#dynamic_section Source
    class DynamicSectionEntry < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = self, _is_le = nil)
        super(_io, _parent, _root)
        @_is_le = _is_le
        _read
      end

      def _read

        if @_is_le == true
          _read_le
        elsif @_is_le == false
          _read_be
        else
          raise Kaitai::Struct::UndecidedEndiannessError.new("/types/endian_elf/types/dynamic_section_entry")
        end
        self
      end

      def _read_le
        case _root.bits
        when :bits_b32
          @tag = @_io.read_u4le
        when :bits_b64
          @tag = @_io.read_u8le
        end
        case _root.bits
        when :bits_b32
          @value_or_ptr = @_io.read_u4le
        when :bits_b64
          @value_or_ptr = @_io.read_u8le
        end
        self
      end

      def _read_be
        case _root.bits
        when :bits_b32
          @tag = @_io.read_u4be
        when :bits_b64
          @tag = @_io.read_u8be
        end
        case _root.bits
        when :bits_b32
          @value_or_ptr = @_io.read_u4be
        when :bits_b64
          @value_or_ptr = @_io.read_u8be
        end
        self
      end
      def flag_1_values
        return @flag_1_values unless @flag_1_values.nil?
        if tag_enum == :dynamic_array_tags_flags_1
          if @_is_le
            @flag_1_values = DtFlag1Values.new(@_io, self, @_root, value_or_ptr)
          else
            @flag_1_values = DtFlag1Values.new(@_io, self, @_root, value_or_ptr)
          end
        end
        @flag_1_values
      end
      def value_str
        return @value_str unless @value_str.nil?
        if  ((is_value_str) && (_parent.is_string_table_linked)) 
          io = _parent._parent.linked_section.body._io
          _pos = io.pos
          io.seek(value_or_ptr)
          if @_is_le
            @value_str = (io.read_bytes_term(0, false, true, true)).force_encoding("ASCII")
          else
            @value_str = (io.read_bytes_term(0, false, true, true)).force_encoding("ASCII")
          end
          io.seek(_pos)
        end
        @value_str
      end
      def tag_enum
        return @tag_enum unless @tag_enum.nil?
        @tag_enum = Kaitai::Struct::Stream::resolve_enum(Elf::DYNAMIC_ARRAY_TAGS, tag)
        @tag_enum
      end
      def flag_values
        return @flag_values unless @flag_values.nil?
        if tag_enum == :dynamic_array_tags_flags
          if @_is_le
            @flag_values = DtFlagValues.new(@_io, self, @_root, value_or_ptr)
          else
            @flag_values = DtFlagValues.new(@_io, self, @_root, value_or_ptr)
          end
        end
        @flag_values
      end
      def is_value_str
        return @is_value_str unless @is_value_str.nil?
        @is_value_str =  ((value_or_ptr != 0) && ( ((tag_enum == :dynamic_array_tags_needed) || (tag_enum == :dynamic_array_tags_soname) || (tag_enum == :dynamic_array_tags_rpath) || (tag_enum == :dynamic_array_tags_runpath) || (tag_enum == :dynamic_array_tags_sunw_auxiliary) || (tag_enum == :dynamic_array_tags_sunw_filter) || (tag_enum == :dynamic_array_tags_auxiliary) || (tag_enum == :dynamic_array_tags_filter) || (tag_enum == :dynamic_array_tags_config) || (tag_enum == :dynamic_array_tags_depaudit) || (tag_enum == :dynamic_array_tags_audit)) )) 
        @is_value_str
      end
      attr_reader :tag
      attr_reader :value_or_ptr
    end
    class SectionHeader < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = self, _is_le = nil)
        super(_io, _parent, _root)
        @_is_le = _is_le
        _read
      end

      def _read

        if @_is_le == true
          _read_le
        elsif @_is_le == false
          _read_be
        else
          raise Kaitai::Struct::UndecidedEndiannessError.new("/types/endian_elf/types/section_header")
        end
        self
      end

      def _read_le
        @ofs_name = @_io.read_u4le
        @type = Kaitai::Struct::Stream::resolve_enum(Elf::SH_TYPE, @_io.read_u4le)
        case _root.bits
        when :bits_b32
          @flags = @_io.read_u4le
        when :bits_b64
          @flags = @_io.read_u8le
        end
        case _root.bits
        when :bits_b32
          @addr = @_io.read_u4le
        when :bits_b64
          @addr = @_io.read_u8le
        end
        case _root.bits
        when :bits_b32
          @ofs_body = @_io.read_u4le
        when :bits_b64
          @ofs_body = @_io.read_u8le
        end
        case _root.bits
        when :bits_b32
          @len_body = @_io.read_u4le
        when :bits_b64
          @len_body = @_io.read_u8le
        end
        @linked_section_idx = @_io.read_u4le
        @info = @_io.read_bytes(4)
        case _root.bits
        when :bits_b32
          @align = @_io.read_u4le
        when :bits_b64
          @align = @_io.read_u8le
        end
        case _root.bits
        when :bits_b32
          @entry_size = @_io.read_u4le
        when :bits_b64
          @entry_size = @_io.read_u8le
        end
        self
      end

      def _read_be
        @ofs_name = @_io.read_u4be
        @type = Kaitai::Struct::Stream::resolve_enum(Elf::SH_TYPE, @_io.read_u4be)
        case _root.bits
        when :bits_b32
          @flags = @_io.read_u4be
        when :bits_b64
          @flags = @_io.read_u8be
        end
        case _root.bits
        when :bits_b32
          @addr = @_io.read_u4be
        when :bits_b64
          @addr = @_io.read_u8be
        end
        case _root.bits
        when :bits_b32
          @ofs_body = @_io.read_u4be
        when :bits_b64
          @ofs_body = @_io.read_u8be
        end
        case _root.bits
        when :bits_b32
          @len_body = @_io.read_u4be
        when :bits_b64
          @len_body = @_io.read_u8be
        end
        @linked_section_idx = @_io.read_u4be
        @info = @_io.read_bytes(4)
        case _root.bits
        when :bits_b32
          @align = @_io.read_u4be
        when :bits_b64
          @align = @_io.read_u8be
        end
        case _root.bits
        when :bits_b32
          @entry_size = @_io.read_u4be
        when :bits_b64
          @entry_size = @_io.read_u8be
        end
        self
      end
      def body
        return @body unless @body.nil?
        if type != :sh_type_nobits
          io = _root._io
          _pos = io.pos
          io.seek(ofs_body)
          if @_is_le
            case type
            when :sh_type_rel
              @_raw_body = io.read_bytes(len_body)
              _io__raw_body = Kaitai::Struct::Stream.new(@_raw_body)
              @body = RelocationSection.new(_io__raw_body, self, @_root, @_is_le, false)
            when :sh_type_note
              @_raw_body = io.read_bytes(len_body)
              _io__raw_body = Kaitai::Struct::Stream.new(@_raw_body)
              @body = NoteSection.new(_io__raw_body, self, @_root, @_is_le)
            when :sh_type_symtab
              @_raw_body = io.read_bytes(len_body)
              _io__raw_body = Kaitai::Struct::Stream.new(@_raw_body)
              @body = DynsymSection.new(_io__raw_body, self, @_root, @_is_le)
            when :sh_type_strtab
              @_raw_body = io.read_bytes(len_body)
              _io__raw_body = Kaitai::Struct::Stream.new(@_raw_body)
              @body = StringsStruct.new(_io__raw_body, self, @_root, @_is_le)
            when :sh_type_dynamic
              @_raw_body = io.read_bytes(len_body)
              _io__raw_body = Kaitai::Struct::Stream.new(@_raw_body)
              @body = DynamicSection.new(_io__raw_body, self, @_root, @_is_le)
            when :sh_type_dynsym
              @_raw_body = io.read_bytes(len_body)
              _io__raw_body = Kaitai::Struct::Stream.new(@_raw_body)
              @body = DynsymSection.new(_io__raw_body, self, @_root, @_is_le)
            when :sh_type_rela
              @_raw_body = io.read_bytes(len_body)
              _io__raw_body = Kaitai::Struct::Stream.new(@_raw_body)
              @body = RelocationSection.new(_io__raw_body, self, @_root, @_is_le, true)
            else
              @body = io.read_bytes(len_body)
            end
          else
            case type
            when :sh_type_rel
              @_raw_body = io.read_bytes(len_body)
              _io__raw_body = Kaitai::Struct::Stream.new(@_raw_body)
              @body = RelocationSection.new(_io__raw_body, self, @_root, @_is_le, false)
            when :sh_type_note
              @_raw_body = io.read_bytes(len_body)
              _io__raw_body = Kaitai::Struct::Stream.new(@_raw_body)
              @body = NoteSection.new(_io__raw_body, self, @_root, @_is_le)
            when :sh_type_symtab
              @_raw_body = io.read_bytes(len_body)
              _io__raw_body = Kaitai::Struct::Stream.new(@_raw_body)
              @body = DynsymSection.new(_io__raw_body, self, @_root, @_is_le)
            when :sh_type_strtab
              @_raw_body = io.read_bytes(len_body)
              _io__raw_body = Kaitai::Struct::Stream.new(@_raw_body)
              @body = StringsStruct.new(_io__raw_body, self, @_root, @_is_le)
            when :sh_type_dynamic
              @_raw_body = io.read_bytes(len_body)
              _io__raw_body = Kaitai::Struct::Stream.new(@_raw_body)
              @body = DynamicSection.new(_io__raw_body, self, @_root, @_is_le)
            when :sh_type_dynsym
              @_raw_body = io.read_bytes(len_body)
              _io__raw_body = Kaitai::Struct::Stream.new(@_raw_body)
              @body = DynsymSection.new(_io__raw_body, self, @_root, @_is_le)
            when :sh_type_rela
              @_raw_body = io.read_bytes(len_body)
              _io__raw_body = Kaitai::Struct::Stream.new(@_raw_body)
              @body = RelocationSection.new(_io__raw_body, self, @_root, @_is_le, true)
            else
              @body = io.read_bytes(len_body)
            end
          end
          io.seek(_pos)
        end
        @body
      end

      ##
      # may reference a later section header, so don't try to access too early (use only lazy `instances`)
      # @see https://refspecs.linuxfoundation.org/elf/gabi4+/ch4.sheader.html#sh_link Source
      def linked_section
        return @linked_section unless @linked_section.nil?
        if  ((linked_section_idx != Elf::I__SECTION_HEADER_IDX_SPECIAL[:section_header_idx_special_undefined]) && (linked_section_idx < _root.header.qty_section_header)) 
          @linked_section = _root.header.section_headers[linked_section_idx]
        end
        @linked_section
      end
      def name
        return @name unless @name.nil?
        io = _root.header.section_names._io
        _pos = io.pos
        io.seek(ofs_name)
        if @_is_le
          @name = (io.read_bytes_term(0, false, true, true)).force_encoding("ASCII")
        else
          @name = (io.read_bytes_term(0, false, true, true)).force_encoding("ASCII")
        end
        io.seek(_pos)
        @name
      end
      def flags_obj
        return @flags_obj unless @flags_obj.nil?
        if @_is_le
          @flags_obj = SectionHeaderFlags.new(@_io, self, @_root, flags)
        else
          @flags_obj = SectionHeaderFlags.new(@_io, self, @_root, flags)
        end
        @flags_obj
      end
      attr_reader :ofs_name
      attr_reader :type
      attr_reader :flags
      attr_reader :addr
      attr_reader :ofs_body
      attr_reader :len_body
      attr_reader :linked_section_idx
      attr_reader :info
      attr_reader :align
      attr_reader :entry_size
      attr_reader :_raw_body
    end

    ##
    # @see https://docs.oracle.com/cd/E37838_01/html/E36783/chapter6-54839.html Source
    # @see https://refspecs.linuxfoundation.org/elf/gabi4+/ch4.reloc.html Source
    class RelocationSection < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = self, _is_le = nil, has_addend)
        super(_io, _parent, _root)
        @_is_le = _is_le
        @has_addend = has_addend
        _read
      end

      def _read

        if @_is_le == true
          _read_le
        elsif @_is_le == false
          _read_be
        else
          raise Kaitai::Struct::UndecidedEndiannessError.new("/types/endian_elf/types/relocation_section")
        end
        self
      end

      def _read_le
        @entries = []
        i = 0
        while not @_io.eof?
          @entries << RelocationSectionEntry.new(@_io, self, @_root, @_is_le)
          i += 1
        end
        self
      end

      def _read_be
        @entries = []
        i = 0
        while not @_io.eof?
          @entries << RelocationSectionEntry.new(@_io, self, @_root, @_is_le)
          i += 1
        end
        self
      end
      attr_reader :entries
      attr_reader :has_addend
    end
    class DynamicSection < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = self, _is_le = nil)
        super(_io, _parent, _root)
        @_is_le = _is_le
        _read
      end

      def _read

        if @_is_le == true
          _read_le
        elsif @_is_le == false
          _read_be
        else
          raise Kaitai::Struct::UndecidedEndiannessError.new("/types/endian_elf/types/dynamic_section")
        end
        self
      end

      def _read_le
        @entries = []
        i = 0
        while not @_io.eof?
          @entries << DynamicSectionEntry.new(@_io, self, @_root, @_is_le)
          i += 1
        end
        self
      end

      def _read_be
        @entries = []
        i = 0
        while not @_io.eof?
          @entries << DynamicSectionEntry.new(@_io, self, @_root, @_is_le)
          i += 1
        end
        self
      end
      def is_string_table_linked
        return @is_string_table_linked unless @is_string_table_linked.nil?
        @is_string_table_linked = _parent.linked_section.type == :sh_type_strtab
        @is_string_table_linked
      end
      attr_reader :entries
    end
    class DynsymSection < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = self, _is_le = nil)
        super(_io, _parent, _root)
        @_is_le = _is_le
        _read
      end

      def _read

        if @_is_le == true
          _read_le
        elsif @_is_le == false
          _read_be
        else
          raise Kaitai::Struct::UndecidedEndiannessError.new("/types/endian_elf/types/dynsym_section")
        end
        self
      end

      def _read_le
        @entries = []
        i = 0
        while not @_io.eof?
          @entries << DynsymSectionEntry.new(@_io, self, @_root, @_is_le)
          i += 1
        end
        self
      end

      def _read_be
        @entries = []
        i = 0
        while not @_io.eof?
          @entries << DynsymSectionEntry.new(@_io, self, @_root, @_is_le)
          i += 1
        end
        self
      end
      def is_string_table_linked
        return @is_string_table_linked unless @is_string_table_linked.nil?
        @is_string_table_linked = _parent.linked_section.type == :sh_type_strtab
        @is_string_table_linked
      end
      attr_reader :entries
    end
    class RelocationSectionEntry < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = self, _is_le = nil)
        super(_io, _parent, _root)
        @_is_le = _is_le
        _read
      end

      def _read

        if @_is_le == true
          _read_le
        elsif @_is_le == false
          _read_be
        else
          raise Kaitai::Struct::UndecidedEndiannessError.new("/types/endian_elf/types/relocation_section_entry")
        end
        self
      end

      def _read_le
        case _root.bits
        when :bits_b32
          @offset = @_io.read_u4le
        when :bits_b64
          @offset = @_io.read_u8le
        end
        case _root.bits
        when :bits_b32
          @info = @_io.read_u4le
        when :bits_b64
          @info = @_io.read_u8le
        end
        if _parent.has_addend
          case _root.bits
          when :bits_b32
            @addend = @_io.read_s4le
          when :bits_b64
            @addend = @_io.read_s8le
          end
        end
        self
      end

      def _read_be
        case _root.bits
        when :bits_b32
          @offset = @_io.read_u4be
        when :bits_b64
          @offset = @_io.read_u8be
        end
        case _root.bits
        when :bits_b32
          @info = @_io.read_u4be
        when :bits_b64
          @info = @_io.read_u8be
        end
        if _parent.has_addend
          case _root.bits
          when :bits_b32
            @addend = @_io.read_s4be
          when :bits_b64
            @addend = @_io.read_s8be
          end
        end
        self
      end
      attr_reader :offset
      attr_reader :info
      attr_reader :addend
    end

    ##
    # @see https://docs.oracle.com/cd/E37838_01/html/E36783/man-sts.html Source
    # @see https://refspecs.linuxfoundation.org/elf/gabi4+/ch4.symtab.html Source
    class DynsymSectionEntry < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = self, _is_le = nil)
        super(_io, _parent, _root)
        @_is_le = _is_le
        _read
      end

      def _read

        if @_is_le == true
          _read_le
        elsif @_is_le == false
          _read_be
        else
          raise Kaitai::Struct::UndecidedEndiannessError.new("/types/endian_elf/types/dynsym_section_entry")
        end
        self
      end

      def _read_le
        @ofs_name = @_io.read_u4le
        if _root.bits == :bits_b32
          @value_b32 = @_io.read_u4le
        end
        if _root.bits == :bits_b32
          @size_b32 = @_io.read_u4le
        end
        @bind = Kaitai::Struct::Stream::resolve_enum(Elf::SYMBOL_BINDING, @_io.read_bits_int_be(4))
        @type = Kaitai::Struct::Stream::resolve_enum(Elf::SYMBOL_TYPE, @_io.read_bits_int_be(4))
        @_io.align_to_byte
        @other = @_io.read_u1
        @sh_idx = @_io.read_u2le
        if _root.bits == :bits_b64
          @value_b64 = @_io.read_u8le
        end
        if _root.bits == :bits_b64
          @size_b64 = @_io.read_u8le
        end
        self
      end

      def _read_be
        @ofs_name = @_io.read_u4be
        if _root.bits == :bits_b32
          @value_b32 = @_io.read_u4be
        end
        if _root.bits == :bits_b32
          @size_b32 = @_io.read_u4be
        end
        @bind = Kaitai::Struct::Stream::resolve_enum(Elf::SYMBOL_BINDING, @_io.read_bits_int_be(4))
        @type = Kaitai::Struct::Stream::resolve_enum(Elf::SYMBOL_TYPE, @_io.read_bits_int_be(4))
        @_io.align_to_byte
        @other = @_io.read_u1
        @sh_idx = @_io.read_u2be
        if _root.bits == :bits_b64
          @value_b64 = @_io.read_u8be
        end
        if _root.bits == :bits_b64
          @size_b64 = @_io.read_u8be
        end
        self
      end
      def is_sh_idx_reserved
        return @is_sh_idx_reserved unless @is_sh_idx_reserved.nil?
        @is_sh_idx_reserved =  ((sh_idx >= _root.sh_idx_lo_reserved) && (sh_idx <= _root.sh_idx_hi_reserved)) 
        @is_sh_idx_reserved
      end
      def is_sh_idx_os
        return @is_sh_idx_os unless @is_sh_idx_os.nil?
        @is_sh_idx_os =  ((sh_idx >= _root.sh_idx_lo_os) && (sh_idx <= _root.sh_idx_hi_os)) 
        @is_sh_idx_os
      end
      def is_sh_idx_proc
        return @is_sh_idx_proc unless @is_sh_idx_proc.nil?
        @is_sh_idx_proc =  ((sh_idx >= _root.sh_idx_lo_proc) && (sh_idx <= _root.sh_idx_hi_proc)) 
        @is_sh_idx_proc
      end
      def size
        return @size unless @size.nil?
        @size = (_root.bits == :bits_b32 ? size_b32 : (_root.bits == :bits_b64 ? size_b64 : 0))
        @size
      end
      def visibility
        return @visibility unless @visibility.nil?
        @visibility = Kaitai::Struct::Stream::resolve_enum(Elf::SYMBOL_VISIBILITY, (other & 3))
        @visibility
      end
      def value
        return @value unless @value.nil?
        @value = (_root.bits == :bits_b32 ? value_b32 : (_root.bits == :bits_b64 ? value_b64 : 0))
        @value
      end
      def name
        return @name unless @name.nil?
        if  ((ofs_name != 0) && (_parent.is_string_table_linked)) 
          io = _parent._parent.linked_section.body._io
          _pos = io.pos
          io.seek(ofs_name)
          if @_is_le
            @name = (io.read_bytes_term(0, false, true, true)).force_encoding("UTF-8")
          else
            @name = (io.read_bytes_term(0, false, true, true)).force_encoding("UTF-8")
          end
          io.seek(_pos)
        end
        @name
      end
      def sh_idx_special
        return @sh_idx_special unless @sh_idx_special.nil?
        @sh_idx_special = Kaitai::Struct::Stream::resolve_enum(Elf::SECTION_HEADER_IDX_SPECIAL, sh_idx)
        @sh_idx_special
      end
      attr_reader :ofs_name
      attr_reader :value_b32
      attr_reader :size_b32
      attr_reader :bind
      attr_reader :type

      ##
      # don't read this field, access `visibility` instead
      attr_reader :other

      ##
      # section header index
      attr_reader :sh_idx
      attr_reader :value_b64
      attr_reader :size_b64
    end

    ##
    # @see https://docs.oracle.com/cd/E37838_01/html/E36783/chapter6-18048.html Source
    # @see https://refspecs.linuxfoundation.org/elf/gabi4+/ch5.pheader.html#note_section Source
    class NoteSectionEntry < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = self, _is_le = nil)
        super(_io, _parent, _root)
        @_is_le = _is_le
        _read
      end

      def _read

        if @_is_le == true
          _read_le
        elsif @_is_le == false
          _read_be
        else
          raise Kaitai::Struct::UndecidedEndiannessError.new("/types/endian_elf/types/note_section_entry")
        end
        self
      end

      def _read_le
        @len_name = @_io.read_u4le
        @len_descriptor = @_io.read_u4le
        @type = @_io.read_u4le
        @name = Kaitai::Struct::Stream::bytes_terminate(@_io.read_bytes(len_name), 0, false)
        @name_padding = @_io.read_bytes((-(len_name) % 4))
        @descriptor = @_io.read_bytes(len_descriptor)
        @descriptor_padding = @_io.read_bytes((-(len_descriptor) % 4))
        self
      end

      def _read_be
        @len_name = @_io.read_u4be
        @len_descriptor = @_io.read_u4be
        @type = @_io.read_u4be
        @name = Kaitai::Struct::Stream::bytes_terminate(@_io.read_bytes(len_name), 0, false)
        @name_padding = @_io.read_bytes((-(len_name) % 4))
        @descriptor = @_io.read_bytes(len_descriptor)
        @descriptor_padding = @_io.read_bytes((-(len_descriptor) % 4))
        self
      end
      attr_reader :len_name
      attr_reader :len_descriptor
      attr_reader :type

      ##
      # Although the ELF specification seems to hint that the `note_name` field
      # is ASCII this isn't the case for Linux binaries that have a
      # `.gnu.build.attributes` section.
      # @see https://fedoraproject.org/wiki/Toolchain/Watermark#Proposed_Specification_for_non-loaded_notes Source
      attr_reader :name
      attr_reader :name_padding
      attr_reader :descriptor
      attr_reader :descriptor_padding
    end
    class StringsStruct < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = self, _is_le = nil)
        super(_io, _parent, _root)
        @_is_le = _is_le
        _read
      end

      def _read

        if @_is_le == true
          _read_le
        elsif @_is_le == false
          _read_be
        else
          raise Kaitai::Struct::UndecidedEndiannessError.new("/types/endian_elf/types/strings_struct")
        end
        self
      end

      def _read_le
        @entries = []
        i = 0
        while not @_io.eof?
          @entries << (@_io.read_bytes_term(0, false, true, true)).force_encoding("UTF-8")
          i += 1
        end
        self
      end

      def _read_be
        @entries = []
        i = 0
        while not @_io.eof?
          @entries << (@_io.read_bytes_term(0, false, true, true)).force_encoding("UTF-8")
          i += 1
        end
        self
      end
      attr_reader :entries
    end
    def program_headers
      return @program_headers unless @program_headers.nil?
      _pos = @_io.pos
      @_io.seek(program_header_offset)
      if @_is_le
        @_raw_program_headers = []
        @program_headers = []
        (qty_program_header).times { |i|
          @_raw_program_headers << @_io.read_bytes(program_header_entry_size)
          _io__raw_program_headers = Kaitai::Struct::Stream.new(@_raw_program_headers[i])
          @program_headers << ProgramHeader.new(_io__raw_program_headers, self, @_root, @_is_le)
        }
      else
        @_raw_program_headers = []
        @program_headers = []
        (qty_program_header).times { |i|
          @_raw_program_headers << @_io.read_bytes(program_header_entry_size)
          _io__raw_program_headers = Kaitai::Struct::Stream.new(@_raw_program_headers[i])
          @program_headers << ProgramHeader.new(_io__raw_program_headers, self, @_root, @_is_le)
        }
      end
      @_io.seek(_pos)
      @program_headers
    end
    def section_headers
      return @section_headers unless @section_headers.nil?
      _pos = @_io.pos
      @_io.seek(section_header_offset)
      if @_is_le
        @_raw_section_headers = []
        @section_headers = []
        (qty_section_header).times { |i|
          @_raw_section_headers << @_io.read_bytes(section_header_entry_size)
          _io__raw_section_headers = Kaitai::Struct::Stream.new(@_raw_section_headers[i])
          @section_headers << SectionHeader.new(_io__raw_section_headers, self, @_root, @_is_le)
        }
      else
        @_raw_section_headers = []
        @section_headers = []
        (qty_section_header).times { |i|
          @_raw_section_headers << @_io.read_bytes(section_header_entry_size)
          _io__raw_section_headers = Kaitai::Struct::Stream.new(@_raw_section_headers[i])
          @section_headers << SectionHeader.new(_io__raw_section_headers, self, @_root, @_is_le)
        }
      end
      @_io.seek(_pos)
      @section_headers
    end
    def section_names
      return @section_names unless @section_names.nil?
      if  ((section_names_idx != Elf::I__SECTION_HEADER_IDX_SPECIAL[:section_header_idx_special_undefined]) && (section_names_idx < _root.header.qty_section_header)) 
        _pos = @_io.pos
        @_io.seek(section_headers[section_names_idx].ofs_body)
        if @_is_le
          @_raw_section_names = @_io.read_bytes(section_headers[section_names_idx].len_body)
          _io__raw_section_names = Kaitai::Struct::Stream.new(@_raw_section_names)
          @section_names = StringsStruct.new(_io__raw_section_names, self, @_root, @_is_le)
        else
          @_raw_section_names = @_io.read_bytes(section_headers[section_names_idx].len_body)
          _io__raw_section_names = Kaitai::Struct::Stream.new(@_raw_section_names)
          @section_names = StringsStruct.new(_io__raw_section_names, self, @_root, @_is_le)
        end
        @_io.seek(_pos)
      end
      @section_names
    end
    attr_reader :e_type
    attr_reader :machine
    attr_reader :e_version
    attr_reader :entry_point
    attr_reader :program_header_offset
    attr_reader :section_header_offset
    attr_reader :flags
    attr_reader :e_ehsize
    attr_reader :program_header_entry_size
    attr_reader :qty_program_header
    attr_reader :section_header_entry_size
    attr_reader :qty_section_header
    attr_reader :section_names_idx
    attr_reader :_raw_program_headers
    attr_reader :_raw_section_headers
    attr_reader :_raw_section_names
  end
  class DtFlag1Values < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self, value)
      super(_io, _parent, _root)
      @value = value
      _read
    end

    def _read
      self
    end

    ##
    # Singleton symbols are used.
    def singleton
      return @singleton unless @singleton.nil?
      @singleton = (value & 33554432) != 0
      @singleton
    end
    def ignmuldef
      return @ignmuldef unless @ignmuldef.nil?
      @ignmuldef = (value & 262144) != 0
      @ignmuldef
    end

    ##
    # Trigger filtee loading at runtime.
    def loadfltr
      return @loadfltr unless @loadfltr.nil?
      @loadfltr = (value & 16) != 0
      @loadfltr
    end

    ##
    # Set RTLD_INITFIRST for this object
    def initfirst
      return @initfirst unless @initfirst.nil?
      @initfirst = (value & 32) != 0
      @initfirst
    end

    ##
    # Object has individual interposers.
    def symintpose
      return @symintpose unless @symintpose.nil?
      @symintpose = (value & 8388608) != 0
      @symintpose
    end
    def noreloc
      return @noreloc unless @noreloc.nil?
      @noreloc = (value & 4194304) != 0
      @noreloc
    end

    ##
    # Configuration alternative created.
    def confalt
      return @confalt unless @confalt.nil?
      @confalt = (value & 8192) != 0
      @confalt
    end

    ##
    # Disp reloc applied at build time.
    def dispreldne
      return @dispreldne unless @dispreldne.nil?
      @dispreldne = (value & 32768) != 0
      @dispreldne
    end

    ##
    # Set RTLD_GLOBAL for this object.
    def rtld_global
      return @rtld_global unless @rtld_global.nil?
      @rtld_global = (value & 2) != 0
      @rtld_global
    end

    ##
    # Set RTLD_NODELETE for this object.
    def nodelete
      return @nodelete unless @nodelete.nil?
      @nodelete = (value & 8) != 0
      @nodelete
    end
    def trans
      return @trans unless @trans.nil?
      @trans = (value & 512) != 0
      @trans
    end

    ##
    # $ORIGIN must be handled.
    def origin
      return @origin unless @origin.nil?
      @origin = (value & 128) != 0
      @origin
    end

    ##
    # Set RTLD_NOW for this object.
    def now
      return @now unless @now.nil?
      @now = (value & 1) != 0
      @now
    end
    def nohdr
      return @nohdr unless @nohdr.nil?
      @nohdr = (value & 1048576) != 0
      @nohdr
    end

    ##
    # Filtee terminates filters search.
    def endfiltee
      return @endfiltee unless @endfiltee.nil?
      @endfiltee = (value & 16384) != 0
      @endfiltee
    end

    ##
    # Object has no-direct binding.
    def nodirect
      return @nodirect unless @nodirect.nil?
      @nodirect = (value & 131072) != 0
      @nodirect
    end

    ##
    # Global auditing required.
    def globaudit
      return @globaudit unless @globaudit.nil?
      @globaudit = (value & 16777216) != 0
      @globaudit
    end
    def noksyms
      return @noksyms unless @noksyms.nil?
      @noksyms = (value & 524288) != 0
      @noksyms
    end

    ##
    # Object is used to interpose.
    def interpose
      return @interpose unless @interpose.nil?
      @interpose = (value & 1024) != 0
      @interpose
    end

    ##
    # Object can't be dldump'ed.
    def nodump
      return @nodump unless @nodump.nil?
      @nodump = (value & 4096) != 0
      @nodump
    end

    ##
    # Disp reloc applied at run-time.
    def disprelpnd
      return @disprelpnd unless @disprelpnd.nil?
      @disprelpnd = (value & 65536) != 0
      @disprelpnd
    end

    ##
    # Set RTLD_NOOPEN for this object.
    def noopen
      return @noopen unless @noopen.nil?
      @noopen = (value & 64) != 0
      @noopen
    end
    def stub
      return @stub unless @stub.nil?
      @stub = (value & 67108864) != 0
      @stub
    end

    ##
    # Direct binding enabled.
    def direct
      return @direct unless @direct.nil?
      @direct = (value & 256) != 0
      @direct
    end

    ##
    # Object is modified after built.
    def edited
      return @edited unless @edited.nil?
      @edited = (value & 2097152) != 0
      @edited
    end

    ##
    # Set RTLD_GROUP for this object.
    def group
      return @group unless @group.nil?
      @group = (value & 4) != 0
      @group
    end
    def pie
      return @pie unless @pie.nil?
      @pie = (value & 134217728) != 0
      @pie
    end

    ##
    # Ignore default lib search path.
    def nodeflib
      return @nodeflib unless @nodeflib.nil?
      @nodeflib = (value & 2048) != 0
      @nodeflib
    end
    attr_reader :value
  end
  class SectionHeaderFlags < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self, value)
      super(_io, _parent, _root)
      @value = value
      _read
    end

    def _read
      self
    end

    ##
    # might be merged
    def merge
      return @merge unless @merge.nil?
      @merge = (value & 16) != 0
      @merge
    end

    ##
    # OS-specific
    def mask_os
      return @mask_os unless @mask_os.nil?
      @mask_os = (value & 267386880) != 0
      @mask_os
    end

    ##
    # section is excluded unless referenced or allocated (Solaris)
    def exclude
      return @exclude unless @exclude.nil?
      @exclude = (value & 134217728) != 0
      @exclude
    end

    ##
    # Processor-specific
    def mask_proc
      return @mask_proc unless @mask_proc.nil?
      @mask_proc = (value & 4026531840) != 0
      @mask_proc
    end

    ##
    # contains nul-terminated strings
    def strings
      return @strings unless @strings.nil?
      @strings = (value & 32) != 0
      @strings
    end

    ##
    # non-standard OS specific handling required
    def os_non_conforming
      return @os_non_conforming unless @os_non_conforming.nil?
      @os_non_conforming = (value & 256) != 0
      @os_non_conforming
    end

    ##
    # occupies memory during execution
    def alloc
      return @alloc unless @alloc.nil?
      @alloc = (value & 2) != 0
      @alloc
    end

    ##
    # executable
    def exec_instr
      return @exec_instr unless @exec_instr.nil?
      @exec_instr = (value & 4) != 0
      @exec_instr
    end

    ##
    # 'sh_info' contains SHT index
    def info_link
      return @info_link unless @info_link.nil?
      @info_link = (value & 64) != 0
      @info_link
    end

    ##
    # writable
    def write
      return @write unless @write.nil?
      @write = (value & 1) != 0
      @write
    end

    ##
    # preserve order after combining
    def link_order
      return @link_order unless @link_order.nil?
      @link_order = (value & 128) != 0
      @link_order
    end

    ##
    # special ordering requirement (Solaris)
    def ordered
      return @ordered unless @ordered.nil?
      @ordered = (value & 67108864) != 0
      @ordered
    end

    ##
    # section hold thread-local data
    def tls
      return @tls unless @tls.nil?
      @tls = (value & 1024) != 0
      @tls
    end

    ##
    # section is member of a group
    def group
      return @group unless @group.nil?
      @group = (value & 512) != 0
      @group
    end
    attr_reader :value
  end
  class PhdrTypeFlags < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self, value)
      super(_io, _parent, _root)
      @value = value
      _read
    end

    def _read
      self
    end
    def read
      return @read unless @read.nil?
      @read = (value & 4) != 0
      @read
    end
    def write
      return @write unless @write.nil?
      @write = (value & 2) != 0
      @write
    end
    def execute
      return @execute unless @execute.nil?
      @execute = (value & 1) != 0
      @execute
    end
    def mask_proc
      return @mask_proc unless @mask_proc.nil?
      @mask_proc = (value & 4026531840) != 0
      @mask_proc
    end
    attr_reader :value
  end

  ##
  # @see https://refspecs.linuxbase.org/elf/gabi4+/ch5.dynamic.html Figure 5-11: DT_FLAGS values
  # @see https://github.com/golang/go/blob/48dfddbab3/src/debug/elf/elf.go#L1079-L1095 Source
  # @see https://docs.oracle.com/cd/E37838_01/html/E36783/chapter6-42444.html#OSLLGchapter7-tbl-5 Source
  class DtFlagValues < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self, value)
      super(_io, _parent, _root)
      @value = value
      _read
    end

    def _read
      self
    end

    ##
    # all relocations for this object must be processed before returning
    # control to the program
    def bind_now
      return @bind_now unless @bind_now.nil?
      @bind_now = (value & 8) != 0
      @bind_now
    end

    ##
    # object may reference the $ORIGIN substitution string
    def origin
      return @origin unless @origin.nil?
      @origin = (value & 1) != 0
      @origin
    end

    ##
    # relocation entries might request modifications to a non-writable segment
    def textrel
      return @textrel unless @textrel.nil?
      @textrel = (value & 4) != 0
      @textrel
    end

    ##
    # object uses static thread-local storage scheme
    def static_tls
      return @static_tls unless @static_tls.nil?
      @static_tls = (value & 16) != 0
      @static_tls
    end

    ##
    # symbolic linking
    def symbolic
      return @symbolic unless @symbolic.nil?
      @symbolic = (value & 2) != 0
      @symbolic
    end
    attr_reader :value
  end
  def sh_idx_lo_os
    return @sh_idx_lo_os unless @sh_idx_lo_os.nil?
    @sh_idx_lo_os = 65312
    @sh_idx_lo_os
  end
  def sh_idx_lo_reserved
    return @sh_idx_lo_reserved unless @sh_idx_lo_reserved.nil?
    @sh_idx_lo_reserved = 65280
    @sh_idx_lo_reserved
  end
  def sh_idx_hi_proc
    return @sh_idx_hi_proc unless @sh_idx_hi_proc.nil?
    @sh_idx_hi_proc = 65311
    @sh_idx_hi_proc
  end
  def sh_idx_lo_proc
    return @sh_idx_lo_proc unless @sh_idx_lo_proc.nil?
    @sh_idx_lo_proc = 65280
    @sh_idx_lo_proc
  end
  def sh_idx_hi_os
    return @sh_idx_hi_os unless @sh_idx_hi_os.nil?
    @sh_idx_hi_os = 65343
    @sh_idx_hi_os
  end
  def sh_idx_hi_reserved
    return @sh_idx_hi_reserved unless @sh_idx_hi_reserved.nil?
    @sh_idx_hi_reserved = 65535
    @sh_idx_hi_reserved
  end

  ##
  # File identification, must be 0x7f + "ELF".
  attr_reader :magic

  ##
  # File class: designates target machine word size (32 or 64
  # bits). The size of many integer fields in this format will
  # depend on this setting.
  attr_reader :bits

  ##
  # Endianness used for all integers.
  attr_reader :endian

  ##
  # ELF header version.
  attr_reader :ei_version

  ##
  # Specifies which OS- and ABI-related extensions will be used
  # in this ELF file.
  attr_reader :abi

  ##
  # Version of ABI targeted by this ELF file. Interpretation
  # depends on `abi` attribute.
  attr_reader :abi_version
  attr_reader :pad
  attr_reader :header
end
