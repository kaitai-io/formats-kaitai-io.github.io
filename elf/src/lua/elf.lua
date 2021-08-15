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
-- See also: Source (https://sourceware.org/git/?p=glibc.git;a=blob;f=elf/elf.h;hb=0f62fe0532)
-- See also: Source (https://refspecs.linuxfoundation.org/elf/gabi4+/contents.html)
-- See also: Source (https://docs.oracle.com/cd/E37838_01/html/E36783/glcfv.html)
Elf = class.class(KaitaiStruct)

Elf.SymbolVisibility = enum.Enum {
  default = 0,
  internal = 1,
  hidden = 2,
  protected = 3,
  exported = 4,
  singleton = 5,
  eliminate = 6,
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

Elf.Endian = enum.Enum {
  le = 1,
  be = 2,
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
  sunw_symnsort = 1879048172,
  sunw_phname = 1879048173,
  sunw_ancillary = 1879048174,
  sunw_capchain = 1879048175,
  sunw_capinfo = 1879048176,
  sunw_symsort = 1879048177,
  sunw_tlssort = 1879048178,
  sunw_ldynsym = 1879048179,
  sunw_dof = 1879048180,
  sunw_cap = 1879048181,
  sunw_signature = 1879048182,
  sunw_annotate = 1879048183,
  sunw_debugstr = 1879048184,
  sunw_debug = 1879048185,
  sunw_move = 1879048186,
  sunw_comdat = 1879048187,
  sunw_syminfo = 1879048188,
  sunw_verdef = 1879048189,
  sunw_verneed = 1879048190,
  sunw_versym = 1879048191,
  sparc_gotdata = 1879048192,
  amd64_unwind = 1879048193,
  arm_preemptmap = 1879048194,
  arm_attributes = 1879048195,
  arm_debugoverlay = 1879048196,
  arm_overlaysection = 1879048197,
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
}

Elf.Machine = enum.Enum {
  no_machine = 0,
  m32 = 1,
  sparc = 2,
  x86 = 3,
  m68k = 4,
  m88k = 5,
  iamcu = 6,
  i860 = 7,
  mips = 8,
  s370 = 9,
  mips_rs3_le = 10,
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
  rce = 39,
  arm = 40,
  alpha = 41,
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
  mc68hc16 = 69,
  mc68hc11 = 70,
  mc68hc08 = 71,
  mc68hc05 = 72,
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
  openrisc = 92,
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
  compact_risc = 103,
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
  craynv2 = 172,
  rx = 173,
  metag = 174,
  mcst_elbrus = 175,
  ecog16 = 176,
  cr16 = 177,
  etpu = 178,
  sle9x = 179,
  l10m = 180,
  k10m = 181,
  aarch64 = 183,
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
  arcv2 = 195,
  open8 = 196,
  rl78 = 197,
  videocore5 = 198,
  renesas_78kor = 199,
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
  amd_gpu = 224,
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
  wdc65816 = 257,
  loongarch = 258,
  kf32 = 259,
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

Elf.Bits = enum.Enum {
  b32 = 1,
  b64 = 2,
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
  gnu_eh_frame = 1685382480,
  gnu_stack = 1685382481,
  gnu_relro = 1685382482,
  gnu_property = 1685382483,
  pax_flags = 1694766464,
  arm_exidx = 1879048193,
}

Elf.ObjType = enum.Enum {
  no_file_type = 0,
  relocatable = 1,
  executable = 2,
  shared = 3,
  core = 4,
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

function Elf:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Elf:_read()
  self.magic = self._io:read_bytes(4)
  if not(self.magic == "\127\069\076\070") then
    error("not equal, expected " ..  "\127\069\076\070" .. ", but got " .. self.magic)
  end
  self.bits = Elf.Bits(self._io:read_u1())
  self.endian = Elf.Endian(self._io:read_u1())
  self.ei_version = self._io:read_u1()
  if not(self.ei_version == 1) then
    error("not equal, expected " ..  1 .. ", but got " .. self.ei_version)
  end
  self.abi = Elf.OsAbi(self._io:read_u1())
  self.abi_version = self._io:read_u1()
  self.pad = self._io:read_bytes(7)
  self.header = Elf.EndianElf(self._io, self, self._root)
end

Elf.property.sh_idx_lo_os = {}
function Elf.property.sh_idx_lo_os:get()
  if self._m_sh_idx_lo_os ~= nil then
    return self._m_sh_idx_lo_os
  end

  self._m_sh_idx_lo_os = 65312
  return self._m_sh_idx_lo_os
end

Elf.property.sh_idx_lo_reserved = {}
function Elf.property.sh_idx_lo_reserved:get()
  if self._m_sh_idx_lo_reserved ~= nil then
    return self._m_sh_idx_lo_reserved
  end

  self._m_sh_idx_lo_reserved = 65280
  return self._m_sh_idx_lo_reserved
end

Elf.property.sh_idx_hi_proc = {}
function Elf.property.sh_idx_hi_proc:get()
  if self._m_sh_idx_hi_proc ~= nil then
    return self._m_sh_idx_hi_proc
  end

  self._m_sh_idx_hi_proc = 65311
  return self._m_sh_idx_hi_proc
end

Elf.property.sh_idx_lo_proc = {}
function Elf.property.sh_idx_lo_proc:get()
  if self._m_sh_idx_lo_proc ~= nil then
    return self._m_sh_idx_lo_proc
  end

  self._m_sh_idx_lo_proc = 65280
  return self._m_sh_idx_lo_proc
end

Elf.property.sh_idx_hi_os = {}
function Elf.property.sh_idx_hi_os:get()
  if self._m_sh_idx_hi_os ~= nil then
    return self._m_sh_idx_hi_os
  end

  self._m_sh_idx_hi_os = 65343
  return self._m_sh_idx_hi_os
end

Elf.property.sh_idx_hi_reserved = {}
function Elf.property.sh_idx_hi_reserved:get()
  if self._m_sh_idx_hi_reserved ~= nil then
    return self._m_sh_idx_hi_reserved
  end

  self._m_sh_idx_hi_reserved = 65535
  return self._m_sh_idx_hi_reserved
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

Elf.EndianElf = class.class(KaitaiStruct)

function Elf.EndianElf:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Elf.EndianElf:_read()
  local _on = self._root.endian
  if _on == Elf.Endian.le then
    self._is_le = true
  elseif _on == Elf.Endian.be then
    self._is_le = false
  end

  if self._is_le then
    self:_read_le()
  elseif not self._is_le then
    self:_read_be()
  else
    error("unable to decide endianness")
  end
end

function Elf.EndianElf:_read_le()
  self.e_type = Elf.ObjType(self._io:read_u2le())
  self.machine = Elf.Machine(self._io:read_u2le())
  self.e_version = self._io:read_u4le()
  local _on = self._root.bits
  if _on == Elf.Bits.b32 then
    self.entry_point = self._io:read_u4le()
  elseif _on == Elf.Bits.b64 then
    self.entry_point = self._io:read_u8le()
  end
  local _on = self._root.bits
  if _on == Elf.Bits.b32 then
    self.program_header_offset = self._io:read_u4le()
  elseif _on == Elf.Bits.b64 then
    self.program_header_offset = self._io:read_u8le()
  end
  local _on = self._root.bits
  if _on == Elf.Bits.b32 then
    self.section_header_offset = self._io:read_u4le()
  elseif _on == Elf.Bits.b64 then
    self.section_header_offset = self._io:read_u8le()
  end
  self.flags = self._io:read_bytes(4)
  self.e_ehsize = self._io:read_u2le()
  self.program_header_entry_size = self._io:read_u2le()
  self.qty_program_header = self._io:read_u2le()
  self.section_header_entry_size = self._io:read_u2le()
  self.qty_section_header = self._io:read_u2le()
  self.section_names_idx = self._io:read_u2le()
end

function Elf.EndianElf:_read_be()
  self.e_type = Elf.ObjType(self._io:read_u2be())
  self.machine = Elf.Machine(self._io:read_u2be())
  self.e_version = self._io:read_u4be()
  local _on = self._root.bits
  if _on == Elf.Bits.b32 then
    self.entry_point = self._io:read_u4be()
  elseif _on == Elf.Bits.b64 then
    self.entry_point = self._io:read_u8be()
  end
  local _on = self._root.bits
  if _on == Elf.Bits.b32 then
    self.program_header_offset = self._io:read_u4be()
  elseif _on == Elf.Bits.b64 then
    self.program_header_offset = self._io:read_u8be()
  end
  local _on = self._root.bits
  if _on == Elf.Bits.b32 then
    self.section_header_offset = self._io:read_u4be()
  elseif _on == Elf.Bits.b64 then
    self.section_header_offset = self._io:read_u8be()
  end
  self.flags = self._io:read_bytes(4)
  self.e_ehsize = self._io:read_u2be()
  self.program_header_entry_size = self._io:read_u2be()
  self.qty_program_header = self._io:read_u2be()
  self.section_header_entry_size = self._io:read_u2be()
  self.qty_section_header = self._io:read_u2be()
  self.section_names_idx = self._io:read_u2be()
end

Elf.EndianElf.property.program_headers = {}
function Elf.EndianElf.property.program_headers:get()
  if self._m_program_headers ~= nil then
    return self._m_program_headers
  end

  local _pos = self._io:pos()
  self._io:seek(self.program_header_offset)
  if self._is_le then
    self._raw__m_program_headers = {}
    self._m_program_headers = {}
    for i = 0, self.qty_program_header - 1 do
      self._raw__m_program_headers[i + 1] = self._io:read_bytes(self.program_header_entry_size)
      local _io = KaitaiStream(stringstream(self._raw__m_program_headers[i + 1]))
      self._m_program_headers[i + 1] = Elf.EndianElf.ProgramHeader(_io, self, self._root, self._is_le)
    end
  else
    self._raw__m_program_headers = {}
    self._m_program_headers = {}
    for i = 0, self.qty_program_header - 1 do
      self._raw__m_program_headers[i + 1] = self._io:read_bytes(self.program_header_entry_size)
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
  self._io:seek(self.section_header_offset)
  if self._is_le then
    self._raw__m_section_headers = {}
    self._m_section_headers = {}
    for i = 0, self.qty_section_header - 1 do
      self._raw__m_section_headers[i + 1] = self._io:read_bytes(self.section_header_entry_size)
      local _io = KaitaiStream(stringstream(self._raw__m_section_headers[i + 1]))
      self._m_section_headers[i + 1] = Elf.EndianElf.SectionHeader(_io, self, self._root, self._is_le)
    end
  else
    self._raw__m_section_headers = {}
    self._m_section_headers = {}
    for i = 0, self.qty_section_header - 1 do
      self._raw__m_section_headers[i + 1] = self._io:read_bytes(self.section_header_entry_size)
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

  if  ((self.section_names_idx ~= Elf.SectionHeaderIdxSpecial.undefined.value) and (self.section_names_idx < self._root.header.qty_section_header))  then
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


Elf.EndianElf.NoteSection = class.class(KaitaiStruct)

function Elf.EndianElf.NoteSection:_init(io, parent, root, is_le)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self._is_le = is_le
  self:_read()
end

function Elf.EndianElf.NoteSection:_read()

  if self._is_le then
    self:_read_le()
  elseif not self._is_le then
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


Elf.EndianElf.ProgramHeader = class.class(KaitaiStruct)

function Elf.EndianElf.ProgramHeader:_init(io, parent, root, is_le)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self._is_le = is_le
  self:_read()
end

function Elf.EndianElf.ProgramHeader:_read()

  if self._is_le then
    self:_read_le()
  elseif not self._is_le then
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
    self.offset = self._io:read_u4le()
  elseif _on == Elf.Bits.b64 then
    self.offset = self._io:read_u8le()
  end
  local _on = self._root.bits
  if _on == Elf.Bits.b32 then
    self.vaddr = self._io:read_u4le()
  elseif _on == Elf.Bits.b64 then
    self.vaddr = self._io:read_u8le()
  end
  local _on = self._root.bits
  if _on == Elf.Bits.b32 then
    self.paddr = self._io:read_u4le()
  elseif _on == Elf.Bits.b64 then
    self.paddr = self._io:read_u8le()
  end
  local _on = self._root.bits
  if _on == Elf.Bits.b32 then
    self.filesz = self._io:read_u4le()
  elseif _on == Elf.Bits.b64 then
    self.filesz = self._io:read_u8le()
  end
  local _on = self._root.bits
  if _on == Elf.Bits.b32 then
    self.memsz = self._io:read_u4le()
  elseif _on == Elf.Bits.b64 then
    self.memsz = self._io:read_u8le()
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
    self.offset = self._io:read_u4be()
  elseif _on == Elf.Bits.b64 then
    self.offset = self._io:read_u8be()
  end
  local _on = self._root.bits
  if _on == Elf.Bits.b32 then
    self.vaddr = self._io:read_u4be()
  elseif _on == Elf.Bits.b64 then
    self.vaddr = self._io:read_u8be()
  end
  local _on = self._root.bits
  if _on == Elf.Bits.b32 then
    self.paddr = self._io:read_u4be()
  elseif _on == Elf.Bits.b64 then
    self.paddr = self._io:read_u8be()
  end
  local _on = self._root.bits
  if _on == Elf.Bits.b32 then
    self.filesz = self._io:read_u4be()
  elseif _on == Elf.Bits.b64 then
    self.filesz = self._io:read_u8be()
  end
  local _on = self._root.bits
  if _on == Elf.Bits.b32 then
    self.memsz = self._io:read_u4be()
  elseif _on == Elf.Bits.b64 then
    self.memsz = self._io:read_u8be()
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
-- See also: Source (https://docs.oracle.com/cd/E37838_01/html/E36783/chapter6-42444.html)
-- See also: Source (https://refspecs.linuxfoundation.org/elf/gabi4+/ch5.dynamic.html#dynamic_section)
Elf.EndianElf.DynamicSectionEntry = class.class(KaitaiStruct)

function Elf.EndianElf.DynamicSectionEntry:_init(io, parent, root, is_le)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self._is_le = is_le
  self:_read()
end

function Elf.EndianElf.DynamicSectionEntry:_read()

  if self._is_le then
    self:_read_le()
  elseif not self._is_le then
    self:_read_be()
  else
    error("unable to decide endianness")
  end
end

function Elf.EndianElf.DynamicSectionEntry:_read_le()
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

function Elf.EndianElf.DynamicSectionEntry:_read_be()
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

Elf.EndianElf.DynamicSectionEntry.property.flag_1_values = {}
function Elf.EndianElf.DynamicSectionEntry.property.flag_1_values:get()
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

Elf.EndianElf.DynamicSectionEntry.property.value_str = {}
function Elf.EndianElf.DynamicSectionEntry.property.value_str:get()
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

Elf.EndianElf.DynamicSectionEntry.property.tag_enum = {}
function Elf.EndianElf.DynamicSectionEntry.property.tag_enum:get()
  if self._m_tag_enum ~= nil then
    return self._m_tag_enum
  end

  self._m_tag_enum = Elf.DynamicArrayTags(self.tag)
  return self._m_tag_enum
end

Elf.EndianElf.DynamicSectionEntry.property.flag_values = {}
function Elf.EndianElf.DynamicSectionEntry.property.flag_values:get()
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

Elf.EndianElf.DynamicSectionEntry.property.is_value_str = {}
function Elf.EndianElf.DynamicSectionEntry.property.is_value_str:get()
  if self._m_is_value_str ~= nil then
    return self._m_is_value_str
  end

  self._m_is_value_str =  ((self.value_or_ptr ~= 0) and ( ((self.tag_enum == Elf.DynamicArrayTags.needed) or (self.tag_enum == Elf.DynamicArrayTags.soname) or (self.tag_enum == Elf.DynamicArrayTags.rpath) or (self.tag_enum == Elf.DynamicArrayTags.runpath) or (self.tag_enum == Elf.DynamicArrayTags.sunw_auxiliary) or (self.tag_enum == Elf.DynamicArrayTags.sunw_filter) or (self.tag_enum == Elf.DynamicArrayTags.auxiliary) or (self.tag_enum == Elf.DynamicArrayTags.filter) or (self.tag_enum == Elf.DynamicArrayTags.config) or (self.tag_enum == Elf.DynamicArrayTags.depaudit) or (self.tag_enum == Elf.DynamicArrayTags.audit)) )) 
  return self._m_is_value_str
end


Elf.EndianElf.SectionHeader = class.class(KaitaiStruct)

function Elf.EndianElf.SectionHeader:_init(io, parent, root, is_le)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self._is_le = is_le
  self:_read()
end

function Elf.EndianElf.SectionHeader:_read()

  if self._is_le then
    self:_read_le()
  elseif not self._is_le then
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
  self.info = self._io:read_bytes(4)
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
  self.info = self._io:read_bytes(4)
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
      if _on == Elf.ShType.rel then
        self._raw__m_body = _io:read_bytes(self.len_body)
        local _io = KaitaiStream(stringstream(self._raw__m_body))
        self._m_body = Elf.EndianElf.RelocationSection(false, _io, self, self._root, self._is_le)
      elseif _on == Elf.ShType.note then
        self._raw__m_body = _io:read_bytes(self.len_body)
        local _io = KaitaiStream(stringstream(self._raw__m_body))
        self._m_body = Elf.EndianElf.NoteSection(_io, self, self._root, self._is_le)
      elseif _on == Elf.ShType.symtab then
        self._raw__m_body = _io:read_bytes(self.len_body)
        local _io = KaitaiStream(stringstream(self._raw__m_body))
        self._m_body = Elf.EndianElf.DynsymSection(_io, self, self._root, self._is_le)
      elseif _on == Elf.ShType.strtab then
        self._raw__m_body = _io:read_bytes(self.len_body)
        local _io = KaitaiStream(stringstream(self._raw__m_body))
        self._m_body = Elf.EndianElf.StringsStruct(_io, self, self._root, self._is_le)
      elseif _on == Elf.ShType.dynamic then
        self._raw__m_body = _io:read_bytes(self.len_body)
        local _io = KaitaiStream(stringstream(self._raw__m_body))
        self._m_body = Elf.EndianElf.DynamicSection(_io, self, self._root, self._is_le)
      elseif _on == Elf.ShType.dynsym then
        self._raw__m_body = _io:read_bytes(self.len_body)
        local _io = KaitaiStream(stringstream(self._raw__m_body))
        self._m_body = Elf.EndianElf.DynsymSection(_io, self, self._root, self._is_le)
      elseif _on == Elf.ShType.rela then
        self._raw__m_body = _io:read_bytes(self.len_body)
        local _io = KaitaiStream(stringstream(self._raw__m_body))
        self._m_body = Elf.EndianElf.RelocationSection(true, _io, self, self._root, self._is_le)
      else
        self._m_body = _io:read_bytes(self.len_body)
      end
    else
      local _on = self.type
      if _on == Elf.ShType.rel then
        self._raw__m_body = _io:read_bytes(self.len_body)
        local _io = KaitaiStream(stringstream(self._raw__m_body))
        self._m_body = Elf.EndianElf.RelocationSection(false, _io, self, self._root, self._is_le)
      elseif _on == Elf.ShType.note then
        self._raw__m_body = _io:read_bytes(self.len_body)
        local _io = KaitaiStream(stringstream(self._raw__m_body))
        self._m_body = Elf.EndianElf.NoteSection(_io, self, self._root, self._is_le)
      elseif _on == Elf.ShType.symtab then
        self._raw__m_body = _io:read_bytes(self.len_body)
        local _io = KaitaiStream(stringstream(self._raw__m_body))
        self._m_body = Elf.EndianElf.DynsymSection(_io, self, self._root, self._is_le)
      elseif _on == Elf.ShType.strtab then
        self._raw__m_body = _io:read_bytes(self.len_body)
        local _io = KaitaiStream(stringstream(self._raw__m_body))
        self._m_body = Elf.EndianElf.StringsStruct(_io, self, self._root, self._is_le)
      elseif _on == Elf.ShType.dynamic then
        self._raw__m_body = _io:read_bytes(self.len_body)
        local _io = KaitaiStream(stringstream(self._raw__m_body))
        self._m_body = Elf.EndianElf.DynamicSection(_io, self, self._root, self._is_le)
      elseif _on == Elf.ShType.dynsym then
        self._raw__m_body = _io:read_bytes(self.len_body)
        local _io = KaitaiStream(stringstream(self._raw__m_body))
        self._m_body = Elf.EndianElf.DynsymSection(_io, self, self._root, self._is_le)
      elseif _on == Elf.ShType.rela then
        self._raw__m_body = _io:read_bytes(self.len_body)
        local _io = KaitaiStream(stringstream(self._raw__m_body))
        self._m_body = Elf.EndianElf.RelocationSection(true, _io, self, self._root, self._is_le)
      else
        self._m_body = _io:read_bytes(self.len_body)
      end
    end
    _io:seek(_pos)
  end
  return self._m_body
end

-- 
-- may reference a later section header, so don't try to access too early (use only lazy `instances`).
-- See also: Source (https://refspecs.linuxfoundation.org/elf/gabi4+/ch4.sheader.html#sh_link)
Elf.EndianElf.SectionHeader.property.linked_section = {}
function Elf.EndianElf.SectionHeader.property.linked_section:get()
  if self._m_linked_section ~= nil then
    return self._m_linked_section
  end

  if  ((self.linked_section_idx ~= Elf.SectionHeaderIdxSpecial.undefined.value) and (self.linked_section_idx < self._root.header.qty_section_header))  then
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
-- See also: Source (https://docs.oracle.com/cd/E37838_01/html/E36783/chapter6-54839.html)
-- See also: Source (https://refspecs.linuxfoundation.org/elf/gabi4+/ch4.reloc.html)
Elf.EndianElf.RelocationSection = class.class(KaitaiStruct)

function Elf.EndianElf.RelocationSection:_init(has_addend, io, parent, root, is_le)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self._is_le = is_le
  self.has_addend = has_addend
  self:_read()
end

function Elf.EndianElf.RelocationSection:_read()

  if self._is_le then
    self:_read_le()
  elseif not self._is_le then
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


Elf.EndianElf.DynamicSection = class.class(KaitaiStruct)

function Elf.EndianElf.DynamicSection:_init(io, parent, root, is_le)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self._is_le = is_le
  self:_read()
end

function Elf.EndianElf.DynamicSection:_read()

  if self._is_le then
    self:_read_le()
  elseif not self._is_le then
    self:_read_be()
  else
    error("unable to decide endianness")
  end
end

function Elf.EndianElf.DynamicSection:_read_le()
  self.entries = {}
  local i = 0
  while not self._io:is_eof() do
    self.entries[i + 1] = Elf.EndianElf.DynamicSectionEntry(self._io, self, self._root, self._is_le)
    i = i + 1
  end
end

function Elf.EndianElf.DynamicSection:_read_be()
  self.entries = {}
  local i = 0
  while not self._io:is_eof() do
    self.entries[i + 1] = Elf.EndianElf.DynamicSectionEntry(self._io, self, self._root, self._is_le)
    i = i + 1
  end
end

Elf.EndianElf.DynamicSection.property.is_string_table_linked = {}
function Elf.EndianElf.DynamicSection.property.is_string_table_linked:get()
  if self._m_is_string_table_linked ~= nil then
    return self._m_is_string_table_linked
  end

  self._m_is_string_table_linked = self._parent.linked_section.type == Elf.ShType.strtab
  return self._m_is_string_table_linked
end


Elf.EndianElf.DynsymSection = class.class(KaitaiStruct)

function Elf.EndianElf.DynsymSection:_init(io, parent, root, is_le)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self._is_le = is_le
  self:_read()
end

function Elf.EndianElf.DynsymSection:_read()

  if self._is_le then
    self:_read_le()
  elseif not self._is_le then
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


Elf.EndianElf.RelocationSectionEntry = class.class(KaitaiStruct)

function Elf.EndianElf.RelocationSectionEntry:_init(io, parent, root, is_le)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self._is_le = is_le
  self:_read()
end

function Elf.EndianElf.RelocationSectionEntry:_read()

  if self._is_le then
    self:_read_le()
  elseif not self._is_le then
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
-- See also: Source (https://docs.oracle.com/cd/E37838_01/html/E36783/man-sts.html)
-- See also: Source (https://refspecs.linuxfoundation.org/elf/gabi4+/ch4.symtab.html)
Elf.EndianElf.DynsymSectionEntry = class.class(KaitaiStruct)

function Elf.EndianElf.DynsymSectionEntry:_init(io, parent, root, is_le)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self._is_le = is_le
  self:_read()
end

function Elf.EndianElf.DynsymSectionEntry:_read()

  if self._is_le then
    self:_read_le()
  elseif not self._is_le then
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

Elf.EndianElf.DynsymSectionEntry.property.is_sh_idx_reserved = {}
function Elf.EndianElf.DynsymSectionEntry.property.is_sh_idx_reserved:get()
  if self._m_is_sh_idx_reserved ~= nil then
    return self._m_is_sh_idx_reserved
  end

  self._m_is_sh_idx_reserved =  ((self.sh_idx >= self._root.sh_idx_lo_reserved) and (self.sh_idx <= self._root.sh_idx_hi_reserved)) 
  return self._m_is_sh_idx_reserved
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

Elf.EndianElf.DynsymSectionEntry.property.size = {}
function Elf.EndianElf.DynsymSectionEntry.property.size:get()
  if self._m_size ~= nil then
    return self._m_size
  end

  self._m_size = utils.box_unwrap((self._root.bits == Elf.Bits.b32) and utils.box_wrap(self.size_b32) or (utils.box_unwrap((self._root.bits == Elf.Bits.b64) and utils.box_wrap(self.size_b64) or (0))))
  return self._m_size
end

Elf.EndianElf.DynsymSectionEntry.property.visibility = {}
function Elf.EndianElf.DynsymSectionEntry.property.visibility:get()
  if self._m_visibility ~= nil then
    return self._m_visibility
  end

  self._m_visibility = Elf.SymbolVisibility((self.other & 3))
  return self._m_visibility
end

Elf.EndianElf.DynsymSectionEntry.property.value = {}
function Elf.EndianElf.DynsymSectionEntry.property.value:get()
  if self._m_value ~= nil then
    return self._m_value
  end

  self._m_value = utils.box_unwrap((self._root.bits == Elf.Bits.b32) and utils.box_wrap(self.value_b32) or (utils.box_unwrap((self._root.bits == Elf.Bits.b64) and utils.box_wrap(self.value_b64) or (0))))
  return self._m_value
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
      self._m_name = str_decode.decode(_io:read_bytes_term(0, false, true, true), "ASCII")
    else
      self._m_name = str_decode.decode(_io:read_bytes_term(0, false, true, true), "ASCII")
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

-- 
-- don't read this field, access `visibility` instead.
-- 
-- section header index.

-- 
-- See also: Source (https://docs.oracle.com/cd/E37838_01/html/E36783/chapter6-18048.html)
-- See also: Source (https://refspecs.linuxfoundation.org/elf/gabi4+/ch5.pheader.html#note_section)
Elf.EndianElf.NoteSectionEntry = class.class(KaitaiStruct)

function Elf.EndianElf.NoteSectionEntry:_init(io, parent, root, is_le)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self._is_le = is_le
  self:_read()
end

function Elf.EndianElf.NoteSectionEntry:_read()

  if self._is_le then
    self:_read_le()
  elseif not self._is_le then
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
  self.name_padding = self._io:read_bytes((-(self.len_name) % 4))
  self.descriptor = self._io:read_bytes(self.len_descriptor)
  self.descriptor_padding = self._io:read_bytes((-(self.len_descriptor) % 4))
end

function Elf.EndianElf.NoteSectionEntry:_read_be()
  self.len_name = self._io:read_u4be()
  self.len_descriptor = self._io:read_u4be()
  self.type = self._io:read_u4be()
  self.name = KaitaiStream.bytes_terminate(self._io:read_bytes(self.len_name), 0, false)
  self.name_padding = self._io:read_bytes((-(self.len_name) % 4))
  self.descriptor = self._io:read_bytes(self.len_descriptor)
  self.descriptor_padding = self._io:read_bytes((-(self.len_descriptor) % 4))
end

-- 
-- Although the ELF specification seems to hint that the `note_name` field
-- is ASCII this isn't the case for Linux binaries that have a
-- `.gnu.build.attributes` section.
-- See also: Source (https://fedoraproject.org/wiki/Toolchain/Watermark#Proposed_Specification_for_non-loaded_notes)

Elf.EndianElf.StringsStruct = class.class(KaitaiStruct)

function Elf.EndianElf.StringsStruct:_init(io, parent, root, is_le)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self._is_le = is_le
  self:_read()
end

function Elf.EndianElf.StringsStruct:_read()

  if self._is_le then
    self:_read_le()
  elseif not self._is_le then
    self:_read_be()
  else
    error("unable to decide endianness")
  end
end

function Elf.EndianElf.StringsStruct:_read_le()
  self.entries = {}
  local i = 0
  while not self._io:is_eof() do
    self.entries[i + 1] = str_decode.decode(self._io:read_bytes_term(0, false, true, true), "ASCII")
    i = i + 1
  end
end

function Elf.EndianElf.StringsStruct:_read_be()
  self.entries = {}
  local i = 0
  while not self._io:is_eof() do
    self.entries[i + 1] = str_decode.decode(self._io:read_bytes_term(0, false, true, true), "ASCII")
    i = i + 1
  end
end


Elf.DtFlag1Values = class.class(KaitaiStruct)

function Elf.DtFlag1Values:_init(value, io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self.value = value
  self:_read()
end

function Elf.DtFlag1Values:_read()
end

-- 
-- Singleton symbols are used.
Elf.DtFlag1Values.property.singleton = {}
function Elf.DtFlag1Values.property.singleton:get()
  if self._m_singleton ~= nil then
    return self._m_singleton
  end

  self._m_singleton = (self.value & 33554432) ~= 0
  return self._m_singleton
end

Elf.DtFlag1Values.property.ignmuldef = {}
function Elf.DtFlag1Values.property.ignmuldef:get()
  if self._m_ignmuldef ~= nil then
    return self._m_ignmuldef
  end

  self._m_ignmuldef = (self.value & 262144) ~= 0
  return self._m_ignmuldef
end

-- 
-- Trigger filtee loading at runtime.
Elf.DtFlag1Values.property.loadfltr = {}
function Elf.DtFlag1Values.property.loadfltr:get()
  if self._m_loadfltr ~= nil then
    return self._m_loadfltr
  end

  self._m_loadfltr = (self.value & 16) ~= 0
  return self._m_loadfltr
end

-- 
-- Set RTLD_INITFIRST for this object.
Elf.DtFlag1Values.property.initfirst = {}
function Elf.DtFlag1Values.property.initfirst:get()
  if self._m_initfirst ~= nil then
    return self._m_initfirst
  end

  self._m_initfirst = (self.value & 32) ~= 0
  return self._m_initfirst
end

-- 
-- Object has individual interposers.
Elf.DtFlag1Values.property.symintpose = {}
function Elf.DtFlag1Values.property.symintpose:get()
  if self._m_symintpose ~= nil then
    return self._m_symintpose
  end

  self._m_symintpose = (self.value & 8388608) ~= 0
  return self._m_symintpose
end

Elf.DtFlag1Values.property.noreloc = {}
function Elf.DtFlag1Values.property.noreloc:get()
  if self._m_noreloc ~= nil then
    return self._m_noreloc
  end

  self._m_noreloc = (self.value & 4194304) ~= 0
  return self._m_noreloc
end

-- 
-- Configuration alternative created.
Elf.DtFlag1Values.property.confalt = {}
function Elf.DtFlag1Values.property.confalt:get()
  if self._m_confalt ~= nil then
    return self._m_confalt
  end

  self._m_confalt = (self.value & 8192) ~= 0
  return self._m_confalt
end

-- 
-- Disp reloc applied at build time.
Elf.DtFlag1Values.property.dispreldne = {}
function Elf.DtFlag1Values.property.dispreldne:get()
  if self._m_dispreldne ~= nil then
    return self._m_dispreldne
  end

  self._m_dispreldne = (self.value & 32768) ~= 0
  return self._m_dispreldne
end

-- 
-- Set RTLD_GLOBAL for this object.
Elf.DtFlag1Values.property.rtld_global = {}
function Elf.DtFlag1Values.property.rtld_global:get()
  if self._m_rtld_global ~= nil then
    return self._m_rtld_global
  end

  self._m_rtld_global = (self.value & 2) ~= 0
  return self._m_rtld_global
end

-- 
-- Set RTLD_NODELETE for this object.
Elf.DtFlag1Values.property.nodelete = {}
function Elf.DtFlag1Values.property.nodelete:get()
  if self._m_nodelete ~= nil then
    return self._m_nodelete
  end

  self._m_nodelete = (self.value & 8) ~= 0
  return self._m_nodelete
end

Elf.DtFlag1Values.property.trans = {}
function Elf.DtFlag1Values.property.trans:get()
  if self._m_trans ~= nil then
    return self._m_trans
  end

  self._m_trans = (self.value & 512) ~= 0
  return self._m_trans
end

-- 
-- $ORIGIN must be handled.
Elf.DtFlag1Values.property.origin = {}
function Elf.DtFlag1Values.property.origin:get()
  if self._m_origin ~= nil then
    return self._m_origin
  end

  self._m_origin = (self.value & 128) ~= 0
  return self._m_origin
end

-- 
-- Set RTLD_NOW for this object.
Elf.DtFlag1Values.property.now = {}
function Elf.DtFlag1Values.property.now:get()
  if self._m_now ~= nil then
    return self._m_now
  end

  self._m_now = (self.value & 1) ~= 0
  return self._m_now
end

Elf.DtFlag1Values.property.nohdr = {}
function Elf.DtFlag1Values.property.nohdr:get()
  if self._m_nohdr ~= nil then
    return self._m_nohdr
  end

  self._m_nohdr = (self.value & 1048576) ~= 0
  return self._m_nohdr
end

-- 
-- Filtee terminates filters search.
Elf.DtFlag1Values.property.endfiltee = {}
function Elf.DtFlag1Values.property.endfiltee:get()
  if self._m_endfiltee ~= nil then
    return self._m_endfiltee
  end

  self._m_endfiltee = (self.value & 16384) ~= 0
  return self._m_endfiltee
end

-- 
-- Object has no-direct binding.
Elf.DtFlag1Values.property.nodirect = {}
function Elf.DtFlag1Values.property.nodirect:get()
  if self._m_nodirect ~= nil then
    return self._m_nodirect
  end

  self._m_nodirect = (self.value & 131072) ~= 0
  return self._m_nodirect
end

-- 
-- Global auditing required.
Elf.DtFlag1Values.property.globaudit = {}
function Elf.DtFlag1Values.property.globaudit:get()
  if self._m_globaudit ~= nil then
    return self._m_globaudit
  end

  self._m_globaudit = (self.value & 16777216) ~= 0
  return self._m_globaudit
end

Elf.DtFlag1Values.property.noksyms = {}
function Elf.DtFlag1Values.property.noksyms:get()
  if self._m_noksyms ~= nil then
    return self._m_noksyms
  end

  self._m_noksyms = (self.value & 524288) ~= 0
  return self._m_noksyms
end

-- 
-- Object is used to interpose.
Elf.DtFlag1Values.property.interpose = {}
function Elf.DtFlag1Values.property.interpose:get()
  if self._m_interpose ~= nil then
    return self._m_interpose
  end

  self._m_interpose = (self.value & 1024) ~= 0
  return self._m_interpose
end

-- 
-- Object can't be dldump'ed.
Elf.DtFlag1Values.property.nodump = {}
function Elf.DtFlag1Values.property.nodump:get()
  if self._m_nodump ~= nil then
    return self._m_nodump
  end

  self._m_nodump = (self.value & 4096) ~= 0
  return self._m_nodump
end

-- 
-- Disp reloc applied at run-time.
Elf.DtFlag1Values.property.disprelpnd = {}
function Elf.DtFlag1Values.property.disprelpnd:get()
  if self._m_disprelpnd ~= nil then
    return self._m_disprelpnd
  end

  self._m_disprelpnd = (self.value & 65536) ~= 0
  return self._m_disprelpnd
end

-- 
-- Set RTLD_NOOPEN for this object.
Elf.DtFlag1Values.property.noopen = {}
function Elf.DtFlag1Values.property.noopen:get()
  if self._m_noopen ~= nil then
    return self._m_noopen
  end

  self._m_noopen = (self.value & 64) ~= 0
  return self._m_noopen
end

Elf.DtFlag1Values.property.stub = {}
function Elf.DtFlag1Values.property.stub:get()
  if self._m_stub ~= nil then
    return self._m_stub
  end

  self._m_stub = (self.value & 67108864) ~= 0
  return self._m_stub
end

-- 
-- Direct binding enabled.
Elf.DtFlag1Values.property.direct = {}
function Elf.DtFlag1Values.property.direct:get()
  if self._m_direct ~= nil then
    return self._m_direct
  end

  self._m_direct = (self.value & 256) ~= 0
  return self._m_direct
end

-- 
-- Object is modified after built.
Elf.DtFlag1Values.property.edited = {}
function Elf.DtFlag1Values.property.edited:get()
  if self._m_edited ~= nil then
    return self._m_edited
  end

  self._m_edited = (self.value & 2097152) ~= 0
  return self._m_edited
end

-- 
-- Set RTLD_GROUP for this object.
Elf.DtFlag1Values.property.group = {}
function Elf.DtFlag1Values.property.group:get()
  if self._m_group ~= nil then
    return self._m_group
  end

  self._m_group = (self.value & 4) ~= 0
  return self._m_group
end

Elf.DtFlag1Values.property.pie = {}
function Elf.DtFlag1Values.property.pie:get()
  if self._m_pie ~= nil then
    return self._m_pie
  end

  self._m_pie = (self.value & 134217728) ~= 0
  return self._m_pie
end

-- 
-- Ignore default lib search path.
Elf.DtFlag1Values.property.nodeflib = {}
function Elf.DtFlag1Values.property.nodeflib:get()
  if self._m_nodeflib ~= nil then
    return self._m_nodeflib
  end

  self._m_nodeflib = (self.value & 2048) ~= 0
  return self._m_nodeflib
end


Elf.SectionHeaderFlags = class.class(KaitaiStruct)

function Elf.SectionHeaderFlags:_init(value, io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self.value = value
  self:_read()
end

function Elf.SectionHeaderFlags:_read()
end

-- 
-- might be merged.
Elf.SectionHeaderFlags.property.merge = {}
function Elf.SectionHeaderFlags.property.merge:get()
  if self._m_merge ~= nil then
    return self._m_merge
  end

  self._m_merge = (self.value & 16) ~= 0
  return self._m_merge
end

-- 
-- OS-specific.
Elf.SectionHeaderFlags.property.mask_os = {}
function Elf.SectionHeaderFlags.property.mask_os:get()
  if self._m_mask_os ~= nil then
    return self._m_mask_os
  end

  self._m_mask_os = (self.value & 267386880) ~= 0
  return self._m_mask_os
end

-- 
-- section is excluded unless referenced or allocated (Solaris).
Elf.SectionHeaderFlags.property.exclude = {}
function Elf.SectionHeaderFlags.property.exclude:get()
  if self._m_exclude ~= nil then
    return self._m_exclude
  end

  self._m_exclude = (self.value & 134217728) ~= 0
  return self._m_exclude
end

-- 
-- Processor-specific.
Elf.SectionHeaderFlags.property.mask_proc = {}
function Elf.SectionHeaderFlags.property.mask_proc:get()
  if self._m_mask_proc ~= nil then
    return self._m_mask_proc
  end

  self._m_mask_proc = (self.value & 4026531840) ~= 0
  return self._m_mask_proc
end

-- 
-- contains nul-terminated strings.
Elf.SectionHeaderFlags.property.strings = {}
function Elf.SectionHeaderFlags.property.strings:get()
  if self._m_strings ~= nil then
    return self._m_strings
  end

  self._m_strings = (self.value & 32) ~= 0
  return self._m_strings
end

-- 
-- non-standard OS specific handling required.
Elf.SectionHeaderFlags.property.os_non_conforming = {}
function Elf.SectionHeaderFlags.property.os_non_conforming:get()
  if self._m_os_non_conforming ~= nil then
    return self._m_os_non_conforming
  end

  self._m_os_non_conforming = (self.value & 256) ~= 0
  return self._m_os_non_conforming
end

-- 
-- occupies memory during execution.
Elf.SectionHeaderFlags.property.alloc = {}
function Elf.SectionHeaderFlags.property.alloc:get()
  if self._m_alloc ~= nil then
    return self._m_alloc
  end

  self._m_alloc = (self.value & 2) ~= 0
  return self._m_alloc
end

-- 
-- executable.
Elf.SectionHeaderFlags.property.exec_instr = {}
function Elf.SectionHeaderFlags.property.exec_instr:get()
  if self._m_exec_instr ~= nil then
    return self._m_exec_instr
  end

  self._m_exec_instr = (self.value & 4) ~= 0
  return self._m_exec_instr
end

-- 
-- 'sh_info' contains SHT index.
Elf.SectionHeaderFlags.property.info_link = {}
function Elf.SectionHeaderFlags.property.info_link:get()
  if self._m_info_link ~= nil then
    return self._m_info_link
  end

  self._m_info_link = (self.value & 64) ~= 0
  return self._m_info_link
end

-- 
-- writable.
Elf.SectionHeaderFlags.property.write = {}
function Elf.SectionHeaderFlags.property.write:get()
  if self._m_write ~= nil then
    return self._m_write
  end

  self._m_write = (self.value & 1) ~= 0
  return self._m_write
end

-- 
-- preserve order after combining.
Elf.SectionHeaderFlags.property.link_order = {}
function Elf.SectionHeaderFlags.property.link_order:get()
  if self._m_link_order ~= nil then
    return self._m_link_order
  end

  self._m_link_order = (self.value & 128) ~= 0
  return self._m_link_order
end

-- 
-- special ordering requirement (Solaris).
Elf.SectionHeaderFlags.property.ordered = {}
function Elf.SectionHeaderFlags.property.ordered:get()
  if self._m_ordered ~= nil then
    return self._m_ordered
  end

  self._m_ordered = (self.value & 67108864) ~= 0
  return self._m_ordered
end

-- 
-- section hold thread-local data.
Elf.SectionHeaderFlags.property.tls = {}
function Elf.SectionHeaderFlags.property.tls:get()
  if self._m_tls ~= nil then
    return self._m_tls
  end

  self._m_tls = (self.value & 1024) ~= 0
  return self._m_tls
end

-- 
-- section is member of a group.
Elf.SectionHeaderFlags.property.group = {}
function Elf.SectionHeaderFlags.property.group:get()
  if self._m_group ~= nil then
    return self._m_group
  end

  self._m_group = (self.value & 512) ~= 0
  return self._m_group
end


Elf.PhdrTypeFlags = class.class(KaitaiStruct)

function Elf.PhdrTypeFlags:_init(value, io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self.value = value
  self:_read()
end

function Elf.PhdrTypeFlags:_read()
end

Elf.PhdrTypeFlags.property.read = {}
function Elf.PhdrTypeFlags.property.read:get()
  if self._m_read ~= nil then
    return self._m_read
  end

  self._m_read = (self.value & 4) ~= 0
  return self._m_read
end

Elf.PhdrTypeFlags.property.write = {}
function Elf.PhdrTypeFlags.property.write:get()
  if self._m_write ~= nil then
    return self._m_write
  end

  self._m_write = (self.value & 2) ~= 0
  return self._m_write
end

Elf.PhdrTypeFlags.property.execute = {}
function Elf.PhdrTypeFlags.property.execute:get()
  if self._m_execute ~= nil then
    return self._m_execute
  end

  self._m_execute = (self.value & 1) ~= 0
  return self._m_execute
end

Elf.PhdrTypeFlags.property.mask_proc = {}
function Elf.PhdrTypeFlags.property.mask_proc:get()
  if self._m_mask_proc ~= nil then
    return self._m_mask_proc
  end

  self._m_mask_proc = (self.value & 4026531840) ~= 0
  return self._m_mask_proc
end


-- 
-- See also: Figure 5-11: DT_FLAGS values (https://refspecs.linuxbase.org/elf/gabi4+/ch5.dynamic.html)
-- See also: Source (https://github.com/golang/go/blob/48dfddbab3/src/debug/elf/elf.go#L1079-L1095)
-- See also: Source (https://docs.oracle.com/cd/E37838_01/html/E36783/chapter6-42444.html#OSLLGchapter7-tbl-5)
Elf.DtFlagValues = class.class(KaitaiStruct)

function Elf.DtFlagValues:_init(value, io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
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

  self._m_bind_now = (self.value & 8) ~= 0
  return self._m_bind_now
end

-- 
-- object may reference the $ORIGIN substitution string.
Elf.DtFlagValues.property.origin = {}
function Elf.DtFlagValues.property.origin:get()
  if self._m_origin ~= nil then
    return self._m_origin
  end

  self._m_origin = (self.value & 1) ~= 0
  return self._m_origin
end

-- 
-- relocation entries might request modifications to a non-writable segment.
Elf.DtFlagValues.property.textrel = {}
function Elf.DtFlagValues.property.textrel:get()
  if self._m_textrel ~= nil then
    return self._m_textrel
  end

  self._m_textrel = (self.value & 4) ~= 0
  return self._m_textrel
end

-- 
-- object uses static thread-local storage scheme.
Elf.DtFlagValues.property.static_tls = {}
function Elf.DtFlagValues.property.static_tls:get()
  if self._m_static_tls ~= nil then
    return self._m_static_tls
  end

  self._m_static_tls = (self.value & 16) ~= 0
  return self._m_static_tls
end

-- 
-- symbolic linking.
Elf.DtFlagValues.property.symbolic = {}
function Elf.DtFlagValues.property.symbolic:get()
  if self._m_symbolic ~= nil then
    return self._m_symbolic
  end

  self._m_symbolic = (self.value & 2) ~= 0
  return self._m_symbolic
end


