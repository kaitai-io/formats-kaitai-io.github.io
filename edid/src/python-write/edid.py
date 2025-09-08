# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import ReadWriteKaitaiStruct, KaitaiStream, BytesIO
from enum import IntEnum
import struct


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class Edid(ReadWriteKaitaiStruct):
    def __init__(self, _io=None, _parent=None, _root=None):
        super(Edid, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self

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
        self.chromacity._read()
        self.est_timings = Edid.EstTimingsInfo(self._io, self, self._root)
        self.est_timings._read()
        self._raw_std_timings = []
        self.std_timings = []
        for i in range(8):
            self._raw_std_timings.append(self._io.read_bytes(2))
            _io__raw_std_timings = KaitaiStream(BytesIO(self._raw_std_timings[i]))
            _t_std_timings = Edid.StdTiming(_io__raw_std_timings, self, self._root)
            try:
                _t_std_timings._read()
            finally:
                self.std_timings.append(_t_std_timings)

        self._dirty = False


    def _fetch_instances(self):
        pass
        self.chromacity._fetch_instances()
        self.est_timings._fetch_instances()
        for i in range(len(self.std_timings)):
            pass
            self.std_timings[i]._fetch_instances()



    def _write__seq(self, io=None):
        super(Edid, self)._write__seq(io)
        self._io.write_bytes(self.magic)
        self._io.write_u2be(self.mfg_bytes)
        self._io.write_u2le(self.product_code)
        self._io.write_u4le(self.serial)
        self._io.write_u1(self.mfg_week)
        self._io.write_u1(self.mfg_year_mod)
        self._io.write_u1(self.edid_version_major)
        self._io.write_u1(self.edid_version_minor)
        self._io.write_u1(self.input_flags)
        self._io.write_u1(self.screen_size_h)
        self._io.write_u1(self.screen_size_v)
        self._io.write_u1(self.gamma_mod)
        self._io.write_u1(self.features_flags)
        self.chromacity._write__seq(self._io)
        self.est_timings._write__seq(self._io)
        self._raw_std_timings = []
        for i in range(len(self.std_timings)):
            pass
            _io__raw_std_timings = KaitaiStream(BytesIO(bytearray(2)))
            self._io.add_child_stream(_io__raw_std_timings)
            _pos2 = self._io.pos()
            self._io.seek(self._io.pos() + (2))
            def handler(parent, _io__raw_std_timings=_io__raw_std_timings, i=i):
                self._raw_std_timings.append(_io__raw_std_timings.to_byte_array())
                if len(self._raw_std_timings[i]) != 2:
                    raise kaitaistruct.ConsistencyError(u"raw(std_timings)", 2, len(self._raw_std_timings[i]))
                parent.write_bytes(self._raw_std_timings[i])
            _io__raw_std_timings.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
            self.std_timings[i]._write__seq(_io__raw_std_timings)



    def _check(self):
        if len(self.magic) != 8:
            raise kaitaistruct.ConsistencyError(u"magic", 8, len(self.magic))
        if not self.magic == b"\x00\xFF\xFF\xFF\xFF\xFF\xFF\x00":
            raise kaitaistruct.ValidationNotEqualError(b"\x00\xFF\xFF\xFF\xFF\xFF\xFF\x00", self.magic, None, u"/seq/0")
        if self.chromacity._root != self._root:
            raise kaitaistruct.ConsistencyError(u"chromacity", self._root, self.chromacity._root)
        if self.chromacity._parent != self:
            raise kaitaistruct.ConsistencyError(u"chromacity", self, self.chromacity._parent)
        if self.est_timings._root != self._root:
            raise kaitaistruct.ConsistencyError(u"est_timings", self._root, self.est_timings._root)
        if self.est_timings._parent != self:
            raise kaitaistruct.ConsistencyError(u"est_timings", self, self.est_timings._parent)
        if len(self.std_timings) != 8:
            raise kaitaistruct.ConsistencyError(u"std_timings", 8, len(self.std_timings))
        for i in range(len(self.std_timings)):
            pass
            if self.std_timings[i]._root != self._root:
                raise kaitaistruct.ConsistencyError(u"std_timings", self._root, self.std_timings[i]._root)
            if self.std_timings[i]._parent != self:
                raise kaitaistruct.ConsistencyError(u"std_timings", self, self.std_timings[i]._parent)

        self._dirty = False

    class ChromacityInfo(ReadWriteKaitaiStruct):
        """Chromaticity information: colorimetry and white point
        coordinates. All coordinates are stored as fixed precision
        10-bit numbers, bits are shuffled for compactness.
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Edid.ChromacityInfo, self).__init__(_io)
            self._parent = _parent
            self._root = _root

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
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(Edid.ChromacityInfo, self)._write__seq(io)
            self._io.write_bits_int_be(2, self.red_x_1_0)
            self._io.write_bits_int_be(2, self.red_y_1_0)
            self._io.write_bits_int_be(2, self.green_x_1_0)
            self._io.write_bits_int_be(2, self.green_y_1_0)
            self._io.write_bits_int_be(2, self.blue_x_1_0)
            self._io.write_bits_int_be(2, self.blue_y_1_0)
            self._io.write_bits_int_be(2, self.white_x_1_0)
            self._io.write_bits_int_be(2, self.white_y_1_0)
            self._io.write_u1(self.red_x_9_2)
            self._io.write_u1(self.red_y_9_2)
            self._io.write_u1(self.green_x_9_2)
            self._io.write_u1(self.green_y_9_2)
            self._io.write_u1(self.blue_x_9_2)
            self._io.write_u1(self.blue_y_9_2)
            self._io.write_u1(self.white_x_9_2)
            self._io.write_u1(self.white_y_9_2)


        def _check(self):
            self._dirty = False

        @property
        def blue_x(self):
            """Blue X coordinate."""
            if hasattr(self, '_m_blue_x'):
                return self._m_blue_x

            self._m_blue_x = self.blue_x_int / 1024.0
            return getattr(self, '_m_blue_x', None)

        def _invalidate_blue_x(self):
            del self._m_blue_x
        @property
        def blue_x_int(self):
            if hasattr(self, '_m_blue_x_int'):
                return self._m_blue_x_int

            self._m_blue_x_int = self.blue_x_9_2 << 2 | self.blue_x_1_0
            return getattr(self, '_m_blue_x_int', None)

        def _invalidate_blue_x_int(self):
            del self._m_blue_x_int
        @property
        def blue_y(self):
            """Blue Y coordinate."""
            if hasattr(self, '_m_blue_y'):
                return self._m_blue_y

            self._m_blue_y = self.blue_y_int / 1024.0
            return getattr(self, '_m_blue_y', None)

        def _invalidate_blue_y(self):
            del self._m_blue_y
        @property
        def blue_y_int(self):
            if hasattr(self, '_m_blue_y_int'):
                return self._m_blue_y_int

            self._m_blue_y_int = self.blue_y_9_2 << 2 | self.blue_y_1_0
            return getattr(self, '_m_blue_y_int', None)

        def _invalidate_blue_y_int(self):
            del self._m_blue_y_int
        @property
        def green_x(self):
            """Green X coordinate."""
            if hasattr(self, '_m_green_x'):
                return self._m_green_x

            self._m_green_x = self.green_x_int / 1024.0
            return getattr(self, '_m_green_x', None)

        def _invalidate_green_x(self):
            del self._m_green_x
        @property
        def green_x_int(self):
            if hasattr(self, '_m_green_x_int'):
                return self._m_green_x_int

            self._m_green_x_int = self.green_x_9_2 << 2 | self.green_x_1_0
            return getattr(self, '_m_green_x_int', None)

        def _invalidate_green_x_int(self):
            del self._m_green_x_int
        @property
        def green_y(self):
            """Green Y coordinate."""
            if hasattr(self, '_m_green_y'):
                return self._m_green_y

            self._m_green_y = self.green_y_int / 1024.0
            return getattr(self, '_m_green_y', None)

        def _invalidate_green_y(self):
            del self._m_green_y
        @property
        def green_y_int(self):
            if hasattr(self, '_m_green_y_int'):
                return self._m_green_y_int

            self._m_green_y_int = self.green_y_9_2 << 2 | self.green_y_1_0
            return getattr(self, '_m_green_y_int', None)

        def _invalidate_green_y_int(self):
            del self._m_green_y_int
        @property
        def red_x(self):
            """Red X coordinate."""
            if hasattr(self, '_m_red_x'):
                return self._m_red_x

            self._m_red_x = self.red_x_int / 1024.0
            return getattr(self, '_m_red_x', None)

        def _invalidate_red_x(self):
            del self._m_red_x
        @property
        def red_x_int(self):
            if hasattr(self, '_m_red_x_int'):
                return self._m_red_x_int

            self._m_red_x_int = self.red_x_9_2 << 2 | self.red_x_1_0
            return getattr(self, '_m_red_x_int', None)

        def _invalidate_red_x_int(self):
            del self._m_red_x_int
        @property
        def red_y(self):
            """Red Y coordinate."""
            if hasattr(self, '_m_red_y'):
                return self._m_red_y

            self._m_red_y = self.red_y_int / 1024.0
            return getattr(self, '_m_red_y', None)

        def _invalidate_red_y(self):
            del self._m_red_y
        @property
        def red_y_int(self):
            if hasattr(self, '_m_red_y_int'):
                return self._m_red_y_int

            self._m_red_y_int = self.red_y_9_2 << 2 | self.red_y_1_0
            return getattr(self, '_m_red_y_int', None)

        def _invalidate_red_y_int(self):
            del self._m_red_y_int
        @property
        def white_x(self):
            """White X coordinate."""
            if hasattr(self, '_m_white_x'):
                return self._m_white_x

            self._m_white_x = self.white_x_int / 1024.0
            return getattr(self, '_m_white_x', None)

        def _invalidate_white_x(self):
            del self._m_white_x
        @property
        def white_x_int(self):
            if hasattr(self, '_m_white_x_int'):
                return self._m_white_x_int

            self._m_white_x_int = self.white_x_9_2 << 2 | self.white_x_1_0
            return getattr(self, '_m_white_x_int', None)

        def _invalidate_white_x_int(self):
            del self._m_white_x_int
        @property
        def white_y(self):
            """White Y coordinate."""
            if hasattr(self, '_m_white_y'):
                return self._m_white_y

            self._m_white_y = self.white_y_int / 1024.0
            return getattr(self, '_m_white_y', None)

        def _invalidate_white_y(self):
            del self._m_white_y
        @property
        def white_y_int(self):
            if hasattr(self, '_m_white_y_int'):
                return self._m_white_y_int

            self._m_white_y_int = self.white_y_9_2 << 2 | self.white_y_1_0
            return getattr(self, '_m_white_y_int', None)

        def _invalidate_white_y_int(self):
            del self._m_white_y_int

    class EstTimingsInfo(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Edid.EstTimingsInfo, self).__init__(_io)
            self._parent = _parent
            self._root = _root

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
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(Edid.EstTimingsInfo, self)._write__seq(io)
            self._io.write_bits_int_be(1, int(self.can_720x400px_70hz))
            self._io.write_bits_int_be(1, int(self.can_720x400px_88hz))
            self._io.write_bits_int_be(1, int(self.can_640x480px_60hz))
            self._io.write_bits_int_be(1, int(self.can_640x480px_67hz))
            self._io.write_bits_int_be(1, int(self.can_640x480px_72hz))
            self._io.write_bits_int_be(1, int(self.can_640x480px_75hz))
            self._io.write_bits_int_be(1, int(self.can_800x600px_56hz))
            self._io.write_bits_int_be(1, int(self.can_800x600px_60hz))
            self._io.write_bits_int_be(1, int(self.can_800x600px_72hz))
            self._io.write_bits_int_be(1, int(self.can_800x600px_75hz))
            self._io.write_bits_int_be(1, int(self.can_832x624px_75hz))
            self._io.write_bits_int_be(1, int(self.can_1024x768px_87hz_i))
            self._io.write_bits_int_be(1, int(self.can_1024x768px_60hz))
            self._io.write_bits_int_be(1, int(self.can_1024x768px_70hz))
            self._io.write_bits_int_be(1, int(self.can_1024x768px_75hz))
            self._io.write_bits_int_be(1, int(self.can_1280x1024px_75hz))
            self._io.write_bits_int_be(1, int(self.can_1152x870px_75hz))
            self._io.write_bits_int_be(7, self.reserved)


        def _check(self):
            self._dirty = False


    class StdTiming(ReadWriteKaitaiStruct):

        class AspectRatios(IntEnum):
            ratio_16_10 = 0
            ratio_4_3 = 1
            ratio_5_4 = 2
            ratio_16_9 = 3
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Edid.StdTiming, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._should_write_bytes_lookahead = False
            self.bytes_lookahead__enabled = True

        def _read(self):
            self.horiz_active_pixels_mod = self._io.read_u1()
            self.aspect_ratio = KaitaiStream.resolve_enum(Edid.StdTiming.AspectRatios, self._io.read_bits_int_be(2))
            self.refresh_rate_mod = self._io.read_bits_int_be(6)
            self._dirty = False


        def _fetch_instances(self):
            pass
            _ = self.bytes_lookahead
            if hasattr(self, '_m_bytes_lookahead'):
                pass



        def _write__seq(self, io=None):
            super(Edid.StdTiming, self)._write__seq(io)
            self._should_write_bytes_lookahead = self.bytes_lookahead__enabled
            self._io.write_u1(self.horiz_active_pixels_mod)
            self._io.write_bits_int_be(2, int(self.aspect_ratio))
            self._io.write_bits_int_be(6, self.refresh_rate_mod)


        def _check(self):
            if self.bytes_lookahead__enabled:
                pass
                if len(self._m_bytes_lookahead) != 2:
                    raise kaitaistruct.ConsistencyError(u"bytes_lookahead", 2, len(self._m_bytes_lookahead))

            self._dirty = False

        @property
        def bytes_lookahead(self):
            if self._should_write_bytes_lookahead:
                self._write_bytes_lookahead()
            if hasattr(self, '_m_bytes_lookahead'):
                return self._m_bytes_lookahead

            if not self.bytes_lookahead__enabled:
                return None

            _pos = self._io.pos()
            self._io.seek(0)
            self._m_bytes_lookahead = self._io.read_bytes(2)
            self._io.seek(_pos)
            return getattr(self, '_m_bytes_lookahead', None)

        @bytes_lookahead.setter
        def bytes_lookahead(self, v):
            self._dirty = True
            self._m_bytes_lookahead = v

        def _write_bytes_lookahead(self):
            self._should_write_bytes_lookahead = False
            _pos = self._io.pos()
            self._io.seek(0)
            self._io.write_bytes(self._m_bytes_lookahead)
            self._io.seek(_pos)

        @property
        def horiz_active_pixels(self):
            """Range of horizontal active pixels."""
            if hasattr(self, '_m_horiz_active_pixels'):
                return self._m_horiz_active_pixels

            if self.is_used:
                pass
                self._m_horiz_active_pixels = (self.horiz_active_pixels_mod + 31) * 8

            return getattr(self, '_m_horiz_active_pixels', None)

        def _invalidate_horiz_active_pixels(self):
            del self._m_horiz_active_pixels
        @property
        def is_used(self):
            if hasattr(self, '_m_is_used'):
                return self._m_is_used

            self._m_is_used = self.bytes_lookahead != b"\x01\x01"
            return getattr(self, '_m_is_used', None)

        def _invalidate_is_used(self):
            del self._m_is_used
        @property
        def refresh_rate(self):
            """Vertical refresh rate, Hz."""
            if hasattr(self, '_m_refresh_rate'):
                return self._m_refresh_rate

            if self.is_used:
                pass
                self._m_refresh_rate = self.refresh_rate_mod + 60

            return getattr(self, '_m_refresh_rate', None)

        def _invalidate_refresh_rate(self):
            del self._m_refresh_rate

    @property
    def gamma(self):
        if hasattr(self, '_m_gamma'):
            return self._m_gamma

        if self.gamma_mod != 255:
            pass
            self._m_gamma = (self.gamma_mod + 100) / 100.0

        return getattr(self, '_m_gamma', None)

    def _invalidate_gamma(self):
        del self._m_gamma
    @property
    def mfg_id_ch1(self):
        if hasattr(self, '_m_mfg_id_ch1'):
            return self._m_mfg_id_ch1

        self._m_mfg_id_ch1 = (self.mfg_bytes & 31744) >> 10
        return getattr(self, '_m_mfg_id_ch1', None)

    def _invalidate_mfg_id_ch1(self):
        del self._m_mfg_id_ch1
    @property
    def mfg_id_ch2(self):
        if hasattr(self, '_m_mfg_id_ch2'):
            return self._m_mfg_id_ch2

        self._m_mfg_id_ch2 = (self.mfg_bytes & 992) >> 5
        return getattr(self, '_m_mfg_id_ch2', None)

    def _invalidate_mfg_id_ch2(self):
        del self._m_mfg_id_ch2
    @property
    def mfg_id_ch3(self):
        if hasattr(self, '_m_mfg_id_ch3'):
            return self._m_mfg_id_ch3

        self._m_mfg_id_ch3 = self.mfg_bytes & 31
        return getattr(self, '_m_mfg_id_ch3', None)

    def _invalidate_mfg_id_ch3(self):
        del self._m_mfg_id_ch3
    @property
    def mfg_str(self):
        if hasattr(self, '_m_mfg_str'):
            return self._m_mfg_str

        self._m_mfg_str = (struct.pack('3B', self.mfg_id_ch1 + 64, self.mfg_id_ch2 + 64, self.mfg_id_ch3 + 64)).decode(u"ASCII")
        return getattr(self, '_m_mfg_str', None)

    def _invalidate_mfg_str(self):
        del self._m_mfg_str
    @property
    def mfg_year(self):
        if hasattr(self, '_m_mfg_year'):
            return self._m_mfg_year

        self._m_mfg_year = self.mfg_year_mod + 1990
        return getattr(self, '_m_mfg_year', None)

    def _invalidate_mfg_year(self):
        del self._m_mfg_year

