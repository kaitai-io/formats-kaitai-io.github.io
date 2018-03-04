# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

from pkg_resources import parse_version
from kaitaistruct import __version__ as ks_version, KaitaiStruct, KaitaiStream, BytesIO
from enum import Enum


if parse_version(ks_version) < parse_version('0.7'):
    raise Exception("Incompatible Kaitai Struct Python API: 0.7 or later is required, but you have %s" % (ks_version))

class Edid(KaitaiStruct):
    def __init__(self, _io, _parent=None, _root=None):
        self._io = _io
        self._parent = _parent
        self._root = _root if _root else self
        self._read()

    def _read(self):
        self.magic = self._io.ensure_fixed_contents(b"\x00\xFF\xFF\xFF\xFF\xFF\xFF\x00")
        self.mfg_bytes = self._io.read_u2le()
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
        self.chromacity = self._root.ChromacityInfo(self._io, self, self._root)
        self.est_timings = self._root.EstTimingsInfo(self._io, self, self._root)
        self.std_timings = [None] * (8)
        for i in range(8):
            self.std_timings[i] = self._root.StdTiming(self._io, self, self._root)


    class ChromacityInfo(KaitaiStruct):
        """Chromaticity information: colorimetry and white point
        coordinates. All coordinates are stored as fixed precision
        10-bit numbers, bits are shuffled for compactness.
        """
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.red_x_1_0 = self._io.read_bits_int(2)
            self.red_y_1_0 = self._io.read_bits_int(2)
            self.green_x_1_0 = self._io.read_bits_int(2)
            self.green_y_1_0 = self._io.read_bits_int(2)
            self.blue_x_1_0 = self._io.read_bits_int(2)
            self.blue_y_1_0 = self._io.read_bits_int(2)
            self.white_x_1_0 = self._io.read_bits_int(2)
            self.white_y_1_0 = self._io.read_bits_int(2)
            self._io.align_to_byte()
            self.red_x_9_2 = self._io.read_u1()
            self.red_y_9_2 = self._io.read_u1()
            self.green_x_9_2 = self._io.read_u1()
            self.green_y_9_2 = self._io.read_u1()
            self.blue_x_9_2 = self._io.read_u1()
            self.blue_y_9_2 = self._io.read_u1()
            self.white_x_9_2 = self._io.read_u1()
            self.white_y_9_2 = self._io.read_u1()

        @property
        def green_x_int(self):
            if hasattr(self, '_m_green_x_int'):
                return self._m_green_x_int

            self._m_green_x_int = ((self.green_x_9_2 << 2) | self.green_x_1_0)
            return self._m_green_x_int

        @property
        def red_y(self):
            """Red Y coordinate."""
            if hasattr(self, '_m_red_y'):
                return self._m_red_y

            self._m_red_y = (self.red_y_int / 1024.0)
            return self._m_red_y

        @property
        def green_y_int(self):
            if hasattr(self, '_m_green_y_int'):
                return self._m_green_y_int

            self._m_green_y_int = ((self.green_y_9_2 << 2) | self.green_y_1_0)
            return self._m_green_y_int

        @property
        def white_y(self):
            """White Y coordinate."""
            if hasattr(self, '_m_white_y'):
                return self._m_white_y

            self._m_white_y = (self.white_y_int / 1024.0)
            return self._m_white_y

        @property
        def red_x(self):
            """Red X coordinate."""
            if hasattr(self, '_m_red_x'):
                return self._m_red_x

            self._m_red_x = (self.red_x_int / 1024.0)
            return self._m_red_x

        @property
        def white_x(self):
            """White X coordinate."""
            if hasattr(self, '_m_white_x'):
                return self._m_white_x

            self._m_white_x = (self.white_x_int / 1024.0)
            return self._m_white_x

        @property
        def blue_x(self):
            """Blue X coordinate."""
            if hasattr(self, '_m_blue_x'):
                return self._m_blue_x

            self._m_blue_x = (self.blue_x_int / 1024.0)
            return self._m_blue_x

        @property
        def white_x_int(self):
            if hasattr(self, '_m_white_x_int'):
                return self._m_white_x_int

            self._m_white_x_int = ((self.white_x_9_2 << 2) | self.white_x_1_0)
            return self._m_white_x_int

        @property
        def white_y_int(self):
            if hasattr(self, '_m_white_y_int'):
                return self._m_white_y_int

            self._m_white_y_int = ((self.white_y_9_2 << 2) | self.white_y_1_0)
            return self._m_white_y_int

        @property
        def green_x(self):
            """Green X coordinate."""
            if hasattr(self, '_m_green_x'):
                return self._m_green_x

            self._m_green_x = (self.green_x_int / 1024.0)
            return self._m_green_x

        @property
        def red_x_int(self):
            if hasattr(self, '_m_red_x_int'):
                return self._m_red_x_int

            self._m_red_x_int = ((self.red_x_9_2 << 2) | self.red_x_1_0)
            return self._m_red_x_int

        @property
        def red_y_int(self):
            if hasattr(self, '_m_red_y_int'):
                return self._m_red_y_int

            self._m_red_y_int = ((self.red_y_9_2 << 2) | self.red_y_1_0)
            return self._m_red_y_int

        @property
        def blue_x_int(self):
            if hasattr(self, '_m_blue_x_int'):
                return self._m_blue_x_int

            self._m_blue_x_int = ((self.blue_x_9_2 << 2) | self.blue_x_1_0)
            return self._m_blue_x_int

        @property
        def blue_y(self):
            """Blue Y coordinate."""
            if hasattr(self, '_m_blue_y'):
                return self._m_blue_y

            self._m_blue_y = (self.blue_y_int / 1024.0)
            return self._m_blue_y

        @property
        def green_y(self):
            """Green Y coordinate."""
            if hasattr(self, '_m_green_y'):
                return self._m_green_y

            self._m_green_y = (self.green_y_int / 1024.0)
            return self._m_green_y

        @property
        def blue_y_int(self):
            if hasattr(self, '_m_blue_y_int'):
                return self._m_blue_y_int

            self._m_blue_y_int = ((self.blue_y_9_2 << 2) | self.blue_y_1_0)
            return self._m_blue_y_int


    class EstTimingsInfo(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.can_720_400_70 = self._io.read_bits_int(1) != 0
            self.can_720_400_88 = self._io.read_bits_int(1) != 0
            self.can_640_480_60 = self._io.read_bits_int(1) != 0
            self.can_640_480_67 = self._io.read_bits_int(1) != 0
            self.can_640_480_72 = self._io.read_bits_int(1) != 0
            self.can_640_480_75 = self._io.read_bits_int(1) != 0
            self.can_800_600_56 = self._io.read_bits_int(1) != 0
            self.can_800_600_60 = self._io.read_bits_int(1) != 0
            self.can_800_600_72 = self._io.read_bits_int(1) != 0
            self.can_800_600_75 = self._io.read_bits_int(1) != 0
            self.can_832_624_75 = self._io.read_bits_int(1) != 0
            self.can_1024_768_87_i = self._io.read_bits_int(1) != 0
            self.can_1024_768_60 = self._io.read_bits_int(1) != 0
            self.can_1024_768_70 = self._io.read_bits_int(1) != 0
            self.can_1024_768_75 = self._io.read_bits_int(1) != 0
            self.can_1280_1024_75 = self._io.read_bits_int(1) != 0
            self.can_1152_870_75 = self._io.read_bits_int(1) != 0
            self.reserved = self._io.read_bits_int(7)


    class StdTiming(KaitaiStruct):

        class AspectRatios(Enum):
            ratio_16_10 = 0
            ratio_4_3 = 1
            ratio_5_4 = 2
            ratio_16_9 = 3
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.horiz_active_pixels_mod = self._io.read_u1()
            self.aspect_ratio = self._root.StdTiming.AspectRatios(self._io.read_bits_int(2))
            self.refresh_rate_mod = self._io.read_bits_int(5)

        @property
        def horiz_active_pixels(self):
            """Range of horizontal active pixels."""
            if hasattr(self, '_m_horiz_active_pixels'):
                return self._m_horiz_active_pixels

            self._m_horiz_active_pixels = ((self.horiz_active_pixels_mod + 31) * 8)
            return self._m_horiz_active_pixels

        @property
        def refresh_rate(self):
            """Vertical refresh rate, Hz."""
            if hasattr(self, '_m_refresh_rate'):
                return self._m_refresh_rate

            self._m_refresh_rate = (self.refresh_rate_mod + 60)
            return self._m_refresh_rate


    @property
    def mfg_year(self):
        if hasattr(self, '_m_mfg_year'):
            return self._m_mfg_year

        self._m_mfg_year = (self.mfg_year_mod + 1990)
        return self._m_mfg_year

    @property
    def mfg_id_ch1(self):
        if hasattr(self, '_m_mfg_id_ch1'):
            return self._m_mfg_id_ch1

        self._m_mfg_id_ch1 = ((self.mfg_bytes & 31744) >> 10)
        return self._m_mfg_id_ch1

    @property
    def mfg_id_ch3(self):
        if hasattr(self, '_m_mfg_id_ch3'):
            return self._m_mfg_id_ch3

        self._m_mfg_id_ch3 = (self.mfg_bytes & 31)
        return self._m_mfg_id_ch3

    @property
    def gamma(self):
        if hasattr(self, '_m_gamma'):
            return self._m_gamma

        if self.gamma_mod != 255:
            self._m_gamma = ((self.gamma_mod + 100) / 100.0)

        return self._m_gamma

    @property
    def mfg_id_ch2(self):
        if hasattr(self, '_m_mfg_id_ch2'):
            return self._m_mfg_id_ch2

        self._m_mfg_id_ch2 = ((self.mfg_bytes & 992) >> 5)
        return self._m_mfg_id_ch2


