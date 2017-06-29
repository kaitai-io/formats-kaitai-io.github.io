# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.7')
  raise "Incompatible Kaitai Struct Ruby API: 0.7 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# Specpr records are fixed format, 1536 bytes/record. Record number
# counting starts at 0. Binary data are in IEEE format real numbers
# and non-byte swapped integers (compatiible with all Sun
# Microsystems, and Hewlett Packard workstations (Intel and some DEC
# machines are byte swapped relative to Suns and HPs). Each record may
# contain different information according to the following scheme.
# 
# You can get some library of spectra from
# ftp://ftpext.cr.usgs.gov/pub/cr/co/denver/speclab/pub/spectral.library/splib06.library/
class Specpr < Kaitai::Struct::Struct

  RECORD_TYPE = {
    0 => :record_type_data_initial,
    1 => :record_type_text_initial,
    2 => :record_type_data_continuation,
    3 => :record_type_text_continuation,
  }
  I__RECORD_TYPE = RECORD_TYPE.invert
  def initialize(_io, _parent = nil, _root = self)
    super(_io, _parent, _root)
    _read
  end

  def _read
    @records = []
    while not @_io.eof?
      @records << Record.new(@_io, self, @_root)
    end
    self
  end
  class DataInitial < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @ids = Identifiers.new(@_io, self, @_root)
      @iscta = CoarseTimestamp.new(@_io, self, @_root)
      @isctb = CoarseTimestamp.new(@_io, self, @_root)
      @jdatea = @_io.read_s4be
      @jdateb = @_io.read_s4be
      @istb = CoarseTimestamp.new(@_io, self, @_root)
      @isra = @_io.read_s4be
      @isdec = @_io.read_s4be
      @itchan = @_io.read_s4be
      @irmas = @_io.read_s4be
      @revs = @_io.read_s4be
      @iband = Array.new(2)
      (2).times { |i|
        @iband[i] = @_io.read_s4be
      }
      @irwav = @_io.read_s4be
      @irespt = @_io.read_s4be
      @irecno = @_io.read_s4be
      @itpntr = @_io.read_s4be
      @ihist = (Kaitai::Struct::Stream::bytes_strip_right(@_io.read_bytes(60), 32)).force_encoding("ascii")
      @mhist = Array.new(4)
      (4).times { |i|
        @mhist[i] = (@_io.read_bytes(74)).force_encoding("ascii")
      }
      @nruns = @_io.read_s4be
      @siangl = IllumAngle.new(@_io, self, @_root)
      @seangl = IllumAngle.new(@_io, self, @_root)
      @sphase = @_io.read_s4be
      @iwtrns = @_io.read_s4be
      @itimch = @_io.read_s4be
      @xnrm = @_io.read_f4be
      @scatim = @_io.read_f4be
      @timint = @_io.read_f4be
      @tempd = @_io.read_f4be
      @data = Array.new(256)
      (256).times { |i|
        @data[i] = @_io.read_f4be
      }
      self
    end

    ##
    # The phase angle between iangl and eangl in seconds
    def phase_angle_arcsec
      return @phase_angle_arcsec unless @phase_angle_arcsec.nil?
      @phase_angle_arcsec = (sphase / 1500)
      @phase_angle_arcsec
    end
    attr_reader :ids

    ##
    # Civil or Universal time when data was last processed
    attr_reader :iscta

    ##
    # Civil or Universal time at the start of the spectral run
    attr_reader :isctb

    ##
    # Date when data was last processed. Stored as integer*4 Julian Day number *10
    attr_reader :jdatea

    ##
    # Date when the spectral run began. Stored as integer*4 Julian Day number *10
    attr_reader :jdateb

    ##
    # Siderial time when the spectral run started. See flag #05.
    attr_reader :istb

    ##
    # Right ascension coordinates of an astronomical  object, or longitude on a planetary surface (integer*4 numbers in seconds *1000) (RA in RA seconds, Longitude in arc-seconds) See flag #06.
    attr_reader :isra

    ##
    # Declination coordinates of an astronomical object, or latitude on a planetary surface (integer*4 number in arc-seconds *1000). See flag #06.
    attr_reader :isdec

    ##
    # Total number of channels in the spectrum (integer*4 value from 1 to 4852)
    attr_reader :itchan

    ##
    # The equivalent atmospheric thickness through which the observation was obtained (=1.0 overhead scaled: airmass*1000; integer*4).
    attr_reader :irmas

    ##
    # The number of independent spectral scans which were added to make the spectrum (integer*4 number).
    attr_reader :revs

    ##
    # The channel numbers which define the band normalization (scaling to unity). (integers*4).
    attr_reader :iband

    ##
    # The record number within the file where the wavelengths are found (integer*4).
    attr_reader :irwav

    ##
    # The record pointer to where the resolution can be found (or horizontal error bar) (integer*4).
    attr_reader :irespt

    ##
    # The record number within the file where the data is located (integer*4 number).
    attr_reader :irecno

    ##
    # Text data record pointer. This pointer points to a data record where additional text describing the data may be found.  (32 bit integer)
    attr_reader :itpntr

    ##
    # The program automatic 60 character history.
    attr_reader :ihist

    ##
    # Manual history. Program automatic for large history requirements.
    attr_reader :mhist

    ##
    # The number of independent spectral runs which were summed or averaged to make this spectrum (integer*4).
    attr_reader :nruns

    ##
    # The angle of incidence of illuminating radiation
    #       integrating sphere = 2000000000
    #       Geometric albedo   = 2000000001
    attr_reader :siangl

    ##
    # The angle of emission of illuminating radiation
    #       integrating sphere = 2000000000
    #       Geometric albedo   = 2000000001
    attr_reader :seangl

    ##
    # The phase angle between iangl and eangl (Integer*4 number, in arc-seconds*1500). (180 degrees=972000000; -180 deg <= phase <= 180 deg)
    #       integrating sphere = 2000000000
    attr_reader :sphase

    ##
    # Weighted number of runs (the number of runs of the spectrum with the minimum runs which was used in processing this spectrum, integer*4).
    attr_reader :iwtrns

    ##
    # The time observed in the sample beam for each half chop in milliseconds (for chopping spectrometers only). (integer*4)
    attr_reader :itimch

    ##
    # The band normalization factor. For data scaled to 1.0, multiply by this number to recover photometric level (32 bit real number).
    attr_reader :xnrm

    ##
    # The time it takes to make one scan of the entire spectrum in seconds (32 bit real number).
    attr_reader :scatim

    ##
    # Total integration time (usually=scatime * nruns) (32 bit real number).
    attr_reader :timint

    ##
    # Temperature in degrees Kelvin (32 bit real number).
    attr_reader :tempd

    ##
    # The spectral data (256 channels of 32 bit real data numbers).
    attr_reader :data
  end
  class CoarseTimestamp < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @scaled_seconds = @_io.read_s4be
      self
    end
    def seconds
      return @seconds unless @seconds.nil?
      @seconds = (scaled_seconds * 24000)
      @seconds
    end
    attr_reader :scaled_seconds
  end

  ##
  # it is big endian
  class Icflag < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @reserved = @_io.read_bits_int(26)
      @isctb_type = @_io.read_bits_int(1) != 0
      @iscta_type = @_io.read_bits_int(1) != 0
      @coordinate_mode = @_io.read_bits_int(1) != 0
      @errors = @_io.read_bits_int(1) != 0
      @text = @_io.read_bits_int(1) != 0
      @continuation = @_io.read_bits_int(1) != 0
      self
    end
    def type
      return @type unless @type.nil?
      @type = Kaitai::Struct::Stream::resolve_enum(RECORD_TYPE, (((text ? 1 : 0) * 1) + ((continuation ? 1 : 0) * 2)))
      @type
    end
    attr_reader :reserved

    ##
    # =0 ctb is civil time
    # =1 ctb is universal time
    attr_reader :isctb_type

    ##
    # =0 cta is civil time
    # =1 cta is universal time
    attr_reader :iscta_type

    ##
    # RA, Dec / Long., Lat flag
    # =0 the array "ira" and "idec" corresponds to the right ascension and declination of an astronomical object.
    # =1 the array "ira" and "idec" correspond to the longitude and latitude of a spot on a planetary surface.
    attr_reader :coordinate_mode

    ##
    # flag to indicate whether or not the data for the error bar (1 sigma standard deviation of the mean) is in the next record set. =0: no errors, =1: errors in next record set.
    attr_reader :errors

    ##
    # =0 the data in the array "data" is data
    # =1 the data in the array "data" is ascii text as is most of the header info.
    attr_reader :text

    ##
    # =0 first record of a spectrum consists of: header then 256 data channels
    # =1 continuation data record consisting of:
    #   # bit flags followed by 1532 bytes of
    #   # real data (bit 1=0) (383 channels)
    #   # or 1532 bytes of text (bit 1=1).
    #   # A maximum of 12 continuation records
    #   # are allowed for a total of 4852
    #   # channels (limited by arrays of 4864)
    #   # or 19860 characters of text (bit 1=1).
    attr_reader :continuation
  end
  class DataContinuation < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @cdata = Array.new(383)
      (383).times { |i|
        @cdata[i] = @_io.read_f4be
      }
      self
    end

    ##
    # The continuation of the data values (383 channels of 32 bit real numbers).
    attr_reader :cdata
  end
  class Identifiers < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @ititle = (Kaitai::Struct::Stream::bytes_strip_right(@_io.read_bytes(40), 32)).force_encoding("ascii")
      @usernm = (@_io.read_bytes(8)).force_encoding("ascii")
      self
    end

    ##
    # Title which describes the data
    attr_reader :ititle

    ##
    # The name of the user who created the data record
    attr_reader :usernm
  end
  class IllumAngle < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @angl = @_io.read_s4be
      self
    end
    def seconds_total
      return @seconds_total unless @seconds_total.nil?
      @seconds_total = (angl / 6000)
      @seconds_total
    end
    def minutes_total
      return @minutes_total unless @minutes_total.nil?
      @minutes_total = (seconds_total / 60)
      @minutes_total
    end
    def degrees_total
      return @degrees_total unless @degrees_total.nil?
      @degrees_total = (minutes_total / 60)
      @degrees_total
    end

    ##
    # (Integer*4 number, in arc-seconds*6000). (90 degrees=1944000000; -90 deg <= angle <= 90 deg)
    attr_reader :angl
  end
  class TextInitial < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @ids = Identifiers.new(@_io, self, @_root)
      @itxtpt = @_io.read_u4be
      @itxtch = @_io.read_s4be
      @itext = (@_io.read_bytes(1476)).force_encoding("ascii")
      self
    end
    attr_reader :ids

    ##
    # Text data record pointer. This pointer points  to a data record where additional text may be may be found.
    attr_reader :itxtpt

    ##
    # The number of text characters (maximum= 19860).
    attr_reader :itxtch

    ##
    # 1476 characters of text.  Text has embedded newlines so the number of lines available is limited only by the number of characters available.
    attr_reader :itext
  end
  class Record < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @icflag = Icflag.new(@_io, self, @_root)
      case icflag.type
      when :record_type_data_initial
        @_raw_content = @_io.read_bytes((1536 - 4))
        io = Kaitai::Struct::Stream.new(@_raw_content)
        @content = DataInitial.new(io, self, @_root)
      when :record_type_data_continuation
        @_raw_content = @_io.read_bytes((1536 - 4))
        io = Kaitai::Struct::Stream.new(@_raw_content)
        @content = DataContinuation.new(io, self, @_root)
      when :record_type_text_continuation
        @_raw_content = @_io.read_bytes((1536 - 4))
        io = Kaitai::Struct::Stream.new(@_raw_content)
        @content = TextContinuation.new(io, self, @_root)
      when :record_type_text_initial
        @_raw_content = @_io.read_bytes((1536 - 4))
        io = Kaitai::Struct::Stream.new(@_raw_content)
        @content = TextInitial.new(io, self, @_root)
      else
        @content = @_io.read_bytes((1536 - 4))
      end
      self
    end

    ##
    # Total number of bytes comprising the document.
    attr_reader :icflag
    attr_reader :content
    attr_reader :_raw_content
  end
  class TextContinuation < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @tdata = (@_io.read_bytes(1532)).force_encoding("ascii")
      self
    end

    ##
    # 1532 characters of text.
    attr_reader :tdata
  end
  attr_reader :records
end
