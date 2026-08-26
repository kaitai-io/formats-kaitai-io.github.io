-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
local enum = require("enum")
local stringstream = require("string_stream")
local str_decode = require("string_decode")
local utils = require("utils")

-- 
-- See also: Source (https://forge.sourceware.org/glibc/glibc-mirror/src/tag/glibc-2.43/elf/elf.h)
-- See also: Source (https://refspecs.linuxfoundation.org/elf/gabi4+/contents.html)
-- See also: Source (https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/elf-application-binary-interface.html)
Elf = class.class(KaitaiStruct)

Elf.Bits = enum.Enum {
  b32 = 1,
  b64 = 2,
}

Elf.DynamicArrayTags = enum.Enum {
  null = 0,
  needed = 1,
  pltrelsz = 2,
  pltgot = 3,
  hash = 4,
  strtab = 5,
  symtab = 6,
  rela = 7,
  relasz = 8,
  relaent = 9,
  strsz = 10,
  syment = 11,
  init = 12,
  fini = 13,
  soname = 14,
  rpath = 15,
  symbolic = 16,
  rel = 17,
  relsz = 18,
  relent = 19,
  pltrel = 20,
  debug = 21,
  textrel = 22,
  jmprel = 23,
  bind_now = 24,
  init_array = 25,
  fini_array = 26,
  init_arraysz = 27,
  fini_arraysz = 28,
  runpath = 29,
  flags = 30,
  preinit_array = 32,
  preinit_arraysz = 33,
  symtab_shndx = 34,
  relrsz = 35,
  relr = 36,
  relrent = 37,
  deprecated_sparc_register = 117440513,
  sunw_auxiliary = 1610612749,
  sunw_rtldinf = 1610612750,
  sunw_filter = 1610612751,
  sunw_cap = 1610612752,
  sunw_symtab = 1610612753,
  sunw_symsz = 1610612754,
  sunw_sortent = 1610612755,
  sunw_symsort = 1610612756,
  sunw_symsortsz = 1610612757,
  sunw_tlssort = 1610612758,
  sunw_tlssortsz = 1610612759,
  sunw_capinfo = 1610612760,
  sunw_strpad = 1610612761,
  sunw_capchain = 1610612762,
  sunw_ldmach = 1610612763,
  sunw_symtab_shndx = 1610612764,
  sunw_capchainent = 1610612765,
  sunw_deferred = 1610612766,
  sunw_capchainsz = 1610612767,
  sunw_phname = 1610612768,
  sunw_parent = 1610612769,
  sunw_sx_aslr = 1610612771,
  sunw_relax = 1610612773,
  sunw_kmod = 1610612775,
  sunw_sx_nxheap = 1610612777,
  sunw_sx_nxstack = 1610612779,
  sunw_sx_adiheap = 1610612781,
  sunw_sx_adistack = 1610612783,
  sunw_sx_ssbd = 1610612785,
  sunw_symnsort = 1610612786,
  sunw_symnsortsz = 1610612787,
  gnu_flags_1 = 1879047668,
  gnu_prelinked = 1879047669,
  gnu_conflictsz = 1879047670,
  gnu_liblistsz = 1879047671,
  checksum = 1879047672,
  pltpadsz = 1879047673,
  moveent = 1879047674,
  movesz = 1879047675,
  feature_1 = 1879047676,
  posflag_1 = 1879047677,
  syminsz = 1879047678,
  syminent = 1879047679,
  gnu_hash = 1879047925,
  tlsdesc_plt = 1879047926,
  tlsdesc_got = 1879047927,
  gnu_conflict = 1879047928,
  gnu_liblist = 1879047929,
  config = 1879047930,
  depaudit = 1879047931,
  audit = 1879047932,
  pltpad = 1879047933,
  movetab = 1879047934,
  syminfo = 1879047935,
  versym = 1879048176,
  relacount = 1879048185,
  relcount = 1879048186,
  flags_1 = 1879048187,
  verdef = 1879048188,
  verdefnum = 1879048189,
  verneed = 1879048190,
  verneednum = 1879048191,
  sparc_register = 1879048193,
  auxiliary = 2147483645,
  used = 2147483646,
  filter = 2147483647,
}

Elf.Endian = enum.Enum {
  le = 1,
  be = 2,
}

Elf.Machine = enum.Enum {
  no_machine = 0,
  m32 = 1,
  sparc = 2,
  i386 = 3,
  m68k = 4,
  m88k = 5,
  iamcu = 6,
  i860 = 7,
  mips = 8,
  s370 = 9,
  mips_rs3_le = 10,
  old_sparc_v9 = 11,
  parisc = 15,
  vpp500 = 17,
  sparc32plus = 18,
  i960 = 19,
  powerpc = 20,
  powerpc64 = 21,
  s390 = 22,
  spu = 23,
  v800 = 36,
  fr20 = 37,
  rh32 = 38,
  mcore = 39,
  arm = 40,
  old_alpha = 41,
  superh = 42,
  sparc_v9 = 43,
  tricore = 44,
  arc = 45,
  h8_300 = 46,
  h8_300h = 47,
  h8s = 48,
  h8_500 = 49,
  ia_64 = 50,
  mips_x = 51,
  coldfire = 52,
  m68hc12 = 53,
  mma = 54,
  pcp = 55,
  ncpu = 56,
  ndr1 = 57,
  starcore = 58,
  me16 = 59,
  st100 = 60,
  tinyj = 61,
  x86_64 = 62,
  pdsp = 63,
  pdp10 = 64,
  pdp11 = 65,
  fx66 = 66,
  st9plus = 67,
  st7 = 68,
  m68hc16 = 69,
  m68hc11 = 70,
  m68hc08 = 71,
  m68hc05 = 72,
  svx = 73,
  st19 = 74,
  vax = 75,
  cris = 76,
  javelin = 77,
  firepath = 78,
  zsp = 79,
  mmix = 80,
  huany = 81,
  prism = 82,
  avr = 83,
  fr30 = 84,
  d10v = 85,
  d30v = 86,
  v850 = 87,
  m32r = 88,
  mn10300 = 89,
  mn10200 = 90,
  picojava = 91,
  or1k = 92,
  arc_compact = 93,
  xtensa = 94,
  videocore = 95,
  tmm_gpp = 96,
  ns32k = 97,
  tpc = 98,
  snp1k = 99,
  st200 = 100,
  ip2k = 101,
  max = 102,
  cr = 103,
  f2mc16 = 104,
  msp430 = 105,
  blackfin = 106,
  se_c33 = 107,
  sep = 108,
  arca = 109,
  unicore = 110,
  excess = 111,
  dxp = 112,
  altera_nios2 = 113,
  crx = 114,
  xgate = 115,
  c166 = 116,
  m16c = 117,
  dspic30f = 118,
  freescale_ce = 119,
  m32c = 120,
  tsk3000 = 131,
  rs08 = 132,
  sharc = 133,
  ecog2 = 134,
  score7 = 135,
  dsp24 = 136,
  videocore3 = 137,
  latticemico32 = 138,
  se_c17 = 139,
  ti_c6000 = 140,
  ti_c2000 = 141,
  ti_c5500 = 142,
  ti_arp32 = 143,
  ti_pru = 144,
  mmdsp_plus = 160,
  cypress_m8c = 161,
  r32c = 162,
  trimedia = 163,
  qdsp6 = 164,
  i8051 = 165,
  stxp7x = 166,
  nds32 = 167,
  ecog1x = 168,
  maxq30 = 169,
  ximo16 = 170,
  manik = 171,
  cray_nv2 = 172,
  rx = 173,
  metag = 174,
  mcst_elbrus = 175,
  ecog16 = 176,
  cr16 = 177,
  etpu = 178,
  sle9x = 179,
  l1om = 180,
  k1om = 181,
  intel182 = 182,
  aarch64 = 183,
  arm184 = 184,
  avr32 = 185,
  stm8 = 186,
  tile64 = 187,
  tilepro = 188,
  microblaze = 189,
  cuda = 190,
  tilegx = 191,
  cloudshield = 192,
  corea_1st = 193,
  corea_2nd = 194,
  arc_compact2 = 195,
  open8 = 196,
  rl78 = 197,
  videocore5 = 198,
  renesas_78k0r = 199,
  freescale_56800ex = 200,
  ba1 = 201,
  ba2 = 202,
  xcore = 203,
  mchp_pic = 204,
  intelgt = 205,
  intel206 = 206,
  intel207 = 207,
  intel208 = 208,
  intel209 = 209,
  km32 = 210,
  kmx32 = 211,
  kmx16 = 212,
  kmx8 = 213,
  kvarc = 214,
  cdp = 215,
  coge = 216,
  cool = 217,
  norc = 218,
  csr_kalimba = 219,
  z80 = 220,
  visium = 221,
  ft32 = 222,
  moxie = 223,
  amdgpu = 224,
  riscv = 243,
  lanai = 244,
  ceva = 245,
  ceva_x2 = 246,
  bpf = 247,
  graphcore_ipu = 248,
  img1 = 249,
  nfp = 250,
  ve = 251,
  csky = 252,
  arc_compact3_64 = 253,
  mcs6502 = 254,
  arc_compact3 = 255,
  kvx = 256,
  wdc_65816 = 257,
  loongarch = 258,
  kf32 = 259,
  u16_u8core = 260,
  tachyum = 261,
  nxp_56800ef = 262,
  sbf = 263,
  ai_engine = 264,
  sima_mla = 265,
  bang = 266,
  loonggpu = 267,
  sw64 = 268,
  ai_engine_ctrlcode = 269,
  ppu = 270,
  avr_old = 4183,
  msp430_old = 4185,
  adapteva_epiphany = 4643,
  mt = 9520,
  cygnus_fr30 = 13104,
  webassembly = 16727,
  xc16x = 18056,
  s12z = 19951,
  cygnus_frv = 21569,
  dlx = 23205,
  cygnus_d10v = 30288,
  cygnus_d30v = 30326,
  ip2k_old = 33303,
  cygnus_powerpc = 36901,
  alpha = 36902,
  cygnus_m32r = 36929,
  cygnus_v850 = 36992,
  s390_old = 41872,
  xtensa_old = 43975,
  xstormy16 = 44357,
  microblaze_old = 47787,
  cygnus_mn10300 = 48879,
  cygnus_mn10200 = 57005,
  cygnus_mep = 61453,
  m32c_old = 65200,
  iq2000 = 65210,
  nios32 = 65211,
  moxie_old = 65261,
}

Elf.ObjType = enum.Enum {
  no_file_type = 0,
  relocatable = 1,
  executable = 2,
  shared = 3,
  core = 4,
}

Elf.OsAbi = enum.Enum {
  system_v = 0,
  hp_ux = 1,
  netbsd = 2,
  gnu = 3,
  solaris = 6,
  aix = 7,
  irix = 8,
  freebsd = 9,
  tru64 = 10,
  modesto = 11,
  openbsd = 12,
  openvms = 13,
  nsk = 14,
  aros = 15,
  fenixos = 16,
  cloudabi = 17,
  openvos = 18,
  cuda = 51,
  arm_aeabi = 64,
  arm_fdpic = 65,
  amdgpu_mesa3d = 66,
  arm = 97,
  standalone = 255,
}

Elf.PhType = enum.Enum {
  null_type = 0,
  load = 1,
  dynamic = 2,
  interp = 3,
  note = 4,
  shlib = 5,
  phdr = 6,
  tls = 7,
  sunw_unwind = 1684333904,
  gnu_eh_frame = 1685382480,
  gnu_stack = 1685382481,
  gnu_relro = 1685382482,
  gnu_property = 1685382483,
  gnu_sframe = 1685382484,
  pax_flags = 1694766464,
  openbsd_mutable = 1705237477,
  openbsd_randomize = 1705237478,
  openbsd_wxneeded = 1705237479,
  openbsd_nobtcfi = 1705237480,
  openbsd_syscalls = 1705237481,
  openbsd_bootdata = 1705253862,
  sunw_sysstat_zone = 1879048183,
  sunw_sysstat = 1879048184,
  sunw_reserve = 1879048185,
  sunw_bss = 1879048186,
  sunw_stack = 1879048187,
  sunw_dtrace = 1879048188,
  sunw_cap = 1879048189,
  arm_archext = 1879048192,
  arm_exidx = 1879048193,
  aarch64_memtag_mte = 1879048194,
  riscv_attributes = 1879048195,
}

Elf.SectionHeaderIdxSpecial = enum.Enum {
  undefined = 0,
  before = 65280,
  after = 65281,
  amd64_lcommon = 65282,
  sunw_ignore = 65343,
  abs = 65521,
  common = 65522,
  xindex = 65535,
}

Elf.ShType = enum.Enum {
  null_type = 0,
  progbits = 1,
  symtab = 2,
  strtab = 3,
  rela = 4,
  hash = 5,
  dynamic = 6,
  note = 7,
  nobits = 8,
  rel = 9,
  shlib = 10,
  dynsym = 11,
  init_array = 14,
  fini_array = 15,
  preinit_array = 16,
  group = 17,
  symtab_shndx = 18,
  relr = 19,
  android_rel = 1610612737,
  android_rela = 1610612738,
  gnu_incremental_inputs = 1879000832,
  llvm_odrtab = 1879002112,
  llvm_linker_options = 1879002113,
  llvm_addrsig = 1879002115,
  llvm_dependent_libraries = 1879002116,
  llvm_sympart = 1879002117,
  llvm_part_ehdr = 1879002118,
  llvm_part_phdr = 1879002119,
  llvm_bb_addr_map_v0 = 1879002120,
  llvm_call_graph_profile = 1879002121,
  llvm_bb_addr_map = 1879002122,
  llvm_offloading = 1879002123,
  llvm_lto = 1879002124,
  llvm_jt_sizes = 1879002125,
  llvm_cfi_jump_table = 1879002126,
  llvm_call_graph = 1879002127,
  llvm_dyndbg_elf = 1879002128,
  android_relr = 1879047936,
  sunw_ctf = 1879048171,
  sunw_symnsort = 1879048172,
  sunw_phname = 1879048173,
  sunw_ancillary = 1879048174,
  sunw_capchain = 1879048175,
  sunw_capinfo = 1879048176,
  sunw_symsort = 1879048177,
  sunw_tlssort = 1879048178,
  sunw_ldynsym = 1879048179,
  gnu_sframe = 1879048180,
  gnu_attributes = 1879048181,
  gnu_hash = 1879048182,
  gnu_liblist = 1879048183,
  checksum = 1879048184,
  gnu_object_only = 1879048185,
  sunw_move = 1879048186,
  sunw_comdat = 1879048187,
  sunw_syminfo = 1879048188,
  gnu_verdef = 1879048189,
  gnu_verneed = 1879048190,
  gnu_versym = 1879048191,
  sparc_gotdata = 1879048192,
  x86_64_unwind = 1879048193,
  arm_preemptmap = 1879048194,
  arm_attributes = 1879048195,
  arm_debugoverlay = 1879048196,
  arm_overlaysection = 1879048197,
  aarch64_memtag_globals_static = 1879048199,
  aarch64_memtag_globals_dynamic = 1879048200,
}

Elf.SymbolBinding = enum.Enum {
  local = 0,
  global_symbol = 1,
  weak = 2,
  os10 = 10,
  os11 = 11,
  os12 = 12,
  proc13 = 13,
  proc14 = 14,
  proc15 = 15,
}

Elf.SymbolType = enum.Enum {
  no_type = 0,
  object = 1,
  func = 2,
  section = 3,
  file = 4,
  common = 5,
  tls = 6,
  relc = 8,
  srelc = 9,
  gnu_ifunc = 10,
  os11 = 11,
  os12 = 12,
  proc13 = 13,
  proc14 = 14,
  proc15 = 15,
}

Elf.SymbolVisibility = enum.Enum {
  default = 0,
  internal = 1,
  hidden = 2,
  protected = 3,
  exported = 4,
  singleton = 5,
  eliminate = 6,
}

Elf.VersionIndexSpecial = enum.Enum {
  local = 0,
  global_symbol = 1,
  eliminate = 65281,
}

function Elf:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Elf:_read()
  self.magic = self._io:read_bytes(4)
  if not(self.magic == "\127\069\076\070") then
    error("not equal, expected " .. "\127\069\076\070" .. ", but got " .. self.magic)
  end
  self.bits = Elf.Bits(self._io:read_u1())
  self.endian = Elf.Endian(self._io:read_u1())
  self.ei_version = self._io:read_u1()
  if not(self.ei_version == 1) then
    error("not equal, expected " .. 1 .. ", but got " .. self.ei_version)
  end
  self.abi = Elf.OsAbi(self._io:read_u1())
  self.abi_version = self._io:read_u1()
  self.pad = self._io:read_bytes(7)
  if not(self.pad == "\000\000\000\000\000\000\000") then
    error("not equal, expected " .. "\000\000\000\000\000\000\000" .. ", but got " .. self.pad)
  end
  self.header = Elf.EndianElf(self._io, self, self._root)
end

Elf.property.sh_idx_hi_os = {}
function Elf.property.sh_idx_hi_os:get()
  if self._m_sh_idx_hi_os ~= nil then
    return self._m_sh_idx_hi_os
  end

  self._m_sh_idx_hi_os = 65343
  return self._m_sh_idx_hi_os
end

Elf.property.sh_idx_hi_proc = {}
function Elf.property.sh_idx_hi_proc:get()
  if self._m_sh_idx_hi_proc ~= nil then
    return self._m_sh_idx_hi_proc
  end

  self._m_sh_idx_hi_proc = 65311
  return self._m_sh_idx_hi_proc
end

Elf.property.sh_idx_hi_reserved = {}
function Elf.property.sh_idx_hi_reserved:get()
  if self._m_sh_idx_hi_reserved ~= nil then
    return self._m_sh_idx_hi_reserved
  end

  self._m_sh_idx_hi_reserved = 65535
  return self._m_sh_idx_hi_reserved
end

Elf.property.sh_idx_lo_os = {}
function Elf.property.sh_idx_lo_os:get()
  if self._m_sh_idx_lo_os ~= nil then
    return self._m_sh_idx_lo_os
  end

  self._m_sh_idx_lo_os = 65312
  return self._m_sh_idx_lo_os
end

Elf.property.sh_idx_lo_proc = {}
function Elf.property.sh_idx_lo_proc:get()
  if self._m_sh_idx_lo_proc ~= nil then
    return self._m_sh_idx_lo_proc
  end

  self._m_sh_idx_lo_proc = 65280
  return self._m_sh_idx_lo_proc
end

Elf.property.sh_idx_lo_reserved = {}
function Elf.property.sh_idx_lo_reserved:get()
  if self._m_sh_idx_lo_reserved ~= nil then
    return self._m_sh_idx_lo_reserved
  end

  self._m_sh_idx_lo_reserved = 65280
  return self._m_sh_idx_lo_reserved
end

-- 
-- File identification, must be 0x7f + "ELF".
-- 
-- File class: designates target machine word size (32 or 64
-- bits). The size of many integer fields in this format will
-- depend on this setting.
-- 
-- Endianness used for all integers.
-- 
-- ELF header version.
-- 
-- Specifies which OS- and ABI-related extensions will be used
-- in this ELF file.
-- 
-- Version of ABI targeted by this ELF file. Interpretation
-- depends on `abi` attribute.

-- 
-- See also: Source (https://forge.sourceware.org/glibc/glibc-mirror/src/tag/glibc-2.43/elf/elf.h#L1008)
-- See also: Source (https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/dynamic-section.html#GUID-4336A69A-D905-4FCE-A398-80375A9E6464__CHAPTER6-TBL-53)
Elf.DtFlag1Values = class.class(KaitaiStruct)

function Elf.DtFlag1Values:_init(value, io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self.value = value
  self:_read()
end

function Elf.DtFlag1Values:_read()
end

-- 
-- Configuration alternative created.
-- See also: Source (https://forge.sourceware.org/glibc/glibc-mirror/src/tag/glibc-2.43/elf/elf.h#L1023)
Elf.DtFlag1Values.property.conf_alt = {}
function Elf.DtFlag1Values.property.conf_alt:get()
  if self._m_conf_alt ~= nil then
    return self._m_conf_alt
  end

  self._m_conf_alt = self.value & 8192 ~= 0
  return self._m_conf_alt
end

-- 
-- Direct binding enabled.
Elf.DtFlag1Values.property.direct = {}
function Elf.DtFlag1Values.property.direct:get()
  if self._m_direct ~= nil then
    return self._m_direct
  end

  self._m_direct = self.value & 256 ~= 0
  return self._m_direct
end

-- 
-- Displacement relocation done (applied at build time).
Elf.DtFlag1Values.property.disp_rel_dne = {}
function Elf.DtFlag1Values.property.disp_rel_dne:get()
  if self._m_disp_rel_dne ~= nil then
    return self._m_disp_rel_dne
  end

  self._m_disp_rel_dne = self.value & 32768 ~= 0
  return self._m_disp_rel_dne
end

-- 
-- Displacement relocation pending (applied at runtime).
Elf.DtFlag1Values.property.disp_rel_pnd = {}
function Elf.DtFlag1Values.property.disp_rel_pnd:get()
  if self._m_disp_rel_pnd ~= nil then
    return self._m_disp_rel_pnd
  end

  self._m_disp_rel_pnd = self.value & 65536 ~= 0
  return self._m_disp_rel_pnd
end

-- 
-- Object is modified after built.
Elf.DtFlag1Values.property.edited = {}
function Elf.DtFlag1Values.property.edited:get()
  if self._m_edited ~= nil then
    return self._m_edited
  end

  self._m_edited = self.value & 2097152 ~= 0
  return self._m_edited
end

-- 
-- Filtee terminates filters search.
Elf.DtFlag1Values.property.end_filtee = {}
function Elf.DtFlag1Values.property.end_filtee:get()
  if self._m_end_filtee ~= nil then
    return self._m_end_filtee
  end

  self._m_end_filtee = self.value & 16384 ~= 0
  return self._m_end_filtee
end

-- 
-- Global auditing required.
Elf.DtFlag1Values.property.glob_audit = {}
function Elf.DtFlag1Values.property.glob_audit:get()
  if self._m_glob_audit ~= nil then
    return self._m_glob_audit
  end

  self._m_glob_audit = self.value & 16777216 ~= 0
  return self._m_glob_audit
end

-- 
-- Set `RTLD_GROUP` for this object.
Elf.DtFlag1Values.property.group = {}
function Elf.DtFlag1Values.property.group:get()
  if self._m_group ~= nil then
    return self._m_group
  end

  self._m_group = self.value & 4 ~= 0
  return self._m_group
end

Elf.DtFlag1Values.property.ign_mul_def = {}
function Elf.DtFlag1Values.property.ign_mul_def:get()
  if self._m_ign_mul_def ~= nil then
    return self._m_ign_mul_def
  end

  self._m_ign_mul_def = self.value & 262144 ~= 0
  return self._m_ign_mul_def
end

-- 
-- Set `RTLD_INITFIRST` for this object.
Elf.DtFlag1Values.property.init_first = {}
function Elf.DtFlag1Values.property.init_first:get()
  if self._m_init_first ~= nil then
    return self._m_init_first
  end

  self._m_init_first = self.value & 32 ~= 0
  return self._m_init_first
end

-- 
-- Object is used to interpose.
Elf.DtFlag1Values.property.interpose = {}
function Elf.DtFlag1Values.property.interpose:get()
  if self._m_interpose ~= nil then
    return self._m_interpose
  end

  self._m_interpose = self.value & 1024 ~= 0
  return self._m_interpose
end

-- 
-- Object is a kernel module.
Elf.DtFlag1Values.property.kmod = {}
function Elf.DtFlag1Values.property.kmod:get()
  if self._m_kmod ~= nil then
    return self._m_kmod
  end

  self._m_kmod = self.value & 268435456 ~= 0
  return self._m_kmod
end

-- 
-- Trigger filtee loading at runtime.
Elf.DtFlag1Values.property.load_fltr = {}
function Elf.DtFlag1Values.property.load_fltr:get()
  if self._m_load_fltr ~= nil then
    return self._m_load_fltr
  end

  self._m_load_fltr = self.value & 16 ~= 0
  return self._m_load_fltr
end

-- 
-- No COMMON symbols exist.
-- See also: Source (https://forge.sourceware.org/glibc/glibc-mirror/src/tag/glibc-2.43/elf/elf.h#L1040)
Elf.DtFlag1Values.property.no_common = {}
function Elf.DtFlag1Values.property.no_common:get()
  if self._m_no_common ~= nil then
    return self._m_no_common
  end

  self._m_no_common = self.value & 1073741824 ~= 0
  return self._m_no_common
end

-- 
-- Ignore the default library search path.
Elf.DtFlag1Values.property.no_def_lib = {}
function Elf.DtFlag1Values.property.no_def_lib:get()
  if self._m_no_def_lib ~= nil then
    return self._m_no_def_lib
  end

  self._m_no_def_lib = self.value & 2048 ~= 0
  return self._m_no_def_lib
end

-- 
-- Set `RTLD_NODELETE` for this object.
Elf.DtFlag1Values.property.no_delete = {}
function Elf.DtFlag1Values.property.no_delete:get()
  if self._m_no_delete ~= nil then
    return self._m_no_delete
  end

  self._m_no_delete = self.value & 8 ~= 0
  return self._m_no_delete
end

-- 
-- Object contains non-direct bindings.
Elf.DtFlag1Values.property.no_direct = {}
function Elf.DtFlag1Values.property.no_direct:get()
  if self._m_no_direct ~= nil then
    return self._m_no_direct
  end

  self._m_no_direct = self.value & 131072 ~= 0
  return self._m_no_direct
end

-- 
-- Object can't be dldump'ed.
Elf.DtFlag1Values.property.no_dump = {}
function Elf.DtFlag1Values.property.no_dump:get()
  if self._m_no_dump ~= nil then
    return self._m_no_dump
  end

  self._m_no_dump = self.value & 4096 ~= 0
  return self._m_no_dump
end

Elf.DtFlag1Values.property.no_hdr = {}
function Elf.DtFlag1Values.property.no_hdr:get()
  if self._m_no_hdr ~= nil then
    return self._m_no_hdr
  end

  self._m_no_hdr = self.value & 1048576 ~= 0
  return self._m_no_hdr
end

Elf.DtFlag1Values.property.no_ksyms = {}
function Elf.DtFlag1Values.property.no_ksyms:get()
  if self._m_no_ksyms ~= nil then
    return self._m_no_ksyms
  end

  self._m_no_ksyms = self.value & 524288 ~= 0
  return self._m_no_ksyms
end

-- 
-- Set `RTLD_NOOPEN` for this object.
Elf.DtFlag1Values.property.no_open = {}
function Elf.DtFlag1Values.property.no_open:get()
  if self._m_no_open ~= nil then
    return self._m_no_open
  end

  self._m_no_open = self.value & 64 ~= 0
  return self._m_no_open
end

Elf.DtFlag1Values.property.no_reloc = {}
function Elf.DtFlag1Values.property.no_reloc:get()
  if self._m_no_reloc ~= nil then
    return self._m_no_reloc
  end

  self._m_no_reloc = self.value & 4194304 ~= 0
  return self._m_no_reloc
end

-- 
-- Set `RTLD_NOW` for this object.
Elf.DtFlag1Values.property.now = {}
function Elf.DtFlag1Values.property.now:get()
  if self._m_now ~= nil then
    return self._m_now
  end

  self._m_now = self.value & 1 ~= 0
  return self._m_now
end

-- 
-- `$ORIGIN` must be handled.
Elf.DtFlag1Values.property.origin = {}
function Elf.DtFlag1Values.property.origin:get()
  if self._m_origin ~= nil then
    return self._m_origin
  end

  self._m_origin = self.value & 128 ~= 0
  return self._m_origin
end

-- 
-- Object is a Position Independent Executable (PIE).
Elf.DtFlag1Values.property.pie = {}
function Elf.DtFlag1Values.property.pie:get()
  if self._m_pie ~= nil then
    return self._m_pie
  end

  self._m_pie = self.value & 134217728 ~= 0
  return self._m_pie
end

-- 
-- Set `RTLD_GLOBAL` for this object.
Elf.DtFlag1Values.property.rtld_global = {}
function Elf.DtFlag1Values.property.rtld_global:get()
  if self._m_rtld_global ~= nil then
    return self._m_rtld_global
  end

  self._m_rtld_global = self.value & 2 ~= 0
  return self._m_rtld_global
end

-- 
-- Singleton symbols are used.
Elf.DtFlag1Values.property.singleton = {}
function Elf.DtFlag1Values.property.singleton:get()
  if self._m_singleton ~= nil then
    return self._m_singleton
  end

  self._m_singleton = self.value & 33554432 ~= 0
  return self._m_singleton
end

-- 
-- Object is a stub.
-- See [Stub Objects](https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/stub-objects.html).
Elf.DtFlag1Values.property.stub = {}
function Elf.DtFlag1Values.property.stub:get()
  if self._m_stub ~= nil then
    return self._m_stub
  end

  self._m_stub = self.value & 67108864 ~= 0
  return self._m_stub
end

-- 
-- Object has individual symbol interposers.
Elf.DtFlag1Values.property.sym_intpose = {}
function Elf.DtFlag1Values.property.sym_intpose:get()
  if self._m_sym_intpose ~= nil then
    return self._m_sym_intpose
  end

  self._m_sym_intpose = self.value & 8388608 ~= 0
  return self._m_sym_intpose
end

-- 
-- See also: Source (https://forge.sourceware.org/glibc/glibc-mirror/src/tag/glibc-2.43/elf/elf.h#L1019)
Elf.DtFlag1Values.property.trans = {}
function Elf.DtFlag1Values.property.trans:get()
  if self._m_trans ~= nil then
    return self._m_trans
  end

  self._m_trans = self.value & 512 ~= 0
  return self._m_trans
end

-- 
-- Object is a weak standard filter.
Elf.DtFlag1Values.property.weak_filter = {}
function Elf.DtFlag1Values.property.weak_filter:get()
  if self._m_weak_filter ~= nil then
    return self._m_weak_filter
  end

  self._m_weak_filter = self.value & 536870912 ~= 0
  return self._m_weak_filter
end


-- 
-- See also: Figure 5-11: DT_FLAGS values (https://refspecs.linuxbase.org/elf/gabi4+/ch5.dynamic.html)
-- See also: Source (https://github.com/golang/go/blob/48dfddbab3/src/debug/elf/elf.go#L1079-L1095)
-- See also: Source (https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/dynamic-section.html#GUID-4336A69A-D905-4FCE-A398-80375A9E6464__CHAPTER7-TBL-5)
Elf.DtFlagValues = class.class(KaitaiStruct)

function Elf.DtFlagValues:_init(value, io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self.value = value
  self:_read()
end

function Elf.DtFlagValues:_read()
end

-- 
-- all relocations for this object must be processed before returning
-- control to the program
Elf.DtFlagValues.property.bind_now = {}
function Elf.DtFlagValues.property.bind_now:get()
  if self._m_bind_now ~= nil then
    return self._m_bind_now
  end

  self._m_bind_now = self.value & 8 ~= 0
  return self._m_bind_now
end

-- 
-- object may reference the $ORIGIN substitution string.
Elf.DtFlagValues.property.origin = {}
function Elf.DtFlagValues.property.origin:get()
  if self._m_origin ~= nil then
    return self._m_origin
  end

  self._m_origin = self.value & 1 ~= 0
  return self._m_origin
end

-- 
-- object uses static thread-local storage scheme.
Elf.DtFlagValues.property.static_tls = {}
function Elf.DtFlagValues.property.static_tls:get()
  if self._m_static_tls ~= nil then
    return self._m_static_tls
  end

  self._m_static_tls = self.value & 16 ~= 0
  return self._m_static_tls
end

-- 
-- symbolic linking.
Elf.DtFlagValues.property.symbolic = {}
function Elf.DtFlagValues.property.symbolic:get()
  if self._m_symbolic ~= nil then
    return self._m_symbolic
  end

  self._m_symbolic = self.value & 2 ~= 0
  return self._m_symbolic
end

-- 
-- relocation entries might request modifications to a non-writable segment.
Elf.DtFlagValues.property.textrel = {}
function Elf.DtFlagValues.property.textrel:get()
  if self._m_textrel ~= nil then
    return self._m_textrel
  end

  self._m_textrel = self.value & 4 ~= 0
  return self._m_textrel
end


-- 
-- See also: Source (https://gabi.xinuos.com/v42/elf/02-eheader.html)
-- See also: Source (https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/elf-header.html)
Elf.EndianElf = class.class(KaitaiStruct)

function Elf.EndianElf:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Elf.EndianElf:_read()
  local _on = self._root.endian
  if _on == Elf.Endian.le then
    self._is_le = true
  elseif _on == Elf.Endian.be then
    self._is_le = false
  end

  if self._is_le == true then
    self:_read_le()
  elseif self._is_le == false then
    self:_read_be()
  else
    error("unable to decide endianness")
  end
end

function Elf.EndianElf:_read_le()
  self.e_type = Elf.ObjType(self._io:read_u2le())
  self.machine = Elf.Machine(self._io:read_u2le())
  if self.machine == nil then
    error("ValidationNotInEnumError")
  end
  self.e_version = self._io:read_u4le()
  local _on = self._root.bits
  if _on == Elf.Bits.b32 then
    self.entry_point = self._io:read_u4le()
  elseif _on == Elf.Bits.b64 then
    self.entry_point = self._io:read_u8le()
  end
  local _on = self._root.bits
  if _on == Elf.Bits.b32 then
    self.ofs_program_headers = self._io:read_u4le()
  elseif _on == Elf.Bits.b64 then
    self.ofs_program_headers = self._io:read_u8le()
  end
  local _on = self._root.bits
  if _on == Elf.Bits.b32 then
    self.ofs_section_headers = self._io:read_u4le()
  elseif _on == Elf.Bits.b64 then
    self.ofs_section_headers = self._io:read_u8le()
  end
  self.flags = self._io:read_bytes(4)
  self.e_ehsize = self._io:read_u2le()
  self.program_header_size = self._io:read_u2le()
  self.num_program_headers = self._io:read_u2le()
  self.section_header_size = self._io:read_u2le()
  self.num_section_headers = self._io:read_u2le()
  self.section_names_idx = self._io:read_u2le()
end

function Elf.EndianElf:_read_be()
  self.e_type = Elf.ObjType(self._io:read_u2be())
  self.machine = Elf.Machine(self._io:read_u2be())
  if self.machine == nil then
    error("ValidationNotInEnumError")
  end
  self.e_version = self._io:read_u4be()
  local _on = self._root.bits
  if _on == Elf.Bits.b32 then
    self.entry_point = self._io:read_u4be()
  elseif _on == Elf.Bits.b64 then
    self.entry_point = self._io:read_u8be()
  end
  local _on = self._root.bits
  if _on == Elf.Bits.b32 then
    self.ofs_program_headers = self._io:read_u4be()
  elseif _on == Elf.Bits.b64 then
    self.ofs_program_headers = self._io:read_u8be()
  end
  local _on = self._root.bits
  if _on == Elf.Bits.b32 then
    self.ofs_section_headers = self._io:read_u4be()
  elseif _on == Elf.Bits.b64 then
    self.ofs_section_headers = self._io:read_u8be()
  end
  self.flags = self._io:read_bytes(4)
  self.e_ehsize = self._io:read_u2be()
  self.program_header_size = self._io:read_u2be()
  self.num_program_headers = self._io:read_u2be()
  self.section_header_size = self._io:read_u2be()
  self.num_section_headers = self._io:read_u2be()
  self.section_names_idx = self._io:read_u2be()
end

Elf.EndianElf.property.program_headers = {}
function Elf.EndianElf.property.program_headers:get()
  if self._m_program_headers ~= nil then
    return self._m_program_headers
  end

  local _pos = self._io:pos()
  self._io:seek(self.ofs_program_headers)
  if self._is_le then
    self._raw__m_program_headers = {}
    self._m_program_headers = {}
    for i = 0, self.num_program_headers - 1 do
      self._raw__m_program_headers[i + 1] = self._io:read_bytes(self.program_header_size)
      local _io = KaitaiStream(stringstream(self._raw__m_program_headers[i + 1]))
      self._m_program_headers[i + 1] = Elf.EndianElf.ProgramHeader(_io, self, self._root, self._is_le)
    end
  else
    self._raw__m_program_headers = {}
    self._m_program_headers = {}
    for i = 0, self.num_program_headers - 1 do
      self._raw__m_program_headers[i + 1] = self._io:read_bytes(self.program_header_size)
      local _io = KaitaiStream(stringstream(self._raw__m_program_headers[i + 1]))
      self._m_program_headers[i + 1] = Elf.EndianElf.ProgramHeader(_io, self, self._root, self._is_le)
    end
  end
  self._io:seek(_pos)
  return self._m_program_headers
end

Elf.EndianElf.property.section_headers = {}
function Elf.EndianElf.property.section_headers:get()
  if self._m_section_headers ~= nil then
    return self._m_section_headers
  end

  local _pos = self._io:pos()
  self._io:seek(self.ofs_section_headers)
  if self._is_le then
    self._raw__m_section_headers = {}
    self._m_section_headers = {}
    for i = 0, self.num_section_headers - 1 do
      self._raw__m_section_headers[i + 1] = self._io:read_bytes(self.section_header_size)
      local _io = KaitaiStream(stringstream(self._raw__m_section_headers[i + 1]))
      self._m_section_headers[i + 1] = Elf.EndianElf.SectionHeader(_io, self, self._root, self._is_le)
    end
  else
    self._raw__m_section_headers = {}
    self._m_section_headers = {}
    for i = 0, self.num_section_headers - 1 do
      self._raw__m_section_headers[i + 1] = self._io:read_bytes(self.section_header_size)
      local _io = KaitaiStream(stringstream(self._raw__m_section_headers[i + 1]))
      self._m_section_headers[i + 1] = Elf.EndianElf.SectionHeader(_io, self, self._root, self._is_le)
    end
  end
  self._io:seek(_pos)
  return self._m_section_headers
end

Elf.EndianElf.property.section_names = {}
function Elf.EndianElf.property.section_names:get()
  if self._m_section_names ~= nil then
    return self._m_section_names
  end

  if  ((self.section_names_idx ~= Elf.SectionHeaderIdxSpecial.undefined.value) and (self.section_names_idx < self._root.header.num_section_headers))  then
    local _pos = self._io:pos()
    self._io:seek(self.section_headers[self.section_names_idx + 1].ofs_body)
    if self._is_le then
      self._raw__m_section_names = self._io:read_bytes(self.section_headers[self.section_names_idx + 1].len_body)
      local _io = KaitaiStream(stringstream(self._raw__m_section_names))
      self._m_section_names = Elf.EndianElf.StringsStruct(_io, self, self._root, self._is_le)
    else
      self._raw__m_section_names = self._io:read_bytes(self.section_headers[self.section_names_idx + 1].len_body)
      local _io = KaitaiStream(stringstream(self._raw__m_section_names))
      self._m_section_names = Elf.EndianElf.StringsStruct(_io, self, self._root, self._is_le)
    end
    self._io:seek(_pos)
  end
  return self._m_section_names
end


Elf.EndianElf.DynsymSection = class.class(KaitaiStruct)

function Elf.EndianElf.DynsymSection:_init(io, parent, root, is_le)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self._is_le = is_le
  self:_read()
end

function Elf.EndianElf.DynsymSection:_read()

  if self._is_le == true then
    self:_read_le()
  elseif self._is_le == false then
    self:_read_be()
  else
    error("unable to decide endianness")
  end
end

function Elf.EndianElf.DynsymSection:_read_le()
  self.entries = {}
  local i = 0
  while not self._io:is_eof() do
    self.entries[i + 1] = Elf.EndianElf.DynsymSectionEntry(self._io, self, self._root, self._is_le)
    i = i + 1
  end
end

function Elf.EndianElf.DynsymSection:_read_be()
  self.entries = {}
  local i = 0
  while not self._io:is_eof() do
    self.entries[i + 1] = Elf.EndianElf.DynsymSectionEntry(self._io, self, self._root, self._is_le)
    i = i + 1
  end
end

Elf.EndianElf.DynsymSection.property.is_string_table_linked = {}
function Elf.EndianElf.DynsymSection.property.is_string_table_linked:get()
  if self._m_is_string_table_linked ~= nil then
    return self._m_is_string_table_linked
  end

  self._m_is_string_table_linked = self._parent.linked_section.type == Elf.ShType.strtab
  return self._m_is_string_table_linked
end


-- 
-- See also: Source (https://gabi.xinuos.com/elf/05-symtab.html)
-- See also: Source (https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/symbol-table-section.html)
Elf.EndianElf.DynsymSectionEntry = class.class(KaitaiStruct)

function Elf.EndianElf.DynsymSectionEntry:_init(io, parent, root, is_le)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self._is_le = is_le
  self:_read()
end

function Elf.EndianElf.DynsymSectionEntry:_read()

  if self._is_le == true then
    self:_read_le()
  elseif self._is_le == false then
    self:_read_be()
  else
    error("unable to decide endianness")
  end
end

function Elf.EndianElf.DynsymSectionEntry:_read_le()
  self.ofs_name = self._io:read_u4le()
  if self._root.bits == Elf.Bits.b32 then
    self.value_b32 = self._io:read_u4le()
  end
  if self._root.bits == Elf.Bits.b32 then
    self.size_b32 = self._io:read_u4le()
  end
  self.bind = Elf.SymbolBinding(self._io:read_bits_int_be(4))
  self.type = Elf.SymbolType(self._io:read_bits_int_be(4))
  self._io:align_to_byte()
  self.other = self._io:read_u1()
  self.sh_idx = self._io:read_u2le()
  if self._root.bits == Elf.Bits.b64 then
    self.value_b64 = self._io:read_u8le()
  end
  if self._root.bits == Elf.Bits.b64 then
    self.size_b64 = self._io:read_u8le()
  end
end

function Elf.EndianElf.DynsymSectionEntry:_read_be()
  self.ofs_name = self._io:read_u4be()
  if self._root.bits == Elf.Bits.b32 then
    self.value_b32 = self._io:read_u4be()
  end
  if self._root.bits == Elf.Bits.b32 then
    self.size_b32 = self._io:read_u4be()
  end
  self.bind = Elf.SymbolBinding(self._io:read_bits_int_be(4))
  self.type = Elf.SymbolType(self._io:read_bits_int_be(4))
  self._io:align_to_byte()
  self.other = self._io:read_u1()
  self.sh_idx = self._io:read_u2be()
  if self._root.bits == Elf.Bits.b64 then
    self.value_b64 = self._io:read_u8be()
  end
  if self._root.bits == Elf.Bits.b64 then
    self.size_b64 = self._io:read_u8be()
  end
end

Elf.EndianElf.DynsymSectionEntry.property.is_sh_idx_os = {}
function Elf.EndianElf.DynsymSectionEntry.property.is_sh_idx_os:get()
  if self._m_is_sh_idx_os ~= nil then
    return self._m_is_sh_idx_os
  end

  self._m_is_sh_idx_os =  ((self.sh_idx >= self._root.sh_idx_lo_os) and (self.sh_idx <= self._root.sh_idx_hi_os)) 
  return self._m_is_sh_idx_os
end

Elf.EndianElf.DynsymSectionEntry.property.is_sh_idx_proc = {}
function Elf.EndianElf.DynsymSectionEntry.property.is_sh_idx_proc:get()
  if self._m_is_sh_idx_proc ~= nil then
    return self._m_is_sh_idx_proc
  end

  self._m_is_sh_idx_proc =  ((self.sh_idx >= self._root.sh_idx_lo_proc) and (self.sh_idx <= self._root.sh_idx_hi_proc)) 
  return self._m_is_sh_idx_proc
end

Elf.EndianElf.DynsymSectionEntry.property.is_sh_idx_reserved = {}
function Elf.EndianElf.DynsymSectionEntry.property.is_sh_idx_reserved:get()
  if self._m_is_sh_idx_reserved ~= nil then
    return self._m_is_sh_idx_reserved
  end

  self._m_is_sh_idx_reserved =  ((self.sh_idx >= self._root.sh_idx_lo_reserved) and (self.sh_idx <= self._root.sh_idx_hi_reserved)) 
  return self._m_is_sh_idx_reserved
end

Elf.EndianElf.DynsymSectionEntry.property.name = {}
function Elf.EndianElf.DynsymSectionEntry.property.name:get()
  if self._m_name ~= nil then
    return self._m_name
  end

  if  ((self.ofs_name ~= 0) and (self._parent.is_string_table_linked))  then
    local _io = self._parent._parent.linked_section.body._io
    local _pos = _io:pos()
    _io:seek(self.ofs_name)
    if self._is_le then
      self._m_name = str_decode.decode(_io:read_bytes_term(0, false, true, true), "UTF-8")
    else
      self._m_name = str_decode.decode(_io:read_bytes_term(0, false, true, true), "UTF-8")
    end
    _io:seek(_pos)
  end
  return self._m_name
end

Elf.EndianElf.DynsymSectionEntry.property.sh_idx_special = {}
function Elf.EndianElf.DynsymSectionEntry.property.sh_idx_special:get()
  if self._m_sh_idx_special ~= nil then
    return self._m_sh_idx_special
  end

  self._m_sh_idx_special = Elf.SectionHeaderIdxSpecial(self.sh_idx)
  return self._m_sh_idx_special
end

Elf.EndianElf.DynsymSectionEntry.property.size = {}
function Elf.EndianElf.DynsymSectionEntry.property.size:get()
  if self._m_size ~= nil then
    return self._m_size
  end

  self._m_size = utils.box_unwrap((self._root.bits == Elf.Bits.b32) and utils.box_wrap(self.size_b32) or (utils.box_unwrap((self._root.bits == Elf.Bits.b64) and utils.box_wrap(self.size_b64) or (0))))
  return self._m_size
end

Elf.EndianElf.DynsymSectionEntry.property.value = {}
function Elf.EndianElf.DynsymSectionEntry.property.value:get()
  if self._m_value ~= nil then
    return self._m_value
  end

  self._m_value = utils.box_unwrap((self._root.bits == Elf.Bits.b32) and utils.box_wrap(self.value_b32) or (utils.box_unwrap((self._root.bits == Elf.Bits.b64) and utils.box_wrap(self.value_b64) or (0))))
  return self._m_value
end

-- 
-- See also: Source (https://github.com/xinuos/gabi/commit/acd5ebb2962cf243dca4983bc934442b42ef96f5)
Elf.EndianElf.DynsymSectionEntry.property.visibility = {}
function Elf.EndianElf.DynsymSectionEntry.property.visibility:get()
  if self._m_visibility ~= nil then
    return self._m_visibility
  end

  self._m_visibility = Elf.SymbolVisibility(self.other & 7)
  return self._m_visibility
end

-- 
-- don't read this field, access `visibility` instead.
-- 
-- section header index.

Elf.EndianElf.NoteSection = class.class(KaitaiStruct)

function Elf.EndianElf.NoteSection:_init(io, parent, root, is_le)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self._is_le = is_le
  self:_read()
end

function Elf.EndianElf.NoteSection:_read()

  if self._is_le == true then
    self:_read_le()
  elseif self._is_le == false then
    self:_read_be()
  else
    error("unable to decide endianness")
  end
end

function Elf.EndianElf.NoteSection:_read_le()
  self.entries = {}
  local i = 0
  while not self._io:is_eof() do
    self.entries[i + 1] = Elf.EndianElf.NoteSectionEntry(self._io, self, self._root, self._is_le)
    i = i + 1
  end
end

function Elf.EndianElf.NoteSection:_read_be()
  self.entries = {}
  local i = 0
  while not self._io:is_eof() do
    self.entries[i + 1] = Elf.EndianElf.NoteSectionEntry(self._io, self, self._root, self._is_le)
    i = i + 1
  end
end


-- 
-- See also: Source (https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/note-section.html)
-- See also: Source (https://refspecs.linuxfoundation.org/elf/gabi4+/ch5.pheader.html#note_section)
Elf.EndianElf.NoteSectionEntry = class.class(KaitaiStruct)

function Elf.EndianElf.NoteSectionEntry:_init(io, parent, root, is_le)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self._is_le = is_le
  self:_read()
end

function Elf.EndianElf.NoteSectionEntry:_read()

  if self._is_le == true then
    self:_read_le()
  elseif self._is_le == false then
    self:_read_be()
  else
    error("unable to decide endianness")
  end
end

function Elf.EndianElf.NoteSectionEntry:_read_le()
  self.len_name = self._io:read_u4le()
  self.len_descriptor = self._io:read_u4le()
  self.type = self._io:read_u4le()
  self.name = KaitaiStream.bytes_terminate(self._io:read_bytes(self.len_name), 0, false)
  self.name_padding = self._io:read_bytes(-(self.len_name) % 4)
  self.descriptor = self._io:read_bytes(self.len_descriptor)
  self.descriptor_padding = self._io:read_bytes(-(self.len_descriptor) % 4)
end

function Elf.EndianElf.NoteSectionEntry:_read_be()
  self.len_name = self._io:read_u4be()
  self.len_descriptor = self._io:read_u4be()
  self.type = self._io:read_u4be()
  self.name = KaitaiStream.bytes_terminate(self._io:read_bytes(self.len_name), 0, false)
  self.name_padding = self._io:read_bytes(-(self.len_name) % 4)
  self.descriptor = self._io:read_bytes(self.len_descriptor)
  self.descriptor_padding = self._io:read_bytes(-(self.len_descriptor) % 4)
end

-- 
-- Although the ELF specification seems to hint that the `note_name` field
-- is ASCII this isn't the case for Linux binaries that have a
-- `.gnu.build.attributes` section.
-- See also: Source (https://fedoraproject.org/wiki/Toolchain/Watermark#Proposed_Specification_for_non-loaded_notes)

-- 
-- Same type as `sh_dynamic_section`, but it does not use
-- `_parent.linked_section`, which is available only in section headers
-- (i.e. when `_parent` is of type `section_header`). This allows it to
-- be used in program headers (i.e. from the `program_header` type).
-- 
-- The inability to access `linked_section` means that offsets in the
-- string table (which should be stored in the `.dynstr` section) will
-- not be resolved to strings and will be provided only in raw form in
-- the `value_or_ptr` field. In other words, the
-- `ph_dynamic_section_entry` type has no `value_str` instance, unlike
-- the `sh_dynamic_section_entry` type.
-- 
-- There is another way to find the string table referenced by the
-- dynamic section entries that does not rely on `linked_section`, but is
-- a bit more complex (and is therefore considered out of scope of this
-- .ksy spec): the mandatory dynamic tag `dynamic_array_tags::strtab`
-- (`DT_STRTAB`) specifies the virtual address of the string table, and
-- `dynamic_array_tags::strsz` (`DT_STRSZ`) specifies its size in bytes.
-- The virtual address can be converted to a file offset by reading the
-- program headers - see the source code for the `readelf` command:
-- 
-- 1. [`offset_from_vma` call site with an address from `DT_STRTAB` as an
--   argument](https://forge.sourceware.org/binutils-gdb/binutils-gdb-mirror/src/tag/binutils-2_46_1/binutils/readelf.c#L13018)
-- 2. [`offset_from_vma` function
--   definition](https://forge.sourceware.org/binutils-gdb/binutils-gdb-mirror/src/tag/binutils-2_46_1/binutils/readelf.c#L7788)
-- See also: Source (https://gabi.xinuos.com/v42/elf/08-dynamic.html#dynamic-section)
-- See also: Source (https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/dynamic-section.html)
Elf.EndianElf.PhDynamicSection = class.class(KaitaiStruct)

function Elf.EndianElf.PhDynamicSection:_init(io, parent, root, is_le)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self._is_le = is_le
  self:_read()
end

function Elf.EndianElf.PhDynamicSection:_read()

  if self._is_le == true then
    self:_read_le()
  elseif self._is_le == false then
    self:_read_be()
  else
    error("unable to decide endianness")
  end
end

function Elf.EndianElf.PhDynamicSection:_read_le()
  self.entries = {}
  local i = 0
  while true do
    local _ = Elf.EndianElf.PhDynamicSectionEntry(self._io, self, self._root, self._is_le)
    self.entries[i + 1] = _
    if _.tag_enum == Elf.DynamicArrayTags.null then
      break
    end
    i = i + 1
  end
end

function Elf.EndianElf.PhDynamicSection:_read_be()
  self.entries = {}
  local i = 0
  while true do
    local _ = Elf.EndianElf.PhDynamicSectionEntry(self._io, self, self._root, self._is_le)
    self.entries[i + 1] = _
    if _.tag_enum == Elf.DynamicArrayTags.null then
      break
    end
    i = i + 1
  end
end


-- 
-- Same type as `sh_dynamic_section_entry`, but without the `value_str`
-- instance - see the documentation for `ph_dynamic_section` for more
-- details.
-- See also: Source (https://gabi.xinuos.com/v42/elf/08-dynamic.html#dynamic-section)
-- See also: Source (https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/dynamic-section.html)
Elf.EndianElf.PhDynamicSectionEntry = class.class(KaitaiStruct)

function Elf.EndianElf.PhDynamicSectionEntry:_init(io, parent, root, is_le)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self._is_le = is_le
  self:_read()
end

function Elf.EndianElf.PhDynamicSectionEntry:_read()

  if self._is_le == true then
    self:_read_le()
  elseif self._is_le == false then
    self:_read_be()
  else
    error("unable to decide endianness")
  end
end

function Elf.EndianElf.PhDynamicSectionEntry:_read_le()
  local _on = self._root.bits
  if _on == Elf.Bits.b32 then
    self.tag = self._io:read_u4le()
  elseif _on == Elf.Bits.b64 then
    self.tag = self._io:read_u8le()
  end
  local _on = self._root.bits
  if _on == Elf.Bits.b32 then
    self.value_or_ptr = self._io:read_u4le()
  elseif _on == Elf.Bits.b64 then
    self.value_or_ptr = self._io:read_u8le()
  end
end

function Elf.EndianElf.PhDynamicSectionEntry:_read_be()
  local _on = self._root.bits
  if _on == Elf.Bits.b32 then
    self.tag = self._io:read_u4be()
  elseif _on == Elf.Bits.b64 then
    self.tag = self._io:read_u8be()
  end
  local _on = self._root.bits
  if _on == Elf.Bits.b32 then
    self.value_or_ptr = self._io:read_u4be()
  elseif _on == Elf.Bits.b64 then
    self.value_or_ptr = self._io:read_u8be()
  end
end

Elf.EndianElf.PhDynamicSectionEntry.property.flag_1_values = {}
function Elf.EndianElf.PhDynamicSectionEntry.property.flag_1_values:get()
  if self._m_flag_1_values ~= nil then
    return self._m_flag_1_values
  end

  if self.tag_enum == Elf.DynamicArrayTags.flags_1 then
    if self._is_le then
      self._m_flag_1_values = Elf.DtFlag1Values(self.value_or_ptr, self._io, self, self._root)
    else
      self._m_flag_1_values = Elf.DtFlag1Values(self.value_or_ptr, self._io, self, self._root)
    end
  end
  return self._m_flag_1_values
end

Elf.EndianElf.PhDynamicSectionEntry.property.flag_values = {}
function Elf.EndianElf.PhDynamicSectionEntry.property.flag_values:get()
  if self._m_flag_values ~= nil then
    return self._m_flag_values
  end

  if self.tag_enum == Elf.DynamicArrayTags.flags then
    if self._is_le then
      self._m_flag_values = Elf.DtFlagValues(self.value_or_ptr, self._io, self, self._root)
    else
      self._m_flag_values = Elf.DtFlagValues(self.value_or_ptr, self._io, self, self._root)
    end
  end
  return self._m_flag_values
end

Elf.EndianElf.PhDynamicSectionEntry.property.is_value_str = {}
function Elf.EndianElf.PhDynamicSectionEntry.property.is_value_str:get()
  if self._m_is_value_str ~= nil then
    return self._m_is_value_str
  end

  self._m_is_value_str =  ((self.value_or_ptr ~= 0) and ( ((self.tag_enum == Elf.DynamicArrayTags.needed) or (self.tag_enum == Elf.DynamicArrayTags.soname) or (self.tag_enum == Elf.DynamicArrayTags.rpath) or (self.tag_enum == Elf.DynamicArrayTags.runpath) or (self.tag_enum == Elf.DynamicArrayTags.sunw_auxiliary) or (self.tag_enum == Elf.DynamicArrayTags.sunw_filter) or (self.tag_enum == Elf.DynamicArrayTags.auxiliary) or (self.tag_enum == Elf.DynamicArrayTags.filter) or (self.tag_enum == Elf.DynamicArrayTags.config) or (self.tag_enum == Elf.DynamicArrayTags.depaudit) or (self.tag_enum == Elf.DynamicArrayTags.audit)) )) 
  return self._m_is_value_str
end

Elf.EndianElf.PhDynamicSectionEntry.property.tag_enum = {}
function Elf.EndianElf.PhDynamicSectionEntry.property.tag_enum:get()
  if self._m_tag_enum ~= nil then
    return self._m_tag_enum
  end

  self._m_tag_enum = Elf.DynamicArrayTags(self.tag)
  return self._m_tag_enum
end


-- 
-- See also: Source (https://gabi.xinuos.com/v42/elf/07-pheader.html#program-header-entry)
-- See also: Source (https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/program-header.html)
Elf.EndianElf.ProgramHeader = class.class(KaitaiStruct)

function Elf.EndianElf.ProgramHeader:_init(io, parent, root, is_le)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self._is_le = is_le
  self:_read()
end

function Elf.EndianElf.ProgramHeader:_read()

  if self._is_le == true then
    self:_read_le()
  elseif self._is_le == false then
    self:_read_be()
  else
    error("unable to decide endianness")
  end
end

function Elf.EndianElf.ProgramHeader:_read_le()
  self.type = Elf.PhType(self._io:read_u4le())
  if self._root.bits == Elf.Bits.b64 then
    self.flags64 = self._io:read_u4le()
  end
  local _on = self._root.bits
  if _on == Elf.Bits.b32 then
    self.ofs_body = self._io:read_u4le()
  elseif _on == Elf.Bits.b64 then
    self.ofs_body = self._io:read_u8le()
  end
  local _on = self._root.bits
  if _on == Elf.Bits.b32 then
    self.virt_addr = self._io:read_u4le()
  elseif _on == Elf.Bits.b64 then
    self.virt_addr = self._io:read_u8le()
  end
  local _on = self._root.bits
  if _on == Elf.Bits.b32 then
    self.phys_addr = self._io:read_u4le()
  elseif _on == Elf.Bits.b64 then
    self.phys_addr = self._io:read_u8le()
  end
  local _on = self._root.bits
  if _on == Elf.Bits.b32 then
    self.len_body = self._io:read_u4le()
  elseif _on == Elf.Bits.b64 then
    self.len_body = self._io:read_u8le()
  end
  local _on = self._root.bits
  if _on == Elf.Bits.b32 then
    self.memory_size = self._io:read_u4le()
  elseif _on == Elf.Bits.b64 then
    self.memory_size = self._io:read_u8le()
  end
  if self._root.bits == Elf.Bits.b32 then
    self.flags32 = self._io:read_u4le()
  end
  local _on = self._root.bits
  if _on == Elf.Bits.b32 then
    self.align = self._io:read_u4le()
  elseif _on == Elf.Bits.b64 then
    self.align = self._io:read_u8le()
  end
end

function Elf.EndianElf.ProgramHeader:_read_be()
  self.type = Elf.PhType(self._io:read_u4be())
  if self._root.bits == Elf.Bits.b64 then
    self.flags64 = self._io:read_u4be()
  end
  local _on = self._root.bits
  if _on == Elf.Bits.b32 then
    self.ofs_body = self._io:read_u4be()
  elseif _on == Elf.Bits.b64 then
    self.ofs_body = self._io:read_u8be()
  end
  local _on = self._root.bits
  if _on == Elf.Bits.b32 then
    self.virt_addr = self._io:read_u4be()
  elseif _on == Elf.Bits.b64 then
    self.virt_addr = self._io:read_u8be()
  end
  local _on = self._root.bits
  if _on == Elf.Bits.b32 then
    self.phys_addr = self._io:read_u4be()
  elseif _on == Elf.Bits.b64 then
    self.phys_addr = self._io:read_u8be()
  end
  local _on = self._root.bits
  if _on == Elf.Bits.b32 then
    self.len_body = self._io:read_u4be()
  elseif _on == Elf.Bits.b64 then
    self.len_body = self._io:read_u8be()
  end
  local _on = self._root.bits
  if _on == Elf.Bits.b32 then
    self.memory_size = self._io:read_u4be()
  elseif _on == Elf.Bits.b64 then
    self.memory_size = self._io:read_u8be()
  end
  if self._root.bits == Elf.Bits.b32 then
    self.flags32 = self._io:read_u4be()
  end
  local _on = self._root.bits
  if _on == Elf.Bits.b32 then
    self.align = self._io:read_u4be()
  elseif _on == Elf.Bits.b64 then
    self.align = self._io:read_u8be()
  end
end

-- 
-- Note: a program header may not have a valid body in the same ELF
-- file, so accessing `body` may result in reading garbage or
-- triggering EOF errors.
-- 
-- In particular, `*.debug` files produced by elfutils'
-- `eu-strip --strip-debug` (as used by Fedora/RHEL and other
-- RPM-based distros for their `*-debuginfo` packages, e.g.
-- `glibc-debuginfo`) copy the original binary's program header table
-- verbatim, including `ofs_body`/`len_body` (i.e.
-- `p_offset`/`p_filesz`), while dropping the actual contents of most
-- segments. Such segments can be recognized by the fact that the
-- corresponding section headers have type `sh_type::nobits`
-- (`SHT_NOBITS`). However, this Kaitai Struct implementation doesn't
-- know the mapping between program headers and section headers, so
-- this must be handled externally.
-- 
-- `*.debug` files from Debian/Ubuntu `*-dbg` packages (e.g.
-- `libc6-dbg`) are usually not affected by this issue, because they
-- are produced using GNU Binutils (`objcopy --only-keep-debug`),
-- which zeroes `len_body` for segments whose contents were omitted
-- (which reliably tells us that there is no `body`).
Elf.EndianElf.ProgramHeader.property.body = {}
function Elf.EndianElf.ProgramHeader.property.body:get()
  if self._m_body ~= nil then
    return self._m_body
  end

  if self.len_body ~= 0 then
    local _io = self._root._io
    local _pos = _io:pos()
    _io:seek(self.ofs_body)
    if self._is_le then
      local _on = self.type
      if _on == Elf.PhType.dynamic then
        self._raw__m_body = _io:read_bytes(self.len_body)
        local _io = KaitaiStream(stringstream(self._raw__m_body))
        self._m_body = Elf.EndianElf.PhDynamicSection(_io, self, self._root, self._is_le)
      elseif _on == Elf.PhType.interp then
        self._raw__m_body = _io:read_bytes(self.len_body)
        local _io = KaitaiStream(stringstream(self._raw__m_body))
        self._m_body = Elf.EndianElf.ProgramHeader.PhInterpreter(_io, self, self._root, self._is_le)
      elseif _on == Elf.PhType.note then
        self._raw__m_body = _io:read_bytes(self.len_body)
        local _io = KaitaiStream(stringstream(self._raw__m_body))
        self._m_body = Elf.EndianElf.NoteSection(_io, self, self._root, self._is_le)
      else
        self._m_body = _io:read_bytes(self.len_body)
      end
    else
      local _on = self.type
      if _on == Elf.PhType.dynamic then
        self._raw__m_body = _io:read_bytes(self.len_body)
        local _io = KaitaiStream(stringstream(self._raw__m_body))
        self._m_body = Elf.EndianElf.PhDynamicSection(_io, self, self._root, self._is_le)
      elseif _on == Elf.PhType.interp then
        self._raw__m_body = _io:read_bytes(self.len_body)
        local _io = KaitaiStream(stringstream(self._raw__m_body))
        self._m_body = Elf.EndianElf.ProgramHeader.PhInterpreter(_io, self, self._root, self._is_le)
      elseif _on == Elf.PhType.note then
        self._raw__m_body = _io:read_bytes(self.len_body)
        local _io = KaitaiStream(stringstream(self._raw__m_body))
        self._m_body = Elf.EndianElf.NoteSection(_io, self, self._root, self._is_le)
      else
        self._m_body = _io:read_bytes(self.len_body)
      end
    end
    _io:seek(_pos)
  end
  return self._m_body
end

Elf.EndianElf.ProgramHeader.property.flags_obj = {}
function Elf.EndianElf.ProgramHeader.property.flags_obj:get()
  if self._m_flags_obj ~= nil then
    return self._m_flags_obj
  end

  if self._is_le then
    local _on = self._root.bits
    if _on == Elf.Bits.b32 then
      self._m_flags_obj = Elf.PhdrTypeFlags(self.flags32, self._io, self, self._root)
    elseif _on == Elf.Bits.b64 then
      self._m_flags_obj = Elf.PhdrTypeFlags(self.flags64, self._io, self, self._root)
    end
  else
    local _on = self._root.bits
    if _on == Elf.Bits.b32 then
      self._m_flags_obj = Elf.PhdrTypeFlags(self.flags32, self._io, self, self._root)
    elseif _on == Elf.Bits.b64 then
      self._m_flags_obj = Elf.PhdrTypeFlags(self.flags64, self._io, self, self._root)
    end
  end
  return self._m_flags_obj
end


-- 
-- See also: Source (https://gabi.xinuos.com/v42/elf/08-dynamic.html#program-interpreter)
-- See also: Source (https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/program-interpreter.html)
Elf.EndianElf.ProgramHeader.PhInterpreter = class.class(KaitaiStruct)

function Elf.EndianElf.ProgramHeader.PhInterpreter:_init(io, parent, root, is_le)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self._is_le = is_le
  self:_read()
end

function Elf.EndianElf.ProgramHeader.PhInterpreter:_read()

  if self._is_le == true then
    self:_read_le()
  elseif self._is_le == false then
    self:_read_be()
  else
    error("unable to decide endianness")
  end
end

function Elf.EndianElf.ProgramHeader.PhInterpreter:_read_le()
  self.path_name = str_decode.decode(self._io:read_bytes_term(0, false, true, true), "ASCII")
end

function Elf.EndianElf.ProgramHeader.PhInterpreter:_read_be()
  self.path_name = str_decode.decode(self._io:read_bytes_term(0, false, true, true), "ASCII")
end


-- 
-- See also: Source (https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/relocation-sections.html)
-- See also: Source (https://refspecs.linuxfoundation.org/elf/gabi4+/ch4.reloc.html)
Elf.EndianElf.RelocationSection = class.class(KaitaiStruct)

function Elf.EndianElf.RelocationSection:_init(has_addend, io, parent, root, is_le)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self._is_le = is_le
  self.has_addend = has_addend
  self:_read()
end

function Elf.EndianElf.RelocationSection:_read()

  if self._is_le == true then
    self:_read_le()
  elseif self._is_le == false then
    self:_read_be()
  else
    error("unable to decide endianness")
  end
end

function Elf.EndianElf.RelocationSection:_read_le()
  self.entries = {}
  local i = 0
  while not self._io:is_eof() do
    self.entries[i + 1] = Elf.EndianElf.RelocationSectionEntry(self._io, self, self._root, self._is_le)
    i = i + 1
  end
end

function Elf.EndianElf.RelocationSection:_read_be()
  self.entries = {}
  local i = 0
  while not self._io:is_eof() do
    self.entries[i + 1] = Elf.EndianElf.RelocationSectionEntry(self._io, self, self._root, self._is_le)
    i = i + 1
  end
end


Elf.EndianElf.RelocationSectionEntry = class.class(KaitaiStruct)

function Elf.EndianElf.RelocationSectionEntry:_init(io, parent, root, is_le)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self._is_le = is_le
  self:_read()
end

function Elf.EndianElf.RelocationSectionEntry:_read()

  if self._is_le == true then
    self:_read_le()
  elseif self._is_le == false then
    self:_read_be()
  else
    error("unable to decide endianness")
  end
end

function Elf.EndianElf.RelocationSectionEntry:_read_le()
  local _on = self._root.bits
  if _on == Elf.Bits.b32 then
    self.offset = self._io:read_u4le()
  elseif _on == Elf.Bits.b64 then
    self.offset = self._io:read_u8le()
  end
  local _on = self._root.bits
  if _on == Elf.Bits.b32 then
    self.info = self._io:read_u4le()
  elseif _on == Elf.Bits.b64 then
    self.info = self._io:read_u8le()
  end
  if self._parent.has_addend then
    local _on = self._root.bits
    if _on == Elf.Bits.b32 then
      self.addend = self._io:read_s4le()
    elseif _on == Elf.Bits.b64 then
      self.addend = self._io:read_s8le()
    end
  end
end

function Elf.EndianElf.RelocationSectionEntry:_read_be()
  local _on = self._root.bits
  if _on == Elf.Bits.b32 then
    self.offset = self._io:read_u4be()
  elseif _on == Elf.Bits.b64 then
    self.offset = self._io:read_u8be()
  end
  local _on = self._root.bits
  if _on == Elf.Bits.b32 then
    self.info = self._io:read_u4be()
  elseif _on == Elf.Bits.b64 then
    self.info = self._io:read_u8be()
  end
  if self._parent.has_addend then
    local _on = self._root.bits
    if _on == Elf.Bits.b32 then
      self.addend = self._io:read_s4be()
    elseif _on == Elf.Bits.b64 then
      self.addend = self._io:read_s8be()
    end
  end
end


-- 
-- See also: Source (https://gabi.xinuos.com/v42/elf/03-sheader.html#section-header-table-entry)
-- See also: Source (https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/section-headers.html)
Elf.EndianElf.SectionHeader = class.class(KaitaiStruct)

function Elf.EndianElf.SectionHeader:_init(io, parent, root, is_le)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self._is_le = is_le
  self:_read()
end

function Elf.EndianElf.SectionHeader:_read()

  if self._is_le == true then
    self:_read_le()
  elseif self._is_le == false then
    self:_read_be()
  else
    error("unable to decide endianness")
  end
end

function Elf.EndianElf.SectionHeader:_read_le()
  self.ofs_name = self._io:read_u4le()
  self.type = Elf.ShType(self._io:read_u4le())
  local _on = self._root.bits
  if _on == Elf.Bits.b32 then
    self.flags = self._io:read_u4le()
  elseif _on == Elf.Bits.b64 then
    self.flags = self._io:read_u8le()
  end
  local _on = self._root.bits
  if _on == Elf.Bits.b32 then
    self.addr = self._io:read_u4le()
  elseif _on == Elf.Bits.b64 then
    self.addr = self._io:read_u8le()
  end
  local _on = self._root.bits
  if _on == Elf.Bits.b32 then
    self.ofs_body = self._io:read_u4le()
  elseif _on == Elf.Bits.b64 then
    self.ofs_body = self._io:read_u8le()
  end
  local _on = self._root.bits
  if _on == Elf.Bits.b32 then
    self.len_body = self._io:read_u4le()
  elseif _on == Elf.Bits.b64 then
    self.len_body = self._io:read_u8le()
  end
  self.linked_section_idx = self._io:read_u4le()
  self.info = self._io:read_u4le()
  local _on = self._root.bits
  if _on == Elf.Bits.b32 then
    self.align = self._io:read_u4le()
  elseif _on == Elf.Bits.b64 then
    self.align = self._io:read_u8le()
  end
  local _on = self._root.bits
  if _on == Elf.Bits.b32 then
    self.entry_size = self._io:read_u4le()
  elseif _on == Elf.Bits.b64 then
    self.entry_size = self._io:read_u8le()
  end
end

function Elf.EndianElf.SectionHeader:_read_be()
  self.ofs_name = self._io:read_u4be()
  self.type = Elf.ShType(self._io:read_u4be())
  local _on = self._root.bits
  if _on == Elf.Bits.b32 then
    self.flags = self._io:read_u4be()
  elseif _on == Elf.Bits.b64 then
    self.flags = self._io:read_u8be()
  end
  local _on = self._root.bits
  if _on == Elf.Bits.b32 then
    self.addr = self._io:read_u4be()
  elseif _on == Elf.Bits.b64 then
    self.addr = self._io:read_u8be()
  end
  local _on = self._root.bits
  if _on == Elf.Bits.b32 then
    self.ofs_body = self._io:read_u4be()
  elseif _on == Elf.Bits.b64 then
    self.ofs_body = self._io:read_u8be()
  end
  local _on = self._root.bits
  if _on == Elf.Bits.b32 then
    self.len_body = self._io:read_u4be()
  elseif _on == Elf.Bits.b64 then
    self.len_body = self._io:read_u8be()
  end
  self.linked_section_idx = self._io:read_u4be()
  self.info = self._io:read_u4be()
  local _on = self._root.bits
  if _on == Elf.Bits.b32 then
    self.align = self._io:read_u4be()
  elseif _on == Elf.Bits.b64 then
    self.align = self._io:read_u8be()
  end
  local _on = self._root.bits
  if _on == Elf.Bits.b32 then
    self.entry_size = self._io:read_u4be()
  elseif _on == Elf.Bits.b64 then
    self.entry_size = self._io:read_u8be()
  end
end

Elf.EndianElf.SectionHeader.property.body = {}
function Elf.EndianElf.SectionHeader.property.body:get()
  if self._m_body ~= nil then
    return self._m_body
  end

  if self.type ~= Elf.ShType.nobits then
    local _io = self._root._io
    local _pos = _io:pos()
    _io:seek(self.ofs_body)
    if self._is_le then
      local _on = self.type
      if _on == Elf.ShType.dynamic then
        self._raw__m_body = _io:read_bytes(self.len_body)
        local _io = KaitaiStream(stringstream(self._raw__m_body))
        self._m_body = Elf.EndianElf.ShDynamicSection(_io, self, self._root, self._is_le)
      elseif _on == Elf.ShType.dynsym then
        self._raw__m_body = _io:read_bytes(self.len_body)
        local _io = KaitaiStream(stringstream(self._raw__m_body))
        self._m_body = Elf.EndianElf.DynsymSection(_io, self, self._root, self._is_le)
      elseif _on == Elf.ShType.gnu_verdef then
        self._raw__m_body = _io:read_bytes(self.len_body)
        local _io = KaitaiStream(stringstream(self._raw__m_body))
        self._m_body = Elf.EndianElf.VerdefSection(_io, self, self._root, self._is_le)
      elseif _on == Elf.ShType.gnu_verneed then
        self._raw__m_body = _io:read_bytes(self.len_body)
        local _io = KaitaiStream(stringstream(self._raw__m_body))
        self._m_body = Elf.EndianElf.VerneedSection(_io, self, self._root, self._is_le)
      elseif _on == Elf.ShType.gnu_versym then
        self._raw__m_body = _io:read_bytes(self.len_body)
        local _io = KaitaiStream(stringstream(self._raw__m_body))
        self._m_body = Elf.EndianElf.VersymSection(_io, self, self._root, self._is_le)
      elseif _on == Elf.ShType.note then
        self._raw__m_body = _io:read_bytes(self.len_body)
        local _io = KaitaiStream(stringstream(self._raw__m_body))
        self._m_body = Elf.EndianElf.NoteSection(_io, self, self._root, self._is_le)
      elseif _on == Elf.ShType.rel then
        self._raw__m_body = _io:read_bytes(self.len_body)
        local _io = KaitaiStream(stringstream(self._raw__m_body))
        self._m_body = Elf.EndianElf.RelocationSection(false, _io, self, self._root, self._is_le)
      elseif _on == Elf.ShType.rela then
        self._raw__m_body = _io:read_bytes(self.len_body)
        local _io = KaitaiStream(stringstream(self._raw__m_body))
        self._m_body = Elf.EndianElf.RelocationSection(true, _io, self, self._root, self._is_le)
      elseif _on == Elf.ShType.strtab then
        self._raw__m_body = _io:read_bytes(self.len_body)
        local _io = KaitaiStream(stringstream(self._raw__m_body))
        self._m_body = Elf.EndianElf.StringsStruct(_io, self, self._root, self._is_le)
      elseif _on == Elf.ShType.symtab then
        self._raw__m_body = _io:read_bytes(self.len_body)
        local _io = KaitaiStream(stringstream(self._raw__m_body))
        self._m_body = Elf.EndianElf.DynsymSection(_io, self, self._root, self._is_le)
      else
        self._m_body = _io:read_bytes(self.len_body)
      end
    else
      local _on = self.type
      if _on == Elf.ShType.dynamic then
        self._raw__m_body = _io:read_bytes(self.len_body)
        local _io = KaitaiStream(stringstream(self._raw__m_body))
        self._m_body = Elf.EndianElf.ShDynamicSection(_io, self, self._root, self._is_le)
      elseif _on == Elf.ShType.dynsym then
        self._raw__m_body = _io:read_bytes(self.len_body)
        local _io = KaitaiStream(stringstream(self._raw__m_body))
        self._m_body = Elf.EndianElf.DynsymSection(_io, self, self._root, self._is_le)
      elseif _on == Elf.ShType.gnu_verdef then
        self._raw__m_body = _io:read_bytes(self.len_body)
        local _io = KaitaiStream(stringstream(self._raw__m_body))
        self._m_body = Elf.EndianElf.VerdefSection(_io, self, self._root, self._is_le)
      elseif _on == Elf.ShType.gnu_verneed then
        self._raw__m_body = _io:read_bytes(self.len_body)
        local _io = KaitaiStream(stringstream(self._raw__m_body))
        self._m_body = Elf.EndianElf.VerneedSection(_io, self, self._root, self._is_le)
      elseif _on == Elf.ShType.gnu_versym then
        self._raw__m_body = _io:read_bytes(self.len_body)
        local _io = KaitaiStream(stringstream(self._raw__m_body))
        self._m_body = Elf.EndianElf.VersymSection(_io, self, self._root, self._is_le)
      elseif _on == Elf.ShType.note then
        self._raw__m_body = _io:read_bytes(self.len_body)
        local _io = KaitaiStream(stringstream(self._raw__m_body))
        self._m_body = Elf.EndianElf.NoteSection(_io, self, self._root, self._is_le)
      elseif _on == Elf.ShType.rel then
        self._raw__m_body = _io:read_bytes(self.len_body)
        local _io = KaitaiStream(stringstream(self._raw__m_body))
        self._m_body = Elf.EndianElf.RelocationSection(false, _io, self, self._root, self._is_le)
      elseif _on == Elf.ShType.rela then
        self._raw__m_body = _io:read_bytes(self.len_body)
        local _io = KaitaiStream(stringstream(self._raw__m_body))
        self._m_body = Elf.EndianElf.RelocationSection(true, _io, self, self._root, self._is_le)
      elseif _on == Elf.ShType.strtab then
        self._raw__m_body = _io:read_bytes(self.len_body)
        local _io = KaitaiStream(stringstream(self._raw__m_body))
        self._m_body = Elf.EndianElf.StringsStruct(_io, self, self._root, self._is_le)
      elseif _on == Elf.ShType.symtab then
        self._raw__m_body = _io:read_bytes(self.len_body)
        local _io = KaitaiStream(stringstream(self._raw__m_body))
        self._m_body = Elf.EndianElf.DynsymSection(_io, self, self._root, self._is_le)
      else
        self._m_body = _io:read_bytes(self.len_body)
      end
    end
    _io:seek(_pos)
  end
  return self._m_body
end

Elf.EndianElf.SectionHeader.property.flags_obj = {}
function Elf.EndianElf.SectionHeader.property.flags_obj:get()
  if self._m_flags_obj ~= nil then
    return self._m_flags_obj
  end

  if self._is_le then
    self._m_flags_obj = Elf.SectionHeaderFlags(self.flags, self._io, self, self._root)
  else
    self._m_flags_obj = Elf.SectionHeaderFlags(self.flags, self._io, self, self._root)
  end
  return self._m_flags_obj
end

-- 
-- may reference a later section header, so don't try to access too early (use only lazy `instances`).
-- See also: Source (https://refspecs.linuxfoundation.org/elf/gabi4+/ch4.sheader.html#sh_link)
Elf.EndianElf.SectionHeader.property.linked_section = {}
function Elf.EndianElf.SectionHeader.property.linked_section:get()
  if self._m_linked_section ~= nil then
    return self._m_linked_section
  end

  if  ((self.linked_section_idx ~= Elf.SectionHeaderIdxSpecial.undefined.value) and (self.linked_section_idx < self._root.header.num_section_headers))  then
    self._m_linked_section = self._root.header.section_headers[self.linked_section_idx + 1]
  end
  return self._m_linked_section
end

Elf.EndianElf.SectionHeader.property.name = {}
function Elf.EndianElf.SectionHeader.property.name:get()
  if self._m_name ~= nil then
    return self._m_name
  end

  local _io = self._root.header.section_names._io
  local _pos = _io:pos()
  _io:seek(self.ofs_name)
  if self._is_le then
    self._m_name = str_decode.decode(_io:read_bytes_term(0, false, true, true), "ASCII")
  else
    self._m_name = str_decode.decode(_io:read_bytes_term(0, false, true, true), "ASCII")
  end
  _io:seek(_pos)
  return self._m_name
end


-- 
-- Same type as `ph_dynamic_section`, but it depends on
-- `_parent.linked_section`, so it can be used only in the
-- `section_header` type. See the documentation for `ph_dynamic_section`
-- for more details.
-- See also: Source (https://gabi.xinuos.com/v42/elf/08-dynamic.html#dynamic-section)
-- See also: Source (https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/dynamic-section.html)
Elf.EndianElf.ShDynamicSection = class.class(KaitaiStruct)

function Elf.EndianElf.ShDynamicSection:_init(io, parent, root, is_le)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self._is_le = is_le
  self:_read()
end

function Elf.EndianElf.ShDynamicSection:_read()

  if self._is_le == true then
    self:_read_le()
  elseif self._is_le == false then
    self:_read_be()
  else
    error("unable to decide endianness")
  end
end

function Elf.EndianElf.ShDynamicSection:_read_le()
  self.entries = {}
  local i = 0
  while true do
    local _ = Elf.EndianElf.ShDynamicSectionEntry(self._io, self, self._root, self._is_le)
    self.entries[i + 1] = _
    if _.tag_enum == Elf.DynamicArrayTags.null then
      break
    end
    i = i + 1
  end
end

function Elf.EndianElf.ShDynamicSection:_read_be()
  self.entries = {}
  local i = 0
  while true do
    local _ = Elf.EndianElf.ShDynamicSectionEntry(self._io, self, self._root, self._is_le)
    self.entries[i + 1] = _
    if _.tag_enum == Elf.DynamicArrayTags.null then
      break
    end
    i = i + 1
  end
end

Elf.EndianElf.ShDynamicSection.property.is_string_table_linked = {}
function Elf.EndianElf.ShDynamicSection.property.is_string_table_linked:get()
  if self._m_is_string_table_linked ~= nil then
    return self._m_is_string_table_linked
  end

  self._m_is_string_table_linked = self._parent.linked_section.type == Elf.ShType.strtab
  return self._m_is_string_table_linked
end


-- 
-- Same type as `ph_dynamic_section_entry`, but with the `value_str`
-- instance - see the documentation for `ph_dynamic_section` for more
-- details.
-- See also: Source (https://gabi.xinuos.com/v42/elf/08-dynamic.html#dynamic-section)
-- See also: Source (https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/dynamic-section.html)
Elf.EndianElf.ShDynamicSectionEntry = class.class(KaitaiStruct)

function Elf.EndianElf.ShDynamicSectionEntry:_init(io, parent, root, is_le)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self._is_le = is_le
  self:_read()
end

function Elf.EndianElf.ShDynamicSectionEntry:_read()

  if self._is_le == true then
    self:_read_le()
  elseif self._is_le == false then
    self:_read_be()
  else
    error("unable to decide endianness")
  end
end

function Elf.EndianElf.ShDynamicSectionEntry:_read_le()
  local _on = self._root.bits
  if _on == Elf.Bits.b32 then
    self.tag = self._io:read_u4le()
  elseif _on == Elf.Bits.b64 then
    self.tag = self._io:read_u8le()
  end
  local _on = self._root.bits
  if _on == Elf.Bits.b32 then
    self.value_or_ptr = self._io:read_u4le()
  elseif _on == Elf.Bits.b64 then
    self.value_or_ptr = self._io:read_u8le()
  end
end

function Elf.EndianElf.ShDynamicSectionEntry:_read_be()
  local _on = self._root.bits
  if _on == Elf.Bits.b32 then
    self.tag = self._io:read_u4be()
  elseif _on == Elf.Bits.b64 then
    self.tag = self._io:read_u8be()
  end
  local _on = self._root.bits
  if _on == Elf.Bits.b32 then
    self.value_or_ptr = self._io:read_u4be()
  elseif _on == Elf.Bits.b64 then
    self.value_or_ptr = self._io:read_u8be()
  end
end

Elf.EndianElf.ShDynamicSectionEntry.property.flag_1_values = {}
function Elf.EndianElf.ShDynamicSectionEntry.property.flag_1_values:get()
  if self._m_flag_1_values ~= nil then
    return self._m_flag_1_values
  end

  if self.tag_enum == Elf.DynamicArrayTags.flags_1 then
    if self._is_le then
      self._m_flag_1_values = Elf.DtFlag1Values(self.value_or_ptr, self._io, self, self._root)
    else
      self._m_flag_1_values = Elf.DtFlag1Values(self.value_or_ptr, self._io, self, self._root)
    end
  end
  return self._m_flag_1_values
end

Elf.EndianElf.ShDynamicSectionEntry.property.flag_values = {}
function Elf.EndianElf.ShDynamicSectionEntry.property.flag_values:get()
  if self._m_flag_values ~= nil then
    return self._m_flag_values
  end

  if self.tag_enum == Elf.DynamicArrayTags.flags then
    if self._is_le then
      self._m_flag_values = Elf.DtFlagValues(self.value_or_ptr, self._io, self, self._root)
    else
      self._m_flag_values = Elf.DtFlagValues(self.value_or_ptr, self._io, self, self._root)
    end
  end
  return self._m_flag_values
end

Elf.EndianElf.ShDynamicSectionEntry.property.is_value_str = {}
function Elf.EndianElf.ShDynamicSectionEntry.property.is_value_str:get()
  if self._m_is_value_str ~= nil then
    return self._m_is_value_str
  end

  self._m_is_value_str =  ((self.value_or_ptr ~= 0) and ( ((self.tag_enum == Elf.DynamicArrayTags.needed) or (self.tag_enum == Elf.DynamicArrayTags.soname) or (self.tag_enum == Elf.DynamicArrayTags.rpath) or (self.tag_enum == Elf.DynamicArrayTags.runpath) or (self.tag_enum == Elf.DynamicArrayTags.sunw_auxiliary) or (self.tag_enum == Elf.DynamicArrayTags.sunw_filter) or (self.tag_enum == Elf.DynamicArrayTags.auxiliary) or (self.tag_enum == Elf.DynamicArrayTags.filter) or (self.tag_enum == Elf.DynamicArrayTags.config) or (self.tag_enum == Elf.DynamicArrayTags.depaudit) or (self.tag_enum == Elf.DynamicArrayTags.audit)) )) 
  return self._m_is_value_str
end

Elf.EndianElf.ShDynamicSectionEntry.property.tag_enum = {}
function Elf.EndianElf.ShDynamicSectionEntry.property.tag_enum:get()
  if self._m_tag_enum ~= nil then
    return self._m_tag_enum
  end

  self._m_tag_enum = Elf.DynamicArrayTags(self.tag)
  return self._m_tag_enum
end

Elf.EndianElf.ShDynamicSectionEntry.property.value_str = {}
function Elf.EndianElf.ShDynamicSectionEntry.property.value_str:get()
  if self._m_value_str ~= nil then
    return self._m_value_str
  end

  if  ((self.is_value_str) and (self._parent.is_string_table_linked))  then
    local _io = self._parent._parent.linked_section.body._io
    local _pos = _io:pos()
    _io:seek(self.value_or_ptr)
    if self._is_le then
      self._m_value_str = str_decode.decode(_io:read_bytes_term(0, false, true, true), "ASCII")
    else
      self._m_value_str = str_decode.decode(_io:read_bytes_term(0, false, true, true), "ASCII")
    end
    _io:seek(_pos)
  end
  return self._m_value_str
end


Elf.EndianElf.StringsStruct = class.class(KaitaiStruct)

function Elf.EndianElf.StringsStruct:_init(io, parent, root, is_le)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self._is_le = is_le
  self:_read()
end

function Elf.EndianElf.StringsStruct:_read()

  if self._is_le == true then
    self:_read_le()
  elseif self._is_le == false then
    self:_read_be()
  else
    error("unable to decide endianness")
  end
end

function Elf.EndianElf.StringsStruct:_read_le()
  self.entries = {}
  local i = 0
  while not self._io:is_eof() do
    self.entries[i + 1] = str_decode.decode(self._io:read_bytes_term(0, false, true, true), "UTF-8")
    i = i + 1
  end
end

function Elf.EndianElf.StringsStruct:_read_be()
  self.entries = {}
  local i = 0
  while not self._io:is_eof() do
    self.entries[i + 1] = str_decode.decode(self._io:read_bytes_term(0, false, true, true), "UTF-8")
    i = i + 1
  end
end


-- 
-- See also: Source (https://refspecs.linuxfoundation.org/LSB_5.0.0/LSB-Core-generic/LSB-Core-generic/symversion.html#VERDEFEXTS)
-- See also: Source (https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/version-definition-section.html)
-- See also: Source (https://www.akkadia.org/drepper/symbol-versioning)
Elf.EndianElf.VerdauxEntry = class.class(KaitaiStruct)

function Elf.EndianElf.VerdauxEntry:_init(io, parent, root, is_le)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self._is_le = is_le
  self:_read()
end

function Elf.EndianElf.VerdauxEntry:_read()

  if self._is_le == true then
    self:_read_le()
  elseif self._is_le == false then
    self:_read_be()
  else
    error("unable to decide endianness")
  end
end

function Elf.EndianElf.VerdauxEntry:_read_le()
  if self.ofs_start < 0 then
    self._unnamed0 = self._io:read_bytes(0)
  end
  self.ofs_name = self._io:read_u4le()
  self.ofs_next = self._io:read_u4le()
  local _ = self.ofs_next
  if not( ((_ == 0) or (_ >= 8)) ) then
    error("ValidationExprError")
  end
end

function Elf.EndianElf.VerdauxEntry:_read_be()
  if self.ofs_start < 0 then
    self._unnamed0 = self._io:read_bytes(0)
  end
  self.ofs_name = self._io:read_u4be()
  self.ofs_next = self._io:read_u4be()
  local _ = self.ofs_next
  if not( ((_ == 0) or (_ >= 8)) ) then
    error("ValidationExprError")
  end
end

Elf.EndianElf.VerdauxEntry.property.name = {}
function Elf.EndianElf.VerdauxEntry.property.name:get()
  if self._m_name ~= nil then
    return self._m_name
  end

  if self._parent.is_string_table_linked then
    local _io = self._parent._parent.linked_section.body._io
    local _pos = _io:pos()
    _io:seek(self.ofs_name)
    if self._is_le then
      self._m_name = str_decode.decode(_io:read_bytes_term(0, false, true, true), "UTF-8")
    else
      self._m_name = str_decode.decode(_io:read_bytes_term(0, false, true, true), "UTF-8")
    end
    _io:seek(_pos)
  end
  return self._m_name
end

Elf.EndianElf.VerdauxEntry.property.next = {}
function Elf.EndianElf.VerdauxEntry.property.next:get()
  if self._m_next ~= nil then
    return self._m_next
  end

  if self.ofs_next ~= 0 then
    local _pos = self._io:pos()
    self._io:seek(self.ofs_start + self.ofs_next)
    if self._is_le then
      self._m_next = Elf.EndianElf.VerdauxEntry(self._io, self._parent, self._root, self._is_le)
    else
      self._m_next = Elf.EndianElf.VerdauxEntry(self._io, self._parent, self._root, self._is_le)
    end
    self._io:seek(_pos)
  end
  return self._m_next
end

Elf.EndianElf.VerdauxEntry.property.ofs_start = {}
function Elf.EndianElf.VerdauxEntry.property.ofs_start:get()
  if self._m_ofs_start ~= nil then
    return self._m_ofs_start
  end

  self._m_ofs_start = self._io:pos()
  return self._m_ofs_start
end

-- 
-- Byte offset to the version or dependency name string in the linked
-- string table.
-- 
-- Byte offset to the next verdaux entry, relative to the start of
-- this `verdaux_entry`. A value of zero means that there is no next
-- entry.

-- 
-- Version Definitions, contained in the special section named
-- `.gnu.version_d` with the section type `sh_type::gnu_verdef`
-- (`SHT_GNU_verdef`).
-- 
-- The number of entries in this section must match the value of the
-- dynamic tag `dynamic_array_tags::verdefnum` (`DT_VERDEFNUM`) in the
-- Dynamic Section (`.dynamic`).
-- 
-- `_parent.linked_section` must be the string table that contains the
-- strings referenced by this section. Specifically, the string table in
-- the `.dynstr` section should be used (side note: the `readelf` command
-- doesn't even check which string table `sh_link` points to, and always
-- uses `.dynstr` for the lookups - see
-- <https://forge.sourceware.org/binutils-gdb/binutils-gdb-mirror/src/tag/binutils-2_46_1/binutils/readelf.c#L13787>).
-- 
-- The `is_string_table_linked` value instance indicates whether the
-- string table is linked. If it is not, version names (the `name`
-- instance in the `verdaux_entry` type) will not be available.
-- See also: Source (https://refspecs.linuxfoundation.org/LSB_5.0.0/LSB-Core-generic/LSB-Core-generic/symversion.html#SYMVERDEFS)
-- See also: Source (https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/version-definition-section.html)
-- See also: Source (https://www.akkadia.org/drepper/symbol-versioning)
Elf.EndianElf.VerdefSection = class.class(KaitaiStruct)

function Elf.EndianElf.VerdefSection:_init(io, parent, root, is_le)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self._is_le = is_le
  self:_read()
end

function Elf.EndianElf.VerdefSection:_read()

  if self._is_le == true then
    self:_read_le()
  elseif self._is_le == false then
    self:_read_be()
  else
    error("unable to decide endianness")
  end
end

function Elf.EndianElf.VerdefSection:_read_le()
  self.first_entry = Elf.EndianElf.VerdefSectionEntry(self._io, self, self._root, self._is_le)
end

function Elf.EndianElf.VerdefSection:_read_be()
  self.first_entry = Elf.EndianElf.VerdefSectionEntry(self._io, self, self._root, self._is_le)
end

-- 
-- Indicates whether a string table is linked. This should always be
-- `true` in spec-compliant ELF files. If it is `false`, the string
-- offsets in this section will not be resolved to strings.
Elf.EndianElf.VerdefSection.property.is_string_table_linked = {}
function Elf.EndianElf.VerdefSection.property.is_string_table_linked:get()
  if self._m_is_string_table_linked ~= nil then
    return self._m_is_string_table_linked
  end

  self._m_is_string_table_linked = self._parent.linked_section.type == Elf.ShType.strtab
  return self._m_is_string_table_linked
end

-- 
-- Number of entries (version definitions).
-- See also: Source (https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/section-headers.html#GUID-2CBE4879-2E76-426E-BB7F-CF0CB1D87C52__CHAPTER6-47976)
Elf.EndianElf.VerdefSection.property.num_entries = {}
function Elf.EndianElf.VerdefSection.property.num_entries:get()
  if self._m_num_entries ~= nil then
    return self._m_num_entries
  end

  self._m_num_entries = self._parent.info
  return self._m_num_entries
end


-- 
-- See also: Source (https://refspecs.linuxfoundation.org/LSB_5.0.0/LSB-Core-generic/LSB-Core-generic/symversion.html#VERDEFENTRIES)
-- See also: Source (https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/version-definition-section.html)
-- See also: Source (https://www.akkadia.org/drepper/symbol-versioning)
Elf.EndianElf.VerdefSectionEntry = class.class(KaitaiStruct)

function Elf.EndianElf.VerdefSectionEntry:_init(io, parent, root, is_le)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self._is_le = is_le
  self:_read()
end

function Elf.EndianElf.VerdefSectionEntry:_read()

  if self._is_le == true then
    self:_read_le()
  elseif self._is_le == false then
    self:_read_be()
  else
    error("unable to decide endianness")
  end
end

function Elf.EndianElf.VerdefSectionEntry:_read_le()
  if self.ofs_start < 0 then
    self._unnamed0 = self._io:read_bytes(0)
  end
  self.version = self._io:read_u2le()
  if not(self.version == 1) then
    error("not equal, expected " .. 1 .. ", but got " .. self.version)
  end
  self.flags = self._io:read_u2le()
  self.version_index = self._io:read_u2le()
  local _ = self.version_index
  if not(_ & 32768 == 0) then
    error("ValidationExprError")
  end
  self.num_aux_entries = self._io:read_u2le()
  if not(self.num_aux_entries >= 1) then
    error("ValidationLessThanError")
  end
  self.hash = self._io:read_u4le()
  self.ofs_first_aux = self._io:read_u4le()
  if not(self.ofs_first_aux >= 20) then
    error("ValidationLessThanError")
  end
  self.ofs_next = self._io:read_u4le()
  local _ = self.ofs_next
  if not( ((_ == 0) or (_ >= 20)) ) then
    error("ValidationExprError")
  end
end

function Elf.EndianElf.VerdefSectionEntry:_read_be()
  if self.ofs_start < 0 then
    self._unnamed0 = self._io:read_bytes(0)
  end
  self.version = self._io:read_u2be()
  if not(self.version == 1) then
    error("not equal, expected " .. 1 .. ", but got " .. self.version)
  end
  self.flags = self._io:read_u2be()
  self.version_index = self._io:read_u2be()
  local _ = self.version_index
  if not(_ & 32768 == 0) then
    error("ValidationExprError")
  end
  self.num_aux_entries = self._io:read_u2be()
  if not(self.num_aux_entries >= 1) then
    error("ValidationLessThanError")
  end
  self.hash = self._io:read_u4be()
  self.ofs_first_aux = self._io:read_u4be()
  if not(self.ofs_first_aux >= 20) then
    error("ValidationLessThanError")
  end
  self.ofs_next = self._io:read_u4be()
  local _ = self.ofs_next
  if not( ((_ == 0) or (_ >= 20)) ) then
    error("ValidationExprError")
  end
end

-- 
-- First auxiliary entry of type `verdaux_entry` (`Elfxx_Verdaux`).
-- The rest follow its `next` instance.
Elf.EndianElf.VerdefSectionEntry.property.first_aux = {}
function Elf.EndianElf.VerdefSectionEntry.property.first_aux:get()
  if self._m_first_aux ~= nil then
    return self._m_first_aux
  end

  local _pos = self._io:pos()
  self._io:seek(self.ofs_start + self.ofs_first_aux)
  if self._is_le then
    self._m_first_aux = Elf.EndianElf.VerdauxEntry(self._io, self._parent, self._root, self._is_le)
  else
    self._m_first_aux = Elf.EndianElf.VerdauxEntry(self._io, self._parent, self._root, self._is_le)
  end
  self._io:seek(_pos)
  return self._m_first_aux
end

Elf.EndianElf.VerdefSectionEntry.property.flags_obj = {}
function Elf.EndianElf.VerdefSectionEntry.property.flags_obj:get()
  if self._m_flags_obj ~= nil then
    return self._m_flags_obj
  end

  if self._is_le then
    self._m_flags_obj = Elf.EndianElf.VersionFlags(self.flags, self._io, self, self._root, self._is_le)
  else
    self._m_flags_obj = Elf.EndianElf.VersionFlags(self.flags, self._io, self, self._root, self._is_le)
  end
  return self._m_flags_obj
end

Elf.EndianElf.VerdefSectionEntry.property.next = {}
function Elf.EndianElf.VerdefSectionEntry.property.next:get()
  if self._m_next ~= nil then
    return self._m_next
  end

  if self.ofs_next ~= 0 then
    local _pos = self._io:pos()
    self._io:seek(self.ofs_start + self.ofs_next)
    if self._is_le then
      self._m_next = Elf.EndianElf.VerdefSectionEntry(self._io, self._parent, self._root, self._is_le)
    else
      self._m_next = Elf.EndianElf.VerdefSectionEntry(self._io, self._parent, self._root, self._is_le)
    end
    self._io:seek(_pos)
  end
  return self._m_next
end

Elf.EndianElf.VerdefSectionEntry.property.ofs_start = {}
function Elf.EndianElf.VerdefSectionEntry.property.ofs_start:get()
  if self._m_ofs_start ~= nil then
    return self._m_ofs_start
  end

  self._m_ofs_start = self._io:pos()
  return self._m_ofs_start
end

Elf.EndianElf.VerdefSectionEntry.property.version_index_special = {}
function Elf.EndianElf.VerdefSectionEntry.property.version_index_special:get()
  if self._m_version_index_special ~= nil then
    return self._m_version_index_special
  end

  self._m_version_index_special = Elf.VersionIndexSpecial(self.version_index)
  return self._m_version_index_special
end

-- 
-- Version of the structure. Must be set to 1.
-- 
-- Version information flag bitmask. Access `flags_obj` instead.
-- 
-- Version index assigned to this version definition. A unique index
-- that entries in the Symbol Version Table (the `versym_section`
-- type) use to reference the corresponding version definition.
-- See also: Source (https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/version-definition-section.html)
-- 
-- Number of associated auxiliary entries.
-- 
-- Version name hash value (ELF hash function).
-- 
-- Byte offset to the first `verdaux_entry` (`Elfxx_Verdaux`)
-- associated with this version definition. The offset is relative to
-- the start of this `verdef_section_entry`.
-- 
-- Byte offset to the next verdef entry, relative to the start of
-- this `verdef_section_entry`. A value of zero means that there is
-- no next entry.

-- 
-- See also: Source (https://refspecs.linuxfoundation.org/LSB_5.0.0/LSB-Core-generic/LSB-Core-generic/symversion.html#VERNEEDEXTFIG)
-- See also: Source (https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/version-dependency-section.html)
-- See also: Source (https://www.akkadia.org/drepper/symbol-versioning)
Elf.EndianElf.VernauxEntry = class.class(KaitaiStruct)

function Elf.EndianElf.VernauxEntry:_init(io, parent, root, is_le)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self._is_le = is_le
  self:_read()
end

function Elf.EndianElf.VernauxEntry:_read()

  if self._is_le == true then
    self:_read_le()
  elseif self._is_le == false then
    self:_read_be()
  else
    error("unable to decide endianness")
  end
end

function Elf.EndianElf.VernauxEntry:_read_le()
  if self.ofs_start < 0 then
    self._unnamed0 = self._io:read_bytes(0)
  end
  self.hash = self._io:read_u4le()
  self.flags = self._io:read_u2le()
  self.version_index = Elf.EndianElf.VersionIndex(self._io, self, self._root, self._is_le)
  self.ofs_name = self._io:read_u4le()
  self.ofs_next = self._io:read_u4le()
  local _ = self.ofs_next
  if not( ((_ == 0) or (_ >= 16)) ) then
    error("ValidationExprError")
  end
end

function Elf.EndianElf.VernauxEntry:_read_be()
  if self.ofs_start < 0 then
    self._unnamed0 = self._io:read_bytes(0)
  end
  self.hash = self._io:read_u4be()
  self.flags = self._io:read_u2be()
  self.version_index = Elf.EndianElf.VersionIndex(self._io, self, self._root, self._is_le)
  self.ofs_name = self._io:read_u4be()
  self.ofs_next = self._io:read_u4be()
  local _ = self.ofs_next
  if not( ((_ == 0) or (_ >= 16)) ) then
    error("ValidationExprError")
  end
end

Elf.EndianElf.VernauxEntry.property.flags_obj = {}
function Elf.EndianElf.VernauxEntry.property.flags_obj:get()
  if self._m_flags_obj ~= nil then
    return self._m_flags_obj
  end

  if self._is_le then
    self._m_flags_obj = Elf.EndianElf.VersionFlags(self.flags, self._io, self, self._root, self._is_le)
  else
    self._m_flags_obj = Elf.EndianElf.VersionFlags(self.flags, self._io, self, self._root, self._is_le)
  end
  return self._m_flags_obj
end

Elf.EndianElf.VernauxEntry.property.name = {}
function Elf.EndianElf.VernauxEntry.property.name:get()
  if self._m_name ~= nil then
    return self._m_name
  end

  if self._parent.is_string_table_linked then
    local _io = self._parent._parent.linked_section.body._io
    local _pos = _io:pos()
    _io:seek(self.ofs_name)
    if self._is_le then
      self._m_name = str_decode.decode(_io:read_bytes_term(0, false, true, true), "UTF-8")
    else
      self._m_name = str_decode.decode(_io:read_bytes_term(0, false, true, true), "UTF-8")
    end
    _io:seek(_pos)
  end
  return self._m_name
end

Elf.EndianElf.VernauxEntry.property.next = {}
function Elf.EndianElf.VernauxEntry.property.next:get()
  if self._m_next ~= nil then
    return self._m_next
  end

  if self.ofs_next ~= 0 then
    local _pos = self._io:pos()
    self._io:seek(self.ofs_start + self.ofs_next)
    if self._is_le then
      self._m_next = Elf.EndianElf.VernauxEntry(self._io, self._parent, self._root, self._is_le)
    else
      self._m_next = Elf.EndianElf.VernauxEntry(self._io, self._parent, self._root, self._is_le)
    end
    self._io:seek(_pos)
  end
  return self._m_next
end

Elf.EndianElf.VernauxEntry.property.ofs_start = {}
function Elf.EndianElf.VernauxEntry.property.ofs_start:get()
  if self._m_ofs_start ~= nil then
    return self._m_ofs_start
  end

  self._m_ofs_start = self._io:pos()
  return self._m_ofs_start
end

-- 
-- Dependency name hash value (ELF hash function).
-- 
-- Dependency information flag bitmask. Access `flags_obj` instead.
-- 
-- Version index assigned to this dependency version. A unique index
-- that entries in the Symbol Version Table (the `versym_section`
-- type) use to reference the corresponding dependency version.
-- See also: Source (https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/version-dependency-section.html)
-- 
-- Byte offset to the dependency name string in the linked string
-- table.
-- 
-- Byte offset to the next vernaux entry, relative to the start of
-- this `vernaux_entry`. A value of zero means that there is no next
-- entry.

-- 
-- Version Requirements, contained in the special section named
-- `.gnu.version_r` with the section type `sh_type::gnu_verneed`
-- (`SHT_GNU_verneed`). This section defines the required versions of
-- dynamic symbols from other shared objects.
-- 
-- The number of entries in this section must match the value of the
-- dynamic tag `dynamic_array_tags::verneednum` (`DT_VERNEEDNUM`) in the
-- Dynamic Section (`.dynamic`).
-- 
-- `_parent.linked_section` must be the string table that contains the
-- strings referenced by this section. Specifically, the string table in
-- the `.dynstr` section should be used (side note: the `readelf` command
-- doesn't even check which string table `sh_link` points to, and always
-- uses `.dynstr` for the lookups - see
-- <https://forge.sourceware.org/binutils-gdb/binutils-gdb-mirror/src/tag/binutils-2_46_1/binutils/readelf.c#L13941>).
-- 
-- The `is_string_table_linked` value instance indicates whether the
-- string table is linked. If it is not, file names (the `file_name`
-- instance in the `verneed_section_entry` type) or version names (the
-- `name` instance in the `vernaux_entry` type) will not be available.
-- See also: Source (https://refspecs.linuxfoundation.org/LSB_5.0.0/LSB-Core-generic/LSB-Core-generic/symversion.html#SYMVERRQMTS)
-- See also: Source (https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/version-dependency-section.html)
-- See also: Source (https://www.akkadia.org/drepper/symbol-versioning)
Elf.EndianElf.VerneedSection = class.class(KaitaiStruct)

function Elf.EndianElf.VerneedSection:_init(io, parent, root, is_le)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self._is_le = is_le
  self:_read()
end

function Elf.EndianElf.VerneedSection:_read()

  if self._is_le == true then
    self:_read_le()
  elseif self._is_le == false then
    self:_read_be()
  else
    error("unable to decide endianness")
  end
end

function Elf.EndianElf.VerneedSection:_read_le()
  self.first_entry = Elf.EndianElf.VerneedSectionEntry(self._io, self, self._root, self._is_le)
end

function Elf.EndianElf.VerneedSection:_read_be()
  self.first_entry = Elf.EndianElf.VerneedSectionEntry(self._io, self, self._root, self._is_le)
end

-- 
-- Indicates whether a string table is linked. This should always be
-- `true` in spec-compliant ELF files. If it is `false`, the string
-- offsets in this section will not be resolved to strings.
Elf.EndianElf.VerneedSection.property.is_string_table_linked = {}
function Elf.EndianElf.VerneedSection.property.is_string_table_linked:get()
  if self._m_is_string_table_linked ~= nil then
    return self._m_is_string_table_linked
  end

  self._m_is_string_table_linked = self._parent.linked_section.type == Elf.ShType.strtab
  return self._m_is_string_table_linked
end

-- 
-- Number of entries (dependency versions).
-- See also: Source (https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/section-headers.html#GUID-2CBE4879-2E76-426E-BB7F-CF0CB1D87C52__CHAPTER6-47976)
Elf.EndianElf.VerneedSection.property.num_entries = {}
function Elf.EndianElf.VerneedSection.property.num_entries:get()
  if self._m_num_entries ~= nil then
    return self._m_num_entries
  end

  self._m_num_entries = self._parent.info
  return self._m_num_entries
end


-- 
-- See also: Source (https://refspecs.linuxfoundation.org/LSB_5.0.0/LSB-Core-generic/LSB-Core-generic/symversion.html#VERNEEDFIG)
-- See also: Source (https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/version-dependency-section.html)
-- See also: Source (https://www.akkadia.org/drepper/symbol-versioning)
Elf.EndianElf.VerneedSectionEntry = class.class(KaitaiStruct)

function Elf.EndianElf.VerneedSectionEntry:_init(io, parent, root, is_le)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self._is_le = is_le
  self:_read()
end

function Elf.EndianElf.VerneedSectionEntry:_read()

  if self._is_le == true then
    self:_read_le()
  elseif self._is_le == false then
    self:_read_be()
  else
    error("unable to decide endianness")
  end
end

function Elf.EndianElf.VerneedSectionEntry:_read_le()
  if self.ofs_start < 0 then
    self._unnamed0 = self._io:read_bytes(0)
  end
  self.version = self._io:read_u2le()
  if not(self.version == 1) then
    error("not equal, expected " .. 1 .. ", but got " .. self.version)
  end
  self.num_aux_entries = self._io:read_u2le()
  if not(self.num_aux_entries >= 1) then
    error("ValidationLessThanError")
  end
  self.ofs_file_name = self._io:read_u4le()
  self.ofs_first_aux = self._io:read_u4le()
  if not(self.ofs_first_aux >= 16) then
    error("ValidationLessThanError")
  end
  self.ofs_next = self._io:read_u4le()
  local _ = self.ofs_next
  if not( ((_ == 0) or (_ >= 16)) ) then
    error("ValidationExprError")
  end
end

function Elf.EndianElf.VerneedSectionEntry:_read_be()
  if self.ofs_start < 0 then
    self._unnamed0 = self._io:read_bytes(0)
  end
  self.version = self._io:read_u2be()
  if not(self.version == 1) then
    error("not equal, expected " .. 1 .. ", but got " .. self.version)
  end
  self.num_aux_entries = self._io:read_u2be()
  if not(self.num_aux_entries >= 1) then
    error("ValidationLessThanError")
  end
  self.ofs_file_name = self._io:read_u4be()
  self.ofs_first_aux = self._io:read_u4be()
  if not(self.ofs_first_aux >= 16) then
    error("ValidationLessThanError")
  end
  self.ofs_next = self._io:read_u4be()
  local _ = self.ofs_next
  if not( ((_ == 0) or (_ >= 16)) ) then
    error("ValidationExprError")
  end
end

Elf.EndianElf.VerneedSectionEntry.property.file_name = {}
function Elf.EndianElf.VerneedSectionEntry.property.file_name:get()
  if self._m_file_name ~= nil then
    return self._m_file_name
  end

  if self._parent.is_string_table_linked then
    local _io = self._parent._parent.linked_section.body._io
    local _pos = _io:pos()
    _io:seek(self.ofs_file_name)
    if self._is_le then
      self._m_file_name = str_decode.decode(_io:read_bytes_term(0, false, true, true), "UTF-8")
    else
      self._m_file_name = str_decode.decode(_io:read_bytes_term(0, false, true, true), "UTF-8")
    end
    _io:seek(_pos)
  end
  return self._m_file_name
end

-- 
-- First auxiliary entry of type `vernaux_entry` (`Elfxx_Vernaux`).
-- The rest follow its `next` instance.
Elf.EndianElf.VerneedSectionEntry.property.first_aux = {}
function Elf.EndianElf.VerneedSectionEntry.property.first_aux:get()
  if self._m_first_aux ~= nil then
    return self._m_first_aux
  end

  local _pos = self._io:pos()
  self._io:seek(self.ofs_start + self.ofs_first_aux)
  if self._is_le then
    self._m_first_aux = Elf.EndianElf.VernauxEntry(self._io, self._parent, self._root, self._is_le)
  else
    self._m_first_aux = Elf.EndianElf.VernauxEntry(self._io, self._parent, self._root, self._is_le)
  end
  self._io:seek(_pos)
  return self._m_first_aux
end

Elf.EndianElf.VerneedSectionEntry.property.next = {}
function Elf.EndianElf.VerneedSectionEntry.property.next:get()
  if self._m_next ~= nil then
    return self._m_next
  end

  if self.ofs_next ~= 0 then
    local _pos = self._io:pos()
    self._io:seek(self.ofs_start + self.ofs_next)
    if self._is_le then
      self._m_next = Elf.EndianElf.VerneedSectionEntry(self._io, self._parent, self._root, self._is_le)
    else
      self._m_next = Elf.EndianElf.VerneedSectionEntry(self._io, self._parent, self._root, self._is_le)
    end
    self._io:seek(_pos)
  end
  return self._m_next
end

Elf.EndianElf.VerneedSectionEntry.property.ofs_start = {}
function Elf.EndianElf.VerneedSectionEntry.property.ofs_start:get()
  if self._m_ofs_start ~= nil then
    return self._m_ofs_start
  end

  self._m_ofs_start = self._io:pos()
  return self._m_ofs_start
end

-- 
-- Version of the structure. Must be set to 1.
-- 
-- Number of associated auxiliary entries.
-- 
-- Byte offset to the file name string in the linked string table.
-- 
-- Byte offset to the first associated `vernaux_entry`
-- (`Elfxx_Vernaux`). The offset is relative to the start of this
-- `verneed_section_entry`.
-- 
-- Byte offset to the next verneed entry, relative to the start of
-- this `verneed_section_entry`. A value of zero means that there is
-- no next entry.

-- 
-- Version information flag bitmask, shared by the `flags` (`vd_flags`)
-- field of `verdef_section_entry` (`Elfxx_Verdef`) and the `flags`
-- (`vna_flags`) field of `vernaux_entry` (`Elfxx_Vernaux`).
-- See also: Source (https://refspecs.linuxfoundation.org/LSB_5.0.0/LSB-Core-generic/LSB-Core-generic/symversion.html#SYMSTARTSEQ)
-- See also: Source (https://forge.sourceware.org/glibc/glibc-mirror/src/tag/glibc-2.43/elf/elf.h#L1078)
-- See also: Source (https://www.akkadia.org/drepper/symbol-versioning)
Elf.EndianElf.VersionFlags = class.class(KaitaiStruct)

function Elf.EndianElf.VersionFlags:_init(value, io, parent, root, is_le)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self._is_le = is_le
  self.value = value
  self:_read()
end

function Elf.EndianElf.VersionFlags:_read()

  if self._is_le == true then
    self:_read_le()
  elseif self._is_le == false then
    self:_read_be()
  else
    error("unable to decide endianness")
  end
end

function Elf.EndianElf.VersionFlags:_read_le()
end

function Elf.EndianElf.VersionFlags:_read_be()
end

-- 
-- Version definition of the file itself (the base definition).
Elf.EndianElf.VersionFlags.property.base = {}
function Elf.EndianElf.VersionFlags.property.base:get()
  if self._m_base ~= nil then
    return self._m_base
  end

  self._m_base = self.value & 1 ~= 0
  return self._m_base
end

-- 
-- Version reference exists for informational purposes and does not
-- need to be validated at runtime.
-- See also: Source (https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/version-dependency-section.html)
Elf.EndianElf.VersionFlags.property.info = {}
function Elf.EndianElf.VersionFlags.property.info:get()
  if self._m_info ~= nil then
    return self._m_info
  end

  self._m_info = self.value & 4 ~= 0
  return self._m_info
end

-- 
-- Weak version identifier.
-- 
-- A weak version definition has no symbols associated with the
-- version. See [Creating a Weak Version
-- Definition](https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/creating-weak-version-definition.html).
Elf.EndianElf.VersionFlags.property.weak = {}
function Elf.EndianElf.VersionFlags.property.weak:get()
  if self._m_weak ~= nil then
    return self._m_weak
  end

  self._m_weak = self.value & 2 ~= 0
  return self._m_weak
end


Elf.EndianElf.VersionIndex = class.class(KaitaiStruct)

function Elf.EndianElf.VersionIndex:_init(io, parent, root, is_le)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self._is_le = is_le
  self:_read()
end

function Elf.EndianElf.VersionIndex:_read()

  if self._is_le == true then
    self:_read_le()
  elseif self._is_le == false then
    self:_read_be()
  else
    error("unable to decide endianness")
  end
end

function Elf.EndianElf.VersionIndex:_read_le()
  self.raw = self._io:read_u2le()
end

function Elf.EndianElf.VersionIndex:_read_be()
  self.raw = self._io:read_u2be()
end

-- 
-- This bit is set if the symbol is hidden, and is only visible with
-- an explicit version number. This is a GNU extension.
-- See also: Source (https://forge.sourceware.org/binutils-gdb/binutils-gdb-mirror/src/tag/binutils-2_46_1/include/elf/common.h#L1379)
Elf.EndianElf.VersionIndex.property.is_hidden = {}
function Elf.EndianElf.VersionIndex.property.is_hidden:get()
  if self._m_is_hidden ~= nil then
    return self._m_is_hidden
  end

  self._m_is_hidden = self.raw & 32768 ~= 0
  return self._m_is_hidden
end

-- 
-- The values `version_index_special::local` (0) and
-- `version_index_special::global_symbol` (1) have special meanings.
-- The `version_index_special` value instance converts the integer
-- value to the `version_index_special` enum.
Elf.EndianElf.VersionIndex.property.value = {}
function Elf.EndianElf.VersionIndex.property.value:get()
  if self._m_value ~= nil then
    return self._m_value
  end

  self._m_value = self.raw & 32767
  return self._m_value
end

-- 
-- Note: we match special constants against the full 16-bit integer
-- value (called `raw` in this .ksy implementation), because that's
-- what the `readelf` command does when deciding whether to print
-- `0 (*local*)` or `1 (*global*)` in the `.gnu.version`
-- (`SHT_GNU_versym`) section - see
-- <https://forge.sourceware.org/binutils-gdb/binutils-gdb-mirror/src/tag/binutils-2_46_1/binutils/readelf.c#L14079>.
-- 
-- Besides, `version_index_special::eliminate` (`VER_NDX_ELIMINATE`)
-- has a value of `0xff01`, which is a 16-bit value. If we matched
-- against `value` instead, `version_index_special::eliminate` would
-- be unreachable, because `value` contains only the lower 15 bits,
-- so its maximum possible value is `0x7fff`.
Elf.EndianElf.VersionIndex.property.version_index_special = {}
function Elf.EndianElf.VersionIndex.property.version_index_special:get()
  if self._m_version_index_special ~= nil then
    return self._m_version_index_special
  end

  self._m_version_index_special = Elf.VersionIndexSpecial(self.raw)
  return self._m_version_index_special
end

-- 
-- Raw value, don't read this field - access `value`,
-- `version_index_special` and `is_hidden` instead.

-- 
-- Symbol Version Table, contained in the special section named
-- `.gnu.version` with the section type `sh_type::gnu_versym`
-- (`SHT_GNU_versym`).
-- 
-- This section must have the same number of entries as the Dynamic
-- Symbol Table in the `.dynsym` section (section type `sh_type::dynsym`
-- / `SHT_DYNSYM`). Each entry specifies the version defined for or
-- required by the corresponding symbol in the Dynamic Symbol Table.
-- See also: Source (https://refspecs.linuxfoundation.org/LSB_5.0.0/LSB-Core-generic/LSB-Core-generic/symversion.html#SYMVERTBL)
-- See also: Source (https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/version-symbol-section.html)
-- See also: Source (https://www.akkadia.org/drepper/symbol-versioning)
Elf.EndianElf.VersymSection = class.class(KaitaiStruct)

function Elf.EndianElf.VersymSection:_init(io, parent, root, is_le)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self._is_le = is_le
  self:_read()
end

function Elf.EndianElf.VersymSection:_read()

  if self._is_le == true then
    self:_read_le()
  elseif self._is_le == false then
    self:_read_be()
  else
    error("unable to decide endianness")
  end
end

function Elf.EndianElf.VersymSection:_read_le()
  self.entries = {}
  local i = 0
  while not self._io:is_eof() do
    self.entries[i + 1] = Elf.EndianElf.VersionIndex(self._io, self, self._root, self._is_le)
    i = i + 1
  end
end

function Elf.EndianElf.VersymSection:_read_be()
  self.entries = {}
  local i = 0
  while not self._io:is_eof() do
    self.entries[i + 1] = Elf.EndianElf.VersionIndex(self._io, self, self._root, self._is_le)
    i = i + 1
  end
end

-- 
-- Version indexes for the corresponding symbols in the Dynamic
-- Symbol Table (`.dynsym` section).
-- 
-- These values are not the versions themselves: they are keys that
-- are matched against the `version_index` (`vd_ndx`) field of the
-- `verdef_section_entry` (`Elfxx_Verdef`) type if the symbol is
-- defined in this object, or the `version_index` (`vna_other`) field
-- of the `vernaux_entry` (`Elfxx_Vernaux`) type if the symbol is
-- required from another object. The `name` instance of the matched
-- entry specifies the version of the symbol.

Elf.PhdrTypeFlags = class.class(KaitaiStruct)

function Elf.PhdrTypeFlags:_init(value, io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self.value = value
  self:_read()
end

function Elf.PhdrTypeFlags:_read()
end

Elf.PhdrTypeFlags.property.execute = {}
function Elf.PhdrTypeFlags.property.execute:get()
  if self._m_execute ~= nil then
    return self._m_execute
  end

  self._m_execute = self.value & 1 ~= 0
  return self._m_execute
end

Elf.PhdrTypeFlags.property.mask_proc = {}
function Elf.PhdrTypeFlags.property.mask_proc:get()
  if self._m_mask_proc ~= nil then
    return self._m_mask_proc
  end

  self._m_mask_proc = self.value & 4026531840 ~= 0
  return self._m_mask_proc
end

Elf.PhdrTypeFlags.property.read = {}
function Elf.PhdrTypeFlags.property.read:get()
  if self._m_read ~= nil then
    return self._m_read
  end

  self._m_read = self.value & 4 ~= 0
  return self._m_read
end

Elf.PhdrTypeFlags.property.write = {}
function Elf.PhdrTypeFlags.property.write:get()
  if self._m_write ~= nil then
    return self._m_write
  end

  self._m_write = self.value & 2 ~= 0
  return self._m_write
end


-- 
-- See also: Source (https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/section-headers.html#GUID-2CBE4879-2E76-426E-BB7F-CF0CB1D87C52__CHAPTER6-10675)
-- See also: Source (https://forge.sourceware.org/binutils-gdb/binutils-gdb-mirror/src/tag/binutils-2_46_1/include/elf/common.h#L614)
-- See also: Source (https://forge.sourceware.org/glibc/glibc-mirror/src/tag/glibc-2.43/elf/elf.h#L468)
Elf.SectionHeaderFlags = class.class(KaitaiStruct)

function Elf.SectionHeaderFlags:_init(value, io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self.value = value
  self:_read()
end

function Elf.SectionHeaderFlags:_read()
end

-- 
-- Occupies memory during execution.
Elf.SectionHeaderFlags.property.alloc = {}
function Elf.SectionHeaderFlags.property.alloc:get()
  if self._m_alloc ~= nil then
    return self._m_alloc
  end

  self._m_alloc = self.value & 2 ~= 0
  return self._m_alloc
end

-- 
-- Section with compressed data.
Elf.SectionHeaderFlags.property.compressed = {}
function Elf.SectionHeaderFlags.property.compressed:get()
  if self._m_compressed ~= nil then
    return self._m_compressed
  end

  self._m_compressed = self.value & 2048 ~= 0
  return self._m_compressed
end

-- 
-- Section is excluded unless referenced or allocated (Solaris).
Elf.SectionHeaderFlags.property.exclude = {}
function Elf.SectionHeaderFlags.property.exclude:get()
  if self._m_exclude ~= nil then
    return self._m_exclude
  end

  self._m_exclude = self.value & 2147483648 ~= 0
  return self._m_exclude
end

-- 
-- Executable machine instructions.
Elf.SectionHeaderFlags.property.exec_instr = {}
function Elf.SectionHeaderFlags.property.exec_instr:get()
  if self._m_exec_instr ~= nil then
    return self._m_exec_instr
  end

  self._m_exec_instr = self.value & 4 ~= 0
  return self._m_exec_instr
end

-- 
-- Mbind section.
-- See also: Source (https://forge.sourceware.org/binutils-gdb/binutils-gdb-mirror/src/tag/binutils-2_46_1/include/elf/common.h#L631)
Elf.SectionHeaderFlags.property.gnu_mbind = {}
function Elf.SectionHeaderFlags.property.gnu_mbind:get()
  if self._m_gnu_mbind ~= nil then
    return self._m_gnu_mbind
  end

  self._m_gnu_mbind = self.value & 16777216 ~= 0
  return self._m_gnu_mbind
end

-- 
-- Member of a section group.
Elf.SectionHeaderFlags.property.group = {}
function Elf.SectionHeaderFlags.property.group:get()
  if self._m_group ~= nil then
    return self._m_group
  end

  self._m_group = self.value & 512 ~= 0
  return self._m_group
end

-- 
-- Section header's `sh_info` field holds a section header table index
Elf.SectionHeaderFlags.property.info_link = {}
function Elf.SectionHeaderFlags.property.info_link:get()
  if self._m_info_link ~= nil then
    return self._m_info_link
  end

  self._m_info_link = self.value & 64 ~= 0
  return self._m_info_link
end

-- 
-- Preserve section ordering when linking.
Elf.SectionHeaderFlags.property.link_order = {}
function Elf.SectionHeaderFlags.property.link_order:get()
  if self._m_link_order ~= nil then
    return self._m_link_order
  end

  self._m_link_order = self.value & 128 ~= 0
  return self._m_link_order
end

-- 
-- OS-specific semantics.
Elf.SectionHeaderFlags.property.mask_os = {}
function Elf.SectionHeaderFlags.property.mask_os:get()
  if self._m_mask_os ~= nil then
    return self._m_mask_os
  end

  self._m_mask_os = self.value & 267386880 ~= 0
  return self._m_mask_os
end

-- 
-- Processor-specific semantics.
Elf.SectionHeaderFlags.property.mask_proc = {}
function Elf.SectionHeaderFlags.property.mask_proc:get()
  if self._m_mask_proc ~= nil then
    return self._m_mask_proc
  end

  self._m_mask_proc = self.value & 4026531840 ~= 0
  return self._m_mask_proc
end

-- 
-- Data in this section can be merged to eliminate duplication.
Elf.SectionHeaderFlags.property.merge = {}
function Elf.SectionHeaderFlags.property.merge:get()
  if self._m_merge ~= nil then
    return self._m_merge
  end

  self._m_merge = self.value & 16 ~= 0
  return self._m_merge
end

-- 
-- Special ordering requirement (Solaris)
-- 
-- From <https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/section-headers.html#GUID-2CBE4879-2E76-426E-BB7F-CF0CB1D87C52__CHAPTER6-10675>:
-- 
-- > `SHF_ORDERED` is an older version of the functionality provided by
-- > `SHF_LINK_ORDER`, and has been superseded by `SHF_LINK_ORDER`.
-- > `SHF_ORDERED` is no longer supported.
-- See also: Source (https://forge.sourceware.org/glibc/glibc-mirror/src/tag/glibc-2.43/elf/elf.h#L485)
-- See also: Source (https://docs.oracle.com/en/operating-systems/solaris/oracle-solaris/11.4/linkers-libraries/section-headers.html#GUID-2CBE4879-2E76-426E-BB7F-CF0CB1D87C52__CHAPTER6-10675)
Elf.SectionHeaderFlags.property.ordered = {}
function Elf.SectionHeaderFlags.property.ordered:get()
  if self._m_ordered ~= nil then
    return self._m_ordered
  end

  self._m_ordered = self.value & 1073741824 ~= 0
  return self._m_ordered
end

-- 
-- Special OS-specific handling required.
Elf.SectionHeaderFlags.property.os_nonconforming = {}
function Elf.SectionHeaderFlags.property.os_nonconforming:get()
  if self._m_os_nonconforming ~= nil then
    return self._m_os_nonconforming
  end

  self._m_os_nonconforming = self.value & 256 ~= 0
  return self._m_os_nonconforming
end

-- 
-- Section should not be garbage collected by the linker.
-- See also: Source (https://forge.sourceware.org/binutils-gdb/binutils-gdb-mirror/src/tag/binutils-2_46_1/include/elf/common.h#L630)
-- See also: Source (https://forge.sourceware.org/glibc/glibc-mirror/src/tag/glibc-2.43/elf/elf.h#L484)
Elf.SectionHeaderFlags.property.retain = {}
function Elf.SectionHeaderFlags.property.retain:get()
  if self._m_retain ~= nil then
    return self._m_retain
  end

  self._m_retain = self.value & 2097152 ~= 0
  return self._m_retain
end

-- 
-- Contains null-terminated character strings.
Elf.SectionHeaderFlags.property.strings = {}
function Elf.SectionHeaderFlags.property.strings:get()
  if self._m_strings ~= nil then
    return self._m_strings
  end

  self._m_strings = self.value & 32 ~= 0
  return self._m_strings
end

-- 
-- Thread-local storage section (`.tbss` or `.tdata` according to [ELF
-- Handling For Thread-Local
-- Storage](https://www.akkadia.org/drepper/tls.pdf))
Elf.SectionHeaderFlags.property.tls = {}
function Elf.SectionHeaderFlags.property.tls:get()
  if self._m_tls ~= nil then
    return self._m_tls
  end

  self._m_tls = self.value & 1024 ~= 0
  return self._m_tls
end

-- 
-- Writable during execution.
Elf.SectionHeaderFlags.property.write = {}
function Elf.SectionHeaderFlags.property.write:get()
  if self._m_write ~= nil then
    return self._m_write
  end

  self._m_write = self.value & 1 ~= 0
  return self._m_write
end


