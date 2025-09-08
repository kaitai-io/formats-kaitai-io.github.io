// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#![allow(unused_imports)]
#![allow(non_snake_case)]
#![allow(non_camel_case_types)]
#![allow(irrefutable_let_patterns)]
#![allow(unused_comparisons)]

extern crate kaitai;
use kaitai::*;
use std::convert::{TryFrom, TryInto};
use std::cell::{Ref, Cell, RefCell};
use std::rc::{Rc, Weak};

/**
 * Also referred to as Devicetree Blob (DTB). It is a flat binary encoding
 * of data (primarily devicetree data, although other data is possible as well).
 * The data is internally stored as a tree of named nodes and properties. Nodes
 * contain properties and child nodes, while properties are name-value pairs.
 * 
 * The Devicetree Blobs (`.dtb` files) are compiled from the Devicetree Source
 * files (`.dts`) through the Devicetree compiler (DTC).
 * 
 * On Linux systems that support this, the blobs can be accessed in
 * `/sys/firmware/fdt`:
 * 
 * * <https://www.kernel.org/doc/Documentation/ABI/testing/sysfs-firmware-ofw>
 * 
 * The encoding of strings used in the `strings_block` and `structure_block` is
 * actually a subset of ASCII:
 * 
 * <https://devicetree-specification.readthedocs.io/en/v0.3/devicetree-basics.html#node-names>
 * 
 * Example files:
 * 
 * * <https://github.com/qemu/qemu/tree/master/pc-bios>
 * \sa https://devicetree-specification.readthedocs.io/en/v0.3/flattened-format.html Source
 * \sa https://elinux.org/images/f/f4/Elc2013_Fernandes.pdf Source
 */

#[derive(Default, Debug, Clone)]
pub struct Dtb {
    pub _root: SharedType<Dtb>,
    pub _parent: SharedType<Dtb>,
    pub _self: SharedType<Self>,
    magic: RefCell<Vec<u8>>,
    total_size: RefCell<u32>,
    ofs_structure_block: RefCell<u32>,
    ofs_strings_block: RefCell<u32>,
    ofs_memory_reservation_block: RefCell<u32>,
    version: RefCell<u32>,
    min_compatible_version: RefCell<u32>,
    boot_cpuid_phys: RefCell<u32>,
    len_strings_block: RefCell<u32>,
    len_structure_block: RefCell<u32>,
    _io: RefCell<BytesReader>,
    memory_reservation_block_raw: RefCell<Vec<u8>>,
    strings_block_raw: RefCell<Vec<u8>>,
    structure_block_raw: RefCell<Vec<u8>>,
    f_memory_reservation_block: Cell<bool>,
    memory_reservation_block: RefCell<OptRc<Dtb_MemoryBlock>>,
    f_strings_block: Cell<bool>,
    strings_block: RefCell<OptRc<Dtb_Strings>>,
    f_structure_block: Cell<bool>,
    structure_block: RefCell<OptRc<Dtb_FdtBlock>>,
}
impl KStruct for Dtb {
    type Root = Dtb;
    type Parent = Dtb;

