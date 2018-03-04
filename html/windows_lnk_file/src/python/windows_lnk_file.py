# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

from pkg_resources import parse_version
from kaitaistruct import __version__ as ks_version, KaitaiStruct, KaitaiStream, BytesIO
from enum import Enum


if parse_version(ks_version) < parse_version('0.7'):
    raise Exception("Incompatible Kaitai Struct Python API: 0.7 or later is required, but you have %s" % (ks_version))

from windows_shell_items import WindowsShellItems
class WindowsLnkFile(KaitaiStruct):
    """Windows .lnk files (AKA "shell link" file) are most frequently used
    in Windows shell to create "shortcuts" to another files, usually for
    purposes of running a program from some other directory, sometimes
    with certain preconfigured arguments and some other options.
    
    .. seealso::
       Source - https://winprotocoldoc.blob.core.windows.net/productionwindowsarchives/MS-SHLLINK/[MS-SHLLINK].pdf
    """

    class WindowState(Enum):
        normal = 1
        maximized = 3
        min_no_active = 7

    class DriveTypes(Enum):
        unknown = 0
        no_root_dir = 1
        removable = 2
        fixed = 3
        remote = 4
        cdrom = 5
        ramdisk = 6
    def __init__(self, _io, _parent=None, _root=None):
        self._io = _io
        self._parent = _parent
        self._root = _root if _root else self
        self._read()

    def _read(self):
        self.header = self._root.FileHeader(self._io, self, self._root)
        if self.header.flags.has_link_target_id_list:
            self.target_id_list = self._root.LinkTargetIdList(self._io, self, self._root)

        if self.header.flags.has_link_info:
            self.info = self._root.LinkInfo(self._io, self, self._root)

        if self.header.flags.has_name:
            self.name = self._root.StringData(self._io, self, self._root)

        if self.header.flags.has_rel_path:
            self.rel_path = self._root.StringData(self._io, self, self._root)

        if self.header.flags.has_work_dir:
            self.work_dir = self._root.StringData(self._io, self, self._root)

        if self.header.flags.has_arguments:
            self.arguments = self._root.StringData(self._io, self, self._root)

        if self.header.flags.has_icon_location:
            self.icon_location = self._root.StringData(self._io, self, self._root)


    class LinkTargetIdList(KaitaiStruct):
        """
        .. seealso::
           Section 2.2 - https://winprotocoldoc.blob.core.windows.net/productionwindowsarchives/MS-SHLLINK/[MS-SHLLINK].pdf
        """
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.len_id_list = self._io.read_u2le()
            self._raw_id_list = self._io.read_bytes(self.len_id_list)
            io = KaitaiStream(BytesIO(self._raw_id_list))
            self.id_list = WindowsShellItems(io)


    class StringData(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.chars_str = self._io.read_u2le()
            self.str = (self._io.read_bytes((self.chars_str * 2))).decode(u"UTF-16LE")


    class LinkInfo(KaitaiStruct):
        """
        .. seealso::
           Section 2.3 - https://winprotocoldoc.blob.core.windows.net/productionwindowsarchives/MS-SHLLINK/[MS-SHLLINK].pdf
        """
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.len_all = self._io.read_u4le()
            self._raw_all = self._io.read_bytes((self.len_all - 4))
            io = KaitaiStream(BytesIO(self._raw_all))
            self.all = self._root.LinkInfo.All(io, self, self._root)

        class VolumeIdBody(KaitaiStruct):
            """
            .. seealso::
               Section 2.3.1 - https://winprotocoldoc.blob.core.windows.net/productionwindowsarchives/MS-SHLLINK/[MS-SHLLINK].pdf
            """
            def __init__(self, _io, _parent=None, _root=None):
                self._io = _io
                self._parent = _parent
                self._root = _root if _root else self
                self._read()

            def _read(self):
                self.drive_type = self._root.DriveTypes(self._io.read_u4le())
                self.drive_serial_number = self._io.read_u4le()
                self.ofs_volume_label = self._io.read_u4le()
                if self.is_unicode:
                    self.ofs_volume_label_unicode = self._io.read_u4le()


            @property
            def is_unicode(self):
                if hasattr(self, '_m_is_unicode'):
                    return self._m_is_unicode if hasattr(self, '_m_is_unicode') else None

                self._m_is_unicode = self.ofs_volume_label == 20
                return self._m_is_unicode if hasattr(self, '_m_is_unicode') else None

            @property
            def volume_label_ansi(self):
                if hasattr(self, '_m_volume_label_ansi'):
                    return self._m_volume_label_ansi if hasattr(self, '_m_volume_label_ansi') else None

                if not (self.is_unicode):
                    _pos = self._io.pos()
                    self._io.seek((self.ofs_volume_label - 4))
                    self._m_volume_label_ansi = (self._io.read_bytes_term(0, False, True, True)).decode(u"cp437")
                    self._io.seek(_pos)

                return self._m_volume_label_ansi if hasattr(self, '_m_volume_label_ansi') else None


        class All(KaitaiStruct):
            """
            .. seealso::
               Section 2.3 - https://winprotocoldoc.blob.core.windows.net/productionwindowsarchives/MS-SHLLINK/[MS-SHLLINK].pdf
            """
            def __init__(self, _io, _parent=None, _root=None):
                self._io = _io
                self._parent = _parent
                self._root = _root if _root else self
                self._read()

            def _read(self):
                self.len_header = self._io.read_u4le()
                self._raw_header = self._io.read_bytes((self.len_header - 8))
                io = KaitaiStream(BytesIO(self._raw_header))
                self.header = self._root.LinkInfo.Header(io, self, self._root)

            @property
            def volume_id(self):
                if hasattr(self, '_m_volume_id'):
                    return self._m_volume_id if hasattr(self, '_m_volume_id') else None

                if self.header.flags.has_volume_id_and_local_base_path:
                    _pos = self._io.pos()
                    self._io.seek((self.header.ofs_volume_id - 4))
                    self._m_volume_id = self._root.LinkInfo.VolumeIdSpec(self._io, self, self._root)
                    self._io.seek(_pos)

                return self._m_volume_id if hasattr(self, '_m_volume_id') else None

            @property
            def local_base_path(self):
                if hasattr(self, '_m_local_base_path'):
                    return self._m_local_base_path if hasattr(self, '_m_local_base_path') else None

                if self.header.flags.has_volume_id_and_local_base_path:
                    _pos = self._io.pos()
                    self._io.seek((self.header.ofs_local_base_path - 4))
                    self._m_local_base_path = self._io.read_bytes_term(0, False, True, True)
                    self._io.seek(_pos)

                return self._m_local_base_path if hasattr(self, '_m_local_base_path') else None


        class VolumeIdSpec(KaitaiStruct):
            """
            .. seealso::
               Section 2.3.1 - https://winprotocoldoc.blob.core.windows.net/productionwindowsarchives/MS-SHLLINK/[MS-SHLLINK].pdf
            """
            def __init__(self, _io, _parent=None, _root=None):
                self._io = _io
                self._parent = _parent
                self._root = _root if _root else self
                self._read()

            def _read(self):
                self.len_all = self._io.read_u4le()
                self._raw_body = self._io.read_bytes((self.len_all - 4))
                io = KaitaiStream(BytesIO(self._raw_body))
                self.body = self._root.LinkInfo.VolumeIdBody(io, self, self._root)


        class LinkInfoFlags(KaitaiStruct):
            """
            .. seealso::
               Section 2.3 - https://winprotocoldoc.blob.core.windows.net/productionwindowsarchives/MS-SHLLINK/[MS-SHLLINK].pdf
            """
            def __init__(self, _io, _parent=None, _root=None):
                self._io = _io
                self._parent = _parent
                self._root = _root if _root else self
                self._read()

            def _read(self):
                self.reserved1 = self._io.read_bits_int(6)
                self.has_common_net_rel_link = self._io.read_bits_int(1) != 0
                self.has_volume_id_and_local_base_path = self._io.read_bits_int(1) != 0
                self.reserved2 = self._io.read_bits_int(24)


        class Header(KaitaiStruct):
            """
            .. seealso::
               Section 2.3 - https://winprotocoldoc.blob.core.windows.net/productionwindowsarchives/MS-SHLLINK/[MS-SHLLINK].pdf
            """
            def __init__(self, _io, _parent=None, _root=None):
                self._io = _io
                self._parent = _parent
                self._root = _root if _root else self
                self._read()

            def _read(self):
                self.flags = self._root.LinkInfo.LinkInfoFlags(self._io, self, self._root)
                self.ofs_volume_id = self._io.read_u4le()
                self.ofs_local_base_path = self._io.read_u4le()
                self.ofs_common_net_rel_link = self._io.read_u4le()
                self.ofs_common_path_suffix = self._io.read_u4le()
                if not (self._io.is_eof()):
                    self.ofs_local_base_path_unicode = self._io.read_u4le()

                if not (self._io.is_eof()):
                    self.ofs_common_path_suffix_unicode = self._io.read_u4le()




    class LinkFlags(KaitaiStruct):
        """
        .. seealso::
           Section 2.1.1 - https://winprotocoldoc.blob.core.windows.net/productionwindowsarchives/MS-SHLLINK/[MS-SHLLINK].pdf
        """
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.is_unicode = self._io.read_bits_int(1) != 0
            self.has_icon_location = self._io.read_bits_int(1) != 0
            self.has_arguments = self._io.read_bits_int(1) != 0
            self.has_work_dir = self._io.read_bits_int(1) != 0
            self.has_rel_path = self._io.read_bits_int(1) != 0
            self.has_name = self._io.read_bits_int(1) != 0
            self.has_link_info = self._io.read_bits_int(1) != 0
            self.has_link_target_id_list = self._io.read_bits_int(1) != 0
            self._unnamed8 = self._io.read_bits_int(16)
            self.reserved = self._io.read_bits_int(5)
            self.keep_local_id_list_for_unc_target = self._io.read_bits_int(1) != 0
            self._unnamed11 = self._io.read_bits_int(2)


    class FileHeader(KaitaiStruct):
        """
        .. seealso::
           Section 2.1 - https://winprotocoldoc.blob.core.windows.net/productionwindowsarchives/MS-SHLLINK/[MS-SHLLINK].pdf
        """
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.len_header = self._io.ensure_fixed_contents(b"\x4C\x00\x00\x00")
            self.link_clsid = self._io.ensure_fixed_contents(b"\x01\x14\x02\x00\x00\x00\x00\x00\xC0\x00\x00\x00\x00\x00\x00\x46")
            self._raw_flags = self._io.read_bytes(4)
            io = KaitaiStream(BytesIO(self._raw_flags))
            self.flags = self._root.LinkFlags(io, self, self._root)
            self.file_attrs = self._io.read_u4le()
            self.time_creation = self._io.read_u8le()
            self.time_access = self._io.read_u8le()
            self.time_write = self._io.read_u8le()
            self.target_file_size = self._io.read_u4le()
            self.icon_index = self._io.read_s4le()
            self.show_command = self._root.WindowState(self._io.read_u4le())
            self.hotkey = self._io.read_u2le()
            self.reserved = self._io.ensure_fixed_contents(b"\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00")



