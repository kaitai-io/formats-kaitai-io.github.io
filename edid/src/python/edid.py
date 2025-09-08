# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import KaitaiStruct, KaitaiStream, BytesIO
from enum import IntEnum
import struct


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class Edid(KaitaiStruct):
    def __init__(self, _io, _parent=None, _root=None):
        super(Edid, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self
        self._read()

    def _read(self):
        self.magic = self._io.read_bytes(8)
        if not self.magic == b"\x00\xFF\xFF\xFF\xFF\xFF\xFF\x00":
            raise kaitaistruct.ValidationNotEqualError(b"\x00\xFF\xFF\xFF\xFF\xFF\xFF\x00", self.magic, self._io, u"/seq/0")
        self.mfg_bytes = self._io.read_u2be()
        self.product_code = self._io.read_u2le()
        self.serial = self._io.read_u4le()
        self.mfg_week = self._io.read_u1()
        self.mfg_year_mod = self._io.read_u1()
        self.edid_version_major = self._io.read_u1()
        self.edid_version_minor = self._io.read_u1()
        self.input_flags = self._io.read_u1()
        self.screen_size_h = self._io.read_u1()
        self.screen_size_v = self._io.read_u1()
        self.gamma_mod = self._io.read_u1()
        self.features_flags = self._io.read_u1()
        self.chromacity = Edid.ChromacityInfo(self._io, self, self._root)
        self.est_timings = Edid.EstTimingsInfo(self._io, self, self._root)
        self._raw_std_timings = []
        self.std_timings = []
        for i in range(8):
            self._raw_std_timings.append(self._io.read_bytes(2))
            _io__raw_std_timings = KaitaiStream(BytesIO(self._raw_std_timings[i]))
            self.std_timings.append(Edid.StdTiming(_io__raw_std_timings, self, self._root))



    def _fetch_instances(self):
        pass
        self.chromacity._fetch_instances()
        self.est_timings._fetch_instances()
        for i in range(len(self.std_timings)):
            pass
            self.std_timings[i]._fetch_instances()


    class ChromacityInfo(KaitaiStruct):
        """Chromaticity information: colorimetry and white point
        coordinates. All coordinates are stored as fixed precision
        10-bit numbers, bits are shuffled for compactness.
        """
        def __init__(self, _io, _parent=None, _root=None):
            super(Edid.ChromacityInfo, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.red_x_1_0 = self._io.read_bits_int_be(2)
            self.red_y_1_0 = self._io.read_bits_int_be(2)
            self.green_x_1_0 = self._io.read_bits_int_be(2)
            self.green_y_1_0 = self._io.read_bits_int_be(2)
            self.blue_x_1_0 = self._io.read_bits_int_be(2)
            self.blue_y_1_0 = self._io.read_bits_int_be(2)
            self.white_x_1_0 = self._io.read_bits_int_be(2)
            self.white_y_1_0 = self._io.read_bits_int_be(2)
            self.red_x_9_2 = self._io.read_u1()
            self.red_y_9_2 = self._io.read_u1()
            self.green_x_9_2 = self._io.read_u1()
            self.green_y_9_2 = self._io.read_u1()
            self.blue_x_9_2 = self._io.read_u1()
            self.blue_y_9_2 = self._io.read_u1()
            self.white_x_9_2 = self._io.read_u1()
            self.white_y_9_2 = self._io.read_u1()


        def _fetch_instances(self):
            pass

        @property
        def blue_x(self):
            """Blue X coordinate."""
            if hasattr(self, '_m_blue_x'):
                return self._m_blue_x

            self._m_blue_x = self.blue_x_int / 1024.0
            return getattr(self, '_m_blue_x', None)

        @property
        def blue_x_int(self):
            if hasattr(self, '_m_blue_x_int'):
                return self._m_blue_x_int

            self._m_blue_x_int = self.blue_x_9_2 << 2 | self.blue_x_1_0
            return getattr(self, '_m_blue_x_int', None)

        @property
        def blue_y(self):
            """Blue Y coordinate."""
            if hasattr(self, '_m_blue_y'):
                return self._m_blue_y

            self._m_blue_y = self.blue_y_int / 1024.0
            return getattr(self, '_m_blue_y', None)

        @property
        def blue_y_int(self):
            if hasattr(self, '_m_blue_y_int'):
                return self._m_blue_y_int

            self._m_blue_y_int = self.blue_y_9_2 << 2 | self.blue_y_1_0
            return getattr(self, '_m_blue_y_int', None)

        @property
        def green_x(self):
            """Green X coordinate."""
            if hasattr(self, '_m_green_x'):
                return self._m_green_x

            self._m_green_x = self.green_x_int / 1024.0
            return getattr(self, '_m_green_x', None)

        @property
        def green_x_int(self):
            if hasattr(self, '_m_green_x_int'):
                return self._m_green_x_int

            self._m_green_x_int = self.green_x_9_2 << 2 | self.green_x_1_0
            return getattr(self, '_m_green_x_int', None)

        @property
        def green_y(self):
            """Green Y coordinate."""
            if hasattr(self, '_m_green_y'):
                return self._m_green_y

            self._m_green_y = self.green_y_int / 1024.0
            return getattr(self, '_m_green_y', None)

        @property
        def green_y_int(self):
            if hasattr(self, '_m_green_y_int'):
                return self._m_green_y_int

            self._m_green_y_int = self.green_y_9_2 << 2 | self.green_y_1_0
            return getattr(self, '_m_green_y_int', None)

        @property
        def red_x(self):
            """Red X coordinate."""
            if hasattr(self, '_m_red_x'):
                return self._m_red_x

            self._m_red_x = self.red_x_int / 1024.0
            return getattr(self, '_m_red_x', None)

        @property
        def red_x_int(self):
            if hasattr(self, '_m_red_x_int'):
                return self._m_red_x_int

            self._m_red_x_int = self.red_x_9_2 << 2 | self.red_x_1_0
            return getattr(self, '_m_red_x_int', None)

        @property
        def red_y(self):
            """Red Y coordinate."""
            if hasattr(self, '_m_red_y'):
                return self._m_red_y

            self._m_red_y = self.red_y_int / 1024.0
            return getattr(self, '_m_red_y', None)

        @property
        def red_y_int(self):
            if hasattr(self, '_m_red_y_int'):
                return self._m_red_y_int

            self._m_red_y_int = self.red_y_9_2 << 2 | self.red_y_1_0
            return getattr(self, '_m_red_y_int', None)

        @property
        def white_x(self):
            """White X coordinate."""
            if hasattr(self, '_m_white_x'):
                return self._m_white_x

            self._m_white_x = self.white_x_int / 1024.0
            return getattr(self, '_m_white_x', None)

        @property
        def white_x_int(self):
            if hasattr(self, '_m_white_x_int'):
                return self._m_white_x_int

            self._m_white_x_int = self.white_x_9_2 << 2 | self.white_x_1_0
            return getattr(self, '_m_white_x_int', None)

        @property
        def white_y(self):
            """White Y coordinate."""
            if hasattr(self, '_m_white_y'):
                return self._m_white_y

            self._m_white_y = self.white_y_int / 1024.0
            return getattr(self, '_m_white_y', None)

        @property
        def white_y_int(self):
            if hasattr(self, '_m_white_y_int'):
                return self._m_white_y_int

            self._m_white_y_int = self.white_y_9_2 << 2 | self.white_y_1_0
            return getattr(self, '_m_white_y_int', None)


    class EstTimingsInfo(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(Edid.EstTimingsInfo, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.can_720x400px_70hz = self._io.read_bits_int_be(1) != 0
            self.can_720x400px_88hz = self._io.read_bits_int_be(1) != 0
            self.can_640x480px_60hz = self._io.read_bits_int_be(1) != 0
            self.can_640x480px_67hz = self._io.read_bits_int_be(1) != 0
            self.can_640x480px_72hz = self._io.read_bits_int_be(1) != 0
            self.can_640x480px_75hz = self._io.read_bits_int_be(1) != 0
            self.can_800x600px_56hz = self._io.read_bits_int_be(1) != 0
            self.can_800x600px_60hz = self._io.read_bits_int_be(1) != 0
            self.can_800x600px_72hz = self._io.read_bits_int_be(1) != 0
            self.can_800x600px_75hz = self._io.read_bits_int_be(1) != 0
            self.can_832x624px_75hz = self._io.read_bits_int_be(1) != 0
            self.can_1024x768px_87hz_i = self._io.read_bits_int_be(1) != 0
            self.can_1024x768px_60hz = self._io.read_bits_int_be(1) != 0
            self.can_1024x768px_70hz = self._io.read_bits_int_be(1) != 0
            self.can_1024x768px_75hz = self._io.read_bits_int_be(1) != 0
            self.can_1280x1024px_75hz = self._io.read_bits_int_be(1) != 0
            self.can_1152x870px_75hz = self._io.read_bits_int_be(1) != 0
            self.reserved = self._io.read_bits_int_be(7)


        def _fetch_instances(self):
            pass


    class StdTiming(KaitaiStruct):

        class AspectRatios(IntEnum):
            ratio_16_10 = 0
            ratio_4_3 = 1
            ratio_5_4 = 2
            ratio_16_9 = 3
        def __init__(self, _io, _parent=None, _root=None):
            super(Edid.StdTiming, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.horiz_active_pixels_mod = self._io.read_u1()
            self.aspect_ratio = KaitaiStream.resolve_enum(Edid.StdTiming.AspectRatios, self._io.read_bits_int_be(2))
            self.refresh_rate_mod = self._io.read_bits_int_be(6)


        def _fetch_instances(self):
            pass
            _ = self.bytes_lookahead
            if hasattr(self, '_m_bytes_lookahead'):
                pass


        @property
        def bytes_lookahead(self):
            if hasattr(self, '_m_bytes_lookahead'):
                return self._m_bytes_lookahead

            _pos = self._io.pos()
            self._io.seek(0)
            self._m_bytes_lookahead = self._io.read_bytes(2)
            self._io.seek(_pos)
            return getattr(self, '_m_bytes_lookahead', None)

        @property
        def horiz_active_pixels(self):
            """Range of horizontal active pixels."""
            if hasattr(self, '_m_horiz_active_pixels'):
                return self._m_horiz_active_pixels

            if self.is_used:
                pass
                self._m_horiz_active_pixels = (self.horiz_active_pixels_mod + 31) * 8

            return getattr(self, '_m_horiz_active_pixels', None)

        @property
        def is_used(self):
            if hasattr(self, '_m_is_used'):
                return self._m_is_used

            self._m_is_used = self.bytes_lookahead != b"\x01\x01"
            return getattr(self, '_m_is_used', None)

        @property
        def refresh_rate(self):
            """Vertical refresh rate, Hz."""
            if hasattr(self, '_m_refresh_rate'):
                return self._m_refresh_rate

            if self.is_used:
                pass
                self._m_refresh_rate = self.refresh_rate_mod + 60

            return getattr(self, '_m_refresh_rate', None)


    @property
    def gamma(self):
        if hasattr(self, '_m_gamma'):
            return self._m_gamma

        if self.gamma_mod != 255:
            pass
            self._m_gamma = (self.gamma_mod + 100) / 100.0

        return getattr(self, '_m_gamma', None)

    @property
    def mfg_id_ch1(self):
        if hasattr(self, '_m_mfg_id_ch1'):
            return self._m_mfg_id_ch1

        self._m_mfg_id_ch1 = (self.mfg_bytes & 31744) >> 10
        return getattr(self, '_m_mfg_id_ch1', None)

    @property
    def mfg_id_ch2(self):
        if hasattr(self, '_m_mfg_id_ch2'):
            return self._m_mfg_id_ch2

        self._m_mfg_id_ch2 = (self.mfg_bytes & 992) >> 5
        return getattr(self, '_m_mfg_id_ch2', None)

    @property
    def mfg_id_ch3(self):
        if hasattr(self, '_m_mfg_id_ch3'):
            return self._m_mfg_id_ch3

        self._m_mfg_id_ch3 = self.mfg_bytes & 31
        return getattr(self, '_m_mfg_id_ch3', None)

    @property
    def mfg_str(self):
        if hasattr(self, '_m_mfg_str'):
            return self._m_mfg_str

        self._m_mfg_str = (struct.pack('3B', self.mfg_id_ch1 + 64, self.mfg_id_ch2 + 64, self.mfg_id_ch3 + 64)).decode(u"ASCII")
        return getattr(self, '_m_mfg_str', None)

    @property
    def mfg_year(self):
        if hasattr(self, '_m_mfg_year'):
            return self._m_mfg_year

        self._m_mfg_year = self.mfg_year_mod + 1990
        return getattr(self, '_m_mfg_year', None)