    fn read<S: KStream>(
        self_rc: &OptRc<Self>,
        _io: &S,
        _root: SharedType<Self::Root>,
        _parent: SharedType<Self::Parent>,
    ) -> KResult<()> {
        *self_rc._io.borrow_mut() = _io.clone();
        self_rc._root.set(_root.get());
        self_rc._parent.set(_parent.get());
        self_rc._self.set(Ok(self_rc.clone()));
        let _rrc = self_rc._root.get_value().borrow().upgrade();
        let _prc = self_rc._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        *self_rc.magic.borrow_mut() = _io.read_bytes(4 as usize)?.into();
        if !(*self_rc.magic() == vec![0xd0u8, 0xdu8, 0xfeu8, 0xedu8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/seq/0".to_string() }));
        }
        *self_rc.total_size.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.ofs_structure_block.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.ofs_strings_block.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.ofs_memory_reservation_block.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.version.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.min_compatible_version.borrow_mut() = _io.read_u4be()?.into();
        if !(*self_rc.min_compatible_version() <= *self_rc.version()) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::GreaterThan, src_path: "/seq/6".to_string() }));
        }
        *self_rc.boot_cpuid_phys.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.len_strings_block.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.len_structure_block.borrow_mut() = _io.read_u4be()?.into();
        Ok(())
    }
}
impl Dtb {
    pub fn memory_reservation_block(
        &self
    ) -> KResult<Ref<'_, OptRc<Dtb_MemoryBlock>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_memory_reservation_block.get() {
            return Ok(self.memory_reservation_block.borrow());
        }
        let _pos = _io.pos();
        _io.seek(*self.ofs_memory_reservation_block() as usize)?;
        *self.memory_reservation_block_raw.borrow_mut() = _io.read_bytes(((*self.ofs_structure_block() as u32) - (*self.ofs_memory_reservation_block() as u32)) as usize)?.into();
        let memory_reservation_block_raw = self.memory_reservation_block_raw.borrow();
        let _t_memory_reservation_block_raw_io = BytesReader::from(memory_reservation_block_raw.clone());
        let t = Self::read_into::<BytesReader, Dtb_MemoryBlock>(&_t_memory_reservation_block_raw_io, Some(self._root.clone()), Some(self._self.clone()))?.into();
        *self.memory_reservation_block.borrow_mut() = t;
        _io.seek(_pos)?;
        Ok(self.memory_reservation_block.borrow())
    }
    pub fn strings_block(
        &self
    ) -> KResult<Ref<'_, OptRc<Dtb_Strings>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_strings_block.get() {
            return Ok(self.strings_block.borrow());
        }
        let _pos = _io.pos();
        _io.seek(*self.ofs_strings_block() as usize)?;
        *self.strings_block_raw.borrow_mut() = _io.read_bytes(*self.len_strings_block() as usize)?.into();
        let strings_block_raw = self.strings_block_raw.borrow();
        let _t_strings_block_raw_io = BytesReader::from(strings_block_raw.clone());
        let t = Self::read_into::<BytesReader, Dtb_Strings>(&_t_strings_block_raw_io, Some(self._root.clone()), Some(self._self.clone()))?.into();
        *self.strings_block.borrow_mut() = t;
        _io.seek(_pos)?;
        Ok(self.strings_block.borrow())
    }
    pub fn structure_block(
        &self
    ) -> KResult<Ref<'_, OptRc<Dtb_FdtBlock>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_structure_block.get() {
            return Ok(self.structure_block.borrow());
        }
        let _pos = _io.pos();
        _io.seek(*self.ofs_structure_block() as usize)?;
        *self.structure_block_raw.borrow_mut() = _io.read_bytes(*self.len_structure_block() as usize)?.into();
        let structure_block_raw = self.structure_block_raw.borrow();
        let _t_structure_block_raw_io = BytesReader::from(structure_block_raw.clone());
        let t = Self::read_into::<BytesReader, Dtb_FdtBlock>(&_t_structure_block_raw_io, Some(self._root.clone()), Some(self._self.clone()))?.into();
        *self.structure_block.borrow_mut() = t;
        _io.seek(_pos)?;
        Ok(self.structure_block.borrow())
    }
}
impl Dtb {
    pub fn magic(&self) -> Ref<'_, Vec<u8>> {
        self.magic.borrow()
    }
}
impl Dtb {
    pub fn total_size(&self) -> Ref<'_, u32> {
        self.total_size.borrow()
    }
}
impl Dtb {
    pub fn ofs_structure_block(&self) -> Ref<'_, u32> {
        self.ofs_structure_block.borrow()
    }
}
impl Dtb {
    pub fn ofs_strings_block(&self) -> Ref<'_, u32> {
        self.ofs_strings_block.borrow()
    }
}
impl Dtb {
    pub fn ofs_memory_reservation_block(&self) -> Ref<'_, u32> {
        self.ofs_memory_reservation_block.borrow()
    }
}
impl Dtb {
    pub fn version(&self) -> Ref<'_, u32> {
        self.version.borrow()
    }
}
impl Dtb {
    pub fn min_compatible_version(&self) -> Ref<'_, u32> {
        self.min_compatible_version.borrow()
    }
}
impl Dtb {
    pub fn boot_cpuid_phys(&self) -> Ref<'_, u32> {
        self.boot_cpuid_phys.borrow()
    }
}
impl Dtb {
    pub fn len_strings_block(&self) -> Ref<'_, u32> {
        self.len_strings_block.borrow()
    }
}
impl Dtb {
    pub fn len_structure_block(&self) -> Ref<'_, u32> {
        self.len_structure_block.borrow()
    }
}
impl Dtb {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
impl Dtb {
    pub fn memory_reservation_block_raw(&self) -> Ref<'_, Vec<u8>> {
        self.memory_reservation_block_raw.borrow()
    }
}
impl Dtb {
    pub fn strings_block_raw(&self) -> Ref<'_, Vec<u8>> {
        self.strings_block_raw.borrow()
    }
}
impl Dtb {
    pub fn structure_block_raw(&self) -> Ref<'_, Vec<u8>> {
        self.structure_block_raw.borrow()
    }
}
#[derive(Debug, PartialEq, Clone)]
pub enum Dtb_Fdt {
    BeginNode,
    EndNode,
    Prop,
    Nop,
    End,
    Unknown(i64),
}

