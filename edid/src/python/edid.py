# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

from pkg_resources import parse_version
from kaitaistruct import __version__ as ks_version, KaitaiStruct, KaitaiStream, BytesIO
import struct


if parse_version(ks_version) < parse_version('0.7'):
    raise Exception("Incompatible Kaitai Struct Python API: 0.7 or later is required, but you have %s" % (ks_version))

class Edid(KaitaiStruct):
    def __init__(self, _io, _parent=None, _root=None):
        self._io = _io
        self._parent = _parent
        self._root = _root if _root else self
        self._read()

    def _read(self):
        self.magic = self._io.ensure_fixed_contents(struct.pack('8b', 0, -1, -1, -1, -1, -1, -1, 0))
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
        self.chromacity = self._io.read_bytes(10)

    @property
    def mfg_year(self):
        if hasattr(self, '_m_mfg_year'):
            return self._m_mfg_year if hasattr(self, '_m_mfg_year') else None

        self._m_mfg_year = (self.mfg_year_mod + 1990)
        return self._m_mfg_year if hasattr(self, '_m_mfg_year') else None

    @property
    def mfg_id_ch1(self):
        if hasattr(self, '_m_mfg_id_ch1'):
            return self._m_mfg_id_ch1 if hasattr(self, '_m_mfg_id_ch1') else None

        self._m_mfg_id_ch1 = ((self.mfg_bytes & 31744) >> 10)
        return self._m_mfg_id_ch1 if hasattr(self, '_m_mfg_id_ch1') else None

    @property
    def mfg_id_ch3(self):
        if hasattr(self, '_m_mfg_id_ch3'):
            return self._m_mfg_id_ch3 if hasattr(self, '_m_mfg_id_ch3') else None

        self._m_mfg_id_ch3 = (self.mfg_bytes & 31)
        return self._m_mfg_id_ch3 if hasattr(self, '_m_mfg_id_ch3') else None

    @property
    def gamma(self):
        if hasattr(self, '_m_gamma'):
            return self._m_gamma if hasattr(self, '_m_gamma') else None

        if self.gamma_mod != 255:
            self._m_gamma = ((self.gamma_mod + 100) / 100.0)

        return self._m_gamma if hasattr(self, '_m_gamma') else None

    @property
    def mfg_id_ch2(self):
        if hasattr(self, '_m_mfg_id_ch2'):
            return self._m_mfg_id_ch2 if hasattr(self, '_m_mfg_id_ch2') else None

        self._m_mfg_id_ch2 = ((self.mfg_bytes & 992) >> 5)
        return self._m_mfg_id_ch2 if hasattr(self, '_m_mfg_id_ch2') else None


