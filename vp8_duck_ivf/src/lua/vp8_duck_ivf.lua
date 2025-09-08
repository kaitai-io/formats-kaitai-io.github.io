-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")

-- 
-- Duck IVF is a simple container format for raw VP8 data, which is an open and
-- royalty-free video compression format, currently developed by Google.
-- 
-- Test .ivf files are available at
-- <https://chromium.googlesource.com/webm/vp8-test-vectors>
-- See also: Source (https://wiki.multimedia.cx/index.php/Duck_IVF)
Vp8DuckIvf = class.class(KaitaiStruct)

function Vp8DuckIvf:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Vp8DuckIvf:_read()
  self.magic1 = self._io:read_bytes(4)
  if not(self.magic1 == "\068\075\073\070") then
    error("not equal, expected " .. "\068\075\073\070" .. ", but got " .. self.magic1)
  end
  self.version = self._io:read_u2le()
  self.len_header = self._io:read_u2le()
  self.codec = self._io:read_bytes(4)
  if not(self.codec == "\086\080\056\048") then
    error("not equal, expected " .. "\086\080\056\048" .. ", but got " .. self.codec)
  end
  self.width = self._io:read_u2le()
  self.height = self._io:read_u2le()
  self.framerate = self._io:read_u4le()
  self.timescale = self._io:read_u4le()
  self.num_frames = self._io:read_u4le()
  self.unused = self._io:read_u4le()
  self.image_data = {}
  for i = 0, self.num_frames - 1 do
    self.image_data[i + 1] = Vp8DuckIvf.Blocks(self._io, self, self._root)
  end
end

-- 
-- Magic Number of IVF Files.
-- 
-- This should be 0.
-- 
-- Normally the header length is 32 byte.
-- 
-- Name of the codec e.g. 'VP80' for VP8.
-- 
-- The (initial) width of the video, every keyframe may change the resolution.
-- 
-- The (initial) height of the video, every keyframe may change the resolution.
-- 
-- the (framerate * timescale) e.g. for 30 fps -> 30000.
-- 
-- the timescale is a divider of the seconds (VPX is integer math only) mostly 1000.
-- 
-- the number of frames (if not a camera stream).

Vp8DuckIvf.Block = class.class(KaitaiStruct)

function Vp8DuckIvf.Block:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Vp8DuckIvf.Block:_read()
  self.len_frame = self._io:read_u4le()
  self.timestamp = self._io:read_u8le()
  self.framedata = self._io:read_bytes(self.len_frame)
end

-- 
-- size of the frame data.

Vp8DuckIvf.Blocks = class.class(KaitaiStruct)

function Vp8DuckIvf.Blocks:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function Vp8DuckIvf.Blocks:_read()
  self.entries = Vp8DuckIvf.Block(self._io, self, self._root)
end


