# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import ReadWriteKaitaiStruct, KaitaiStream, BytesIO
import dos_datetime
from enum import IntEnum


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class Zip(ReadWriteKaitaiStruct):
    """ZIP is a popular archive file format, introduced in 1989 by Phil Katz
    and originally implemented in PKZIP utility by PKWARE.
    
    Thanks to solid support of it in most desktop environments and
    operating systems, and algorithms / specs availability in public
    domain, it quickly became tool of choice for implementing file
    containers.
    
    For example, Java .jar files, OpenDocument, Office Open XML, EPUB files
    are actually ZIP archives.
    
    .. seealso::
       Source - https://pkware.cachefly.net/webdocs/casestudies/APPNOTE.TXT
    
    
    .. seealso::
       Source - https://users.cs.jmu.edu/buchhofp/forensics/formats/pkzip.html
    """

    class Compression(IntEnum):
        none = 0
        shrunk = 1
        reduced_1 = 2
        reduced_2 = 3
        reduced_3 = 4
        reduced_4 = 5
        imploded = 6
        deflated = 8
        enhanced_deflated = 9
        pkware_dcl_imploded = 10
        bzip2 = 12
        lzma = 14
        ibm_terse = 18
        ibm_lz77_z = 19
        zstandard = 93
        mp3 = 94
        xz = 95
        jpeg = 96
        wavpack = 97
        ppmd = 98
        aex_encryption_marker = 99

    class ExtraCodes(IntEnum):
        zip64 = 1
        av_info = 7
        os2 = 9
        ntfs = 10
        openvms = 12
        pkware_unix = 13
        file_stream_and_fork_descriptors = 14
        patch_descriptor = 15
        pkcs7 = 20
        x509_cert_id_and_signature_for_file = 21
        x509_cert_id_for_central_dir = 22
        strong_encryption_header = 23
        record_management_controls = 24
        pkcs7_enc_recip_cert_list = 25
        ibm_s390_uncomp = 101
        ibm_s390_comp = 102
        poszip_4690 = 18064
        extended_timestamp = 21589
        beos = 25922
        asi_unix = 30062
        infozip_unix = 30805
        infozip_unix_var_size = 30837
        aex_encryption = 39169
        apache_commons_compress = 41246
        microsoft_open_packaging_growth_hint = 41504
        sms_qdos = 64842
    def __init__(self, _io=None, _parent=None, _root=None):
        super(Zip, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self

    def _read(self):
        self.sections = []
        i = 0
        while not self._io.is_eof():
            _t_sections = Zip.PkSection(self._io, self, self._root)
            try:
                _t_sections._read()
            finally:
                self.sections.append(_t_sections)
            i += 1

        self._dirty = False


    def _fetch_instances(self):
        pass
        for i in range(len(self.sections)):
            pass
            self.sections[i]._fetch_instances()



    def _write__seq(self, io=None):
        super(Zip, self)._write__seq(io)
        for i in range(len(self.sections)):
            pass
            if self._io.is_eof():
                raise kaitaistruct.ConsistencyError(u"sections", 0, self._io.size() - self._io.pos())
            self.sections[i]._write__seq(self._io)

        if not self._io.is_eof():
            raise kaitaistruct.ConsistencyError(u"sections", 0, self._io.size() - self._io.pos())


    def _check(self):
        for i in range(len(self.sections)):
            pass
            if self.sections[i]._root != self._root:
                raise kaitaistruct.ConsistencyError(u"sections", self._root, self.sections[i]._root)
            if self.sections[i]._parent != self:
                raise kaitaistruct.ConsistencyError(u"sections", self, self.sections[i]._parent)

        self._dirty = False

    class CentralDirEntry(ReadWriteKaitaiStruct):
        """
        .. seealso::
           - 4.3.12 - https://pkware.cachefly.net/webdocs/casestudies/APPNOTE.TXT
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Zip.CentralDirEntry, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._should_write_local_header = False
            self.local_header__enabled = True

        def _read(self):
            self.version_made_by = self._io.read_u2le()
            self.version_needed_to_extract = self._io.read_u2le()
            self.flags = self._io.read_u2le()
            self.compression_method = KaitaiStream.resolve_enum(Zip.Compression, self._io.read_u2le())
            self._raw_file_mod_time = self._io.read_bytes(4)
            _io__raw_file_mod_time = KaitaiStream(BytesIO(self._raw_file_mod_time))
            self.file_mod_time = dos_datetime.DosDatetime(_io__raw_file_mod_time)
            self.file_mod_time._read()
            self.crc32 = self._io.read_u4le()
            self.len_body_compressed = self._io.read_u4le()
            self.len_body_uncompressed = self._io.read_u4le()
            self.len_file_name = self._io.read_u2le()
            self.len_extra = self._io.read_u2le()
            self.len_comment = self._io.read_u2le()
            self.disk_number_start = self._io.read_u2le()
            self.int_file_attr = self._io.read_u2le()
            self.ext_file_attr = self._io.read_u4le()
            self.ofs_local_header = self._io.read_s4le()
            self.file_name = (self._io.read_bytes(self.len_file_name)).decode(u"UTF-8")
            self._raw_extra = self._io.read_bytes(self.len_extra)
            _io__raw_extra = KaitaiStream(BytesIO(self._raw_extra))
            self.extra = Zip.Extras(_io__raw_extra, self, self._root)
            self.extra._read()
            self.comment = (self._io.read_bytes(self.len_comment)).decode(u"UTF-8")
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.file_mod_time._fetch_instances()
            self.extra._fetch_instances()
            _ = self.local_header
            if hasattr(self, '_m_local_header'):
                pass
                self._m_local_header._fetch_instances()



        def _write__seq(self, io=None):
            super(Zip.CentralDirEntry, self)._write__seq(io)
            self._should_write_local_header = self.local_header__enabled
            self._io.write_u2le(self.version_made_by)
            self._io.write_u2le(self.version_needed_to_extract)
            self._io.write_u2le(self.flags)
            self._io.write_u2le(int(self.compression_method))
            _io__raw_file_mod_time = KaitaiStream(BytesIO(bytearray(4)))
            self._io.add_child_stream(_io__raw_file_mod_time)
            _pos2 = self._io.pos()
            self._io.seek(self._io.pos() + (4))
            def handler(parent, _io__raw_file_mod_time=_io__raw_file_mod_time):
                self._raw_file_mod_time = _io__raw_file_mod_time.to_byte_array()
                if len(self._raw_file_mod_time) != 4:
                    raise kaitaistruct.ConsistencyError(u"raw(file_mod_time)", 4, len(self._raw_file_mod_time))
                parent.write_bytes(self._raw_file_mod_time)
            _io__raw_file_mod_time.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
            self.file_mod_time._write__seq(_io__raw_file_mod_time)
            self._io.write_u4le(self.crc32)
            self._io.write_u4le(self.len_body_compressed)
            self._io.write_u4le(self.len_body_uncompressed)
            self._io.write_u2le(self.len_file_name)
            self._io.write_u2le(self.len_extra)
            self._io.write_u2le(self.len_comment)
            self._io.write_u2le(self.disk_number_start)
            self._io.write_u2le(self.int_file_attr)
            self._io.write_u4le(self.ext_file_attr)
            self._io.write_s4le(self.ofs_local_header)
            self._io.write_bytes((self.file_name).encode(u"UTF-8"))
            _io__raw_extra = KaitaiStream(BytesIO(bytearray(self.len_extra)))
            self._io.add_child_stream(_io__raw_extra)
            _pos2 = self._io.pos()
            self._io.seek(self._io.pos() + (self.len_extra))
            def handler(parent, _io__raw_extra=_io__raw_extra):
                self._raw_extra = _io__raw_extra.to_byte_array()
                if len(self._raw_extra) != self.len_extra:
                    raise kaitaistruct.ConsistencyError(u"raw(extra)", self.len_extra, len(self._raw_extra))
                parent.write_bytes(self._raw_extra)
            _io__raw_extra.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
            self.extra._write__seq(_io__raw_extra)
            self._io.write_bytes((self.comment).encode(u"UTF-8"))


        def _check(self):
            if len((self.file_name).encode(u"UTF-8")) != self.len_file_name:
                raise kaitaistruct.ConsistencyError(u"file_name", self.len_file_name, len((self.file_name).encode(u"UTF-8")))
            if self.extra._root != self._root:
                raise kaitaistruct.ConsistencyError(u"extra", self._root, self.extra._root)
            if self.extra._parent != self:
                raise kaitaistruct.ConsistencyError(u"extra", self, self.extra._parent)
            if len((self.comment).encode(u"UTF-8")) != self.len_comment:
                raise kaitaistruct.ConsistencyError(u"comment", self.len_comment, len((self.comment).encode(u"UTF-8")))
            if self.local_header__enabled:
                pass
                if self._m_local_header._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"local_header", self._root, self._m_local_header._root)
                if self._m_local_header._parent != self:
                    raise kaitaistruct.ConsistencyError(u"local_header", self, self._m_local_header._parent)

            self._dirty = False

        @property
        def local_header(self):
            if self._should_write_local_header:
                self._write_local_header()
            if hasattr(self, '_m_local_header'):
                return self._m_local_header

            if not self.local_header__enabled:
                return None

            _pos = self._io.pos()
            self._io.seek(self.ofs_local_header)
            self._m_local_header = Zip.PkSection(self._io, self, self._root)
            self._m_local_header._read()
            self._io.seek(_pos)
            return getattr(self, '_m_local_header', None)

        @local_header.setter
        def local_header(self, v):
            self._dirty = True
            self._m_local_header = v

        def _write_local_header(self):
            self._should_write_local_header = False
            _pos = self._io.pos()
            self._io.seek(self.ofs_local_header)
            self._m_local_header._write__seq(self._io)
            self._io.seek(_pos)


    class DataDescriptor(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Zip.DataDescriptor, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.crc32 = self._io.read_u4le()
            self.len_body_compressed = self._io.read_u4le()
            self.len_body_uncompressed = self._io.read_u4le()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(Zip.DataDescriptor, self)._write__seq(io)
            self._io.write_u4le(self.crc32)
            self._io.write_u4le(self.len_body_compressed)
            self._io.write_u4le(self.len_body_uncompressed)


        def _check(self):
            self._dirty = False


    class EndOfCentralDir(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Zip.EndOfCentralDir, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.disk_of_end_of_central_dir = self._io.read_u2le()
            self.disk_of_central_dir = self._io.read_u2le()
            self.num_central_dir_entries_on_disk = self._io.read_u2le()
            self.num_central_dir_entries_total = self._io.read_u2le()
            self.len_central_dir = self._io.read_u4le()
            self.ofs_central_dir = self._io.read_u4le()
            self.len_comment = self._io.read_u2le()
            self.comment = (self._io.read_bytes(self.len_comment)).decode(u"UTF-8")
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(Zip.EndOfCentralDir, self)._write__seq(io)
            self._io.write_u2le(self.disk_of_end_of_central_dir)
            self._io.write_u2le(self.disk_of_central_dir)
            self._io.write_u2le(self.num_central_dir_entries_on_disk)
            self._io.write_u2le(self.num_central_dir_entries_total)
            self._io.write_u4le(self.len_central_dir)
            self._io.write_u4le(self.ofs_central_dir)
            self._io.write_u2le(self.len_comment)
            self._io.write_bytes((self.comment).encode(u"UTF-8"))


        def _check(self):
            if len((self.comment).encode(u"UTF-8")) != self.len_comment:
                raise kaitaistruct.ConsistencyError(u"comment", self.len_comment, len((self.comment).encode(u"UTF-8")))
            self._dirty = False


    class ExtraField(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Zip.ExtraField, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.code = KaitaiStream.resolve_enum(Zip.ExtraCodes, self._io.read_u2le())
            self.len_body = self._io.read_u2le()
            _on = self.code
            if _on == Zip.ExtraCodes.extended_timestamp:
                pass
                self._raw_body = self._io.read_bytes(self.len_body)
                _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                self.body = Zip.ExtraField.ExtendedTimestamp(_io__raw_body, self, self._root)
                self.body._read()
            elif _on == Zip.ExtraCodes.infozip_unix_var_size:
                pass
                self._raw_body = self._io.read_bytes(self.len_body)
                _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                self.body = Zip.ExtraField.InfozipUnixVarSize(_io__raw_body, self, self._root)
                self.body._read()
            elif _on == Zip.ExtraCodes.ntfs:
                pass
                self._raw_body = self._io.read_bytes(self.len_body)
                _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                self.body = Zip.ExtraField.Ntfs(_io__raw_body, self, self._root)
                self.body._read()
            else:
                pass
                self.body = self._io.read_bytes(self.len_body)
            self._dirty = False


        def _fetch_instances(self):
            pass
            _on = self.code
            if _on == Zip.ExtraCodes.extended_timestamp:
                pass
                self.body._fetch_instances()
            elif _on == Zip.ExtraCodes.infozip_unix_var_size:
                pass
                self.body._fetch_instances()
            elif _on == Zip.ExtraCodes.ntfs:
                pass
                self.body._fetch_instances()
            else:
                pass


        def _write__seq(self, io=None):
            super(Zip.ExtraField, self)._write__seq(io)
            self._io.write_u2le(int(self.code))
            self._io.write_u2le(self.len_body)
            _on = self.code
            if _on == Zip.ExtraCodes.extended_timestamp:
                pass
                _io__raw_body = KaitaiStream(BytesIO(bytearray(self.len_body)))
                self._io.add_child_stream(_io__raw_body)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.len_body))
                def handler(parent, _io__raw_body=_io__raw_body):
                    self._raw_body = _io__raw_body.to_byte_array()
                    if len(self._raw_body) != self.len_body:
                        raise kaitaistruct.ConsistencyError(u"raw(body)", self.len_body, len(self._raw_body))
                    parent.write_bytes(self._raw_body)
                _io__raw_body.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.body._write__seq(_io__raw_body)
            elif _on == Zip.ExtraCodes.infozip_unix_var_size:
                pass
                _io__raw_body = KaitaiStream(BytesIO(bytearray(self.len_body)))
                self._io.add_child_stream(_io__raw_body)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.len_body))
                def handler(parent, _io__raw_body=_io__raw_body):
                    self._raw_body = _io__raw_body.to_byte_array()
                    if len(self._raw_body) != self.len_body:
                        raise kaitaistruct.ConsistencyError(u"raw(body)", self.len_body, len(self._raw_body))
                    parent.write_bytes(self._raw_body)
                _io__raw_body.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.body._write__seq(_io__raw_body)
            elif _on == Zip.ExtraCodes.ntfs:
                pass
                _io__raw_body = KaitaiStream(BytesIO(bytearray(self.len_body)))
                self._io.add_child_stream(_io__raw_body)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.len_body))
                def handler(parent, _io__raw_body=_io__raw_body):
                    self._raw_body = _io__raw_body.to_byte_array()
                    if len(self._raw_body) != self.len_body:
                        raise kaitaistruct.ConsistencyError(u"raw(body)", self.len_body, len(self._raw_body))
                    parent.write_bytes(self._raw_body)
                _io__raw_body.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.body._write__seq(_io__raw_body)
            else:
                pass
                self._io.write_bytes(self.body)


        def _check(self):
            _on = self.code
            if _on == Zip.ExtraCodes.extended_timestamp:
                pass
                if self.body._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"body", self._root, self.body._root)
                if self.body._parent != self:
                    raise kaitaistruct.ConsistencyError(u"body", self, self.body._parent)
            elif _on == Zip.ExtraCodes.infozip_unix_var_size:
                pass
                if self.body._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"body", self._root, self.body._root)
                if self.body._parent != self:
                    raise kaitaistruct.ConsistencyError(u"body", self, self.body._parent)
            elif _on == Zip.ExtraCodes.ntfs:
                pass
                if self.body._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"body", self._root, self.body._root)
                if self.body._parent != self:
                    raise kaitaistruct.ConsistencyError(u"body", self, self.body._parent)
            else:
                pass
                if len(self.body) != self.len_body:
                    raise kaitaistruct.ConsistencyError(u"body", self.len_body, len(self.body))
            self._dirty = False

        class ExtendedTimestamp(ReadWriteKaitaiStruct):
            """
            .. seealso::
               Source - https://github.com/LuaDist/zip/blob/b710806/proginfo/extrafld.txt#L817
            """
            def __init__(self, _io=None, _parent=None, _root=None):
                super(Zip.ExtraField.ExtendedTimestamp, self).__init__(_io)
                self._parent = _parent
                self._root = _root

            def _read(self):
                self._raw_flags = self._io.read_bytes(1)
                _io__raw_flags = KaitaiStream(BytesIO(self._raw_flags))
                self.flags = Zip.ExtraField.ExtendedTimestamp.InfoFlags(_io__raw_flags, self, self._root)
                self.flags._read()
                if self.flags.has_mod_time:
                    pass
                    self.mod_time = self._io.read_u4le()

                if self.flags.has_access_time:
                    pass
                    self.access_time = self._io.read_u4le()

                if self.flags.has_create_time:
                    pass
                    self.create_time = self._io.read_u4le()

                self._dirty = False


            def _fetch_instances(self):
                pass
                self.flags._fetch_instances()
                if self.flags.has_mod_time:
                    pass

                if self.flags.has_access_time:
                    pass

                if self.flags.has_create_time:
                    pass



            def _write__seq(self, io=None):
                super(Zip.ExtraField.ExtendedTimestamp, self)._write__seq(io)
                _io__raw_flags = KaitaiStream(BytesIO(bytearray(1)))
                self._io.add_child_stream(_io__raw_flags)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (1))
                def handler(parent, _io__raw_flags=_io__raw_flags):
                    self._raw_flags = _io__raw_flags.to_byte_array()
                    if len(self._raw_flags) != 1:
                        raise kaitaistruct.ConsistencyError(u"raw(flags)", 1, len(self._raw_flags))
                    parent.write_bytes(self._raw_flags)
                _io__raw_flags.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.flags._write__seq(_io__raw_flags)
                if self.flags.has_mod_time:
                    pass
                    self._io.write_u4le(self.mod_time)

                if self.flags.has_access_time:
                    pass
                    self._io.write_u4le(self.access_time)

                if self.flags.has_create_time:
                    pass
                    self._io.write_u4le(self.create_time)



            def _check(self):
                if self.flags._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"flags", self._root, self.flags._root)
                if self.flags._parent != self:
                    raise kaitaistruct.ConsistencyError(u"flags", self, self.flags._parent)
                if self.flags.has_mod_time:
                    pass

                if self.flags.has_access_time:
                    pass

                if self.flags.has_create_time:
                    pass

                self._dirty = False

            class InfoFlags(ReadWriteKaitaiStruct):
                def __init__(self, _io=None, _parent=None, _root=None):
                    super(Zip.ExtraField.ExtendedTimestamp.InfoFlags, self).__init__(_io)
                    self._parent = _parent
                    self._root = _root

                def _read(self):
                    self.has_mod_time = self._io.read_bits_int_le(1) != 0
                    self.has_access_time = self._io.read_bits_int_le(1) != 0
                    self.has_create_time = self._io.read_bits_int_le(1) != 0
                    self.reserved = self._io.read_bits_int_le(5)
                    self._dirty = False


                def _fetch_instances(self):
                    pass


                def _write__seq(self, io=None):
                    super(Zip.ExtraField.ExtendedTimestamp.InfoFlags, self)._write__seq(io)
                    self._io.write_bits_int_le(1, int(self.has_mod_time))
                    self._io.write_bits_int_le(1, int(self.has_access_time))
                    self._io.write_bits_int_le(1, int(self.has_create_time))
                    self._io.write_bits_int_le(5, self.reserved)


                def _check(self):
                    self._dirty = False



        class InfozipUnixVarSize(ReadWriteKaitaiStruct):
            """
            .. seealso::
               Source - https://github.com/LuaDist/zip/blob/b710806/proginfo/extrafld.txt#L1339
            """
            def __init__(self, _io=None, _parent=None, _root=None):
                super(Zip.ExtraField.InfozipUnixVarSize, self).__init__(_io)
                self._parent = _parent
                self._root = _root

            def _read(self):
                self.version = self._io.read_u1()
                self.len_uid = self._io.read_u1()
                self.uid = self._io.read_bytes(self.len_uid)
                self.len_gid = self._io.read_u1()
                self.gid = self._io.read_bytes(self.len_gid)
                self._dirty = False


            def _fetch_instances(self):
                pass


            def _write__seq(self, io=None):
                super(Zip.ExtraField.InfozipUnixVarSize, self)._write__seq(io)
                self._io.write_u1(self.version)
                self._io.write_u1(self.len_uid)
                self._io.write_bytes(self.uid)
                self._io.write_u1(self.len_gid)
                self._io.write_bytes(self.gid)


            def _check(self):
                if len(self.uid) != self.len_uid:
                    raise kaitaistruct.ConsistencyError(u"uid", self.len_uid, len(self.uid))
                if len(self.gid) != self.len_gid:
                    raise kaitaistruct.ConsistencyError(u"gid", self.len_gid, len(self.gid))
                self._dirty = False


        class Ntfs(ReadWriteKaitaiStruct):
            """
            .. seealso::
               Source - https://github.com/LuaDist/zip/blob/b710806/proginfo/extrafld.txt#L191
            """
            def __init__(self, _io=None, _parent=None, _root=None):
                super(Zip.ExtraField.Ntfs, self).__init__(_io)
                self._parent = _parent
                self._root = _root

            def _read(self):
                self.reserved = self._io.read_u4le()
                self.attributes = []
                i = 0
                while not self._io.is_eof():
                    _t_attributes = Zip.ExtraField.Ntfs.Attribute(self._io, self, self._root)
                    try:
                        _t_attributes._read()
                    finally:
                        self.attributes.append(_t_attributes)
                    i += 1

                self._dirty = False


            def _fetch_instances(self):
                pass
                for i in range(len(self.attributes)):
                    pass
                    self.attributes[i]._fetch_instances()



            def _write__seq(self, io=None):
                super(Zip.ExtraField.Ntfs, self)._write__seq(io)
                self._io.write_u4le(self.reserved)
                for i in range(len(self.attributes)):
                    pass
                    if self._io.is_eof():
                        raise kaitaistruct.ConsistencyError(u"attributes", 0, self._io.size() - self._io.pos())
                    self.attributes[i]._write__seq(self._io)

                if not self._io.is_eof():
                    raise kaitaistruct.ConsistencyError(u"attributes", 0, self._io.size() - self._io.pos())


            def _check(self):
                for i in range(len(self.attributes)):
                    pass
                    if self.attributes[i]._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"attributes", self._root, self.attributes[i]._root)
                    if self.attributes[i]._parent != self:
                        raise kaitaistruct.ConsistencyError(u"attributes", self, self.attributes[i]._parent)

                self._dirty = False

            class Attribute(ReadWriteKaitaiStruct):
                def __init__(self, _io=None, _parent=None, _root=None):
                    super(Zip.ExtraField.Ntfs.Attribute, self).__init__(_io)
                    self._parent = _parent
                    self._root = _root

                def _read(self):
                    self.tag = self._io.read_u2le()
                    self.len_body = self._io.read_u2le()
                    _on = self.tag
                    if _on == 1:
                        pass
                        self._raw_body = self._io.read_bytes(self.len_body)
                        _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                        self.body = Zip.ExtraField.Ntfs.Attribute1(_io__raw_body, self, self._root)
                        self.body._read()
                    else:
                        pass
                        self.body = self._io.read_bytes(self.len_body)
                    self._dirty = False


                def _fetch_instances(self):
                    pass
                    _on = self.tag
                    if _on == 1:
                        pass
                        self.body._fetch_instances()
                    else:
                        pass


                def _write__seq(self, io=None):
                    super(Zip.ExtraField.Ntfs.Attribute, self)._write__seq(io)
                    self._io.write_u2le(self.tag)
                    self._io.write_u2le(self.len_body)
                    _on = self.tag
                    if _on == 1:
                        pass
                        _io__raw_body = KaitaiStream(BytesIO(bytearray(self.len_body)))
                        self._io.add_child_stream(_io__raw_body)
                        _pos2 = self._io.pos()
                        self._io.seek(self._io.pos() + (self.len_body))
                        def handler(parent, _io__raw_body=_io__raw_body):
                            self._raw_body = _io__raw_body.to_byte_array()
                            if len(self._raw_body) != self.len_body:
                                raise kaitaistruct.ConsistencyError(u"raw(body)", self.len_body, len(self._raw_body))
                            parent.write_bytes(self._raw_body)
                        _io__raw_body.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                        self.body._write__seq(_io__raw_body)
                    else:
                        pass
                        self._io.write_bytes(self.body)


                def _check(self):
                    _on = self.tag
                    if _on == 1:
                        pass
                        if self.body._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"body", self._root, self.body._root)
                        if self.body._parent != self:
                            raise kaitaistruct.ConsistencyError(u"body", self, self.body._parent)
                    else:
                        pass
                        if len(self.body) != self.len_body:
                            raise kaitaistruct.ConsistencyError(u"body", self.len_body, len(self.body))
                    self._dirty = False


            class Attribute1(ReadWriteKaitaiStruct):
                def __init__(self, _io=None, _parent=None, _root=None):
                    super(Zip.ExtraField.Ntfs.Attribute1, self).__init__(_io)
                    self._parent = _parent
                    self._root = _root

                def _read(self):
                    self.last_mod_time = self._io.read_u8le()
                    self.last_access_time = self._io.read_u8le()
                    self.creation_time = self._io.read_u8le()
                    self._dirty = False


                def _fetch_instances(self):
                    pass


                def _write__seq(self, io=None):
                    super(Zip.ExtraField.Ntfs.Attribute1, self)._write__seq(io)
                    self._io.write_u8le(self.last_mod_time)
                    self._io.write_u8le(self.last_access_time)
                    self._io.write_u8le(self.creation_time)


                def _check(self):
                    self._dirty = False




    class Extras(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Zip.Extras, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.entries = []
            i = 0
            while not self._io.is_eof():
                _t_entries = Zip.ExtraField(self._io, self, self._root)
                try:
                    _t_entries._read()
                finally:
                    self.entries.append(_t_entries)
                i += 1

            self._dirty = False


        def _fetch_instances(self):
            pass
            for i in range(len(self.entries)):
                pass
                self.entries[i]._fetch_instances()



        def _write__seq(self, io=None):
            super(Zip.Extras, self)._write__seq(io)
            for i in range(len(self.entries)):
                pass
                if self._io.is_eof():
                    raise kaitaistruct.ConsistencyError(u"entries", 0, self._io.size() - self._io.pos())
                self.entries[i]._write__seq(self._io)

            if not self._io.is_eof():
                raise kaitaistruct.ConsistencyError(u"entries", 0, self._io.size() - self._io.pos())


        def _check(self):
            for i in range(len(self.entries)):
                pass
                if self.entries[i]._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"entries", self._root, self.entries[i]._root)
                if self.entries[i]._parent != self:
                    raise kaitaistruct.ConsistencyError(u"entries", self, self.entries[i]._parent)

            self._dirty = False


    class LocalFile(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Zip.LocalFile, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.header = Zip.LocalFileHeader(self._io, self, self._root)
            self.header._read()
            self.body = self._io.read_bytes(self.header.len_body_compressed)
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.header._fetch_instances()


        def _write__seq(self, io=None):
            super(Zip.LocalFile, self)._write__seq(io)
            self.header._write__seq(self._io)
            self._io.write_bytes(self.body)


        def _check(self):
            if self.header._root != self._root:
                raise kaitaistruct.ConsistencyError(u"header", self._root, self.header._root)
            if self.header._parent != self:
                raise kaitaistruct.ConsistencyError(u"header", self, self.header._parent)
            if len(self.body) != self.header.len_body_compressed:
                raise kaitaistruct.ConsistencyError(u"body", self.header.len_body_compressed, len(self.body))
            self._dirty = False


    class LocalFileHeader(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Zip.LocalFileHeader, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.version = self._io.read_u2le()
            self._raw_flags = self._io.read_bytes(2)
            _io__raw_flags = KaitaiStream(BytesIO(self._raw_flags))
            self.flags = Zip.LocalFileHeader.GpFlags(_io__raw_flags, self, self._root)
            self.flags._read()
            self.compression_method = KaitaiStream.resolve_enum(Zip.Compression, self._io.read_u2le())
            self._raw_file_mod_time = self._io.read_bytes(4)
            _io__raw_file_mod_time = KaitaiStream(BytesIO(self._raw_file_mod_time))
            self.file_mod_time = dos_datetime.DosDatetime(_io__raw_file_mod_time)
            self.file_mod_time._read()
            self.crc32 = self._io.read_u4le()
            self.len_body_compressed = self._io.read_u4le()
            self.len_body_uncompressed = self._io.read_u4le()
            self.len_file_name = self._io.read_u2le()
            self.len_extra = self._io.read_u2le()
            self.file_name = (self._io.read_bytes(self.len_file_name)).decode(u"UTF-8")
            self._raw_extra = self._io.read_bytes(self.len_extra)
            _io__raw_extra = KaitaiStream(BytesIO(self._raw_extra))
            self.extra = Zip.Extras(_io__raw_extra, self, self._root)
            self.extra._read()
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.flags._fetch_instances()
            self.file_mod_time._fetch_instances()
            self.extra._fetch_instances()


        def _write__seq(self, io=None):
            super(Zip.LocalFileHeader, self)._write__seq(io)
            self._io.write_u2le(self.version)
            _io__raw_flags = KaitaiStream(BytesIO(bytearray(2)))
            self._io.add_child_stream(_io__raw_flags)
            _pos2 = self._io.pos()
            self._io.seek(self._io.pos() + (2))
            def handler(parent, _io__raw_flags=_io__raw_flags):
                self._raw_flags = _io__raw_flags.to_byte_array()
                if len(self._raw_flags) != 2:
                    raise kaitaistruct.ConsistencyError(u"raw(flags)", 2, len(self._raw_flags))
                parent.write_bytes(self._raw_flags)
            _io__raw_flags.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
            self.flags._write__seq(_io__raw_flags)
            self._io.write_u2le(int(self.compression_method))
            _io__raw_file_mod_time = KaitaiStream(BytesIO(bytearray(4)))
            self._io.add_child_stream(_io__raw_file_mod_time)
            _pos2 = self._io.pos()
            self._io.seek(self._io.pos() + (4))
            def handler(parent, _io__raw_file_mod_time=_io__raw_file_mod_time):
                self._raw_file_mod_time = _io__raw_file_mod_time.to_byte_array()
                if len(self._raw_file_mod_time) != 4:
                    raise kaitaistruct.ConsistencyError(u"raw(file_mod_time)", 4, len(self._raw_file_mod_time))
                parent.write_bytes(self._raw_file_mod_time)
            _io__raw_file_mod_time.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
            self.file_mod_time._write__seq(_io__raw_file_mod_time)
            self._io.write_u4le(self.crc32)
            self._io.write_u4le(self.len_body_compressed)
            self._io.write_u4le(self.len_body_uncompressed)
            self._io.write_u2le(self.len_file_name)
            self._io.write_u2le(self.len_extra)
            self._io.write_bytes((self.file_name).encode(u"UTF-8"))
            _io__raw_extra = KaitaiStream(BytesIO(bytearray(self.len_extra)))
            self._io.add_child_stream(_io__raw_extra)
            _pos2 = self._io.pos()
            self._io.seek(self._io.pos() + (self.len_extra))
            def handler(parent, _io__raw_extra=_io__raw_extra):
                self._raw_extra = _io__raw_extra.to_byte_array()
                if len(self._raw_extra) != self.len_extra:
                    raise kaitaistruct.ConsistencyError(u"raw(extra)", self.len_extra, len(self._raw_extra))
                parent.write_bytes(self._raw_extra)
            _io__raw_extra.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
            self.extra._write__seq(_io__raw_extra)


        def _check(self):
            if self.flags._root != self._root:
                raise kaitaistruct.ConsistencyError(u"flags", self._root, self.flags._root)
            if self.flags._parent != self:
                raise kaitaistruct.ConsistencyError(u"flags", self, self.flags._parent)
            if len((self.file_name).encode(u"UTF-8")) != self.len_file_name:
                raise kaitaistruct.ConsistencyError(u"file_name", self.len_file_name, len((self.file_name).encode(u"UTF-8")))
            if self.extra._root != self._root:
                raise kaitaistruct.ConsistencyError(u"extra", self._root, self.extra._root)
            if self.extra._parent != self:
                raise kaitaistruct.ConsistencyError(u"extra", self, self.extra._parent)
            self._dirty = False

        class GpFlags(ReadWriteKaitaiStruct):
            """
            .. seealso::
               - 4.4.4 - https://pkware.cachefly.net/webdocs/casestudies/APPNOTE.TXT
            
            
            .. seealso::
               Local file headers - https://users.cs.jmu.edu/buchhofp/forensics/formats/pkzip.html
            """

            class DeflateMode(IntEnum):
                normal = 0
                maximum = 1
                fast = 2
                super_fast = 3
            def __init__(self, _io=None, _parent=None, _root=None):
                super(Zip.LocalFileHeader.GpFlags, self).__init__(_io)
                self._parent = _parent
                self._root = _root

            def _read(self):
                self.file_encrypted = self._io.read_bits_int_le(1) != 0
                self.comp_options_raw = self._io.read_bits_int_le(2)
                self.has_data_descriptor = self._io.read_bits_int_le(1) != 0
                self.reserved_1 = self._io.read_bits_int_le(1) != 0
                self.comp_patched_data = self._io.read_bits_int_le(1) != 0
                self.strong_encrypt = self._io.read_bits_int_le(1) != 0
                self.reserved_2 = self._io.read_bits_int_le(4)
                self.lang_encoding = self._io.read_bits_int_le(1) != 0
                self.reserved_3 = self._io.read_bits_int_le(1) != 0
                self.mask_header_values = self._io.read_bits_int_le(1) != 0
                self.reserved_4 = self._io.read_bits_int_le(2)
                self._dirty = False


            def _fetch_instances(self):
                pass


            def _write__seq(self, io=None):
                super(Zip.LocalFileHeader.GpFlags, self)._write__seq(io)
                self._io.write_bits_int_le(1, int(self.file_encrypted))
                self._io.write_bits_int_le(2, self.comp_options_raw)
                self._io.write_bits_int_le(1, int(self.has_data_descriptor))
                self._io.write_bits_int_le(1, int(self.reserved_1))
                self._io.write_bits_int_le(1, int(self.comp_patched_data))
                self._io.write_bits_int_le(1, int(self.strong_encrypt))
                self._io.write_bits_int_le(4, self.reserved_2)
                self._io.write_bits_int_le(1, int(self.lang_encoding))
                self._io.write_bits_int_le(1, int(self.reserved_3))
                self._io.write_bits_int_le(1, int(self.mask_header_values))
                self._io.write_bits_int_le(2, self.reserved_4)


            def _check(self):
                self._dirty = False

            @property
            def deflated_mode(self):
                if hasattr(self, '_m_deflated_mode'):
                    return self._m_deflated_mode

                if  ((self._parent.compression_method == Zip.Compression.deflated) or (self._parent.compression_method == Zip.Compression.enhanced_deflated)) :
                    pass
                    self._m_deflated_mode = KaitaiStream.resolve_enum(Zip.LocalFileHeader.GpFlags.DeflateMode, self.comp_options_raw)

                return getattr(self, '_m_deflated_mode', None)

            def _invalidate_deflated_mode(self):
                del self._m_deflated_mode
            @property
            def imploded_dict_byte_size(self):
                """8KiB or 4KiB in bytes."""
                if hasattr(self, '_m_imploded_dict_byte_size'):
                    return self._m_imploded_dict_byte_size

                if self._parent.compression_method == Zip.Compression.imploded:
                    pass
                    self._m_imploded_dict_byte_size = (8 if self.comp_options_raw & 1 != 0 else 4) * 1024

                return getattr(self, '_m_imploded_dict_byte_size', None)

            def _invalidate_imploded_dict_byte_size(self):
                del self._m_imploded_dict_byte_size
            @property
            def imploded_num_sf_trees(self):
                if hasattr(self, '_m_imploded_num_sf_trees'):
                    return self._m_imploded_num_sf_trees

                if self._parent.compression_method == Zip.Compression.imploded:
                    pass
                    self._m_imploded_num_sf_trees = (3 if self.comp_options_raw & 2 != 0 else 2)

                return getattr(self, '_m_imploded_num_sf_trees', None)

            def _invalidate_imploded_num_sf_trees(self):
                del self._m_imploded_num_sf_trees
            @property
            def lzma_has_eos_marker(self):
                if hasattr(self, '_m_lzma_has_eos_marker'):
                    return self._m_lzma_has_eos_marker

                if self._parent.compression_method == Zip.Compression.lzma:
                    pass
                    self._m_lzma_has_eos_marker = self.comp_options_raw & 1 != 0

                return getattr(self, '_m_lzma_has_eos_marker', None)

            def _invalidate_lzma_has_eos_marker(self):
                del self._m_lzma_has_eos_marker


    class PkSection(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Zip.PkSection, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.magic = self._io.read_bytes(2)
            if not self.magic == b"\x50\x4B":
                raise kaitaistruct.ValidationNotEqualError(b"\x50\x4B", self.magic, self._io, u"/types/pk_section/seq/0")
            self.section_type = self._io.read_u2le()
            _on = self.section_type
            if _on == 1027:
                pass
                self.body = Zip.LocalFile(self._io, self, self._root)
                self.body._read()
            elif _on == 1541:
                pass
                self.body = Zip.EndOfCentralDir(self._io, self, self._root)
                self.body._read()
            elif _on == 2055:
                pass
                self.body = Zip.DataDescriptor(self._io, self, self._root)
                self.body._read()
            elif _on == 513:
                pass
                self.body = Zip.CentralDirEntry(self._io, self, self._root)
                self.body._read()
            self._dirty = False


        def _fetch_instances(self):
            pass
            _on = self.section_type
            if _on == 1027:
                pass
                self.body._fetch_instances()
            elif _on == 1541:
                pass
                self.body._fetch_instances()
            elif _on == 2055:
                pass
                self.body._fetch_instances()
            elif _on == 513:
                pass
                self.body._fetch_instances()


        def _write__seq(self, io=None):
            super(Zip.PkSection, self)._write__seq(io)
            self._io.write_bytes(self.magic)
            self._io.write_u2le(self.section_type)
            _on = self.section_type
            if _on == 1027:
                pass
                self.body._write__seq(self._io)
            elif _on == 1541:
                pass
                self.body._write__seq(self._io)
            elif _on == 2055:
                pass
                self.body._write__seq(self._io)
            elif _on == 513:
                pass
                self.body._write__seq(self._io)


        def _check(self):
            if len(self.magic) != 2:
                raise kaitaistruct.ConsistencyError(u"magic", 2, len(self.magic))
            if not self.magic == b"\x50\x4B":
                raise kaitaistruct.ValidationNotEqualError(b"\x50\x4B", self.magic, None, u"/types/pk_section/seq/0")
            _on = self.section_type
            if _on == 1027:
                pass
                if self.body._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"body", self._root, self.body._root)
                if self.body._parent != self:
                    raise kaitaistruct.ConsistencyError(u"body", self, self.body._parent)
            elif _on == 1541:
                pass
                if self.body._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"body", self._root, self.body._root)
                if self.body._parent != self:
                    raise kaitaistruct.ConsistencyError(u"body", self, self.body._parent)
            elif _on == 2055:
                pass
                if self.body._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"body", self._root, self.body._root)
                if self.body._parent != self:
                    raise kaitaistruct.ConsistencyError(u"body", self, self.body._parent)
            elif _on == 513:
                pass
                if self.body._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"body", self._root, self.body._root)
                if self.body._parent != self:
                    raise kaitaistruct.ConsistencyError(u"body", self, self.body._parent)
            self._dirty = False



