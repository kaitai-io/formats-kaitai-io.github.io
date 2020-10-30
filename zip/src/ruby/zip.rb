# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.9')
  raise "Incompatible Kaitai Struct Ruby API: 0.9 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# ZIP is a popular archive file format, introduced in 1989 by Phil Katz
# and originally implemented in PKZIP utility by PKWARE.
# 
# Thanks to solid support of it in most desktop environments and
# operating systems, and algorithms / specs availability in public
# domain, it quickly became tool of choice for implementing file
# containers.
# 
# For example, Java .jar files, OpenDocument, Office Open XML, EPUB files
# are actually ZIP archives.
# @see https://pkware.cachefly.net/webdocs/casestudies/APPNOTE.TXT Source
# @see https://users.cs.jmu.edu/buchhofp/forensics/formats/pkzip.html Source
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
      @body = @_io.read_bytes(header.len_body_compressed)
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
      @len_body_compressed = @_io.read_u4le
      @len_body_uncompressed = @_io.read_u4le
      self
    end
    attr_reader :crc32
    attr_reader :len_body_compressed
    attr_reader :len_body_uncompressed
  end
  class ExtraField < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @code = Kaitai::Struct::Stream::resolve_enum(Zip::EXTRA_CODES, @_io.read_u2le)
      @len_body = @_io.read_u2le
      case code
      when :extra_codes_ntfs
        @_raw_body = @_io.read_bytes(len_body)
        _io__raw_body = Kaitai::Struct::Stream.new(@_raw_body)
        @body = Ntfs.new(_io__raw_body, self, @_root)
      when :extra_codes_extended_timestamp
        @_raw_body = @_io.read_bytes(len_body)
        _io__raw_body = Kaitai::Struct::Stream.new(@_raw_body)
        @body = ExtendedTimestamp.new(_io__raw_body, self, @_root)
      when :extra_codes_infozip_unix_var_size
        @_raw_body = @_io.read_bytes(len_body)
        _io__raw_body = Kaitai::Struct::Stream.new(@_raw_body)
        @body = InfozipUnixVarSize.new(_io__raw_body, self, @_root)
      else
        @body = @_io.read_bytes(len_body)
      end
      self
    end

    ##
    # @see https://github.com/LuaDist/zip/blob/b710806/proginfo/extrafld.txt#L191 Source
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
          @len_body = @_io.read_u2le
          case tag
          when 1
            @_raw_body = @_io.read_bytes(len_body)
            _io__raw_body = Kaitai::Struct::Stream.new(@_raw_body)
            @body = Attribute1.new(_io__raw_body, self, @_root)
          else
            @body = @_io.read_bytes(len_body)
          end
          self
        end
        attr_reader :tag
        attr_reader :len_body
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
    # @see https://github.com/LuaDist/zip/blob/b710806/proginfo/extrafld.txt#L817 Source
    class ExtendedTimestamp < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = self)
        super(_io, _parent, _root)
        _read
      end

      def _read
        @_raw_flags = @_io.read_bytes(1)
        _io__raw_flags = Kaitai::Struct::Stream.new(@_raw_flags)
        @flags = InfoFlags.new(_io__raw_flags, self, @_root)
        if flags.has_mod_time
          @mod_time = @_io.read_u4le
        end
        if flags.has_access_time
          @access_time = @_io.read_u4le
        end
        if flags.has_create_time
          @create_time = @_io.read_u4le
        end
        self
      end
      class InfoFlags < Kaitai::Struct::Struct
        def initialize(_io, _parent = nil, _root = self)
          super(_io, _parent, _root)
          _read
        end

        def _read
          @has_mod_time = @_io.read_bits_int_le(1) != 0
          @has_access_time = @_io.read_bits_int_le(1) != 0
          @has_create_time = @_io.read_bits_int_le(1) != 0
          @reserved = @_io.read_bits_int_le(5)
          self
        end
        attr_reader :has_mod_time
        attr_reader :has_access_time
        attr_reader :has_create_time
        attr_reader :reserved
      end
      attr_reader :flags

      ##
      # Unix timestamp
      attr_reader :mod_time

      ##
      # Unix timestamp
      attr_reader :access_time

      ##
      # Unix timestamp
      attr_reader :create_time
      attr_reader :_raw_flags
    end

    ##
    # @see https://github.com/LuaDist/zip/blob/b710806/proginfo/extrafld.txt#L1339 Source
    class InfozipUnixVarSize < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = self)
        super(_io, _parent, _root)
        _read
      end

      def _read
        @version = @_io.read_u1
        @len_uid = @_io.read_u1
        @uid = @_io.read_bytes(len_uid)
        @len_gid = @_io.read_u1
        @gid = @_io.read_bytes(len_gid)
        self
      end

      ##
      # Version of this extra field, currently 1
      attr_reader :version

      ##
      # Size of UID field
      attr_reader :len_uid

      ##
      # UID (User ID) for a file
      attr_reader :uid

      ##
      # Size of GID field
      attr_reader :len_gid

      ##
      # GID (Group ID) for a file
      attr_reader :gid
    end
    attr_reader :code
    attr_reader :len_body
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
      @_raw_file_mod_time = @_io.read_bytes(4)
      _io__raw_file_mod_time = Kaitai::Struct::Stream.new(@_raw_file_mod_time)
      @file_mod_time = DosDatetime.new(_io__raw_file_mod_time)
      @crc32 = @_io.read_u4le
      @len_body_compressed = @_io.read_u4le
      @len_body_uncompressed = @_io.read_u4le
      @len_file_name = @_io.read_u2le
      @len_extra = @_io.read_u2le
      @len_comment = @_io.read_u2le
      @disk_number_start = @_io.read_u2le
      @int_file_attr = @_io.read_u2le
      @ext_file_attr = @_io.read_u4le
      @ofs_local_header = @_io.read_s4le
      @file_name = (@_io.read_bytes(len_file_name)).force_encoding("UTF-8")
      @_raw_extra = @_io.read_bytes(len_extra)
      _io__raw_extra = Kaitai::Struct::Stream.new(@_raw_extra)
      @extra = Extras.new(_io__raw_extra, self, @_root)
      @comment = (@_io.read_bytes(len_comment)).force_encoding("UTF-8")
      self
    end
    def local_header
      return @local_header unless @local_header.nil?
      _pos = @_io.pos
      @_io.seek(ofs_local_header)
      @local_header = PkSection.new(@_io, self, @_root)
      @_io.seek(_pos)
      @local_header
    end
    attr_reader :version_made_by
    attr_reader :version_needed_to_extract
    attr_reader :flags
    attr_reader :compression_method
    attr_reader :file_mod_time
    attr_reader :crc32
    attr_reader :len_body_compressed
    attr_reader :len_body_uncompressed
    attr_reader :len_file_name
    attr_reader :len_extra
    attr_reader :len_comment
    attr_reader :disk_number_start
    attr_reader :int_file_attr
    attr_reader :ext_file_attr
    attr_reader :ofs_local_header
    attr_reader :file_name
    attr_reader :extra
    attr_reader :comment
    attr_reader :_raw_file_mod_time
    attr_reader :_raw_extra
  end
  class PkSection < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @magic = @_io.read_bytes(2)
      raise Kaitai::Struct::ValidationNotEqualError.new([80, 75].pack('C*'), magic, _io, "/types/pk_section/seq/0") if not magic == [80, 75].pack('C*')
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
      @_raw_flags = @_io.read_bytes(2)
      _io__raw_flags = Kaitai::Struct::Stream.new(@_raw_flags)
      @flags = GpFlags.new(_io__raw_flags, self, @_root)
      @compression_method = Kaitai::Struct::Stream::resolve_enum(Zip::COMPRESSION, @_io.read_u2le)
      @_raw_file_mod_time = @_io.read_bytes(4)
      _io__raw_file_mod_time = Kaitai::Struct::Stream.new(@_raw_file_mod_time)
      @file_mod_time = DosDatetime.new(_io__raw_file_mod_time)
      @crc32 = @_io.read_u4le
      @len_body_compressed = @_io.read_u4le
      @len_body_uncompressed = @_io.read_u4le
      @len_file_name = @_io.read_u2le
      @len_extra = @_io.read_u2le
      @file_name = (@_io.read_bytes(len_file_name)).force_encoding("UTF-8")
      @_raw_extra = @_io.read_bytes(len_extra)
      _io__raw_extra = Kaitai::Struct::Stream.new(@_raw_extra)
      @extra = Extras.new(_io__raw_extra, self, @_root)
      self
    end

    ##
    # @see https://pkware.cachefly.net/webdocs/casestudies/APPNOTE.TXT - 4.4.4
    # @see https://users.cs.jmu.edu/buchhofp/forensics/formats/pkzip.html Local file headers
    class GpFlags < Kaitai::Struct::Struct

      DEFLATE_MODE = {
        0 => :deflate_mode_normal,
        1 => :deflate_mode_maximum,
        2 => :deflate_mode_fast,
        3 => :deflate_mode_super_fast,
      }
      I__DEFLATE_MODE = DEFLATE_MODE.invert
      def initialize(_io, _parent = nil, _root = self)
        super(_io, _parent, _root)
        _read
      end

      def _read
        @file_encrypted = @_io.read_bits_int_le(1) != 0
        @comp_options_raw = @_io.read_bits_int_le(2)
        @has_data_descriptor = @_io.read_bits_int_le(1) != 0
        @reserved_1 = @_io.read_bits_int_le(1) != 0
        @comp_patched_data = @_io.read_bits_int_le(1) != 0
        @strong_encrypt = @_io.read_bits_int_le(1) != 0
        @reserved_2 = @_io.read_bits_int_le(4)
        @lang_encoding = @_io.read_bits_int_le(1) != 0
        @reserved_3 = @_io.read_bits_int_le(1) != 0
        @mask_header_values = @_io.read_bits_int_le(1) != 0
        @reserved_4 = @_io.read_bits_int_le(2)
        self
      end
      def deflated_mode
        return @deflated_mode unless @deflated_mode.nil?
        if  ((_parent.compression_method == :compression_deflated) || (_parent.compression_method == :compression_enhanced_deflated)) 
          @deflated_mode = Kaitai::Struct::Stream::resolve_enum(DEFLATE_MODE, comp_options_raw)
        end
        @deflated_mode
      end

      ##
      # 8KiB or 4KiB in bytes
      def imploded_dict_byte_size
        return @imploded_dict_byte_size unless @imploded_dict_byte_size.nil?
        if _parent.compression_method == :compression_imploded
          @imploded_dict_byte_size = (((comp_options_raw & 1) != 0 ? 8 : 4) * 1024)
        end
        @imploded_dict_byte_size
      end
      def imploded_num_sf_trees
        return @imploded_num_sf_trees unless @imploded_num_sf_trees.nil?
        if _parent.compression_method == :compression_imploded
          @imploded_num_sf_trees = ((comp_options_raw & 2) != 0 ? 3 : 2)
        end
        @imploded_num_sf_trees
      end
      def lzma_has_eos_marker
        return @lzma_has_eos_marker unless @lzma_has_eos_marker.nil?
        if _parent.compression_method == :compression_lzma
          @lzma_has_eos_marker = (comp_options_raw & 1) != 0
        end
        @lzma_has_eos_marker
      end
      attr_reader :file_encrypted

      ##
      # internal; access derived value instances instead
      attr_reader :comp_options_raw
      attr_reader :has_data_descriptor
      attr_reader :reserved_1
      attr_reader :comp_patched_data
      attr_reader :strong_encrypt
      attr_reader :reserved_2
      attr_reader :lang_encoding
      attr_reader :reserved_3
      attr_reader :mask_header_values
      attr_reader :reserved_4
    end
    attr_reader :version
    attr_reader :flags
    attr_reader :compression_method
    attr_reader :file_mod_time
    attr_reader :crc32
    attr_reader :len_body_compressed
    attr_reader :len_body_uncompressed
    attr_reader :len_file_name
    attr_reader :len_extra
    attr_reader :file_name
    attr_reader :extra
    attr_reader :_raw_flags
    attr_reader :_raw_file_mod_time
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
      @num_central_dir_entries_on_disk = @_io.read_u2le
      @num_central_dir_entries_total = @_io.read_u2le
      @len_central_dir = @_io.read_u4le
      @ofs_central_dir = @_io.read_u4le
      @len_comment = @_io.read_u2le
      @comment = (@_io.read_bytes(len_comment)).force_encoding("UTF-8")
      self
    end
    attr_reader :disk_of_end_of_central_dir
    attr_reader :disk_of_central_dir
    attr_reader :num_central_dir_entries_on_disk
    attr_reader :num_central_dir_entries_total
    attr_reader :len_central_dir
    attr_reader :ofs_central_dir
    attr_reader :len_comment
    attr_reader :comment
  end
  attr_reader :sections
end
