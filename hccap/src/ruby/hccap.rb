# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.7')
  raise "Incompatible Kaitai Struct Ruby API: 0.7 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# Native format of Hashcat password "recovery" utility
# A sample of file for testing can be downloaded from https://web.archive.org/web/20150220013635if_/http://hashcat.net:80/misc/example_hashes/hashcat.hccap
# @see https://hashcat.net/wiki/doku.php?id=hccap Source
class Hccap < Kaitai::Struct::Struct
  def initialize(_io, _parent = nil, _root = self)
    super(_io, _parent, _root)
    _read
  end

  def _read
    @records = []
    i = 0
    while not @_io.eof?
      @records << Hccap.new(@_io, self, @_root)
      i += 1
    end
    self
  end
  class Hccap < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @essid = (Kaitai::Struct::Stream::bytes_terminate(@_io.read_bytes(36), 0, false)).force_encoding("utf-8")
      @ap_mac = @_io.read_bytes(6)
      @stantion_mac = @_io.read_bytes(6)
      @stantion_nonce = @_io.read_bytes(32)
      @ap_nonce = @_io.read_bytes(32)
      @_raw_eapol = @_io.read_bytes(256)
      io = Kaitai::Struct::Stream.new(@_raw_eapol)
      @eapol = EapolFrame.new(io, self, @_root)
      @eapol_size = @_io.read_u4le
      @keyver = @_io.read_u4le
      @keymic = @_io.read_bytes(16)
      self
    end
    attr_reader :essid

    ##
    # the bssid(MAC) of the access point
    attr_reader :ap_mac

    ##
    # the MAC address of a client connecting to the access point
    attr_reader :stantion_mac
    attr_reader :stantion_nonce
    attr_reader :ap_nonce
    attr_reader :eapol

    ##
    # size of eapol
    attr_reader :eapol_size

    ##
    # the flag used to distinguish WPA from WPA2 ciphers. Value of 1 means WPA, other - WPA2
    attr_reader :keyver

    ##
    # the final hash value. MD5 for WPA and SHA-1 for WPA2 (truncated to 128 bit)
    attr_reader :keymic
    attr_reader :_raw_eapol
  end
  class EapolFrame < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      self
    end
    def body
      return @body unless @body.nil?
      _pos = @_io.pos
      @_io.seek(0)
      @body = @_io.read_bytes(_parent.eapol_size)
      @_io.seek(_pos)
      @body
    end
  end
  attr_reader :records
end
