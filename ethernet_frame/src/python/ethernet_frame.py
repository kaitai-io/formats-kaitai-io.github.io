# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

from pkg_resources import parse_version
from kaitaistruct import __version__ as ks_version, KaitaiStruct, KaitaiStream, BytesIO
from enum import Enum


if parse_version(ks_version) < parse_version('0.7'):
    raise Exception("Incompatible Kaitai Struct Python API: 0.7 or later is required, but you have %s" % (ks_version))

from ipv4_packet import Ipv4Packet
from ipv6_packet import Ipv6Packet
class EthernetFrame(KaitaiStruct):
    """Ethernet frame is a OSI data link layer (layer 2) protocol data unit
    for Ethernet networks. In practice, many other networks and/or
    in-file dumps adopted the same format for encapsulation purposes.
    
    .. seealso::
       Source - https://ieeexplore.ieee.org/document/7428776
    """

    class EtherTypeEnum(Enum):
        ipv4 = 2048
        x_75_internet = 2049
        nbs_internet = 2050
        ecma_internet = 2051
        chaosnet = 2052
        x_25_level_3 = 2053
        arp = 2054
        ieee_802_1q_tpid = 33024
        ipv6 = 34525
    def __init__(self, _io, _parent=None, _root=None):
        self._io = _io
        self._parent = _parent
        self._root = _root if _root else self
        self._read()

    def _read(self):
        self.dst_mac = self._io.read_bytes(6)
        self.src_mac = self._io.read_bytes(6)
        self.ether_type_1 = self._root.EtherTypeEnum(self._io.read_u2be())
        if self.ether_type_1 == self._root.EtherTypeEnum.ieee_802_1q_tpid:
            self.tci = self._root.TagControlInfo(self._io, self, self._root)

        if self.ether_type_1 == self._root.EtherTypeEnum.ieee_802_1q_tpid:
            self.ether_type_2 = self._root.EtherTypeEnum(self._io.read_u2be())

        _on = self.ether_type
        if _on == self._root.EtherTypeEnum.ipv4:
            self._raw_body = self._io.read_bytes_full()
            io = KaitaiStream(BytesIO(self._raw_body))
            self.body = Ipv4Packet(io)
        elif _on == self._root.EtherTypeEnum.ipv6:
            self._raw_body = self._io.read_bytes_full()
            io = KaitaiStream(BytesIO(self._raw_body))
            self.body = Ipv6Packet(io)
        else:
            self.body = self._io.read_bytes_full()

    class TagControlInfo(KaitaiStruct):
        """Tag Control Information (TCI) is an extension of IEEE 802.1Q to
        support VLANs on normal IEEE 802.3 Ethernet network.
        """
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.priority = self._io.read_bits_int(3)
            self.drop_eligible = self._io.read_bits_int(1) != 0
            self.vlan_id = self._io.read_bits_int(12)


    @property
    def ether_type(self):
        """Ether type can be specied in several places in the frame. If
        first location bears special marker (0x8100), then it is not the
        real ether frame yet, an additional payload (`tci`) is expected
        and real ether type is upcoming next.
        """
        if hasattr(self, '_m_ether_type'):
            return self._m_ether_type if hasattr(self, '_m_ether_type') else None

        self._m_ether_type = (self.ether_type_2 if self.ether_type_1 == self._root.EtherTypeEnum.ieee_802_1q_tpid else self.ether_type_1)
        return self._m_ether_type if hasattr(self, '_m_ether_type') else None


