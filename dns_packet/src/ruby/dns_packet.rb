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
    33 => :type_type_srv,
  }
  I__TYPE_TYPE = TYPE_TYPE.invert
  def initialize(_io, _parent = nil, _root = self)
    super(_io, _parent, _root)
    _read
  end

  def _read
    @transaction_id = @_io.read_u2be
    @flags = PacketFlags.new(@_io, self, @_root)
    if flags.is_opcode_valid
      @qdcount = @_io.read_u2be
    end
    if flags.is_opcode_valid
      @ancount = @_io.read_u2be
    end
    if flags.is_opcode_valid
      @nscount = @_io.read_u2be
    end
    if flags.is_opcode_valid
      @arcount = @_io.read_u2be
    end
    if flags.is_opcode_valid
      @queries = Array.new(qdcount)
      (qdcount).times { |i|
        @queries[i] = Query.new(@_io, self, @_root)
      }
    end
    if flags.is_opcode_valid
      @answers = Array.new(ancount)
      (ancount).times { |i|
        @answers[i] = Answer.new(@_io, self, @_root)
      }
    end
    if flags.is_opcode_valid
      @additionals = Array.new(arcount)
      (arcount).times { |i|
        @additionals[i] = Answer.new(@_io, self, @_root)
      }
    end
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
      io.seek((value + ((_parent.length - 192) << 8)))
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
        @name = (@_io.read_bytes(length)).force_encoding("utf-8")
      end
      self
    end
    def is_pointer
      return @is_pointer unless @is_pointer.nil?
      @is_pointer = length >= 192
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
      @type = Kaitai::Struct::Stream::resolve_enum(TYPE_TYPE, @_io.read_u2be)
      @query_class = Kaitai::Struct::Stream::resolve_enum(CLASS_TYPE, @_io.read_u2be)
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
      end until  ((_.length == 0) || (_.length >= 192)) 
      self
    end

    ##
    # Repeat until the length is 0 or it is a pointer (bit-hack to get around lack of OR operator)
    attr_reader :name
  end
  class Service < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @priority = @_io.read_u2be
      @weight = @_io.read_u2be
      @port = @_io.read_u2be
      @target = DomainName.new(@_io, self, @_root)
      self
    end
    attr_reader :priority
    attr_reader :weight
    attr_reader :port
    attr_reader :target
  end
  class Txt < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @length = @_io.read_u1
      @text = (@_io.read_bytes(length)).force_encoding("utf-8")
      self
    end
    attr_reader :length
    attr_reader :text
  end
  class TxtBody < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @data = []
      i = 0
      while not @_io.eof?
        @data << Txt.new(@_io, self, @_root)
        i += 1
      end
      self
    end
    attr_reader :data
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
      @type = Kaitai::Struct::Stream::resolve_enum(TYPE_TYPE, @_io.read_u2be)
      @answer_class = Kaitai::Struct::Stream::resolve_enum(CLASS_TYPE, @_io.read_u2be)
      @ttl = @_io.read_s4be
      @rdlength = @_io.read_u2be
      case type
      when :type_type_ptr
        @_raw_payload = @_io.read_bytes(rdlength)
        io = Kaitai::Struct::Stream.new(@_raw_payload)
        @payload = DomainName.new(io, self, @_root)
      when :type_type_cname
        @_raw_payload = @_io.read_bytes(rdlength)
        io = Kaitai::Struct::Stream.new(@_raw_payload)
        @payload = DomainName.new(io, self, @_root)
      when :type_type_txt
        @_raw_payload = @_io.read_bytes(rdlength)
        io = Kaitai::Struct::Stream.new(@_raw_payload)
        @payload = TxtBody.new(io, self, @_root)
      when :type_type_srv
        @_raw_payload = @_io.read_bytes(rdlength)
        io = Kaitai::Struct::Stream.new(@_raw_payload)
        @payload = Service.new(io, self, @_root)
      when :type_type_a
        @_raw_payload = @_io.read_bytes(rdlength)
        io = Kaitai::Struct::Stream.new(@_raw_payload)
        @payload = Address.new(io, self, @_root)
      else
        @payload = @_io.read_bytes(rdlength)
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
    attr_reader :payload
    attr_reader :_raw_payload
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
    def is_opcode_valid
      return @is_opcode_valid unless @is_opcode_valid.nil?
      @is_opcode_valid =  ((opcode == 0) || (opcode == 1) || (opcode == 2)) 
      @is_opcode_valid
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
  attr_reader :additionals
end
