# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.9')
  raise "Incompatible Kaitai Struct Ruby API: 0.9 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# ### Building a test file
# 
# ```
# dd if=/dev/zero of=image.img bs=512 count=$(( 4 * 1024 * 2 ))
# sudo losetup /dev/loop1 image.img
# sudo pvcreate /dev/loop1
# sudo vgcreate vg_test /dev/loop1
# sudo lvcreate --name lv_test1 vg_test
# sudo losetup -d /dev/loop1
# ```
# @see https://github.com/libyal/libvslvm/blob/master/documentation/Logical%20Volume%20Manager%20(LVM)%20format.asciidoc Source
class Lvm2 < Kaitai::Struct::Struct
  def initialize(_io, _parent = nil, _root = self)
    super(_io, _parent, _root)
    _read
  end

  def _read
    @pv = PhysicalVolume.new(@_io, self, @_root)
    self
  end
  class PhysicalVolume < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @empty_sector = @_io.read_bytes(_root.sector_size)
      @label = Label.new(@_io, self, @_root)
      self
    end
    class Label < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = self)
        super(_io, _parent, _root)
        _read
      end

      def _read
        @label_header = LabelHeader.new(@_io, self, @_root)
        @volume_header = VolumeHeader.new(@_io, self, @_root)
        self
      end
      class LabelHeader < Kaitai::Struct::Struct
        def initialize(_io, _parent = nil, _root = self)
          super(_io, _parent, _root)
          _read
        end

        def _read
          @signature = @_io.read_bytes(8)
          raise Kaitai::Struct::ValidationNotEqualError.new([76, 65, 66, 69, 76, 79, 78, 69].pack('C*'), signature, _io, "/types/physical_volume/types/label/types/label_header/seq/0") if not signature == [76, 65, 66, 69, 76, 79, 78, 69].pack('C*')
          @sector_number = @_io.read_u8le
          @checksum = @_io.read_u4le
          @label_header_ = LabelHeader.new(@_io, self, @_root)
          self
        end
        class LabelHeader < Kaitai::Struct::Struct
          def initialize(_io, _parent = nil, _root = self)
            super(_io, _parent, _root)
            _read
          end

          def _read
            @data_offset = @_io.read_u4le
            @type_indicator = @_io.read_bytes(8)
            raise Kaitai::Struct::ValidationNotEqualError.new([76, 86, 77, 50, 32, 48, 48, 49].pack('C*'), type_indicator, _io, "/types/physical_volume/types/label/types/label_header/types/label_header_/seq/1") if not type_indicator == [76, 86, 77, 50, 32, 48, 48, 49].pack('C*')
            self
          end

          ##
          # The offset, in bytes, relative from the start of the physical volume label header where data is stored
          attr_reader :data_offset
          attr_reader :type_indicator
        end
        attr_reader :signature

        ##
        # The sector number of the physical volume label header
        attr_reader :sector_number

        ##
        # CRC-32 for offset 20 to end of the physical volume label sector
        attr_reader :checksum
        attr_reader :label_header_
      end
      class VolumeHeader < Kaitai::Struct::Struct
        def initialize(_io, _parent = nil, _root = self)
          super(_io, _parent, _root)
          _read
        end

        def _read
          @id = (@_io.read_bytes(32)).force_encoding("ascii")
          @size = @_io.read_u8le
          @data_area_descriptors = []
          i = 0
          begin
            _ = DataAreaDescriptor.new(@_io, self, @_root)
            @data_area_descriptors << _
            i += 1
          end until  ((_.size != 0) && (_.offset != 0)) 
          @metadata_area_descriptors = []
          i = 0
          begin
            _ = MetadataAreaDescriptor.new(@_io, self, @_root)
            @metadata_area_descriptors << _
            i += 1
          end until  ((_.size != 0) && (_.offset != 0)) 
          self
        end
        class DataAreaDescriptor < Kaitai::Struct::Struct
          def initialize(_io, _parent = nil, _root = self)
            super(_io, _parent, _root)
            _read
          end

          def _read
            @offset = @_io.read_u8le
            @size = @_io.read_u8le
            self
          end
          def data
            return @data unless @data.nil?
            if size != 0
              _pos = @_io.pos
              @_io.seek(offset)
              @data = (@_io.read_bytes(size)).force_encoding("ascii")
              @_io.seek(_pos)
            end
            @data
          end

          ##
          # The offset, in bytes, relative from the start of the physical volume
          attr_reader :offset

          ##
          # Value in bytes. Can be 0. [yellow-background]*Does this represent all remaining available space?*
          attr_reader :size
        end
        class MetadataAreaDescriptor < Kaitai::Struct::Struct
          def initialize(_io, _parent = nil, _root = self)
            super(_io, _parent, _root)
            _read
          end

          def _read
            @offset = @_io.read_u8le
            @size = @_io.read_u8le
            self
          end
          def data
            return @data unless @data.nil?
            if size != 0
              _pos = @_io.pos
              @_io.seek(offset)
              @_raw_data = @_io.read_bytes(size)
              _io__raw_data = Kaitai::Struct::Stream.new(@_raw_data)
              @data = MetadataArea.new(_io__raw_data, self, @_root)
              @_io.seek(_pos)
            end
            @data
          end

          ##
          # The offset, in bytes, relative from the start of the physical volume
          attr_reader :offset

          ##
          # Value in bytes
          attr_reader :size
          attr_reader :_raw_data
        end

        ##
        # According to `[REDHAT]` the metadata area is a circular buffer. New metadata is appended to the old metadata and then the pointer to the start of it is updated. The metadata area, therefore, can contain copies of older versions of the metadata.
        class MetadataArea < Kaitai::Struct::Struct
          def initialize(_io, _parent = nil, _root = self)
            super(_io, _parent, _root)
            _read
          end

          def _read
            @header = MetadataAreaHeader.new(@_io, self, @_root)
            self
          end
          class MetadataAreaHeader < Kaitai::Struct::Struct
            def initialize(_io, _parent = nil, _root = self)
              super(_io, _parent, _root)
              _read
            end

            def _read
              @checksum = MetadataAreaHeader.new(@_io, self, @_root)
              @signature = @_io.read_bytes(16)
              raise Kaitai::Struct::ValidationNotEqualError.new([32, 76, 86, 77, 50, 32, 120, 91, 53, 65, 37, 114, 48, 78, 42, 62].pack('C*'), signature, _io, "/types/physical_volume/types/label/types/volume_header/types/metadata_area/types/metadata_area_header/seq/1") if not signature == [32, 76, 86, 77, 50, 32, 120, 91, 53, 65, 37, 114, 48, 78, 42, 62].pack('C*')
              @version = @_io.read_u4le
              @metadata_area_offset = @_io.read_u8le
              @metadata_area_size = @_io.read_u8le
              @raw_location_descriptors = []
              i = 0
              begin
                _ = RawLocationDescriptor.new(@_io, self, @_root)
                @raw_location_descriptors << _
                i += 1
              end until  ((_.offset != 0) && (_.size != 0) && (_.checksum != 0)) 
              self
            end

            ##
            # The data area size can be 0. It is assumed it represents the remaining  available data.
            class RawLocationDescriptor < Kaitai::Struct::Struct

              RAW_LOCATION_DESCRIPTOR_FLAGS = {
                1 => :raw_location_descriptor_flags_raw_location_ignored,
              }
              I__RAW_LOCATION_DESCRIPTOR_FLAGS = RAW_LOCATION_DESCRIPTOR_FLAGS.invert
              def initialize(_io, _parent = nil, _root = self)
                super(_io, _parent, _root)
                _read
              end

              def _read
                @offset = @_io.read_u8le
                @size = @_io.read_u8le
                @checksum = @_io.read_u4le
                @flags = Kaitai::Struct::Stream::resolve_enum(RAW_LOCATION_DESCRIPTOR_FLAGS, @_io.read_u4le)
                self
              end

              ##
              # The data area offset, in bytes, relative from the start of the metadata area
              attr_reader :offset

              ##
              # data area size in bytes
              attr_reader :size

              ##
              # CRC-32 of *TODO (metadata?)*
              attr_reader :checksum
              attr_reader :flags
            end
            def metadata
              return @metadata unless @metadata.nil?
              _pos = @_io.pos
              @_io.seek(metadata_area_offset)
              @metadata = @_io.read_bytes(metadata_area_size)
              @_io.seek(_pos)
              @metadata
            end

            ##
            # CRC-32 for offset 4 to end of the metadata area header
            attr_reader :checksum
            attr_reader :signature
            attr_reader :version

            ##
            # The offset, in bytes, of the metadata area relative from the start of the physical volume
            attr_reader :metadata_area_offset
            attr_reader :metadata_area_size

            ##
            # The last descriptor in the list is terminator and consists of 0-byte values.
            attr_reader :raw_location_descriptors
          end
          attr_reader :header
        end

        ##
        # Contains a UUID stored as an ASCII string. The physical volume identifier can be used to uniquely identify a physical volume. The physical volume identifier is stored as: 9LBcEB7PQTGIlLI0KxrtzrynjuSL983W but is equivalent to its formatted variant: 9LBcEB-7PQT-GIlL-I0Kx-rtzr-ynju-SL983W, which is used in the metadata.
        attr_reader :id

        ##
        # Physical Volume size. Value in bytes
        attr_reader :size

        ##
        # The last descriptor in the list is terminator and consists of 0-byte values.
        attr_reader :data_area_descriptors
        attr_reader :metadata_area_descriptors
      end
      attr_reader :label_header
      attr_reader :volume_header
    end
    attr_reader :empty_sector
    attr_reader :label
  end
  def sector_size
    return @sector_size unless @sector_size.nil?
    @sector_size = 512
    @sector_size
  end

  ##
  # Physical volume
  attr_reader :pv
end
