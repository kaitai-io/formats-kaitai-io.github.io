# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import ReadWriteKaitaiStruct, KaitaiStream, BytesIO
from enum import IntEnum


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class Rpm(ReadWriteKaitaiStruct):
    """This parser is for the RPM version 3 file format which is the current version
    of the file format used by RPM 2.1 and later (including RPM version 4.x, which
    is the current version of the RPM tool). There are historical versions of the
    RPM file format, as well as a currently abandoned fork (rpm5). These formats
    are not covered by this specification.
    
    .. seealso::
       Source - https://github.com/rpm-software-management/rpm/blob/afad3167/docs/manual/format.md
    
    
    .. seealso::
       Source - https://github.com/rpm-software-management/rpm/blob/afad3167/docs/manual/tags.md
    
    
    .. seealso::
       Source - https://refspecs.linuxbase.org/LSB_5.0.0/LSB-Core-generic/LSB-Core-generic/pkgformat.html
    
    
    .. seealso::
       Source - http://ftp.rpm.org/max-rpm/
    """

    class Architectures(IntEnum):
        x86 = 1
        alpha = 2
        sparc = 3
        mips = 4
        ppc = 5
        m68k = 6
        sgi = 7
        rs6000 = 8
        ia64 = 9
        sparc64 = 10
        mips64 = 11
        arm = 12
        m68k_mint = 13
        s390 = 14
        s390x = 15
        ppc64 = 16
        sh = 17
        xtensa = 18
        aarch64 = 19
        mips_r6 = 20
        mips64_r6 = 21
        riscv = 22
        loongarch64 = 23
        no_arch = 255

    class HeaderTags(IntEnum):
        signatures = 62
        header_immutable = 63
        i18n_table = 100
        name = 1000
        version = 1001
        release = 1002
        epoch = 1003
        summary = 1004
        description = 1005
        build_time = 1006
        build_host = 1007
        install_time = 1008
        size = 1009
        distribution = 1010
        vendor = 1011
        gif_obsolete = 1012
        xpm_obsolete = 1013
        license = 1014
        packager = 1015
        group = 1016
        changelog_internal = 1017
        source = 1018
        patch = 1019
        url = 1020
        os = 1021
        arch = 1022
        pre_install_scriptlet = 1023
        post_install_scriptlet = 1024
        pre_uninstall_scriptlet = 1025
        post_uninstall_scriptlet = 1026
        old_file_names_obsolete = 1027
        file_sizes = 1028
        file_states = 1029
        file_modes = 1030
        file_uids_internal = 1031
        file_gids_internal = 1032
        device_number = 1033
        mtimes = 1034
        file_digests = 1035
        link_tos = 1036
        file_flags = 1037
        root_internal = 1038
        file_owner = 1039
        file_group = 1040
        exclude_internal = 1041
        exclusive_internal = 1042
        icon_obsolete = 1043
        source_rpm = 1044
        file_verify_flags = 1045
        archive_size = 1046
        provide_name = 1047
        require_flags = 1048
        require_name = 1049
        require_version = 1050
        no_source = 1051
        no_patch = 1052
        conflict_flags = 1053
        conflict_name = 1054
        conflict_version = 1055
        default_prefix_internal = 1056
        build_root_internal = 1057
        install_prefix_internal = 1058
        exclude_arch = 1059
        exclude_os = 1060
        exclusive_arch = 1061
        exclusive_os = 1062
        autoreqprov_internal = 1063
        rpm_version = 1064
        trigger_scripts = 1065
        trigger_name = 1066
        trigger_version = 1067
        trigger_flags = 1068
        trigger_index = 1069
        verify_script = 1079
        changelog_time = 1080
        changelog_name = 1081
        changelog_text = 1082
        broken_md5_internal = 1083
        prereq_internal = 1084
        pre_install_interpreter = 1085
        post_install_interpreter = 1086
        pre_uninstall_interpreter = 1087
        post_uninstall_interpreter = 1088
        build_archs = 1089
        obsolete_name = 1090
        verify_script_prog = 1091
        trigger_script_prog = 1092
        doc_dir_internal = 1093
        cookie = 1094
        file_devices = 1095
        file_inodes = 1096
        file_langs = 1097
        prefixes = 1098
        install_prefixes = 1099
        trigger_install_internal = 1100
        trigger_uninstall_internal = 1101
        trigger_post_uninstall_internal = 1102
        autoreq_internal = 1103
        autoprov_internal = 1104
        capability_internal = 1105
        source_package = 1106
        old_orig_filenames_internal = 1107
        build_prereq_internal = 1108
        build_requires_internal = 1109
        build_conflicts_internal = 1110
        build_macros_internal = 1111
        provide_flags = 1112
        provide_version = 1113
        obsolete_flags = 1114
        obsolete_version = 1115
        dir_indexes = 1116
        base_names = 1117
        dir_names = 1118
        orig_dir_indexes = 1119
        orig_base_names = 1120
        orig_dir_names = 1121
        opt_flags = 1122
        dist_url = 1123
        payload_format = 1124
        payload_compressor = 1125
        payload_flags = 1126
        install_color = 1127
        install_tid = 1128
        remove_tid_obsolete = 1129
        sha1_rhn_internal = 1130
        rhn_platform_internal = 1131
        platform = 1132
        patches_name_obsolete = 1133
        patches_flags_obsolete = 1134
        patches_version_obsolete = 1135
        cache_ctime_internal = 1136
        cache_pkg_path_internal = 1137
        cache_pkg_size_internal = 1138
        cache_pkg_mtime_internal = 1139
        file_colors = 1140
        file_class = 1141
        class_dict = 1142
        file_depends_idx = 1143
        file_depends_num = 1144
        depends_dict = 1145
        source_pkgid = 1146
        file_contexts_obsolete = 1147
        fs_contexts_obsolete = 1148
        re_contexts_obsolete = 1149
        policies = 1150
        pre_trans = 1151
        post_trans = 1152
        pre_trans_prog = 1153
        post_trans_prog = 1154
        dist_tag = 1155
        old_suggests_name_obsolete = 1156
        old_suggests_version_obsolete = 1157
        old_suggests_flags_obsolete = 1158
        old_enhances_name_obsolete = 1159
        old_enhances_version_obsolete = 1160
        old_enhances_flags_obsolete = 1161
        priority_unimplemented = 1162
        cvsid_unimplemented = 1163
        blink_pkgid_unimplemented = 1164
        blink_hdrid_unimplemented = 1165
        blink_nevra_unimplemented = 1166
        flink_pkgid_unimplemented = 1167
        flink_hdrid_unimplemented = 1168
        flink_nevra_unimplemented = 1169
        package_origin_unimplemented = 1170
        trigger_pre_install_internal = 1171
        build_suggests_unimplemented = 1172
        build_enhances_unimplemented = 1173
        script_states_unimplemented = 1174
        script_metrics_unimplemented = 1175
        build_cpu_clock_unimplemented = 1176
        file_digest_algos_unimplemented = 1177
        variants_unimplemented = 1178
        xmajor_unimplemented = 1179
        xminor_unimplemented = 1180
        repo_tag_unimplemented = 1181
        keywords_unimplemented = 1182
        build_platforms_unimplemented = 1183
        package_color_unimplemented = 1184
        package_pref_color_unimplemented = 1185
        xattrs_dict_unimplemented = 1186
        filex_attrsx_unimplemented = 1187
        dep_attrs_dict_unimplemented = 1188
        conflict_attrsx_unimplemented = 1189
        obsolete_attrsx_unimplemented = 1190
        provide_attrsx_unimplemented = 1191
        require_attrsx_unimplemented = 1192
        build_provides_unimplemented = 1193
        build_obsoletes_unimplemented = 1194
        db_instance = 1195
        nvra = 1196
        file_names = 5000
        file_provide = 5001
        file_require = 5002
        fs_names_unimplemented = 5003
        fs_sizes_unimplemented = 5004
        trigger_conds = 5005
        trigger_type = 5006
        orig_file_names = 5007
        long_file_sizes = 5008
        long_size = 5009
        file_caps = 5010
        file_digest_algo = 5011
        bug_url = 5012
        evr = 5013
        nvr = 5014
        nevr = 5015
        nevra = 5016
        header_color = 5017
        verbose = 5018
        epoch_num = 5019
        pre_install_flags = 5020
        post_install_flags = 5021
        pre_uninstall_flags = 5022
        post_uninstall_flags = 5023
        pre_trans_flags = 5024
        post_trans_flags = 5025
        verify_script_flags = 5026
        trigger_script_flags = 5027
        collections_unimplemented = 5029
        policy_names = 5030
        policy_types = 5031
        policy_types_indexes = 5032
        policy_flags = 5033
        vcs = 5034
        order_name = 5035
        order_version = 5036
        order_flags = 5037
        mssf_manifest_unimplemented = 5038
        mssf_domain_unimplemented = 5039
        inst_file_names = 5040
        require_nevrs = 5041
        provide_nevrs = 5042
        obsolete_nevrs = 5043
        conflict_nevrs = 5044
        file_nlinks = 5045
        recommend_name = 5046
        recommend_version = 5047
        recommend_flags = 5048
        suggest_name = 5049
        suggest_version = 5050
        suggest_flags = 5051
        supplement_name = 5052
        supplement_version = 5053
        supplement_flags = 5054
        enhance_name = 5055
        enhance_version = 5056
        enhance_flags = 5057
        recommend_nevrs = 5058
        suggest_nevrs = 5059
        supplement_nevrs = 5060
        enhance_nevrs = 5061
        encoding = 5062
        file_trigger_install_internal = 5063
        file_trigger_uninstall_internal = 5064
        file_trigger_post_uninstall_internal = 5065
        file_trigger_scripts = 5066
        file_trigger_script_prog = 5067
        file_trigger_script_flags = 5068
        file_trigger_name = 5069
        file_trigger_index = 5070
        file_trigger_version = 5071
        file_trigger_flags = 5072
        trans_file_trigger_install_internal = 5073
        trans_file_trigger_uninstall_internal = 5074
        trans_file_trigger_post_uninstall_internal = 5075
        trans_file_trigger_scripts = 5076
        trans_file_trigger_script_prog = 5077
        trans_file_trigger_script_flags = 5078
        trans_file_trigger_name = 5079
        trans_file_trigger_index = 5080
        trans_file_trigger_version = 5081
        trans_file_trigger_flags = 5082
        remove_path_postfixes_internal = 5083
        file_trigger_priorities = 5084
        trans_file_trigger_priorities = 5085
        file_trigger_conds = 5086
        file_trigger_type = 5087
        trans_file_trigger_conds = 5088
        trans_file_trigger_type = 5089
        file_signatures = 5090
        file_signature_length = 5091
        payload_digest = 5092
        payload_digest_algo = 5093
        auto_installed_unimplemented = 5094
        identity_unimplemented = 5095
        modularity_label = 5096
        payload_digest_alt = 5097
        arch_suffix = 5098
        spec = 5099
        translation_url = 5100
        upstream_releases = 5101
        source_license_internal = 5102
        pre_untrans = 5103
        post_untrans = 5104
        pre_untrans_prog = 5105
        post_untrans_prog = 5106
        pre_untrans_flags = 5107
        post_untrans_flags = 5108
        sys_users = 5109

    class OperatingSystems(IntEnum):
        linux = 1
        irix = 2
        no_os = 255

    class RecordTypes(IntEnum):
        not_implemented = 0
        char = 1
        uint8 = 2
        uint16 = 3
        uint32 = 4
        uint64 = 5
        string = 6
        bin = 7
        string_array = 8
        i18n_string = 9

    class RpmTypes(IntEnum):
        binary = 0
        source = 1

    class SignatureTags(IntEnum):
        signatures = 62
        header_immutable = 63
        i18n_table = 100
        bad_sha1_1_obsolete = 264
        bad_sha1_2_obsolete = 265
        dsa = 267
        rsa = 268
        sha1 = 269
        long_size = 270
        long_archive_size = 271
        sha256 = 273
        file_signatures = 274
        file_signature_length = 275
        verity_signatures = 276
        verity_signature_algo = 277
        size = 1000
        le_md5_1_obsolete = 1001
        pgp = 1002
        le_md5_2_obsolete = 1003
        md5 = 1004
        gpg = 1005
        pgp5_obsolete = 1006
        payload_size = 1007
        reserved_space = 1008
    def __init__(self, _io=None, _parent=None, _root=None):
        super(Rpm, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self
        self._should_write_payload = False
        self.payload__enabled = True

    def _read(self):
        self.lead = Rpm.Lead(self._io, self, self._root)
        self.lead._read()
        self.signature = Rpm.Header(True, self._io, self, self._root)
        self.signature._read()
        self.signature_padding = self._io.read_bytes(-(self._io.pos()) % 8)
        if self.ofs_header < 0:
            pass
            self._unnamed3 = self._io.read_bytes(0)

        self.header = Rpm.Header(False, self._io, self, self._root)
        self.header._read()
        if self.ofs_payload < 0:
            pass
            self._unnamed5 = self._io.read_bytes(0)

        self.signature_tags_steps = []
        for i in range(self.signature.header_record.num_index_records):
            _t_signature_tags_steps = Rpm.SignatureTagsStep(i, (-1 if i < 1 else self.signature_tags_steps[i - 1].size_tag_idx), self._io, self, self._root)
            try:
                _t_signature_tags_steps._read()
            finally:
                self.signature_tags_steps.append(_t_signature_tags_steps)

        self._dirty = False


    def _fetch_instances(self):
        pass
        self.lead._fetch_instances()
        self.signature._fetch_instances()
        if self.ofs_header < 0:
            pass

        self.header._fetch_instances()
        if self.ofs_payload < 0:
            pass

        for i in range(len(self.signature_tags_steps)):
            pass
            self.signature_tags_steps[i]._fetch_instances()

        _ = self.payload
        if hasattr(self, '_m_payload'):
            pass



    def _write__seq(self, io=None):
        super(Rpm, self)._write__seq(io)
        self._should_write_payload = self.payload__enabled
        self.lead._write__seq(self._io)
        self.signature._write__seq(self._io)
        if len(self.signature_padding) != -(self._io.pos()) % 8:
            raise kaitaistruct.ConsistencyError(u"signature_padding", -(self._io.pos()) % 8, len(self.signature_padding))
        self._io.write_bytes(self.signature_padding)
        if self.ofs_header < 0:
            pass
            if len(self._unnamed3) != 0:
                raise kaitaistruct.ConsistencyError(u"_unnamed3", 0, len(self._unnamed3))
            self._io.write_bytes(self._unnamed3)

        self.header._write__seq(self._io)
        if self.ofs_payload < 0:
            pass
            if len(self._unnamed5) != 0:
                raise kaitaistruct.ConsistencyError(u"_unnamed5", 0, len(self._unnamed5))
            self._io.write_bytes(self._unnamed5)

        for i in range(len(self.signature_tags_steps)):
            pass
            self.signature_tags_steps[i]._write__seq(self._io)



    def _check(self):
        if self.lead._root != self._root:
            raise kaitaistruct.ConsistencyError(u"lead", self._root, self.lead._root)
        if self.lead._parent != self:
            raise kaitaistruct.ConsistencyError(u"lead", self, self.lead._parent)
        if self.signature._root != self._root:
            raise kaitaistruct.ConsistencyError(u"signature", self._root, self.signature._root)
        if self.signature._parent != self:
            raise kaitaistruct.ConsistencyError(u"signature", self, self.signature._parent)
        if self.signature.is_signature != True:
            raise kaitaistruct.ConsistencyError(u"signature", True, self.signature.is_signature)
        if self.header._root != self._root:
            raise kaitaistruct.ConsistencyError(u"header", self._root, self.header._root)
        if self.header._parent != self:
            raise kaitaistruct.ConsistencyError(u"header", self, self.header._parent)
        if self.header.is_signature != False:
            raise kaitaistruct.ConsistencyError(u"header", False, self.header.is_signature)
        if len(self.signature_tags_steps) != self.signature.header_record.num_index_records:
            raise kaitaistruct.ConsistencyError(u"signature_tags_steps", self.signature.header_record.num_index_records, len(self.signature_tags_steps))
        for i in range(len(self.signature_tags_steps)):
            pass
            if self.signature_tags_steps[i]._root != self._root:
                raise kaitaistruct.ConsistencyError(u"signature_tags_steps", self._root, self.signature_tags_steps[i]._root)
            if self.signature_tags_steps[i]._parent != self:
                raise kaitaistruct.ConsistencyError(u"signature_tags_steps", self, self.signature_tags_steps[i]._parent)
            if self.signature_tags_steps[i].idx != i:
                raise kaitaistruct.ConsistencyError(u"signature_tags_steps", i, self.signature_tags_steps[i].idx)
            if self.signature_tags_steps[i].prev_size_tag_idx != (-1 if i < 1 else self.signature_tags_steps[i - 1].size_tag_idx):
                raise kaitaistruct.ConsistencyError(u"signature_tags_steps", (-1 if i < 1 else self.signature_tags_steps[i - 1].size_tag_idx), self.signature_tags_steps[i].prev_size_tag_idx)

        if self.payload__enabled:
            pass
            if self.has_signature_size_tag:
                pass


        self._dirty = False

    class Dummy(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Rpm.Dummy, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            pass
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(Rpm.Dummy, self)._write__seq(io)


        def _check(self):
            self._dirty = False


    class Header(ReadWriteKaitaiStruct):
        """header structure used for both the "header" and "signature", but some tag
        values have different meanings in signature and header (hence they use
        different enums)
        """
        def __init__(self, is_signature, _io=None, _parent=None, _root=None):
            super(Rpm.Header, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self.is_signature = is_signature

        def _read(self):
            self.header_record = Rpm.HeaderRecord(self._io, self, self._root)
            self.header_record._read()
            self.index_records = []
            for i in range(self.header_record.num_index_records):
                _t_index_records = Rpm.HeaderIndexRecord(self._io, self, self._root)
                try:
                    _t_index_records._read()
                finally:
                    self.index_records.append(_t_index_records)

            self._raw_storage_section = self._io.read_bytes(self.header_record.len_storage_section)
            _io__raw_storage_section = KaitaiStream(BytesIO(self._raw_storage_section))
            self.storage_section = Rpm.Dummy(_io__raw_storage_section, self, self._root)
            self.storage_section._read()
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.header_record._fetch_instances()
            for i in range(len(self.index_records)):
                pass
                self.index_records[i]._fetch_instances()

            self.storage_section._fetch_instances()


        def _write__seq(self, io=None):
            super(Rpm.Header, self)._write__seq(io)
            self.header_record._write__seq(self._io)
            for i in range(len(self.index_records)):
                pass
                self.index_records[i]._write__seq(self._io)

            _io__raw_storage_section = KaitaiStream(BytesIO(bytearray(self.header_record.len_storage_section)))
            self._io.add_child_stream(_io__raw_storage_section)
            _pos2 = self._io.pos()
            self._io.seek(self._io.pos() + (self.header_record.len_storage_section))
            def handler(parent, _io__raw_storage_section=_io__raw_storage_section):
                self._raw_storage_section = _io__raw_storage_section.to_byte_array()
                if len(self._raw_storage_section) != self.header_record.len_storage_section:
                    raise kaitaistruct.ConsistencyError(u"raw(storage_section)", self.header_record.len_storage_section, len(self._raw_storage_section))
                parent.write_bytes(self._raw_storage_section)
            _io__raw_storage_section.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
            self.storage_section._write__seq(_io__raw_storage_section)


        def _check(self):
            if self.header_record._root != self._root:
                raise kaitaistruct.ConsistencyError(u"header_record", self._root, self.header_record._root)
            if self.header_record._parent != self:
                raise kaitaistruct.ConsistencyError(u"header_record", self, self.header_record._parent)
            if len(self.index_records) != self.header_record.num_index_records:
                raise kaitaistruct.ConsistencyError(u"index_records", self.header_record.num_index_records, len(self.index_records))
            for i in range(len(self.index_records)):
                pass
                if self.index_records[i]._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"index_records", self._root, self.index_records[i]._root)
                if self.index_records[i]._parent != self:
                    raise kaitaistruct.ConsistencyError(u"index_records", self, self.index_records[i]._parent)

            if self.storage_section._root != self._root:
                raise kaitaistruct.ConsistencyError(u"storage_section", self._root, self.storage_section._root)
            if self.storage_section._parent != self:
                raise kaitaistruct.ConsistencyError(u"storage_section", self, self.storage_section._parent)
            self._dirty = False

        @property
        def is_header(self):
            if hasattr(self, '_m_is_header'):
                return self._m_is_header

            self._m_is_header = (not (self.is_signature))
            return getattr(self, '_m_is_header', None)

        def _invalidate_is_header(self):
            del self._m_is_header

    class HeaderIndexRecord(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Rpm.HeaderIndexRecord, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._should_write_body = False
            self.body__enabled = True

        def _read(self):
            self.tag_raw = self._io.read_u4be()
            self.record_type = KaitaiStream.resolve_enum(Rpm.RecordTypes, self._io.read_u4be())
            self.ofs_body = self._io.read_u4be()
            self.count = self._io.read_u4be()
            self._dirty = False


        def _fetch_instances(self):
            pass
            _ = self.body
            if hasattr(self, '_m_body'):
                pass
                _on = self.record_type
                if _on == Rpm.RecordTypes.bin:
                    pass
                    self._m_body._fetch_instances()
                elif _on == Rpm.RecordTypes.char:
                    pass
                    self._m_body._fetch_instances()
                elif _on == Rpm.RecordTypes.i18n_string:
                    pass
                    self._m_body._fetch_instances()
                elif _on == Rpm.RecordTypes.string:
                    pass
                    self._m_body._fetch_instances()
                elif _on == Rpm.RecordTypes.string_array:
                    pass
                    self._m_body._fetch_instances()
                elif _on == Rpm.RecordTypes.uint16:
                    pass
                    self._m_body._fetch_instances()
                elif _on == Rpm.RecordTypes.uint32:
                    pass
                    self._m_body._fetch_instances()
                elif _on == Rpm.RecordTypes.uint64:
                    pass
                    self._m_body._fetch_instances()
                elif _on == Rpm.RecordTypes.uint8:
                    pass
                    self._m_body._fetch_instances()



        def _write__seq(self, io=None):
            super(Rpm.HeaderIndexRecord, self)._write__seq(io)
            self._should_write_body = self.body__enabled
            self._io.write_u4be(self.tag_raw)
            self._io.write_u4be(int(self.record_type))
            self._io.write_u4be(self.ofs_body)
            self._io.write_u4be(self.count)


        def _check(self):
            if self.body__enabled:
                pass
                _on = self.record_type
                if _on == Rpm.RecordTypes.bin:
                    pass
                    if self._m_body._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"body", self._root, self._m_body._root)
                    if self._m_body._parent != self:
                        raise kaitaistruct.ConsistencyError(u"body", self, self._m_body._parent)
                    if self._m_body.len_value != self.len_value:
                        raise kaitaistruct.ConsistencyError(u"body", self.len_value, self._m_body.len_value)
                elif _on == Rpm.RecordTypes.char:
                    pass
                    if self._m_body._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"body", self._root, self._m_body._root)
                    if self._m_body._parent != self:
                        raise kaitaistruct.ConsistencyError(u"body", self, self._m_body._parent)
                    if self._m_body.num_values != self.num_values:
                        raise kaitaistruct.ConsistencyError(u"body", self.num_values, self._m_body.num_values)
                elif _on == Rpm.RecordTypes.i18n_string:
                    pass
                    if self._m_body._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"body", self._root, self._m_body._root)
                    if self._m_body._parent != self:
                        raise kaitaistruct.ConsistencyError(u"body", self, self._m_body._parent)
                    if self._m_body.num_values != self.num_values:
                        raise kaitaistruct.ConsistencyError(u"body", self.num_values, self._m_body.num_values)
                elif _on == Rpm.RecordTypes.string:
                    pass
                    if self._m_body._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"body", self._root, self._m_body._root)
                    if self._m_body._parent != self:
                        raise kaitaistruct.ConsistencyError(u"body", self, self._m_body._parent)
                elif _on == Rpm.RecordTypes.string_array:
                    pass
                    if self._m_body._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"body", self._root, self._m_body._root)
                    if self._m_body._parent != self:
                        raise kaitaistruct.ConsistencyError(u"body", self, self._m_body._parent)
                    if self._m_body.num_values != self.num_values:
                        raise kaitaistruct.ConsistencyError(u"body", self.num_values, self._m_body.num_values)
                elif _on == Rpm.RecordTypes.uint16:
                    pass
                    if self._m_body._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"body", self._root, self._m_body._root)
                    if self._m_body._parent != self:
                        raise kaitaistruct.ConsistencyError(u"body", self, self._m_body._parent)
                    if self._m_body.num_values != self.num_values:
                        raise kaitaistruct.ConsistencyError(u"body", self.num_values, self._m_body.num_values)
                elif _on == Rpm.RecordTypes.uint32:
                    pass
                    if self._m_body._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"body", self._root, self._m_body._root)
                    if self._m_body._parent != self:
                        raise kaitaistruct.ConsistencyError(u"body", self, self._m_body._parent)
                    if self._m_body.num_values != self.num_values:
                        raise kaitaistruct.ConsistencyError(u"body", self.num_values, self._m_body.num_values)
                elif _on == Rpm.RecordTypes.uint64:
                    pass
                    if self._m_body._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"body", self._root, self._m_body._root)
                    if self._m_body._parent != self:
                        raise kaitaistruct.ConsistencyError(u"body", self, self._m_body._parent)
                    if self._m_body.num_values != self.num_values:
                        raise kaitaistruct.ConsistencyError(u"body", self.num_values, self._m_body.num_values)
                elif _on == Rpm.RecordTypes.uint8:
                    pass
                    if self._m_body._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"body", self._root, self._m_body._root)
                    if self._m_body._parent != self:
                        raise kaitaistruct.ConsistencyError(u"body", self, self._m_body._parent)
                    if self._m_body.num_values != self.num_values:
                        raise kaitaistruct.ConsistencyError(u"body", self.num_values, self._m_body.num_values)

            self._dirty = False

        @property
        def body(self):
            if self._should_write_body:
                self._write_body()
            if hasattr(self, '_m_body'):
                return self._m_body

            if not self.body__enabled:
                return None

            io = self._parent.storage_section._io
            _pos = io.pos()
            io.seek(self.ofs_body)
            _on = self.record_type
            if _on == Rpm.RecordTypes.bin:
                pass
                self._m_body = Rpm.RecordTypeBin(self.len_value, io, self, self._root)
                self._m_body._read()
            elif _on == Rpm.RecordTypes.char:
                pass
                self._m_body = Rpm.RecordTypeUint8(self.num_values, io, self, self._root)
                self._m_body._read()
            elif _on == Rpm.RecordTypes.i18n_string:
                pass
                self._m_body = Rpm.RecordTypeStringArray(self.num_values, io, self, self._root)
                self._m_body._read()
            elif _on == Rpm.RecordTypes.string:
                pass
                self._m_body = Rpm.RecordTypeString(io, self, self._root)
                self._m_body._read()
            elif _on == Rpm.RecordTypes.string_array:
                pass
                self._m_body = Rpm.RecordTypeStringArray(self.num_values, io, self, self._root)
                self._m_body._read()
            elif _on == Rpm.RecordTypes.uint16:
                pass
                self._m_body = Rpm.RecordTypeUint16(self.num_values, io, self, self._root)
                self._m_body._read()
            elif _on == Rpm.RecordTypes.uint32:
                pass
                self._m_body = Rpm.RecordTypeUint32(self.num_values, io, self, self._root)
                self._m_body._read()
            elif _on == Rpm.RecordTypes.uint64:
                pass
                self._m_body = Rpm.RecordTypeUint64(self.num_values, io, self, self._root)
                self._m_body._read()
            elif _on == Rpm.RecordTypes.uint8:
                pass
                self._m_body = Rpm.RecordTypeUint8(self.num_values, io, self, self._root)
                self._m_body._read()
            io.seek(_pos)
            return getattr(self, '_m_body', None)

        @body.setter
        def body(self, v):
            self._dirty = True
            self._m_body = v

        def _write_body(self):
            self._should_write_body = False
            io = self._parent.storage_section._io
            _pos = io.pos()
            io.seek(self.ofs_body)
            _on = self.record_type
            if _on == Rpm.RecordTypes.bin:
                pass
                self._m_body._write__seq(io)
            elif _on == Rpm.RecordTypes.char:
                pass
                self._m_body._write__seq(io)
            elif _on == Rpm.RecordTypes.i18n_string:
                pass
                self._m_body._write__seq(io)
            elif _on == Rpm.RecordTypes.string:
                pass
                self._m_body._write__seq(io)
            elif _on == Rpm.RecordTypes.string_array:
                pass
                self._m_body._write__seq(io)
            elif _on == Rpm.RecordTypes.uint16:
                pass
                self._m_body._write__seq(io)
            elif _on == Rpm.RecordTypes.uint32:
                pass
                self._m_body._write__seq(io)
            elif _on == Rpm.RecordTypes.uint64:
                pass
                self._m_body._write__seq(io)
            elif _on == Rpm.RecordTypes.uint8:
                pass
                self._m_body._write__seq(io)
            io.seek(_pos)

        @property
        def header_tag(self):
            if hasattr(self, '_m_header_tag'):
                return self._m_header_tag

            if self._parent.is_header:
                pass
                self._m_header_tag = KaitaiStream.resolve_enum(Rpm.HeaderTags, self.tag_raw)

            return getattr(self, '_m_header_tag', None)

        def _invalidate_header_tag(self):
            del self._m_header_tag
        @property
        def len_value(self):
            if hasattr(self, '_m_len_value'):
                return self._m_len_value

            if self.record_type == Rpm.RecordTypes.bin:
                pass
                self._m_len_value = self.count

            return getattr(self, '_m_len_value', None)

        def _invalidate_len_value(self):
            del self._m_len_value
        @property
        def num_values(self):
            if hasattr(self, '_m_num_values'):
                return self._m_num_values

            if self.record_type != Rpm.RecordTypes.bin:
                pass
                self._m_num_values = self.count

            return getattr(self, '_m_num_values', None)

        def _invalidate_num_values(self):
            del self._m_num_values
        @property
        def signature_tag(self):
            if hasattr(self, '_m_signature_tag'):
                return self._m_signature_tag

            if self._parent.is_signature:
                pass
                self._m_signature_tag = KaitaiStream.resolve_enum(Rpm.SignatureTags, self.tag_raw)

            return getattr(self, '_m_signature_tag', None)

        def _invalidate_signature_tag(self):
            del self._m_signature_tag

    class HeaderRecord(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Rpm.HeaderRecord, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.magic = self._io.read_bytes(4)
            if not self.magic == b"\x8E\xAD\xE8\x01":
                raise kaitaistruct.ValidationNotEqualError(b"\x8E\xAD\xE8\x01", self.magic, self._io, u"/types/header_record/seq/0")
            self.reserved = self._io.read_bytes(4)
            if not self.reserved == b"\x00\x00\x00\x00":
                raise kaitaistruct.ValidationNotEqualError(b"\x00\x00\x00\x00", self.reserved, self._io, u"/types/header_record/seq/1")
            self.num_index_records = self._io.read_u4be()
            if not self.num_index_records >= 1:
                raise kaitaistruct.ValidationLessThanError(1, self.num_index_records, self._io, u"/types/header_record/seq/2")
            self.len_storage_section = self._io.read_u4be()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(Rpm.HeaderRecord, self)._write__seq(io)
            self._io.write_bytes(self.magic)
            self._io.write_bytes(self.reserved)
            self._io.write_u4be(self.num_index_records)
            self._io.write_u4be(self.len_storage_section)


        def _check(self):
            if len(self.magic) != 4:
                raise kaitaistruct.ConsistencyError(u"magic", 4, len(self.magic))
            if not self.magic == b"\x8E\xAD\xE8\x01":
                raise kaitaistruct.ValidationNotEqualError(b"\x8E\xAD\xE8\x01", self.magic, None, u"/types/header_record/seq/0")
            if len(self.reserved) != 4:
                raise kaitaistruct.ConsistencyError(u"reserved", 4, len(self.reserved))
            if not self.reserved == b"\x00\x00\x00\x00":
                raise kaitaistruct.ValidationNotEqualError(b"\x00\x00\x00\x00", self.reserved, None, u"/types/header_record/seq/1")
            if not self.num_index_records >= 1:
                raise kaitaistruct.ValidationLessThanError(1, self.num_index_records, None, u"/types/header_record/seq/2")
            self._dirty = False


    class Lead(ReadWriteKaitaiStruct):
        """In 2021, Panu Matilainen (a RPM developer) [described this
        structure](https://github.com/kaitai-io/kaitai_struct_formats/pull/469#discussion_r718288192)
        as follows:
        
        > The lead as a structure is 25 years obsolete, the data there is
        > meaningless. Seriously. Except to check for the magic to detect that
        > it's an rpm file in the first place, just ignore everything in it.
        > Literally everything.
        
        The fields with `valid` constraints are important, because these are the
        same validations that RPM does (which means that any valid `.rpm` file
        must pass them), but otherwise you should not make decisions based on the
        values given here.
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Rpm.Lead, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.magic = self._io.read_bytes(4)
            if not self.magic == b"\xED\xAB\xEE\xDB":
                raise kaitaistruct.ValidationNotEqualError(b"\xED\xAB\xEE\xDB", self.magic, self._io, u"/types/lead/seq/0")
            self.version = Rpm.RpmVersion(self._io, self, self._root)
            self.version._read()
            self.type = KaitaiStream.resolve_enum(Rpm.RpmTypes, self._io.read_u2be())
            self.architecture = KaitaiStream.resolve_enum(Rpm.Architectures, self._io.read_u2be())
            self.package_name = (KaitaiStream.bytes_terminate(self._io.read_bytes(66), 0, False)).decode(u"UTF-8")
            self.os = KaitaiStream.resolve_enum(Rpm.OperatingSystems, self._io.read_u2be())
            self.signature_type = self._io.read_u2be()
            if not self.signature_type == 5:
                raise kaitaistruct.ValidationNotEqualError(5, self.signature_type, self._io, u"/types/lead/seq/6")
            self.reserved = self._io.read_bytes(16)
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.version._fetch_instances()


        def _write__seq(self, io=None):
            super(Rpm.Lead, self)._write__seq(io)
            self._io.write_bytes(self.magic)
            self.version._write__seq(self._io)
            self._io.write_u2be(int(self.type))
            self._io.write_u2be(int(self.architecture))
            self._io.write_bytes_limit((self.package_name).encode(u"UTF-8"), 66, 0, 0)
            self._io.write_u2be(int(self.os))
            self._io.write_u2be(self.signature_type)
            self._io.write_bytes(self.reserved)


        def _check(self):
            if len(self.magic) != 4:
                raise kaitaistruct.ConsistencyError(u"magic", 4, len(self.magic))
            if not self.magic == b"\xED\xAB\xEE\xDB":
                raise kaitaistruct.ValidationNotEqualError(b"\xED\xAB\xEE\xDB", self.magic, None, u"/types/lead/seq/0")
            if self.version._root != self._root:
                raise kaitaistruct.ConsistencyError(u"version", self._root, self.version._root)
            if self.version._parent != self:
                raise kaitaistruct.ConsistencyError(u"version", self, self.version._parent)
            if len((self.package_name).encode(u"UTF-8")) > 66:
                raise kaitaistruct.ConsistencyError(u"package_name", 66, len((self.package_name).encode(u"UTF-8")))
            if KaitaiStream.byte_array_index_of((self.package_name).encode(u"UTF-8"), 0) != -1:
                raise kaitaistruct.ConsistencyError(u"package_name", -1, KaitaiStream.byte_array_index_of((self.package_name).encode(u"UTF-8"), 0))
            if not self.signature_type == 5:
                raise kaitaistruct.ValidationNotEqualError(5, self.signature_type, None, u"/types/lead/seq/6")
            if len(self.reserved) != 16:
                raise kaitaistruct.ConsistencyError(u"reserved", 16, len(self.reserved))
            self._dirty = False


    class RecordTypeBin(ReadWriteKaitaiStruct):
        def __init__(self, len_value, _io=None, _parent=None, _root=None):
            super(Rpm.RecordTypeBin, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self.len_value = len_value

        def _read(self):
            self.values = []
            for i in range(1):
                self.values.append(self._io.read_bytes(self.len_value))

            self._dirty = False


        def _fetch_instances(self):
            pass
            for i in range(len(self.values)):
                pass



        def _write__seq(self, io=None):
            super(Rpm.RecordTypeBin, self)._write__seq(io)
            for i in range(len(self.values)):
                pass
                self._io.write_bytes(self.values[i])



        def _check(self):
            if len(self.values) != 1:
                raise kaitaistruct.ConsistencyError(u"values", 1, len(self.values))
            for i in range(len(self.values)):
                pass
                if len(self.values[i]) != self.len_value:
                    raise kaitaistruct.ConsistencyError(u"values", self.len_value, len(self.values[i]))

            self._dirty = False


    class RecordTypeString(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Rpm.RecordTypeString, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.values = []
            for i in range(1):
                self.values.append((self._io.read_bytes_term(0, False, True, True)).decode(u"UTF-8"))

            self._dirty = False


        def _fetch_instances(self):
            pass
            for i in range(len(self.values)):
                pass



        def _write__seq(self, io=None):
            super(Rpm.RecordTypeString, self)._write__seq(io)
            for i in range(len(self.values)):
                pass
                self._io.write_bytes((self.values[i]).encode(u"UTF-8"))
                self._io.write_u1(0)



        def _check(self):
            if len(self.values) != 1:
                raise kaitaistruct.ConsistencyError(u"values", 1, len(self.values))
            for i in range(len(self.values)):
                pass
                if KaitaiStream.byte_array_index_of((self.values[i]).encode(u"UTF-8"), 0) != -1:
                    raise kaitaistruct.ConsistencyError(u"values", -1, KaitaiStream.byte_array_index_of((self.values[i]).encode(u"UTF-8"), 0))

            self._dirty = False


    class RecordTypeStringArray(ReadWriteKaitaiStruct):
        def __init__(self, num_values, _io=None, _parent=None, _root=None):
            super(Rpm.RecordTypeStringArray, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self.num_values = num_values

        def _read(self):
            self.values = []
            for i in range(self.num_values):
                self.values.append((self._io.read_bytes_term(0, False, True, True)).decode(u"UTF-8"))

            self._dirty = False


        def _fetch_instances(self):
            pass
            for i in range(len(self.values)):
                pass



        def _write__seq(self, io=None):
            super(Rpm.RecordTypeStringArray, self)._write__seq(io)
            for i in range(len(self.values)):
                pass
                self._io.write_bytes((self.values[i]).encode(u"UTF-8"))
                self._io.write_u1(0)



        def _check(self):
            if len(self.values) != self.num_values:
                raise kaitaistruct.ConsistencyError(u"values", self.num_values, len(self.values))
            for i in range(len(self.values)):
                pass
                if KaitaiStream.byte_array_index_of((self.values[i]).encode(u"UTF-8"), 0) != -1:
                    raise kaitaistruct.ConsistencyError(u"values", -1, KaitaiStream.byte_array_index_of((self.values[i]).encode(u"UTF-8"), 0))

            self._dirty = False


    class RecordTypeUint16(ReadWriteKaitaiStruct):
        def __init__(self, num_values, _io=None, _parent=None, _root=None):
            super(Rpm.RecordTypeUint16, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self.num_values = num_values

        def _read(self):
            self.values = []
            for i in range(self.num_values):
                self.values.append(self._io.read_u2be())

            self._dirty = False


        def _fetch_instances(self):
            pass
            for i in range(len(self.values)):
                pass



        def _write__seq(self, io=None):
            super(Rpm.RecordTypeUint16, self)._write__seq(io)
            for i in range(len(self.values)):
                pass
                self._io.write_u2be(self.values[i])



        def _check(self):
            if len(self.values) != self.num_values:
                raise kaitaistruct.ConsistencyError(u"values", self.num_values, len(self.values))
            for i in range(len(self.values)):
                pass

            self._dirty = False


    class RecordTypeUint32(ReadWriteKaitaiStruct):
        def __init__(self, num_values, _io=None, _parent=None, _root=None):
            super(Rpm.RecordTypeUint32, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self.num_values = num_values

        def _read(self):
            self.values = []
            for i in range(self.num_values):
                self.values.append(self._io.read_u4be())

            self._dirty = False


        def _fetch_instances(self):
            pass
            for i in range(len(self.values)):
                pass



        def _write__seq(self, io=None):
            super(Rpm.RecordTypeUint32, self)._write__seq(io)
            for i in range(len(self.values)):
                pass
                self._io.write_u4be(self.values[i])



        def _check(self):
            if len(self.values) != self.num_values:
                raise kaitaistruct.ConsistencyError(u"values", self.num_values, len(self.values))
            for i in range(len(self.values)):
                pass

            self._dirty = False


    class RecordTypeUint64(ReadWriteKaitaiStruct):
        def __init__(self, num_values, _io=None, _parent=None, _root=None):
            super(Rpm.RecordTypeUint64, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self.num_values = num_values

        def _read(self):
            self.values = []
            for i in range(self.num_values):
                self.values.append(self._io.read_u8be())

            self._dirty = False


        def _fetch_instances(self):
            pass
            for i in range(len(self.values)):
                pass



        def _write__seq(self, io=None):
            super(Rpm.RecordTypeUint64, self)._write__seq(io)
            for i in range(len(self.values)):
                pass
                self._io.write_u8be(self.values[i])



        def _check(self):
            if len(self.values) != self.num_values:
                raise kaitaistruct.ConsistencyError(u"values", self.num_values, len(self.values))
            for i in range(len(self.values)):
                pass

            self._dirty = False


    class RecordTypeUint8(ReadWriteKaitaiStruct):
        def __init__(self, num_values, _io=None, _parent=None, _root=None):
            super(Rpm.RecordTypeUint8, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self.num_values = num_values

        def _read(self):
            self.values = []
            for i in range(self.num_values):
                self.values.append(self._io.read_u1())

            self._dirty = False


        def _fetch_instances(self):
            pass
            for i in range(len(self.values)):
                pass



        def _write__seq(self, io=None):
            super(Rpm.RecordTypeUint8, self)._write__seq(io)
            for i in range(len(self.values)):
                pass
                self._io.write_u1(self.values[i])



        def _check(self):
            if len(self.values) != self.num_values:
                raise kaitaistruct.ConsistencyError(u"values", self.num_values, len(self.values))
            for i in range(len(self.values)):
                pass

            self._dirty = False


    class RpmVersion(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Rpm.RpmVersion, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.major = self._io.read_u1()
            if not self.major >= 3:
                raise kaitaistruct.ValidationLessThanError(3, self.major, self._io, u"/types/rpm_version/seq/0")
            if not self.major <= 4:
                raise kaitaistruct.ValidationGreaterThanError(4, self.major, self._io, u"/types/rpm_version/seq/0")
            self.minor = self._io.read_u1()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(Rpm.RpmVersion, self)._write__seq(io)
            self._io.write_u1(self.major)
            self._io.write_u1(self.minor)


        def _check(self):
            if not self.major >= 3:
                raise kaitaistruct.ValidationLessThanError(3, self.major, None, u"/types/rpm_version/seq/0")
            if not self.major <= 4:
                raise kaitaistruct.ValidationGreaterThanError(4, self.major, None, u"/types/rpm_version/seq/0")
            self._dirty = False


    class SignatureTagsStep(ReadWriteKaitaiStruct):
        def __init__(self, idx, prev_size_tag_idx, _io=None, _parent=None, _root=None):
            super(Rpm.SignatureTagsStep, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self.idx = idx
            self.prev_size_tag_idx = prev_size_tag_idx

        def _read(self):
            pass
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(Rpm.SignatureTagsStep, self)._write__seq(io)


        def _check(self):
            self._dirty = False

        @property
        def size_tag_idx(self):
            if hasattr(self, '_m_size_tag_idx'):
                return self._m_size_tag_idx

            self._m_size_tag_idx = (self.prev_size_tag_idx if self.prev_size_tag_idx != -1 else (self.idx if  ((self._parent.signature.index_records[self.idx].signature_tag == Rpm.SignatureTags.size) and (self._parent.signature.index_records[self.idx].record_type == Rpm.RecordTypes.uint32) and (self._parent.signature.index_records[self.idx].num_values >= 1))  else -1))
            return getattr(self, '_m_size_tag_idx', None)

        def _invalidate_size_tag_idx(self):
            del self._m_size_tag_idx

    @property
    def has_signature_size_tag(self):
        if hasattr(self, '_m_has_signature_size_tag'):
            return self._m_has_signature_size_tag

        self._m_has_signature_size_tag = self.signature_tags_steps[-1].size_tag_idx != -1
        return getattr(self, '_m_has_signature_size_tag', None)

    def _invalidate_has_signature_size_tag(self):
        del self._m_has_signature_size_tag
    @property
    def len_header(self):
        if hasattr(self, '_m_len_header'):
            return self._m_len_header

        self._m_len_header = self.ofs_payload - self.ofs_header
        return getattr(self, '_m_len_header', None)

    def _invalidate_len_header(self):
        del self._m_len_header
    @property
    def len_payload(self):
        if hasattr(self, '_m_len_payload'):
            return self._m_len_payload

        if self.has_signature_size_tag:
            pass
            self._m_len_payload = self.signature_size_tag.body.values[0] - self.len_header

        return getattr(self, '_m_len_payload', None)

    def _invalidate_len_payload(self):
        del self._m_len_payload
    @property
    def ofs_header(self):
        if hasattr(self, '_m_ofs_header'):
            return self._m_ofs_header

        self._m_ofs_header = self._io.pos()
        return getattr(self, '_m_ofs_header', None)

    def _invalidate_ofs_header(self):
        del self._m_ofs_header
    @property
    def ofs_payload(self):
        if hasattr(self, '_m_ofs_payload'):
            return self._m_ofs_payload

        self._m_ofs_payload = self._io.pos()
        return getattr(self, '_m_ofs_payload', None)

    def _invalidate_ofs_payload(self):
        del self._m_ofs_payload
    @property
    def payload(self):
        if self._should_write_payload:
            self._write_payload()
        if hasattr(self, '_m_payload'):
            return self._m_payload

        if not self.payload__enabled:
            return None

        if self.has_signature_size_tag:
            pass
            _pos = self._io.pos()
            self._io.seek(self.ofs_payload)
            self._m_payload = self._io.read_bytes(self.len_payload)
            self._io.seek(_pos)

        return getattr(self, '_m_payload', None)

    @payload.setter
    def payload(self, v):
        self._dirty = True
        self._m_payload = v

    def _write_payload(self):
        self._should_write_payload = False
        if self.has_signature_size_tag:
            pass
            _pos = self._io.pos()
            self._io.seek(self.ofs_payload)
            if len(self._m_payload) != self.len_payload:
                raise kaitaistruct.ConsistencyError(u"payload", self.len_payload, len(self._m_payload))
            self._io.write_bytes(self._m_payload)
            self._io.seek(_pos)


    @property
    def signature_size_tag(self):
        if hasattr(self, '_m_signature_size_tag'):
            return self._m_signature_size_tag

        if self.has_signature_size_tag:
            pass
            self._m_signature_size_tag = self.signature.index_records[self.signature_tags_steps[-1].size_tag_idx]

        return getattr(self, '_m_signature_size_tag', None)

    def _invalidate_signature_size_tag(self):
        del self._m_signature_size_tag

