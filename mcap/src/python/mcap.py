# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import KaitaiStruct, KaitaiStream, BytesIO
from enum import IntEnum


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class Mcap(KaitaiStruct):
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
    def __init__(self, _io, _parent=None, _root=None):
        super(Mcap, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self
        self._read()

    def _read(self):
        self.header_magic = Mcap.Magic(self._io, self, self._root)
        self.records = []
        i = 0
        while True:
            _ = Mcap.Record(self._io, self, self._root)
            self.records.append(_)
            if _.op == Mcap.Opcode.footer:
                break
            i += 1
        self.footer_magic = Mcap.Magic(self._io, self, self._root)


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


    class Attachment(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(Mcap.Attachment, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.log_time = self._io.read_u8le()
            self.create_time = self._io.read_u8le()
            self.name = Mcap.PrefixedStr(self._io, self, self._root)
            self.content_type = Mcap.PrefixedStr(self._io, self, self._root)
            self.len_data = self._io.read_u8le()
            self.data = self._io.read_bytes(self.len_data)
            if self.crc32_input_end >= 0:
                pass
                self.invoke_crc32_input_end = self._io.read_bytes(0)

            self.crc32 = self._io.read_u4le()


        def _fetch_instances(self):
            pass
            self.name._fetch_instances()
            self.content_type._fetch_instances()
            if self.crc32_input_end >= 0:
                pass

            _ = self.crc32_input
            if hasattr(self, '_m_crc32_input'):
                pass


        @property
        def crc32_input(self):
            if hasattr(self, '_m_crc32_input'):
                return self._m_crc32_input

            _pos = self._io.pos()
            self._io.seek(0)
            self._m_crc32_input = self._io.read_bytes(self.crc32_input_end)
            self._io.seek(_pos)
            return getattr(self, '_m_crc32_input', None)

        @property
        def crc32_input_end(self):
            if hasattr(self, '_m_crc32_input_end'):
                return self._m_crc32_input_end

            self._m_crc32_input_end = self._io.pos()
            return getattr(self, '_m_crc32_input_end', None)


    class AttachmentIndex(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(Mcap.AttachmentIndex, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.ofs_attachment = self._io.read_u8le()
            self.len_attachment = self._io.read_u8le()
            self.log_time = self._io.read_u8le()
            self.create_time = self._io.read_u8le()
            self.data_size = self._io.read_u8le()
            self.name = Mcap.PrefixedStr(self._io, self, self._root)
            self.content_type = Mcap.PrefixedStr(self._io, self, self._root)


        def _fetch_instances(self):
            pass
            self.name._fetch_instances()
            self.content_type._fetch_instances()
            _ = self.attachment
            if hasattr(self, '_m_attachment'):
                pass
                self._m_attachment._fetch_instances()


        @property
        def attachment(self):
            if hasattr(self, '_m_attachment'):
                return self._m_attachment

            io = self._root._io
            _pos = io.pos()
            io.seek(self.ofs_attachment)
            self._raw__m_attachment = io.read_bytes(self.len_attachment)
            _io__raw__m_attachment = KaitaiStream(BytesIO(self._raw__m_attachment))
            self._m_attachment = Mcap.Record(_io__raw__m_attachment, self, self._root)
            io.seek(_pos)
            return getattr(self, '_m_attachment', None)


    class Channel(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(Mcap.Channel, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.id = self._io.read_u2le()
            self.schema_id = self._io.read_u2le()
            self.topic = Mcap.PrefixedStr(self._io, self, self._root)
            self.message_encoding = Mcap.PrefixedStr(self._io, self, self._root)
            self.metadata = Mcap.MapStrStr(self._io, self, self._root)


        def _fetch_instances(self):
            pass
            self.topic._fetch_instances()
            self.message_encoding._fetch_instances()
            self.metadata._fetch_instances()


    class Chunk(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(Mcap.Chunk, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.message_start_time = self._io.read_u8le()
            self.message_end_time = self._io.read_u8le()
            self.uncompressed_size = self._io.read_u8le()
            self.uncompressed_crc32 = self._io.read_u4le()
            self.compression = Mcap.PrefixedStr(self._io, self, self._root)
            self.len_records = self._io.read_u8le()
            _on = self.compression.str
            if _on == u"":
                pass
                self._raw_records = self._io.read_bytes(self.len_records)
                _io__raw_records = KaitaiStream(BytesIO(self._raw_records))
                self.records = Mcap.Records(_io__raw_records, self, self._root)
            else:
                pass
                self.records = self._io.read_bytes(self.len_records)


        def _fetch_instances(self):
            pass
            self.compression._fetch_instances()
            _on = self.compression.str
            if _on == u"":
                pass
                self.records._fetch_instances()
            else:
                pass


    class ChunkIndex(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(Mcap.ChunkIndex, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.message_start_time = self._io.read_u8le()
            self.message_end_time = self._io.read_u8le()
            self.ofs_chunk = self._io.read_u8le()
            self.len_chunk = self._io.read_u8le()
            self.len_message_index_offsets = self._io.read_u4le()
            self._raw_message_index_offsets = self._io.read_bytes(self.len_message_index_offsets)
            _io__raw_message_index_offsets = KaitaiStream(BytesIO(self._raw_message_index_offsets))
            self.message_index_offsets = Mcap.ChunkIndex.MessageIndexOffsets(_io__raw_message_index_offsets, self, self._root)
            self.message_index_length = self._io.read_u8le()
            self.compression = Mcap.PrefixedStr(self._io, self, self._root)
            self.compressed_size = self._io.read_u8le()
            self.uncompressed_size = self._io.read_u8le()


        def _fetch_instances(self):
            pass
            self.message_index_offsets._fetch_instances()
            self.compression._fetch_instances()
            _ = self.chunk
            if hasattr(self, '_m_chunk'):
                pass
                self._m_chunk._fetch_instances()


        class MessageIndexOffset(KaitaiStruct):
            def __init__(self, _io, _parent=None, _root=None):
                super(Mcap.ChunkIndex.MessageIndexOffset, self).__init__(_io)
                self._parent = _parent
                self._root = _root
                self._read()

            def _read(self):
                self.channel_id = self._io.read_u2le()
                self.offset = self._io.read_u8le()


            def _fetch_instances(self):
                pass


        class MessageIndexOffsets(KaitaiStruct):
            def __init__(self, _io, _parent=None, _root=None):
                super(Mcap.ChunkIndex.MessageIndexOffsets, self).__init__(_io)
                self._parent = _parent
                self._root = _root
                self._read()

            def _read(self):
                self.entries = []
                i = 0
                while not self._io.is_eof():
                    self.entries.append(Mcap.ChunkIndex.MessageIndexOffset(self._io, self, self._root))
                    i += 1



            def _fetch_instances(self):
                pass
                for i in range(len(self.entries)):
                    pass
                    self.entries[i]._fetch_instances()



        @property
        def chunk(self):
            if hasattr(self, '_m_chunk'):
                return self._m_chunk

            io = self._root._io
            _pos = io.pos()
            io.seek(self.ofs_chunk)
            self._raw__m_chunk = io.read_bytes(self.len_chunk)
            _io__raw__m_chunk = KaitaiStream(BytesIO(self._raw__m_chunk))
            self._m_chunk = Mcap.Record(_io__raw__m_chunk, self, self._root)
            io.seek(_pos)
            return getattr(self, '_m_chunk', None)


    class DataEnd(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(Mcap.DataEnd, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.data_section_crc32 = self._io.read_u4le()


        def _fetch_instances(self):
            pass


    class Footer(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(Mcap.Footer, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.ofs_summary_section = self._io.read_u8le()
            self.ofs_summary_offset_section = self._io.read_u8le()
            self.summary_crc32 = self._io.read_u4le()


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


        @property
        def ofs_summary_crc32_input(self):
            if hasattr(self, '_m_ofs_summary_crc32_input'):
                return self._m_ofs_summary_crc32_input

            self._m_ofs_summary_crc32_input = (self.ofs_summary_section if self.ofs_summary_section != 0 else self._root.ofs_footer)
            return getattr(self, '_m_ofs_summary_crc32_input', None)

        @property
        def summary_crc32_input(self):
            if hasattr(self, '_m_summary_crc32_input'):
                return self._m_summary_crc32_input

            io = self._root._io
            _pos = io.pos()
            io.seek(self.ofs_summary_crc32_input)
            self._m_summary_crc32_input = io.read_bytes(((self._root._io.size() - self.ofs_summary_crc32_input) - 8) - 4)
            io.seek(_pos)
            return getattr(self, '_m_summary_crc32_input', None)

        @property
        def summary_offset_section(self):
            if hasattr(self, '_m_summary_offset_section'):
                return self._m_summary_offset_section

            if self.ofs_summary_offset_section != 0:
                pass
                io = self._root._io
                _pos = io.pos()
                io.seek(self.ofs_summary_offset_section)
                self._raw__m_summary_offset_section = io.read_bytes(self._root.ofs_footer - self.ofs_summary_offset_section)
                _io__raw__m_summary_offset_section = KaitaiStream(BytesIO(self._raw__m_summary_offset_section))
                self._m_summary_offset_section = Mcap.Records(_io__raw__m_summary_offset_section, self, self._root)
                io.seek(_pos)

            return getattr(self, '_m_summary_offset_section', None)

        @property
        def summary_section(self):
            if hasattr(self, '_m_summary_section'):
                return self._m_summary_section

            if self.ofs_summary_section != 0:
                pass
                io = self._root._io
                _pos = io.pos()
                io.seek(self.ofs_summary_section)
                self._raw__m_summary_section = io.read_bytes((self.ofs_summary_offset_section if self.ofs_summary_offset_section != 0 else self._root.ofs_footer) - self.ofs_summary_section)
                _io__raw__m_summary_section = KaitaiStream(BytesIO(self._raw__m_summary_section))
                self._m_summary_section = Mcap.Records(_io__raw__m_summary_section, self, self._root)
                io.seek(_pos)

            return getattr(self, '_m_summary_section', None)


    class Header(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(Mcap.Header, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.profile = Mcap.PrefixedStr(self._io, self, self._root)
            self.library = Mcap.PrefixedStr(self._io, self, self._root)


        def _fetch_instances(self):
            pass
            self.profile._fetch_instances()
            self.library._fetch_instances()


    class Magic(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(Mcap.Magic, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.magic = self._io.read_bytes(8)
            if not self.magic == b"\x89\x4D\x43\x41\x50\x30\x0D\x0A":
                raise kaitaistruct.ValidationNotEqualError(b"\x89\x4D\x43\x41\x50\x30\x0D\x0A", self.magic, self._io, u"/types/magic/seq/0")


        def _fetch_instances(self):
            pass


    class MapStrStr(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(Mcap.MapStrStr, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.len_entries = self._io.read_u4le()
            self._raw_entries = self._io.read_bytes(self.len_entries)
            _io__raw_entries = KaitaiStream(BytesIO(self._raw_entries))
            self.entries = Mcap.MapStrStr.Entries(_io__raw_entries, self, self._root)


        def _fetch_instances(self):
            pass
            self.entries._fetch_instances()

        class Entries(KaitaiStruct):
            def __init__(self, _io, _parent=None, _root=None):
                super(Mcap.MapStrStr.Entries, self).__init__(_io)
                self._parent = _parent
                self._root = _root
                self._read()

            def _read(self):
                self.entries = []
                i = 0
                while not self._io.is_eof():
                    self.entries.append(Mcap.TupleStrStr(self._io, self, self._root))
                    i += 1



            def _fetch_instances(self):
                pass
                for i in range(len(self.entries)):
                    pass
                    self.entries[i]._fetch_instances()




    class Message(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(Mcap.Message, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.channel_id = self._io.read_u2le()
            self.sequence = self._io.read_u4le()
            self.log_time = self._io.read_u8le()
            self.publish_time = self._io.read_u8le()
            self.data = self._io.read_bytes_full()


        def _fetch_instances(self):
            pass


    class MessageIndex(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(Mcap.MessageIndex, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.channel_id = self._io.read_u2le()
            self.len_records = self._io.read_u4le()
            self._raw_records = self._io.read_bytes(self.len_records)
            _io__raw_records = KaitaiStream(BytesIO(self._raw_records))
            self.records = Mcap.MessageIndex.MessageIndexEntries(_io__raw_records, self, self._root)


        def _fetch_instances(self):
            pass
            self.records._fetch_instances()

        class MessageIndexEntries(KaitaiStruct):
            def __init__(self, _io, _parent=None, _root=None):
                super(Mcap.MessageIndex.MessageIndexEntries, self).__init__(_io)
                self._parent = _parent
                self._root = _root
                self._read()

            def _read(self):
                self.entries = []
                i = 0
                while not self._io.is_eof():
                    self.entries.append(Mcap.MessageIndex.MessageIndexEntry(self._io, self, self._root))
                    i += 1



            def _fetch_instances(self):
                pass
                for i in range(len(self.entries)):
                    pass
                    self.entries[i]._fetch_instances()



        class MessageIndexEntry(KaitaiStruct):
            def __init__(self, _io, _parent=None, _root=None):
                super(Mcap.MessageIndex.MessageIndexEntry, self).__init__(_io)
                self._parent = _parent
                self._root = _root
                self._read()

            def _read(self):
                self.log_time = self._io.read_u8le()
                self.offset = self._io.read_u8le()


            def _fetch_instances(self):
                pass



    class Metadata(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(Mcap.Metadata, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.name = Mcap.PrefixedStr(self._io, self, self._root)
            self.metadata = Mcap.MapStrStr(self._io, self, self._root)


        def _fetch_instances(self):
            pass
            self.name._fetch_instances()
            self.metadata._fetch_instances()


    class MetadataIndex(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(Mcap.MetadataIndex, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.ofs_metadata = self._io.read_u8le()
            self.len_metadata = self._io.read_u8le()
            self.name = Mcap.PrefixedStr(self._io, self, self._root)


        def _fetch_instances(self):
            pass
            self.name._fetch_instances()
            _ = self.metadata
            if hasattr(self, '_m_metadata'):
                pass
                self._m_metadata._fetch_instances()


        @property
        def metadata(self):
            if hasattr(self, '_m_metadata'):
                return self._m_metadata

            io = self._root._io
            _pos = io.pos()
            io.seek(self.ofs_metadata)
            self._raw__m_metadata = io.read_bytes(self.len_metadata)
            _io__raw__m_metadata = KaitaiStream(BytesIO(self._raw__m_metadata))
            self._m_metadata = Mcap.Record(_io__raw__m_metadata, self, self._root)
            io.seek(_pos)
            return getattr(self, '_m_metadata', None)


    class PrefixedStr(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(Mcap.PrefixedStr, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.len_str = self._io.read_u4le()
            self.str = (self._io.read_bytes(self.len_str)).decode(u"UTF-8")


        def _fetch_instances(self):
            pass


    class Record(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(Mcap.Record, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.op = KaitaiStream.resolve_enum(Mcap.Opcode, self._io.read_u1())
            self.len_body = self._io.read_u8le()
            _on = self.op
            if _on == Mcap.Opcode.attachment:
                pass
                self._raw_body = self._io.read_bytes(self.len_body)
                _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                self.body = Mcap.Attachment(_io__raw_body, self, self._root)
            elif _on == Mcap.Opcode.attachment_index:
                pass
                self._raw_body = self._io.read_bytes(self.len_body)
                _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                self.body = Mcap.AttachmentIndex(_io__raw_body, self, self._root)
            elif _on == Mcap.Opcode.channel:
                pass
                self._raw_body = self._io.read_bytes(self.len_body)
                _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                self.body = Mcap.Channel(_io__raw_body, self, self._root)
            elif _on == Mcap.Opcode.chunk:
                pass
                self._raw_body = self._io.read_bytes(self.len_body)
                _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                self.body = Mcap.Chunk(_io__raw_body, self, self._root)
            elif _on == Mcap.Opcode.chunk_index:
                pass
                self._raw_body = self._io.read_bytes(self.len_body)
                _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                self.body = Mcap.ChunkIndex(_io__raw_body, self, self._root)
            elif _on == Mcap.Opcode.data_end:
                pass
                self._raw_body = self._io.read_bytes(self.len_body)
                _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                self.body = Mcap.DataEnd(_io__raw_body, self, self._root)
            elif _on == Mcap.Opcode.footer:
                pass
                self._raw_body = self._io.read_bytes(self.len_body)
                _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                self.body = Mcap.Footer(_io__raw_body, self, self._root)
            elif _on == Mcap.Opcode.header:
                pass
                self._raw_body = self._io.read_bytes(self.len_body)
                _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                self.body = Mcap.Header(_io__raw_body, self, self._root)
            elif _on == Mcap.Opcode.message:
                pass
                self._raw_body = self._io.read_bytes(self.len_body)
                _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                self.body = Mcap.Message(_io__raw_body, self, self._root)
            elif _on == Mcap.Opcode.message_index:
                pass
                self._raw_body = self._io.read_bytes(self.len_body)
                _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                self.body = Mcap.MessageIndex(_io__raw_body, self, self._root)
            elif _on == Mcap.Opcode.metadata:
                pass
                self._raw_body = self._io.read_bytes(self.len_body)
                _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                self.body = Mcap.Metadata(_io__raw_body, self, self._root)
            elif _on == Mcap.Opcode.metadata_index:
                pass
                self._raw_body = self._io.read_bytes(self.len_body)
                _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                self.body = Mcap.MetadataIndex(_io__raw_body, self, self._root)
            elif _on == Mcap.Opcode.schema:
                pass
                self._raw_body = self._io.read_bytes(self.len_body)
                _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                self.body = Mcap.Schema(_io__raw_body, self, self._root)
            elif _on == Mcap.Opcode.statistics:
                pass
                self._raw_body = self._io.read_bytes(self.len_body)
                _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                self.body = Mcap.Statistics(_io__raw_body, self, self._root)
            elif _on == Mcap.Opcode.summary_offset:
                pass
                self._raw_body = self._io.read_bytes(self.len_body)
                _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                self.body = Mcap.SummaryOffset(_io__raw_body, self, self._root)
            else:
                pass
                self.body = self._io.read_bytes(self.len_body)


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


    class Records(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(Mcap.Records, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.records = []
            i = 0
            while not self._io.is_eof():
                self.records.append(Mcap.Record(self._io, self, self._root))
                i += 1



        def _fetch_instances(self):
            pass
            for i in range(len(self.records)):
                pass
                self.records[i]._fetch_instances()



    class Schema(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(Mcap.Schema, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.id = self._io.read_u2le()
            self.name = Mcap.PrefixedStr(self._io, self, self._root)
            self.encoding = Mcap.PrefixedStr(self._io, self, self._root)
            self.len_data = self._io.read_u4le()
            self.data = self._io.read_bytes(self.len_data)


        def _fetch_instances(self):
            pass
            self.name._fetch_instances()
            self.encoding._fetch_instances()


    class Statistics(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(Mcap.Statistics, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

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


        def _fetch_instances(self):
            pass
            self.channel_message_counts._fetch_instances()

        class ChannelMessageCount(KaitaiStruct):
            def __init__(self, _io, _parent=None, _root=None):
                super(Mcap.Statistics.ChannelMessageCount, self).__init__(_io)
                self._parent = _parent
                self._root = _root
                self._read()

            def _read(self):
                self.channel_id = self._io.read_u2le()
                self.message_count = self._io.read_u8le()


            def _fetch_instances(self):
                pass


        class ChannelMessageCounts(KaitaiStruct):
            def __init__(self, _io, _parent=None, _root=None):
                super(Mcap.Statistics.ChannelMessageCounts, self).__init__(_io)
                self._parent = _parent
                self._root = _root
                self._read()

            def _read(self):
                self.entries = []
                i = 0
                while not self._io.is_eof():
                    self.entries.append(Mcap.Statistics.ChannelMessageCount(self._io, self, self._root))
                    i += 1



            def _fetch_instances(self):
                pass
                for i in range(len(self.entries)):
                    pass
                    self.entries[i]._fetch_instances()




    class SummaryOffset(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(Mcap.SummaryOffset, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.group_opcode = KaitaiStream.resolve_enum(Mcap.Opcode, self._io.read_u1())
            self.ofs_group = self._io.read_u8le()
            self.len_group = self._io.read_u8le()


        def _fetch_instances(self):
            pass
            _ = self.group
            if hasattr(self, '_m_group'):
                pass
                self._m_group._fetch_instances()


        @property
        def group(self):
            if hasattr(self, '_m_group'):
                return self._m_group

            io = self._root._io
            _pos = io.pos()
            io.seek(self.ofs_group)
            self._raw__m_group = io.read_bytes(self.len_group)
            _io__raw__m_group = KaitaiStream(BytesIO(self._raw__m_group))
            self._m_group = Mcap.Records(_io__raw__m_group, self, self._root)
            io.seek(_pos)
            return getattr(self, '_m_group', None)


    class TupleStrStr(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(Mcap.TupleStrStr, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.key = Mcap.PrefixedStr(self._io, self, self._root)
            self.value = Mcap.PrefixedStr(self._io, self, self._root)


        def _fetch_instances(self):
            pass
            self.key._fetch_instances()
            self.value._fetch_instances()


    @property
    def footer(self):
        if hasattr(self, '_m_footer'):
            return self._m_footer

        _pos = self._io.pos()
        self._io.seek(self.ofs_footer)
        self._raw__m_footer = self._io.read_bytes_full()
        _io__raw__m_footer = KaitaiStream(BytesIO(self._raw__m_footer))
        self._m_footer = Mcap.Record(_io__raw__m_footer, self, self._root)
        self._io.seek(_pos)
        return getattr(self, '_m_footer', None)

    @property
    def ofs_footer(self):
        if hasattr(self, '_m_ofs_footer'):
            return self._m_ofs_footer

        self._m_ofs_footer = (((self._io.size() - 1) - 8) - 20) - 8
        return getattr(self, '_m_ofs_footer', None)


