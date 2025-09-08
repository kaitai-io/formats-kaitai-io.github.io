import kaitai_struct_nim_runtime
import options

type
  SomeIpSdOptions* = ref object of KaitaiStruct
    `entries`*: seq[SomeIpSdOptions_SdOption]
    `parent`*: KaitaiStruct
  SomeIpSdOptions_SdOption* = ref object of KaitaiStruct
    `header`*: SomeIpSdOptions_SdOption_SdOptionHeader
    `content`*: KaitaiStruct
    `parent`*: SomeIpSdOptions
  SomeIpSdOptions_SdOption_OptionTypes* = enum
    configuration_option = 1
    load_balancing_option = 2
    ipv4_endpoint_option = 4
    ipv6_endpoint_option = 6
    ipv4_multicast_option = 20
    ipv6_multicast_option = 22
    ipv4_sd_endpoint_option = 36
    ipv6_sd_endpoint_option = 38
  SomeIpSdOptions_SdOption_SdConfigKvPair* = ref object of KaitaiStruct
    `key`*: string
    `value`*: string
    `parent`*: SomeIpSdOptions_SdOption_SdConfigString
  SomeIpSdOptions_SdOption_SdConfigString* = ref object of KaitaiStruct
    `length`*: uint8
    `config`*: SomeIpSdOptions_SdOption_SdConfigKvPair
    `parent`*: SomeIpSdOptions_SdOption_SdConfigStringsContainer
    `rawConfig`*: seq[byte]
  SomeIpSdOptions_SdOption_SdConfigStringsContainer* = ref object of KaitaiStruct
    `configStrings`*: seq[SomeIpSdOptions_SdOption_SdConfigString]
    `parent`*: SomeIpSdOptions_SdOption_SdConfigurationOption
  SomeIpSdOptions_SdOption_SdConfigurationOption* = ref object of KaitaiStruct
    `reserved`*: uint8
    `configurations`*: SomeIpSdOptions_SdOption_SdConfigStringsContainer
    `parent`*: SomeIpSdOptions_SdOption
    `rawConfigurations`*: seq[byte]
  SomeIpSdOptions_SdOption_SdIpv4EndpointOption* = ref object of KaitaiStruct
    `reserved`*: uint8
    `address`*: seq[byte]
    `reserved2`*: uint8
    `l4Protocol`*: uint8
    `port`*: uint16
    `parent`*: SomeIpSdOptions_SdOption
  SomeIpSdOptions_SdOption_SdIpv4MulticastOption* = ref object of KaitaiStruct
    `reserved`*: uint8
    `address`*: seq[byte]
    `reserved2`*: uint8
    `l4Protocol`*: uint8
    `port`*: uint16
    `parent`*: SomeIpSdOptions_SdOption
  SomeIpSdOptions_SdOption_SdIpv4SdEndpointOption* = ref object of KaitaiStruct
    `reserved`*: uint8
    `address`*: seq[byte]
    `reserved2`*: uint8
    `l4Protocol`*: uint8
    `port`*: uint16
    `parent`*: SomeIpSdOptions_SdOption
  SomeIpSdOptions_SdOption_SdIpv6EndpointOption* = ref object of KaitaiStruct
    `reserved`*: uint8
    `address`*: seq[byte]
    `reserved2`*: uint8
    `l4Protocol`*: uint8
    `port`*: uint16
    `parent`*: SomeIpSdOptions_SdOption
  SomeIpSdOptions_SdOption_SdIpv6MulticastOption* = ref object of KaitaiStruct
    `reserved`*: uint8
    `address`*: seq[byte]
    `reserved2`*: uint8
    `l4Protocol`*: uint8
    `port`*: uint16
    `parent`*: SomeIpSdOptions_SdOption
  SomeIpSdOptions_SdOption_SdIpv6SdEndpointOption* = ref object of KaitaiStruct
    `reserved`*: uint8
    `address`*: seq[byte]
    `reserved2`*: uint8
    `l4Protocol`*: uint8
    `port`*: uint16
    `parent`*: SomeIpSdOptions_SdOption
  SomeIpSdOptions_SdOption_SdLoadBalancingOption* = ref object of KaitaiStruct
    `reserved`*: uint8
    `priority`*: uint16
    `weight`*: uint16
    `parent`*: SomeIpSdOptions_SdOption
  SomeIpSdOptions_SdOption_SdOptionHeader* = ref object of KaitaiStruct
    `length`*: uint16
    `type`*: SomeIpSdOptions_SdOption_OptionTypes
    `parent`*: SomeIpSdOptions_SdOption

