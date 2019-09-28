# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.7')
  raise "Incompatible Kaitai Struct Ruby API: 0.7 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# @see https://pkware.cachefly.net/webdocs/casestudies/APPNOTE.TXT Source
class Zip < Kaitai::Struct::Struct

  COMPRESSION = {
    0 => :compression_none,
    1 => :compression_shrunk,
    2 => :compression_reduced_1,
    3 => :compression_reduced_2,
    4 => :compression_reduced_3,
    5 => :compression_reduced_4,
    6 => :compression_imploded,
    8 => :compression_deflated,
    9 => :compression_enhanced_deflated,
    10 => :compression_pkware_dcl_imploded,
    12 => :compression_bzip2,
    14 => :compression_lzma,
    18 => :compression_ibm_terse,
    19 => :compression_ibm_lz77_z,
    98 => :compression_ppmd,
  }
  I__COMPRESSION = COMPRESSION.invert

  EXTRA_CODES = {
    1 => :extra_codes_zip64,
    7 => :extra_codes_av_info,
    9 => :extra_codes_os2,
    10 => :extra_codes_ntfs,
    12 => :extra_codes_openvms,
    13 => :extra_codes_pkware_unix,
    14 => :extra_codes_file_stream_and_fork_descriptors,
    15 => :extra_codes_patch_descriptor,
    20 => :extra_codes_pkcs7,
    21 => :extra_codes_x509_cert_id_and_signature_for_file,
    22 => :extra_codes_x509_cert_id_for_central_dir,
    23 => :extra_codes_strong_encryption_header,
    24 => :extra_codes_record_management_controls,
    25 => :extra_codes_pkcs7_enc_recip_cert_list,
    101 => :extra_codes_ibm_s390_uncomp,
    102 => :extra_codes_ibm_s390_comp,
    18064 => :extra_codes_poszip_4690,
    21589 => :extra_codes_extended_timestamp,
    30805 => :extra_codes_infozip_unix,
    30837 => :extra_codes_infozip_unix_var_size,
  }
  I__EXTRA_CODES = EXTRA_CODES.invert
  def initialize(_io, _parent = nil, _root = self)
    super(_io, _parent, _root)
    _read
  end

  def _read
    @sections = []
    i = 0
    while not @_io.eof?
      @sections << PkSection.new(@_io, self, @_root)
      i += 1
    end
    self
  end
  class LocalFile < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @header = LocalFileHeader.new(@_io, self, @_root)
      @body = @_io.read_bytes(header.compressed_size)
      self
    end
    attr_reader :header
    attr_reader :body
  end
  class DataDescriptor < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @crc32 = @_io.read_u4le
      @compressed_size = @_io.read_u4le
      @uncompressed_size = @_io.read_u4le
      self
    end
    attr_reader :crc32
    attr_reader :compressed_size
    attr_reader :uncompressed_size
  end
  class ExtraField < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @code = Kaitai::Struct::Stream::resolve_enum(Zip::EXTRA_CODES, @_io.read_u2le)
      @size = @_io.read_u2le
      case code
      when :extra_codes_ntfs
        @_raw_body = @_io.read_bytes(size)
        _io__raw_body = Kaitai::Struct::Stream.new(@_raw_body)
        @body = Ntfs.new(_io__raw_body, self, @_root)
      when :extra_codes_extended_timestamp
        @_raw_body = @_io.read_bytes(size)
        _io__raw_body = Kaitai::Struct::Stream.new(@_raw_body)
        @body = ExtendedTimestamp.new(_io__raw_body, self, @_root)
      when :extra_codes_infozip_unix_var_size
        @_raw_body = @_io.read_bytes(size)
        _io__raw_body = Kaitai::Struct::Stream.new(@_raw_body)
        @body = InfozipUnixVarSize.new(_io__raw_body, self, @_root)
      else
        @body = @_io.read_bytes(size)
      end
      self
    end

    ##
    # @see https://github.com/LuaDist/zip/blob/master/proginfo/extrafld.txt#L191 Source
    class Ntfs < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = self)
        super(_io, _parent, _root)
        _read
      end

      def _read
        @reserved = @_io.read_u4le
        @attributes = []
        i = 0
        while not @_io.eof?
          @attributes << Attribute.new(@_io, self, @_root)
          i += 1
        end
        self
      end
      class Attribute < Kaitai::Struct::Struct
        def initialize(_io, _parent = nil, _root = self)
          super(_io, _parent, _root)
          _read
        end

        def _read
          @tag = @_io.read_u2le
          @size = @_io.read_u2le
          case tag
          when 1
            @_raw_body = @_io.read_bytes(size)
            _io__raw_body = Kaitai::Struct::Stream.new(@_raw_body)
            @body = Attribute1.new(_io__raw_body, self, @_root)
          else
            @body = @_io.read_bytes(size)
          end
          self
        end
        attr_reader :tag
        attr_reader :size
        attr_reader :body
        attr_reader :_raw_body
      end
      class Attribute1 < Kaitai::Struct::Struct
        def initialize(_io, _parent = nil, _root = self)
          super(_io, _parent, _root)
          _read
        end

        def _read
          @last_mod_time = @_io.read_u8le
          @last_access_time = @_io.read_u8le
          @creation_time = @_io.read_u8le
          self
        end
        attr_reader :last_mod_time
        attr_reader :last_access_time
        attr_reader :creation_time
      end
      attr_reader :reserved
      attr_reader :attributes
    end

    ##
    # @see https://github.com/LuaDist/zip/blob/master/proginfo/extrafld.txt#L817 Source
    class ExtendedTimestamp < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = self)
        super(_io, _parent, _root)
        _read
      end

      def _read
        @flags = @_io.read_u1
        @mod_time = @_io.read_u4le
        if !(_io.eof?)
          @access_time = @_io.read_u4le
        end
        if !(_io.eof?)
          @create_time = @_io.read_u4le
        end
        self
      end
      attr_reader :flags
      attr_reader :mod_time
      attr_reader :access_time
      attr_reader :create_time
    end

    ##
    # @see https://github.com/LuaDist/zip/blob/master/proginfo/extrafld.txt#L1339 Source
    class InfozipUnixVarSize < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = self)
        super(_io, _parent, _root)
        _read
      end

      def _read
        @version = @_io.read_u1
        @uid_size = @_io.read_u1
        @uid = @_io.read_bytes(uid_size)
        @gid_size = @_io.read_u1
        @gid = @_io.read_bytes(gid_size)
        self
      end

      ##
      # Version of this extra field, currently 1
      attr_reader :version

      ##
      # Size of UID field
      attr_reader :uid_size

      ##
      # UID (User ID) for a file
      attr_reader :uid

      ##
      # Size of GID field
      attr_reader :gid_size

      ##
      # GID (Group ID) for a file
      attr_reader :gid
    end
    attr_reader :code
    attr_reader :size
    attr_reader :body
    attr_reader :_raw_body
  end

  ##
  # @see https://pkware.cachefly.net/webdocs/casestudies/APPNOTE.TXT - 4.3.12
  class CentralDirEntry < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @version_made_by = @_io.read_u2le
      @version_needed_to_extract = @_io.read_u2le
      @flags = @_io.read_u2le
      @compression_method = Kaitai::Struct::Stream::resolve_enum(Zip::COMPRESSION, @_io.read_u2le)
      @last_mod_file_time = @_io.read_u2le
      @last_mod_file_date = @_io.read_u2le
      @crc32 = @_io.read_u4le
      @compressed_size = @_io.read_u4le
      @uncompressed_size = @_io.read_u4le
      @file_name_len = @_io.read_u2le
      @extra_len = @_io.read_u2le
      @comment_len = @_io.read_u2le
      @disk_number_start = @_io.read_u2le
      @int_file_attr = @_io.read_u2le
      @ext_file_attr = @_io.read_u4le
      @local_header_offset = @_io.read_s4le
      @file_name = (@_io.read_bytes(file_name_len)).force_encoding("UTF-8")
      @_raw_extra = @_io.read_bytes(extra_len)
      _io__raw_extra = Kaitai::Struct::Stream.new(@_raw_extra)
      @extra = Extras.new(_io__raw_extra, self, @_root)
      @comment = (@_io.read_bytes(comment_len)).force_encoding("UTF-8")
      self
    end
    def local_header
      return @local_header unless @local_header.nil?
      _pos = @_io.pos
      @_io.seek(local_header_offset)
      @local_header = PkSection.new(@_io, self, @_root)
      @_io.seek(_pos)
      @local_header
    end
    attr_reader :version_made_by
    attr_reader :version_needed_to_extract
    attr_reader :flags
    attr_reader :compression_method
    attr_reader :last_mod_file_time
    attr_reader :last_mod_file_date
    attr_reader :crc32
    attr_reader :compressed_size
    attr_reader :uncompressed_size
    attr_reader :file_name_len
    attr_reader :extra_len
    attr_reader :comment_len
    attr_reader :disk_number_start
    attr_reader :int_file_attr
    attr_reader :ext_file_attr
    attr_reader :local_header_offset
    attr_reader :file_name
    attr_reader :extra
    attr_reader :comment
    attr_reader :_raw_extra
  end
  class PkSection < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @magic = @_io.ensure_fixed_contents([80, 75].pack('C*'))
      @section_type = @_io.read_u2le
      case section_type
      when 513
        @body = CentralDirEntry.new(@_io, self, @_root)
      when 1027
        @body = LocalFile.new(@_io, self, @_root)
      when 1541
        @body = EndOfCentralDir.new(@_io, self, @_root)
      when 2055
        @body = DataDescriptor.new(@_io, self, @_root)
      end
      self
    end
    attr_reader :magic
    attr_reader :section_type
    attr_reader :body
  end
  class Extras < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @entries = []
      i = 0
      while not @_io.eof?
        @entries << ExtraField.new(@_io, self, @_root)
        i += 1
      end
      self
    end
    attr_reader :entries
  end
  class LocalFileHeader < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @version = @_io.read_u2le
      @flags = @_io.read_u2le
      @compression_method = Kaitai::Struct::Stream::resolve_enum(Zip::COMPRESSION, @_io.read_u2le)
      @file_mod_time = @_io.read_u2le
      @file_mod_date = @_io.read_u2le
      @crc32 = @_io.read_u4le
      @compressed_size = @_io.read_u4le
      @uncompressed_size = @_io.read_u4le
      @file_name_len = @_io.read_u2le
      @extra_len = @_io.read_u2le
      @file_name = (@_io.read_bytes(file_name_len)).force_encoding("UTF-8")
      @_raw_extra = @_io.read_bytes(extra_len)
      _io__raw_extra = Kaitai::Struct::Stream.new(@_raw_extra)
      @extra = Extras.new(_io__raw_extra, self, @_root)
      self
    end
    attr_reader :version
    attr_reader :flags
    attr_reader :compression_method
    attr_reader :file_mod_time
    attr_reader :file_mod_date
    attr_reader :crc32
    attr_reader :compressed_size
    attr_reader :uncompressed_size
    attr_reader :file_name_len
    attr_reader :extra_len
    attr_reader :file_name
    attr_reader :extra
    attr_reader :_raw_extra
  end
  class EndOfCentralDir < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @disk_of_end_of_central_dir = @_io.read_u2le
      @disk_of_central_dir = @_io.read_u2le
      @qty_central_dir_entries_on_disk = @_io.read_u2le
      @qty_central_dir_entries_total = @_io.read_u2le
      @central_dir_size = @_io.read_u4le
      @central_dir_offset = @_io.read_u4le
      @comment_len = @_io.read_u2le
      @comment = (@_io.read_bytes(comment_len)).force_encoding("UTF-8")
      self
    end
    attr_reader :disk_of_end_of_central_dir
    attr_reader :disk_of_central_dir
    attr_reader :qty_central_dir_entries_on_disk
    attr_reader :qty_central_dir_entries_total
    attr_reader :central_dir_size
    attr_reader :central_dir_offset
    attr_reader :comment_len
    attr_reader :comment
  end
  attr_reader :sections
end
