# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.9')
  raise "Incompatible Kaitai Struct Ruby API: 0.9 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# A native file format of NT-MDT scientific software. Usually contains
# any of:
# 
# * [Scanning probe](https://en.wikipedia.org/wiki/Scanning_probe_microscopy) microscopy scans and spectra
# * [Raman spectra](https://en.wikipedia.org/wiki/Raman_spectroscopy)
# * results of their analysis
# 
# Some examples of mdt files can be downloaded at:
# 
# * https://www.ntmdt-si.ru/resources/scan-gallery
# * http://callistosoft.narod.ru/Resources/Mdt.zip
# @see https://svn.code.sf.net/p/gwyddion/code/trunk/gwyddion/modules/file/nt-mdt.c Source
class NtMdt < Kaitai::Struct::Struct

  ADC_MODE = {
    0 => :adc_mode_height,
    1 => :adc_mode_dfl,
    2 => :adc_mode_lateral_f,
    3 => :adc_mode_bias_v,
    4 => :adc_mode_current,
    5 => :adc_mode_fb_out,
    6 => :adc_mode_mag,
    7 => :adc_mode_mag_sin,
    8 => :adc_mode_mag_cos,
    9 => :adc_mode_rms,
    10 => :adc_mode_calc_mag,
    11 => :adc_mode_phase1,
    12 => :adc_mode_phase2,
    13 => :adc_mode_calc_phase,
    14 => :adc_mode_ex1,
    15 => :adc_mode_ex2,
    16 => :adc_mode_hv_x,
    17 => :adc_mode_hv_y,
    18 => :adc_mode_snap_back,
    255 => :adc_mode_false,
  }
  I__ADC_MODE = ADC_MODE.invert

  XML_SCAN_LOCATION = {
    0 => :xml_scan_location_hlt,
    1 => :xml_scan_location_hlb,
    2 => :xml_scan_location_hrt,
    3 => :xml_scan_location_hrb,
    4 => :xml_scan_location_vlt,
    5 => :xml_scan_location_vlb,
    6 => :xml_scan_location_vrt,
    7 => :xml_scan_location_vrb,
  }
  I__XML_SCAN_LOCATION = XML_SCAN_LOCATION.invert

  DATA_TYPE = {
    -65544 => :data_type_floatfix,
    -16138 => :data_type_float80,
    -13320 => :data_type_float64,
    -9990 => :data_type_float48,
    -5892 => :data_type_float32,
    -8 => :data_type_int64,
    -4 => :data_type_int32,
    -2 => :data_type_int16,
    -1 => :data_type_int8,
    0 => :data_type_unknown0,
    1 => :data_type_uint8,
    2 => :data_type_uint16,
    4 => :data_type_uint32,
    8 => :data_type_uint64,
  }
  I__DATA_TYPE = DATA_TYPE.invert

  XML_PARAM_TYPE = {
    0 => :xml_param_type_none,
    1 => :xml_param_type_laser_wavelength,
    2 => :xml_param_type_units,
    255 => :xml_param_type_data_array,
  }
  I__XML_PARAM_TYPE = XML_PARAM_TYPE.invert

  SPM_MODE = {
    0 => :spm_mode_constant_force,
    1 => :spm_mode_contact_constant_height,
    2 => :spm_mode_contact_error,
    3 => :spm_mode_lateral_force,
    4 => :spm_mode_force_modulation,
    5 => :spm_mode_spreading_resistance_imaging,
    6 => :spm_mode_semicontact_topography,
    7 => :spm_mode_semicontact_error,
    8 => :spm_mode_phase_contrast,
    9 => :spm_mode_ac_magnetic_force,
    10 => :spm_mode_dc_magnetic_force,
    11 => :spm_mode_electrostatic_force,
    12 => :spm_mode_capacitance_contrast,
    13 => :spm_mode_kelvin_probe,
    14 => :spm_mode_constant_current,
    15 => :spm_mode_barrier_height,
    16 => :spm_mode_constant_height,
    17 => :spm_mode_afam,
    18 => :spm_mode_contact_efm,
    19 => :spm_mode_shear_force_topography,
    20 => :spm_mode_sfom,
    21 => :spm_mode_contact_capacitance,
    22 => :spm_mode_snom_transmission,
    23 => :spm_mode_snom_reflection,
    24 => :spm_mode_snom_all,
    25 => :spm_mode_snom,
  }
  I__SPM_MODE = SPM_MODE.invert

  UNIT = {
    -10 => :unit_raman_shift,
    -9 => :unit_reserved0,
    -8 => :unit_reserved1,
    -7 => :unit_reserved2,
    -6 => :unit_reserved3,
    -5 => :unit_meter,
    -4 => :unit_centi_meter,
    -3 => :unit_milli_meter,
    -2 => :unit_micro_meter,
    -1 => :unit_nano_meter,
    0 => :unit_angstrom,
    1 => :unit_nano_ampere,
    2 => :unit_volt,
    3 => :unit_none,
    4 => :unit_kilo_hertz,
    5 => :unit_degrees,
    6 => :unit_percent,
    7 => :unit_celsius_degree,
    8 => :unit_volt_high,
    9 => :unit_second,
    10 => :unit_milli_second,
    11 => :unit_micro_second,
    12 => :unit_nano_second,
    13 => :unit_counts,
    14 => :unit_pixels,
    15 => :unit_reserved_sfom0,
    16 => :unit_reserved_sfom1,
    17 => :unit_reserved_sfom2,
    18 => :unit_reserved_sfom3,
    19 => :unit_reserved_sfom4,
    20 => :unit_ampere2,
    21 => :unit_milli_ampere,
    22 => :unit_micro_ampere,
    23 => :unit_nano_ampere2,
    24 => :unit_pico_ampere,
    25 => :unit_volt2,
    26 => :unit_milli_volt,
    27 => :unit_micro_volt,
    28 => :unit_nano_volt,
    29 => :unit_pico_volt,
    30 => :unit_newton,
    31 => :unit_milli_newton,
    32 => :unit_micro_newton,
    33 => :unit_nano_newton,
    34 => :unit_pico_newton,
    35 => :unit_reserved_dos0,
    36 => :unit_reserved_dos1,
    37 => :unit_reserved_dos2,
    38 => :unit_reserved_dos3,
    39 => :unit_reserved_dos4,
  }
  I__UNIT = UNIT.invert

  SPM_TECHNIQUE = {
    0 => :spm_technique_contact_mode,
    1 => :spm_technique_semicontact_mode,
    2 => :spm_technique_tunnel_current,
    3 => :spm_technique_snom,
  }
  I__SPM_TECHNIQUE = SPM_TECHNIQUE.invert

  CONSTS = {
    8 => :consts_frame_mode_size,
    22 => :consts_frame_header_size,
    30 => :consts_axis_scales_size,
    32 => :consts_file_header_size,
    38 => :consts_spectro_vars_min_size,
    77 => :consts_scan_vars_min_size,
  }
  I__CONSTS = CONSTS.invert
  def initialize(_io, _parent = nil, _root = self)
    super(_io, _parent, _root)
    _read
  end

  def _read
    @signature = @_io.read_bytes(4)
    raise Kaitai::Struct::ValidationNotEqualError.new([1, 176, 147, 255].pack('C*'), signature, _io, "/seq/0") if not signature == [1, 176, 147, 255].pack('C*')
    @size = @_io.read_u4le
    @reserved0 = @_io.read_bytes(4)
    @last_frame = @_io.read_u2le
    @reserved1 = @_io.read_bytes(18)
    @wrond_doc = @_io.read_bytes(1)
    @_raw_frames = @_io.read_bytes(size)
    _io__raw_frames = Kaitai::Struct::Stream.new(@_raw_frames)
    @frames = Framez.new(_io__raw_frames, self, @_root)
    self
  end
  class Uuid < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @data = Array.new(16)
      (16).times { |i|
        @data[i] = @_io.read_u1
      }
      self
    end
    attr_reader :data
  end
  class Framez < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @frames = Array.new((_root.last_frame + 1))
      ((_root.last_frame + 1)).times { |i|
        @frames[i] = Frame.new(@_io, self, @_root)
      }
      self
    end
    attr_reader :frames
  end
  class Frame < Kaitai::Struct::Struct

    FRAME_TYPE = {
      0 => :frame_type_scanned,
      1 => :frame_type_spectroscopy,
      3 => :frame_type_text,
      105 => :frame_type_old_mda,
      106 => :frame_type_mda,
      107 => :frame_type_palette,
      190 => :frame_type_curves_new,
      201 => :frame_type_curves,
    }
    I__FRAME_TYPE = FRAME_TYPE.invert
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @size = @_io.read_u4le
      @_raw_main = @_io.read_bytes((size - 4))
      _io__raw_main = Kaitai::Struct::Stream.new(@_raw_main)
      @main = FrameMain.new(_io__raw_main, self, @_root)
      self
    end
    class Dots < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = self)
        super(_io, _parent, _root)
        _read
      end

      def _read
        @fm_ndots = @_io.read_u2le
        if fm_ndots > 0
          @coord_header = DotsHeader.new(@_io, self, @_root)
        end
        @coordinates = Array.new(fm_ndots)
        (fm_ndots).times { |i|
          @coordinates[i] = DotsData.new(@_io, self, @_root)
        }
        @data = Array.new(fm_ndots)
        (fm_ndots).times { |i|
          @data[i] = DataLinez.new(@_io, self, @_root, i)
        }
        self
      end
      class DotsHeader < Kaitai::Struct::Struct
        def initialize(_io, _parent = nil, _root = self)
          super(_io, _parent, _root)
          _read
        end

        def _read
          @header_size = @_io.read_s4le
          @_raw_header = @_io.read_bytes(header_size)
          _io__raw_header = Kaitai::Struct::Stream.new(@_raw_header)
          @header = Header.new(_io__raw_header, self, @_root)
          self
        end
        class Header < Kaitai::Struct::Struct
          def initialize(_io, _parent = nil, _root = self)
            super(_io, _parent, _root)
            _read
          end

          def _read
            @coord_size = @_io.read_s4le
            @version = @_io.read_s4le
            @xyunits = Kaitai::Struct::Stream::resolve_enum(NtMdt::UNIT, @_io.read_s2le)
            self
          end
          attr_reader :coord_size
          attr_reader :version
          attr_reader :xyunits
        end
        attr_reader :header_size
        attr_reader :header
        attr_reader :_raw_header
      end
      class DotsData < Kaitai::Struct::Struct
        def initialize(_io, _parent = nil, _root = self)
          super(_io, _parent, _root)
          _read
        end

        def _read
          @coord_x = @_io.read_f4le
          @coord_y = @_io.read_f4le
          @forward_size = @_io.read_s4le
          @backward_size = @_io.read_s4le
          self
        end
        attr_reader :coord_x
        attr_reader :coord_y
        attr_reader :forward_size
        attr_reader :backward_size
      end
      class DataLinez < Kaitai::Struct::Struct
        def initialize(_io, _parent = nil, _root = self, index)
          super(_io, _parent, _root)
          @index = index
          _read
        end

        def _read
          @forward = Array.new(_parent.coordinates[index].forward_size)
          (_parent.coordinates[index].forward_size).times { |i|
            @forward[i] = @_io.read_s2le
          }
          @backward = Array.new(_parent.coordinates[index].backward_size)
          (_parent.coordinates[index].backward_size).times { |i|
            @backward[i] = @_io.read_s2le
          }
          self
        end
        attr_reader :forward
        attr_reader :backward
        attr_reader :index
      end
      attr_reader :fm_ndots
      attr_reader :coord_header
      attr_reader :coordinates
      attr_reader :data
    end
    class FrameMain < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = self)
        super(_io, _parent, _root)
        _read
      end

      def _read
        @type = Kaitai::Struct::Stream::resolve_enum(NtMdt::Frame::FRAME_TYPE, @_io.read_u2le)
        @version = Version.new(@_io, self, @_root)
        @date_time = DateTime.new(@_io, self, @_root)
        @var_size = @_io.read_u2le
        case type
        when :frame_type_mda
          @_raw_frame_data = @_io.read_bytes_full
          _io__raw_frame_data = Kaitai::Struct::Stream.new(@_raw_frame_data)
          @frame_data = FdMetaData.new(_io__raw_frame_data, self, @_root)
        when :frame_type_curves_new
          @_raw_frame_data = @_io.read_bytes_full
          _io__raw_frame_data = Kaitai::Struct::Stream.new(@_raw_frame_data)
          @frame_data = FdCurvesNew.new(_io__raw_frame_data, self, @_root)
        when :frame_type_curves
          @_raw_frame_data = @_io.read_bytes_full
          _io__raw_frame_data = Kaitai::Struct::Stream.new(@_raw_frame_data)
          @frame_data = FdSpectroscopy.new(_io__raw_frame_data, self, @_root)
        when :frame_type_spectroscopy
          @_raw_frame_data = @_io.read_bytes_full
          _io__raw_frame_data = Kaitai::Struct::Stream.new(@_raw_frame_data)
          @frame_data = FdSpectroscopy.new(_io__raw_frame_data, self, @_root)
        when :frame_type_scanned
          @_raw_frame_data = @_io.read_bytes_full
          _io__raw_frame_data = Kaitai::Struct::Stream.new(@_raw_frame_data)
          @frame_data = FdScanned.new(_io__raw_frame_data, self, @_root)
        else
          @frame_data = @_io.read_bytes_full
        end
        self
      end

      ##
      # h_what
      attr_reader :type
      attr_reader :version
      attr_reader :date_time

      ##
      # h_am, v6 and older only
      attr_reader :var_size

      ##
      # 
      attr_reader :frame_data
      attr_reader :_raw_frame_data
    end
    class FdCurvesNew < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = self)
        super(_io, _parent, _root)
        _read
      end

      def _read
        @block_count = @_io.read_u4le
        @blocks_headers = Array.new(block_count)
        (block_count).times { |i|
          @blocks_headers[i] = BlockDescr.new(@_io, self, @_root)
        }
        @blocks_names = Array.new(block_count)
        (block_count).times { |i|
          @blocks_names[i] = (@_io.read_bytes(blocks_headers[i].name_len)).force_encoding("UTF-8")
        }
        @blocks_data = Array.new(block_count)
        (block_count).times { |i|
          @blocks_data[i] = @_io.read_bytes(blocks_headers[i].len)
        }
        self
      end
      class BlockDescr < Kaitai::Struct::Struct
        def initialize(_io, _parent = nil, _root = self)
          super(_io, _parent, _root)
          _read
        end

        def _read
          @name_len = @_io.read_u4le
          @len = @_io.read_u4le
          self
        end
        attr_reader :name_len
        attr_reader :len
      end
      attr_reader :block_count
      attr_reader :blocks_headers
      attr_reader :blocks_names
      attr_reader :blocks_data
    end
    class FdMetaData < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = self)
        super(_io, _parent, _root)
        _read
      end

      def _read
        @head_size = @_io.read_u4le
        @tot_len = @_io.read_u4le
        @guids = Array.new(2)
        (2).times { |i|
          @guids[i] = Uuid.new(@_io, self, @_root)
        }
        @frame_status = @_io.read_bytes(4)
        @name_size = @_io.read_u4le
        @comm_size = @_io.read_u4le
        @view_info_size = @_io.read_u4le
        @spec_size = @_io.read_u4le
        @source_info_size = @_io.read_u4le
        @var_size = @_io.read_u4le
        @data_offset = @_io.read_u4le
        @data_size = @_io.read_u4le
        @title = (@_io.read_bytes(name_size)).force_encoding("UTF-8")
        @xml = (@_io.read_bytes(comm_size)).force_encoding("UTF-8")
        @struct_len = @_io.read_u4le
        @array_size = @_io.read_u8le
        @cell_size = @_io.read_u4le
        @n_dimensions = @_io.read_u4le
        @n_mesurands = @_io.read_u4le
        @dimensions = Array.new(n_dimensions)
        (n_dimensions).times { |i|
          @dimensions[i] = Calibration.new(@_io, self, @_root)
        }
        @mesurands = Array.new(n_mesurands)
        (n_mesurands).times { |i|
          @mesurands[i] = Calibration.new(@_io, self, @_root)
        }
        self
      end
      class Image < Kaitai::Struct::Struct
        def initialize(_io, _parent = nil, _root = self)
          super(_io, _parent, _root)
          _read
        end

        def _read
          @image = []
          i = 0
          while not @_io.eof?
            @image << Vec.new(@_io, self, @_root)
            i += 1
          end
          self
        end
        class Vec < Kaitai::Struct::Struct
          def initialize(_io, _parent = nil, _root = self)
            super(_io, _parent, _root)
            _read
          end

          def _read
            @items = Array.new(_parent._parent.n_mesurands)
            (_parent._parent.n_mesurands).times { |i|
              case _parent._parent.mesurands[i].data_type
              when :data_type_uint64
                @items[i] = @_io.read_u8le
              when :data_type_uint8
                @items[i] = @_io.read_u1
              when :data_type_float32
                @items[i] = @_io.read_f4le
              when :data_type_int8
                @items[i] = @_io.read_s1
              when :data_type_uint16
                @items[i] = @_io.read_u2le
              when :data_type_int64
                @items[i] = @_io.read_s8le
              when :data_type_uint32
                @items[i] = @_io.read_u4le
              when :data_type_float64
                @items[i] = @_io.read_f8le
              when :data_type_int16
                @items[i] = @_io.read_s2le
              when :data_type_int32
                @items[i] = @_io.read_s4le
              end
            }
            self
          end
          attr_reader :items
        end
        attr_reader :image
      end
      class Calibration < Kaitai::Struct::Struct
        def initialize(_io, _parent = nil, _root = self)
          super(_io, _parent, _root)
          _read
        end

        def _read
          @len_tot = @_io.read_u4le
          @len_struct = @_io.read_u4le
          @len_name = @_io.read_u4le
          @len_comment = @_io.read_u4le
          @len_unit = @_io.read_u4le
          @si_unit = @_io.read_u8le
          @accuracy = @_io.read_f8le
          @function_id_and_dimensions = @_io.read_u8le
          @bias = @_io.read_f8le
          @scale = @_io.read_f8le
          @min_index = @_io.read_u8le
          @max_index = @_io.read_u8le
          @data_type = Kaitai::Struct::Stream::resolve_enum(NtMdt::DATA_TYPE, @_io.read_s4le)
          @len_author = @_io.read_u4le
          @name = (@_io.read_bytes(len_name)).force_encoding("utf-8")
          @comment = (@_io.read_bytes(len_comment)).force_encoding("utf-8")
          @unit = (@_io.read_bytes(len_unit)).force_encoding("utf-8")
          @author = (@_io.read_bytes(len_author)).force_encoding("utf-8")
          self
        end
        def count
          return @count unless @count.nil?
          @count = ((max_index - min_index) + 1)
          @count
        end
        attr_reader :len_tot
        attr_reader :len_struct
        attr_reader :len_name
        attr_reader :len_comment
        attr_reader :len_unit
        attr_reader :si_unit
        attr_reader :accuracy
        attr_reader :function_id_and_dimensions
        attr_reader :bias
        attr_reader :scale
        attr_reader :min_index
        attr_reader :max_index
        attr_reader :data_type
        attr_reader :len_author
        attr_reader :name
        attr_reader :comment
        attr_reader :unit
        attr_reader :author
      end
      def image
        return @image unless @image.nil?
        _pos = @_io.pos
        @_io.seek(data_offset)
        @_raw_image = @_io.read_bytes(data_size)
        _io__raw_image = Kaitai::Struct::Stream.new(@_raw_image)
        @image = Image.new(_io__raw_image, self, @_root)
        @_io.seek(_pos)
        @image
      end
      attr_reader :head_size
      attr_reader :tot_len
      attr_reader :guids
      attr_reader :frame_status
      attr_reader :name_size
      attr_reader :comm_size
      attr_reader :view_info_size
      attr_reader :spec_size
      attr_reader :source_info_size
      attr_reader :var_size
      attr_reader :data_offset
      attr_reader :data_size
      attr_reader :title
      attr_reader :xml
      attr_reader :struct_len
      attr_reader :array_size
      attr_reader :cell_size
      attr_reader :n_dimensions
      attr_reader :n_mesurands
      attr_reader :dimensions
      attr_reader :mesurands
      attr_reader :_raw_image
    end
    class FdSpectroscopy < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = self)
        super(_io, _parent, _root)
        _read
      end

      def _read
        @_raw_vars = @_io.read_bytes(_parent.var_size)
        _io__raw_vars = Kaitai::Struct::Stream.new(@_raw_vars)
        @vars = Vars.new(_io__raw_vars, self, @_root)
        @fm_mode = @_io.read_u2le
        @fm_xres = @_io.read_u2le
        @fm_yres = @_io.read_u2le
        @dots = Dots.new(@_io, self, @_root)
        @data = Array.new((fm_xres * fm_yres))
        ((fm_xres * fm_yres)).times { |i|
          @data[i] = @_io.read_s2le
        }
        @title = Title.new(@_io, self, @_root)
        @xml = Xml.new(@_io, self, @_root)
        self
      end
      class Vars < Kaitai::Struct::Struct
        def initialize(_io, _parent = nil, _root = self)
          super(_io, _parent, _root)
          _read
        end

        def _read
          @x_scale = AxisScale.new(@_io, self, @_root)
          @y_scale = AxisScale.new(@_io, self, @_root)
          @z_scale = AxisScale.new(@_io, self, @_root)
          @sp_mode = @_io.read_u2le
          @sp_filter = @_io.read_u2le
          @u_begin = @_io.read_f4le
          @u_end = @_io.read_f4le
          @z_up = @_io.read_s2le
          @z_down = @_io.read_s2le
          @sp_averaging = @_io.read_u2le
          @sp_repeat = @_io.read_u1
          @sp_back = @_io.read_u1
          @sp_4nx = @_io.read_s2le
          @sp_osc = @_io.read_u1
          @sp_n4 = @_io.read_u1
          @sp_4x0 = @_io.read_f4le
          @sp_4xr = @_io.read_f4le
          @sp_4u = @_io.read_s2le
          @sp_4i = @_io.read_s2le
          @sp_nx = @_io.read_s2le
          self
        end
        attr_reader :x_scale
        attr_reader :y_scale
        attr_reader :z_scale
        attr_reader :sp_mode
        attr_reader :sp_filter
        attr_reader :u_begin
        attr_reader :u_end
        attr_reader :z_up
        attr_reader :z_down
        attr_reader :sp_averaging
        attr_reader :sp_repeat
        attr_reader :sp_back
        attr_reader :sp_4nx
        attr_reader :sp_osc
        attr_reader :sp_n4
        attr_reader :sp_4x0
        attr_reader :sp_4xr
        attr_reader :sp_4u
        attr_reader :sp_4i
        attr_reader :sp_nx
      end
      attr_reader :vars
      attr_reader :fm_mode
      attr_reader :fm_xres
      attr_reader :fm_yres
      attr_reader :dots
      attr_reader :data
      attr_reader :title
      attr_reader :xml
      attr_reader :_raw_vars
    end
    class DateTime < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = self)
        super(_io, _parent, _root)
        _read
      end

      def _read
        @date = Date.new(@_io, self, @_root)
        @time = Time.new(@_io, self, @_root)
        self
      end
      class Date < Kaitai::Struct::Struct
        def initialize(_io, _parent = nil, _root = self)
          super(_io, _parent, _root)
          _read
        end

        def _read
          @year = @_io.read_u2le
          @month = @_io.read_u2le
          @day = @_io.read_u2le
          self
        end

        ##
        # h_yea
        attr_reader :year

        ##
        # h_mon
        attr_reader :month

        ##
        # h_day
        attr_reader :day
      end
      class Time < Kaitai::Struct::Struct
        def initialize(_io, _parent = nil, _root = self)
          super(_io, _parent, _root)
          _read
        end

        def _read
          @hour = @_io.read_u2le
          @min = @_io.read_u2le
          @sec = @_io.read_u2le
          self
        end

        ##
        # h_h
        attr_reader :hour

        ##
        # h_m
        attr_reader :min

        ##
        # h_s
        attr_reader :sec
      end
      attr_reader :date
      attr_reader :time
    end
    class AxisScale < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = self)
        super(_io, _parent, _root)
        _read
      end

      def _read
        @offset = @_io.read_f4le
        @step = @_io.read_f4le
        @unit = Kaitai::Struct::Stream::resolve_enum(NtMdt::UNIT, @_io.read_s2le)
        self
      end

      ##
      # x_scale->offset = gwy_get_gfloat_le(&p);# r0 (physical units)
      attr_reader :offset

      ##
      # x_scale->step = gwy_get_gfloat_le(&p); r (physical units) x_scale->step = fabs(x_scale->step); if (!x_scale->step) {
      #   g_warning("x_scale.step == 0, changing to 1");
      #   x_scale->step = 1.0;
      # }
      attr_reader :step

      ##
      # U
      attr_reader :unit
    end
    class FdScanned < Kaitai::Struct::Struct

      MODE = {
        0 => :mode_stm,
        1 => :mode_afm,
        2 => :mode_unknown2,
        3 => :mode_unknown3,
        4 => :mode_unknown4,
      }
      I__MODE = MODE.invert

      INPUT_SIGNAL = {
        0 => :input_signal_extension_slot,
        1 => :input_signal_bias_v,
        2 => :input_signal_ground,
      }
      I__INPUT_SIGNAL = INPUT_SIGNAL.invert

      LIFT_MODE = {
        0 => :lift_mode_step,
        1 => :lift_mode_fine,
        2 => :lift_mode_slope,
      }
      I__LIFT_MODE = LIFT_MODE.invert
      def initialize(_io, _parent = nil, _root = self)
        super(_io, _parent, _root)
        _read
      end

      def _read
        @_raw_vars = @_io.read_bytes(_parent.var_size)
        _io__raw_vars = Kaitai::Struct::Stream.new(@_raw_vars)
        @vars = Vars.new(_io__raw_vars, self, @_root)
        if false
          @orig_format = @_io.read_u4le
        end
        if false
          @tune = Kaitai::Struct::Stream::resolve_enum(LIFT_MODE, @_io.read_u4le)
        end
        if false
          @feedback_gain = @_io.read_f8le
        end
        if false
          @dac_scale = @_io.read_s4le
        end
        if false
          @overscan = @_io.read_s4le
        end
        @fm_mode = @_io.read_u2le
        @fm_xres = @_io.read_u2le
        @fm_yres = @_io.read_u2le
        @dots = Dots.new(@_io, self, @_root)
        @image = Array.new((fm_xres * fm_yres))
        ((fm_xres * fm_yres)).times { |i|
          @image[i] = @_io.read_s2le
        }
        @title = Title.new(@_io, self, @_root)
        @xml = Xml.new(@_io, self, @_root)
        self
      end
      class Vars < Kaitai::Struct::Struct
        def initialize(_io, _parent = nil, _root = self)
          super(_io, _parent, _root)
          _read
        end

        def _read
          @x_scale = AxisScale.new(@_io, self, @_root)
          @y_scale = AxisScale.new(@_io, self, @_root)
          @z_scale = AxisScale.new(@_io, self, @_root)
          @channel_index = Kaitai::Struct::Stream::resolve_enum(NtMdt::ADC_MODE, @_io.read_u1)
          @mode = Kaitai::Struct::Stream::resolve_enum(NtMdt::Frame::FdScanned::MODE, @_io.read_u1)
          @xres = @_io.read_u2le
          @yres = @_io.read_u2le
          @ndacq = @_io.read_u2le
          @step_length = @_io.read_f4le
          @adt = @_io.read_u2le
          @adc_gain_amp_log10 = @_io.read_u1
          @adc_index = @_io.read_u1
          @input_signal_or_version = @_io.read_u1
          @substr_plane_order_or_pass_num = @_io.read_u1
          @scan_dir = ScanDir.new(@_io, self, @_root)
          @power_of_2 = @_io.read_u1
          @velocity = @_io.read_f4le
          @setpoint = @_io.read_f4le
          @bias_voltage = @_io.read_f4le
          @draw = @_io.read_u1
          @reserved = @_io.read_u1
          @xoff = @_io.read_s4le
          @yoff = @_io.read_s4le
          @nl_corr = @_io.read_u1
          self
        end
        attr_reader :x_scale
        attr_reader :y_scale
        attr_reader :z_scale

        ##
        # s_mode
        attr_reader :channel_index

        ##
        # s_dev
        attr_reader :mode

        ##
        # s_nx
        attr_reader :xres

        ##
        # s_ny
        attr_reader :yres

        ##
        # Step (DAC)
        attr_reader :ndacq

        ##
        # s_rs in Angstrom's (Angstrom*gwy_get_gfloat_le(&p))
        attr_reader :step_length

        ##
        # s_adt
        attr_reader :adt

        ##
        # s_adc_a
        attr_reader :adc_gain_amp_log10

        ##
        # ADC index
        attr_reader :adc_index

        ##
        # MDTInputSignal smp_in; s_smp_in (for signal) s_8xx (for version)
        attr_reader :input_signal_or_version

        ##
        # s_spl or z_03
        attr_reader :substr_plane_order_or_pass_num

        ##
        # s_xy TODO: interpretation
        attr_reader :scan_dir

        ##
        # s_2n (bool)
        attr_reader :power_of_2

        ##
        # s_vel (Angstrom/second)
        attr_reader :velocity

        ##
        # s_i0
        attr_reader :setpoint

        ##
        # s_ut
        attr_reader :bias_voltage

        ##
        # s_draw (bool)
        attr_reader :draw
        attr_reader :reserved

        ##
        # s_x00 (in DAC quants)
        attr_reader :xoff

        ##
        # s_y00 (in DAC quants)
        attr_reader :yoff

        ##
        # s_cor (bool)
        attr_reader :nl_corr
      end
      class Dot < Kaitai::Struct::Struct
        def initialize(_io, _parent = nil, _root = self)
          super(_io, _parent, _root)
          _read
        end

        def _read
          @x = @_io.read_s2le
          @y = @_io.read_s2le
          self
        end
        attr_reader :x
        attr_reader :y
      end
      class ScanDir < Kaitai::Struct::Struct
        def initialize(_io, _parent = nil, _root = self)
          super(_io, _parent, _root)
          _read
        end

        def _read
          @unkn = @_io.read_bits_int_be(4)
          @double_pass = @_io.read_bits_int_be(1) != 0
          @bottom = @_io.read_bits_int_be(1) != 0
          @left = @_io.read_bits_int_be(1) != 0
          @horizontal = @_io.read_bits_int_be(1) != 0
          self
        end
        attr_reader :unkn
        attr_reader :double_pass

        ##
        # Bottom - 1 Top - 0
        attr_reader :bottom

        ##
        # Left - 1 Right - 0
        attr_reader :left

        ##
        # Horizontal - 1 Vertical - 0
        attr_reader :horizontal
      end
      attr_reader :vars

      ##
      # s_oem
      attr_reader :orig_format

      ##
      # z_tune
      attr_reader :tune

      ##
      # s_fbg
      attr_reader :feedback_gain

      ##
      # s_s
      attr_reader :dac_scale

      ##
      # s_xov (in %)
      attr_reader :overscan

      ##
      # m_mode
      attr_reader :fm_mode

      ##
      # m_nx
      attr_reader :fm_xres

      ##
      # m_ny
      attr_reader :fm_yres
      attr_reader :dots
      attr_reader :image
      attr_reader :title
      attr_reader :xml
      attr_reader :_raw_vars
    end

    ##
    # h_sz
    attr_reader :size
    attr_reader :main
    attr_reader :_raw_main
  end
  class Version < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @minor = @_io.read_u1
      @major = @_io.read_u1
      self
    end
    attr_reader :minor
    attr_reader :major
  end
  class Xml < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @xml_len = @_io.read_u4le
      @xml = (@_io.read_bytes(xml_len)).force_encoding("UTF-16LE")
      self
    end
    attr_reader :xml_len
    attr_reader :xml
  end
  class Title < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @title_len = @_io.read_u4le
      @title = (@_io.read_bytes(title_len)).force_encoding("cp1251")
      self
    end
    attr_reader :title_len
    attr_reader :title
  end
  attr_reader :signature

  ##
  # File size (w/o header)
  attr_reader :size
  attr_reader :reserved0
  attr_reader :last_frame
  attr_reader :reserved1

  ##
  # documentation specifies 32 bytes long header, but zeroth frame starts at 33th byte in reality
  attr_reader :wrond_doc
  attr_reader :frames
  attr_reader :_raw_frames
end