proc read*(_: typedesc[SomeIpSdOptions], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): SomeIpSdOptions
proc read*(_: typedesc[SomeIpSdOptions_SdOption], io: KaitaiStream, root: KaitaiStruct, parent: SomeIpSdOptions): SomeIpSdOptions_SdOption
proc read*(_: typedesc[SomeIpSdOptions_SdOption_SdConfigKvPair], io: KaitaiStream, root: KaitaiStruct, parent: SomeIpSdOptions_SdOption_SdConfigString): SomeIpSdOptions_SdOption_SdConfigKvPair
proc read*(_: typedesc[SomeIpSdOptions_SdOption_SdConfigString], io: KaitaiStream, root: KaitaiStruct, parent: SomeIpSdOptions_SdOption_SdConfigStringsContainer): SomeIpSdOptions_SdOption_SdConfigString
proc read*(_: typedesc[SomeIpSdOptions_SdOption_SdConfigStringsContainer], io: KaitaiStream, root: KaitaiStruct, parent: SomeIpSdOptions_SdOption_SdConfigurationOption): SomeIpSdOptions_SdOption_SdConfigStringsContainer
proc read*(_: typedesc[SomeIpSdOptions_SdOption_SdConfigurationOption], io: KaitaiStream, root: KaitaiStruct, parent: SomeIpSdOptions_SdOption): SomeIpSdOptions_SdOption_SdConfigurationOption
proc read*(_: typedesc[SomeIpSdOptions_SdOption_SdIpv4EndpointOption], io: KaitaiStream, root: KaitaiStruct, parent: SomeIpSdOptions_SdOption): SomeIpSdOptions_SdOption_SdIpv4EndpointOption
proc read*(_: typedesc[SomeIpSdOptions_SdOption_SdIpv4MulticastOption], io: KaitaiStream, root: KaitaiStruct, parent: SomeIpSdOptions_SdOption): SomeIpSdOptions_SdOption_SdIpv4MulticastOption
proc read*(_: typedesc[SomeIpSdOptions_SdOption_SdIpv4SdEndpointOption], io: KaitaiStream, root: KaitaiStruct, parent: SomeIpSdOptions_SdOption): SomeIpSdOptions_SdOption_SdIpv4SdEndpointOption
proc read*(_: typedesc[SomeIpSdOptions_SdOption_SdIpv6EndpointOption], io: KaitaiStream, root: KaitaiStruct, parent: SomeIpSdOptions_SdOption): SomeIpSdOptions_SdOption_SdIpv6EndpointOption
proc read*(_: typedesc[SomeIpSdOptions_SdOption_SdIpv6MulticastOption], io: KaitaiStream, root: KaitaiStruct, parent: SomeIpSdOptions_SdOption): SomeIpSdOptions_SdOption_SdIpv6MulticastOption
proc read*(_: typedesc[SomeIpSdOptions_SdOption_SdIpv6SdEndpointOption], io: KaitaiStream, root: KaitaiStruct, parent: SomeIpSdOptions_SdOption): SomeIpSdOptions_SdOption_SdIpv6SdEndpointOption
proc read*(_: typedesc[SomeIpSdOptions_SdOption_SdLoadBalancingOption], io: KaitaiStream, root: KaitaiStruct, parent: SomeIpSdOptions_SdOption): SomeIpSdOptions_SdOption_SdLoadBalancingOption
proc read*(_: typedesc[SomeIpSdOptions_SdOption_SdOptionHeader], io: KaitaiStream, root: KaitaiStruct, parent: SomeIpSdOptions_SdOption): SomeIpSdOptions_SdOption_SdOptionHeader



##[
FormatOptions are used to transport additional information to the entries.
This includes forinstance the information how a service instance is
reachable (IP-Address, TransportProtocol, Port Number).

