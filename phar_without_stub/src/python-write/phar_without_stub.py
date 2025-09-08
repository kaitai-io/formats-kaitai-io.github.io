# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import ReadWriteKaitaiStruct, KaitaiStream, BytesIO
import php_serialized_value
from enum import IntEnum


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class PharWithoutStub(ReadWriteKaitaiStruct):
    """A phar (PHP archive) file. The phar format is a custom archive format
    from the PHP ecosystem that is used to package a complete PHP library
    or application into a single self-contained archive.
    All phar archives start with an executable PHP stub, which can be used to
    allow executing or including phar files as if they were regular PHP scripts.
    PHP 5.3 and later include the phar extension, which adds native support for
    reading and manipulating phar files.
    
    The phar format was originally developed as part of the PEAR library
    PHP_Archive, first released in 2005. Later, a native PHP extension
    named "phar" was developed, which was first released on PECL in 2007,
    and is included with PHP 5.3 and later. The phar extension has effectively
    superseded the PHP_Archive library, which has not been updated since 2010.
    The phar extension is also no longer released independently on PECL;
    it is now developed and released as part of PHP itself.
    
    Because of current limitations in Kaitai Struct
    (seekaitai-io/kaitai_struct#158 and kaitai-io/kaitai_struct#538),
    the executable PHP stub that precedes the rest of the archive is not handled
    by this spec. Before parsing a phar using this spec, the stub must be
    removed manually.
    
    A phar's stub is terminated by the special token `__HALT_COMPILER();`
    (which may be followed by at most one space, the PHP tag end `?>`,
    and an optional line terminator). The stub termination sequence is
    immediately followed by the remaining parts of the phar format,
    as described in this spec.
    
    The phar stub usually contains code that loads the phar and runs
    a contained PHP file, but this is not required. A minimal valid phar stub
    is `<?php __HALT_COMPILER();` - such a stub makes it impossible to execute
    the phar directly, but still allows loading or manipulating it using the
    phar extension.
    
    Note: The phar format does not specify any encoding for text fields
    (stub, alias name, and all file names), so these fields may contain arbitrary
    binary data. The actual text encoding used in a specific phar file usually
    depends on the application that created the phar, and on the
    standard encoding of the system on which the phar was created.
    
    .. seealso::
       Source - https://www.php.net/manual/en/phar.fileformat.php
    
    
    .. seealso::
       Source - https://github.com/php/php-src/tree/master/ext/phar
    
    
    .. seealso::
       Source - https://svn.php.net/viewvc/pecl/phar/
    
    
    .. seealso::
       Source - https://svn.php.net/viewvc/pear/packages/PHP_Archive/
    """

    class SignatureType(IntEnum):
        md5 = 1
        sha1 = 2
        sha256 = 4
        sha512 = 8
        openssl = 16
    def __init__(self, _io=None, _parent=None, _root=None):
        super(PharWithoutStub, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self

    def _read(self):
        self.manifest = PharWithoutStub.Manifest(self._io, self, self._root)
        self.manifest._read()
        self.files = []
        for i in range(self.manifest.num_files):
            self.files.append(self._io.read_bytes(self.manifest.file_entries[i].len_data_compressed))

        if self.manifest.flags.has_signature:
            pass
            self._raw_signature = self._io.read_bytes_full()
            _io__raw_signature = KaitaiStream(BytesIO(self._raw_signature))
            self.signature = PharWithoutStub.Signature(_io__raw_signature, self, self._root)
            self.signature._read()

        self._dirty = False


    def _fetch_instances(self):
        pass
        self.manifest._fetch_instances()
        for i in range(len(self.files)):
            pass

        if self.manifest.flags.has_signature:
            pass
            self.signature._fetch_instances()



    def _write__seq(self, io=None):
        super(PharWithoutStub, self)._write__seq(io)
        self.manifest._write__seq(self._io)
        for i in range(len(self.files)):
            pass
            self._io.write_bytes(self.files[i])

        if self.manifest.flags.has_signature:
            pass
            _io__raw_signature = KaitaiStream(BytesIO(bytearray(self._io.size() - self._io.pos())))
            self._io.add_child_stream(_io__raw_signature)
            _pos2 = self._io.pos()
            self._io.seek(self._io.pos() + (self._io.size() - self._io.pos()))
            def handler(parent, _io__raw_signature=_io__raw_signature):
                self._raw_signature = _io__raw_signature.to_byte_array()
                parent.write_bytes(self._raw_signature)
                if not parent.is_eof():
                    raise kaitaistruct.ConsistencyError(u"raw(signature)", 0, parent.size() - parent.pos())
            _io__raw_signature.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
            self.signature._write__seq(_io__raw_signature)



    def _check(self):
        if self.manifest._root != self._root:
            raise kaitaistruct.ConsistencyError(u"manifest", self._root, self.manifest._root)
        if self.manifest._parent != self:
            raise kaitaistruct.ConsistencyError(u"manifest", self, self.manifest._parent)
        if len(self.files) != self.manifest.num_files:
            raise kaitaistruct.ConsistencyError(u"files", self.manifest.num_files, len(self.files))
        for i in range(len(self.files)):
            pass
            if len(self.files[i]) != self.manifest.file_entries[i].len_data_compressed:
                raise kaitaistruct.ConsistencyError(u"files", self.manifest.file_entries[i].len_data_compressed, len(self.files[i]))

        if self.manifest.flags.has_signature:
            pass
            if self.signature._root != self._root:
                raise kaitaistruct.ConsistencyError(u"signature", self._root, self.signature._root)
            if self.signature._parent != self:
                raise kaitaistruct.ConsistencyError(u"signature", self, self.signature._parent)

        self._dirty = False

    class ApiVersion(ReadWriteKaitaiStruct):
        """A phar API version number. This version number is meant to indicate
        which features are used in a specific phar, so that tools reading
        the phar can easily check that they support all necessary features.
        
        The following API versions exist so far:
        
        * 0.5, 0.6, 0.7, 0.7.1: The first official API versions. At this point,
          the phar format was only used by the PHP_Archive library, and the
          API version numbers were identical to the PHP_Archive versions that
          supported them. Development of the native phar extension started around
          API version 0.7. These API versions could only be queried using the
          `PHP_Archive::APIversion()` method, but were not stored physically
          in archives. These API versions are not supported by this spec.
        * 0.8.0: Used by PHP_Archive 0.8.0 (released 2006-07-18) and
          later development versions of the phar extension. This is the first
          version number to be physically stored in archives. This API version
          is not supported by this spec.
        * 0.9.0: Used by later development/early beta versions of the
          phar extension. Also temporarily used by PHP_Archive 0.9.0
          (released 2006-12-15), but reverted back to API version 0.8.0 in
          PHP_Archive 0.9.1 (released 2007-01-05).
        * 1.0.0: Supported since PHP_Archive 0.10.0 (released 2007-05-29)
          and phar extension 1.0.0 (released 2007-03-28). This is the first
          stable, forwards-compatible and documented version of the format.
        * 1.1.0: Supported since PHP_Archive 0.12.0 (released 2015-07-06)
          and phar extension 1.1.0 (released 2007-04-12). Adds SHA-256 and
          SHA-512 signature types.
        * 1.1.1: Supported since phar extension 2.0.0 (released 2009-07-29 and
          included with PHP 5.3 and later). (PHP_Archive 0.12.0 also supports
          all features from API verison 1.1.1, but it reports API version 1.1.0.)
          Adds the OpenSSL signature type and support for storing
          empty directories.
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(PharWithoutStub.ApiVersion, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.release = self._io.read_bits_int_be(4)
            self.major = self._io.read_bits_int_be(4)
            self.minor = self._io.read_bits_int_be(4)
            self.unused = self._io.read_bits_int_be(4)
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(PharWithoutStub.ApiVersion, self)._write__seq(io)
            self._io.write_bits_int_be(4, self.release)
            self._io.write_bits_int_be(4, self.major)
            self._io.write_bits_int_be(4, self.minor)
            self._io.write_bits_int_be(4, self.unused)


        def _check(self):
            self._dirty = False


    class FileEntry(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(PharWithoutStub.FileEntry, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.len_filename = self._io.read_u4le()
            self.filename = self._io.read_bytes(self.len_filename)
            self.len_data_uncompressed = self._io.read_u4le()
            self.timestamp = self._io.read_u4le()
            self.len_data_compressed = self._io.read_u4le()
            self.crc32 = self._io.read_u4le()
            self.flags = PharWithoutStub.FileFlags(self._io, self, self._root)
            self.flags._read()
            self.len_metadata = self._io.read_u4le()
            if self.len_metadata != 0:
                pass
                self._raw_metadata = self._io.read_bytes(self.len_metadata)
                _io__raw_metadata = KaitaiStream(BytesIO(self._raw_metadata))
                self.metadata = PharWithoutStub.SerializedValue(_io__raw_metadata, self, self._root)
                self.metadata._read()

            self._dirty = False


        def _fetch_instances(self):
            pass
            self.flags._fetch_instances()
            if self.len_metadata != 0:
                pass
                self.metadata._fetch_instances()



        def _write__seq(self, io=None):
            super(PharWithoutStub.FileEntry, self)._write__seq(io)
            self._io.write_u4le(self.len_filename)
            self._io.write_bytes(self.filename)
            self._io.write_u4le(self.len_data_uncompressed)
            self._io.write_u4le(self.timestamp)
            self._io.write_u4le(self.len_data_compressed)
            self._io.write_u4le(self.crc32)
            self.flags._write__seq(self._io)
            self._io.write_u4le(self.len_metadata)
            if self.len_metadata != 0:
                pass
                _io__raw_metadata = KaitaiStream(BytesIO(bytearray(self.len_metadata)))
                self._io.add_child_stream(_io__raw_metadata)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.len_metadata))
                def handler(parent, _io__raw_metadata=_io__raw_metadata):
                    self._raw_metadata = _io__raw_metadata.to_byte_array()
                    if len(self._raw_metadata) != self.len_metadata:
                        raise kaitaistruct.ConsistencyError(u"raw(metadata)", self.len_metadata, len(self._raw_metadata))
                    parent.write_bytes(self._raw_metadata)
                _io__raw_metadata.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.metadata._write__seq(_io__raw_metadata)



        def _check(self):
            if len(self.filename) != self.len_filename:
                raise kaitaistruct.ConsistencyError(u"filename", self.len_filename, len(self.filename))
            if self.flags._root != self._root:
                raise kaitaistruct.ConsistencyError(u"flags", self._root, self.flags._root)
            if self.flags._parent != self:
                raise kaitaistruct.ConsistencyError(u"flags", self, self.flags._parent)
            if self.len_metadata != 0:
                pass
                if self.metadata._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"metadata", self._root, self.metadata._root)
                if self.metadata._parent != self:
                    raise kaitaistruct.ConsistencyError(u"metadata", self, self.metadata._parent)

            self._dirty = False


    class FileFlags(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(PharWithoutStub.FileFlags, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.value = self._io.read_u4le()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(PharWithoutStub.FileFlags, self)._write__seq(io)
            self._io.write_u4le(self.value)


        def _check(self):
            self._dirty = False

        @property
        def bzip2_compressed(self):
            """Whether this file's data is stored using bzip2 compression."""
            if hasattr(self, '_m_bzip2_compressed'):
                return self._m_bzip2_compressed

            self._m_bzip2_compressed = self.value & 8192 != 0
            return getattr(self, '_m_bzip2_compressed', None)

        def _invalidate_bzip2_compressed(self):
            del self._m_bzip2_compressed
        @property
        def permissions(self):
            """The file's permission bits."""
            if hasattr(self, '_m_permissions'):
                return self._m_permissions

            self._m_permissions = self.value & 511
            return getattr(self, '_m_permissions', None)

        def _invalidate_permissions(self):
            del self._m_permissions
        @property
        def zlib_compressed(self):
            """Whether this file's data is stored using zlib compression."""
            if hasattr(self, '_m_zlib_compressed'):
                return self._m_zlib_compressed

            self._m_zlib_compressed = self.value & 4096 != 0
            return getattr(self, '_m_zlib_compressed', None)

        def _invalidate_zlib_compressed(self):
            del self._m_zlib_compressed

    class GlobalFlags(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(PharWithoutStub.GlobalFlags, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.value = self._io.read_u4le()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(PharWithoutStub.GlobalFlags, self)._write__seq(io)
            self._io.write_u4le(self.value)


        def _check(self):
            self._dirty = False

        @property
        def any_bzip2_compressed(self):
            """Whether any of the files in this phar are stored using
            bzip2 compression.
            """
            if hasattr(self, '_m_any_bzip2_compressed'):
                return self._m_any_bzip2_compressed

            self._m_any_bzip2_compressed = self.value & 8192 != 0
            return getattr(self, '_m_any_bzip2_compressed', None)

        def _invalidate_any_bzip2_compressed(self):
            del self._m_any_bzip2_compressed
        @property
        def any_zlib_compressed(self):
            """Whether any of the files in this phar are stored using
            zlib compression.
            """
            if hasattr(self, '_m_any_zlib_compressed'):
                return self._m_any_zlib_compressed

            self._m_any_zlib_compressed = self.value & 4096 != 0
            return getattr(self, '_m_any_zlib_compressed', None)

        def _invalidate_any_zlib_compressed(self):
            del self._m_any_zlib_compressed
        @property
        def has_signature(self):
            """Whether this phar contains a signature."""
            if hasattr(self, '_m_has_signature'):
                return self._m_has_signature

            self._m_has_signature = self.value & 65536 != 0
            return getattr(self, '_m_has_signature', None)

        def _invalidate_has_signature(self):
            del self._m_has_signature

    class Manifest(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(PharWithoutStub.Manifest, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.len_manifest = self._io.read_u4le()
            self.num_files = self._io.read_u4le()
            self.api_version = PharWithoutStub.ApiVersion(self._io, self, self._root)
            self.api_version._read()
            self.flags = PharWithoutStub.GlobalFlags(self._io, self, self._root)
            self.flags._read()
            self.len_alias = self._io.read_u4le()
            self.alias = self._io.read_bytes(self.len_alias)
            self.len_metadata = self._io.read_u4le()
            if self.len_metadata != 0:
                pass
                self._raw_metadata = self._io.read_bytes(self.len_metadata)
                _io__raw_metadata = KaitaiStream(BytesIO(self._raw_metadata))
                self.metadata = PharWithoutStub.SerializedValue(_io__raw_metadata, self, self._root)
                self.metadata._read()

            self.file_entries = []
            for i in range(self.num_files):
                _t_file_entries = PharWithoutStub.FileEntry(self._io, self, self._root)
                try:
                    _t_file_entries._read()
                finally:
                    self.file_entries.append(_t_file_entries)

            self._dirty = False


        def _fetch_instances(self):
            pass
            self.api_version._fetch_instances()
            self.flags._fetch_instances()
            if self.len_metadata != 0:
                pass
                self.metadata._fetch_instances()

            for i in range(len(self.file_entries)):
                pass
                self.file_entries[i]._fetch_instances()



        def _write__seq(self, io=None):
            super(PharWithoutStub.Manifest, self)._write__seq(io)
            self._io.write_u4le(self.len_manifest)
            self._io.write_u4le(self.num_files)
            self.api_version._write__seq(self._io)
            self.flags._write__seq(self._io)
            self._io.write_u4le(self.len_alias)
            self._io.write_bytes(self.alias)
            self._io.write_u4le(self.len_metadata)
            if self.len_metadata != 0:
                pass
                _io__raw_metadata = KaitaiStream(BytesIO(bytearray(self.len_metadata)))
                self._io.add_child_stream(_io__raw_metadata)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.len_metadata))
                def handler(parent, _io__raw_metadata=_io__raw_metadata):
                    self._raw_metadata = _io__raw_metadata.to_byte_array()
                    if len(self._raw_metadata) != self.len_metadata:
                        raise kaitaistruct.ConsistencyError(u"raw(metadata)", self.len_metadata, len(self._raw_metadata))
                    parent.write_bytes(self._raw_metadata)
                _io__raw_metadata.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.metadata._write__seq(_io__raw_metadata)

            for i in range(len(self.file_entries)):
                pass
                self.file_entries[i]._write__seq(self._io)



        def _check(self):
            if self.api_version._root != self._root:
                raise kaitaistruct.ConsistencyError(u"api_version", self._root, self.api_version._root)
            if self.api_version._parent != self:
                raise kaitaistruct.ConsistencyError(u"api_version", self, self.api_version._parent)
            if self.flags._root != self._root:
                raise kaitaistruct.ConsistencyError(u"flags", self._root, self.flags._root)
            if self.flags._parent != self:
                raise kaitaistruct.ConsistencyError(u"flags", self, self.flags._parent)
            if len(self.alias) != self.len_alias:
                raise kaitaistruct.ConsistencyError(u"alias", self.len_alias, len(self.alias))
            if self.len_metadata != 0:
                pass
                if self.metadata._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"metadata", self._root, self.metadata._root)
                if self.metadata._parent != self:
                    raise kaitaistruct.ConsistencyError(u"metadata", self, self.metadata._parent)

            if len(self.file_entries) != self.num_files:
                raise kaitaistruct.ConsistencyError(u"file_entries", self.num_files, len(self.file_entries))
            for i in range(len(self.file_entries)):
                pass
                if self.file_entries[i]._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"file_entries", self._root, self.file_entries[i]._root)
                if self.file_entries[i]._parent != self:
                    raise kaitaistruct.ConsistencyError(u"file_entries", self, self.file_entries[i]._parent)

            self._dirty = False


    class SerializedValue(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(PharWithoutStub.SerializedValue, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._should_write_parsed = False
            self.parsed__enabled = True

        def _read(self):
            self.raw = self._io.read_bytes_full()
            self._dirty = False


        def _fetch_instances(self):
            pass
            _ = self.parsed
            if hasattr(self, '_m_parsed'):
                pass
                self._m_parsed._fetch_instances()



        def _write__seq(self, io=None):
            super(PharWithoutStub.SerializedValue, self)._write__seq(io)
            self._should_write_parsed = self.parsed__enabled
            self._io.write_bytes(self.raw)
            if not self._io.is_eof():
                raise kaitaistruct.ConsistencyError(u"raw", 0, self._io.size() - self._io.pos())


        def _check(self):
            if self.parsed__enabled:
                pass

            self._dirty = False

        @property
        def parsed(self):
            """The serialized value, parsed as a structure."""
            if self._should_write_parsed:
                self._write_parsed()
            if hasattr(self, '_m_parsed'):
                return self._m_parsed

            if not self.parsed__enabled:
                return None

            _pos = self._io.pos()
            self._io.seek(0)
            self._m_parsed = php_serialized_value.PhpSerializedValue(self._io)
            self._m_parsed._read()
            self._io.seek(_pos)
            return getattr(self, '_m_parsed', None)

        @parsed.setter
        def parsed(self, v):
            self._dirty = True
            self._m_parsed = v

        def _write_parsed(self):
            self._should_write_parsed = False
            _pos = self._io.pos()
            self._io.seek(0)
            self._m_parsed._write__seq(self._io)
            self._io.seek(_pos)


    class Signature(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(PharWithoutStub.Signature, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.data = self._io.read_bytes((self._io.size() - self._io.pos()) - 8)
            self.type = KaitaiStream.resolve_enum(PharWithoutStub.SignatureType, self._io.read_u4le())
            self.magic = self._io.read_bytes(4)
            if not self.magic == b"\x47\x42\x4D\x42":
                raise kaitaistruct.ValidationNotEqualError(b"\x47\x42\x4D\x42", self.magic, self._io, u"/types/signature/seq/2")
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(PharWithoutStub.Signature, self)._write__seq(io)
            if len(self.data) != (self._io.size() - self._io.pos()) - 8:
                raise kaitaistruct.ConsistencyError(u"data", (self._io.size() - self._io.pos()) - 8, len(self.data))
            self._io.write_bytes(self.data)
            self._io.write_u4le(int(self.type))
            self._io.write_bytes(self.magic)


        def _check(self):
            if len(self.magic) != 4:
                raise kaitaistruct.ConsistencyError(u"magic", 4, len(self.magic))
            if not self.magic == b"\x47\x42\x4D\x42":
                raise kaitaistruct.ValidationNotEqualError(b"\x47\x42\x4D\x42", self.magic, None, u"/types/signature/seq/2")
            self._dirty = False



