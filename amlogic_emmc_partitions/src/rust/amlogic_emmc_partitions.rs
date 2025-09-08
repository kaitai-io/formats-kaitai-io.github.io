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
 * This is an unnamed and undocumented partition table format implemented by
 * the bootloader and kernel that Amlogic provides for their Linux SoCs (Meson
 * series at least, and probably others). They appear to use this rather than GPT,
 * the industry standard, because their BootROM loads and executes the next stage
 * loader from offset 512 (0x200) on the eMMC, which is exactly where the GPT
 * header would have to start. So instead of changing their BootROM, Amlogic
 * devised this partition table, which lives at an offset of 36MiB (0x240_0000)
 * on the eMMC and so doesn't conflict. This parser expects as input just the
 * partition table from that offset. The maximum number of partitions in a table
 * is 32, which corresponds to a maximum table size of 1304 bytes (0x518).
 * \sa http://aml-code.amlogic.com/kernel/common.git/tree/include/linux/mmc/emmc_partitions.h?id=18a4a87072ababf76ea08c8539e939b5b8a440ef Source
 * \sa http://aml-code.amlogic.com/kernel/common.git/tree/drivers/amlogic/mmc/emmc_partitions.c?id=18a4a87072ababf76ea08c8539e939b5b8a440ef Source
 */

#[derive(Default, Debug, Clone)]
pub struct AmlogicEmmcPartitions {
    pub _root: SharedType<AmlogicEmmcPartitions>,
    pub _parent: SharedType<AmlogicEmmcPartitions>,
    pub _self: SharedType<Self>,
    magic: RefCell<Vec<u8>>,
    version: RefCell<String>,
    num_partitions: RefCell<i32>,
    checksum: RefCell<u32>,
    partitions: RefCell<Vec<OptRc<AmlogicEmmcPartitions_Partition>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for AmlogicEmmcPartitions {
    type Root = AmlogicEmmcPartitions;
    type Parent = AmlogicEmmcPartitions;

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
        if !(*self_rc.magic() == vec![0x4du8, 0x50u8, 0x54u8, 0x0u8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/seq/0".to_string() }));
        }
        *self_rc.version.borrow_mut() = bytes_to_str(&bytes_terminate(&_io.read_bytes(12 as usize)?.into(), 0, false).into(), "UTF-8")?;
        *self_rc.num_partitions.borrow_mut() = _io.read_s4le()?.into();
        if !(((*self_rc.num_partitions() as i32) >= (1 as i32))) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::LessThan, src_path: "/seq/2".to_string() }));
        }
        if !(((*self_rc.num_partitions() as i32) <= (32 as i32))) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::GreaterThan, src_path: "/seq/2".to_string() }));
        }
        *self_rc.checksum.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.partitions.borrow_mut() = Vec::new();
        let l_partitions = *self_rc.num_partitions();
        for _i in 0..l_partitions {
            let t = Self::read_into::<_, AmlogicEmmcPartitions_Partition>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
            self_rc.partitions.borrow_mut().push(t);
        }
        Ok(())
    }
}
impl AmlogicEmmcPartitions {
}
impl AmlogicEmmcPartitions {
    pub fn magic(&self) -> Ref<'_, Vec<u8>> {
        self.magic.borrow()
    }
}
impl AmlogicEmmcPartitions {
    pub fn version(&self) -> Ref<'_, String> {
        self.version.borrow()
    }
}
impl AmlogicEmmcPartitions {
    pub fn num_partitions(&self) -> Ref<'_, i32> {
        self.num_partitions.borrow()
    }
}

/**
 * To calculate this, treat the first (and only the first) partition
 * descriptor in the table below as an array of unsigned little-endian
 * 32-bit integers. Sum all those integers mod 2^32, then multiply the
 * result by the total number of partitions, also mod 2^32. Amlogic
 * likely meant to include all the partition descriptors in the sum,
 * but their code as written instead repeatedly loops over the first
 * one, once for each partition in the table.
 */
