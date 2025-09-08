// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "elf.h"
#include "kaitai/exceptions.h"
std::set<elf_t::bits_t> elf_t::_build_values_bits_t() {
    std::set<elf_t::bits_t> _t;
    _t.insert(elf_t::BITS_B32);
    _t.insert(elf_t::BITS_B64);
    return _t;
}
const std::set<elf_t::bits_t> elf_t::_values_bits_t = elf_t::_build_values_bits_t();
bool elf_t::_is_defined_bits_t(elf_t::bits_t v) {
    return elf_t::_values_bits_t.find(v) != elf_t::_values_bits_t.end();
}
std::set<elf_t::dynamic_array_tags_t> elf_t::_build_values_dynamic_array_tags_t() {
    std::set<elf_t::dynamic_array_tags_t> _t;
    _t.insert(elf_t::DYNAMIC_ARRAY_TAGS_NULL);
    _t.insert(elf_t::DYNAMIC_ARRAY_TAGS_NEEDED);
    _t.insert(elf_t::DYNAMIC_ARRAY_TAGS_PLTRELSZ);
    _t.insert(elf_t::DYNAMIC_ARRAY_TAGS_PLTGOT);
    _t.insert(elf_t::DYNAMIC_ARRAY_TAGS_HASH);
    _t.insert(elf_t::DYNAMIC_ARRAY_TAGS_STRTAB);
    _t.insert(elf_t::DYNAMIC_ARRAY_TAGS_SYMTAB);
    _t.insert(elf_t::DYNAMIC_ARRAY_TAGS_RELA);
    _t.insert(elf_t::DYNAMIC_ARRAY_TAGS_RELASZ);
    _t.insert(elf_t::DYNAMIC_ARRAY_TAGS_RELAENT);
    _t.insert(elf_t::DYNAMIC_ARRAY_TAGS_STRSZ);
    _t.insert(elf_t::DYNAMIC_ARRAY_TAGS_SYMENT);
    _t.insert(elf_t::DYNAMIC_ARRAY_TAGS_INIT);
    _t.insert(elf_t::DYNAMIC_ARRAY_TAGS_FINI);
    _t.insert(elf_t::DYNAMIC_ARRAY_TAGS_SONAME);
    _t.insert(elf_t::DYNAMIC_ARRAY_TAGS_RPATH);
    _t.insert(elf_t::DYNAMIC_ARRAY_TAGS_SYMBOLIC);
    _t.insert(elf_t::DYNAMIC_ARRAY_TAGS_REL);
    _t.insert(elf_t::DYNAMIC_ARRAY_TAGS_RELSZ);
    _t.insert(elf_t::DYNAMIC_ARRAY_TAGS_RELENT);
    _t.insert(elf_t::DYNAMIC_ARRAY_TAGS_PLTREL);
    _t.insert(elf_t::DYNAMIC_ARRAY_TAGS_DEBUG);
    _t.insert(elf_t::DYNAMIC_ARRAY_TAGS_TEXTREL);
    _t.insert(elf_t::DYNAMIC_ARRAY_TAGS_JMPREL);
    _t.insert(elf_t::DYNAMIC_ARRAY_TAGS_BIND_NOW);
    _t.insert(elf_t::DYNAMIC_ARRAY_TAGS_INIT_ARRAY);
    _t.insert(elf_t::DYNAMIC_ARRAY_TAGS_FINI_ARRAY);
    _t.insert(elf_t::DYNAMIC_ARRAY_TAGS_INIT_ARRAYSZ);
    _t.insert(elf_t::DYNAMIC_ARRAY_TAGS_FINI_ARRAYSZ);
    _t.insert(elf_t::DYNAMIC_ARRAY_TAGS_RUNPATH);
    _t.insert(elf_t::DYNAMIC_ARRAY_TAGS_FLAGS);
    _t.insert(elf_t::DYNAMIC_ARRAY_TAGS_PREINIT_ARRAY);
    _t.insert(elf_t::DYNAMIC_ARRAY_TAGS_PREINIT_ARRAYSZ);
    _t.insert(elf_t::DYNAMIC_ARRAY_TAGS_SYMTAB_SHNDX);
    _t.insert(elf_t::DYNAMIC_ARRAY_TAGS_RELRSZ);
    _t.insert(elf_t::DYNAMIC_ARRAY_TAGS_RELR);
    _t.insert(elf_t::DYNAMIC_ARRAY_TAGS_RELRENT);
    _t.insert(elf_t::DYNAMIC_ARRAY_TAGS_DEPRECATED_SPARC_REGISTER);
    _t.insert(elf_t::DYNAMIC_ARRAY_TAGS_SUNW_AUXILIARY);
    _t.insert(elf_t::DYNAMIC_ARRAY_TAGS_SUNW_RTLDINF);
    _t.insert(elf_t::DYNAMIC_ARRAY_TAGS_SUNW_FILTER);
    _t.insert(elf_t::DYNAMIC_ARRAY_TAGS_SUNW_CAP);
    _t.insert(elf_t::DYNAMIC_ARRAY_TAGS_SUNW_SYMTAB);
    _t.insert(elf_t::DYNAMIC_ARRAY_TAGS_SUNW_SYMSZ);
    _t.insert(elf_t::DYNAMIC_ARRAY_TAGS_SUNW_SORTENT);
    _t.insert(elf_t::DYNAMIC_ARRAY_TAGS_SUNW_SYMSORT);
    _t.insert(elf_t::DYNAMIC_ARRAY_TAGS_SUNW_SYMSORTSZ);
    _t.insert(elf_t::DYNAMIC_ARRAY_TAGS_SUNW_TLSSORT);
    _t.insert(elf_t::DYNAMIC_ARRAY_TAGS_SUNW_TLSSORTSZ);
    _t.insert(elf_t::DYNAMIC_ARRAY_TAGS_SUNW_CAPINFO);
    _t.insert(elf_t::DYNAMIC_ARRAY_TAGS_SUNW_STRPAD);
    _t.insert(elf_t::DYNAMIC_ARRAY_TAGS_SUNW_CAPCHAIN);
    _t.insert(elf_t::DYNAMIC_ARRAY_TAGS_SUNW_LDMACH);
    _t.insert(elf_t::DYNAMIC_ARRAY_TAGS_SUNW_SYMTAB_SHNDX);
    _t.insert(elf_t::DYNAMIC_ARRAY_TAGS_SUNW_CAPCHAINENT);
    _t.insert(elf_t::DYNAMIC_ARRAY_TAGS_SUNW_DEFERRED);
    _t.insert(elf_t::DYNAMIC_ARRAY_TAGS_SUNW_CAPCHAINSZ);
    _t.insert(elf_t::DYNAMIC_ARRAY_TAGS_SUNW_PHNAME);
    _t.insert(elf_t::DYNAMIC_ARRAY_TAGS_SUNW_PARENT);
    _t.insert(elf_t::DYNAMIC_ARRAY_TAGS_SUNW_SX_ASLR);
    _t.insert(elf_t::DYNAMIC_ARRAY_TAGS_SUNW_RELAX);
    _t.insert(elf_t::DYNAMIC_ARRAY_TAGS_SUNW_KMOD);
    _t.insert(elf_t::DYNAMIC_ARRAY_TAGS_SUNW_SX_NXHEAP);
    _t.insert(elf_t::DYNAMIC_ARRAY_TAGS_SUNW_SX_NXSTACK);
    _t.insert(elf_t::DYNAMIC_ARRAY_TAGS_SUNW_SX_ADIHEAP);
    _t.insert(elf_t::DYNAMIC_ARRAY_TAGS_SUNW_SX_ADISTACK);
    _t.insert(elf_t::DYNAMIC_ARRAY_TAGS_SUNW_SX_SSBD);
    _t.insert(elf_t::DYNAMIC_ARRAY_TAGS_SUNW_SYMNSORT);
    _t.insert(elf_t::DYNAMIC_ARRAY_TAGS_SUNW_SYMNSORTSZ);
    _t.insert(elf_t::DYNAMIC_ARRAY_TAGS_GNU_FLAGS_1);
    _t.insert(elf_t::DYNAMIC_ARRAY_TAGS_GNU_PRELINKED);
    _t.insert(elf_t::DYNAMIC_ARRAY_TAGS_GNU_CONFLICTSZ);
    _t.insert(elf_t::DYNAMIC_ARRAY_TAGS_GNU_LIBLISTSZ);
    _t.insert(elf_t::DYNAMIC_ARRAY_TAGS_CHECKSUM);
    _t.insert(elf_t::DYNAMIC_ARRAY_TAGS_PLTPADSZ);
    _t.insert(elf_t::DYNAMIC_ARRAY_TAGS_MOVEENT);
    _t.insert(elf_t::DYNAMIC_ARRAY_TAGS_MOVESZ);
    _t.insert(elf_t::DYNAMIC_ARRAY_TAGS_FEATURE_1);
    _t.insert(elf_t::DYNAMIC_ARRAY_TAGS_POSFLAG_1);
    _t.insert(elf_t::DYNAMIC_ARRAY_TAGS_SYMINSZ);
    _t.insert(elf_t::DYNAMIC_ARRAY_TAGS_SYMINENT);
    _t.insert(elf_t::DYNAMIC_ARRAY_TAGS_GNU_HASH);
    _t.insert(elf_t::DYNAMIC_ARRAY_TAGS_TLSDESC_PLT);
    _t.insert(elf_t::DYNAMIC_ARRAY_TAGS_TLSDESC_GOT);
    _t.insert(elf_t::DYNAMIC_ARRAY_TAGS_GNU_CONFLICT);
    _t.insert(elf_t::DYNAMIC_ARRAY_TAGS_GNU_LIBLIST);
    _t.insert(elf_t::DYNAMIC_ARRAY_TAGS_CONFIG);
    _t.insert(elf_t::DYNAMIC_ARRAY_TAGS_DEPAUDIT);
    _t.insert(elf_t::DYNAMIC_ARRAY_TAGS_AUDIT);
    _t.insert(elf_t::DYNAMIC_ARRAY_TAGS_PLTPAD);
    _t.insert(elf_t::DYNAMIC_ARRAY_TAGS_MOVETAB);
    _t.insert(elf_t::DYNAMIC_ARRAY_TAGS_SYMINFO);
    _t.insert(elf_t::DYNAMIC_ARRAY_TAGS_VERSYM);
    _t.insert(elf_t::DYNAMIC_ARRAY_TAGS_RELACOUNT);
    _t.insert(elf_t::DYNAMIC_ARRAY_TAGS_RELCOUNT);
    _t.insert(elf_t::DYNAMIC_ARRAY_TAGS_FLAGS_1);
    _t.insert(elf_t::DYNAMIC_ARRAY_TAGS_VERDEF);
    _t.insert(elf_t::DYNAMIC_ARRAY_TAGS_VERDEFNUM);
    _t.insert(elf_t::DYNAMIC_ARRAY_TAGS_VERNEED);
    _t.insert(elf_t::DYNAMIC_ARRAY_TAGS_VERNEEDNUM);
    _t.insert(elf_t::DYNAMIC_ARRAY_TAGS_SPARC_REGISTER);
    _t.insert(elf_t::DYNAMIC_ARRAY_TAGS_AUXILIARY);
    _t.insert(elf_t::DYNAMIC_ARRAY_TAGS_USED);
    _t.insert(elf_t::DYNAMIC_ARRAY_TAGS_FILTER);
    return _t;
}
const std::set<elf_t::dynamic_array_tags_t> elf_t::_values_dynamic_array_tags_t = elf_t::_build_values_dynamic_array_tags_t();
bool elf_t::_is_defined_dynamic_array_tags_t(elf_t::dynamic_array_tags_t v) {
    return elf_t::_values_dynamic_array_tags_t.find(v) != elf_t::_values_dynamic_array_tags_t.end();
}
std::set<elf_t::endian_t> elf_t::_build_values_endian_t() {
    std::set<elf_t::endian_t> _t;
    _t.insert(elf_t::ENDIAN_LE);
    _t.insert(elf_t::ENDIAN_BE);
    return _t;
}
const std::set<elf_t::endian_t> elf_t::_values_endian_t = elf_t::_build_values_endian_t();
bool elf_t::_is_defined_endian_t(elf_t::endian_t v) {
    return elf_t::_values_endian_t.find(v) != elf_t::_values_endian_t.end();
}
std::set<elf_t::machine_t> elf_t::_build_values_machine_t() {
    std::set<elf_t::machine_t> _t;
    _t.insert(elf_t::MACHINE_NO_MACHINE);
    _t.insert(elf_t::MACHINE_M32);
    _t.insert(elf_t::MACHINE_SPARC);
    _t.insert(elf_t::MACHINE_X86);
    _t.insert(elf_t::MACHINE_M68K);
    _t.insert(elf_t::MACHINE_M88K);
    _t.insert(elf_t::MACHINE_IAMCU);
    _t.insert(elf_t::MACHINE_I860);
    _t.insert(elf_t::MACHINE_MIPS);
    _t.insert(elf_t::MACHINE_S370);
    _t.insert(elf_t::MACHINE_MIPS_RS3_LE);
    _t.insert(elf_t::MACHINE_PARISC);
    _t.insert(elf_t::MACHINE_VPP500);
    _t.insert(elf_t::MACHINE_SPARC32PLUS);
    _t.insert(elf_t::MACHINE_I960);
    _t.insert(elf_t::MACHINE_POWERPC);
    _t.insert(elf_t::MACHINE_POWERPC64);
    _t.insert(elf_t::MACHINE_S390);
    _t.insert(elf_t::MACHINE_SPU);
    _t.insert(elf_t::MACHINE_V800);
    _t.insert(elf_t::MACHINE_FR20);
    _t.insert(elf_t::MACHINE_RH32);
    _t.insert(elf_t::MACHINE_RCE);
    _t.insert(elf_t::MACHINE_ARM);
    _t.insert(elf_t::MACHINE_OLD_ALPHA);
    _t.insert(elf_t::MACHINE_SUPERH);
    _t.insert(elf_t::MACHINE_SPARC_V9);
    _t.insert(elf_t::MACHINE_TRICORE);
    _t.insert(elf_t::MACHINE_ARC);
    _t.insert(elf_t::MACHINE_H8_300);
    _t.insert(elf_t::MACHINE_H8_300H);
    _t.insert(elf_t::MACHINE_H8S);
    _t.insert(elf_t::MACHINE_H8_500);
    _t.insert(elf_t::MACHINE_IA_64);
    _t.insert(elf_t::MACHINE_MIPS_X);
    _t.insert(elf_t::MACHINE_COLDFIRE);
    _t.insert(elf_t::MACHINE_M68HC12);
    _t.insert(elf_t::MACHINE_MMA);
    _t.insert(elf_t::MACHINE_PCP);
    _t.insert(elf_t::MACHINE_NCPU);
    _t.insert(elf_t::MACHINE_NDR1);
    _t.insert(elf_t::MACHINE_STARCORE);
    _t.insert(elf_t::MACHINE_ME16);
    _t.insert(elf_t::MACHINE_ST100);
    _t.insert(elf_t::MACHINE_TINYJ);
    _t.insert(elf_t::MACHINE_X86_64);
    _t.insert(elf_t::MACHINE_PDSP);
    _t.insert(elf_t::MACHINE_PDP10);
    _t.insert(elf_t::MACHINE_PDP11);
    _t.insert(elf_t::MACHINE_FX66);
    _t.insert(elf_t::MACHINE_ST9PLUS);
    _t.insert(elf_t::MACHINE_ST7);
    _t.insert(elf_t::MACHINE_MC68HC16);
    _t.insert(elf_t::MACHINE_MC68HC11);
    _t.insert(elf_t::MACHINE_MC68HC08);
    _t.insert(elf_t::MACHINE_MC68HC05);
    _t.insert(elf_t::MACHINE_SVX);
    _t.insert(elf_t::MACHINE_ST19);
    _t.insert(elf_t::MACHINE_VAX);
    _t.insert(elf_t::MACHINE_CRIS);
    _t.insert(elf_t::MACHINE_JAVELIN);
    _t.insert(elf_t::MACHINE_FIREPATH);
    _t.insert(elf_t::MACHINE_ZSP);
    _t.insert(elf_t::MACHINE_MMIX);
    _t.insert(elf_t::MACHINE_HUANY);
    _t.insert(elf_t::MACHINE_PRISM);
    _t.insert(elf_t::MACHINE_AVR);
    _t.insert(elf_t::MACHINE_FR30);
    _t.insert(elf_t::MACHINE_D10V);
    _t.insert(elf_t::MACHINE_D30V);
    _t.insert(elf_t::MACHINE_V850);
    _t.insert(elf_t::MACHINE_M32R);
    _t.insert(elf_t::MACHINE_MN10300);
    _t.insert(elf_t::MACHINE_MN10200);
    _t.insert(elf_t::MACHINE_PICOJAVA);
    _t.insert(elf_t::MACHINE_OPENRISC);
    _t.insert(elf_t::MACHINE_ARC_COMPACT);
    _t.insert(elf_t::MACHINE_XTENSA);
    _t.insert(elf_t::MACHINE_VIDEOCORE);
    _t.insert(elf_t::MACHINE_TMM_GPP);
    _t.insert(elf_t::MACHINE_NS32K);
    _t.insert(elf_t::MACHINE_TPC);
    _t.insert(elf_t::MACHINE_SNP1K);
    _t.insert(elf_t::MACHINE_ST200);
    _t.insert(elf_t::MACHINE_IP2K);
    _t.insert(elf_t::MACHINE_MAX);
    _t.insert(elf_t::MACHINE_COMPACT_RISC);
    _t.insert(elf_t::MACHINE_F2MC16);
    _t.insert(elf_t::MACHINE_MSP430);
    _t.insert(elf_t::MACHINE_BLACKFIN);
    _t.insert(elf_t::MACHINE_SE_C33);
    _t.insert(elf_t::MACHINE_SEP);
    _t.insert(elf_t::MACHINE_ARCA);
    _t.insert(elf_t::MACHINE_UNICORE);
    _t.insert(elf_t::MACHINE_EXCESS);
    _t.insert(elf_t::MACHINE_DXP);
    _t.insert(elf_t::MACHINE_ALTERA_NIOS2);
    _t.insert(elf_t::MACHINE_CRX);
    _t.insert(elf_t::MACHINE_XGATE);
    _t.insert(elf_t::MACHINE_C166);
    _t.insert(elf_t::MACHINE_M16C);
    _t.insert(elf_t::MACHINE_DSPIC30F);
    _t.insert(elf_t::MACHINE_FREESCALE_CE);
    _t.insert(elf_t::MACHINE_M32C);
    _t.insert(elf_t::MACHINE_TSK3000);
    _t.insert(elf_t::MACHINE_RS08);
    _t.insert(elf_t::MACHINE_SHARC);
    _t.insert(elf_t::MACHINE_ECOG2);
    _t.insert(elf_t::MACHINE_SCORE7);
    _t.insert(elf_t::MACHINE_DSP24);
    _t.insert(elf_t::MACHINE_VIDEOCORE3);
    _t.insert(elf_t::MACHINE_LATTICEMICO32);
    _t.insert(elf_t::MACHINE_SE_C17);
    _t.insert(elf_t::MACHINE_TI_C6000);
    _t.insert(elf_t::MACHINE_TI_C2000);
    _t.insert(elf_t::MACHINE_TI_C5500);
    _t.insert(elf_t::MACHINE_TI_ARP32);
    _t.insert(elf_t::MACHINE_TI_PRU);
    _t.insert(elf_t::MACHINE_MMDSP_PLUS);
    _t.insert(elf_t::MACHINE_CYPRESS_M8C);
    _t.insert(elf_t::MACHINE_R32C);
    _t.insert(elf_t::MACHINE_TRIMEDIA);
    _t.insert(elf_t::MACHINE_QDSP6);
    _t.insert(elf_t::MACHINE_I8051);
    _t.insert(elf_t::MACHINE_STXP7X);
    _t.insert(elf_t::MACHINE_NDS32);
    _t.insert(elf_t::MACHINE_ECOG1X);
    _t.insert(elf_t::MACHINE_MAXQ30);
    _t.insert(elf_t::MACHINE_XIMO16);
    _t.insert(elf_t::MACHINE_MANIK);
    _t.insert(elf_t::MACHINE_CRAYNV2);
    _t.insert(elf_t::MACHINE_RX);
    _t.insert(elf_t::MACHINE_METAG);
    _t.insert(elf_t::MACHINE_MCST_ELBRUS);
    _t.insert(elf_t::MACHINE_ECOG16);
    _t.insert(elf_t::MACHINE_CR16);
    _t.insert(elf_t::MACHINE_ETPU);
    _t.insert(elf_t::MACHINE_SLE9X);
    _t.insert(elf_t::MACHINE_L10M);
    _t.insert(elf_t::MACHINE_K10M);
    _t.insert(elf_t::MACHINE_AARCH64);
    _t.insert(elf_t::MACHINE_AVR32);
    _t.insert(elf_t::MACHINE_STM8);
    _t.insert(elf_t::MACHINE_TILE64);
    _t.insert(elf_t::MACHINE_TILEPRO);
    _t.insert(elf_t::MACHINE_MICROBLAZE);
    _t.insert(elf_t::MACHINE_CUDA);
    _t.insert(elf_t::MACHINE_TILEGX);
    _t.insert(elf_t::MACHINE_CLOUDSHIELD);
    _t.insert(elf_t::MACHINE_COREA_1ST);
    _t.insert(elf_t::MACHINE_COREA_2ND);
    _t.insert(elf_t::MACHINE_ARCV2);
    _t.insert(elf_t::MACHINE_OPEN8);
    _t.insert(elf_t::MACHINE_RL78);
    _t.insert(elf_t::MACHINE_VIDEOCORE5);
    _t.insert(elf_t::MACHINE_RENESAS_78KOR);
    _t.insert(elf_t::MACHINE_FREESCALE_56800EX);
    _t.insert(elf_t::MACHINE_BA1);
    _t.insert(elf_t::MACHINE_BA2);
    _t.insert(elf_t::MACHINE_XCORE);
    _t.insert(elf_t::MACHINE_MCHP_PIC);
    _t.insert(elf_t::MACHINE_INTELGT);
    _t.insert(elf_t::MACHINE_INTEL206);
    _t.insert(elf_t::MACHINE_INTEL207);
    _t.insert(elf_t::MACHINE_INTEL208);
    _t.insert(elf_t::MACHINE_INTEL209);
    _t.insert(elf_t::MACHINE_KM32);
    _t.insert(elf_t::MACHINE_KMX32);
    _t.insert(elf_t::MACHINE_KMX16);
    _t.insert(elf_t::MACHINE_KMX8);
    _t.insert(elf_t::MACHINE_KVARC);
    _t.insert(elf_t::MACHINE_CDP);
    _t.insert(elf_t::MACHINE_COGE);
    _t.insert(elf_t::MACHINE_COOL);
    _t.insert(elf_t::MACHINE_NORC);
    _t.insert(elf_t::MACHINE_CSR_KALIMBA);
    _t.insert(elf_t::MACHINE_Z80);
    _t.insert(elf_t::MACHINE_VISIUM);
    _t.insert(elf_t::MACHINE_FT32);
    _t.insert(elf_t::MACHINE_MOXIE);
    _t.insert(elf_t::MACHINE_AMD_GPU);
    _t.insert(elf_t::MACHINE_RISCV);
    _t.insert(elf_t::MACHINE_LANAI);
    _t.insert(elf_t::MACHINE_CEVA);
    _t.insert(elf_t::MACHINE_CEVA_X2);
    _t.insert(elf_t::MACHINE_BPF);
    _t.insert(elf_t::MACHINE_GRAPHCORE_IPU);
    _t.insert(elf_t::MACHINE_IMG1);
    _t.insert(elf_t::MACHINE_NFP);
    _t.insert(elf_t::MACHINE_VE);
    _t.insert(elf_t::MACHINE_CSKY);
    _t.insert(elf_t::MACHINE_ARC_COMPACT3_64);
    _t.insert(elf_t::MACHINE_MCS6502);
    _t.insert(elf_t::MACHINE_ARC_COMPACT3);
    _t.insert(elf_t::MACHINE_KVX);
    _t.insert(elf_t::MACHINE_WDC65816);
    _t.insert(elf_t::MACHINE_LOONGARCH);
    _t.insert(elf_t::MACHINE_KF32);
    _t.insert(elf_t::MACHINE_U16_U8CORE);
    _t.insert(elf_t::MACHINE_TACHYUM);
    _t.insert(elf_t::MACHINE_NXP_56800EF);
    _t.insert(elf_t::MACHINE_AVR_OLD);
    _t.insert(elf_t::MACHINE_MSP430_OLD);
    _t.insert(elf_t::MACHINE_ADAPTEVA_EPIPHANY);
    _t.insert(elf_t::MACHINE_MT);
    _t.insert(elf_t::MACHINE_CYGNUS_FR30);
    _t.insert(elf_t::MACHINE_WEBASSEMBLY);
    _t.insert(elf_t::MACHINE_XC16X);
    _t.insert(elf_t::MACHINE_S12Z);
    _t.insert(elf_t::MACHINE_CYGNUS_FRV);
    _t.insert(elf_t::MACHINE_DLX);
    _t.insert(elf_t::MACHINE_CYGNUS_D10V);
    _t.insert(elf_t::MACHINE_CYGNUS_D30V);
    _t.insert(elf_t::MACHINE_IP2K_OLD);
    _t.insert(elf_t::MACHINE_CYGNUS_POWERPC);
    _t.insert(elf_t::MACHINE_ALPHA);
    _t.insert(elf_t::MACHINE_CYGNUS_M32R);
    _t.insert(elf_t::MACHINE_CYGNUS_V850);
    _t.insert(elf_t::MACHINE_S390_OLD);
    _t.insert(elf_t::MACHINE_XTENSA_OLD);
    _t.insert(elf_t::MACHINE_XSTORMY16);
    _t.insert(elf_t::MACHINE_MICROBLAZE_OLD);
    _t.insert(elf_t::MACHINE_CYGNUS_MN10300);
    _t.insert(elf_t::MACHINE_CYGNUS_MN10200);
    _t.insert(elf_t::MACHINE_CYGNUS_MEP);
    _t.insert(elf_t::MACHINE_M32C_OLD);
    _t.insert(elf_t::MACHINE_IQ2000);
    _t.insert(elf_t::MACHINE_NIOS32);
    _t.insert(elf_t::MACHINE_MOXIE_OLD);
    return _t;
}
const std::set<elf_t::machine_t> elf_t::_values_machine_t = elf_t::_build_values_machine_t();
bool elf_t::_is_defined_machine_t(elf_t::machine_t v) {
    return elf_t::_values_machine_t.find(v) != elf_t::_values_machine_t.end();
}
std::set<elf_t::obj_type_t> elf_t::_build_values_obj_type_t() {
    std::set<elf_t::obj_type_t> _t;
    _t.insert(elf_t::OBJ_TYPE_NO_FILE_TYPE);
    _t.insert(elf_t::OBJ_TYPE_RELOCATABLE);
    _t.insert(elf_t::OBJ_TYPE_EXECUTABLE);
    _t.insert(elf_t::OBJ_TYPE_SHARED);
    _t.insert(elf_t::OBJ_TYPE_CORE);
    return _t;
}
const std::set<elf_t::obj_type_t> elf_t::_values_obj_type_t = elf_t::_build_values_obj_type_t();
bool elf_t::_is_defined_obj_type_t(elf_t::obj_type_t v) {
    return elf_t::_values_obj_type_t.find(v) != elf_t::_values_obj_type_t.end();
}
std::set<elf_t::os_abi_t> elf_t::_build_values_os_abi_t() {
    std::set<elf_t::os_abi_t> _t;
    _t.insert(elf_t::OS_ABI_SYSTEM_V);
    _t.insert(elf_t::OS_ABI_HP_UX);
    _t.insert(elf_t::OS_ABI_NETBSD);
    _t.insert(elf_t::OS_ABI_GNU);
    _t.insert(elf_t::OS_ABI_SOLARIS);
    _t.insert(elf_t::OS_ABI_AIX);
    _t.insert(elf_t::OS_ABI_IRIX);
    _t.insert(elf_t::OS_ABI_FREEBSD);
    _t.insert(elf_t::OS_ABI_TRU64);
    _t.insert(elf_t::OS_ABI_MODESTO);
    _t.insert(elf_t::OS_ABI_OPENBSD);
    _t.insert(elf_t::OS_ABI_OPENVMS);
    _t.insert(elf_t::OS_ABI_NSK);
    _t.insert(elf_t::OS_ABI_AROS);
    _t.insert(elf_t::OS_ABI_FENIXOS);
    _t.insert(elf_t::OS_ABI_CLOUDABI);
    _t.insert(elf_t::OS_ABI_OPENVOS);
    return _t;
}
const std::set<elf_t::os_abi_t> elf_t::_values_os_abi_t = elf_t::_build_values_os_abi_t();
bool elf_t::_is_defined_os_abi_t(elf_t::os_abi_t v) {
    return elf_t::_values_os_abi_t.find(v) != elf_t::_values_os_abi_t.end();
}
std::set<elf_t::ph_type_t> elf_t::_build_values_ph_type_t() {
    std::set<elf_t::ph_type_t> _t;
    _t.insert(elf_t::PH_TYPE_NULL_TYPE);
    _t.insert(elf_t::PH_TYPE_LOAD);
    _t.insert(elf_t::PH_TYPE_DYNAMIC);
    _t.insert(elf_t::PH_TYPE_INTERP);
    _t.insert(elf_t::PH_TYPE_NOTE);
    _t.insert(elf_t::PH_TYPE_SHLIB);
    _t.insert(elf_t::PH_TYPE_PHDR);
    _t.insert(elf_t::PH_TYPE_TLS);
    _t.insert(elf_t::PH_TYPE_GNU_EH_FRAME);
    _t.insert(elf_t::PH_TYPE_GNU_STACK);
    _t.insert(elf_t::PH_TYPE_GNU_RELRO);
    _t.insert(elf_t::PH_TYPE_GNU_PROPERTY);
    _t.insert(elf_t::PH_TYPE_PAX_FLAGS);
    _t.insert(elf_t::PH_TYPE_ARM_EXIDX);
    return _t;
}
const std::set<elf_t::ph_type_t> elf_t::_values_ph_type_t = elf_t::_build_values_ph_type_t();
bool elf_t::_is_defined_ph_type_t(elf_t::ph_type_t v) {
    return elf_t::_values_ph_type_t.find(v) != elf_t::_values_ph_type_t.end();
}
std::set<elf_t::section_header_idx_special_t> elf_t::_build_values_section_header_idx_special_t() {
    std::set<elf_t::section_header_idx_special_t> _t;
    _t.insert(elf_t::SECTION_HEADER_IDX_SPECIAL_UNDEFINED);
    _t.insert(elf_t::SECTION_HEADER_IDX_SPECIAL_BEFORE);
    _t.insert(elf_t::SECTION_HEADER_IDX_SPECIAL_AFTER);
    _t.insert(elf_t::SECTION_HEADER_IDX_SPECIAL_AMD64_LCOMMON);
    _t.insert(elf_t::SECTION_HEADER_IDX_SPECIAL_SUNW_IGNORE);
    _t.insert(elf_t::SECTION_HEADER_IDX_SPECIAL_ABS);
    _t.insert(elf_t::SECTION_HEADER_IDX_SPECIAL_COMMON);
    _t.insert(elf_t::SECTION_HEADER_IDX_SPECIAL_XINDEX);
    return _t;
}
const std::set<elf_t::section_header_idx_special_t> elf_t::_values_section_header_idx_special_t = elf_t::_build_values_section_header_idx_special_t();
bool elf_t::_is_defined_section_header_idx_special_t(elf_t::section_header_idx_special_t v) {
    return elf_t::_values_section_header_idx_special_t.find(v) != elf_t::_values_section_header_idx_special_t.end();
}
std::set<elf_t::sh_type_t> elf_t::_build_values_sh_type_t() {
    std::set<elf_t::sh_type_t> _t;
    _t.insert(elf_t::SH_TYPE_NULL_TYPE);
    _t.insert(elf_t::SH_TYPE_PROGBITS);
    _t.insert(elf_t::SH_TYPE_SYMTAB);
    _t.insert(elf_t::SH_TYPE_STRTAB);
    _t.insert(elf_t::SH_TYPE_RELA);
    _t.insert(elf_t::SH_TYPE_HASH);
    _t.insert(elf_t::SH_TYPE_DYNAMIC);
    _t.insert(elf_t::SH_TYPE_NOTE);
    _t.insert(elf_t::SH_TYPE_NOBITS);
    _t.insert(elf_t::SH_TYPE_REL);
    _t.insert(elf_t::SH_TYPE_SHLIB);
    _t.insert(elf_t::SH_TYPE_DYNSYM);
    _t.insert(elf_t::SH_TYPE_INIT_ARRAY);
    _t.insert(elf_t::SH_TYPE_FINI_ARRAY);
    _t.insert(elf_t::SH_TYPE_PREINIT_ARRAY);
    _t.insert(elf_t::SH_TYPE_GROUP);
    _t.insert(elf_t::SH_TYPE_SYMTAB_SHNDX);
    _t.insert(elf_t::SH_TYPE_RELR);
    _t.insert(elf_t::SH_TYPE_SUNW_SYMNSORT);
    _t.insert(elf_t::SH_TYPE_SUNW_PHNAME);
    _t.insert(elf_t::SH_TYPE_SUNW_ANCILLARY);
    _t.insert(elf_t::SH_TYPE_SUNW_CAPCHAIN);
    _t.insert(elf_t::SH_TYPE_SUNW_CAPINFO);
    _t.insert(elf_t::SH_TYPE_SUNW_SYMSORT);
    _t.insert(elf_t::SH_TYPE_SUNW_TLSSORT);
    _t.insert(elf_t::SH_TYPE_SUNW_LDYNSYM);
    _t.insert(elf_t::SH_TYPE_SUNW_DOF);
    _t.insert(elf_t::SH_TYPE_SUNW_CAP);
    _t.insert(elf_t::SH_TYPE_SUNW_SIGNATURE);
    _t.insert(elf_t::SH_TYPE_SUNW_ANNOTATE);
    _t.insert(elf_t::SH_TYPE_SUNW_DEBUGSTR);
    _t.insert(elf_t::SH_TYPE_SUNW_DEBUG);
    _t.insert(elf_t::SH_TYPE_SUNW_MOVE);
    _t.insert(elf_t::SH_TYPE_SUNW_COMDAT);
    _t.insert(elf_t::SH_TYPE_SUNW_SYMINFO);
    _t.insert(elf_t::SH_TYPE_SUNW_VERDEF);
    _t.insert(elf_t::SH_TYPE_SUNW_VERNEED);
    _t.insert(elf_t::SH_TYPE_SUNW_VERSYM);
    _t.insert(elf_t::SH_TYPE_SPARC_GOTDATA);
    _t.insert(elf_t::SH_TYPE_AMD64_UNWIND);
    _t.insert(elf_t::SH_TYPE_ARM_PREEMPTMAP);
    _t.insert(elf_t::SH_TYPE_ARM_ATTRIBUTES);
    _t.insert(elf_t::SH_TYPE_ARM_DEBUGOVERLAY);
    _t.insert(elf_t::SH_TYPE_ARM_OVERLAYSECTION);
    return _t;
}
const std::set<elf_t::sh_type_t> elf_t::_values_sh_type_t = elf_t::_build_values_sh_type_t();
bool elf_t::_is_defined_sh_type_t(elf_t::sh_type_t v) {
    return elf_t::_values_sh_type_t.find(v) != elf_t::_values_sh_type_t.end();
}
std::set<elf_t::symbol_binding_t> elf_t::_build_values_symbol_binding_t() {
    std::set<elf_t::symbol_binding_t> _t;
    _t.insert(elf_t::SYMBOL_BINDING_LOCAL);
    _t.insert(elf_t::SYMBOL_BINDING_GLOBAL_SYMBOL);
    _t.insert(elf_t::SYMBOL_BINDING_WEAK);
    _t.insert(elf_t::SYMBOL_BINDING_OS10);
    _t.insert(elf_t::SYMBOL_BINDING_OS11);
    _t.insert(elf_t::SYMBOL_BINDING_OS12);
    _t.insert(elf_t::SYMBOL_BINDING_PROC13);
    _t.insert(elf_t::SYMBOL_BINDING_PROC14);
    _t.insert(elf_t::SYMBOL_BINDING_PROC15);
    return _t;
}
const std::set<elf_t::symbol_binding_t> elf_t::_values_symbol_binding_t = elf_t::_build_values_symbol_binding_t();
bool elf_t::_is_defined_symbol_binding_t(elf_t::symbol_binding_t v) {
    return elf_t::_values_symbol_binding_t.find(v) != elf_t::_values_symbol_binding_t.end();
}
std::set<elf_t::symbol_type_t> elf_t::_build_values_symbol_type_t() {
    std::set<elf_t::symbol_type_t> _t;
    _t.insert(elf_t::SYMBOL_TYPE_NO_TYPE);
    _t.insert(elf_t::SYMBOL_TYPE_OBJECT);
    _t.insert(elf_t::SYMBOL_TYPE_FUNC);
    _t.insert(elf_t::SYMBOL_TYPE_SECTION);
    _t.insert(elf_t::SYMBOL_TYPE_FILE);
    _t.insert(elf_t::SYMBOL_TYPE_COMMON);
    _t.insert(elf_t::SYMBOL_TYPE_TLS);
    _t.insert(elf_t::SYMBOL_TYPE_RELC);
    _t.insert(elf_t::SYMBOL_TYPE_SRELC);
    _t.insert(elf_t::SYMBOL_TYPE_GNU_IFUNC);
    _t.insert(elf_t::SYMBOL_TYPE_OS11);
    _t.insert(elf_t::SYMBOL_TYPE_OS12);
    _t.insert(elf_t::SYMBOL_TYPE_PROC13);
    _t.insert(elf_t::SYMBOL_TYPE_PROC14);
    _t.insert(elf_t::SYMBOL_TYPE_PROC15);
    return _t;
}
const std::set<elf_t::symbol_type_t> elf_t::_values_symbol_type_t = elf_t::_build_values_symbol_type_t();
bool elf_t::_is_defined_symbol_type_t(elf_t::symbol_type_t v) {
    return elf_t::_values_symbol_type_t.find(v) != elf_t::_values_symbol_type_t.end();
}
std::set<elf_t::symbol_visibility_t> elf_t::_build_values_symbol_visibility_t() {
    std::set<elf_t::symbol_visibility_t> _t;
    _t.insert(elf_t::SYMBOL_VISIBILITY_DEFAULT);
    _t.insert(elf_t::SYMBOL_VISIBILITY_INTERNAL);
    _t.insert(elf_t::SYMBOL_VISIBILITY_HIDDEN);
    _t.insert(elf_t::SYMBOL_VISIBILITY_PROTECTED);
    _t.insert(elf_t::SYMBOL_VISIBILITY_EXPORTED);
    _t.insert(elf_t::SYMBOL_VISIBILITY_SINGLETON);
    _t.insert(elf_t::SYMBOL_VISIBILITY_ELIMINATE);
    return _t;
}
const std::set<elf_t::symbol_visibility_t> elf_t::_values_symbol_visibility_t = elf_t::_build_values_symbol_visibility_t();
bool elf_t::_is_defined_symbol_visibility_t(elf_t::symbol_visibility_t v) {
    return elf_t::_values_symbol_visibility_t.find(v) != elf_t::_values_symbol_visibility_t.end();
}

