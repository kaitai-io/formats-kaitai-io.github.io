# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

from pkg_resources import parse_version
from kaitaistruct import __version__ as ks_version, KaitaiStruct, KaitaiStream, BytesIO


if parse_version(ks_version) < parse_version('0.7'):
    raise Exception("Incompatible Kaitai Struct Python API: 0.7 or later is required, but you have %s" % (ks_version))

class HeapsPak(KaitaiStruct):
    """
    .. seealso::
       Source - https://github.com/HeapsIO/heaps/blob/2bbc2b386952dfd8856c04a854bb706a52cb4b58/hxd/fmt/pak/Reader.hx
    """
    def __init__(self, _io, _parent=None, _root=None):
        self._io = _io
        self._parent = _parent
        self._root = _root if _root else self
        self._read()

    def _read(self):
        self.header = self._root.Header(self._io, self, self._root)

    class Header(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.magic1 = self._io.ensure_fixed_contents(b"\x50\x41\x4B")
            self.version = self._io.read_u1()
            self.len_header = self._io.read_u4le()
            self.len_data = self._io.read_u4le()
            self._raw_root_entry = self._io.read_bytes((self.len_header - 16))
            io = KaitaiStream(BytesIO(self._raw_root_entry))
            self.root_entry = self._root.Header.Entry(io, self, self._root)
            self.magic2 = self._io.ensure_fixed_contents(b"\x44\x41\x54\x41")

        class Entry(KaitaiStruct):
            """
            .. seealso::
               Source - https://github.com/HeapsIO/heaps/blob/2bbc2b386952dfd8856c04a854bb706a52cb4b58/hxd/fmt/pak/Data.hx
            """
            def __init__(self, _io, _parent=None, _root=None):
                self._io = _io
                self._parent = _parent
                self._root = _root if _root else self
                self._read()

            def _read(self):
                self.len_name = self._io.read_u1()
                self.name = (self._io.read_bytes(self.len_name)).decode(u"UTF-8")
                self.flags = self._root.Header.Entry.Flags(self._io, self, self._root)
                _on = self.flags.is_dir
                if _on == True:
                    self.body = self._root.Header.Dir(self._io, self, self._root)
                elif _on == False:
                    self.body = self._root.Header.File(self._io, self, self._root)

            class Flags(KaitaiStruct):
                def __init__(self, _io, _parent=None, _root=None):
                    self._io = _io
                    self._parent = _parent
                    self._root = _root if _root else self
                    self._read()

                def _read(self):
                    self.unused = self._io.read_bits_int(7)
                    self.is_dir = self._io.read_bits_int(1) != 0



        class File(KaitaiStruct):
            def __init__(self, _io, _parent=None, _root=None):
                self._io = _io
                self._parent = _parent
                self._root = _root if _root else self
                self._read()

            def _read(self):
                self.ofs_data = self._io.read_u4le()
                self.len_data = self._io.read_u4le()
                self.checksum = self._io.read_bytes(4)

            @property
            def data(self):
                if hasattr(self, '_m_data'):
                    return self._m_data

                io = self._root._io
                _pos = io.pos()
                io.seek((self._root.header.len_header + self.ofs_data))
                self._m_data = io.read_bytes(self.len_data)
                io.seek(_pos)
                return self._m_data


        class Dir(KaitaiStruct):
            def __init__(self, _io, _parent=None, _root=None):
                self._io = _io
                self._parent = _parent
                self._root = _root if _root else self
                self._read()

            def _read(self):
                self.num_entries = self._io.read_u4le()
                self.entries = [None] * (self.num_entries)
                for i in range(self.num_entries):
                    self.entries[i] = self._root.Header.Entry(self._io, self, self._root)





