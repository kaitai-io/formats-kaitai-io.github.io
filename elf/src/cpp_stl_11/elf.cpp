// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "elf.h"
#include "kaitai/exceptions.h"
const std::set<elf_t::bits_t> elf_t::_values_bits_t{
    elf_t::BITS_B32,
    elf_t::BITS_B64,
};
bool elf_t::_is_defined_bits_t(elf_t::bits_t v) {
    return elf_t::_values_bits_t.find(v) != elf_t::_values_bits_t.end();
}
const std::set<elf_t::dynamic_array_tags_t> elf_t::_values_dynamic_array_tags_t{
    elf_t::DYNAMIC_ARRAY_TAGS_NULL,
    elf_t::DYNAMIC_ARRAY_TAGS_NEEDED,
    elf_t::DYNAMIC_ARRAY_TAGS_PLTRELSZ,
    elf_t::DYNAMIC_ARRAY_TAGS_PLTGOT,
    elf_t::DYNAMIC_ARRAY_TAGS_HASH,
    elf_t::DYNAMIC_ARRAY_TAGS_STRTAB,
    elf_t::DYNAMIC_ARRAY_TAGS_SYMTAB,
    elf_t::DYNAMIC_ARRAY_TAGS_RELA,
    elf_t::DYNAMIC_ARRAY_TAGS_RELASZ,
    elf_t::DYNAMIC_ARRAY_TAGS_RELAENT,
    elf_t::DYNAMIC_ARRAY_TAGS_STRSZ,
    elf_t::DYNAMIC_ARRAY_TAGS_SYMENT,
    elf_t::DYNAMIC_ARRAY_TAGS_INIT,
    elf_t::DYNAMIC_ARRAY_TAGS_FINI,
    elf_t::DYNAMIC_ARRAY_TAGS_SONAME,
    elf_t::DYNAMIC_ARRAY_TAGS_RPATH,
    elf_t::DYNAMIC_ARRAY_TAGS_SYMBOLIC,
    elf_t::DYNAMIC_ARRAY_TAGS_REL,
    elf_t::DYNAMIC_ARRAY_TAGS_RELSZ,
    elf_t::DYNAMIC_ARRAY_TAGS_RELENT,
    elf_t::DYNAMIC_ARRAY_TAGS_PLTREL,
    elf_t::DYNAMIC_ARRAY_TAGS_DEBUG,
    elf_t::DYNAMIC_ARRAY_TAGS_TEXTREL,
    elf_t::DYNAMIC_ARRAY_TAGS_JMPREL,
    elf_t::DYNAMIC_ARRAY_TAGS_BIND_NOW,
    elf_t::DYNAMIC_ARRAY_TAGS_INIT_ARRAY,
    elf_t::DYNAMIC_ARRAY_TAGS_FINI_ARRAY,
    elf_t::DYNAMIC_ARRAY_TAGS_INIT_ARRAYSZ,
    elf_t::DYNAMIC_ARRAY_TAGS_FINI_ARRAYSZ,
    elf_t::DYNAMIC_ARRAY_TAGS_RUNPATH,
    elf_t::DYNAMIC_ARRAY_TAGS_FLAGS,
    elf_t::DYNAMIC_ARRAY_TAGS_PREINIT_ARRAY,
    elf_t::DYNAMIC_ARRAY_TAGS_PREINIT_ARRAYSZ,
    elf_t::DYNAMIC_ARRAY_TAGS_SYMTAB_SHNDX,
    elf_t::DYNAMIC_ARRAY_TAGS_RELRSZ,
    elf_t::DYNAMIC_ARRAY_TAGS_RELR,
    elf_t::DYNAMIC_ARRAY_TAGS_RELRENT,
    elf_t::DYNAMIC_ARRAY_TAGS_DEPRECATED_SPARC_REGISTER,
    elf_t::DYNAMIC_ARRAY_TAGS_SUNW_AUXILIARY,
    elf_t::DYNAMIC_ARRAY_TAGS_SUNW_RTLDINF,
    elf_t::DYNAMIC_ARRAY_TAGS_SUNW_FILTER,
    elf_t::DYNAMIC_ARRAY_TAGS_SUNW_CAP,
    elf_t::DYNAMIC_ARRAY_TAGS_SUNW_SYMTAB,
    elf_t::DYNAMIC_ARRAY_TAGS_SUNW_SYMSZ,
    elf_t::DYNAMIC_ARRAY_TAGS_SUNW_SORTENT,
    elf_t::DYNAMIC_ARRAY_TAGS_SUNW_SYMSORT,
    elf_t::DYNAMIC_ARRAY_TAGS_SUNW_SYMSORTSZ,
    elf_t::DYNAMIC_ARRAY_TAGS_SUNW_TLSSORT,
    elf_t::DYNAMIC_ARRAY_TAGS_SUNW_TLSSORTSZ,
    elf_t::DYNAMIC_ARRAY_TAGS_SUNW_CAPINFO,
    elf_t::DYNAMIC_ARRAY_TAGS_SUNW_STRPAD,
    elf_t::DYNAMIC_ARRAY_TAGS_SUNW_CAPCHAIN,
    elf_t::DYNAMIC_ARRAY_TAGS_SUNW_LDMACH,
    elf_t::DYNAMIC_ARRAY_TAGS_SUNW_SYMTAB_SHNDX,
    elf_t::DYNAMIC_ARRAY_TAGS_SUNW_CAPCHAINENT,
    elf_t::DYNAMIC_ARRAY_TAGS_SUNW_DEFERRED,
    elf_t::DYNAMIC_ARRAY_TAGS_SUNW_CAPCHAINSZ,
    elf_t::DYNAMIC_ARRAY_TAGS_SUNW_PHNAME,
    elf_t::DYNAMIC_ARRAY_TAGS_SUNW_PARENT,
    elf_t::DYNAMIC_ARRAY_TAGS_SUNW_SX_ASLR,
    elf_t::DYNAMIC_ARRAY_TAGS_SUNW_RELAX,
    elf_t::DYNAMIC_ARRAY_TAGS_SUNW_KMOD,
    elf_t::DYNAMIC_ARRAY_TAGS_SUNW_SX_NXHEAP,
    elf_t::DYNAMIC_ARRAY_TAGS_SUNW_SX_NXSTACK,
    elf_t::DYNAMIC_ARRAY_TAGS_SUNW_SX_ADIHEAP,
    elf_t::DYNAMIC_ARRAY_TAGS_SUNW_SX_ADISTACK,
    elf_t::DYNAMIC_ARRAY_TAGS_SUNW_SX_SSBD,
    elf_t::DYNAMIC_ARRAY_TAGS_SUNW_SYMNSORT,
    elf_t::DYNAMIC_ARRAY_TAGS_SUNW_SYMNSORTSZ,
    elf_t::DYNAMIC_ARRAY_TAGS_GNU_FLAGS_1,
    elf_t::DYNAMIC_ARRAY_TAGS_GNU_PRELINKED,
    elf_t::DYNAMIC_ARRAY_TAGS_GNU_CONFLICTSZ,
    elf_t::DYNAMIC_ARRAY_TAGS_GNU_LIBLISTSZ,
    elf_t::DYNAMIC_ARRAY_TAGS_CHECKSUM,
    elf_t::DYNAMIC_ARRAY_TAGS_PLTPADSZ,
    elf_t::DYNAMIC_ARRAY_TAGS_MOVEENT,
    elf_t::DYNAMIC_ARRAY_TAGS_MOVESZ,
    elf_t::DYNAMIC_ARRAY_TAGS_FEATURE_1,
    elf_t::DYNAMIC_ARRAY_TAGS_POSFLAG_1,
    elf_t::DYNAMIC_ARRAY_TAGS_SYMINSZ,
    elf_t::DYNAMIC_ARRAY_TAGS_SYMINENT,
    elf_t::DYNAMIC_ARRAY_TAGS_GNU_HASH,
    elf_t::DYNAMIC_ARRAY_TAGS_TLSDESC_PLT,
    elf_t::DYNAMIC_ARRAY_TAGS_TLSDESC_GOT,
    elf_t::DYNAMIC_ARRAY_TAGS_GNU_CONFLICT,
    elf_t::DYNAMIC_ARRAY_TAGS_GNU_LIBLIST,
    elf_t::DYNAMIC_ARRAY_TAGS_CONFIG,
    elf_t::DYNAMIC_ARRAY_TAGS_DEPAUDIT,
    elf_t::DYNAMIC_ARRAY_TAGS_AUDIT,
    elf_t::DYNAMIC_ARRAY_TAGS_PLTPAD,
    elf_t::DYNAMIC_ARRAY_TAGS_MOVETAB,
    elf_t::DYNAMIC_ARRAY_TAGS_SYMINFO,
    elf_t::DYNAMIC_ARRAY_TAGS_VERSYM,
    elf_t::DYNAMIC_ARRAY_TAGS_RELACOUNT,
    elf_t::DYNAMIC_ARRAY_TAGS_RELCOUNT,
    elf_t::DYNAMIC_ARRAY_TAGS_FLAGS_1,
    elf_t::DYNAMIC_ARRAY_TAGS_VERDEF,
    elf_t::DYNAMIC_ARRAY_TAGS_VERDEFNUM,
    elf_t::DYNAMIC_ARRAY_TAGS_VERNEED,
    elf_t::DYNAMIC_ARRAY_TAGS_VERNEEDNUM,
    elf_t::DYNAMIC_ARRAY_TAGS_SPARC_REGISTER,
    elf_t::DYNAMIC_ARRAY_TAGS_AUXILIARY,
    elf_t::DYNAMIC_ARRAY_TAGS_USED,
    elf_t::DYNAMIC_ARRAY_TAGS_FILTER,
};
bool elf_t::_is_defined_dynamic_array_tags_t(elf_t::dynamic_array_tags_t v) {
    return elf_t::_values_dynamic_array_tags_t.find(v) != elf_t::_values_dynamic_array_tags_t.end();
}
const std::set<elf_t::endian_t> elf_t::_values_endian_t{
    elf_t::ENDIAN_LE,
    elf_t::ENDIAN_BE,
};
bool elf_t::_is_defined_endian_t(elf_t::endian_t v) {
    return elf_t::_values_endian_t.find(v) != elf_t::_values_endian_t.end();
}
const std::set<elf_t::machine_t> elf_t::_values_machine_t{
    elf_t::MACHINE_NO_MACHINE,
    elf_t::MACHINE_M32,
    elf_t::MACHINE_SPARC,
    elf_t::MACHINE_X86,
    elf_t::MACHINE_M68K,
    elf_t::MACHINE_M88K,
    elf_t::MACHINE_IAMCU,
    elf_t::MACHINE_I860,
    elf_t::MACHINE_MIPS,
    elf_t::MACHINE_S370,
    elf_t::MACHINE_MIPS_RS3_LE,
    elf_t::MACHINE_PARISC,
    elf_t::MACHINE_VPP500,
    elf_t::MACHINE_SPARC32PLUS,
    elf_t::MACHINE_I960,
    elf_t::MACHINE_POWERPC,
    elf_t::MACHINE_POWERPC64,
    elf_t::MACHINE_S390,
    elf_t::MACHINE_SPU,
    elf_t::MACHINE_V800,
    elf_t::MACHINE_FR20,
    elf_t::MACHINE_RH32,
    elf_t::MACHINE_RCE,
    elf_t::MACHINE_ARM,
    elf_t::MACHINE_OLD_ALPHA,
    elf_t::MACHINE_SUPERH,
    elf_t::MACHINE_SPARC_V9,
    elf_t::MACHINE_TRICORE,
    elf_t::MACHINE_ARC,
    elf_t::MACHINE_H8_300,
    elf_t::MACHINE_H8_300H,
    elf_t::MACHINE_H8S,
    elf_t::MACHINE_H8_500,
    elf_t::MACHINE_IA_64,
    elf_t::MACHINE_MIPS_X,
    elf_t::MACHINE_COLDFIRE,
    elf_t::MACHINE_M68HC12,
    elf_t::MACHINE_MMA,
    elf_t::MACHINE_PCP,
    elf_t::MACHINE_NCPU,
    elf_t::MACHINE_NDR1,
    elf_t::MACHINE_STARCORE,
    elf_t::MACHINE_ME16,
    elf_t::MACHINE_ST100,
    elf_t::MACHINE_TINYJ,
    elf_t::MACHINE_X86_64,
    elf_t::MACHINE_PDSP,
    elf_t::MACHINE_PDP10,
    elf_t::MACHINE_PDP11,
    elf_t::MACHINE_FX66,
    elf_t::MACHINE_ST9PLUS,
    elf_t::MACHINE_ST7,
    elf_t::MACHINE_MC68HC16,
    elf_t::MACHINE_MC68HC11,
    elf_t::MACHINE_MC68HC08,
    elf_t::MACHINE_MC68HC05,
    elf_t::MACHINE_SVX,
    elf_t::MACHINE_ST19,
    elf_t::MACHINE_VAX,
    elf_t::MACHINE_CRIS,
    elf_t::MACHINE_JAVELIN,
    elf_t::MACHINE_FIREPATH,
    elf_t::MACHINE_ZSP,
    elf_t::MACHINE_MMIX,
    elf_t::MACHINE_HUANY,
    elf_t::MACHINE_PRISM,
    elf_t::MACHINE_AVR,
    elf_t::MACHINE_FR30,
    elf_t::MACHINE_D10V,
    elf_t::MACHINE_D30V,
    elf_t::MACHINE_V850,
    elf_t::MACHINE_M32R,
    elf_t::MACHINE_MN10300,
    elf_t::MACHINE_MN10200,
    elf_t::MACHINE_PICOJAVA,
    elf_t::MACHINE_OPENRISC,
    elf_t::MACHINE_ARC_COMPACT,
    elf_t::MACHINE_XTENSA,
    elf_t::MACHINE_VIDEOCORE,
    elf_t::MACHINE_TMM_GPP,
    elf_t::MACHINE_NS32K,
    elf_t::MACHINE_TPC,
    elf_t::MACHINE_SNP1K,
    elf_t::MACHINE_ST200,
    elf_t::MACHINE_IP2K,
    elf_t::MACHINE_MAX,
    elf_t::MACHINE_COMPACT_RISC,
    elf_t::MACHINE_F2MC16,
    elf_t::MACHINE_MSP430,
    elf_t::MACHINE_BLACKFIN,
    elf_t::MACHINE_SE_C33,
    elf_t::MACHINE_SEP,
    elf_t::MACHINE_ARCA,
    elf_t::MACHINE_UNICORE,
    elf_t::MACHINE_EXCESS,
    elf_t::MACHINE_DXP,
    elf_t::MACHINE_ALTERA_NIOS2,
    elf_t::MACHINE_CRX,
    elf_t::MACHINE_XGATE,
    elf_t::MACHINE_C166,
    elf_t::MACHINE_M16C,
    elf_t::MACHINE_DSPIC30F,
    elf_t::MACHINE_FREESCALE_CE,
    elf_t::MACHINE_M32C,
    elf_t::MACHINE_TSK3000,
    elf_t::MACHINE_RS08,
    elf_t::MACHINE_SHARC,
    elf_t::MACHINE_ECOG2,
    elf_t::MACHINE_SCORE7,
    elf_t::MACHINE_DSP24,
    elf_t::MACHINE_VIDEOCORE3,
    elf_t::MACHINE_LATTICEMICO32,
    elf_t::MACHINE_SE_C17,
    elf_t::MACHINE_TI_C6000,
    elf_t::MACHINE_TI_C2000,
    elf_t::MACHINE_TI_C5500,
    elf_t::MACHINE_TI_ARP32,
    elf_t::MACHINE_TI_PRU,
    elf_t::MACHINE_MMDSP_PLUS,
    elf_t::MACHINE_CYPRESS_M8C,
    elf_t::MACHINE_R32C,
    elf_t::MACHINE_TRIMEDIA,
    elf_t::MACHINE_QDSP6,
    elf_t::MACHINE_I8051,
    elf_t::MACHINE_STXP7X,
    elf_t::MACHINE_NDS32,
    elf_t::MACHINE_ECOG1X,
    elf_t::MACHINE_MAXQ30,
    elf_t::MACHINE_XIMO16,
    elf_t::MACHINE_MANIK,
    elf_t::MACHINE_CRAYNV2,
    elf_t::MACHINE_RX,
    elf_t::MACHINE_METAG,
    elf_t::MACHINE_MCST_ELBRUS,
    elf_t::MACHINE_ECOG16,
    elf_t::MACHINE_CR16,
    elf_t::MACHINE_ETPU,
    elf_t::MACHINE_SLE9X,
    elf_t::MACHINE_L10M,
    elf_t::MACHINE_K10M,
    elf_t::MACHINE_AARCH64,
    elf_t::MACHINE_AVR32,
    elf_t::MACHINE_STM8,
    elf_t::MACHINE_TILE64,
    elf_t::MACHINE_TILEPRO,
    elf_t::MACHINE_MICROBLAZE,
    elf_t::MACHINE_CUDA,
    elf_t::MACHINE_TILEGX,
    elf_t::MACHINE_CLOUDSHIELD,
    elf_t::MACHINE_COREA_1ST,
    elf_t::MACHINE_COREA_2ND,
    elf_t::MACHINE_ARCV2,
    elf_t::MACHINE_OPEN8,
    elf_t::MACHINE_RL78,
    elf_t::MACHINE_VIDEOCORE5,
    elf_t::MACHINE_RENESAS_78KOR,
    elf_t::MACHINE_FREESCALE_56800EX,
    elf_t::MACHINE_BA1,
    elf_t::MACHINE_BA2,
    elf_t::MACHINE_XCORE,
    elf_t::MACHINE_MCHP_PIC,
    elf_t::MACHINE_INTELGT,
    elf_t::MACHINE_INTEL206,
    elf_t::MACHINE_INTEL207,
    elf_t::MACHINE_INTEL208,
    elf_t::MACHINE_INTEL209,
    elf_t::MACHINE_KM32,
    elf_t::MACHINE_KMX32,
    elf_t::MACHINE_KMX16,
    elf_t::MACHINE_KMX8,
    elf_t::MACHINE_KVARC,
    elf_t::MACHINE_CDP,
    elf_t::MACHINE_COGE,
    elf_t::MACHINE_COOL,
    elf_t::MACHINE_NORC,
    elf_t::MACHINE_CSR_KALIMBA,
    elf_t::MACHINE_Z80,
    elf_t::MACHINE_VISIUM,
    elf_t::MACHINE_FT32,
    elf_t::MACHINE_MOXIE,
    elf_t::MACHINE_AMD_GPU,
    elf_t::MACHINE_RISCV,
    elf_t::MACHINE_LANAI,
    elf_t::MACHINE_CEVA,
    elf_t::MACHINE_CEVA_X2,
    elf_t::MACHINE_BPF,
    elf_t::MACHINE_GRAPHCORE_IPU,
    elf_t::MACHINE_IMG1,
    elf_t::MACHINE_NFP,
    elf_t::MACHINE_VE,
    elf_t::MACHINE_CSKY,
    elf_t::MACHINE_ARC_COMPACT3_64,
    elf_t::MACHINE_MCS6502,
    elf_t::MACHINE_ARC_COMPACT3,
    elf_t::MACHINE_KVX,
    elf_t::MACHINE_WDC65816,
    elf_t::MACHINE_LOONGARCH,
    elf_t::MACHINE_KF32,
    elf_t::MACHINE_U16_U8CORE,
    elf_t::MACHINE_TACHYUM,
    elf_t::MACHINE_NXP_56800EF,
    elf_t::MACHINE_AVR_OLD,
    elf_t::MACHINE_MSP430_OLD,
    elf_t::MACHINE_ADAPTEVA_EPIPHANY,
    elf_t::MACHINE_MT,
    elf_t::MACHINE_CYGNUS_FR30,
    elf_t::MACHINE_WEBASSEMBLY,
    elf_t::MACHINE_XC16X,
    elf_t::MACHINE_S12Z,
    elf_t::MACHINE_CYGNUS_FRV,
    elf_t::MACHINE_DLX,
    elf_t::MACHINE_CYGNUS_D10V,
    elf_t::MACHINE_CYGNUS_D30V,
    elf_t::MACHINE_IP2K_OLD,
    elf_t::MACHINE_CYGNUS_POWERPC,
    elf_t::MACHINE_ALPHA,
    elf_t::MACHINE_CYGNUS_M32R,
    elf_t::MACHINE_CYGNUS_V850,
    elf_t::MACHINE_S390_OLD,
    elf_t::MACHINE_XTENSA_OLD,
    elf_t::MACHINE_XSTORMY16,
    elf_t::MACHINE_MICROBLAZE_OLD,
    elf_t::MACHINE_CYGNUS_MN10300,
    elf_t::MACHINE_CYGNUS_MN10200,
    elf_t::MACHINE_CYGNUS_MEP,
    elf_t::MACHINE_M32C_OLD,
    elf_t::MACHINE_IQ2000,
    elf_t::MACHINE_NIOS32,
    elf_t::MACHINE_MOXIE_OLD,
};
bool elf_t::_is_defined_machine_t(elf_t::machine_t v) {
    return elf_t::_values_machine_t.find(v) != elf_t::_values_machine_t.end();
}
const std::set<elf_t::obj_type_t> elf_t::_values_obj_type_t{
    elf_t::OBJ_TYPE_NO_FILE_TYPE,
    elf_t::OBJ_TYPE_RELOCATABLE,
    elf_t::OBJ_TYPE_EXECUTABLE,
    elf_t::OBJ_TYPE_SHARED,
    elf_t::OBJ_TYPE_CORE,
};
bool elf_t::_is_defined_obj_type_t(elf_t::obj_type_t v) {
    return elf_t::_values_obj_type_t.find(v) != elf_t::_values_obj_type_t.end();
}
const std::set<elf_t::os_abi_t> elf_t::_values_os_abi_t{
    elf_t::OS_ABI_SYSTEM_V,
    elf_t::OS_ABI_HP_UX,
    elf_t::OS_ABI_NETBSD,
    elf_t::OS_ABI_GNU,
    elf_t::OS_ABI_SOLARIS,
    elf_t::OS_ABI_AIX,
    elf_t::OS_ABI_IRIX,
    elf_t::OS_ABI_FREEBSD,
    elf_t::OS_ABI_TRU64,
    elf_t::OS_ABI_MODESTO,
    elf_t::OS_ABI_OPENBSD,
    elf_t::OS_ABI_OPENVMS,
    elf_t::OS_ABI_NSK,
    elf_t::OS_ABI_AROS,
    elf_t::OS_ABI_FENIXOS,
    elf_t::OS_ABI_CLOUDABI,
    elf_t::OS_ABI_OPENVOS,
};
bool elf_t::_is_defined_os_abi_t(elf_t::os_abi_t v) {
    return elf_t::_values_os_abi_t.find(v) != elf_t::_values_os_abi_t.end();
}
const std::set<elf_t::ph_type_t> elf_t::_values_ph_type_t{
    elf_t::PH_TYPE_NULL_TYPE,
    elf_t::PH_TYPE_LOAD,
    elf_t::PH_TYPE_DYNAMIC,
    elf_t::PH_TYPE_INTERP,
    elf_t::PH_TYPE_NOTE,
    elf_t::PH_TYPE_SHLIB,
    elf_t::PH_TYPE_PHDR,
    elf_t::PH_TYPE_TLS,
    elf_t::PH_TYPE_GNU_EH_FRAME,
    elf_t::PH_TYPE_GNU_STACK,
    elf_t::PH_TYPE_GNU_RELRO,
    elf_t::PH_TYPE_GNU_PROPERTY,
    elf_t::PH_TYPE_PAX_FLAGS,
    elf_t::PH_TYPE_ARM_EXIDX,
};
bool elf_t::_is_defined_ph_type_t(elf_t::ph_type_t v) {
    return elf_t::_values_ph_type_t.find(v) != elf_t::_values_ph_type_t.end();
}
const std::set<elf_t::section_header_idx_special_t> elf_t::_values_section_header_idx_special_t{
    elf_t::SECTION_HEADER_IDX_SPECIAL_UNDEFINED,
    elf_t::SECTION_HEADER_IDX_SPECIAL_BEFORE,
    elf_t::SECTION_HEADER_IDX_SPECIAL_AFTER,
    elf_t::SECTION_HEADER_IDX_SPECIAL_AMD64_LCOMMON,
    elf_t::SECTION_HEADER_IDX_SPECIAL_SUNW_IGNORE,
    elf_t::SECTION_HEADER_IDX_SPECIAL_ABS,
    elf_t::SECTION_HEADER_IDX_SPECIAL_COMMON,
    elf_t::SECTION_HEADER_IDX_SPECIAL_XINDEX,
};
bool elf_t::_is_defined_section_header_idx_special_t(elf_t::section_header_idx_special_t v) {
    return elf_t::_values_section_header_idx_special_t.find(v) != elf_t::_values_section_header_idx_special_t.end();
}
const std::set<elf_t::sh_type_t> elf_t::_values_sh_type_t{
    elf_t::SH_TYPE_NULL_TYPE,
    elf_t::SH_TYPE_PROGBITS,
    elf_t::SH_TYPE_SYMTAB,
    elf_t::SH_TYPE_STRTAB,
    elf_t::SH_TYPE_RELA,
    elf_t::SH_TYPE_HASH,
    elf_t::SH_TYPE_DYNAMIC,
    elf_t::SH_TYPE_NOTE,
    elf_t::SH_TYPE_NOBITS,
    elf_t::SH_TYPE_REL,
    elf_t::SH_TYPE_SHLIB,
    elf_t::SH_TYPE_DYNSYM,
    elf_t::SH_TYPE_INIT_ARRAY,
    elf_t::SH_TYPE_FINI_ARRAY,
    elf_t::SH_TYPE_PREINIT_ARRAY,
    elf_t::SH_TYPE_GROUP,
    elf_t::SH_TYPE_SYMTAB_SHNDX,
    elf_t::SH_TYPE_RELR,
    elf_t::SH_TYPE_SUNW_SYMNSORT,
    elf_t::SH_TYPE_SUNW_PHNAME,
    elf_t::SH_TYPE_SUNW_ANCILLARY,
    elf_t::SH_TYPE_SUNW_CAPCHAIN,
    elf_t::SH_TYPE_SUNW_CAPINFO,
    elf_t::SH_TYPE_SUNW_SYMSORT,
    elf_t::SH_TYPE_SUNW_TLSSORT,
    elf_t::SH_TYPE_SUNW_LDYNSYM,
    elf_t::SH_TYPE_SUNW_DOF,
    elf_t::SH_TYPE_SUNW_CAP,
    elf_t::SH_TYPE_SUNW_SIGNATURE,
    elf_t::SH_TYPE_SUNW_ANNOTATE,
    elf_t::SH_TYPE_SUNW_DEBUGSTR,
    elf_t::SH_TYPE_SUNW_DEBUG,
    elf_t::SH_TYPE_SUNW_MOVE,
    elf_t::SH_TYPE_SUNW_COMDAT,
    elf_t::SH_TYPE_SUNW_SYMINFO,
    elf_t::SH_TYPE_SUNW_VERDEF,
    elf_t::SH_TYPE_SUNW_VERNEED,
    elf_t::SH_TYPE_SUNW_VERSYM,
    elf_t::SH_TYPE_SPARC_GOTDATA,
    elf_t::SH_TYPE_AMD64_UNWIND,
    elf_t::SH_TYPE_ARM_PREEMPTMAP,
    elf_t::SH_TYPE_ARM_ATTRIBUTES,
    elf_t::SH_TYPE_ARM_DEBUGOVERLAY,
    elf_t::SH_TYPE_ARM_OVERLAYSECTION,
};
bool elf_t::_is_defined_sh_type_t(elf_t::sh_type_t v) {
    return elf_t::_values_sh_type_t.find(v) != elf_t::_values_sh_type_t.end();
}
const std::set<elf_t::symbol_binding_t> elf_t::_values_symbol_binding_t{
    elf_t::SYMBOL_BINDING_LOCAL,
    elf_t::SYMBOL_BINDING_GLOBAL_SYMBOL,
    elf_t::SYMBOL_BINDING_WEAK,
    elf_t::SYMBOL_BINDING_OS10,
    elf_t::SYMBOL_BINDING_OS11,
    elf_t::SYMBOL_BINDING_OS12,
    elf_t::SYMBOL_BINDING_PROC13,
    elf_t::SYMBOL_BINDING_PROC14,
    elf_t::SYMBOL_BINDING_PROC15,
};
bool elf_t::_is_defined_symbol_binding_t(elf_t::symbol_binding_t v) {
    return elf_t::_values_symbol_binding_t.find(v) != elf_t::_values_symbol_binding_t.end();
}
const std::set<elf_t::symbol_type_t> elf_t::_values_symbol_type_t{
    elf_t::SYMBOL_TYPE_NO_TYPE,
    elf_t::SYMBOL_TYPE_OBJECT,
    elf_t::SYMBOL_TYPE_FUNC,
    elf_t::SYMBOL_TYPE_SECTION,
    elf_t::SYMBOL_TYPE_FILE,
    elf_t::SYMBOL_TYPE_COMMON,
    elf_t::SYMBOL_TYPE_TLS,
    elf_t::SYMBOL_TYPE_RELC,
    elf_t::SYMBOL_TYPE_SRELC,
    elf_t::SYMBOL_TYPE_GNU_IFUNC,
    elf_t::SYMBOL_TYPE_OS11,
    elf_t::SYMBOL_TYPE_OS12,
    elf_t::SYMBOL_TYPE_PROC13,
    elf_t::SYMBOL_TYPE_PROC14,
    elf_t::SYMBOL_TYPE_PROC15,
};
bool elf_t::_is_defined_symbol_type_t(elf_t::symbol_type_t v) {
    return elf_t::_values_symbol_type_t.find(v) != elf_t::_values_symbol_type_t.end();
}
const std::set<elf_t::symbol_visibility_t> elf_t::_values_symbol_visibility_t{
    elf_t::SYMBOL_VISIBILITY_DEFAULT,
    elf_t::SYMBOL_VISIBILITY_INTERNAL,
    elf_t::SYMBOL_VISIBILITY_HIDDEN,
    elf_t::SYMBOL_VISIBILITY_PROTECTED,
    elf_t::SYMBOL_VISIBILITY_EXPORTED,
    elf_t::SYMBOL_VISIBILITY_SINGLETON,
    elf_t::SYMBOL_VISIBILITY_ELIMINATE,
};
bool elf_t::_is_defined_symbol_visibility_t(elf_t::symbol_visibility_t v) {
    return elf_t::_values_symbol_visibility_t.find(v) != elf_t::_values_symbol_visibility_t.end();
}

