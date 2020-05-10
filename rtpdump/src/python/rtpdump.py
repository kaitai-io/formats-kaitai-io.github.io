# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

from pkg_resources import parse_version
from kaitaistruct import __version__ as ks_version, KaitaiStruct, KaitaiStream, BytesIO


if parse_version(ks_version) < parse_version('0.7'):
    raise Exception("Incompatible Kaitai Struct Python API: 0.7 or later is required, but you have %s" % (ks_version))

from rtp_packet import RtpPacket
class Rtpdump(KaitaiStruct):
    """rtpdump is a format used by rtptools to record and replay
    rtp data from network capture.
    
    .. seealso::
       Source - https://chromium.googlesource.com/external/webrtc/stable/talk/+/master/media/base/rtpdump.h
    """
    def __init__(self, _io, _parent=None, _root=None):
        self._io = _io
        self._parent = _parent
        self._root = _root if _root else self
        self._read()

    def _read(self):
        self.file_header = self._root.HeaderT(self._io, self, self._root)
        self.packets = []
        i = 0
        while not self._io.is_eof():
            self.packets.append(self._root.PacketT(self._io, self, self._root))
            i += 1


    class HeaderT(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.shebang = self._io.ensure_fixed_contents(b"\x23\x21\x72\x74\x70\x70\x6C\x61\x79\x31\x2E\x30")
            self.space = self._io.ensure_fixed_contents(b"\x20")
            self.ip = (self._io.read_bytes_term(47, False, True, True)).decode(u"ascii")
            self.port = (self._io.read_bytes_term(10, False, True, True)).decode(u"ascii")
            self.start_sec = self._io.read_u4be()
            self.start_usec = self._io.read_u4be()
            self.ip2 = self._io.read_u4be()
            self.port2 = self._io.read_u2be()
            self.padding = self._io.read_u2be()


    class PacketT(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.length = self._io.read_u2be()
            self.len_body = self._io.read_u2be()
            self.packet_usec = self._io.read_u4be()
            self._raw_body = self._io.read_bytes(self.len_body)
            io = KaitaiStream(BytesIO(self._raw_body))
            self.body = RtpPacket(io)