elf_t::elf_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, elf_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root ? p__root : this;
    m_header = 0;
    f_sh_idx_hi_os = false;
    f_sh_idx_hi_proc = false;
    f_sh_idx_hi_reserved = false;
    f_sh_idx_lo_os = false;
    f_sh_idx_lo_proc = false;
    f_sh_idx_lo_reserved = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
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
    m_header = new endian_elf_t(m__io, this, m__root);
}

elf_t::~elf_t() {
    _clean_up();
}

void elf_t::_clean_up() {
    if (m_header) {
        delete m_header; m_header = 0;
    }
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

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
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

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
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
    m_program_headers = 0;
    m__raw_program_headers = 0;
    m__io__raw_program_headers = 0;
    m_section_headers = 0;
    m__raw_section_headers = 0;
    m__io__raw_section_headers = 0;
    m_section_names = 0;
    m__io__raw_section_names = 0;
    f_program_headers = false;
    f_section_headers = false;
    f_section_names = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
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
        if (m__raw_program_headers) {
            delete m__raw_program_headers; m__raw_program_headers = 0;
        }
        if (m__io__raw_program_headers) {
            for (std::vector<kaitai::kstream*>::iterator it = m__io__raw_program_headers->begin(); it != m__io__raw_program_headers->end(); ++it) {
                delete *it;
            }
            delete m__io__raw_program_headers; m__io__raw_program_headers = 0;
        }
        if (m_program_headers) {
            for (std::vector<program_header_t*>::iterator it = m_program_headers->begin(); it != m_program_headers->end(); ++it) {
                delete *it;
            }
            delete m_program_headers; m_program_headers = 0;
        }
    }
    if (f_section_headers) {
        if (m__raw_section_headers) {
            delete m__raw_section_headers; m__raw_section_headers = 0;
        }
        if (m__io__raw_section_headers) {
            for (std::vector<kaitai::kstream*>::iterator it = m__io__raw_section_headers->begin(); it != m__io__raw_section_headers->end(); ++it) {
                delete *it;
            }
            delete m__io__raw_section_headers; m__io__raw_section_headers = 0;
        }
        if (m_section_headers) {
            for (std::vector<section_header_t*>::iterator it = m_section_headers->begin(); it != m_section_headers->end(); ++it) {
                delete *it;
            }
            delete m_section_headers; m_section_headers = 0;
        }
    }
    if (f_section_names && !n_section_names) {
        if (m__io__raw_section_names) {
            delete m__io__raw_section_names; m__io__raw_section_names = 0;
        }
        if (m_section_names) {
            delete m_section_names; m_section_names = 0;
        }
    }
}