elf_t::elf_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, elf_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root ? p__root : this;
    m_header = nullptr;
    f_sh_idx_hi_os = false;
    f_sh_idx_hi_proc = false;
    f_sh_idx_hi_reserved = false;
    f_sh_idx_lo_os = false;
    f_sh_idx_lo_proc = false;
    f_sh_idx_lo_reserved = false;
    _read();
}

void elf_t::_read() {
    m_magic = m__io->read_bytes(4);
    if (!(m_magic == std::string("\x7F\x45\x4C\x46", 4))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x7F\x45\x4C\x46", 4), m_magic, m__io, std::string("/seq/0"));
    }
    m_bits = static_cast<elf_t::bits_t>(m__io->read_u1());
    m_endian = static_cast<elf_t::endian_t>(m__io->read_u1());
    m_ei_version = m__io->read_u1();
    if (!(m_ei_version == 1)) {
        throw kaitai::validation_not_equal_error<uint8_t>(1, m_ei_version, m__io, std::string("/seq/3"));
    }
    m_abi = static_cast<elf_t::os_abi_t>(m__io->read_u1());
    m_abi_version = m__io->read_u1();
    m_pad = m__io->read_bytes(7);
    if (!(m_pad == std::string("\x00\x00\x00\x00\x00\x00\x00", 7))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x00\x00\x00\x00\x00\x00\x00", 7), m_pad, m__io, std::string("/seq/6"));
    }
    m_header = std::unique_ptr<endian_elf_t>(new endian_elf_t(m__io, this, m__root));
}

