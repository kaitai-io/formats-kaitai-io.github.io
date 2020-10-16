-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
local stringstream = require("string_stream")

-- 
-- Parse UEFI variables db and dbx that contain signatures, certificates and
-- hashes. On a Linux system using UEFI, these variables are readable from
-- /sys/firmware/efi/efivars/db-d719b2cb-3d3a-4596-a3bc-dad00e67656f,
-- /sys/firmware/efi/efivars/dbDefault-8be4df61-93ca-11d2-aa0d-00e098032b8c,
-- /sys/firmware/efi/efivars/dbx-d719b2cb-3d3a-4596-a3bc-dad00e67656f and
-- /sys/firmware/efi/efivars/dbxDefault-8be4df61-93ca-11d2-aa0d-00e098032b8c.
-- ("d719b2cb-3d3a-4596-a3bc-dad00e67656f" is defined as
-- EFI_IMAGE_SECURITY_DATABASE_GUID and "8be4df61-93ca-11d2-aa0d-00e098032b8c"
-- as EFI_GLOBAL_VARIABLE).
-- Each file contains an EFI attribute (32-bit integer) followed by a list of
-- EFI_SIGNATURE_LIST structures.
-- See also: Source (https://uefi.org/sites/default/files/resources/UEFI_Spec_2_8_final.pdf)
EfivarSignatureList = class.class(KaitaiStruct)

function EfivarSignatureList:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function EfivarSignatureList:_read()
  self.var_attributes = EfivarSignatureList.EfiVarAttr(self._io, self, self._root)
  self.signatures = {}
  local i = 0
  while not self._io:is_eof() do
    self.signatures[i + 1] = EfivarSignatureList.SignatureList(self._io, self, self._root)
    i = i + 1
  end
end

-- 
-- Attributes of the UEFI variable.

-- 
-- See also: EFI_SIGNATURE_LIST
EfivarSignatureList.SignatureList = class.class(KaitaiStruct)

function EfivarSignatureList.SignatureList:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function EfivarSignatureList.SignatureList:_read()
  self.signature_type = self._io:read_bytes(16)
  self.len_signature_list = self._io:read_u4le()
  self.len_signature_header = self._io:read_u4le()
  self.len_signature = self._io:read_u4le()
  self.header = self._io:read_bytes(self.len_signature_header)
  if self.len_signature > 0 then
    self._raw_signatures = {}
    self.signatures = {}
    for i = 0, math.floor(((self.len_signature_list - self.len_signature_header) - 28) / self.len_signature) - 1 do
      self._raw_signatures[i + 1] = self._io:read_bytes(self.len_signature)
      local _io = KaitaiStream(stringstream(self._raw_signatures[i + 1]))
      self.signatures[i + 1] = EfivarSignatureList.SignatureData(_io, self, self._root)
    end
  end
end

-- 
-- SHA512 hash of an X.509 certificate's To-Be-Signed contents, and a time of revocation.
-- See also: EFI_CERT_X509_SHA512_GUID
EfivarSignatureList.SignatureList.property.is_cert_sha512_x509 = {}
function EfivarSignatureList.SignatureList.property.is_cert_sha512_x509:get()
  if self._m_is_cert_sha512_x509 ~= nil then
    return self._m_is_cert_sha512_x509
  end

  self._m_is_cert_sha512_x509 = self.signature_type == "\099\191\109\068\002\037\218\076\188\250\036\101\210\176\254\157"
  return self._m_is_cert_sha512_x509
end

-- 
-- SHA-224 hash.
-- See also: EFI_CERT_SHA224_GUID
EfivarSignatureList.SignatureList.property.is_cert_sha224 = {}
function EfivarSignatureList.SignatureList.property.is_cert_sha224:get()
  if self._m_is_cert_sha224 ~= nil then
    return self._m_is_cert_sha224
  end

  self._m_is_cert_sha224 = self.signature_type == "\051\082\110\011\092\166\201\068\148\007\217\171\131\191\200\189"
  return self._m_is_cert_sha224
end

-- 
-- X.509 certificate.
-- See also: EFI_CERT_X509_GUID
EfivarSignatureList.SignatureList.property.is_cert_x509 = {}
function EfivarSignatureList.SignatureList.property.is_cert_x509:get()
  if self._m_is_cert_x509 ~= nil then
    return self._m_is_cert_x509
  end

  self._m_is_cert_x509 = self.signature_type == "\161\089\192\165\228\148\167\074\135\181\171\021\092\043\240\114"
  return self._m_is_cert_x509
end

-- 
-- SHA256 hash of an X.509 certificate's To-Be-Signed contents, and a time of revocation.
-- See also: EFI_CERT_X509_SHA256_GUID
EfivarSignatureList.SignatureList.property.is_cert_sha256_x509 = {}
function EfivarSignatureList.SignatureList.property.is_cert_sha256_x509:get()
  if self._m_is_cert_sha256_x509 ~= nil then
    return self._m_is_cert_sha256_x509
  end

  self._m_is_cert_sha256_x509 = self.signature_type == "\146\164\210\059\192\150\121\064\180\032\252\249\142\241\003\237"
  return self._m_is_cert_sha256_x509
end

-- 
-- RSA-2048 key (only the modulus since the public key exponent is known to be 0x10001).
-- See also: EFI_CERT_RSA2048_GUID
EfivarSignatureList.SignatureList.property.is_cert_rsa2048_key = {}
function EfivarSignatureList.SignatureList.property.is_cert_rsa2048_key:get()
  if self._m_is_cert_rsa2048_key ~= nil then
    return self._m_is_cert_rsa2048_key
  end

  self._m_is_cert_rsa2048_key = self.signature_type == "\232\102\087\060\156\038\052\078\170\020\237\119\110\133\179\182"
  return self._m_is_cert_rsa2048_key
end

-- 
-- SHA-512 hash.
-- See also: EFI_CERT_SHA512_GUID
EfivarSignatureList.SignatureList.property.is_cert_sha512 = {}
function EfivarSignatureList.SignatureList.property.is_cert_sha512:get()
  if self._m_is_cert_sha512 ~= nil then
    return self._m_is_cert_sha512
  end

  self._m_is_cert_sha512 = self.signature_type == "\174\015\062\009\196\166\080\079\159\027\212\030\043\137\193\154"
  return self._m_is_cert_sha512
end

-- 
-- SHA-384 hash.
-- See also: EFI_CERT_SHA384_GUID
EfivarSignatureList.SignatureList.property.is_cert_sha384 = {}
function EfivarSignatureList.SignatureList.property.is_cert_sha384:get()
  if self._m_is_cert_sha384 ~= nil then
    return self._m_is_cert_sha384
  end

  self._m_is_cert_sha384 = self.signature_type == "\007\083\062\255\208\159\201\072\133\241\138\213\108\112\030\001"
  return self._m_is_cert_sha384
end

-- 
-- SHA-1 hash.
-- See also: EFI_CERT_SHA1_GUID
EfivarSignatureList.SignatureList.property.is_cert_sha1 = {}
function EfivarSignatureList.SignatureList.property.is_cert_sha1:get()
  if self._m_is_cert_sha1 ~= nil then
    return self._m_is_cert_sha1
  end

  self._m_is_cert_sha1 = self.signature_type == "\018\165\108\130\016\207\201\074\177\135\190\001\073\102\049\189"
  return self._m_is_cert_sha1
end

-- 
-- RSA-2048 signature of a SHA-1 hash.
-- See also: EFI_CERT_RSA2048_SHA1_GUID
EfivarSignatureList.SignatureList.property.is_cert_rsa2048_sha1 = {}
function EfivarSignatureList.SignatureList.property.is_cert_rsa2048_sha1:get()
  if self._m_is_cert_rsa2048_sha1 ~= nil then
    return self._m_is_cert_rsa2048_sha1
  end

  self._m_is_cert_rsa2048_sha1 = self.signature_type == "\079\068\248\103\067\135\241\072\163\040\030\170\184\115\096\128"
  return self._m_is_cert_rsa2048_sha1
end

-- 
-- SHA-256 hash.
-- See also: EFI_CERT_SHA256_GUID
EfivarSignatureList.SignatureList.property.is_cert_sha256 = {}
function EfivarSignatureList.SignatureList.property.is_cert_sha256:get()
  if self._m_is_cert_sha256 ~= nil then
    return self._m_is_cert_sha256
  end

  self._m_is_cert_sha256 = self.signature_type == "\038\022\196\193\076\080\146\064\172\169\065\249\054\147\067\040"
  return self._m_is_cert_sha256
end

-- 
-- SHA384 hash of an X.509 certificate's To-Be-Signed contents, and a time of revocation.
-- See also: EFI_CERT_X509_SHA384_GUID
EfivarSignatureList.SignatureList.property.is_cert_sha384_x509 = {}
function EfivarSignatureList.SignatureList.property.is_cert_sha384_x509:get()
  if self._m_is_cert_sha384_x509 ~= nil then
    return self._m_is_cert_sha384_x509
  end

  self._m_is_cert_sha384_x509 = self.signature_type == "\110\135\118\112\194\128\230\078\170\210\040\179\073\166\134\091"
  return self._m_is_cert_sha384_x509
end

-- 
-- RSA-2048 signature of a SHA-256 hash.
-- See also: EFI_CERT_RSA2048_SHA256_GUID
EfivarSignatureList.SignatureList.property.is_cert_rsa2048_sha256 = {}
function EfivarSignatureList.SignatureList.property.is_cert_rsa2048_sha256:get()
  if self._m_is_cert_rsa2048_sha256 ~= nil then
    return self._m_is_cert_rsa2048_sha256
  end

  self._m_is_cert_rsa2048_sha256 = self.signature_type == "\144\097\179\226\155\135\061\074\173\141\242\231\187\163\039\132"
  return self._m_is_cert_rsa2048_sha256
end

-- 
-- DER-encoded PKCS #7 version 1.5 [RFC2315].
-- See also: EFI_CERT_TYPE_PKCS7_GUID
EfivarSignatureList.SignatureList.property.is_cert_der_pkcs7 = {}
function EfivarSignatureList.SignatureList.property.is_cert_der_pkcs7:get()
  if self._m_is_cert_der_pkcs7 ~= nil then
    return self._m_is_cert_der_pkcs7
  end

  self._m_is_cert_der_pkcs7 = self.signature_type == "\157\210\175\074\223\104\238\073\138\169\052\125\055\086\101\167"
  return self._m_is_cert_der_pkcs7
end

-- 
-- Type of the signature as a GUID.
-- 
-- Total size of the signature list, including this header.
-- 
-- Size of the signature header which precedes the array of signatures.
-- 
-- Size of each signature.
-- 
-- Header before the array of signatures.
-- 
-- An array of signatures.

-- 
-- See also: EFI_SIGNATURE_DATA
EfivarSignatureList.SignatureData = class.class(KaitaiStruct)

function EfivarSignatureList.SignatureData:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function EfivarSignatureList.SignatureData:_read()
  self.owner = self._io:read_bytes(16)
  self.data = self._io:read_bytes_full()
end

-- 
-- An identifier which identifies the agent which added the signature to the list.
-- 
-- The format of the signature is defined by the SignatureType.

-- 
-- Attributes of a UEFI variable.
EfivarSignatureList.EfiVarAttr = class.class(KaitaiStruct)

function EfivarSignatureList.EfiVarAttr:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function EfivarSignatureList.EfiVarAttr:_read()
  self.enhanced_authenticated_access = self._io:read_bits_int_be(1)
  self.append_write = self._io:read_bits_int_be(1)
  self.time_based_authenticated_write_access = self._io:read_bits_int_be(1)
  self.authenticated_write_access = self._io:read_bits_int_be(1)
  self.hardware_error_record = self._io:read_bits_int_be(1)
  self.runtime_access = self._io:read_bits_int_be(1)
  self.bootservice_access = self._io:read_bits_int_be(1)
  self.non_volatile = self._io:read_bits_int_be(1)
  self.reserved1 = self._io:read_bits_int_be(24)
end

-- 
-- Reserved (unused) bits.

