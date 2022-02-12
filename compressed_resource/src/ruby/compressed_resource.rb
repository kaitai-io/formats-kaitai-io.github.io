# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.9')
  raise "Incompatible Kaitai Struct Ruby API: 0.9 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# Compressed Macintosh resource data,
# as stored in resources with the "compressed" attribute.
# 
# Resource decompression is not documented by Apple.
# It is mostly used internally in System 7,
# some of Apple's own applications (such as ResEdit),
# and also by some third-party applications.
# Later versions of Classic Mac OS make less use of resource compression,
# but still support it fully for backwards compatibility.
# Carbon in Mac OS X no longer supports resource compression in any way.
# 
# The data of all compressed resources starts with a common header,
# followed by the compressed data.
# The data is decompressed using code in a `'dcmp'` resource.
# Some decompressors used by Apple are included in the System file,
# but applications can also include custom decompressors.
# The header of the compressed data indicates the ID of the `'dcmp'` resource used to decompress the data,
# along with some parameters for the decompressor.
# @see http://www.alysis.us/arctechnology.htm Source
# @see http://preserve.mactech.com/articles/mactech/Vol.09/09.01/ResCompression/index.html Source
# @see https://github.com/dgelessus/python-rsrcfork/tree/f891a6e/src/rsrcfork/compress Source
class CompressedResource < Kaitai::Struct::Struct
  def initialize(_io, _parent = nil, _root = self)
    super(_io, _parent, _root)
    _read
  end

  def _read
    @header = Header.new(@_io, self, @_root)
    @compressed_data = @_io.read_bytes_full
    self
  end

  ##
  # Compressed resource data header,
  # as stored at the start of all compressed resources.
  class Header < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @common_part = CommonPart.new(@_io, self, @_root)
      @_raw_type_specific_part_raw_with_io = @_io.read_bytes((common_part.len_header - 12))
      _io__raw_type_specific_part_raw_with_io = Kaitai::Struct::Stream.new(@_raw_type_specific_part_raw_with_io)
      @type_specific_part_raw_with_io = BytesWithIo.new(_io__raw_type_specific_part_raw_with_io)
      self
    end

    ##
    # The common part of a compressed resource data header.
    # The format of this part is the same for all compressed resources.
    class CommonPart < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = self)
        super(_io, _parent, _root)
        _read
      end

      def _read
        @magic = @_io.read_bytes(4)
        raise Kaitai::Struct::ValidationNotEqualError.new([168, 159, 101, 114].pack('C*'), magic, _io, "/types/header/types/common_part/seq/0") if not magic == [168, 159, 101, 114].pack('C*')
        @len_header = @_io.read_u2be
        raise Kaitai::Struct::ValidationNotEqualError.new(18, len_header, _io, "/types/header/types/common_part/seq/1") if not len_header == 18
        @header_type = @_io.read_u1
        @unknown = @_io.read_u1
        raise Kaitai::Struct::ValidationNotEqualError.new(1, unknown, _io, "/types/header/types/common_part/seq/3") if not unknown == 1
        @len_decompressed = @_io.read_u4be
        self
      end

      ##
      # The signature of all compressed resource data.
      # 
      # When interpreted as MacRoman, this byte sequence decodes to `®üer`.
      attr_reader :magic

      ##
      # The byte length of the entire header (common and type-specific parts).
      # 
      # The meaning of this field is mostly a guess,
      # as all known header types result in a total length of `0x12`.
      attr_reader :len_header

      ##
      # Type of the header.
      # This determines the format of the data in the type-specific part of the header.
      # 
      # The only known header type values are `8` and `9`.
      # 
      # Every known decompressor is only compatible with one of the header types
      # (but every header type is used by more than one decompressor).
      # Apple's decompressors with IDs 0 and 1 use header type 8,
      # and those with IDs 2 and 3 use header type 9.
      attr_reader :header_type

      ##
      # The meaning of this field is not known.
      # It has the value `0x01` in all known compressed resources.
      attr_reader :unknown

      ##
      # The byte length of the data after decompression.
      attr_reader :len_decompressed
    end

    ##
    # The type-specific part of a compressed resource header with header type `8`.
    class TypeSpecificPartType8 < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = self)
        super(_io, _parent, _root)
        _read
      end

      def _read
        @working_buffer_fractional_size = @_io.read_u1
        @expansion_buffer_size = @_io.read_u1
        @decompressor_id = @_io.read_s2be
        @reserved = @_io.read_u2be
        raise Kaitai::Struct::ValidationNotEqualError.new(0, reserved, _io, "/types/header/types/type_specific_part_type_8/seq/3") if not reserved == 0
        self
      end

      ##
      # The ratio of the compressed data size to the uncompressed data size,
      # times 256.
      # 
      # This parameter affects the amount of memory allocated by the Resource Manager during decompression,
      # but does not have a direct effect on the decompressor
      # (except that it will misbehave if insufficient memory is provided).
      # Alternative decompressors that decompress resources into a separate buffer rather than in-place can generally ignore this parameter.
      attr_reader :working_buffer_fractional_size

      ##
      # The maximum number of bytes that the compressed data might "grow" during decompression.
      # 
      # This parameter affects the amount of memory allocated by the Resource Manager during decompression,
      # but does not have a direct effect on the decompressor
      # (except that it will misbehave if insufficient memory is provided).
      # Alternative decompressors that decompress resources into a separate buffer rather than in-place can generally ignore this parameter.
      attr_reader :expansion_buffer_size

      ##
      # The ID of the `'dcmp'` resource that should be used to decompress this resource.
      attr_reader :decompressor_id

      ##
      # The meaning of this field is not known.
      # It has the value `0` in all known compressed resources,
      # so it is most likely reserved.
      attr_reader :reserved
    end

    ##
    # The type-specific part of a compressed resource header with header type `9`.
    class TypeSpecificPartType9 < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = self)
        super(_io, _parent, _root)
        _read
      end

      def _read
        @decompressor_id = @_io.read_s2be
        @_raw_decompressor_specific_parameters_with_io = @_io.read_bytes(4)
        _io__raw_decompressor_specific_parameters_with_io = Kaitai::Struct::Stream.new(@_raw_decompressor_specific_parameters_with_io)
        @decompressor_specific_parameters_with_io = BytesWithIo.new(_io__raw_decompressor_specific_parameters_with_io)
        self
      end

      ##
      # Decompressor-specific parameters.
      # The exact structure and meaning of this field is different for each decompressor.
      # 
      # This field always has the same length,
      # but decompressors don't always use the entirety of the field,
      # so depending on the decompressor some parts of this field may be meaningless.
      def decompressor_specific_parameters
        return @decompressor_specific_parameters unless @decompressor_specific_parameters.nil?
        @decompressor_specific_parameters = decompressor_specific_parameters_with_io.data
        @decompressor_specific_parameters
      end

      ##
      # The ID of the `'dcmp'` resource that should be used to decompress this resource.
      attr_reader :decompressor_id

      ##
      # Use `decompressor_specific_parameters` instead,
      # unless you need access to this field's `_io`.
      attr_reader :decompressor_specific_parameters_with_io
      attr_reader :_raw_decompressor_specific_parameters_with_io
    end

    ##
    # The type-specific part of the header,
    # as a raw byte array.
    def type_specific_part_raw
      return @type_specific_part_raw unless @type_specific_part_raw.nil?
      @type_specific_part_raw = type_specific_part_raw_with_io.data
      @type_specific_part_raw
    end

    ##
    # The type-specific part of the header,
    # parsed according to the type from the common part.
    def type_specific_part
      return @type_specific_part unless @type_specific_part.nil?
      io = type_specific_part_raw_with_io._io
      _pos = io.pos
      io.seek(0)
      case common_part.header_type
      when 8
        @type_specific_part = TypeSpecificPartType8.new(io, self, @_root)
      when 9
        @type_specific_part = TypeSpecificPartType9.new(io, self, @_root)
      end
      io.seek(_pos)
      @type_specific_part
    end

    ##
    # The common part of the header.
    # Among other things,
    # this part contains the header type,
    # which determines the format of the data in the type-specific part of the header.
    attr_reader :common_part

    ##
    # Use `type_specific_part_raw` instead,
    # unless you need access to this field's `_io`.
    attr_reader :type_specific_part_raw_with_io
    attr_reader :_raw_type_specific_part_raw_with_io
  end

  ##
  # The header of the compressed data.
  attr_reader :header

  ##
  # The compressed resource data.
  # 
  # The format of this data is completely dependent on the decompressor and its parameters,
  # as specified in the header.
  # For details about the compressed data formats implemented by Apple's decompressors,
  # see the specs in the resource_compression subdirectory.
  attr_reader :compressed_data
end
