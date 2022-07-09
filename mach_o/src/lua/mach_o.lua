-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
local enum = require("enum")
local str_decode = require("string_decode")
local utils = require("utils")
local stringstream = require("string_stream")

require("asn1_der")
MachO = class.class(KaitaiStruct)

MachO.MagicType = enum.Enum {
  fat_le = 3199925962,
  fat_be = 3405691582,
  macho_le_x86 = 3472551422,
  macho_le_x64 = 3489328638,
  macho_be_x86 = 4277009102,
  macho_be_x64 = 4277009103,
}

MachO.CpuType = enum.Enum {
  vax = 1,
  romp = 2,
  ns32032 = 4,
  ns32332 = 5,
  i386 = 7,
  mips = 8,
  ns32532 = 9,
  hppa = 11,
  arm = 12,
  mc88000 = 13,
  sparc = 14,
  i860 = 15,
  i860_little = 16,
  rs6000 = 17,
  powerpc = 18,
  abi64 = 16777216,
  x86_64 = 16777223,
  arm64 = 16777228,
  powerpc64 = 16777234,
  any = 4294967295,
}

MachO.FileType = enum.Enum {
  object = 1,
  execute = 2,
  fvmlib = 3,
  core = 4,
  preload = 5,
  dylib = 6,
  dylinker = 7,
  bundle = 8,
  dylib_stub = 9,
  dsym = 10,
  kext_bundle = 11,
}

MachO.LoadCommandType = enum.Enum {
  segment = 1,
  symtab = 2,
  symseg = 3,
  thread = 4,
  unix_thread = 5,
  load_fvm_lib = 6,
  id_fvm_lib = 7,
  ident = 8,
  fvm_file = 9,
  prepage = 10,
  dysymtab = 11,
  load_dylib = 12,
  id_dylib = 13,
  load_dylinker = 14,
  id_dylinker = 15,
  prebound_dylib = 16,
  routines = 17,
  sub_framework = 18,
  sub_umbrella = 19,
  sub_client = 20,
  sub_library = 21,
  twolevel_hints = 22,
  prebind_cksum = 23,
  segment_64 = 25,
  routines_64 = 26,
  uuid = 27,
  code_signature = 29,
  segment_split_info = 30,
  lazy_load_dylib = 32,
  encryption_info = 33,
  dyld_info = 34,
  version_min_macosx = 36,
  version_min_iphoneos = 37,
  function_starts = 38,
  dyld_environment = 39,
  data_in_code = 41,
  source_version = 42,
  dylib_code_sign_drs = 43,
  encryption_info_64 = 44,
  linker_option = 45,
  linker_optimization_hint = 46,
  version_min_tvos = 47,
  version_min_watchos = 48,
  build_version = 50,
  req_dyld = 2147483648,
  load_weak_dylib = 2147483672,
  rpath = 2147483676,
  reexport_dylib = 2147483679,
  dyld_info_only = 2147483682,
  load_upward_dylib = 2147483683,
  main = 2147483688,
}

function MachO:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function MachO:_read()
  self.magic = MachO.MagicType(self._io:read_u4be())
  self.header = MachO.MachHeader(self._io, self, self._root)
  self.load_commands = {}
  for i = 0, self.header.ncmds - 1 do
    self.load_commands[i + 1] = MachO.LoadCommand(self._io, self, self._root)
  end
end


MachO.RpathCommand = class.class(KaitaiStruct)

function MachO.RpathCommand:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function MachO.RpathCommand:_read()
  self.path_offset = self._io:read_u4le()
  self.path = str_decode.decode(self._io:read_bytes_term(0, false, true, true), "utf-8")
end


MachO.Uleb128 = class.class(KaitaiStruct)

function MachO.Uleb128:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function MachO.Uleb128:_read()
  self.b1 = self._io:read_u1()
  if (self.b1 & 128) ~= 0 then
    self.b2 = self._io:read_u1()
  end
  if (self.b2 & 128) ~= 0 then
    self.b3 = self._io:read_u1()
  end
  if (self.b3 & 128) ~= 0 then
    self.b4 = self._io:read_u1()
  end
  if (self.b4 & 128) ~= 0 then
    self.b5 = self._io:read_u1()
  end
  if (self.b5 & 128) ~= 0 then
    self.b6 = self._io:read_u1()
  end
  if (self.b6 & 128) ~= 0 then
    self.b7 = self._io:read_u1()
  end
  if (self.b7 & 128) ~= 0 then
    self.b8 = self._io:read_u1()
  end
  if (self.b8 & 128) ~= 0 then
    self.b9 = self._io:read_u1()
  end
  if (self.b9 & 128) ~= 0 then
    self.b10 = self._io:read_u1()
  end
end

MachO.Uleb128.property.value = {}
function MachO.Uleb128.property.value:get()
  if self._m_value ~= nil then
    return self._m_value
  end

  self._m_value = (((self.b1 % 128) << 0) + utils.box_unwrap(((self.b1 & 128) == 0) and utils.box_wrap(0) or ((((self.b2 % 128) << 7) + utils.box_unwrap(((self.b2 & 128) == 0) and utils.box_wrap(0) or ((((self.b3 % 128) << 14) + utils.box_unwrap(((self.b3 & 128) == 0) and utils.box_wrap(0) or ((((self.b4 % 128) << 21) + utils.box_unwrap(((self.b4 & 128) == 0) and utils.box_wrap(0) or ((((self.b5 % 128) << 28) + utils.box_unwrap(((self.b5 & 128) == 0) and utils.box_wrap(0) or ((((self.b6 % 128) << 35) + utils.box_unwrap(((self.b6 & 128) == 0) and utils.box_wrap(0) or ((((self.b7 % 128) << 42) + utils.box_unwrap(((self.b7 & 128) == 0) and utils.box_wrap(0) or ((((self.b8 % 128) << 49) + utils.box_unwrap(((self.b8 & 128) == 0) and utils.box_wrap(0) or ((((self.b9 % 128) << 56) + utils.box_unwrap(((self.b8 & 128) == 0) and utils.box_wrap(0) or (((self.b10 % 128) << 63))))))))))))))))))))))))))))
  return self._m_value
end


MachO.SourceVersionCommand = class.class(KaitaiStruct)

function MachO.SourceVersionCommand:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function MachO.SourceVersionCommand:_read()
  self.version = self._io:read_u8le()
end


MachO.CsBlob = class.class(KaitaiStruct)

MachO.CsBlob.CsMagic = enum.Enum {
  blob_wrapper = 4208855809,
  requirement = 4208856064,
  requirements = 4208856065,
  code_directory = 4208856066,
  embedded_signature = 4208856256,
  detached_signature = 4208856257,
  entitlements = 4208882033,
  der_entitlements = 4208882034,
}

function MachO.CsBlob:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function MachO.CsBlob:_read()
  self.magic = MachO.CsBlob.CsMagic(self._io:read_u4be())
  self.length = self._io:read_u4be()
  local _on = self.magic
  if _on == MachO.CsBlob.CsMagic.requirement then
    self._raw_body = self._io:read_bytes((self.length - 8))
    local _io = KaitaiStream(stringstream(self._raw_body))
    self.body = MachO.CsBlob.Requirement(_io, self, self._root)
  elseif _on == MachO.CsBlob.CsMagic.code_directory then
    self._raw_body = self._io:read_bytes((self.length - 8))
    local _io = KaitaiStream(stringstream(self._raw_body))
    self.body = MachO.CsBlob.CodeDirectory(_io, self, self._root)
  elseif _on == MachO.CsBlob.CsMagic.requirements then
    self._raw_body = self._io:read_bytes((self.length - 8))
    local _io = KaitaiStream(stringstream(self._raw_body))
    self.body = MachO.CsBlob.Requirements(_io, self, self._root)
  elseif _on == MachO.CsBlob.CsMagic.blob_wrapper then
    self._raw_body = self._io:read_bytes((self.length - 8))
    local _io = KaitaiStream(stringstream(self._raw_body))
    self.body = MachO.CsBlob.BlobWrapper(_io, self, self._root)
  elseif _on == MachO.CsBlob.CsMagic.embedded_signature then
    self._raw_body = self._io:read_bytes((self.length - 8))
    local _io = KaitaiStream(stringstream(self._raw_body))
    self.body = MachO.CsBlob.SuperBlob(_io, self, self._root)
  elseif _on == MachO.CsBlob.CsMagic.entitlements then
    self._raw_body = self._io:read_bytes((self.length - 8))
    local _io = KaitaiStream(stringstream(self._raw_body))
    self.body = MachO.CsBlob.Entitlements(_io, self, self._root)
  elseif _on == MachO.CsBlob.CsMagic.detached_signature then
    self._raw_body = self._io:read_bytes((self.length - 8))
    local _io = KaitaiStream(stringstream(self._raw_body))
    self.body = MachO.CsBlob.SuperBlob(_io, self, self._root)
  elseif _on == MachO.CsBlob.CsMagic.der_entitlements then
    self._raw_body = self._io:read_bytes((self.length - 8))
    local _io = KaitaiStream(stringstream(self._raw_body))
    self.body = Asn1Der(_io)
  else
    self.body = self._io:read_bytes((self.length - 8))
  end
end


MachO.CsBlob.CodeDirectory = class.class(KaitaiStruct)

function MachO.CsBlob.CodeDirectory:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function MachO.CsBlob.CodeDirectory:_read()
  self.version = self._io:read_u4be()
  self.flags = self._io:read_u4be()
  self.hash_offset = self._io:read_u4be()
  self.ident_offset = self._io:read_u4be()
  self.n_special_slots = self._io:read_u4be()
  self.n_code_slots = self._io:read_u4be()
  self.code_limit = self._io:read_u4be()
  self.hash_size = self._io:read_u1()
  self.hash_type = self._io:read_u1()
  self.spare1 = self._io:read_u1()
  self.page_size = self._io:read_u1()
  self.spare2 = self._io:read_u4be()
  if self.version >= 131328 then
    self.scatter_offset = self._io:read_u4be()
  end
  if self.version >= 131584 then
    self.team_id_offset = self._io:read_u4be()
  end
end