elf_t::~elf_t() {
    _clean_up();
}

void elf_t::_clean_up() {
}

elf_t::dt_flag_1_values_t::dt_flag_1_values_t(uint32_t p_value, kaitai::kstream* p__io, elf_t::endian_elf_t::dynamic_section_entry_t* p__parent, elf_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_value = p_value;
    f_confalt = false;
    f_direct = false;
    f_dispreldne = false;
    f_disprelpnd = false;
    f_edited = false;
    f_endfiltee = false;
    f_globaudit = false;
    f_group = false;
    f_ignmuldef = false;
    f_initfirst = false;
    f_interpose = false;
    f_loadfltr = false;
    f_nodeflib = false;
    f_nodelete = false;
    f_nodirect = false;
    f_nodump = false;
    f_nohdr = false;
    f_noksyms = false;
    f_noopen = false;
    f_noreloc = false;
    f_now = false;
    f_origin = false;
    f_pie = false;
    f_rtld_global = false;
    f_singleton = false;
    f_stub = false;
    f_symintpose = false;
    f_trans = false;
    _read();
}

void elf_t::dt_flag_1_values_t::_read() {
}

elf_t::dt_flag_1_values_t::~dt_flag_1_values_t() {
    _clean_up();
}

void elf_t::dt_flag_1_values_t::_clean_up() {
}

bool elf_t::dt_flag_1_values_t::confalt() {
    if (f_confalt)
        return m_confalt;
    f_confalt = true;
    m_confalt = (value() & 8192) != 0;
    return m_confalt;
}

bool elf_t::dt_flag_1_values_t::direct() {
    if (f_direct)
        return m_direct;
    f_direct = true;
    m_direct = (value() & 256) != 0;
    return m_direct;
}

bool elf_t::dt_flag_1_values_t::dispreldne() {
    if (f_dispreldne)
        return m_dispreldne;
    f_dispreldne = true;
    m_dispreldne = (value() & 32768) != 0;
    return m_dispreldne;
}

bool elf_t::dt_flag_1_values_t::disprelpnd() {
    if (f_disprelpnd)
        return m_disprelpnd;
    f_disprelpnd = true;
    m_disprelpnd = (value() & 65536) != 0;
    return m_disprelpnd;
}

bool elf_t::dt_flag_1_values_t::edited() {
    if (f_edited)
        return m_edited;
    f_edited = true;
    m_edited = (value() & 2097152) != 0;
    return m_edited;
}

bool elf_t::dt_flag_1_values_t::endfiltee() {
    if (f_endfiltee)
        return m_endfiltee;
    f_endfiltee = true;
    m_endfiltee = (value() & 16384) != 0;
    return m_endfiltee;
}

bool elf_t::dt_flag_1_values_t::globaudit() {
    if (f_globaudit)
        return m_globaudit;
    f_globaudit = true;
    m_globaudit = (value() & 16777216) != 0;
    return m_globaudit;
}

bool elf_t::dt_flag_1_values_t::group() {
    if (f_group)
        return m_group;
    f_group = true;
    m_group = (value() & 4) != 0;
    return m_group;
}

bool elf_t::dt_flag_1_values_t::ignmuldef() {
    if (f_ignmuldef)
        return m_ignmuldef;
    f_ignmuldef = true;
    m_ignmuldef = (value() & 262144) != 0;
    return m_ignmuldef;
}

bool elf_t::dt_flag_1_values_t::initfirst() {
    if (f_initfirst)
        return m_initfirst;
    f_initfirst = true;
    m_initfirst = (value() & 32) != 0;
    return m_initfirst;
}

bool elf_t::dt_flag_1_values_t::interpose() {
    if (f_interpose)
        return m_interpose;
    f_interpose = true;
    m_interpose = (value() & 1024) != 0;
    return m_interpose;
}

bool elf_t::dt_flag_1_values_t::loadfltr() {
    if (f_loadfltr)
        return m_loadfltr;
    f_loadfltr = true;
    m_loadfltr = (value() & 16) != 0;
    return m_loadfltr;
}

bool elf_t::dt_flag_1_values_t::nodeflib() {
    if (f_nodeflib)
        return m_nodeflib;
    f_nodeflib = true;
    m_nodeflib = (value() & 2048) != 0;
    return m_nodeflib;
}

bool elf_t::dt_flag_1_values_t::nodelete() {
    if (f_nodelete)
        return m_nodelete;
    f_nodelete = true;
    m_nodelete = (value() & 8) != 0;
    return m_nodelete;
}

bool elf_t::dt_flag_1_values_t::nodirect() {
    if (f_nodirect)
        return m_nodirect;
    f_nodirect = true;
    m_nodirect = (value() & 131072) != 0;
    return m_nodirect;
}

bool elf_t::dt_flag_1_values_t::nodump() {
    if (f_nodump)
        return m_nodump;
    f_nodump = true;
    m_nodump = (value() & 4096) != 0;
    return m_nodump;
}

bool elf_t::dt_flag_1_values_t::nohdr() {
    if (f_nohdr)
        return m_nohdr;
    f_nohdr = true;
    m_nohdr = (value() & 1048576) != 0;
    return m_nohdr;
}

bool elf_t::dt_flag_1_values_t::noksyms() {
    if (f_noksyms)
        return m_noksyms;
    f_noksyms = true;
    m_noksyms = (value() & 524288) != 0;
    return m_noksyms;
}

bool elf_t::dt_flag_1_values_t::noopen() {
    if (f_noopen)
        return m_noopen;
    f_noopen = true;
    m_noopen = (value() & 64) != 0;
    return m_noopen;
}

bool elf_t::dt_flag_1_values_t::noreloc() {
    if (f_noreloc)
        return m_noreloc;
    f_noreloc = true;
    m_noreloc = (value() & 4194304) != 0;
    return m_noreloc;
}

bool elf_t::dt_flag_1_values_t::now() {
    if (f_now)
        return m_now;
    f_now = true;
    m_now = (value() & 1) != 0;
    return m_now;
}

bool elf_t::dt_flag_1_values_t::origin() {
    if (f_origin)
        return m_origin;
    f_origin = true;
    m_origin = (value() & 128) != 0;
    return m_origin;
}

bool elf_t::dt_flag_1_values_t::pie() {
    if (f_pie)
        return m_pie;
    f_pie = true;
    m_pie = (value() & 134217728) != 0;
    return m_pie;
}

bool elf_t::dt_flag_1_values_t::rtld_global() {
    if (f_rtld_global)
        return m_rtld_global;
    f_rtld_global = true;
    m_rtld_global = (value() & 2) != 0;
    return m_rtld_global;
}

bool elf_t::dt_flag_1_values_t::singleton() {
    if (f_singleton)
        return m_singleton;
    f_singleton = true;
    m_singleton = (value() & 33554432) != 0;
    return m_singleton;
}

bool elf_t::dt_flag_1_values_t::stub() {
    if (f_stub)
        return m_stub;
    f_stub = true;
    m_stub = (value() & 67108864) != 0;
    return m_stub;
}

bool elf_t::dt_flag_1_values_t::symintpose() {
    if (f_symintpose)
        return m_symintpose;
    f_symintpose = true;
    m_symintpose = (value() & 8388608) != 0;
    return m_symintpose;
}

bool elf_t::dt_flag_1_values_t::trans() {
    if (f_trans)
        return m_trans;
    f_trans = true;
    m_trans = (value() & 512) != 0;
    return m_trans;
}

