-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
local stringstream = require("string_stream")
local enum = require("enum")

-- 
-- See also: Source (https://bitcoin.org/en/developer-guide#transactions
-- https://en.bitcoin.it/wiki/Transaction
-- )
BitcoinTransaction = class.class(KaitaiStruct)

function BitcoinTransaction:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function BitcoinTransaction:_read()
  self.version = self._io:read_u4le()
  self.num_vins = self._io:read_u1()
  self.vins = {}
  for i = 0, self.num_vins - 1 do
    self.vins[i + 1] = BitcoinTransaction.Vin(self._io, self, self._root)
  end
  self.num_vouts = self._io:read_u1()
  self.vouts = {}
  for i = 0, self.num_vouts - 1 do
    self.vouts[i + 1] = BitcoinTransaction.Vout(self._io, self, self._root)
  end
  self.locktime = self._io:read_u4le()
end

-- 
-- Version number.
-- 
-- Number of input transactions.
-- 
-- Input transactions.
-- An input refers to an output from a previous transaction.
-- 
-- Number of output transactions.
-- 
-- Output transactions.

BitcoinTransaction.Vin = class.class(KaitaiStruct)

function BitcoinTransaction.Vin:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function BitcoinTransaction.Vin:_read()
  self.txid = self._io:read_bytes(32)
  self.output_id = self._io:read_u4le()
  self.len_script = self._io:read_u1()
  self._raw_script_sig = self._io:read_bytes(self.len_script)
  local _io = KaitaiStream(stringstream(self._raw_script_sig))
  self.script_sig = BitcoinTransaction.Vin.ScriptSignature(_io, self, self._root)
  self.end_of_vin = self._io:read_bytes(4)
  if not(self.end_of_vin == "\255\255\255\255") then
    error("not equal, expected " ..  "\255\255\255\255" .. ", but got " .. self.end_of_vin)
  end
end

-- 
-- Previous transaction hash.
-- 
-- ID indexing an ouput of the transaction refered by txid.
-- This output will be used as an input in the present transaction.
-- 
-- ScriptSig's length.
-- 
-- ScriptSig.
-- See also: Source (https://en.bitcoin.it/wiki/Transaction#Input
-- https://en.bitcoin.it/wiki/Script
-- )
-- 
-- Magic number indicating the end of the current input.

BitcoinTransaction.Vin.ScriptSignature = class.class(KaitaiStruct)

BitcoinTransaction.Vin.ScriptSignature.SighashType = enum.Enum {
  sighash_all = 1,
  sighash_none = 2,
  sighash_single = 3,
  sighash_anyonecanpay = 80,
}

function BitcoinTransaction.Vin.ScriptSignature:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function BitcoinTransaction.Vin.ScriptSignature:_read()
  self.len_sig_stack = self._io:read_u1()
  self.der_sig = BitcoinTransaction.Vin.ScriptSignature.DerSignature(self._io, self, self._root)
  self.sig_type = BitcoinTransaction.Vin.ScriptSignature.SighashType(self._io:read_u1())
  self.len_pubkey_stack = self._io:read_u1()
  self.pubkey = BitcoinTransaction.Vin.ScriptSignature.PublicKey(self._io, self, self._root)
end

-- 
-- DER-encoded ECDSA signature.
-- See also: Source (https://en.wikipedia.org/wiki/X.690#DER_encoding
-- https://en.wikipedia.org/wiki/Elliptic_Curve_Digital_Signature_Algorithm
-- )
-- 
-- Type of signature.
-- 
-- Public key (bitcoin address of the recipient).

BitcoinTransaction.Vin.ScriptSignature.DerSignature = class.class(KaitaiStruct)

function BitcoinTransaction.Vin.ScriptSignature.DerSignature:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function BitcoinTransaction.Vin.ScriptSignature.DerSignature:_read()
  self.sequence = self._io:read_bytes(1)
  if not(self.sequence == "\048") then
    error("not equal, expected " ..  "\048" .. ", but got " .. self.sequence)
  end
  self.len_sig = self._io:read_u1()
  self.sep_1 = self._io:read_bytes(1)
  if not(self.sep_1 == "\002") then
    error("not equal, expected " ..  "\002" .. ", but got " .. self.sep_1)
  end
  self.len_sig_r = self._io:read_u1()
  self.sig_r = self._io:read_bytes(self.len_sig_r)
  self.sep_2 = self._io:read_bytes(1)
  if not(self.sep_2 == "\002") then
    error("not equal, expected " ..  "\002" .. ", but got " .. self.sep_2)
  end
  self.len_sig_s = self._io:read_u1()
  self.sig_s = self._io:read_bytes(self.len_sig_s)
end

-- 
-- 'r' value's length.
-- 
-- 'r' value of the ECDSA signature.
-- See also: Source (https://en.wikipedia.org/wiki/Elliptic_Curve_Digital_Signature_Algorithm)
-- 
-- 's' value's length.
-- 
-- 's' value of the ECDSA signature.
-- See also: Source (https://en.wikipedia.org/wiki/Elliptic_Curve_Digital_Signature_Algorithm)

BitcoinTransaction.Vin.ScriptSignature.PublicKey = class.class(KaitaiStruct)

function BitcoinTransaction.Vin.ScriptSignature.PublicKey:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function BitcoinTransaction.Vin.ScriptSignature.PublicKey:_read()
  self.type = self._io:read_u1()
  self.x = self._io:read_bytes(32)
  self.y = self._io:read_bytes(32)
end

-- 
-- 'x' coordinate of the public key on the elliptic curve.
-- 
-- 'y' coordinate of the public key on the elliptic curve.

BitcoinTransaction.Vout = class.class(KaitaiStruct)

function BitcoinTransaction.Vout:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function BitcoinTransaction.Vout:_read()
  self.amount = self._io:read_u8le()
  self.len_script = self._io:read_u1()
  self.script_pub_key = self._io:read_bytes(self.len_script)
end

-- 
-- Number of Satoshis to be transfered.
-- 
-- ScriptPubKey's length.
-- 
-- ScriptPubKey.
-- See also: Source (https://en.bitcoin.it/wiki/Transaction#Output
-- https://en.bitcoin.it/wiki/Script
-- )