elf_t::endian_elf_t::dynamic_section_t::dynamic_section_t(kaitai::kstream* p__io, elf_t::endian_elf_t::section_header_t* p__parent, elf_t* p__root, int p_is_le) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m__is_le = p_is_le;
    m_entries = 0;
    f_is_string_table_linked = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
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
    m_entries = new std::vector<dynamic_section_entry_t*>();
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_entries->push_back(new dynamic_section_entry_t(m__io, this, m__root, m__is_le));
            i++;
        }
    }
}

void elf_t::endian_elf_t::dynamic_section_t::_read_be() {
    m_entries = new std::vector<dynamic_section_entry_t*>();
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_entries->push_back(new dynamic_section_entry_t(m__io, this, m__root, m__is_le));
            i++;
        }
    }
}

elf_t::endian_elf_t::dynamic_section_t::~dynamic_section_t() {
    _clean_up();
}

void elf_t::endian_elf_t::dynamic_section_t::_clean_up() {
    if (m_entries) {
        for (std::vector<dynamic_section_entry_t*>::iterator it = m_entries->begin(); it != m_entries->end(); ++it) {
            delete *it;
        }
        delete m_entries; m_entries = 0;
    }
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
    m_flag_1_values = 0;
    m_flag_values = 0;
    f_flag_1_values = false;
    f_flag_values = false;
    f_is_value_str = false;
    f_tag_enum = false;
    f_value_str = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
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
        if (m_flag_1_values) {
            delete m_flag_1_values; m_flag_1_values = 0;
        }
    }
    if (f_flag_values && !n_flag_values) {
        if (m_flag_values) {
            delete m_flag_values; m_flag_values = 0;
        }
    }
    if (f_value_str && !n_value_str) {
    }
}

