# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import ReadWriteKaitaiStruct, KaitaiStream, BytesIO
from enum import IntEnum


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class Tga(ReadWriteKaitaiStruct):
    """TGA (AKA Truevision TGA, AKA TARGA), is a raster image file format created by Truevision. It supports up to 32 bits per pixel (three 8-bit RGB channels + 8-bit alpha channel), color mapping and optional lossless RLE compression.
    
    .. seealso::
       Source - https://www.dca.fee.unicamp.br/~martino/disciplinas/ea978/tgaffs.pdf
    """

    class ColorMapEnum(IntEnum):
        no_color_map = 0
        has_color_map = 1

    class ImageTypeEnum(IntEnum):
        no_image_data = 0
        uncomp_color_mapped = 1
        uncomp_true_color = 2
        uncomp_bw = 3
        rle_color_mapped = 9
        rle_true_color = 10
        rle_bw = 11
    def __init__(self, _io=None, _parent=None, _root=None):
        super(Tga, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self
        self._should_write_footer = False
        self.footer__enabled = True

    def _read(self):
        self.image_id_len = self._io.read_u1()
        self.color_map_type = KaitaiStream.resolve_enum(Tga.ColorMapEnum, self._io.read_u1())
        self.image_type = KaitaiStream.resolve_enum(Tga.ImageTypeEnum, self._io.read_u1())
        self.color_map_ofs = self._io.read_u2le()
        self.num_color_map = self._io.read_u2le()
        self.color_map_depth = self._io.read_u1()
        self.x_offset = self._io.read_u2le()
        self.y_offset = self._io.read_u2le()
        self.width = self._io.read_u2le()
        self.height = self._io.read_u2le()
        self.image_depth = self._io.read_u1()
        self.img_descriptor = self._io.read_u1()
        self.image_id = self._io.read_bytes(self.image_id_len)
        if self.color_map_type == Tga.ColorMapEnum.has_color_map:
            pass
            self.color_map = []
            for i in range(self.num_color_map):
                self.color_map.append(self._io.read_bytes((self.color_map_depth + 7) // 8))


        self._dirty = False


    def _fetch_instances(self):
        pass
        if self.color_map_type == Tga.ColorMapEnum.has_color_map:
            pass
            for i in range(len(self.color_map)):
                pass


        _ = self.footer
        if hasattr(self, '_m_footer'):
            pass
            self._m_footer._fetch_instances()



    def _write__seq(self, io=None):
        super(Tga, self)._write__seq(io)
        self._should_write_footer = self.footer__enabled
        self._io.write_u1(self.image_id_len)
        self._io.write_u1(int(self.color_map_type))
        self._io.write_u1(int(self.image_type))
        self._io.write_u2le(self.color_map_ofs)
        self._io.write_u2le(self.num_color_map)
        self._io.write_u1(self.color_map_depth)
        self._io.write_u2le(self.x_offset)
        self._io.write_u2le(self.y_offset)
        self._io.write_u2le(self.width)
        self._io.write_u2le(self.height)
        self._io.write_u1(self.image_depth)
        self._io.write_u1(self.img_descriptor)
        self._io.write_bytes(self.image_id)
        if self.color_map_type == Tga.ColorMapEnum.has_color_map:
            pass
            for i in range(len(self.color_map)):
                pass
                self._io.write_bytes(self.color_map[i])




    def _check(self):
        if len(self.image_id) != self.image_id_len:
            raise kaitaistruct.ConsistencyError(u"image_id", self.image_id_len, len(self.image_id))
        if self.color_map_type == Tga.ColorMapEnum.has_color_map:
            pass
            if len(self.color_map) != self.num_color_map:
                raise kaitaistruct.ConsistencyError(u"color_map", self.num_color_map, len(self.color_map))
            for i in range(len(self.color_map)):
                pass
                if len(self.color_map[i]) != (self.color_map_depth + 7) // 8:
                    raise kaitaistruct.ConsistencyError(u"color_map", (self.color_map_depth + 7) // 8, len(self.color_map[i]))


        if self.footer__enabled:
            pass
            if self._m_footer._root != self._root:
                raise kaitaistruct.ConsistencyError(u"footer", self._root, self._m_footer._root)
            if self._m_footer._parent != self:
                raise kaitaistruct.ConsistencyError(u"footer", self, self._m_footer._parent)

        self._dirty = False

    class TgaExtArea(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Tga.TgaExtArea, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.ext_area_size = self._io.read_u2le()
            self.author_name = (self._io.read_bytes(41)).decode(u"ASCII")
            self.comments = []
            for i in range(4):
                self.comments.append((self._io.read_bytes(81)).decode(u"ASCII"))

            self.timestamp = self._io.read_bytes(12)
            self.job_id = (self._io.read_bytes(41)).decode(u"ASCII")
            self.job_time = (self._io.read_bytes(6)).decode(u"ASCII")
            self.software_id = (self._io.read_bytes(41)).decode(u"ASCII")
            self.software_version = self._io.read_bytes(3)
            self.key_color = self._io.read_u4le()
            self.pixel_aspect_ratio = self._io.read_u4le()
            self.gamma_value = self._io.read_u4le()
            self.color_corr_ofs = self._io.read_u4le()
            self.postage_stamp_ofs = self._io.read_u4le()
            self.scan_line_ofs = self._io.read_u4le()
            self.attributes = self._io.read_u1()
            self._dirty = False


        def _fetch_instances(self):
            pass
            for i in range(len(self.comments)):
                pass



        def _write__seq(self, io=None):
            super(Tga.TgaExtArea, self)._write__seq(io)
            self._io.write_u2le(self.ext_area_size)
            self._io.write_bytes((self.author_name).encode(u"ASCII"))
            for i in range(len(self.comments)):
                pass
                self._io.write_bytes((self.comments[i]).encode(u"ASCII"))

            self._io.write_bytes(self.timestamp)
            self._io.write_bytes((self.job_id).encode(u"ASCII"))
            self._io.write_bytes((self.job_time).encode(u"ASCII"))
            self._io.write_bytes((self.software_id).encode(u"ASCII"))
            self._io.write_bytes(self.software_version)
            self._io.write_u4le(self.key_color)
            self._io.write_u4le(self.pixel_aspect_ratio)
            self._io.write_u4le(self.gamma_value)
            self._io.write_u4le(self.color_corr_ofs)
            self._io.write_u4le(self.postage_stamp_ofs)
            self._io.write_u4le(self.scan_line_ofs)
            self._io.write_u1(self.attributes)


        def _check(self):
            if len((self.author_name).encode(u"ASCII")) != 41:
                raise kaitaistruct.ConsistencyError(u"author_name", 41, len((self.author_name).encode(u"ASCII")))
            if len(self.comments) != 4:
                raise kaitaistruct.ConsistencyError(u"comments", 4, len(self.comments))
            for i in range(len(self.comments)):
                pass
                if len((self.comments[i]).encode(u"ASCII")) != 81:
                    raise kaitaistruct.ConsistencyError(u"comments", 81, len((self.comments[i]).encode(u"ASCII")))

            if len(self.timestamp) != 12:
                raise kaitaistruct.ConsistencyError(u"timestamp", 12, len(self.timestamp))
            if len((self.job_id).encode(u"ASCII")) != 41:
                raise kaitaistruct.ConsistencyError(u"job_id", 41, len((self.job_id).encode(u"ASCII")))
            if len((self.job_time).encode(u"ASCII")) != 6:
                raise kaitaistruct.ConsistencyError(u"job_time", 6, len((self.job_time).encode(u"ASCII")))
            if len((self.software_id).encode(u"ASCII")) != 41:
                raise kaitaistruct.ConsistencyError(u"software_id", 41, len((self.software_id).encode(u"ASCII")))
            if len(self.software_version) != 3:
                raise kaitaistruct.ConsistencyError(u"software_version", 3, len(self.software_version))
            self._dirty = False


    class TgaFooter(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Tga.TgaFooter, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._should_write_ext_area = False
            self.ext_area__enabled = True

        def _read(self):
            self.ext_area_ofs = self._io.read_u4le()
            self.dev_dir_ofs = self._io.read_u4le()
            self.version_magic = self._io.read_bytes(18)
            self._dirty = False


        def _fetch_instances(self):
            pass
            _ = self.ext_area
            if hasattr(self, '_m_ext_area'):
                pass
                self._m_ext_area._fetch_instances()



        def _write__seq(self, io=None):
            super(Tga.TgaFooter, self)._write__seq(io)
            self._should_write_ext_area = self.ext_area__enabled
            self._io.write_u4le(self.ext_area_ofs)
            self._io.write_u4le(self.dev_dir_ofs)
            self._io.write_bytes(self.version_magic)


        def _check(self):
            if len(self.version_magic) != 18:
                raise kaitaistruct.ConsistencyError(u"version_magic", 18, len(self.version_magic))
            if self.ext_area__enabled:
                pass
                if self.is_valid:
                    pass
                    if self._m_ext_area._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"ext_area", self._root, self._m_ext_area._root)
                    if self._m_ext_area._parent != self:
                        raise kaitaistruct.ConsistencyError(u"ext_area", self, self._m_ext_area._parent)


            self._dirty = False

        @property
        def ext_area(self):
            if self._should_write_ext_area:
                self._write_ext_area()
            if hasattr(self, '_m_ext_area'):
                return self._m_ext_area

            if not self.ext_area__enabled:
                return None

            if self.is_valid:
                pass
                _pos = self._io.pos()
                self._io.seek(self.ext_area_ofs)
                self._m_ext_area = Tga.TgaExtArea(self._io, self, self._root)
                self._m_ext_area._read()
                self._io.seek(_pos)

            return getattr(self, '_m_ext_area', None)

        @ext_area.setter
        def ext_area(self, v):
            self._dirty = True
            self._m_ext_area = v

        def _write_ext_area(self):
            self._should_write_ext_area = False
            if self.is_valid:
                pass
                _pos = self._io.pos()
                self._io.seek(self.ext_area_ofs)
                self._m_ext_area._write__seq(self._io)
                self._io.seek(_pos)


        @property
        def is_valid(self):
            if hasattr(self, '_m_is_valid'):
                return self._m_is_valid

            self._m_is_valid = self.version_magic == b"\x54\x52\x55\x45\x56\x49\x53\x49\x4F\x4E\x2D\x58\x46\x49\x4C\x45\x2E\x00"
            return getattr(self, '_m_is_valid', None)

        def _invalidate_is_valid(self):
            del self._m_is_valid

    @property
    def footer(self):
        if self._should_write_footer:
            self._write_footer()
        if hasattr(self, '_m_footer'):
            return self._m_footer

        if not self.footer__enabled:
            return None

        _pos = self._io.pos()
        self._io.seek(self._io.size() - 26)
        self._m_footer = Tga.TgaFooter(self._io, self, self._root)
        self._m_footer._read()
        self._io.seek(_pos)
        return getattr(self, '_m_footer', None)

    @footer.setter
    def footer(self, v):
        self._dirty = True
        self._m_footer = v

    def _write_footer(self):
        self._should_write_footer = False
        _pos = self._io.pos()
        self._io.seek(self._io.size() - 26)
        self._m_footer._write__seq(self._io)
        self._io.seek(_pos)