@see <a href="https://www.autosar.org/fileadmin/standards/foundation/19-11/AUTOSAR_PRS_SOMEIPServiceDiscoveryProtocol.pdf
-">section 4.1.2.4 Options Format</a>
]##
proc read*(_: typedesc[SomeIpSdOptions], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): SomeIpSdOptions =
  template this: untyped = result
  this = new(SomeIpSdOptions)
  let root = if root == nil: cast[SomeIpSdOptions](this) else: cast[SomeIpSdOptions](root)
  this.io = io
  this.root = root
  this.parent = parent

  block:
    var i: int
    while not this.io.isEof:
      let it = SomeIpSdOptions_SdOption.read(this.io, this.root, this)
      this.entries.add(it)
      inc i

proc fromFile*(_: typedesc[SomeIpSdOptions], filename: string): SomeIpSdOptions =
  SomeIpSdOptions.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[SomeIpSdOptions_SdOption], io: KaitaiStream, root: KaitaiStruct, parent: SomeIpSdOptions): SomeIpSdOptions_SdOption =
  template this: untyped = result
  this = new(SomeIpSdOptions_SdOption)
  let root = if root == nil: cast[SomeIpSdOptions](this) else: cast[SomeIpSdOptions](root)
  this.io = io
  this.root = root
  this.parent = parent

  let headerExpr = SomeIpSdOptions_SdOption_SdOptionHeader.read(this.io, this.root, this)
  this.header = headerExpr
  block:
    let on = this.header.type
    if on == some_ip_sd_options.configuration_option:
      let contentExpr = SomeIpSdOptions_SdOption_SdConfigurationOption.read(this.io, this.root, this)
      this.content = contentExpr
    elif on == some_ip_sd_options.ipv4_endpoint_option:
      let contentExpr = SomeIpSdOptions_SdOption_SdIpv4EndpointOption.read(this.io, this.root, this)
      this.content = contentExpr
    elif on == some_ip_sd_options.ipv4_multicast_option:
      let contentExpr = SomeIpSdOptions_SdOption_SdIpv4MulticastOption.read(this.io, this.root, this)
      this.content = contentExpr
    elif on == some_ip_sd_options.ipv4_sd_endpoint_option:
      let contentExpr = SomeIpSdOptions_SdOption_SdIpv4SdEndpointOption.read(this.io, this.root, this)
      this.content = contentExpr
    elif on == some_ip_sd_options.ipv6_endpoint_option:
      let contentExpr = SomeIpSdOptions_SdOption_SdIpv6EndpointOption.read(this.io, this.root, this)
      this.content = contentExpr
    elif on == some_ip_sd_options.ipv6_multicast_option:
      let contentExpr = SomeIpSdOptions_SdOption_SdIpv6MulticastOption.read(this.io, this.root, this)
      this.content = contentExpr
    elif on == some_ip_sd_options.ipv6_sd_endpoint_option:
      let contentExpr = SomeIpSdOptions_SdOption_SdIpv6SdEndpointOption.read(this.io, this.root, this)
      this.content = contentExpr
    elif on == some_ip_sd_options.load_balancing_option:
      let contentExpr = SomeIpSdOptions_SdOption_SdLoadBalancingOption.read(this.io, this.root, this)
      this.content = contentExpr

proc fromFile*(_: typedesc[SomeIpSdOptions_SdOption], filename: string): SomeIpSdOptions_SdOption =
  SomeIpSdOptions_SdOption.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[SomeIpSdOptions_SdOption_SdConfigKvPair], io: KaitaiStream, root: KaitaiStruct, parent: SomeIpSdOptions_SdOption_SdConfigString): SomeIpSdOptions_SdOption_SdConfigKvPair =
  template this: untyped = result
  this = new(SomeIpSdOptions_SdOption_SdConfigKvPair)
  let root = if root == nil: cast[SomeIpSdOptions](this) else: cast[SomeIpSdOptions](root)
  this.io = io
  this.root = root
  this.parent = parent

  let keyExpr = encode(this.io.readBytesTerm(61, false, true, true), "ASCII")
  this.key = keyExpr
  let valueExpr = encode(this.io.readBytesFull(), "ASCII")
  this.value = valueExpr

