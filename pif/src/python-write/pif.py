# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import ReadWriteKaitaiStruct, KaitaiStream, BytesIO
from enum import IntEnum


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class Pif(ReadWriteKaitaiStruct):
    """The Portable Image Format (PIF) is a basic, bitmap-like image format with the
    focus on ease of use (implementation) and small size for embedded
    applications.
    
    See <https://github.com/gfcwfzkm/PIF-Image-Format> for more info.
    
    .. seealso::
       Source - https://github.com/gfcwfzkm/PIF-Image-Format/blob/4ec261b/Specification/PIF%20Format%20Specification.pdf
    
    
    .. seealso::
       Source - https://github.com/gfcwfzkm/PIF-Image-Format/blob/4ec261b/C%20Library/pifdec.c#L300
    """

    class CompressionType(IntEnum):
        none = 0
        rle = 32222

    class ImageType(IntEnum):
        rgb332 = 7763
        rgb888 = 17212
        indexed_rgb332 = 18754
        indexed_rgb565 = 18759
        indexed_rgb888 = 18770
        black_white = 32170
        rgb16c = 47253
        rgb565 = 58821
    def __init__(self, _io=None, _parent=None, _root=None):
        super(Pif, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self
        self._should_write_image_data = False
        self.image_data__enabled = True

    def _read(self):
        self.file_header = Pif.PifHeader(self._io, self, self._root)
        self.file_header._read()
        self.info_header = Pif.InformationHeader(self._io, self, self._root)
        self.info_header._read()
        if self.info_header.uses_indexed_mode:
            pass
            self._raw_color_table = self._io.read_bytes(self.info_header.len_color_table)
            _io__raw_color_table = KaitaiStream(BytesIO(self._raw_color_table))
            self.color_table = Pif.ColorTableData(_io__raw_color_table, self, self._root)
            self.color_table._read()

        self._dirty = False


    def _fetch_instances(self):
        pass
        self.file_header._fetch_instances()
        self.info_header._fetch_instances()
        if self.info_header.uses_indexed_mode:
            pass
            self.color_table._fetch_instances()

        _ = self.image_data
        if hasattr(self, '_m_image_data'):
            pass



    def _write__seq(self, io=None):
        super(Pif, self)._write__seq(io)
        self._should_write_image_data = self.image_data__enabled
        self.file_header._write__seq(self._io)
        self.info_header._write__seq(self._io)
        if self.info_header.uses_indexed_mode:
            pass
            _io__raw_color_table = KaitaiStream(BytesIO(bytearray(self.info_header.len_color_table)))
            self._io.add_child_stream(_io__raw_color_table)
            _pos2 = self._io.pos()
            self._io.seek(self._io.pos() + (self.info_header.len_color_table))
            def handler(parent, _io__raw_color_table=_io__raw_color_table):
                self._raw_color_table = _io__raw_color_table.to_byte_array()
                if len(self._raw_color_table) != self.info_header.len_color_table:
                    raise kaitaistruct.ConsistencyError(u"raw(color_table)", self.info_header.len_color_table, len(self._raw_color_table))
                parent.write_bytes(self._raw_color_table)
            _io__raw_color_table.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
            self.color_table._write__seq(_io__raw_color_table)



    def _check(self):
        if self.file_header._root != self._root:
            raise kaitaistruct.ConsistencyError(u"file_header", self._root, self.file_header._root)
        if self.file_header._parent != self:
            raise kaitaistruct.ConsistencyError(u"file_header", self, self.file_header._parent)
        if self.info_header._root != self._root:
            raise kaitaistruct.ConsistencyError(u"info_header", self._root, self.info_header._root)
        if self.info_header._parent != self:
            raise kaitaistruct.ConsistencyError(u"info_header", self, self.info_header._parent)
        if self.info_header.uses_indexed_mode:
            pass
            if self.color_table._root != self._root:
                raise kaitaistruct.ConsistencyError(u"color_table", self._root, self.color_table._root)
            if self.color_table._parent != self:
                raise kaitaistruct.ConsistencyError(u"color_table", self, self.color_table._parent)

        if self.image_data__enabled:
            pass
            if len(self._m_image_data) != self.info_header.len_image_data:
                raise kaitaistruct.ConsistencyError(u"image_data", self.info_header.len_image_data, len(self._m_image_data))

        self._dirty = False

    class ColorTableData(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Pif.ColorTableData, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.entries = []
            i = 0
            while not self._io.is_eof():
                _on = self._root.info_header.image_type
                if _on == Pif.ImageType.indexed_rgb332:
                    pass
                    self.entries.append(self._io.read_bits_int_le(8))
                elif _on == Pif.ImageType.indexed_rgb565:
                    pass
                    self.entries.append(self._io.read_bits_int_le(16))
                elif _on == Pif.ImageType.indexed_rgb888:
                    pass
                    self.entries.append(self._io.read_bits_int_le(24))
                i += 1

            self._dirty = False


        def _fetch_instances(self):
            pass
            for i in range(len(self.entries)):
                pass
                _on = self._root.info_header.image_type
                if _on == Pif.ImageType.indexed_rgb332:
                    pass
                elif _on == Pif.ImageType.indexed_rgb565:
                    pass
                elif _on == Pif.ImageType.indexed_rgb888:
                    pass



        def _write__seq(self, io=None):
            super(Pif.ColorTableData, self)._write__seq(io)
            for i in range(len(self.entries)):
                pass
                if self._io.is_eof():
                    raise kaitaistruct.ConsistencyError(u"entries", 0, self._io.size() - self._io.pos())
                _on = self._root.info_header.image_type
                if _on == Pif.ImageType.indexed_rgb332:
                    pass
                    self._io.write_bits_int_le(8, self.entries[i])
                elif _on == Pif.ImageType.indexed_rgb565:
                    pass
                    self._io.write_bits_int_le(16, self.entries[i])
                elif _on == Pif.ImageType.indexed_rgb888:
                    pass
                    self._io.write_bits_int_le(24, self.entries[i])

            if not self._io.is_eof():
                raise kaitaistruct.ConsistencyError(u"entries", 0, self._io.size() - self._io.pos())


        def _check(self):
            for i in range(len(self.entries)):
                pass
                _on = self._root.info_header.image_type
                if _on == Pif.ImageType.indexed_rgb332:
                    pass
                elif _on == Pif.ImageType.indexed_rgb565:
                    pass
                elif _on == Pif.ImageType.indexed_rgb888:
                    pass

            self._dirty = False


    class InformationHeader(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Pif.InformationHeader, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.image_type = KaitaiStream.resolve_enum(Pif.ImageType, self._io.read_u2le())
            if not  ((self.image_type == Pif.ImageType.rgb888) or (self.image_type == Pif.ImageType.rgb565) or (self.image_type == Pif.ImageType.rgb332) or (self.image_type == Pif.ImageType.rgb16c) or (self.image_type == Pif.ImageType.black_white) or (self.image_type == Pif.ImageType.indexed_rgb888) or (self.image_type == Pif.ImageType.indexed_rgb565) or (self.image_type == Pif.ImageType.indexed_rgb332)) :
                raise kaitaistruct.ValidationNotAnyOfError(self.image_type, self._io, u"/types/information_header/seq/0")
            self.bits_per_pixel = self._io.read_u2le()
            _ = self.bits_per_pixel
            if not (_ == 24 if self.image_type == Pif.ImageType.rgb888 else (_ == 16 if self.image_type == Pif.ImageType.rgb565 else (_ == 8 if self.image_type == Pif.ImageType.rgb332 else (_ == 4 if self.image_type == Pif.ImageType.rgb16c else (_ == 1 if self.image_type == Pif.ImageType.black_white else (_ <= 8 if self.uses_indexed_mode else True)))))):
                raise kaitaistruct.ValidationExprError(self.bits_per_pixel, self._io, u"/types/information_header/seq/1")
            self.width = self._io.read_u2le()
            self.height = self._io.read_u2le()
            self.len_image_data = self._io.read_u4le()
            if not self.len_image_data <= self._root.file_header.len_file - self._root.file_header.ofs_image_data:
                raise kaitaistruct.ValidationGreaterThanError(self._root.file_header.len_file - self._root.file_header.ofs_image_data, self.len_image_data, self._io, u"/types/information_header/seq/4")
            self.len_color_table = self._io.read_u2le()
            if not self.len_color_table >= (self.len_color_table_entry * 1 if self.uses_indexed_mode else 0):
                raise kaitaistruct.ValidationLessThanError((self.len_color_table_entry * 1 if self.uses_indexed_mode else 0), self.len_color_table, self._io, u"/types/information_header/seq/5")
            if not self.len_color_table <= ((self.len_color_table_max if self.len_color_table_max < self.len_color_table_full else self.len_color_table_full) if self.uses_indexed_mode else 0):
                raise kaitaistruct.ValidationGreaterThanError(((self.len_color_table_max if self.len_color_table_max < self.len_color_table_full else self.len_color_table_full) if self.uses_indexed_mode else 0), self.len_color_table, self._io, u"/types/information_header/seq/5")
            self.compression = KaitaiStream.resolve_enum(Pif.CompressionType, self._io.read_u2le())
            if not  ((self.compression == Pif.CompressionType.none) or (self.compression == Pif.CompressionType.rle)) :
                raise kaitaistruct.ValidationNotAnyOfError(self.compression, self._io, u"/types/information_header/seq/6")
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(Pif.InformationHeader, self)._write__seq(io)
            self._io.write_u2le(int(self.image_type))
            self._io.write_u2le(self.bits_per_pixel)
            self._io.write_u2le(self.width)
            self._io.write_u2le(self.height)
            self._io.write_u4le(self.len_image_data)
            self._io.write_u2le(self.len_color_table)
            self._io.write_u2le(int(self.compression))


        def _check(self):
            if not  ((self.image_type == Pif.ImageType.rgb888) or (self.image_type == Pif.ImageType.rgb565) or (self.image_type == Pif.ImageType.rgb332) or (self.image_type == Pif.ImageType.rgb16c) or (self.image_type == Pif.ImageType.black_white) or (self.image_type == Pif.ImageType.indexed_rgb888) or (self.image_type == Pif.ImageType.indexed_rgb565) or (self.image_type == Pif.ImageType.indexed_rgb332)) :
                raise kaitaistruct.ValidationNotAnyOfError(self.image_type, None, u"/types/information_header/seq/0")
            _ = self.bits_per_pixel
            if not (_ == 24 if self.image_type == Pif.ImageType.rgb888 else (_ == 16 if self.image_type == Pif.ImageType.rgb565 else (_ == 8 if self.image_type == Pif.ImageType.rgb332 else (_ == 4 if self.image_type == Pif.ImageType.rgb16c else (_ == 1 if self.image_type == Pif.ImageType.black_white else (_ <= 8 if self.uses_indexed_mode else True)))))):
                raise kaitaistruct.ValidationExprError(self.bits_per_pixel, None, u"/types/information_header/seq/1")
            if not self.len_image_data <= self._root.file_header.len_file - self._root.file_header.ofs_image_data:
                raise kaitaistruct.ValidationGreaterThanError(self._root.file_header.len_file - self._root.file_header.ofs_image_data, self.len_image_data, None, u"/types/information_header/seq/4")
            if not self.len_color_table >= (self.len_color_table_entry * 1 if self.uses_indexed_mode else 0):
                raise kaitaistruct.ValidationLessThanError((self.len_color_table_entry * 1 if self.uses_indexed_mode else 0), self.len_color_table, None, u"/types/information_header/seq/5")
            if not self.len_color_table <= ((self.len_color_table_max if self.len_color_table_max < self.len_color_table_full else self.len_color_table_full) if self.uses_indexed_mode else 0):
                raise kaitaistruct.ValidationGreaterThanError(((self.len_color_table_max if self.len_color_table_max < self.len_color_table_full else self.len_color_table_full) if self.uses_indexed_mode else 0), self.len_color_table, None, u"/types/information_header/seq/5")
            if not  ((self.compression == Pif.CompressionType.none) or (self.compression == Pif.CompressionType.rle)) :
                raise kaitaistruct.ValidationNotAnyOfError(self.compression, None, u"/types/information_header/seq/6")
            self._dirty = False

        @property
        def len_color_table_entry(self):
            if hasattr(self, '_m_len_color_table_entry'):
                return self._m_len_color_table_entry

            self._m_len_color_table_entry = (3 if self.image_type == Pif.ImageType.indexed_rgb888 else (2 if self.image_type == Pif.ImageType.indexed_rgb565 else (1 if self.image_type == Pif.ImageType.indexed_rgb332 else 0)))
            return getattr(self, '_m_len_color_table_entry', None)

        def _invalidate_len_color_table_entry(self):
            del self._m_len_color_table_entry
        @property
        def len_color_table_full(self):
            if hasattr(self, '_m_len_color_table_full'):
                return self._m_len_color_table_full

            self._m_len_color_table_full = self.len_color_table_entry * (1 << self.bits_per_pixel)
            return getattr(self, '_m_len_color_table_full', None)

        def _invalidate_len_color_table_full(self):
            del self._m_len_color_table_full
        @property
        def len_color_table_max(self):
            if hasattr(self, '_m_len_color_table_max'):
                return self._m_len_color_table_max

            self._m_len_color_table_max = self._root.file_header.ofs_image_data - self._root.file_header.ofs_image_data_min
            return getattr(self, '_m_len_color_table_max', None)

        def _invalidate_len_color_table_max(self):
            del self._m_len_color_table_max
        @property
        def uses_indexed_mode(self):
            if hasattr(self, '_m_uses_indexed_mode'):
                return self._m_uses_indexed_mode

            self._m_uses_indexed_mode = self.len_color_table_entry != 0
            return getattr(self, '_m_uses_indexed_mode', None)

        def _invalidate_uses_indexed_mode(self):
            del self._m_uses_indexed_mode

    class PifHeader(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Pif.PifHeader, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.magic = self._io.read_bytes(4)
            if not self.magic == b"\x50\x49\x46\x00":
                raise kaitaistruct.ValidationNotEqualError(b"\x50\x49\x46\x00", self.magic, self._io, u"/types/pif_header/seq/0")
            self.len_file = self._io.read_u4le()
            if not self.len_file >= self.ofs_image_data_min:
                raise kaitaistruct.ValidationLessThanError(self.ofs_image_data_min, self.len_file, self._io, u"/types/pif_header/seq/1")
            self.ofs_image_data = self._io.read_u4le()
            if not self.ofs_image_data >= self.ofs_image_data_min:
                raise kaitaistruct.ValidationLessThanError(self.ofs_image_data_min, self.ofs_image_data, self._io, u"/types/pif_header/seq/2")
            if not self.ofs_image_data <= self.len_file:
                raise kaitaistruct.ValidationGreaterThanError(self.len_file, self.ofs_image_data, self._io, u"/types/pif_header/seq/2")
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(Pif.PifHeader, self)._write__seq(io)
            self._io.write_bytes(self.magic)
            self._io.write_u4le(self.len_file)
            self._io.write_u4le(self.ofs_image_data)


        def _check(self):
            if len(self.magic) != 4:
                raise kaitaistruct.ConsistencyError(u"magic", 4, len(self.magic))
            if not self.magic == b"\x50\x49\x46\x00":
                raise kaitaistruct.ValidationNotEqualError(b"\x50\x49\x46\x00", self.magic, None, u"/types/pif_header/seq/0")
            if not self.len_file >= self.ofs_image_data_min:
                raise kaitaistruct.ValidationLessThanError(self.ofs_image_data_min, self.len_file, None, u"/types/pif_header/seq/1")
            if not self.ofs_image_data >= self.ofs_image_data_min:
                raise kaitaistruct.ValidationLessThanError(self.ofs_image_data_min, self.ofs_image_data, None, u"/types/pif_header/seq/2")
            if not self.ofs_image_data <= self.len_file:
                raise kaitaistruct.ValidationGreaterThanError(self.len_file, self.ofs_image_data, None, u"/types/pif_header/seq/2")
            self._dirty = False

        @property
        def ofs_image_data_min(self):
            if hasattr(self, '_m_ofs_image_data_min'):
                return self._m_ofs_image_data_min

            self._m_ofs_image_data_min = 12 + 16
            return getattr(self, '_m_ofs_image_data_min', None)

        def _invalidate_ofs_image_data_min(self):
            del self._m_ofs_image_data_min

    @property
    def image_data(self):
        if self._should_write_image_data:
            self._write_image_data()
        if hasattr(self, '_m_image_data'):
            return self._m_image_data

        if not self.image_data__enabled:
            return None

        _pos = self._io.pos()
        self._io.seek(self.file_header.ofs_image_data)
        self._m_image_data = self._io.read_bytes(self.info_header.len_image_data)
        self._io.seek(_pos)
        return getattr(self, '_m_image_data', None)

    @image_data.setter
    def image_data(self, v):
        self._dirty = True
        self._m_image_data = v

    def _write_image_data(self):
        self._should_write_image_data = False
        _pos = self._io.pos()
        self._io.seek(self.file_header.ofs_image_data)
        self._io.write_bytes(self._m_image_data)
        self._io.seek(_pos)


