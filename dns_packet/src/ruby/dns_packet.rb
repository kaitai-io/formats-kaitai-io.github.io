# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.7')
  raise "Incompatible Kaitai Struct Ruby API: 0.7 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# (No support for Auth-Name + Add-Name for simplicity)
class DnsPacket < Kaitai::Struct::Struct

  CLASS_TYPE = {
    1 => :class_type_in_class,
    2 => :class_type_cs,
    3 => :class_type_ch,
    4 => :class_type_hs,
  }
  I__CLASS_TYPE = CLASS_TYPE.invert

  TYPE_TYPE = {
    1 => :type_type_a,
    2 => :type_type_ns,
    3 => :type_type_md,
    4 => :type_type_mf,
    5 => :type_type_cname,
    6 => :type_type_soe,
    7 => :type_type_mb,
    8 => :type_type_mg,
    9 => :type_type_mr,
    10 => :type_type_null,
    11 => :type_type_wks,
    12 => :type_type_ptr,
    13 => :type_type_hinfo,
    14 => :type_type_minfo,
    15 => :type_type_mx,
    16 => :type_type_txt,
  }
  I__TYPE_TYPE = TYPE_TYPE.invert
  def initialize(_io, _parent = nil, _root = self)
    super(_io, _parent, _root)
    _read
  end

  def _read
    @transaction_id = @_io.read_u2be
    @flags = PacketFlags.new(@_io, self, @_root)
    @qdcount = @_io.read_u2be
    @ancount = @_io.read_u2be
    @nscount = @_io.read_u2be
    @arcount = @_io.read_u2be
    @queries = Array.new(qdcount)
    (qdcount).times { |i|
      @queries[i] = Query.new(@_io, self, @_root)
    }
    @answers = Array.new(ancount)
    (ancount).times { |i|
      @answers[i] = Answer.new(@_io, self, @_root)
    }
    self
  end
  class PointerStruct < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @value = @_io.read_u1
      self
    end
    def contents
      return @contents unless @contents.nil?
      io = _root._io
      _pos = io.pos
      io.seek(value)
      @contents = DomainName.new(io, self, @_root)
      io.seek(_pos)
      @contents
    end

    ##
    # Read one byte, then offset to that position, read one domain-name and return
    attr_reader :value
  end
  class Label < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @length = @_io.read_u1
      if is_pointer
        @pointer = PointerStruct.new(@_io, self, @_root)
      end
      if !(is_pointer)
        @name = (@_io.read_bytes(length)).force_encoding("ASCII")
      end
      self
    end
    def is_pointer
      return @is_pointer unless @is_pointer.nil?
      @is_pointer = length == 192
      @is_pointer
    end

    ##
    # RFC1035 4.1.4: If the first two bits are raised it's a pointer-offset to a previously defined name
    attr_reader :length
    attr_reader :pointer

    ##
    # Otherwise its a string the length of the length value
    attr_reader :name
  end
  class Query < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @name = DomainName.new(@_io, self, @_root)
      @type = Kaitai::Struct::Stream::resolve_enum(DnsPacket::TYPE_TYPE, @_io.read_u2be)
      @query_class = Kaitai::Struct::Stream::resolve_enum(DnsPacket::CLASS_TYPE, @_io.read_u2be)
      self
    end
    attr_reader :name
    attr_reader :type
    attr_reader :query_class
  end
  class DomainName < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @name = []
      i = 0
      begin
        _ = Label.new(@_io, self, @_root)
        @name << _
        i += 1
      end until  ((_.length == 0) || (_.length == 192)) 
      self
    end

    ##
    # Repeat until the length is 0 or it is a pointer (bit-hack to get around lack of OR operator)
    attr_reader :name
  end
  class Address < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @ip = Array.new(4)
      (4).times { |i|
        @ip[i] = @_io.read_u1
      }
      self
    end
    attr_reader :ip
  end
  class Answer < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @name = DomainName.new(@_io, self, @_root)
      @type = Kaitai::Struct::Stream::resolve_enum(DnsPacket::TYPE_TYPE, @_io.read_u2be)
      @answer_class = Kaitai::Struct::Stream::resolve_enum(DnsPacket::CLASS_TYPE, @_io.read_u2be)
      @ttl = @_io.read_s4be
      @rdlength = @_io.read_u2be
      if type == :type_type_ptr
        @ptrdname = DomainName.new(@_io, self, @_root)
      end
      if type == :type_type_a
        @address = Address.new(@_io, self, @_root)
      end
      self
    end
    attr_reader :name
    attr_reader :type
    attr_reader :answer_class

    ##
    # Time to live (in seconds)
    attr_reader :ttl

    ##
    # Length in octets of the following payload
    attr_reader :rdlength
    attr_reader :ptrdname
    attr_reader :address
  end
  class PacketFlags < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @flag = @_io.read_u2be
      self
    end
    def qr
      return @qr unless @qr.nil?
      @qr = ((flag & 32768) >> 15)
      @qr
    end
    def ra
      return @ra unless @ra.nil?
      @ra = ((flag & 128) >> 7)
      @ra
    end
    def tc
      return @tc unless @tc.nil?
      @tc = ((flag & 512) >> 9)
      @tc
    end
    def rcode
      return @rcode unless @rcode.nil?
      @rcode = ((flag & 15) >> 0)
      @rcode
    end
    def opcode
      return @opcode unless @opcode.nil?
      @opcode = ((flag & 30720) >> 11)
      @opcode
    end
    def aa
      return @aa unless @aa.nil?
      @aa = ((flag & 1024) >> 10)
      @aa
    end
    def z
      return @z unless @z.nil?
      @z = ((flag & 64) >> 6)
      @z
    end
    def rd
      return @rd unless @rd.nil?
      @rd = ((flag & 256) >> 8)
      @rd
    end
    def cd
      return @cd unless @cd.nil?
      @cd = ((flag & 16) >> 4)
      @cd
    end
    def ad
      return @ad unless @ad.nil?
      @ad = ((flag & 32) >> 5)
      @ad
    end
    attr_reader :flag
  end

  ##
  # ID to keep track of request/responces
  attr_reader :transaction_id
  attr_reader :flags

  ##
  # How many questions are there
  attr_reader :qdcount

  ##
  # Number of resource records answering the question
  attr_reader :ancount

  ##
  # Number of resource records pointing toward an authority
  attr_reader :nscount

  ##
  # Number of resource records holding additional information
  attr_reader :arcount
  attr_reader :queries
  attr_reader :answers
end