elf_t::dt_flag_1_values_t* elf_t::endian_elf_t::dynamic_section_entry_t::flag_1_values() {
    if (f_flag_1_values)
        return m_flag_1_values;
    f_flag_1_values = true;
    n_flag_1_values = true;
    if (tag_enum() == elf_t::DYNAMIC_ARRAY_TAGS_FLAGS_1) {
        n_flag_1_values = false;
        if (m__is_le == 1) {
            m_flag_1_values = new dt_flag_1_values_t(value_or_ptr(), m__io, this, m__root);
        } else {
            m_flag_1_values = new dt_flag_1_values_t(value_or_ptr(), m__io, this, m__root);
        }
    }
    return m_flag_1_values;
}

elf_t::dt_flag_values_t* elf_t::endian_elf_t::dynamic_section_entry_t::flag_values() {
    if (f_flag_values)
        return m_flag_values;
    f_flag_values = true;
    n_flag_values = true;
    if (tag_enum() == elf_t::DYNAMIC_ARRAY_TAGS_FLAGS) {
        n_flag_values = false;
        if (m__is_le == 1) {
            m_flag_values = new dt_flag_values_t(value_or_ptr(), m__io, this, m__root);
        } else {
            m_flag_values = new dt_flag_values_t(value_or_ptr(), m__io, this, m__root);
        }
    }
    return m_flag_values;
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
    m_entries = 0;
    f_is_string_table_linked = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
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
    m_entries = new std::vector<dynsym_section_entry_t*>();
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_entries->push_back(new dynsym_section_entry_t(m__io, this, m__root, m__is_le));
            i++;
        }
    }
}