proc fromFile*(_: typedesc[SomeIpSdOptions_SdOption_SdConfigKvPair], filename: string): SomeIpSdOptions_SdOption_SdConfigKvPair =
  SomeIpSdOptions_SdOption_SdConfigKvPair.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[SomeIpSdOptions_SdOption_SdConfigString], io: KaitaiStream, root: KaitaiStruct, parent: SomeIpSdOptions_SdOption_SdConfigStringsContainer): SomeIpSdOptions_SdOption_SdConfigString =
  template this: untyped = result
  this = new(SomeIpSdOptions_SdOption_SdConfigString)
  let root = if root == nil: cast[SomeIpSdOptions](this) else: cast[SomeIpSdOptions](root)
  this.io = io
  this.root = root
  this.parent = parent

  let lengthExpr = this.io.readU1()
  this.length = lengthExpr
  if this.length != 0:
    let rawConfigExpr = this.io.readBytes(int(this.length))
    this.rawConfig = rawConfigExpr
    let rawConfigIo = newKaitaiStream(rawConfigExpr)
    let configExpr = SomeIpSdOptions_SdOption_SdConfigKvPair.read(rawConfigIo, this.root, this)
    this.config = configExpr

proc fromFile*(_: typedesc[SomeIpSdOptions_SdOption_SdConfigString], filename: string): SomeIpSdOptions_SdOption_SdConfigString =
  SomeIpSdOptions_SdOption_SdConfigString.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[SomeIpSdOptions_SdOption_SdConfigStringsContainer], io: KaitaiStream, root: KaitaiStruct, parent: SomeIpSdOptions_SdOption_SdConfigurationOption): SomeIpSdOptions_SdOption_SdConfigStringsContainer =
  template this: untyped = result
  this = new(SomeIpSdOptions_SdOption_SdConfigStringsContainer)
  let root = if root == nil: cast[SomeIpSdOptions](this) else: cast[SomeIpSdOptions](root)
  this.io = io
  this.root = root
  this.parent = parent

  block:
    var i: int
    while not this.io.isEof:
      let it = SomeIpSdOptions_SdOption_SdConfigString.read(this.io, this.root, this)
      this.configStrings.add(it)
      inc i

proc fromFile*(_: typedesc[SomeIpSdOptions_SdOption_SdConfigStringsContainer], filename: string): SomeIpSdOptions_SdOption_SdConfigStringsContainer =
  SomeIpSdOptions_SdOption_SdConfigStringsContainer.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[SomeIpSdOptions_SdOption_SdConfigurationOption], io: KaitaiStream, root: KaitaiStruct, parent: SomeIpSdOptions_SdOption): SomeIpSdOptions_SdOption_SdConfigurationOption =
  template this: untyped = result
  this = new(SomeIpSdOptions_SdOption_SdConfigurationOption)
  let root = if root == nil: cast[SomeIpSdOptions](this) else: cast[SomeIpSdOptions](root)
  this.io = io
  this.root = root
  this.parent = parent

  let reservedExpr = this.io.readU1()
  this.reserved = reservedExpr
  let rawConfigurationsExpr = this.io.readBytes(int(this.parent.header.length - 1))
  this.rawConfigurations = rawConfigurationsExpr
  let rawConfigurationsIo = newKaitaiStream(rawConfigurationsExpr)
  let configurationsExpr = SomeIpSdOptions_SdOption_SdConfigStringsContainer.read(rawConfigurationsIo, this.root, this)
  this.configurations = configurationsExpr

proc fromFile*(_: typedesc[SomeIpSdOptions_SdOption_SdConfigurationOption], filename: string): SomeIpSdOptions_SdOption_SdConfigurationOption =
  SomeIpSdOptions_SdOption_SdConfigurationOption.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[SomeIpSdOptions_SdOption_SdIpv4EndpointOption], io: KaitaiStream, root: KaitaiStruct, parent: SomeIpSdOptions_SdOption): SomeIpSdOptions_SdOption_SdIpv4EndpointOption =
  template this: untyped = result
  this = new(SomeIpSdOptions_SdOption_SdIpv4EndpointOption)
  let root = if root == nil: cast[SomeIpSdOptions](this) else: cast[SomeIpSdOptions](root)
  this.io = io
  this.root = root
  this.parent = parent

  let reservedExpr = this.io.readU1()
  this.reserved = reservedExpr
  let addressExpr = this.io.readBytes(int(4))
  this.address = addressExpr
  let reserved2Expr = this.io.readU1()
  this.reserved2 = reserved2Expr
  let l4ProtocolExpr = this.io.readU1()
  this.l4Protocol = l4ProtocolExpr
  let portExpr = this.io.readU2be()
  this.port = portExpr

