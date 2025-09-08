# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import ReadWriteKaitaiStruct, KaitaiStream, BytesIO
from enum import IntEnum


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class AppleSingleDouble(ReadWriteKaitaiStruct):
    """AppleSingle and AppleDouble files are used by certain Mac
    applications (e.g. Finder) to store Mac-specific file attributes on
    filesystems that do not support that.
    
    Syntactically, both formats are the same, the only difference is how
    they are being used:
    
    * AppleSingle means that only one file will be created on external
      filesystem that will hold both the data (AKA "data fork" in Apple
      terminology), and the attributes (AKA "resource fork").
    * AppleDouble means that two files will be created: a normal file
      that keeps the data ("data fork") is kept separately from an
      auxiliary file that contains attributes ("resource fork"), which
      is kept with the same name, but starting with an extra dot and
      underscore `._` to keep it hidden.
    
    In modern practice (Mac OS X), Finder only uses AppleDouble to keep
    compatibility with other OSes, as virtually nobody outside of Mac
    understands how to access data in AppleSingle container.
    
    .. seealso::
       Source - http://kaiser-edv.de/documents/AppleSingle_AppleDouble.pdf
    """

    class FileType(IntEnum):
        apple_single = 333312
        apple_double = 333319
    def __init__(self, _io=None, _parent=None, _root=None):
        super(AppleSingleDouble, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self

    def _read(self):
        self.magic = KaitaiStream.resolve_enum(AppleSingleDouble.FileType, self._io.read_u4be())
        self.version = self._io.read_u4be()
        self.reserved = self._io.read_bytes(16)
        self.num_entries = self._io.read_u2be()
        self.entries = []
        for i in range(self.num_entries):
            _t_entries = AppleSingleDouble.Entry(self._io, self, self._root)
            try:
                _t_entries._read()
            finally:
                self.entries.append(_t_entries)

        self._dirty = False


    def _fetch_instances(self):
        pass
        for i in range(len(self.entries)):
            pass
            self.entries[i]._fetch_instances()



    def _write__seq(self, io=None):
        super(AppleSingleDouble, self)._write__seq(io)
        self._io.write_u4be(int(self.magic))
        self._io.write_u4be(self.version)
        self._io.write_bytes(self.reserved)
        self._io.write_u2be(self.num_entries)
        for i in range(len(self.entries)):
            pass
            self.entries[i]._write__seq(self._io)



    def _check(self):
        if len(self.reserved) != 16:
            raise kaitaistruct.ConsistencyError(u"reserved", 16, len(self.reserved))
        if len(self.entries) != self.num_entries:
            raise kaitaistruct.ConsistencyError(u"entries", self.num_entries, len(self.entries))
        for i in range(len(self.entries)):
            pass
            if self.entries[i]._root != self._root:
                raise kaitaistruct.ConsistencyError(u"entries", self._root, self.entries[i]._root)
            if self.entries[i]._parent != self:
                raise kaitaistruct.ConsistencyError(u"entries", self, self.entries[i]._parent)

        self._dirty = False

    class Entry(ReadWriteKaitaiStruct):

        class Types(IntEnum):
            data_fork = 1
            resource_fork = 2
            real_name = 3
            comment = 4
            icon_bw = 5
            icon_color = 6
            file_dates_info = 8
            finder_info = 9
            macintosh_file_info = 10
            prodos_file_info = 11
            msdos_file_info = 12
            afp_short_name = 13
            afp_file_info = 14
            afp_directory_id = 15
        def __init__(self, _io=None, _parent=None, _root=None):
            super(AppleSingleDouble.Entry, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._should_write_body = False
            self.body__enabled = True

        def _read(self):
            self.type = KaitaiStream.resolve_enum(AppleSingleDouble.Entry.Types, self._io.read_u4be())
            self.ofs_body = self._io.read_u4be()
            self.len_body = self._io.read_u4be()
            self._dirty = False


        def _fetch_instances(self):
            pass
            _ = self.body
            if hasattr(self, '_m_body'):
                pass
                _on = self.type
                if _on == AppleSingleDouble.Entry.Types.finder_info:
                    pass
                    self._m_body._fetch_instances()
                else:
                    pass



        def _write__seq(self, io=None):
            super(AppleSingleDouble.Entry, self)._write__seq(io)
            self._should_write_body = self.body__enabled
            self._io.write_u4be(int(self.type))
            self._io.write_u4be(self.ofs_body)
            self._io.write_u4be(self.len_body)


        def _check(self):
            if self.body__enabled:
                pass
                _on = self.type
                if _on == AppleSingleDouble.Entry.Types.finder_info:
                    pass
                    if self._m_body._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"body", self._root, self._m_body._root)
                    if self._m_body._parent != self:
                        raise kaitaistruct.ConsistencyError(u"body", self, self._m_body._parent)
                else:
                    pass
                    if len(self._m_body) != self.len_body:
                        raise kaitaistruct.ConsistencyError(u"body", self.len_body, len(self._m_body))

            self._dirty = False

        @property
        def body(self):
            if self._should_write_body:
                self._write_body()
            if hasattr(self, '_m_body'):
                return self._m_body

            if not self.body__enabled:
                return None

            _pos = self._io.pos()
            self._io.seek(self.ofs_body)
            _on = self.type
            if _on == AppleSingleDouble.Entry.Types.finder_info:
                pass
                self._raw__m_body = self._io.read_bytes(self.len_body)
                _io__raw__m_body = KaitaiStream(BytesIO(self._raw__m_body))
                self._m_body = AppleSingleDouble.FinderInfo(_io__raw__m_body, self, self._root)
                self._m_body._read()
            else:
                pass
                self._m_body = self._io.read_bytes(self.len_body)
            self._io.seek(_pos)
            return getattr(self, '_m_body', None)

        @body.setter
        def body(self, v):
            self._dirty = True
            self._m_body = v

        def _write_body(self):
            self._should_write_body = False
            _pos = self._io.pos()
            self._io.seek(self.ofs_body)
            _on = self.type
            if _on == AppleSingleDouble.Entry.Types.finder_info:
                pass
                _io__raw__m_body = KaitaiStream(BytesIO(bytearray(self.len_body)))
                self._io.add_child_stream(_io__raw__m_body)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.len_body))
                def handler(parent, _io__raw__m_body=_io__raw__m_body):
                    self._raw__m_body = _io__raw__m_body.to_byte_array()
                    if len(self._raw__m_body) != self.len_body:
                        raise kaitaistruct.ConsistencyError(u"raw(body)", self.len_body, len(self._raw__m_body))
                    parent.write_bytes(self._raw__m_body)
                _io__raw__m_body.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self._m_body._write__seq(_io__raw__m_body)
            else:
                pass
                self._io.write_bytes(self._m_body)
            self._io.seek(_pos)


    class FinderInfo(ReadWriteKaitaiStruct):
        """Information specific to Finder.
        
        .. seealso::
           older Inside Macintosh, Volume II page 84 or Volume IV page 104.
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(AppleSingleDouble.FinderInfo, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.file_type = self._io.read_bytes(4)
            self.file_creator = self._io.read_bytes(4)
            self.flags = self._io.read_u2be()
            self.location = AppleSingleDouble.Point(self._io, self, self._root)
            self.location._read()
            self.folder_id = self._io.read_u2be()
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.location._fetch_instances()


        def _write__seq(self, io=None):
            super(AppleSingleDouble.FinderInfo, self)._write__seq(io)
            self._io.write_bytes(self.file_type)
            self._io.write_bytes(self.file_creator)
            self._io.write_u2be(self.flags)
            self.location._write__seq(self._io)
            self._io.write_u2be(self.folder_id)


        def _check(self):
            if len(self.file_type) != 4:
                raise kaitaistruct.ConsistencyError(u"file_type", 4, len(self.file_type))
            if len(self.file_creator) != 4:
                raise kaitaistruct.ConsistencyError(u"file_creator", 4, len(self.file_creator))
            if self.location._root != self._root:
                raise kaitaistruct.ConsistencyError(u"location", self._root, self.location._root)
            if self.location._parent != self:
                raise kaitaistruct.ConsistencyError(u"location", self, self.location._parent)
            self._dirty = False


    class Point(ReadWriteKaitaiStruct):
        """Specifies 2D coordinate in QuickDraw grid."""
        def __init__(self, _io=None, _parent=None, _root=None):
            super(AppleSingleDouble.Point, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.x = self._io.read_u2be()
            self.y = self._io.read_u2be()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(AppleSingleDouble.Point, self)._write__seq(io)
            self._io.write_u2be(self.x)
            self._io.write_u2be(self.y)


        def _check(self):
            self._dirty = False



