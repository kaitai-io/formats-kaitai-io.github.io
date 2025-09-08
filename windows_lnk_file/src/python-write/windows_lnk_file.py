# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import ReadWriteKaitaiStruct, KaitaiStream, BytesIO
import windows_shell_items
from enum import IntEnum


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class WindowsLnkFile(ReadWriteKaitaiStruct):
    """Windows .lnk files (AKA "shell link" file) are most frequently used
    in Windows shell to create "shortcuts" to another files, usually for
    purposes of running a program from some other directory, sometimes
    with certain preconfigured arguments and some other options.
    
    .. seealso::
       Source - https://winprotocoldoc.blob.core.windows.net/productionwindowsarchives/MS-SHLLINK/[MS-SHLLINK].pdf
    """

    class DriveTypes(IntEnum):
        unknown = 0
        no_root_dir = 1
        removable = 2
        fixed = 3
        remote = 4
        cdrom = 5
        ramdisk = 6

    class WindowState(IntEnum):
        normal = 1
        maximized = 3
        min_no_active = 7
    def __init__(self, _io=None, _parent=None, _root=None):
        super(WindowsLnkFile, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self

    def _read(self):
        self.header = WindowsLnkFile.FileHeader(self._io, self, self._root)
        self.header._read()
        if self.header.flags.has_link_target_id_list:
            pass
            self.target_id_list = WindowsLnkFile.LinkTargetIdList(self._io, self, self._root)
            self.target_id_list._read()

        if self.header.flags.has_link_info:
            pass
            self.info = WindowsLnkFile.LinkInfo(self._io, self, self._root)
            self.info._read()

        if self.header.flags.has_name:
            pass
            self.name = WindowsLnkFile.StringData(self._io, self, self._root)
            self.name._read()

        if self.header.flags.has_rel_path:
            pass
            self.rel_path = WindowsLnkFile.StringData(self._io, self, self._root)
            self.rel_path._read()

        if self.header.flags.has_work_dir:
            pass
            self.work_dir = WindowsLnkFile.StringData(self._io, self, self._root)
            self.work_dir._read()

        if self.header.flags.has_arguments:
            pass
            self.arguments = WindowsLnkFile.StringData(self._io, self, self._root)
            self.arguments._read()

        if self.header.flags.has_icon_location:
            pass
            self.icon_location = WindowsLnkFile.StringData(self._io, self, self._root)
            self.icon_location._read()

        self._dirty = False


    def _fetch_instances(self):
        pass
        self.header._fetch_instances()
        if self.header.flags.has_link_target_id_list:
            pass
            self.target_id_list._fetch_instances()

        if self.header.flags.has_link_info:
            pass
            self.info._fetch_instances()

        if self.header.flags.has_name:
            pass
            self.name._fetch_instances()

        if self.header.flags.has_rel_path:
            pass
            self.rel_path._fetch_instances()

        if self.header.flags.has_work_dir:
            pass
            self.work_dir._fetch_instances()

        if self.header.flags.has_arguments:
            pass
            self.arguments._fetch_instances()

        if self.header.flags.has_icon_location:
            pass
            self.icon_location._fetch_instances()



    def _write__seq(self, io=None):
        super(WindowsLnkFile, self)._write__seq(io)
        self.header._write__seq(self._io)
        if self.header.flags.has_link_target_id_list:
            pass
            self.target_id_list._write__seq(self._io)

        if self.header.flags.has_link_info:
            pass
            self.info._write__seq(self._io)

        if self.header.flags.has_name:
            pass
            self.name._write__seq(self._io)

        if self.header.flags.has_rel_path:
            pass
            self.rel_path._write__seq(self._io)

        if self.header.flags.has_work_dir:
            pass
            self.work_dir._write__seq(self._io)

        if self.header.flags.has_arguments:
            pass
            self.arguments._write__seq(self._io)

        if self.header.flags.has_icon_location:
            pass
            self.icon_location._write__seq(self._io)



    def _check(self):
        if self.header._root != self._root:
            raise kaitaistruct.ConsistencyError(u"header", self._root, self.header._root)
        if self.header._parent != self:
            raise kaitaistruct.ConsistencyError(u"header", self, self.header._parent)
        if self.header.flags.has_link_target_id_list:
            pass
            if self.target_id_list._root != self._root:
                raise kaitaistruct.ConsistencyError(u"target_id_list", self._root, self.target_id_list._root)
            if self.target_id_list._parent != self:
                raise kaitaistruct.ConsistencyError(u"target_id_list", self, self.target_id_list._parent)

        if self.header.flags.has_link_info:
            pass
            if self.info._root != self._root:
                raise kaitaistruct.ConsistencyError(u"info", self._root, self.info._root)
            if self.info._parent != self:
                raise kaitaistruct.ConsistencyError(u"info", self, self.info._parent)

        if self.header.flags.has_name:
            pass
            if self.name._root != self._root:
                raise kaitaistruct.ConsistencyError(u"name", self._root, self.name._root)
            if self.name._parent != self:
                raise kaitaistruct.ConsistencyError(u"name", self, self.name._parent)

        if self.header.flags.has_rel_path:
            pass
            if self.rel_path._root != self._root:
                raise kaitaistruct.ConsistencyError(u"rel_path", self._root, self.rel_path._root)
            if self.rel_path._parent != self:
                raise kaitaistruct.ConsistencyError(u"rel_path", self, self.rel_path._parent)

        if self.header.flags.has_work_dir:
            pass
            if self.work_dir._root != self._root:
                raise kaitaistruct.ConsistencyError(u"work_dir", self._root, self.work_dir._root)
            if self.work_dir._parent != self:
                raise kaitaistruct.ConsistencyError(u"work_dir", self, self.work_dir._parent)

        if self.header.flags.has_arguments:
            pass
            if self.arguments._root != self._root:
                raise kaitaistruct.ConsistencyError(u"arguments", self._root, self.arguments._root)
            if self.arguments._parent != self:
                raise kaitaistruct.ConsistencyError(u"arguments", self, self.arguments._parent)

        if self.header.flags.has_icon_location:
            pass
            if self.icon_location._root != self._root:
                raise kaitaistruct.ConsistencyError(u"icon_location", self._root, self.icon_location._root)
            if self.icon_location._parent != self:
                raise kaitaistruct.ConsistencyError(u"icon_location", self, self.icon_location._parent)

        self._dirty = False

    class FileHeader(ReadWriteKaitaiStruct):
        """
        .. seealso::
           Section 2.1 - https://winprotocoldoc.blob.core.windows.net/productionwindowsarchives/MS-SHLLINK/[MS-SHLLINK].pdf
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(WindowsLnkFile.FileHeader, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.len_header = self._io.read_bytes(4)
            if not self.len_header == b"\x4C\x00\x00\x00":
                raise kaitaistruct.ValidationNotEqualError(b"\x4C\x00\x00\x00", self.len_header, self._io, u"/types/file_header/seq/0")
            self.link_clsid = self._io.read_bytes(16)
            if not self.link_clsid == b"\x01\x14\x02\x00\x00\x00\x00\x00\xC0\x00\x00\x00\x00\x00\x00\x46":
                raise kaitaistruct.ValidationNotEqualError(b"\x01\x14\x02\x00\x00\x00\x00\x00\xC0\x00\x00\x00\x00\x00\x00\x46", self.link_clsid, self._io, u"/types/file_header/seq/1")
            self._raw_flags = self._io.read_bytes(4)
            _io__raw_flags = KaitaiStream(BytesIO(self._raw_flags))
            self.flags = WindowsLnkFile.LinkFlags(_io__raw_flags, self, self._root)
            self.flags._read()
            self.file_attrs = self._io.read_u4le()
            self.time_creation = self._io.read_u8le()
            self.time_access = self._io.read_u8le()
            self.time_write = self._io.read_u8le()
            self.target_file_size = self._io.read_u4le()
            self.icon_index = self._io.read_s4le()
            self.show_command = KaitaiStream.resolve_enum(WindowsLnkFile.WindowState, self._io.read_u4le())
            self.hotkey = self._io.read_u2le()
            self.reserved = self._io.read_bytes(10)
            if not self.reserved == b"\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00":
                raise kaitaistruct.ValidationNotEqualError(b"\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00", self.reserved, self._io, u"/types/file_header/seq/11")
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.flags._fetch_instances()


        def _write__seq(self, io=None):
            super(WindowsLnkFile.FileHeader, self)._write__seq(io)
            self._io.write_bytes(self.len_header)
            self._io.write_bytes(self.link_clsid)
            _io__raw_flags = KaitaiStream(BytesIO(bytearray(4)))
            self._io.add_child_stream(_io__raw_flags)
            _pos2 = self._io.pos()
            self._io.seek(self._io.pos() + (4))
            def handler(parent, _io__raw_flags=_io__raw_flags):
                self._raw_flags = _io__raw_flags.to_byte_array()
                if len(self._raw_flags) != 4:
                    raise kaitaistruct.ConsistencyError(u"raw(flags)", 4, len(self._raw_flags))
                parent.write_bytes(self._raw_flags)
            _io__raw_flags.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
            self.flags._write__seq(_io__raw_flags)
            self._io.write_u4le(self.file_attrs)
            self._io.write_u8le(self.time_creation)
            self._io.write_u8le(self.time_access)
            self._io.write_u8le(self.time_write)
            self._io.write_u4le(self.target_file_size)
            self._io.write_s4le(self.icon_index)
            self._io.write_u4le(int(self.show_command))
            self._io.write_u2le(self.hotkey)
            self._io.write_bytes(self.reserved)


        def _check(self):
            if len(self.len_header) != 4:
                raise kaitaistruct.ConsistencyError(u"len_header", 4, len(self.len_header))
            if not self.len_header == b"\x4C\x00\x00\x00":
                raise kaitaistruct.ValidationNotEqualError(b"\x4C\x00\x00\x00", self.len_header, None, u"/types/file_header/seq/0")
            if len(self.link_clsid) != 16:
                raise kaitaistruct.ConsistencyError(u"link_clsid", 16, len(self.link_clsid))
            if not self.link_clsid == b"\x01\x14\x02\x00\x00\x00\x00\x00\xC0\x00\x00\x00\x00\x00\x00\x46":
                raise kaitaistruct.ValidationNotEqualError(b"\x01\x14\x02\x00\x00\x00\x00\x00\xC0\x00\x00\x00\x00\x00\x00\x46", self.link_clsid, None, u"/types/file_header/seq/1")
            if self.flags._root != self._root:
                raise kaitaistruct.ConsistencyError(u"flags", self._root, self.flags._root)
            if self.flags._parent != self:
                raise kaitaistruct.ConsistencyError(u"flags", self, self.flags._parent)
            if len(self.reserved) != 10:
                raise kaitaistruct.ConsistencyError(u"reserved", 10, len(self.reserved))
            if not self.reserved == b"\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00":
                raise kaitaistruct.ValidationNotEqualError(b"\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00", self.reserved, None, u"/types/file_header/seq/11")
            self._dirty = False


    class LinkFlags(ReadWriteKaitaiStruct):
        """
        .. seealso::
           Section 2.1.1 - https://winprotocoldoc.blob.core.windows.net/productionwindowsarchives/MS-SHLLINK/[MS-SHLLINK].pdf
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(WindowsLnkFile.LinkFlags, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.is_unicode = self._io.read_bits_int_be(1) != 0
            self.has_icon_location = self._io.read_bits_int_be(1) != 0
            self.has_arguments = self._io.read_bits_int_be(1) != 0
            self.has_work_dir = self._io.read_bits_int_be(1) != 0
            self.has_rel_path = self._io.read_bits_int_be(1) != 0
            self.has_name = self._io.read_bits_int_be(1) != 0
            self.has_link_info = self._io.read_bits_int_be(1) != 0
            self.has_link_target_id_list = self._io.read_bits_int_be(1) != 0
            self._unnamed8 = self._io.read_bits_int_be(16)
            self.reserved = self._io.read_bits_int_be(5)
            self.keep_local_id_list_for_unc_target = self._io.read_bits_int_be(1) != 0
            self._unnamed11 = self._io.read_bits_int_be(2)
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(WindowsLnkFile.LinkFlags, self)._write__seq(io)
            self._io.write_bits_int_be(1, int(self.is_unicode))
            self._io.write_bits_int_be(1, int(self.has_icon_location))
            self._io.write_bits_int_be(1, int(self.has_arguments))
            self._io.write_bits_int_be(1, int(self.has_work_dir))
            self._io.write_bits_int_be(1, int(self.has_rel_path))
            self._io.write_bits_int_be(1, int(self.has_name))
            self._io.write_bits_int_be(1, int(self.has_link_info))
            self._io.write_bits_int_be(1, int(self.has_link_target_id_list))
            self._io.write_bits_int_be(16, self._unnamed8)
            self._io.write_bits_int_be(5, self.reserved)
            self._io.write_bits_int_be(1, int(self.keep_local_id_list_for_unc_target))
            self._io.write_bits_int_be(2, self._unnamed11)


        def _check(self):
            self._dirty = False


    class LinkInfo(ReadWriteKaitaiStruct):
        """
        .. seealso::
           Section 2.3 - https://winprotocoldoc.blob.core.windows.net/productionwindowsarchives/MS-SHLLINK/[MS-SHLLINK].pdf
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(WindowsLnkFile.LinkInfo, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.len_all = self._io.read_u4le()
            self._raw_all = self._io.read_bytes(self.len_all - 4)
            _io__raw_all = KaitaiStream(BytesIO(self._raw_all))
            self.all = WindowsLnkFile.LinkInfo.All(_io__raw_all, self, self._root)
            self.all._read()
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.all._fetch_instances()


        def _write__seq(self, io=None):
            super(WindowsLnkFile.LinkInfo, self)._write__seq(io)
            self._io.write_u4le(self.len_all)
            _io__raw_all = KaitaiStream(BytesIO(bytearray(self.len_all - 4)))
            self._io.add_child_stream(_io__raw_all)
            _pos2 = self._io.pos()
            self._io.seek(self._io.pos() + (self.len_all - 4))
            def handler(parent, _io__raw_all=_io__raw_all):
                self._raw_all = _io__raw_all.to_byte_array()
                if len(self._raw_all) != self.len_all - 4:
                    raise kaitaistruct.ConsistencyError(u"raw(all)", self.len_all - 4, len(self._raw_all))
                parent.write_bytes(self._raw_all)
            _io__raw_all.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
            self.all._write__seq(_io__raw_all)


        def _check(self):
            if self.all._root != self._root:
                raise kaitaistruct.ConsistencyError(u"all", self._root, self.all._root)
            if self.all._parent != self:
                raise kaitaistruct.ConsistencyError(u"all", self, self.all._parent)
            self._dirty = False

        class All(ReadWriteKaitaiStruct):
            """
            .. seealso::
               Section 2.3 - https://winprotocoldoc.blob.core.windows.net/productionwindowsarchives/MS-SHLLINK/[MS-SHLLINK].pdf
            """
            def __init__(self, _io=None, _parent=None, _root=None):
                super(WindowsLnkFile.LinkInfo.All, self).__init__(_io)
                self._parent = _parent
                self._root = _root
                self._should_write_local_base_path = False
                self.local_base_path__enabled = True
                self._should_write_volume_id = False
                self.volume_id__enabled = True

            def _read(self):
                self.len_header = self._io.read_u4le()
                self._raw_header = self._io.read_bytes(self.len_header - 8)
                _io__raw_header = KaitaiStream(BytesIO(self._raw_header))
                self.header = WindowsLnkFile.LinkInfo.Header(_io__raw_header, self, self._root)
                self.header._read()
                self._dirty = False


            def _fetch_instances(self):
                pass
                self.header._fetch_instances()
                _ = self.local_base_path
                if hasattr(self, '_m_local_base_path'):
                    pass

                _ = self.volume_id
                if hasattr(self, '_m_volume_id'):
                    pass
                    self._m_volume_id._fetch_instances()



            def _write__seq(self, io=None):
                super(WindowsLnkFile.LinkInfo.All, self)._write__seq(io)
                self._should_write_local_base_path = self.local_base_path__enabled
                self._should_write_volume_id = self.volume_id__enabled
                self._io.write_u4le(self.len_header)
                _io__raw_header = KaitaiStream(BytesIO(bytearray(self.len_header - 8)))
                self._io.add_child_stream(_io__raw_header)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.len_header - 8))
                def handler(parent, _io__raw_header=_io__raw_header):
                    self._raw_header = _io__raw_header.to_byte_array()
                    if len(self._raw_header) != self.len_header - 8:
                        raise kaitaistruct.ConsistencyError(u"raw(header)", self.len_header - 8, len(self._raw_header))
                    parent.write_bytes(self._raw_header)
                _io__raw_header.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.header._write__seq(_io__raw_header)


            def _check(self):
                if self.header._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"header", self._root, self.header._root)
                if self.header._parent != self:
                    raise kaitaistruct.ConsistencyError(u"header", self, self.header._parent)
                if self.local_base_path__enabled:
                    pass
                    if self.header.flags.has_volume_id_and_local_base_path:
                        pass
                        if KaitaiStream.byte_array_index_of(self._m_local_base_path, 0) != -1:
                            raise kaitaistruct.ConsistencyError(u"local_base_path", -1, KaitaiStream.byte_array_index_of(self._m_local_base_path, 0))


                if self.volume_id__enabled:
                    pass
                    if self.header.flags.has_volume_id_and_local_base_path:
                        pass
                        if self._m_volume_id._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"volume_id", self._root, self._m_volume_id._root)
                        if self._m_volume_id._parent != self:
                            raise kaitaistruct.ConsistencyError(u"volume_id", self, self._m_volume_id._parent)


                self._dirty = False

            @property
            def local_base_path(self):
                if self._should_write_local_base_path:
                    self._write_local_base_path()
                if hasattr(self, '_m_local_base_path'):
                    return self._m_local_base_path

                if not self.local_base_path__enabled:
                    return None

                if self.header.flags.has_volume_id_and_local_base_path:
                    pass
                    _pos = self._io.pos()
                    self._io.seek(self.header.ofs_local_base_path - 4)
                    self._m_local_base_path = self._io.read_bytes_term(0, False, True, True)
                    self._io.seek(_pos)

                return getattr(self, '_m_local_base_path', None)

            @local_base_path.setter
            def local_base_path(self, v):
                self._dirty = True
                self._m_local_base_path = v

            def _write_local_base_path(self):
                self._should_write_local_base_path = False
                if self.header.flags.has_volume_id_and_local_base_path:
                    pass
                    _pos = self._io.pos()
                    self._io.seek(self.header.ofs_local_base_path - 4)
                    self._io.write_bytes(self._m_local_base_path)
                    self._io.write_u1(0)
                    self._io.seek(_pos)


            @property
            def volume_id(self):
                if self._should_write_volume_id:
                    self._write_volume_id()
                if hasattr(self, '_m_volume_id'):
                    return self._m_volume_id

                if not self.volume_id__enabled:
                    return None

                if self.header.flags.has_volume_id_and_local_base_path:
                    pass
                    _pos = self._io.pos()
                    self._io.seek(self.header.ofs_volume_id - 4)
                    self._m_volume_id = WindowsLnkFile.LinkInfo.VolumeIdSpec(self._io, self, self._root)
                    self._m_volume_id._read()
                    self._io.seek(_pos)

                return getattr(self, '_m_volume_id', None)

            @volume_id.setter
            def volume_id(self, v):
                self._dirty = True
                self._m_volume_id = v

            def _write_volume_id(self):
                self._should_write_volume_id = False
                if self.header.flags.has_volume_id_and_local_base_path:
                    pass
                    _pos = self._io.pos()
                    self._io.seek(self.header.ofs_volume_id - 4)
                    self._m_volume_id._write__seq(self._io)
                    self._io.seek(_pos)



        class Header(ReadWriteKaitaiStruct):
            """
            .. seealso::
               Section 2.3 - https://winprotocoldoc.blob.core.windows.net/productionwindowsarchives/MS-SHLLINK/[MS-SHLLINK].pdf
            """
            def __init__(self, _io=None, _parent=None, _root=None):
                super(WindowsLnkFile.LinkInfo.Header, self).__init__(_io)
                self._parent = _parent
                self._root = _root

            def _read(self):
                self.flags = WindowsLnkFile.LinkInfo.LinkInfoFlags(self._io, self, self._root)
                self.flags._read()
                self.ofs_volume_id = self._io.read_u4le()
                self.ofs_local_base_path = self._io.read_u4le()
                self.ofs_common_net_rel_link = self._io.read_u4le()
                self.ofs_common_path_suffix = self._io.read_u4le()
                if (not (self._io.is_eof())):
                    pass
                    self.ofs_local_base_path_unicode = self._io.read_u4le()

                if (not (self._io.is_eof())):
                    pass
                    self.ofs_common_path_suffix_unicode = self._io.read_u4le()

                self._dirty = False


            def _fetch_instances(self):
                pass
                self.flags._fetch_instances()
                if (not (self._io.is_eof())):
                    pass

                if (not (self._io.is_eof())):
                    pass



            def _write__seq(self, io=None):
                super(WindowsLnkFile.LinkInfo.Header, self)._write__seq(io)
                self.flags._write__seq(self._io)
                self._io.write_u4le(self.ofs_volume_id)
                self._io.write_u4le(self.ofs_local_base_path)
                self._io.write_u4le(self.ofs_common_net_rel_link)
                self._io.write_u4le(self.ofs_common_path_suffix)
                if (not (self._io.is_eof())):
                    pass
                    self._io.write_u4le(self.ofs_local_base_path_unicode)

                if (not (self._io.is_eof())):
                    pass
                    self._io.write_u4le(self.ofs_common_path_suffix_unicode)



            def _check(self):
                if self.flags._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"flags", self._root, self.flags._root)
                if self.flags._parent != self:
                    raise kaitaistruct.ConsistencyError(u"flags", self, self.flags._parent)
                self._dirty = False


        class LinkInfoFlags(ReadWriteKaitaiStruct):
            """
            .. seealso::
               Section 2.3 - https://winprotocoldoc.blob.core.windows.net/productionwindowsarchives/MS-SHLLINK/[MS-SHLLINK].pdf
            """
            def __init__(self, _io=None, _parent=None, _root=None):
                super(WindowsLnkFile.LinkInfo.LinkInfoFlags, self).__init__(_io)
                self._parent = _parent
                self._root = _root

            def _read(self):
                self.reserved1 = self._io.read_bits_int_be(6)
                self.has_common_net_rel_link = self._io.read_bits_int_be(1) != 0
                self.has_volume_id_and_local_base_path = self._io.read_bits_int_be(1) != 0
                self.reserved2 = self._io.read_bits_int_be(24)
                self._dirty = False


            def _fetch_instances(self):
                pass


            def _write__seq(self, io=None):
                super(WindowsLnkFile.LinkInfo.LinkInfoFlags, self)._write__seq(io)
                self._io.write_bits_int_be(6, self.reserved1)
                self._io.write_bits_int_be(1, int(self.has_common_net_rel_link))
                self._io.write_bits_int_be(1, int(self.has_volume_id_and_local_base_path))
                self._io.write_bits_int_be(24, self.reserved2)


            def _check(self):
                self._dirty = False


        class VolumeIdBody(ReadWriteKaitaiStruct):
            """
            .. seealso::
               Section 2.3.1 - https://winprotocoldoc.blob.core.windows.net/productionwindowsarchives/MS-SHLLINK/[MS-SHLLINK].pdf
            """
            def __init__(self, _io=None, _parent=None, _root=None):
                super(WindowsLnkFile.LinkInfo.VolumeIdBody, self).__init__(_io)
                self._parent = _parent
                self._root = _root
                self._should_write_volume_label_ansi = False
                self.volume_label_ansi__enabled = True

            def _read(self):
                self.drive_type = KaitaiStream.resolve_enum(WindowsLnkFile.DriveTypes, self._io.read_u4le())
                self.drive_serial_number = self._io.read_u4le()
                self.ofs_volume_label = self._io.read_u4le()
                if self.is_unicode:
                    pass
                    self.ofs_volume_label_unicode = self._io.read_u4le()

                self._dirty = False


            def _fetch_instances(self):
                pass
                if self.is_unicode:
                    pass

                _ = self.volume_label_ansi
                if hasattr(self, '_m_volume_label_ansi'):
                    pass



            def _write__seq(self, io=None):
                super(WindowsLnkFile.LinkInfo.VolumeIdBody, self)._write__seq(io)
                self._should_write_volume_label_ansi = self.volume_label_ansi__enabled
                self._io.write_u4le(int(self.drive_type))
                self._io.write_u4le(self.drive_serial_number)
                self._io.write_u4le(self.ofs_volume_label)
                if self.is_unicode:
                    pass
                    self._io.write_u4le(self.ofs_volume_label_unicode)



            def _check(self):
                if self.is_unicode:
                    pass

                if self.volume_label_ansi__enabled:
                    pass
                    if (not (self.is_unicode)):
                        pass
                        if KaitaiStream.byte_array_index_of((self._m_volume_label_ansi).encode(u"IBM437"), 0) != -1:
                            raise kaitaistruct.ConsistencyError(u"volume_label_ansi", -1, KaitaiStream.byte_array_index_of((self._m_volume_label_ansi).encode(u"IBM437"), 0))


                self._dirty = False

            @property
            def is_unicode(self):
                if hasattr(self, '_m_is_unicode'):
                    return self._m_is_unicode

                self._m_is_unicode = self.ofs_volume_label == 20
                return getattr(self, '_m_is_unicode', None)

            def _invalidate_is_unicode(self):
                del self._m_is_unicode
            @property
            def volume_label_ansi(self):
                if self._should_write_volume_label_ansi:
                    self._write_volume_label_ansi()
                if hasattr(self, '_m_volume_label_ansi'):
                    return self._m_volume_label_ansi

                if not self.volume_label_ansi__enabled:
                    return None

                if (not (self.is_unicode)):
                    pass
                    _pos = self._io.pos()
                    self._io.seek(self.ofs_volume_label - 4)
                    self._m_volume_label_ansi = (self._io.read_bytes_term(0, False, True, True)).decode(u"IBM437")
                    self._io.seek(_pos)

                return getattr(self, '_m_volume_label_ansi', None)

            @volume_label_ansi.setter
            def volume_label_ansi(self, v):
                self._dirty = True
                self._m_volume_label_ansi = v

            def _write_volume_label_ansi(self):
                self._should_write_volume_label_ansi = False
                if (not (self.is_unicode)):
                    pass
                    _pos = self._io.pos()
                    self._io.seek(self.ofs_volume_label - 4)
                    self._io.write_bytes((self._m_volume_label_ansi).encode(u"IBM437"))
                    self._io.write_u1(0)
                    self._io.seek(_pos)



        class VolumeIdSpec(ReadWriteKaitaiStruct):
            """
            .. seealso::
               Section 2.3.1 - https://winprotocoldoc.blob.core.windows.net/productionwindowsarchives/MS-SHLLINK/[MS-SHLLINK].pdf
            """
            def __init__(self, _io=None, _parent=None, _root=None):
                super(WindowsLnkFile.LinkInfo.VolumeIdSpec, self).__init__(_io)
                self._parent = _parent
                self._root = _root

            def _read(self):
                self.len_all = self._io.read_u4le()
                self._raw_body = self._io.read_bytes(self.len_all - 4)
                _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                self.body = WindowsLnkFile.LinkInfo.VolumeIdBody(_io__raw_body, self, self._root)
                self.body._read()
                self._dirty = False


            def _fetch_instances(self):
                pass
                self.body._fetch_instances()


            def _write__seq(self, io=None):
                super(WindowsLnkFile.LinkInfo.VolumeIdSpec, self)._write__seq(io)
                self._io.write_u4le(self.len_all)
                _io__raw_body = KaitaiStream(BytesIO(bytearray(self.len_all - 4)))
                self._io.add_child_stream(_io__raw_body)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.len_all - 4))
                def handler(parent, _io__raw_body=_io__raw_body):
                    self._raw_body = _io__raw_body.to_byte_array()
                    if len(self._raw_body) != self.len_all - 4:
                        raise kaitaistruct.ConsistencyError(u"raw(body)", self.len_all - 4, len(self._raw_body))
                    parent.write_bytes(self._raw_body)
                _io__raw_body.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.body._write__seq(_io__raw_body)


            def _check(self):
                if self.body._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"body", self._root, self.body._root)
                if self.body._parent != self:
                    raise kaitaistruct.ConsistencyError(u"body", self, self.body._parent)
                self._dirty = False



    class LinkTargetIdList(ReadWriteKaitaiStruct):
        """
        .. seealso::
           Section 2.2 - https://winprotocoldoc.blob.core.windows.net/productionwindowsarchives/MS-SHLLINK/[MS-SHLLINK].pdf
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(WindowsLnkFile.LinkTargetIdList, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.len_id_list = self._io.read_u2le()
            self._raw_id_list = self._io.read_bytes(self.len_id_list)
            _io__raw_id_list = KaitaiStream(BytesIO(self._raw_id_list))
            self.id_list = windows_shell_items.WindowsShellItems(_io__raw_id_list)
            self.id_list._read()
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.id_list._fetch_instances()


        def _write__seq(self, io=None):
            super(WindowsLnkFile.LinkTargetIdList, self)._write__seq(io)
            self._io.write_u2le(self.len_id_list)
            _io__raw_id_list = KaitaiStream(BytesIO(bytearray(self.len_id_list)))
            self._io.add_child_stream(_io__raw_id_list)
            _pos2 = self._io.pos()
            self._io.seek(self._io.pos() + (self.len_id_list))
            def handler(parent, _io__raw_id_list=_io__raw_id_list):
                self._raw_id_list = _io__raw_id_list.to_byte_array()
                if len(self._raw_id_list) != self.len_id_list:
                    raise kaitaistruct.ConsistencyError(u"raw(id_list)", self.len_id_list, len(self._raw_id_list))
                parent.write_bytes(self._raw_id_list)
            _io__raw_id_list.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
            self.id_list._write__seq(_io__raw_id_list)


        def _check(self):
            self._dirty = False


    class StringData(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(WindowsLnkFile.StringData, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.chars_str = self._io.read_u2le()
            self.str = (self._io.read_bytes(self.chars_str * 2)).decode(u"UTF-16LE")
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(WindowsLnkFile.StringData, self)._write__seq(io)
            self._io.write_u2le(self.chars_str)
            self._io.write_bytes((self.str).encode(u"UTF-16LE"))


        def _check(self):
            if len((self.str).encode(u"UTF-16LE")) != self.chars_str * 2:
                raise kaitaistruct.ConsistencyError(u"str", self.chars_str * 2, len((self.str).encode(u"UTF-16LE")))
            self._dirty = False



