# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.11')
  raise "Incompatible Kaitai Struct Ruby API: 0.11 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# @see https://developer.apple.com/library/archive/documentation/QuickTime/QTFF/QTFFChap1/qtff1.html#//apple_ref/doc/uid/TP40000939-CH203-BBCGDDDF Source
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
    862414135 => :brand_x_3ge7,
    862414137 => :brand_x_3ge9,
    862414393 => :brand_x_3gf9,
    862414646 => :brand_x_3gg6,
    862414649 => :brand_x_3gg9,
    862414905 => :brand_x_3gh9,
    862416185 => :brand_x_3gm9,
    862416193 => :brand_x_3gma,
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
    862417976 => :brand_x_3gt8,
    862417977 => :brand_x_3gt9,
    862418038 => :brand_x_3gtv,
    862418546 => :brand_x_3gvr,
    863400545 => :brand_x_3vra,
    863400546 => :brand_x_3vrb,
    863400557 => :brand_x_3vrm,
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
    1296118081 => :brand_ma1a,
    1296118082 => :brand_ma1b,
    1296454477 => :brand_mfsm,
    1296520022 => :brand_mgsv,
    1297109065 => :brand_mppi,
    1297305174 => :brand_msnv,
    1298743618 => :brand_miab,
    1298743619 => :brand_miac,
    1298743662 => :brand_mian,
    1298743925 => :brand_mibu,
    1298744173 => :brand_micm,
    1298745409 => :brand_miha,
    1298745410 => :brand_mihb,
    1298745413 => :brand_mihe,
    1298747506 => :brand_mipr,
    1380930387 => :brand_ross,
    1397047637 => :brand_seau,
    1397047883 => :brand_sebk,
    1480676931 => :brand_xavc,
    1633973353 => :brand_adti,
    1634296883 => :brand_aid3,
    1635135537 => :brand_av01,
    1635148593 => :brand_avc1,
    1635148649 => :brand_avci,
    1635148659 => :brand_avcs,
    1635148901 => :brand_avde,
    1635150182 => :brand_avif,
    1635150191 => :brand_avio,
    1635150195 => :brand_avis,
    1650620525 => :brand_bbxm,
    1667314797 => :brand_ca4m,
    1667314803 => :brand_ca4s,
    1667326305 => :brand_caaa,
    1667326307 => :brand_caac,
    1667326572 => :brand_cabl,
    1667329377 => :brand_cama,
    1667329379 => :brand_camc,
    1667330422 => :brand_caqv,
    1667330933 => :brand_casu,
    1667458401 => :brand_ccea,
    1667458662 => :brand_ccff,
    1667525937 => :brand_cdm1,
    1667525940 => :brand_cdm4,
    1667588451 => :brand_ceac,
    1667655780 => :brand_cfhd,
    1667658596 => :brand_cfsd,
    1667785777 => :brand_chd1,
    1667785778 => :brand_chd2,
    1667785830 => :brand_chdf,
    1667786102 => :brand_chev,
    1667786801 => :brand_chh1,
    1667786852 => :brand_chhd,
    1667853940 => :brand_cint,
    1668048689 => :brand_clg1,
    1668048690 => :brand_clg2,
    1668113970 => :brand_cmf2,
    1668114019 => :brand_cmfc,
    1668114022 => :brand_cmff,
    1668114028 => :brand_cmfl,
    1668114035 => :brand_cmfs,
    1668114541 => :brand_cmhm,
    1668114547 => :brand_cmhs,
    1668246896 => :brand_comp,
    1668507697 => :brand_csh1,
    1668637745 => :brand_cud1,
    1668637746 => :brand_cud2,
    1668637752 => :brand_cud8,
    1668637753 => :brand_cud9,
    1668642404 => :brand_cuvd,
    1668704612 => :brand_cvid,
    1668707939 => :brand_cvvc,
    1668773492 => :brand_cwvt,
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
    1685353265 => :brand_dts1,
    1685353266 => :brand_dts2,
    1685353267 => :brand_dts3,
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
    1751476579 => :brand_heic,
    1751476589 => :brand_heim,
    1751476595 => :brand_heis,
    1751476600 => :brand_heix,
    1751478121 => :brand_heoi,
    1751479907 => :brand_hevc,
    1751479908 => :brand_hevd,
    1751479913 => :brand_hevi,
    1751479917 => :brand_hevm,
    1751479923 => :brand_hevs,
    1751479928 => :brand_hevx,
    1752589157 => :brand_hvce,
    1752589161 => :brand_hvci,
    1752589176 => :brand_hvcx,
    1752593513 => :brand_hvti,
    1768317281 => :brand_ifaa,
    1768317288 => :brand_ifah,
    1768317289 => :brand_ifai,
    1768317299 => :brand_ifas,
    1768317301 => :brand_ifau,
    1768317302 => :brand_ifav,
    1768319076 => :brand_ifhd,
    1768319080 => :brand_ifhh,
    1768319090 => :brand_ifhr,
    1768319091 => :brand_ifhs,
    1768319093 => :brand_ifhu,
    1768319096 => :brand_ifhx,
    1768321645 => :brand_ifrm,
    1768321892 => :brand_ifsd,
    1768763753 => :brand_im1i,
    1768763764 => :brand_im1t,
    1768764009 => :brand_im2i,
    1768764020 => :brand_im2t,
    1769169714 => :brand_isc2,
    1769172786 => :brand_iso2,
    1769172787 => :brand_iso3,
    1769172788 => :brand_iso4,
    1769172789 => :brand_iso5,
    1769172790 => :brand_iso6,
    1769172791 => :brand_iso7,
    1769172792 => :brand_iso8,
    1769172793 => :brand_iso9,
    1769172833 => :brand_isoa,
    1769172834 => :brand_isob,
    1769172835 => :brand_isoc,
    1769172845 => :brand_isom,
    1781688691 => :brand_j2is,
    1781689193 => :brand_j2ki,
    1781689203 => :brand_j2ks,
    1785737760 => :brand_jp2,
    1785750887 => :brand_jpeg,
    1785751411 => :brand_jpgs,
    1785752864 => :brand_jpm,
    1785753449 => :brand_jpoi,
    1785754473 => :brand_jpsi,
    1785755680 => :brand_jpx,
    1785755746 => :brand_jpxb,
    1786276896 => :brand_jxl,
    1786278688 => :brand_jxs,
    1786278755 => :brand_jxsc,
    1786278761 => :brand_jxsi,
    1786278771 => :brand_jxss,
    1818784869 => :brand_lhte,
    1818784873 => :brand_lhti,
    1819112295 => :brand_lmsg,
    1835622758 => :brand_miaf,
    1835623985 => :brand_mif1,
    1835623986 => :brand_mif2,
    1835676275 => :brand_mj2s,
    1835692082 => :brand_mjp2,
    1836069425 => :brand_mp21,
    1836069937 => :brand_mp41,
    1836069938 => :brand_mp42,
    1836070705 => :brand_mp71,
    1836086630 => :brand_mpuf,
    1836278888 => :brand_msdh,
    1836279345 => :brand_msf1,
    1836280184 => :brand_msix,
    1852402543 => :brand_niko,
    1852601196 => :brand_nlsl,
    1852989811 => :brand_nras,
    1868640868 => :brand_oa2d,
    1868653164 => :brand_oabl,
    1868850022 => :brand_odcf,
    1869443184 => :brand_ompp,
    1869637170 => :brand_opf2,
    1869641778 => :brand_opx2,
    1870029936 => :brand_ovdp,
    1870031993 => :brand_ovly,
    1885431398 => :brand_paff,
    1885433441 => :brand_pana,
    1885955686 => :brand_piff,
    1886217830 => :brand_pmff,
    1886287465 => :brand_pnvi,
    1886545252 => :brand_pred,
    1903435808 => :brand_qt,
    1919249519 => :brand_relo,
    1919513464 => :brand_risx,
    1935963680 => :brand_sdv,
    1936027254 => :brand_senv,
    1936289139 => :brand_sims,
    1936290680 => :brand_sisx,
    1936290921 => :brand_siti,
    1936290934 => :brand_sitv,
    1936484401 => :brand_slh1,
    1936484402 => :brand_slh2,
    1936484403 => :brand_slh3,
    1936946035 => :brand_ssss,
    1953787244 => :brand_ttml,
    1953789814 => :brand_ttwv,
    1969780329 => :brand_uhvi,
    1970170214 => :brand_unif,
    1970697845 => :brand_uvvu,
    1983081840 => :brand_v3mp,
    1983081844 => :brand_v3mt,
    1983082100 => :brand_v3nt,
    1983083380 => :brand_v3st,
    1987470185 => :brand_vvci,
    1987473257 => :brand_vvoi,
    1987539060 => :brand_vwpt,
    2037658656 => :brand_yt4,
  }
  I__BRAND = BRAND.invert
  def initialize(_io, _parent = nil, _root = nil)
    super(_io, _parent, _root || self)
    _read
  end

  def _read
    @atoms = AtomList.new(@_io, self, @_root)
    self
  end
  class Atom < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @len32 = @_io.read_u4be
      @atom_type = Kaitai::Struct::Stream::resolve_enum(QuicktimeMov::ATOM_TYPE, @_io.read_u4be)
      if len32 == 1
        @len64 = @_io.read_u8be
      end
      case atom_type
      when :atom_type_dinf
        _io_body = @_io.substream(len)
        @body = AtomList.new(_io_body, self, @_root)
      when :atom_type_ftyp
        _io_body = @_io.substream(len)
        @body = FtypBody.new(_io_body, self, @_root)
      when :atom_type_mdia
        _io_body = @_io.substream(len)
        @body = AtomList.new(_io_body, self, @_root)
      when :atom_type_minf
        _io_body = @_io.substream(len)
        @body = AtomList.new(_io_body, self, @_root)
      when :atom_type_moof
        _io_body = @_io.substream(len)
        @body = AtomList.new(_io_body, self, @_root)
      when :atom_type_moov
        _io_body = @_io.substream(len)
        @body = AtomList.new(_io_body, self, @_root)
      when :atom_type_mvhd
        _io_body = @_io.substream(len)
        @body = MvhdBody.new(_io_body, self, @_root)
      when :atom_type_stbl
        _io_body = @_io.substream(len)
        @body = AtomList.new(_io_body, self, @_root)
      when :atom_type_tkhd
        _io_body = @_io.substream(len)
        @body = TkhdBody.new(_io_body, self, @_root)
      when :atom_type_traf
        _io_body = @_io.substream(len)
        @body = AtomList.new(_io_body, self, @_root)
      when :atom_type_trak
        _io_body = @_io.substream(len)
        @body = AtomList.new(_io_body, self, @_root)
      else
        @body = @_io.read_bytes(len)
      end
      self
    end
    def len
      return @len unless @len.nil?
      @len = (len32 == 0 ? _io.size - 8 : (len32 == 1 ? len64 - 16 : len32 - 8))
      @len
    end
    attr_reader :len32
    attr_reader :atom_type
    attr_reader :len64
    attr_reader :body
    attr_reader :_raw_body
  end
  class AtomList < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
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

  ##
  # Fixed-point 16-bit number.
  class Fixed16 < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
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

  ##
  # Fixed-point 32-bit number.
  class Fixed32 < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
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

  ##
  # @see https://developer.apple.com/library/archive/documentation/QuickTime/QTFF/QTFFChap1/qtff1.html#//apple_ref/doc/uid/TP40000939-CH203-CJBCBIFF Source
  class FtypBody < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @major_brand = Kaitai::Struct::Stream::resolve_enum(QuicktimeMov::BRAND, @_io.read_u4be)
      @minor_version = @_io.read_bytes(4)
      @compatible_brands = []
      i = 0
      while not @_io.eof?
        @compatible_brands << Kaitai::Struct::Stream::resolve_enum(QuicktimeMov::BRAND, @_io.read_u4be)
        i += 1
      end
      self
    end
    attr_reader :major_brand
    attr_reader :minor_version
    attr_reader :compatible_brands
  end

  ##
  # @see https://developer.apple.com/library/archive/documentation/QuickTime/QTFF/QTFFChap2/qtff2.html#//apple_ref/doc/uid/TP40000939-CH204-BBCGFGJG Source
  class MvhdBody < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
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
    # A time value that indicates the time scale for this
    # movie - the number of time units that pass per second
    # in its time coordinate system. A time coordinate system that
    # measures time in sixtieths of a second, for example, has a
    # time scale of 60.
    attr_reader :time_scale

    ##
    # A time value that indicates the duration of the movie in
    # time scale units. Note that this property is derived from
    # the movie's tracks. The value of this field corresponds to
    # the duration of the longest track in the movie.
    attr_reader :duration

    ##
    # The rate at which to play this movie. A value of 1.0 indicates normal rate.
    attr_reader :preferred_rate

    ##
    # How loud to play this movie's sound. A value of 1.0 indicates full volume.
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
    # Indicates a value to use for the track ID number of the next
    # track added to this movie. Note that 0 is not a valid track
    # ID value.
    attr_reader :next_track_id
  end

  ##
  # @see https://developer.apple.com/library/archive/documentation/QuickTime/QTFF/QTFFChap2/qtff2.html#//apple_ref/doc/uid/TP40000939-CH204-25550 Source
  class TkhdBody < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
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
  attr_reader :atoms
end
