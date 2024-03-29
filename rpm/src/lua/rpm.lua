-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
local enum = require("enum")
local utils = require("utils")
local str_decode = require("string_decode")
local stringstream = require("string_stream")

-- 
-- This parser is for the RPM version 3 file format which is the current version
-- of the file format used by RPM 2.1 and later (including RPM version 4.x, which
-- is the current version of the RPM tool). There are historical versions of the
-- RPM file format, as well as a currently abandoned fork (rpm5). These formats
-- are not covered by this specification.
-- See also: Source (https://github.com/rpm-software-management/rpm/blob/afad3167/docs/manual/format.md)
-- See also: Source (https://github.com/rpm-software-management/rpm/blob/afad3167/docs/manual/tags.md)
-- See also: Source (https://refspecs.linuxbase.org/LSB_5.0.0/LSB-Core-generic/LSB-Core-generic/pkgformat.html)
-- See also: Source (http://ftp.rpm.org/max-rpm/)
Rpm = class.class(KaitaiStruct)

Rpm.OperatingSystems = enum.Enum {
  linux = 1,
  irix = 2,
  no_os = 255,
}

Rpm.SignatureTags = enum.Enum {
  signatures = 62,
  header_immutable = 63,
  i18n_table = 100,
  bad_sha1_1_obsolete = 264,
  bad_sha1_2_obsolete = 265,
  dsa = 267,
  rsa = 268,
  sha1 = 269,
  long_size = 270,
  long_archive_size = 271,
  sha256 = 273,
  file_signatures = 274,
  file_signature_length = 275,
  verity_signatures = 276,
  verity_signature_algo = 277,
  size = 1000,
  le_md5_1_obsolete = 1001,
  pgp = 1002,
  le_md5_2_obsolete = 1003,
  md5 = 1004,
  gpg = 1005,
  pgp5_obsolete = 1006,
  payload_size = 1007,
  reserved_space = 1008,
}

Rpm.RecordTypes = enum.Enum {
  not_implemented = 0,
  char = 1,
  uint8 = 2,
  uint16 = 3,
  uint32 = 4,
  uint64 = 5,
  string = 6,
  bin = 7,
  string_array = 8,
  i18n_string = 9,
}

Rpm.HeaderTags = enum.Enum {
  signatures = 62,
  header_immutable = 63,
  i18n_table = 100,
  name = 1000,
  version = 1001,
  release = 1002,
  epoch = 1003,
  summary = 1004,
  description = 1005,
  build_time = 1006,
  build_host = 1007,
  install_time = 1008,
  size = 1009,
  distribution = 1010,
  vendor = 1011,
  gif_obsolete = 1012,
  xpm_obsolete = 1013,
  license = 1014,
  packager = 1015,
  group = 1016,
  changelog_internal = 1017,
  source = 1018,
  patch = 1019,
  url = 1020,
  os = 1021,
  arch = 1022,
  pre_install_scriptlet = 1023,
  post_install_scriptlet = 1024,
  pre_uninstall_scriptlet = 1025,
  post_uninstall_scriptlet = 1026,
  old_file_names_obsolete = 1027,
  file_sizes = 1028,
  file_states = 1029,
  file_modes = 1030,
  file_uids_internal = 1031,
  file_gids_internal = 1032,
  device_number = 1033,
  mtimes = 1034,
  file_digests = 1035,
  link_tos = 1036,
  file_flags = 1037,
  root_internal = 1038,
  file_owner = 1039,
  file_group = 1040,
  exclude_internal = 1041,
  exclusive_internal = 1042,
  icon_obsolete = 1043,
  source_rpm = 1044,
  file_verify_flags = 1045,
  archive_size = 1046,
  provide_name = 1047,
  require_flags = 1048,
  require_name = 1049,
  require_version = 1050,
  no_source = 1051,
  no_patch = 1052,
  conflict_flags = 1053,
  conflict_name = 1054,
  conflict_version = 1055,
  default_prefix_internal = 1056,
  build_root_internal = 1057,
  install_prefix_internal = 1058,
  exclude_arch = 1059,
  exclude_os = 1060,
  exclusive_arch = 1061,
  exclusive_os = 1062,
  autoreqprov_internal = 1063,
  rpm_version = 1064,
  trigger_scripts = 1065,
  trigger_name = 1066,
  trigger_version = 1067,
  trigger_flags = 1068,
  trigger_index = 1069,
  verify_script = 1079,
  changelog_time = 1080,
  changelog_name = 1081,
  changelog_text = 1082,
  broken_md5_internal = 1083,
  prereq_internal = 1084,
  pre_install_interpreter = 1085,
  post_install_interpreter = 1086,
  pre_uninstall_interpreter = 1087,
  post_uninstall_interpreter = 1088,
  build_archs = 1089,
  obsolete_name = 1090,
  verify_script_prog = 1091,
  trigger_script_prog = 1092,
  doc_dir_internal = 1093,
  cookie = 1094,
  file_devices = 1095,
  file_inodes = 1096,
  file_langs = 1097,
  prefixes = 1098,
  install_prefixes = 1099,
  trigger_install_internal = 1100,
  trigger_uninstall_internal = 1101,
  trigger_post_uninstall_internal = 1102,
  autoreq_internal = 1103,
  autoprov_internal = 1104,
  capability_internal = 1105,
  source_package = 1106,
  old_orig_filenames_internal = 1107,
  build_prereq_internal = 1108,
  build_requires_internal = 1109,
  build_conflicts_internal = 1110,
  build_macros_internal = 1111,
  provide_flags = 1112,
  provide_version = 1113,
  obsolete_flags = 1114,
  obsolete_version = 1115,
  dir_indexes = 1116,
  base_names = 1117,
  dir_names = 1118,
  orig_dir_indexes = 1119,
  orig_base_names = 1120,
  orig_dir_names = 1121,
  opt_flags = 1122,
  dist_url = 1123,
  payload_format = 1124,
  payload_compressor = 1125,
  payload_flags = 1126,
  install_color = 1127,
  install_tid = 1128,
  remove_tid_obsolete = 1129,
  sha1_rhn_internal = 1130,
  rhn_platform_internal = 1131,
  platform = 1132,
  patches_name_obsolete = 1133,
  patches_flags_obsolete = 1134,
  patches_version_obsolete = 1135,
  cache_ctime_internal = 1136,
  cache_pkg_path_internal = 1137,
  cache_pkg_size_internal = 1138,
  cache_pkg_mtime_internal = 1139,
  file_colors = 1140,
  file_class = 1141,
  class_dict = 1142,
  file_depends_idx = 1143,
  file_depends_num = 1144,
  depends_dict = 1145,
  source_pkgid = 1146,
  file_contexts_obsolete = 1147,
  fs_contexts_obsolete = 1148,
  re_contexts_obsolete = 1149,
  policies = 1150,
  pre_trans = 1151,
  post_trans = 1152,
  pre_trans_prog = 1153,
  post_trans_prog = 1154,
  dist_tag = 1155,
  old_suggests_name_obsolete = 1156,
  old_suggests_version_obsolete = 1157,
  old_suggests_flags_obsolete = 1158,
  old_enhances_name_obsolete = 1159,
  old_enhances_version_obsolete = 1160,
  old_enhances_flags_obsolete = 1161,
  priority_unimplemented = 1162,
  cvsid_unimplemented = 1163,
  blink_pkgid_unimplemented = 1164,
  blink_hdrid_unimplemented = 1165,
  blink_nevra_unimplemented = 1166,
  flink_pkgid_unimplemented = 1167,
  flink_hdrid_unimplemented = 1168,
  flink_nevra_unimplemented = 1169,
  package_origin_unimplemented = 1170,
  trigger_pre_install_internal = 1171,
  build_suggests_unimplemented = 1172,
  build_enhances_unimplemented = 1173,
  script_states_unimplemented = 1174,
  script_metrics_unimplemented = 1175,
  build_cpu_clock_unimplemented = 1176,
  file_digest_algos_unimplemented = 1177,
  variants_unimplemented = 1178,
  xmajor_unimplemented = 1179,
  xminor_unimplemented = 1180,
  repo_tag_unimplemented = 1181,
  keywords_unimplemented = 1182,
  build_platforms_unimplemented = 1183,
  package_color_unimplemented = 1184,
  package_pref_color_unimplemented = 1185,
  xattrs_dict_unimplemented = 1186,
  filex_attrsx_unimplemented = 1187,
  dep_attrs_dict_unimplemented = 1188,
  conflict_attrsx_unimplemented = 1189,
  obsolete_attrsx_unimplemented = 1190,
  provide_attrsx_unimplemented = 1191,
  require_attrsx_unimplemented = 1192,
  build_provides_unimplemented = 1193,
  build_obsoletes_unimplemented = 1194,
  db_instance = 1195,
  nvra = 1196,
  file_names = 5000,
  file_provide = 5001,
  file_require = 5002,
  fs_names_unimplemented = 5003,
  fs_sizes_unimplemented = 5004,
  trigger_conds = 5005,
  trigger_type = 5006,
  orig_file_names = 5007,
  long_file_sizes = 5008,
  long_size = 5009,
  file_caps = 5010,
  file_digest_algo = 5011,
  bug_url = 5012,
  evr = 5013,
  nvr = 5014,
  nevr = 5015,
  nevra = 5016,
  header_color = 5017,
  verbose = 5018,
  epoch_num = 5019,
  pre_install_flags = 5020,
  post_install_flags = 5021,
  pre_uninstall_flags = 5022,
  post_uninstall_flags = 5023,
  pre_trans_flags = 5024,
  post_trans_flags = 5025,
  verify_script_flags = 5026,
  trigger_script_flags = 5027,
  collections_unimplemented = 5029,
  policy_names = 5030,
  policy_types = 5031,
  policy_types_indexes = 5032,
  policy_flags = 5033,
  vcs = 5034,
  order_name = 5035,
  order_version = 5036,
  order_flags = 5037,
  mssf_manifest_unimplemented = 5038,
  mssf_domain_unimplemented = 5039,
  inst_file_names = 5040,
  require_nevrs = 5041,
  provide_nevrs = 5042,
  obsolete_nevrs = 5043,
  conflict_nevrs = 5044,
  file_nlinks = 5045,
  recommend_name = 5046,
  recommend_version = 5047,
  recommend_flags = 5048,
  suggest_name = 5049,
  suggest_version = 5050,
  suggest_flags = 5051,
  supplement_name = 5052,
  supplement_version = 5053,
  supplement_flags = 5054,
  enhance_name = 5055,
  enhance_version = 5056,
  enhance_flags = 5057,
  recommend_nevrs = 5058,
  suggest_nevrs = 5059,
  supplement_nevrs = 5060,
  enhance_nevrs = 5061,
  encoding = 5062,
  file_trigger_install_internal = 5063,
  file_trigger_uninstall_internal = 5064,
  file_trigger_post_uninstall_internal = 5065,
  file_trigger_scripts = 5066,
  file_trigger_script_prog = 5067,
  file_trigger_script_flags = 5068,
  file_trigger_name = 5069,
  file_trigger_index = 5070,
  file_trigger_version = 5071,
  file_trigger_flags = 5072,
  trans_file_trigger_install_internal = 5073,
  trans_file_trigger_uninstall_internal = 5074,
  trans_file_trigger_post_uninstall_internal = 5075,
  trans_file_trigger_scripts = 5076,
  trans_file_trigger_script_prog = 5077,
  trans_file_trigger_script_flags = 5078,
  trans_file_trigger_name = 5079,
  trans_file_trigger_index = 5080,
  trans_file_trigger_version = 5081,
  trans_file_trigger_flags = 5082,
  remove_path_postfixes_internal = 5083,
  file_trigger_priorities = 5084,
  trans_file_trigger_priorities = 5085,
  file_trigger_conds = 5086,
  file_trigger_type = 5087,
  trans_file_trigger_conds = 5088,
  trans_file_trigger_type = 5089,
  file_signatures = 5090,
  file_signature_length = 5091,
  payload_digest = 5092,
  payload_digest_algo = 5093,
  auto_installed_unimplemented = 5094,
  identity_unimplemented = 5095,
  modularity_label = 5096,
  payload_digest_alt = 5097,
  arch_suffix = 5098,
  spec = 5099,
  translation_url = 5100,
  upstream_releases = 5101,
  source_license_internal = 5102,
  pre_untrans = 5103,
  post_untrans = 5104,
  pre_untrans_prog = 5105,
  post_untrans_prog = 5106,
  pre_untrans_flags = 5107,
  post_untrans_flags = 5108,
  sys_users = 5109,
}

Rpm.RpmTypes = enum.Enum {
  binary = 0,
  source = 1,
}

Rpm.Architectures = enum.Enum {
  x86 = 1,
  alpha = 2,
  sparc = 3,
  mips = 4,
  ppc = 5,
  m68k = 6,
  sgi = 7,
  rs6000 = 8,
  ia64 = 9,
  sparc64 = 10,
  mips64 = 11,
  arm = 12,
  m68k_mint = 13,
  s390 = 14,
  s390x = 15,
  ppc64 = 16,
  sh = 17,
  xtensa = 18,
  aarch64 = 19,
  mips_r6 = 20,
  mips64_r6 = 21,
  riscv = 22,
  loongarch64 = 23,
  no_arch = 255,
}

function Rpm:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Rpm:_read()
  self.lead = Rpm.Lead(self._io, self, self._root)
  self.signature = Rpm.Header(true, self._io, self, self._root)
  self.signature_padding = self._io:read_bytes((-(self._io:pos()) % 8))
  if self.ofs_header < 0 then
    self._unnamed3 = self._io:read_bytes(0)
  end
  self.header = Rpm.Header(false, self._io, self, self._root)
  if self.ofs_payload < 0 then
    self._unnamed5 = self._io:read_bytes(0)
  end
  self.signature_tags_steps = {}
  for i = 0, self.signature.header_record.num_index_records - 1 do
    self.signature_tags_steps[i + 1] = Rpm.SignatureTagsStep(i, utils.box_unwrap((i < 1) and utils.box_wrap(-1) or (self.signature_tags_steps[(i - 1) + 1].size_tag_idx)), self._io, self, self._root)
  end
end

Rpm.property.has_signature_size_tag = {}
function Rpm.property.has_signature_size_tag:get()
  if self._m_has_signature_size_tag ~= nil then
    return self._m_has_signature_size_tag
  end

  self._m_has_signature_size_tag = self.signature_tags_steps[#self.signature_tags_steps].size_tag_idx ~= -1
  return self._m_has_signature_size_tag
end

Rpm.property.signature_size_tag = {}
function Rpm.property.signature_size_tag:get()
  if self._m_signature_size_tag ~= nil then
    return self._m_signature_size_tag
  end

  if self.has_signature_size_tag then
    self._m_signature_size_tag = self.signature.index_records[self.signature_tags_steps[#self.signature_tags_steps].size_tag_idx + 1]
  end
  return self._m_signature_size_tag
end

Rpm.property.len_payload = {}
function Rpm.property.len_payload:get()
  if self._m_len_payload ~= nil then
    return self._m_len_payload
  end

  if self.has_signature_size_tag then
    self._m_len_payload = (self.signature_size_tag.body.values[0 + 1] - self.len_header)
  end
  return self._m_len_payload
end

Rpm.property.payload = {}
function Rpm.property.payload:get()
  if self._m_payload ~= nil then
    return self._m_payload
  end

  if self.has_signature_size_tag then
    local _pos = self._io:pos()
    self._io:seek(self.ofs_payload)
    self._m_payload = self._io:read_bytes(self.len_payload)
    self._io:seek(_pos)
  end
  return self._m_payload
end

Rpm.property.len_header = {}
function Rpm.property.len_header:get()
  if self._m_len_header ~= nil then
    return self._m_len_header
  end

  self._m_len_header = (self.ofs_payload - self.ofs_header)
  return self._m_len_header
end

Rpm.property.ofs_header = {}
function Rpm.property.ofs_header:get()
  if self._m_ofs_header ~= nil then
    return self._m_ofs_header
  end

  self._m_ofs_header = self._io:pos()
  return self._m_ofs_header
end

Rpm.property.ofs_payload = {}
function Rpm.property.ofs_payload:get()
  if self._m_ofs_payload ~= nil then
    return self._m_ofs_payload
  end

  self._m_ofs_payload = self._io:pos()
  return self._m_ofs_payload
end


Rpm.RecordTypeStringArray = class.class(KaitaiStruct)

function Rpm.RecordTypeStringArray:_init(num_values, io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self.num_values = num_values
  self:_read()
end

function Rpm.RecordTypeStringArray:_read()
  self.values = {}
  for i = 0, self.num_values - 1 do
    self.values[i + 1] = str_decode.decode(self._io:read_bytes_term(0, false, true, true), "UTF-8")
  end
end


-- 
-- In 2021, Panu Matilainen (a RPM developer) [described this
-- structure](https://github.com/kaitai-io/kaitai_struct_formats/pull/469#discussion_r718288192)
-- as follows:
-- 
-- > The lead as a structure is 25 years obsolete, the data there is
-- > meaningless. Seriously. Except to check for the magic to detect that
-- > it's an rpm file in the first place, just ignore everything in it.
-- > Literally everything.
-- 
-- The fields with `valid` constraints are important, because these are the
-- same validations that RPM does (which means that any valid `.rpm` file
-- must pass them), but otherwise you should not make decisions based on the
-- values given here.
Rpm.Lead = class.class(KaitaiStruct)

function Rpm.Lead:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Rpm.Lead:_read()
  self.magic = self._io:read_bytes(4)
  if not(self.magic == "\237\171\238\219") then
    error("not equal, expected " ..  "\237\171\238\219" .. ", but got " .. self.magic)
  end
  self.version = Rpm.RpmVersion(self._io, self, self._root)
  self.type = Rpm.RpmTypes(self._io:read_u2be())
  self.architecture = Rpm.Architectures(self._io:read_u2be())
  self.package_name = str_decode.decode(KaitaiStream.bytes_terminate(self._io:read_bytes(66), 0, false), "UTF-8")
  self.os = Rpm.OperatingSystems(self._io:read_u2be())
  self.signature_type = self._io:read_u2be()
  if not(self.signature_type == 5) then
    error("not equal, expected " ..  5 .. ", but got " .. self.signature_type)
  end
  self.reserved = self._io:read_bytes(16)
end


Rpm.RecordTypeString = class.class(KaitaiStruct)

function Rpm.RecordTypeString:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Rpm.RecordTypeString:_read()
  self.values = {}
  for i = 0, 1 - 1 do
    self.values[i + 1] = str_decode.decode(self._io:read_bytes_term(0, false, true, true), "UTF-8")
  end
end


Rpm.SignatureTagsStep = class.class(KaitaiStruct)

function Rpm.SignatureTagsStep:_init(idx, prev_size_tag_idx, io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self.idx = idx
  self.prev_size_tag_idx = prev_size_tag_idx
  self:_read()
end

function Rpm.SignatureTagsStep:_read()
end

Rpm.SignatureTagsStep.property.size_tag_idx = {}
function Rpm.SignatureTagsStep.property.size_tag_idx:get()
  if self._m_size_tag_idx ~= nil then
    return self._m_size_tag_idx
  end

  self._m_size_tag_idx = utils.box_unwrap((self.prev_size_tag_idx ~= -1) and utils.box_wrap(self.prev_size_tag_idx) or (utils.box_unwrap(( ((self._parent.signature.index_records[self.idx + 1].signature_tag == Rpm.SignatureTags.size) and (self._parent.signature.index_records[self.idx + 1].record_type == Rpm.RecordTypes.uint32) and (self._parent.signature.index_records[self.idx + 1].num_values >= 1)) ) and utils.box_wrap(self.idx) or (-1))))
  return self._m_size_tag_idx
end


Rpm.RecordTypeUint32 = class.class(KaitaiStruct)

function Rpm.RecordTypeUint32:_init(num_values, io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self.num_values = num_values
  self:_read()
end

function Rpm.RecordTypeUint32:_read()
  self.values = {}
  for i = 0, self.num_values - 1 do
    self.values[i + 1] = self._io:read_u4be()
  end
end


Rpm.RecordTypeUint16 = class.class(KaitaiStruct)

function Rpm.RecordTypeUint16:_init(num_values, io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self.num_values = num_values
  self:_read()
end

function Rpm.RecordTypeUint16:_read()
  self.values = {}
  for i = 0, self.num_values - 1 do
    self.values[i + 1] = self._io:read_u2be()
  end
end


Rpm.HeaderIndexRecord = class.class(KaitaiStruct)

function Rpm.HeaderIndexRecord:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Rpm.HeaderIndexRecord:_read()
  self.tag_raw = self._io:read_u4be()
  self.record_type = Rpm.RecordTypes(self._io:read_u4be())
  self.ofs_body = self._io:read_u4be()
  self.count = self._io:read_u4be()
end

Rpm.HeaderIndexRecord.property.num_values = {}
function Rpm.HeaderIndexRecord.property.num_values:get()
  if self._m_num_values ~= nil then
    return self._m_num_values
  end

  if self.record_type ~= Rpm.RecordTypes.bin then
    self._m_num_values = self.count
  end
  return self._m_num_values
end

Rpm.HeaderIndexRecord.property.body = {}
function Rpm.HeaderIndexRecord.property.body:get()
  if self._m_body ~= nil then
    return self._m_body
  end

  local _io = self._parent.storage_section._io
  local _pos = _io:pos()
  _io:seek(self.ofs_body)
  local _on = self.record_type
  if _on == Rpm.RecordTypes.uint32 then
    self._m_body = Rpm.RecordTypeUint32(self.num_values, _io, self, self._root)
  elseif _on == Rpm.RecordTypes.uint64 then
    self._m_body = Rpm.RecordTypeUint64(self.num_values, _io, self, self._root)
  elseif _on == Rpm.RecordTypes.bin then
    self._m_body = Rpm.RecordTypeBin(self.len_value, _io, self, self._root)
  elseif _on == Rpm.RecordTypes.string then
    self._m_body = Rpm.RecordTypeString(_io, self, self._root)
  elseif _on == Rpm.RecordTypes.uint8 then
    self._m_body = Rpm.RecordTypeUint8(self.num_values, _io, self, self._root)
  elseif _on == Rpm.RecordTypes.i18n_string then
    self._m_body = Rpm.RecordTypeStringArray(self.num_values, _io, self, self._root)
  elseif _on == Rpm.RecordTypes.uint16 then
    self._m_body = Rpm.RecordTypeUint16(self.num_values, _io, self, self._root)
  elseif _on == Rpm.RecordTypes.char then
    self._m_body = Rpm.RecordTypeUint8(self.num_values, _io, self, self._root)
  elseif _on == Rpm.RecordTypes.string_array then
    self._m_body = Rpm.RecordTypeStringArray(self.num_values, _io, self, self._root)
  end
  _io:seek(_pos)
  return self._m_body
end

Rpm.HeaderIndexRecord.property.signature_tag = {}
function Rpm.HeaderIndexRecord.property.signature_tag:get()
  if self._m_signature_tag ~= nil then
    return self._m_signature_tag
  end

  if self._parent.is_signature then
    self._m_signature_tag = Rpm.SignatureTags(self.tag_raw)
  end
  return self._m_signature_tag
end

Rpm.HeaderIndexRecord.property.len_value = {}
function Rpm.HeaderIndexRecord.property.len_value:get()
  if self._m_len_value ~= nil then
    return self._m_len_value
  end

  if self.record_type == Rpm.RecordTypes.bin then
    self._m_len_value = self.count
  end
  return self._m_len_value
end

Rpm.HeaderIndexRecord.property.header_tag = {}
function Rpm.HeaderIndexRecord.property.header_tag:get()
  if self._m_header_tag ~= nil then
    return self._m_header_tag
  end

  if self._parent.is_header then
    self._m_header_tag = Rpm.HeaderTags(self.tag_raw)
  end
  return self._m_header_tag
end

-- 
-- prefer to access `signature_tag` and `header_tag` instead.
-- 
-- internal; access `num_values` and `len_value` instead.

Rpm.RpmVersion = class.class(KaitaiStruct)

function Rpm.RpmVersion:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Rpm.RpmVersion:_read()
  self.major = self._io:read_u1()
  if not(self.major >= 3) then
    error("ValidationLessThanError")
  end
  if not(self.major <= 4) then
    error("ValidationGreaterThanError")
  end
  self.minor = self._io:read_u1()
end

-- 
-- See also: Source (https://github.com/rpm-software-management/rpm/blob/afad3167/lib/rpmlead.c#L102)

Rpm.Dummy = class.class(KaitaiStruct)

function Rpm.Dummy:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Rpm.Dummy:_read()
end


Rpm.RecordTypeUint8 = class.class(KaitaiStruct)

function Rpm.RecordTypeUint8:_init(num_values, io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self.num_values = num_values
  self:_read()
end

function Rpm.RecordTypeUint8:_read()
  self.values = {}
  for i = 0, self.num_values - 1 do
    self.values[i + 1] = self._io:read_u1()
  end
end


Rpm.RecordTypeUint64 = class.class(KaitaiStruct)

function Rpm.RecordTypeUint64:_init(num_values, io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self.num_values = num_values
  self:_read()
end

function Rpm.RecordTypeUint64:_read()
  self.values = {}
  for i = 0, self.num_values - 1 do
    self.values[i + 1] = self._io:read_u8be()
  end
end


Rpm.RecordTypeBin = class.class(KaitaiStruct)

function Rpm.RecordTypeBin:_init(len_value, io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self.len_value = len_value
  self:_read()
end

function Rpm.RecordTypeBin:_read()
  self.values = {}
  for i = 0, 1 - 1 do
    self.values[i + 1] = self._io:read_bytes(self.len_value)
  end
end


Rpm.HeaderRecord = class.class(KaitaiStruct)

function Rpm.HeaderRecord:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Rpm.HeaderRecord:_read()
  self.magic = self._io:read_bytes(4)
  if not(self.magic == "\142\173\232\001") then
    error("not equal, expected " ..  "\142\173\232\001" .. ", but got " .. self.magic)
  end
  self.reserved = self._io:read_bytes(4)
  if not(self.reserved == "\000\000\000\000") then
    error("not equal, expected " ..  "\000\000\000\000" .. ", but got " .. self.reserved)
  end
  self.num_index_records = self._io:read_u4be()
  if not(self.num_index_records >= 1) then
    error("ValidationLessThanError")
  end
  self.len_storage_section = self._io:read_u4be()
end

-- 
-- Size of the storage area for the data
-- pointed to by the Index Records.

-- 
-- header structure used for both the "header" and "signature", but some tag
-- values have different meanings in signature and header (hence they use
-- different enums)
Rpm.Header = class.class(KaitaiStruct)

function Rpm.Header:_init(is_signature, io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self.is_signature = is_signature
  self:_read()
end

function Rpm.Header:_read()
  self.header_record = Rpm.HeaderRecord(self._io, self, self._root)
  self.index_records = {}
  for i = 0, self.header_record.num_index_records - 1 do
    self.index_records[i + 1] = Rpm.HeaderIndexRecord(self._io, self, self._root)
  end
  self._raw_storage_section = self._io:read_bytes(self.header_record.len_storage_section)
  local _io = KaitaiStream(stringstream(self._raw_storage_section))
  self.storage_section = Rpm.Dummy(_io, self, self._root)
end

Rpm.Header.property.is_header = {}
function Rpm.Header.property.is_header:get()
  if self._m_is_header ~= nil then
    return self._m_is_header
  end

  self._m_is_header = not(self.is_signature)
  return self._m_is_header
end


