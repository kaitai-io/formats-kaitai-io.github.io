-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
local enum = require("enum")
local str_decode = require("string_decode")

-- 
-- The new uImage format allows more flexibility in handling images of various
-- types (kernel, ramdisk, etc.), it also enhances integrity protection of images
-- with sha1 and md5 checksums.
-- See also: Source (https://source.denx.de/u-boot/u-boot/-/raw/e4dba4b/include/image.h)
Uimage = class.class(KaitaiStruct)

Uimage.UimageOs = enum.Enum {
  invalid = 0,
  openbsd = 1,
  netbsd = 2,
  freebsd = 3,
  bsd4_4 = 4,
  linux = 5,
  svr4 = 6,
  esix = 7,
  solaris = 8,
  irix = 9,
  sco = 10,
  dell = 11,
  ncr = 12,
  lynxos = 13,
  vxworks = 14,
  psos = 15,
  qnx = 16,
  u_boot = 17,
  rtems = 18,
  artos = 19,
  unity = 20,
  integrity = 21,
  ose = 22,
  plan9 = 23,
  openrtos = 24,
  arm_trusted_firmware = 25,
  tee = 26,
  opensbi = 27,
  efi = 28,
}

Uimage.UimageArch = enum.Enum {
  invalid = 0,
  alpha = 1,
  arm = 2,
  i386 = 3,
  ia64 = 4,
  mips = 5,
  mips64 = 6,
  ppc = 7,
  s390 = 8,
  sh = 9,
  sparc = 10,
  sparc64 = 11,
  m68k = 12,
  nios = 13,
  microblaze = 14,
  nios2 = 15,
  blackfin = 16,
  avr32 = 17,
  st200 = 18,
  sandbox = 19,
  nds32 = 20,
  openrisc = 21,
  arm64 = 22,
  arc = 23,
  x86_64 = 24,
  xtensa = 25,
  riscv = 26,
}

Uimage.UimageComp = enum.Enum {
  none = 0,
  gzip = 1,
  bzip2 = 2,
  lzma = 3,
  lzo = 4,
  lz4 = 5,
  zstd = 6,
}

Uimage.UimageType = enum.Enum {
  invalid = 0,
  standalone = 1,
  kernel = 2,
  ramdisk = 3,
  multi = 4,
  firmware = 5,
  script = 6,
  filesystem = 7,
  flatdt = 8,
  kwbimage = 9,
  imximage = 10,
  ublimage = 11,
  omapimage = 12,
  aisimage = 13,
  kernel_noload = 14,
  pblimage = 15,
  mxsimage = 16,
  gpimage = 17,
  atmelimage = 18,
  socfpgaimage = 19,
  x86_setup = 20,
  lpc32xximage = 21,
  loadable = 22,
  rkimage = 23,
  rksd = 24,
  rkspi = 25,
  zynqimage = 26,
  zynqmpimage = 27,
  zynqmpbif = 28,
  fpga = 29,
  vybridimage = 30,
  tee = 31,
  firmware_ivt = 32,
  pmmc = 33,
  stm32image = 34,
  socfpgaimage_v1 = 35,
  mtkimage = 36,
  imx8mimage = 37,
  imx8image = 38,
  copro = 39,
  sunxi_egon = 40,
}

function Uimage:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Uimage:_read()
  self.header = Uimage.Uheader(self._io, self, self._root)
  self.data = self._io:read_bytes(self.header.len_image)
end


Uimage.Uheader = class.class(KaitaiStruct)

function Uimage.Uheader:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Uimage.Uheader:_read()
  self.magic = self._io:read_bytes(4)
  if not(self.magic == "\039\005\025\086") then
    error("not equal, expected " ..  "\039\005\025\086" .. ", but got " .. self.magic)
  end
  self.header_crc = self._io:read_u4be()
  self.timestamp = self._io:read_u4be()
  self.len_image = self._io:read_u4be()
  self.load_address = self._io:read_u4be()
  self.entry_address = self._io:read_u4be()
  self.data_crc = self._io:read_u4be()
  self.os_type = Uimage.UimageOs(self._io:read_u1())
  self.architecture = Uimage.UimageArch(self._io:read_u1())
  self.image_type = Uimage.UimageType(self._io:read_u1())
  self.compression_type = Uimage.UimageComp(self._io:read_u1())
  self.name = str_decode.decode(KaitaiStream.bytes_terminate(self._io:read_bytes(32), 0, false), "UTF-8")
end