elf_t::dt_flag_values_t::dt_flag_values_t(uint32_t p_value, kaitai::kstream* p__io, elf_t::endian_elf_t::dynamic_section_entry_t* p__parent, elf_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_value = p_value;
    f_bind_now = false;
    f_origin = false;
    f_static_tls = false;
    f_symbolic = false;
    f_textrel = false;
    _read();
}

void elf_t::dt_flag_values_t::_read() {
}

elf_t::dt_flag_values_t::~dt_flag_values_t() {
    _clean_up();
}

void elf_t::dt_flag_values_t::_clean_up() {
}

bool elf_t::dt_flag_values_t::bind_now() {
    if (f_bind_now)
        return m_bind_now;
    f_bind_now = true;
    m_bind_now = (value() & 8) != 0;
    return m_bind_now;
}

bool elf_t::dt_flag_values_t::origin() {
    if (f_origin)
        return m_origin;
    f_origin = true;
    m_origin = (value() & 1) != 0;
    return m_origin;
}

bool elf_t::dt_flag_values_t::static_tls() {
    if (f_static_tls)
        return m_static_tls;
    f_static_tls = true;
    m_static_tls = (value() & 16) != 0;
    return m_static_tls;
}

bool elf_t::dt_flag_values_t::symbolic() {
    if (f_symbolic)
        return m_symbolic;
    f_symbolic = true;
    m_symbolic = (value() & 2) != 0;
    return m_symbolic;
}

bool elf_t::dt_flag_values_t::textrel() {
    if (f_textrel)
        return m_textrel;
    f_textrel = true;
    m_textrel = (value() & 4) != 0;
    return m_textrel;
}

elf_t::endian_elf_t::endian_elf_t(kaitai::kstream* p__io, elf_t* p__parent, elf_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m__is_le = -1;
    m_program_headers = nullptr;
    m__raw_program_headers = nullptr;
    m__io__raw_program_headers = nullptr;
    m_section_headers = nullptr;
    m__raw_section_headers = nullptr;
    m__io__raw_section_headers = nullptr;
    m_section_names = nullptr;
    m__io__raw_section_names = nullptr;
    f_program_headers = false;
    f_section_headers = false;
    f_section_names = false;
    _read();
}

void elf_t::endian_elf_t::_read() {
    switch (_root()->endian()) {
    case elf_t::ENDIAN_LE: {
        m__is_le = true;
        break;
    }
    case elf_t::ENDIAN_BE: {
        m__is_le = false;
        break;
    }
    }

    if (m__is_le == -1) {
        throw kaitai::undecided_endianness_error("/types/endian_elf");
    } else if (m__is_le == 1) {
        _read_le();
    } else {
        _read_be();
    }
}

void elf_t::endian_elf_t::_read_le() {
    m_e_type = static_cast<elf_t::obj_type_t>(m__io->read_u2le());
    m_machine = static_cast<elf_t::machine_t>(m__io->read_u2le());
    m_e_version = m__io->read_u4le();
    n_entry_point = true;
    switch (_root()->bits()) {
    case elf_t::BITS_B32: {
        n_entry_point = false;
        m_entry_point = m__io->read_u4le();
        break;
    }
    case elf_t::BITS_B64: {
        n_entry_point = false;
        m_entry_point = m__io->read_u8le();
        break;
    }
    }
    n_ofs_program_headers = true;
    switch (_root()->bits()) {
    case elf_t::BITS_B32: {
        n_ofs_program_headers = false;
        m_ofs_program_headers = m__io->read_u4le();
        break;
    }
    case elf_t::BITS_B64: {
        n_ofs_program_headers = false;
        m_ofs_program_headers = m__io->read_u8le();
        break;
    }
    }
    n_ofs_section_headers = true;
    switch (_root()->bits()) {
    case elf_t::BITS_B32: {
        n_ofs_section_headers = false;
        m_ofs_section_headers = m__io->read_u4le();
        break;
    }
    case elf_t::BITS_B64: {
        n_ofs_section_headers = false;
        m_ofs_section_headers = m__io->read_u8le();
        break;
    }
    }
    m_flags = m__io->read_bytes(4);
    m_e_ehsize = m__io->read_u2le();
    m_program_header_size = m__io->read_u2le();
    m_num_program_headers = m__io->read_u2le();
    m_section_header_size = m__io->read_u2le();
    m_num_section_headers = m__io->read_u2le();
    m_section_names_idx = m__io->read_u2le();
}

void elf_t::endian_elf_t::_read_be() {
    m_e_type = static_cast<elf_t::obj_type_t>(m__io->read_u2be());
    m_machine = static_cast<elf_t::machine_t>(m__io->read_u2be());
    m_e_version = m__io->read_u4be();
    n_entry_point = true;
    switch (_root()->bits()) {
    case elf_t::BITS_B32: {
        n_entry_point = false;
        m_entry_point = m__io->read_u4be();
        break;
    }
    case elf_t::BITS_B64: {
        n_entry_point = false;
        m_entry_point = m__io->read_u8be();
        break;
    }
    }
    n_ofs_program_headers = true;
    switch (_root()->bits()) {
    case elf_t::BITS_B32: {
        n_ofs_program_headers = false;
        m_ofs_program_headers = m__io->read_u4be();
        break;
    }
    case elf_t::BITS_B64: {
        n_ofs_program_headers = false;
        m_ofs_program_headers = m__io->read_u8be();
        break;
    }
    }
    n_ofs_section_headers = true;
    switch (_root()->bits()) {
    case elf_t::BITS_B32: {
        n_ofs_section_headers = false;
        m_ofs_section_headers = m__io->read_u4be();
        break;
    }
    case elf_t::BITS_B64: {
        n_ofs_section_headers = false;
        m_ofs_section_headers = m__io->read_u8be();
        break;
    }
    }
    m_flags = m__io->read_bytes(4);
    m_e_ehsize = m__io->read_u2be();
    m_program_header_size = m__io->read_u2be();
    m_num_program_headers = m__io->read_u2be();
    m_section_header_size = m__io->read_u2be();
    m_num_section_headers = m__io->read_u2be();
    m_section_names_idx = m__io->read_u2be();
}

elf_t::endian_elf_t::~endian_elf_t() {
    _clean_up();
}

void elf_t::endian_elf_t::_clean_up() {
    if (!n_entry_point) {
    }
    if (!n_ofs_program_headers) {
    }
    if (!n_ofs_section_headers) {
    }
    if (f_program_headers) {
    }
    if (f_section_headers) {
    }
    if (f_section_names && !n_section_names) {
    }
}

elf_t::endian_elf_t::dynamic_section_t::dynamic_section_t(kaitai::kstream* p__io, elf_t::endian_elf_t::section_header_t* p__parent, elf_t* p__root, int p_is_le) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m__is_le = p_is_le;
    m_entries = nullptr;
    f_is_string_table_linked = false;
    _read();
}

void elf_t::endian_elf_t::dynamic_section_t::_read() {

    if (m__is_le == -1) {
        throw kaitai::undecided_endianness_error("/types/endian_elf/types/dynamic_section");
    } else if (m__is_le == 1) {
        _read_le();
    } else {
        _read_be();
    }
}

void elf_t::endian_elf_t::dynamic_section_t::_read_le() {
    m_entries = std::unique_ptr<std::vector<std::unique_ptr<dynamic_section_entry_t>>>(new std::vector<std::unique_ptr<dynamic_section_entry_t>>());
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_entries->push_back(std::move(std::unique_ptr<dynamic_section_entry_t>(new dynamic_section_entry_t(m__io, this, m__root, m__is_le))));
            i++;
        }
    }
}

void elf_t::endian_elf_t::dynamic_section_t::_read_be() {
    m_entries = std::unique_ptr<std::vector<std::unique_ptr<dynamic_section_entry_t>>>(new std::vector<std::unique_ptr<dynamic_section_entry_t>>());
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_entries->push_back(std::move(std::unique_ptr<dynamic_section_entry_t>(new dynamic_section_entry_t(m__io, this, m__root, m__is_le))));
            i++;
        }
    }
}

elf_t::endian_elf_t::dynamic_section_t::~dynamic_section_t() {
    _clean_up();
}

void elf_t::endian_elf_t::dynamic_section_t::_clean_up() {
}

bool elf_t::endian_elf_t::dynamic_section_t::is_string_table_linked() {
    if (f_is_string_table_linked)
        return m_is_string_table_linked;
    f_is_string_table_linked = true;
    m_is_string_table_linked = _parent()->linked_section()->type() == elf_t::SH_TYPE_STRTAB;
    return m_is_string_table_linked;
}

elf_t::endian_elf_t::dynamic_section_entry_t::dynamic_section_entry_t(kaitai::kstream* p__io, elf_t::endian_elf_t::dynamic_section_t* p__parent, elf_t* p__root, int p_is_le) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m__is_le = p_is_le;
    m_flag_1_values = nullptr;
    m_flag_values = nullptr;
    f_flag_1_values = false;
    f_flag_values = false;
    f_is_value_str = false;
    f_tag_enum = false;
    f_value_str = false;
    _read();
}

void elf_t::endian_elf_t::dynamic_section_entry_t::_read() {

    if (m__is_le == -1) {
        throw kaitai::undecided_endianness_error("/types/endian_elf/types/dynamic_section_entry");
    } else if (m__is_le == 1) {
        _read_le();
    } else {
        _read_be();
    }
}

void elf_t::endian_elf_t::dynamic_section_entry_t::_read_le() {
    n_tag = true;
    switch (_root()->bits()) {
    case elf_t::BITS_B32: {
        n_tag = false;
        m_tag = m__io->read_u4le();
        break;
    }
    case elf_t::BITS_B64: {
        n_tag = false;
        m_tag = m__io->read_u8le();
        break;
    }
    }
    n_value_or_ptr = true;
    switch (_root()->bits()) {
    case elf_t::BITS_B32: {
        n_value_or_ptr = false;
        m_value_or_ptr = m__io->read_u4le();
        break;
    }
    case elf_t::BITS_B64: {
        n_value_or_ptr = false;
        m_value_or_ptr = m__io->read_u8le();
        break;
    }
    }
}

void elf_t::endian_elf_t::dynamic_section_entry_t::_read_be() {
    n_tag = true;
    switch (_root()->bits()) {
    case elf_t::BITS_B32: {
        n_tag = false;
        m_tag = m__io->read_u4be();
        break;
    }
    case elf_t::BITS_B64: {
        n_tag = false;
        m_tag = m__io->read_u8be();
        break;
    }
    }
    n_value_or_ptr = true;
    switch (_root()->bits()) {
    case elf_t::BITS_B32: {
        n_value_or_ptr = false;
        m_value_or_ptr = m__io->read_u4be();
        break;
    }
    case elf_t::BITS_B64: {
        n_value_or_ptr = false;
        m_value_or_ptr = m__io->read_u8be();
        break;
    }
    }
}

elf_t::endian_elf_t::dynamic_section_entry_t::~dynamic_section_entry_t() {
    _clean_up();
}

void elf_t::endian_elf_t::dynamic_section_entry_t::_clean_up() {
    if (!n_tag) {
    }
    if (!n_value_or_ptr) {
    }
    if (f_flag_1_values && !n_flag_1_values) {
    }
    if (f_flag_values && !n_flag_values) {
    }
    if (f_value_str && !n_value_str) {
    }
}

elf_t::dt_flag_1_values_t* elf_t::endian_elf_t::dynamic_section_entry_t::flag_1_values() {
    if (f_flag_1_values)
        return m_flag_1_values.get();
    f_flag_1_values = true;
    n_flag_1_values = true;
    if (tag_enum() == elf_t::DYNAMIC_ARRAY_TAGS_FLAGS_1) {
        n_flag_1_values = false;
        if (m__is_le == 1) {
            m_flag_1_values = std::unique_ptr<dt_flag_1_values_t>(new dt_flag_1_values_t(value_or_ptr(), m__io, this, m__root));
        } else {
            m_flag_1_values = std::unique_ptr<dt_flag_1_values_t>(new dt_flag_1_values_t(value_or_ptr(), m__io, this, m__root));
        }
    }
    return m_flag_1_values.get();
}

elf_t::dt_flag_values_t* elf_t::endian_elf_t::dynamic_section_entry_t::flag_values() {
    if (f_flag_values)
        return m_flag_values.get();
    f_flag_values = true;
    n_flag_values = true;
    if (tag_enum() == elf_t::DYNAMIC_ARRAY_TAGS_FLAGS) {
        n_flag_values = false;
        if (m__is_le == 1) {
            m_flag_values = std::unique_ptr<dt_flag_values_t>(new dt_flag_values_t(value_or_ptr(), m__io, this, m__root));
        } else {
            m_flag_values = std::unique_ptr<dt_flag_values_t>(new dt_flag_values_t(value_or_ptr(), m__io, this, m__root));
        }
    }
    return m_flag_values.get();
}

