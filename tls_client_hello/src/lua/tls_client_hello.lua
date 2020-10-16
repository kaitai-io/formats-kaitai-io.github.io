-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
local stringstream = require("string_stream")

TlsClientHello = class.class(KaitaiStruct)

function TlsClientHello:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function TlsClientHello:_read()
  self.version = TlsClientHello.Version(self._io, self, self._root)
  self.random = TlsClientHello.Random(self._io, self, self._root)
  self.session_id = TlsClientHello.SessionId(self._io, self, self._root)
  self.cipher_suites = TlsClientHello.CipherSuites(self._io, self, self._root)
  self.compression_methods = TlsClientHello.CompressionMethods(self._io, self, self._root)
  if self._io:is_eof() == 0 then
    self.extensions = TlsClientHello.Extensions(self._io, self, self._root)
  end
end


TlsClientHello.ServerName = class.class(KaitaiStruct)

function TlsClientHello.ServerName:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function TlsClientHello.ServerName:_read()
  self.name_type = self._io:read_u1()
  self.length = self._io:read_u2be()
  self.host_name = self._io:read_bytes(self.length)
end


TlsClientHello.Random = class.class(KaitaiStruct)

function TlsClientHello.Random:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function TlsClientHello.Random:_read()
  self.gmt_unix_time = self._io:read_u4be()
  self.random = self._io:read_bytes(28)
end


TlsClientHello.SessionId = class.class(KaitaiStruct)

function TlsClientHello.SessionId:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function TlsClientHello.SessionId:_read()
  self.len = self._io:read_u1()
  self.sid = self._io:read_bytes(self.len)
end


TlsClientHello.Sni = class.class(KaitaiStruct)

function TlsClientHello.Sni:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function TlsClientHello.Sni:_read()
  self.list_length = self._io:read_u2be()
  self.server_names = {}
  local i = 0
  while not self._io:is_eof() do
    self.server_names[i + 1] = TlsClientHello.ServerName(self._io, self, self._root)
    i = i + 1
  end
end


TlsClientHello.CipherSuites = class.class(KaitaiStruct)

function TlsClientHello.CipherSuites:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function TlsClientHello.CipherSuites:_read()
  self.len = self._io:read_u2be()
  self.cipher_suites = {}
  for i = 0, math.floor(self.len / 2) - 1 do
    self.cipher_suites[i + 1] = self._io:read_u2be()
  end
end


TlsClientHello.CompressionMethods = class.class(KaitaiStruct)

function TlsClientHello.CompressionMethods:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function TlsClientHello.CompressionMethods:_read()
  self.len = self._io:read_u1()
  self.compression_methods = self._io:read_bytes(self.len)
end


TlsClientHello.Alpn = class.class(KaitaiStruct)

function TlsClientHello.Alpn:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function TlsClientHello.Alpn:_read()
  self.ext_len = self._io:read_u2be()
  self.alpn_protocols = {}
  local i = 0
  while not self._io:is_eof() do
    self.alpn_protocols[i + 1] = TlsClientHello.Protocol(self._io, self, self._root)
    i = i + 1
  end
end


TlsClientHello.Extensions = class.class(KaitaiStruct)

function TlsClientHello.Extensions:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function TlsClientHello.Extensions:_read()
  self.len = self._io:read_u2be()
  self.extensions = {}
  local i = 0
  while not self._io:is_eof() do
    self.extensions[i + 1] = TlsClientHello.Extension(self._io, self, self._root)
    i = i + 1
  end
end


TlsClientHello.Version = class.class(KaitaiStruct)

function TlsClientHello.Version:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function TlsClientHello.Version:_read()
  self.major = self._io:read_u1()
  self.minor = self._io:read_u1()
end


TlsClientHello.Protocol = class.class(KaitaiStruct)

function TlsClientHello.Protocol:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function TlsClientHello.Protocol:_read()
  self.strlen = self._io:read_u1()
  self.name = self._io:read_bytes(self.strlen)
end


TlsClientHello.Extension = class.class(KaitaiStruct)

function TlsClientHello.Extension:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function TlsClientHello.Extension:_read()
  self.type = self._io:read_u2be()
  self.len = self._io:read_u2be()
  local _on = self.type
  if _on == 0 then
    self._raw_body = self._io:read_bytes(self.len)
    local _io = KaitaiStream(stringstream(self._raw_body))
    self.body = TlsClientHello.Sni(_io, self, self._root)
  elseif _on == 16 then
    self._raw_body = self._io:read_bytes(self.len)
    local _io = KaitaiStream(stringstream(self._raw_body))
    self.body = TlsClientHello.Alpn(_io, self, self._root)
  else
    self.body = self._io:read_bytes(self.len)
  end
end


