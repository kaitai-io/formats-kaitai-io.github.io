# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import KaitaiStruct, KaitaiStream, BytesIO


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class HeapsPak(KaitaiStruct):
    """
    .. seealso::
       Source - https://github.com/HeapsIO/heaps/blob/2bbc2b386952dfd8856c04a854bb706a52cb4b58/hxd/fmt/pak/Reader.hx
    """
    def __init__(self, _io, _parent=None, _root=None):
        super(HeapsPak, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self
        self._read()

    def _read(self):
        self.header = HeapsPak.Header(self._io, self, self._root)


    def _fetch_instances(self):
        pass
        self.header._fetch_instances()

    class Header(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(HeapsPak.Header, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

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
            self.magic2 = self._io.read_bytes(4)
            if not self.magic2 == b"\x44\x41\x54\x41":
                raise kaitaistruct.ValidationNotEqualError(b"\x44\x41\x54\x41", self.magic2, self._io, u"/types/header/seq/5")


        def _fetch_instances(self):
            pass
            self.root_entry._fetch_instances()

        class Dir(KaitaiStruct):
            def __init__(self, _io, _parent=None, _root=None):
                super(HeapsPak.Header.Dir, self).__init__(_io)
                self._parent = _parent
                self._root = _root
                self._read()

            def _read(self):
                self.num_entries = self._io.read_u4le()
                self.entries = []
                for i in range(self.num_entries):
                    self.entries.append(HeapsPak.Header.Entry(self._io, self, self._root))



            def _fetch_instances(self):
                pass
                for i in range(len(self.entries)):
                    pass
                    self.entries[i]._fetch_instances()



        class Entry(KaitaiStruct):
            """
            .. seealso::
               Source - https://github.com/HeapsIO/heaps/blob/2bbc2b386952dfd8856c04a854bb706a52cb4b58/hxd/fmt/pak/Data.hx
            """
            def __init__(self, _io, _parent=None, _root=None):
                super(HeapsPak.Header.Entry, self).__init__(_io)
                self._parent = _parent
                self._root = _root
                self._read()

            def _read(self):
                self.len_name = self._io.read_u1()
                self.name = (self._io.read_bytes(self.len_name)).decode(u"UTF-8")
                self.flags = HeapsPak.Header.Entry.Flags(self._io, self, self._root)
                _on = self.flags.is_dir
                if _on == False:
                    pass
                    self.body = HeapsPak.Header.File(self._io, self, self._root)
                elif _on == True:
                    pass
                    self.body = HeapsPak.Header.Dir(self._io, self, self._root)


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

            class Flags(KaitaiStruct):
                def __init__(self, _io, _parent=None, _root=None):
                    super(HeapsPak.Header.Entry.Flags, self).__init__(_io)
                    self._parent = _parent
                    self._root = _root
                    self._read()

                def _read(self):
                    self.unused = self._io.read_bits_int_be(7)
                    self.is_dir = self._io.read_bits_int_be(1) != 0


                def _fetch_instances(self):
                    pass



        class File(KaitaiStruct):
            def __init__(self, _io, _parent=None, _root=None):
                super(HeapsPak.Header.File, self).__init__(_io)
                self._parent = _parent
                self._root = _root
                self._read()

            def _read(self):
                self.ofs_data = self._io.read_u4le()
                self.len_data = self._io.read_u4le()
                self.checksum = self._io.read_bytes(4)


            def _fetch_instances(self):
                pass
                _ = self.data
                if hasattr(self, '_m_data'):
                    pass


            @property
            def data(self):
                if hasattr(self, '_m_data'):
                    return self._m_data

                io = self._root._io
                _pos = io.pos()
                io.seek(self._root.header.len_header + self.ofs_data)
                self._m_data = io.read_bytes(self.len_data)
                io.seek(_pos)
                return getattr(self, '_m_data', None)




