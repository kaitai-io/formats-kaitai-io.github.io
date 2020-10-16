import kaitai_struct_nim_runtime
import options
import /network/some_ip/some_ip_sd_entries
import /network/some_ip/some_ip_sd_options

import "some_ip_sd_entries"
import "some_ip_sd_options"
type
  SomeIpSd* = ref object of KaitaiStruct
    `flags`*: SomeIpSd_SdFlags
    `reserved`*: seq[byte]
    `lenEntries`*: uint32
    `entries`*: SomeIpSdEntries
    `lenOptions`*: uint32
    `options`*: SomeIpSdOptions
    `parent`*: KaitaiStruct
    `rawEntries`*: seq[byte]
    `rawOptions`*: seq[byte]
  SomeIpSd_SdFlags* = ref object of KaitaiStruct
    `reboot`*: bool
    `unicast`*: bool
    `initialData`*: bool
    `reserved`*: uint64
    `parent`*: SomeIpSd

proc read*(_: typedesc[SomeIpSd], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): SomeIpSd
proc read*(_: typedesc[SomeIpSd_SdFlags], io: KaitaiStream, root: KaitaiStruct, parent: SomeIpSd): SomeIpSd_SdFlags



##[
The main tasks of the Service Discovery Protocol are communicating the
availability of functional entities called services in the in-vehicle
communication as well as controlling the send behavior of event messages.
This allows sending only event messages to receivers requiring them (Publish/Subscribe).
The solution described here is also known as SOME/IP-SD
(Scalable service-Oriented MiddlewarE over IP - Service Discovery).

@see <a href="https://www.autosar.org/fileadmin/user_upload/standards/foundation/19-11/AUTOSAR_PRS_SOMEIPServiceDiscoveryProtocol.pdf">Source</a>
]##
proc read*(_: typedesc[SomeIpSd], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): SomeIpSd =
  template this: untyped = result
  this = new(SomeIpSd)
  let root = if root == nil: cast[SomeIpSd](this) else: cast[SomeIpSd](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  The SOME/IP-SD Header shall start with an 8 Bit field called flags.
  ]##
  let flagsExpr = SomeIpSd_SdFlags.read(this.io, this.root, this)
  this.flags = flagsExpr
  let reservedExpr = this.io.readBytes(int(3))
  this.reserved = reservedExpr
  let lenEntriesExpr = this.io.readU4be()
  this.lenEntries = lenEntriesExpr
  let rawEntriesExpr = this.io.readBytes(int(this.lenEntries))
  this.rawEntries = rawEntriesExpr
  let rawEntriesIo = newKaitaiStream(rawEntriesExpr)
  let entriesExpr = SomeIpSdEntries.read(rawEntriesIo, this.root, this)
  this.entries = entriesExpr
  let lenOptionsExpr = this.io.readU4be()
  this.lenOptions = lenOptionsExpr
  let rawOptionsExpr = this.io.readBytes(int(this.lenOptions))
  this.rawOptions = rawOptionsExpr
  let rawOptionsIo = newKaitaiStream(rawOptionsExpr)
  let optionsExpr = SomeIpSdOptions.read(rawOptionsIo, this.root, this)
  this.options = optionsExpr

proc fromFile*(_: typedesc[SomeIpSd], filename: string): SomeIpSd =
  SomeIpSd.read(newKaitaiFileStream(filename), nil, nil)


##[
@see "AUTOSAR_PRS_SOMEIPServiceDiscoveryProtocol.pdf - Figure 4.3"
]##
proc read*(_: typedesc[SomeIpSd_SdFlags], io: KaitaiStream, root: KaitaiStruct, parent: SomeIpSd): SomeIpSd_SdFlags =
  template this: untyped = result
  this = new(SomeIpSd_SdFlags)
  let root = if root == nil: cast[SomeIpSd](this) else: cast[SomeIpSd](root)
  this.io = io
  this.root = root
  this.parent = parent

  let rebootExpr = this.io.readBitsIntBe(1) != 0
  this.reboot = rebootExpr
  let unicastExpr = this.io.readBitsIntBe(1) != 0
  this.unicast = unicastExpr
  let initialDataExpr = this.io.readBitsIntBe(1) != 0
  this.initialData = initialDataExpr
  let reservedExpr = this.io.readBitsIntBe(5)
  this.reserved = reservedExpr

proc fromFile*(_: typedesc[SomeIpSd_SdFlags], filename: string): SomeIpSd_SdFlags =
  SomeIpSd_SdFlags.read(newKaitaiFileStream(filename), nil, nil)

