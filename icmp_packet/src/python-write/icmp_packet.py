# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import ReadWriteKaitaiStruct, KaitaiStream, BytesIO
from enum import IntEnum


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class IcmpPacket(ReadWriteKaitaiStruct):

    class IcmpTypeEnum(IntEnum):
        echo_reply = 0
        destination_unreachable = 3
        source_quench = 4
        redirect = 5
        echo = 8
        time_exceeded = 11
    def __init__(self, _io=None, _parent=None, _root=None):
        super(IcmpPacket, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self

    def _read(self):
        self.icmp_type = KaitaiStream.resolve_enum(IcmpPacket.IcmpTypeEnum, self._io.read_u1())
        if self.icmp_type == IcmpPacket.IcmpTypeEnum.destination_unreachable:
            pass
            self.destination_unreachable = IcmpPacket.DestinationUnreachableMsg(self._io, self, self._root)
            self.destination_unreachable._read()

        if self.icmp_type == IcmpPacket.IcmpTypeEnum.time_exceeded:
            pass
            self.time_exceeded = IcmpPacket.TimeExceededMsg(self._io, self, self._root)
            self.time_exceeded._read()

        if  ((self.icmp_type == IcmpPacket.IcmpTypeEnum.echo) or (self.icmp_type == IcmpPacket.IcmpTypeEnum.echo_reply)) :
            pass
            self.echo = IcmpPacket.EchoMsg(self._io, self, self._root)
            self.echo._read()

        self._dirty = False


    def _fetch_instances(self):
        pass
        if self.icmp_type == IcmpPacket.IcmpTypeEnum.destination_unreachable:
            pass
            self.destination_unreachable._fetch_instances()

        if self.icmp_type == IcmpPacket.IcmpTypeEnum.time_exceeded:
            pass
            self.time_exceeded._fetch_instances()

        if  ((self.icmp_type == IcmpPacket.IcmpTypeEnum.echo) or (self.icmp_type == IcmpPacket.IcmpTypeEnum.echo_reply)) :
            pass
            self.echo._fetch_instances()



    def _write__seq(self, io=None):
        super(IcmpPacket, self)._write__seq(io)
        self._io.write_u1(int(self.icmp_type))
        if self.icmp_type == IcmpPacket.IcmpTypeEnum.destination_unreachable:
            pass
            self.destination_unreachable._write__seq(self._io)

        if self.icmp_type == IcmpPacket.IcmpTypeEnum.time_exceeded:
            pass
            self.time_exceeded._write__seq(self._io)

        if  ((self.icmp_type == IcmpPacket.IcmpTypeEnum.echo) or (self.icmp_type == IcmpPacket.IcmpTypeEnum.echo_reply)) :
            pass
            self.echo._write__seq(self._io)



    def _check(self):
        if self.icmp_type == IcmpPacket.IcmpTypeEnum.destination_unreachable:
            pass
            if self.destination_unreachable._root != self._root:
                raise kaitaistruct.ConsistencyError(u"destination_unreachable", self._root, self.destination_unreachable._root)
            if self.destination_unreachable._parent != self:
                raise kaitaistruct.ConsistencyError(u"destination_unreachable", self, self.destination_unreachable._parent)

        if self.icmp_type == IcmpPacket.IcmpTypeEnum.time_exceeded:
            pass
            if self.time_exceeded._root != self._root:
                raise kaitaistruct.ConsistencyError(u"time_exceeded", self._root, self.time_exceeded._root)
            if self.time_exceeded._parent != self:
                raise kaitaistruct.ConsistencyError(u"time_exceeded", self, self.time_exceeded._parent)

        if  ((self.icmp_type == IcmpPacket.IcmpTypeEnum.echo) or (self.icmp_type == IcmpPacket.IcmpTypeEnum.echo_reply)) :
            pass
            if self.echo._root != self._root:
                raise kaitaistruct.ConsistencyError(u"echo", self._root, self.echo._root)
            if self.echo._parent != self:
                raise kaitaistruct.ConsistencyError(u"echo", self, self.echo._parent)

        self._dirty = False

    class DestinationUnreachableMsg(ReadWriteKaitaiStruct):

        class DestinationUnreachableCode(IntEnum):
            net_unreachable = 0
            host_unreachable = 1
            protocol_unreachable = 2
            port_unreachable = 3
            fragmentation_needed_and_df_set = 4
            source_route_failed = 5
            dst_net_unkown = 6
            sdt_host_unkown = 7
            src_isolated = 8
            net_prohibited_by_admin = 9
            host_prohibited_by_admin = 10
            net_unreachable_for_tos = 11
            host_unreachable_for_tos = 12
            communication_prohibited_by_admin = 13
            host_precedence_violation = 14
            precedence_cuttoff_in_effect = 15
        def __init__(self, _io=None, _parent=None, _root=None):
            super(IcmpPacket.DestinationUnreachableMsg, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.code = KaitaiStream.resolve_enum(IcmpPacket.DestinationUnreachableMsg.DestinationUnreachableCode, self._io.read_u1())
            self.checksum = self._io.read_u2be()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(IcmpPacket.DestinationUnreachableMsg, self)._write__seq(io)
            self._io.write_u1(int(self.code))
            self._io.write_u2be(self.checksum)


        def _check(self):
            self._dirty = False


    class EchoMsg(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(IcmpPacket.EchoMsg, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.code = self._io.read_bytes(1)
            if not self.code == b"\x00":
                raise kaitaistruct.ValidationNotEqualError(b"\x00", self.code, self._io, u"/types/echo_msg/seq/0")
            self.checksum = self._io.read_u2be()
            self.identifier = self._io.read_u2be()
            self.seq_num = self._io.read_u2be()
            self.data = self._io.read_bytes_full()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(IcmpPacket.EchoMsg, self)._write__seq(io)
            self._io.write_bytes(self.code)
            self._io.write_u2be(self.checksum)
            self._io.write_u2be(self.identifier)
            self._io.write_u2be(self.seq_num)
            self._io.write_bytes(self.data)
            if not self._io.is_eof():
                raise kaitaistruct.ConsistencyError(u"data", 0, self._io.size() - self._io.pos())


        def _check(self):
            if len(self.code) != 1:
                raise kaitaistruct.ConsistencyError(u"code", 1, len(self.code))
            if not self.code == b"\x00":
                raise kaitaistruct.ValidationNotEqualError(b"\x00", self.code, None, u"/types/echo_msg/seq/0")
            self._dirty = False


    class TimeExceededMsg(ReadWriteKaitaiStruct):

        class TimeExceededCode(IntEnum):
            time_to_live_exceeded_in_transit = 0
            fragment_reassembly_time_exceeded = 1
        def __init__(self, _io=None, _parent=None, _root=None):
            super(IcmpPacket.TimeExceededMsg, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.code = KaitaiStream.resolve_enum(IcmpPacket.TimeExceededMsg.TimeExceededCode, self._io.read_u1())
            self.checksum = self._io.read_u2be()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(IcmpPacket.TimeExceededMsg, self)._write__seq(io)
            self._io.write_u1(int(self.code))
            self._io.write_u2be(self.checksum)


        def _check(self):
            self._dirty = False