proc fromFile*(_: typedesc[SomeIpSdOptions_SdOption_SdIpv4EndpointOption], filename: string): SomeIpSdOptions_SdOption_SdIpv4EndpointOption =
  SomeIpSdOptions_SdOption_SdIpv4EndpointOption.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[SomeIpSdOptions_SdOption_SdIpv4MulticastOption], io: KaitaiStream, root: KaitaiStruct, parent: SomeIpSdOptions_SdOption): SomeIpSdOptions_SdOption_SdIpv4MulticastOption =
  template this: untyped = result
  this = new(SomeIpSdOptions_SdOption_SdIpv4MulticastOption)
  let root = if root == nil: cast[SomeIpSdOptions](this) else: cast[SomeIpSdOptions](root)
  this.io = io
  this.root = root
  this.parent = parent

  let reservedExpr = this.io.readU1()
  this.reserved = reservedExpr
  let addressExpr = this.io.readBytes(int(4))
  this.address = addressExpr
  let reserved2Expr = this.io.readU1()
  this.reserved2 = reserved2Expr
  let l4ProtocolExpr = this.io.readU1()
  this.l4Protocol = l4ProtocolExpr
  let portExpr = this.io.readU2be()
  this.port = portExpr

proc fromFile*(_: typedesc[SomeIpSdOptions_SdOption_SdIpv4MulticastOption], filename: string): SomeIpSdOptions_SdOption_SdIpv4MulticastOption =
  SomeIpSdOptions_SdOption_SdIpv4MulticastOption.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[SomeIpSdOptions_SdOption_SdIpv4SdEndpointOption], io: KaitaiStream, root: KaitaiStruct, parent: SomeIpSdOptions_SdOption): SomeIpSdOptions_SdOption_SdIpv4SdEndpointOption =
  template this: untyped = result
  this = new(SomeIpSdOptions_SdOption_SdIpv4SdEndpointOption)
  let root = if root == nil: cast[SomeIpSdOptions](this) else: cast[SomeIpSdOptions](root)
  this.io = io
  this.root = root
  this.parent = parent

  let reservedExpr = this.io.readU1()
  this.reserved = reservedExpr
  let addressExpr = this.io.readBytes(int(4))
  this.address = addressExpr
  let reserved2Expr = this.io.readU1()
  this.reserved2 = reserved2Expr
  let l4ProtocolExpr = this.io.readU1()
  this.l4Protocol = l4ProtocolExpr
  let portExpr = this.io.readU2be()
  this.port = portExpr

proc fromFile*(_: typedesc[SomeIpSdOptions_SdOption_SdIpv4SdEndpointOption], filename: string): SomeIpSdOptions_SdOption_SdIpv4SdEndpointOption =
  SomeIpSdOptions_SdOption_SdIpv4SdEndpointOption.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[SomeIpSdOptions_SdOption_SdIpv6EndpointOption], io: KaitaiStream, root: KaitaiStruct, parent: SomeIpSdOptions_SdOption): SomeIpSdOptions_SdOption_SdIpv6EndpointOption =
  template this: untyped = result
  this = new(SomeIpSdOptions_SdOption_SdIpv6EndpointOption)
  let root = if root == nil: cast[SomeIpSdOptions](this) else: cast[SomeIpSdOptions](root)
  this.io = io
  this.root = root
  this.parent = parent

  let reservedExpr = this.io.readU1()
  this.reserved = reservedExpr
  let addressExpr = this.io.readBytes(int(16))
  this.address = addressExpr
  let reserved2Expr = this.io.readU1()
  this.reserved2 = reserved2Expr
  let l4ProtocolExpr = this.io.readU1()
  this.l4Protocol = l4ProtocolExpr
  let portExpr = this.io.readU2be()
  this.port = portExpr