void elf_t::endian_elf_t::dynsym_section_t::_read_be() {
    m_entries = new std::vector<dynsym_section_entry_t*>();
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_entries->push_back(new dynsym_section_entry_t(m__io, this, m__root, m__is_le));
            i++;
        }
    }
}

elf_t::endian_elf_t::dynsym_section_t::~dynsym_section_t() {
    _clean_up();
}

void elf_t::endian_elf_t::dynsym_section_t::_clean_up() {
    if (m_entries) {
        for (std::vector<dynsym_section_entry_t*>::iterator it = m_entries->begin(); it != m_entries->end(); ++it) {
            delete *it;
        }
        delete m_entries; m_entries = 0;
    }
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

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
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
    m_entries = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
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
    m_entries = new std::vector<note_section_entry_t*>();
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_entries->push_back(new note_section_entry_t(m__io, this, m__root, m__is_le));
            i++;
        }
    }
}

void elf_t::endian_elf_t::note_section_t::_read_be() {
    m_entries = new std::vector<note_section_entry_t*>();
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_entries->push_back(new note_section_entry_t(m__io, this, m__root, m__is_le));
            i++;
        }
    }
}

elf_t::endian_elf_t::note_section_t::~note_section_t() {
    _clean_up();
}

void elf_t::endian_elf_t::note_section_t::_clean_up() {
    if (m_entries) {
        for (std::vector<note_section_entry_t*>::iterator it = m_entries->begin(); it != m_entries->end(); ++it) {
            delete *it;
        }
        delete m_entries; m_entries = 0;
    }
}

