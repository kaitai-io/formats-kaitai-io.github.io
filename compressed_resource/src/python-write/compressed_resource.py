# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import ReadWriteKaitaiStruct, KaitaiStream, BytesIO
import bytes_with_io


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class CompressedResource(ReadWriteKaitaiStruct):
    """Compressed Macintosh resource data,
    as stored in resources with the "compressed" attribute.
    
    Resource decompression is not documented by Apple.
    It is mostly used internally in System 7,
    some of Apple's own applications (such as ResEdit),
    and also by some third-party applications.
    Later versions of Classic Mac OS make less use of resource compression,
    but still support it fully for backwards compatibility.
    Carbon in Mac OS X no longer supports resource compression in any way.
    
    The data of all compressed resources starts with a common header,
    followed by the compressed data.
    The data is decompressed using code in a `'dcmp'` resource.
    Some decompressors used by Apple are included in the System file,
    but applications can also include custom decompressors.
    The header of the compressed data indicates the ID of the `'dcmp'` resource used to decompress the data,
    along with some parameters for the decompressor.
    
    .. seealso::
       Source - http://www.alysis.us/arctechnology.htm
    
    
    .. seealso::
       Source - http://preserve.mactech.com/articles/mactech/Vol.09/09.01/ResCompression/index.html
    
    
    .. seealso::
       Source - https://github.com/dgelessus/python-rsrcfork/tree/f891a6e/src/rsrcfork/compress
    """
    def __init__(self, _io=None, _parent=None, _root=None):
        super(CompressedResource, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self

    def _read(self):
        self.header = CompressedResource.Header(self._io, self, self._root)
        self.header._read()
        self.compressed_data = self._io.read_bytes_full()
        self._dirty = False


    def _fetch_instances(self):
        pass
        self.header._fetch_instances()


    def _write__seq(self, io=None):
        super(CompressedResource, self)._write__seq(io)
        self.header._write__seq(self._io)
        self._io.write_bytes(self.compressed_data)
        if not self._io.is_eof():
            raise kaitaistruct.ConsistencyError(u"compressed_data", 0, self._io.size() - self._io.pos())


    def _check(self):
        if self.header._root != self._root:
            raise kaitaistruct.ConsistencyError(u"header", self._root, self.header._root)
        if self.header._parent != self:
            raise kaitaistruct.ConsistencyError(u"header", self, self.header._parent)
        self._dirty = False

    class Header(ReadWriteKaitaiStruct):
        """Compressed resource data header,
        as stored at the start of all compressed resources.
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(CompressedResource.Header, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._should_write_type_specific_part = False
            self.type_specific_part__enabled = True

        def _read(self):
            self.common_part = CompressedResource.Header.CommonPart(self._io, self, self._root)
            self.common_part._read()
            self._raw_type_specific_part_raw_with_io = self._io.read_bytes(self.common_part.len_header - 12)
            _io__raw_type_specific_part_raw_with_io = KaitaiStream(BytesIO(self._raw_type_specific_part_raw_with_io))
            self.type_specific_part_raw_with_io = bytes_with_io.BytesWithIo(_io__raw_type_specific_part_raw_with_io)
            self.type_specific_part_raw_with_io._read()
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.common_part._fetch_instances()
            self.type_specific_part_raw_with_io._fetch_instances()
            _ = self.type_specific_part
            if hasattr(self, '_m_type_specific_part'):
                pass
                _on = self.common_part.header_type
                if _on == 8:
                    pass
                    self._m_type_specific_part._fetch_instances()
                elif _on == 9:
                    pass
                    self._m_type_specific_part._fetch_instances()



        def _write__seq(self, io=None):
            super(CompressedResource.Header, self)._write__seq(io)
            self._should_write_type_specific_part = self.type_specific_part__enabled
            self.common_part._write__seq(self._io)
            _io__raw_type_specific_part_raw_with_io = KaitaiStream(BytesIO(bytearray(self.common_part.len_header - 12)))
            self._io.add_child_stream(_io__raw_type_specific_part_raw_with_io)
            _pos2 = self._io.pos()
            self._io.seek(self._io.pos() + (self.common_part.len_header - 12))
            def handler(parent, _io__raw_type_specific_part_raw_with_io=_io__raw_type_specific_part_raw_with_io):
                self._raw_type_specific_part_raw_with_io = _io__raw_type_specific_part_raw_with_io.to_byte_array()
                if len(self._raw_type_specific_part_raw_with_io) != self.common_part.len_header - 12:
                    raise kaitaistruct.ConsistencyError(u"raw(type_specific_part_raw_with_io)", self.common_part.len_header - 12, len(self._raw_type_specific_part_raw_with_io))
                parent.write_bytes(self._raw_type_specific_part_raw_with_io)
            _io__raw_type_specific_part_raw_with_io.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
            self.type_specific_part_raw_with_io._write__seq(_io__raw_type_specific_part_raw_with_io)


        def _check(self):
            if self.common_part._root != self._root:
                raise kaitaistruct.ConsistencyError(u"common_part", self._root, self.common_part._root)
            if self.common_part._parent != self:
                raise kaitaistruct.ConsistencyError(u"common_part", self, self.common_part._parent)
            if self.type_specific_part__enabled:
                pass
                _on = self.common_part.header_type
                if _on == 8:
                    pass
                    if self._m_type_specific_part._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"type_specific_part", self._root, self._m_type_specific_part._root)
                    if self._m_type_specific_part._parent != self:
                        raise kaitaistruct.ConsistencyError(u"type_specific_part", self, self._m_type_specific_part._parent)
                elif _on == 9:
                    pass
                    if self._m_type_specific_part._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"type_specific_part", self._root, self._m_type_specific_part._root)
                    if self._m_type_specific_part._parent != self:
                        raise kaitaistruct.ConsistencyError(u"type_specific_part", self, self._m_type_specific_part._parent)

            self._dirty = False

        class CommonPart(ReadWriteKaitaiStruct):
            """The common part of a compressed resource data header.
            The format of this part is the same for all compressed resources.
            """
            def __init__(self, _io=None, _parent=None, _root=None):
                super(CompressedResource.Header.CommonPart, self).__init__(_io)
                self._parent = _parent
                self._root = _root

            def _read(self):
                self.magic = self._io.read_bytes(4)
                if not self.magic == b"\xA8\x9F\x65\x72":
                    raise kaitaistruct.ValidationNotEqualError(b"\xA8\x9F\x65\x72", self.magic, self._io, u"/types/header/types/common_part/seq/0")
                self.len_header = self._io.read_u2be()
                if not self.len_header == 18:
                    raise kaitaistruct.ValidationNotEqualError(18, self.len_header, self._io, u"/types/header/types/common_part/seq/1")
                self.header_type = self._io.read_u1()
                self.unknown = self._io.read_u1()
                if not self.unknown == 1:
                    raise kaitaistruct.ValidationNotEqualError(1, self.unknown, self._io, u"/types/header/types/common_part/seq/3")
                self.len_decompressed = self._io.read_u4be()
                self._dirty = False


            def _fetch_instances(self):
                pass


            def _write__seq(self, io=None):
                super(CompressedResource.Header.CommonPart, self)._write__seq(io)
                self._io.write_bytes(self.magic)
                self._io.write_u2be(self.len_header)
                self._io.write_u1(self.header_type)
                self._io.write_u1(self.unknown)
                self._io.write_u4be(self.len_decompressed)


            def _check(self):
                if len(self.magic) != 4:
                    raise kaitaistruct.ConsistencyError(u"magic", 4, len(self.magic))
                if not self.magic == b"\xA8\x9F\x65\x72":
                    raise kaitaistruct.ValidationNotEqualError(b"\xA8\x9F\x65\x72", self.magic, None, u"/types/header/types/common_part/seq/0")
                if not self.len_header == 18:
                    raise kaitaistruct.ValidationNotEqualError(18, self.len_header, None, u"/types/header/types/common_part/seq/1")
                if not self.unknown == 1:
                    raise kaitaistruct.ValidationNotEqualError(1, self.unknown, None, u"/types/header/types/common_part/seq/3")
                self._dirty = False


        class TypeSpecificPartType8(ReadWriteKaitaiStruct):
            """The type-specific part of a compressed resource header with header type `8`.
            """
            def __init__(self, _io=None, _parent=None, _root=None):
                super(CompressedResource.Header.TypeSpecificPartType8, self).__init__(_io)
                self._parent = _parent
                self._root = _root

            def _read(self):
                self.working_buffer_fractional_size = self._io.read_u1()
                self.expansion_buffer_size = self._io.read_u1()
                self.decompressor_id = self._io.read_s2be()
                self.reserved = self._io.read_u2be()
                if not self.reserved == 0:
                    raise kaitaistruct.ValidationNotEqualError(0, self.reserved, self._io, u"/types/header/types/type_specific_part_type_8/seq/3")
                self._dirty = False


            def _fetch_instances(self):
                pass


            def _write__seq(self, io=None):
                super(CompressedResource.Header.TypeSpecificPartType8, self)._write__seq(io)
                self._io.write_u1(self.working_buffer_fractional_size)
                self._io.write_u1(self.expansion_buffer_size)
                self._io.write_s2be(self.decompressor_id)
                self._io.write_u2be(self.reserved)


            def _check(self):
                if not self.reserved == 0:
                    raise kaitaistruct.ValidationNotEqualError(0, self.reserved, None, u"/types/header/types/type_specific_part_type_8/seq/3")
                self._dirty = False


        class TypeSpecificPartType9(ReadWriteKaitaiStruct):
            """The type-specific part of a compressed resource header with header type `9`.
            """
            def __init__(self, _io=None, _parent=None, _root=None):
                super(CompressedResource.Header.TypeSpecificPartType9, self).__init__(_io)
                self._parent = _parent
                self._root = _root

            def _read(self):
                self.decompressor_id = self._io.read_s2be()
                self._raw_decompressor_specific_parameters_with_io = self._io.read_bytes(4)
                _io__raw_decompressor_specific_parameters_with_io = KaitaiStream(BytesIO(self._raw_decompressor_specific_parameters_with_io))
                self.decompressor_specific_parameters_with_io = bytes_with_io.BytesWithIo(_io__raw_decompressor_specific_parameters_with_io)
                self.decompressor_specific_parameters_with_io._read()
                self._dirty = False


            def _fetch_instances(self):
                pass
                self.decompressor_specific_parameters_with_io._fetch_instances()


            def _write__seq(self, io=None):
                super(CompressedResource.Header.TypeSpecificPartType9, self)._write__seq(io)
                self._io.write_s2be(self.decompressor_id)
                _io__raw_decompressor_specific_parameters_with_io = KaitaiStream(BytesIO(bytearray(4)))
                self._io.add_child_stream(_io__raw_decompressor_specific_parameters_with_io)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (4))
                def handler(parent, _io__raw_decompressor_specific_parameters_with_io=_io__raw_decompressor_specific_parameters_with_io):
                    self._raw_decompressor_specific_parameters_with_io = _io__raw_decompressor_specific_parameters_with_io.to_byte_array()
                    if len(self._raw_decompressor_specific_parameters_with_io) != 4:
                        raise kaitaistruct.ConsistencyError(u"raw(decompressor_specific_parameters_with_io)", 4, len(self._raw_decompressor_specific_parameters_with_io))
                    parent.write_bytes(self._raw_decompressor_specific_parameters_with_io)
                _io__raw_decompressor_specific_parameters_with_io.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.decompressor_specific_parameters_with_io._write__seq(_io__raw_decompressor_specific_parameters_with_io)


            def _check(self):
                self._dirty = False

            @property
            def decompressor_specific_parameters(self):
                """Decompressor-specific parameters.
                The exact structure and meaning of this field is different for each decompressor.
                
                This field always has the same length,
                but decompressors don't always use the entirety of the field,
                so depending on the decompressor some parts of this field may be meaningless.
                """
                if hasattr(self, '_m_decompressor_specific_parameters'):
                    return self._m_decompressor_specific_parameters

                self._m_decompressor_specific_parameters = self.decompressor_specific_parameters_with_io.data
                return getattr(self, '_m_decompressor_specific_parameters', None)

            def _invalidate_decompressor_specific_parameters(self):
                del self._m_decompressor_specific_parameters

        @property
        def type_specific_part(self):
            """The type-specific part of the header,
            parsed according to the type from the common part.
            """
            if self._should_write_type_specific_part:
                self._write_type_specific_part()
            if hasattr(self, '_m_type_specific_part'):
                return self._m_type_specific_part

            if not self.type_specific_part__enabled:
                return None

            io = self.type_specific_part_raw_with_io._io
            _pos = io.pos()
            io.seek(0)
            _on = self.common_part.header_type
            if _on == 8:
                pass
                self._m_type_specific_part = CompressedResource.Header.TypeSpecificPartType8(io, self, self._root)
                self._m_type_specific_part._read()
            elif _on == 9:
                pass
                self._m_type_specific_part = CompressedResource.Header.TypeSpecificPartType9(io, self, self._root)
                self._m_type_specific_part._read()
            io.seek(_pos)
            return getattr(self, '_m_type_specific_part', None)

        @type_specific_part.setter
        def type_specific_part(self, v):
            self._dirty = True
            self._m_type_specific_part = v

        def _write_type_specific_part(self):
            self._should_write_type_specific_part = False
            io = self.type_specific_part_raw_with_io._io
            _pos = io.pos()
            io.seek(0)
            _on = self.common_part.header_type
            if _on == 8:
                pass
                self._m_type_specific_part._write__seq(io)
            elif _on == 9:
                pass
                self._m_type_specific_part._write__seq(io)
            io.seek(_pos)

        @property
        def type_specific_part_raw(self):
            """The type-specific part of the header,
            as a raw byte array.
            """
            if hasattr(self, '_m_type_specific_part_raw'):
                return self._m_type_specific_part_raw

            self._m_type_specific_part_raw = self.type_specific_part_raw_with_io.data
            return getattr(self, '_m_type_specific_part_raw', None)

        def _invalidate_type_specific_part_raw(self):
            del self._m_type_specific_part_raw