impl TryFrom<i64> for Dtb_Fdt {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<Dtb_Fdt> {
        match flag {
            1 => Ok(Dtb_Fdt::BeginNode),
            2 => Ok(Dtb_Fdt::EndNode),
            3 => Ok(Dtb_Fdt::Prop),
            4 => Ok(Dtb_Fdt::Nop),
            9 => Ok(Dtb_Fdt::End),
            _ => Ok(Dtb_Fdt::Unknown(flag)),
        }
    }
}

impl From<&Dtb_Fdt> for i64 {
    fn from(v: &Dtb_Fdt) -> Self {
        match *v {
            Dtb_Fdt::BeginNode => 1,
            Dtb_Fdt::EndNode => 2,
            Dtb_Fdt::Prop => 3,
            Dtb_Fdt::Nop => 4,
            Dtb_Fdt::End => 9,
            Dtb_Fdt::Unknown(v) => v
        }
    }
}

impl Default for Dtb_Fdt {
    fn default() -> Self { Dtb_Fdt::Unknown(0) }
}


#[derive(Default, Debug, Clone)]
pub struct Dtb_FdtBeginNode {
    pub _root: SharedType<Dtb>,
    pub _parent: SharedType<Dtb_FdtNode>,
    pub _self: SharedType<Self>,
    name: RefCell<String>,
    padding: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Dtb_FdtBeginNode {
    type Root = Dtb;
    type Parent = Dtb_FdtNode;

    fn read<S: KStream>(
        self_rc: &OptRc<Self>,
        _io: &S,
        _root: SharedType<Self::Root>,
        _parent: SharedType<Self::Parent>,
    ) -> KResult<()> {
        *self_rc._io.borrow_mut() = _io.clone();
        self_rc._root.set(_root.get());
        self_rc._parent.set(_parent.get());
        self_rc._self.set(Ok(self_rc.clone()));
        let _rrc = self_rc._root.get_value().borrow().upgrade();
        let _prc = self_rc._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        *self_rc.name.borrow_mut() = bytes_to_str(&_io.read_bytes_term(0, false, true, true)?.into(), "ASCII")?;
        *self_rc.padding.borrow_mut() = _io.read_bytes(modulo(-(_io.pos()) as i64, 4 as i64) as usize)?.into();
        Ok(())
    }
}
impl Dtb_FdtBeginNode {
}
impl Dtb_FdtBeginNode {
    pub fn name(&self) -> Ref<'_, String> {
        self.name.borrow()
    }
}
impl Dtb_FdtBeginNode {
    pub fn padding(&self) -> Ref<'_, Vec<u8>> {
        self.padding.borrow()
    }
}
impl Dtb_FdtBeginNode {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Dtb_FdtBlock {
    pub _root: SharedType<Dtb>,
    pub _parent: SharedType<Dtb>,
    pub _self: SharedType<Self>,
    nodes: RefCell<Vec<OptRc<Dtb_FdtNode>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Dtb_FdtBlock {
    type Root = Dtb;
    type Parent = Dtb;

    fn read<S: KStream>(
        self_rc: &OptRc<Self>,
        _io: &S,
        _root: SharedType<Self::Root>,
        _parent: SharedType<Self::Parent>,
    ) -> KResult<()> {
        *self_rc._io.borrow_mut() = _io.clone();
        self_rc._root.set(_root.get());
        self_rc._parent.set(_parent.get());
        self_rc._self.set(Ok(self_rc.clone()));
        let _rrc = self_rc._root.get_value().borrow().upgrade();
        let _prc = self_rc._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        *self_rc.nodes.borrow_mut() = Vec::new();
        {
            let mut _i = 0;
            while {
                let t = Self::read_into::<_, Dtb_FdtNode>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                self_rc.nodes.borrow_mut().push(t);
                let _t_nodes = self_rc.nodes.borrow();
                let _tmpa = _t_nodes.last().unwrap();
                _i += 1;
                let x = !(*_tmpa.type() == Dtb_Fdt::End);
                x
            } {}
        }
        Ok(())
    }
}
impl Dtb_FdtBlock {
}
impl Dtb_FdtBlock {
    pub fn nodes(&self) -> Ref<'_, Vec<OptRc<Dtb_FdtNode>>> {
        self.nodes.borrow()
    }
}
impl Dtb_FdtBlock {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Dtb_FdtNode {
    pub _root: SharedType<Dtb>,
    pub _parent: SharedType<Dtb_FdtBlock>,
    pub _self: SharedType<Self>,
    type: RefCell<Dtb_Fdt>,
    body: RefCell<Option<Dtb_FdtNode_Body>>,
    _io: RefCell<BytesReader>,
}
#[derive(Debug, Clone)]
pub enum Dtb_FdtNode_Body {
    Dtb_FdtBeginNode(OptRc<Dtb_FdtBeginNode>),
    Dtb_FdtProp(OptRc<Dtb_FdtProp>),
}
impl From<&Dtb_FdtNode_Body> for OptRc<Dtb_FdtBeginNode> {
    fn from(v: &Dtb_FdtNode_Body) -> Self {
        if let Dtb_FdtNode_Body::Dtb_FdtBeginNode(x) = v {
            return x.clone();
        }
        panic!("expected Dtb_FdtNode_Body::Dtb_FdtBeginNode, got {:?}", v)
    }
}
impl From<OptRc<Dtb_FdtBeginNode>> for Dtb_FdtNode_Body {
    fn from(v: OptRc<Dtb_FdtBeginNode>) -> Self {
        Self::Dtb_FdtBeginNode(v)
    }
}
impl From<&Dtb_FdtNode_Body> for OptRc<Dtb_FdtProp> {
    fn from(v: &Dtb_FdtNode_Body) -> Self {
        if let Dtb_FdtNode_Body::Dtb_FdtProp(x) = v {
            return x.clone();
        }
        panic!("expected Dtb_FdtNode_Body::Dtb_FdtProp, got {:?}", v)
    }
}
impl From<OptRc<Dtb_FdtProp>> for Dtb_FdtNode_Body {
    fn from(v: OptRc<Dtb_FdtProp>) -> Self {
        Self::Dtb_FdtProp(v)
    }
}
impl KStruct for Dtb_FdtNode {
    type Root = Dtb;
    type Parent = Dtb_FdtBlock;

