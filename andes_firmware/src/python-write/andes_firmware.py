# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import ReadWriteKaitaiStruct, KaitaiStream, BytesIO


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class AndesFirmware(ReadWriteKaitaiStruct):
    """Firmware image found with MediaTek MT76xx wifi chipsets."""
    def __init__(self, _io=None, _parent=None, _root=None):
        super(AndesFirmware, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self

    def _read(self):
        self._raw_image_header = self._io.read_bytes(32)
        _io__raw_image_header = KaitaiStream(BytesIO(self._raw_image_header))
        self.image_header = AndesFirmware.ImageHeader(_io__raw_image_header, self, self._root)
        self.image_header._read()
        self.ilm = self._io.read_bytes(self.image_header.ilm_len)
        self.dlm = self._io.read_bytes(self.image_header.dlm_len)
        self._dirty = False


    def _fetch_instances(self):
        pass
        self.image_header._fetch_instances()


    def _write__seq(self, io=None):
        super(AndesFirmware, self)._write__seq(io)
        _io__raw_image_header = KaitaiStream(BytesIO(bytearray(32)))
        self._io.add_child_stream(_io__raw_image_header)
        _pos2 = self._io.pos()
        self._io.seek(self._io.pos() + (32))
        def handler(parent, _io__raw_image_header=_io__raw_image_header):
            self._raw_image_header = _io__raw_image_header.to_byte_array()
            if len(self._raw_image_header) != 32:
                raise kaitaistruct.ConsistencyError(u"raw(image_header)", 32, len(self._raw_image_header))
            parent.write_bytes(self._raw_image_header)
        _io__raw_image_header.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
        self.image_header._write__seq(_io__raw_image_header)
        self._io.write_bytes(self.ilm)
        self._io.write_bytes(self.dlm)


    def _check(self):
        if self.image_header._root != self._root:
            raise kaitaistruct.ConsistencyError(u"image_header", self._root, self.image_header._root)
        if self.image_header._parent != self:
            raise kaitaistruct.ConsistencyError(u"image_header", self, self.image_header._parent)
        if len(self.ilm) != self.image_header.ilm_len:
            raise kaitaistruct.ConsistencyError(u"ilm", self.image_header.ilm_len, len(self.ilm))
        if len(self.dlm) != self.image_header.dlm_len:
            raise kaitaistruct.ConsistencyError(u"dlm", self.image_header.dlm_len, len(self.dlm))
        self._dirty = False

    class ImageHeader(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(AndesFirmware.ImageHeader, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.ilm_len = self._io.read_u4le()
            self.dlm_len = self._io.read_u4le()
            self.fw_ver = self._io.read_u2le()
            self.build_ver = self._io.read_u2le()
            self.extra = self._io.read_u4le()
            self.build_time = (self._io.read_bytes(16)).decode(u"UTF-8")
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(AndesFirmware.ImageHeader, self)._write__seq(io)
            self._io.write_u4le(self.ilm_len)
            self._io.write_u4le(self.dlm_len)
            self._io.write_u2le(self.fw_ver)
            self._io.write_u2le(self.build_ver)
            self._io.write_u4le(self.extra)
            self._io.write_bytes((self.build_time).encode(u"UTF-8"))


        def _check(self):
            if len((self.build_time).encode(u"UTF-8")) != 16:
                raise kaitaistruct.ConsistencyError(u"build_time", 16, len((self.build_time).encode(u"UTF-8")))
            self._dirty = False