elf_t::endian_elf_t::note_section_entry_t::note_section_entry_t(kaitai::kstream* p__io, elf_t::endian_elf_t::note_section_t* p__parent, elf_t* p__root, int p_is_le) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m__is_le = p_is_le;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
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

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
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
        if (m_flags_obj) {
            delete m_flags_obj; m_flags_obj = 0;
        }
    }
}

elf_t::phdr_type_flags_t* elf_t::endian_elf_t::program_header_t::flags_obj() {
    if (f_flags_obj)
        return m_flags_obj;
    f_flags_obj = true;
    if (m__is_le == 1) {
        n_flags_obj = true;
        switch (_root()->bits()) {
        case elf_t::BITS_B32: {
            n_flags_obj = false;
            m_flags_obj = new phdr_type_flags_t(flags32(), m__io, this, m__root);
            break;
        }
        case elf_t::BITS_B64: {
            n_flags_obj = false;
            m_flags_obj = new phdr_type_flags_t(flags64(), m__io, this, m__root);
            break;
        }
        }
    } else {
        n_flags_obj = true;
        switch (_root()->bits()) {
        case elf_t::BITS_B32: {
            n_flags_obj = false;
            m_flags_obj = new phdr_type_flags_t(flags32(), m__io, this, m__root);
            break;
        }
        case elf_t::BITS_B64: {
            n_flags_obj = false;
            m_flags_obj = new phdr_type_flags_t(flags64(), m__io, this, m__root);
            break;
        }
        }
    }
    return m_flags_obj;
}

