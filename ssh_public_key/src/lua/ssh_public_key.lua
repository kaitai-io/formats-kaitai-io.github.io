-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
local str_decode = require("string_decode")

-- 
-- SSH public keys are encoded in a special binary format, typically represented
-- to end users as either one-liner OpenSSH format or multi-line PEM format
-- (commerical SSH). Text wrapper carries extra information about user who
-- created the key, comment, etc, but the inner binary is always base64-encoded
-- and follows the same internal format.
-- 
-- This format spec deals with this internal binary format (called "blob" in
-- openssh sources) only. Buffer is expected to be raw binary and not base64-d.
-- Implementation closely follows code in OpenSSH.
-- See also: Source (https://github.com/openssh/openssh-portable/blob/master/sshkey.c#L1970)
SshPublicKey = class.class(KaitaiStruct)

function SshPublicKey:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function SshPublicKey:_read()
  self.key_name = SshPublicKey.Cstring(self._io, self, self._root)
  local _on = self.key_name.value
  if _on == "ssh-rsa" then
    self.body = SshPublicKey.KeyRsa(self._io, self, self._root)
  elseif _on == "ecdsa-sha2-nistp256" then
    self.body = SshPublicKey.KeyEcdsa(self._io, self, self._root)
  elseif _on == "ssh-ed25519" then
    self.body = SshPublicKey.KeyEd25519(self._io, self, self._root)
  elseif _on == "ssh-dss" then
    self.body = SshPublicKey.KeyDsa(self._io, self, self._root)
  end
end


-- 
-- See also: Source (https://github.com/openssh/openssh-portable/blob/master/sshkey.c#L2011-L2028)
SshPublicKey.KeyRsa = class.class(KaitaiStruct)

function SshPublicKey.KeyRsa:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function SshPublicKey.KeyRsa:_read()
  self.rsa_e = SshPublicKey.Bignum2(self._io, self, self._root)
  self.rsa_n = SshPublicKey.Bignum2(self._io, self, self._root)
end

-- 
-- Key length in bits.
SshPublicKey.KeyRsa.property.key_length = {}
function SshPublicKey.KeyRsa.property.key_length:get()
  if self._m_key_length ~= nil then
    return self._m_key_length
  end

  self._m_key_length = self.rsa_n.length_in_bits
  return self._m_key_length
end

-- 
-- Public key exponent, designated `e` in RSA documentation.
-- 
-- Modulus of both public and private keys, designated `n` in RSA
-- documentation. Its length in bits is designated as "key length".

-- 
-- See also: Source (https://github.com/openssh/openssh-portable/blob/master/sshkey.c#L2111-L2124)
SshPublicKey.KeyEd25519 = class.class(KaitaiStruct)

function SshPublicKey.KeyEd25519:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function SshPublicKey.KeyEd25519:_read()
  self.len_pk = self._io:read_u4be()
  self.pk = self._io:read_bytes(self.len_pk)
end


-- 
-- See also: Source (https://github.com/openssh/openssh-portable/blob/master/sshkey.c#L2060-L2103)
SshPublicKey.KeyEcdsa = class.class(KaitaiStruct)

function SshPublicKey.KeyEcdsa:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function SshPublicKey.KeyEcdsa:_read()
  self.curve_name = SshPublicKey.Cstring(self._io, self, self._root)
  self.ec = SshPublicKey.EllipticCurve(self._io, self, self._root)
end


-- 
-- A integer-prefixed string designed to be read using `sshbuf_get_cstring`
-- and written by `sshbuf_put_cstring` routines in ssh sources. Name is an
-- obscure misnomer, as typically "C string" means a null-terminated string.
-- See also: Source (https://github.com/openssh/openssh-portable/blob/master/sshbuf-getput-basic.c#L181)
SshPublicKey.Cstring = class.class(KaitaiStruct)

function SshPublicKey.Cstring:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function SshPublicKey.Cstring:_read()
  self.len = self._io:read_u4be()
  self.value = str_decode.decode(self._io:read_bytes(self.len), "ASCII")
end


-- 
-- See also: Source (https://github.com/openssh/openssh-portable/blob/master/sshkey.c#L2036-L2051)
SshPublicKey.KeyDsa = class.class(KaitaiStruct)

function SshPublicKey.KeyDsa:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function SshPublicKey.KeyDsa:_read()
  self.dsa_p = SshPublicKey.Bignum2(self._io, self, self._root)
  self.dsa_q = SshPublicKey.Bignum2(self._io, self, self._root)
  self.dsa_g = SshPublicKey.Bignum2(self._io, self, self._root)
  self.dsa_pub_key = SshPublicKey.Bignum2(self._io, self, self._root)
end


-- 
-- Elliptic curve dump format used by ssh. In OpenSSH code, the following
-- routines are used to read/write it:
-- 
-- * sshbuf_get_ec
-- * get_ec
-- See also: Source (https://github.com/openssh/openssh-portable/blob/master/sshbuf-getput-crypto.c#L90
-- https://github.com/openssh/openssh-portable/blob/master/sshbuf-getput-crypto.c#L76
-- )
SshPublicKey.EllipticCurve = class.class(KaitaiStruct)

function SshPublicKey.EllipticCurve:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function SshPublicKey.EllipticCurve:_read()
  self.len = self._io:read_u4be()
  self.body = self._io:read_bytes(self.len)
end


-- 
-- Big integers serialization format used by ssh, v2. In the code, the following
-- routines are used to read/write it:
-- 
-- * sshbuf_get_bignum2
-- * sshbuf_get_bignum2_bytes_direct
-- * sshbuf_put_bignum2
-- * sshbuf_get_bignum2_bytes_direct
-- See also: Source (https://github.com/openssh/openssh-portable/blob/master/sshbuf-getput-crypto.c#L35
-- https://github.com/openssh/openssh-portable/blob/master/sshbuf-getput-basic.c#L431
-- )
SshPublicKey.Bignum2 = class.class(KaitaiStruct)

function SshPublicKey.Bignum2:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function SshPublicKey.Bignum2:_read()
  self.len = self._io:read_u4be()
  self.body = self._io:read_bytes(self.len)
end

-- 
-- Length of big integer in bits. In OpenSSH sources, this corresponds to
-- `BN_num_bits` function.
SshPublicKey.Bignum2.property.length_in_bits = {}
function SshPublicKey.Bignum2.property.length_in_bits:get()
  if self._m_length_in_bits ~= nil then
    return self._m_length_in_bits
  end

  self._m_length_in_bits = ((self.len - 1) * 8)
  return self._m_length_in_bits
end