bool elf_t::endian_elf_t::dynamic_section_entry_t::is_value_str() {
    if (f_is_value_str)
        return m_is_value_str;
    f_is_value_str = true;
    m_is_value_str =  ((value_or_ptr() != 0) && ( ((tag_enum() == elf_t::DYNAMIC_ARRAY_TAGS_NEEDED) || (tag_enum() == elf_t::DYNAMIC_ARRAY_TAGS_SONAME) || (tag_enum() == elf_t::DYNAMIC_ARRAY_TAGS_RPATH) || (tag_enum() == elf_t::DYNAMIC_ARRAY_TAGS_RUNPATH) || (tag_enum() == elf_t::DYNAMIC_ARRAY_TAGS_SUNW_AUXILIARY) || (tag_enum() == elf_t::DYNAMIC_ARRAY_TAGS_SUNW_FILTER) || (tag_enum() == elf_t::DYNAMIC_ARRAY_TAGS_AUXILIARY) || (tag_enum() == elf_t::DYNAMIC_ARRAY_TAGS_FILTER) || (tag_enum() == elf_t::DYNAMIC_ARRAY_TAGS_CONFIG) || (tag_enum() == elf_t::DYNAMIC_ARRAY_TAGS_DEPAUDIT) || (tag_enum() == elf_t::DYNAMIC_ARRAY_TAGS_AUDIT)) )) ;
    return m_is_value_str;
}

elf_t::dynamic_array_tags_t elf_t::endian_elf_t::dynamic_section_entry_t::tag_enum() {
    if (f_tag_enum)
        return m_tag_enum;
    f_tag_enum = true;
    m_tag_enum = static_cast<elf_t::dynamic_array_tags_t>(tag());
    return m_tag_enum;
}

std::string elf_t::endian_elf_t::dynamic_section_entry_t::value_str() {
    if (f_value_str)
        return m_value_str;
    f_value_str = true;
    n_value_str = true;
    if ( ((is_value_str()) && (_parent()->is_string_table_linked())) ) {
        n_value_str = false;
        kaitai::kstream *io = static_cast<elf_t::endian_elf_t::strings_struct_t*>(_parent()->_parent()->linked_section()->body())->_io();
        std::streampos _pos = io->pos();
        io->seek(value_or_ptr());
        if (m__is_le == 1) {
            m_value_str = kaitai::kstream::bytes_to_str(io->read_bytes_term(0, false, true, true), "ASCII");
        } else {
            m_value_str = kaitai::kstream::bytes_to_str(io->read_bytes_term(0, false, true, true), "ASCII");
        }
        io->seek(_pos);
    }
    return m_value_str;
}

elf_t::endian_elf_t::dynsym_section_t::dynsym_section_t(kaitai::kstream* p__io, elf_t::endian_elf_t::section_header_t* p__parent, elf_t* p__root, int p_is_le) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m__is_le = p_is_le;
    m_entries = nullptr;
    f_is_string_table_linked = false;
    _read();
}

void elf_t::endian_elf_t::dynsym_section_t::_read() {

    if (m__is_le == -1) {
        throw kaitai::undecided_endianness_error("/types/endian_elf/types/dynsym_section");
    } else if (m__is_le == 1) {
        _read_le();
    } else {
        _read_be();
    }
}

void elf_t::endian_elf_t::dynsym_section_t::_read_le() {
    m_entries = std::unique_ptr<std::vector<std::unique_ptr<dynsym_section_entry_t>>>(new std::vector<std::unique_ptr<dynsym_section_entry_t>>());
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_entries->push_back(std::move(std::unique_ptr<dynsym_section_entry_t>(new dynsym_section_entry_t(m__io, this, m__root, m__is_le))));
            i++;
        }
    }
}

void elf_t::endian_elf_t::dynsym_section_t::_read_be() {
    m_entries = std::unique_ptr<std::vector<std::unique_ptr<dynsym_section_entry_t>>>(new std::vector<std::unique_ptr<dynsym_section_entry_t>>());
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_entries->push_back(std::move(std::unique_ptr<dynsym_section_entry_t>(new dynsym_section_entry_t(m__io, this, m__root, m__is_le))));
            i++;
        }
    }
}

elf_t::endian_elf_t::dynsym_section_t::~dynsym_section_t() {
    _clean_up();
}

void elf_t::endian_elf_t::dynsym_section_t::_clean_up() {
}

bool elf_t::endian_elf_t::dynsym_section_t::is_string_table_linked() {
    if (f_is_string_table_linked)
        return m_is_string_table_linked;
    f_is_string_table_linked = true;
    m_is_string_table_linked = _parent()->linked_section()->type() == elf_t::SH_TYPE_STRTAB;
    return m_is_string_table_linked;
}

elf_t::endian_elf_t::dynsym_section_entry_t::dynsym_section_entry_t(kaitai::kstream* p__io, elf_t::endian_elf_t::dynsym_section_t* p__parent, elf_t* p__root, int p_is_le) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m__is_le = p_is_le;
    f_is_sh_idx_os = false;
    f_is_sh_idx_proc = false;
    f_is_sh_idx_reserved = false;
    f_name = false;
    f_sh_idx_special = false;
    f_size = false;
    f_value = false;
    f_visibility = false;
    _read();
}

void elf_t::endian_elf_t::dynsym_section_entry_t::_read() {

    if (m__is_le == -1) {
        throw kaitai::undecided_endianness_error("/types/endian_elf/types/dynsym_section_entry");
    } else if (m__is_le == 1) {
        _read_le();
    } else {
        _read_be();
    }
}

void elf_t::endian_elf_t::dynsym_section_entry_t::_read_le() {
    m_ofs_name = m__io->read_u4le();
    n_value_b32 = true;
    if (_root()->bits() == elf_t::BITS_B32) {
        n_value_b32 = false;
        m_value_b32 = m__io->read_u4le();
    }
    n_size_b32 = true;
    if (_root()->bits() == elf_t::BITS_B32) {
        n_size_b32 = false;
        m_size_b32 = m__io->read_u4le();
    }
    m_bind = static_cast<elf_t::symbol_binding_t>(m__io->read_bits_int_be(4));
    m_type = static_cast<elf_t::symbol_type_t>(m__io->read_bits_int_be(4));
    m__io->align_to_byte();
    m_other = m__io->read_u1();
    m_sh_idx = m__io->read_u2le();
    n_value_b64 = true;
    if (_root()->bits() == elf_t::BITS_B64) {
        n_value_b64 = false;
        m_value_b64 = m__io->read_u8le();
    }
    n_size_b64 = true;
    if (_root()->bits() == elf_t::BITS_B64) {
        n_size_b64 = false;
        m_size_b64 = m__io->read_u8le();
    }
}

void elf_t::endian_elf_t::dynsym_section_entry_t::_read_be() {
    m_ofs_name = m__io->read_u4be();
    n_value_b32 = true;
    if (_root()->bits() == elf_t::BITS_B32) {
        n_value_b32 = false;
        m_value_b32 = m__io->read_u4be();
    }
    n_size_b32 = true;
    if (_root()->bits() == elf_t::BITS_B32) {
        n_size_b32 = false;
        m_size_b32 = m__io->read_u4be();
    }
    m_bind = static_cast<elf_t::symbol_binding_t>(m__io->read_bits_int_be(4));
    m_type = static_cast<elf_t::symbol_type_t>(m__io->read_bits_int_be(4));
    m__io->align_to_byte();
    m_other = m__io->read_u1();
    m_sh_idx = m__io->read_u2be();
    n_value_b64 = true;
    if (_root()->bits() == elf_t::BITS_B64) {
        n_value_b64 = false;
        m_value_b64 = m__io->read_u8be();
    }
    n_size_b64 = true;
    if (_root()->bits() == elf_t::BITS_B64) {
        n_size_b64 = false;
        m_size_b64 = m__io->read_u8be();
    }
}

elf_t::endian_elf_t::dynsym_section_entry_t::~dynsym_section_entry_t() {
    _clean_up();
}

void elf_t::endian_elf_t::dynsym_section_entry_t::_clean_up() {
    if (!n_value_b32) {
    }
    if (!n_size_b32) {
    }
    if (!n_value_b64) {
    }
    if (!n_size_b64) {
    }
    if (f_name && !n_name) {
    }
}

bool elf_t::endian_elf_t::dynsym_section_entry_t::is_sh_idx_os() {
    if (f_is_sh_idx_os)
        return m_is_sh_idx_os;
    f_is_sh_idx_os = true;
    m_is_sh_idx_os =  ((sh_idx() >= _root()->sh_idx_lo_os()) && (sh_idx() <= _root()->sh_idx_hi_os())) ;
    return m_is_sh_idx_os;
}

bool elf_t::endian_elf_t::dynsym_section_entry_t::is_sh_idx_proc() {
    if (f_is_sh_idx_proc)
        return m_is_sh_idx_proc;
    f_is_sh_idx_proc = true;
    m_is_sh_idx_proc =  ((sh_idx() >= _root()->sh_idx_lo_proc()) && (sh_idx() <= _root()->sh_idx_hi_proc())) ;
    return m_is_sh_idx_proc;
}

bool elf_t::endian_elf_t::dynsym_section_entry_t::is_sh_idx_reserved() {
    if (f_is_sh_idx_reserved)
        return m_is_sh_idx_reserved;
    f_is_sh_idx_reserved = true;
    m_is_sh_idx_reserved =  ((sh_idx() >= _root()->sh_idx_lo_reserved()) && (sh_idx() <= _root()->sh_idx_hi_reserved())) ;
    return m_is_sh_idx_reserved;
}

std::string elf_t::endian_elf_t::dynsym_section_entry_t::name() {
    if (f_name)
        return m_name;
    f_name = true;
    n_name = true;
    if ( ((ofs_name() != 0) && (_parent()->is_string_table_linked())) ) {
        n_name = false;
        kaitai::kstream *io = static_cast<elf_t::endian_elf_t::strings_struct_t*>(_parent()->_parent()->linked_section()->body())->_io();
        std::streampos _pos = io->pos();
        io->seek(ofs_name());
        if (m__is_le == 1) {
            m_name = kaitai::kstream::bytes_to_str(io->read_bytes_term(0, false, true, true), "UTF-8");
        } else {
            m_name = kaitai::kstream::bytes_to_str(io->read_bytes_term(0, false, true, true), "UTF-8");
        }
        io->seek(_pos);
    }
    return m_name;
}

elf_t::section_header_idx_special_t elf_t::endian_elf_t::dynsym_section_entry_t::sh_idx_special() {
    if (f_sh_idx_special)
        return m_sh_idx_special;
    f_sh_idx_special = true;
    m_sh_idx_special = static_cast<elf_t::section_header_idx_special_t>(sh_idx());
    return m_sh_idx_special;
}

uint64_t elf_t::endian_elf_t::dynsym_section_entry_t::size() {
    if (f_size)
        return m_size;
    f_size = true;
    m_size = ((_root()->bits() == elf_t::BITS_B32) ? (size_b32()) : (((_root()->bits() == elf_t::BITS_B64) ? (size_b64()) : (0))));
    return m_size;
}

uint64_t elf_t::endian_elf_t::dynsym_section_entry_t::value() {
    if (f_value)
        return m_value;
    f_value = true;
    m_value = ((_root()->bits() == elf_t::BITS_B32) ? (value_b32()) : (((_root()->bits() == elf_t::BITS_B64) ? (value_b64()) : (0))));
    return m_value;
}

elf_t::symbol_visibility_t elf_t::endian_elf_t::dynsym_section_entry_t::visibility() {
    if (f_visibility)
        return m_visibility;
    f_visibility = true;
    m_visibility = static_cast<elf_t::symbol_visibility_t>(other() & 3);
    return m_visibility;
}

elf_t::endian_elf_t::note_section_t::note_section_t(kaitai::kstream* p__io, elf_t::endian_elf_t::section_header_t* p__parent, elf_t* p__root, int p_is_le) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m__is_le = p_is_le;
    m_entries = nullptr;
    _read();
}

void elf_t::endian_elf_t::note_section_t::_read() {

    if (m__is_le == -1) {
        throw kaitai::undecided_endianness_error("/types/endian_elf/types/note_section");
    } else if (m__is_le == 1) {
        _read_le();
    } else {
        _read_be();
    }
}

void elf_t::endian_elf_t::note_section_t::_read_le() {
    m_entries = std::unique_ptr<std::vector<std::unique_ptr<note_section_entry_t>>>(new std::vector<std::unique_ptr<note_section_entry_t>>());
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_entries->push_back(std::move(std::unique_ptr<note_section_entry_t>(new note_section_entry_t(m__io, this, m__root, m__is_le))));
            i++;
        }
    }
}

void elf_t::endian_elf_t::note_section_t::_read_be() {
    m_entries = std::unique_ptr<std::vector<std::unique_ptr<note_section_entry_t>>>(new std::vector<std::unique_ptr<note_section_entry_t>>());
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_entries->push_back(std::move(std::unique_ptr<note_section_entry_t>(new note_section_entry_t(m__io, this, m__root, m__is_le))));
            i++;
        }
    }
}

elf_t::endian_elf_t::note_section_t::~note_section_t() {
    _clean_up();
}

void elf_t::endian_elf_t::note_section_t::_clean_up() {
}

elf_t::endian_elf_t::note_section_entry_t::note_section_entry_t(kaitai::kstream* p__io, elf_t::endian_elf_t::note_section_t* p__parent, elf_t* p__root, int p_is_le) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m__is_le = p_is_le;
    _read();
}

