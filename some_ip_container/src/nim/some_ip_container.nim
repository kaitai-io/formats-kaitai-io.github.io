import kaitai_struct_nim_runtime
import options
import /network/some_ip/some_ip

import "some_ip"
type
  SomeIpContainer* = ref object of KaitaiStruct
    `someIpPackages`*: seq[SomeIp]
    `parent`*: KaitaiStruct

proc read*(_: typedesc[SomeIpContainer], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): SomeIpContainer


proc read*(_: typedesc[SomeIpContainer], io: KaitaiStream, root: KaitaiStruct, parent: KaitaiStruct): SomeIpContainer =
  template this: untyped = result
  this = new(SomeIpContainer)
  let root = if root == nil: cast[SomeIpContainer](this) else: cast[SomeIpContainer](root)
  this.io = io
  this.root = root
  this.parent = parent

  block:
    var i: int
    while not this.io.isEof:
      let it = SomeIp.read(this.io, this.root, this)
      this.someIpPackages.add(it)
      inc i

proc fromFile*(_: typedesc[SomeIpContainer], filename: string): SomeIpContainer =
  SomeIpContainer.read(newKaitaiFileStream(filename), nil, nil)

