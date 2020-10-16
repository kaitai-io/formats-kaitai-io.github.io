# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.9')
  raise "Incompatible Kaitai Struct Ruby API: 0.9 or later is required, but you have #{Kaitai::Struct::VERSION}"
end

class TlsClientHello < Kaitai::Struct::Struct
  def initialize(_io, _parent = nil, _root = self)
    super(_io, _parent, _root)
    _read
  end

  def _read
    @version = Version.new(@_io, self, @_root)
    @random = Random.new(@_io, self, @_root)
    @session_id = SessionId.new(@_io, self, @_root)
    @cipher_suites = CipherSuites.new(@_io, self, @_root)
    @compression_methods = CompressionMethods.new(@_io, self, @_root)
    if _io.eof? == false
      @extensions = Extensions.new(@_io, self, @_root)
    end
    self
  end
  class ServerName < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @name_type = @_io.read_u1
      @length = @_io.read_u2be
      @host_name = @_io.read_bytes(length)
      self
    end
    attr_reader :name_type
    attr_reader :length
    attr_reader :host_name
  end
  class Random < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @gmt_unix_time = @_io.read_u4be
      @random = @_io.read_bytes(28)
      self
    end
    attr_reader :gmt_unix_time
    attr_reader :random
  end
  class SessionId < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @len = @_io.read_u1
      @sid = @_io.read_bytes(len)
      self
    end
    attr_reader :len
    attr_reader :sid
  end
  class Sni < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @list_length = @_io.read_u2be
      @server_names = []
      i = 0
      while not @_io.eof?
        @server_names << ServerName.new(@_io, self, @_root)
        i += 1
      end
      self
    end
    attr_reader :list_length
    attr_reader :server_names
  end
  class CipherSuites < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @len = @_io.read_u2be
      @cipher_suites = Array.new((len / 2))
      ((len / 2)).times { |i|
        @cipher_suites[i] = @_io.read_u2be
      }
      self
    end
    attr_reader :len
    attr_reader :cipher_suites
  end
  class CompressionMethods < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @len = @_io.read_u1
      @compression_methods = @_io.read_bytes(len)
      self
    end
    attr_reader :len
    attr_reader :compression_methods
  end
  class Alpn < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @ext_len = @_io.read_u2be
      @alpn_protocols = []
      i = 0
      while not @_io.eof?
        @alpn_protocols << Protocol.new(@_io, self, @_root)
        i += 1
      end
      self
    end
    attr_reader :ext_len
    attr_reader :alpn_protocols
  end
  class Extensions < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @len = @_io.read_u2be
      @extensions = []
      i = 0
      while not @_io.eof?
        @extensions << Extension.new(@_io, self, @_root)
        i += 1
      end
      self
    end
    attr_reader :len
    attr_reader :extensions
  end
  class Version < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @major = @_io.read_u1
      @minor = @_io.read_u1
      self
    end
    attr_reader :major
    attr_reader :minor
  end
  class Protocol < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @strlen = @_io.read_u1
      @name = @_io.read_bytes(strlen)
      self
    end
    attr_reader :strlen
    attr_reader :name
  end
  class Extension < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @type = @_io.read_u2be
      @len = @_io.read_u2be
      case type
      when 0
        @_raw_body = @_io.read_bytes(len)
        _io__raw_body = Kaitai::Struct::Stream.new(@_raw_body)
        @body = Sni.new(_io__raw_body, self, @_root)
      when 16
        @_raw_body = @_io.read_bytes(len)
        _io__raw_body = Kaitai::Struct::Stream.new(@_raw_body)
        @body = Alpn.new(_io__raw_body, self, @_root)
      else
        @body = @_io.read_bytes(len)
      end
      self
    end
    attr_reader :type
    attr_reader :len
    attr_reader :body
    attr_reader :_raw_body
  end
  attr_reader :version
  attr_reader :random
  attr_reader :session_id
  attr_reader :cipher_suites
  attr_reader :compression_methods
  attr_reader :extensions
end