void elf_t::endian_elf_t::note_section_entry_t::_read() {

    if (m__is_le == -1) {
        throw kaitai::undecided_endianness_error("/types/endian_elf/types/note_section_entry");
    } else if (m__is_le == 1) {
        _read_le();
    } else {
        _read_be();
    }
}

void elf_t::endian_elf_t::note_section_entry_t::_read_le() {
    m_len_name = m__io->read_u4le();
    m_len_descriptor = m__io->read_u4le();
    m_type = m__io->read_u4le();
    m_name = kaitai::kstream::bytes_terminate(m__io->read_bytes(len_name()), 0, false);
    m_name_padding = m__io->read_bytes(kaitai::kstream::mod(-(len_name()), 4));
    m_descriptor = m__io->read_bytes(len_descriptor());
    m_descriptor_padding = m__io->read_bytes(kaitai::kstream::mod(-(len_descriptor()), 4));
}

void elf_t::endian_elf_t::note_section_entry_t::_read_be() {
    m_len_name = m__io->read_u4be();
    m_len_descriptor = m__io->read_u4be();
    m_type = m__io->read_u4be();
    m_name = kaitai::kstream::bytes_terminate(m__io->read_bytes(len_name()), 0, false);
    m_name_padding = m__io->read_bytes(kaitai::kstream::mod(-(len_name()), 4));
    m_descriptor = m__io->read_bytes(len_descriptor());
    m_descriptor_padding = m__io->read_bytes(kaitai::kstream::mod(-(len_descriptor()), 4));
}

elf_t::endian_elf_t::note_section_entry_t::~note_section_entry_t() {
    _clean_up();
}

void elf_t::endian_elf_t::note_section_entry_t::_clean_up() {
}

elf_t::endian_elf_t::program_header_t::program_header_t(kaitai::kstream* p__io, elf_t::endian_elf_t* p__parent, elf_t* p__root, int p_is_le) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m__is_le = p_is_le;
    f_flags_obj = false;
    _read();
}

void elf_t::endian_elf_t::program_header_t::_read() {

    if (m__is_le == -1) {
        throw kaitai::undecided_endianness_error("/types/endian_elf/types/program_header");
    } else if (m__is_le == 1) {
        _read_le();
    } else {
        _read_be();
    }
}

void elf_t::endian_elf_t::program_header_t::_read_le() {
    m_type = static_cast<elf_t::ph_type_t>(m__io->read_u4le());
    n_flags64 = true;
    if (_root()->bits() == elf_t::BITS_B64) {
        n_flags64 = false;
        m_flags64 = m__io->read_u4le();
    }
    n_offset = true;
    switch (_root()->bits()) {
    case elf_t::BITS_B32: {
        n_offset = false;
        m_offset = m__io->read_u4le();
        break;
    }
    case elf_t::BITS_B64: {
        n_offset = false;
        m_offset = m__io->read_u8le();
        break;
    }
    }
    n_vaddr = true;
    switch (_root()->bits()) {
    case elf_t::BITS_B32: {
        n_vaddr = false;
        m_vaddr = m__io->read_u4le();
        break;
    }
    case elf_t::BITS_B64: {
        n_vaddr = false;
        m_vaddr = m__io->read_u8le();
        break;
    }
    }
    n_paddr = true;
    switch (_root()->bits()) {
    case elf_t::BITS_B32: {
        n_paddr = false;
        m_paddr = m__io->read_u4le();
        break;
    }
    case elf_t::BITS_B64: {
        n_paddr = false;
        m_paddr = m__io->read_u8le();
        break;
    }
    }
    n_filesz = true;
    switch (_root()->bits()) {
    case elf_t::BITS_B32: {
        n_filesz = false;
        m_filesz = m__io->read_u4le();
        break;
    }
    case elf_t::BITS_B64: {
        n_filesz = false;
        m_filesz = m__io->read_u8le();
        break;
    }
    }
    n_memsz = true;
    switch (_root()->bits()) {
    case elf_t::BITS_B32: {
        n_memsz = false;
        m_memsz = m__io->read_u4le();
        break;
    }
    case elf_t::BITS_B64: {
        n_memsz = false;
        m_memsz = m__io->read_u8le();
        break;
    }
    }
    n_flags32 = true;
    if (_root()->bits() == elf_t::BITS_B32) {
        n_flags32 = false;
        m_flags32 = m__io->read_u4le();
    }
    n_align = true;
    switch (_root()->bits()) {
    case elf_t::BITS_B32: {
        n_align = false;
        m_align = m__io->read_u4le();
        break;
    }
    case elf_t::BITS_B64: {
        n_align = false;
        m_align = m__io->read_u8le();
        break;
    }
    }
}

void elf_t::endian_elf_t::program_header_t::_read_be() {
    m_type = static_cast<elf_t::ph_type_t>(m__io->read_u4be());
    n_flags64 = true;
    if (_root()->bits() == elf_t::BITS_B64) {
        n_flags64 = false;
        m_flags64 = m__io->read_u4be();
    }
    n_offset = true;
    switch (_root()->bits()) {
    case elf_t::BITS_B32: {
        n_offset = false;
        m_offset = m__io->read_u4be();
        break;
    }
    case elf_t::BITS_B64: {
        n_offset = false;
        m_offset = m__io->read_u8be();
        break;
    }
    }
    n_vaddr = true;
    switch (_root()->bits()) {
    case elf_t::BITS_B32: {
        n_vaddr = false;
        m_vaddr = m__io->read_u4be();
        break;
    }
    case elf_t::BITS_B64: {
        n_vaddr = false;
        m_vaddr = m__io->read_u8be();
        break;
    }
    }
    n_paddr = true;
    switch (_root()->bits()) {
    case elf_t::BITS_B32: {
        n_paddr = false;
        m_paddr = m__io->read_u4be();
        break;
    }
    case elf_t::BITS_B64: {
        n_paddr = false;
        m_paddr = m__io->read_u8be();
        break;
    }
    }
    n_filesz = true;
    switch (_root()->bits()) {
    case elf_t::BITS_B32: {
        n_filesz = false;
        m_filesz = m__io->read_u4be();
        break;
    }
    case elf_t::BITS_B64: {
        n_filesz = false;
        m_filesz = m__io->read_u8be();
        break;
    }
    }
    n_memsz = true;
    switch (_root()->bits()) {
    case elf_t::BITS_B32: {
        n_memsz = false;
        m_memsz = m__io->read_u4be();
        break;
    }
    case elf_t::BITS_B64: {
        n_memsz = false;
        m_memsz = m__io->read_u8be();
        break;
    }
    }
    n_flags32 = true;
    if (_root()->bits() == elf_t::BITS_B32) {
        n_flags32 = false;
        m_flags32 = m__io->read_u4be();
    }
    n_align = true;
    switch (_root()->bits()) {
    case elf_t::BITS_B32: {
        n_align = false;
        m_align = m__io->read_u4be();
        break;
    }
    case elf_t::BITS_B64: {
        n_align = false;
        m_align = m__io->read_u8be();
        break;
    }
    }
}

elf_t::endian_elf_t::program_header_t::~program_header_t() {
    _clean_up();
}

void elf_t::endian_elf_t::program_header_t::_clean_up() {
    if (!n_flags64) {
    }
    if (!n_offset) {
    }
    if (!n_vaddr) {
    }
    if (!n_paddr) {
    }
    if (!n_filesz) {
    }
    if (!n_memsz) {
    }
    if (!n_flags32) {
    }
    if (!n_align) {
    }
    if (f_flags_obj && !n_flags_obj) {
    }
}

elf_t::phdr_type_flags_t* elf_t::endian_elf_t::program_header_t::flags_obj() {
    if (f_flags_obj)
        return m_flags_obj.get();
    f_flags_obj = true;
    if (m__is_le == 1) {
        n_flags_obj = true;
        switch (_root()->bits()) {
        case elf_t::BITS_B32: {
            n_flags_obj = false;
            m_flags_obj = std::unique_ptr<phdr_type_flags_t>(new phdr_type_flags_t(flags32(), m__io, this, m__root));
            break;
        }
        case elf_t::BITS_B64: {
            n_flags_obj = false;
            m_flags_obj = std::unique_ptr<phdr_type_flags_t>(new phdr_type_flags_t(flags64(), m__io, this, m__root));
            break;
        }
        }
    } else {
        n_flags_obj = true;
        switch (_root()->bits()) {
        case elf_t::BITS_B32: {
            n_flags_obj = false;
            m_flags_obj = std::unique_ptr<phdr_type_flags_t>(new phdr_type_flags_t(flags32(), m__io, this, m__root));
            break;
        }
        case elf_t::BITS_B64: {
            n_flags_obj = false;
            m_flags_obj = std::unique_ptr<phdr_type_flags_t>(new phdr_type_flags_t(flags64(), m__io, this, m__root));
            break;
        }
        }
    }
    return m_flags_obj.get();
}

elf_t::endian_elf_t::relocation_section_t::relocation_section_t(bool p_has_addend, kaitai::kstream* p__io, elf_t::endian_elf_t::section_header_t* p__parent, elf_t* p__root, int p_is_le) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m__is_le = p_is_le;
    m_has_addend = p_has_addend;
    m_entries = nullptr;
    _read();
}

void elf_t::endian_elf_t::relocation_section_t::_read() {

    if (m__is_le == -1) {
        throw kaitai::undecided_endianness_error("/types/endian_elf/types/relocation_section");
    } else if (m__is_le == 1) {
        _read_le();
    } else {
        _read_be();
    }
}

void elf_t::endian_elf_t::relocation_section_t::_read_le() {
    m_entries = std::unique_ptr<std::vector<std::unique_ptr<relocation_section_entry_t>>>(new std::vector<std::unique_ptr<relocation_section_entry_t>>());
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_entries->push_back(std::move(std::unique_ptr<relocation_section_entry_t>(new relocation_section_entry_t(m__io, this, m__root, m__is_le))));
            i++;
        }
    }
}

void elf_t::endian_elf_t::relocation_section_t::_read_be() {
    m_entries = std::unique_ptr<std::vector<std::unique_ptr<relocation_section_entry_t>>>(new std::vector<std::unique_ptr<relocation_section_entry_t>>());
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_entries->push_back(std::move(std::unique_ptr<relocation_section_entry_t>(new relocation_section_entry_t(m__io, this, m__root, m__is_le))));
            i++;
        }
    }
}

elf_t::endian_elf_t::relocation_section_t::~relocation_section_t() {
    _clean_up();
}

void elf_t::endian_elf_t::relocation_section_t::_clean_up() {
}

elf_t::endian_elf_t::relocation_section_entry_t::relocation_section_entry_t(kaitai::kstream* p__io, elf_t::endian_elf_t::relocation_section_t* p__parent, elf_t* p__root, int p_is_le) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m__is_le = p_is_le;
    _read();
}

void elf_t::endian_elf_t::relocation_section_entry_t::_read() {

    if (m__is_le == -1) {
        throw kaitai::undecided_endianness_error("/types/endian_elf/types/relocation_section_entry");
    } else if (m__is_le == 1) {
        _read_le();
    } else {
        _read_be();
    }
}

void elf_t::endian_elf_t::relocation_section_entry_t::_read_le() {
    n_offset = true;
    switch (_root()->bits()) {
    case elf_t::BITS_B32: {
        n_offset = false;
        m_offset = m__io->read_u4le();
        break;
    }
    case elf_t::BITS_B64: {
        n_offset = false;
        m_offset = m__io->read_u8le();
        break;
    }
    }
    n_info = true;
    switch (_root()->bits()) {
    case elf_t::BITS_B32: {
        n_info = false;
        m_info = m__io->read_u4le();
        break;
    }
    case elf_t::BITS_B64: {
        n_info = false;
        m_info = m__io->read_u8le();
        break;
    }
    }
    n_addend = true;
    if (_parent()->has_addend()) {
        n_addend = false;
        n_addend = true;
        switch (_root()->bits()) {
        case elf_t::BITS_B32: {
            n_addend = false;
            m_addend = m__io->read_s4le();
            break;
        }
        case elf_t::BITS_B64: {
            n_addend = false;
            m_addend = m__io->read_s8le();
            break;
        }
        }
    }
}

void elf_t::endian_elf_t::relocation_section_entry_t::_read_be() {
    n_offset = true;
    switch (_root()->bits()) {
    case elf_t::BITS_B32: {
        n_offset = false;
        m_offset = m__io->read_u4be();
        break;
    }
    case elf_t::BITS_B64: {
        n_offset = false;
        m_offset = m__io->read_u8be();
        break;
    }
    }
    n_info = true;
    switch (_root()->bits()) {
    case elf_t::BITS_B32: {
        n_info = false;
        m_info = m__io->read_u4be();
        break;
    }
    case elf_t::BITS_B64: {
        n_info = false;
        m_info = m__io->read_u8be();
        break;
    }
    }
    n_addend = true;
    if (_parent()->has_addend()) {
        n_addend = false;
        n_addend = true;
        switch (_root()->bits()) {
        case elf_t::BITS_B32: {
            n_addend = false;
            m_addend = m__io->read_s4be();
            break;
        }
        case elf_t::BITS_B64: {
            n_addend = false;
            m_addend = m__io->read_s8be();
            break;
        }
        }
    }
}

elf_t::endian_elf_t::relocation_section_entry_t::~relocation_section_entry_t() {
    _clean_up();
}

