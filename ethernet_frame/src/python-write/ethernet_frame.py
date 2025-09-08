# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import ReadWriteKaitaiStruct, KaitaiStream, BytesIO
import ipv6_packet
import ipv4_packet
from enum import IntEnum


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class EthernetFrame(ReadWriteKaitaiStruct):
    """Ethernet frame is a OSI data link layer (layer 2) protocol data unit
    for Ethernet networks. In practice, many other networks and/or
    in-file dumps adopted the same format for encapsulation purposes.
    
    .. seealso::
       Source - https://ieeexplore.ieee.org/document/7428776
    """

    class EtherTypeEnum(IntEnum):
        ipv4 = 2048
        x_75_internet = 2049
        nbs_internet = 2050
        ecma_internet = 2051
        chaosnet = 2052
        x_25_level_3 = 2053
        arp = 2054
        ieee_802_1q_tpid = 33024
        ipv6 = 34525
    def __init__(self, _io=None, _parent=None, _root=None):
        super(EthernetFrame, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self

    def _read(self):
        self.dst_mac = self._io.read_bytes(6)
        self.src_mac = self._io.read_bytes(6)
        self.ether_type_1 = KaitaiStream.resolve_enum(EthernetFrame.EtherTypeEnum, self._io.read_u2be())
        if self.ether_type_1 == EthernetFrame.EtherTypeEnum.ieee_802_1q_tpid:
            pass
            self.tci = EthernetFrame.TagControlInfo(self._io, self, self._root)
            self.tci._read()

        if self.ether_type_1 == EthernetFrame.EtherTypeEnum.ieee_802_1q_tpid:
            pass
            self.ether_type_2 = KaitaiStream.resolve_enum(EthernetFrame.EtherTypeEnum, self._io.read_u2be())

        _on = self.ether_type
        if _on == EthernetFrame.EtherTypeEnum.ipv4:
            pass
            self._raw_body = self._io.read_bytes_full()
            _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
            self.body = ipv4_packet.Ipv4Packet(_io__raw_body)
            self.body._read()
        elif _on == EthernetFrame.EtherTypeEnum.ipv6:
            pass
            self._raw_body = self._io.read_bytes_full()
            _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
            self.body = ipv6_packet.Ipv6Packet(_io__raw_body)
            self.body._read()
        else:
            pass
            self.body = self._io.read_bytes_full()
        self._dirty = False


    def _fetch_instances(self):
        pass
        if self.ether_type_1 == EthernetFrame.EtherTypeEnum.ieee_802_1q_tpid:
            pass
            self.tci._fetch_instances()

        if self.ether_type_1 == EthernetFrame.EtherTypeEnum.ieee_802_1q_tpid:
            pass

        _on = self.ether_type
        if _on == EthernetFrame.EtherTypeEnum.ipv4:
            pass
            self.body._fetch_instances()
        elif _on == EthernetFrame.EtherTypeEnum.ipv6:
            pass
            self.body._fetch_instances()
        else:
            pass


    def _write__seq(self, io=None):
        super(EthernetFrame, self)._write__seq(io)
        self._io.write_bytes(self.dst_mac)
        self._io.write_bytes(self.src_mac)
        self._io.write_u2be(int(self.ether_type_1))
        if self.ether_type_1 == EthernetFrame.EtherTypeEnum.ieee_802_1q_tpid:
            pass
            self.tci._write__seq(self._io)

        if self.ether_type_1 == EthernetFrame.EtherTypeEnum.ieee_802_1q_tpid:
            pass
            self._io.write_u2be(int(self.ether_type_2))

        _on = self.ether_type
        if _on == EthernetFrame.EtherTypeEnum.ipv4:
            pass
            _io__raw_body = KaitaiStream(BytesIO(bytearray(self._io.size() - self._io.pos())))
            self._io.add_child_stream(_io__raw_body)
            _pos2 = self._io.pos()
            self._io.seek(self._io.pos() + (self._io.size() - self._io.pos()))
            def handler(parent, _io__raw_body=_io__raw_body):
                self._raw_body = _io__raw_body.to_byte_array()
                parent.write_bytes(self._raw_body)
                if not parent.is_eof():
                    raise kaitaistruct.ConsistencyError(u"raw(body)", 0, parent.size() - parent.pos())
            _io__raw_body.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
            self.body._write__seq(_io__raw_body)
        elif _on == EthernetFrame.EtherTypeEnum.ipv6:
            pass
            _io__raw_body = KaitaiStream(BytesIO(bytearray(self._io.size() - self._io.pos())))
            self._io.add_child_stream(_io__raw_body)
            _pos2 = self._io.pos()
            self._io.seek(self._io.pos() + (self._io.size() - self._io.pos()))
            def handler(parent, _io__raw_body=_io__raw_body):
                self._raw_body = _io__raw_body.to_byte_array()
                parent.write_bytes(self._raw_body)
                if not parent.is_eof():
                    raise kaitaistruct.ConsistencyError(u"raw(body)", 0, parent.size() - parent.pos())
            _io__raw_body.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
            self.body._write__seq(_io__raw_body)
        else:
            pass
            self._io.write_bytes(self.body)
            if not self._io.is_eof():
                raise kaitaistruct.ConsistencyError(u"body", 0, self._io.size() - self._io.pos())


    def _check(self):
        if len(self.dst_mac) != 6:
            raise kaitaistruct.ConsistencyError(u"dst_mac", 6, len(self.dst_mac))
        if len(self.src_mac) != 6:
            raise kaitaistruct.ConsistencyError(u"src_mac", 6, len(self.src_mac))
        if self.ether_type_1 == EthernetFrame.EtherTypeEnum.ieee_802_1q_tpid:
            pass
            if self.tci._root != self._root:
                raise kaitaistruct.ConsistencyError(u"tci", self._root, self.tci._root)
            if self.tci._parent != self:
                raise kaitaistruct.ConsistencyError(u"tci", self, self.tci._parent)

        if self.ether_type_1 == EthernetFrame.EtherTypeEnum.ieee_802_1q_tpid:
            pass

        _on = self.ether_type
        if _on == EthernetFrame.EtherTypeEnum.ipv4:
            pass
        elif _on == EthernetFrame.EtherTypeEnum.ipv6:
            pass
        else:
            pass
        self._dirty = False

    class TagControlInfo(ReadWriteKaitaiStruct):
        """Tag Control Information (TCI) is an extension of IEEE 802.1Q to
        support VLANs on normal IEEE 802.3 Ethernet network.
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(EthernetFrame.TagControlInfo, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.priority = self._io.read_bits_int_be(3)
            self.drop_eligible = self._io.read_bits_int_be(1) != 0
            self.vlan_id = self._io.read_bits_int_be(12)
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(EthernetFrame.TagControlInfo, self)._write__seq(io)
            self._io.write_bits_int_be(3, self.priority)
            self._io.write_bits_int_be(1, int(self.drop_eligible))
            self._io.write_bits_int_be(12, self.vlan_id)


        def _check(self):
            self._dirty = False


    @property
    def ether_type(self):
        """Ether type can be specied in several places in the frame. If
        first location bears special marker (0x8100), then it is not the
        real ether frame yet, an additional payload (`tci`) is expected
        and real ether type is upcoming next.
        """
        if hasattr(self, '_m_ether_type'):
            return self._m_ether_type

        self._m_ether_type = (self.ether_type_2 if self.ether_type_1 == EthernetFrame.EtherTypeEnum.ieee_802_1q_tpid else self.ether_type_1)
        return getattr(self, '_m_ether_type', None)

    def _invalidate_ether_type(self):
        del self._m_ether_type