impl AmlogicEmmcPartitions {
    pub fn checksum(&self) -> Ref<'_, u32> {
        self.checksum.borrow()
    }
}
impl AmlogicEmmcPartitions {
    pub fn partitions(&self) -> Ref<'_, Vec<OptRc<AmlogicEmmcPartitions_Partition>>> {
        self.partitions.borrow()
    }
}
impl AmlogicEmmcPartitions {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct AmlogicEmmcPartitions_Partition {
    pub _root: SharedType<AmlogicEmmcPartitions>,
    pub _parent: SharedType<AmlogicEmmcPartitions>,
    pub _self: SharedType<Self>,
    name: RefCell<String>,
    size: RefCell<u64>,
    offset: RefCell<u64>,
    flags: RefCell<OptRc<AmlogicEmmcPartitions_Partition_PartFlags>>,
    padding: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
    flags_raw: RefCell<Vec<u8>>,
}
impl KStruct for AmlogicEmmcPartitions_Partition {
    type Root = AmlogicEmmcPartitions;
    type Parent = AmlogicEmmcPartitions;

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
        *self_rc.name.borrow_mut() = bytes_to_str(&bytes_terminate(&_io.read_bytes(16 as usize)?.into(), 0, false).into(), "UTF-8")?;
        *self_rc.size.borrow_mut() = _io.read_u8le()?.into();
        *self_rc.offset.borrow_mut() = _io.read_u8le()?.into();
        *self_rc.flags_raw.borrow_mut() = _io.read_bytes(4 as usize)?.into();
        let flags_raw = self_rc.flags_raw.borrow();
        let _t_flags_raw_io = BytesReader::from(flags_raw.clone());
        let t = Self::read_into::<BytesReader, AmlogicEmmcPartitions_Partition_PartFlags>(&_t_flags_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.flags.borrow_mut() = t;
        *self_rc.padding.borrow_mut() = _io.read_bytes(4 as usize)?.into();
        Ok(())
    }
}
impl AmlogicEmmcPartitions_Partition {
}
impl AmlogicEmmcPartitions_Partition {
    pub fn name(&self) -> Ref<'_, String> {
        self.name.borrow()
    }
}
impl AmlogicEmmcPartitions_Partition {
    pub fn size(&self) -> Ref<'_, u64> {
        self.size.borrow()
    }
}

/**
 * The start of the partition relative to the start of the eMMC, in bytes
 */
impl AmlogicEmmcPartitions_Partition {
    pub fn offset(&self) -> Ref<'_, u64> {
        self.offset.borrow()
    }
}
impl AmlogicEmmcPartitions_Partition {
    pub fn flags(&self) -> Ref<'_, OptRc<AmlogicEmmcPartitions_Partition_PartFlags>> {
        self.flags.borrow()
    }
}
impl AmlogicEmmcPartitions_Partition {
    pub fn padding(&self) -> Ref<'_, Vec<u8>> {
        self.padding.borrow()
    }
}
impl AmlogicEmmcPartitions_Partition {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
impl AmlogicEmmcPartitions_Partition {
    pub fn flags_raw(&self) -> Ref<'_, Vec<u8>> {
        self.flags_raw.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct AmlogicEmmcPartitions_Partition_PartFlags {
    pub _root: SharedType<AmlogicEmmcPartitions>,
    pub _parent: SharedType<AmlogicEmmcPartitions_Partition>,
    pub _self: SharedType<Self>,
    is_code: RefCell<bool>,
    is_cache: RefCell<bool>,
    is_data: RefCell<bool>,
    _io: RefCell<BytesReader>,
}
impl KStruct for AmlogicEmmcPartitions_Partition_PartFlags {
    type Root = AmlogicEmmcPartitions;
    type Parent = AmlogicEmmcPartitions_Partition;

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
        *self_rc.is_code.borrow_mut() = _io.read_bits_int_le(1)? != 0;
        *self_rc.is_cache.borrow_mut() = _io.read_bits_int_le(1)? != 0;
        *self_rc.is_data.borrow_mut() = _io.read_bits_int_le(1)? != 0;
        Ok(())
    }
}
impl AmlogicEmmcPartitions_Partition_PartFlags {
}
impl AmlogicEmmcPartitions_Partition_PartFlags {
    pub fn is_code(&self) -> Ref<'_, bool> {
        self.is_code.borrow()
    }
}
impl AmlogicEmmcPartitions_Partition_PartFlags {
    pub fn is_cache(&self) -> Ref<'_, bool> {
        self.is_cache.borrow()
    }
}
impl AmlogicEmmcPartitions_Partition_PartFlags {
    pub fn is_data(&self) -> Ref<'_, bool> {
        self.is_data.borrow()
    }
}
impl AmlogicEmmcPartitions_Partition_PartFlags {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
