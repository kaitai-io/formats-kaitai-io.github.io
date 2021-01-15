-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
local stringstream = require("string_stream")
local enum = require("enum")
local str_decode = require("string_decode")

-- 
-- This type of executables could be found inside the UEFI firmware. The UEFI
-- firmware is stored in SPI flash memory, which is a chip soldered on a
-- system's motherboard. UEFI firmware is very modular: it usually contains
-- dozens, if not hundreds, of executables. To store all these separates files,
-- the firmware is laid out in volumes using the Firmware File System (FFS), a
-- file system specifically designed to store firmware images. The volumes
-- contain files that are identified by GUIDs and each of these files contain
-- one or more sections holding the data. One of these sections contains the
-- actual executable image. Most of the executable images follow the PE format.
-- However, some of them follow the TE format.
-- 
-- The Terse Executable (TE) image format was created as a mechanism to reduce
-- the overhead of the PE/COFF headers in PE32/PE32+ images, resulting in a
-- corresponding reduction of image sizes for executables running in the PI
-- (Platform Initialization) Architecture environment. Reducing image size
-- provides an opportunity for use of a smaller system flash part.
-- 
-- So the TE format is basically a stripped version of PE.
-- See also: Source (https://uefi.org/sites/default/files/resources/PI_Spec_1_6.pdf)
UefiTe = class.class(KaitaiStruct)

function UefiTe:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function UefiTe:_read()
  self._raw_te_hdr = self._io:read_bytes(40)
  local _io = KaitaiStream(stringstream(self._raw_te_hdr))
  self.te_hdr = UefiTe.TeHeader(_io, self, self._root)
  self.sections = {}
  for i = 0, self.te_hdr.num_sections - 1 do
    self.sections[i + 1] = UefiTe.Section(self._io, self, self._root)
  end
end


UefiTe.TeHeader = class.class(KaitaiStruct)

UefiTe.TeHeader.MachineType = enum.Enum {
  unknown = 0,
  i386 = 332,
  r4000 = 358,
  wcemipsv2 = 361,
  alpha = 388,
  sh3 = 418,
  sh3dsp = 419,
  sh4 = 422,
  sh5 = 424,
  arm = 448,
  thumb = 450,
  armnt = 452,
  am33 = 467,
  powerpc = 496,
  powerpcfp = 497,
  ia64 = 512,
  mips16 = 614,
  mipsfpu = 870,
  mipsfpu16 = 1126,
  ebc = 3772,
  riscv32 = 20530,
  riscv64 = 20580,
  riscv128 = 20776,
  amd64 = 34404,
  m32r = 36929,
  arm64 = 43620,
}

UefiTe.TeHeader.SubsystemEnum = enum.Enum {
  unknown = 0,
  native = 1,
  windows_gui = 2,
  windows_cui = 3,
  posix_cui = 7,
  windows_ce_gui = 9,
  efi_application = 10,
  efi_boot_service_driver = 11,
  efi_runtime_driver = 12,
  efi_rom = 13,
  xbox = 14,
  windows_boot_application = 16,
}

function UefiTe.TeHeader:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function UefiTe.TeHeader:_read()
  self.magic = self._io:read_bytes(2)
  if not(self.magic == "\086\090") then
    error("not equal, expected " ..  "\086\090" .. ", but got " .. self.magic)
  end
  self.machine = UefiTe.TeHeader.MachineType(self._io:read_u2le())
  self.num_sections = self._io:read_u1()
  self.subsystem = UefiTe.TeHeader.SubsystemEnum(self._io:read_u1())
  self.stripped_size = self._io:read_u2le()
  self.entry_point_addr = self._io:read_u4le()
  self.base_of_code = self._io:read_u4le()
  self.image_base = self._io:read_u8le()
  self.data_dirs = UefiTe.HeaderDataDirs(self._io, self, self._root)
end


UefiTe.HeaderDataDirs = class.class(KaitaiStruct)

function UefiTe.HeaderDataDirs:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function UefiTe.HeaderDataDirs:_read()
  self.base_relocation_table = UefiTe.DataDir(self._io, self, self._root)
  self.debug = UefiTe.DataDir(self._io, self, self._root)
end


UefiTe.DataDir = class.class(KaitaiStruct)

function UefiTe.DataDir:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function UefiTe.DataDir:_read()
  self.virtual_address = self._io:read_u4le()
  self.size = self._io:read_u4le()
end


UefiTe.Section = class.class(KaitaiStruct)

function UefiTe.Section:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function UefiTe.Section:_read()
  self.name = str_decode.decode(KaitaiStream.bytes_strip_right(self._io:read_bytes(8), 0), "UTF-8")
  self.virtual_size = self._io:read_u4le()
  self.virtual_address = self._io:read_u4le()
  self.size_of_raw_data = self._io:read_u4le()
  self.pointer_to_raw_data = self._io:read_u4le()
  self.pointer_to_relocations = self._io:read_u4le()
  self.pointer_to_linenumbers = self._io:read_u4le()
  self.num_relocations = self._io:read_u2le()
  self.num_linenumbers = self._io:read_u2le()
  self.characteristics = self._io:read_u4le()
end

UefiTe.Section.property.body = {}
function UefiTe.Section.property.body:get()
  if self._m_body ~= nil then
    return self._m_body
  end

  local _pos = self._io:pos()
  self._io:seek(((self.pointer_to_raw_data - self._root.te_hdr.stripped_size) + self._root.te_hdr._io:size()))
  self._m_body = self._io:read_bytes(self.size_of_raw_data)
  self._io:seek(_pos)
  return self._m_body
end