    fn read<S: KStream>(
        self_rc: &OptRc<Self>,
        _io: &S,
        _root: SharedType<Self::Root>,
        _parent: SharedType<Self::Parent>,
    ) -> KResult<()> {
        *self_rc._io.borrow_mut() = _io.clone();
        self_rc._root.set(_root.get());
        self_rc._parent.set(_parent.get());
        self_rc._self.set(Ok(self_rc.clone()));
        let _rrc = self_rc._root.get_value().borrow().upgrade();
        let _prc = self_rc._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        *self_rc.type.borrow_mut() = (_io.read_u4be()? as i64).try_into()?;
        match *self_rc.type() {
            Dtb_Fdt::BeginNode => {
                let t = Self::read_into::<_, Dtb_FdtBeginNode>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            Dtb_Fdt::Prop => {
                let t = Self::read_into::<_, Dtb_FdtProp>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.body.borrow_mut() = Some(t);
            }
            _ => {}
        }
        Ok(())
    }
}
impl Dtb_FdtNode {
}
impl Dtb_FdtNode {
    pub fn type(&self) -> Ref<'_, Dtb_Fdt> {
        self.type.borrow()
    }
}
impl Dtb_FdtNode {
    pub fn body(&self) -> Ref<'_, Option<Dtb_FdtNode_Body>> {
        self.body.borrow()
    }
}
impl Dtb_FdtNode {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Dtb_FdtProp {
    pub _root: SharedType<Dtb>,
    pub _parent: SharedType<Dtb_FdtNode>,
    pub _self: SharedType<Self>,
    len_property: RefCell<u32>,
    ofs_name: RefCell<u32>,
    property: RefCell<Vec<u8>>,
    padding: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
    f_name: Cell<bool>,
    name: RefCell<String>,
}
impl KStruct for Dtb_FdtProp {
    type Root = Dtb;
    type Parent = Dtb_FdtNode;