MachO.CsBlob.CodeDirectory.property.ident = {}
function MachO.CsBlob.CodeDirectory.property.ident:get()
  if self._m_ident ~= nil then
    return self._m_ident
  end

  local _pos = self._io:pos()
  self._io:seek((self.ident_offset - 8))
  self._m_ident = str_decode.decode(self._io:read_bytes_term(0, false, true, true), "utf-8")
  self._io:seek(_pos)
  return self._m_ident
end

MachO.CsBlob.CodeDirectory.property.team_id = {}
function MachO.CsBlob.CodeDirectory.property.team_id:get()
  if self._m_team_id ~= nil then
    return self._m_team_id
  end

  local _pos = self._io:pos()
  self._io:seek((self.team_id_offset - 8))
  self._m_team_id = str_decode.decode(self._io:read_bytes_term(0, false, true, true), "utf-8")
  self._io:seek(_pos)
  return self._m_team_id
end

MachO.CsBlob.CodeDirectory.property.hashes = {}
function MachO.CsBlob.CodeDirectory.property.hashes:get()
  if self._m_hashes ~= nil then
    return self._m_hashes
  end

  local _pos = self._io:pos()
  self._io:seek(((self.hash_offset - 8) - (self.hash_size * self.n_special_slots)))
  self._m_hashes = {}
  for i = 0, (self.n_special_slots + self.n_code_slots) - 1 do
    self._m_hashes[i + 1] = self._io:read_bytes(self.hash_size)
  end
  self._io:seek(_pos)
  return self._m_hashes
end


MachO.CsBlob.Data = class.class(KaitaiStruct)

function MachO.CsBlob.Data:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function MachO.CsBlob.Data:_read()
  self.length = self._io:read_u4be()
  self.value = self._io:read_bytes(self.length)
  self.padding = self._io:read_bytes((4 - (self.length & 3)))
end


MachO.CsBlob.SuperBlob = class.class(KaitaiStruct)

function MachO.CsBlob.SuperBlob:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function MachO.CsBlob.SuperBlob:_read()
  self.count = self._io:read_u4be()
  self.blobs = {}
  for i = 0, self.count - 1 do
    self.blobs[i + 1] = MachO.CsBlob.BlobIndex(self._io, self, self._root)
  end
end


MachO.CsBlob.Expr = class.class(KaitaiStruct)

MachO.CsBlob.Expr.OpEnum = enum.Enum {
  false = 0,
  true = 1,
  ident = 2,
  apple_anchor = 3,
  anchor_hash = 4,
  info_key_value = 5,
  and_op = 6,
  or_op = 7,
  cd_hash = 8,
  not_op = 9,
  info_key_field = 10,
  cert_field = 11,
  trusted_cert = 12,
  trusted_certs = 13,
  cert_generic = 14,
  apple_generic_anchor = 15,
  entitlement_field = 16,
}

MachO.CsBlob.Expr.CertSlot = enum.Enum {
  left_cert = 0,
  anchor_cert = 4294967295,
}

function MachO.CsBlob.Expr:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function MachO.CsBlob.Expr:_read()
  self.op = MachO.CsBlob.Expr.OpEnum(self._io:read_u4be())
  local _on = self.op
  if _on == MachO.CsBlob.Expr.OpEnum.ident then
    self.data = MachO.CsBlob.Expr.IdentExpr(self._io, self, self._root)
  elseif _on == MachO.CsBlob.Expr.OpEnum.or_op then
    self.data = MachO.CsBlob.Expr.OrExpr(self._io, self, self._root)
  elseif _on == MachO.CsBlob.Expr.OpEnum.info_key_value then
    self.data = MachO.CsBlob.Data(self._io, self, self._root)
  elseif _on == MachO.CsBlob.Expr.OpEnum.anchor_hash then
    self.data = MachO.CsBlob.Expr.AnchorHashExpr(self._io, self, self._root)
  elseif _on == MachO.CsBlob.Expr.OpEnum.info_key_field then
    self.data = MachO.CsBlob.Expr.InfoKeyFieldExpr(self._io, self, self._root)
  elseif _on == MachO.CsBlob.Expr.OpEnum.not_op then
    self.data = MachO.CsBlob.Expr(self._io, self, self._root)
  elseif _on == MachO.CsBlob.Expr.OpEnum.entitlement_field then
    self.data = MachO.CsBlob.Expr.EntitlementFieldExpr(self._io, self, self._root)
  elseif _on == MachO.CsBlob.Expr.OpEnum.trusted_cert then
    self.data = MachO.CsBlob.Expr.CertSlotExpr(self._io, self, self._root)
  elseif _on == MachO.CsBlob.Expr.OpEnum.and_op then
    self.data = MachO.CsBlob.Expr.AndExpr(self._io, self, self._root)
  elseif _on == MachO.CsBlob.Expr.OpEnum.cert_generic then
    self.data = MachO.CsBlob.Expr.CertGenericExpr(self._io, self, self._root)
  elseif _on == MachO.CsBlob.Expr.OpEnum.cert_field then
    self.data = MachO.CsBlob.Expr.CertFieldExpr(self._io, self, self._root)
  elseif _on == MachO.CsBlob.Expr.OpEnum.cd_hash then
    self.data = MachO.CsBlob.Data(self._io, self, self._root)
  elseif _on == MachO.CsBlob.Expr.OpEnum.apple_generic_anchor then
    self.data = MachO.CsBlob.Expr.AppleGenericAnchorExpr(self._io, self, self._root)
  end
end


MachO.CsBlob.Expr.InfoKeyFieldExpr = class.class(KaitaiStruct)

function MachO.CsBlob.Expr.InfoKeyFieldExpr:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function MachO.CsBlob.Expr.InfoKeyFieldExpr:_read()
  self.data = MachO.CsBlob.Data(self._io, self, self._root)
  self.match = MachO.CsBlob.Match(self._io, self, self._root)
end


MachO.CsBlob.Expr.CertSlotExpr = class.class(KaitaiStruct)

function MachO.CsBlob.Expr.CertSlotExpr:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function MachO.CsBlob.Expr.CertSlotExpr:_read()
  self.value = MachO.CsBlob.Expr.CertSlot(self._io:read_u4be())
end


MachO.CsBlob.Expr.CertGenericExpr = class.class(KaitaiStruct)

function MachO.CsBlob.Expr.CertGenericExpr:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function MachO.CsBlob.Expr.CertGenericExpr:_read()
  self.cert_slot = MachO.CsBlob.Expr.CertSlot(self._io:read_u4be())
  self.data = MachO.CsBlob.Data(self._io, self, self._root)
  self.match = MachO.CsBlob.Match(self._io, self, self._root)
end


MachO.CsBlob.Expr.IdentExpr = class.class(KaitaiStruct)

function MachO.CsBlob.Expr.IdentExpr:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function MachO.CsBlob.Expr.IdentExpr:_read()
  self.identifier = MachO.CsBlob.Data(self._io, self, self._root)
end


MachO.CsBlob.Expr.CertFieldExpr = class.class(KaitaiStruct)

function MachO.CsBlob.Expr.CertFieldExpr:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function MachO.CsBlob.Expr.CertFieldExpr:_read()
  self.cert_slot = MachO.CsBlob.Expr.CertSlot(self._io:read_u4be())
  self.data = MachO.CsBlob.Data(self._io, self, self._root)
  self.match = MachO.CsBlob.Match(self._io, self, self._root)
end


MachO.CsBlob.Expr.AnchorHashExpr = class.class(KaitaiStruct)

function MachO.CsBlob.Expr.AnchorHashExpr:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function MachO.CsBlob.Expr.AnchorHashExpr:_read()
  self.cert_slot = MachO.CsBlob.Expr.CertSlot(self._io:read_u4be())
  self.data = MachO.CsBlob.Data(self._io, self, self._root)
end


MachO.CsBlob.Expr.AppleGenericAnchorExpr = class.class(KaitaiStruct)

function MachO.CsBlob.Expr.AppleGenericAnchorExpr:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function MachO.CsBlob.Expr.AppleGenericAnchorExpr:_read()
end

MachO.CsBlob.Expr.AppleGenericAnchorExpr.property.value = {}
function MachO.CsBlob.Expr.AppleGenericAnchorExpr.property.value:get()
  if self._m_value ~= nil then
    return self._m_value
  end

  self._m_value = "anchor apple generic"
  return self._m_value
end


MachO.CsBlob.Expr.EntitlementFieldExpr = class.class(KaitaiStruct)

function MachO.CsBlob.Expr.EntitlementFieldExpr:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function MachO.CsBlob.Expr.EntitlementFieldExpr:_read()
  self.data = MachO.CsBlob.Data(self._io, self, self._root)
  self.match = MachO.CsBlob.Match(self._io, self, self._root)
end


MachO.CsBlob.Expr.AndExpr = class.class(KaitaiStruct)

function MachO.CsBlob.Expr.AndExpr:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function MachO.CsBlob.Expr.AndExpr:_read()
  self.left = MachO.CsBlob.Expr(self._io, self, self._root)
  self.right = MachO.CsBlob.Expr(self._io, self, self._root)
end


MachO.CsBlob.Expr.OrExpr = class.class(KaitaiStruct)

function MachO.CsBlob.Expr.OrExpr:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function MachO.CsBlob.Expr.OrExpr:_read()
  self.left = MachO.CsBlob.Expr(self._io, self, self._root)
  self.right = MachO.CsBlob.Expr(self._io, self, self._root)
end


MachO.CsBlob.BlobIndex = class.class(KaitaiStruct)

MachO.CsBlob.BlobIndex.CsslotType = enum.Enum {
  code_directory = 0,
  info_slot = 1,
  requirements = 2,
  resource_dir = 3,
  application = 4,
  entitlements = 5,
  der_entitlements = 7,
  alternate_code_directories = 4096,
  signature_slot = 65536,
}

function MachO.CsBlob.BlobIndex:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function MachO.CsBlob.BlobIndex:_read()
  self.type = MachO.CsBlob.BlobIndex.CsslotType(self._io:read_u4be())
  self.offset = self._io:read_u4be()
end

MachO.CsBlob.BlobIndex.property.blob = {}
function MachO.CsBlob.BlobIndex.property.blob:get()
  if self._m_blob ~= nil then
    return self._m_blob
  end

  local _io = self._parent._io
  local _pos = _io:pos()
  _io:seek((self.offset - 8))
  self._raw__m_blob = _io:read_bytes_full()
  local _io = KaitaiStream(stringstream(self._raw__m_blob))
  self._m_blob = MachO.CsBlob(_io, self, self._root)
  _io:seek(_pos)
  return self._m_blob
