# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'
require_relative 'php_serialized_value'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.11')
  raise "Incompatible Kaitai Struct Ruby API: 0.11 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# A phar (PHP archive) file. The phar format is a custom archive format
# from the PHP ecosystem that is used to package a complete PHP library
# or application into a single self-contained archive.
# All phar archives start with an executable PHP stub, which can be used to
# allow executing or including phar files as if they were regular PHP scripts.
# PHP 5.3 and later include the phar extension, which adds native support for
# reading and manipulating phar files.
# 
# The phar format was originally developed as part of the PEAR library
# PHP_Archive, first released in 2005. Later, a native PHP extension
# named "phar" was developed, which was first released on PECL in 2007,
# and is included with PHP 5.3 and later. The phar extension has effectively
# superseded the PHP_Archive library, which has not been updated since 2010.
# The phar extension is also no longer released independently on PECL;
# it is now developed and released as part of PHP itself.
# 
# Because of current limitations in Kaitai Struct
# (seekaitai-io/kaitai_struct#158 and kaitai-io/kaitai_struct#538),
# the executable PHP stub that precedes the rest of the archive is not handled
# by this spec. Before parsing a phar using this spec, the stub must be
# removed manually.
# 
# A phar's stub is terminated by the special token `__HALT_COMPILER();`
# (which may be followed by at most one space, the PHP tag end `?>`,
# and an optional line terminator). The stub termination sequence is
# immediately followed by the remaining parts of the phar format,
# as described in this spec.
# 
# The phar stub usually contains code that loads the phar and runs
# a contained PHP file, but this is not required. A minimal valid phar stub
# is `<?php __HALT_COMPILER();` - such a stub makes it impossible to execute
# the phar directly, but still allows loading or manipulating it using the
# phar extension.
# 
# Note: The phar format does not specify any encoding for text fields
# (stub, alias name, and all file names), so these fields may contain arbitrary
# binary data. The actual text encoding used in a specific phar file usually
# depends on the application that created the phar, and on the
# standard encoding of the system on which the phar was created.
# @see https://www.php.net/manual/en/phar.fileformat.php Source
# @see https://github.com/php/php-src/tree/master/ext/phar Source
# @see https://svn.php.net/viewvc/pecl/phar/ Source
# @see https://svn.php.net/viewvc/pear/packages/PHP_Archive/ Source
class PharWithoutStub < Kaitai::Struct::Struct

  SIGNATURE_TYPE = {
    1 => :signature_type_md5,
    2 => :signature_type_sha1,
    4 => :signature_type_sha256,
    8 => :signature_type_sha512,
    16 => :signature_type_openssl,
  }
  I__SIGNATURE_TYPE = SIGNATURE_TYPE.invert
  def initialize(_io, _parent = nil, _root = nil)
    super(_io, _parent, _root || self)
    _read
  end

  def _read
    @manifest = Manifest.new(@_io, self, @_root)
    @files = []
    (manifest.num_files).times { |i|
      @files << @_io.read_bytes(manifest.file_entries[i].len_data_compressed)
    }
    if manifest.flags.has_signature
      @_raw_signature = @_io.read_bytes_full
      _io__raw_signature = Kaitai::Struct::Stream.new(@_raw_signature)
      @signature = Signature.new(_io__raw_signature, self, @_root)
    end
    self
  end

  ##
  # A phar API version number. This version number is meant to indicate
  # which features are used in a specific phar, so that tools reading
  # the phar can easily check that they support all necessary features.
  # 
  # The following API versions exist so far:
  # 
  # * 0.5, 0.6, 0.7, 0.7.1: The first official API versions. At this point,
  #   the phar format was only used by the PHP_Archive library, and the
  #   API version numbers were identical to the PHP_Archive versions that
  #   supported them. Development of the native phar extension started around
  #   API version 0.7. These API versions could only be queried using the
  #   `PHP_Archive::APIversion()` method, but were not stored physically
  #   in archives. These API versions are not supported by this spec.
  # * 0.8.0: Used by PHP_Archive 0.8.0 (released 2006-07-18) and
  #   later development versions of the phar extension. This is the first
  #   version number to be physically stored in archives. This API version
  #   is not supported by this spec.
  # * 0.9.0: Used by later development/early beta versions of the
  #   phar extension. Also temporarily used by PHP_Archive 0.9.0
  #   (released 2006-12-15), but reverted back to API version 0.8.0 in
  #   PHP_Archive 0.9.1 (released 2007-01-05).
  # * 1.0.0: Supported since PHP_Archive 0.10.0 (released 2007-05-29)
  #   and phar extension 1.0.0 (released 2007-03-28). This is the first
  #   stable, forwards-compatible and documented version of the format.
  # * 1.1.0: Supported since PHP_Archive 0.12.0 (released 2015-07-06)
  #   and phar extension 1.1.0 (released 2007-04-12). Adds SHA-256 and
  #   SHA-512 signature types.
  # * 1.1.1: Supported since phar extension 2.0.0 (released 2009-07-29 and
  #   included with PHP 5.3 and later). (PHP_Archive 0.12.0 also supports
  #   all features from API verison 1.1.1, but it reports API version 1.1.0.)
  #   Adds the OpenSSL signature type and support for storing
  #   empty directories.
  class ApiVersion < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @release = @_io.read_bits_int_be(4)
      @major = @_io.read_bits_int_be(4)
      @minor = @_io.read_bits_int_be(4)
      @unused = @_io.read_bits_int_be(4)
      self
    end
    attr_reader :release
    attr_reader :major
    attr_reader :minor
    attr_reader :unused
  end
  class FileEntry < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @len_filename = @_io.read_u4le
      @filename = @_io.read_bytes(len_filename)
      @len_data_uncompressed = @_io.read_u4le
      @timestamp = @_io.read_u4le
      @len_data_compressed = @_io.read_u4le
      @crc32 = @_io.read_u4le
      @flags = FileFlags.new(@_io, self, @_root)
      @len_metadata = @_io.read_u4le
      if len_metadata != 0
        _io_metadata = @_io.substream(len_metadata)
        @metadata = SerializedValue.new(_io_metadata, self, @_root)
      end
      self
    end

    ##
    # The length of the file name, in bytes.
    attr_reader :len_filename

    ##
    # The name of this file. If the name ends with a slash, this entry
    # represents a directory, otherwise a regular file. Directory entries
    # are supported since phar API version 1.1.1.
    # (Explicit directory entries are only needed for empty directories.
    # Non-empty directories are implied by the files located inside them.)
    attr_reader :filename

    ##
    # The length of the file's data when uncompressed, in bytes.
    attr_reader :len_data_uncompressed

    ##
    # The time at which the file was added or last updated, as a
    # Unix timestamp.
    attr_reader :timestamp

    ##
    # The length of the file's data when compressed, in bytes.
    attr_reader :len_data_compressed

    ##
    # The CRC32 checksum of the file's uncompressed data.
    attr_reader :crc32

    ##
    # Flags for this file.
    attr_reader :flags

    ##
    # The length of the metadata, in bytes, or 0 if there is none.
    attr_reader :len_metadata

    ##
    # Metadata for this file, in the format used by PHP's
    # `serialize` function. The meaning of the serialized data is not
    # specified further, it may be used to store arbitrary custom data
    # about the file.
    attr_reader :metadata
    attr_reader :_raw_metadata
  end
  class FileFlags < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @value = @_io.read_u4le
      self
    end

    ##
    # Whether this file's data is stored using bzip2 compression.
    def bzip2_compressed
      return @bzip2_compressed unless @bzip2_compressed.nil?
      @bzip2_compressed = value & 8192 != 0
      @bzip2_compressed
    end

    ##
    # The file's permission bits.
    def permissions
      return @permissions unless @permissions.nil?
      @permissions = value & 511
      @permissions
    end

    ##
    # Whether this file's data is stored using zlib compression.
    def zlib_compressed
      return @zlib_compressed unless @zlib_compressed.nil?
      @zlib_compressed = value & 4096 != 0
      @zlib_compressed
    end

    ##
    # The unparsed flag bits.
    attr_reader :value
  end
  class GlobalFlags < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @value = @_io.read_u4le
      self
    end

    ##
    # Whether any of the files in this phar are stored using
    # bzip2 compression.
    def any_bzip2_compressed
      return @any_bzip2_compressed unless @any_bzip2_compressed.nil?
      @any_bzip2_compressed = value & 8192 != 0
      @any_bzip2_compressed
    end

    ##
    # Whether any of the files in this phar are stored using
    # zlib compression.
    def any_zlib_compressed
      return @any_zlib_compressed unless @any_zlib_compressed.nil?
      @any_zlib_compressed = value & 4096 != 0
      @any_zlib_compressed
    end

    ##
    # Whether this phar contains a signature.
    def has_signature
      return @has_signature unless @has_signature.nil?
      @has_signature = value & 65536 != 0
      @has_signature
    end

    ##
    # The unparsed flag bits.
    attr_reader :value
  end
  class Manifest < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @len_manifest = @_io.read_u4le
      @num_files = @_io.read_u4le
      @api_version = ApiVersion.new(@_io, self, @_root)
      @flags = GlobalFlags.new(@_io, self, @_root)
      @len_alias = @_io.read_u4le
      @alias = @_io.read_bytes(len_alias)
      @len_metadata = @_io.read_u4le
      if len_metadata != 0
        _io_metadata = @_io.substream(len_metadata)
        @metadata = SerializedValue.new(_io_metadata, self, @_root)
      end
      @file_entries = []
      (num_files).times { |i|
        @file_entries << FileEntry.new(@_io, self, @_root)
      }
      self
    end

    ##
    # The length of the manifest, in bytes.
    # 
    # Note: The phar extension does not allow reading manifests
    # larger than 100 MiB.
    attr_reader :len_manifest

    ##
    # The number of files in this phar.
    attr_reader :num_files

    ##
    # The API version used by this phar manifest.
    attr_reader :api_version

    ##
    # Global flags for this phar.
    attr_reader :flags

    ##
    # The length of the alias, in bytes.
    attr_reader :len_alias

    ##
    # The phar's alias, i. e. the name under which it is loaded into PHP.
    attr_reader :alias

    ##
    # The size of the metadata, in bytes, or 0 if there is none.
    attr_reader :len_metadata

    ##
    # Metadata for this phar, in the format used by PHP's
    # `serialize` function. The meaning of the serialized data is not
    # specified further, it may be used to store arbitrary custom data
    # about the archive.
    attr_reader :metadata

    ##
    # Manifest entries for the files contained in this phar.
    attr_reader :file_entries
    attr_reader :_raw_metadata
  end
  class SerializedValue < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @raw = @_io.read_bytes_full
      self
    end

    ##
    # The serialized value, parsed as a structure.
    def parsed
      return @parsed unless @parsed.nil?
      _pos = @_io.pos
      @_io.seek(0)
      @parsed = PhpSerializedValue.new(@_io)
      @_io.seek(_pos)
      @parsed
    end

    ##
    # The serialized value, as a raw byte array.
    attr_reader :raw
  end
  class Signature < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @data = @_io.read_bytes((_io.size - _io.pos) - 8)
      @type = Kaitai::Struct::Stream::resolve_enum(PharWithoutStub::SIGNATURE_TYPE, @_io.read_u4le)
      @magic = @_io.read_bytes(4)
      raise Kaitai::Struct::ValidationNotEqualError.new([71, 66, 77, 66].pack('C*'), @magic, @_io, "/types/signature/seq/2") if not @magic == [71, 66, 77, 66].pack('C*')
      self
    end

    ##
    # The signature data. The size and contents depend on the
    # signature type.
    attr_reader :data

    ##
    # The signature type.
    attr_reader :type
    attr_reader :magic
  end

  ##
  # The archive's manifest, containing general metadata about the archive
  # and its files.
  attr_reader :manifest

  ##
  # The contents of each file in the archive (possibly compressed,
  # as indicated by the file's flags in the manifest). The files are stored
  # in the same order as they appear in the manifest.
  attr_reader :files

  ##
  # The archive's signature - a digest of all archive data before
  # the signature itself.
  # 
  # Note: Almost all of the available "signature" types are actually hashes,
  # not signatures, and cannot be used to verify that the archive has not
  # been tampered with. Only the OpenSSL signature type is a true
  # cryptographic signature.
  attr_reader :signature
  attr_reader :_raw_signature
end