proc fromFile*(_: typedesc[SomeIpSdOptions_SdOption_SdIpv6EndpointOption], filename: string): SomeIpSdOptions_SdOption_SdIpv6EndpointOption =
  SomeIpSdOptions_SdOption_SdIpv6EndpointOption.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[SomeIpSdOptions_SdOption_SdIpv6MulticastOption], io: KaitaiStream, root: KaitaiStruct, parent: SomeIpSdOptions_SdOption): SomeIpSdOptions_SdOption_SdIpv6MulticastOption =
  template this: untyped = result
  this = new(SomeIpSdOptions_SdOption_SdIpv6MulticastOption)
  let root = if root == nil: cast[SomeIpSdOptions](this) else: cast[SomeIpSdOptions](root)
  this.io = io
  this.root = root
  this.parent = parent

  let reservedExpr = this.io.readU1()
  this.reserved = reservedExpr
  let addressExpr = this.io.readBytes(int(16))
  this.address = addressExpr
  let reserved2Expr = this.io.readU1()
  this.reserved2 = reserved2Expr
  let l4ProtocolExpr = this.io.readU1()
  this.l4Protocol = l4ProtocolExpr
  let portExpr = this.io.readU2be()
  this.port = portExpr

proc fromFile*(_: typedesc[SomeIpSdOptions_SdOption_SdIpv6MulticastOption], filename: string): SomeIpSdOptions_SdOption_SdIpv6MulticastOption =
  SomeIpSdOptions_SdOption_SdIpv6MulticastOption.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[SomeIpSdOptions_SdOption_SdIpv6SdEndpointOption], io: KaitaiStream, root: KaitaiStruct, parent: SomeIpSdOptions_SdOption): SomeIpSdOptions_SdOption_SdIpv6SdEndpointOption =
  template this: untyped = result
  this = new(SomeIpSdOptions_SdOption_SdIpv6SdEndpointOption)
  let root = if root == nil: cast[SomeIpSdOptions](this) else: cast[SomeIpSdOptions](root)
  this.io = io
  this.root = root
  this.parent = parent

  let reservedExpr = this.io.readU1()
  this.reserved = reservedExpr
  let addressExpr = this.io.readBytes(int(16))
  this.address = addressExpr
  let reserved2Expr = this.io.readU1()
  this.reserved2 = reserved2Expr
  let l4ProtocolExpr = this.io.readU1()
  this.l4Protocol = l4ProtocolExpr
  let portExpr = this.io.readU2be()
  this.port = portExpr

proc fromFile*(_: typedesc[SomeIpSdOptions_SdOption_SdIpv6SdEndpointOption], filename: string): SomeIpSdOptions_SdOption_SdIpv6SdEndpointOption =
  SomeIpSdOptions_SdOption_SdIpv6SdEndpointOption.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[SomeIpSdOptions_SdOption_SdLoadBalancingOption], io: KaitaiStream, root: KaitaiStruct, parent: SomeIpSdOptions_SdOption): SomeIpSdOptions_SdOption_SdLoadBalancingOption =
  template this: untyped = result
  this = new(SomeIpSdOptions_SdOption_SdLoadBalancingOption)
  let root = if root == nil: cast[SomeIpSdOptions](this) else: cast[SomeIpSdOptions](root)
  this.io = io
  this.root = root
  this.parent = parent

  let reservedExpr = this.io.readU1()
  this.reserved = reservedExpr
  let priorityExpr = this.io.readU2be()
  this.priority = priorityExpr
  let weightExpr = this.io.readU2be()
  this.weight = weightExpr

proc fromFile*(_: typedesc[SomeIpSdOptions_SdOption_SdLoadBalancingOption], filename: string): SomeIpSdOptions_SdOption_SdLoadBalancingOption =
  SomeIpSdOptions_SdOption_SdLoadBalancingOption.read(newKaitaiFileStream(filename), nil, nil)

proc read*(_: typedesc[SomeIpSdOptions_SdOption_SdOptionHeader], io: KaitaiStream, root: KaitaiStruct, parent: SomeIpSdOptions_SdOption): SomeIpSdOptions_SdOption_SdOptionHeader =
  template this: untyped = result
  this = new(SomeIpSdOptions_SdOption_SdOptionHeader)
  let root = if root == nil: cast[SomeIpSdOptions](this) else: cast[SomeIpSdOptions](root)
  this.io = io
  this.root = root
  this.parent = parent

  let lengthExpr = this.io.readU2be()
  this.length = lengthExpr
  let typeExpr = SomeIpSdOptions_SdOption_OptionTypes(this.io.readU1())
  this.type = typeExpr

proc fromFile*(_: typedesc[SomeIpSdOptions_SdOption_SdOptionHeader], filename: string): SomeIpSdOptions_SdOption_SdOptionHeader =
  SomeIpSdOptions_SdOption_SdOptionHeader.read(newKaitaiFileStream(filename), nil, nil)