end


MachO.CsBlob.Match = class.class(KaitaiStruct)

MachO.CsBlob.Match.Op = enum.Enum {
  exists = 0,
  equal = 1,
  contains = 2,
  begins_with = 3,
  ends_with = 4,
  less_than = 5,
  greater_than = 6,
  less_equal = 7,
  greater_equal = 8,
}

function MachO.CsBlob.Match:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function MachO.CsBlob.Match:_read()
  self.match_op = MachO.CsBlob.Match.Op(self._io:read_u4be())
  if self.match_op ~= MachO.CsBlob.Match.Op.exists then
    self.data = MachO.CsBlob.Data(self._io, self, self._root)
  end
end


MachO.CsBlob.Requirement = class.class(KaitaiStruct)

function MachO.CsBlob.Requirement:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function MachO.CsBlob.Requirement:_read()
  self.kind = self._io:read_u4be()
  self.expr = MachO.CsBlob.Expr(self._io, self, self._root)
end


MachO.CsBlob.Requirements = class.class(KaitaiStruct)

function MachO.CsBlob.Requirements:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function MachO.CsBlob.Requirements:_read()
  self.count = self._io:read_u4be()
  self.items = {}
  for i = 0, self.count - 1 do
    self.items[i + 1] = MachO.CsBlob.RequirementsBlobIndex(self._io, self, self._root)
  end
end


MachO.CsBlob.BlobWrapper = class.class(KaitaiStruct)

function MachO.CsBlob.BlobWrapper:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function MachO.CsBlob.BlobWrapper:_read()
  self.data = self._io:read_bytes_full()
end


MachO.CsBlob.Entitlements = class.class(KaitaiStruct)

function MachO.CsBlob.Entitlements:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function MachO.CsBlob.Entitlements:_read()
  self.data = self._io:read_bytes_full()
end


MachO.CsBlob.RequirementsBlobIndex = class.class(KaitaiStruct)

MachO.CsBlob.RequirementsBlobIndex.RequirementType = enum.Enum {
  host = 1,
  guest = 2,
  designated = 3,
  library = 4,
}

function MachO.CsBlob.RequirementsBlobIndex:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function MachO.CsBlob.RequirementsBlobIndex:_read()
  self.type = MachO.CsBlob.RequirementsBlobIndex.RequirementType(self._io:read_u4be())
  self.offset = self._io:read_u4be()
end

MachO.CsBlob.RequirementsBlobIndex.property.value = {}
function MachO.CsBlob.RequirementsBlobIndex.property.value:get()
  if self._m_value ~= nil then
    return self._m_value
  end

  local _pos = self._io:pos()
  self._io:seek((self.offset - 8))
  self._m_value = MachO.CsBlob(self._io, self, self._root)
  self._io:seek(_pos)
  return self._m_value
end


MachO.BuildVersionCommand = class.class(KaitaiStruct)

function MachO.BuildVersionCommand:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function MachO.BuildVersionCommand:_read()
  self.platform = self._io:read_u4le()
  self.minos = self._io:read_u4le()
  self.sdk = self._io:read_u4le()
  self.ntools = self._io:read_u4le()
  self.tools = {}
  for i = 0, self.ntools - 1 do
    self.tools[i + 1] = MachO.BuildVersionCommand.BuildToolVersion(self._io, self, self._root)
  end
end


MachO.BuildVersionCommand.BuildToolVersion = class.class(KaitaiStruct)

function MachO.BuildVersionCommand.BuildToolVersion:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function MachO.BuildVersionCommand.BuildToolVersion:_read()
  self.tool = self._io:read_u4le()
  self.version = self._io:read_u4le()
end


MachO.RoutinesCommand = class.class(KaitaiStruct)

function MachO.RoutinesCommand:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function MachO.RoutinesCommand:_read()
  self.init_address = self._io:read_u4le()
  self.init_module = self._io:read_u4le()
  self.reserved = self._io:read_bytes(24)
end


MachO.MachoFlags = class.class(KaitaiStruct)

