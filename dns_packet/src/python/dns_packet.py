# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import KaitaiStruct, KaitaiStream, BytesIO
from enum import IntEnum


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class DnsPacket(KaitaiStruct):
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
    def __init__(self, _io, _parent=None, _root=None):
        super(DnsPacket, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self
        self._read()

    def _read(self):
        self.transaction_id = self._io.read_u2be()
        self.flags = DnsPacket.PacketFlags(self._io, self, self._root)
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
                self.queries.append(DnsPacket.Query(self._io, self, self._root))


        if self.flags.is_opcode_valid:
            pass
            self.answers = []
            for i in range(self.ancount):
                self.answers.append(DnsPacket.Answer(self._io, self, self._root))


        if self.flags.is_opcode_valid:
            pass
            self.authorities = []
            for i in range(self.nscount):
                self.authorities.append(DnsPacket.Answer(self._io, self, self._root))


        if self.flags.is_opcode_valid:
            pass
            self.additionals = []
            for i in range(self.arcount):
                self.additionals.append(DnsPacket.Answer(self._io, self, self._root))




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



    class Address(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(DnsPacket.Address, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.ip = self._io.read_bytes(4)


        def _fetch_instances(self):
            pass


    class AddressV6(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(DnsPacket.AddressV6, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.ip_v6 = self._io.read_bytes(16)


        def _fetch_instances(self):
            pass


    class Answer(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(DnsPacket.Answer, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.name = DnsPacket.DomainName(self._io, self, self._root)
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
            elif _on == DnsPacket.TypeType.aaaa:
                pass
                self._raw_payload = self._io.read_bytes(self.rdlength)
                _io__raw_payload = KaitaiStream(BytesIO(self._raw_payload))
                self.payload = DnsPacket.AddressV6(_io__raw_payload, self, self._root)
            elif _on == DnsPacket.TypeType.cname:
                pass
                self._raw_payload = self._io.read_bytes(self.rdlength)
                _io__raw_payload = KaitaiStream(BytesIO(self._raw_payload))
                self.payload = DnsPacket.DomainName(_io__raw_payload, self, self._root)
            elif _on == DnsPacket.TypeType.mx:
                pass
                self._raw_payload = self._io.read_bytes(self.rdlength)
                _io__raw_payload = KaitaiStream(BytesIO(self._raw_payload))
                self.payload = DnsPacket.MxInfo(_io__raw_payload, self, self._root)
            elif _on == DnsPacket.TypeType.ns:
                pass
                self._raw_payload = self._io.read_bytes(self.rdlength)
                _io__raw_payload = KaitaiStream(BytesIO(self._raw_payload))
                self.payload = DnsPacket.DomainName(_io__raw_payload, self, self._root)
            elif _on == DnsPacket.TypeType.ptr:
                pass
                self._raw_payload = self._io.read_bytes(self.rdlength)
                _io__raw_payload = KaitaiStream(BytesIO(self._raw_payload))
                self.payload = DnsPacket.DomainName(_io__raw_payload, self, self._root)
            elif _on == DnsPacket.TypeType.soa:
                pass
                self._raw_payload = self._io.read_bytes(self.rdlength)
                _io__raw_payload = KaitaiStream(BytesIO(self._raw_payload))
                self.payload = DnsPacket.AuthorityInfo(_io__raw_payload, self, self._root)
            elif _on == DnsPacket.TypeType.srv:
                pass
                self._raw_payload = self._io.read_bytes(self.rdlength)
                _io__raw_payload = KaitaiStream(BytesIO(self._raw_payload))
                self.payload = DnsPacket.Service(_io__raw_payload, self, self._root)
            elif _on == DnsPacket.TypeType.txt:
                pass
                self._raw_payload = self._io.read_bytes(self.rdlength)
                _io__raw_payload = KaitaiStream(BytesIO(self._raw_payload))
                self.payload = DnsPacket.TxtBody(_io__raw_payload, self, self._root)
            else:
                pass
                self.payload = self._io.read_bytes(self.rdlength)


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


    class AuthorityInfo(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(DnsPacket.AuthorityInfo, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.primary_ns = DnsPacket.DomainName(self._io, self, self._root)
            self.resoponsible_mailbox = DnsPacket.DomainName(self._io, self, self._root)
            self.serial = self._io.read_u4be()
            self.refresh_interval = self._io.read_u4be()
            self.retry_interval = self._io.read_u4be()
            self.expire_limit = self._io.read_u4be()
            self.min_ttl = self._io.read_u4be()


        def _fetch_instances(self):
            pass
            self.primary_ns._fetch_instances()
            self.resoponsible_mailbox._fetch_instances()


    class DomainName(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(DnsPacket.DomainName, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.name = []
            i = 0
            while True:
                _ = DnsPacket.Label(self._io, self, self._root)
                self.name.append(_)
                if  ((_.length == 0) or (_.length >= 192)) :
                    break
                i += 1


        def _fetch_instances(self):
            pass
            for i in range(len(self.name)):
                pass
                self.name[i]._fetch_instances()



    class Label(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(DnsPacket.Label, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.length = self._io.read_u1()
            if self.is_pointer:
                pass
                self.pointer = DnsPacket.PointerStruct(self._io, self, self._root)

            if (not (self.is_pointer)):
                pass
                self.name = (self._io.read_bytes(self.length)).decode(u"UTF-8")



        def _fetch_instances(self):
            pass
            if self.is_pointer:
                pass
                self.pointer._fetch_instances()

            if (not (self.is_pointer)):
                pass


        @property
        def is_pointer(self):
            if hasattr(self, '_m_is_pointer'):
                return self._m_is_pointer

            self._m_is_pointer = self.length >= 192
            return getattr(self, '_m_is_pointer', None)


    class MxInfo(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(DnsPacket.MxInfo, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.preference = self._io.read_u2be()
            self.mx = DnsPacket.DomainName(self._io, self, self._root)


        def _fetch_instances(self):
            pass
            self.mx._fetch_instances()


    class PacketFlags(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(DnsPacket.PacketFlags, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.flag = self._io.read_u2be()


        def _fetch_instances(self):
            pass

        @property
        def aa(self):
            if hasattr(self, '_m_aa'):
                return self._m_aa

            self._m_aa = (self.flag & 1024) >> 10
            return getattr(self, '_m_aa', None)

        @property
        def ad(self):
            if hasattr(self, '_m_ad'):
                return self._m_ad

            self._m_ad = (self.flag & 32) >> 5
            return getattr(self, '_m_ad', None)

        @property
        def cd(self):
            if hasattr(self, '_m_cd'):
                return self._m_cd

            self._m_cd = (self.flag & 16) >> 4
            return getattr(self, '_m_cd', None)

        @property
        def is_opcode_valid(self):
            if hasattr(self, '_m_is_opcode_valid'):
                return self._m_is_opcode_valid

            self._m_is_opcode_valid =  ((self.opcode == 0) or (self.opcode == 1) or (self.opcode == 2)) 
            return getattr(self, '_m_is_opcode_valid', None)

        @property
        def opcode(self):
            if hasattr(self, '_m_opcode'):
                return self._m_opcode

            self._m_opcode = (self.flag & 30720) >> 11
            return getattr(self, '_m_opcode', None)

        @property
        def qr(self):
            if hasattr(self, '_m_qr'):
                return self._m_qr

            self._m_qr = (self.flag & 32768) >> 15
            return getattr(self, '_m_qr', None)

        @property
        def ra(self):
            if hasattr(self, '_m_ra'):
                return self._m_ra

            self._m_ra = (self.flag & 128) >> 7
            return getattr(self, '_m_ra', None)

        @property
        def rcode(self):
            if hasattr(self, '_m_rcode'):
                return self._m_rcode

            self._m_rcode = (self.flag & 15) >> 0
            return getattr(self, '_m_rcode', None)

        @property
        def rd(self):
            if hasattr(self, '_m_rd'):
                return self._m_rd

            self._m_rd = (self.flag & 256) >> 8
            return getattr(self, '_m_rd', None)

        @property
        def tc(self):
            if hasattr(self, '_m_tc'):
                return self._m_tc

            self._m_tc = (self.flag & 512) >> 9
            return getattr(self, '_m_tc', None)

        @property
        def z(self):
            if hasattr(self, '_m_z'):
                return self._m_z

            self._m_z = (self.flag & 64) >> 6
            return getattr(self, '_m_z', None)


    class PointerStruct(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(DnsPacket.PointerStruct, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.value = self._io.read_u1()


        def _fetch_instances(self):
            pass
            _ = self.contents
            if hasattr(self, '_m_contents'):
                pass
                self._m_contents._fetch_instances()


        @property
        def contents(self):
            if hasattr(self, '_m_contents'):
                return self._m_contents

            io = self._root._io
            _pos = io.pos()
            io.seek(self.value + (self._parent.length - 192 << 8))
            self._m_contents = DnsPacket.DomainName(io, self, self._root)
            io.seek(_pos)
            return getattr(self, '_m_contents', None)


    class Query(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(DnsPacket.Query, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.name = DnsPacket.DomainName(self._io, self, self._root)
            self.type = KaitaiStream.resolve_enum(DnsPacket.TypeType, self._io.read_u2be())
            self.query_class = KaitaiStream.resolve_enum(DnsPacket.ClassType, self._io.read_u2be())


        def _fetch_instances(self):
            pass
            self.name._fetch_instances()


    class Service(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(DnsPacket.Service, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.priority = self._io.read_u2be()
            self.weight = self._io.read_u2be()
            self.port = self._io.read_u2be()
            self.target = DnsPacket.DomainName(self._io, self, self._root)


        def _fetch_instances(self):
            pass
            self.target._fetch_instances()


    class Txt(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(DnsPacket.Txt, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.length = self._io.read_u1()
            self.text = (self._io.read_bytes(self.length)).decode(u"UTF-8")


        def _fetch_instances(self):
            pass


    class TxtBody(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(DnsPacket.TxtBody, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.data = []
            i = 0
            while not self._io.is_eof():
                self.data.append(DnsPacket.Txt(self._io, self, self._root))
                i += 1



        def _fetch_instances(self):
            pass
            for i in range(len(self.data)):
                pass
                self.data[i]._fetch_instances()




