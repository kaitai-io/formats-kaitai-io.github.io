# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import ReadWriteKaitaiStruct, KaitaiStream, BytesIO
import protocol_body


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class Ipv4Packet(ReadWriteKaitaiStruct):
    def __init__(self, _io=None, _parent=None, _root=None):
        super(Ipv4Packet, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self

    def _read(self):
        self.b1 = self._io.read_u1()
        self.b2 = self._io.read_u1()
        self.total_length = self._io.read_u2be()
        self.identification = self._io.read_u2be()
        self.b67 = self._io.read_u2be()
        self.ttl = self._io.read_u1()
        self.protocol = self._io.read_u1()
        self.header_checksum = self._io.read_u2be()
        self.src_ip_addr = self._io.read_bytes(4)
        self.dst_ip_addr = self._io.read_bytes(4)
        self._raw_options = self._io.read_bytes(self.ihl_bytes - 20)
        _io__raw_options = KaitaiStream(BytesIO(self._raw_options))
        self.options = Ipv4Packet.Ipv4Options(_io__raw_options, self, self._root)
        self.options._read()
        self._raw_body = self._io.read_bytes(self.total_length - self.ihl_bytes)
        _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
        self.body = protocol_body.ProtocolBody(self.protocol, _io__raw_body)
        self.body._read()
        self._dirty = False


    def _fetch_instances(self):
        pass
        self.options._fetch_instances()
        self.body._fetch_instances()


    def _write__seq(self, io=None):
        super(Ipv4Packet, self)._write__seq(io)
        self._io.write_u1(self.b1)
        self._io.write_u1(self.b2)
        self._io.write_u2be(self.total_length)
        self._io.write_u2be(self.identification)
        self._io.write_u2be(self.b67)
        self._io.write_u1(self.ttl)
        self._io.write_u1(self.protocol)
        self._io.write_u2be(self.header_checksum)
        self._io.write_bytes(self.src_ip_addr)
        self._io.write_bytes(self.dst_ip_addr)
        _io__raw_options = KaitaiStream(BytesIO(bytearray(self.ihl_bytes - 20)))
        self._io.add_child_stream(_io__raw_options)
        _pos2 = self._io.pos()
        self._io.seek(self._io.pos() + (self.ihl_bytes - 20))
        def handler(parent, _io__raw_options=_io__raw_options):
            self._raw_options = _io__raw_options.to_byte_array()
            if len(self._raw_options) != self.ihl_bytes - 20:
                raise kaitaistruct.ConsistencyError(u"raw(options)", self.ihl_bytes - 20, len(self._raw_options))
            parent.write_bytes(self._raw_options)
        _io__raw_options.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
        self.options._write__seq(_io__raw_options)
        _io__raw_body = KaitaiStream(BytesIO(bytearray(self.total_length - self.ihl_bytes)))
        self._io.add_child_stream(_io__raw_body)
        _pos2 = self._io.pos()
        self._io.seek(self._io.pos() + (self.total_length - self.ihl_bytes))
        def handler(parent, _io__raw_body=_io__raw_body):
            self._raw_body = _io__raw_body.to_byte_array()
            if len(self._raw_body) != self.total_length - self.ihl_bytes:
                raise kaitaistruct.ConsistencyError(u"raw(body)", self.total_length - self.ihl_bytes, len(self._raw_body))
            parent.write_bytes(self._raw_body)
        _io__raw_body.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
        self.body._write__seq(_io__raw_body)


    def _check(self):
        if len(self.src_ip_addr) != 4:
            raise kaitaistruct.ConsistencyError(u"src_ip_addr", 4, len(self.src_ip_addr))
        if len(self.dst_ip_addr) != 4:
            raise kaitaistruct.ConsistencyError(u"dst_ip_addr", 4, len(self.dst_ip_addr))
        if self.options._root != self._root:
            raise kaitaistruct.ConsistencyError(u"options", self._root, self.options._root)
        if self.options._parent != self:
            raise kaitaistruct.ConsistencyError(u"options", self, self.options._parent)
        if self.body.protocol_num != self.protocol:
            raise kaitaistruct.ConsistencyError(u"body", self.protocol, self.body.protocol_num)
        self._dirty = False

    class Ipv4Option(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Ipv4Packet.Ipv4Option, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.b1 = self._io.read_u1()
            self.len = self._io.read_u1()
            self.body = self._io.read_bytes((self.len - 2 if self.len > 2 else 0))
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(Ipv4Packet.Ipv4Option, self)._write__seq(io)
            self._io.write_u1(self.b1)
            self._io.write_u1(self.len)
            self._io.write_bytes(self.body)


        def _check(self):
            if len(self.body) != (self.len - 2 if self.len > 2 else 0):
                raise kaitaistruct.ConsistencyError(u"body", (self.len - 2 if self.len > 2 else 0), len(self.body))
            self._dirty = False

        @property
        def copy(self):
            if hasattr(self, '_m_copy'):
                return self._m_copy

            self._m_copy = (self.b1 & 128) >> 7
            return getattr(self, '_m_copy', None)

        def _invalidate_copy(self):
            del self._m_copy
        @property
        def number(self):
            if hasattr(self, '_m_number'):
                return self._m_number

            self._m_number = self.b1 & 31
            return getattr(self, '_m_number', None)

        def _invalidate_number(self):
            del self._m_number
        @property
        def opt_class(self):
            if hasattr(self, '_m_opt_class'):
                return self._m_opt_class

            self._m_opt_class = (self.b1 & 96) >> 5
            return getattr(self, '_m_opt_class', None)

        def _invalidate_opt_class(self):
            del self._m_opt_class

    class Ipv4Options(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Ipv4Packet.Ipv4Options, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.entries = []
            i = 0
            while not self._io.is_eof():
                _t_entries = Ipv4Packet.Ipv4Option(self._io, self, self._root)
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
            super(Ipv4Packet.Ipv4Options, self)._write__seq(io)
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
    def ihl(self):
        if hasattr(self, '_m_ihl'):
            return self._m_ihl

        self._m_ihl = self.b1 & 15
        return getattr(self, '_m_ihl', None)

    def _invalidate_ihl(self):
        del self._m_ihl
    @property
    def ihl_bytes(self):
        if hasattr(self, '_m_ihl_bytes'):
            return self._m_ihl_bytes

        self._m_ihl_bytes = self.ihl * 4
        return getattr(self, '_m_ihl_bytes', None)

    def _invalidate_ihl_bytes(self):
        del self._m_ihl_bytes
    @property
    def version(self):
        if hasattr(self, '_m_version'):
            return self._m_version

        self._m_version = (self.b1 & 240) >> 4
        return getattr(self, '_m_version', None)

    def _invalidate_version(self):
        del self._m_version

