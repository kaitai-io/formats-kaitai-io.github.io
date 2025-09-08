# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import ReadWriteKaitaiStruct, KaitaiStream, BytesIO
from enum import IntEnum


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class SystemdJournal(ReadWriteKaitaiStruct):
    """systemd, a popular user-space system/service management suite on Linux,
    offers logging functionality, storing incoming logs in a binary journal
    format.
    
    On live Linux system running systemd, these journals are typically located at:
    
    * /run/log/journal/machine-id/*.journal (volatile, lost after reboot)
    * /var/log/journal/machine-id/*.journal (persistent, but disabled by default on Debian / Ubuntu)
    
    .. seealso::
       Source - https://www.freedesktop.org/wiki/Software/systemd/journal-files/
    """

    class State(IntEnum):
        offline = 0
        online = 1
        archived = 2
    def __init__(self, _io=None, _parent=None, _root=None):
        super(SystemdJournal, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self
        self._should_write_data_hash_table = False
        self.data_hash_table__enabled = True
        self._should_write_field_hash_table = False
        self.field_hash_table__enabled = True
        self._should_write_len_header = False
        self.len_header__enabled = True

    def _read(self):
        self._raw_header = self._io.read_bytes(self.len_header)
        _io__raw_header = KaitaiStream(BytesIO(self._raw_header))
        self.header = SystemdJournal.Header(_io__raw_header, self, self._root)
        self.header._read()
        self.objects = []
        for i in range(self.header.num_objects):
            _t_objects = SystemdJournal.JournalObject(self._io, self, self._root)
            try:
                _t_objects._read()
            finally:
                self.objects.append(_t_objects)

        self._dirty = False


    def _fetch_instances(self):
        pass
        self.header._fetch_instances()
        for i in range(len(self.objects)):
            pass
            self.objects[i]._fetch_instances()

        _ = self.data_hash_table
        if hasattr(self, '_m_data_hash_table'):
            pass

        _ = self.field_hash_table
        if hasattr(self, '_m_field_hash_table'):
            pass

        _ = self.len_header
        if hasattr(self, '_m_len_header'):
            pass



    def _write__seq(self, io=None):
        super(SystemdJournal, self)._write__seq(io)
        self._should_write_data_hash_table = self.data_hash_table__enabled
        self._should_write_field_hash_table = self.field_hash_table__enabled
        self._should_write_len_header = self.len_header__enabled
        _io__raw_header = KaitaiStream(BytesIO(bytearray(self.len_header)))
        self._io.add_child_stream(_io__raw_header)
        _pos2 = self._io.pos()
        self._io.seek(self._io.pos() + (self.len_header))
        def handler(parent, _io__raw_header=_io__raw_header):
            self._raw_header = _io__raw_header.to_byte_array()
            if len(self._raw_header) != self.len_header:
                raise kaitaistruct.ConsistencyError(u"raw(header)", self.len_header, len(self._raw_header))
            parent.write_bytes(self._raw_header)
        _io__raw_header.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
        self.header._write__seq(_io__raw_header)
        for i in range(len(self.objects)):
            pass
            self.objects[i]._write__seq(self._io)



    def _check(self):
        if self.header._root != self._root:
            raise kaitaistruct.ConsistencyError(u"header", self._root, self.header._root)
        if self.header._parent != self:
            raise kaitaistruct.ConsistencyError(u"header", self, self.header._parent)
        if len(self.objects) != self.header.num_objects:
            raise kaitaistruct.ConsistencyError(u"objects", self.header.num_objects, len(self.objects))
        for i in range(len(self.objects)):
            pass
            if self.objects[i]._root != self._root:
                raise kaitaistruct.ConsistencyError(u"objects", self._root, self.objects[i]._root)
            if self.objects[i]._parent != self:
                raise kaitaistruct.ConsistencyError(u"objects", self, self.objects[i]._parent)

        if self.data_hash_table__enabled:
            pass
            if len(self._m_data_hash_table) != self.header.len_data_hash_table:
                raise kaitaistruct.ConsistencyError(u"data_hash_table", self.header.len_data_hash_table, len(self._m_data_hash_table))

        if self.field_hash_table__enabled:
            pass
            if len(self._m_field_hash_table) != self.header.len_field_hash_table:
                raise kaitaistruct.ConsistencyError(u"field_hash_table", self.header.len_field_hash_table, len(self._m_field_hash_table))

        if self.len_header__enabled:
            pass

        self._dirty = False

    class DataObject(ReadWriteKaitaiStruct):
        """Data objects are designed to carry log payload, typically in
        form of a "key=value" string in `payload` attribute.
        
        .. seealso::
           Source - https://www.freedesktop.org/wiki/Software/systemd/journal-files/#dataobjects
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(SystemdJournal.DataObject, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._should_write_entry = False
            self.entry__enabled = True
            self._should_write_entry_array = False
            self.entry_array__enabled = True
            self._should_write_head_field = False
            self.head_field__enabled = True
            self._should_write_next_hash = False
            self.next_hash__enabled = True

        def _read(self):
            self.hash = self._io.read_u8le()
            self.ofs_next_hash = self._io.read_u8le()
            self.ofs_head_field = self._io.read_u8le()
            self.ofs_entry = self._io.read_u8le()
            self.ofs_entry_array = self._io.read_u8le()
            self.num_entries = self._io.read_u8le()
            self.payload = self._io.read_bytes_full()
            self._dirty = False


        def _fetch_instances(self):
            pass
            _ = self.entry
            if hasattr(self, '_m_entry'):
                pass
                self._m_entry._fetch_instances()

            _ = self.entry_array
            if hasattr(self, '_m_entry_array'):
                pass
                self._m_entry_array._fetch_instances()

            _ = self.head_field
            if hasattr(self, '_m_head_field'):
                pass
                self._m_head_field._fetch_instances()

            _ = self.next_hash
            if hasattr(self, '_m_next_hash'):
                pass
                self._m_next_hash._fetch_instances()



        def _write__seq(self, io=None):
            super(SystemdJournal.DataObject, self)._write__seq(io)
            self._should_write_entry = self.entry__enabled
            self._should_write_entry_array = self.entry_array__enabled
            self._should_write_head_field = self.head_field__enabled
            self._should_write_next_hash = self.next_hash__enabled
            self._io.write_u8le(self.hash)
            self._io.write_u8le(self.ofs_next_hash)
            self._io.write_u8le(self.ofs_head_field)
            self._io.write_u8le(self.ofs_entry)
            self._io.write_u8le(self.ofs_entry_array)
            self._io.write_u8le(self.num_entries)
            self._io.write_bytes(self.payload)
            if not self._io.is_eof():
                raise kaitaistruct.ConsistencyError(u"payload", 0, self._io.size() - self._io.pos())


        def _check(self):
            if self.entry__enabled:
                pass
                if self.ofs_entry != 0:
                    pass
                    if self._m_entry._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"entry", self._root, self._m_entry._root)
                    if self._m_entry._parent != self:
                        raise kaitaistruct.ConsistencyError(u"entry", self, self._m_entry._parent)


            if self.entry_array__enabled:
                pass
                if self.ofs_entry_array != 0:
                    pass
                    if self._m_entry_array._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"entry_array", self._root, self._m_entry_array._root)
                    if self._m_entry_array._parent != self:
                        raise kaitaistruct.ConsistencyError(u"entry_array", self, self._m_entry_array._parent)


            if self.head_field__enabled:
                pass
                if self.ofs_head_field != 0:
                    pass
                    if self._m_head_field._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"head_field", self._root, self._m_head_field._root)
                    if self._m_head_field._parent != self:
                        raise kaitaistruct.ConsistencyError(u"head_field", self, self._m_head_field._parent)


            if self.next_hash__enabled:
                pass
                if self.ofs_next_hash != 0:
                    pass
                    if self._m_next_hash._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"next_hash", self._root, self._m_next_hash._root)
                    if self._m_next_hash._parent != self:
                        raise kaitaistruct.ConsistencyError(u"next_hash", self, self._m_next_hash._parent)


            self._dirty = False

        @property
        def entry(self):
            if self._should_write_entry:
                self._write_entry()
            if hasattr(self, '_m_entry'):
                return self._m_entry

            if not self.entry__enabled:
                return None

            if self.ofs_entry != 0:
                pass
                io = self._root._io
                _pos = io.pos()
                io.seek(self.ofs_entry)
                self._m_entry = SystemdJournal.JournalObject(io, self, self._root)
                self._m_entry._read()
                io.seek(_pos)

            return getattr(self, '_m_entry', None)

        @entry.setter
        def entry(self, v):
            self._dirty = True
            self._m_entry = v

        def _write_entry(self):
            self._should_write_entry = False
            if self.ofs_entry != 0:
                pass
                io = self._root._io
                _pos = io.pos()
                io.seek(self.ofs_entry)
                self._m_entry._write__seq(io)
                io.seek(_pos)


        @property
        def entry_array(self):
            if self._should_write_entry_array:
                self._write_entry_array()
            if hasattr(self, '_m_entry_array'):
                return self._m_entry_array

            if not self.entry_array__enabled:
                return None

            if self.ofs_entry_array != 0:
                pass
                io = self._root._io
                _pos = io.pos()
                io.seek(self.ofs_entry_array)
                self._m_entry_array = SystemdJournal.JournalObject(io, self, self._root)
                self._m_entry_array._read()
                io.seek(_pos)

            return getattr(self, '_m_entry_array', None)

        @entry_array.setter
        def entry_array(self, v):
            self._dirty = True
            self._m_entry_array = v

        def _write_entry_array(self):
            self._should_write_entry_array = False
            if self.ofs_entry_array != 0:
                pass
                io = self._root._io
                _pos = io.pos()
                io.seek(self.ofs_entry_array)
                self._m_entry_array._write__seq(io)
                io.seek(_pos)


        @property
        def head_field(self):
            if self._should_write_head_field:
                self._write_head_field()
            if hasattr(self, '_m_head_field'):
                return self._m_head_field

            if not self.head_field__enabled:
                return None

            if self.ofs_head_field != 0:
                pass
                io = self._root._io
                _pos = io.pos()
                io.seek(self.ofs_head_field)
                self._m_head_field = SystemdJournal.JournalObject(io, self, self._root)
                self._m_head_field._read()
                io.seek(_pos)

            return getattr(self, '_m_head_field', None)

        @head_field.setter
        def head_field(self, v):
            self._dirty = True
            self._m_head_field = v

        def _write_head_field(self):
            self._should_write_head_field = False
            if self.ofs_head_field != 0:
                pass
                io = self._root._io
                _pos = io.pos()
                io.seek(self.ofs_head_field)
                self._m_head_field._write__seq(io)
                io.seek(_pos)


        @property
        def next_hash(self):
            if self._should_write_next_hash:
                self._write_next_hash()
            if hasattr(self, '_m_next_hash'):
                return self._m_next_hash

            if not self.next_hash__enabled:
                return None

            if self.ofs_next_hash != 0:
                pass
                io = self._root._io
                _pos = io.pos()
                io.seek(self.ofs_next_hash)
                self._m_next_hash = SystemdJournal.JournalObject(io, self, self._root)
                self._m_next_hash._read()
                io.seek(_pos)

            return getattr(self, '_m_next_hash', None)

        @next_hash.setter
        def next_hash(self, v):
            self._dirty = True
            self._m_next_hash = v

        def _write_next_hash(self):
            self._should_write_next_hash = False
            if self.ofs_next_hash != 0:
                pass
                io = self._root._io
                _pos = io.pos()
                io.seek(self.ofs_next_hash)
                self._m_next_hash._write__seq(io)
                io.seek(_pos)



    class Header(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(SystemdJournal.Header, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.signature = self._io.read_bytes(8)
            if not self.signature == b"\x4C\x50\x4B\x53\x48\x48\x52\x48":
                raise kaitaistruct.ValidationNotEqualError(b"\x4C\x50\x4B\x53\x48\x48\x52\x48", self.signature, self._io, u"/types/header/seq/0")
            self.compatible_flags = self._io.read_u4le()
            self.incompatible_flags = self._io.read_u4le()
            self.state = KaitaiStream.resolve_enum(SystemdJournal.State, self._io.read_u1())
            self.reserved = self._io.read_bytes(7)
            self.file_id = self._io.read_bytes(16)
            self.machine_id = self._io.read_bytes(16)
            self.boot_id = self._io.read_bytes(16)
            self.seqnum_id = self._io.read_bytes(16)
            self.len_header = self._io.read_u8le()
            self.len_arena = self._io.read_u8le()
            self.ofs_data_hash_table = self._io.read_u8le()
            self.len_data_hash_table = self._io.read_u8le()
            self.ofs_field_hash_table = self._io.read_u8le()
            self.len_field_hash_table = self._io.read_u8le()
            self.ofs_tail_object = self._io.read_u8le()
            self.num_objects = self._io.read_u8le()
            self.num_entries = self._io.read_u8le()
            self.tail_entry_seqnum = self._io.read_u8le()
            self.head_entry_seqnum = self._io.read_u8le()
            self.ofs_entry_array = self._io.read_u8le()
            self.head_entry_realtime = self._io.read_u8le()
            self.tail_entry_realtime = self._io.read_u8le()
            self.tail_entry_monotonic = self._io.read_u8le()
            if (not (self._io.is_eof())):
                pass
                self.num_data = self._io.read_u8le()

            if (not (self._io.is_eof())):
                pass
                self.num_fields = self._io.read_u8le()

            if (not (self._io.is_eof())):
                pass
                self.num_tags = self._io.read_u8le()

            if (not (self._io.is_eof())):
                pass
                self.num_entry_arrays = self._io.read_u8le()

            self._dirty = False


        def _fetch_instances(self):
            pass
            if (not (self._io.is_eof())):
                pass

            if (not (self._io.is_eof())):
                pass

            if (not (self._io.is_eof())):
                pass

            if (not (self._io.is_eof())):
                pass



        def _write__seq(self, io=None):
            super(SystemdJournal.Header, self)._write__seq(io)
            self._io.write_bytes(self.signature)
            self._io.write_u4le(self.compatible_flags)
            self._io.write_u4le(self.incompatible_flags)
            self._io.write_u1(int(self.state))
            self._io.write_bytes(self.reserved)
            self._io.write_bytes(self.file_id)
            self._io.write_bytes(self.machine_id)
            self._io.write_bytes(self.boot_id)
            self._io.write_bytes(self.seqnum_id)
            self._io.write_u8le(self.len_header)
            self._io.write_u8le(self.len_arena)
            self._io.write_u8le(self.ofs_data_hash_table)
            self._io.write_u8le(self.len_data_hash_table)
            self._io.write_u8le(self.ofs_field_hash_table)
            self._io.write_u8le(self.len_field_hash_table)
            self._io.write_u8le(self.ofs_tail_object)
            self._io.write_u8le(self.num_objects)
            self._io.write_u8le(self.num_entries)
            self._io.write_u8le(self.tail_entry_seqnum)
            self._io.write_u8le(self.head_entry_seqnum)
            self._io.write_u8le(self.ofs_entry_array)
            self._io.write_u8le(self.head_entry_realtime)
            self._io.write_u8le(self.tail_entry_realtime)
            self._io.write_u8le(self.tail_entry_monotonic)
            if (not (self._io.is_eof())):
                pass
                self._io.write_u8le(self.num_data)

            if (not (self._io.is_eof())):
                pass
                self._io.write_u8le(self.num_fields)

            if (not (self._io.is_eof())):
                pass
                self._io.write_u8le(self.num_tags)

            if (not (self._io.is_eof())):
                pass
                self._io.write_u8le(self.num_entry_arrays)



        def _check(self):
            if len(self.signature) != 8:
                raise kaitaistruct.ConsistencyError(u"signature", 8, len(self.signature))
            if not self.signature == b"\x4C\x50\x4B\x53\x48\x48\x52\x48":
                raise kaitaistruct.ValidationNotEqualError(b"\x4C\x50\x4B\x53\x48\x48\x52\x48", self.signature, None, u"/types/header/seq/0")
            if len(self.reserved) != 7:
                raise kaitaistruct.ConsistencyError(u"reserved", 7, len(self.reserved))
            if len(self.file_id) != 16:
                raise kaitaistruct.ConsistencyError(u"file_id", 16, len(self.file_id))
            if len(self.machine_id) != 16:
                raise kaitaistruct.ConsistencyError(u"machine_id", 16, len(self.machine_id))
            if len(self.boot_id) != 16:
                raise kaitaistruct.ConsistencyError(u"boot_id", 16, len(self.boot_id))
            if len(self.seqnum_id) != 16:
                raise kaitaistruct.ConsistencyError(u"seqnum_id", 16, len(self.seqnum_id))
            self._dirty = False


    class JournalObject(ReadWriteKaitaiStruct):
        """
        .. seealso::
           Source - https://www.freedesktop.org/wiki/Software/systemd/journal-files/#objects
        """

        class ObjectTypes(IntEnum):
            unused = 0
            data = 1
            field = 2
            entry = 3
            data_hash_table = 4
            field_hash_table = 5
            entry_array = 6
            tag = 7
        def __init__(self, _io=None, _parent=None, _root=None):
            super(SystemdJournal.JournalObject, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.padding = self._io.read_bytes((8 - self._io.pos()) % 8)
            self.object_type = KaitaiStream.resolve_enum(SystemdJournal.JournalObject.ObjectTypes, self._io.read_u1())
            self.flags = self._io.read_u1()
            self.reserved = self._io.read_bytes(6)
            self.len_object = self._io.read_u8le()
            _on = self.object_type
            if _on == SystemdJournal.JournalObject.ObjectTypes.data:
                pass
                self._raw_payload = self._io.read_bytes(self.len_object - 16)
                _io__raw_payload = KaitaiStream(BytesIO(self._raw_payload))
                self.payload = SystemdJournal.DataObject(_io__raw_payload, self, self._root)
                self.payload._read()
            else:
                pass
                self.payload = self._io.read_bytes(self.len_object - 16)
            self._dirty = False


        def _fetch_instances(self):
            pass
            _on = self.object_type
            if _on == SystemdJournal.JournalObject.ObjectTypes.data:
                pass
                self.payload._fetch_instances()
            else:
                pass


        def _write__seq(self, io=None):
            super(SystemdJournal.JournalObject, self)._write__seq(io)
            if len(self.padding) != (8 - self._io.pos()) % 8:
                raise kaitaistruct.ConsistencyError(u"padding", (8 - self._io.pos()) % 8, len(self.padding))
            self._io.write_bytes(self.padding)
            self._io.write_u1(int(self.object_type))
            self._io.write_u1(self.flags)
            self._io.write_bytes(self.reserved)
            self._io.write_u8le(self.len_object)
            _on = self.object_type
            if _on == SystemdJournal.JournalObject.ObjectTypes.data:
                pass
                _io__raw_payload = KaitaiStream(BytesIO(bytearray(self.len_object - 16)))
                self._io.add_child_stream(_io__raw_payload)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.len_object - 16))
                def handler(parent, _io__raw_payload=_io__raw_payload):
                    self._raw_payload = _io__raw_payload.to_byte_array()
                    if len(self._raw_payload) != self.len_object - 16:
                        raise kaitaistruct.ConsistencyError(u"raw(payload)", self.len_object - 16, len(self._raw_payload))
                    parent.write_bytes(self._raw_payload)
                _io__raw_payload.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.payload._write__seq(_io__raw_payload)
            else:
                pass
                self._io.write_bytes(self.payload)


        def _check(self):
            if len(self.reserved) != 6:
                raise kaitaistruct.ConsistencyError(u"reserved", 6, len(self.reserved))
            _on = self.object_type
            if _on == SystemdJournal.JournalObject.ObjectTypes.data:
                pass
                if self.payload._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"payload", self._root, self.payload._root)
                if self.payload._parent != self:
                    raise kaitaistruct.ConsistencyError(u"payload", self, self.payload._parent)
            else:
                pass
                if len(self.payload) != self.len_object - 16:
                    raise kaitaistruct.ConsistencyError(u"payload", self.len_object - 16, len(self.payload))
            self._dirty = False


    @property
    def data_hash_table(self):
        if self._should_write_data_hash_table:
            self._write_data_hash_table()
        if hasattr(self, '_m_data_hash_table'):
            return self._m_data_hash_table

        if not self.data_hash_table__enabled:
            return None

        _pos = self._io.pos()
        self._io.seek(self.header.ofs_data_hash_table)
        self._m_data_hash_table = self._io.read_bytes(self.header.len_data_hash_table)
        self._io.seek(_pos)
        return getattr(self, '_m_data_hash_table', None)

    @data_hash_table.setter
    def data_hash_table(self, v):
        self._dirty = True
        self._m_data_hash_table = v

    def _write_data_hash_table(self):
        self._should_write_data_hash_table = False
        _pos = self._io.pos()
        self._io.seek(self.header.ofs_data_hash_table)
        self._io.write_bytes(self._m_data_hash_table)
        self._io.seek(_pos)

    @property
    def field_hash_table(self):
        if self._should_write_field_hash_table:
            self._write_field_hash_table()
        if hasattr(self, '_m_field_hash_table'):
            return self._m_field_hash_table

        if not self.field_hash_table__enabled:
            return None

        _pos = self._io.pos()
        self._io.seek(self.header.ofs_field_hash_table)
        self._m_field_hash_table = self._io.read_bytes(self.header.len_field_hash_table)
        self._io.seek(_pos)
        return getattr(self, '_m_field_hash_table', None)

    @field_hash_table.setter
    def field_hash_table(self, v):
        self._dirty = True
        self._m_field_hash_table = v

    def _write_field_hash_table(self):
        self._should_write_field_hash_table = False
        _pos = self._io.pos()
        self._io.seek(self.header.ofs_field_hash_table)
        self._io.write_bytes(self._m_field_hash_table)
        self._io.seek(_pos)

    @property
    def len_header(self):
        """Header length is used to set substream size, as it thus required
        prior to declaration of header.
        """
        if self._should_write_len_header:
            self._write_len_header()
        if hasattr(self, '_m_len_header'):
            return self._m_len_header

        if not self.len_header__enabled:
            return None

        _pos = self._io.pos()
        self._io.seek(88)
        self._m_len_header = self._io.read_u8le()
        self._io.seek(_pos)
        return getattr(self, '_m_len_header', None)

    @len_header.setter
    def len_header(self, v):
        self._dirty = True
        self._m_len_header = v

    def _write_len_header(self):
        self._should_write_len_header = False
        _pos = self._io.pos()
        self._io.seek(88)
        self._io.write_u8le(self._m_len_header)
        self._io.seek(_pos)


