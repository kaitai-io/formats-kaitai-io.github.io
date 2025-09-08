# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import ReadWriteKaitaiStruct, KaitaiStream, BytesIO
from enum import IntEnum


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class Mcap(ReadWriteKaitaiStruct):
    """MCAP is a modular container format and logging library for pub/sub messages with
    arbitrary message serialization. It is primarily intended for use in robotics
    applications, and works well under various workloads, resource constraints, and
    durability requirements.
    
    Time values (`log_time`, `publish_time`, `create_time`) are represented in
    nanoseconds since a user-understood epoch (i.e. Unix epoch, robot boot time,
    etc.)
    
    .. seealso::
       Source - https://github.com/foxglove/mcap/tree/c1cc51d/docs/specification#readme
    """

    class Opcode(IntEnum):
        header = 1
        footer = 2
        schema = 3
        channel = 4
        message = 5
        chunk = 6
        message_index = 7
        chunk_index = 8
        attachment = 9
        attachment_index = 10
        statistics = 11
        metadata = 12
        metadata_index = 13
        summary_offset = 14
        data_end = 15
    def __init__(self, _io=None, _parent=None, _root=None):
        super(Mcap, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self
        self._should_write_footer = False
        self.footer__enabled = True

    def _read(self):
        self.header_magic = Mcap.Magic(self._io, self, self._root)
        self.header_magic._read()
        self.records = []
        i = 0
        while True:
            _t_records = Mcap.Record(self._io, self, self._root)
            try:
                _t_records._read()
            finally:
                _ = _t_records
                self.records.append(_)
            if _.op == Mcap.Opcode.footer:
                break
            i += 1
        self.footer_magic = Mcap.Magic(self._io, self, self._root)
        self.footer_magic._read()
        self._dirty = False


    def _fetch_instances(self):
        pass
        self.header_magic._fetch_instances()
        for i in range(len(self.records)):
            pass
            self.records[i]._fetch_instances()

        self.footer_magic._fetch_instances()
        _ = self.footer
        if hasattr(self, '_m_footer'):
            pass
            self._m_footer._fetch_instances()



    def _write__seq(self, io=None):
        super(Mcap, self)._write__seq(io)
        self._should_write_footer = self.footer__enabled
        self.header_magic._write__seq(self._io)
        for i in range(len(self.records)):
            pass
            self.records[i]._write__seq(self._io)

        self.footer_magic._write__seq(self._io)


    def _check(self):
        if self.header_magic._root != self._root:
            raise kaitaistruct.ConsistencyError(u"header_magic", self._root, self.header_magic._root)
        if self.header_magic._parent != self:
            raise kaitaistruct.ConsistencyError(u"header_magic", self, self.header_magic._parent)
        if len(self.records) == 0:
            raise kaitaistruct.ConsistencyError(u"records", 0, len(self.records))
        for i in range(len(self.records)):
            pass
            if self.records[i]._root != self._root:
                raise kaitaistruct.ConsistencyError(u"records", self._root, self.records[i]._root)
            if self.records[i]._parent != self:
                raise kaitaistruct.ConsistencyError(u"records", self, self.records[i]._parent)
            _ = self.records[i]
            if (_.op == Mcap.Opcode.footer) != (i == len(self.records) - 1):
                raise kaitaistruct.ConsistencyError(u"records", i == len(self.records) - 1, _.op == Mcap.Opcode.footer)

        if self.footer_magic._root != self._root:
            raise kaitaistruct.ConsistencyError(u"footer_magic", self._root, self.footer_magic._root)
        if self.footer_magic._parent != self:
            raise kaitaistruct.ConsistencyError(u"footer_magic", self, self.footer_magic._parent)
        if self.footer__enabled:
            pass
            if self._m_footer._root != self._root:
                raise kaitaistruct.ConsistencyError(u"footer", self._root, self._m_footer._root)
            if self._m_footer._parent != self:
                raise kaitaistruct.ConsistencyError(u"footer", self, self._m_footer._parent)

        self._dirty = False

    class Attachment(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Mcap.Attachment, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._should_write_crc32_input = False
            self.crc32_input__enabled = True

        def _read(self):
            self.log_time = self._io.read_u8le()
            self.create_time = self._io.read_u8le()
            self.name = Mcap.PrefixedStr(self._io, self, self._root)
            self.name._read()
            self.content_type = Mcap.PrefixedStr(self._io, self, self._root)
            self.content_type._read()
            self.len_data = self._io.read_u8le()
            self.data = self._io.read_bytes(self.len_data)
            if self.crc32_input_end >= 0:
                pass
                self.invoke_crc32_input_end = self._io.read_bytes(0)

            self.crc32 = self._io.read_u4le()
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.name._fetch_instances()
            self.content_type._fetch_instances()
            if self.crc32_input_end >= 0:
                pass

            _ = self.crc32_input
            if hasattr(self, '_m_crc32_input'):
                pass



        def _write__seq(self, io=None):
            super(Mcap.Attachment, self)._write__seq(io)
            self._should_write_crc32_input = self.crc32_input__enabled
            self._io.write_u8le(self.log_time)
            self._io.write_u8le(self.create_time)
            self.name._write__seq(self._io)
            self.content_type._write__seq(self._io)
            self._io.write_u8le(self.len_data)
            self._io.write_bytes(self.data)
            if self.crc32_input_end >= 0:
                pass
                if len(self.invoke_crc32_input_end) != 0:
                    raise kaitaistruct.ConsistencyError(u"invoke_crc32_input_end", 0, len(self.invoke_crc32_input_end))
                self._io.write_bytes(self.invoke_crc32_input_end)

            self._io.write_u4le(self.crc32)


        def _check(self):
            if self.name._root != self._root:
                raise kaitaistruct.ConsistencyError(u"name", self._root, self.name._root)
            if self.name._parent != self:
                raise kaitaistruct.ConsistencyError(u"name", self, self.name._parent)
            if self.content_type._root != self._root:
                raise kaitaistruct.ConsistencyError(u"content_type", self._root, self.content_type._root)
            if self.content_type._parent != self:
                raise kaitaistruct.ConsistencyError(u"content_type", self, self.content_type._parent)
            if len(self.data) != self.len_data:
                raise kaitaistruct.ConsistencyError(u"data", self.len_data, len(self.data))
            if self.crc32_input__enabled:
                pass

            self._dirty = False

        @property
        def crc32_input(self):
            if self._should_write_crc32_input:
                self._write_crc32_input()
            if hasattr(self, '_m_crc32_input'):
                return self._m_crc32_input

            if not self.crc32_input__enabled:
                return None

            _pos = self._io.pos()
            self._io.seek(0)
            self._m_crc32_input = self._io.read_bytes(self.crc32_input_end)
            self._io.seek(_pos)
            return getattr(self, '_m_crc32_input', None)

        @crc32_input.setter
        def crc32_input(self, v):
            self._dirty = True
            self._m_crc32_input = v

        def _write_crc32_input(self):
            self._should_write_crc32_input = False
            _pos = self._io.pos()
            self._io.seek(0)
            if len(self._m_crc32_input) != self.crc32_input_end:
                raise kaitaistruct.ConsistencyError(u"crc32_input", self.crc32_input_end, len(self._m_crc32_input))
            self._io.write_bytes(self._m_crc32_input)
            self._io.seek(_pos)

        @property
        def crc32_input_end(self):
            if hasattr(self, '_m_crc32_input_end'):
                return self._m_crc32_input_end

            self._m_crc32_input_end = self._io.pos()
            return getattr(self, '_m_crc32_input_end', None)

        def _invalidate_crc32_input_end(self):
            del self._m_crc32_input_end

    class AttachmentIndex(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Mcap.AttachmentIndex, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._should_write_attachment = False
            self.attachment__enabled = True

        def _read(self):
            self.ofs_attachment = self._io.read_u8le()
            self.len_attachment = self._io.read_u8le()
            self.log_time = self._io.read_u8le()
            self.create_time = self._io.read_u8le()
            self.data_size = self._io.read_u8le()
            self.name = Mcap.PrefixedStr(self._io, self, self._root)
            self.name._read()
            self.content_type = Mcap.PrefixedStr(self._io, self, self._root)
            self.content_type._read()
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.name._fetch_instances()
            self.content_type._fetch_instances()
            _ = self.attachment
            if hasattr(self, '_m_attachment'):
                pass
                self._m_attachment._fetch_instances()



        def _write__seq(self, io=None):
            super(Mcap.AttachmentIndex, self)._write__seq(io)
            self._should_write_attachment = self.attachment__enabled
            self._io.write_u8le(self.ofs_attachment)
            self._io.write_u8le(self.len_attachment)
            self._io.write_u8le(self.log_time)
            self._io.write_u8le(self.create_time)
            self._io.write_u8le(self.data_size)
            self.name._write__seq(self._io)
            self.content_type._write__seq(self._io)


        def _check(self):
            if self.name._root != self._root:
                raise kaitaistruct.ConsistencyError(u"name", self._root, self.name._root)
            if self.name._parent != self:
                raise kaitaistruct.ConsistencyError(u"name", self, self.name._parent)
            if self.content_type._root != self._root:
                raise kaitaistruct.ConsistencyError(u"content_type", self._root, self.content_type._root)
            if self.content_type._parent != self:
                raise kaitaistruct.ConsistencyError(u"content_type", self, self.content_type._parent)
            if self.attachment__enabled:
                pass
                if self._m_attachment._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"attachment", self._root, self._m_attachment._root)
                if self._m_attachment._parent != self:
                    raise kaitaistruct.ConsistencyError(u"attachment", self, self._m_attachment._parent)

            self._dirty = False

        @property
        def attachment(self):
            if self._should_write_attachment:
                self._write_attachment()
            if hasattr(self, '_m_attachment'):
                return self._m_attachment

            if not self.attachment__enabled:
                return None

            io = self._root._io
            _pos = io.pos()
            io.seek(self.ofs_attachment)
            self._raw__m_attachment = io.read_bytes(self.len_attachment)
            _io__raw__m_attachment = KaitaiStream(BytesIO(self._raw__m_attachment))
            self._m_attachment = Mcap.Record(_io__raw__m_attachment, self, self._root)
            self._m_attachment._read()
            io.seek(_pos)
            return getattr(self, '_m_attachment', None)

        @attachment.setter
        def attachment(self, v):
            self._dirty = True
            self._m_attachment = v

        def _write_attachment(self):
            self._should_write_attachment = False
            io = self._root._io
            _pos = io.pos()
            io.seek(self.ofs_attachment)
            _io__raw__m_attachment = KaitaiStream(BytesIO(bytearray(self.len_attachment)))
            io.add_child_stream(_io__raw__m_attachment)
            _pos2 = io.pos()
            io.seek(io.pos() + (self.len_attachment))
            def handler(parent, _io__raw__m_attachment=_io__raw__m_attachment):
                self._raw__m_attachment = _io__raw__m_attachment.to_byte_array()
                if len(self._raw__m_attachment) != self.len_attachment:
                    raise kaitaistruct.ConsistencyError(u"raw(attachment)", self.len_attachment, len(self._raw__m_attachment))
                parent.write_bytes(self._raw__m_attachment)
            _io__raw__m_attachment.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
            self._m_attachment._write__seq(_io__raw__m_attachment)
            io.seek(_pos)


    class Channel(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Mcap.Channel, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.id = self._io.read_u2le()
            self.schema_id = self._io.read_u2le()
            self.topic = Mcap.PrefixedStr(self._io, self, self._root)
            self.topic._read()
            self.message_encoding = Mcap.PrefixedStr(self._io, self, self._root)
            self.message_encoding._read()
            self.metadata = Mcap.MapStrStr(self._io, self, self._root)
            self.metadata._read()
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.topic._fetch_instances()
            self.message_encoding._fetch_instances()
            self.metadata._fetch_instances()


        def _write__seq(self, io=None):
            super(Mcap.Channel, self)._write__seq(io)
            self._io.write_u2le(self.id)
            self._io.write_u2le(self.schema_id)
            self.topic._write__seq(self._io)
            self.message_encoding._write__seq(self._io)
            self.metadata._write__seq(self._io)


        def _check(self):
            if self.topic._root != self._root:
                raise kaitaistruct.ConsistencyError(u"topic", self._root, self.topic._root)
            if self.topic._parent != self:
                raise kaitaistruct.ConsistencyError(u"topic", self, self.topic._parent)
            if self.message_encoding._root != self._root:
                raise kaitaistruct.ConsistencyError(u"message_encoding", self._root, self.message_encoding._root)
            if self.message_encoding._parent != self:
                raise kaitaistruct.ConsistencyError(u"message_encoding", self, self.message_encoding._parent)
            if self.metadata._root != self._root:
                raise kaitaistruct.ConsistencyError(u"metadata", self._root, self.metadata._root)
            if self.metadata._parent != self:
                raise kaitaistruct.ConsistencyError(u"metadata", self, self.metadata._parent)
            self._dirty = False


    class Chunk(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Mcap.Chunk, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.message_start_time = self._io.read_u8le()
            self.message_end_time = self._io.read_u8le()
            self.uncompressed_size = self._io.read_u8le()
            self.uncompressed_crc32 = self._io.read_u4le()
            self.compression = Mcap.PrefixedStr(self._io, self, self._root)
            self.compression._read()
            self.len_records = self._io.read_u8le()
            _on = self.compression.str
            if _on == u"":
                pass
                self._raw_records = self._io.read_bytes(self.len_records)
                _io__raw_records = KaitaiStream(BytesIO(self._raw_records))
                self.records = Mcap.Records(_io__raw_records, self, self._root)
                self.records._read()
            else:
                pass
                self.records = self._io.read_bytes(self.len_records)
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.compression._fetch_instances()
            _on = self.compression.str
            if _on == u"":
                pass
                self.records._fetch_instances()
            else:
                pass


        def _write__seq(self, io=None):
            super(Mcap.Chunk, self)._write__seq(io)
            self._io.write_u8le(self.message_start_time)
            self._io.write_u8le(self.message_end_time)
            self._io.write_u8le(self.uncompressed_size)
            self._io.write_u4le(self.uncompressed_crc32)
            self.compression._write__seq(self._io)
            self._io.write_u8le(self.len_records)
            _on = self.compression.str
            if _on == u"":
                pass
                _io__raw_records = KaitaiStream(BytesIO(bytearray(self.len_records)))
                self._io.add_child_stream(_io__raw_records)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.len_records))
                def handler(parent, _io__raw_records=_io__raw_records):
                    self._raw_records = _io__raw_records.to_byte_array()
                    if len(self._raw_records) != self.len_records:
                        raise kaitaistruct.ConsistencyError(u"raw(records)", self.len_records, len(self._raw_records))
                    parent.write_bytes(self._raw_records)
                _io__raw_records.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.records._write__seq(_io__raw_records)
            else:
                pass
                self._io.write_bytes(self.records)


        def _check(self):
            if self.compression._root != self._root:
                raise kaitaistruct.ConsistencyError(u"compression", self._root, self.compression._root)
            if self.compression._parent != self:
                raise kaitaistruct.ConsistencyError(u"compression", self, self.compression._parent)
            _on = self.compression.str
            if _on == u"":
                pass
                if self.records._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"records", self._root, self.records._root)
                if self.records._parent != self:
                    raise kaitaistruct.ConsistencyError(u"records", self, self.records._parent)
            else:
                pass
                if len(self.records) != self.len_records:
                    raise kaitaistruct.ConsistencyError(u"records", self.len_records, len(self.records))
            self._dirty = False


    class ChunkIndex(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Mcap.ChunkIndex, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._should_write_chunk = False
            self.chunk__enabled = True

        def _read(self):
            self.message_start_time = self._io.read_u8le()
            self.message_end_time = self._io.read_u8le()
            self.ofs_chunk = self._io.read_u8le()
            self.len_chunk = self._io.read_u8le()
            self.len_message_index_offsets = self._io.read_u4le()
            self._raw_message_index_offsets = self._io.read_bytes(self.len_message_index_offsets)
            _io__raw_message_index_offsets = KaitaiStream(BytesIO(self._raw_message_index_offsets))
            self.message_index_offsets = Mcap.ChunkIndex.MessageIndexOffsets(_io__raw_message_index_offsets, self, self._root)
            self.message_index_offsets._read()
            self.message_index_length = self._io.read_u8le()
            self.compression = Mcap.PrefixedStr(self._io, self, self._root)
            self.compression._read()
            self.compressed_size = self._io.read_u8le()
            self.uncompressed_size = self._io.read_u8le()
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.message_index_offsets._fetch_instances()
            self.compression._fetch_instances()
            _ = self.chunk
            if hasattr(self, '_m_chunk'):
                pass
                self._m_chunk._fetch_instances()



        def _write__seq(self, io=None):
            super(Mcap.ChunkIndex, self)._write__seq(io)
            self._should_write_chunk = self.chunk__enabled
            self._io.write_u8le(self.message_start_time)
            self._io.write_u8le(self.message_end_time)
            self._io.write_u8le(self.ofs_chunk)
            self._io.write_u8le(self.len_chunk)
            self._io.write_u4le(self.len_message_index_offsets)
            _io__raw_message_index_offsets = KaitaiStream(BytesIO(bytearray(self.len_message_index_offsets)))
            self._io.add_child_stream(_io__raw_message_index_offsets)
            _pos2 = self._io.pos()
            self._io.seek(self._io.pos() + (self.len_message_index_offsets))
            def handler(parent, _io__raw_message_index_offsets=_io__raw_message_index_offsets):
                self._raw_message_index_offsets = _io__raw_message_index_offsets.to_byte_array()
                if len(self._raw_message_index_offsets) != self.len_message_index_offsets:
                    raise kaitaistruct.ConsistencyError(u"raw(message_index_offsets)", self.len_message_index_offsets, len(self._raw_message_index_offsets))
                parent.write_bytes(self._raw_message_index_offsets)
            _io__raw_message_index_offsets.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
            self.message_index_offsets._write__seq(_io__raw_message_index_offsets)
            self._io.write_u8le(self.message_index_length)
            self.compression._write__seq(self._io)
            self._io.write_u8le(self.compressed_size)
            self._io.write_u8le(self.uncompressed_size)


        def _check(self):
            if self.message_index_offsets._root != self._root:
                raise kaitaistruct.ConsistencyError(u"message_index_offsets", self._root, self.message_index_offsets._root)
            if self.message_index_offsets._parent != self:
                raise kaitaistruct.ConsistencyError(u"message_index_offsets", self, self.message_index_offsets._parent)
            if self.compression._root != self._root:
                raise kaitaistruct.ConsistencyError(u"compression", self._root, self.compression._root)
            if self.compression._parent != self:
                raise kaitaistruct.ConsistencyError(u"compression", self, self.compression._parent)
            if self.chunk__enabled:
                pass
                if self._m_chunk._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"chunk", self._root, self._m_chunk._root)
                if self._m_chunk._parent != self:
                    raise kaitaistruct.ConsistencyError(u"chunk", self, self._m_chunk._parent)

            self._dirty = False

        class MessageIndexOffset(ReadWriteKaitaiStruct):
            def __init__(self, _io=None, _parent=None, _root=None):
                super(Mcap.ChunkIndex.MessageIndexOffset, self).__init__(_io)
                self._parent = _parent
                self._root = _root

            def _read(self):
                self.channel_id = self._io.read_u2le()
                self.offset = self._io.read_u8le()
                self._dirty = False


            def _fetch_instances(self):
                pass


            def _write__seq(self, io=None):
                super(Mcap.ChunkIndex.MessageIndexOffset, self)._write__seq(io)
                self._io.write_u2le(self.channel_id)
                self._io.write_u8le(self.offset)


            def _check(self):
                self._dirty = False


        class MessageIndexOffsets(ReadWriteKaitaiStruct):
            def __init__(self, _io=None, _parent=None, _root=None):
                super(Mcap.ChunkIndex.MessageIndexOffsets, self).__init__(_io)
                self._parent = _parent
                self._root = _root

            def _read(self):
                self.entries = []
                i = 0
                while not self._io.is_eof():
                    _t_entries = Mcap.ChunkIndex.MessageIndexOffset(self._io, self, self._root)
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
                super(Mcap.ChunkIndex.MessageIndexOffsets, self)._write__seq(io)
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
        def chunk(self):
            if self._should_write_chunk:
                self._write_chunk()
            if hasattr(self, '_m_chunk'):
                return self._m_chunk

            if not self.chunk__enabled:
                return None

            io = self._root._io
            _pos = io.pos()
            io.seek(self.ofs_chunk)
            self._raw__m_chunk = io.read_bytes(self.len_chunk)
            _io__raw__m_chunk = KaitaiStream(BytesIO(self._raw__m_chunk))
            self._m_chunk = Mcap.Record(_io__raw__m_chunk, self, self._root)
            self._m_chunk._read()
            io.seek(_pos)
            return getattr(self, '_m_chunk', None)

        @chunk.setter
        def chunk(self, v):
            self._dirty = True
            self._m_chunk = v

        def _write_chunk(self):
            self._should_write_chunk = False
            io = self._root._io
            _pos = io.pos()
            io.seek(self.ofs_chunk)
            _io__raw__m_chunk = KaitaiStream(BytesIO(bytearray(self.len_chunk)))
            io.add_child_stream(_io__raw__m_chunk)
            _pos2 = io.pos()
            io.seek(io.pos() + (self.len_chunk))
            def handler(parent, _io__raw__m_chunk=_io__raw__m_chunk):
                self._raw__m_chunk = _io__raw__m_chunk.to_byte_array()
                if len(self._raw__m_chunk) != self.len_chunk:
                    raise kaitaistruct.ConsistencyError(u"raw(chunk)", self.len_chunk, len(self._raw__m_chunk))
                parent.write_bytes(self._raw__m_chunk)
            _io__raw__m_chunk.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
            self._m_chunk._write__seq(_io__raw__m_chunk)
            io.seek(_pos)


    class DataEnd(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Mcap.DataEnd, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.data_section_crc32 = self._io.read_u4le()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(Mcap.DataEnd, self)._write__seq(io)
            self._io.write_u4le(self.data_section_crc32)


        def _check(self):
            self._dirty = False


    class Footer(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Mcap.Footer, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._should_write_summary_crc32_input = False
            self.summary_crc32_input__enabled = True
            self._should_write_summary_offset_section = False
            self.summary_offset_section__enabled = True
            self._should_write_summary_section = False
            self.summary_section__enabled = True

        def _read(self):
            self.ofs_summary_section = self._io.read_u8le()
            self.ofs_summary_offset_section = self._io.read_u8le()
            self.summary_crc32 = self._io.read_u4le()
            self._dirty = False


        def _fetch_instances(self):
            pass
            _ = self.summary_crc32_input
            if hasattr(self, '_m_summary_crc32_input'):
                pass

            _ = self.summary_offset_section
            if hasattr(self, '_m_summary_offset_section'):
                pass
                self._m_summary_offset_section._fetch_instances()

            _ = self.summary_section
            if hasattr(self, '_m_summary_section'):
                pass
                self._m_summary_section._fetch_instances()



        def _write__seq(self, io=None):
            super(Mcap.Footer, self)._write__seq(io)
            self._should_write_summary_crc32_input = self.summary_crc32_input__enabled
            self._should_write_summary_offset_section = self.summary_offset_section__enabled
            self._should_write_summary_section = self.summary_section__enabled
            self._io.write_u8le(self.ofs_summary_section)
            self._io.write_u8le(self.ofs_summary_offset_section)
            self._io.write_u4le(self.summary_crc32)


        def _check(self):
            if self.summary_crc32_input__enabled:
                pass

            if self.summary_offset_section__enabled:
                pass
                if self.ofs_summary_offset_section != 0:
                    pass
                    if self._m_summary_offset_section._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"summary_offset_section", self._root, self._m_summary_offset_section._root)
                    if self._m_summary_offset_section._parent != self:
                        raise kaitaistruct.ConsistencyError(u"summary_offset_section", self, self._m_summary_offset_section._parent)


            if self.summary_section__enabled:
                pass
                if self.ofs_summary_section != 0:
                    pass
                    if self._m_summary_section._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"summary_section", self._root, self._m_summary_section._root)
                    if self._m_summary_section._parent != self:
                        raise kaitaistruct.ConsistencyError(u"summary_section", self, self._m_summary_section._parent)


            self._dirty = False

        @property
        def ofs_summary_crc32_input(self):
            if hasattr(self, '_m_ofs_summary_crc32_input'):
                return self._m_ofs_summary_crc32_input

            self._m_ofs_summary_crc32_input = (self.ofs_summary_section if self.ofs_summary_section != 0 else self._root.ofs_footer)
            return getattr(self, '_m_ofs_summary_crc32_input', None)

        def _invalidate_ofs_summary_crc32_input(self):
            del self._m_ofs_summary_crc32_input
        @property
        def summary_crc32_input(self):
            if self._should_write_summary_crc32_input:
                self._write_summary_crc32_input()
            if hasattr(self, '_m_summary_crc32_input'):
                return self._m_summary_crc32_input

            if not self.summary_crc32_input__enabled:
                return None

            io = self._root._io
            _pos = io.pos()
            io.seek(self.ofs_summary_crc32_input)
            self._m_summary_crc32_input = io.read_bytes(((self._root._io.size() - self.ofs_summary_crc32_input) - 8) - 4)
            io.seek(_pos)
            return getattr(self, '_m_summary_crc32_input', None)

        @summary_crc32_input.setter
        def summary_crc32_input(self, v):
            self._dirty = True
            self._m_summary_crc32_input = v

        def _write_summary_crc32_input(self):
            self._should_write_summary_crc32_input = False
            io = self._root._io
            _pos = io.pos()
            io.seek(self.ofs_summary_crc32_input)
            if len(self._m_summary_crc32_input) != ((self._root._io.size() - self.ofs_summary_crc32_input) - 8) - 4:
                raise kaitaistruct.ConsistencyError(u"summary_crc32_input", ((self._root._io.size() - self.ofs_summary_crc32_input) - 8) - 4, len(self._m_summary_crc32_input))
            io.write_bytes(self._m_summary_crc32_input)
            io.seek(_pos)

        @property
        def summary_offset_section(self):
            if self._should_write_summary_offset_section:
                self._write_summary_offset_section()
            if hasattr(self, '_m_summary_offset_section'):
                return self._m_summary_offset_section

            if not self.summary_offset_section__enabled:
                return None

            if self.ofs_summary_offset_section != 0:
                pass
                io = self._root._io
                _pos = io.pos()
                io.seek(self.ofs_summary_offset_section)
                self._raw__m_summary_offset_section = io.read_bytes(self._root.ofs_footer - self.ofs_summary_offset_section)
                _io__raw__m_summary_offset_section = KaitaiStream(BytesIO(self._raw__m_summary_offset_section))
                self._m_summary_offset_section = Mcap.Records(_io__raw__m_summary_offset_section, self, self._root)
                self._m_summary_offset_section._read()
                io.seek(_pos)

            return getattr(self, '_m_summary_offset_section', None)

        @summary_offset_section.setter
        def summary_offset_section(self, v):
            self._dirty = True
            self._m_summary_offset_section = v

        def _write_summary_offset_section(self):
            self._should_write_summary_offset_section = False
            if self.ofs_summary_offset_section != 0:
                pass
                io = self._root._io
                _pos = io.pos()
                io.seek(self.ofs_summary_offset_section)
                _io__raw__m_summary_offset_section = KaitaiStream(BytesIO(bytearray(self._root.ofs_footer - self.ofs_summary_offset_section)))
                io.add_child_stream(_io__raw__m_summary_offset_section)
                _pos2 = io.pos()
                io.seek(io.pos() + (self._root.ofs_footer - self.ofs_summary_offset_section))
                def handler(parent, _io__raw__m_summary_offset_section=_io__raw__m_summary_offset_section):
                    self._raw__m_summary_offset_section = _io__raw__m_summary_offset_section.to_byte_array()
                    if len(self._raw__m_summary_offset_section) != self._root.ofs_footer - self.ofs_summary_offset_section:
                        raise kaitaistruct.ConsistencyError(u"raw(summary_offset_section)", self._root.ofs_footer - self.ofs_summary_offset_section, len(self._raw__m_summary_offset_section))
                    parent.write_bytes(self._raw__m_summary_offset_section)
                _io__raw__m_summary_offset_section.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self._m_summary_offset_section._write__seq(_io__raw__m_summary_offset_section)
                io.seek(_pos)


        @property
        def summary_section(self):
            if self._should_write_summary_section:
                self._write_summary_section()
            if hasattr(self, '_m_summary_section'):
                return self._m_summary_section

            if not self.summary_section__enabled:
                return None

            if self.ofs_summary_section != 0:
                pass
                io = self._root._io
                _pos = io.pos()
                io.seek(self.ofs_summary_section)
                self._raw__m_summary_section = io.read_bytes((self.ofs_summary_offset_section if self.ofs_summary_offset_section != 0 else self._root.ofs_footer) - self.ofs_summary_section)
                _io__raw__m_summary_section = KaitaiStream(BytesIO(self._raw__m_summary_section))
                self._m_summary_section = Mcap.Records(_io__raw__m_summary_section, self, self._root)
                self._m_summary_section._read()
                io.seek(_pos)

            return getattr(self, '_m_summary_section', None)

        @summary_section.setter
        def summary_section(self, v):
            self._dirty = True
            self._m_summary_section = v

        def _write_summary_section(self):
            self._should_write_summary_section = False
            if self.ofs_summary_section != 0:
                pass
                io = self._root._io
                _pos = io.pos()
                io.seek(self.ofs_summary_section)
                _io__raw__m_summary_section = KaitaiStream(BytesIO(bytearray((self.ofs_summary_offset_section if self.ofs_summary_offset_section != 0 else self._root.ofs_footer) - self.ofs_summary_section)))
                io.add_child_stream(_io__raw__m_summary_section)
                _pos2 = io.pos()
                io.seek(io.pos() + ((self.ofs_summary_offset_section if self.ofs_summary_offset_section != 0 else self._root.ofs_footer) - self.ofs_summary_section))
                def handler(parent, _io__raw__m_summary_section=_io__raw__m_summary_section):
                    self._raw__m_summary_section = _io__raw__m_summary_section.to_byte_array()
                    if len(self._raw__m_summary_section) != (self.ofs_summary_offset_section if self.ofs_summary_offset_section != 0 else self._root.ofs_footer) - self.ofs_summary_section:
                        raise kaitaistruct.ConsistencyError(u"raw(summary_section)", (self.ofs_summary_offset_section if self.ofs_summary_offset_section != 0 else self._root.ofs_footer) - self.ofs_summary_section, len(self._raw__m_summary_section))
                    parent.write_bytes(self._raw__m_summary_section)
                _io__raw__m_summary_section.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self._m_summary_section._write__seq(_io__raw__m_summary_section)
                io.seek(_pos)



    class Header(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Mcap.Header, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.profile = Mcap.PrefixedStr(self._io, self, self._root)
            self.profile._read()
            self.library = Mcap.PrefixedStr(self._io, self, self._root)
            self.library._read()
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.profile._fetch_instances()
            self.library._fetch_instances()


        def _write__seq(self, io=None):
            super(Mcap.Header, self)._write__seq(io)
            self.profile._write__seq(self._io)
            self.library._write__seq(self._io)


        def _check(self):
            if self.profile._root != self._root:
                raise kaitaistruct.ConsistencyError(u"profile", self._root, self.profile._root)
            if self.profile._parent != self:
                raise kaitaistruct.ConsistencyError(u"profile", self, self.profile._parent)
            if self.library._root != self._root:
                raise kaitaistruct.ConsistencyError(u"library", self._root, self.library._root)
            if self.library._parent != self:
                raise kaitaistruct.ConsistencyError(u"library", self, self.library._parent)
            self._dirty = False


    class Magic(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Mcap.Magic, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.magic = self._io.read_bytes(8)
            if not self.magic == b"\x89\x4D\x43\x41\x50\x30\x0D\x0A":
                raise kaitaistruct.ValidationNotEqualError(b"\x89\x4D\x43\x41\x50\x30\x0D\x0A", self.magic, self._io, u"/types/magic/seq/0")
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(Mcap.Magic, self)._write__seq(io)
            self._io.write_bytes(self.magic)


        def _check(self):
            if len(self.magic) != 8:
                raise kaitaistruct.ConsistencyError(u"magic", 8, len(self.magic))
            if not self.magic == b"\x89\x4D\x43\x41\x50\x30\x0D\x0A":
                raise kaitaistruct.ValidationNotEqualError(b"\x89\x4D\x43\x41\x50\x30\x0D\x0A", self.magic, None, u"/types/magic/seq/0")
            self._dirty = False


    class MapStrStr(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Mcap.MapStrStr, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.len_entries = self._io.read_u4le()
            self._raw_entries = self._io.read_bytes(self.len_entries)
            _io__raw_entries = KaitaiStream(BytesIO(self._raw_entries))
            self.entries = Mcap.MapStrStr.Entries(_io__raw_entries, self, self._root)
            self.entries._read()
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.entries._fetch_instances()


        def _write__seq(self, io=None):
            super(Mcap.MapStrStr, self)._write__seq(io)
            self._io.write_u4le(self.len_entries)
            _io__raw_entries = KaitaiStream(BytesIO(bytearray(self.len_entries)))
            self._io.add_child_stream(_io__raw_entries)
            _pos2 = self._io.pos()
            self._io.seek(self._io.pos() + (self.len_entries))
            def handler(parent, _io__raw_entries=_io__raw_entries):
                self._raw_entries = _io__raw_entries.to_byte_array()
                if len(self._raw_entries) != self.len_entries:
                    raise kaitaistruct.ConsistencyError(u"raw(entries)", self.len_entries, len(self._raw_entries))
                parent.write_bytes(self._raw_entries)
            _io__raw_entries.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
            self.entries._write__seq(_io__raw_entries)


        def _check(self):
            if self.entries._root != self._root:
                raise kaitaistruct.ConsistencyError(u"entries", self._root, self.entries._root)
            if self.entries._parent != self:
                raise kaitaistruct.ConsistencyError(u"entries", self, self.entries._parent)
            self._dirty = False

        class Entries(ReadWriteKaitaiStruct):
            def __init__(self, _io=None, _parent=None, _root=None):
                super(Mcap.MapStrStr.Entries, self).__init__(_io)
                self._parent = _parent
                self._root = _root

            def _read(self):
                self.entries = []
                i = 0
                while not self._io.is_eof():
                    _t_entries = Mcap.TupleStrStr(self._io, self, self._root)
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
                super(Mcap.MapStrStr.Entries, self)._write__seq(io)
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



    class Message(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Mcap.Message, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.channel_id = self._io.read_u2le()
            self.sequence = self._io.read_u4le()
            self.log_time = self._io.read_u8le()
            self.publish_time = self._io.read_u8le()
            self.data = self._io.read_bytes_full()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(Mcap.Message, self)._write__seq(io)
            self._io.write_u2le(self.channel_id)
            self._io.write_u4le(self.sequence)
            self._io.write_u8le(self.log_time)
            self._io.write_u8le(self.publish_time)
            self._io.write_bytes(self.data)
            if not self._io.is_eof():
                raise kaitaistruct.ConsistencyError(u"data", 0, self._io.size() - self._io.pos())


        def _check(self):
            self._dirty = False


    class MessageIndex(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Mcap.MessageIndex, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.channel_id = self._io.read_u2le()
            self.len_records = self._io.read_u4le()
            self._raw_records = self._io.read_bytes(self.len_records)
            _io__raw_records = KaitaiStream(BytesIO(self._raw_records))
            self.records = Mcap.MessageIndex.MessageIndexEntries(_io__raw_records, self, self._root)
            self.records._read()
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.records._fetch_instances()


        def _write__seq(self, io=None):
            super(Mcap.MessageIndex, self)._write__seq(io)
            self._io.write_u2le(self.channel_id)
            self._io.write_u4le(self.len_records)
            _io__raw_records = KaitaiStream(BytesIO(bytearray(self.len_records)))
            self._io.add_child_stream(_io__raw_records)
            _pos2 = self._io.pos()
            self._io.seek(self._io.pos() + (self.len_records))
            def handler(parent, _io__raw_records=_io__raw_records):
                self._raw_records = _io__raw_records.to_byte_array()
                if len(self._raw_records) != self.len_records:
                    raise kaitaistruct.ConsistencyError(u"raw(records)", self.len_records, len(self._raw_records))
                parent.write_bytes(self._raw_records)
            _io__raw_records.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
            self.records._write__seq(_io__raw_records)


        def _check(self):
            if self.records._root != self._root:
                raise kaitaistruct.ConsistencyError(u"records", self._root, self.records._root)
            if self.records._parent != self:
                raise kaitaistruct.ConsistencyError(u"records", self, self.records._parent)
            self._dirty = False

        class MessageIndexEntries(ReadWriteKaitaiStruct):
            def __init__(self, _io=None, _parent=None, _root=None):
                super(Mcap.MessageIndex.MessageIndexEntries, self).__init__(_io)
                self._parent = _parent
                self._root = _root

            def _read(self):
                self.entries = []
                i = 0
                while not self._io.is_eof():
                    _t_entries = Mcap.MessageIndex.MessageIndexEntry(self._io, self, self._root)
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
                super(Mcap.MessageIndex.MessageIndexEntries, self)._write__seq(io)
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


        class MessageIndexEntry(ReadWriteKaitaiStruct):
            def __init__(self, _io=None, _parent=None, _root=None):
                super(Mcap.MessageIndex.MessageIndexEntry, self).__init__(_io)
                self._parent = _parent
                self._root = _root

            def _read(self):
                self.log_time = self._io.read_u8le()
                self.offset = self._io.read_u8le()
                self._dirty = False


            def _fetch_instances(self):
                pass


            def _write__seq(self, io=None):
                super(Mcap.MessageIndex.MessageIndexEntry, self)._write__seq(io)
                self._io.write_u8le(self.log_time)
                self._io.write_u8le(self.offset)


            def _check(self):
                self._dirty = False



    class Metadata(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Mcap.Metadata, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.name = Mcap.PrefixedStr(self._io, self, self._root)
            self.name._read()
            self.metadata = Mcap.MapStrStr(self._io, self, self._root)
            self.metadata._read()
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.name._fetch_instances()
            self.metadata._fetch_instances()


        def _write__seq(self, io=None):
            super(Mcap.Metadata, self)._write__seq(io)
            self.name._write__seq(self._io)
            self.metadata._write__seq(self._io)


        def _check(self):
            if self.name._root != self._root:
                raise kaitaistruct.ConsistencyError(u"name", self._root, self.name._root)
            if self.name._parent != self:
                raise kaitaistruct.ConsistencyError(u"name", self, self.name._parent)
            if self.metadata._root != self._root:
                raise kaitaistruct.ConsistencyError(u"metadata", self._root, self.metadata._root)
            if self.metadata._parent != self:
                raise kaitaistruct.ConsistencyError(u"metadata", self, self.metadata._parent)
            self._dirty = False


    class MetadataIndex(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Mcap.MetadataIndex, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._should_write_metadata = False
            self.metadata__enabled = True

        def _read(self):
            self.ofs_metadata = self._io.read_u8le()
            self.len_metadata = self._io.read_u8le()
            self.name = Mcap.PrefixedStr(self._io, self, self._root)
            self.name._read()
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.name._fetch_instances()
            _ = self.metadata
            if hasattr(self, '_m_metadata'):
                pass
                self._m_metadata._fetch_instances()



        def _write__seq(self, io=None):
            super(Mcap.MetadataIndex, self)._write__seq(io)
            self._should_write_metadata = self.metadata__enabled
            self._io.write_u8le(self.ofs_metadata)
            self._io.write_u8le(self.len_metadata)
            self.name._write__seq(self._io)


        def _check(self):
            if self.name._root != self._root:
                raise kaitaistruct.ConsistencyError(u"name", self._root, self.name._root)
            if self.name._parent != self:
                raise kaitaistruct.ConsistencyError(u"name", self, self.name._parent)
            if self.metadata__enabled:
                pass
                if self._m_metadata._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"metadata", self._root, self._m_metadata._root)
                if self._m_metadata._parent != self:
                    raise kaitaistruct.ConsistencyError(u"metadata", self, self._m_metadata._parent)

            self._dirty = False

        @property
        def metadata(self):
            if self._should_write_metadata:
                self._write_metadata()
            if hasattr(self, '_m_metadata'):
                return self._m_metadata

            if not self.metadata__enabled:
                return None

            io = self._root._io
            _pos = io.pos()
            io.seek(self.ofs_metadata)
            self._raw__m_metadata = io.read_bytes(self.len_metadata)
            _io__raw__m_metadata = KaitaiStream(BytesIO(self._raw__m_metadata))
            self._m_metadata = Mcap.Record(_io__raw__m_metadata, self, self._root)
            self._m_metadata._read()
            io.seek(_pos)
            return getattr(self, '_m_metadata', None)

        @metadata.setter
        def metadata(self, v):
            self._dirty = True
            self._m_metadata = v

        def _write_metadata(self):
            self._should_write_metadata = False
            io = self._root._io
            _pos = io.pos()
            io.seek(self.ofs_metadata)
            _io__raw__m_metadata = KaitaiStream(BytesIO(bytearray(self.len_metadata)))
            io.add_child_stream(_io__raw__m_metadata)
            _pos2 = io.pos()
            io.seek(io.pos() + (self.len_metadata))
            def handler(parent, _io__raw__m_metadata=_io__raw__m_metadata):
                self._raw__m_metadata = _io__raw__m_metadata.to_byte_array()
                if len(self._raw__m_metadata) != self.len_metadata:
                    raise kaitaistruct.ConsistencyError(u"raw(metadata)", self.len_metadata, len(self._raw__m_metadata))
                parent.write_bytes(self._raw__m_metadata)
            _io__raw__m_metadata.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
            self._m_metadata._write__seq(_io__raw__m_metadata)
            io.seek(_pos)


    class PrefixedStr(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Mcap.PrefixedStr, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.len_str = self._io.read_u4le()
            self.str = (self._io.read_bytes(self.len_str)).decode(u"UTF-8")
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(Mcap.PrefixedStr, self)._write__seq(io)
            self._io.write_u4le(self.len_str)
            self._io.write_bytes((self.str).encode(u"UTF-8"))


        def _check(self):
            if len((self.str).encode(u"UTF-8")) != self.len_str:
                raise kaitaistruct.ConsistencyError(u"str", self.len_str, len((self.str).encode(u"UTF-8")))
            self._dirty = False


    class Record(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Mcap.Record, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.op = KaitaiStream.resolve_enum(Mcap.Opcode, self._io.read_u1())
            self.len_body = self._io.read_u8le()
            _on = self.op
            if _on == Mcap.Opcode.attachment:
                pass
                self._raw_body = self._io.read_bytes(self.len_body)
                _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                self.body = Mcap.Attachment(_io__raw_body, self, self._root)
                self.body._read()
            elif _on == Mcap.Opcode.attachment_index:
                pass
                self._raw_body = self._io.read_bytes(self.len_body)
                _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                self.body = Mcap.AttachmentIndex(_io__raw_body, self, self._root)
                self.body._read()
            elif _on == Mcap.Opcode.channel:
                pass
                self._raw_body = self._io.read_bytes(self.len_body)
                _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                self.body = Mcap.Channel(_io__raw_body, self, self._root)
                self.body._read()
            elif _on == Mcap.Opcode.chunk:
                pass
                self._raw_body = self._io.read_bytes(self.len_body)
                _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                self.body = Mcap.Chunk(_io__raw_body, self, self._root)
                self.body._read()
            elif _on == Mcap.Opcode.chunk_index:
                pass
                self._raw_body = self._io.read_bytes(self.len_body)
                _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                self.body = Mcap.ChunkIndex(_io__raw_body, self, self._root)
                self.body._read()
            elif _on == Mcap.Opcode.data_end:
                pass
                self._raw_body = self._io.read_bytes(self.len_body)
                _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                self.body = Mcap.DataEnd(_io__raw_body, self, self._root)
                self.body._read()
            elif _on == Mcap.Opcode.footer:
                pass
                self._raw_body = self._io.read_bytes(self.len_body)
                _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                self.body = Mcap.Footer(_io__raw_body, self, self._root)
                self.body._read()
            elif _on == Mcap.Opcode.header:
                pass
                self._raw_body = self._io.read_bytes(self.len_body)
                _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                self.body = Mcap.Header(_io__raw_body, self, self._root)
                self.body._read()
            elif _on == Mcap.Opcode.message:
                pass
                self._raw_body = self._io.read_bytes(self.len_body)
                _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                self.body = Mcap.Message(_io__raw_body, self, self._root)
                self.body._read()
            elif _on == Mcap.Opcode.message_index:
                pass
                self._raw_body = self._io.read_bytes(self.len_body)
                _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                self.body = Mcap.MessageIndex(_io__raw_body, self, self._root)
                self.body._read()
            elif _on == Mcap.Opcode.metadata:
                pass
                self._raw_body = self._io.read_bytes(self.len_body)
                _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                self.body = Mcap.Metadata(_io__raw_body, self, self._root)
                self.body._read()
            elif _on == Mcap.Opcode.metadata_index:
                pass
                self._raw_body = self._io.read_bytes(self.len_body)
                _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                self.body = Mcap.MetadataIndex(_io__raw_body, self, self._root)
                self.body._read()
            elif _on == Mcap.Opcode.schema:
                pass
                self._raw_body = self._io.read_bytes(self.len_body)
                _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                self.body = Mcap.Schema(_io__raw_body, self, self._root)
                self.body._read()
            elif _on == Mcap.Opcode.statistics:
                pass
                self._raw_body = self._io.read_bytes(self.len_body)
                _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                self.body = Mcap.Statistics(_io__raw_body, self, self._root)
                self.body._read()
            elif _on == Mcap.Opcode.summary_offset:
                pass
                self._raw_body = self._io.read_bytes(self.len_body)
                _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                self.body = Mcap.SummaryOffset(_io__raw_body, self, self._root)
                self.body._read()
            else:
                pass
                self.body = self._io.read_bytes(self.len_body)
            self._dirty = False


        def _fetch_instances(self):
            pass
            _on = self.op
            if _on == Mcap.Opcode.attachment:
                pass
                self.body._fetch_instances()
            elif _on == Mcap.Opcode.attachment_index:
                pass
                self.body._fetch_instances()
            elif _on == Mcap.Opcode.channel:
                pass
                self.body._fetch_instances()
            elif _on == Mcap.Opcode.chunk:
                pass
                self.body._fetch_instances()
            elif _on == Mcap.Opcode.chunk_index:
                pass
                self.body._fetch_instances()
            elif _on == Mcap.Opcode.data_end:
                pass
                self.body._fetch_instances()
            elif _on == Mcap.Opcode.footer:
                pass
                self.body._fetch_instances()
            elif _on == Mcap.Opcode.header:
                pass
                self.body._fetch_instances()
            elif _on == Mcap.Opcode.message:
                pass
                self.body._fetch_instances()
            elif _on == Mcap.Opcode.message_index:
                pass
                self.body._fetch_instances()
            elif _on == Mcap.Opcode.metadata:
                pass
                self.body._fetch_instances()
            elif _on == Mcap.Opcode.metadata_index:
                pass
                self.body._fetch_instances()
            elif _on == Mcap.Opcode.schema:
                pass
                self.body._fetch_instances()
            elif _on == Mcap.Opcode.statistics:
                pass
                self.body._fetch_instances()
            elif _on == Mcap.Opcode.summary_offset:
                pass
                self.body._fetch_instances()
            else:
                pass


        def _write__seq(self, io=None):
            super(Mcap.Record, self)._write__seq(io)
            self._io.write_u1(int(self.op))
            self._io.write_u8le(self.len_body)
            _on = self.op
            if _on == Mcap.Opcode.attachment:
                pass
                _io__raw_body = KaitaiStream(BytesIO(bytearray(self.len_body)))
                self._io.add_child_stream(_io__raw_body)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.len_body))
                def handler(parent, _io__raw_body=_io__raw_body):
                    self._raw_body = _io__raw_body.to_byte_array()
                    if len(self._raw_body) != self.len_body:
                        raise kaitaistruct.ConsistencyError(u"raw(body)", self.len_body, len(self._raw_body))
                    parent.write_bytes(self._raw_body)
                _io__raw_body.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.body._write__seq(_io__raw_body)
            elif _on == Mcap.Opcode.attachment_index:
                pass
                _io__raw_body = KaitaiStream(BytesIO(bytearray(self.len_body)))
                self._io.add_child_stream(_io__raw_body)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.len_body))
                def handler(parent, _io__raw_body=_io__raw_body):
                    self._raw_body = _io__raw_body.to_byte_array()
                    if len(self._raw_body) != self.len_body:
                        raise kaitaistruct.ConsistencyError(u"raw(body)", self.len_body, len(self._raw_body))
                    parent.write_bytes(self._raw_body)
                _io__raw_body.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.body._write__seq(_io__raw_body)
            elif _on == Mcap.Opcode.channel:
                pass
                _io__raw_body = KaitaiStream(BytesIO(bytearray(self.len_body)))
                self._io.add_child_stream(_io__raw_body)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.len_body))
                def handler(parent, _io__raw_body=_io__raw_body):
                    self._raw_body = _io__raw_body.to_byte_array()
                    if len(self._raw_body) != self.len_body:
                        raise kaitaistruct.ConsistencyError(u"raw(body)", self.len_body, len(self._raw_body))
                    parent.write_bytes(self._raw_body)
                _io__raw_body.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.body._write__seq(_io__raw_body)
            elif _on == Mcap.Opcode.chunk:
                pass
                _io__raw_body = KaitaiStream(BytesIO(bytearray(self.len_body)))
                self._io.add_child_stream(_io__raw_body)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.len_body))
                def handler(parent, _io__raw_body=_io__raw_body):
                    self._raw_body = _io__raw_body.to_byte_array()
                    if len(self._raw_body) != self.len_body:
                        raise kaitaistruct.ConsistencyError(u"raw(body)", self.len_body, len(self._raw_body))
                    parent.write_bytes(self._raw_body)
                _io__raw_body.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.body._write__seq(_io__raw_body)
            elif _on == Mcap.Opcode.chunk_index:
                pass
                _io__raw_body = KaitaiStream(BytesIO(bytearray(self.len_body)))
                self._io.add_child_stream(_io__raw_body)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.len_body))
                def handler(parent, _io__raw_body=_io__raw_body):
                    self._raw_body = _io__raw_body.to_byte_array()
                    if len(self._raw_body) != self.len_body:
                        raise kaitaistruct.ConsistencyError(u"raw(body)", self.len_body, len(self._raw_body))
                    parent.write_bytes(self._raw_body)
                _io__raw_body.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.body._write__seq(_io__raw_body)
            elif _on == Mcap.Opcode.data_end:
                pass
                _io__raw_body = KaitaiStream(BytesIO(bytearray(self.len_body)))
                self._io.add_child_stream(_io__raw_body)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.len_body))
                def handler(parent, _io__raw_body=_io__raw_body):
                    self._raw_body = _io__raw_body.to_byte_array()
                    if len(self._raw_body) != self.len_body:
                        raise kaitaistruct.ConsistencyError(u"raw(body)", self.len_body, len(self._raw_body))
                    parent.write_bytes(self._raw_body)
                _io__raw_body.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.body._write__seq(_io__raw_body)
            elif _on == Mcap.Opcode.footer:
                pass
                _io__raw_body = KaitaiStream(BytesIO(bytearray(self.len_body)))
                self._io.add_child_stream(_io__raw_body)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.len_body))
                def handler(parent, _io__raw_body=_io__raw_body):
                    self._raw_body = _io__raw_body.to_byte_array()
                    if len(self._raw_body) != self.len_body:
                        raise kaitaistruct.ConsistencyError(u"raw(body)", self.len_body, len(self._raw_body))
                    parent.write_bytes(self._raw_body)
                _io__raw_body.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.body._write__seq(_io__raw_body)
            elif _on == Mcap.Opcode.header:
                pass
                _io__raw_body = KaitaiStream(BytesIO(bytearray(self.len_body)))
                self._io.add_child_stream(_io__raw_body)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.len_body))
                def handler(parent, _io__raw_body=_io__raw_body):
                    self._raw_body = _io__raw_body.to_byte_array()
                    if len(self._raw_body) != self.len_body:
                        raise kaitaistruct.ConsistencyError(u"raw(body)", self.len_body, len(self._raw_body))
                    parent.write_bytes(self._raw_body)
                _io__raw_body.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.body._write__seq(_io__raw_body)
            elif _on == Mcap.Opcode.message:
                pass
                _io__raw_body = KaitaiStream(BytesIO(bytearray(self.len_body)))
                self._io.add_child_stream(_io__raw_body)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.len_body))
                def handler(parent, _io__raw_body=_io__raw_body):
                    self._raw_body = _io__raw_body.to_byte_array()
                    if len(self._raw_body) != self.len_body:
                        raise kaitaistruct.ConsistencyError(u"raw(body)", self.len_body, len(self._raw_body))
                    parent.write_bytes(self._raw_body)
                _io__raw_body.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.body._write__seq(_io__raw_body)
            elif _on == Mcap.Opcode.message_index:
                pass
                _io__raw_body = KaitaiStream(BytesIO(bytearray(self.len_body)))
                self._io.add_child_stream(_io__raw_body)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.len_body))
                def handler(parent, _io__raw_body=_io__raw_body):
                    self._raw_body = _io__raw_body.to_byte_array()
                    if len(self._raw_body) != self.len_body:
                        raise kaitaistruct.ConsistencyError(u"raw(body)", self.len_body, len(self._raw_body))
                    parent.write_bytes(self._raw_body)
                _io__raw_body.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.body._write__seq(_io__raw_body)
            elif _on == Mcap.Opcode.metadata:
                pass
                _io__raw_body = KaitaiStream(BytesIO(bytearray(self.len_body)))
                self._io.add_child_stream(_io__raw_body)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.len_body))
                def handler(parent, _io__raw_body=_io__raw_body):
                    self._raw_body = _io__raw_body.to_byte_array()
                    if len(self._raw_body) != self.len_body:
                        raise kaitaistruct.ConsistencyError(u"raw(body)", self.len_body, len(self._raw_body))
                    parent.write_bytes(self._raw_body)
                _io__raw_body.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.body._write__seq(_io__raw_body)
            elif _on == Mcap.Opcode.metadata_index:
                pass
                _io__raw_body = KaitaiStream(BytesIO(bytearray(self.len_body)))
                self._io.add_child_stream(_io__raw_body)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.len_body))
                def handler(parent, _io__raw_body=_io__raw_body):
                    self._raw_body = _io__raw_body.to_byte_array()
                    if len(self._raw_body) != self.len_body:
                        raise kaitaistruct.ConsistencyError(u"raw(body)", self.len_body, len(self._raw_body))
                    parent.write_bytes(self._raw_body)
                _io__raw_body.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.body._write__seq(_io__raw_body)
            elif _on == Mcap.Opcode.schema:
                pass
                _io__raw_body = KaitaiStream(BytesIO(bytearray(self.len_body)))
                self._io.add_child_stream(_io__raw_body)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.len_body))
                def handler(parent, _io__raw_body=_io__raw_body):
                    self._raw_body = _io__raw_body.to_byte_array()
                    if len(self._raw_body) != self.len_body:
                        raise kaitaistruct.ConsistencyError(u"raw(body)", self.len_body, len(self._raw_body))
                    parent.write_bytes(self._raw_body)
                _io__raw_body.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.body._write__seq(_io__raw_body)
            elif _on == Mcap.Opcode.statistics:
                pass
                _io__raw_body = KaitaiStream(BytesIO(bytearray(self.len_body)))
                self._io.add_child_stream(_io__raw_body)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.len_body))
                def handler(parent, _io__raw_body=_io__raw_body):
                    self._raw_body = _io__raw_body.to_byte_array()
                    if len(self._raw_body) != self.len_body:
                        raise kaitaistruct.ConsistencyError(u"raw(body)", self.len_body, len(self._raw_body))
                    parent.write_bytes(self._raw_body)
                _io__raw_body.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.body._write__seq(_io__raw_body)
            elif _on == Mcap.Opcode.summary_offset:
                pass
                _io__raw_body = KaitaiStream(BytesIO(bytearray(self.len_body)))
                self._io.add_child_stream(_io__raw_body)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.len_body))
                def handler(parent, _io__raw_body=_io__raw_body):
                    self._raw_body = _io__raw_body.to_byte_array()
                    if len(self._raw_body) != self.len_body:
                        raise kaitaistruct.ConsistencyError(u"raw(body)", self.len_body, len(self._raw_body))
                    parent.write_bytes(self._raw_body)
                _io__raw_body.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.body._write__seq(_io__raw_body)
            else:
                pass
                self._io.write_bytes(self.body)


        def _check(self):
            _on = self.op
            if _on == Mcap.Opcode.attachment:
                pass
                if self.body._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"body", self._root, self.body._root)
                if self.body._parent != self:
                    raise kaitaistruct.ConsistencyError(u"body", self, self.body._parent)
            elif _on == Mcap.Opcode.attachment_index:
                pass
                if self.body._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"body", self._root, self.body._root)
                if self.body._parent != self:
                    raise kaitaistruct.ConsistencyError(u"body", self, self.body._parent)
            elif _on == Mcap.Opcode.channel:
                pass
                if self.body._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"body", self._root, self.body._root)
                if self.body._parent != self:
                    raise kaitaistruct.ConsistencyError(u"body", self, self.body._parent)
            elif _on == Mcap.Opcode.chunk:
                pass
                if self.body._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"body", self._root, self.body._root)
                if self.body._parent != self:
                    raise kaitaistruct.ConsistencyError(u"body", self, self.body._parent)
            elif _on == Mcap.Opcode.chunk_index:
                pass
                if self.body._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"body", self._root, self.body._root)
                if self.body._parent != self:
                    raise kaitaistruct.ConsistencyError(u"body", self, self.body._parent)
            elif _on == Mcap.Opcode.data_end:
                pass
                if self.body._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"body", self._root, self.body._root)
                if self.body._parent != self:
                    raise kaitaistruct.ConsistencyError(u"body", self, self.body._parent)
            elif _on == Mcap.Opcode.footer:
                pass
                if self.body._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"body", self._root, self.body._root)
                if self.body._parent != self:
                    raise kaitaistruct.ConsistencyError(u"body", self, self.body._parent)
            elif _on == Mcap.Opcode.header:
                pass
                if self.body._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"body", self._root, self.body._root)
                if self.body._parent != self:
                    raise kaitaistruct.ConsistencyError(u"body", self, self.body._parent)
            elif _on == Mcap.Opcode.message:
                pass
                if self.body._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"body", self._root, self.body._root)
                if self.body._parent != self:
                    raise kaitaistruct.ConsistencyError(u"body", self, self.body._parent)
            elif _on == Mcap.Opcode.message_index:
                pass
                if self.body._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"body", self._root, self.body._root)
                if self.body._parent != self:
                    raise kaitaistruct.ConsistencyError(u"body", self, self.body._parent)
            elif _on == Mcap.Opcode.metadata:
                pass
                if self.body._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"body", self._root, self.body._root)
                if self.body._parent != self:
                    raise kaitaistruct.ConsistencyError(u"body", self, self.body._parent)
            elif _on == Mcap.Opcode.metadata_index:
                pass
                if self.body._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"body", self._root, self.body._root)
                if self.body._parent != self:
                    raise kaitaistruct.ConsistencyError(u"body", self, self.body._parent)
            elif _on == Mcap.Opcode.schema:
                pass
                if self.body._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"body", self._root, self.body._root)
                if self.body._parent != self:
                    raise kaitaistruct.ConsistencyError(u"body", self, self.body._parent)
            elif _on == Mcap.Opcode.statistics:
                pass
                if self.body._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"body", self._root, self.body._root)
                if self.body._parent != self:
                    raise kaitaistruct.ConsistencyError(u"body", self, self.body._parent)
            elif _on == Mcap.Opcode.summary_offset:
                pass
                if self.body._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"body", self._root, self.body._root)
                if self.body._parent != self:
                    raise kaitaistruct.ConsistencyError(u"body", self, self.body._parent)
            else:
                pass
                if len(self.body) != self.len_body:
                    raise kaitaistruct.ConsistencyError(u"body", self.len_body, len(self.body))
            self._dirty = False


    class Records(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Mcap.Records, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.records = []
            i = 0
            while not self._io.is_eof():
                _t_records = Mcap.Record(self._io, self, self._root)
                try:
                    _t_records._read()
                finally:
                    self.records.append(_t_records)
                i += 1

            self._dirty = False


        def _fetch_instances(self):
            pass
            for i in range(len(self.records)):
                pass
                self.records[i]._fetch_instances()



        def _write__seq(self, io=None):
            super(Mcap.Records, self)._write__seq(io)
            for i in range(len(self.records)):
                pass
                if self._io.is_eof():
                    raise kaitaistruct.ConsistencyError(u"records", 0, self._io.size() - self._io.pos())
                self.records[i]._write__seq(self._io)

            if not self._io.is_eof():
                raise kaitaistruct.ConsistencyError(u"records", 0, self._io.size() - self._io.pos())


        def _check(self):
            for i in range(len(self.records)):
                pass
                if self.records[i]._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"records", self._root, self.records[i]._root)
                if self.records[i]._parent != self:
                    raise kaitaistruct.ConsistencyError(u"records", self, self.records[i]._parent)

            self._dirty = False


    class Schema(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Mcap.Schema, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.id = self._io.read_u2le()
            self.name = Mcap.PrefixedStr(self._io, self, self._root)
            self.name._read()
            self.encoding = Mcap.PrefixedStr(self._io, self, self._root)
            self.encoding._read()
            self.len_data = self._io.read_u4le()
            self.data = self._io.read_bytes(self.len_data)
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.name._fetch_instances()
            self.encoding._fetch_instances()


        def _write__seq(self, io=None):
            super(Mcap.Schema, self)._write__seq(io)
            self._io.write_u2le(self.id)
            self.name._write__seq(self._io)
            self.encoding._write__seq(self._io)
            self._io.write_u4le(self.len_data)
            self._io.write_bytes(self.data)


        def _check(self):
            if self.name._root != self._root:
                raise kaitaistruct.ConsistencyError(u"name", self._root, self.name._root)
            if self.name._parent != self:
                raise kaitaistruct.ConsistencyError(u"name", self, self.name._parent)
            if self.encoding._root != self._root:
                raise kaitaistruct.ConsistencyError(u"encoding", self._root, self.encoding._root)
            if self.encoding._parent != self:
                raise kaitaistruct.ConsistencyError(u"encoding", self, self.encoding._parent)
            if len(self.data) != self.len_data:
                raise kaitaistruct.ConsistencyError(u"data", self.len_data, len(self.data))
            self._dirty = False


    class Statistics(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Mcap.Statistics, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.message_count = self._io.read_u8le()
            self.schema_count = self._io.read_u2le()
            self.channel_count = self._io.read_u4le()
            self.attachment_count = self._io.read_u4le()
            self.metadata_count = self._io.read_u4le()
            self.chunk_count = self._io.read_u4le()
            self.message_start_time = self._io.read_u8le()
            self.message_end_time = self._io.read_u8le()
            self.len_channel_message_counts = self._io.read_u4le()
            self._raw_channel_message_counts = self._io.read_bytes(self.len_channel_message_counts)
            _io__raw_channel_message_counts = KaitaiStream(BytesIO(self._raw_channel_message_counts))
            self.channel_message_counts = Mcap.Statistics.ChannelMessageCounts(_io__raw_channel_message_counts, self, self._root)
            self.channel_message_counts._read()
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.channel_message_counts._fetch_instances()


        def _write__seq(self, io=None):
            super(Mcap.Statistics, self)._write__seq(io)
            self._io.write_u8le(self.message_count)
            self._io.write_u2le(self.schema_count)
            self._io.write_u4le(self.channel_count)
            self._io.write_u4le(self.attachment_count)
            self._io.write_u4le(self.metadata_count)
            self._io.write_u4le(self.chunk_count)
            self._io.write_u8le(self.message_start_time)
            self._io.write_u8le(self.message_end_time)
            self._io.write_u4le(self.len_channel_message_counts)
            _io__raw_channel_message_counts = KaitaiStream(BytesIO(bytearray(self.len_channel_message_counts)))
            self._io.add_child_stream(_io__raw_channel_message_counts)
            _pos2 = self._io.pos()
            self._io.seek(self._io.pos() + (self.len_channel_message_counts))
            def handler(parent, _io__raw_channel_message_counts=_io__raw_channel_message_counts):
                self._raw_channel_message_counts = _io__raw_channel_message_counts.to_byte_array()
                if len(self._raw_channel_message_counts) != self.len_channel_message_counts:
                    raise kaitaistruct.ConsistencyError(u"raw(channel_message_counts)", self.len_channel_message_counts, len(self._raw_channel_message_counts))
                parent.write_bytes(self._raw_channel_message_counts)
            _io__raw_channel_message_counts.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
            self.channel_message_counts._write__seq(_io__raw_channel_message_counts)


        def _check(self):
            if self.channel_message_counts._root != self._root:
                raise kaitaistruct.ConsistencyError(u"channel_message_counts", self._root, self.channel_message_counts._root)
            if self.channel_message_counts._parent != self:
                raise kaitaistruct.ConsistencyError(u"channel_message_counts", self, self.channel_message_counts._parent)
            self._dirty = False

        class ChannelMessageCount(ReadWriteKaitaiStruct):
            def __init__(self, _io=None, _parent=None, _root=None):
                super(Mcap.Statistics.ChannelMessageCount, self).__init__(_io)
                self._parent = _parent
                self._root = _root

            def _read(self):
                self.channel_id = self._io.read_u2le()
                self.message_count = self._io.read_u8le()
                self._dirty = False


            def _fetch_instances(self):
                pass


            def _write__seq(self, io=None):
                super(Mcap.Statistics.ChannelMessageCount, self)._write__seq(io)
                self._io.write_u2le(self.channel_id)
                self._io.write_u8le(self.message_count)


            def _check(self):
                self._dirty = False


        class ChannelMessageCounts(ReadWriteKaitaiStruct):
            def __init__(self, _io=None, _parent=None, _root=None):
                super(Mcap.Statistics.ChannelMessageCounts, self).__init__(_io)
                self._parent = _parent
                self._root = _root

            def _read(self):
                self.entries = []
                i = 0
                while not self._io.is_eof():
                    _t_entries = Mcap.Statistics.ChannelMessageCount(self._io, self, self._root)
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
                super(Mcap.Statistics.ChannelMessageCounts, self)._write__seq(io)
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



    class SummaryOffset(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Mcap.SummaryOffset, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._should_write_group = False
            self.group__enabled = True

        def _read(self):
            self.group_opcode = KaitaiStream.resolve_enum(Mcap.Opcode, self._io.read_u1())
            self.ofs_group = self._io.read_u8le()
            self.len_group = self._io.read_u8le()
            self._dirty = False


        def _fetch_instances(self):
            pass
            _ = self.group
            if hasattr(self, '_m_group'):
                pass
                self._m_group._fetch_instances()



        def _write__seq(self, io=None):
            super(Mcap.SummaryOffset, self)._write__seq(io)
            self._should_write_group = self.group__enabled
            self._io.write_u1(int(self.group_opcode))
            self._io.write_u8le(self.ofs_group)
            self._io.write_u8le(self.len_group)


        def _check(self):
            if self.group__enabled:
                pass
                if self._m_group._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"group", self._root, self._m_group._root)
                if self._m_group._parent != self:
                    raise kaitaistruct.ConsistencyError(u"group", self, self._m_group._parent)

            self._dirty = False

        @property
        def group(self):
            if self._should_write_group:
                self._write_group()
            if hasattr(self, '_m_group'):
                return self._m_group

            if not self.group__enabled:
                return None

            io = self._root._io
            _pos = io.pos()
            io.seek(self.ofs_group)
            self._raw__m_group = io.read_bytes(self.len_group)
            _io__raw__m_group = KaitaiStream(BytesIO(self._raw__m_group))
            self._m_group = Mcap.Records(_io__raw__m_group, self, self._root)
            self._m_group._read()
            io.seek(_pos)
            return getattr(self, '_m_group', None)

        @group.setter
        def group(self, v):
            self._dirty = True
            self._m_group = v

        def _write_group(self):
            self._should_write_group = False
            io = self._root._io
            _pos = io.pos()
            io.seek(self.ofs_group)
            _io__raw__m_group = KaitaiStream(BytesIO(bytearray(self.len_group)))
            io.add_child_stream(_io__raw__m_group)
            _pos2 = io.pos()
            io.seek(io.pos() + (self.len_group))
            def handler(parent, _io__raw__m_group=_io__raw__m_group):
                self._raw__m_group = _io__raw__m_group.to_byte_array()
                if len(self._raw__m_group) != self.len_group:
                    raise kaitaistruct.ConsistencyError(u"raw(group)", self.len_group, len(self._raw__m_group))
                parent.write_bytes(self._raw__m_group)
            _io__raw__m_group.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
            self._m_group._write__seq(_io__raw__m_group)
            io.seek(_pos)


    class TupleStrStr(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Mcap.TupleStrStr, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.key = Mcap.PrefixedStr(self._io, self, self._root)
            self.key._read()
            self.value = Mcap.PrefixedStr(self._io, self, self._root)
            self.value._read()
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.key._fetch_instances()
            self.value._fetch_instances()


        def _write__seq(self, io=None):
            super(Mcap.TupleStrStr, self)._write__seq(io)
            self.key._write__seq(self._io)
            self.value._write__seq(self._io)


        def _check(self):
            if self.key._root != self._root:
                raise kaitaistruct.ConsistencyError(u"key", self._root, self.key._root)
            if self.key._parent != self:
                raise kaitaistruct.ConsistencyError(u"key", self, self.key._parent)
            if self.value._root != self._root:
                raise kaitaistruct.ConsistencyError(u"value", self._root, self.value._root)
            if self.value._parent != self:
                raise kaitaistruct.ConsistencyError(u"value", self, self.value._parent)
            self._dirty = False


    @property
    def footer(self):
        if self._should_write_footer:
            self._write_footer()
        if hasattr(self, '_m_footer'):
            return self._m_footer

        if not self.footer__enabled:
            return None

        _pos = self._io.pos()
        self._io.seek(self.ofs_footer)
        self._raw__m_footer = self._io.read_bytes_full()
        _io__raw__m_footer = KaitaiStream(BytesIO(self._raw__m_footer))
        self._m_footer = Mcap.Record(_io__raw__m_footer, self, self._root)
        self._m_footer._read()
        self._io.seek(_pos)
        return getattr(self, '_m_footer', None)

    @footer.setter
    def footer(self, v):
        self._dirty = True
        self._m_footer = v

    def _write_footer(self):
        self._should_write_footer = False
        _pos = self._io.pos()
        self._io.seek(self.ofs_footer)
        _io__raw__m_footer = KaitaiStream(BytesIO(bytearray(self._io.size() - self._io.pos())))
        self._io.add_child_stream(_io__raw__m_footer)
        _pos2 = self._io.pos()
        self._io.seek(self._io.pos() + (self._io.size() - self._io.pos()))
        def handler(parent, _io__raw__m_footer=_io__raw__m_footer):
            self._raw__m_footer = _io__raw__m_footer.to_byte_array()
            parent.write_bytes(self._raw__m_footer)
            if not parent.is_eof():
                raise kaitaistruct.ConsistencyError(u"raw(footer)", 0, parent.size() - parent.pos())
        _io__raw__m_footer.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
        self._m_footer._write__seq(_io__raw__m_footer)
        self._io.seek(_pos)

    @property
    def ofs_footer(self):
        if hasattr(self, '_m_ofs_footer'):
            return self._m_ofs_footer

        self._m_ofs_footer = (((self._io.size() - 1) - 8) - 20) - 8
        return getattr(self, '_m_ofs_footer', None)

    def _invalidate_ofs_footer(self):
        del self._m_ofs_footer