void elf_t::endian_elf_t::relocation_section_entry_t::_clean_up() {
    if (!n_offset) {
    }
    if (!n_info) {
    }
    if (!n_addend) {
    }
}

elf_t::endian_elf_t::section_header_t::section_header_t(kaitai::kstream* p__io, elf_t::endian_elf_t* p__parent, elf_t* p__root, int p_is_le) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m__is_le = p_is_le;
    m__io__raw_body = nullptr;
    m_flags_obj = nullptr;
    f_body = false;
    f_flags_obj = false;
    f_linked_section = false;
    f_name = false;
    _read();
}

void elf_t::endian_elf_t::section_header_t::_read() {

    if (m__is_le == -1) {
        throw kaitai::undecided_endianness_error("/types/endian_elf/types/section_header");
    } else if (m__is_le == 1) {
        _read_le();
    } else {
        _read_be();
    }
}

void elf_t::endian_elf_t::section_header_t::_read_le() {
    m_ofs_name = m__io->read_u4le();
    m_type = static_cast<elf_t::sh_type_t>(m__io->read_u4le());
    n_flags = true;
    switch (_root()->bits()) {
    case elf_t::BITS_B32: {
        n_flags = false;
        m_flags = m__io->read_u4le();
        break;
    }
    case elf_t::BITS_B64: {
        n_flags = false;
        m_flags = m__io->read_u8le();
        break;
    }
    }
    n_addr = true;
    switch (_root()->bits()) {
    case elf_t::BITS_B32: {
        n_addr = false;
        m_addr = m__io->read_u4le();
        break;
    }
    case elf_t::BITS_B64: {
        n_addr = false;
        m_addr = m__io->read_u8le();
        break;
    }
    }
    n_ofs_body = true;
    switch (_root()->bits()) {
    case elf_t::BITS_B32: {
        n_ofs_body = false;
        m_ofs_body = m__io->read_u4le();
        break;
    }
    case elf_t::BITS_B64: {
        n_ofs_body = false;
        m_ofs_body = m__io->read_u8le();
        break;
    }
    }
    n_len_body = true;
    switch (_root()->bits()) {
    case elf_t::BITS_B32: {
        n_len_body = false;
        m_len_body = m__io->read_u4le();
        break;
    }
    case elf_t::BITS_B64: {
        n_len_body = false;
        m_len_body = m__io->read_u8le();
        break;
    }
    }
    m_linked_section_idx = m__io->read_u4le();
    m_info = m__io->read_bytes(4);
    n_align = true;
    switch (_root()->bits()) {
    case elf_t::BITS_B32: {
        n_align = false;
        m_align = m__io->read_u4le();
        break;
    }
    case elf_t::BITS_B64: {
        n_align = false;
        m_align = m__io->read_u8le();
        break;
    }
    }
    n_entry_size = true;
    switch (_root()->bits()) {
    case elf_t::BITS_B32: {
        n_entry_size = false;
        m_entry_size = m__io->read_u4le();
        break;
    }
    case elf_t::BITS_B64: {
        n_entry_size = false;
        m_entry_size = m__io->read_u8le();
        break;
    }
    }
}

void elf_t::endian_elf_t::section_header_t::_read_be() {
    m_ofs_name = m__io->read_u4be();
    m_type = static_cast<elf_t::sh_type_t>(m__io->read_u4be());
    n_flags = true;
    switch (_root()->bits()) {
    case elf_t::BITS_B32: {
        n_flags = false;
        m_flags = m__io->read_u4be();
        break;
    }
    case elf_t::BITS_B64: {
        n_flags = false;
        m_flags = m__io->read_u8be();
        break;
    }
    }
    n_addr = true;
    switch (_root()->bits()) {
    case elf_t::BITS_B32: {
        n_addr = false;
        m_addr = m__io->read_u4be();
        break;
    }
    case elf_t::BITS_B64: {
        n_addr = false;
        m_addr = m__io->read_u8be();
        break;
    }
    }
    n_ofs_body = true;
    switch (_root()->bits()) {
    case elf_t::BITS_B32: {
        n_ofs_body = false;
        m_ofs_body = m__io->read_u4be();
        break;
    }
    case elf_t::BITS_B64: {
        n_ofs_body = false;
        m_ofs_body = m__io->read_u8be();
        break;
    }
    }
    n_len_body = true;
    switch (_root()->bits()) {
    case elf_t::BITS_B32: {
        n_len_body = false;
        m_len_body = m__io->read_u4be();
        break;
    }
    case elf_t::BITS_B64: {
        n_len_body = false;
        m_len_body = m__io->read_u8be();
        break;
    }
    }
    m_linked_section_idx = m__io->read_u4be();
    m_info = m__io->read_bytes(4);
    n_align = true;
    switch (_root()->bits()) {
    case elf_t::BITS_B32: {
        n_align = false;
        m_align = m__io->read_u4be();
        break;
    }
    case elf_t::BITS_B64: {
        n_align = false;
        m_align = m__io->read_u8be();
        break;
    }
    }
    n_entry_size = true;
    switch (_root()->bits()) {
    case elf_t::BITS_B32: {
        n_entry_size = false;
        m_entry_size = m__io->read_u4be();
        break;
    }
    case elf_t::BITS_B64: {
        n_entry_size = false;
        m_entry_size = m__io->read_u8be();
        break;
    }
    }
}

elf_t::endian_elf_t::section_header_t::~section_header_t() {
    _clean_up();
}

void elf_t::endian_elf_t::section_header_t::_clean_up() {
    if (!n_flags) {
    }
    if (!n_addr) {
    }
    if (!n_ofs_body) {
    }
    if (!n_len_body) {
    }
    if (!n_align) {
    }
    if (!n_entry_size) {
    }
    if (f_body && !n_body) {
    }
    if (f_flags_obj) {
    }
    if (f_name) {
    }
}

kaitai::kstruct* elf_t::endian_elf_t::section_header_t::body() {
    if (f_body)
        return m_body.get();
    f_body = true;
    n_body = true;
    if (type() != elf_t::SH_TYPE_NOBITS) {
        n_body = false;
        kaitai::kstream *io = _root()->_io();
        std::streampos _pos = io->pos();
        io->seek(ofs_body());
        if (m__is_le == 1) {
            n_body = true;
            switch (type()) {
            case elf_t::SH_TYPE_DYNAMIC: {
                n_body = false;
                m__raw_body = io->read_bytes(len_body());
                m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
                m_body = std::unique_ptr<dynamic_section_t>(new dynamic_section_t(m__io__raw_body.get(), this, m__root, m__is_le));
                break;
            }
            case elf_t::SH_TYPE_DYNSYM: {
                n_body = false;
                m__raw_body = io->read_bytes(len_body());
                m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
                m_body = std::unique_ptr<dynsym_section_t>(new dynsym_section_t(m__io__raw_body.get(), this, m__root, m__is_le));
                break;
            }
            case elf_t::SH_TYPE_NOTE: {
                n_body = false;
                m__raw_body = io->read_bytes(len_body());
                m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
                m_body = std::unique_ptr<note_section_t>(new note_section_t(m__io__raw_body.get(), this, m__root, m__is_le));
                break;
            }
            case elf_t::SH_TYPE_REL: {
                n_body = false;
                m__raw_body = io->read_bytes(len_body());
                m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
                m_body = std::unique_ptr<relocation_section_t>(new relocation_section_t(false, m__io__raw_body.get(), this, m__root, m__is_le));
                break;
            }
            case elf_t::SH_TYPE_RELA: {
                n_body = false;
                m__raw_body = io->read_bytes(len_body());
                m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
                m_body = std::unique_ptr<relocation_section_t>(new relocation_section_t(true, m__io__raw_body.get(), this, m__root, m__is_le));
                break;
            }
            case elf_t::SH_TYPE_STRTAB: {
                n_body = false;
                m__raw_body = io->read_bytes(len_body());
                m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
                m_body = std::unique_ptr<strings_struct_t>(new strings_struct_t(m__io__raw_body.get(), this, m__root, m__is_le));
                break;
            }
            case elf_t::SH_TYPE_SYMTAB: {
                n_body = false;
                m__raw_body = io->read_bytes(len_body());
                m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
                m_body = std::unique_ptr<dynsym_section_t>(new dynsym_section_t(m__io__raw_body.get(), this, m__root, m__is_le));
                break;
            }
            default: {
                m__raw_body = io->read_bytes(len_body());
                break;
            }
            }
        } else {
            n_body = true;
            switch (type()) {
            case elf_t::SH_TYPE_DYNAMIC: {
                n_body = false;
                m__raw_body = io->read_bytes(len_body());
                m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
                m_body = std::unique_ptr<dynamic_section_t>(new dynamic_section_t(m__io__raw_body.get(), this, m__root, m__is_le));
                break;
            }
            case elf_t::SH_TYPE_DYNSYM: {
                n_body = false;
                m__raw_body = io->read_bytes(len_body());
                m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
                m_body = std::unique_ptr<dynsym_section_t>(new dynsym_section_t(m__io__raw_body.get(), this, m__root, m__is_le));
                break;
            }
            case elf_t::SH_TYPE_NOTE: {
                n_body = false;
                m__raw_body = io->read_bytes(len_body());
                m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
                m_body = std::unique_ptr<note_section_t>(new note_section_t(m__io__raw_body.get(), this, m__root, m__is_le));
                break;
            }
            case elf_t::SH_TYPE_REL: {
                n_body = false;
                m__raw_body = io->read_bytes(len_body());
                m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
                m_body = std::unique_ptr<relocation_section_t>(new relocation_section_t(false, m__io__raw_body.get(), this, m__root, m__is_le));
                break;
            }
            case elf_t::SH_TYPE_RELA: {
                n_body = false;
                m__raw_body = io->read_bytes(len_body());
                m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
                m_body = std::unique_ptr<relocation_section_t>(new relocation_section_t(true, m__io__raw_body.get(), this, m__root, m__is_le));
                break;
            }
            case elf_t::SH_TYPE_STRTAB: {
                n_body = false;
                m__raw_body = io->read_bytes(len_body());
                m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
                m_body = std::unique_ptr<strings_struct_t>(new strings_struct_t(m__io__raw_body.get(), this, m__root, m__is_le));
                break;
            }
            case elf_t::SH_TYPE_SYMTAB: {
                n_body = false;
                m__raw_body = io->read_bytes(len_body());
                m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
                m_body = std::unique_ptr<dynsym_section_t>(new dynsym_section_t(m__io__raw_body.get(), this, m__root, m__is_le));
                break;
            }
            default: {
                m__raw_body = io->read_bytes(len_body());
                break;
            }
            }
        }
        io->seek(_pos);
    }
    return m_body.get();
}

elf_t::section_header_flags_t* elf_t::endian_elf_t::section_header_t::flags_obj() {
    if (f_flags_obj)
        return m_flags_obj.get();
    f_flags_obj = true;
    if (m__is_le == 1) {
        m_flags_obj = std::unique_ptr<section_header_flags_t>(new section_header_flags_t(flags(), m__io, this, m__root));
    } else {
        m_flags_obj = std::unique_ptr<section_header_flags_t>(new section_header_flags_t(flags(), m__io, this, m__root));
    }
    return m_flags_obj.get();
}

elf_t::endian_elf_t::section_header_t* elf_t::endian_elf_t::section_header_t::linked_section() {
    if (f_linked_section)
        return m_linked_section;
    f_linked_section = true;
    n_linked_section = true;
    if ( ((linked_section_idx() != elf_t::SECTION_HEADER_IDX_SPECIAL_UNDEFINED) && (linked_section_idx() < _root()->header()->num_section_headers())) ) {
        n_linked_section = false;
        m_linked_section = _root()->header()->section_headers()->at(linked_section_idx()).get();
    }
    return m_linked_section;
}

std::string elf_t::endian_elf_t::section_header_t::name() {
    if (f_name)
        return m_name;
    f_name = true;
    kaitai::kstream *io = _root()->header()->section_names()->_io();
    std::streampos _pos = io->pos();
    io->seek(ofs_name());
    if (m__is_le == 1) {
        m_name = kaitai::kstream::bytes_to_str(io->read_bytes_term(0, false, true, true), "ASCII");
    } else {
        m_name = kaitai::kstream::bytes_to_str(io->read_bytes_term(0, false, true, true), "ASCII");
    }
    io->seek(_pos);
    return m_name;
}

elf_t::endian_elf_t::strings_struct_t::strings_struct_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, elf_t* p__root, int p_is_le) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m__is_le = p_is_le;
    m_entries = nullptr;
    _read();
}

void elf_t::endian_elf_t::strings_struct_t::_read() {

    if (m__is_le == -1) {
        throw kaitai::undecided_endianness_error("/types/endian_elf/types/strings_struct");
    } else if (m__is_le == 1) {
        _read_le();
    } else {
        _read_be();
    }
}

void elf_t::endian_elf_t::strings_struct_t::_read_le() {
    m_entries = std::unique_ptr<std::vector<std::string>>(new std::vector<std::string>());
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_entries->push_back(std::move(kaitai::kstream::bytes_to_str(m__io->read_bytes_term(0, false, true, true), "UTF-8")));
            i++;
        }
    }
}

