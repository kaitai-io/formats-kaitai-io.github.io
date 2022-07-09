import kaitai_struct_nim_runtime
import options
import /network/ipv4_packet
import /network/ipv6_packet

import "ipv4_packet"
import "ipv6_packet"
type
  EthernetFrame* = ref object of KaitaiStruct
    `dstMac`*: seq[byte]
    `srcMac`*: seq[byte]
    `etherType1`*: EthernetFrame_EtherTypeEnum
    `tci`*: EthernetFrame_TagControlInfo
    `etherType2`*: EthernetFrame_EtherTypeEnum
    `body`*: KaitaiStruct
    `parent`*: KaitaiStruct
    `rawBody`*: seq[byte]
    `etherTypeInst`: EthernetFrame_EtherTypeEnum
    `etherTypeInstFlag`: bool
  EthernetFrame_EtherTypeEnum* = enum
    ipv4 = 2048
    x_75_internet = 2049
    nbs_internet = 2050
    ecma_internet = 2051
    chaosnet = 2052
    x_25_level_3 = 2053
    arp = 2054
    ieee_802_1q_tpid = 33024
    ipv6 = 34525
  EthernetFrame_TagControlInfo* = ref object of KaitaiStruct
    `priority`*: uint64
    `dropEligible`*: bool
    `vlanId`*: uint64
    `parent`*: EthernetFrame

proc read*(_: typedesc[EthernetFrame], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): EthernetFrame
proc read*(_: typedesc[EthernetFrame_TagControlInfo], io: KaitaiStream, root: KaitaiStruct, parent: EthernetFrame): EthernetFrame_TagControlInfo

proc etherType*(this: EthernetFrame): EthernetFrame_EtherTypeEnum


##[
Ethernet frame is a OSI data link layer (layer 2) protocol data unit
for Ethernet networks. In practice, many other networks and/or
in-file dumps adopted the same format for encapsulation purposes.

@see <a href="https://ieeexplore.ieee.org/document/7428776">Source</a>
]##
proc read*(_: typedesc[EthernetFrame], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): EthernetFrame =
  template this: untyped = result
  this = new(EthernetFrame)
  let root = if root == nil: cast[EthernetFrame](this) else: cast[EthernetFrame](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  Destination MAC address
  ]##
  let dstMacExpr = this.io.readBytes(int(6))
  this.dstMac = dstMacExpr

  ##[
  Source MAC address
  ]##
  let srcMacExpr = this.io.readBytes(int(6))
  this.srcMac = srcMacExpr

  ##[
  Either ether type or TPID if it is a IEEE 802.1Q frame
  ]##
  let etherType1Expr = EthernetFrame_EtherTypeEnum(this.io.readU2be())
  this.etherType1 = etherType1Expr
  if this.etherType1 == ethernet_frame.ieee_802_1q_tpid:
    let tciExpr = EthernetFrame_TagControlInfo.read(this.io, this.root, this)
    this.tci = tciExpr
  if this.etherType1 == ethernet_frame.ieee_802_1q_tpid:
    let etherType2Expr = EthernetFrame_EtherTypeEnum(this.io.readU2be())
    this.etherType2 = etherType2Expr
  block:
    let on = this.etherType
    if on == ethernet_frame.ipv4:
      let rawBodyExpr = this.io.readBytesFull()
      this.rawBody = rawBodyExpr
      let rawBodyIo = newKaitaiStream(rawBodyExpr)
      let bodyExpr = Ipv4Packet.read(rawBodyIo, this.root, this)
      this.body = bodyExpr
    elif on == ethernet_frame.ipv6:
      let rawBodyExpr = this.io.readBytesFull()
      this.rawBody = rawBodyExpr
      let rawBodyIo = newKaitaiStream(rawBodyExpr)
      let bodyExpr = Ipv6Packet.read(rawBodyIo, this.root, this)
      this.body = bodyExpr
    else:
      let bodyExpr = this.io.readBytesFull()
      this.body = bodyExpr

proc etherType(this: EthernetFrame): EthernetFrame_EtherTypeEnum = 

  ##[
  Ether type can be specied in several places in the frame. If
first location bears special marker (0x8100), then it is not the
real ether frame yet, an additional payload (`tci`) is expected
and real ether type is upcoming next.

  ]##
  if this.etherTypeInstFlag:
    return this.etherTypeInst
  let etherTypeInstExpr = EthernetFrame_EtherTypeEnum((if this.etherType1 == ethernet_frame.ieee_802_1q_tpid: this.etherType2 else: this.etherType1))
  this.etherTypeInst = etherTypeInstExpr
  this.etherTypeInstFlag = true
  return this.etherTypeInst

proc fromFile*(_: typedesc[EthernetFrame], filename: string): EthernetFrame =
  EthernetFrame.read(newKaitaiFileStream(filename), nil, nil)


##[
Tag Control Information (TCI) is an extension of IEEE 802.1Q to
support VLANs on normal IEEE 802.3 Ethernet network.

]##
proc read*(_: typedesc[EthernetFrame_TagControlInfo], io: KaitaiStream, root: KaitaiStruct, parent: EthernetFrame): EthernetFrame_TagControlInfo =
  template this: untyped = result
  this = new(EthernetFrame_TagControlInfo)
  let root = if root == nil: cast[EthernetFrame](this) else: cast[EthernetFrame](root)
  this.io = io
  this.root = root
  this.parent = parent


  ##[
  Priority Code Point (PCP) is used to specify priority for
different kinds of traffic.

  ]##
  let priorityExpr = this.io.readBitsIntBe(3)
  this.priority = priorityExpr

  ##[
  Drop Eligible Indicator (DEI) specifies if frame is eligible
to dropping while congestion is detected for certain classes
of traffic.

  ]##
  let dropEligibleExpr = this.io.readBitsIntBe(1) != 0
  this.dropEligible = dropEligibleExpr

  ##[
  VLAN Identifier (VID) specifies which VLAN this frame
belongs to.

  ]##
  let vlanIdExpr = this.io.readBitsIntBe(12)
  this.vlanId = vlanIdExpr

proc fromFile*(_: typedesc[EthernetFrame_TagControlInfo], filename: string): EthernetFrame_TagControlInfo =
  EthernetFrame_TagControlInfo.read(newKaitaiFileStream(filename), nil, nil)