    fn read<S: KStream>(
        self_rc: &OptRc<Self>,
        _io: &S,
        _root: SharedType<Self::Root>,
        _parent: SharedType<Self::Parent>,
    ) -> KResult<()> {
        *self_rc._io.borrow_mut() = _io.clone();
        self_rc._root.set(_root.get());
        self_rc._parent.set(_parent.get());
        self_rc._self.set(Ok(self_rc.clone()));
        let _rrc = self_rc._root.get_value().borrow().upgrade();
        let _prc = self_rc._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        *self_rc.len_property.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.ofs_name.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.property.borrow_mut() = _io.read_bytes(*self_rc.len_property() as usize)?.into();
        *self_rc.padding.borrow_mut() = _io.read_bytes(modulo(-(_io.pos()) as i64, 4 as i64) as usize)?.into();
        Ok(())
    }
}
impl Dtb_FdtProp {
    pub fn name(
        &self
    ) -> KResult<Ref<'_, String>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_name.get() {
            return Ok(self.name.borrow());
        }
        self.f_name.set(true);
        let io = Clone::clone(&*_r.strings_block()?._io());
        let _pos = io.pos();
        io.seek(*self.ofs_name() as usize)?;
        *self.name.borrow_mut() = bytes_to_str(&io.read_bytes_term(0, false, true, true)?.into(), "ASCII")?;
        io.seek(_pos)?;
        Ok(self.name.borrow())
    }
}
impl Dtb_FdtProp {
    pub fn len_property(&self) -> Ref<'_, u32> {
        self.len_property.borrow()
    }
}
impl Dtb_FdtProp {
    pub fn ofs_name(&self) -> Ref<'_, u32> {
        self.ofs_name.borrow()
    }
}
impl Dtb_FdtProp {
    pub fn property(&self) -> Ref<'_, Vec<u8>> {
        self.property.borrow()
    }
}
impl Dtb_FdtProp {
    pub fn padding(&self) -> Ref<'_, Vec<u8>> {
        self.padding.borrow()
    }
}
impl Dtb_FdtProp {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Dtb_MemoryBlock {
    pub _root: SharedType<Dtb>,
    pub _parent: SharedType<Dtb>,
    pub _self: SharedType<Self>,
    entries: RefCell<Vec<OptRc<Dtb_MemoryBlockEntry>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Dtb_MemoryBlock {
    type Root = Dtb;
    type Parent = Dtb;

    fn read<S: KStream>(
        self_rc: &OptRc<Self>,
        _io: &S,
        _root: SharedType<Self::Root>,
        _parent: SharedType<Self::Parent>,
    ) -> KResult<()> {
        *self_rc._io.borrow_mut() = _io.clone();
        self_rc._root.set(_root.get());
        self_rc._parent.set(_parent.get());
        self_rc._self.set(Ok(self_rc.clone()));
        let _rrc = self_rc._root.get_value().borrow().upgrade();
        let _prc = self_rc._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        *self_rc.entries.borrow_mut() = Vec::new();
        {
            let mut _i = 0;
            while !_io.is_eof() {
                let t = Self::read_into::<_, Dtb_MemoryBlockEntry>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                self_rc.entries.borrow_mut().push(t);
                _i += 1;
            }
        }
        Ok(())
    }
}
impl Dtb_MemoryBlock {
}
impl Dtb_MemoryBlock {
    pub fn entries(&self) -> Ref<'_, Vec<OptRc<Dtb_MemoryBlockEntry>>> {
        self.entries.borrow()
    }
}
impl Dtb_MemoryBlock {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Dtb_MemoryBlockEntry {
    pub _root: SharedType<Dtb>,
    pub _parent: SharedType<Dtb_MemoryBlock>,
    pub _self: SharedType<Self>,
    address: RefCell<u64>,
    size: RefCell<u64>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Dtb_MemoryBlockEntry {
    type Root = Dtb;
    type Parent = Dtb_MemoryBlock;

    fn read<S: KStream>(
        self_rc: &OptRc<Self>,
        _io: &S,
        _root: SharedType<Self::Root>,
        _parent: SharedType<Self::Parent>,
    ) -> KResult<()> {
        *self_rc._io.borrow_mut() = _io.clone();
        self_rc._root.set(_root.get());
        self_rc._parent.set(_parent.get());
        self_rc._self.set(Ok(self_rc.clone()));
        let _rrc = self_rc._root.get_value().borrow().upgrade();
        let _prc = self_rc._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        *self_rc.address.borrow_mut() = _io.read_u8be()?.into();
        *self_rc.size.borrow_mut() = _io.read_u8be()?.into();
        Ok(())
    }
}
impl Dtb_MemoryBlockEntry {
}

/**
 * physical address of a reserved memory region
 */
impl Dtb_MemoryBlockEntry {
    pub fn address(&self) -> Ref<'_, u64> {
        self.address.borrow()
    }
}

/**
 * size of a reserved memory region
 */
impl Dtb_MemoryBlockEntry {
    pub fn size(&self) -> Ref<'_, u64> {
        self.size.borrow()
    }
}
impl Dtb_MemoryBlockEntry {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Dtb_Strings {
    pub _root: SharedType<Dtb>,
    pub _parent: SharedType<Dtb>,
    pub _self: SharedType<Self>,
    strings: RefCell<Vec<String>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Dtb_Strings {
    type Root = Dtb;
    type Parent = Dtb;

    fn read<S: KStream>(
        self_rc: &OptRc<Self>,
        _io: &S,
        _root: SharedType<Self::Root>,
        _parent: SharedType<Self::Parent>,
    ) -> KResult<()> {
        *self_rc._io.borrow_mut() = _io.clone();
        self_rc._root.set(_root.get());
        self_rc._parent.set(_parent.get());
        self_rc._self.set(Ok(self_rc.clone()));
        let _rrc = self_rc._root.get_value().borrow().upgrade();
        let _prc = self_rc._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        *self_rc.strings.borrow_mut() = Vec::new();
        {
            let mut _i = 0;
            while !_io.is_eof() {
                self_rc.strings.borrow_mut().push(bytes_to_str(&_io.read_bytes_term(0, false, true, true)?.into(), "ASCII")?);
                _i += 1;
            }
        }
        Ok(())
    }
}
impl Dtb_Strings {
}
impl Dtb_Strings {
    pub fn strings(&self) -> Ref<'_, Vec<String>> {
        self.strings.borrow()
    }
}
impl Dtb_Strings {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