void elf_t::endian_elf_t::strings_struct_t::_read_be() {
    m_entries = std::unique_ptr<std::vector<std::string>>(new std::vector<std::string>());
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_entries->push_back(std::move(kaitai::kstream::bytes_to_str(m__io->read_bytes_term(0, false, true, true), "UTF-8")));
            i++;
        }
    }
}

elf_t::endian_elf_t::strings_struct_t::~strings_struct_t() {
    _clean_up();
}

void elf_t::endian_elf_t::strings_struct_t::_clean_up() {
}

std::vector<std::unique_ptr<elf_t::endian_elf_t::program_header_t>>* elf_t::endian_elf_t::program_headers() {
    if (f_program_headers)
        return m_program_headers.get();
    f_program_headers = true;
    std::streampos _pos = m__io->pos();
    m__io->seek(ofs_program_headers());
    if (m__is_le == 1) {
        m__raw_program_headers = std::unique_ptr<std::vector<std::string>>(new std::vector<std::string>());
        m__io__raw_program_headers = std::unique_ptr<std::vector<std::unique_ptr<kaitai::kstream>>>(new std::vector<std::unique_ptr<kaitai::kstream>>());
        m_program_headers = std::unique_ptr<std::vector<std::unique_ptr<program_header_t>>>(new std::vector<std::unique_ptr<program_header_t>>());
        const int l_program_headers = num_program_headers();
        for (int i = 0; i < l_program_headers; i++) {
            m__raw_program_headers->push_back(std::move(m__io->read_bytes(program_header_size())));
            kaitai::kstream* io__raw_program_headers = new kaitai::kstream(m__raw_program_headers->at(m__raw_program_headers->size() - 1));
            m__io__raw_program_headers->emplace_back(io__raw_program_headers);
            m_program_headers->push_back(std::move(std::unique_ptr<program_header_t>(new program_header_t(io__raw_program_headers, this, m__root, m__is_le))));
        }
    } else {
        m__raw_program_headers = std::unique_ptr<std::vector<std::string>>(new std::vector<std::string>());
        m__io__raw_program_headers = std::unique_ptr<std::vector<std::unique_ptr<kaitai::kstream>>>(new std::vector<std::unique_ptr<kaitai::kstream>>());
        m_program_headers = std::unique_ptr<std::vector<std::unique_ptr<program_header_t>>>(new std::vector<std::unique_ptr<program_header_t>>());
        const int l_program_headers = num_program_headers();
        for (int i = 0; i < l_program_headers; i++) {
            m__raw_program_headers->push_back(std::move(m__io->read_bytes(program_header_size())));
            kaitai::kstream* io__raw_program_headers = new kaitai::kstream(m__raw_program_headers->at(m__raw_program_headers->size() - 1));
            m__io__raw_program_headers->emplace_back(io__raw_program_headers);
            m_program_headers->push_back(std::move(std::unique_ptr<program_header_t>(new program_header_t(io__raw_program_headers, this, m__root, m__is_le))));
        }
    }
    m__io->seek(_pos);
    return m_program_headers.get();
}

std::vector<std::unique_ptr<elf_t::endian_elf_t::section_header_t>>* elf_t::endian_elf_t::section_headers() {
    if (f_section_headers)
        return m_section_headers.get();
    f_section_headers = true;
    std::streampos _pos = m__io->pos();
    m__io->seek(ofs_section_headers());
    if (m__is_le == 1) {
        m__raw_section_headers = std::unique_ptr<std::vector<std::string>>(new std::vector<std::string>());
        m__io__raw_section_headers = std::unique_ptr<std::vector<std::unique_ptr<kaitai::kstream>>>(new std::vector<std::unique_ptr<kaitai::kstream>>());
        m_section_headers = std::unique_ptr<std::vector<std::unique_ptr<section_header_t>>>(new std::vector<std::unique_ptr<section_header_t>>());
        const int l_section_headers = num_section_headers();
        for (int i = 0; i < l_section_headers; i++) {
            m__raw_section_headers->push_back(std::move(m__io->read_bytes(section_header_size())));
            kaitai::kstream* io__raw_section_headers = new kaitai::kstream(m__raw_section_headers->at(m__raw_section_headers->size() - 1));
            m__io__raw_section_headers->emplace_back(io__raw_section_headers);
            m_section_headers->push_back(std::move(std::unique_ptr<section_header_t>(new section_header_t(io__raw_section_headers, this, m__root, m__is_le))));
        }
    } else {
        m__raw_section_headers = std::unique_ptr<std::vector<std::string>>(new std::vector<std::string>());
        m__io__raw_section_headers = std::unique_ptr<std::vector<std::unique_ptr<kaitai::kstream>>>(new std::vector<std::unique_ptr<kaitai::kstream>>());
        m_section_headers = std::unique_ptr<std::vector<std::unique_ptr<section_header_t>>>(new std::vector<std::unique_ptr<section_header_t>>());
        const int l_section_headers = num_section_headers();
        for (int i = 0; i < l_section_headers; i++) {
            m__raw_section_headers->push_back(std::move(m__io->read_bytes(section_header_size())));
            kaitai::kstream* io__raw_section_headers = new kaitai::kstream(m__raw_section_headers->at(m__raw_section_headers->size() - 1));
            m__io__raw_section_headers->emplace_back(io__raw_section_headers);
            m_section_headers->push_back(std::move(std::unique_ptr<section_header_t>(new section_header_t(io__raw_section_headers, this, m__root, m__is_le))));
        }
    }
    m__io->seek(_pos);
    return m_section_headers.get();
}

elf_t::endian_elf_t::strings_struct_t* elf_t::endian_elf_t::section_names() {
    if (f_section_names)
        return m_section_names.get();
    f_section_names = true;
    n_section_names = true;
    if ( ((section_names_idx() != elf_t::SECTION_HEADER_IDX_SPECIAL_UNDEFINED) && (section_names_idx() < _root()->header()->num_section_headers())) ) {
        n_section_names = false;
        std::streampos _pos = m__io->pos();
        m__io->seek(section_headers()->at(section_names_idx())->ofs_body());
        if (m__is_le == 1) {
            m__raw_section_names = m__io->read_bytes(section_headers()->at(section_names_idx())->len_body());
            m__io__raw_section_names = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_section_names));
            m_section_names = std::unique_ptr<strings_struct_t>(new strings_struct_t(m__io__raw_section_names.get(), this, m__root, m__is_le));
        } else {
            m__raw_section_names = m__io->read_bytes(section_headers()->at(section_names_idx())->len_body());
            m__io__raw_section_names = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_section_names));
            m_section_names = std::unique_ptr<strings_struct_t>(new strings_struct_t(m__io__raw_section_names.get(), this, m__root, m__is_le));
        }
        m__io->seek(_pos);
    }
    return m_section_names.get();
}

elf_t::phdr_type_flags_t::phdr_type_flags_t(uint32_t p_value, kaitai::kstream* p__io, elf_t::endian_elf_t::program_header_t* p__parent, elf_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_value = p_value;
    f_execute = false;
    f_mask_proc = false;
    f_read = false;
    f_write = false;
    _read();
}

void elf_t::phdr_type_flags_t::_read() {
}

elf_t::phdr_type_flags_t::~phdr_type_flags_t() {
    _clean_up();
}

void elf_t::phdr_type_flags_t::_clean_up() {
}

bool elf_t::phdr_type_flags_t::execute() {
    if (f_execute)
        return m_execute;
    f_execute = true;
    m_execute = (value() & 1) != 0;
    return m_execute;
}

bool elf_t::phdr_type_flags_t::mask_proc() {
    if (f_mask_proc)
        return m_mask_proc;
    f_mask_proc = true;
    m_mask_proc = (value() & 4026531840UL) != 0;
    return m_mask_proc;
}

bool elf_t::phdr_type_flags_t::read() {
    if (f_read)
        return m_read;
    f_read = true;
    m_read = (value() & 4) != 0;
    return m_read;
}

bool elf_t::phdr_type_flags_t::write() {
    if (f_write)
        return m_write;
    f_write = true;
    m_write = (value() & 2) != 0;
    return m_write;
}

elf_t::section_header_flags_t::section_header_flags_t(uint32_t p_value, kaitai::kstream* p__io, elf_t::endian_elf_t::section_header_t* p__parent, elf_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_value = p_value;
    f_alloc = false;
    f_exclude = false;
    f_exec_instr = false;
    f_group = false;
    f_info_link = false;
    f_link_order = false;
    f_mask_os = false;
    f_mask_proc = false;
    f_merge = false;
    f_ordered = false;
    f_os_non_conforming = false;
    f_strings = false;
    f_tls = false;
    f_write = false;
    _read();
}

void elf_t::section_header_flags_t::_read() {
}

elf_t::section_header_flags_t::~section_header_flags_t() {
    _clean_up();
}

void elf_t::section_header_flags_t::_clean_up() {
}

bool elf_t::section_header_flags_t::alloc() {
    if (f_alloc)
        return m_alloc;
    f_alloc = true;
    m_alloc = (value() & 2) != 0;
    return m_alloc;
}

bool elf_t::section_header_flags_t::exclude() {
    if (f_exclude)
        return m_exclude;
    f_exclude = true;
    m_exclude = (value() & 134217728) != 0;
    return m_exclude;
}

bool elf_t::section_header_flags_t::exec_instr() {
    if (f_exec_instr)
        return m_exec_instr;
    f_exec_instr = true;
    m_exec_instr = (value() & 4) != 0;
    return m_exec_instr;
}

bool elf_t::section_header_flags_t::group() {
    if (f_group)
        return m_group;
    f_group = true;
    m_group = (value() & 512) != 0;
    return m_group;
}

bool elf_t::section_header_flags_t::info_link() {
    if (f_info_link)
        return m_info_link;
    f_info_link = true;
    m_info_link = (value() & 64) != 0;
    return m_info_link;
}

bool elf_t::section_header_flags_t::link_order() {
    if (f_link_order)
        return m_link_order;
    f_link_order = true;
    m_link_order = (value() & 128) != 0;
    return m_link_order;
}

bool elf_t::section_header_flags_t::mask_os() {
    if (f_mask_os)
        return m_mask_os;
    f_mask_os = true;
    m_mask_os = (value() & 267386880) != 0;
    return m_mask_os;
}

bool elf_t::section_header_flags_t::mask_proc() {
    if (f_mask_proc)
        return m_mask_proc;
    f_mask_proc = true;
    m_mask_proc = (value() & 4026531840UL) != 0;
    return m_mask_proc;
}

bool elf_t::section_header_flags_t::merge() {
    if (f_merge)
        return m_merge;
    f_merge = true;
    m_merge = (value() & 16) != 0;
    return m_merge;
}

bool elf_t::section_header_flags_t::ordered() {
    if (f_ordered)
        return m_ordered;
    f_ordered = true;
    m_ordered = (value() & 67108864) != 0;
    return m_ordered;
}

bool elf_t::section_header_flags_t::os_non_conforming() {
    if (f_os_non_conforming)
        return m_os_non_conforming;
    f_os_non_conforming = true;
    m_os_non_conforming = (value() & 256) != 0;
    return m_os_non_conforming;
}

bool elf_t::section_header_flags_t::strings() {
    if (f_strings)
        return m_strings;
    f_strings = true;
    m_strings = (value() & 32) != 0;
    return m_strings;
}

bool elf_t::section_header_flags_t::tls() {
    if (f_tls)
        return m_tls;
    f_tls = true;
    m_tls = (value() & 1024) != 0;
    return m_tls;
}

bool elf_t::section_header_flags_t::write() {
    if (f_write)
        return m_write;
    f_write = true;
    m_write = (value() & 1) != 0;
    return m_write;
}

int32_t elf_t::sh_idx_hi_os() {
    if (f_sh_idx_hi_os)
        return m_sh_idx_hi_os;
    f_sh_idx_hi_os = true;
    m_sh_idx_hi_os = 65343;
    return m_sh_idx_hi_os;
}

int32_t elf_t::sh_idx_hi_proc() {
    if (f_sh_idx_hi_proc)
        return m_sh_idx_hi_proc;
    f_sh_idx_hi_proc = true;
    m_sh_idx_hi_proc = 65311;
    return m_sh_idx_hi_proc;
}

int32_t elf_t::sh_idx_hi_reserved() {
    if (f_sh_idx_hi_reserved)
        return m_sh_idx_hi_reserved;
    f_sh_idx_hi_reserved = true;
    m_sh_idx_hi_reserved = 65535;
    return m_sh_idx_hi_reserved;
}

int32_t elf_t::sh_idx_lo_os() {
    if (f_sh_idx_lo_os)
        return m_sh_idx_lo_os;
    f_sh_idx_lo_os = true;
    m_sh_idx_lo_os = 65312;
    return m_sh_idx_lo_os;
}

int32_t elf_t::sh_idx_lo_proc() {
    if (f_sh_idx_lo_proc)
        return m_sh_idx_lo_proc;
    f_sh_idx_lo_proc = true;
    m_sh_idx_lo_proc = 65280;
    return m_sh_idx_lo_proc;
}

int32_t elf_t::sh_idx_lo_reserved() {
    if (f_sh_idx_lo_reserved)
        return m_sh_idx_lo_reserved;
    f_sh_idx_lo_reserved = true;
    m_sh_idx_lo_reserved = 65280;
    return m_sh_idx_lo_reserved;
}
