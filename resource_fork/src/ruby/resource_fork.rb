# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.9')
  raise "Incompatible Kaitai Struct Ruby API: 0.9 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# The data format of Macintosh resource forks,
# used on Classic Mac OS and Mac OS X/macOS to store additional structured data along with a file's main data (the data fork).
# The kinds of data stored in resource forks include:
# 
# * Document resources:
#   images, sounds, etc. used by a document
# * Application resources:
#   graphics, GUI layouts, localizable strings,
#   and even code used by an application, a library, or system files
# * Common metadata:
#   custom icons and version metadata that could be displayed by the Finder
# * Application-specific metadata:
#   because resource forks follow a common format,
#   other applications can store new metadata in them,
#   even if the original application does not recognize or understand it
# 
# Macintosh file systems (MFS, HFS, HFS+, APFS) support resource forks natively,
# which allows storing resources along with any file.
# Non-Macintosh file systems and protocols have little or no support for resource forks,
# so the resource fork data must be stored in some other way when using such file systems or protocols.
# Various file formats and tools exist for this purpose,
# such as BinHex, MacBinary, AppleSingle, AppleDouble, or QuickTime RezWack.
# In some cases,
# resource forks are stored as plain data in separate files with a .rsrc extension,
# even on Mac systems that natively support resource forks.
# 
# On modern Mac OS X/macOS systems,
# resource forks are used far less commonly than on classic Mac OS systems,
# because of compatibility issues with other systems and historical limitations in the format.
# Modern macOS APIs and libraries do not use resource forks,
# and the legacy Carbon API that still used them has been deprecated since OS X 10.8.
# Despite this,
# even current macOS systems still use resource forks for certain purposes,
# such as custom file icons.
# @see https://developer.apple.com/library/archive/documentation/mac/pdf/MoreMacintoshToolbox.pdf#page=151 Inside Macintosh, More Macintosh Toolbox, Resource Manager, Resource Manager Reference, Resource File Format
# @see http://www.pagetable.com/?p=50 Inside Macintosh, Volume I, The Resource Manager, Format of a Resource File
# @see https://github.com/kreativekorp/ksfl/wiki/Macintosh-Resource-File-Format Source
# @see https://github.com/dgelessus/mac_file_format_docs/blob/master/README.md#resource-forks Source
class ResourceFork < Kaitai::Struct::Struct
  def initialize(_io, _parent = nil, _root = self)
    super(_io, _parent, _root)
    _read
  end

  def _read
    @header = FileHeader.new(@_io, self, @_root)
    @system_data = @_io.read_bytes(112)
    @application_data = @_io.read_bytes(128)
    self
  end

  ##
  # Resource file header,
  # containing the offsets and lengths of the resource data area and resource map.
  class FileHeader < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @ofs_data_blocks = @_io.read_u4be
      @ofs_resource_map = @_io.read_u4be
      @len_data_blocks = @_io.read_u4be
      @len_resource_map = @_io.read_u4be
      self
    end

    ##
    # Offset of the resource data area,
    # from the start of the resource file.
    # 
    # In practice,
    # this should always be `256`,
    # i. e. the resource data area should directly follow the application-specific data area.
    attr_reader :ofs_data_blocks

    ##
    # Offset of the resource map,
    # from the start of the resource file.
    # 
    # In practice,
    # this should always be `ofs_data_blocks + len_data_blocks`,
    # i. e. the resource map should directly follow the resource data area.
    attr_reader :ofs_resource_map

    ##
    # Length of the resource data area.
    attr_reader :len_data_blocks

    ##
    # Length of the resource map.
    # 
    # In practice,
    # this should always be `_root._io.size - ofs_resource_map`,
    # i. e. the resource map should extend to the end of the resource file.
    attr_reader :len_resource_map
  end

  ##
  # A resource data block,
  # as stored in the resource data area.
  # 
  # Each data block stores the data contained in a resource,
  # along with its length.
  class DataBlock < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @len_data = @_io.read_u4be
      @data = @_io.read_bytes(len_data)
      self
    end

    ##
    # The length of the resource data stored in this block.
    attr_reader :len_data

    ##
    # The data stored in this block.
    attr_reader :data
  end

  ##
  # Resource map,
  # containing information about the resources in the file and where they are located in the data area.
  class ResourceMap < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @reserved_file_header_copy = FileHeader.new(@_io, self, @_root)
      @reserved_next_resource_map_handle = @_io.read_u4be
      @reserved_file_reference_number = @_io.read_u2be
      @_raw_file_attributes = @_io.read_bytes(2)
      _io__raw_file_attributes = Kaitai::Struct::Stream.new(@_raw_file_attributes)
      @file_attributes = FileAttributes.new(_io__raw_file_attributes, self, @_root)
      @ofs_type_list = @_io.read_u2be
      @ofs_names = @_io.read_u2be
      self
    end

    ##
    # A resource file's attributes,
    # as stored in the resource map.
    # 
    # These attributes are sometimes also referred to as resource map attributes,
    # because of where they are stored in the file.
    class FileAttributes < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = self)
        super(_io, _parent, _root)
        _read
      end

      def _read
        @resources_locked = @_io.read_bits_int_be(1) != 0
        @reserved0 = @_io.read_bits_int_be(6)
        @printer_driver_multifinder_compatible = @_io.read_bits_int_be(1) != 0
        @no_write_changes = @_io.read_bits_int_be(1) != 0
        @needs_compact = @_io.read_bits_int_be(1) != 0
        @map_needs_write = @_io.read_bits_int_be(1) != 0
        @reserved1 = @_io.read_bits_int_be(5)
        self
      end

      ##
      # The attributes as a packed integer,
      # as they are stored in the file.
      def as_int
        return @as_int unless @as_int.nil?
        _pos = @_io.pos
        @_io.seek(0)
        @as_int = @_io.read_u2be
        @_io.seek(_pos)
        @as_int
      end

      ##
      # TODO What does this attribute actually do,
      # and how is it different from `read_only`?
      # 
      # This attribute is undocumented and not defined in <CarbonCore/Resources.h>,
      # but ResEdit has a checkbox called "Resources Locked" for this attribute.
      attr_reader :resources_locked

      ##
      # These attributes have no known usage or meaning and should always be zero.
      attr_reader :reserved0

      ##
      # Indicates that this printer driver is compatible with MultiFinder,
      # i. e. can be used simultaneously by multiple applications.
      # This attribute is only meant to be set on printer driver resource forks.
      # 
      # This attribute is not documented in Inside Macintosh and is not defined in <CarbonCore/Resources.h>.
      # It is documented in technote PR510,
      # and ResEdit has a checkbox called "Printer Driver MultiFinder Compatible" for this attribute.
      # @see https://developer.apple.com/library/archive/technotes/pr/pr_510.html Apple Technical Note PR510 - Printer Driver Q&As, section '"Printer driver is MultiFinder compatible" bit'
      attr_reader :printer_driver_multifinder_compatible

      ##
      # Indicates that the Resource Manager should not write any changes from memory into the resource file.
      # Any modification operations requested by the application will return successfully,
      # but will not actually update the resource file.
      # 
      # TODO Is this attribute supposed to be set on disk or only in memory?
      attr_reader :no_write_changes

      ##
      # Indicates that the resource file should be compacted the next time it is written by the Resource Manager.
      # This attribute is only meant to be set in memory;
      # it is cleared when the resource file is written to disk.
      # 
      # This attribute is mainly used internally by the Resource Manager,
      # but may also be set manually by the application.
      attr_reader :needs_compact

      ##
      # Indicates that the resource map has been changed in memory and should be written to the resource file on the next update.
      # This attribute is only meant to be set in memory;
      # it is cleared when the resource file is written to disk.
      # 
      # This attribute is mainly used internally by the Resource Manager,
      # but may also be set manually by the application.
      attr_reader :map_needs_write

      ##
      # These attributes have no known usage or meaning and should always be zero.
      attr_reader :reserved1
    end

    ##
    # Resource type list and storage area for resource reference lists in the resource map.
    # 
    # The two parts are combined into a single type here for technical reasons:
    # the start of the resource reference list area is not stored explicitly in the file,
    # instead it always starts directly after the resource type list.
    # The simplest way to implement this is by placing both types into a single `seq`.
    class TypeListAndReferenceLists < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = self)
        super(_io, _parent, _root)
        _read
      end

      def _read
        @type_list = TypeList.new(@_io, self, @_root)
        @reference_lists = @_io.read_bytes_full
        self
      end

      ##
      # Resource type list in the resource map.
      class TypeList < Kaitai::Struct::Struct
        def initialize(_io, _parent = nil, _root = self)
          super(_io, _parent, _root)
          _read
        end

        def _read
          @num_types_m1 = @_io.read_u2be
          @entries = Array.new(num_types)
          (num_types).times { |i|
            @entries[i] = TypeListEntry.new(@_io, self, @_root)
          }
          self
        end

        ##
        # A single entry in the resource type list.
        # 
        # Each entry corresponds to exactly one resource reference list.
        class TypeListEntry < Kaitai::Struct::Struct
          def initialize(_io, _parent = nil, _root = self)
            super(_io, _parent, _root)
            _read
          end

          def _read
            @type = @_io.read_bytes(4)
            @num_references_m1 = @_io.read_u2be
            @ofs_reference_list = @_io.read_u2be
            self
          end

          ##
          # The number of resources in the reference list for this type.
          def num_references
            return @num_references unless @num_references.nil?
            @num_references = ((num_references_m1 + 1) % 65536)
            @num_references
          end

          ##
          # The resource reference list for this resource type.
          def reference_list
            return @reference_list unless @reference_list.nil?
            io = _parent._parent._io
            _pos = io.pos
            io.seek(ofs_reference_list)
            @reference_list = ReferenceList.new(io, self, @_root, num_references)
            io.seek(_pos)
            @reference_list
          end

          ##
          # The four-character type code of the resources in the reference list.
          attr_reader :type

          ##
          # The number of resources in the reference list for this type,
          # minus one.
          # 
          # Empty reference lists should never exist.
          attr_reader :num_references_m1

          ##
          # Offset of the resource reference list for this resource type,
          # from the start of the resource type list.
          # 
          # Although the offset is relative to the start of the type list,
          # it should never point into the type list itself,
          # but into the reference list storage area that directly follows it.
          # That is,
          # it should always be at least `_parent._sizeof`.
          attr_reader :ofs_reference_list
        end

        ##
        # The number of resource types in this list.
        def num_types
          return @num_types unless @num_types.nil?
          @num_types = ((num_types_m1 + 1) % 65536)
          @num_types
        end

        ##
        # The number of resource types in this list,
        # minus one.
        # 
        # If the resource list is empty,
        # the value of this field is `0xffff`,
        # i. e. `-1` truncated to a 16-bit unsigned integer.
        attr_reader :num_types_m1

        ##
        # Entries in the resource type list.
        attr_reader :entries
      end

      ##
      # A resource reference list,
      # as stored in the reference list area.
      # 
      # Each reference list has exactly one matching entry in the resource type list,
      # and describes all resources of a single type in the file.
      class ReferenceList < Kaitai::Struct::Struct
        def initialize(_io, _parent = nil, _root = self, num_references)
          super(_io, _parent, _root)
          @num_references = num_references
          _read
        end

        def _read
          @references = Array.new(num_references)
          (num_references).times { |i|
            @references[i] = Reference.new(@_io, self, @_root)
          }
          self
        end

        ##
        # A single resource reference in a resource reference list.
        class Reference < Kaitai::Struct::Struct
          def initialize(_io, _parent = nil, _root = self)
            super(_io, _parent, _root)
            _read
          end

          def _read
            @id = @_io.read_s2be
            @ofs_name = @_io.read_u2be
            @_raw_attributes = @_io.read_bytes(1)
            _io__raw_attributes = Kaitai::Struct::Stream.new(@_raw_attributes)
            @attributes = Attributes.new(_io__raw_attributes, self, @_root)
            @ofs_data_block = @_io.read_bits_int_be(24)
            @_io.align_to_byte
            @reserved_handle = @_io.read_u4be
            self
          end

          ##
          # A resource's attributes,
          # as stored in a resource reference.
          class Attributes < Kaitai::Struct::Struct
            def initialize(_io, _parent = nil, _root = self)
              super(_io, _parent, _root)
              _read
            end

            def _read
              @system_reference = @_io.read_bits_int_be(1) != 0
              @load_into_system_heap = @_io.read_bits_int_be(1) != 0
              @purgeable = @_io.read_bits_int_be(1) != 0
              @locked = @_io.read_bits_int_be(1) != 0
              @protected = @_io.read_bits_int_be(1) != 0
              @preload = @_io.read_bits_int_be(1) != 0
              @needs_write = @_io.read_bits_int_be(1) != 0
              @compressed = @_io.read_bits_int_be(1) != 0
              self
            end

            ##
            # The attributes as a packed integer,
            # as they are stored in the file.
            def as_int
              return @as_int unless @as_int.nil?
              _pos = @_io.pos
              @_io.seek(0)
              @as_int = @_io.read_u1
              @_io.seek(_pos)
              @as_int
            end

            ##
            # Indicates that this resource reference is a system reference rather than a regular local reference.
            # This attribute is nearly undocumented.
            # For all practical purposes,
            # it should be considered reserved and should always be zero.
            # 
            # This attribute was last documented in the Promotional Edition of Inside Macintosh,
            # in the Resource Manager chapter,
            # on pages 37-41,
            # in a "System References" section that calls itself "of historical interest only".
            # The final versions of Inside Macintosh only mention this attribute as "reserved for use by the Resource Manager".
            # <CarbonCore/Resources.h> contains a `resSysRefBit` constant,
            # but no corresponding `resSysRef` constant like for all other resource attributes.
            # 
            # According to the Inside Macintosh Promotional Edition,
            # a system reference was effectively an alias pointing to a resource stored in the system file,
            # possibly with a different ID and name (but not type) than the system reference.
            # If this attribute is set,
            # `ofs_data_block` is ignored and should be zero,
            # and `reserved_handle` contains
            # (in its high and low two bytes, respectively)
            # the ID and name offset of the real system resource that this system reference points to.
            # 
            # TODO Do any publicly available Mac OS versions support system references,
            # and do any real files/applications use them?
            # So far the answer seems to be no,
            # but I would like to be proven wrong!
            attr_reader :system_reference

            ##
            # Indicates that this resource should be loaded into the system heap if possible,
            # rather than the application heap.
            # 
            # This attribute is only meant to be used by Mac OS itself,
            # for System and Finder resources,
            # and not by normal applications.
            # 
            # This attribute may be set both in memory and on disk,
            # but it only has any meaning while the resource file is loaded into memory.
            attr_reader :load_into_system_heap

            ##
            # Indicates that this resource's data should be purgeable by the Mac OS Memory Manager.
            # This allows the resource data to be purged from memory if space is needed on the heap.
            # Purged resources can later be reloaded from disk if their data is needed again.
            # 
            # If the `locked` attribute is set,
            # this attribute has no effect
            # (i. e. locked resources are never purgeable).
            # 
            # This attribute may be set both in memory and on disk,
            # but it only has any meaning while the resource file is loaded into memory.
            attr_reader :purgeable

            ##
            # Indicates that this resource's data should be locked to the Mac OS Memory Manager.
            # This prevents the resource data from being moved when the heap is compacted.
            # 
            # This attribute may be set both in memory and on disk,
            # but it only has any meaning while the resource file is loaded into memory.
            attr_reader :locked

            ##
            # Indicates that this resource should be protected (i. e. unmodifiable) in memory.
            # This prevents the application from using the Resource Manager to change the resource's data or metadata,
            # or delete it.
            # The only exception are the resource's attributes,
            # which can always be changed,
            # even for protected resources.
            # This allows protected resources to be unprotected again by the application.
            # 
            # This attribute may be set both in memory and on disk,
            # but it only has any meaning while the resource file is loaded into memory.
            attr_reader :protected

            ##
            # Indicates that this resource's data should be immediately loaded into memory when the resource file is opened.
            # 
            # This attribute may be set both in memory and on disk,
            # but it only has any meaning when the resource file is first opened.
            attr_reader :preload

            ##
            # Indicates that this resource's data has been changed in memory and should be written to the resource file on the next update.
            # This attribute is only meant to be set in memory;
            # it is cleared when the resource file is written to disk.
            # 
            # This attribute is used internally by the Resource Manager and should not be set manually by the application.
            attr_reader :needs_write

            ##
            # Indicates that this resource's data is compressed.
            # Compressed resource data is decompressed transparently by the Resource Manager when reading.
            # 
            # For a detailed description of the structure of compressed resources as they are stored in the file,
            # see the compressed_resource.ksy spec.
            attr_reader :compressed
          end

          ##
          # The name (if any) of the resource described by this reference.
          def name
            return @name unless @name.nil?
            if ofs_name != 65535
              io = _root.resource_map.names_with_io._io
              _pos = io.pos
              io.seek(ofs_name)
              @name = Name.new(io, self, @_root)
              io.seek(_pos)
            end
            @name
          end

          ##
          # The data block containing the data for the resource described by this reference.
          def data_block
            return @data_block unless @data_block.nil?
            io = _root.data_blocks_with_io._io
            _pos = io.pos
            io.seek(ofs_data_block)
            @data_block = DataBlock.new(io, self, @_root)
            io.seek(_pos)
            @data_block
          end

          ##
          # ID of the resource described by this reference.
          attr_reader :id

          ##
          # Offset of the name for the resource described by this reference,
          # from the start of the resource name area.
          # 
          # If the resource has no name,
          # the value of this field is `0xffff`
          # i. e. `-1` truncated to a 16-bit unsigned integer.
          attr_reader :ofs_name

          ##
          # Attributes of the resource described by this reference.
          attr_reader :attributes

          ##
          # Offset of the data block for the resource described by this reference,
          # from the start of the resource data area.
          attr_reader :ofs_data_block

          ##
          # Reserved space for the resource's handle in memory.
          attr_reader :reserved_handle
          attr_reader :_raw_attributes
        end

        ##
        # The resource references in this reference list.
        attr_reader :references

        ##
        # The number of references in this resource reference list.
        # 
        # This information needs to be passed in as a parameter,
        # because it is stored in the reference list's type list entry,
        # and not in the reference list itself.
        attr_reader :num_references
      end

      ##
      # The resource map's resource type list.
      attr_reader :type_list

      ##
      # Storage area for the resource map's resource reference lists.
      # 
      # According to Inside Macintosh,
      # the reference lists are stored contiguously,
      # in the same order as their corresponding resource type list entries.
      attr_reader :reference_lists
    end

    ##
    # A resource name,
    # as stored in the resource name storage area in the resource map.
    # 
    # The resource names are not required to appear in any particular order.
    # There may be unused space between and around resource names,
    # but in practice they are often contiguous.
    class Name < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = self)
        super(_io, _parent, _root)
        _read
      end

      def _read
        @len_value = @_io.read_u1
        @value = @_io.read_bytes(len_value)
        self
      end

      ##
      # The length of the resource name, in bytes.
      attr_reader :len_value

      ##
      # The resource name.
      # 
      # This field is exposed as a byte array,
      # because there is no universal encoding for resource names.
      # Most Classic Mac software does not deal with encodings explicitly and instead assumes that all strings,
      # including resource names,
      # use the system encoding,
      # which varies depending on the system language.
      # This means that resource names can use different encodings depending on what system language they were created with.
      # 
      # Many resource names are plain ASCII,
      # meaning that the encoding often does not matter
      # (because all Mac OS encodings are ASCII-compatible).
      # For non-ASCII resource names,
      # the most common encoding is perhaps MacRoman
      # (used for English and other Western languages),
      # but other encodings are also sometimes used,
      # especially for software in non-Western languages.
      # 
      # There is no requirement that all names in a single resource file use the same encoding.
      # For example,
      # localized software may have some (but not all) of its resource names translated.
      # For non-Western languages,
      # this can lead to some resource names using MacRoman,
      # and others using a different encoding.
      attr_reader :value
    end

    ##
    # The resource map's resource type list, followed by the resource reference list area.
    def type_list_and_reference_lists
      return @type_list_and_reference_lists unless @type_list_and_reference_lists.nil?
      _pos = @_io.pos
      @_io.seek(ofs_type_list)
      @_raw_type_list_and_reference_lists = @_io.read_bytes((ofs_names - ofs_type_list))
      _io__raw_type_list_and_reference_lists = Kaitai::Struct::Stream.new(@_raw_type_list_and_reference_lists)
      @type_list_and_reference_lists = TypeListAndReferenceLists.new(_io__raw_type_list_and_reference_lists, self, @_root)
      @_io.seek(_pos)
      @type_list_and_reference_lists
    end

    ##
    # Use `names` instead,
    # unless you need access to this instance's `_io`.
    def names_with_io
      return @names_with_io unless @names_with_io.nil?
      _pos = @_io.pos
      @_io.seek(ofs_names)
      @_raw_names_with_io = @_io.read_bytes_full
      _io__raw_names_with_io = Kaitai::Struct::Stream.new(@_raw_names_with_io)
      @names_with_io = BytesWithIo.new(_io__raw_names_with_io)
      @_io.seek(_pos)
      @names_with_io
    end

    ##
    # Storage area for the names of all resources.
    def names
      return @names unless @names.nil?
      @names = names_with_io.data
      @names
    end

    ##
    # Reserved space for a copy of the resource file header.
    attr_reader :reserved_file_header_copy

    ##
    # Reserved space for a handle to the next loaded resource map in memory.
    attr_reader :reserved_next_resource_map_handle

    ##
    # Reserved space for the resource file's file reference number.
    attr_reader :reserved_file_reference_number

    ##
    # The resource file's attributes.
    attr_reader :file_attributes

    ##
    # Offset of the resource type list,
    # from the start of the resource map.
    # 
    # In practice,
    # this should always be `sizeof<resource_map>`,
    # i. e. the resource type list should directly follow the resource map.
    attr_reader :ofs_type_list

    ##
    # Offset of the resource name area,
    # from the start of the resource map.
    attr_reader :ofs_names
    attr_reader :_raw_file_attributes
    attr_reader :_raw_type_list_and_reference_lists
    attr_reader :_raw_names_with_io
  end

  ##
  # Use `data_blocks` instead,
  # unless you need access to this instance's `_io`.
  def data_blocks_with_io
    return @data_blocks_with_io unless @data_blocks_with_io.nil?
    _pos = @_io.pos
    @_io.seek(header.ofs_data_blocks)
    @_raw_data_blocks_with_io = @_io.read_bytes(header.len_data_blocks)
    _io__raw_data_blocks_with_io = Kaitai::Struct::Stream.new(@_raw_data_blocks_with_io)
    @data_blocks_with_io = BytesWithIo.new(_io__raw_data_blocks_with_io)
    @_io.seek(_pos)
    @data_blocks_with_io
  end

  ##
  # Storage area for the data blocks of all resources.
  # 
  # These data blocks are not required to appear in any particular order,
  # and there may be unused space between and around them.
  # 
  # In practice,
  # the data blocks in newly created resource files are usually contiguous.
  # When existing resources are shortened,
  # the Mac OS resource manager leaves unused space where the now removed resource data was,
  # as this is quicker than moving the following resource data into the newly freed space.
  # Such unused space may be cleaned up later when the resource manager "compacts" the resource file,
  # which happens when resources are removed entirely,
  # or when resources are added or grown so that more space is needed in the data area.
  def data_blocks
    return @data_blocks unless @data_blocks.nil?
    @data_blocks = data_blocks_with_io.data
    @data_blocks
  end

  ##
  # The resource file's resource map.
  def resource_map
    return @resource_map unless @resource_map.nil?
    _pos = @_io.pos
    @_io.seek(header.ofs_resource_map)
    @_raw_resource_map = @_io.read_bytes(header.len_resource_map)
    _io__raw_resource_map = Kaitai::Struct::Stream.new(@_raw_resource_map)
    @resource_map = ResourceMap.new(_io__raw_resource_map, self, @_root)
    @_io.seek(_pos)
    @resource_map
  end

  ##
  # The resource file's header information.
  attr_reader :header

  ##
  # System-reserved data area.
  # This field can generally be ignored when reading and writing.
  # 
  # This field is used by the Classic Mac OS Finder as temporary storage space.
  # It usually contains parts of the file metadata (name, type/creator code, etc.).
  # Any existing data in this field is ignored and overwritten.
  # 
  # In resource files written by Mac OS X,
  # this field is set to all zero bytes.
  attr_reader :system_data

  ##
  # Application-specific data area.
  # This field can generally be ignored when reading and writing.
  # 
  # According to early revisions of Inside Macintosh,
  # this field is "available for application data".
  # In practice, it is almost never used for this purpose,
  # and usually contains only junk data.
  # 
  # In resource files written by Mac OS X,
  # this field is set to all zero bytes.
  attr_reader :application_data
  attr_reader :_raw_data_blocks_with_io
  attr_reader :_raw_resource_map
end
