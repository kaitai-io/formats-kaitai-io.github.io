-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")

-- 
-- DOS MZ file format is a traditional format for executables in MS-DOS
-- environment. Many modern formats (i.e. Windows PE) still maintain
-- compatibility stub with this format.
-- 
-- As opposed to .com file format (which basically sports one 64K code
-- segment of raw CPU instructions), DOS MZ .exe file format allowed
-- more flexible memory management, loading of larger programs and
-- added support for relocations.
DosMz = class.class(KaitaiStruct)

function DosMz:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function DosMz:_read()
  self.hdr = DosMz.MzHeader(self._io, self, self._root)
  self.mz_header2 = self._io:read_bytes((self.hdr.ofs_relocations - 28))
  self.relocations = {}
  for i = 0, self.hdr.num_relocations - 1 do
    self.relocations[i + 1] = DosMz.Relocation(self._io, self, self._root)
  end
  self.body = self._io:read_bytes_full()
end


DosMz.MzHeader = class.class(KaitaiStruct)

function DosMz.MzHeader:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function DosMz.MzHeader:_read()
  self.magic = self._io:read_bytes(2)
  self.last_page_extra_bytes = self._io:read_u2le()
  self.num_pages = self._io:read_u2le()
  self.num_relocations = self._io:read_u2le()
  self.header_size = self._io:read_u2le()
  self.min_allocation = self._io:read_u2le()
  self.max_allocation = self._io:read_u2le()
  self.initial_ss = self._io:read_u2le()
  self.initial_sp = self._io:read_u2le()
  self.checksum = self._io:read_u2le()
  self.initial_ip = self._io:read_u2le()
  self.initial_cs = self._io:read_u2le()
  self.ofs_relocations = self._io:read_u2le()
  self.overlay_id = self._io:read_u2le()
end


DosMz.Relocation = class.class(KaitaiStruct)

function DosMz.Relocation:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function DosMz.Relocation:_read()
  self.ofs = self._io:read_u2le()
  self.seg = self._io:read_u2le()
end