elf_t::endian_elf_t::relocation_section_t::relocation_section_t(bool p_has_addend, kaitai::kstream* p__io, elf_t::endian_elf_t::section_header_t* p__parent, elf_t* p__root, int p_is_le) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m__is_le = p_is_le;
    m_has_addend = p_has_addend;
    m_entries = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
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
    m_entries = new std::vector<relocation_section_entry_t*>();
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_entries->push_back(new relocation_section_entry_t(m__io, this, m__root, m__is_le));
            i++;
        }
    }
}

void elf_t::endian_elf_t::relocation_section_t::_read_be() {
    m_entries = new std::vector<relocation_section_entry_t*>();
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_entries->push_back(new relocation_section_entry_t(m__io, this, m__root, m__is_le));
            i++;
        }
    }
}

elf_t::endian_elf_t::relocation_section_t::~relocation_section_t() {
    _clean_up();
}

void elf_t::endian_elf_t::relocation_section_t::_clean_up() {
    if (m_entries) {
        for (std::vector<relocation_section_entry_t*>::iterator it = m_entries->begin(); it != m_entries->end(); ++it) {
            delete *it;
        }
        delete m_entries; m_entries = 0;
    }
}

elf_t::endian_elf_t::relocation_section_entry_t::relocation_section_entry_t(kaitai::kstream* p__io, elf_t::endian_elf_t::relocation_section_t* p__parent, elf_t* p__root, int p_is_le) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m__is_le = p_is_le;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
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
    m__io__raw_body = 0;
    m_flags_obj = 0;
    f_body = false;
    f_flags_obj = false;
    f_linked_section = false;
    f_name = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
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
        if (m__io__raw_body) {
            delete m__io__raw_body; m__io__raw_body = 0;
        }
        if (m_body) {
            delete m_body; m_body = 0;
        }
    }
    if (f_flags_obj) {
        if (m_flags_obj) {
            delete m_flags_obj; m_flags_obj = 0;
        }
    }
    if (f_name) {
    }
}

kaitai::kstruct* elf_t::endian_elf_t::section_header_t::body() {
    if (f_body)
        return m_body;
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
                m__io__raw_body = new kaitai::kstream(m__raw_body);
                m_body = new dynamic_section_t(m__io__raw_body, this, m__root, m__is_le);
                break;
            }
            case elf_t::SH_TYPE_DYNSYM: {
                n_body = false;
                m__raw_body = io->read_bytes(len_body());
                m__io__raw_body = new kaitai::kstream(m__raw_body);
                m_body = new dynsym_section_t(m__io__raw_body, this, m__root, m__is_le);
                break;
            }
            case elf_t::SH_TYPE_NOTE: {
                n_body = false;
                m__raw_body = io->read_bytes(len_body());
                m__io__raw_body = new kaitai::kstream(m__raw_body);
                m_body = new note_section_t(m__io__raw_body, this, m__root, m__is_le);
                break;
            }
            case elf_t::SH_TYPE_REL: {
                n_body = false;
                m__raw_body = io->read_bytes(len_body());
                m__io__raw_body = new kaitai::kstream(m__raw_body);
                m_body = new relocation_section_t(false, m__io__raw_body, this, m__root, m__is_le);
                break;
            }
            case elf_t::SH_TYPE_RELA: {
                n_body = false;
                m__raw_body = io->read_bytes(len_body());
                m__io__raw_body = new kaitai::kstream(m__raw_body);
                m_body = new relocation_section_t(true, m__io__raw_body, this, m__root, m__is_le);
                break;
            }
            case elf_t::SH_TYPE_STRTAB: {
                n_body = false;
                m__raw_body = io->read_bytes(len_body());
                m__io__raw_body = new kaitai::kstream(m__raw_body);
                m_body = new strings_struct_t(m__io__raw_body, this, m__root, m__is_le);
                break;
            }
            case elf_t::SH_TYPE_SYMTAB: {
                n_body = false;
                m__raw_body = io->read_bytes(len_body());
                m__io__raw_body = new kaitai::kstream(m__raw_body);
                m_body = new dynsym_section_t(m__io__raw_body, this, m__root, m__is_le);
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
                m__io__raw_body = new kaitai::kstream(m__raw_body);
                m_body = new dynamic_section_t(m__io__raw_body, this, m__root, m__is_le);
                break;
            }
            case elf_t::SH_TYPE_DYNSYM: {
                n_body = false;
                m__raw_body = io->read_bytes(len_body());
                m__io__raw_body = new kaitai::kstream(m__raw_body);
                m_body = new dynsym_section_t(m__io__raw_body, this, m__root, m__is_le);
                break;
            }
            case elf_t::SH_TYPE_NOTE: {
                n_body = false;
                m__raw_body = io->read_bytes(len_body());
                m__io__raw_body = new kaitai::kstream(m__raw_body);
                m_body = new note_section_t(m__io__raw_body, this, m__root, m__is_le);
                break;
            }
            case elf_t::SH_TYPE_REL: {
                n_body = false;
                m__raw_body = io->read_bytes(len_body());
                m__io__raw_body = new kaitai::kstream(m__raw_body);
                m_body = new relocation_section_t(false, m__io__raw_body, this, m__root, m__is_le);
                break;
            }
            case elf_t::SH_TYPE_RELA: {
                n_body = false;
                m__raw_body = io->read_bytes(len_body());
                m__io__raw_body = new kaitai::kstream(m__raw_body);
                m_body = new relocation_section_t(true, m__io__raw_body, this, m__root, m__is_le);
                break;
            }
            case elf_t::SH_TYPE_STRTAB: {
                n_body = false;
                m__raw_body = io->read_bytes(len_body());
                m__io__raw_body = new kaitai::kstream(m__raw_body);
                m_body = new strings_struct_t(m__io__raw_body, this, m__root, m__is_le);
                break;
            }
            case elf_t::SH_TYPE_SYMTAB: {
                n_body = false;
                m__raw_body = io->read_bytes(len_body());
                m__io__raw_body = new kaitai::kstream(m__raw_body);
                m_body = new dynsym_section_t(m__io__raw_body, this, m__root, m__is_le);
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
    return m_body;
}

