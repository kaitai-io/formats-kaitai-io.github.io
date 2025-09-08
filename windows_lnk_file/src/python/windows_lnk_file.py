# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import KaitaiStruct, KaitaiStream, BytesIO
import windows_shell_items
from enum import IntEnum


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class WindowsLnkFile(KaitaiStruct):
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
    def __init__(self, _io, _parent=None, _root=None):
        super(WindowsLnkFile, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self
        self._read()

    def _read(self):
        self.header = WindowsLnkFile.FileHeader(self._io, self, self._root)
        if self.header.flags.has_link_target_id_list:
            pass
            self.target_id_list = WindowsLnkFile.LinkTargetIdList(self._io, self, self._root)

        if self.header.flags.has_link_info:
            pass
            self.info = WindowsLnkFile.LinkInfo(self._io, self, self._root)

        if self.header.flags.has_name:
            pass
            self.name = WindowsLnkFile.StringData(self._io, self, self._root)

        if self.header.flags.has_rel_path:
            pass
            self.rel_path = WindowsLnkFile.StringData(self._io, self, self._root)

        if self.header.flags.has_work_dir:
            pass
            self.work_dir = WindowsLnkFile.StringData(self._io, self, self._root)

        if self.header.flags.has_arguments:
            pass
            self.arguments = WindowsLnkFile.StringData(self._io, self, self._root)

        if self.header.flags.has_icon_location:
            pass
            self.icon_location = WindowsLnkFile.StringData(self._io, self, self._root)



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


    class FileHeader(KaitaiStruct):
        """
        .. seealso::
           Section 2.1 - https://winprotocoldoc.blob.core.windows.net/productionwindowsarchives/MS-SHLLINK/[MS-SHLLINK].pdf
        """
        def __init__(self, _io, _parent=None, _root=None):
            super(WindowsLnkFile.FileHeader, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

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


        def _fetch_instances(self):
            pass
            self.flags._fetch_instances()


    class LinkFlags(KaitaiStruct):
        """
        .. seealso::
           Section 2.1.1 - https://winprotocoldoc.blob.core.windows.net/productionwindowsarchives/MS-SHLLINK/[MS-SHLLINK].pdf
        """
        def __init__(self, _io, _parent=None, _root=None):
            super(WindowsLnkFile.LinkFlags, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

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


        def _fetch_instances(self):
            pass


    class LinkInfo(KaitaiStruct):
        """
        .. seealso::
           Section 2.3 - https://winprotocoldoc.blob.core.windows.net/productionwindowsarchives/MS-SHLLINK/[MS-SHLLINK].pdf
        """
        def __init__(self, _io, _parent=None, _root=None):
            super(WindowsLnkFile.LinkInfo, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.len_all = self._io.read_u4le()
            self._raw_all = self._io.read_bytes(self.len_all - 4)
            _io__raw_all = KaitaiStream(BytesIO(self._raw_all))
            self.all = WindowsLnkFile.LinkInfo.All(_io__raw_all, self, self._root)


        def _fetch_instances(self):
            pass
            self.all._fetch_instances()

        class All(KaitaiStruct):
            """
            .. seealso::
               Section 2.3 - https://winprotocoldoc.blob.core.windows.net/productionwindowsarchives/MS-SHLLINK/[MS-SHLLINK].pdf
            """
            def __init__(self, _io, _parent=None, _root=None):
                super(WindowsLnkFile.LinkInfo.All, self).__init__(_io)
                self._parent = _parent
                self._root = _root
                self._read()

            def _read(self):
                self.len_header = self._io.read_u4le()
                self._raw_header = self._io.read_bytes(self.len_header - 8)
                _io__raw_header = KaitaiStream(BytesIO(self._raw_header))
                self.header = WindowsLnkFile.LinkInfo.Header(_io__raw_header, self, self._root)


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


            @property
            def local_base_path(self):
                if hasattr(self, '_m_local_base_path'):
                    return self._m_local_base_path

                if self.header.flags.has_volume_id_and_local_base_path:
                    pass
                    _pos = self._io.pos()
                    self._io.seek(self.header.ofs_local_base_path - 4)
                    self._m_local_base_path = self._io.read_bytes_term(0, False, True, True)
                    self._io.seek(_pos)

                return getattr(self, '_m_local_base_path', None)

            @property
            def volume_id(self):
                if hasattr(self, '_m_volume_id'):
                    return self._m_volume_id

                if self.header.flags.has_volume_id_and_local_base_path:
                    pass
                    _pos = self._io.pos()
                    self._io.seek(self.header.ofs_volume_id - 4)
                    self._m_volume_id = WindowsLnkFile.LinkInfo.VolumeIdSpec(self._io, self, self._root)
                    self._io.seek(_pos)

                return getattr(self, '_m_volume_id', None)


        class Header(KaitaiStruct):
            """
            .. seealso::
               Section 2.3 - https://winprotocoldoc.blob.core.windows.net/productionwindowsarchives/MS-SHLLINK/[MS-SHLLINK].pdf
            """
            def __init__(self, _io, _parent=None, _root=None):
                super(WindowsLnkFile.LinkInfo.Header, self).__init__(_io)
                self._parent = _parent
                self._root = _root
                self._read()

            def _read(self):
                self.flags = WindowsLnkFile.LinkInfo.LinkInfoFlags(self._io, self, self._root)
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



            def _fetch_instances(self):
                pass
                self.flags._fetch_instances()
                if (not (self._io.is_eof())):
                    pass

                if (not (self._io.is_eof())):
                    pass



        class LinkInfoFlags(KaitaiStruct):
            """
            .. seealso::
               Section 2.3 - https://winprotocoldoc.blob.core.windows.net/productionwindowsarchives/MS-SHLLINK/[MS-SHLLINK].pdf
            """
            def __init__(self, _io, _parent=None, _root=None):
                super(WindowsLnkFile.LinkInfo.LinkInfoFlags, self).__init__(_io)
                self._parent = _parent
                self._root = _root
                self._read()

            def _read(self):
                self.reserved1 = self._io.read_bits_int_be(6)
                self.has_common_net_rel_link = self._io.read_bits_int_be(1) != 0
                self.has_volume_id_and_local_base_path = self._io.read_bits_int_be(1) != 0
                self.reserved2 = self._io.read_bits_int_be(24)


            def _fetch_instances(self):
                pass


        class VolumeIdBody(KaitaiStruct):
            """
            .. seealso::
               Section 2.3.1 - https://winprotocoldoc.blob.core.windows.net/productionwindowsarchives/MS-SHLLINK/[MS-SHLLINK].pdf
            """
            def __init__(self, _io, _parent=None, _root=None):
                super(WindowsLnkFile.LinkInfo.VolumeIdBody, self).__init__(_io)
                self._parent = _parent
                self._root = _root
                self._read()

            def _read(self):
                self.drive_type = KaitaiStream.resolve_enum(WindowsLnkFile.DriveTypes, self._io.read_u4le())
                self.drive_serial_number = self._io.read_u4le()
                self.ofs_volume_label = self._io.read_u4le()
                if self.is_unicode:
                    pass
                    self.ofs_volume_label_unicode = self._io.read_u4le()



            def _fetch_instances(self):
                pass
                if self.is_unicode:
                    pass

                _ = self.volume_label_ansi
                if hasattr(self, '_m_volume_label_ansi'):
                    pass


            @property
            def is_unicode(self):
                if hasattr(self, '_m_is_unicode'):
                    return self._m_is_unicode

                self._m_is_unicode = self.ofs_volume_label == 20
                return getattr(self, '_m_is_unicode', None)

            @property
            def volume_label_ansi(self):
                if hasattr(self, '_m_volume_label_ansi'):
                    return self._m_volume_label_ansi

                if (not (self.is_unicode)):
                    pass
                    _pos = self._io.pos()
                    self._io.seek(self.ofs_volume_label - 4)
                    self._m_volume_label_ansi = (self._io.read_bytes_term(0, False, True, True)).decode(u"IBM437")
                    self._io.seek(_pos)

                return getattr(self, '_m_volume_label_ansi', None)


        class VolumeIdSpec(KaitaiStruct):
            """
            .. seealso::
               Section 2.3.1 - https://winprotocoldoc.blob.core.windows.net/productionwindowsarchives/MS-SHLLINK/[MS-SHLLINK].pdf
            """
            def __init__(self, _io, _parent=None, _root=None):
                super(WindowsLnkFile.LinkInfo.VolumeIdSpec, self).__init__(_io)
                self._parent = _parent
                self._root = _root
                self._read()

            def _read(self):
                self.len_all = self._io.read_u4le()
                self._raw_body = self._io.read_bytes(self.len_all - 4)
                _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                self.body = WindowsLnkFile.LinkInfo.VolumeIdBody(_io__raw_body, self, self._root)


            def _fetch_instances(self):
                pass
                self.body._fetch_instances()



    class LinkTargetIdList(KaitaiStruct):
        """
        .. seealso::
           Section 2.2 - https://winprotocoldoc.blob.core.windows.net/productionwindowsarchives/MS-SHLLINK/[MS-SHLLINK].pdf
        """
        def __init__(self, _io, _parent=None, _root=None):
            super(WindowsLnkFile.LinkTargetIdList, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.len_id_list = self._io.read_u2le()
            self._raw_id_list = self._io.read_bytes(self.len_id_list)
            _io__raw_id_list = KaitaiStream(BytesIO(self._raw_id_list))
            self.id_list = windows_shell_items.WindowsShellItems(_io__raw_id_list)


        def _fetch_instances(self):
            pass
            self.id_list._fetch_instances()


    class StringData(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(WindowsLnkFile.StringData, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.chars_str = self._io.read_u2le()
            self.str = (self._io.read_bytes(self.chars_str * 2)).decode(u"UTF-16LE")


        def _fetch_instances(self):
            pass



