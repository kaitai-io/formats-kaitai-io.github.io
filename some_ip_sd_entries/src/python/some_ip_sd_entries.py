# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import KaitaiStruct, KaitaiStream, BytesIO
from enum import IntEnum


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class SomeIpSdEntries(KaitaiStruct):
    """The entries are used to synchronize the state of services instances and the
    Publish/-Subscribe handling.
    
    .. seealso::
       section 4.1.2.3  Entry Format - https://www.autosar.org/fileadmin/standards/foundation/19-11/AUTOSAR_PRS_SOMEIPServiceDiscoveryProtocol.pdf
       -
    """
    def __init__(self, _io, _parent=None, _root=None):
        super(SomeIpSdEntries, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self
        self._read()

    def _read(self):
        self.entries = []
        i = 0
        while not self._io.is_eof():
            self.entries.append(SomeIpSdEntries.SdEntry(self._io, self, self._root))
            i += 1



    def _fetch_instances(self):
        pass
        for i in range(len(self.entries)):
            pass
            self.entries[i]._fetch_instances()


    class SdEntry(KaitaiStruct):

        class EntryTypes(IntEnum):
            find = 0
            offer = 1
            subscribe = 6
            subscribe_ack = 7
        def __init__(self, _io, _parent=None, _root=None):
            super(SomeIpSdEntries.SdEntry, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.header = SomeIpSdEntries.SdEntry.SdEntryHeader(self._io, self, self._root)
            _on = self.header.type
            if _on == SomeIpSdEntries.SdEntry.EntryTypes.find:
                pass
                self.content = SomeIpSdEntries.SdEntry.SdServiceEntry(self._io, self, self._root)
            elif _on == SomeIpSdEntries.SdEntry.EntryTypes.offer:
                pass
                self.content = SomeIpSdEntries.SdEntry.SdServiceEntry(self._io, self, self._root)
            elif _on == SomeIpSdEntries.SdEntry.EntryTypes.subscribe:
                pass
                self.content = SomeIpSdEntries.SdEntry.SdEventgroupEntry(self._io, self, self._root)
            elif _on == SomeIpSdEntries.SdEntry.EntryTypes.subscribe_ack:
                pass
                self.content = SomeIpSdEntries.SdEntry.SdEventgroupEntry(self._io, self, self._root)


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

        class SdEntryHeader(KaitaiStruct):
            def __init__(self, _io, _parent=None, _root=None):
                super(SomeIpSdEntries.SdEntry.SdEntryHeader, self).__init__(_io)
                self._parent = _parent
                self._root = _root
                self._read()

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


            def _fetch_instances(self):
                pass


        class SdEventgroupEntry(KaitaiStruct):
            def __init__(self, _io, _parent=None, _root=None):
                super(SomeIpSdEntries.SdEntry.SdEventgroupEntry, self).__init__(_io)
                self._parent = _parent
                self._root = _root
                self._read()

            def _read(self):
                self.reserved = self._io.read_u1()
                self.initial_data_requested = self._io.read_bits_int_be(1) != 0
                self.reserved2 = self._io.read_bits_int_be(3)
                self.counter = self._io.read_bits_int_be(4)
                self.event_group_id = self._io.read_u2be()


            def _fetch_instances(self):
                pass


        class SdServiceEntry(KaitaiStruct):
            def __init__(self, _io, _parent=None, _root=None):
                super(SomeIpSdEntries.SdEntry.SdServiceEntry, self).__init__(_io)
                self._parent = _parent
                self._root = _root
                self._read()

            def _read(self):
                self.minor_version = self._io.read_u4be()


            def _fetch_instances(self):
                pass




