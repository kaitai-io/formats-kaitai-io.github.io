# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import ReadWriteKaitaiStruct, KaitaiStream, BytesIO
from enum import IntEnum


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class DoomWad(ReadWriteKaitaiStruct):
    def __init__(self, _io=None, _parent=None, _root=None):
        super(DoomWad, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self
        self._should_write_index = False
        self.index__enabled = True

    def _read(self):
        self.magic = (self._io.read_bytes(4)).decode(u"ASCII")
        self.num_index_entries = self._io.read_s4le()
        self.index_offset = self._io.read_s4le()
        self._dirty = False


    def _fetch_instances(self):
        pass
        _ = self.index
        if hasattr(self, '_m_index'):
            pass
            for i in range(len(self._m_index)):
                pass
                self._m_index[i]._fetch_instances()




    def _write__seq(self, io=None):
        super(DoomWad, self)._write__seq(io)
        self._should_write_index = self.index__enabled
        self._io.write_bytes((self.magic).encode(u"ASCII"))
        self._io.write_s4le(self.num_index_entries)
        self._io.write_s4le(self.index_offset)


    def _check(self):
        if len((self.magic).encode(u"ASCII")) != 4:
            raise kaitaistruct.ConsistencyError(u"magic", 4, len((self.magic).encode(u"ASCII")))
        if self.index__enabled:
            pass
            if len(self._m_index) != self.num_index_entries:
                raise kaitaistruct.ConsistencyError(u"index", self.num_index_entries, len(self._m_index))
            for i in range(len(self._m_index)):
                pass
                if self._m_index[i]._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"index", self._root, self._m_index[i]._root)
                if self._m_index[i]._parent != self:
                    raise kaitaistruct.ConsistencyError(u"index", self, self._m_index[i]._parent)


        self._dirty = False

    class Blockmap(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(DoomWad.Blockmap, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.origin_x = self._io.read_s2le()
            self.origin_y = self._io.read_s2le()
            self.num_cols = self._io.read_s2le()
            self.num_rows = self._io.read_s2le()
            self.linedefs_in_block = []
            for i in range(self.num_cols * self.num_rows):
                _t_linedefs_in_block = DoomWad.Blockmap.Blocklist(self._io, self, self._root)
                try:
                    _t_linedefs_in_block._read()
                finally:
                    self.linedefs_in_block.append(_t_linedefs_in_block)

            self._dirty = False


        def _fetch_instances(self):
            pass
            for i in range(len(self.linedefs_in_block)):
                pass
                self.linedefs_in_block[i]._fetch_instances()



        def _write__seq(self, io=None):
            super(DoomWad.Blockmap, self)._write__seq(io)
            self._io.write_s2le(self.origin_x)
            self._io.write_s2le(self.origin_y)
            self._io.write_s2le(self.num_cols)
            self._io.write_s2le(self.num_rows)
            for i in range(len(self.linedefs_in_block)):
                pass
                self.linedefs_in_block[i]._write__seq(self._io)



        def _check(self):
            if len(self.linedefs_in_block) != self.num_cols * self.num_rows:
                raise kaitaistruct.ConsistencyError(u"linedefs_in_block", self.num_cols * self.num_rows, len(self.linedefs_in_block))
            for i in range(len(self.linedefs_in_block)):
                pass
                if self.linedefs_in_block[i]._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"linedefs_in_block", self._root, self.linedefs_in_block[i]._root)
                if self.linedefs_in_block[i]._parent != self:
                    raise kaitaistruct.ConsistencyError(u"linedefs_in_block", self, self.linedefs_in_block[i]._parent)

            self._dirty = False

        class Blocklist(ReadWriteKaitaiStruct):
            def __init__(self, _io=None, _parent=None, _root=None):
                super(DoomWad.Blockmap.Blocklist, self).__init__(_io)
                self._parent = _parent
                self._root = _root
                self._should_write_linedefs = False
                self.linedefs__enabled = True

            def _read(self):
                self.offset = self._io.read_u2le()
                self._dirty = False


            def _fetch_instances(self):
                pass
                _ = self.linedefs
                if hasattr(self, '_m_linedefs'):
                    pass
                    for i in range(len(self._m_linedefs)):
                        pass




            def _write__seq(self, io=None):
                super(DoomWad.Blockmap.Blocklist, self)._write__seq(io)
                self._should_write_linedefs = self.linedefs__enabled
                self._io.write_u2le(self.offset)


            def _check(self):
                if self.linedefs__enabled:
                    pass
                    if len(self._m_linedefs) == 0:
                        raise kaitaistruct.ConsistencyError(u"linedefs", 0, len(self._m_linedefs))
                    for i in range(len(self._m_linedefs)):
                        pass
                        _ = self._m_linedefs[i]
                        if (_ == -1) != (i == len(self._m_linedefs) - 1):
                            raise kaitaistruct.ConsistencyError(u"linedefs", i == len(self._m_linedefs) - 1, _ == -1)


                self._dirty = False

            @property
            def linedefs(self):
                """List of linedefs found in this block."""
                if self._should_write_linedefs:
                    self._write_linedefs()
                if hasattr(self, '_m_linedefs'):
                    return self._m_linedefs

                if not self.linedefs__enabled:
                    return None

                _pos = self._io.pos()
                self._io.seek(self.offset * 2)
                self._m_linedefs = []
                i = 0
                while True:
                    _ = self._io.read_s2le()
                    self._m_linedefs.append(_)
                    if _ == -1:
                        break
                    i += 1
                self._io.seek(_pos)
                return getattr(self, '_m_linedefs', None)

            @linedefs.setter
            def linedefs(self, v):
                self._dirty = True
                self._m_linedefs = v

            def _write_linedefs(self):
                self._should_write_linedefs = False
                _pos = self._io.pos()
                self._io.seek(self.offset * 2)
                for i in range(len(self._m_linedefs)):
                    pass
                    self._io.write_s2le(self._m_linedefs[i])

                self._io.seek(_pos)



    class IndexEntry(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(DoomWad.IndexEntry, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._should_write_contents = False
            self.contents__enabled = True

        def _read(self):
            self.offset = self._io.read_s4le()
            self.size = self._io.read_s4le()
            self.name = (KaitaiStream.bytes_strip_right(self._io.read_bytes(8), 0)).decode(u"ASCII")
            self._dirty = False


        def _fetch_instances(self):
            pass
            _ = self.contents
            if hasattr(self, '_m_contents'):
                pass
                _on = self.name
                if _on == u"BLOCKMAP":
                    pass
                    self._m_contents._fetch_instances()
                elif _on == u"LINEDEFS":
                    pass
                    self._m_contents._fetch_instances()
                elif _on == u"PNAMES":
                    pass
                    self._m_contents._fetch_instances()
                elif _on == u"SECTORS":
                    pass
                    self._m_contents._fetch_instances()
                elif _on == u"SIDEDEFS":
                    pass
                    self._m_contents._fetch_instances()
                elif _on == u"TEXTURE1":
                    pass
                    self._m_contents._fetch_instances()
                elif _on == u"TEXTURE2":
                    pass
                    self._m_contents._fetch_instances()
                elif _on == u"THINGS":
                    pass
                    self._m_contents._fetch_instances()
                elif _on == u"VERTEXES":
                    pass
                    self._m_contents._fetch_instances()
                else:
                    pass



        def _write__seq(self, io=None):
            super(DoomWad.IndexEntry, self)._write__seq(io)
            self._should_write_contents = self.contents__enabled
            self._io.write_s4le(self.offset)
            self._io.write_s4le(self.size)
            self._io.write_bytes_limit((self.name).encode(u"ASCII"), 8, 0, 0)


        def _check(self):
            if len((self.name).encode(u"ASCII")) > 8:
                raise kaitaistruct.ConsistencyError(u"name", 8, len((self.name).encode(u"ASCII")))
            if  ((len((self.name).encode(u"ASCII")) != 0) and (KaitaiStream.byte_array_index((self.name).encode(u"ASCII"), -1) == 0)) :
                raise kaitaistruct.ConsistencyError(u"name", 0, KaitaiStream.byte_array_index((self.name).encode(u"ASCII"), -1))
            if self.contents__enabled:
                pass
                _on = self.name
                if _on == u"BLOCKMAP":
                    pass
                    if self._m_contents._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"contents", self._root, self._m_contents._root)
                    if self._m_contents._parent != self:
                        raise kaitaistruct.ConsistencyError(u"contents", self, self._m_contents._parent)
                elif _on == u"LINEDEFS":
                    pass
                    if self._m_contents._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"contents", self._root, self._m_contents._root)
                    if self._m_contents._parent != self:
                        raise kaitaistruct.ConsistencyError(u"contents", self, self._m_contents._parent)
                elif _on == u"PNAMES":
                    pass
                    if self._m_contents._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"contents", self._root, self._m_contents._root)
                    if self._m_contents._parent != self:
                        raise kaitaistruct.ConsistencyError(u"contents", self, self._m_contents._parent)
                elif _on == u"SECTORS":
                    pass
                    if self._m_contents._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"contents", self._root, self._m_contents._root)
                    if self._m_contents._parent != self:
                        raise kaitaistruct.ConsistencyError(u"contents", self, self._m_contents._parent)
                elif _on == u"SIDEDEFS":
                    pass
                    if self._m_contents._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"contents", self._root, self._m_contents._root)
                    if self._m_contents._parent != self:
                        raise kaitaistruct.ConsistencyError(u"contents", self, self._m_contents._parent)
                elif _on == u"TEXTURE1":
                    pass
                    if self._m_contents._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"contents", self._root, self._m_contents._root)
                    if self._m_contents._parent != self:
                        raise kaitaistruct.ConsistencyError(u"contents", self, self._m_contents._parent)
                elif _on == u"TEXTURE2":
                    pass
                    if self._m_contents._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"contents", self._root, self._m_contents._root)
                    if self._m_contents._parent != self:
                        raise kaitaistruct.ConsistencyError(u"contents", self, self._m_contents._parent)
                elif _on == u"THINGS":
                    pass
                    if self._m_contents._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"contents", self._root, self._m_contents._root)
                    if self._m_contents._parent != self:
                        raise kaitaistruct.ConsistencyError(u"contents", self, self._m_contents._parent)
                elif _on == u"VERTEXES":
                    pass
                    if self._m_contents._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"contents", self._root, self._m_contents._root)
                    if self._m_contents._parent != self:
                        raise kaitaistruct.ConsistencyError(u"contents", self, self._m_contents._parent)
                else:
                    pass
                    if len(self._m_contents) != self.size:
                        raise kaitaistruct.ConsistencyError(u"contents", self.size, len(self._m_contents))

            self._dirty = False

        @property
        def contents(self):
            if self._should_write_contents:
                self._write_contents()
            if hasattr(self, '_m_contents'):
                return self._m_contents

            if not self.contents__enabled:
                return None

            io = self._root._io
            _pos = io.pos()
            io.seek(self.offset)
            _on = self.name
            if _on == u"BLOCKMAP":
                pass
                self._raw__m_contents = io.read_bytes(self.size)
                _io__raw__m_contents = KaitaiStream(BytesIO(self._raw__m_contents))
                self._m_contents = DoomWad.Blockmap(_io__raw__m_contents, self, self._root)
                self._m_contents._read()
            elif _on == u"LINEDEFS":
                pass
                self._raw__m_contents = io.read_bytes(self.size)
                _io__raw__m_contents = KaitaiStream(BytesIO(self._raw__m_contents))
                self._m_contents = DoomWad.Linedefs(_io__raw__m_contents, self, self._root)
                self._m_contents._read()
            elif _on == u"PNAMES":
                pass
                self._raw__m_contents = io.read_bytes(self.size)
                _io__raw__m_contents = KaitaiStream(BytesIO(self._raw__m_contents))
                self._m_contents = DoomWad.Pnames(_io__raw__m_contents, self, self._root)
                self._m_contents._read()
            elif _on == u"SECTORS":
                pass
                self._raw__m_contents = io.read_bytes(self.size)
                _io__raw__m_contents = KaitaiStream(BytesIO(self._raw__m_contents))
                self._m_contents = DoomWad.Sectors(_io__raw__m_contents, self, self._root)
                self._m_contents._read()
            elif _on == u"SIDEDEFS":
                pass
                self._raw__m_contents = io.read_bytes(self.size)
                _io__raw__m_contents = KaitaiStream(BytesIO(self._raw__m_contents))
                self._m_contents = DoomWad.Sidedefs(_io__raw__m_contents, self, self._root)
                self._m_contents._read()
            elif _on == u"TEXTURE1":
                pass
                self._raw__m_contents = io.read_bytes(self.size)
                _io__raw__m_contents = KaitaiStream(BytesIO(self._raw__m_contents))
                self._m_contents = DoomWad.Texture12(_io__raw__m_contents, self, self._root)
                self._m_contents._read()
            elif _on == u"TEXTURE2":
                pass
                self._raw__m_contents = io.read_bytes(self.size)
                _io__raw__m_contents = KaitaiStream(BytesIO(self._raw__m_contents))
                self._m_contents = DoomWad.Texture12(_io__raw__m_contents, self, self._root)
                self._m_contents._read()
            elif _on == u"THINGS":
                pass
                self._raw__m_contents = io.read_bytes(self.size)
                _io__raw__m_contents = KaitaiStream(BytesIO(self._raw__m_contents))
                self._m_contents = DoomWad.Things(_io__raw__m_contents, self, self._root)
                self._m_contents._read()
            elif _on == u"VERTEXES":
                pass
                self._raw__m_contents = io.read_bytes(self.size)
                _io__raw__m_contents = KaitaiStream(BytesIO(self._raw__m_contents))
                self._m_contents = DoomWad.Vertexes(_io__raw__m_contents, self, self._root)
                self._m_contents._read()
            else:
                pass
                self._m_contents = io.read_bytes(self.size)
            io.seek(_pos)
            return getattr(self, '_m_contents', None)

        @contents.setter
        def contents(self, v):
            self._dirty = True
            self._m_contents = v

        def _write_contents(self):
            self._should_write_contents = False
            io = self._root._io
            _pos = io.pos()
            io.seek(self.offset)
            _on = self.name
            if _on == u"BLOCKMAP":
                pass
                _io__raw__m_contents = KaitaiStream(BytesIO(bytearray(self.size)))
                io.add_child_stream(_io__raw__m_contents)
                _pos2 = io.pos()
                io.seek(io.pos() + (self.size))
                def handler(parent, _io__raw__m_contents=_io__raw__m_contents):
                    self._raw__m_contents = _io__raw__m_contents.to_byte_array()
                    if len(self._raw__m_contents) != self.size:
                        raise kaitaistruct.ConsistencyError(u"raw(contents)", self.size, len(self._raw__m_contents))
                    parent.write_bytes(self._raw__m_contents)
                _io__raw__m_contents.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self._m_contents._write__seq(_io__raw__m_contents)
            elif _on == u"LINEDEFS":
                pass
                _io__raw__m_contents = KaitaiStream(BytesIO(bytearray(self.size)))
                io.add_child_stream(_io__raw__m_contents)
                _pos2 = io.pos()
                io.seek(io.pos() + (self.size))
                def handler(parent, _io__raw__m_contents=_io__raw__m_contents):
                    self._raw__m_contents = _io__raw__m_contents.to_byte_array()
                    if len(self._raw__m_contents) != self.size:
                        raise kaitaistruct.ConsistencyError(u"raw(contents)", self.size, len(self._raw__m_contents))
                    parent.write_bytes(self._raw__m_contents)
                _io__raw__m_contents.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self._m_contents._write__seq(_io__raw__m_contents)
            elif _on == u"PNAMES":
                pass
                _io__raw__m_contents = KaitaiStream(BytesIO(bytearray(self.size)))
                io.add_child_stream(_io__raw__m_contents)
                _pos2 = io.pos()
                io.seek(io.pos() + (self.size))
                def handler(parent, _io__raw__m_contents=_io__raw__m_contents):
                    self._raw__m_contents = _io__raw__m_contents.to_byte_array()
                    if len(self._raw__m_contents) != self.size:
                        raise kaitaistruct.ConsistencyError(u"raw(contents)", self.size, len(self._raw__m_contents))
                    parent.write_bytes(self._raw__m_contents)
                _io__raw__m_contents.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self._m_contents._write__seq(_io__raw__m_contents)
            elif _on == u"SECTORS":
                pass
                _io__raw__m_contents = KaitaiStream(BytesIO(bytearray(self.size)))
                io.add_child_stream(_io__raw__m_contents)
                _pos2 = io.pos()
                io.seek(io.pos() + (self.size))
                def handler(parent, _io__raw__m_contents=_io__raw__m_contents):
                    self._raw__m_contents = _io__raw__m_contents.to_byte_array()
                    if len(self._raw__m_contents) != self.size:
                        raise kaitaistruct.ConsistencyError(u"raw(contents)", self.size, len(self._raw__m_contents))
                    parent.write_bytes(self._raw__m_contents)
                _io__raw__m_contents.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self._m_contents._write__seq(_io__raw__m_contents)
            elif _on == u"SIDEDEFS":
                pass
                _io__raw__m_contents = KaitaiStream(BytesIO(bytearray(self.size)))
                io.add_child_stream(_io__raw__m_contents)
                _pos2 = io.pos()
                io.seek(io.pos() + (self.size))
                def handler(parent, _io__raw__m_contents=_io__raw__m_contents):
                    self._raw__m_contents = _io__raw__m_contents.to_byte_array()
                    if len(self._raw__m_contents) != self.size:
                        raise kaitaistruct.ConsistencyError(u"raw(contents)", self.size, len(self._raw__m_contents))
                    parent.write_bytes(self._raw__m_contents)
                _io__raw__m_contents.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self._m_contents._write__seq(_io__raw__m_contents)
            elif _on == u"TEXTURE1":
                pass
                _io__raw__m_contents = KaitaiStream(BytesIO(bytearray(self.size)))
                io.add_child_stream(_io__raw__m_contents)
                _pos2 = io.pos()
                io.seek(io.pos() + (self.size))
                def handler(parent, _io__raw__m_contents=_io__raw__m_contents):
                    self._raw__m_contents = _io__raw__m_contents.to_byte_array()
                    if len(self._raw__m_contents) != self.size:
                        raise kaitaistruct.ConsistencyError(u"raw(contents)", self.size, len(self._raw__m_contents))
                    parent.write_bytes(self._raw__m_contents)
                _io__raw__m_contents.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self._m_contents._write__seq(_io__raw__m_contents)
            elif _on == u"TEXTURE2":
                pass
                _io__raw__m_contents = KaitaiStream(BytesIO(bytearray(self.size)))
                io.add_child_stream(_io__raw__m_contents)
                _pos2 = io.pos()
                io.seek(io.pos() + (self.size))
                def handler(parent, _io__raw__m_contents=_io__raw__m_contents):
                    self._raw__m_contents = _io__raw__m_contents.to_byte_array()
                    if len(self._raw__m_contents) != self.size:
                        raise kaitaistruct.ConsistencyError(u"raw(contents)", self.size, len(self._raw__m_contents))
                    parent.write_bytes(self._raw__m_contents)
                _io__raw__m_contents.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self._m_contents._write__seq(_io__raw__m_contents)
            elif _on == u"THINGS":
                pass
                _io__raw__m_contents = KaitaiStream(BytesIO(bytearray(self.size)))
                io.add_child_stream(_io__raw__m_contents)
                _pos2 = io.pos()
                io.seek(io.pos() + (self.size))
                def handler(parent, _io__raw__m_contents=_io__raw__m_contents):
                    self._raw__m_contents = _io__raw__m_contents.to_byte_array()
                    if len(self._raw__m_contents) != self.size:
                        raise kaitaistruct.ConsistencyError(u"raw(contents)", self.size, len(self._raw__m_contents))
                    parent.write_bytes(self._raw__m_contents)
                _io__raw__m_contents.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self._m_contents._write__seq(_io__raw__m_contents)
            elif _on == u"VERTEXES":
                pass
                _io__raw__m_contents = KaitaiStream(BytesIO(bytearray(self.size)))
                io.add_child_stream(_io__raw__m_contents)
                _pos2 = io.pos()
                io.seek(io.pos() + (self.size))
                def handler(parent, _io__raw__m_contents=_io__raw__m_contents):
                    self._raw__m_contents = _io__raw__m_contents.to_byte_array()
                    if len(self._raw__m_contents) != self.size:
                        raise kaitaistruct.ConsistencyError(u"raw(contents)", self.size, len(self._raw__m_contents))
                    parent.write_bytes(self._raw__m_contents)
                _io__raw__m_contents.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self._m_contents._write__seq(_io__raw__m_contents)
            else:
                pass
                io.write_bytes(self._m_contents)
            io.seek(_pos)


    class Linedef(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(DoomWad.Linedef, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.vertex_start_idx = self._io.read_u2le()
            self.vertex_end_idx = self._io.read_u2le()
            self.flags = self._io.read_u2le()
            self.line_type = self._io.read_u2le()
            self.sector_tag = self._io.read_u2le()
            self.sidedef_right_idx = self._io.read_u2le()
            self.sidedef_left_idx = self._io.read_u2le()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(DoomWad.Linedef, self)._write__seq(io)
            self._io.write_u2le(self.vertex_start_idx)
            self._io.write_u2le(self.vertex_end_idx)
            self._io.write_u2le(self.flags)
            self._io.write_u2le(self.line_type)
            self._io.write_u2le(self.sector_tag)
            self._io.write_u2le(self.sidedef_right_idx)
            self._io.write_u2le(self.sidedef_left_idx)


        def _check(self):
            self._dirty = False


    class Linedefs(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(DoomWad.Linedefs, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.entries = []
            i = 0
            while not self._io.is_eof():
                _t_entries = DoomWad.Linedef(self._io, self, self._root)
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
            super(DoomWad.Linedefs, self)._write__seq(io)
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


    class Pnames(ReadWriteKaitaiStruct):
        """
        .. seealso::
           Source - https://doom.fandom.com/wiki/PNAMES
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(DoomWad.Pnames, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.num_patches = self._io.read_u4le()
            self.names = []
            for i in range(self.num_patches):
                self.names.append((KaitaiStream.bytes_strip_right(self._io.read_bytes(8), 0)).decode(u"ASCII"))

            self._dirty = False


        def _fetch_instances(self):
            pass
            for i in range(len(self.names)):
                pass



        def _write__seq(self, io=None):
            super(DoomWad.Pnames, self)._write__seq(io)
            self._io.write_u4le(self.num_patches)
            for i in range(len(self.names)):
                pass
                self._io.write_bytes_limit((self.names[i]).encode(u"ASCII"), 8, 0, 0)



        def _check(self):
            if len(self.names) != self.num_patches:
                raise kaitaistruct.ConsistencyError(u"names", self.num_patches, len(self.names))
            for i in range(len(self.names)):
                pass
                if len((self.names[i]).encode(u"ASCII")) > 8:
                    raise kaitaistruct.ConsistencyError(u"names", 8, len((self.names[i]).encode(u"ASCII")))
                if  ((len((self.names[i]).encode(u"ASCII")) != 0) and (KaitaiStream.byte_array_index((self.names[i]).encode(u"ASCII"), -1) == 0)) :
                    raise kaitaistruct.ConsistencyError(u"names", 0, KaitaiStream.byte_array_index((self.names[i]).encode(u"ASCII"), -1))

            self._dirty = False


    class Sector(ReadWriteKaitaiStruct):

        class SpecialSector(IntEnum):
            normal = 0
            d_light_flicker = 1
            d_light_strobe_fast = 2
            d_light_strobe_slow = 3
            d_light_strobe_hurt = 4
            d_damage_hellslime = 5
            d_damage_nukage = 7
            d_light_glow = 8
            secret = 9
            d_sector_door_close_in_30 = 10
            d_damage_end = 11
            d_light_strobe_slow_sync = 12
            d_light_strobe_fast_sync = 13
            d_sector_door_raise_in_5_mins = 14
            d_friction_low = 15
            d_damage_super_hellslime = 16
            d_light_fire_flicker = 17
            d_damage_lava_wimpy = 18
            d_damage_lava_hefty = 19
            d_scroll_east_lava_damage = 20
            light_phased = 21
            light_sequence_start = 22
            light_sequence_special1 = 23
            light_sequence_special2 = 24
        def __init__(self, _io=None, _parent=None, _root=None):
            super(DoomWad.Sector, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.floor_z = self._io.read_s2le()
            self.ceil_z = self._io.read_s2le()
            self.floor_flat = (self._io.read_bytes(8)).decode(u"ASCII")
            self.ceil_flat = (self._io.read_bytes(8)).decode(u"ASCII")
            self.light = self._io.read_s2le()
            self.special_type = KaitaiStream.resolve_enum(DoomWad.Sector.SpecialSector, self._io.read_u2le())
            self.tag = self._io.read_u2le()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(DoomWad.Sector, self)._write__seq(io)
            self._io.write_s2le(self.floor_z)
            self._io.write_s2le(self.ceil_z)
            self._io.write_bytes((self.floor_flat).encode(u"ASCII"))
            self._io.write_bytes((self.ceil_flat).encode(u"ASCII"))
            self._io.write_s2le(self.light)
            self._io.write_u2le(int(self.special_type))
            self._io.write_u2le(self.tag)


        def _check(self):
            if len((self.floor_flat).encode(u"ASCII")) != 8:
                raise kaitaistruct.ConsistencyError(u"floor_flat", 8, len((self.floor_flat).encode(u"ASCII")))
            if len((self.ceil_flat).encode(u"ASCII")) != 8:
                raise kaitaistruct.ConsistencyError(u"ceil_flat", 8, len((self.ceil_flat).encode(u"ASCII")))
            self._dirty = False


    class Sectors(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(DoomWad.Sectors, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.entries = []
            i = 0
            while not self._io.is_eof():
                _t_entries = DoomWad.Sector(self._io, self, self._root)
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
            super(DoomWad.Sectors, self)._write__seq(io)
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


    class Sidedef(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(DoomWad.Sidedef, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.offset_x = self._io.read_s2le()
            self.offset_y = self._io.read_s2le()
            self.upper_texture_name = (self._io.read_bytes(8)).decode(u"ASCII")
            self.lower_texture_name = (self._io.read_bytes(8)).decode(u"ASCII")
            self.normal_texture_name = (self._io.read_bytes(8)).decode(u"ASCII")
            self.sector_id = self._io.read_s2le()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(DoomWad.Sidedef, self)._write__seq(io)
            self._io.write_s2le(self.offset_x)
            self._io.write_s2le(self.offset_y)
            self._io.write_bytes((self.upper_texture_name).encode(u"ASCII"))
            self._io.write_bytes((self.lower_texture_name).encode(u"ASCII"))
            self._io.write_bytes((self.normal_texture_name).encode(u"ASCII"))
            self._io.write_s2le(self.sector_id)


        def _check(self):
            if len((self.upper_texture_name).encode(u"ASCII")) != 8:
                raise kaitaistruct.ConsistencyError(u"upper_texture_name", 8, len((self.upper_texture_name).encode(u"ASCII")))
            if len((self.lower_texture_name).encode(u"ASCII")) != 8:
                raise kaitaistruct.ConsistencyError(u"lower_texture_name", 8, len((self.lower_texture_name).encode(u"ASCII")))
            if len((self.normal_texture_name).encode(u"ASCII")) != 8:
                raise kaitaistruct.ConsistencyError(u"normal_texture_name", 8, len((self.normal_texture_name).encode(u"ASCII")))
            self._dirty = False


    class Sidedefs(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(DoomWad.Sidedefs, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.entries = []
            i = 0
            while not self._io.is_eof():
                _t_entries = DoomWad.Sidedef(self._io, self, self._root)
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
            super(DoomWad.Sidedefs, self)._write__seq(io)
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


    class Texture12(ReadWriteKaitaiStruct):
        """Used for TEXTURE1 and TEXTURE2 lumps, which designate how to
        combine wall patches to make wall textures. This essentially
        provides a very simple form of image compression, allowing
        certain elements ("patches") to be reused / recombined on
        different textures for more variety in the game.
        
        .. seealso::
           Source - https://doom.fandom.com/wiki/TEXTURE1_and_TEXTURE2
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(DoomWad.Texture12, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.num_textures = self._io.read_s4le()
            self.textures = []
            for i in range(self.num_textures):
                _t_textures = DoomWad.Texture12.TextureIndex(self._io, self, self._root)
                try:
                    _t_textures._read()
                finally:
                    self.textures.append(_t_textures)

            self._dirty = False


        def _fetch_instances(self):
            pass
            for i in range(len(self.textures)):
                pass
                self.textures[i]._fetch_instances()



        def _write__seq(self, io=None):
            super(DoomWad.Texture12, self)._write__seq(io)
            self._io.write_s4le(self.num_textures)
            for i in range(len(self.textures)):
                pass
                self.textures[i]._write__seq(self._io)



        def _check(self):
            if len(self.textures) != self.num_textures:
                raise kaitaistruct.ConsistencyError(u"textures", self.num_textures, len(self.textures))
            for i in range(len(self.textures)):
                pass
                if self.textures[i]._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"textures", self._root, self.textures[i]._root)
                if self.textures[i]._parent != self:
                    raise kaitaistruct.ConsistencyError(u"textures", self, self.textures[i]._parent)

            self._dirty = False

        class Patch(ReadWriteKaitaiStruct):
            def __init__(self, _io=None, _parent=None, _root=None):
                super(DoomWad.Texture12.Patch, self).__init__(_io)
                self._parent = _parent
                self._root = _root

            def _read(self):
                self.origin_x = self._io.read_s2le()
                self.origin_y = self._io.read_s2le()
                self.patch_id = self._io.read_u2le()
                self.step_dir = self._io.read_u2le()
                self.colormap = self._io.read_u2le()
                self._dirty = False


            def _fetch_instances(self):
                pass


            def _write__seq(self, io=None):
                super(DoomWad.Texture12.Patch, self)._write__seq(io)
                self._io.write_s2le(self.origin_x)
                self._io.write_s2le(self.origin_y)
                self._io.write_u2le(self.patch_id)
                self._io.write_u2le(self.step_dir)
                self._io.write_u2le(self.colormap)


            def _check(self):
                self._dirty = False


        class TextureBody(ReadWriteKaitaiStruct):
            def __init__(self, _io=None, _parent=None, _root=None):
                super(DoomWad.Texture12.TextureBody, self).__init__(_io)
                self._parent = _parent
                self._root = _root

            def _read(self):
                self.name = (KaitaiStream.bytes_strip_right(self._io.read_bytes(8), 0)).decode(u"ASCII")
                self.masked = self._io.read_u4le()
                self.width = self._io.read_u2le()
                self.height = self._io.read_u2le()
                self.column_directory = self._io.read_u4le()
                self.num_patches = self._io.read_u2le()
                self.patches = []
                for i in range(self.num_patches):
                    _t_patches = DoomWad.Texture12.Patch(self._io, self, self._root)
                    try:
                        _t_patches._read()
                    finally:
                        self.patches.append(_t_patches)

                self._dirty = False


            def _fetch_instances(self):
                pass
                for i in range(len(self.patches)):
                    pass
                    self.patches[i]._fetch_instances()



            def _write__seq(self, io=None):
                super(DoomWad.Texture12.TextureBody, self)._write__seq(io)
                self._io.write_bytes_limit((self.name).encode(u"ASCII"), 8, 0, 0)
                self._io.write_u4le(self.masked)
                self._io.write_u2le(self.width)
                self._io.write_u2le(self.height)
                self._io.write_u4le(self.column_directory)
                self._io.write_u2le(self.num_patches)
                for i in range(len(self.patches)):
                    pass
                    self.patches[i]._write__seq(self._io)



            def _check(self):
                if len((self.name).encode(u"ASCII")) > 8:
                    raise kaitaistruct.ConsistencyError(u"name", 8, len((self.name).encode(u"ASCII")))
                if  ((len((self.name).encode(u"ASCII")) != 0) and (KaitaiStream.byte_array_index((self.name).encode(u"ASCII"), -1) == 0)) :
                    raise kaitaistruct.ConsistencyError(u"name", 0, KaitaiStream.byte_array_index((self.name).encode(u"ASCII"), -1))
                if len(self.patches) != self.num_patches:
                    raise kaitaistruct.ConsistencyError(u"patches", self.num_patches, len(self.patches))
                for i in range(len(self.patches)):
                    pass
                    if self.patches[i]._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"patches", self._root, self.patches[i]._root)
                    if self.patches[i]._parent != self:
                        raise kaitaistruct.ConsistencyError(u"patches", self, self.patches[i]._parent)

                self._dirty = False


        class TextureIndex(ReadWriteKaitaiStruct):
            def __init__(self, _io=None, _parent=None, _root=None):
                super(DoomWad.Texture12.TextureIndex, self).__init__(_io)
                self._parent = _parent
                self._root = _root
                self._should_write_body = False
                self.body__enabled = True

            def _read(self):
                self.offset = self._io.read_s4le()
                self._dirty = False


            def _fetch_instances(self):
                pass
                _ = self.body
                if hasattr(self, '_m_body'):
                    pass
                    self._m_body._fetch_instances()



            def _write__seq(self, io=None):
                super(DoomWad.Texture12.TextureIndex, self)._write__seq(io)
                self._should_write_body = self.body__enabled
                self._io.write_s4le(self.offset)


            def _check(self):
                if self.body__enabled:
                    pass
                    if self._m_body._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"body", self._root, self._m_body._root)
                    if self._m_body._parent != self:
                        raise kaitaistruct.ConsistencyError(u"body", self, self._m_body._parent)

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
                self._io.seek(self.offset)
                self._m_body = DoomWad.Texture12.TextureBody(self._io, self, self._root)
                self._m_body._read()
                self._io.seek(_pos)
                return getattr(self, '_m_body', None)

            @body.setter
            def body(self, v):
                self._dirty = True
                self._m_body = v

            def _write_body(self):
                self._should_write_body = False
                _pos = self._io.pos()
                self._io.seek(self.offset)
                self._m_body._write__seq(self._io)
                self._io.seek(_pos)



    class Thing(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(DoomWad.Thing, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.x = self._io.read_s2le()
            self.y = self._io.read_s2le()
            self.angle = self._io.read_u2le()
            self.type = self._io.read_u2le()
            self.flags = self._io.read_u2le()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(DoomWad.Thing, self)._write__seq(io)
            self._io.write_s2le(self.x)
            self._io.write_s2le(self.y)
            self._io.write_u2le(self.angle)
            self._io.write_u2le(self.type)
            self._io.write_u2le(self.flags)


        def _check(self):
            self._dirty = False


    class Things(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(DoomWad.Things, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.entries = []
            i = 0
            while not self._io.is_eof():
                _t_entries = DoomWad.Thing(self._io, self, self._root)
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
            super(DoomWad.Things, self)._write__seq(io)
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


    class Vertex(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(DoomWad.Vertex, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.x = self._io.read_s2le()
            self.y = self._io.read_s2le()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(DoomWad.Vertex, self)._write__seq(io)
            self._io.write_s2le(self.x)
            self._io.write_s2le(self.y)


        def _check(self):
            self._dirty = False


    class Vertexes(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(DoomWad.Vertexes, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.entries = []
            i = 0
            while not self._io.is_eof():
                _t_entries = DoomWad.Vertex(self._io, self, self._root)
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
            super(DoomWad.Vertexes, self)._write__seq(io)
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


    @property
    def index(self):
        if self._should_write_index:
            self._write_index()
        if hasattr(self, '_m_index'):
            return self._m_index

        if not self.index__enabled:
            return None

        _pos = self._io.pos()
        self._io.seek(self.index_offset)
        self._m_index = []
        for i in range(self.num_index_entries):
            _t__m_index = DoomWad.IndexEntry(self._io, self, self._root)
            try:
                _t__m_index._read()
            finally:
                self._m_index.append(_t__m_index)

        self._io.seek(_pos)
        return getattr(self, '_m_index', None)

    @index.setter
    def index(self, v):
        self._dirty = True
        self._m_index = v

    def _write_index(self):
        self._should_write_index = False
        _pos = self._io.pos()
        self._io.seek(self.index_offset)
        for i in range(len(self._m_index)):
            pass
            self._m_index[i]._write__seq(self._io)

        self._io.seek(_pos)


