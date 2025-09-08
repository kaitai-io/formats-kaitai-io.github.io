# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import ReadWriteKaitaiStruct, KaitaiStream, BytesIO


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class HeapsPak(ReadWriteKaitaiStruct):
    """
    .. seealso::
       Source - https://github.com/HeapsIO/heaps/blob/2bbc2b386952dfd8856c04a854bb706a52cb4b58/hxd/fmt/pak/Reader.hx
    """
    def __init__(self, _io=None, _parent=None, _root=None):
        super(HeapsPak, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self

    def _read(self):
        self.header = HeapsPak.Header(self._io, self, self._root)
        self.header._read()
        self._dirty = False


    def _fetch_instances(self):
        pass
        self.header._fetch_instances()


    def _write__seq(self, io=None):
        super(HeapsPak, self)._write__seq(io)
        self.header._write__seq(self._io)


    def _check(self):
        if self.header._root != self._root:
            raise kaitaistruct.ConsistencyError(u"header", self._root, self.header._root)
        if self.header._parent != self:
            raise kaitaistruct.ConsistencyError(u"header", self, self.header._parent)
        self._dirty = False

    class Header(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(HeapsPak.Header, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.magic1 = self._io.read_bytes(3)
            if not self.magic1 == b"\x50\x41\x4B":
                raise kaitaistruct.ValidationNotEqualError(b"\x50\x41\x4B", self.magic1, self._io, u"/types/header/seq/0")
            self.version = self._io.read_u1()
            self.len_header = self._io.read_u4le()
            self.len_data = self._io.read_u4le()
            self._raw_root_entry = self._io.read_bytes(self.len_header - 16)
            _io__raw_root_entry = KaitaiStream(BytesIO(self._raw_root_entry))
            self.root_entry = HeapsPak.Header.Entry(_io__raw_root_entry, self, self._root)
            self.root_entry._read()
            self.magic2 = self._io.read_bytes(4)
            if not self.magic2 == b"\x44\x41\x54\x41":
                raise kaitaistruct.ValidationNotEqualError(b"\x44\x41\x54\x41", self.magic2, self._io, u"/types/header/seq/5")
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.root_entry._fetch_instances()


        def _write__seq(self, io=None):
            super(HeapsPak.Header, self)._write__seq(io)
            self._io.write_bytes(self.magic1)
            self._io.write_u1(self.version)
            self._io.write_u4le(self.len_header)
            self._io.write_u4le(self.len_data)
            _io__raw_root_entry = KaitaiStream(BytesIO(bytearray(self.len_header - 16)))
            self._io.add_child_stream(_io__raw_root_entry)
            _pos2 = self._io.pos()
            self._io.seek(self._io.pos() + (self.len_header - 16))
            def handler(parent, _io__raw_root_entry=_io__raw_root_entry):
                self._raw_root_entry = _io__raw_root_entry.to_byte_array()
                if len(self._raw_root_entry) != self.len_header - 16:
                    raise kaitaistruct.ConsistencyError(u"raw(root_entry)", self.len_header - 16, len(self._raw_root_entry))
                parent.write_bytes(self._raw_root_entry)
            _io__raw_root_entry.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
            self.root_entry._write__seq(_io__raw_root_entry)
            self._io.write_bytes(self.magic2)


        def _check(self):
            if len(self.magic1) != 3:
                raise kaitaistruct.ConsistencyError(u"magic1", 3, len(self.magic1))
            if not self.magic1 == b"\x50\x41\x4B":
                raise kaitaistruct.ValidationNotEqualError(b"\x50\x41\x4B", self.magic1, None, u"/types/header/seq/0")
            if self.root_entry._root != self._root:
                raise kaitaistruct.ConsistencyError(u"root_entry", self._root, self.root_entry._root)
            if self.root_entry._parent != self:
                raise kaitaistruct.ConsistencyError(u"root_entry", self, self.root_entry._parent)
            if len(self.magic2) != 4:
                raise kaitaistruct.ConsistencyError(u"magic2", 4, len(self.magic2))
            if not self.magic2 == b"\x44\x41\x54\x41":
                raise kaitaistruct.ValidationNotEqualError(b"\x44\x41\x54\x41", self.magic2, None, u"/types/header/seq/5")
            self._dirty = False

        class Dir(ReadWriteKaitaiStruct):
            def __init__(self, _io=None, _parent=None, _root=None):
                super(HeapsPak.Header.Dir, self).__init__(_io)
                self._parent = _parent
                self._root = _root

            def _read(self):
                self.num_entries = self._io.read_u4le()
                self.entries = []
                for i in range(self.num_entries):
                    _t_entries = HeapsPak.Header.Entry(self._io, self, self._root)
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
                super(HeapsPak.Header.Dir, self)._write__seq(io)
                self._io.write_u4le(self.num_entries)
                for i in range(len(self.entries)):
                    pass
                    self.entries[i]._write__seq(self._io)



            def _check(self):
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
            """
            .. seealso::
               Source - https://github.com/HeapsIO/heaps/blob/2bbc2b386952dfd8856c04a854bb706a52cb4b58/hxd/fmt/pak/Data.hx
            """
            def __init__(self, _io=None, _parent=None, _root=None):
                super(HeapsPak.Header.Entry, self).__init__(_io)
                self._parent = _parent
                self._root = _root

            def _read(self):
                self.len_name = self._io.read_u1()
                self.name = (self._io.read_bytes(self.len_name)).decode(u"UTF-8")
                self.flags = HeapsPak.Header.Entry.Flags(self._io, self, self._root)
                self.flags._read()
                _on = self.flags.is_dir
                if _on == False:
                    pass
                    self.body = HeapsPak.Header.File(self._io, self, self._root)
                    self.body._read()
                elif _on == True:
                    pass
                    self.body = HeapsPak.Header.Dir(self._io, self, self._root)
                    self.body._read()
                self._dirty = False


            def _fetch_instances(self):
                pass
                self.flags._fetch_instances()
                _on = self.flags.is_dir
                if _on == False:
                    pass
                    self.body._fetch_instances()
                elif _on == True:
                    pass
                    self.body._fetch_instances()


            def _write__seq(self, io=None):
                super(HeapsPak.Header.Entry, self)._write__seq(io)
                self._io.write_u1(self.len_name)
                self._io.write_bytes((self.name).encode(u"UTF-8"))
                self.flags._write__seq(self._io)
                _on = self.flags.is_dir
                if _on == False:
                    pass
                    self.body._write__seq(self._io)
                elif _on == True:
                    pass
                    self.body._write__seq(self._io)


            def _check(self):
                if len((self.name).encode(u"UTF-8")) != self.len_name:
                    raise kaitaistruct.ConsistencyError(u"name", self.len_name, len((self.name).encode(u"UTF-8")))
                if self.flags._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"flags", self._root, self.flags._root)
                if self.flags._parent != self:
                    raise kaitaistruct.ConsistencyError(u"flags", self, self.flags._parent)
                _on = self.flags.is_dir
                if _on == False:
                    pass
                    if self.body._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"body", self._root, self.body._root)
                    if self.body._parent != self:
                        raise kaitaistruct.ConsistencyError(u"body", self, self.body._parent)
                elif _on == True:
                    pass
                    if self.body._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"body", self._root, self.body._root)
                    if self.body._parent != self:
                        raise kaitaistruct.ConsistencyError(u"body", self, self.body._parent)
                self._dirty = False

            class Flags(ReadWriteKaitaiStruct):
                def __init__(self, _io=None, _parent=None, _root=None):
                    super(HeapsPak.Header.Entry.Flags, self).__init__(_io)
                    self._parent = _parent
                    self._root = _root

                def _read(self):
                    self.unused = self._io.read_bits_int_be(7)
                    self.is_dir = self._io.read_bits_int_be(1) != 0
                    self._dirty = False


                def _fetch_instances(self):
                    pass


                def _write__seq(self, io=None):
                    super(HeapsPak.Header.Entry.Flags, self)._write__seq(io)
                    self._io.write_bits_int_be(7, self.unused)
                    self._io.write_bits_int_be(1, int(self.is_dir))


                def _check(self):
                    self._dirty = False



        class File(ReadWriteKaitaiStruct):
            def __init__(self, _io=None, _parent=None, _root=None):
                super(HeapsPak.Header.File, self).__init__(_io)
                self._parent = _parent
                self._root = _root
                self._should_write_data = False
                self.data__enabled = True

            def _read(self):
                self.ofs_data = self._io.read_u4le()
                self.len_data = self._io.read_u4le()
                self.checksum = self._io.read_bytes(4)
                self._dirty = False


            def _fetch_instances(self):
                pass
                _ = self.data
                if hasattr(self, '_m_data'):
                    pass



            def _write__seq(self, io=None):
                super(HeapsPak.Header.File, self)._write__seq(io)
                self._should_write_data = self.data__enabled
                self._io.write_u4le(self.ofs_data)
                self._io.write_u4le(self.len_data)
                self._io.write_bytes(self.checksum)


            def _check(self):
                if len(self.checksum) != 4:
                    raise kaitaistruct.ConsistencyError(u"checksum", 4, len(self.checksum))
                if self.data__enabled:
                    pass
                    if len(self._m_data) != self.len_data:
                        raise kaitaistruct.ConsistencyError(u"data", self.len_data, len(self._m_data))

                self._dirty = False

            @property
            def data(self):
                if self._should_write_data:
                    self._write_data()
                if hasattr(self, '_m_data'):
                    return self._m_data

                if not self.data__enabled:
                    return None

                io = self._root._io
                _pos = io.pos()
                io.seek(self._root.header.len_header + self.ofs_data)
                self._m_data = io.read_bytes(self.len_data)
                io.seek(_pos)
                return getattr(self, '_m_data', None)

            @data.setter
            def data(self, v):
                self._dirty = True
                self._m_data = v

            def _write_data(self):
                self._should_write_data = False
                io = self._root._io
                _pos = io.pos()
                io.seek(self._root.header.len_header + self.ofs_data)
                io.write_bytes(self._m_data)
                io.seek(_pos)




