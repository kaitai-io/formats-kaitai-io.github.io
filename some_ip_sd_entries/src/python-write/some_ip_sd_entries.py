# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import ReadWriteKaitaiStruct, KaitaiStream, BytesIO
from enum import IntEnum


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class SomeIpSdEntries(ReadWriteKaitaiStruct):
    """The entries are used to synchronize the state of services instances and the
    Publish/-Subscribe handling.
    
    .. seealso::
       section 4.1.2.3  Entry Format - https://www.autosar.org/fileadmin/standards/foundation/19-11/AUTOSAR_PRS_SOMEIPServiceDiscoveryProtocol.pdf
       -
    """
    def __init__(self, _io=None, _parent=None, _root=None):
        super(SomeIpSdEntries, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self

    def _read(self):
        self.entries = []
        i = 0
        while not self._io.is_eof():
            _t_entries = SomeIpSdEntries.SdEntry(self._io, self, self._root)
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
        super(SomeIpSdEntries, self)._write__seq(io)
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

    class SdEntry(ReadWriteKaitaiStruct):

        class EntryTypes(IntEnum):
            find = 0
            offer = 1
            subscribe = 6
            subscribe_ack = 7
        def __init__(self, _io=None, _parent=None, _root=None):
            super(SomeIpSdEntries.SdEntry, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.header = SomeIpSdEntries.SdEntry.SdEntryHeader(self._io, self, self._root)
            self.header._read()
            _on = self.header.type
            if _on == SomeIpSdEntries.SdEntry.EntryTypes.find:
                pass
                self.content = SomeIpSdEntries.SdEntry.SdServiceEntry(self._io, self, self._root)
                self.content._read()
            elif _on == SomeIpSdEntries.SdEntry.EntryTypes.offer:
                pass
                self.content = SomeIpSdEntries.SdEntry.SdServiceEntry(self._io, self, self._root)
                self.content._read()
            elif _on == SomeIpSdEntries.SdEntry.EntryTypes.subscribe:
                pass
                self.content = SomeIpSdEntries.SdEntry.SdEventgroupEntry(self._io, self, self._root)
                self.content._read()
            elif _on == SomeIpSdEntries.SdEntry.EntryTypes.subscribe_ack:
                pass
                self.content = SomeIpSdEntries.SdEntry.SdEventgroupEntry(self._io, self, self._root)
                self.content._read()
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.header._fetch_instances()
            _on = self.header.type
            if _on == SomeIpSdEntries.SdEntry.EntryTypes.find:
                pass
                self.content._fetch_instances()
            elif _on == SomeIpSdEntries.SdEntry.EntryTypes.offer:
                pass
                self.content._fetch_instances()
            elif _on == SomeIpSdEntries.SdEntry.EntryTypes.subscribe:
                pass
                self.content._fetch_instances()
            elif _on == SomeIpSdEntries.SdEntry.EntryTypes.subscribe_ack:
                pass
                self.content._fetch_instances()


        def _write__seq(self, io=None):
            super(SomeIpSdEntries.SdEntry, self)._write__seq(io)
            self.header._write__seq(self._io)
            _on = self.header.type
            if _on == SomeIpSdEntries.SdEntry.EntryTypes.find:
                pass
                self.content._write__seq(self._io)
            elif _on == SomeIpSdEntries.SdEntry.EntryTypes.offer:
                pass
                self.content._write__seq(self._io)
            elif _on == SomeIpSdEntries.SdEntry.EntryTypes.subscribe:
                pass
                self.content._write__seq(self._io)
            elif _on == SomeIpSdEntries.SdEntry.EntryTypes.subscribe_ack:
                pass
                self.content._write__seq(self._io)


        def _check(self):
            if self.header._root != self._root:
                raise kaitaistruct.ConsistencyError(u"header", self._root, self.header._root)
            if self.header._parent != self:
                raise kaitaistruct.ConsistencyError(u"header", self, self.header._parent)
            _on = self.header.type
            if _on == SomeIpSdEntries.SdEntry.EntryTypes.find:
                pass
                if self.content._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"content", self._root, self.content._root)
                if self.content._parent != self:
                    raise kaitaistruct.ConsistencyError(u"content", self, self.content._parent)
            elif _on == SomeIpSdEntries.SdEntry.EntryTypes.offer:
                pass
                if self.content._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"content", self._root, self.content._root)
                if self.content._parent != self:
                    raise kaitaistruct.ConsistencyError(u"content", self, self.content._parent)
            elif _on == SomeIpSdEntries.SdEntry.EntryTypes.subscribe:
                pass
                if self.content._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"content", self._root, self.content._root)
                if self.content._parent != self:
                    raise kaitaistruct.ConsistencyError(u"content", self, self.content._parent)
            elif _on == SomeIpSdEntries.SdEntry.EntryTypes.subscribe_ack:
                pass
                if self.content._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"content", self._root, self.content._root)
                if self.content._parent != self:
                    raise kaitaistruct.ConsistencyError(u"content", self, self.content._parent)
            self._dirty = False

        class SdEntryHeader(ReadWriteKaitaiStruct):
            def __init__(self, _io=None, _parent=None, _root=None):
                super(SomeIpSdEntries.SdEntry.SdEntryHeader, self).__init__(_io)
                self._parent = _parent
                self._root = _root

            def _read(self):
                self.type = KaitaiStream.resolve_enum(SomeIpSdEntries.SdEntry.EntryTypes, self._io.read_u1())
                self.index_first_options = self._io.read_u1()
                self.index_second_options = self._io.read_u1()
                self.number_first_options = self._io.read_bits_int_be(4)
                self.number_second_options = self._io.read_bits_int_be(4)
                self.service_id = self._io.read_u2be()
                self.instance_id = self._io.read_u2be()
                self.major_version = self._io.read_u1()
                self.ttl = self._io.read_bits_int_be(24)
                self._dirty = False


            def _fetch_instances(self):
                pass


            def _write__seq(self, io=None):
                super(SomeIpSdEntries.SdEntry.SdEntryHeader, self)._write__seq(io)
                self._io.write_u1(int(self.type))
                self._io.write_u1(self.index_first_options)
                self._io.write_u1(self.index_second_options)
                self._io.write_bits_int_be(4, self.number_first_options)
                self._io.write_bits_int_be(4, self.number_second_options)
                self._io.write_u2be(self.service_id)
                self._io.write_u2be(self.instance_id)
                self._io.write_u1(self.major_version)
                self._io.write_bits_int_be(24, self.ttl)


            def _check(self):
                self._dirty = False


        class SdEventgroupEntry(ReadWriteKaitaiStruct):
            def __init__(self, _io=None, _parent=None, _root=None):
                super(SomeIpSdEntries.SdEntry.SdEventgroupEntry, self).__init__(_io)
                self._parent = _parent
                self._root = _root

            def _read(self):
                self.reserved = self._io.read_u1()
                self.initial_data_requested = self._io.read_bits_int_be(1) != 0
                self.reserved2 = self._io.read_bits_int_be(3)
                self.counter = self._io.read_bits_int_be(4)
                self.event_group_id = self._io.read_u2be()
                self._dirty = False


            def _fetch_instances(self):
                pass


            def _write__seq(self, io=None):
                super(SomeIpSdEntries.SdEntry.SdEventgroupEntry, self)._write__seq(io)
                self._io.write_u1(self.reserved)
                self._io.write_bits_int_be(1, int(self.initial_data_requested))
                self._io.write_bits_int_be(3, self.reserved2)
                self._io.write_bits_int_be(4, self.counter)
                self._io.write_u2be(self.event_group_id)


            def _check(self):
                self._dirty = False


        class SdServiceEntry(ReadWriteKaitaiStruct):
            def __init__(self, _io=None, _parent=None, _root=None):
                super(SomeIpSdEntries.SdEntry.SdServiceEntry, self).__init__(_io)
                self._parent = _parent
                self._root = _root

            def _read(self):
                self.minor_version = self._io.read_u4be()
                self._dirty = False


            def _fetch_instances(self):
                pass


            def _write__seq(self, io=None):
                super(SomeIpSdEntries.SdEntry.SdServiceEntry, self)._write__seq(io)
                self._io.write_u4be(self.minor_version)


            def _check(self):
                self._dirty = False




