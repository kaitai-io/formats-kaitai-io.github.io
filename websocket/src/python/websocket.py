# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import KaitaiStruct, KaitaiStream, BytesIO
from enum import IntEnum


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class Websocket(KaitaiStruct):
    """The WebSocket protocol establishes a two-way communication channel via TCP.
    Messages are made up of one or more dataframes, and are delineated by
    frames with the `fin` bit set.
    """

    class Opcode(IntEnum):
        continuation = 0
        text = 1
        binary = 2
        reserved_3 = 3
        reserved_4 = 4
        reserved_5 = 5
        reserved_6 = 6
        reserved_7 = 7
        close = 8
        ping = 9
        pong = 10
        reserved_control_b = 11
        reserved_control_c = 12
        reserved_control_d = 13
        reserved_control_e = 14
        reserved_control_f = 15
    def __init__(self, _io, _parent=None, _root=None):
        super(Websocket, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self
        self._read()

    def _read(self):
        self.initial_frame = Websocket.InitialFrame(self._io, self, self._root)
        if self.initial_frame.header.finished != True:
            pass
            self.trailing_frames = []
            i = 0
            while True:
                _ = Websocket.Dataframe(self._io, self, self._root)
                self.trailing_frames.append(_)
                if _.header.finished:
                    break
                i += 1



    def _fetch_instances(self):
        pass
        self.initial_frame._fetch_instances()
        if self.initial_frame.header.finished != True:
            pass
            for i in range(len(self.trailing_frames)):
                pass
                self.trailing_frames[i]._fetch_instances()



    class Dataframe(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(Websocket.Dataframe, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.header = Websocket.FrameHeader(self._io, self, self._root)
            if self._root.initial_frame.header.opcode != Websocket.Opcode.text:
                pass
                self.payload_bytes = self._io.read_bytes(self.header.len_payload)

            if self._root.initial_frame.header.opcode == Websocket.Opcode.text:
                pass
                self.payload_text = (self._io.read_bytes(self.header.len_payload)).decode(u"UTF-8")



        def _fetch_instances(self):
            pass
            self.header._fetch_instances()
            if self._root.initial_frame.header.opcode != Websocket.Opcode.text:
                pass

            if self._root.initial_frame.header.opcode == Websocket.Opcode.text:
                pass



    class FrameHeader(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(Websocket.FrameHeader, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.finished = self._io.read_bits_int_be(1) != 0
            self.reserved = self._io.read_bits_int_be(3)
            self.opcode = KaitaiStream.resolve_enum(Websocket.Opcode, self._io.read_bits_int_be(4))
            self.is_masked = self._io.read_bits_int_be(1) != 0
            self.len_payload_primary = self._io.read_bits_int_be(7)
            if self.len_payload_primary == 126:
                pass
                self.len_payload_extended_1 = self._io.read_u2be()

            if self.len_payload_primary == 127:
                pass
                self.len_payload_extended_2 = self._io.read_u4be()

            if self.is_masked:
                pass
                self.mask_key = self._io.read_u4be()



        def _fetch_instances(self):
            pass
            if self.len_payload_primary == 126:
                pass

            if self.len_payload_primary == 127:
                pass

            if self.is_masked:
                pass


        @property
        def len_payload(self):
            if hasattr(self, '_m_len_payload'):
                return self._m_len_payload

            self._m_len_payload = (self.len_payload_primary if self.len_payload_primary <= 125 else (self.len_payload_extended_1 if self.len_payload_primary == 126 else self.len_payload_extended_2))
            return getattr(self, '_m_len_payload', None)


    class InitialFrame(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(Websocket.InitialFrame, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.header = Websocket.FrameHeader(self._io, self, self._root)
            if self.header.opcode != Websocket.Opcode.text:
                pass
                self.payload_bytes = self._io.read_bytes(self.header.len_payload)

            if self.header.opcode == Websocket.Opcode.text:
                pass
                self.payload_text = (self._io.read_bytes(self.header.len_payload)).decode(u"UTF-8")



        def _fetch_instances(self):
            pass
            self.header._fetch_instances()
            if self.header.opcode != Websocket.Opcode.text:
                pass

            if self.header.opcode == Websocket.Opcode.text:
                pass




