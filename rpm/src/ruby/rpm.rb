# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.9')
  raise "Incompatible Kaitai Struct Ruby API: 0.9 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# This parser is for the RPM version 3 file format which is the current version
# of the file format used by RPM 2.1 and later (including RPM version 4.x, which
# is the current version of the RPM tool). There are historical versions of the
# RPM file format, as well as a currently abandoned fork (rpm5). These formats
# are not covered by this specification.
# @see https://github.com/rpm-software-management/rpm/blob/911448f2/doc/manual/format.md Source
# @see https://github.com/rpm-software-management/rpm/blob/911448f2/doc/manual/tags.md Source
# @see https://refspecs.linuxbase.org/LSB_5.0.0/LSB-Core-generic/LSB-Core-generic/pkgformat.html Source
# @see http://ftp.rpm.org/max-rpm/ Source
class Rpm < Kaitai::Struct::Struct

  OPERATING_SYSTEMS = {
    1 => :operating_systems_linux,
    2 => :operating_systems_irix,
    255 => :operating_systems_no_os,
  }
  I__OPERATING_SYSTEMS = OPERATING_SYSTEMS.invert

  SIGNATURE_TAGS = {
    62 => :signature_tags_signatures,
    63 => :signature_tags_header_immutable,
    100 => :signature_tags_i18n_table,
    264 => :signature_tags_bad_sha1_1_obsolete,
    265 => :signature_tags_bad_sha1_2_obsolete,
    267 => :signature_tags_dsa,
    268 => :signature_tags_rsa,
    269 => :signature_tags_sha1,
    270 => :signature_tags_long_size,
    271 => :signature_tags_long_archive_size,
    273 => :signature_tags_sha256,
    274 => :signature_tags_file_signatures,
    275 => :signature_tags_file_signature_length,
    276 => :signature_tags_verity_signatures,
    277 => :signature_tags_verity_signature_algo,
    1000 => :signature_tags_size,
    1001 => :signature_tags_le_md5_1_obsolete,
    1002 => :signature_tags_pgp,
    1003 => :signature_tags_le_md5_2_obsolete,
    1004 => :signature_tags_md5,
    1005 => :signature_tags_gpg,
    1006 => :signature_tags_pgp5_obsolete,
    1007 => :signature_tags_payload_size,
    1008 => :signature_tags_reserved_space,
  }
  I__SIGNATURE_TAGS = SIGNATURE_TAGS.invert

  RECORD_TYPES = {
    0 => :record_types_not_implemented,
    1 => :record_types_char,
    2 => :record_types_uint8,
    3 => :record_types_uint16,
    4 => :record_types_uint32,
    5 => :record_types_uint64,
    6 => :record_types_string,
    7 => :record_types_bin,
    8 => :record_types_string_array,
    9 => :record_types_i18n_string,
  }
  I__RECORD_TYPES = RECORD_TYPES.invert

  HEADER_TAGS = {
    62 => :header_tags_signatures,
    63 => :header_tags_header_immutable,
    100 => :header_tags_i18n_table,
    1000 => :header_tags_name,
    1001 => :header_tags_version,
    1002 => :header_tags_release,
    1003 => :header_tags_epoch,
    1004 => :header_tags_summary,
    1005 => :header_tags_description,
    1006 => :header_tags_build_time,
    1007 => :header_tags_build_host,
    1008 => :header_tags_install_time,
    1009 => :header_tags_size,
    1010 => :header_tags_distribution,
    1011 => :header_tags_vendor,
    1012 => :header_tags_gif_obsolete,
    1013 => :header_tags_xpm_obsolete,
    1014 => :header_tags_license,
    1015 => :header_tags_packager,
    1016 => :header_tags_group,
    1017 => :header_tags_changelog_internal,
    1018 => :header_tags_source,
    1019 => :header_tags_patch,
    1020 => :header_tags_url,
    1021 => :header_tags_os,
    1022 => :header_tags_arch,
    1023 => :header_tags_pre_install_scriptlet,
    1024 => :header_tags_post_install_scriptlet,
    1025 => :header_tags_pre_uninstall_scriptlet,
    1026 => :header_tags_post_uninstall_scriptlet,
    1027 => :header_tags_old_file_names_obsolete,
    1028 => :header_tags_file_sizes,
    1029 => :header_tags_file_states,
    1030 => :header_tags_file_modes,
    1031 => :header_tags_file_uids_internal,
    1032 => :header_tags_file_gids_internal,
    1033 => :header_tags_device_number,
    1034 => :header_tags_mtimes,
    1035 => :header_tags_file_digests,
    1036 => :header_tags_link_tos,
    1037 => :header_tags_file_flags,
    1038 => :header_tags_root_internal,
    1039 => :header_tags_file_owner,
    1040 => :header_tags_file_group,
    1041 => :header_tags_exclude_internal,
    1042 => :header_tags_exclusive_internal,
    1043 => :header_tags_icon_obsolete,
    1044 => :header_tags_source_rpm,
    1045 => :header_tags_file_verify_flags,
    1046 => :header_tags_archive_size,
    1047 => :header_tags_provide_name,
    1048 => :header_tags_require_flags,
    1049 => :header_tags_require_name,
    1050 => :header_tags_require_version,
    1051 => :header_tags_no_source,
    1052 => :header_tags_no_patch,
    1053 => :header_tags_conflict_flags,
    1054 => :header_tags_conflict_name,
    1055 => :header_tags_conflict_version,
    1056 => :header_tags_default_prefix_internal,
    1057 => :header_tags_build_root_internal,
    1058 => :header_tags_install_prefix_internal,
    1059 => :header_tags_exclude_arch,
    1060 => :header_tags_exclude_os,
    1061 => :header_tags_exclusive_arch,
    1062 => :header_tags_exclusive_os,
    1063 => :header_tags_autoreqprov_internal,
    1064 => :header_tags_rpm_version,
    1065 => :header_tags_trigger_scripts,
    1066 => :header_tags_trigger_name,
    1067 => :header_tags_trigger_version,
    1068 => :header_tags_trigger_flags,
    1069 => :header_tags_trigger_index,
    1079 => :header_tags_verify_script,
    1080 => :header_tags_changelog_time,
    1081 => :header_tags_changelog_name,
    1082 => :header_tags_changelog_text,
    1083 => :header_tags_broken_md5_internal,
    1084 => :header_tags_prereq_internal,
    1085 => :header_tags_pre_install_interpreter,
    1086 => :header_tags_post_install_interpreter,
    1087 => :header_tags_pre_uninstall_interpreter,
    1088 => :header_tags_post_uninstall_interpreter,
    1089 => :header_tags_build_archs,
    1090 => :header_tags_obsolete_name,
    1091 => :header_tags_verify_script_prog,
    1092 => :header_tags_trigger_script_prog,
    1093 => :header_tags_doc_dir_internal,
    1094 => :header_tags_cookie,
    1095 => :header_tags_file_devices,
    1096 => :header_tags_file_inodes,
    1097 => :header_tags_file_langs,
    1098 => :header_tags_prefixes,
    1099 => :header_tags_install_prefixes,
    1100 => :header_tags_trigger_install_internal,
    1101 => :header_tags_trigger_uninstall_internal,
    1102 => :header_tags_trigger_post_uninstall_internal,
    1103 => :header_tags_autoreq_internal,
    1104 => :header_tags_autoprov_internal,
    1105 => :header_tags_capability_internal,
    1106 => :header_tags_source_package,
    1107 => :header_tags_old_orig_filenames_internal,
    1108 => :header_tags_build_prereq_internal,
    1109 => :header_tags_build_requires_internal,
    1110 => :header_tags_build_conflicts_internal,
    1111 => :header_tags_build_macros_internal,
    1112 => :header_tags_provide_flags,
    1113 => :header_tags_provide_version,
    1114 => :header_tags_obsolete_flags,
    1115 => :header_tags_obsolete_version,
    1116 => :header_tags_dir_indexes,
    1117 => :header_tags_base_names,
    1118 => :header_tags_dir_names,
    1119 => :header_tags_orig_dir_indexes,
    1120 => :header_tags_orig_base_names,
    1121 => :header_tags_orig_dir_names,
    1122 => :header_tags_opt_flags,
    1123 => :header_tags_dist_url,
    1124 => :header_tags_payload_format,
    1125 => :header_tags_payload_compressor,
    1126 => :header_tags_payload_flags,
    1127 => :header_tags_install_color,
    1128 => :header_tags_install_tid,
    1129 => :header_tags_remove_tid_obsolete,
    1130 => :header_tags_sha1_rhn_internal,
    1131 => :header_tags_rhn_platform_internal,
    1132 => :header_tags_platform,
    1133 => :header_tags_patches_name_obsolete,
    1134 => :header_tags_patches_flags_obsolete,
    1135 => :header_tags_patches_version_obsolete,
    1136 => :header_tags_cache_ctime_internal,
    1137 => :header_tags_cache_pkg_path_internal,
    1138 => :header_tags_cache_pkg_size_internal,
    1139 => :header_tags_cache_pkg_mtime_internal,
    1140 => :header_tags_file_colors,
    1141 => :header_tags_file_class,
    1142 => :header_tags_class_dict,
    1143 => :header_tags_file_depends_idx,
    1144 => :header_tags_file_depends_num,
    1145 => :header_tags_depends_dict,
    1146 => :header_tags_source_pkgid,
    1147 => :header_tags_file_contexts_obsolete,
    1148 => :header_tags_fs_contexts_obsolete,
    1149 => :header_tags_re_contexts_obsolete,
    1150 => :header_tags_policies,
    1151 => :header_tags_pre_trans,
    1152 => :header_tags_post_trans,
    1153 => :header_tags_pre_trans_prog,
    1154 => :header_tags_post_trans_prog,
    1155 => :header_tags_dist_tag,
    1156 => :header_tags_old_suggests_name_obsolete,
    1157 => :header_tags_old_suggests_version_obsolete,
    1158 => :header_tags_old_suggests_flags_obsolete,
    1159 => :header_tags_old_enhances_name_obsolete,
    1160 => :header_tags_old_enhances_version_obsolete,
    1161 => :header_tags_old_enhances_flags_obsolete,
    1162 => :header_tags_priority_unimplemented,
    1163 => :header_tags_cvsid_unimplemented,
    1164 => :header_tags_blink_pkgid_unimplemented,
    1165 => :header_tags_blink_hdrid_unimplemented,
    1166 => :header_tags_blink_nevra_unimplemented,
    1167 => :header_tags_flink_pkgid_unimplemented,
    1168 => :header_tags_flink_hdrid_unimplemented,
    1169 => :header_tags_flink_nevra_unimplemented,
    1170 => :header_tags_package_origin_unimplemented,
    1171 => :header_tags_trigger_pre_install_internal,
    1172 => :header_tags_build_suggests_unimplemented,
    1173 => :header_tags_build_enhances_unimplemented,
    1174 => :header_tags_script_states_unimplemented,
    1175 => :header_tags_script_metrics_unimplemented,
    1176 => :header_tags_build_cpu_clock_unimplemented,
    1177 => :header_tags_file_digest_algos_unimplemented,
    1178 => :header_tags_variants_unimplemented,
    1179 => :header_tags_xmajor_unimplemented,
    1180 => :header_tags_xminor_unimplemented,
    1181 => :header_tags_repo_tag_unimplemented,
    1182 => :header_tags_keywords_unimplemented,
    1183 => :header_tags_build_platforms_unimplemented,
    1184 => :header_tags_package_color_unimplemented,
    1185 => :header_tags_package_pref_color_unimplemented,
    1186 => :header_tags_xattrs_dict_unimplemented,
    1187 => :header_tags_filex_attrsx_unimplemented,
    1188 => :header_tags_dep_attrs_dict_unimplemented,
    1189 => :header_tags_conflict_attrsx_unimplemented,
    1190 => :header_tags_obsolete_attrsx_unimplemented,
    1191 => :header_tags_provide_attrsx_unimplemented,
    1192 => :header_tags_require_attrsx_unimplemented,
    1193 => :header_tags_build_provides_unimplemented,
    1194 => :header_tags_build_obsoletes_unimplemented,
    1195 => :header_tags_db_instance,
    1196 => :header_tags_nvra,
    5000 => :header_tags_file_names,
    5001 => :header_tags_file_provide,
    5002 => :header_tags_file_require,
    5003 => :header_tags_fs_names_unimplemented,
    5004 => :header_tags_fs_sizes_unimplemented,
    5005 => :header_tags_trigger_conds,
    5006 => :header_tags_trigger_type,
    5007 => :header_tags_orig_file_names,
    5008 => :header_tags_long_file_sizes,
    5009 => :header_tags_long_size,
    5010 => :header_tags_file_caps,
    5011 => :header_tags_file_digest_algo,
    5012 => :header_tags_bug_url,
    5013 => :header_tags_evr,
    5014 => :header_tags_nvr,
    5015 => :header_tags_nevr,
    5016 => :header_tags_nevra,
    5017 => :header_tags_header_color,
    5018 => :header_tags_verbose,
    5019 => :header_tags_epoch_num,
    5020 => :header_tags_pre_install_flags,
    5021 => :header_tags_post_install_flags,
    5022 => :header_tags_pre_uninstall_flags,
    5023 => :header_tags_post_uninstall_flags,
    5024 => :header_tags_pre_trans_flags,
    5025 => :header_tags_post_trans_flags,
    5026 => :header_tags_verify_script_flags,
    5027 => :header_tags_trigger_script_flags,
    5029 => :header_tags_collections_unimplemented,
    5030 => :header_tags_policy_names,
    5031 => :header_tags_policy_types,
    5032 => :header_tags_policy_types_indexes,
    5033 => :header_tags_policy_flags,
    5034 => :header_tags_vcs,
    5035 => :header_tags_order_name,
    5036 => :header_tags_order_version,
    5037 => :header_tags_order_flags,
    5038 => :header_tags_mssf_manifest_unimplemented,
    5039 => :header_tags_mssf_domain_unimplemented,
    5040 => :header_tags_inst_file_names,
    5041 => :header_tags_require_nevrs,
    5042 => :header_tags_provide_nevrs,
    5043 => :header_tags_obsolete_nevrs,
    5044 => :header_tags_conflict_nevrs,
    5045 => :header_tags_file_nlinks,
    5046 => :header_tags_recommend_name,
    5047 => :header_tags_recommend_version,
    5048 => :header_tags_recommend_flags,
    5049 => :header_tags_suggest_name,
    5050 => :header_tags_suggest_version,
    5051 => :header_tags_suggest_flags,
    5052 => :header_tags_supplement_name,
    5053 => :header_tags_supplement_version,
    5054 => :header_tags_supplement_flags,
    5055 => :header_tags_enhance_name,
    5056 => :header_tags_enhance_version,
    5057 => :header_tags_enhance_flags,
    5058 => :header_tags_recommend_nevrs,
    5059 => :header_tags_suggest_nevrs,
    5060 => :header_tags_supplement_nevrs,
    5061 => :header_tags_enhance_nevrs,
    5062 => :header_tags_encoding,
    5063 => :header_tags_file_trigger_install_internal,
    5064 => :header_tags_file_trigger_uninstall_internal,
    5065 => :header_tags_file_trigger_post_uninstall_internal,
    5066 => :header_tags_file_trigger_scripts,
    5067 => :header_tags_file_trigger_script_prog,
    5068 => :header_tags_file_trigger_script_flags,
    5069 => :header_tags_file_trigger_name,
    5070 => :header_tags_file_trigger_index,
    5071 => :header_tags_file_trigger_version,
    5072 => :header_tags_file_trigger_flags,
    5073 => :header_tags_trans_file_trigger_install_internal,
    5074 => :header_tags_trans_file_trigger_uninstall_internal,
    5075 => :header_tags_trans_file_trigger_post_uninstall_internal,
    5076 => :header_tags_trans_file_trigger_scripts,
    5077 => :header_tags_trans_file_trigger_script_prog,
    5078 => :header_tags_trans_file_trigger_script_flags,
    5079 => :header_tags_trans_file_trigger_name,
    5080 => :header_tags_trans_file_trigger_index,
    5081 => :header_tags_trans_file_trigger_version,
    5082 => :header_tags_trans_file_trigger_flags,
    5083 => :header_tags_remove_path_postfixes_internal,
    5084 => :header_tags_file_trigger_priorities,
    5085 => :header_tags_trans_file_trigger_priorities,
    5086 => :header_tags_file_trigger_conds,
    5087 => :header_tags_file_trigger_type,
    5088 => :header_tags_trans_file_trigger_conds,
    5089 => :header_tags_trans_file_trigger_type,
    5090 => :header_tags_file_signatures,
    5091 => :header_tags_file_signature_length,
    5092 => :header_tags_payload_digest,
    5093 => :header_tags_payload_digest_algo,
    5094 => :header_tags_auto_installed_unimplemented,
    5095 => :header_tags_identity_unimplemented,
    5096 => :header_tags_modularity_label,
    5097 => :header_tags_payload_digest_alt,
    5098 => :header_tags_arch_suffix,
    5099 => :header_tags_spec,
    5100 => :header_tags_translation_url,
    5101 => :header_tags_upstream_releases,
    5102 => :header_tags_source_license_internal,
  }
  I__HEADER_TAGS = HEADER_TAGS.invert

  RPM_TYPES = {
    0 => :rpm_types_binary,
    1 => :rpm_types_source,
  }
  I__RPM_TYPES = RPM_TYPES.invert

  ARCHITECTURES = {
    1 => :architectures_x86,
    2 => :architectures_alpha,
    3 => :architectures_sparc,
    4 => :architectures_mips,
    5 => :architectures_ppc,
    6 => :architectures_m68k,
    7 => :architectures_sgi,
    8 => :architectures_rs6000,
    9 => :architectures_ia64,
    10 => :architectures_sparc64,
    11 => :architectures_mips64,
    12 => :architectures_arm,
    13 => :architectures_m68k_mint,
    14 => :architectures_s390,
    15 => :architectures_s390x,
    16 => :architectures_ppc64,
    17 => :architectures_sh,
    18 => :architectures_xtensa,
    19 => :architectures_aarch64,
    20 => :architectures_mips_r6,
    21 => :architectures_mips64_r6,
    22 => :architectures_riscv,
    23 => :architectures_loongarch64,
    255 => :architectures_no_arch,
  }
  I__ARCHITECTURES = ARCHITECTURES.invert
  def initialize(_io, _parent = nil, _root = self)
    super(_io, _parent, _root)
    _read
  end

  def _read
    @lead = Lead.new(@_io, self, @_root)
    @signature = Header.new(@_io, self, @_root, true)
    @signature_padding = @_io.read_bytes((-(_io.pos) % 8))
    if ofs_header < 0
      @_unnamed3 = @_io.read_bytes(0)
    end
    @header = Header.new(@_io, self, @_root, false)
    if ofs_payload < 0
      @_unnamed5 = @_io.read_bytes(0)
    end
    @signature_tags_steps = []
    (signature.header_record.num_index_records).times { |i|
      @signature_tags_steps << SignatureTagsStep.new(@_io, self, @_root, i, (i < 1 ? -1 : signature_tags_steps[(i - 1)].size_tag_idx))
    }
    self
  end
  class RecordTypeStringArray < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self, num_values)
      super(_io, _parent, _root)
      @num_values = num_values
      _read
    end

    def _read
      @values = []
      (num_values).times { |i|
        @values << (@_io.read_bytes_term(0, false, true, true)).force_encoding("UTF-8")
      }
      self
    end
    attr_reader :values
    attr_reader :num_values
  end

  ##
  # In 2021, Panu Matilainen (a RPM developer) [described this
  # structure](https://github.com/kaitai-io/kaitai_struct_formats/pull/469#discussion_r718288192)
  # as follows:
  # 
  # > The lead as a structure is 25 years obsolete, the data there is
  # > meaningless. Seriously. Except to check for the magic to detect that
  # > it's an rpm file in the first place, just ignore everything in it.
  # > Literally everything.
  # 
  # The fields with `valid` constraints are important, because these are the
  # same validations that RPM does (which means that any valid `.rpm` file
  # must pass them), but otherwise you should not make decisions based on the
  # values given here.
  class Lead < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @magic = @_io.read_bytes(4)
      raise Kaitai::Struct::ValidationNotEqualError.new([237, 171, 238, 219].pack('C*'), magic, _io, "/types/lead/seq/0") if not magic == [237, 171, 238, 219].pack('C*')
      @version = RpmVersion.new(@_io, self, @_root)
      @type = Kaitai::Struct::Stream::resolve_enum(Rpm::RPM_TYPES, @_io.read_u2be)
      @architecture = Kaitai::Struct::Stream::resolve_enum(Rpm::ARCHITECTURES, @_io.read_u2be)
      @package_name = (Kaitai::Struct::Stream::bytes_terminate(@_io.read_bytes(66), 0, false)).force_encoding("UTF-8")
      @os = Kaitai::Struct::Stream::resolve_enum(Rpm::OPERATING_SYSTEMS, @_io.read_u2be)
      @signature_type = @_io.read_u2be
      raise Kaitai::Struct::ValidationNotEqualError.new(5, signature_type, _io, "/types/lead/seq/6") if not signature_type == 5
      @reserved = @_io.read_bytes(16)
      self
    end
    attr_reader :magic
    attr_reader :version
    attr_reader :type
    attr_reader :architecture
    attr_reader :package_name
    attr_reader :os
    attr_reader :signature_type
    attr_reader :reserved
  end
  class RecordTypeString < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @values = []
      (1).times { |i|
        @values << (@_io.read_bytes_term(0, false, true, true)).force_encoding("UTF-8")
      }
      self
    end
    attr_reader :values
  end
  class SignatureTagsStep < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self, idx, prev_size_tag_idx)
      super(_io, _parent, _root)
      @idx = idx
      @prev_size_tag_idx = prev_size_tag_idx
      _read
    end

    def _read
      self
    end
    def size_tag_idx
      return @size_tag_idx unless @size_tag_idx.nil?
      @size_tag_idx = (prev_size_tag_idx != -1 ? prev_size_tag_idx : ( ((_parent.signature.index_records[idx].signature_tag == :signature_tags_size) && (_parent.signature.index_records[idx].record_type == :record_types_uint32) && (_parent.signature.index_records[idx].num_values >= 1))  ? idx : -1))
      @size_tag_idx
    end
    attr_reader :idx
    attr_reader :prev_size_tag_idx
  end
  class RecordTypeUint32 < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self, num_values)
      super(_io, _parent, _root)
      @num_values = num_values
      _read
    end

    def _read
      @values = []
      (num_values).times { |i|
        @values << @_io.read_u4be
      }
      self
    end
    attr_reader :values
    attr_reader :num_values
  end
  class RecordTypeUint16 < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self, num_values)
      super(_io, _parent, _root)
      @num_values = num_values
      _read
    end

    def _read
      @values = []
      (num_values).times { |i|
        @values << @_io.read_u2be
      }
      self
    end
    attr_reader :values
    attr_reader :num_values
  end
  class HeaderIndexRecord < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @tag_raw = @_io.read_u4be
      @record_type = Kaitai::Struct::Stream::resolve_enum(Rpm::RECORD_TYPES, @_io.read_u4be)
      @ofs_body = @_io.read_u4be
      @count = @_io.read_u4be
      self
    end
    def num_values
      return @num_values unless @num_values.nil?
      if record_type != :record_types_bin
        @num_values = count
      end
      @num_values
    end
    def body
      return @body unless @body.nil?
      io = _parent.storage_section._io
      _pos = io.pos
      io.seek(ofs_body)
      case record_type
      when :record_types_uint32
        @body = RecordTypeUint32.new(io, self, @_root, num_values)
      when :record_types_uint64
        @body = RecordTypeUint64.new(io, self, @_root, num_values)
      when :record_types_bin
        @body = RecordTypeBin.new(io, self, @_root, len_value)
      when :record_types_string
        @body = RecordTypeString.new(io, self, @_root)
      when :record_types_uint8
        @body = RecordTypeUint8.new(io, self, @_root, num_values)
      when :record_types_i18n_string
        @body = RecordTypeStringArray.new(io, self, @_root, num_values)
      when :record_types_uint16
        @body = RecordTypeUint16.new(io, self, @_root, num_values)
      when :record_types_char
        @body = RecordTypeUint8.new(io, self, @_root, num_values)
      when :record_types_string_array
        @body = RecordTypeStringArray.new(io, self, @_root, num_values)
      end
      io.seek(_pos)
      @body
    end
    def signature_tag
      return @signature_tag unless @signature_tag.nil?
      if _parent.is_signature
        @signature_tag = Kaitai::Struct::Stream::resolve_enum(Rpm::SIGNATURE_TAGS, tag_raw)
      end
      @signature_tag
    end
    def len_value
      return @len_value unless @len_value.nil?
      if record_type == :record_types_bin
        @len_value = count
      end
      @len_value
    end
    def header_tag
      return @header_tag unless @header_tag.nil?
      if _parent.is_header
        @header_tag = Kaitai::Struct::Stream::resolve_enum(Rpm::HEADER_TAGS, tag_raw)
      end
      @header_tag
    end

    ##
    # prefer to access `signature_tag` and `header_tag` instead
    attr_reader :tag_raw
    attr_reader :record_type
    attr_reader :ofs_body

    ##
    # internal; access `num_values` and `len_value` instead
    attr_reader :count
  end
  class RpmVersion < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @major = @_io.read_u1
      raise Kaitai::Struct::ValidationLessThanError.new(3, major, _io, "/types/rpm_version/seq/0") if not major >= 3
      raise Kaitai::Struct::ValidationGreaterThanError.new(4, major, _io, "/types/rpm_version/seq/0") if not major <= 4
      @minor = @_io.read_u1
      self
    end

    ##
    # @see https://github.com/rpm-software-management/rpm/blob/911448f2/lib/rpmlead.c#L102 Source
    attr_reader :major
    attr_reader :minor
  end
  class Dummy < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      self
    end
  end
  class RecordTypeUint8 < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self, num_values)
      super(_io, _parent, _root)
      @num_values = num_values
      _read
    end

    def _read
      @values = []
      (num_values).times { |i|
        @values << @_io.read_u1
      }
      self
    end
    attr_reader :values
    attr_reader :num_values
  end
  class RecordTypeUint64 < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self, num_values)
      super(_io, _parent, _root)
      @num_values = num_values
      _read
    end

    def _read
      @values = []
      (num_values).times { |i|
        @values << @_io.read_u8be
      }
      self
    end
    attr_reader :values
    attr_reader :num_values
  end
  class RecordTypeBin < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self, len_value)
      super(_io, _parent, _root)
      @len_value = len_value
      _read
    end

    def _read
      @values = []
      (1).times { |i|
        @values << @_io.read_bytes(len_value)
      }
      self
    end
    attr_reader :values
    attr_reader :len_value
  end
  class HeaderRecord < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @magic = @_io.read_bytes(4)
      raise Kaitai::Struct::ValidationNotEqualError.new([142, 173, 232, 1].pack('C*'), magic, _io, "/types/header_record/seq/0") if not magic == [142, 173, 232, 1].pack('C*')
      @reserved = @_io.read_bytes(4)
      raise Kaitai::Struct::ValidationNotEqualError.new([0, 0, 0, 0].pack('C*'), reserved, _io, "/types/header_record/seq/1") if not reserved == [0, 0, 0, 0].pack('C*')
      @num_index_records = @_io.read_u4be
      raise Kaitai::Struct::ValidationLessThanError.new(1, num_index_records, _io, "/types/header_record/seq/2") if not num_index_records >= 1
      @len_storage_section = @_io.read_u4be
      self
    end
    attr_reader :magic
    attr_reader :reserved
    attr_reader :num_index_records

    ##
    # Size of the storage area for the data
    # pointed to by the Index Records.
    attr_reader :len_storage_section
  end

  ##
  # header structure used for both the "header" and "signature", but some tag
  # values have different meanings in signature and header (hence they use
  # different enums)
  class Header < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self, is_signature)
      super(_io, _parent, _root)
      @is_signature = is_signature
      _read
    end

    def _read
      @header_record = HeaderRecord.new(@_io, self, @_root)
      @index_records = []
      (header_record.num_index_records).times { |i|
        @index_records << HeaderIndexRecord.new(@_io, self, @_root)
      }
      @_raw_storage_section = @_io.read_bytes(header_record.len_storage_section)
      _io__raw_storage_section = Kaitai::Struct::Stream.new(@_raw_storage_section)
      @storage_section = Dummy.new(_io__raw_storage_section, self, @_root)
      self
    end
    def is_header
      return @is_header unless @is_header.nil?
      @is_header = !(is_signature)
      @is_header
    end
    attr_reader :header_record
    attr_reader :index_records
    attr_reader :storage_section
    attr_reader :is_signature
    attr_reader :_raw_storage_section
  end
  def has_signature_size_tag
    return @has_signature_size_tag unless @has_signature_size_tag.nil?
    @has_signature_size_tag = signature_tags_steps.last.size_tag_idx != -1
    @has_signature_size_tag
  end
  def signature_size_tag
    return @signature_size_tag unless @signature_size_tag.nil?
    if has_signature_size_tag
      @signature_size_tag = signature.index_records[signature_tags_steps.last.size_tag_idx]
    end
    @signature_size_tag
  end
  def len_payload
    return @len_payload unless @len_payload.nil?
    if has_signature_size_tag
      @len_payload = (signature_size_tag.body.values[0] - len_header)
    end
    @len_payload
  end
  def payload
    return @payload unless @payload.nil?
    if has_signature_size_tag
      _pos = @_io.pos
      @_io.seek(ofs_payload)
      @payload = @_io.read_bytes(len_payload)
      @_io.seek(_pos)
    end
    @payload
  end
  def len_header
    return @len_header unless @len_header.nil?
    @len_header = (ofs_payload - ofs_header)
    @len_header
  end
  def ofs_header
    return @ofs_header unless @ofs_header.nil?
    @ofs_header = _io.pos
    @ofs_header
  end
  def ofs_payload
    return @ofs_payload unless @ofs_payload.nil?
    @ofs_payload = _io.pos
    @ofs_payload
  end
  attr_reader :lead
  attr_reader :signature
  attr_reader :signature_padding
  attr_reader :_unnamed3
  attr_reader :header
  attr_reader :_unnamed5
  attr_reader :signature_tags_steps
end
