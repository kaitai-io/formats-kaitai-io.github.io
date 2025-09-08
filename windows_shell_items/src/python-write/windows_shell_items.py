# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import ReadWriteKaitaiStruct, KaitaiStream, BytesIO


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class WindowsShellItems(ReadWriteKaitaiStruct):
    """Windows Shell Items (AKA "shellbags") is an undocumented set of
    structures used internally within Windows to identify paths in
    Windows Folder Hierarchy. It is widely used in Windows Shell (and
    most visible in File Explorer), both as in-memory and in-file
    structures. Some formats embed them, namely:
    
    * Windows Shell link files (.lnk) Windows registry
    * Windows registry "ShellBags" keys
    
    The format is mostly undocumented, and is known to vary between
    various Windows versions.
    
    .. seealso::
       Source - https://github.com/libyal/libfwsi/blob/main/documentation/Windows%20Shell%20Item%20format.asciidoc
    """
    def __init__(self, _io=None, _parent=None, _root=None):
        super(WindowsShellItems, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self

    def _read(self):
        self.items = []
        i = 0
        while True:
            _t_items = WindowsShellItems.ShellItem(self._io, self, self._root)
            try:
                _t_items._read()
            finally:
                _ = _t_items
                self.items.append(_)
            if _.len_data == 0:
                break
            i += 1
        self._dirty = False


    def _fetch_instances(self):
        pass
        for i in range(len(self.items)):
            pass
            self.items[i]._fetch_instances()



    def _write__seq(self, io=None):
        super(WindowsShellItems, self)._write__seq(io)
        for i in range(len(self.items)):
            pass
            self.items[i]._write__seq(self._io)



    def _check(self):
        if len(self.items) == 0:
            raise kaitaistruct.ConsistencyError(u"items", 0, len(self.items))
        for i in range(len(self.items)):
            pass
            if self.items[i]._root != self._root:
                raise kaitaistruct.ConsistencyError(u"items", self._root, self.items[i]._root)
            if self.items[i]._parent != self:
                raise kaitaistruct.ConsistencyError(u"items", self, self.items[i]._parent)
            _ = self.items[i]
            if (_.len_data == 0) != (i == len(self.items) - 1):
                raise kaitaistruct.ConsistencyError(u"items", i == len(self.items) - 1, _.len_data == 0)

        self._dirty = False

    class FileEntryBody(ReadWriteKaitaiStruct):
        """
        .. seealso::
           Source - https://github.com/libyal/libfwsi/blob/main/documentation/Windows%20Shell%20Item%20format.asciidoc#34-file-entry-shell-item
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(WindowsShellItems.FileEntryBody, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self._unnamed0 = self._io.read_u1()
            self.file_size = self._io.read_u4le()
            self.last_mod_time = self._io.read_u4le()
            self.file_attrs = self._io.read_u2le()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(WindowsShellItems.FileEntryBody, self)._write__seq(io)
            self._io.write_u1(self._unnamed0)
            self._io.write_u4le(self.file_size)
            self._io.write_u4le(self.last_mod_time)
            self._io.write_u2le(self.file_attrs)


        def _check(self):
            self._dirty = False

        @property
        def is_dir(self):
            if hasattr(self, '_m_is_dir'):
                return self._m_is_dir

            self._m_is_dir = self._parent.code & 1 != 0
            return getattr(self, '_m_is_dir', None)

        def _invalidate_is_dir(self):
            del self._m_is_dir
        @property
        def is_file(self):
            if hasattr(self, '_m_is_file'):
                return self._m_is_file

            self._m_is_file = self._parent.code & 2 != 0
            return getattr(self, '_m_is_file', None)

        def _invalidate_is_file(self):
            del self._m_is_file

    class RootFolderBody(ReadWriteKaitaiStruct):
        """
        .. seealso::
           Source - https://github.com/libyal/libfwsi/blob/main/documentation/Windows%20Shell%20Item%20format.asciidoc#32-root-folder-shell-item
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(WindowsShellItems.RootFolderBody, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.sort_index = self._io.read_u1()
            self.shell_folder_id = self._io.read_bytes(16)
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(WindowsShellItems.RootFolderBody, self)._write__seq(io)
            self._io.write_u1(self.sort_index)
            self._io.write_bytes(self.shell_folder_id)


        def _check(self):
            if len(self.shell_folder_id) != 16:
                raise kaitaistruct.ConsistencyError(u"shell_folder_id", 16, len(self.shell_folder_id))
            self._dirty = False


    class ShellItem(ReadWriteKaitaiStruct):
        """
        .. seealso::
           Section 2.2.2 - https://winprotocoldoc.blob.core.windows.net/productionwindowsarchives/MS-SHLLINK/[MS-SHLLINK].pdf
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(WindowsShellItems.ShellItem, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.len_data = self._io.read_u2le()
            if self.len_data >= 2:
                pass
                self._raw_data = self._io.read_bytes(self.len_data - 2)
                _io__raw_data = KaitaiStream(BytesIO(self._raw_data))
                self.data = WindowsShellItems.ShellItemData(_io__raw_data, self, self._root)
                self.data._read()

            self._dirty = False


        def _fetch_instances(self):
            pass
            if self.len_data >= 2:
                pass
                self.data._fetch_instances()



        def _write__seq(self, io=None):
            super(WindowsShellItems.ShellItem, self)._write__seq(io)
            self._io.write_u2le(self.len_data)
            if self.len_data >= 2:
                pass
                _io__raw_data = KaitaiStream(BytesIO(bytearray(self.len_data - 2)))
                self._io.add_child_stream(_io__raw_data)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.len_data - 2))
                def handler(parent, _io__raw_data=_io__raw_data):
                    self._raw_data = _io__raw_data.to_byte_array()
                    if len(self._raw_data) != self.len_data - 2:
                        raise kaitaistruct.ConsistencyError(u"raw(data)", self.len_data - 2, len(self._raw_data))
                    parent.write_bytes(self._raw_data)
                _io__raw_data.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.data._write__seq(_io__raw_data)



        def _check(self):
            if self.len_data >= 2:
                pass
                if self.data._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"data", self._root, self.data._root)
                if self.data._parent != self:
                    raise kaitaistruct.ConsistencyError(u"data", self, self.data._parent)

            self._dirty = False


    class ShellItemData(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(WindowsShellItems.ShellItemData, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.code = self._io.read_u1()
            _on = self.code
            if _on == 31:
                pass
                self.body1 = WindowsShellItems.RootFolderBody(self._io, self, self._root)
                self.body1._read()
            _on = self.code & 112
            if _on == 32:
                pass
                self.body2 = WindowsShellItems.VolumeBody(self._io, self, self._root)
                self.body2._read()
            elif _on == 48:
                pass
                self.body2 = WindowsShellItems.FileEntryBody(self._io, self, self._root)
                self.body2._read()
            self._dirty = False


        def _fetch_instances(self):
            pass
            _on = self.code
            if _on == 31:
                pass
                self.body1._fetch_instances()
            _on = self.code & 112
            if _on == 32:
                pass
                self.body2._fetch_instances()
            elif _on == 48:
                pass
                self.body2._fetch_instances()


        def _write__seq(self, io=None):
            super(WindowsShellItems.ShellItemData, self)._write__seq(io)
            self._io.write_u1(self.code)
            _on = self.code
            if _on == 31:
                pass
                self.body1._write__seq(self._io)
            _on = self.code & 112
            if _on == 32:
                pass
                self.body2._write__seq(self._io)
            elif _on == 48:
                pass
                self.body2._write__seq(self._io)


        def _check(self):
            _on = self.code
            if _on == 31:
                pass
                if self.body1._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"body1", self._root, self.body1._root)
                if self.body1._parent != self:
                    raise kaitaistruct.ConsistencyError(u"body1", self, self.body1._parent)
            _on = self.code & 112
            if _on == 32:
                pass
                if self.body2._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"body2", self._root, self.body2._root)
                if self.body2._parent != self:
                    raise kaitaistruct.ConsistencyError(u"body2", self, self.body2._parent)
            elif _on == 48:
                pass
                if self.body2._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"body2", self._root, self.body2._root)
                if self.body2._parent != self:
                    raise kaitaistruct.ConsistencyError(u"body2", self, self.body2._parent)
            self._dirty = False


    class VolumeBody(ReadWriteKaitaiStruct):
        """
        .. seealso::
           Source - https://github.com/libyal/libfwsi/blob/main/documentation/Windows%20Shell%20Item%20format.asciidoc#33-volume-shell-item
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(WindowsShellItems.VolumeBody, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.flags = self._io.read_u1()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(WindowsShellItems.VolumeBody, self)._write__seq(io)
            self._io.write_u1(self.flags)


        def _check(self):
            self._dirty = False



