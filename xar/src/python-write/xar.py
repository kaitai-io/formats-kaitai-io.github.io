# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import ReadWriteKaitaiStruct, KaitaiStream, BytesIO
from enum import IntEnum
import zlib


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class Xar(ReadWriteKaitaiStruct):
    """From [Wikipedia](https://en.wikipedia.org/wiki/Xar_(archiver)):
    
    "XAR (short for eXtensible ARchive format) is an open source file archiver
    and the archiver's file format. It was created within the OpenDarwin project
    and is used in macOS X 10.5 and up for software installation routines, as
    well as browser extensions in Safari 5.0 and up."
    
    .. seealso::
       Source - https://github.com/mackyle/xar/wiki/xarformat
    """

    class ChecksumAlgorithmsApple(IntEnum):
        none = 0
        sha1 = 1
        md5 = 2
        sha256 = 3
        sha512 = 4
    def __init__(self, _io=None, _parent=None, _root=None):
        super(Xar, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self

    def _read(self):
        self.header_prefix = Xar.FileHeaderPrefix(self._io, self, self._root)
        self.header_prefix._read()
        self._raw_header = self._io.read_bytes(self.header_prefix.len_header - 6)
        _io__raw_header = KaitaiStream(BytesIO(self._raw_header))
        self.header = Xar.FileHeader(_io__raw_header, self, self._root)
        self.header._read()
        self._raw__raw_toc = self._io.read_bytes(self.header.len_toc_compressed)
        self._raw_toc = zlib.decompress(self._raw__raw_toc)
        self.toc__inner_size = len(self._raw_toc)
        _io__raw_toc = KaitaiStream(BytesIO(self._raw_toc))
        self.toc = Xar.TocType(_io__raw_toc, self, self._root)
        self.toc._read()
        self._dirty = False


    def _fetch_instances(self):
        pass
        self.header_prefix._fetch_instances()
        self.header._fetch_instances()
        self.toc._fetch_instances()


    def _write__seq(self, io=None):
        super(Xar, self)._write__seq(io)
        self.header_prefix._write__seq(self._io)
        _io__raw_header = KaitaiStream(BytesIO(bytearray(self.header_prefix.len_header - 6)))
        self._io.add_child_stream(_io__raw_header)
        _pos2 = self._io.pos()
        self._io.seek(self._io.pos() + (self.header_prefix.len_header - 6))
        def handler(parent, _io__raw_header=_io__raw_header):
            self._raw_header = _io__raw_header.to_byte_array()
            if len(self._raw_header) != self.header_prefix.len_header - 6:
                raise kaitaistruct.ConsistencyError(u"raw(header)", self.header_prefix.len_header - 6, len(self._raw_header))
            parent.write_bytes(self._raw_header)
        _io__raw_header.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
        self.header._write__seq(_io__raw_header)
        _io__raw_toc = KaitaiStream(BytesIO(bytearray(self.toc__inner_size)))
        self._io.add_child_stream(_io__raw_toc)
        _pos2 = self._io.pos()
        self._io.seek(self._io.pos() + (self.header.len_toc_compressed))
        def handler(parent, _io__raw_toc=_io__raw_toc):
            self._raw_toc = _io__raw_toc.to_byte_array()
            self._raw__raw_toc = zlib.compress(self._raw_toc)
            if len(self._raw__raw_toc) != self.header.len_toc_compressed:
                raise kaitaistruct.ConsistencyError(u"raw(toc)", self.header.len_toc_compressed, len(self._raw__raw_toc))
            parent.write_bytes(self._raw__raw_toc)
        _io__raw_toc.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
        self.toc._write__seq(_io__raw_toc)


    def _check(self):
        if self.header_prefix._root != self._root:
            raise kaitaistruct.ConsistencyError(u"header_prefix", self._root, self.header_prefix._root)
        if self.header_prefix._parent != self:
            raise kaitaistruct.ConsistencyError(u"header_prefix", self, self.header_prefix._parent)
        if self.header._root != self._root:
            raise kaitaistruct.ConsistencyError(u"header", self._root, self.header._root)
        if self.header._parent != self:
            raise kaitaistruct.ConsistencyError(u"header", self, self.header._parent)
        if self.toc._root != self._root:
            raise kaitaistruct.ConsistencyError(u"toc", self._root, self.toc._root)
        if self.toc._parent != self:
            raise kaitaistruct.ConsistencyError(u"toc", self, self.toc._parent)
        self._dirty = False

    class FileHeader(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Xar.FileHeader, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.version = self._io.read_u2be()
            if not self.version == 1:
                raise kaitaistruct.ValidationNotEqualError(1, self.version, self._io, u"/types/file_header/seq/0")
            self.len_toc_compressed = self._io.read_u8be()
            self.toc_length_uncompressed = self._io.read_u8be()
            self.checksum_algorithm_int = self._io.read_u4be()
            if self.has_checksum_alg_name:
                pass
                self.checksum_alg_name = (KaitaiStream.bytes_terminate(self._io.read_bytes_full(), 0, False)).decode(u"UTF-8")
                _ = self.checksum_alg_name
                if not  ((_ != u"") and (_ != u"none")) :
                    raise kaitaistruct.ValidationExprError(self.checksum_alg_name, self._io, u"/types/file_header/seq/4")

            self._dirty = False


        def _fetch_instances(self):
            pass
            if self.has_checksum_alg_name:
                pass



        def _write__seq(self, io=None):
            super(Xar.FileHeader, self)._write__seq(io)
            self._io.write_u2be(self.version)
            self._io.write_u8be(self.len_toc_compressed)
            self._io.write_u8be(self.toc_length_uncompressed)
            self._io.write_u4be(self.checksum_algorithm_int)
            if self.has_checksum_alg_name:
                pass
                self._io.write_bytes_limit((self.checksum_alg_name).encode(u"UTF-8"), self._io.size() - self._io.pos(), 0, 0)
                if not self._io.is_eof():
                    raise kaitaistruct.ConsistencyError(u"checksum_alg_name", 0, self._io.size() - self._io.pos())



        def _check(self):
            if not self.version == 1:
                raise kaitaistruct.ValidationNotEqualError(1, self.version, None, u"/types/file_header/seq/0")
            if self.has_checksum_alg_name:
                pass
                _ = self.checksum_alg_name
                if not  ((_ != u"") and (_ != u"none")) :
                    raise kaitaistruct.ValidationExprError(self.checksum_alg_name, None, u"/types/file_header/seq/4")

            self._dirty = False

        @property
        def checksum_algorithm_name(self):
            """If it is not
            
            * `""` (empty string), indicating an unknown integer value (access
              `checksum_algorithm_int` for debugging purposes to find out
              what that value is), or
            * `"none"`, indicating that the TOC checksum is not provided (in that
              case, the `<checksum>` property or its `style` attribute should be
              missing, or the `style` attribute must be set to `"none"`),
            
            it must exactly match the `style` attribute value of the
            `<checksum>` property in the root node `<toc>`. See
            <https://github.com/mackyle/xar/blob/66d451d/xar/lib/archive.c#L345-L371>
            for reference.
            
            The `xar` (eXtensible ARchiver) program [uses OpenSSL's function
            `EVP_get_digestbyname`](
              https://github.com/mackyle/xar/blob/66d451d/xar/lib/archive.c#L328
            ) to verify this value (if it's not `""` or `"none"`, of course).
            So it's reasonable to assume that this can only have one of the values
            that OpenSSL recognizes.
            """
            if hasattr(self, '_m_checksum_algorithm_name'):
                return self._m_checksum_algorithm_name

            self._m_checksum_algorithm_name = (self.checksum_alg_name if self.has_checksum_alg_name else (u"none" if self.checksum_algorithm_int == int(Xar.ChecksumAlgorithmsApple.none) else (u"sha1" if self.checksum_algorithm_int == int(Xar.ChecksumAlgorithmsApple.sha1) else (u"md5" if self.checksum_algorithm_int == int(Xar.ChecksumAlgorithmsApple.md5) else (u"sha256" if self.checksum_algorithm_int == int(Xar.ChecksumAlgorithmsApple.sha256) else (u"sha512" if self.checksum_algorithm_int == int(Xar.ChecksumAlgorithmsApple.sha512) else u""))))))
            return getattr(self, '_m_checksum_algorithm_name', None)

        def _invalidate_checksum_algorithm_name(self):
            del self._m_checksum_algorithm_name
        @property
        def has_checksum_alg_name(self):
            if hasattr(self, '_m_has_checksum_alg_name'):
                return self._m_has_checksum_alg_name

            self._m_has_checksum_alg_name =  ((self.checksum_algorithm_int == self._root.checksum_algorithm_other) and (self.len_header >= 32) and (self.len_header % 4 == 0)) 
            return getattr(self, '_m_has_checksum_alg_name', None)

        def _invalidate_has_checksum_alg_name(self):
            del self._m_has_checksum_alg_name
        @property
        def len_header(self):
            if hasattr(self, '_m_len_header'):
                return self._m_len_header

            self._m_len_header = self._root.header_prefix.len_header
            return getattr(self, '_m_len_header', None)

        def _invalidate_len_header(self):
            del self._m_len_header

    class FileHeaderPrefix(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Xar.FileHeaderPrefix, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.magic = self._io.read_bytes(4)
            if not self.magic == b"\x78\x61\x72\x21":
                raise kaitaistruct.ValidationNotEqualError(b"\x78\x61\x72\x21", self.magic, self._io, u"/types/file_header_prefix/seq/0")
            self.len_header = self._io.read_u2be()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(Xar.FileHeaderPrefix, self)._write__seq(io)
            self._io.write_bytes(self.magic)
            self._io.write_u2be(self.len_header)


        def _check(self):
            if len(self.magic) != 4:
                raise kaitaistruct.ConsistencyError(u"magic", 4, len(self.magic))
            if not self.magic == b"\x78\x61\x72\x21":
                raise kaitaistruct.ValidationNotEqualError(b"\x78\x61\x72\x21", self.magic, None, u"/types/file_header_prefix/seq/0")
            self._dirty = False


    class TocType(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Xar.TocType, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.xml_string = (self._io.read_bytes_full()).decode(u"UTF-8")
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(Xar.TocType, self)._write__seq(io)
            self._io.write_bytes((self.xml_string).encode(u"UTF-8"))
            if not self._io.is_eof():
                raise kaitaistruct.ConsistencyError(u"xml_string", 0, self._io.size() - self._io.pos())


        def _check(self):
            self._dirty = False


    @property
    def checksum_algorithm_other(self):
        """
        .. seealso::
           Source - https://github.com/mackyle/xar/blob/66d451d/xar/include/xar.h.in#L85
        """
        if hasattr(self, '_m_checksum_algorithm_other'):
            return self._m_checksum_algorithm_other

        self._m_checksum_algorithm_other = 3
        return getattr(self, '_m_checksum_algorithm_other', None)

    def _invalidate_checksum_algorithm_other(self):
        del self._m_checksum_algorithm_other

