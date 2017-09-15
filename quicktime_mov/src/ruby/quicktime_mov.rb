# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.7')
  raise "Incompatible Kaitai Struct Ruby API: 0.7 or later is required, but you have #{Kaitai::Struct::VERSION}"
end

class QuicktimeMov < Kaitai::Struct::Struct

  ATOM_TYPE = {
    1484026465 => :atom_type_xtra,
    1684631142 => :atom_type_dinf,
    1685218662 => :atom_type_dref,
    1701082227 => :atom_type_edts,
    1701606260 => :atom_type_elst,
    1718773093 => :atom_type_free,
    1718909296 => :atom_type_ftyp,
    1751411826 => :atom_type_hdlr,
    1768907891 => :atom_type_iods,
    1835295092 => :atom_type_mdat,
    1835296868 => :atom_type_mdhd,
    1835297121 => :atom_type_mdia,
    1835365473 => :atom_type_meta,
    1835626086 => :atom_type_minf,
    1836019558 => :atom_type_moof,
    1836019574 => :atom_type_moov,
    1836476516 => :atom_type_mvhd,
    1936549988 => :atom_type_smhd,
    1937007212 => :atom_type_stbl,
    1937007471 => :atom_type_stco,
    1937011555 => :atom_type_stsc,
    1937011556 => :atom_type_stsd,
    1937011578 => :atom_type_stsz,
    1937011827 => :atom_type_stts,
    1953196132 => :atom_type_tkhd,
    1953653094 => :atom_type_traf,
    1953653099 => :atom_type_trak,
    1953654118 => :atom_type_tref,
    1969517665 => :atom_type_udta,
    1986881636 => :atom_type_vmhd,
  }
  I__ATOM_TYPE = ATOM_TYPE.invert

  BRAND = {
    862401121 => :brand_x_3g2a,
    862414134 => :brand_x_3ge6,
    862414137 => :brand_x_3ge9,
    862414393 => :brand_x_3gf9,
    862414646 => :brand_x_3gg6,
    862414649 => :brand_x_3gg9,
    862414905 => :brand_x_3gh9,
    862416185 => :brand_x_3gm9,
    862416948 => :brand_x_3gp4,
    862416949 => :brand_x_3gp5,
    862416950 => :brand_x_3gp6,
    862416951 => :brand_x_3gp7,
    862416952 => :brand_x_3gp8,
    862416953 => :brand_x_3gp9,
    862417462 => :brand_x_3gr6,
    862417465 => :brand_x_3gr9,
    862417718 => :brand_x_3gs6,
    862417721 => :brand_x_3gs9,
    862417977 => :brand_x_3gt9,
    1095914057 => :brand_arri,
    1128351056 => :brand_caep,
    1128555891 => :brand_cdes,
    1244811312 => :brand_j2p0,
    1244811313 => :brand_j2p1,
    1279476039 => :brand_lcag,
    1295270176 => :brand_m4a,
    1295270432 => :brand_m4b,
    1295274016 => :brand_m4p,
    1295275552 => :brand_m4v,
    1296454477 => :brand_mfsm,
    1296520022 => :brand_mgsv,
    1297109065 => :brand_mppi,
    1297305174 => :brand_msnv,
    1380930387 => :brand_ross,
    1397047637 => :brand_seau,
    1397047883 => :brand_sebk,
    1480676931 => :brand_xavc,
    1635148593 => :brand_avc1,
    1650620525 => :brand_bbxm,
    1667330422 => :brand_caqv,
    1667458662 => :brand_ccff,
    1684090977 => :brand_da0a,
    1684090978 => :brand_da0b,
    1684091233 => :brand_da1a,
    1684091234 => :brand_da1b,
    1684091489 => :brand_da2a,
    1684091490 => :brand_da2b,
    1684091745 => :brand_da3a,
    1684091746 => :brand_da3b,
    1684108136 => :brand_dash,
    1684175153 => :brand_dby1,
    1684890161 => :brand_dmb1,
    1685286259 => :brand_dsms,
    1685467489 => :brand_dv1a,
    1685467490 => :brand_dv1b,
    1685467745 => :brand_dv2a,
    1685467746 => :brand_dv2b,
    1685468001 => :brand_dv3a,
    1685468002 => :brand_dv3b,
    1685484081 => :brand_dvr1,
    1685484593 => :brand_dvt1,
    1685614368 => :brand_dxo,
    1701671783 => :brand_emsg,
    1768321645 => :brand_ifrm,
    1769169714 => :brand_isc2,
    1769172786 => :brand_iso2,
    1769172787 => :brand_iso3,
    1769172788 => :brand_iso4,
    1769172789 => :brand_iso5,
    1769172790 => :brand_iso6,
    1769172845 => :brand_isom,
    1785737760 => :brand_jp2,
    1785752864 => :brand_jpm,
    1785754473 => :brand_jpsi,
    1785755680 => :brand_jpx,
    1785755746 => :brand_jpxb,
    1819112295 => :brand_lmsg,
    1835676275 => :brand_mj2s,
    1835692082 => :brand_mjp2,
    1836069425 => :brand_mp21,
    1836069937 => :brand_mp41,
    1836069938 => :brand_mp42,
    1836070705 => :brand_mp71,
    1836278888 => :brand_msdh,
    1836280184 => :brand_msix,
    1852402543 => :brand_niko,
    1868850022 => :brand_odcf,
    1869637170 => :brand_opf2,
    1869641778 => :brand_opx2,
    1885433441 => :brand_pana,
    1885955686 => :brand_piff,
    1886287465 => :brand_pnvi,
    1903435808 => :brand_qt,
    1919513464 => :brand_risx,
    1935963680 => :brand_sdv,
    1936027254 => :brand_senv,
    1936289139 => :brand_sims,
    1936290680 => :brand_sisx,
    1936946035 => :brand_ssss,
    1970697845 => :brand_uvvu,
  }
  I__BRAND = BRAND.invert
  def initialize(_io, _parent = nil, _root = self)
    super(_io, _parent, _root)
    _read
  end

  def _read
    @atoms = AtomList.new(@_io, self, @_root)
    self
  end
  class MvhdBody < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @version = @_io.read_u1
      @flags = @_io.read_bytes(3)
      @creation_time = @_io.read_u4be
      @modification_time = @_io.read_u4be
      @time_scale = @_io.read_u4be
      @duration = @_io.read_u4be
      @preferred_rate = Fixed32.new(@_io, self, @_root)
      @preferred_volume = Fixed16.new(@_io, self, @_root)
      @reserved1 = @_io.read_bytes(10)
      @matrix = @_io.read_bytes(36)
      @preview_time = @_io.read_u4be
      @preview_duration = @_io.read_u4be
      @poster_time = @_io.read_u4be
      @selection_time = @_io.read_u4be
      @selection_duration = @_io.read_u4be
      @current_time = @_io.read_u4be
      @next_track_id = @_io.read_u4be
      self
    end

    ##
    # Version of this movie header atom
    attr_reader :version
    attr_reader :flags
    attr_reader :creation_time
    attr_reader :modification_time

    ##
    # A time value that indicates the time scale for this movie—that is, the number of time units that pass per second in its time coordinate system. A time coordinate system that measures time in sixtieths of a second, for example, has a time scale of 60.
    attr_reader :time_scale

    ##
    # A time value that indicates the duration of the movie in time scale units. Note that this property is derived from the movie’s tracks. The value of this field corresponds to the duration of the longest track in the movie.
    attr_reader :duration

    ##
    # The rate at which to play this movie. A value of 1.0 indicates normal rate.
    attr_reader :preferred_rate

    ##
    # How loud to play this movie’s sound. A value of 1.0 indicates full volume.
    attr_reader :preferred_volume
    attr_reader :reserved1

    ##
    # A matrix shows how to map points from one coordinate space into another.
    attr_reader :matrix

    ##
    # The time value in the movie at which the preview begins.
    attr_reader :preview_time

    ##
    # The duration of the movie preview in movie time scale units.
    attr_reader :preview_duration

    ##
    # The time value of the time of the movie poster.
    attr_reader :poster_time

    ##
    # The time value for the start time of the current selection.
    attr_reader :selection_time

    ##
    # The duration of the current selection in movie time scale units.
    attr_reader :selection_duration

    ##
    # The time value for current time position within the movie.
    attr_reader :current_time

    ##
    # Indicates a value to use for the track ID number of the next track added to this movie. Note that 0 is not a valid track ID value.
    attr_reader :next_track_id
  end
  class FtypBody < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @major_brand = Kaitai::Struct::Stream::resolve_enum(BRAND, @_io.read_u4be)
      @minor_version = @_io.read_bytes(4)
      @compatible_brands = []
      i = 0
      while not @_io.eof?
        @compatible_brands << Kaitai::Struct::Stream::resolve_enum(BRAND, @_io.read_u4be)
        i += 1
      end
      self
    end
    attr_reader :major_brand
    attr_reader :minor_version
    attr_reader :compatible_brands
  end
  class Fixed32 < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @int_part = @_io.read_s2be
      @frac_part = @_io.read_u2be
      self
    end
    attr_reader :int_part
    attr_reader :frac_part
  end
  class Fixed16 < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @int_part = @_io.read_s1
      @frac_part = @_io.read_u1
      self
    end
    attr_reader :int_part
    attr_reader :frac_part
  end
  class Atom < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @len32 = @_io.read_u4be
      @atom_type = Kaitai::Struct::Stream::resolve_enum(ATOM_TYPE, @_io.read_u4be)
      if len32 == 1
        @len64 = @_io.read_u8be
      end
      case atom_type
      when :atom_type_stbl
        @_raw_body = @_io.read_bytes(len)
        io = Kaitai::Struct::Stream.new(@_raw_body)
        @body = AtomList.new(io, self, @_root)
      when :atom_type_moof
        @_raw_body = @_io.read_bytes(len)
        io = Kaitai::Struct::Stream.new(@_raw_body)
        @body = AtomList.new(io, self, @_root)
      when :atom_type_mvhd
        @_raw_body = @_io.read_bytes(len)
        io = Kaitai::Struct::Stream.new(@_raw_body)
        @body = MvhdBody.new(io, self, @_root)
      when :atom_type_minf
        @_raw_body = @_io.read_bytes(len)
        io = Kaitai::Struct::Stream.new(@_raw_body)
        @body = AtomList.new(io, self, @_root)
      when :atom_type_trak
        @_raw_body = @_io.read_bytes(len)
        io = Kaitai::Struct::Stream.new(@_raw_body)
        @body = AtomList.new(io, self, @_root)
      when :atom_type_traf
        @_raw_body = @_io.read_bytes(len)
        io = Kaitai::Struct::Stream.new(@_raw_body)
        @body = AtomList.new(io, self, @_root)
      when :atom_type_mdia
        @_raw_body = @_io.read_bytes(len)
        io = Kaitai::Struct::Stream.new(@_raw_body)
        @body = AtomList.new(io, self, @_root)
      when :atom_type_ftyp
        @_raw_body = @_io.read_bytes(len)
        io = Kaitai::Struct::Stream.new(@_raw_body)
        @body = FtypBody.new(io, self, @_root)
      when :atom_type_moov
        @_raw_body = @_io.read_bytes(len)
        io = Kaitai::Struct::Stream.new(@_raw_body)
        @body = AtomList.new(io, self, @_root)
      when :atom_type_tkhd
        @_raw_body = @_io.read_bytes(len)
        io = Kaitai::Struct::Stream.new(@_raw_body)
        @body = TkhdBody.new(io, self, @_root)
      when :atom_type_dinf
        @_raw_body = @_io.read_bytes(len)
        io = Kaitai::Struct::Stream.new(@_raw_body)
        @body = AtomList.new(io, self, @_root)
      else
        @body = @_io.read_bytes(len)
      end
      self
    end
    def len
      return @len unless @len.nil?
      @len = (len32 == 0 ? (_io.size - 8) : (len32 == 1 ? (len64 - 16) : (len32 - 8)))
      @len
    end
    attr_reader :len32
    attr_reader :atom_type
    attr_reader :len64
    attr_reader :body
    attr_reader :_raw_body
  end
  class TkhdBody < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @version = @_io.read_u1
      @flags = @_io.read_bytes(3)
      @creation_time = @_io.read_u4be
      @modification_time = @_io.read_u4be
      @track_id = @_io.read_u4be
      @reserved1 = @_io.read_bytes(4)
      @duration = @_io.read_u4be
      @reserved2 = @_io.read_bytes(8)
      @layer = @_io.read_u2be
      @alternative_group = @_io.read_u2be
      @volume = @_io.read_u2be
      @reserved3 = @_io.read_u2be
      @matrix = @_io.read_bytes(36)
      @width = Fixed32.new(@_io, self, @_root)
      @height = Fixed32.new(@_io, self, @_root)
      self
    end
    attr_reader :version
    attr_reader :flags
    attr_reader :creation_time
    attr_reader :modification_time

    ##
    # Integer that uniquely identifies the track. The value 0 cannot be used.
    attr_reader :track_id
    attr_reader :reserved1
    attr_reader :duration
    attr_reader :reserved2
    attr_reader :layer
    attr_reader :alternative_group
    attr_reader :volume
    attr_reader :reserved3
    attr_reader :matrix
    attr_reader :width
    attr_reader :height
  end
  class AtomList < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @items = []
      i = 0
      while not @_io.eof?
        @items << Atom.new(@_io, self, @_root)
        i += 1
      end
      self
    end
    attr_reader :items
  end
  attr_reader :atoms
end
