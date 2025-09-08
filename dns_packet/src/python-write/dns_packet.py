# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import ReadWriteKaitaiStruct, KaitaiStream, BytesIO
from enum import IntEnum


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class DnsPacket(ReadWriteKaitaiStruct):
    """(No support for Auth-Name + Add-Name for simplicity)
    """

    class ClassType(IntEnum):
        in_class = 1
        cs = 2
        ch = 3
        hs = 4

    class TypeType(IntEnum):
        a = 1
        ns = 2
        md = 3
        mf = 4
        cname = 5
        soa = 6
        mb = 7
        mg = 8
        mr = 9
        null = 10
        wks = 11
        ptr = 12
        hinfo = 13
        minfo = 14
        mx = 15
        txt = 16
        aaaa = 28
        srv = 33
    def __init__(self, _io=None, _parent=None, _root=None):
        super(DnsPacket, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self

    def _read(self):
        self.transaction_id = self._io.read_u2be()
        self.flags = DnsPacket.PacketFlags(self._io, self, self._root)
        self.flags._read()
        if self.flags.is_opcode_valid:
            pass
            self.qdcount = self._io.read_u2be()

        if self.flags.is_opcode_valid:
            pass
            self.ancount = self._io.read_u2be()

        if self.flags.is_opcode_valid:
            pass
            self.nscount = self._io.read_u2be()

        if self.flags.is_opcode_valid:
            pass
            self.arcount = self._io.read_u2be()

        if self.flags.is_opcode_valid:
            pass
            self.queries = []
            for i in range(self.qdcount):
                _t_queries = DnsPacket.Query(self._io, self, self._root)
                try:
                    _t_queries._read()
                finally:
                    self.queries.append(_t_queries)


        if self.flags.is_opcode_valid:
            pass
            self.answers = []
            for i in range(self.ancount):
                _t_answers = DnsPacket.Answer(self._io, self, self._root)
                try:
                    _t_answers._read()
                finally:
                    self.answers.append(_t_answers)


        if self.flags.is_opcode_valid:
            pass
            self.authorities = []
            for i in range(self.nscount):
                _t_authorities = DnsPacket.Answer(self._io, self, self._root)
                try:
                    _t_authorities._read()
                finally:
                    self.authorities.append(_t_authorities)


        if self.flags.is_opcode_valid:
            pass
            self.additionals = []
            for i in range(self.arcount):
                _t_additionals = DnsPacket.Answer(self._io, self, self._root)
                try:
                    _t_additionals._read()
                finally:
                    self.additionals.append(_t_additionals)


        self._dirty = False


    def _fetch_instances(self):
        pass
        self.flags._fetch_instances()
        if self.flags.is_opcode_valid:
            pass

        if self.flags.is_opcode_valid:
            pass

        if self.flags.is_opcode_valid:
            pass

        if self.flags.is_opcode_valid:
            pass

        if self.flags.is_opcode_valid:
            pass
            for i in range(len(self.queries)):
                pass
                self.queries[i]._fetch_instances()


        if self.flags.is_opcode_valid:
            pass
            for i in range(len(self.answers)):
                pass
                self.answers[i]._fetch_instances()


        if self.flags.is_opcode_valid:
            pass
            for i in range(len(self.authorities)):
                pass
                self.authorities[i]._fetch_instances()


        if self.flags.is_opcode_valid:
            pass
            for i in range(len(self.additionals)):
                pass
                self.additionals[i]._fetch_instances()




    def _write__seq(self, io=None):
        super(DnsPacket, self)._write__seq(io)
        self._io.write_u2be(self.transaction_id)
        self.flags._write__seq(self._io)
        if self.flags.is_opcode_valid:
            pass
            self._io.write_u2be(self.qdcount)

        if self.flags.is_opcode_valid:
            pass
            self._io.write_u2be(self.ancount)

        if self.flags.is_opcode_valid:
            pass
            self._io.write_u2be(self.nscount)

        if self.flags.is_opcode_valid:
            pass
            self._io.write_u2be(self.arcount)

        if self.flags.is_opcode_valid:
            pass
            for i in range(len(self.queries)):
                pass
                self.queries[i]._write__seq(self._io)


        if self.flags.is_opcode_valid:
            pass
            for i in range(len(self.answers)):
                pass
                self.answers[i]._write__seq(self._io)


        if self.flags.is_opcode_valid:
            pass
            for i in range(len(self.authorities)):
                pass
                self.authorities[i]._write__seq(self._io)


        if self.flags.is_opcode_valid:
            pass
            for i in range(len(self.additionals)):
                pass
                self.additionals[i]._write__seq(self._io)




    def _check(self):
        if self.flags._root != self._root:
            raise kaitaistruct.ConsistencyError(u"flags", self._root, self.flags._root)
        if self.flags._parent != self:
            raise kaitaistruct.ConsistencyError(u"flags", self, self.flags._parent)
        if self.flags.is_opcode_valid:
            pass

        if self.flags.is_opcode_valid:
            pass

        if self.flags.is_opcode_valid:
            pass

        if self.flags.is_opcode_valid:
            pass

        if self.flags.is_opcode_valid:
            pass
            if len(self.queries) != self.qdcount:
                raise kaitaistruct.ConsistencyError(u"queries", self.qdcount, len(self.queries))
            for i in range(len(self.queries)):
                pass
                if self.queries[i]._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"queries", self._root, self.queries[i]._root)
                if self.queries[i]._parent != self:
                    raise kaitaistruct.ConsistencyError(u"queries", self, self.queries[i]._parent)


        if self.flags.is_opcode_valid:
            pass
            if len(self.answers) != self.ancount:
                raise kaitaistruct.ConsistencyError(u"answers", self.ancount, len(self.answers))
            for i in range(len(self.answers)):
                pass
                if self.answers[i]._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"answers", self._root, self.answers[i]._root)
                if self.answers[i]._parent != self:
                    raise kaitaistruct.ConsistencyError(u"answers", self, self.answers[i]._parent)


        if self.flags.is_opcode_valid:
            pass
            if len(self.authorities) != self.nscount:
                raise kaitaistruct.ConsistencyError(u"authorities", self.nscount, len(self.authorities))
            for i in range(len(self.authorities)):
                pass
                if self.authorities[i]._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"authorities", self._root, self.authorities[i]._root)
                if self.authorities[i]._parent != self:
                    raise kaitaistruct.ConsistencyError(u"authorities", self, self.authorities[i]._parent)


        if self.flags.is_opcode_valid:
            pass
            if len(self.additionals) != self.arcount:
                raise kaitaistruct.ConsistencyError(u"additionals", self.arcount, len(self.additionals))
            for i in range(len(self.additionals)):
                pass
                if self.additionals[i]._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"additionals", self._root, self.additionals[i]._root)
                if self.additionals[i]._parent != self:
                    raise kaitaistruct.ConsistencyError(u"additionals", self, self.additionals[i]._parent)


        self._dirty = False

    class Address(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(DnsPacket.Address, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.ip = self._io.read_bytes(4)
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(DnsPacket.Address, self)._write__seq(io)
            self._io.write_bytes(self.ip)


        def _check(self):
            if len(self.ip) != 4:
                raise kaitaistruct.ConsistencyError(u"ip", 4, len(self.ip))
            self._dirty = False


    class AddressV6(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(DnsPacket.AddressV6, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.ip_v6 = self._io.read_bytes(16)
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(DnsPacket.AddressV6, self)._write__seq(io)
            self._io.write_bytes(self.ip_v6)


        def _check(self):
            if len(self.ip_v6) != 16:
                raise kaitaistruct.ConsistencyError(u"ip_v6", 16, len(self.ip_v6))
            self._dirty = False


    class Answer(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(DnsPacket.Answer, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.name = DnsPacket.DomainName(self._io, self, self._root)
            self.name._read()
            self.type = KaitaiStream.resolve_enum(DnsPacket.TypeType, self._io.read_u2be())
            self.answer_class = KaitaiStream.resolve_enum(DnsPacket.ClassType, self._io.read_u2be())
            self.ttl = self._io.read_s4be()
            self.rdlength = self._io.read_u2be()
            _on = self.type
            if _on == DnsPacket.TypeType.a:
                pass
                self._raw_payload = self._io.read_bytes(self.rdlength)
                _io__raw_payload = KaitaiStream(BytesIO(self._raw_payload))
                self.payload = DnsPacket.Address(_io__raw_payload, self, self._root)
                self.payload._read()
            elif _on == DnsPacket.TypeType.aaaa:
                pass
                self._raw_payload = self._io.read_bytes(self.rdlength)
                _io__raw_payload = KaitaiStream(BytesIO(self._raw_payload))
                self.payload = DnsPacket.AddressV6(_io__raw_payload, self, self._root)
                self.payload._read()
            elif _on == DnsPacket.TypeType.cname:
                pass
                self._raw_payload = self._io.read_bytes(self.rdlength)
                _io__raw_payload = KaitaiStream(BytesIO(self._raw_payload))
                self.payload = DnsPacket.DomainName(_io__raw_payload, self, self._root)
                self.payload._read()
            elif _on == DnsPacket.TypeType.mx:
                pass
                self._raw_payload = self._io.read_bytes(self.rdlength)
                _io__raw_payload = KaitaiStream(BytesIO(self._raw_payload))
                self.payload = DnsPacket.MxInfo(_io__raw_payload, self, self._root)
                self.payload._read()
            elif _on == DnsPacket.TypeType.ns:
                pass
                self._raw_payload = self._io.read_bytes(self.rdlength)
                _io__raw_payload = KaitaiStream(BytesIO(self._raw_payload))
                self.payload = DnsPacket.DomainName(_io__raw_payload, self, self._root)
                self.payload._read()
            elif _on == DnsPacket.TypeType.ptr:
                pass
                self._raw_payload = self._io.read_bytes(self.rdlength)
                _io__raw_payload = KaitaiStream(BytesIO(self._raw_payload))
                self.payload = DnsPacket.DomainName(_io__raw_payload, self, self._root)
                self.payload._read()
            elif _on == DnsPacket.TypeType.soa:
                pass
                self._raw_payload = self._io.read_bytes(self.rdlength)
                _io__raw_payload = KaitaiStream(BytesIO(self._raw_payload))
                self.payload = DnsPacket.AuthorityInfo(_io__raw_payload, self, self._root)
                self.payload._read()
            elif _on == DnsPacket.TypeType.srv:
                pass
                self._raw_payload = self._io.read_bytes(self.rdlength)
                _io__raw_payload = KaitaiStream(BytesIO(self._raw_payload))
                self.payload = DnsPacket.Service(_io__raw_payload, self, self._root)
                self.payload._read()
            elif _on == DnsPacket.TypeType.txt:
                pass
                self._raw_payload = self._io.read_bytes(self.rdlength)
                _io__raw_payload = KaitaiStream(BytesIO(self._raw_payload))
                self.payload = DnsPacket.TxtBody(_io__raw_payload, self, self._root)
                self.payload._read()
            else:
                pass
                self.payload = self._io.read_bytes(self.rdlength)
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.name._fetch_instances()
            _on = self.type
            if _on == DnsPacket.TypeType.a:
                pass
                self.payload._fetch_instances()
            elif _on == DnsPacket.TypeType.aaaa:
                pass
                self.payload._fetch_instances()
            elif _on == DnsPacket.TypeType.cname:
                pass
                self.payload._fetch_instances()
            elif _on == DnsPacket.TypeType.mx:
                pass
                self.payload._fetch_instances()
            elif _on == DnsPacket.TypeType.ns:
                pass
                self.payload._fetch_instances()
            elif _on == DnsPacket.TypeType.ptr:
                pass
                self.payload._fetch_instances()
            elif _on == DnsPacket.TypeType.soa:
                pass
                self.payload._fetch_instances()
            elif _on == DnsPacket.TypeType.srv:
                pass
                self.payload._fetch_instances()
            elif _on == DnsPacket.TypeType.txt:
                pass
                self.payload._fetch_instances()
            else:
                pass


        def _write__seq(self, io=None):
            super(DnsPacket.Answer, self)._write__seq(io)
            self.name._write__seq(self._io)
            self._io.write_u2be(int(self.type))
            self._io.write_u2be(int(self.answer_class))
            self._io.write_s4be(self.ttl)
            self._io.write_u2be(self.rdlength)
            _on = self.type
            if _on == DnsPacket.TypeType.a:
                pass
                _io__raw_payload = KaitaiStream(BytesIO(bytearray(self.rdlength)))
                self._io.add_child_stream(_io__raw_payload)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.rdlength))
                def handler(parent, _io__raw_payload=_io__raw_payload):
                    self._raw_payload = _io__raw_payload.to_byte_array()
                    if len(self._raw_payload) != self.rdlength:
                        raise kaitaistruct.ConsistencyError(u"raw(payload)", self.rdlength, len(self._raw_payload))
                    parent.write_bytes(self._raw_payload)
                _io__raw_payload.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.payload._write__seq(_io__raw_payload)
            elif _on == DnsPacket.TypeType.aaaa:
                pass
                _io__raw_payload = KaitaiStream(BytesIO(bytearray(self.rdlength)))
                self._io.add_child_stream(_io__raw_payload)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.rdlength))
                def handler(parent, _io__raw_payload=_io__raw_payload):
                    self._raw_payload = _io__raw_payload.to_byte_array()
                    if len(self._raw_payload) != self.rdlength:
                        raise kaitaistruct.ConsistencyError(u"raw(payload)", self.rdlength, len(self._raw_payload))
                    parent.write_bytes(self._raw_payload)
                _io__raw_payload.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.payload._write__seq(_io__raw_payload)
            elif _on == DnsPacket.TypeType.cname:
                pass
                _io__raw_payload = KaitaiStream(BytesIO(bytearray(self.rdlength)))
                self._io.add_child_stream(_io__raw_payload)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.rdlength))
                def handler(parent, _io__raw_payload=_io__raw_payload):
                    self._raw_payload = _io__raw_payload.to_byte_array()
                    if len(self._raw_payload) != self.rdlength:
                        raise kaitaistruct.ConsistencyError(u"raw(payload)", self.rdlength, len(self._raw_payload))
                    parent.write_bytes(self._raw_payload)
                _io__raw_payload.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.payload._write__seq(_io__raw_payload)
            elif _on == DnsPacket.TypeType.mx:
                pass
                _io__raw_payload = KaitaiStream(BytesIO(bytearray(self.rdlength)))
                self._io.add_child_stream(_io__raw_payload)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.rdlength))
                def handler(parent, _io__raw_payload=_io__raw_payload):
                    self._raw_payload = _io__raw_payload.to_byte_array()
                    if len(self._raw_payload) != self.rdlength:
                        raise kaitaistruct.ConsistencyError(u"raw(payload)", self.rdlength, len(self._raw_payload))
                    parent.write_bytes(self._raw_payload)
                _io__raw_payload.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.payload._write__seq(_io__raw_payload)
            elif _on == DnsPacket.TypeType.ns:
                pass
                _io__raw_payload = KaitaiStream(BytesIO(bytearray(self.rdlength)))
                self._io.add_child_stream(_io__raw_payload)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.rdlength))
                def handler(parent, _io__raw_payload=_io__raw_payload):
                    self._raw_payload = _io__raw_payload.to_byte_array()
                    if len(self._raw_payload) != self.rdlength:
                        raise kaitaistruct.ConsistencyError(u"raw(payload)", self.rdlength, len(self._raw_payload))
                    parent.write_bytes(self._raw_payload)
                _io__raw_payload.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.payload._write__seq(_io__raw_payload)
            elif _on == DnsPacket.TypeType.ptr:
                pass
                _io__raw_payload = KaitaiStream(BytesIO(bytearray(self.rdlength)))
                self._io.add_child_stream(_io__raw_payload)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.rdlength))
                def handler(parent, _io__raw_payload=_io__raw_payload):
                    self._raw_payload = _io__raw_payload.to_byte_array()
                    if len(self._raw_payload) != self.rdlength:
                        raise kaitaistruct.ConsistencyError(u"raw(payload)", self.rdlength, len(self._raw_payload))
                    parent.write_bytes(self._raw_payload)
                _io__raw_payload.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.payload._write__seq(_io__raw_payload)
            elif _on == DnsPacket.TypeType.soa:
                pass
                _io__raw_payload = KaitaiStream(BytesIO(bytearray(self.rdlength)))
                self._io.add_child_stream(_io__raw_payload)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.rdlength))
                def handler(parent, _io__raw_payload=_io__raw_payload):
                    self._raw_payload = _io__raw_payload.to_byte_array()
                    if len(self._raw_payload) != self.rdlength:
                        raise kaitaistruct.ConsistencyError(u"raw(payload)", self.rdlength, len(self._raw_payload))
                    parent.write_bytes(self._raw_payload)
                _io__raw_payload.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.payload._write__seq(_io__raw_payload)
            elif _on == DnsPacket.TypeType.srv:
                pass
                _io__raw_payload = KaitaiStream(BytesIO(bytearray(self.rdlength)))
                self._io.add_child_stream(_io__raw_payload)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.rdlength))
                def handler(parent, _io__raw_payload=_io__raw_payload):
                    self._raw_payload = _io__raw_payload.to_byte_array()
                    if len(self._raw_payload) != self.rdlength:
                        raise kaitaistruct.ConsistencyError(u"raw(payload)", self.rdlength, len(self._raw_payload))
                    parent.write_bytes(self._raw_payload)
                _io__raw_payload.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.payload._write__seq(_io__raw_payload)
            elif _on == DnsPacket.TypeType.txt:
                pass
                _io__raw_payload = KaitaiStream(BytesIO(bytearray(self.rdlength)))
                self._io.add_child_stream(_io__raw_payload)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.rdlength))
                def handler(parent, _io__raw_payload=_io__raw_payload):
                    self._raw_payload = _io__raw_payload.to_byte_array()
                    if len(self._raw_payload) != self.rdlength:
                        raise kaitaistruct.ConsistencyError(u"raw(payload)", self.rdlength, len(self._raw_payload))
                    parent.write_bytes(self._raw_payload)
                _io__raw_payload.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.payload._write__seq(_io__raw_payload)
            else:
                pass
                self._io.write_bytes(self.payload)


        def _check(self):
            if self.name._root != self._root:
                raise kaitaistruct.ConsistencyError(u"name", self._root, self.name._root)
            if self.name._parent != self:
                raise kaitaistruct.ConsistencyError(u"name", self, self.name._parent)
            _on = self.type
            if _on == DnsPacket.TypeType.a:
                pass
                if self.payload._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"payload", self._root, self.payload._root)
                if self.payload._parent != self:
                    raise kaitaistruct.ConsistencyError(u"payload", self, self.payload._parent)
            elif _on == DnsPacket.TypeType.aaaa:
                pass
                if self.payload._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"payload", self._root, self.payload._root)
                if self.payload._parent != self:
                    raise kaitaistruct.ConsistencyError(u"payload", self, self.payload._parent)
            elif _on == DnsPacket.TypeType.cname:
                pass
                if self.payload._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"payload", self._root, self.payload._root)
                if self.payload._parent != self:
                    raise kaitaistruct.ConsistencyError(u"payload", self, self.payload._parent)
            elif _on == DnsPacket.TypeType.mx:
                pass
                if self.payload._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"payload", self._root, self.payload._root)
                if self.payload._parent != self:
                    raise kaitaistruct.ConsistencyError(u"payload", self, self.payload._parent)
            elif _on == DnsPacket.TypeType.ns:
                pass
                if self.payload._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"payload", self._root, self.payload._root)
                if self.payload._parent != self:
                    raise kaitaistruct.ConsistencyError(u"payload", self, self.payload._parent)
            elif _on == DnsPacket.TypeType.ptr:
                pass
                if self.payload._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"payload", self._root, self.payload._root)
                if self.payload._parent != self:
                    raise kaitaistruct.ConsistencyError(u"payload", self, self.payload._parent)
            elif _on == DnsPacket.TypeType.soa:
                pass
                if self.payload._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"payload", self._root, self.payload._root)
                if self.payload._parent != self:
                    raise kaitaistruct.ConsistencyError(u"payload", self, self.payload._parent)
            elif _on == DnsPacket.TypeType.srv:
                pass
                if self.payload._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"payload", self._root, self.payload._root)
                if self.payload._parent != self:
                    raise kaitaistruct.ConsistencyError(u"payload", self, self.payload._parent)
            elif _on == DnsPacket.TypeType.txt:
                pass
                if self.payload._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"payload", self._root, self.payload._root)
                if self.payload._parent != self:
                    raise kaitaistruct.ConsistencyError(u"payload", self, self.payload._parent)
            else:
                pass
                if len(self.payload) != self.rdlength:
                    raise kaitaistruct.ConsistencyError(u"payload", self.rdlength, len(self.payload))
            self._dirty = False


    class AuthorityInfo(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(DnsPacket.AuthorityInfo, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.primary_ns = DnsPacket.DomainName(self._io, self, self._root)
            self.primary_ns._read()
            self.resoponsible_mailbox = DnsPacket.DomainName(self._io, self, self._root)
            self.resoponsible_mailbox._read()
            self.serial = self._io.read_u4be()
            self.refresh_interval = self._io.read_u4be()
            self.retry_interval = self._io.read_u4be()
            self.expire_limit = self._io.read_u4be()
            self.min_ttl = self._io.read_u4be()
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.primary_ns._fetch_instances()
            self.resoponsible_mailbox._fetch_instances()


        def _write__seq(self, io=None):
            super(DnsPacket.AuthorityInfo, self)._write__seq(io)
            self.primary_ns._write__seq(self._io)
            self.resoponsible_mailbox._write__seq(self._io)
            self._io.write_u4be(self.serial)
            self._io.write_u4be(self.refresh_interval)
            self._io.write_u4be(self.retry_interval)
            self._io.write_u4be(self.expire_limit)
            self._io.write_u4be(self.min_ttl)


        def _check(self):
            if self.primary_ns._root != self._root:
                raise kaitaistruct.ConsistencyError(u"primary_ns", self._root, self.primary_ns._root)
            if self.primary_ns._parent != self:
                raise kaitaistruct.ConsistencyError(u"primary_ns", self, self.primary_ns._parent)
            if self.resoponsible_mailbox._root != self._root:
                raise kaitaistruct.ConsistencyError(u"resoponsible_mailbox", self._root, self.resoponsible_mailbox._root)
            if self.resoponsible_mailbox._parent != self:
                raise kaitaistruct.ConsistencyError(u"resoponsible_mailbox", self, self.resoponsible_mailbox._parent)
            self._dirty = False


    class DomainName(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(DnsPacket.DomainName, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.name = []
            i = 0
            while True:
                _t_name = DnsPacket.Label(self._io, self, self._root)
                try:
                    _t_name._read()
                finally:
                    _ = _t_name
                    self.name.append(_)
                if  ((_.length == 0) or (_.length >= 192)) :
                    break
                i += 1
            self._dirty = False


        def _fetch_instances(self):
            pass
            for i in range(len(self.name)):
                pass
                self.name[i]._fetch_instances()



        def _write__seq(self, io=None):
            super(DnsPacket.DomainName, self)._write__seq(io)
            for i in range(len(self.name)):
                pass
                self.name[i]._write__seq(self._io)



        def _check(self):
            if len(self.name) == 0:
                raise kaitaistruct.ConsistencyError(u"name", 0, len(self.name))
            for i in range(len(self.name)):
                pass
                if self.name[i]._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"name", self._root, self.name[i]._root)
                if self.name[i]._parent != self:
                    raise kaitaistruct.ConsistencyError(u"name", self, self.name[i]._parent)
                _ = self.name[i]
                if  ((_.length == 0) or (_.length >= 192))  != (i == len(self.name) - 1):
                    raise kaitaistruct.ConsistencyError(u"name", i == len(self.name) - 1,  ((_.length == 0) or (_.length >= 192)) )

            self._dirty = False


    class Label(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(DnsPacket.Label, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.length = self._io.read_u1()
            if self.is_pointer:
                pass
                self.pointer = DnsPacket.PointerStruct(self._io, self, self._root)
                self.pointer._read()

            if (not (self.is_pointer)):
                pass
                self.name = (self._io.read_bytes(self.length)).decode(u"UTF-8")

            self._dirty = False


        def _fetch_instances(self):
            pass
            if self.is_pointer:
                pass
                self.pointer._fetch_instances()

            if (not (self.is_pointer)):
                pass



        def _write__seq(self, io=None):
            super(DnsPacket.Label, self)._write__seq(io)
            self._io.write_u1(self.length)
            if self.is_pointer:
                pass
                self.pointer._write__seq(self._io)

            if (not (self.is_pointer)):
                pass
                self._io.write_bytes((self.name).encode(u"UTF-8"))



        def _check(self):
            if self.is_pointer:
                pass
                if self.pointer._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"pointer", self._root, self.pointer._root)
                if self.pointer._parent != self:
                    raise kaitaistruct.ConsistencyError(u"pointer", self, self.pointer._parent)

            if (not (self.is_pointer)):
                pass
                if len((self.name).encode(u"UTF-8")) != self.length:
                    raise kaitaistruct.ConsistencyError(u"name", self.length, len((self.name).encode(u"UTF-8")))

            self._dirty = False

        @property
        def is_pointer(self):
            if hasattr(self, '_m_is_pointer'):
                return self._m_is_pointer

            self._m_is_pointer = self.length >= 192
            return getattr(self, '_m_is_pointer', None)

        def _invalidate_is_pointer(self):
            del self._m_is_pointer

    class MxInfo(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(DnsPacket.MxInfo, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.preference = self._io.read_u2be()
            self.mx = DnsPacket.DomainName(self._io, self, self._root)
            self.mx._read()
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.mx._fetch_instances()


        def _write__seq(self, io=None):
            super(DnsPacket.MxInfo, self)._write__seq(io)
            self._io.write_u2be(self.preference)
            self.mx._write__seq(self._io)


        def _check(self):
            if self.mx._root != self._root:
                raise kaitaistruct.ConsistencyError(u"mx", self._root, self.mx._root)
            if self.mx._parent != self:
                raise kaitaistruct.ConsistencyError(u"mx", self, self.mx._parent)
            self._dirty = False


    class PacketFlags(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(DnsPacket.PacketFlags, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.flag = self._io.read_u2be()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(DnsPacket.PacketFlags, self)._write__seq(io)
            self._io.write_u2be(self.flag)


        def _check(self):
            self._dirty = False

        @property
        def aa(self):
            if hasattr(self, '_m_aa'):
                return self._m_aa

            self._m_aa = (self.flag & 1024) >> 10
            return getattr(self, '_m_aa', None)

        def _invalidate_aa(self):
            del self._m_aa
        @property
        def ad(self):
            if hasattr(self, '_m_ad'):
                return self._m_ad

            self._m_ad = (self.flag & 32) >> 5
            return getattr(self, '_m_ad', None)

        def _invalidate_ad(self):
            del self._m_ad
        @property
        def cd(self):
            if hasattr(self, '_m_cd'):
                return self._m_cd

            self._m_cd = (self.flag & 16) >> 4
            return getattr(self, '_m_cd', None)

        def _invalidate_cd(self):
            del self._m_cd
        @property
        def is_opcode_valid(self):
            if hasattr(self, '_m_is_opcode_valid'):
                return self._m_is_opcode_valid

            self._m_is_opcode_valid =  ((self.opcode == 0) or (self.opcode == 1) or (self.opcode == 2)) 
            return getattr(self, '_m_is_opcode_valid', None)

        def _invalidate_is_opcode_valid(self):
            del self._m_is_opcode_valid
        @property
        def opcode(self):
            if hasattr(self, '_m_opcode'):
                return self._m_opcode

            self._m_opcode = (self.flag & 30720) >> 11
            return getattr(self, '_m_opcode', None)

        def _invalidate_opcode(self):
            del self._m_opcode
        @property
        def qr(self):
            if hasattr(self, '_m_qr'):
                return self._m_qr

            self._m_qr = (self.flag & 32768) >> 15
            return getattr(self, '_m_qr', None)

        def _invalidate_qr(self):
            del self._m_qr
        @property
        def ra(self):
            if hasattr(self, '_m_ra'):
                return self._m_ra

            self._m_ra = (self.flag & 128) >> 7
            return getattr(self, '_m_ra', None)

        def _invalidate_ra(self):
            del self._m_ra
        @property
        def rcode(self):
            if hasattr(self, '_m_rcode'):
                return self._m_rcode

            self._m_rcode = (self.flag & 15) >> 0
            return getattr(self, '_m_rcode', None)

        def _invalidate_rcode(self):
            del self._m_rcode
        @property
        def rd(self):
            if hasattr(self, '_m_rd'):
                return self._m_rd

            self._m_rd = (self.flag & 256) >> 8
            return getattr(self, '_m_rd', None)

        def _invalidate_rd(self):
            del self._m_rd
        @property
        def tc(self):
            if hasattr(self, '_m_tc'):
                return self._m_tc

            self._m_tc = (self.flag & 512) >> 9
            return getattr(self, '_m_tc', None)

        def _invalidate_tc(self):
            del self._m_tc
        @property
        def z(self):
            if hasattr(self, '_m_z'):
                return self._m_z

            self._m_z = (self.flag & 64) >> 6
            return getattr(self, '_m_z', None)

        def _invalidate_z(self):
            del self._m_z

    class PointerStruct(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(DnsPacket.PointerStruct, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._should_write_contents = False
            self.contents__enabled = True

        def _read(self):
            self.value = self._io.read_u1()
            self._dirty = False


        def _fetch_instances(self):
            pass
            _ = self.contents
            if hasattr(self, '_m_contents'):
                pass
                self._m_contents._fetch_instances()



        def _write__seq(self, io=None):
            super(DnsPacket.PointerStruct, self)._write__seq(io)
            self._should_write_contents = self.contents__enabled
            self._io.write_u1(self.value)


        def _check(self):
            if self.contents__enabled:
                pass
                if self._m_contents._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"contents", self._root, self._m_contents._root)
                if self._m_contents._parent != self:
                    raise kaitaistruct.ConsistencyError(u"contents", self, self._m_contents._parent)

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
            io.seek(self.value + (self._parent.length - 192 << 8))
            self._m_contents = DnsPacket.DomainName(io, self, self._root)
            self._m_contents._read()
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
            io.seek(self.value + (self._parent.length - 192 << 8))
            self._m_contents._write__seq(io)
            io.seek(_pos)


    class Query(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(DnsPacket.Query, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.name = DnsPacket.DomainName(self._io, self, self._root)
            self.name._read()
            self.type = KaitaiStream.resolve_enum(DnsPacket.TypeType, self._io.read_u2be())
            self.query_class = KaitaiStream.resolve_enum(DnsPacket.ClassType, self._io.read_u2be())
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.name._fetch_instances()


        def _write__seq(self, io=None):
            super(DnsPacket.Query, self)._write__seq(io)
            self.name._write__seq(self._io)
            self._io.write_u2be(int(self.type))
            self._io.write_u2be(int(self.query_class))


        def _check(self):
            if self.name._root != self._root:
                raise kaitaistruct.ConsistencyError(u"name", self._root, self.name._root)
            if self.name._parent != self:
                raise kaitaistruct.ConsistencyError(u"name", self, self.name._parent)
            self._dirty = False


    class Service(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(DnsPacket.Service, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.priority = self._io.read_u2be()
            self.weight = self._io.read_u2be()
            self.port = self._io.read_u2be()
            self.target = DnsPacket.DomainName(self._io, self, self._root)
            self.target._read()
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.target._fetch_instances()


        def _write__seq(self, io=None):
            super(DnsPacket.Service, self)._write__seq(io)
            self._io.write_u2be(self.priority)
            self._io.write_u2be(self.weight)
            self._io.write_u2be(self.port)
            self.target._write__seq(self._io)


        def _check(self):
            if self.target._root != self._root:
                raise kaitaistruct.ConsistencyError(u"target", self._root, self.target._root)
            if self.target._parent != self:
                raise kaitaistruct.ConsistencyError(u"target", self, self.target._parent)
            self._dirty = False


    class Txt(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(DnsPacket.Txt, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.length = self._io.read_u1()
            self.text = (self._io.read_bytes(self.length)).decode(u"UTF-8")
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(DnsPacket.Txt, self)._write__seq(io)
            self._io.write_u1(self.length)
            self._io.write_bytes((self.text).encode(u"UTF-8"))


        def _check(self):
            if len((self.text).encode(u"UTF-8")) != self.length:
                raise kaitaistruct.ConsistencyError(u"text", self.length, len((self.text).encode(u"UTF-8")))
            self._dirty = False


    class TxtBody(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(DnsPacket.TxtBody, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.data = []
            i = 0
            while not self._io.is_eof():
                _t_data = DnsPacket.Txt(self._io, self, self._root)
                try:
                    _t_data._read()
                finally:
                    self.data.append(_t_data)
                i += 1

            self._dirty = False


        def _fetch_instances(self):
            pass
            for i in range(len(self.data)):
                pass
                self.data[i]._fetch_instances()



        def _write__seq(self, io=None):
            super(DnsPacket.TxtBody, self)._write__seq(io)
            for i in range(len(self.data)):
                pass
                if self._io.is_eof():
                    raise kaitaistruct.ConsistencyError(u"data", 0, self._io.size() - self._io.pos())
                self.data[i]._write__seq(self._io)

            if not self._io.is_eof():
                raise kaitaistruct.ConsistencyError(u"data", 0, self._io.size() - self._io.pos())


        def _check(self):
            for i in range(len(self.data)):
                pass
                if self.data[i]._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"data", self._root, self.data[i]._root)
                if self.data[i]._parent != self:
                    raise kaitaistruct.ConsistencyError(u"data", self, self.data[i]._parent)

            self._dirty = False