function MachO.MachoFlags:_init(value, io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self.value = value
  self:_read()
end

function MachO.MachoFlags:_read()
end

-- 
-- safe to divide up the sections into sub-sections via symbols for dead code stripping.
MachO.MachoFlags.property.subsections_via_symbols = {}
function MachO.MachoFlags.property.subsections_via_symbols:get()
  if self._m_subsections_via_symbols ~= nil then
    return self._m_subsections_via_symbols
  end

  self._m_subsections_via_symbols = (self.value & 8192) ~= 0
  return self._m_subsections_via_symbols
end

MachO.MachoFlags.property.dead_strippable_dylib = {}
function MachO.MachoFlags.property.dead_strippable_dylib:get()
  if self._m_dead_strippable_dylib ~= nil then
    return self._m_dead_strippable_dylib
  end

  self._m_dead_strippable_dylib = (self.value & 4194304) ~= 0
  return self._m_dead_strippable_dylib
end

-- 
-- the final linked image contains external weak symbols.
MachO.MachoFlags.property.weak_defines = {}
function MachO.MachoFlags.property.weak_defines:get()
  if self._m_weak_defines ~= nil then
    return self._m_weak_defines
  end

  self._m_weak_defines = (self.value & 32768) ~= 0
  return self._m_weak_defines
end

-- 
-- the file has its dynamic undefined references prebound.
MachO.MachoFlags.property.prebound = {}
function MachO.MachoFlags.property.prebound:get()
  if self._m_prebound ~= nil then
    return self._m_prebound
  end

  self._m_prebound = (self.value & 16) ~= 0
  return self._m_prebound
end

-- 
-- indicates that this binary binds to all two-level namespace modules of its dependent libraries. only used when MH_PREBINDABLE and MH_TWOLEVEL are both set.
MachO.MachoFlags.property.all_mods_bound = {}
function MachO.MachoFlags.property.all_mods_bound:get()
  if self._m_all_mods_bound ~= nil then
    return self._m_all_mods_bound
  end

  self._m_all_mods_bound = (self.value & 4096) ~= 0
  return self._m_all_mods_bound
end

MachO.MachoFlags.property.has_tlv_descriptors = {}
function MachO.MachoFlags.property.has_tlv_descriptors:get()
  if self._m_has_tlv_descriptors ~= nil then
    return self._m_has_tlv_descriptors
  end

  self._m_has_tlv_descriptors = (self.value & 8388608) ~= 0
  return self._m_has_tlv_descriptors
end

-- 
-- the executable is forcing all images to use flat name space bindings.
MachO.MachoFlags.property.force_flat = {}
function MachO.MachoFlags.property.force_flat:get()
  if self._m_force_flat ~= nil then
    return self._m_force_flat
  end

  self._m_force_flat = (self.value & 256) ~= 0
  return self._m_force_flat
end

-- 
-- When this bit is set, the binary declares it is safe for use in processes with uid zero.
MachO.MachoFlags.property.root_safe = {}
function MachO.MachoFlags.property.root_safe:get()
  if self._m_root_safe ~= nil then
    return self._m_root_safe
  end

  self._m_root_safe = (self.value & 262144) ~= 0
  return self._m_root_safe
end

-- 
-- the object file has no undefined references.
MachO.MachoFlags.property.no_undefs = {}
function MachO.MachoFlags.property.no_undefs:get()
  if self._m_no_undefs ~= nil then
    return self._m_no_undefs
  end

  self._m_no_undefs = (self.value & 1) ~= 0
  return self._m_no_undefs
end

-- 
-- When this bit is set, the binary declares it is safe for use in processes when issetugid() is true.
MachO.MachoFlags.property.setuid_safe = {}
function MachO.MachoFlags.property.setuid_safe:get()
  if self._m_setuid_safe ~= nil then
    return self._m_setuid_safe
  end

  self._m_setuid_safe = (self.value & 524288) ~= 0
  return self._m_setuid_safe
end

MachO.MachoFlags.property.no_heap_execution = {}
function MachO.MachoFlags.property.no_heap_execution:get()
  if self._m_no_heap_execution ~= nil then
    return self._m_no_heap_execution
  end

  self._m_no_heap_execution = (self.value & 16777216) ~= 0
  return self._m_no_heap_execution
end

-- 
-- When this bit is set on a dylib, the static linker does not need to examine dependent dylibs to see if any are re-exported.
MachO.MachoFlags.property.no_reexported_dylibs = {}
function MachO.MachoFlags.property.no_reexported_dylibs:get()
  if self._m_no_reexported_dylibs ~= nil then
    return self._m_no_reexported_dylibs
  end

  self._m_no_reexported_dylibs = (self.value & 1048576) ~= 0
  return self._m_no_reexported_dylibs
end

-- 
-- this umbrella guarantees no multiple defintions of symbols in its sub-images so the two-level namespace hints can always be used.
MachO.MachoFlags.property.no_multi_defs = {}
function MachO.MachoFlags.property.no_multi_defs:get()
  if self._m_no_multi_defs ~= nil then
    return self._m_no_multi_defs
  end

  self._m_no_multi_defs = (self.value & 512) ~= 0
  return self._m_no_multi_defs
end

MachO.MachoFlags.property.app_extension_safe = {}
function MachO.MachoFlags.property.app_extension_safe:get()
  if self._m_app_extension_safe ~= nil then
    return self._m_app_extension_safe
  end

  self._m_app_extension_safe = (self.value & 33554432) ~= 0
  return self._m_app_extension_safe
end

-- 
-- the binary is not prebound but can have its prebinding redone. only used when MH_PREBOUND is not set.
MachO.MachoFlags.property.prebindable = {}
function MachO.MachoFlags.property.prebindable:get()
  if self._m_prebindable ~= nil then
    return self._m_prebindable
  end

  self._m_prebindable = (self.value & 2048) ~= 0
  return self._m_prebindable
end

-- 
-- the object file is the output of an incremental link against a base file and can't be link edited again.
MachO.MachoFlags.property.incr_link = {}
function MachO.MachoFlags.property.incr_link:get()
  if self._m_incr_link ~= nil then
    return self._m_incr_link
  end

  self._m_incr_link = (self.value & 2) ~= 0
  return self._m_incr_link
end

-- 
-- the object file's undefined references are bound by the dynamic linker when loaded.
MachO.MachoFlags.property.bind_at_load = {}
function MachO.MachoFlags.property.bind_at_load:get()
  if self._m_bind_at_load ~= nil then
    return self._m_bind_at_load
  end

  self._m_bind_at_load = (self.value & 8) ~= 0
  return self._m_bind_at_load
end

-- 
-- the binary has been canonicalized via the unprebind operation.
MachO.MachoFlags.property.canonical = {}
function MachO.MachoFlags.property.canonical:get()
  if self._m_canonical ~= nil then
    return self._m_canonical
  end

  self._m_canonical = (self.value & 16384) ~= 0
  return self._m_canonical
end

-- 
-- the image is using two-level name space bindings.
MachO.MachoFlags.property.two_level = {}
function MachO.MachoFlags.property.two_level:get()
  if self._m_two_level ~= nil then
    return self._m_two_level
  end

  self._m_two_level = (self.value & 128) ~= 0
  return self._m_two_level
end

-- 
-- the file has its read-only and read-write segments split.
MachO.MachoFlags.property.split_segs = {}
function MachO.MachoFlags.property.split_segs:get()
  if self._m_split_segs ~= nil then
    return self._m_split_segs
  end

  self._m_split_segs = (self.value & 32) ~= 0
  return self._m_split_segs
end

-- 
-- the shared library init routine is to be run lazily via catching memory faults to its writeable segments (obsolete).
MachO.MachoFlags.property.lazy_init = {}
function MachO.MachoFlags.property.lazy_init:get()
  if self._m_lazy_init ~= nil then
    return self._m_lazy_init
  end

  self._m_lazy_init = (self.value & 64) ~= 0
  return self._m_lazy_init
end

-- 
-- When this bit is set, all stacks in the task will be given stack execution privilege.  Only used in MH_EXECUTE filetypes.
MachO.MachoFlags.property.allow_stack_execution = {}
function MachO.MachoFlags.property.allow_stack_execution:get()
  if self._m_allow_stack_execution ~= nil then
    return self._m_allow_stack_execution
  end

  self._m_allow_stack_execution = (self.value & 131072) ~= 0
  return self._m_allow_stack_execution
end

-- 
-- the final linked image uses weak symbols.
MachO.MachoFlags.property.binds_to_weak = {}
function MachO.MachoFlags.property.binds_to_weak:get()
  if self._m_binds_to_weak ~= nil then
    return self._m_binds_to_weak
  end

  self._m_binds_to_weak = (self.value & 65536) ~= 0
  return self._m_binds_to_weak
end

-- 
-- do not have dyld notify the prebinding agent about this executable.
MachO.MachoFlags.property.no_fix_prebinding = {}
function MachO.MachoFlags.property.no_fix_prebinding:get()
  if self._m_no_fix_prebinding ~= nil then
    return self._m_no_fix_prebinding
  end

  self._m_no_fix_prebinding = (self.value & 1024) ~= 0
  return self._m_no_fix_prebinding
end

-- 
-- the object file is input for the dynamic linker and can't be staticly link edited again.
MachO.MachoFlags.property.dyld_link = {}
function MachO.MachoFlags.property.dyld_link:get()
  if self._m_dyld_link ~= nil then
    return self._m_dyld_link
  end

  self._m_dyld_link = (self.value & 4) ~= 0
  return self._m_dyld_link
end

-- 
-- When this bit is set, the OS will load the main executable at a random address. Only used in MH_EXECUTE filetypes.
MachO.MachoFlags.property.pie = {}
function MachO.MachoFlags.property.pie:get()
  if self._m_pie ~= nil then
    return self._m_pie
  end

  self._m_pie = (self.value & 2097152) ~= 0
  return self._m_pie
end


MachO.RoutinesCommand64 = class.class(KaitaiStruct)

function MachO.RoutinesCommand64:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function MachO.RoutinesCommand64:_read()
  self.init_address = self._io:read_u8le()
  self.init_module = self._io:read_u8le()
  self.reserved = self._io:read_bytes(48)
end


MachO.LinkerOptionCommand = class.class(KaitaiStruct)

function MachO.LinkerOptionCommand:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function MachO.LinkerOptionCommand:_read()
  self.num_strings = self._io:read_u4le()
  self.strings = {}
  for i = 0, self.num_strings - 1 do
    self.strings[i + 1] = str_decode.decode(self._io:read_bytes_term(0, false, true, true), "utf-8")
  end
end


MachO.SegmentCommand64 = class.class(KaitaiStruct)

function MachO.SegmentCommand64:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function MachO.SegmentCommand64:_read()
  self.segname = str_decode.decode(KaitaiStream.bytes_strip_right(self._io:read_bytes(16), 0), "ascii")
  self.vmaddr = self._io:read_u8le()
  self.vmsize = self._io:read_u8le()
  self.fileoff = self._io:read_u8le()
  self.filesize = self._io:read_u8le()
  self.maxprot = MachO.VmProt(self._io, self, self._root)
  self.initprot = MachO.VmProt(self._io, self, self._root)
  self.nsects = self._io:read_u4le()
  self.flags = self._io:read_u4le()
  self.sections = {}
  for i = 0, self.nsects - 1 do
    self.sections[i + 1] = MachO.SegmentCommand64.Section64(self._io, self, self._root)
  end
end


MachO.SegmentCommand64.Section64 = class.class(KaitaiStruct)

function MachO.SegmentCommand64.Section64:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function MachO.SegmentCommand64.Section64:_read()
  self.sect_name = str_decode.decode(KaitaiStream.bytes_strip_right(self._io:read_bytes(16), 0), "ascii")
  self.seg_name = str_decode.decode(KaitaiStream.bytes_strip_right(self._io:read_bytes(16), 0), "ascii")
  self.addr = self._io:read_u8le()
  self.size = self._io:read_u8le()
  self.offset = self._io:read_u4le()
  self.align = self._io:read_u4le()
  self.reloff = self._io:read_u4le()
  self.nreloc = self._io:read_u4le()
  self.flags = self._io:read_u4le()
  self.reserved1 = self._io:read_u4le()
  self.reserved2 = self._io:read_u4le()
  self.reserved3 = self._io:read_u4le()
end

MachO.SegmentCommand64.Section64.property.data = {}
function MachO.SegmentCommand64.Section64.property.data:get()
  if self._m_data ~= nil then
    return self._m_data
  end

  local _io = self._root._io
  local _pos = _io:pos()
  _io:seek(self.offset)
  local _on = self.sect_name
  if _on == "__objc_nlclslist" then
    self._raw__m_data = _io:read_bytes(self.size)
    local _io = KaitaiStream(stringstream(self._raw__m_data))
    self._m_data = MachO.SegmentCommand64.Section64.PointerList(_io, self, self._root)
  elseif _on == "__objc_methname" then
    self._raw__m_data = _io:read_bytes(self.size)
    local _io = KaitaiStream(stringstream(self._raw__m_data))
    self._m_data = MachO.SegmentCommand64.Section64.StringList(_io, self, self._root)
  elseif _on == "__nl_symbol_ptr" then
    self._raw__m_data = _io:read_bytes(self.size)
    local _io = KaitaiStream(stringstream(self._raw__m_data))
    self._m_data = MachO.SegmentCommand64.Section64.PointerList(_io, self, self._root)
  elseif _on == "__la_symbol_ptr" then
    self._raw__m_data = _io:read_bytes(self.size)
    local _io = KaitaiStream(stringstream(self._raw__m_data))
    self._m_data = MachO.SegmentCommand64.Section64.PointerList(_io, self, self._root)
  elseif _on == "__objc_selrefs" then
    self._raw__m_data = _io:read_bytes(self.size)
    local _io = KaitaiStream(stringstream(self._raw__m_data))
    self._m_data = MachO.SegmentCommand64.Section64.PointerList(_io, self, self._root)
  elseif _on == "__cstring" then
    self._raw__m_data = _io:read_bytes(self.size)
    local _io = KaitaiStream(stringstream(self._raw__m_data))
    self._m_data = MachO.SegmentCommand64.Section64.StringList(_io, self, self._root)
  elseif _on == "__objc_classlist" then
    self._raw__m_data = _io:read_bytes(self.size)
    local _io = KaitaiStream(stringstream(self._raw__m_data))
    self._m_data = MachO.SegmentCommand64.Section64.PointerList(_io, self, self._root)
  elseif _on == "__objc_protolist" then
    self._raw__m_data = _io:read_bytes(self.size)
    local _io = KaitaiStream(stringstream(self._raw__m_data))
    self._m_data = MachO.SegmentCommand64.Section64.PointerList(_io, self, self._root)
  elseif _on == "__objc_imageinfo" then
    self._raw__m_data = _io:read_bytes(self.size)
    local _io = KaitaiStream(stringstream(self._raw__m_data))
    self._m_data = MachO.SegmentCommand64.Section64.PointerList(_io, self, self._root)
  elseif _on == "__objc_methtype" then
    self._raw__m_data = _io:read_bytes(self.size)
    local _io = KaitaiStream(stringstream(self._raw__m_data))
    self._m_data = MachO.SegmentCommand64.Section64.StringList(_io, self, self._root)
  elseif _on == "__cfstring" then
    self._raw__m_data = _io:read_bytes(self.size)
    local _io = KaitaiStream(stringstream(self._raw__m_data))
    self._m_data = MachO.SegmentCommand64.Section64.CfStringList(_io, self, self._root)
  elseif _on == "__objc_classrefs" then
    self._raw__m_data = _io:read_bytes(self.size)
    local _io = KaitaiStream(stringstream(self._raw__m_data))
    self._m_data = MachO.SegmentCommand64.Section64.PointerList(_io, self, self._root)
  elseif _on == "__objc_protorefs" then
    self._raw__m_data = _io:read_bytes(self.size)
    local _io = KaitaiStream(stringstream(self._raw__m_data))
    self._m_data = MachO.SegmentCommand64.Section64.PointerList(_io, self, self._root)
  elseif _on == "__objc_classname" then
    self._raw__m_data = _io:read_bytes(self.size)
    local _io = KaitaiStream(stringstream(self._raw__m_data))
    self._m_data = MachO.SegmentCommand64.Section64.StringList(_io, self, self._root)
  elseif _on == "__got" then
    self._raw__m_data = _io:read_bytes(self.size)
    local _io = KaitaiStream(stringstream(self._raw__m_data))
    self._m_data = MachO.SegmentCommand64.Section64.PointerList(_io, self, self._root)
  elseif _on == "__eh_frame" then
    self._raw__m_data = _io:read_bytes(self.size)
    local _io = KaitaiStream(stringstream(self._raw__m_data))
    self._m_data = MachO.SegmentCommand64.Section64.EhFrame(_io, self, self._root)
  elseif _on == "__objc_superrefs" then
    self._raw__m_data = _io:read_bytes(self.size)
    local _io = KaitaiStream(stringstream(self._raw__m_data))
    self._m_data = MachO.SegmentCommand64.Section64.PointerList(_io, self, self._root)
  else
    self._m_data = _io:read_bytes(self.size)
  end
  _io:seek(_pos)
  return self._m_data
end


MachO.SegmentCommand64.Section64.CfStringList = class.class(KaitaiStruct)

function MachO.SegmentCommand64.Section64.CfStringList:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function MachO.SegmentCommand64.Section64.CfStringList:_read()
  self.items = {}
  local i = 0
  while not self._io:is_eof() do
    self.items[i + 1] = MachO.SegmentCommand64.Section64.CfString(self._io, self, self._root)
    i = i + 1
  end
end


MachO.SegmentCommand64.Section64.CfString = class.class(KaitaiStruct)

function MachO.SegmentCommand64.Section64.CfString:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function MachO.SegmentCommand64.Section64.CfString:_read()
  self.isa = self._io:read_u8le()
  self.info = self._io:read_u8le()
  self.data = self._io:read_u8le()
  self.length = self._io:read_u8le()
end


MachO.SegmentCommand64.Section64.EhFrameItem = class.class(KaitaiStruct)

function MachO.SegmentCommand64.Section64.EhFrameItem:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function MachO.SegmentCommand64.Section64.EhFrameItem:_read()
  self.length = self._io:read_u4le()
  if self.length == 4294967295 then
    self.length64 = self._io:read_u8le()
  end
  self.id = self._io:read_u4le()
  if self.length > 0 then
    local _on = self.id
    if _on == 0 then
      self._raw_body = self._io:read_bytes((self.length - 4))
      local _io = KaitaiStream(stringstream(self._raw_body))
      self.body = MachO.SegmentCommand64.Section64.EhFrameItem.Cie(_io, self, self._root)
    else
      self.body = self._io:read_bytes((self.length - 4))
    end
  end
end


MachO.SegmentCommand64.Section64.EhFrameItem.CharChain = class.class(KaitaiStruct)

function MachO.SegmentCommand64.Section64.EhFrameItem.CharChain:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function MachO.SegmentCommand64.Section64.EhFrameItem.CharChain:_read()
  self.chr = self._io:read_u1()
  if self.chr ~= 0 then
    self.next = MachO.SegmentCommand64.Section64.EhFrameItem.CharChain(self._io, self, self._root)
  end
end


MachO.SegmentCommand64.Section64.EhFrameItem.Cie = class.class(KaitaiStruct)

function MachO.SegmentCommand64.Section64.EhFrameItem.Cie:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function MachO.SegmentCommand64.Section64.EhFrameItem.Cie:_read()
  self.version = self._io:read_u1()
  self.aug_str = MachO.SegmentCommand64.Section64.EhFrameItem.CharChain(self._io, self, self._root)
  self.code_alignment_factor = MachO.Uleb128(self._io, self, self._root)
  self.data_alignment_factor = MachO.Uleb128(self._io, self, self._root)
  self.return_address_register = self._io:read_u1()
  if self.aug_str.chr == 122 then
    self.augmentation = MachO.SegmentCommand64.Section64.EhFrameItem.AugmentationEntry(self._io, self, self._root)
  end
end


MachO.SegmentCommand64.Section64.EhFrameItem.AugmentationEntry = class.class(KaitaiStruct)

function MachO.SegmentCommand64.Section64.EhFrameItem.AugmentationEntry:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function MachO.SegmentCommand64.Section64.EhFrameItem.AugmentationEntry:_read()
  self.length = MachO.Uleb128(self._io, self, self._root)
  if self._parent.aug_str.next.chr == 82 then
    self.fde_pointer_encoding = self._io:read_u1()
  end
end


MachO.SegmentCommand64.Section64.EhFrame = class.class(KaitaiStruct)

function MachO.SegmentCommand64.Section64.EhFrame:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function MachO.SegmentCommand64.Section64.EhFrame:_read()
  self.items = {}
  local i = 0
  while not self._io:is_eof() do
    self.items[i + 1] = MachO.SegmentCommand64.Section64.EhFrameItem(self._io, self, self._root)
    i = i + 1
  end
end


MachO.SegmentCommand64.Section64.PointerList = class.class(KaitaiStruct)

function MachO.SegmentCommand64.Section64.PointerList:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function MachO.SegmentCommand64.Section64.PointerList:_read()
  self.items = {}
  local i = 0
  while not self._io:is_eof() do
    self.items[i + 1] = self._io:read_u8le()
    i = i + 1
  end
end


MachO.SegmentCommand64.Section64.StringList = class.class(KaitaiStruct)

function MachO.SegmentCommand64.Section64.StringList:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function MachO.SegmentCommand64.Section64.StringList:_read()
  self.strings = {}
  local i = 0
  while not self._io:is_eof() do
    self.strings[i + 1] = str_decode.decode(self._io:read_bytes_term(0, false, true, true), "ascii")
    i = i + 1
  end
end


MachO.VmProt = class.class(KaitaiStruct)

function MachO.VmProt:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function MachO.VmProt:_read()
  self.strip_read = self._io:read_bits_int_be(1) ~= 0
  self.is_mask = self._io:read_bits_int_be(1) ~= 0
  self.reserved0 = self._io:read_bits_int_be(1) ~= 0
  self.copy = self._io:read_bits_int_be(1) ~= 0
  self.no_change = self._io:read_bits_int_be(1) ~= 0
  self.execute = self._io:read_bits_int_be(1) ~= 0
  self.write = self._io:read_bits_int_be(1) ~= 0
  self.read = self._io:read_bits_int_be(1) ~= 0
  self.reserved1 = self._io:read_bits_int_be(24)
end

-- 
-- Special marker to support execute-only protection.
-- 
-- Indicates to use value as a mask against the actual protection bits.
-- 
-- Reserved (unused) bit.
-- 
-- Used when write permission can not be obtained, to mark the entry as COW.
-- 
-- Used only by memory_object_lock_request to indicate no change to page locks.
-- 
-- Execute permission.
-- 
-- Write permission.
-- 
-- Read permission.
-- 
-- Reserved (unused) bits.

MachO.DysymtabCommand = class.class(KaitaiStruct)

function MachO.DysymtabCommand:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function MachO.DysymtabCommand:_read()
  self.i_local_sym = self._io:read_u4le()
  self.n_local_sym = self._io:read_u4le()
  self.i_ext_def_sym = self._io:read_u4le()
  self.n_ext_def_sym = self._io:read_u4le()
  self.i_undef_sym = self._io:read_u4le()
  self.n_undef_sym = self._io:read_u4le()
  self.toc_off = self._io:read_u4le()
  self.n_toc = self._io:read_u4le()
  self.mod_tab_off = self._io:read_u4le()
  self.n_mod_tab = self._io:read_u4le()
  self.ext_ref_sym_off = self._io:read_u4le()
  self.n_ext_ref_syms = self._io:read_u4le()
  self.indirect_sym_off = self._io:read_u4le()
  self.n_indirect_syms = self._io:read_u4le()
  self.ext_rel_off = self._io:read_u4le()
  self.n_ext_rel = self._io:read_u4le()
  self.loc_rel_off = self._io:read_u4le()
  self.n_loc_rel = self._io:read_u4le()
end

MachO.DysymtabCommand.property.indirect_symbols = {}
function MachO.DysymtabCommand.property.indirect_symbols:get()
  if self._m_indirect_symbols ~= nil then
    return self._m_indirect_symbols
  end

  local _io = self._root._io
  local _pos = _io:pos()
  _io:seek(self.indirect_sym_off)
  self._m_indirect_symbols = {}
  for i = 0, self.n_indirect_syms - 1 do
    self._m_indirect_symbols[i + 1] = _io:read_u4le()
  end
  _io:seek(_pos)
  return self._m_indirect_symbols
end


MachO.MachHeader = class.class(KaitaiStruct)

function MachO.MachHeader:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function MachO.MachHeader:_read()
  self.cputype = MachO.CpuType(self._io:read_u4le())
  self.cpusubtype = self._io:read_u4le()
  self.filetype = MachO.FileType(self._io:read_u4le())
  self.ncmds = self._io:read_u4le()
  self.sizeofcmds = self._io:read_u4le()
  self.flags = self._io:read_u4le()
  if  ((self._root.magic == MachO.MagicType.macho_be_x64) or (self._root.magic == MachO.MagicType.macho_le_x64))  then
    self.reserved = self._io:read_u4le()
  end
end

MachO.MachHeader.property.flags_obj = {}
function MachO.MachHeader.property.flags_obj:get()
  if self._m_flags_obj ~= nil then
    return self._m_flags_obj
  end

  self._m_flags_obj = MachO.MachoFlags(self.flags, self._io, self, self._root)
  return self._m_flags_obj
end


MachO.LinkeditDataCommand = class.class(KaitaiStruct)

function MachO.LinkeditDataCommand:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function MachO.LinkeditDataCommand:_read()
  self.data_off = self._io:read_u4le()
  self.data_size = self._io:read_u4le()
end


MachO.SubCommand = class.class(KaitaiStruct)

function MachO.SubCommand:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function MachO.SubCommand:_read()
  self.name = MachO.LcStr(self._io, self, self._root)
end


MachO.TwolevelHintsCommand = class.class(KaitaiStruct)

function MachO.TwolevelHintsCommand:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function MachO.TwolevelHintsCommand:_read()
  self.offset = self._io:read_u4le()
  self.num_hints = self._io:read_u4le()
end


MachO.Version = class.class(KaitaiStruct)

function MachO.Version:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function MachO.Version:_read()
  self.p1 = self._io:read_u1()
  self.minor = self._io:read_u1()
  self.major = self._io:read_u1()
  self.release = self._io:read_u1()
end


MachO.EncryptionInfoCommand = class.class(KaitaiStruct)

function MachO.EncryptionInfoCommand:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function MachO.EncryptionInfoCommand:_read()
  self.cryptoff = self._io:read_u4le()
  self.cryptsize = self._io:read_u4le()
  self.cryptid = self._io:read_u4le()
  if  ((self._root.magic == MachO.MagicType.macho_be_x64) or (self._root.magic == MachO.MagicType.macho_le_x64))  then
    self.pad = self._io:read_u4le()
  end
end


MachO.CodeSignatureCommand = class.class(KaitaiStruct)

function MachO.CodeSignatureCommand:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function MachO.CodeSignatureCommand:_read()
  self.data_off = self._io:read_u4le()
  self.data_size = self._io:read_u4le()
end

MachO.CodeSignatureCommand.property.code_signature = {}
function MachO.CodeSignatureCommand.property.code_signature:get()
  if self._m_code_signature ~= nil then
    return self._m_code_signature
  end

  local _io = self._root._io
  local _pos = _io:pos()
  _io:seek(self.data_off)
  self._raw__m_code_signature = _io:read_bytes(self.data_size)
  local _io = KaitaiStream(stringstream(self._raw__m_code_signature))
  self._m_code_signature = MachO.CsBlob(_io, self, self._root)
  _io:seek(_pos)
  return self._m_code_signature
end


MachO.DyldInfoCommand = class.class(KaitaiStruct)

MachO.DyldInfoCommand.BindOpcode = enum.Enum {
  done = 0,
  set_dylib_ordinal_immediate = 16,
  set_dylib_ordinal_uleb = 32,
  set_dylib_special_immediate = 48,
  set_symbol_trailing_flags_immediate = 64,
  set_type_immediate = 80,
  set_append_sleb = 96,
  set_segment_and_offset_uleb = 112,
  add_address_uleb = 128,
  do_bind = 144,
  do_bind_add_address_uleb = 160,
  do_bind_add_address_immediate_scaled = 176,
  do_bind_uleb_times_skipping_uleb = 192,
}

function MachO.DyldInfoCommand:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function MachO.DyldInfoCommand:_read()
  self.rebase_off = self._io:read_u4le()
  self.rebase_size = self._io:read_u4le()
  self.bind_off = self._io:read_u4le()
  self.bind_size = self._io:read_u4le()
  self.weak_bind_off = self._io:read_u4le()
  self.weak_bind_size = self._io:read_u4le()
  self.lazy_bind_off = self._io:read_u4le()
  self.lazy_bind_size = self._io:read_u4le()
  self.export_off = self._io:read_u4le()
  self.export_size = self._io:read_u4le()
end

MachO.DyldInfoCommand.property.rebase = {}
function MachO.DyldInfoCommand.property.rebase:get()
  if self._m_rebase ~= nil then
    return self._m_rebase
  end

  local _io = self._root._io
  local _pos = _io:pos()
  _io:seek(self.rebase_off)
  self._raw__m_rebase = _io:read_bytes(self.rebase_size)
  local _io = KaitaiStream(stringstream(self._raw__m_rebase))
  self._m_rebase = MachO.DyldInfoCommand.RebaseData(_io, self, self._root)
  _io:seek(_pos)
  return self._m_rebase
end

MachO.DyldInfoCommand.property.bind = {}
function MachO.DyldInfoCommand.property.bind:get()
  if self._m_bind ~= nil then
    return self._m_bind
  end

  local _io = self._root._io
  local _pos = _io:pos()
  _io:seek(self.bind_off)
  self._raw__m_bind = _io:read_bytes(self.bind_size)
  local _io = KaitaiStream(stringstream(self._raw__m_bind))
  self._m_bind = MachO.DyldInfoCommand.BindData(_io, self, self._root)
  _io:seek(_pos)
  return self._m_bind
end

MachO.DyldInfoCommand.property.lazy_bind = {}
function MachO.DyldInfoCommand.property.lazy_bind:get()
  if self._m_lazy_bind ~= nil then
    return self._m_lazy_bind
  end

  local _io = self._root._io
  local _pos = _io:pos()
  _io:seek(self.lazy_bind_off)
  self._raw__m_lazy_bind = _io:read_bytes(self.lazy_bind_size)
  local _io = KaitaiStream(stringstream(self._raw__m_lazy_bind))
  self._m_lazy_bind = MachO.DyldInfoCommand.LazyBindData(_io, self, self._root)
  _io:seek(_pos)
  return self._m_lazy_bind
end

MachO.DyldInfoCommand.property.exports = {}
function MachO.DyldInfoCommand.property.exports:get()
  if self._m_exports ~= nil then
    return self._m_exports
  end

  local _io = self._root._io
  local _pos = _io:pos()
  _io:seek(self.export_off)
  self._raw__m_exports = _io:read_bytes(self.export_size)
  local _io = KaitaiStream(stringstream(self._raw__m_exports))
  self._m_exports = MachO.DyldInfoCommand.ExportNode(_io, self, self._root)
  _io:seek(_pos)
  return self._m_exports
end


MachO.DyldInfoCommand.BindItem = class.class(KaitaiStruct)

function MachO.DyldInfoCommand.BindItem:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function MachO.DyldInfoCommand.BindItem:_read()
  self.opcode_and_immediate = self._io:read_u1()
  if  ((self.opcode == MachO.DyldInfoCommand.BindOpcode.set_dylib_ordinal_uleb) or (self.opcode == MachO.DyldInfoCommand.BindOpcode.set_append_sleb) or (self.opcode == MachO.DyldInfoCommand.BindOpcode.set_segment_and_offset_uleb) or (self.opcode == MachO.DyldInfoCommand.BindOpcode.add_address_uleb) or (self.opcode == MachO.DyldInfoCommand.BindOpcode.do_bind_add_address_uleb) or (self.opcode == MachO.DyldInfoCommand.BindOpcode.do_bind_uleb_times_skipping_uleb))  then
    self.uleb = MachO.Uleb128(self._io, self, self._root)
  end
  if self.opcode == MachO.DyldInfoCommand.BindOpcode.do_bind_uleb_times_skipping_uleb then
    self.skip = MachO.Uleb128(self._io, self, self._root)
  end
  if self.opcode == MachO.DyldInfoCommand.BindOpcode.set_symbol_trailing_flags_immediate then
    self.symbol = str_decode.decode(self._io:read_bytes_term(0, false, true, true), "ascii")
  end
end

MachO.DyldInfoCommand.BindItem.property.opcode = {}
function MachO.DyldInfoCommand.BindItem.property.opcode:get()
  if self._m_opcode ~= nil then
    return self._m_opcode
  end

  self._m_opcode = MachO.DyldInfoCommand.BindOpcode((self.opcode_and_immediate & 240))
  return self._m_opcode
end

MachO.DyldInfoCommand.BindItem.property.immediate = {}
function MachO.DyldInfoCommand.BindItem.property.immediate:get()
  if self._m_immediate ~= nil then
    return self._m_immediate
  end

  self._m_immediate = (self.opcode_and_immediate & 15)
  return self._m_immediate
end


MachO.DyldInfoCommand.RebaseData = class.class(KaitaiStruct)

MachO.DyldInfoCommand.RebaseData.Opcode = enum.Enum {
  done = 0,
  set_type_immediate = 16,
  set_segment_and_offset_uleb = 32,
  add_address_uleb = 48,
  add_address_immediate_scaled = 64,
  do_rebase_immediate_times = 80,
  do_rebase_uleb_times = 96,
  do_rebase_add_address_uleb = 112,
  do_rebase_uleb_times_skipping_uleb = 128,
}

function MachO.DyldInfoCommand.RebaseData:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function MachO.DyldInfoCommand.RebaseData:_read()
  self.items = {}
  local i = 0
  while true do
    local _ = MachO.DyldInfoCommand.RebaseData.RebaseItem(self._io, self, self._root)
    self.items[i + 1] = _
    if _.opcode == MachO.DyldInfoCommand.RebaseData.Opcode.done then
      break
    end
    i = i + 1
  end
end


MachO.DyldInfoCommand.RebaseData.RebaseItem = class.class(KaitaiStruct)

function MachO.DyldInfoCommand.RebaseData.RebaseItem:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function MachO.DyldInfoCommand.RebaseData.RebaseItem:_read()
  self.opcode_and_immediate = self._io:read_u1()
  if  ((self.opcode == MachO.DyldInfoCommand.RebaseData.Opcode.set_segment_and_offset_uleb) or (self.opcode == MachO.DyldInfoCommand.RebaseData.Opcode.add_address_uleb) or (self.opcode == MachO.DyldInfoCommand.RebaseData.Opcode.do_rebase_uleb_times) or (self.opcode == MachO.DyldInfoCommand.RebaseData.Opcode.do_rebase_add_address_uleb) or (self.opcode == MachO.DyldInfoCommand.RebaseData.Opcode.do_rebase_uleb_times_skipping_uleb))  then
    self.uleb = MachO.Uleb128(self._io, self, self._root)
  end
  if self.opcode == MachO.DyldInfoCommand.RebaseData.Opcode.do_rebase_uleb_times_skipping_uleb then
    self.skip = MachO.Uleb128(self._io, self, self._root)
  end
end

MachO.DyldInfoCommand.RebaseData.RebaseItem.property.opcode = {}
function MachO.DyldInfoCommand.RebaseData.RebaseItem.property.opcode:get()
  if self._m_opcode ~= nil then
    return self._m_opcode
  end

  self._m_opcode = MachO.DyldInfoCommand.RebaseData.Opcode((self.opcode_and_immediate & 240))
  return self._m_opcode
end

MachO.DyldInfoCommand.RebaseData.RebaseItem.property.immediate = {}
function MachO.DyldInfoCommand.RebaseData.RebaseItem.property.immediate:get()
  if self._m_immediate ~= nil then
    return self._m_immediate
  end

  self._m_immediate = (self.opcode_and_immediate & 15)
  return self._m_immediate
end


MachO.DyldInfoCommand.ExportNode = class.class(KaitaiStruct)

function MachO.DyldInfoCommand.ExportNode:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function MachO.DyldInfoCommand.ExportNode:_read()
  self.terminal_size = MachO.Uleb128(self._io, self, self._root)
  self.children_count = self._io:read_u1()
  self.children = {}
  for i = 0, self.children_count - 1 do
    self.children[i + 1] = MachO.DyldInfoCommand.ExportNode.Child(self._io, self, self._root)
  end
  self.terminal = self._io:read_bytes(self.terminal_size.value)
end


MachO.DyldInfoCommand.ExportNode.Child = class.class(KaitaiStruct)

function MachO.DyldInfoCommand.ExportNode.Child:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function MachO.DyldInfoCommand.ExportNode.Child:_read()
  self.name = str_decode.decode(self._io:read_bytes_term(0, false, true, true), "ascii")
  self.node_offset = MachO.Uleb128(self._io, self, self._root)
end

MachO.DyldInfoCommand.ExportNode.Child.property.value = {}
function MachO.DyldInfoCommand.ExportNode.Child.property.value:get()
  if self._m_value ~= nil then
    return self._m_value
  end

  local _pos = self._io:pos()
  self._io:seek(self.node_offset.value)
  self._m_value = MachO.DyldInfoCommand.ExportNode(self._io, self, self._root)
  self._io:seek(_pos)
  return self._m_value
end


MachO.DyldInfoCommand.BindData = class.class(KaitaiStruct)

function MachO.DyldInfoCommand.BindData:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function MachO.DyldInfoCommand.BindData:_read()
  self.items = {}
  local i = 0
  while true do
    local _ = MachO.DyldInfoCommand.BindItem(self._io, self, self._root)
    self.items[i + 1] = _
    if _.opcode == MachO.DyldInfoCommand.BindOpcode.done then
      break
    end
    i = i + 1
  end
end


MachO.DyldInfoCommand.LazyBindData = class.class(KaitaiStruct)

function MachO.DyldInfoCommand.LazyBindData:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function MachO.DyldInfoCommand.LazyBindData:_read()
  self.items = {}
  local i = 0
  while not self._io:is_eof() do
    self.items[i + 1] = MachO.DyldInfoCommand.BindItem(self._io, self, self._root)
    i = i + 1
  end
end


MachO.DylinkerCommand = class.class(KaitaiStruct)

function MachO.DylinkerCommand:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function MachO.DylinkerCommand:_read()
  self.name = MachO.LcStr(self._io, self, self._root)
end


MachO.DylibCommand = class.class(KaitaiStruct)

function MachO.DylibCommand:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function MachO.DylibCommand:_read()
  self.name_offset = self._io:read_u4le()
  self.timestamp = self._io:read_u4le()
  self.current_version = self._io:read_u4le()
  self.compatibility_version = self._io:read_u4le()
  self.name = str_decode.decode(self._io:read_bytes_term(0, false, true, true), "utf-8")
end


MachO.SegmentCommand = class.class(KaitaiStruct)

function MachO.SegmentCommand:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function MachO.SegmentCommand:_read()
  self.segname = str_decode.decode(KaitaiStream.bytes_strip_right(self._io:read_bytes(16), 0), "ascii")
  self.vmaddr = self._io:read_u4le()
  self.vmsize = self._io:read_u4le()
  self.fileoff = self._io:read_u4le()
  self.filesize = self._io:read_u4le()
  self.maxprot = MachO.VmProt(self._io, self, self._root)
  self.initprot = MachO.VmProt(self._io, self, self._root)
  self.nsects = self._io:read_u4le()
  self.flags = self._io:read_u4le()
  self.sections = {}
  for i = 0, self.nsects - 1 do
    self.sections[i + 1] = MachO.SegmentCommand.Section(self._io, self, self._root)
  end
end


MachO.SegmentCommand.Section = class.class(KaitaiStruct)

function MachO.SegmentCommand.Section:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function MachO.SegmentCommand.Section:_read()
  self.sect_name = str_decode.decode(KaitaiStream.bytes_strip_right(self._io:read_bytes(16), 0), "ascii")
  self.seg_name = str_decode.decode(KaitaiStream.bytes_strip_right(self._io:read_bytes(16), 0), "ascii")
  self.addr = self._io:read_u4le()
  self.size = self._io:read_u4le()
  self.offset = self._io:read_u4le()
  self.align = self._io:read_u4le()
  self.reloff = self._io:read_u4le()
  self.nreloc = self._io:read_u4le()
  self.flags = self._io:read_u4le()
  self.reserved1 = self._io:read_u4le()
  self.reserved2 = self._io:read_u4le()
end

MachO.SegmentCommand.Section.property.data = {}
function MachO.SegmentCommand.Section.property.data:get()
  if self._m_data ~= nil then
    return self._m_data
  end

  local _io = self._root._io
  local _pos = _io:pos()
  _io:seek(self.offset)
  self._m_data = _io:read_bytes(self.size)
  _io:seek(_pos)
  return self._m_data
end


MachO.LcStr = class.class(KaitaiStruct)

function MachO.LcStr:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function MachO.LcStr:_read()
  self.length = self._io:read_u4le()
  self.value = str_decode.decode(self._io:read_bytes_term(0, false, true, true), "UTF-8")
end


MachO.LoadCommand = class.class(KaitaiStruct)

function MachO.LoadCommand:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function MachO.LoadCommand:_read()
  self.type = MachO.LoadCommandType(self._io:read_u4le())
  self.size = self._io:read_u4le()
  local _on = self.type
  if _on == MachO.LoadCommandType.id_dylinker then
    self._raw_body = self._io:read_bytes((self.size - 8))
    local _io = KaitaiStream(stringstream(self._raw_body))
    self.body = MachO.DylinkerCommand(_io, self, self._root)
  elseif _on == MachO.LoadCommandType.reexport_dylib then
    self._raw_body = self._io:read_bytes((self.size - 8))
    local _io = KaitaiStream(stringstream(self._raw_body))
    self.body = MachO.DylibCommand(_io, self, self._root)
  elseif _on == MachO.LoadCommandType.build_version then
    self._raw_body = self._io:read_bytes((self.size - 8))
    local _io = KaitaiStream(stringstream(self._raw_body))
    self.body = MachO.BuildVersionCommand(_io, self, self._root)
  elseif _on == MachO.LoadCommandType.source_version then
    self._raw_body = self._io:read_bytes((self.size - 8))
    local _io = KaitaiStream(stringstream(self._raw_body))
    self.body = MachO.SourceVersionCommand(_io, self, self._root)
  elseif _on == MachO.LoadCommandType.function_starts then
    self._raw_body = self._io:read_bytes((self.size - 8))
    local _io = KaitaiStream(stringstream(self._raw_body))
    self.body = MachO.LinkeditDataCommand(_io, self, self._root)
  elseif _on == MachO.LoadCommandType.rpath then
    self._raw_body = self._io:read_bytes((self.size - 8))
    local _io = KaitaiStream(stringstream(self._raw_body))
    self.body = MachO.RpathCommand(_io, self, self._root)
  elseif _on == MachO.LoadCommandType.sub_framework then
    self._raw_body = self._io:read_bytes((self.size - 8))
    local _io = KaitaiStream(stringstream(self._raw_body))
    self.body = MachO.SubCommand(_io, self, self._root)
  elseif _on == MachO.LoadCommandType.routines then
    self._raw_body = self._io:read_bytes((self.size - 8))
    local _io = KaitaiStream(stringstream(self._raw_body))
    self.body = MachO.RoutinesCommand(_io, self, self._root)
  elseif _on == MachO.LoadCommandType.sub_library then
    self._raw_body = self._io:read_bytes((self.size - 8))
    local _io = KaitaiStream(stringstream(self._raw_body))
    self.body = MachO.SubCommand(_io, self, self._root)
  elseif _on == MachO.LoadCommandType.dyld_info_only then
    self._raw_body = self._io:read_bytes((self.size - 8))
    local _io = KaitaiStream(stringstream(self._raw_body))
    self.body = MachO.DyldInfoCommand(_io, self, self._root)
  elseif _on == MachO.LoadCommandType.dyld_environment then
    self._raw_body = self._io:read_bytes((self.size - 8))
    local _io = KaitaiStream(stringstream(self._raw_body))
    self.body = MachO.DylinkerCommand(_io, self, self._root)
  elseif _on == MachO.LoadCommandType.load_dylinker then
    self._raw_body = self._io:read_bytes((self.size - 8))
    local _io = KaitaiStream(stringstream(self._raw_body))
    self.body = MachO.DylinkerCommand(_io, self, self._root)
  elseif _on == MachO.LoadCommandType.segment_split_info then
    self._raw_body = self._io:read_bytes((self.size - 8))
    local _io = KaitaiStream(stringstream(self._raw_body))
    self.body = MachO.LinkeditDataCommand(_io, self, self._root)
  elseif _on == MachO.LoadCommandType.main then
    self._raw_body = self._io:read_bytes((self.size - 8))
    local _io = KaitaiStream(stringstream(self._raw_body))
    self.body = MachO.EntryPointCommand(_io, self, self._root)
  elseif _on == MachO.LoadCommandType.load_dylib then
    self._raw_body = self._io:read_bytes((self.size - 8))
    local _io = KaitaiStream(stringstream(self._raw_body))
    self.body = MachO.DylibCommand(_io, self, self._root)
  elseif _on == MachO.LoadCommandType.encryption_info then
    self._raw_body = self._io:read_bytes((self.size - 8))
    local _io = KaitaiStream(stringstream(self._raw_body))
    self.body = MachO.EncryptionInfoCommand(_io, self, self._root)
  elseif _on == MachO.LoadCommandType.dysymtab then
    self._raw_body = self._io:read_bytes((self.size - 8))
    local _io = KaitaiStream(stringstream(self._raw_body))
    self.body = MachO.DysymtabCommand(_io, self, self._root)
  elseif _on == MachO.LoadCommandType.twolevel_hints then
    self._raw_body = self._io:read_bytes((self.size - 8))
    local _io = KaitaiStream(stringstream(self._raw_body))
    self.body = MachO.TwolevelHintsCommand(_io, self, self._root)
  elseif _on == MachO.LoadCommandType.encryption_info_64 then
    self._raw_body = self._io:read_bytes((self.size - 8))
    local _io = KaitaiStream(stringstream(self._raw_body))
    self.body = MachO.EncryptionInfoCommand(_io, self, self._root)
  elseif _on == MachO.LoadCommandType.linker_option then
    self._raw_body = self._io:read_bytes((self.size - 8))
    local _io = KaitaiStream(stringstream(self._raw_body))
    self.body = MachO.LinkerOptionCommand(_io, self, self._root)
  elseif _on == MachO.LoadCommandType.dyld_info then
    self._raw_body = self._io:read_bytes((self.size - 8))
    local _io = KaitaiStream(stringstream(self._raw_body))
    self.body = MachO.DyldInfoCommand(_io, self, self._root)
  elseif _on == MachO.LoadCommandType.version_min_tvos then
    self._raw_body = self._io:read_bytes((self.size - 8))
    local _io = KaitaiStream(stringstream(self._raw_body))
    self.body = MachO.VersionMinCommand(_io, self, self._root)
  elseif _on == MachO.LoadCommandType.load_upward_dylib then
    self._raw_body = self._io:read_bytes((self.size - 8))
    local _io = KaitaiStream(stringstream(self._raw_body))
    self.body = MachO.DylibCommand(_io, self, self._root)
  elseif _on == MachO.LoadCommandType.segment_64 then
    self._raw_body = self._io:read_bytes((self.size - 8))
    local _io = KaitaiStream(stringstream(self._raw_body))
    self.body = MachO.SegmentCommand64(_io, self, self._root)
  elseif _on == MachO.LoadCommandType.segment then
    self._raw_body = self._io:read_bytes((self.size - 8))
    local _io = KaitaiStream(stringstream(self._raw_body))
    self.body = MachO.SegmentCommand(_io, self, self._root)
  elseif _on == MachO.LoadCommandType.sub_umbrella then
    self._raw_body = self._io:read_bytes((self.size - 8))
    local _io = KaitaiStream(stringstream(self._raw_body))
    self.body = MachO.SubCommand(_io, self, self._root)
  elseif _on == MachO.LoadCommandType.version_min_watchos then
    self._raw_body = self._io:read_bytes((self.size - 8))
    local _io = KaitaiStream(stringstream(self._raw_body))
    self.body = MachO.VersionMinCommand(_io, self, self._root)
  elseif _on == MachO.LoadCommandType.routines_64 then
    self._raw_body = self._io:read_bytes((self.size - 8))
    local _io = KaitaiStream(stringstream(self._raw_body))
    self.body = MachO.RoutinesCommand64(_io, self, self._root)
  elseif _on == MachO.LoadCommandType.id_dylib then
    self._raw_body = self._io:read_bytes((self.size - 8))
    local _io = KaitaiStream(stringstream(self._raw_body))
    self.body = MachO.DylibCommand(_io, self, self._root)
  elseif _on == MachO.LoadCommandType.sub_client then
    self._raw_body = self._io:read_bytes((self.size - 8))
    local _io = KaitaiStream(stringstream(self._raw_body))
    self.body = MachO.SubCommand(_io, self, self._root)
  elseif _on == MachO.LoadCommandType.dylib_code_sign_drs then
    self._raw_body = self._io:read_bytes((self.size - 8))
    local _io = KaitaiStream(stringstream(self._raw_body))
    self.body = MachO.LinkeditDataCommand(_io, self, self._root)
  elseif _on == MachO.LoadCommandType.symtab then
    self._raw_body = self._io:read_bytes((self.size - 8))
    local _io = KaitaiStream(stringstream(self._raw_body))
    self.body = MachO.SymtabCommand(_io, self, self._root)
  elseif _on == MachO.LoadCommandType.linker_optimization_hint then
    self._raw_body = self._io:read_bytes((self.size - 8))
    local _io = KaitaiStream(stringstream(self._raw_body))
    self.body = MachO.LinkeditDataCommand(_io, self, self._root)
  elseif _on == MachO.LoadCommandType.data_in_code then
    self._raw_body = self._io:read_bytes((self.size - 8))
    local _io = KaitaiStream(stringstream(self._raw_body))
    self.body = MachO.LinkeditDataCommand(_io, self, self._root)
  elseif _on == MachO.LoadCommandType.code_signature then
    self._raw_body = self._io:read_bytes((self.size - 8))
    local _io = KaitaiStream(stringstream(self._raw_body))
    self.body = MachO.CodeSignatureCommand(_io, self, self._root)
  elseif _on == MachO.LoadCommandType.version_min_iphoneos then
    self._raw_body = self._io:read_bytes((self.size - 8))
    local _io = KaitaiStream(stringstream(self._raw_body))
    self.body = MachO.VersionMinCommand(_io, self, self._root)
  elseif _on == MachO.LoadCommandType.load_weak_dylib then
    self._raw_body = self._io:read_bytes((self.size - 8))
    local _io = KaitaiStream(stringstream(self._raw_body))
    self.body = MachO.DylibCommand(_io, self, self._root)
  elseif _on == MachO.LoadCommandType.lazy_load_dylib then
    self._raw_body = self._io:read_bytes((self.size - 8))
    local _io = KaitaiStream(stringstream(self._raw_body))
    self.body = MachO.DylibCommand(_io, self, self._root)
  elseif _on == MachO.LoadCommandType.uuid then
    self._raw_body = self._io:read_bytes((self.size - 8))
    local _io = KaitaiStream(stringstream(self._raw_body))
    self.body = MachO.UuidCommand(_io, self, self._root)
  elseif _on == MachO.LoadCommandType.version_min_macosx then
    self._raw_body = self._io:read_bytes((self.size - 8))
    local _io = KaitaiStream(stringstream(self._raw_body))
    self.body = MachO.VersionMinCommand(_io, self, self._root)
  else
    self.body = self._io:read_bytes((self.size - 8))
  end
end


MachO.UuidCommand = class.class(KaitaiStruct)

function MachO.UuidCommand:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function MachO.UuidCommand:_read()
  self.uuid = self._io:read_bytes(16)
end


MachO.SymtabCommand = class.class(KaitaiStruct)

function MachO.SymtabCommand:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function MachO.SymtabCommand:_read()
  self.sym_off = self._io:read_u4le()
  self.n_syms = self._io:read_u4le()
  self.str_off = self._io:read_u4le()
  self.str_size = self._io:read_u4le()
end

MachO.SymtabCommand.property.symbols = {}
function MachO.SymtabCommand.property.symbols:get()
  if self._m_symbols ~= nil then
    return self._m_symbols
  end

  local _io = self._root._io
  local _pos = _io:pos()
  _io:seek(self.sym_off)
  self._m_symbols = {}
  for i = 0, self.n_syms - 1 do
    local _on = self._root.magic
    if _on == MachO.MagicType.macho_le_x64 then
      self._m_symbols[i + 1] = MachO.SymtabCommand.Nlist64(_io, self, self._root)
    elseif _on == MachO.MagicType.macho_be_x64 then
      self._m_symbols[i + 1] = MachO.SymtabCommand.Nlist64(_io, self, self._root)
    elseif _on == MachO.MagicType.macho_le_x86 then
      self._m_symbols[i + 1] = MachO.SymtabCommand.Nlist(_io, self, self._root)
    elseif _on == MachO.MagicType.macho_be_x86 then
      self._m_symbols[i + 1] = MachO.SymtabCommand.Nlist(_io, self, self._root)
    end
  end
  _io:seek(_pos)
  return self._m_symbols
end

MachO.SymtabCommand.property.strs = {}
function MachO.SymtabCommand.property.strs:get()
  if self._m_strs ~= nil then
    return self._m_strs
  end

  local _io = self._root._io
  local _pos = _io:pos()
  _io:seek(self.str_off)
  self._raw__m_strs = _io:read_bytes(self.str_size)
  local _io = KaitaiStream(stringstream(self._raw__m_strs))
  self._m_strs = MachO.SymtabCommand.StrTable(_io, self, self._root)
  _io:seek(_pos)
  return self._m_strs
end


MachO.SymtabCommand.StrTable = class.class(KaitaiStruct)

function MachO.SymtabCommand.StrTable:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function MachO.SymtabCommand.StrTable:_read()
  self.unknown = self._io:read_u4le()
  self.items = {}
  local i = 0
  while true do
    local _ = str_decode.decode(self._io:read_bytes_term(0, false, true, false), "utf-8")
    self.items[i + 1] = _
    if _ == "" then
      break
    end
    i = i + 1
  end
end


MachO.SymtabCommand.Nlist64 = class.class(KaitaiStruct)

function MachO.SymtabCommand.Nlist64:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function MachO.SymtabCommand.Nlist64:_read()
  self.un = self._io:read_u4le()
  self.type = self._io:read_u1()
  self.sect = self._io:read_u1()
  self.desc = self._io:read_u2le()
  self.value = self._io:read_u8le()
end

MachO.SymtabCommand.Nlist64.property.name = {}
function MachO.SymtabCommand.Nlist64.property.name:get()
  if self._m_name ~= nil then
    return self._m_name
  end

  if self.un ~= 0 then
    local _pos = self._io:pos()
    self._io:seek((self._parent.str_off + self.un))
    self._m_name = str_decode.decode(self._io:read_bytes_term(0, false, true, true), "utf-8")
    self._io:seek(_pos)
  end
  return self._m_name
end


MachO.SymtabCommand.Nlist = class.class(KaitaiStruct)

function MachO.SymtabCommand.Nlist:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function MachO.SymtabCommand.Nlist:_read()
  self.un = self._io:read_u4le()
  self.type = self._io:read_u1()
  self.sect = self._io:read_u1()
  self.desc = self._io:read_u2le()
  self.value = self._io:read_u4le()
end

MachO.SymtabCommand.Nlist.property.name = {}
function MachO.SymtabCommand.Nlist.property.name:get()
  if self._m_name ~= nil then
    return self._m_name
  end

  if self.un ~= 0 then
    local _pos = self._io:pos()
    self._io:seek((self._parent.str_off + self.un))
    self._m_name = str_decode.decode(self._io:read_bytes_term(0, false, true, true), "utf-8")
    self._io:seek(_pos)
  end
  return self._m_name
end


MachO.VersionMinCommand = class.class(KaitaiStruct)

function MachO.VersionMinCommand:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function MachO.VersionMinCommand:_read()
  self.version = MachO.Version(self._io, self, self._root)
  self.sdk = MachO.Version(self._io, self, self._root)
end


MachO.EntryPointCommand = class.class(KaitaiStruct)

function MachO.EntryPointCommand:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function MachO.EntryPointCommand:_read()
  self.entry_off = self._io:read_u8le()
  self.stack_size = self._io:read_u8le()
end