elf_t::section_header_flags_t* elf_t::endian_elf_t::section_header_t::flags_obj() {
    if (f_flags_obj)
        return m_flags_obj;
    f_flags_obj = true;
    if (m__is_le == 1) {
        m_flags_obj = new section_header_flags_t(flags(), m__io, this, m__root);
    } else {
        m_flags_obj = new section_header_flags_t(flags(), m__io, this, m__root);
    }
    return m_flags_obj;
}

elf_t::endian_elf_t::section_header_t* elf_t::endian_elf_t::section_header_t::linked_section() {
    if (f_linked_section)
        return m_linked_section;
    f_linked_section = true;
    n_linked_section = true;
    if ( ((linked_section_idx() != elf_t::SECTION_HEADER_IDX_SPECIAL_UNDEFINED) && (linked_section_idx() < _root()->header()->num_section_headers())) ) {
        n_linked_section = false;
        m_linked_section = _root()->header()->section_headers()->at(linked_section_idx());
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
    m_entries = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
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
    m_entries = new std::vector<std::string>();
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_entries->push_back(kaitai::kstream::bytes_to_str(m__io->read_bytes_term(0, false, true, true), "UTF-8"));
            i++;
        }
    }
}

void elf_t::endian_elf_t::strings_struct_t::_read_be() {
    m_entries = new std::vector<std::string>();
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_entries->push_back(kaitai::kstream::bytes_to_str(m__io->read_bytes_term(0, false, true, true), "UTF-8"));
            i++;
        }
    }
}

elf_t::endian_elf_t::strings_struct_t::~strings_struct_t() {
    _clean_up();
}

void elf_t::endian_elf_t::strings_struct_t::_clean_up() {
    if (m_entries) {
        delete m_entries; m_entries = 0;
    }
}

std::vector<elf_t::endian_elf_t::program_header_t*>* elf_t::endian_elf_t::program_headers() {
    if (f_program_headers)
        return m_program_headers;
    f_program_headers = true;
    std::streampos _pos = m__io->pos();
    m__io->seek(ofs_program_headers());
    if (m__is_le == 1) {
        m__raw_program_headers = new std::vector<std::string>();
        m__io__raw_program_headers = new std::vector<kaitai::kstream*>();
        m_program_headers = new std::vector<program_header_t*>();
        const int l_program_headers = num_program_headers();
        for (int i = 0; i < l_program_headers; i++) {
            m__raw_program_headers->push_back(m__io->read_bytes(program_header_size()));
            kaitai::kstream* io__raw_program_headers = new kaitai::kstream(m__raw_program_headers->at(m__raw_program_headers->size() - 1));
            m__io__raw_program_headers->push_back(io__raw_program_headers);
            m_program_headers->push_back(new program_header_t(io__raw_program_headers, this, m__root, m__is_le));
        }
    } else {
        m__raw_program_headers = new std::vector<std::string>();
        m__io__raw_program_headers = new std::vector<kaitai::kstream*>();
        m_program_headers = new std::vector<program_header_t*>();
        const int l_program_headers = num_program_headers();
        for (int i = 0; i < l_program_headers; i++) {
            m__raw_program_headers->push_back(m__io->read_bytes(program_header_size()));
            kaitai::kstream* io__raw_program_headers = new kaitai::kstream(m__raw_program_headers->at(m__raw_program_headers->size() - 1));
            m__io__raw_program_headers->push_back(io__raw_program_headers);
            m_program_headers->push_back(new program_header_t(io__raw_program_headers, this, m__root, m__is_le));
        }
    }
    m__io->seek(_pos);
    return m_program_headers;
}

std::vector<elf_t::endian_elf_t::section_header_t*>* elf_t::endian_elf_t::section_headers() {
    if (f_section_headers)
        return m_section_headers;
    f_section_headers = true;
    std::streampos _pos = m__io->pos();
    m__io->seek(ofs_section_headers());
    if (m__is_le == 1) {
        m__raw_section_headers = new std::vector<std::string>();
        m__io__raw_section_headers = new std::vector<kaitai::kstream*>();
        m_section_headers = new std::vector<section_header_t*>();
        const int l_section_headers = num_section_headers();
        for (int i = 0; i < l_section_headers; i++) {
            m__raw_section_headers->push_back(m__io->read_bytes(section_header_size()));
            kaitai::kstream* io__raw_section_headers = new kaitai::kstream(m__raw_section_headers->at(m__raw_section_headers->size() - 1));
            m__io__raw_section_headers->push_back(io__raw_section_headers);
            m_section_headers->push_back(new section_header_t(io__raw_section_headers, this, m__root, m__is_le));
        }
    } else {
        m__raw_section_headers = new std::vector<std::string>();
        m__io__raw_section_headers = new std::vector<kaitai::kstream*>();
        m_section_headers = new std::vector<section_header_t*>();
        const int l_section_headers = num_section_headers();
        for (int i = 0; i < l_section_headers; i++) {
            m__raw_section_headers->push_back(m__io->read_bytes(section_header_size()));
            kaitai::kstream* io__raw_section_headers = new kaitai::kstream(m__raw_section_headers->at(m__raw_section_headers->size() - 1));
            m__io__raw_section_headers->push_back(io__raw_section_headers);
            m_section_headers->push_back(new section_header_t(io__raw_section_headers, this, m__root, m__is_le));
        }
    }
    m__io->seek(_pos);
    return m_section_headers;
}

elf_t::endian_elf_t::strings_struct_t* elf_t::endian_elf_t::section_names() {
    if (f_section_names)
        return m_section_names;
    f_section_names = true;
    n_section_names = true;
    if ( ((section_names_idx() != elf_t::SECTION_HEADER_IDX_SPECIAL_UNDEFINED) && (section_names_idx() < _root()->header()->num_section_headers())) ) {
        n_section_names = false;
        std::streampos _pos = m__io->pos();
        m__io->seek(section_headers()->at(section_names_idx())->ofs_body());
        if (m__is_le == 1) {
            m__raw_section_names = m__io->read_bytes(section_headers()->at(section_names_idx())->len_body());
            m__io__raw_section_names = new kaitai::kstream(m__raw_section_names);
            m_section_names = new strings_struct_t(m__io__raw_section_names, this, m__root, m__is_le);
        } else {
            m__raw_section_names = m__io->read_bytes(section_headers()->at(section_names_idx())->len_body());
            m__io__raw_section_names = new kaitai::kstream(m__raw_section_names);
            m_section_names = new strings_struct_t(m__io__raw_section_names, this, m__root, m__is_le);
        }
        m__io->seek(_pos);
    }
    return m_section_names;
}

elf_t::phdr_type_flags_t::phdr_type_flags_t(uint32_t p_value, kaitai::kstream* p__io, elf_t::endian_elf_t::program_header_t* p__parent, elf_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_value = p_value;
    f_execute = false;
    f_mask_proc = false;
    f_read = false;
    f_write = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
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

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
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
