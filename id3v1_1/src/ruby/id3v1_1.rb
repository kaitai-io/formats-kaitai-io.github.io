# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.7')
  raise "Incompatible Kaitai Struct Ruby API: 0.7 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# ID3v1.1 tag is a method to store simple metadata in .mp3 files. The
# tag is appended to the end of file and spans exactly 128 bytes.
# 
# This type is supposed to be used on full .mp3 files, seeking to
# proper position automatically. If you're interesting in parsing only
# the tag itself, please use `id3v1_1::id3_v1_1_tag` subtype.
# @see http://id3.org/ID3v1 Source
class Id3v11 < Kaitai::Struct::Struct
  def initialize(_io, _parent = nil, _root = self)
    super(_io, _parent, _root)
    _read
  end

  def _read
    self
  end

  ##
  # ID3v1.1 tag itself, a fixed size 128 byte structure. Contains
  # several metadata fields as fixed-size strings.
  # 
  # Note that string encoding is not specified by standard, so real
  # encoding used would vary a lot from one implementation to
  # another. Most Windows-based applications tend to use "ANSI"
  # (i.e. locale-dependent encoding, usually one byte per
  # character). Some embedded applications allow selection of
  # charset.
  class Id3V11Tag < Kaitai::Struct::Struct

    GENRE_ENUM = {
      0 => :genre_enum_blues,
      1 => :genre_enum_classic_rock,
      2 => :genre_enum_country,
      3 => :genre_enum_dance,
      4 => :genre_enum_disco,
      5 => :genre_enum_funk,
      6 => :genre_enum_grunge,
      7 => :genre_enum_hip_hop,
      8 => :genre_enum_jazz,
      9 => :genre_enum_metal,
      10 => :genre_enum_new_age,
      11 => :genre_enum_oldies,
      12 => :genre_enum_other,
      13 => :genre_enum_pop,
      14 => :genre_enum_rnb,
      15 => :genre_enum_rap,
      16 => :genre_enum_reggae,
      17 => :genre_enum_rock,
      18 => :genre_enum_techno,
      19 => :genre_enum_industrial,
      20 => :genre_enum_alternative,
      21 => :genre_enum_ska,
      22 => :genre_enum_death_metal,
      23 => :genre_enum_pranks,
      24 => :genre_enum_soundtrack,
      25 => :genre_enum_euro_techno,
      26 => :genre_enum_ambient,
      27 => :genre_enum_trip_hop,
      28 => :genre_enum_vocal,
      29 => :genre_enum_jazz_funk,
      30 => :genre_enum_fusion,
      31 => :genre_enum_trance,
      32 => :genre_enum_classical,
      33 => :genre_enum_instrumental,
      34 => :genre_enum_acid,
      35 => :genre_enum_house,
      36 => :genre_enum_game,
      37 => :genre_enum_sound_clip,
      38 => :genre_enum_gospel,
      39 => :genre_enum_noise,
      40 => :genre_enum_alternrock,
      41 => :genre_enum_bass,
      42 => :genre_enum_soul,
      43 => :genre_enum_punk,
      44 => :genre_enum_space,
      45 => :genre_enum_meditative,
      46 => :genre_enum_instrumental_pop,
      47 => :genre_enum_instrumental_rock,
      48 => :genre_enum_ethnic,
      49 => :genre_enum_gothic,
      50 => :genre_enum_darkwave,
      51 => :genre_enum_techno_industrial,
      52 => :genre_enum_electronic,
      53 => :genre_enum_pop_folk,
      54 => :genre_enum_eurodance,
      55 => :genre_enum_dream,
      56 => :genre_enum_southern_rock,
      57 => :genre_enum_comedy,
      58 => :genre_enum_cult,
      59 => :genre_enum_gangsta,
      60 => :genre_enum_top_40,
      61 => :genre_enum_christian_rap,
      62 => :genre_enum_pop_funk,
      63 => :genre_enum_jungle,
      64 => :genre_enum_native_american,
      65 => :genre_enum_cabaret,
      66 => :genre_enum_new_wave,
      67 => :genre_enum_psychadelic,
      68 => :genre_enum_rave,
      69 => :genre_enum_showtunes,
      70 => :genre_enum_trailer,
      71 => :genre_enum_lo_fi,
      72 => :genre_enum_tribal,
      73 => :genre_enum_acid_punk,
      74 => :genre_enum_acid_jazz,
      75 => :genre_enum_polka,
      76 => :genre_enum_retro,
      77 => :genre_enum_musical,
      78 => :genre_enum_rock_n_roll,
      79 => :genre_enum_hard_rock,
      80 => :genre_enum_folk,
      81 => :genre_enum_folk_rock,
      82 => :genre_enum_national_folk,
      83 => :genre_enum_swing,
      84 => :genre_enum_fast_fusion,
      85 => :genre_enum_bebob,
      86 => :genre_enum_latin,
      87 => :genre_enum_revival,
      88 => :genre_enum_celtic,
      89 => :genre_enum_bluegrass,
      90 => :genre_enum_avantgarde,
      91 => :genre_enum_gothic_rock,
      92 => :genre_enum_progressive_rock,
      93 => :genre_enum_psychedelic_rock,
      94 => :genre_enum_symphonic_rock,
      95 => :genre_enum_slow_rock,
      96 => :genre_enum_big_band,
      97 => :genre_enum_chorus,
      98 => :genre_enum_easy_listening,
      99 => :genre_enum_acoustic,
      100 => :genre_enum_humour,
      101 => :genre_enum_speech,
      102 => :genre_enum_chanson,
      103 => :genre_enum_opera,
      104 => :genre_enum_chamber_music,
      105 => :genre_enum_sonata,
      106 => :genre_enum_symphony,
      107 => :genre_enum_booty_bass,
      108 => :genre_enum_primus,
      109 => :genre_enum_porn_groove,
      110 => :genre_enum_satire,
      111 => :genre_enum_slow_jam,
      112 => :genre_enum_club,
      113 => :genre_enum_tango,
      114 => :genre_enum_samba,
      115 => :genre_enum_folklore,
      116 => :genre_enum_ballad,
      117 => :genre_enum_power_ballad,
      118 => :genre_enum_rhythmic_soul,
      119 => :genre_enum_freestyle,
      120 => :genre_enum_duet,
      121 => :genre_enum_punk_rock,
      122 => :genre_enum_drum_solo,
      123 => :genre_enum_a_capella,
      124 => :genre_enum_euro_house,
      125 => :genre_enum_dance_hall,
    }
    I__GENRE_ENUM = GENRE_ENUM.invert
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @magic = @_io.ensure_fixed_contents([84, 65, 71].pack('C*'))
      @title = @_io.read_bytes(30)
      @artist = @_io.read_bytes(30)
      @album = @_io.read_bytes(30)
      @year = (@_io.read_bytes(4)).force_encoding("ASCII")
      @comment = @_io.read_bytes(30)
      @genre = Kaitai::Struct::Stream::resolve_enum(GENRE_ENUM, @_io.read_u1)
      self
    end
    attr_reader :magic

    ##
    # Song title
    attr_reader :title

    ##
    # Artist name
    attr_reader :artist

    ##
    # Album title
    attr_reader :album

    ##
    # Year of release
    attr_reader :year

    ##
    # Arbitary comment
    attr_reader :comment
    attr_reader :genre
  end
  def id3v1_tag
    return @id3v1_tag unless @id3v1_tag.nil?
    _pos = @_io.pos
    @_io.seek((_io.size - 128))
    @id3v1_tag = Id3V11Tag.new(@_io, self, @_root)
    @_io.seek(_pos)
    @id3v1_tag
  end
end
