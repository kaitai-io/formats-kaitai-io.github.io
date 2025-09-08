# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import ReadWriteKaitaiStruct, KaitaiStream, BytesIO
from enum import IntEnum


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class Ttf(ReadWriteKaitaiStruct):
    """A TrueType font file contains data, in table format, that comprises
    an outline font.
    
    .. seealso::
       Source - https://web.archive.org/web/20160410081432/https://www.microsoft.com/typography/tt/ttf_spec/ttch02.doc
    """
    def __init__(self, _io=None, _parent=None, _root=None):
        super(Ttf, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self

    def _read(self):
        self.offset_table = Ttf.OffsetTable(self._io, self, self._root)
        self.offset_table._read()
        self.directory_table = []
        for i in range(self.offset_table.num_tables):
            _t_directory_table = Ttf.DirTableEntry(self._io, self, self._root)
            try:
                _t_directory_table._read()
            finally:
                self.directory_table.append(_t_directory_table)

        self._dirty = False


    def _fetch_instances(self):
        pass
        self.offset_table._fetch_instances()
        for i in range(len(self.directory_table)):
            pass
            self.directory_table[i]._fetch_instances()



    def _write__seq(self, io=None):
        super(Ttf, self)._write__seq(io)
        self.offset_table._write__seq(self._io)
        for i in range(len(self.directory_table)):
            pass
            self.directory_table[i]._write__seq(self._io)



    def _check(self):
        if self.offset_table._root != self._root:
            raise kaitaistruct.ConsistencyError(u"offset_table", self._root, self.offset_table._root)
        if self.offset_table._parent != self:
            raise kaitaistruct.ConsistencyError(u"offset_table", self, self.offset_table._parent)
        if len(self.directory_table) != self.offset_table.num_tables:
            raise kaitaistruct.ConsistencyError(u"directory_table", self.offset_table.num_tables, len(self.directory_table))
        for i in range(len(self.directory_table)):
            pass
            if self.directory_table[i]._root != self._root:
                raise kaitaistruct.ConsistencyError(u"directory_table", self._root, self.directory_table[i]._root)
            if self.directory_table[i]._parent != self:
                raise kaitaistruct.ConsistencyError(u"directory_table", self, self.directory_table[i]._parent)

        self._dirty = False

    class Cmap(ReadWriteKaitaiStruct):
        """cmap - Character To Glyph Index Mapping Table This table defines the mapping of character codes to the glyph index values used in the font.
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Ttf.Cmap, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.version_number = self._io.read_u2be()
            self.number_of_encoding_tables = self._io.read_u2be()
            self.tables = []
            for i in range(self.number_of_encoding_tables):
                _t_tables = Ttf.Cmap.SubtableHeader(self._io, self, self._root)
                try:
                    _t_tables._read()
                finally:
                    self.tables.append(_t_tables)

            self._dirty = False


        def _fetch_instances(self):
            pass
            for i in range(len(self.tables)):
                pass
                self.tables[i]._fetch_instances()



        def _write__seq(self, io=None):
            super(Ttf.Cmap, self)._write__seq(io)
            self._io.write_u2be(self.version_number)
            self._io.write_u2be(self.number_of_encoding_tables)
            for i in range(len(self.tables)):
                pass
                self.tables[i]._write__seq(self._io)



        def _check(self):
            if len(self.tables) != self.number_of_encoding_tables:
                raise kaitaistruct.ConsistencyError(u"tables", self.number_of_encoding_tables, len(self.tables))
            for i in range(len(self.tables)):
                pass
                if self.tables[i]._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"tables", self._root, self.tables[i]._root)
                if self.tables[i]._parent != self:
                    raise kaitaistruct.ConsistencyError(u"tables", self, self.tables[i]._parent)

            self._dirty = False

        class Subtable(ReadWriteKaitaiStruct):

            class SubtableFormat(IntEnum):
                byte_encoding_table = 0
                high_byte_mapping_through_table = 2
                segment_mapping_to_delta_values = 4
                trimmed_table_mapping = 6
            def __init__(self, _io=None, _parent=None, _root=None):
                super(Ttf.Cmap.Subtable, self).__init__(_io)
                self._parent = _parent
                self._root = _root

            def _read(self):
                self.format = KaitaiStream.resolve_enum(Ttf.Cmap.Subtable.SubtableFormat, self._io.read_u2be())
                self.length = self._io.read_u2be()
                self.version = self._io.read_u2be()
                _on = self.format
                if _on == Ttf.Cmap.Subtable.SubtableFormat.byte_encoding_table:
                    pass
                    self._raw_value = self._io.read_bytes(self.length - 6)
                    _io__raw_value = KaitaiStream(BytesIO(self._raw_value))
                    self.value = Ttf.Cmap.Subtable.ByteEncodingTable(_io__raw_value, self, self._root)
                    self.value._read()
                elif _on == Ttf.Cmap.Subtable.SubtableFormat.high_byte_mapping_through_table:
                    pass
                    self._raw_value = self._io.read_bytes(self.length - 6)
                    _io__raw_value = KaitaiStream(BytesIO(self._raw_value))
                    self.value = Ttf.Cmap.Subtable.HighByteMappingThroughTable(_io__raw_value, self, self._root)
                    self.value._read()
                elif _on == Ttf.Cmap.Subtable.SubtableFormat.segment_mapping_to_delta_values:
                    pass
                    self._raw_value = self._io.read_bytes(self.length - 6)
                    _io__raw_value = KaitaiStream(BytesIO(self._raw_value))
                    self.value = Ttf.Cmap.Subtable.SegmentMappingToDeltaValues(_io__raw_value, self, self._root)
                    self.value._read()
                elif _on == Ttf.Cmap.Subtable.SubtableFormat.trimmed_table_mapping:
                    pass
                    self._raw_value = self._io.read_bytes(self.length - 6)
                    _io__raw_value = KaitaiStream(BytesIO(self._raw_value))
                    self.value = Ttf.Cmap.Subtable.TrimmedTableMapping(_io__raw_value, self, self._root)
                    self.value._read()
                else:
                    pass
                    self.value = self._io.read_bytes(self.length - 6)
                self._dirty = False


            def _fetch_instances(self):
                pass
                _on = self.format
                if _on == Ttf.Cmap.Subtable.SubtableFormat.byte_encoding_table:
                    pass
                    self.value._fetch_instances()
                elif _on == Ttf.Cmap.Subtable.SubtableFormat.high_byte_mapping_through_table:
                    pass
                    self.value._fetch_instances()
                elif _on == Ttf.Cmap.Subtable.SubtableFormat.segment_mapping_to_delta_values:
                    pass
                    self.value._fetch_instances()
                elif _on == Ttf.Cmap.Subtable.SubtableFormat.trimmed_table_mapping:
                    pass
                    self.value._fetch_instances()
                else:
                    pass


            def _write__seq(self, io=None):
                super(Ttf.Cmap.Subtable, self)._write__seq(io)
                self._io.write_u2be(int(self.format))
                self._io.write_u2be(self.length)
                self._io.write_u2be(self.version)
                _on = self.format
                if _on == Ttf.Cmap.Subtable.SubtableFormat.byte_encoding_table:
                    pass
                    _io__raw_value = KaitaiStream(BytesIO(bytearray(self.length - 6)))
                    self._io.add_child_stream(_io__raw_value)
                    _pos2 = self._io.pos()
                    self._io.seek(self._io.pos() + (self.length - 6))
                    def handler(parent, _io__raw_value=_io__raw_value):
                        self._raw_value = _io__raw_value.to_byte_array()
                        if len(self._raw_value) != self.length - 6:
                            raise kaitaistruct.ConsistencyError(u"raw(value)", self.length - 6, len(self._raw_value))
                        parent.write_bytes(self._raw_value)
                    _io__raw_value.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                    self.value._write__seq(_io__raw_value)
                elif _on == Ttf.Cmap.Subtable.SubtableFormat.high_byte_mapping_through_table:
                    pass
                    _io__raw_value = KaitaiStream(BytesIO(bytearray(self.length - 6)))
                    self._io.add_child_stream(_io__raw_value)
                    _pos2 = self._io.pos()
                    self._io.seek(self._io.pos() + (self.length - 6))
                    def handler(parent, _io__raw_value=_io__raw_value):
                        self._raw_value = _io__raw_value.to_byte_array()
                        if len(self._raw_value) != self.length - 6:
                            raise kaitaistruct.ConsistencyError(u"raw(value)", self.length - 6, len(self._raw_value))
                        parent.write_bytes(self._raw_value)
                    _io__raw_value.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                    self.value._write__seq(_io__raw_value)
                elif _on == Ttf.Cmap.Subtable.SubtableFormat.segment_mapping_to_delta_values:
                    pass
                    _io__raw_value = KaitaiStream(BytesIO(bytearray(self.length - 6)))
                    self._io.add_child_stream(_io__raw_value)
                    _pos2 = self._io.pos()
                    self._io.seek(self._io.pos() + (self.length - 6))
                    def handler(parent, _io__raw_value=_io__raw_value):
                        self._raw_value = _io__raw_value.to_byte_array()
                        if len(self._raw_value) != self.length - 6:
                            raise kaitaistruct.ConsistencyError(u"raw(value)", self.length - 6, len(self._raw_value))
                        parent.write_bytes(self._raw_value)
                    _io__raw_value.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                    self.value._write__seq(_io__raw_value)
                elif _on == Ttf.Cmap.Subtable.SubtableFormat.trimmed_table_mapping:
                    pass
                    _io__raw_value = KaitaiStream(BytesIO(bytearray(self.length - 6)))
                    self._io.add_child_stream(_io__raw_value)
                    _pos2 = self._io.pos()
                    self._io.seek(self._io.pos() + (self.length - 6))
                    def handler(parent, _io__raw_value=_io__raw_value):
                        self._raw_value = _io__raw_value.to_byte_array()
                        if len(self._raw_value) != self.length - 6:
                            raise kaitaistruct.ConsistencyError(u"raw(value)", self.length - 6, len(self._raw_value))
                        parent.write_bytes(self._raw_value)
                    _io__raw_value.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                    self.value._write__seq(_io__raw_value)
                else:
                    pass
                    self._io.write_bytes(self.value)


            def _check(self):
                _on = self.format
                if _on == Ttf.Cmap.Subtable.SubtableFormat.byte_encoding_table:
                    pass
                    if self.value._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"value", self._root, self.value._root)
                    if self.value._parent != self:
                        raise kaitaistruct.ConsistencyError(u"value", self, self.value._parent)
                elif _on == Ttf.Cmap.Subtable.SubtableFormat.high_byte_mapping_through_table:
                    pass
                    if self.value._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"value", self._root, self.value._root)
                    if self.value._parent != self:
                        raise kaitaistruct.ConsistencyError(u"value", self, self.value._parent)
                elif _on == Ttf.Cmap.Subtable.SubtableFormat.segment_mapping_to_delta_values:
                    pass
                    if self.value._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"value", self._root, self.value._root)
                    if self.value._parent != self:
                        raise kaitaistruct.ConsistencyError(u"value", self, self.value._parent)
                elif _on == Ttf.Cmap.Subtable.SubtableFormat.trimmed_table_mapping:
                    pass
                    if self.value._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"value", self._root, self.value._root)
                    if self.value._parent != self:
                        raise kaitaistruct.ConsistencyError(u"value", self, self.value._parent)
                else:
                    pass
                    if len(self.value) != self.length - 6:
                        raise kaitaistruct.ConsistencyError(u"value", self.length - 6, len(self.value))
                self._dirty = False

            class ByteEncodingTable(ReadWriteKaitaiStruct):
                def __init__(self, _io=None, _parent=None, _root=None):
                    super(Ttf.Cmap.Subtable.ByteEncodingTable, self).__init__(_io)
                    self._parent = _parent
                    self._root = _root

                def _read(self):
                    self.glyph_id_array = self._io.read_bytes(256)
                    self._dirty = False


                def _fetch_instances(self):
                    pass


                def _write__seq(self, io=None):
                    super(Ttf.Cmap.Subtable.ByteEncodingTable, self)._write__seq(io)
                    self._io.write_bytes(self.glyph_id_array)


                def _check(self):
                    if len(self.glyph_id_array) != 256:
                        raise kaitaistruct.ConsistencyError(u"glyph_id_array", 256, len(self.glyph_id_array))
                    self._dirty = False


            class HighByteMappingThroughTable(ReadWriteKaitaiStruct):
                def __init__(self, _io=None, _parent=None, _root=None):
                    super(Ttf.Cmap.Subtable.HighByteMappingThroughTable, self).__init__(_io)
                    self._parent = _parent
                    self._root = _root

                def _read(self):
                    self.sub_header_keys = []
                    for i in range(256):
                        self.sub_header_keys.append(self._io.read_u2be())

                    self._dirty = False


                def _fetch_instances(self):
                    pass
                    for i in range(len(self.sub_header_keys)):
                        pass



                def _write__seq(self, io=None):
                    super(Ttf.Cmap.Subtable.HighByteMappingThroughTable, self)._write__seq(io)
                    for i in range(len(self.sub_header_keys)):
                        pass
                        self._io.write_u2be(self.sub_header_keys[i])



                def _check(self):
                    if len(self.sub_header_keys) != 256:
                        raise kaitaistruct.ConsistencyError(u"sub_header_keys", 256, len(self.sub_header_keys))
                    for i in range(len(self.sub_header_keys)):
                        pass

                    self._dirty = False


            class SegmentMappingToDeltaValues(ReadWriteKaitaiStruct):
                def __init__(self, _io=None, _parent=None, _root=None):
                    super(Ttf.Cmap.Subtable.SegmentMappingToDeltaValues, self).__init__(_io)
                    self._parent = _parent
                    self._root = _root

                def _read(self):
                    self.seg_count_x2 = self._io.read_u2be()
                    self.search_range = self._io.read_u2be()
                    self.entry_selector = self._io.read_u2be()
                    self.range_shift = self._io.read_u2be()
                    self.end_count = []
                    for i in range(self.seg_count):
                        self.end_count.append(self._io.read_u2be())

                    self.reserved_pad = self._io.read_u2be()
                    self.start_count = []
                    for i in range(self.seg_count):
                        self.start_count.append(self._io.read_u2be())

                    self.id_delta = []
                    for i in range(self.seg_count):
                        self.id_delta.append(self._io.read_u2be())

                    self.id_range_offset = []
                    for i in range(self.seg_count):
                        self.id_range_offset.append(self._io.read_u2be())

                    self.glyph_id_array = []
                    i = 0
                    while not self._io.is_eof():
                        self.glyph_id_array.append(self._io.read_u2be())
                        i += 1

                    self._dirty = False


                def _fetch_instances(self):
                    pass
                    for i in range(len(self.end_count)):
                        pass

                    for i in range(len(self.start_count)):
                        pass

                    for i in range(len(self.id_delta)):
                        pass

                    for i in range(len(self.id_range_offset)):
                        pass

                    for i in range(len(self.glyph_id_array)):
                        pass



                def _write__seq(self, io=None):
                    super(Ttf.Cmap.Subtable.SegmentMappingToDeltaValues, self)._write__seq(io)
                    self._io.write_u2be(self.seg_count_x2)
                    self._io.write_u2be(self.search_range)
                    self._io.write_u2be(self.entry_selector)
                    self._io.write_u2be(self.range_shift)
                    for i in range(len(self.end_count)):
                        pass
                        self._io.write_u2be(self.end_count[i])

                    self._io.write_u2be(self.reserved_pad)
                    for i in range(len(self.start_count)):
                        pass
                        self._io.write_u2be(self.start_count[i])

                    for i in range(len(self.id_delta)):
                        pass
                        self._io.write_u2be(self.id_delta[i])

                    for i in range(len(self.id_range_offset)):
                        pass
                        self._io.write_u2be(self.id_range_offset[i])

                    for i in range(len(self.glyph_id_array)):
                        pass
                        if self._io.is_eof():
                            raise kaitaistruct.ConsistencyError(u"glyph_id_array", 0, self._io.size() - self._io.pos())
                        self._io.write_u2be(self.glyph_id_array[i])

                    if not self._io.is_eof():
                        raise kaitaistruct.ConsistencyError(u"glyph_id_array", 0, self._io.size() - self._io.pos())


                def _check(self):
                    if len(self.end_count) != self.seg_count:
                        raise kaitaistruct.ConsistencyError(u"end_count", self.seg_count, len(self.end_count))
                    for i in range(len(self.end_count)):
                        pass

                    if len(self.start_count) != self.seg_count:
                        raise kaitaistruct.ConsistencyError(u"start_count", self.seg_count, len(self.start_count))
                    for i in range(len(self.start_count)):
                        pass

                    if len(self.id_delta) != self.seg_count:
                        raise kaitaistruct.ConsistencyError(u"id_delta", self.seg_count, len(self.id_delta))
                    for i in range(len(self.id_delta)):
                        pass

                    if len(self.id_range_offset) != self.seg_count:
                        raise kaitaistruct.ConsistencyError(u"id_range_offset", self.seg_count, len(self.id_range_offset))
                    for i in range(len(self.id_range_offset)):
                        pass

                    for i in range(len(self.glyph_id_array)):
                        pass

                    self._dirty = False

                @property
                def seg_count(self):
                    if hasattr(self, '_m_seg_count'):
                        return self._m_seg_count

                    self._m_seg_count = self.seg_count_x2 // 2
                    return getattr(self, '_m_seg_count', None)

                def _invalidate_seg_count(self):
                    del self._m_seg_count

            class TrimmedTableMapping(ReadWriteKaitaiStruct):
                def __init__(self, _io=None, _parent=None, _root=None):
                    super(Ttf.Cmap.Subtable.TrimmedTableMapping, self).__init__(_io)
                    self._parent = _parent
                    self._root = _root

                def _read(self):
                    self.first_code = self._io.read_u2be()
                    self.entry_count = self._io.read_u2be()
                    self.glyph_id_array = []
                    for i in range(self.entry_count):
                        self.glyph_id_array.append(self._io.read_u2be())

                    self._dirty = False


                def _fetch_instances(self):
                    pass
                    for i in range(len(self.glyph_id_array)):
                        pass



                def _write__seq(self, io=None):
                    super(Ttf.Cmap.Subtable.TrimmedTableMapping, self)._write__seq(io)
                    self._io.write_u2be(self.first_code)
                    self._io.write_u2be(self.entry_count)
                    for i in range(len(self.glyph_id_array)):
                        pass
                        self._io.write_u2be(self.glyph_id_array[i])



                def _check(self):
                    if len(self.glyph_id_array) != self.entry_count:
                        raise kaitaistruct.ConsistencyError(u"glyph_id_array", self.entry_count, len(self.glyph_id_array))
                    for i in range(len(self.glyph_id_array)):
                        pass

                    self._dirty = False



        class SubtableHeader(ReadWriteKaitaiStruct):
            def __init__(self, _io=None, _parent=None, _root=None):
                super(Ttf.Cmap.SubtableHeader, self).__init__(_io)
                self._parent = _parent
                self._root = _root
                self._should_write_table = False
                self.table__enabled = True

            def _read(self):
                self.platform_id = self._io.read_u2be()
                self.encoding_id = self._io.read_u2be()
                self.subtable_offset = self._io.read_u4be()
                self._dirty = False


            def _fetch_instances(self):
                pass
                _ = self.table
                if hasattr(self, '_m_table'):
                    pass
                    self._m_table._fetch_instances()



            def _write__seq(self, io=None):
                super(Ttf.Cmap.SubtableHeader, self)._write__seq(io)
                self._should_write_table = self.table__enabled
                self._io.write_u2be(self.platform_id)
                self._io.write_u2be(self.encoding_id)
                self._io.write_u4be(self.subtable_offset)


            def _check(self):
                if self.table__enabled:
                    pass
                    if self._m_table._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"table", self._root, self._m_table._root)
                    if self._m_table._parent != self:
                        raise kaitaistruct.ConsistencyError(u"table", self, self._m_table._parent)

                self._dirty = False

            @property
            def table(self):
                if self._should_write_table:
                    self._write_table()
                if hasattr(self, '_m_table'):
                    return self._m_table

                if not self.table__enabled:
                    return None

                io = self._parent._io
                _pos = io.pos()
                io.seek(self.subtable_offset)
                self._m_table = Ttf.Cmap.Subtable(io, self, self._root)
                self._m_table._read()
                io.seek(_pos)
                return getattr(self, '_m_table', None)

            @table.setter
            def table(self, v):
                self._dirty = True
                self._m_table = v

            def _write_table(self):
                self._should_write_table = False
                io = self._parent._io
                _pos = io.pos()
                io.seek(self.subtable_offset)
                self._m_table._write__seq(io)
                io.seek(_pos)



    class Cvt(ReadWriteKaitaiStruct):
        """cvt  - Control Value Table This table contains a list of values that can be referenced by instructions. They can be used, among other things, to control characteristics for different glyphs.
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Ttf.Cvt, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.fwords = []
            i = 0
            while not self._io.is_eof():
                self.fwords.append(self._io.read_s2be())
                i += 1

            self._dirty = False


        def _fetch_instances(self):
            pass
            for i in range(len(self.fwords)):
                pass



        def _write__seq(self, io=None):
            super(Ttf.Cvt, self)._write__seq(io)
            for i in range(len(self.fwords)):
                pass
                if self._io.is_eof():
                    raise kaitaistruct.ConsistencyError(u"fwords", 0, self._io.size() - self._io.pos())
                self._io.write_s2be(self.fwords[i])

            if not self._io.is_eof():
                raise kaitaistruct.ConsistencyError(u"fwords", 0, self._io.size() - self._io.pos())


        def _check(self):
            for i in range(len(self.fwords)):
                pass

            self._dirty = False


    class DirTableEntry(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Ttf.DirTableEntry, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._should_write_value = False
            self.value__enabled = True

        def _read(self):
            self.tag = (self._io.read_bytes(4)).decode(u"ASCII")
            self.checksum = self._io.read_u4be()
            self.offset = self._io.read_u4be()
            self.length = self._io.read_u4be()
            self._dirty = False


        def _fetch_instances(self):
            pass
            _ = self.value
            if hasattr(self, '_m_value'):
                pass
                _on = self.tag
                if _on == u"OS/2":
                    pass
                    self._m_value._fetch_instances()
                elif _on == u"cmap":
                    pass
                    self._m_value._fetch_instances()
                elif _on == u"cvt ":
                    pass
                    self._m_value._fetch_instances()
                elif _on == u"fpgm":
                    pass
                    self._m_value._fetch_instances()
                elif _on == u"glyf":
                    pass
                    self._m_value._fetch_instances()
                elif _on == u"head":
                    pass
                    self._m_value._fetch_instances()
                elif _on == u"hhea":
                    pass
                    self._m_value._fetch_instances()
                elif _on == u"kern":
                    pass
                    self._m_value._fetch_instances()
                elif _on == u"maxp":
                    pass
                    self._m_value._fetch_instances()
                elif _on == u"name":
                    pass
                    self._m_value._fetch_instances()
                elif _on == u"post":
                    pass
                    self._m_value._fetch_instances()
                elif _on == u"prep":
                    pass
                    self._m_value._fetch_instances()
                else:
                    pass



        def _write__seq(self, io=None):
            super(Ttf.DirTableEntry, self)._write__seq(io)
            self._should_write_value = self.value__enabled
            self._io.write_bytes((self.tag).encode(u"ASCII"))
            self._io.write_u4be(self.checksum)
            self._io.write_u4be(self.offset)
            self._io.write_u4be(self.length)


        def _check(self):
            if len((self.tag).encode(u"ASCII")) != 4:
                raise kaitaistruct.ConsistencyError(u"tag", 4, len((self.tag).encode(u"ASCII")))
            if self.value__enabled:
                pass
                _on = self.tag
                if _on == u"OS/2":
                    pass
                    if self._m_value._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"value", self._root, self._m_value._root)
                    if self._m_value._parent != self:
                        raise kaitaistruct.ConsistencyError(u"value", self, self._m_value._parent)
                elif _on == u"cmap":
                    pass
                    if self._m_value._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"value", self._root, self._m_value._root)
                    if self._m_value._parent != self:
                        raise kaitaistruct.ConsistencyError(u"value", self, self._m_value._parent)
                elif _on == u"cvt ":
                    pass
                    if self._m_value._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"value", self._root, self._m_value._root)
                    if self._m_value._parent != self:
                        raise kaitaistruct.ConsistencyError(u"value", self, self._m_value._parent)
                elif _on == u"fpgm":
                    pass
                    if self._m_value._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"value", self._root, self._m_value._root)
                    if self._m_value._parent != self:
                        raise kaitaistruct.ConsistencyError(u"value", self, self._m_value._parent)
                elif _on == u"glyf":
                    pass
                    if self._m_value._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"value", self._root, self._m_value._root)
                    if self._m_value._parent != self:
                        raise kaitaistruct.ConsistencyError(u"value", self, self._m_value._parent)
                elif _on == u"head":
                    pass
                    if self._m_value._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"value", self._root, self._m_value._root)
                    if self._m_value._parent != self:
                        raise kaitaistruct.ConsistencyError(u"value", self, self._m_value._parent)
                elif _on == u"hhea":
                    pass
                    if self._m_value._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"value", self._root, self._m_value._root)
                    if self._m_value._parent != self:
                        raise kaitaistruct.ConsistencyError(u"value", self, self._m_value._parent)
                elif _on == u"kern":
                    pass
                    if self._m_value._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"value", self._root, self._m_value._root)
                    if self._m_value._parent != self:
                        raise kaitaistruct.ConsistencyError(u"value", self, self._m_value._parent)
                elif _on == u"maxp":
                    pass
                    if self._m_value._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"value", self._root, self._m_value._root)
                    if self._m_value._parent != self:
                        raise kaitaistruct.ConsistencyError(u"value", self, self._m_value._parent)
                elif _on == u"name":
                    pass
                    if self._m_value._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"value", self._root, self._m_value._root)
                    if self._m_value._parent != self:
                        raise kaitaistruct.ConsistencyError(u"value", self, self._m_value._parent)
                elif _on == u"post":
                    pass
                    if self._m_value._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"value", self._root, self._m_value._root)
                    if self._m_value._parent != self:
                        raise kaitaistruct.ConsistencyError(u"value", self, self._m_value._parent)
                elif _on == u"prep":
                    pass
                    if self._m_value._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"value", self._root, self._m_value._root)
                    if self._m_value._parent != self:
                        raise kaitaistruct.ConsistencyError(u"value", self, self._m_value._parent)
                else:
                    pass
                    if len(self._m_value) != self.length:
                        raise kaitaistruct.ConsistencyError(u"value", self.length, len(self._m_value))

            self._dirty = False

        @property
        def value(self):
            if self._should_write_value:
                self._write_value()
            if hasattr(self, '_m_value'):
                return self._m_value

            if not self.value__enabled:
                return None

            io = self._root._io
            _pos = io.pos()
            io.seek(self.offset)
            _on = self.tag
            if _on == u"OS/2":
                pass
                self._raw__m_value = io.read_bytes(self.length)
                _io__raw__m_value = KaitaiStream(BytesIO(self._raw__m_value))
                self._m_value = Ttf.Os2(_io__raw__m_value, self, self._root)
                self._m_value._read()
            elif _on == u"cmap":
                pass
                self._raw__m_value = io.read_bytes(self.length)
                _io__raw__m_value = KaitaiStream(BytesIO(self._raw__m_value))
                self._m_value = Ttf.Cmap(_io__raw__m_value, self, self._root)
                self._m_value._read()
            elif _on == u"cvt ":
                pass
                self._raw__m_value = io.read_bytes(self.length)
                _io__raw__m_value = KaitaiStream(BytesIO(self._raw__m_value))
                self._m_value = Ttf.Cvt(_io__raw__m_value, self, self._root)
                self._m_value._read()
            elif _on == u"fpgm":
                pass
                self._raw__m_value = io.read_bytes(self.length)
                _io__raw__m_value = KaitaiStream(BytesIO(self._raw__m_value))
                self._m_value = Ttf.Fpgm(_io__raw__m_value, self, self._root)
                self._m_value._read()
            elif _on == u"glyf":
                pass
                self._raw__m_value = io.read_bytes(self.length)
                _io__raw__m_value = KaitaiStream(BytesIO(self._raw__m_value))
                self._m_value = Ttf.Glyf(_io__raw__m_value, self, self._root)
                self._m_value._read()
            elif _on == u"head":
                pass
                self._raw__m_value = io.read_bytes(self.length)
                _io__raw__m_value = KaitaiStream(BytesIO(self._raw__m_value))
                self._m_value = Ttf.Head(_io__raw__m_value, self, self._root)
                self._m_value._read()
            elif _on == u"hhea":
                pass
                self._raw__m_value = io.read_bytes(self.length)
                _io__raw__m_value = KaitaiStream(BytesIO(self._raw__m_value))
                self._m_value = Ttf.Hhea(_io__raw__m_value, self, self._root)
                self._m_value._read()
            elif _on == u"kern":
                pass
                self._raw__m_value = io.read_bytes(self.length)
                _io__raw__m_value = KaitaiStream(BytesIO(self._raw__m_value))
                self._m_value = Ttf.Kern(_io__raw__m_value, self, self._root)
                self._m_value._read()
            elif _on == u"maxp":
                pass
                self._raw__m_value = io.read_bytes(self.length)
                _io__raw__m_value = KaitaiStream(BytesIO(self._raw__m_value))
                self._m_value = Ttf.Maxp(_io__raw__m_value, self, self._root)
                self._m_value._read()
            elif _on == u"name":
                pass
                self._raw__m_value = io.read_bytes(self.length)
                _io__raw__m_value = KaitaiStream(BytesIO(self._raw__m_value))
                self._m_value = Ttf.Name(_io__raw__m_value, self, self._root)
                self._m_value._read()
            elif _on == u"post":
                pass
                self._raw__m_value = io.read_bytes(self.length)
                _io__raw__m_value = KaitaiStream(BytesIO(self._raw__m_value))
                self._m_value = Ttf.Post(_io__raw__m_value, self, self._root)
                self._m_value._read()
            elif _on == u"prep":
                pass
                self._raw__m_value = io.read_bytes(self.length)
                _io__raw__m_value = KaitaiStream(BytesIO(self._raw__m_value))
                self._m_value = Ttf.Prep(_io__raw__m_value, self, self._root)
                self._m_value._read()
            else:
                pass
                self._m_value = io.read_bytes(self.length)
            io.seek(_pos)
            return getattr(self, '_m_value', None)

        @value.setter
        def value(self, v):
            self._dirty = True
            self._m_value = v

        def _write_value(self):
            self._should_write_value = False
            io = self._root._io
            _pos = io.pos()
            io.seek(self.offset)
            _on = self.tag
            if _on == u"OS/2":
                pass
                _io__raw__m_value = KaitaiStream(BytesIO(bytearray(self.length)))
                io.add_child_stream(_io__raw__m_value)
                _pos2 = io.pos()
                io.seek(io.pos() + (self.length))
                def handler(parent, _io__raw__m_value=_io__raw__m_value):
                    self._raw__m_value = _io__raw__m_value.to_byte_array()
                    if len(self._raw__m_value) != self.length:
                        raise kaitaistruct.ConsistencyError(u"raw(value)", self.length, len(self._raw__m_value))
                    parent.write_bytes(self._raw__m_value)
                _io__raw__m_value.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self._m_value._write__seq(_io__raw__m_value)
            elif _on == u"cmap":
                pass
                _io__raw__m_value = KaitaiStream(BytesIO(bytearray(self.length)))
                io.add_child_stream(_io__raw__m_value)
                _pos2 = io.pos()
                io.seek(io.pos() + (self.length))
                def handler(parent, _io__raw__m_value=_io__raw__m_value):
                    self._raw__m_value = _io__raw__m_value.to_byte_array()
                    if len(self._raw__m_value) != self.length:
                        raise kaitaistruct.ConsistencyError(u"raw(value)", self.length, len(self._raw__m_value))
                    parent.write_bytes(self._raw__m_value)
                _io__raw__m_value.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self._m_value._write__seq(_io__raw__m_value)
            elif _on == u"cvt ":
                pass
                _io__raw__m_value = KaitaiStream(BytesIO(bytearray(self.length)))
                io.add_child_stream(_io__raw__m_value)
                _pos2 = io.pos()
                io.seek(io.pos() + (self.length))
                def handler(parent, _io__raw__m_value=_io__raw__m_value):
                    self._raw__m_value = _io__raw__m_value.to_byte_array()
                    if len(self._raw__m_value) != self.length:
                        raise kaitaistruct.ConsistencyError(u"raw(value)", self.length, len(self._raw__m_value))
                    parent.write_bytes(self._raw__m_value)
                _io__raw__m_value.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self._m_value._write__seq(_io__raw__m_value)
            elif _on == u"fpgm":
                pass
                _io__raw__m_value = KaitaiStream(BytesIO(bytearray(self.length)))
                io.add_child_stream(_io__raw__m_value)
                _pos2 = io.pos()
                io.seek(io.pos() + (self.length))
                def handler(parent, _io__raw__m_value=_io__raw__m_value):
                    self._raw__m_value = _io__raw__m_value.to_byte_array()
                    if len(self._raw__m_value) != self.length:
                        raise kaitaistruct.ConsistencyError(u"raw(value)", self.length, len(self._raw__m_value))
                    parent.write_bytes(self._raw__m_value)
                _io__raw__m_value.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self._m_value._write__seq(_io__raw__m_value)
            elif _on == u"glyf":
                pass
                _io__raw__m_value = KaitaiStream(BytesIO(bytearray(self.length)))
                io.add_child_stream(_io__raw__m_value)
                _pos2 = io.pos()
                io.seek(io.pos() + (self.length))
                def handler(parent, _io__raw__m_value=_io__raw__m_value):
                    self._raw__m_value = _io__raw__m_value.to_byte_array()
                    if len(self._raw__m_value) != self.length:
                        raise kaitaistruct.ConsistencyError(u"raw(value)", self.length, len(self._raw__m_value))
                    parent.write_bytes(self._raw__m_value)
                _io__raw__m_value.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self._m_value._write__seq(_io__raw__m_value)
            elif _on == u"head":
                pass
                _io__raw__m_value = KaitaiStream(BytesIO(bytearray(self.length)))
                io.add_child_stream(_io__raw__m_value)
                _pos2 = io.pos()
                io.seek(io.pos() + (self.length))
                def handler(parent, _io__raw__m_value=_io__raw__m_value):
                    self._raw__m_value = _io__raw__m_value.to_byte_array()
                    if len(self._raw__m_value) != self.length:
                        raise kaitaistruct.ConsistencyError(u"raw(value)", self.length, len(self._raw__m_value))
                    parent.write_bytes(self._raw__m_value)
                _io__raw__m_value.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self._m_value._write__seq(_io__raw__m_value)
            elif _on == u"hhea":
                pass
                _io__raw__m_value = KaitaiStream(BytesIO(bytearray(self.length)))
                io.add_child_stream(_io__raw__m_value)
                _pos2 = io.pos()
                io.seek(io.pos() + (self.length))
                def handler(parent, _io__raw__m_value=_io__raw__m_value):
                    self._raw__m_value = _io__raw__m_value.to_byte_array()
                    if len(self._raw__m_value) != self.length:
                        raise kaitaistruct.ConsistencyError(u"raw(value)", self.length, len(self._raw__m_value))
                    parent.write_bytes(self._raw__m_value)
                _io__raw__m_value.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self._m_value._write__seq(_io__raw__m_value)
            elif _on == u"kern":
                pass
                _io__raw__m_value = KaitaiStream(BytesIO(bytearray(self.length)))
                io.add_child_stream(_io__raw__m_value)
                _pos2 = io.pos()
                io.seek(io.pos() + (self.length))
                def handler(parent, _io__raw__m_value=_io__raw__m_value):
                    self._raw__m_value = _io__raw__m_value.to_byte_array()
                    if len(self._raw__m_value) != self.length:
                        raise kaitaistruct.ConsistencyError(u"raw(value)", self.length, len(self._raw__m_value))
                    parent.write_bytes(self._raw__m_value)
                _io__raw__m_value.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self._m_value._write__seq(_io__raw__m_value)
            elif _on == u"maxp":
                pass
                _io__raw__m_value = KaitaiStream(BytesIO(bytearray(self.length)))
                io.add_child_stream(_io__raw__m_value)
                _pos2 = io.pos()
                io.seek(io.pos() + (self.length))
                def handler(parent, _io__raw__m_value=_io__raw__m_value):
                    self._raw__m_value = _io__raw__m_value.to_byte_array()
                    if len(self._raw__m_value) != self.length:
                        raise kaitaistruct.ConsistencyError(u"raw(value)", self.length, len(self._raw__m_value))
                    parent.write_bytes(self._raw__m_value)
                _io__raw__m_value.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self._m_value._write__seq(_io__raw__m_value)
            elif _on == u"name":
                pass
                _io__raw__m_value = KaitaiStream(BytesIO(bytearray(self.length)))
                io.add_child_stream(_io__raw__m_value)
                _pos2 = io.pos()
                io.seek(io.pos() + (self.length))
                def handler(parent, _io__raw__m_value=_io__raw__m_value):
                    self._raw__m_value = _io__raw__m_value.to_byte_array()
                    if len(self._raw__m_value) != self.length:
                        raise kaitaistruct.ConsistencyError(u"raw(value)", self.length, len(self._raw__m_value))
                    parent.write_bytes(self._raw__m_value)
                _io__raw__m_value.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self._m_value._write__seq(_io__raw__m_value)
            elif _on == u"post":
                pass
                _io__raw__m_value = KaitaiStream(BytesIO(bytearray(self.length)))
                io.add_child_stream(_io__raw__m_value)
                _pos2 = io.pos()
                io.seek(io.pos() + (self.length))
                def handler(parent, _io__raw__m_value=_io__raw__m_value):
                    self._raw__m_value = _io__raw__m_value.to_byte_array()
                    if len(self._raw__m_value) != self.length:
                        raise kaitaistruct.ConsistencyError(u"raw(value)", self.length, len(self._raw__m_value))
                    parent.write_bytes(self._raw__m_value)
                _io__raw__m_value.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self._m_value._write__seq(_io__raw__m_value)
            elif _on == u"prep":
                pass
                _io__raw__m_value = KaitaiStream(BytesIO(bytearray(self.length)))
                io.add_child_stream(_io__raw__m_value)
                _pos2 = io.pos()
                io.seek(io.pos() + (self.length))
                def handler(parent, _io__raw__m_value=_io__raw__m_value):
                    self._raw__m_value = _io__raw__m_value.to_byte_array()
                    if len(self._raw__m_value) != self.length:
                        raise kaitaistruct.ConsistencyError(u"raw(value)", self.length, len(self._raw__m_value))
                    parent.write_bytes(self._raw__m_value)
                _io__raw__m_value.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self._m_value._write__seq(_io__raw__m_value)
            else:
                pass
                io.write_bytes(self._m_value)
            io.seek(_pos)


    class Fixed(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Ttf.Fixed, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.major = self._io.read_u2be()
            self.minor = self._io.read_u2be()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(Ttf.Fixed, self)._write__seq(io)
            self._io.write_u2be(self.major)
            self._io.write_u2be(self.minor)


        def _check(self):
            self._dirty = False


    class Fpgm(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Ttf.Fpgm, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.instructions = self._io.read_bytes_full()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(Ttf.Fpgm, self)._write__seq(io)
            self._io.write_bytes(self.instructions)
            if not self._io.is_eof():
                raise kaitaistruct.ConsistencyError(u"instructions", 0, self._io.size() - self._io.pos())


        def _check(self):
            self._dirty = False


    class Glyf(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Ttf.Glyf, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.number_of_contours = self._io.read_s2be()
            self.x_min = self._io.read_s2be()
            self.y_min = self._io.read_s2be()
            self.x_max = self._io.read_s2be()
            self.y_max = self._io.read_s2be()
            if self.number_of_contours > 0:
                pass
                self.value = Ttf.Glyf.SimpleGlyph(self._io, self, self._root)
                self.value._read()

            self._dirty = False


        def _fetch_instances(self):
            pass
            if self.number_of_contours > 0:
                pass
                self.value._fetch_instances()



        def _write__seq(self, io=None):
            super(Ttf.Glyf, self)._write__seq(io)
            self._io.write_s2be(self.number_of_contours)
            self._io.write_s2be(self.x_min)
            self._io.write_s2be(self.y_min)
            self._io.write_s2be(self.x_max)
            self._io.write_s2be(self.y_max)
            if self.number_of_contours > 0:
                pass
                self.value._write__seq(self._io)



        def _check(self):
            if self.number_of_contours > 0:
                pass
                if self.value._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"value", self._root, self.value._root)
                if self.value._parent != self:
                    raise kaitaistruct.ConsistencyError(u"value", self, self.value._parent)

            self._dirty = False

        class SimpleGlyph(ReadWriteKaitaiStruct):
            def __init__(self, _io=None, _parent=None, _root=None):
                super(Ttf.Glyf.SimpleGlyph, self).__init__(_io)
                self._parent = _parent
                self._root = _root

            def _read(self):
                self.end_pts_of_contours = []
                for i in range(self._parent.number_of_contours):
                    self.end_pts_of_contours.append(self._io.read_u2be())

                self.instruction_length = self._io.read_u2be()
                self.instructions = self._io.read_bytes(self.instruction_length)
                self.flags = []
                for i in range(self.point_count):
                    _t_flags = Ttf.Glyf.SimpleGlyph.Flag(self._io, self, self._root)
                    try:
                        _t_flags._read()
                    finally:
                        self.flags.append(_t_flags)

                self._dirty = False


            def _fetch_instances(self):
                pass
                for i in range(len(self.end_pts_of_contours)):
                    pass

                for i in range(len(self.flags)):
                    pass
                    self.flags[i]._fetch_instances()



            def _write__seq(self, io=None):
                super(Ttf.Glyf.SimpleGlyph, self)._write__seq(io)
                for i in range(len(self.end_pts_of_contours)):
                    pass
                    self._io.write_u2be(self.end_pts_of_contours[i])

                self._io.write_u2be(self.instruction_length)
                self._io.write_bytes(self.instructions)
                for i in range(len(self.flags)):
                    pass
                    self.flags[i]._write__seq(self._io)



            def _check(self):
                if len(self.end_pts_of_contours) != self._parent.number_of_contours:
                    raise kaitaistruct.ConsistencyError(u"end_pts_of_contours", self._parent.number_of_contours, len(self.end_pts_of_contours))
                for i in range(len(self.end_pts_of_contours)):
                    pass

                if len(self.instructions) != self.instruction_length:
                    raise kaitaistruct.ConsistencyError(u"instructions", self.instruction_length, len(self.instructions))
                if len(self.flags) != self.point_count:
                    raise kaitaistruct.ConsistencyError(u"flags", self.point_count, len(self.flags))
                for i in range(len(self.flags)):
                    pass
                    if self.flags[i]._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"flags", self._root, self.flags[i]._root)
                    if self.flags[i]._parent != self:
                        raise kaitaistruct.ConsistencyError(u"flags", self, self.flags[i]._parent)

                self._dirty = False

            class Flag(ReadWriteKaitaiStruct):
                def __init__(self, _io=None, _parent=None, _root=None):
                    super(Ttf.Glyf.SimpleGlyph.Flag, self).__init__(_io)
                    self._parent = _parent
                    self._root = _root

                def _read(self):
                    self.reserved = self._io.read_bits_int_be(2)
                    self.y_is_same = self._io.read_bits_int_be(1) != 0
                    self.x_is_same = self._io.read_bits_int_be(1) != 0
                    self.repeat = self._io.read_bits_int_be(1) != 0
                    self.y_short_vector = self._io.read_bits_int_be(1) != 0
                    self.x_short_vector = self._io.read_bits_int_be(1) != 0
                    self.on_curve = self._io.read_bits_int_be(1) != 0
                    if self.repeat:
                        pass
                        self.repeat_value = self._io.read_u1()

                    self._dirty = False


                def _fetch_instances(self):
                    pass
                    if self.repeat:
                        pass



                def _write__seq(self, io=None):
                    super(Ttf.Glyf.SimpleGlyph.Flag, self)._write__seq(io)
                    self._io.write_bits_int_be(2, self.reserved)
                    self._io.write_bits_int_be(1, int(self.y_is_same))
                    self._io.write_bits_int_be(1, int(self.x_is_same))
                    self._io.write_bits_int_be(1, int(self.repeat))
                    self._io.write_bits_int_be(1, int(self.y_short_vector))
                    self._io.write_bits_int_be(1, int(self.x_short_vector))
                    self._io.write_bits_int_be(1, int(self.on_curve))
                    if self.repeat:
                        pass
                        self._io.write_u1(self.repeat_value)



                def _check(self):
                    if self.repeat:
                        pass

                    self._dirty = False


            @property
            def point_count(self):
                if hasattr(self, '_m_point_count'):
                    return self._m_point_count

                self._m_point_count = max(self.end_pts_of_contours) + 1
                return getattr(self, '_m_point_count', None)

            def _invalidate_point_count(self):
                del self._m_point_count


    class Head(ReadWriteKaitaiStruct):

        class Flags(IntEnum):
            baseline_at_y0 = 1
            left_sidebearing_at_x0 = 2
            flag_depend_on_point_size = 4
            flag_force_ppem = 8
            flag_may_advance_width = 16

        class FontDirectionHint(IntEnum):
            fully_mixed_directional_glyphs = 0
            only_strongly_left_to_right = 1
            strongly_left_to_right_and_neutrals = 2
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Ttf.Head, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.version = Ttf.Fixed(self._io, self, self._root)
            self.version._read()
            self.font_revision = Ttf.Fixed(self._io, self, self._root)
            self.font_revision._read()
            self.checksum_adjustment = self._io.read_u4be()
            self.magic_number = self._io.read_bytes(4)
            if not self.magic_number == b"\x5F\x0F\x3C\xF5":
                raise kaitaistruct.ValidationNotEqualError(b"\x5F\x0F\x3C\xF5", self.magic_number, self._io, u"/types/head/seq/3")
            self.flags = KaitaiStream.resolve_enum(Ttf.Head.Flags, self._io.read_u2be())
            self.units_per_em = self._io.read_u2be()
            self.created = self._io.read_u8be()
            self.modified = self._io.read_u8be()
            self.x_min = self._io.read_s2be()
            self.y_min = self._io.read_s2be()
            self.x_max = self._io.read_s2be()
            self.y_max = self._io.read_s2be()
            self.mac_style = self._io.read_u2be()
            self.lowest_rec_ppem = self._io.read_u2be()
            self.font_direction_hint = KaitaiStream.resolve_enum(Ttf.Head.FontDirectionHint, self._io.read_s2be())
            self.index_to_loc_format = self._io.read_s2be()
            self.glyph_data_format = self._io.read_s2be()
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.version._fetch_instances()
            self.font_revision._fetch_instances()


        def _write__seq(self, io=None):
            super(Ttf.Head, self)._write__seq(io)
            self.version._write__seq(self._io)
            self.font_revision._write__seq(self._io)
            self._io.write_u4be(self.checksum_adjustment)
            self._io.write_bytes(self.magic_number)
            self._io.write_u2be(int(self.flags))
            self._io.write_u2be(self.units_per_em)
            self._io.write_u8be(self.created)
            self._io.write_u8be(self.modified)
            self._io.write_s2be(self.x_min)
            self._io.write_s2be(self.y_min)
            self._io.write_s2be(self.x_max)
            self._io.write_s2be(self.y_max)
            self._io.write_u2be(self.mac_style)
            self._io.write_u2be(self.lowest_rec_ppem)
            self._io.write_s2be(int(self.font_direction_hint))
            self._io.write_s2be(self.index_to_loc_format)
            self._io.write_s2be(self.glyph_data_format)


        def _check(self):
            if self.version._root != self._root:
                raise kaitaistruct.ConsistencyError(u"version", self._root, self.version._root)
            if self.version._parent != self:
                raise kaitaistruct.ConsistencyError(u"version", self, self.version._parent)
            if self.font_revision._root != self._root:
                raise kaitaistruct.ConsistencyError(u"font_revision", self._root, self.font_revision._root)
            if self.font_revision._parent != self:
                raise kaitaistruct.ConsistencyError(u"font_revision", self, self.font_revision._parent)
            if len(self.magic_number) != 4:
                raise kaitaistruct.ConsistencyError(u"magic_number", 4, len(self.magic_number))
            if not self.magic_number == b"\x5F\x0F\x3C\xF5":
                raise kaitaistruct.ValidationNotEqualError(b"\x5F\x0F\x3C\xF5", self.magic_number, None, u"/types/head/seq/3")
            self._dirty = False


    class Hhea(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Ttf.Hhea, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.version = Ttf.Fixed(self._io, self, self._root)
            self.version._read()
            self.ascender = self._io.read_s2be()
            self.descender = self._io.read_s2be()
            self.line_gap = self._io.read_s2be()
            self.advance_width_max = self._io.read_u2be()
            self.min_left_side_bearing = self._io.read_s2be()
            self.min_right_side_bearing = self._io.read_s2be()
            self.x_max_extend = self._io.read_s2be()
            self.caret_slope_rise = self._io.read_s2be()
            self.caret_slope_run = self._io.read_s2be()
            self.reserved = self._io.read_bytes(10)
            if not self.reserved == b"\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00":
                raise kaitaistruct.ValidationNotEqualError(b"\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00", self.reserved, self._io, u"/types/hhea/seq/10")
            self.metric_data_format = self._io.read_s2be()
            self.number_of_hmetrics = self._io.read_u2be()
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.version._fetch_instances()


        def _write__seq(self, io=None):
            super(Ttf.Hhea, self)._write__seq(io)
            self.version._write__seq(self._io)
            self._io.write_s2be(self.ascender)
            self._io.write_s2be(self.descender)
            self._io.write_s2be(self.line_gap)
            self._io.write_u2be(self.advance_width_max)
            self._io.write_s2be(self.min_left_side_bearing)
            self._io.write_s2be(self.min_right_side_bearing)
            self._io.write_s2be(self.x_max_extend)
            self._io.write_s2be(self.caret_slope_rise)
            self._io.write_s2be(self.caret_slope_run)
            self._io.write_bytes(self.reserved)
            self._io.write_s2be(self.metric_data_format)
            self._io.write_u2be(self.number_of_hmetrics)


        def _check(self):
            if self.version._root != self._root:
                raise kaitaistruct.ConsistencyError(u"version", self._root, self.version._root)
            if self.version._parent != self:
                raise kaitaistruct.ConsistencyError(u"version", self, self.version._parent)
            if len(self.reserved) != 10:
                raise kaitaistruct.ConsistencyError(u"reserved", 10, len(self.reserved))
            if not self.reserved == b"\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00":
                raise kaitaistruct.ValidationNotEqualError(b"\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00", self.reserved, None, u"/types/hhea/seq/10")
            self._dirty = False


    class Kern(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Ttf.Kern, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.version = self._io.read_u2be()
            self.subtable_count = self._io.read_u2be()
            self.subtables = []
            for i in range(self.subtable_count):
                _t_subtables = Ttf.Kern.Subtable(self._io, self, self._root)
                try:
                    _t_subtables._read()
                finally:
                    self.subtables.append(_t_subtables)

            self._dirty = False


        def _fetch_instances(self):
            pass
            for i in range(len(self.subtables)):
                pass
                self.subtables[i]._fetch_instances()



        def _write__seq(self, io=None):
            super(Ttf.Kern, self)._write__seq(io)
            self._io.write_u2be(self.version)
            self._io.write_u2be(self.subtable_count)
            for i in range(len(self.subtables)):
                pass
                self.subtables[i]._write__seq(self._io)



        def _check(self):
            if len(self.subtables) != self.subtable_count:
                raise kaitaistruct.ConsistencyError(u"subtables", self.subtable_count, len(self.subtables))
            for i in range(len(self.subtables)):
                pass
                if self.subtables[i]._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"subtables", self._root, self.subtables[i]._root)
                if self.subtables[i]._parent != self:
                    raise kaitaistruct.ConsistencyError(u"subtables", self, self.subtables[i]._parent)

            self._dirty = False

        class Subtable(ReadWriteKaitaiStruct):
            def __init__(self, _io=None, _parent=None, _root=None):
                super(Ttf.Kern.Subtable, self).__init__(_io)
                self._parent = _parent
                self._root = _root

            def _read(self):
                self.version = self._io.read_u2be()
                self.length = self._io.read_u2be()
                self.format = self._io.read_u1()
                self.reserved = self._io.read_bits_int_be(4)
                self.is_override = self._io.read_bits_int_be(1) != 0
                self.is_cross_stream = self._io.read_bits_int_be(1) != 0
                self.is_minimum = self._io.read_bits_int_be(1) != 0
                self.is_horizontal = self._io.read_bits_int_be(1) != 0
                if self.format == 0:
                    pass
                    self.format0 = Ttf.Kern.Subtable.Format0(self._io, self, self._root)
                    self.format0._read()

                self._dirty = False


            def _fetch_instances(self):
                pass
                if self.format == 0:
                    pass
                    self.format0._fetch_instances()



            def _write__seq(self, io=None):
                super(Ttf.Kern.Subtable, self)._write__seq(io)
                self._io.write_u2be(self.version)
                self._io.write_u2be(self.length)
                self._io.write_u1(self.format)
                self._io.write_bits_int_be(4, self.reserved)
                self._io.write_bits_int_be(1, int(self.is_override))
                self._io.write_bits_int_be(1, int(self.is_cross_stream))
                self._io.write_bits_int_be(1, int(self.is_minimum))
                self._io.write_bits_int_be(1, int(self.is_horizontal))
                if self.format == 0:
                    pass
                    self.format0._write__seq(self._io)



            def _check(self):
                if self.format == 0:
                    pass
                    if self.format0._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"format0", self._root, self.format0._root)
                    if self.format0._parent != self:
                        raise kaitaistruct.ConsistencyError(u"format0", self, self.format0._parent)

                self._dirty = False

            class Format0(ReadWriteKaitaiStruct):
                def __init__(self, _io=None, _parent=None, _root=None):
                    super(Ttf.Kern.Subtable.Format0, self).__init__(_io)
                    self._parent = _parent
                    self._root = _root

                def _read(self):
                    self.pair_count = self._io.read_u2be()
                    self.search_range = self._io.read_u2be()
                    self.entry_selector = self._io.read_u2be()
                    self.range_shift = self._io.read_u2be()
                    self.kerning_pairs = []
                    for i in range(self.pair_count):
                        _t_kerning_pairs = Ttf.Kern.Subtable.Format0.KerningPair(self._io, self, self._root)
                        try:
                            _t_kerning_pairs._read()
                        finally:
                            self.kerning_pairs.append(_t_kerning_pairs)

                    self._dirty = False


                def _fetch_instances(self):
                    pass
                    for i in range(len(self.kerning_pairs)):
                        pass
                        self.kerning_pairs[i]._fetch_instances()



                def _write__seq(self, io=None):
                    super(Ttf.Kern.Subtable.Format0, self)._write__seq(io)
                    self._io.write_u2be(self.pair_count)
                    self._io.write_u2be(self.search_range)
                    self._io.write_u2be(self.entry_selector)
                    self._io.write_u2be(self.range_shift)
                    for i in range(len(self.kerning_pairs)):
                        pass
                        self.kerning_pairs[i]._write__seq(self._io)



                def _check(self):
                    if len(self.kerning_pairs) != self.pair_count:
                        raise kaitaistruct.ConsistencyError(u"kerning_pairs", self.pair_count, len(self.kerning_pairs))
                    for i in range(len(self.kerning_pairs)):
                        pass
                        if self.kerning_pairs[i]._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"kerning_pairs", self._root, self.kerning_pairs[i]._root)
                        if self.kerning_pairs[i]._parent != self:
                            raise kaitaistruct.ConsistencyError(u"kerning_pairs", self, self.kerning_pairs[i]._parent)

                    self._dirty = False

                class KerningPair(ReadWriteKaitaiStruct):
                    def __init__(self, _io=None, _parent=None, _root=None):
                        super(Ttf.Kern.Subtable.Format0.KerningPair, self).__init__(_io)
                        self._parent = _parent
                        self._root = _root

                    def _read(self):
                        self.left = self._io.read_u2be()
                        self.right = self._io.read_u2be()
                        self.value = self._io.read_s2be()
                        self._dirty = False


                    def _fetch_instances(self):
                        pass


                    def _write__seq(self, io=None):
                        super(Ttf.Kern.Subtable.Format0.KerningPair, self)._write__seq(io)
                        self._io.write_u2be(self.left)
                        self._io.write_u2be(self.right)
                        self._io.write_s2be(self.value)


                    def _check(self):
                        self._dirty = False





    class Maxp(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Ttf.Maxp, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.table_version_number = Ttf.Fixed(self._io, self, self._root)
            self.table_version_number._read()
            self.num_glyphs = self._io.read_u2be()
            if self.is_version10:
                pass
                self.version10_body = Ttf.MaxpVersion10Body(self._io, self, self._root)
                self.version10_body._read()

            self._dirty = False


        def _fetch_instances(self):
            pass
            self.table_version_number._fetch_instances()
            if self.is_version10:
                pass
                self.version10_body._fetch_instances()



        def _write__seq(self, io=None):
            super(Ttf.Maxp, self)._write__seq(io)
            self.table_version_number._write__seq(self._io)
            self._io.write_u2be(self.num_glyphs)
            if self.is_version10:
                pass
                self.version10_body._write__seq(self._io)



        def _check(self):
            if self.table_version_number._root != self._root:
                raise kaitaistruct.ConsistencyError(u"table_version_number", self._root, self.table_version_number._root)
            if self.table_version_number._parent != self:
                raise kaitaistruct.ConsistencyError(u"table_version_number", self, self.table_version_number._parent)
            if self.is_version10:
                pass
                if self.version10_body._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"version10_body", self._root, self.version10_body._root)
                if self.version10_body._parent != self:
                    raise kaitaistruct.ConsistencyError(u"version10_body", self, self.version10_body._parent)

            self._dirty = False

        @property
        def is_version10(self):
            if hasattr(self, '_m_is_version10'):
                return self._m_is_version10

            self._m_is_version10 =  ((self.table_version_number.major == 1) and (self.table_version_number.minor == 0)) 
            return getattr(self, '_m_is_version10', None)

        def _invalidate_is_version10(self):
            del self._m_is_version10

    class MaxpVersion10Body(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Ttf.MaxpVersion10Body, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.max_points = self._io.read_u2be()
            self.max_contours = self._io.read_u2be()
            self.max_composite_points = self._io.read_u2be()
            self.max_composite_contours = self._io.read_u2be()
            self.max_zones = self._io.read_u2be()
            self.max_twilight_points = self._io.read_u2be()
            self.max_storage = self._io.read_u2be()
            self.max_function_defs = self._io.read_u2be()
            self.max_instruction_defs = self._io.read_u2be()
            self.max_stack_elements = self._io.read_u2be()
            self.max_size_of_instructions = self._io.read_u2be()
            self.max_component_elements = self._io.read_u2be()
            self.max_component_depth = self._io.read_u2be()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(Ttf.MaxpVersion10Body, self)._write__seq(io)
            self._io.write_u2be(self.max_points)
            self._io.write_u2be(self.max_contours)
            self._io.write_u2be(self.max_composite_points)
            self._io.write_u2be(self.max_composite_contours)
            self._io.write_u2be(self.max_zones)
            self._io.write_u2be(self.max_twilight_points)
            self._io.write_u2be(self.max_storage)
            self._io.write_u2be(self.max_function_defs)
            self._io.write_u2be(self.max_instruction_defs)
            self._io.write_u2be(self.max_stack_elements)
            self._io.write_u2be(self.max_size_of_instructions)
            self._io.write_u2be(self.max_component_elements)
            self._io.write_u2be(self.max_component_depth)


        def _check(self):
            self._dirty = False


    class Name(ReadWriteKaitaiStruct):
        """Name table is meant to include human-readable string metadata
        that describes font: name of the font, its styles, copyright &
        trademark notices, vendor and designer info, etc.
        
        The table includes a list of "name records", each of which
        corresponds to a single metadata entry.
        
        .. seealso::
           Source - https://developer.apple.com/fonts/TrueType-Reference-Manual/RM06/Chap6name.html
        """

        class Names(IntEnum):
            copyright = 0
            font_family = 1
            font_subfamily = 2
            unique_subfamily_id = 3
            full_font_name = 4
            name_table_version = 5
            postscript_font_name = 6
            trademark = 7
            manufacturer = 8
            designer = 9
            description = 10
            url_vendor = 11
            url_designer = 12
            license = 13
            url_license = 14
            reserved_15 = 15
            preferred_family = 16
            preferred_subfamily = 17
            compatible_full_name = 18
            sample_text = 19

        class Platforms(IntEnum):
            unicode = 0
            macintosh = 1
            reserved_2 = 2
            microsoft = 3
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Ttf.Name, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.format_selector = self._io.read_u2be()
            self.num_name_records = self._io.read_u2be()
            self.ofs_strings = self._io.read_u2be()
            self.name_records = []
            for i in range(self.num_name_records):
                _t_name_records = Ttf.Name.NameRecord(self._io, self, self._root)
                try:
                    _t_name_records._read()
                finally:
                    self.name_records.append(_t_name_records)

            self._dirty = False


        def _fetch_instances(self):
            pass
            for i in range(len(self.name_records)):
                pass
                self.name_records[i]._fetch_instances()



        def _write__seq(self, io=None):
            super(Ttf.Name, self)._write__seq(io)
            self._io.write_u2be(self.format_selector)
            self._io.write_u2be(self.num_name_records)
            self._io.write_u2be(self.ofs_strings)
            for i in range(len(self.name_records)):
                pass
                self.name_records[i]._write__seq(self._io)



        def _check(self):
            if len(self.name_records) != self.num_name_records:
                raise kaitaistruct.ConsistencyError(u"name_records", self.num_name_records, len(self.name_records))
            for i in range(len(self.name_records)):
                pass
                if self.name_records[i]._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"name_records", self._root, self.name_records[i]._root)
                if self.name_records[i]._parent != self:
                    raise kaitaistruct.ConsistencyError(u"name_records", self, self.name_records[i]._parent)

            self._dirty = False

        class NameRecord(ReadWriteKaitaiStruct):
            def __init__(self, _io=None, _parent=None, _root=None):
                super(Ttf.Name.NameRecord, self).__init__(_io)
                self._parent = _parent
                self._root = _root
                self._should_write_ascii_value = False
                self.ascii_value__enabled = True
                self._should_write_unicode_value = False
                self.unicode_value__enabled = True

            def _read(self):
                self.platform_id = KaitaiStream.resolve_enum(Ttf.Name.Platforms, self._io.read_u2be())
                self.encoding_id = self._io.read_u2be()
                self.language_id = self._io.read_u2be()
                self.name_id = KaitaiStream.resolve_enum(Ttf.Name.Names, self._io.read_u2be())
                self.len_str = self._io.read_u2be()
                self.ofs_str = self._io.read_u2be()
                self._dirty = False


            def _fetch_instances(self):
                pass
                _ = self.ascii_value
                if hasattr(self, '_m_ascii_value'):
                    pass

                _ = self.unicode_value
                if hasattr(self, '_m_unicode_value'):
                    pass



            def _write__seq(self, io=None):
                super(Ttf.Name.NameRecord, self)._write__seq(io)
                self._should_write_ascii_value = self.ascii_value__enabled
                self._should_write_unicode_value = self.unicode_value__enabled
                self._io.write_u2be(int(self.platform_id))
                self._io.write_u2be(self.encoding_id)
                self._io.write_u2be(self.language_id)
                self._io.write_u2be(int(self.name_id))
                self._io.write_u2be(self.len_str)
                self._io.write_u2be(self.ofs_str)


            def _check(self):
                if self.ascii_value__enabled:
                    pass
                    if len((self._m_ascii_value).encode(u"ASCII")) != self.len_str:
                        raise kaitaistruct.ConsistencyError(u"ascii_value", self.len_str, len((self._m_ascii_value).encode(u"ASCII")))

                if self.unicode_value__enabled:
                    pass
                    if len((self._m_unicode_value).encode(u"UTF-16BE")) != self.len_str:
                        raise kaitaistruct.ConsistencyError(u"unicode_value", self.len_str, len((self._m_unicode_value).encode(u"UTF-16BE")))

                self._dirty = False

            @property
            def ascii_value(self):
                if self._should_write_ascii_value:
                    self._write_ascii_value()
                if hasattr(self, '_m_ascii_value'):
                    return self._m_ascii_value

                if not self.ascii_value__enabled:
                    return None

                io = self._parent._io
                _pos = io.pos()
                io.seek(self._parent.ofs_strings + self.ofs_str)
                self._m_ascii_value = (io.read_bytes(self.len_str)).decode(u"ASCII")
                io.seek(_pos)
                return getattr(self, '_m_ascii_value', None)

            @ascii_value.setter
            def ascii_value(self, v):
                self._dirty = True
                self._m_ascii_value = v

            def _write_ascii_value(self):
                self._should_write_ascii_value = False
                io = self._parent._io
                _pos = io.pos()
                io.seek(self._parent.ofs_strings + self.ofs_str)
                io.write_bytes((self._m_ascii_value).encode(u"ASCII"))
                io.seek(_pos)

            @property
            def unicode_value(self):
                if self._should_write_unicode_value:
                    self._write_unicode_value()
                if hasattr(self, '_m_unicode_value'):
                    return self._m_unicode_value

                if not self.unicode_value__enabled:
                    return None

                io = self._parent._io
                _pos = io.pos()
                io.seek(self._parent.ofs_strings + self.ofs_str)
                self._m_unicode_value = (io.read_bytes(self.len_str)).decode(u"UTF-16BE")
                io.seek(_pos)
                return getattr(self, '_m_unicode_value', None)

            @unicode_value.setter
            def unicode_value(self, v):
                self._dirty = True
                self._m_unicode_value = v

            def _write_unicode_value(self):
                self._should_write_unicode_value = False
                io = self._parent._io
                _pos = io.pos()
                io.seek(self._parent.ofs_strings + self.ofs_str)
                io.write_bytes((self._m_unicode_value).encode(u"UTF-16BE"))
                io.seek(_pos)



    class OffsetTable(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Ttf.OffsetTable, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.sfnt_version = Ttf.Fixed(self._io, self, self._root)
            self.sfnt_version._read()
            self.num_tables = self._io.read_u2be()
            self.search_range = self._io.read_u2be()
            self.entry_selector = self._io.read_u2be()
            self.range_shift = self._io.read_u2be()
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.sfnt_version._fetch_instances()


        def _write__seq(self, io=None):
            super(Ttf.OffsetTable, self)._write__seq(io)
            self.sfnt_version._write__seq(self._io)
            self._io.write_u2be(self.num_tables)
            self._io.write_u2be(self.search_range)
            self._io.write_u2be(self.entry_selector)
            self._io.write_u2be(self.range_shift)


        def _check(self):
            if self.sfnt_version._root != self._root:
                raise kaitaistruct.ConsistencyError(u"sfnt_version", self._root, self.sfnt_version._root)
            if self.sfnt_version._parent != self:
                raise kaitaistruct.ConsistencyError(u"sfnt_version", self, self.sfnt_version._parent)
            self._dirty = False


    class Os2(ReadWriteKaitaiStruct):
        """The OS/2 table consists of a set of metrics that are required by Windows and OS/2."""

        class FsSelection(IntEnum):
            italic = 1
            underscore = 2
            negative = 4
            outlined = 8
            strikeout = 16
            bold = 32
            regular = 64

        class FsType(IntEnum):
            restricted_license_embedding = 2
            preview_and_print_embedding = 4
            editable_embedding = 8

        class WeightClass(IntEnum):
            thin = 100
            extra_light = 200
            light = 300
            normal = 400
            medium = 500
            semi_bold = 600
            bold = 700
            extra_bold = 800
            black = 900

        class WidthClass(IntEnum):
            ultra_condensed = 1
            extra_condensed = 2
            condensed = 3
            semi_condensed = 4
            normal = 5
            semi_expanded = 6
            expanded = 7
            extra_expanded = 8
            ultra_expanded = 9
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Ttf.Os2, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.version = self._io.read_u2be()
            self.x_avg_char_width = self._io.read_s2be()
            self.weight_class = KaitaiStream.resolve_enum(Ttf.Os2.WeightClass, self._io.read_u2be())
            self.width_class = KaitaiStream.resolve_enum(Ttf.Os2.WidthClass, self._io.read_u2be())
            self.fs_type = KaitaiStream.resolve_enum(Ttf.Os2.FsType, self._io.read_s2be())
            self.y_subscript_x_size = self._io.read_s2be()
            self.y_subscript_y_size = self._io.read_s2be()
            self.y_subscript_x_offset = self._io.read_s2be()
            self.y_subscript_y_offset = self._io.read_s2be()
            self.y_superscript_x_size = self._io.read_s2be()
            self.y_superscript_y_size = self._io.read_s2be()
            self.y_superscript_x_offset = self._io.read_s2be()
            self.y_superscript_y_offset = self._io.read_s2be()
            self.y_strikeout_size = self._io.read_s2be()
            self.y_strikeout_position = self._io.read_s2be()
            self.s_family_class = self._io.read_s2be()
            self.panose = Ttf.Os2.Panose(self._io, self, self._root)
            self.panose._read()
            self.unicode_range = Ttf.Os2.UnicodeRange(self._io, self, self._root)
            self.unicode_range._read()
            self.ach_vend_id = (self._io.read_bytes(4)).decode(u"ASCII")
            self.selection = KaitaiStream.resolve_enum(Ttf.Os2.FsSelection, self._io.read_u2be())
            self.first_char_index = self._io.read_u2be()
            self.last_char_index = self._io.read_u2be()
            self.typo_ascender = self._io.read_s2be()
            self.typo_descender = self._io.read_s2be()
            self.typo_line_gap = self._io.read_s2be()
            self.win_ascent = self._io.read_u2be()
            self.win_descent = self._io.read_u2be()
            self.code_page_range = Ttf.Os2.CodePageRange(self._io, self, self._root)
            self.code_page_range._read()
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.panose._fetch_instances()
            self.unicode_range._fetch_instances()
            self.code_page_range._fetch_instances()


        def _write__seq(self, io=None):
            super(Ttf.Os2, self)._write__seq(io)
            self._io.write_u2be(self.version)
            self._io.write_s2be(self.x_avg_char_width)
            self._io.write_u2be(int(self.weight_class))
            self._io.write_u2be(int(self.width_class))
            self._io.write_s2be(int(self.fs_type))
            self._io.write_s2be(self.y_subscript_x_size)
            self._io.write_s2be(self.y_subscript_y_size)
            self._io.write_s2be(self.y_subscript_x_offset)
            self._io.write_s2be(self.y_subscript_y_offset)
            self._io.write_s2be(self.y_superscript_x_size)
            self._io.write_s2be(self.y_superscript_y_size)
            self._io.write_s2be(self.y_superscript_x_offset)
            self._io.write_s2be(self.y_superscript_y_offset)
            self._io.write_s2be(self.y_strikeout_size)
            self._io.write_s2be(self.y_strikeout_position)
            self._io.write_s2be(self.s_family_class)
            self.panose._write__seq(self._io)
            self.unicode_range._write__seq(self._io)
            self._io.write_bytes((self.ach_vend_id).encode(u"ASCII"))
            self._io.write_u2be(int(self.selection))
            self._io.write_u2be(self.first_char_index)
            self._io.write_u2be(self.last_char_index)
            self._io.write_s2be(self.typo_ascender)
            self._io.write_s2be(self.typo_descender)
            self._io.write_s2be(self.typo_line_gap)
            self._io.write_u2be(self.win_ascent)
            self._io.write_u2be(self.win_descent)
            self.code_page_range._write__seq(self._io)


        def _check(self):
            if self.panose._root != self._root:
                raise kaitaistruct.ConsistencyError(u"panose", self._root, self.panose._root)
            if self.panose._parent != self:
                raise kaitaistruct.ConsistencyError(u"panose", self, self.panose._parent)
            if self.unicode_range._root != self._root:
                raise kaitaistruct.ConsistencyError(u"unicode_range", self._root, self.unicode_range._root)
            if self.unicode_range._parent != self:
                raise kaitaistruct.ConsistencyError(u"unicode_range", self, self.unicode_range._parent)
            if len((self.ach_vend_id).encode(u"ASCII")) != 4:
                raise kaitaistruct.ConsistencyError(u"ach_vend_id", 4, len((self.ach_vend_id).encode(u"ASCII")))
            if self.code_page_range._root != self._root:
                raise kaitaistruct.ConsistencyError(u"code_page_range", self._root, self.code_page_range._root)
            if self.code_page_range._parent != self:
                raise kaitaistruct.ConsistencyError(u"code_page_range", self, self.code_page_range._parent)
            self._dirty = False

        class CodePageRange(ReadWriteKaitaiStruct):
            def __init__(self, _io=None, _parent=None, _root=None):
                super(Ttf.Os2.CodePageRange, self).__init__(_io)
                self._parent = _parent
                self._root = _root

            def _read(self):
                self.symbol_character_set = self._io.read_bits_int_be(1) != 0
                self.oem_character_set = self._io.read_bits_int_be(1) != 0
                self.macintosh_character_set = self._io.read_bits_int_be(1) != 0
                self.reserved_for_alternate_ansi_oem = self._io.read_bits_int_be(7)
                self.cp1361_korean_johab = self._io.read_bits_int_be(1) != 0
                self.cp950_chinese_traditional_chars_taiwan_and_hong_kong = self._io.read_bits_int_be(1) != 0
                self.cp949_korean_wansung = self._io.read_bits_int_be(1) != 0
                self.cp936_chinese_simplified_chars_prc_and_singapore = self._io.read_bits_int_be(1) != 0
                self.cp932_jis_japan = self._io.read_bits_int_be(1) != 0
                self.cp874_thai = self._io.read_bits_int_be(1) != 0
                self.reserved_for_alternate_ansi = self._io.read_bits_int_be(8)
                self.cp1257_windows_baltic = self._io.read_bits_int_be(1) != 0
                self.cp1256_arabic = self._io.read_bits_int_be(1) != 0
                self.cp1255_hebrew = self._io.read_bits_int_be(1) != 0
                self.cp1254_turkish = self._io.read_bits_int_be(1) != 0
                self.cp1253_greek = self._io.read_bits_int_be(1) != 0
                self.cp1251_cyrillic = self._io.read_bits_int_be(1) != 0
                self.cp1250_latin_2_eastern_europe = self._io.read_bits_int_be(1) != 0
                self.cp1252_latin_1 = self._io.read_bits_int_be(1) != 0
                self.cp437_us = self._io.read_bits_int_be(1) != 0
                self.cp850_we_latin_1 = self._io.read_bits_int_be(1) != 0
                self.cp708_arabic_asmo_708 = self._io.read_bits_int_be(1) != 0
                self.cp737_greek_former_437_g = self._io.read_bits_int_be(1) != 0
                self.cp775_ms_dos_baltic = self._io.read_bits_int_be(1) != 0
                self.cp852_latin_2 = self._io.read_bits_int_be(1) != 0
                self.cp855_ibm_cyrillic_primarily_russian = self._io.read_bits_int_be(1) != 0
                self.cp857_ibm_turkish = self._io.read_bits_int_be(1) != 0
                self.cp860_ms_dos_portuguese = self._io.read_bits_int_be(1) != 0
                self.cp861_ms_dos_icelandic = self._io.read_bits_int_be(1) != 0
                self.cp862_hebrew = self._io.read_bits_int_be(1) != 0
                self.cp863_ms_dos_canadian_french = self._io.read_bits_int_be(1) != 0
                self.cp864_arabic = self._io.read_bits_int_be(1) != 0
                self.cp865_ms_dos_nordic = self._io.read_bits_int_be(1) != 0
                self.cp866_ms_dos_russian = self._io.read_bits_int_be(1) != 0
                self.cp869_ibm_greek = self._io.read_bits_int_be(1) != 0
                self.reserved_for_oem = self._io.read_bits_int_be(16)
                self._dirty = False


            def _fetch_instances(self):
                pass


            def _write__seq(self, io=None):
                super(Ttf.Os2.CodePageRange, self)._write__seq(io)
                self._io.write_bits_int_be(1, int(self.symbol_character_set))
                self._io.write_bits_int_be(1, int(self.oem_character_set))
                self._io.write_bits_int_be(1, int(self.macintosh_character_set))
                self._io.write_bits_int_be(7, self.reserved_for_alternate_ansi_oem)
                self._io.write_bits_int_be(1, int(self.cp1361_korean_johab))
                self._io.write_bits_int_be(1, int(self.cp950_chinese_traditional_chars_taiwan_and_hong_kong))
                self._io.write_bits_int_be(1, int(self.cp949_korean_wansung))
                self._io.write_bits_int_be(1, int(self.cp936_chinese_simplified_chars_prc_and_singapore))
                self._io.write_bits_int_be(1, int(self.cp932_jis_japan))
                self._io.write_bits_int_be(1, int(self.cp874_thai))
                self._io.write_bits_int_be(8, self.reserved_for_alternate_ansi)
                self._io.write_bits_int_be(1, int(self.cp1257_windows_baltic))
                self._io.write_bits_int_be(1, int(self.cp1256_arabic))
                self._io.write_bits_int_be(1, int(self.cp1255_hebrew))
                self._io.write_bits_int_be(1, int(self.cp1254_turkish))
                self._io.write_bits_int_be(1, int(self.cp1253_greek))
                self._io.write_bits_int_be(1, int(self.cp1251_cyrillic))
                self._io.write_bits_int_be(1, int(self.cp1250_latin_2_eastern_europe))
                self._io.write_bits_int_be(1, int(self.cp1252_latin_1))
                self._io.write_bits_int_be(1, int(self.cp437_us))
                self._io.write_bits_int_be(1, int(self.cp850_we_latin_1))
                self._io.write_bits_int_be(1, int(self.cp708_arabic_asmo_708))
                self._io.write_bits_int_be(1, int(self.cp737_greek_former_437_g))
                self._io.write_bits_int_be(1, int(self.cp775_ms_dos_baltic))
                self._io.write_bits_int_be(1, int(self.cp852_latin_2))
                self._io.write_bits_int_be(1, int(self.cp855_ibm_cyrillic_primarily_russian))
                self._io.write_bits_int_be(1, int(self.cp857_ibm_turkish))
                self._io.write_bits_int_be(1, int(self.cp860_ms_dos_portuguese))
                self._io.write_bits_int_be(1, int(self.cp861_ms_dos_icelandic))
                self._io.write_bits_int_be(1, int(self.cp862_hebrew))
                self._io.write_bits_int_be(1, int(self.cp863_ms_dos_canadian_french))
                self._io.write_bits_int_be(1, int(self.cp864_arabic))
                self._io.write_bits_int_be(1, int(self.cp865_ms_dos_nordic))
                self._io.write_bits_int_be(1, int(self.cp866_ms_dos_russian))
                self._io.write_bits_int_be(1, int(self.cp869_ibm_greek))
                self._io.write_bits_int_be(16, self.reserved_for_oem)


            def _check(self):
                self._dirty = False


        class Panose(ReadWriteKaitaiStruct):

            class ArmStyle(IntEnum):
                any = 0
                no_fit = 1
                straight_arms_horizontal = 2
                straight_arms_wedge = 3
                straight_arms_vertical = 4
                straight_arms_single_serif = 5
                straight_arms_double_serif = 6
                non_straight_arms_horizontal = 7
                non_straight_arms_wedge = 8
                non_straight_arms_vertical = 9
                non_straight_arms_single_serif = 10
                non_straight_arms_double_serif = 11

            class Contrast(IntEnum):
                any = 0
                no_fit = 1
                none = 2
                very_low = 3
                low = 4
                medium_low = 5
                medium = 6
                medium_high = 7
                high = 8
                very_high = 9

            class FamilyKind(IntEnum):
                any = 0
                no_fit = 1
                text_and_display = 2
                script = 3
                decorative = 4
                pictorial = 5

            class LetterForm(IntEnum):
                any = 0
                no_fit = 1
                normal_contact = 2
                normal_weighted = 3
                normal_boxed = 4
                normal_flattened = 5
                normal_rounded = 6
                normal_off_center = 7
                normal_square = 8
                oblique_contact = 9
                oblique_weighted = 10
                oblique_boxed = 11
                oblique_flattened = 12
                oblique_rounded = 13
                oblique_off_center = 14
                oblique_square = 15

            class Midline(IntEnum):
                any = 0
                no_fit = 1
                standard_trimmed = 2
                standard_pointed = 3
                standard_serifed = 4
                high_trimmed = 5
                high_pointed = 6
                high_serifed = 7
                constant_trimmed = 8
                constant_pointed = 9
                constant_serifed = 10
                low_trimmed = 11
                low_pointed = 12
                low_serifed = 13

            class Proportion(IntEnum):
                any = 0
                no_fit = 1
                old_style = 2
                modern = 3
                even_width = 4
                expanded = 5
                condensed = 6
                very_expanded = 7
                very_condensed = 8
                monospaced = 9

            class SerifStyle(IntEnum):
                any = 0
                no_fit = 1
                cove = 2
                obtuse_cove = 3
                square_cove = 4
                obtuse_square_cove = 5
                square = 6
                thin = 7
                bone = 8
                exaggerated = 9
                triangle = 10
                normal_sans = 11
                obtuse_sans = 12
                perp_sans = 13
                flared = 14
                rounded = 15

            class StrokeVariation(IntEnum):
                any = 0
                no_fit = 1
                gradual_diagonal = 2
                gradual_transitional = 3
                gradual_vertical = 4
                gradual_horizontal = 5
                rapid_vertical = 6
                rapid_horizontal = 7
                instant_vertical = 8

            class Weight(IntEnum):
                any = 0
                no_fit = 1
                very_light = 2
                light = 3
                thin = 4
                book = 5
                medium = 6
                demi = 7
                bold = 8
                heavy = 9
                black = 10
                nord = 11

            class XHeight(IntEnum):
                any = 0
                no_fit = 1
                constant_small = 2
                constant_standard = 3
                constant_large = 4
                ducking_small = 5
                ducking_standard = 6
                ducking_large = 7
            def __init__(self, _io=None, _parent=None, _root=None):
                super(Ttf.Os2.Panose, self).__init__(_io)
                self._parent = _parent
                self._root = _root

            def _read(self):
                self.family_type = KaitaiStream.resolve_enum(Ttf.Os2.Panose.FamilyKind, self._io.read_u1())
                self.serif_style = KaitaiStream.resolve_enum(Ttf.Os2.Panose.SerifStyle, self._io.read_u1())
                self.weight = KaitaiStream.resolve_enum(Ttf.Os2.Panose.Weight, self._io.read_u1())
                self.proportion = KaitaiStream.resolve_enum(Ttf.Os2.Panose.Proportion, self._io.read_u1())
                self.contrast = KaitaiStream.resolve_enum(Ttf.Os2.Panose.Contrast, self._io.read_u1())
                self.stroke_variation = KaitaiStream.resolve_enum(Ttf.Os2.Panose.StrokeVariation, self._io.read_u1())
                self.arm_style = KaitaiStream.resolve_enum(Ttf.Os2.Panose.ArmStyle, self._io.read_u1())
                self.letter_form = KaitaiStream.resolve_enum(Ttf.Os2.Panose.LetterForm, self._io.read_u1())
                self.midline = KaitaiStream.resolve_enum(Ttf.Os2.Panose.Midline, self._io.read_u1())
                self.x_height = KaitaiStream.resolve_enum(Ttf.Os2.Panose.XHeight, self._io.read_u1())
                self._dirty = False


            def _fetch_instances(self):
                pass


            def _write__seq(self, io=None):
                super(Ttf.Os2.Panose, self)._write__seq(io)
                self._io.write_u1(int(self.family_type))
                self._io.write_u1(int(self.serif_style))
                self._io.write_u1(int(self.weight))
                self._io.write_u1(int(self.proportion))
                self._io.write_u1(int(self.contrast))
                self._io.write_u1(int(self.stroke_variation))
                self._io.write_u1(int(self.arm_style))
                self._io.write_u1(int(self.letter_form))
                self._io.write_u1(int(self.midline))
                self._io.write_u1(int(self.x_height))


            def _check(self):
                self._dirty = False


        class UnicodeRange(ReadWriteKaitaiStruct):
            def __init__(self, _io=None, _parent=None, _root=None):
                super(Ttf.Os2.UnicodeRange, self).__init__(_io)
                self._parent = _parent
                self._root = _root

            def _read(self):
                self.basic_latin = self._io.read_bits_int_be(1) != 0
                self.latin_1_supplement = self._io.read_bits_int_be(1) != 0
                self.latin_extended_a = self._io.read_bits_int_be(1) != 0
                self.latin_extended_b = self._io.read_bits_int_be(1) != 0
                self.ipa_extensions = self._io.read_bits_int_be(1) != 0
                self.spacing_modifier_letters = self._io.read_bits_int_be(1) != 0
                self.combining_diacritical_marks = self._io.read_bits_int_be(1) != 0
                self.basic_greek = self._io.read_bits_int_be(1) != 0
                self.greek_symbols_and_coptic = self._io.read_bits_int_be(1) != 0
                self.cyrillic = self._io.read_bits_int_be(1) != 0
                self.armenian = self._io.read_bits_int_be(1) != 0
                self.basic_hebrew = self._io.read_bits_int_be(1) != 0
                self.hebrew_extended = self._io.read_bits_int_be(1) != 0
                self.basic_arabic = self._io.read_bits_int_be(1) != 0
                self.arabic_extended = self._io.read_bits_int_be(1) != 0
                self.devanagari = self._io.read_bits_int_be(1) != 0
                self.bengali = self._io.read_bits_int_be(1) != 0
                self.gurmukhi = self._io.read_bits_int_be(1) != 0
                self.gujarati = self._io.read_bits_int_be(1) != 0
                self.oriya = self._io.read_bits_int_be(1) != 0
                self.tamil = self._io.read_bits_int_be(1) != 0
                self.telugu = self._io.read_bits_int_be(1) != 0
                self.kannada = self._io.read_bits_int_be(1) != 0
                self.malayalam = self._io.read_bits_int_be(1) != 0
                self.thai = self._io.read_bits_int_be(1) != 0
                self.lao = self._io.read_bits_int_be(1) != 0
                self.basic_georgian = self._io.read_bits_int_be(1) != 0
                self.georgian_extended = self._io.read_bits_int_be(1) != 0
                self.hangul_jamo = self._io.read_bits_int_be(1) != 0
                self.latin_extended_additional = self._io.read_bits_int_be(1) != 0
                self.greek_extended = self._io.read_bits_int_be(1) != 0
                self.general_punctuation = self._io.read_bits_int_be(1) != 0
                self.superscripts_and_subscripts = self._io.read_bits_int_be(1) != 0
                self.currency_symbols = self._io.read_bits_int_be(1) != 0
                self.combining_diacritical_marks_for_symbols = self._io.read_bits_int_be(1) != 0
                self.letterlike_symbols = self._io.read_bits_int_be(1) != 0
                self.number_forms = self._io.read_bits_int_be(1) != 0
                self.arrows = self._io.read_bits_int_be(1) != 0
                self.mathematical_operators = self._io.read_bits_int_be(1) != 0
                self.miscellaneous_technical = self._io.read_bits_int_be(1) != 0
                self.control_pictures = self._io.read_bits_int_be(1) != 0
                self.optical_character_recognition = self._io.read_bits_int_be(1) != 0
                self.enclosed_alphanumerics = self._io.read_bits_int_be(1) != 0
                self.box_drawing = self._io.read_bits_int_be(1) != 0
                self.block_elements = self._io.read_bits_int_be(1) != 0
                self.geometric_shapes = self._io.read_bits_int_be(1) != 0
                self.miscellaneous_symbols = self._io.read_bits_int_be(1) != 0
                self.dingbats = self._io.read_bits_int_be(1) != 0
                self.cjk_symbols_and_punctuation = self._io.read_bits_int_be(1) != 0
                self.hiragana = self._io.read_bits_int_be(1) != 0
                self.katakana = self._io.read_bits_int_be(1) != 0
                self.bopomofo = self._io.read_bits_int_be(1) != 0
                self.hangul_compatibility_jamo = self._io.read_bits_int_be(1) != 0
                self.cjk_miscellaneous = self._io.read_bits_int_be(1) != 0
                self.enclosed_cjk_letters_and_months = self._io.read_bits_int_be(1) != 0
                self.cjk_compatibility = self._io.read_bits_int_be(1) != 0
                self.hangul = self._io.read_bits_int_be(1) != 0
                self.reserved_for_unicode_subranges1 = self._io.read_bits_int_be(1) != 0
                self.reserved_for_unicode_subranges2 = self._io.read_bits_int_be(1) != 0
                self.cjk_unified_ideographs = self._io.read_bits_int_be(1) != 0
                self.private_use_area = self._io.read_bits_int_be(1) != 0
                self.cjk_compatibility_ideographs = self._io.read_bits_int_be(1) != 0
                self.alphabetic_presentation_forms = self._io.read_bits_int_be(1) != 0
                self.arabic_presentation_forms_a = self._io.read_bits_int_be(1) != 0
                self.combining_half_marks = self._io.read_bits_int_be(1) != 0
                self.cjk_compatibility_forms = self._io.read_bits_int_be(1) != 0
                self.small_form_variants = self._io.read_bits_int_be(1) != 0
                self.arabic_presentation_forms_b = self._io.read_bits_int_be(1) != 0
                self.halfwidth_and_fullwidth_forms = self._io.read_bits_int_be(1) != 0
                self.specials = self._io.read_bits_int_be(1) != 0
                self.reserved = self._io.read_bytes(7)
                self._dirty = False


            def _fetch_instances(self):
                pass


            def _write__seq(self, io=None):
                super(Ttf.Os2.UnicodeRange, self)._write__seq(io)
                self._io.write_bits_int_be(1, int(self.basic_latin))
                self._io.write_bits_int_be(1, int(self.latin_1_supplement))
                self._io.write_bits_int_be(1, int(self.latin_extended_a))
                self._io.write_bits_int_be(1, int(self.latin_extended_b))
                self._io.write_bits_int_be(1, int(self.ipa_extensions))
                self._io.write_bits_int_be(1, int(self.spacing_modifier_letters))
                self._io.write_bits_int_be(1, int(self.combining_diacritical_marks))
                self._io.write_bits_int_be(1, int(self.basic_greek))
                self._io.write_bits_int_be(1, int(self.greek_symbols_and_coptic))
                self._io.write_bits_int_be(1, int(self.cyrillic))
                self._io.write_bits_int_be(1, int(self.armenian))
                self._io.write_bits_int_be(1, int(self.basic_hebrew))
                self._io.write_bits_int_be(1, int(self.hebrew_extended))
                self._io.write_bits_int_be(1, int(self.basic_arabic))
                self._io.write_bits_int_be(1, int(self.arabic_extended))
                self._io.write_bits_int_be(1, int(self.devanagari))
                self._io.write_bits_int_be(1, int(self.bengali))
                self._io.write_bits_int_be(1, int(self.gurmukhi))
                self._io.write_bits_int_be(1, int(self.gujarati))
                self._io.write_bits_int_be(1, int(self.oriya))
                self._io.write_bits_int_be(1, int(self.tamil))
                self._io.write_bits_int_be(1, int(self.telugu))
                self._io.write_bits_int_be(1, int(self.kannada))
                self._io.write_bits_int_be(1, int(self.malayalam))
                self._io.write_bits_int_be(1, int(self.thai))
                self._io.write_bits_int_be(1, int(self.lao))
                self._io.write_bits_int_be(1, int(self.basic_georgian))
                self._io.write_bits_int_be(1, int(self.georgian_extended))
                self._io.write_bits_int_be(1, int(self.hangul_jamo))
                self._io.write_bits_int_be(1, int(self.latin_extended_additional))
                self._io.write_bits_int_be(1, int(self.greek_extended))
                self._io.write_bits_int_be(1, int(self.general_punctuation))
                self._io.write_bits_int_be(1, int(self.superscripts_and_subscripts))
                self._io.write_bits_int_be(1, int(self.currency_symbols))
                self._io.write_bits_int_be(1, int(self.combining_diacritical_marks_for_symbols))
                self._io.write_bits_int_be(1, int(self.letterlike_symbols))
                self._io.write_bits_int_be(1, int(self.number_forms))
                self._io.write_bits_int_be(1, int(self.arrows))
                self._io.write_bits_int_be(1, int(self.mathematical_operators))
                self._io.write_bits_int_be(1, int(self.miscellaneous_technical))
                self._io.write_bits_int_be(1, int(self.control_pictures))
                self._io.write_bits_int_be(1, int(self.optical_character_recognition))
                self._io.write_bits_int_be(1, int(self.enclosed_alphanumerics))
                self._io.write_bits_int_be(1, int(self.box_drawing))
                self._io.write_bits_int_be(1, int(self.block_elements))
                self._io.write_bits_int_be(1, int(self.geometric_shapes))
                self._io.write_bits_int_be(1, int(self.miscellaneous_symbols))
                self._io.write_bits_int_be(1, int(self.dingbats))
                self._io.write_bits_int_be(1, int(self.cjk_symbols_and_punctuation))
                self._io.write_bits_int_be(1, int(self.hiragana))
                self._io.write_bits_int_be(1, int(self.katakana))
                self._io.write_bits_int_be(1, int(self.bopomofo))
                self._io.write_bits_int_be(1, int(self.hangul_compatibility_jamo))
                self._io.write_bits_int_be(1, int(self.cjk_miscellaneous))
                self._io.write_bits_int_be(1, int(self.enclosed_cjk_letters_and_months))
                self._io.write_bits_int_be(1, int(self.cjk_compatibility))
                self._io.write_bits_int_be(1, int(self.hangul))
                self._io.write_bits_int_be(1, int(self.reserved_for_unicode_subranges1))
                self._io.write_bits_int_be(1, int(self.reserved_for_unicode_subranges2))
                self._io.write_bits_int_be(1, int(self.cjk_unified_ideographs))
                self._io.write_bits_int_be(1, int(self.private_use_area))
                self._io.write_bits_int_be(1, int(self.cjk_compatibility_ideographs))
                self._io.write_bits_int_be(1, int(self.alphabetic_presentation_forms))
                self._io.write_bits_int_be(1, int(self.arabic_presentation_forms_a))
                self._io.write_bits_int_be(1, int(self.combining_half_marks))
                self._io.write_bits_int_be(1, int(self.cjk_compatibility_forms))
                self._io.write_bits_int_be(1, int(self.small_form_variants))
                self._io.write_bits_int_be(1, int(self.arabic_presentation_forms_b))
                self._io.write_bits_int_be(1, int(self.halfwidth_and_fullwidth_forms))
                self._io.write_bits_int_be(1, int(self.specials))
                self._io.write_bytes(self.reserved)


            def _check(self):
                if len(self.reserved) != 7:
                    raise kaitaistruct.ConsistencyError(u"reserved", 7, len(self.reserved))
                self._dirty = False



    class Post(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Ttf.Post, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.format = Ttf.Fixed(self._io, self, self._root)
            self.format._read()
            self.italic_angle = Ttf.Fixed(self._io, self, self._root)
            self.italic_angle._read()
            self.underline_position = self._io.read_s2be()
            self.underline_thichness = self._io.read_s2be()
            self.is_fixed_pitch = self._io.read_u4be()
            self.min_mem_type42 = self._io.read_u4be()
            self.max_mem_type42 = self._io.read_u4be()
            self.min_mem_type1 = self._io.read_u4be()
            self.max_mem_type1 = self._io.read_u4be()
            if  ((self.format.major == 2) and (self.format.minor == 0)) :
                pass
                self.format20 = Ttf.Post.Format20(self._io, self, self._root)
                self.format20._read()

            self._dirty = False


        def _fetch_instances(self):
            pass
            self.format._fetch_instances()
            self.italic_angle._fetch_instances()
            if  ((self.format.major == 2) and (self.format.minor == 0)) :
                pass
                self.format20._fetch_instances()



        def _write__seq(self, io=None):
            super(Ttf.Post, self)._write__seq(io)
            self.format._write__seq(self._io)
            self.italic_angle._write__seq(self._io)
            self._io.write_s2be(self.underline_position)
            self._io.write_s2be(self.underline_thichness)
            self._io.write_u4be(self.is_fixed_pitch)
            self._io.write_u4be(self.min_mem_type42)
            self._io.write_u4be(self.max_mem_type42)
            self._io.write_u4be(self.min_mem_type1)
            self._io.write_u4be(self.max_mem_type1)
            if  ((self.format.major == 2) and (self.format.minor == 0)) :
                pass
                self.format20._write__seq(self._io)



        def _check(self):
            if self.format._root != self._root:
                raise kaitaistruct.ConsistencyError(u"format", self._root, self.format._root)
            if self.format._parent != self:
                raise kaitaistruct.ConsistencyError(u"format", self, self.format._parent)
            if self.italic_angle._root != self._root:
                raise kaitaistruct.ConsistencyError(u"italic_angle", self._root, self.italic_angle._root)
            if self.italic_angle._parent != self:
                raise kaitaistruct.ConsistencyError(u"italic_angle", self, self.italic_angle._parent)
            if  ((self.format.major == 2) and (self.format.minor == 0)) :
                pass
                if self.format20._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"format20", self._root, self.format20._root)
                if self.format20._parent != self:
                    raise kaitaistruct.ConsistencyError(u"format20", self, self.format20._parent)

            self._dirty = False

        class Format20(ReadWriteKaitaiStruct):
            def __init__(self, _io=None, _parent=None, _root=None):
                super(Ttf.Post.Format20, self).__init__(_io)
                self._parent = _parent
                self._root = _root

            def _read(self):
                self.number_of_glyphs = self._io.read_u2be()
                self.glyph_name_index = []
                for i in range(self.number_of_glyphs):
                    self.glyph_name_index.append(self._io.read_u2be())

                self.glyph_names = []
                i = 0
                while True:
                    _t_glyph_names = Ttf.Post.Format20.PascalString(self._io, self, self._root)
                    try:
                        _t_glyph_names._read()
                    finally:
                        _ = _t_glyph_names
                        self.glyph_names.append(_)
                    if  ((_.length == 0) or (self._io.is_eof())) :
                        break
                    i += 1
                self._dirty = False


            def _fetch_instances(self):
                pass
                for i in range(len(self.glyph_name_index)):
                    pass

                for i in range(len(self.glyph_names)):
                    pass
                    self.glyph_names[i]._fetch_instances()



            def _write__seq(self, io=None):
                super(Ttf.Post.Format20, self)._write__seq(io)
                self._io.write_u2be(self.number_of_glyphs)
                for i in range(len(self.glyph_name_index)):
                    pass
                    self._io.write_u2be(self.glyph_name_index[i])

                for i in range(len(self.glyph_names)):
                    pass
                    self.glyph_names[i]._write__seq(self._io)
                    _ = self.glyph_names[i]
                    if  ((_.length == 0) or (self._io.is_eof()))  != (i == len(self.glyph_names) - 1):
                        raise kaitaistruct.ConsistencyError(u"glyph_names", i == len(self.glyph_names) - 1,  ((_.length == 0) or (self._io.is_eof())) )



            def _check(self):
                if len(self.glyph_name_index) != self.number_of_glyphs:
                    raise kaitaistruct.ConsistencyError(u"glyph_name_index", self.number_of_glyphs, len(self.glyph_name_index))
                for i in range(len(self.glyph_name_index)):
                    pass

                if len(self.glyph_names) == 0:
                    raise kaitaistruct.ConsistencyError(u"glyph_names", 0, len(self.glyph_names))
                for i in range(len(self.glyph_names)):
                    pass
                    if self.glyph_names[i]._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"glyph_names", self._root, self.glyph_names[i]._root)
                    if self.glyph_names[i]._parent != self:
                        raise kaitaistruct.ConsistencyError(u"glyph_names", self, self.glyph_names[i]._parent)

                self._dirty = False

            class PascalString(ReadWriteKaitaiStruct):
                def __init__(self, _io=None, _parent=None, _root=None):
                    super(Ttf.Post.Format20.PascalString, self).__init__(_io)
                    self._parent = _parent
                    self._root = _root

                def _read(self):
                    self.length = self._io.read_u1()
                    if self.length != 0:
                        pass
                        self.value = (self._io.read_bytes(self.length)).decode(u"ASCII")

                    self._dirty = False


                def _fetch_instances(self):
                    pass
                    if self.length != 0:
                        pass



                def _write__seq(self, io=None):
                    super(Ttf.Post.Format20.PascalString, self)._write__seq(io)
                    self._io.write_u1(self.length)
                    if self.length != 0:
                        pass
                        self._io.write_bytes((self.value).encode(u"ASCII"))



                def _check(self):
                    if self.length != 0:
                        pass
                        if len((self.value).encode(u"ASCII")) != self.length:
                            raise kaitaistruct.ConsistencyError(u"value", self.length, len((self.value).encode(u"ASCII")))

                    self._dirty = False




    class Prep(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Ttf.Prep, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.instructions = self._io.read_bytes_full()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(Ttf.Prep, self)._write__seq(io)
            self._io.write_bytes(self.instructions)
            if not self._io.is_eof():
                raise kaitaistruct.ConsistencyError(u"instructions", 0, self._io.size() - self._io.pos())


        def _check(self):
            self._dirty = False



