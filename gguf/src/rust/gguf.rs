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
 * GGUF is the file format of the [ggml](https://github.com/ggml-org/ggml)
 * tensor library for storing machine learning models, used for example by
 * [llama.cpp](https://github.com/ggml-org/llama.cpp) for inference. It
 * replaced the older GGML, GGMF and GGJT formats.
 * 
 * A GGUF file consists of a header with metadata as key-value pairs (model
 * architecture, hyperparameters, tokenizer, etc.), a description of each
 * tensor (name, dimensions, type and offset), and finally the tensor data.
 * \sa https://github.com/ggml-org/ggml/blob/a05c9922613c6a2230dbb1d0de679519ecafb4f0/docs/gguf.md Git tag "v0.27.0"
 */

#[derive(Default, Debug, Clone)]
pub struct Gguf {
    pub _root: SharedType<Gguf>,
    pub _parent: SharedType<Gguf>,
    pub _self: SharedType<Self>,
    magic: RefCell<Vec<u8>>,
    body: RefCell<OptRc<Gguf_GgufBody>>,
    _io: RefCell<BytesReader>,
    f_is_big_endian: Cell<bool>,
    is_big_endian: RefCell<bool>,
    f_len_file: Cell<bool>,
    len_file: RefCell<u64>,
    f_version_le: Cell<bool>,
    version_le: RefCell<u32>,
}
impl KStruct for Gguf {
    type Root = Gguf;
    type Parent = Gguf;

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
        if !(*self_rc.magic() == vec![0x47u8, 0x47u8, 0x55u8, 0x46u8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/seq/0".to_string() }));
        }
        let t = Self::read_into::<_, Gguf_GgufBody>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.body.borrow_mut() = t;
        Ok(())
    }
}
impl Gguf {
    pub fn is_big_endian(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_is_big_endian.get() {
            return Ok(self.is_big_endian.borrow());
        }
        self.f_is_big_endian.set(true);
        *self.is_big_endian.borrow_mut() = (((((*self.version_le()? as i32) & (65535 as i32)) as i32) == (0 as i32))) as bool;
        Ok(self.is_big_endian.borrow())
    }

    /**
     * Length of the file (computed from the header), including the padding after
     * the last tensor's data.
     * 
     * This Kaitai Struct implementation stops parsing where the tensor data
     * starts (which is read lazily, i.e. only on demand). Without reading the
     * tensor data, you can use this expected file size to check whether the file
     * has been truncated, to carve the file out of a larger one, etc.
     */
    pub fn len_file(
        &self
    ) -> KResult<Ref<'_, u64>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_len_file.get() {
            return Ok(self.len_file.borrow());
        }
        self.f_len_file.set(true);
        *self.len_file.borrow_mut() = ((((*self.body().ofs_tensor_data()? as u64) + (if ((*self.body().num_tensor_infos() as u64) != (0 as u64)) { *self.body().tensor_infos().last().ok_or(KError::EmptyIterator)?.expected_next_offset()? } else { 0 } as u64)) as u64)) as u64;
        Ok(self.len_file.borrow())
    }
    pub fn version_le(
        &self
    ) -> KResult<Ref<'_, u32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_version_le.get() {
            return Ok(self.version_le.borrow());
        }
        self.f_version_le.set(true);
        let _pos = _io.pos();
        _io.seek(4 as usize)?;
        *self.version_le.borrow_mut() = _io.read_u4le()?.into();
        _io.seek(_pos)?;
        Ok(self.version_le.borrow())
    }
}

/**
 * GGUF file magic
 */
impl Gguf {
    pub fn magic(&self) -> Ref<'_, Vec<u8>> {
        self.magic.borrow()
    }
}
impl Gguf {
    pub fn body(&self) -> Ref<'_, OptRc<Gguf_GgufBody>> {
        self.body.borrow()
    }
}
impl Gguf {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
#[derive(Debug, PartialEq, Clone)]
pub enum Gguf_GgmlType {
    F32,
    F16,
    Q40,
    Q41,

    /**
     * Removed from ggml in May 2023, before GGUF was introduced. ggml
     * rejects it.
     * \sa https://github.com/ggml-org/llama.cpp/commit/b9fd7eee57df101d4a3e3eabc9fd6c2cb13c9ca1 Source
     */
    Q42,

    /**
     * Removed from ggml in April 2023, before GGUF was introduced. ggml
     * rejects it.
     * \sa https://github.com/ggml-org/llama.cpp/commit/36d19a603b221d1bd7897fcb10e823e2103b052d Source
     */
    Q43,
    Q50,
    Q51,
    Q80,
    Q81,
    Q2K,
    Q3K,
    Q4K,
    Q5K,
    Q6K,
    Q8K,
    Iq2Xxs,
    Iq2Xs,
    Iq3Xxs,
    Iq1S,
    Iq4Nl,
    Iq3S,
    Iq2S,
    Iq4Xs,
    I8,
    I16,
    I32,
    I64,
    F64,
    Iq1M,
    Bf16,

    /**
     * Removed from ggml in December 2024 in favor of repacking
     * `ggml_type::q4_0` at load time. ggml rejects it, although files with it
     * exist, e.g.
     * [`Qwen2.5-0.5B-Instruct-Q4_0_4_4.gguf`](https://huggingface.co/bartowski/Qwen2.5-0.5B-Instruct-GGUF/blob/41ba88dbac95fed2528c92514c131d73eb5a174b/Qwen2.5-0.5B-Instruct-Q4_0_4_4.gguf).
     * \sa https://github.com/ggml-org/llama.cpp/commit/19d8762ab61df8286367588a80b9c7db4cb568db Source
     */
    Q4044,

    /**
     * Removed from ggml in December 2024 in favor of repacking
     * `ggml_type::q4_0` at load time. ggml rejects it, although files with it
     * exist, e.g.
     * [`Qwen2.5-0.5B-Instruct-Q4_0_4_8.gguf`](https://huggingface.co/bartowski/Qwen2.5-0.5B-Instruct-GGUF/blob/41ba88dbac95fed2528c92514c131d73eb5a174b/Qwen2.5-0.5B-Instruct-Q4_0_4_8.gguf).
     * \sa https://github.com/ggml-org/llama.cpp/commit/19d8762ab61df8286367588a80b9c7db4cb568db Source
     */
    Q4048,

    /**
     * Removed from ggml in December 2024 in favor of repacking
     * `ggml_type::q4_0` at load time. ggml rejects it, although files with it
     * exist, e.g.
     * [`Qwen2.5-0.5B-Instruct-Q4_0_8_8.gguf`](https://huggingface.co/bartowski/Qwen2.5-0.5B-Instruct-GGUF/blob/41ba88dbac95fed2528c92514c131d73eb5a174b/Qwen2.5-0.5B-Instruct-Q4_0_8_8.gguf).
     * \sa https://github.com/ggml-org/llama.cpp/commit/19d8762ab61df8286367588a80b9c7db4cb568db Source
     */
    Q4088,
    Tq10,
    Tq20,

    /**
     * Supported by ggml only from November to December 2024, and only for
     * repacking tensors in memory - it was never written to files. ggml
     * rejects it.
     * \sa https://github.com/ggml-org/llama.cpp/commit/19d8762ab61df8286367588a80b9c7db4cb568db Source
     */
    Iq4Nl44,

    /**
     * Reserved by ggml, but never supported. ggml rejects it.
     * \sa https://github.com/ggml-org/llama.cpp/commit/c202cef1686182a78f8f4e253ab8d0c0ffe2fcc8 Source
     */
    Iq4Nl48,

    /**
     * Reserved by ggml, but never supported. ggml rejects it.
     * \sa https://github.com/ggml-org/llama.cpp/commit/c202cef1686182a78f8f4e253ab8d0c0ffe2fcc8 Source
     */
    Iq4Nl88,
    Mxfp4,
    Nvfp4,
    Q10,
    Q20,
    Unknown(i64),
}

impl TryFrom<i64> for Gguf_GgmlType {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<Gguf_GgmlType> {
        match flag {
            0 => Ok(Gguf_GgmlType::F32),
            1 => Ok(Gguf_GgmlType::F16),
            2 => Ok(Gguf_GgmlType::Q40),
            3 => Ok(Gguf_GgmlType::Q41),
            4 => Ok(Gguf_GgmlType::Q42),
            5 => Ok(Gguf_GgmlType::Q43),
            6 => Ok(Gguf_GgmlType::Q50),
            7 => Ok(Gguf_GgmlType::Q51),
            8 => Ok(Gguf_GgmlType::Q80),
            9 => Ok(Gguf_GgmlType::Q81),
            10 => Ok(Gguf_GgmlType::Q2K),
            11 => Ok(Gguf_GgmlType::Q3K),
            12 => Ok(Gguf_GgmlType::Q4K),
            13 => Ok(Gguf_GgmlType::Q5K),
            14 => Ok(Gguf_GgmlType::Q6K),
            15 => Ok(Gguf_GgmlType::Q8K),
            16 => Ok(Gguf_GgmlType::Iq2Xxs),
            17 => Ok(Gguf_GgmlType::Iq2Xs),
            18 => Ok(Gguf_GgmlType::Iq3Xxs),
            19 => Ok(Gguf_GgmlType::Iq1S),
            20 => Ok(Gguf_GgmlType::Iq4Nl),
            21 => Ok(Gguf_GgmlType::Iq3S),
            22 => Ok(Gguf_GgmlType::Iq2S),
            23 => Ok(Gguf_GgmlType::Iq4Xs),
            24 => Ok(Gguf_GgmlType::I8),
            25 => Ok(Gguf_GgmlType::I16),
            26 => Ok(Gguf_GgmlType::I32),
            27 => Ok(Gguf_GgmlType::I64),
            28 => Ok(Gguf_GgmlType::F64),
            29 => Ok(Gguf_GgmlType::Iq1M),
            30 => Ok(Gguf_GgmlType::Bf16),
            31 => Ok(Gguf_GgmlType::Q4044),
            32 => Ok(Gguf_GgmlType::Q4048),
            33 => Ok(Gguf_GgmlType::Q4088),
            34 => Ok(Gguf_GgmlType::Tq10),
            35 => Ok(Gguf_GgmlType::Tq20),
            36 => Ok(Gguf_GgmlType::Iq4Nl44),
            37 => Ok(Gguf_GgmlType::Iq4Nl48),
            38 => Ok(Gguf_GgmlType::Iq4Nl88),
            39 => Ok(Gguf_GgmlType::Mxfp4),
            40 => Ok(Gguf_GgmlType::Nvfp4),
            41 => Ok(Gguf_GgmlType::Q10),
            42 => Ok(Gguf_GgmlType::Q20),
            _ => Ok(Gguf_GgmlType::Unknown(flag)),
        }
    }
}

impl From<&Gguf_GgmlType> for i64 {
    fn from(v: &Gguf_GgmlType) -> Self {
        match *v {
            Gguf_GgmlType::F32 => 0,
            Gguf_GgmlType::F16 => 1,
            Gguf_GgmlType::Q40 => 2,
            Gguf_GgmlType::Q41 => 3,
            Gguf_GgmlType::Q42 => 4,
            Gguf_GgmlType::Q43 => 5,
            Gguf_GgmlType::Q50 => 6,
            Gguf_GgmlType::Q51 => 7,
            Gguf_GgmlType::Q80 => 8,
            Gguf_GgmlType::Q81 => 9,
            Gguf_GgmlType::Q2K => 10,
            Gguf_GgmlType::Q3K => 11,
            Gguf_GgmlType::Q4K => 12,
            Gguf_GgmlType::Q5K => 13,
            Gguf_GgmlType::Q6K => 14,
            Gguf_GgmlType::Q8K => 15,
            Gguf_GgmlType::Iq2Xxs => 16,
            Gguf_GgmlType::Iq2Xs => 17,
            Gguf_GgmlType::Iq3Xxs => 18,
            Gguf_GgmlType::Iq1S => 19,
            Gguf_GgmlType::Iq4Nl => 20,
            Gguf_GgmlType::Iq3S => 21,
            Gguf_GgmlType::Iq2S => 22,
            Gguf_GgmlType::Iq4Xs => 23,
            Gguf_GgmlType::I8 => 24,
            Gguf_GgmlType::I16 => 25,
            Gguf_GgmlType::I32 => 26,
            Gguf_GgmlType::I64 => 27,
            Gguf_GgmlType::F64 => 28,
            Gguf_GgmlType::Iq1M => 29,
            Gguf_GgmlType::Bf16 => 30,
            Gguf_GgmlType::Q4044 => 31,
            Gguf_GgmlType::Q4048 => 32,
            Gguf_GgmlType::Q4088 => 33,
            Gguf_GgmlType::Tq10 => 34,
            Gguf_GgmlType::Tq20 => 35,
            Gguf_GgmlType::Iq4Nl44 => 36,
            Gguf_GgmlType::Iq4Nl48 => 37,
            Gguf_GgmlType::Iq4Nl88 => 38,
            Gguf_GgmlType::Mxfp4 => 39,
            Gguf_GgmlType::Nvfp4 => 40,
            Gguf_GgmlType::Q10 => 41,
            Gguf_GgmlType::Q20 => 42,
            Gguf_GgmlType::Unknown(v) => v
        }
    }
}

impl Default for Gguf_GgmlType {
    fn default() -> Self { Gguf_GgmlType::Unknown(0) }
}

#[derive(Debug, PartialEq, Clone)]
pub enum Gguf_GgufType {
    Uint8,
    Int8,
    Uint16,
    Int16,
    Uint32,
    Int32,
    Float32,
    Bool,
    String,
    Array,
    Uint64,
    Int64,
    Float64,
    Unknown(i64),
}

impl TryFrom<i64> for Gguf_GgufType {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<Gguf_GgufType> {
        match flag {
            0 => Ok(Gguf_GgufType::Uint8),
            1 => Ok(Gguf_GgufType::Int8),
            2 => Ok(Gguf_GgufType::Uint16),
            3 => Ok(Gguf_GgufType::Int16),
            4 => Ok(Gguf_GgufType::Uint32),
            5 => Ok(Gguf_GgufType::Int32),
            6 => Ok(Gguf_GgufType::Float32),
            7 => Ok(Gguf_GgufType::Bool),
            8 => Ok(Gguf_GgufType::String),
            9 => Ok(Gguf_GgufType::Array),
            10 => Ok(Gguf_GgufType::Uint64),
            11 => Ok(Gguf_GgufType::Int64),
            12 => Ok(Gguf_GgufType::Float64),
            _ => Ok(Gguf_GgufType::Unknown(flag)),
        }
    }
}

impl From<&Gguf_GgufType> for i64 {
    fn from(v: &Gguf_GgufType) -> Self {
        match *v {
            Gguf_GgufType::Uint8 => 0,
            Gguf_GgufType::Int8 => 1,
            Gguf_GgufType::Uint16 => 2,
            Gguf_GgufType::Int16 => 3,
            Gguf_GgufType::Uint32 => 4,
            Gguf_GgufType::Int32 => 5,
            Gguf_GgufType::Float32 => 6,
            Gguf_GgufType::Bool => 7,
            Gguf_GgufType::String => 8,
            Gguf_GgufType::Array => 9,
            Gguf_GgufType::Uint64 => 10,
            Gguf_GgufType::Int64 => 11,
            Gguf_GgufType::Float64 => 12,
            Gguf_GgufType::Unknown(v) => v
        }
    }
}

impl Default for Gguf_GgufType {
    fn default() -> Self { Gguf_GgufType::Unknown(0) }
}


#[derive(Default, Debug, Clone)]
pub struct Gguf_GgufBody {
    pub _root: SharedType<Gguf>,
    pub _parent: SharedType<Gguf>,
    pub _self: SharedType<Self>,
    version: RefCell<u32>,
    num_tensor_infos: RefCell<u64>,
    num_kv_pairs: RefCell<u64>,
    kv_pairs: RefCell<Vec<OptRc<Gguf_GgufBody_GgufKv>>>,
    tensor_infos: RefCell<Vec<OptRc<Gguf_GgufBody_GgufTensorInfo>>>,
    padding: RefCell<Vec<u8>>,
    unnamed6: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
    f_alignment: Cell<bool>,
    alignment: RefCell<u32>,
    f_ofs_tensor_data: Cell<bool>,
    ofs_tensor_data: RefCell<u64>,
    _is_le: RefCell<i32>,
}
impl KStruct for Gguf_GgufBody {
    type Root = Gguf;
    type Parent = Gguf;

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
        {
            let on = _r.is_big_endian()?;
            if *on == true {
                *self_rc._is_le.borrow_mut() = (2) as i32;
            }
            else if *on == false {
                *self_rc._is_le.borrow_mut() = (1) as i32;
            }
        }
        if *self_rc._is_le.borrow() == 0 {
            return Err(KError::UndecidedEndianness { src_path: "/types/gguf_body".to_string() });
        }
        *self_rc.version.borrow_mut() = if *self_rc._is_le.borrow() == 1 { _io.read_u4le()?.into() } else { _io.read_u4be()?.into() };
        if !(((*self_rc.version() as u32) >= (2 as u32))) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::LessThan, src_path: "/types/gguf_body/seq/0".to_string() }));
        }
        if !(((*self_rc.version() as u32) <= (3 as u32))) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::GreaterThan, src_path: "/types/gguf_body/seq/0".to_string() }));
        }
        *self_rc.num_tensor_infos.borrow_mut() = if *self_rc._is_le.borrow() == 1 { _io.read_u8le()?.into() } else { _io.read_u8be()?.into() };
        *self_rc.num_kv_pairs.borrow_mut() = if *self_rc._is_le.borrow() == 1 { _io.read_u8le()?.into() } else { _io.read_u8be()?.into() };
        *self_rc.kv_pairs.borrow_mut() = Vec::new();
        let l_kv_pairs = *self_rc.num_kv_pairs();
        for _i in 0..l_kv_pairs {
            let f = |t : &mut Gguf_GgufBody_GgufKv| Ok(t.set_params((if ((_i as i32) != (0 as i32)) { *self_rc.kv_pairs()[((_i as i32) - (1 as i32)) as usize].alignment()? } else { 32 }).try_into().map_err(|_| KError::CastError)?));
            let t = Self::read_into_with_init::<_, Gguf_GgufBody_GgufKv>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()), &f)?.into();
            self_rc.kv_pairs.borrow_mut().push(t);
        }
        *self_rc.tensor_infos.borrow_mut() = Vec::new();
        let l_tensor_infos = *self_rc.num_tensor_infos();
        for _i in 0..l_tensor_infos {
            let f = |t : &mut Gguf_GgufBody_GgufTensorInfo| Ok(t.set_params((if ((_i as i32) != (0 as i32)) { *self_rc.tensor_infos()[((_i as i32) - (1 as i32)) as usize].expected_next_offset()? } else { 0 }).try_into().map_err(|_| KError::CastError)?));
            let t = Self::read_into_with_init::<_, Gguf_GgufBody_GgufTensorInfo>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()), &f)?.into();
            self_rc.tensor_infos.borrow_mut().push(t);
        }
        if ((*self_rc.num_tensor_infos() as u64) != (0 as u64)) {
            *self_rc.padding.borrow_mut() = _io.read_bytes(((((*self_rc.alignment()? as i32) - (((_io.pos() as i32) % (*self_rc.alignment()? as i32)) as i32)) as i32) % (*self_rc.alignment()? as i32)) as usize)?.into();
        }
        if ((*self_rc.ofs_tensor_data()? as u64) < (0 as u64)) {
            *self_rc.unnamed6.borrow_mut() = _io.read_bytes(0 as usize)?.into();
        }
        Ok(())
    }
}
impl Gguf_GgufBody {
    pub fn set_endian(&mut self, _is_le: i32) {
        *self._is_le.borrow_mut() = _is_le;
    }
}
impl Gguf_GgufBody {

    /**
     * Global alignment - from the `general.alignment` key, or 32 if there's no
     * such key.
     * \sa https://github.com/ggml-org/ggml/blob/a05c9922613c6a2230dbb1d0de679519ecafb4f0/src/gguf.cpp#L622-L630 Git tag "v0.27.0"
     */
    pub fn alignment(
        &self
    ) -> KResult<Ref<'_, u32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_alignment.get() {
            return Ok(self.alignment.borrow());
        }
        self.f_alignment.set(true);
        *self.alignment.borrow_mut() = (if ((self.kv_pairs().len() as i32) != (0 as i32)) { *self.kv_pairs().last().ok_or(KError::EmptyIterator)?.alignment()? } else { 32 }) as u32;
        Ok(self.alignment.borrow())
    }

    /**
     * Offset of the tensor data. Each tensor's `offset` is relative to this
     * position.
     */
    pub fn ofs_tensor_data(
        &self
    ) -> KResult<Ref<'_, u64>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_ofs_tensor_data.get() {
            return Ok(self.ofs_tensor_data.borrow());
        }
        self.f_ofs_tensor_data.set(true);
        *self.ofs_tensor_data.borrow_mut() = ((_io.pos() as u64)) as u64;
        Ok(self.ofs_tensor_data.borrow())
    }
}

/**
 * File format version. Version 1 used 32-bit counts and lengths, which
 * this Kaitai Struct implementation doesn't support, and neither does
 * ggml.
 */
impl Gguf_GgufBody {
    pub fn version(&self) -> Ref<'_, u32> {
        self.version.borrow()
    }
}

/**
 * The number of tensors in the file
 */
impl Gguf_GgufBody {
    pub fn num_tensor_infos(&self) -> Ref<'_, u64> {
        self.num_tensor_infos.borrow()
    }
}

/**
 * The number of key-value pairs in the file header
 */
impl Gguf_GgufBody {
    pub fn num_kv_pairs(&self) -> Ref<'_, u64> {
        self.num_kv_pairs.borrow()
    }
}

/**
 * Key-value pairs. ggml (v0.27.0)
 * [rejects](https://github.com/ggml-org/ggml/blob/a05c9922613c6a2230dbb1d0de679519ecafb4f0/src/gguf.cpp#L575-L578)
 * duplicate keys, but this Kaitai Struct implementation can't detect
 * them. If there are multiple `general.alignment` keys, the last one is
 * used for the `alignment` value instance.
 */
impl Gguf_GgufBody {
    pub fn kv_pairs(&self) -> Ref<'_, Vec<OptRc<Gguf_GgufBody_GgufKv>>> {
        self.kv_pairs.borrow()
    }
}

/**
 * Tensor metadata. ggml (v0.27.0)
 * [rejects](https://github.com/ggml-org/ggml/blob/a05c9922613c6a2230dbb1d0de679519ecafb4f0/src/gguf.cpp#L664-L669)
 * duplicate tensor names, but this Kaitai Struct implementation can't
 * detect them.
 */
impl Gguf_GgufBody {
    pub fn tensor_infos(&self) -> Ref<'_, Vec<OptRc<Gguf_GgufBody_GgufTensorInfo>>> {
        self.tensor_infos.borrow()
    }
}

/**
 * \sa https://github.com/ggml-org/ggml/blob/a05c9922613c6a2230dbb1d0de679519ecafb4f0/src/gguf.cpp#L780-L785 Git tag "v0.27.0"
 */
impl Gguf_GgufBody {
    pub fn padding(&self) -> Ref<'_, Vec<u8>> {
        self.padding.borrow()
    }
}
impl Gguf_GgufBody {
    pub fn unnamed6(&self) -> Ref<'_, Vec<u8>> {
        self.unnamed6.borrow()
    }
}
impl Gguf_GgufBody {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * Nested arrays are supported. Although ggml (v0.27.0) doesn't support them,
 * they are explicitly allowed by `gguf.md` - see
 * <https://github.com/ggml-org/ggml/blob/a05c9922613c6a2230dbb1d0de679519ecafb4f0/docs/gguf.md?plain=1#L221>.
 */

#[derive(Default, Debug, Clone)]
pub struct Gguf_GgufBody_GgufArray {
    pub _root: SharedType<Gguf>,
    pub _parent: SharedType<Gguf_GgufBody_GgufValue>,
    pub _self: SharedType<Self>,
    type: RefCell<Gguf_GgufType>,
    num_elems: RefCell<u64>,
    elems: RefCell<Vec<OptRc<Gguf_GgufBody_GgufValue>>>,
    _io: RefCell<BytesReader>,
    _is_le: RefCell<i32>,
}
impl KStruct for Gguf_GgufBody_GgufArray {
    type Root = Gguf;
    type Parent = Gguf_GgufBody_GgufValue;

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
        *self_rc.type.borrow_mut() = (_io.read_u4()? as i64).try_into()?;
        *self_rc.num_elems.borrow_mut() = if *self_rc._is_le.borrow() == 1 { _io.read_u8le()?.into() } else { _io.read_u8be()?.into() };
        *self_rc.elems.borrow_mut() = Vec::new();
        let l_elems = *self_rc.num_elems();
        for _i in 0..l_elems {
            let f = |t : &mut Gguf_GgufBody_GgufValue| Ok(t.set_params(&*self_rc.type()));
            let t = Self::read_into_with_init::<_, Gguf_GgufBody_GgufValue>(&*_io, Some(self_rc._root.clone()), None, &f)?.into();
            self_rc.elems.borrow_mut().push(t);
        }
        Ok(())
    }
}
impl Gguf_GgufBody_GgufArray {
    pub fn set_endian(&mut self, _is_le: i32) {
        *self._is_le.borrow_mut() = _is_le;
    }
}
impl Gguf_GgufBody_GgufArray {
}
impl Gguf_GgufBody_GgufArray {
    pub fn type(&self) -> Ref<'_, Gguf_GgufType> {
        self.type.borrow()
    }
}
impl Gguf_GgufBody_GgufArray {
    pub fn num_elems(&self) -> Ref<'_, u64> {
        self.num_elems.borrow()
    }
}
impl Gguf_GgufBody_GgufArray {
    pub fn elems(&self) -> Ref<'_, Vec<OptRc<Gguf_GgufBody_GgufValue>>> {
        self.elems.borrow()
    }
}
impl Gguf_GgufBody_GgufArray {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Gguf_GgufBody_GgufBool {
    pub _root: SharedType<Gguf>,
    pub _parent: SharedType<Gguf_GgufBody_GgufValue>,
    pub _self: SharedType<Self>,
    value_raw: RefCell<u8>,
    _io: RefCell<BytesReader>,
    f_value: Cell<bool>,
    value: RefCell<bool>,
    _is_le: RefCell<i32>,
}
impl KStruct for Gguf_GgufBody_GgufBool {
    type Root = Gguf;
    type Parent = Gguf_GgufBody_GgufValue;

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
        *self_rc.value_raw.borrow_mut() = _io.read_u1()?.into();
        if !(((*self_rc.value_raw() as u8) <= (1 as u8))) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::GreaterThan, src_path: "/types/gguf_body/types/gguf_bool/seq/0".to_string() }));
        }
        Ok(())
    }
}
impl Gguf_GgufBody_GgufBool {
    pub fn set_endian(&mut self, _is_le: i32) {
        *self._is_le.borrow_mut() = _is_le;
    }
}
impl Gguf_GgufBody_GgufBool {

    /**
     * \sa https://github.com/ggml-org/ggml/blob/a05c9922613c6a2230dbb1d0de679519ecafb4f0/src/gguf.cpp#L321 Git tag "v0.27.0"
     */
    pub fn value(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_value.get() {
            return Ok(self.value.borrow());
        }
        self.f_value.set(true);
        *self.value.borrow_mut() = (((*self.value_raw() as u8) != (0 as u8))) as bool;
        Ok(self.value.borrow())
    }
}
impl Gguf_GgufBody_GgufBool {
    pub fn value_raw(&self) -> Ref<'_, u8> {
        self.value_raw.borrow()
    }
}
impl Gguf_GgufBody_GgufBool {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Gguf_GgufBody_GgufFloat32 {
    pub _root: SharedType<Gguf>,
    pub _parent: SharedType<Gguf_GgufBody_GgufValue>,
    pub _self: SharedType<Self>,
    value: RefCell<f32>,
    _io: RefCell<BytesReader>,
    _is_le: RefCell<i32>,
}
impl KStruct for Gguf_GgufBody_GgufFloat32 {
    type Root = Gguf;
    type Parent = Gguf_GgufBody_GgufValue;

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
        *self_rc.value.borrow_mut() = _io.read_f4()?.into();
        Ok(())
    }
}
impl Gguf_GgufBody_GgufFloat32 {
    pub fn set_endian(&mut self, _is_le: i32) {
        *self._is_le.borrow_mut() = _is_le;
    }
}
impl Gguf_GgufBody_GgufFloat32 {
}
impl Gguf_GgufBody_GgufFloat32 {
    pub fn value(&self) -> Ref<'_, f32> {
        self.value.borrow()
    }
}
impl Gguf_GgufBody_GgufFloat32 {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Gguf_GgufBody_GgufFloat64 {
    pub _root: SharedType<Gguf>,
    pub _parent: SharedType<Gguf_GgufBody_GgufValue>,
    pub _self: SharedType<Self>,
    value: RefCell<f64>,
    _io: RefCell<BytesReader>,
    _is_le: RefCell<i32>,
}
impl KStruct for Gguf_GgufBody_GgufFloat64 {
    type Root = Gguf;
    type Parent = Gguf_GgufBody_GgufValue;

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
        *self_rc.value.borrow_mut() = _io.read_f8()?.into();
        Ok(())
    }
}
impl Gguf_GgufBody_GgufFloat64 {
    pub fn set_endian(&mut self, _is_le: i32) {
        *self._is_le.borrow_mut() = _is_le;
    }
}
impl Gguf_GgufBody_GgufFloat64 {
}
impl Gguf_GgufBody_GgufFloat64 {
    pub fn value(&self) -> Ref<'_, f64> {
        self.value.borrow()
    }
}
impl Gguf_GgufBody_GgufFloat64 {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Gguf_GgufBody_GgufInt16 {
    pub _root: SharedType<Gguf>,
    pub _parent: SharedType<Gguf_GgufBody_GgufValue>,
    pub _self: SharedType<Self>,
    value: RefCell<i16>,
    _io: RefCell<BytesReader>,
    _is_le: RefCell<i32>,
}
impl KStruct for Gguf_GgufBody_GgufInt16 {
    type Root = Gguf;
    type Parent = Gguf_GgufBody_GgufValue;

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
        *self_rc.value.borrow_mut() = if *self_rc._is_le.borrow() == 1 { _io.read_s2le()?.into() } else { _io.read_s2be()?.into() };
        Ok(())
    }
}
impl Gguf_GgufBody_GgufInt16 {
    pub fn set_endian(&mut self, _is_le: i32) {
        *self._is_le.borrow_mut() = _is_le;
    }
}
impl Gguf_GgufBody_GgufInt16 {
}
impl Gguf_GgufBody_GgufInt16 {
    pub fn value(&self) -> Ref<'_, i16> {
        self.value.borrow()
    }
}
impl Gguf_GgufBody_GgufInt16 {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Gguf_GgufBody_GgufInt32 {
    pub _root: SharedType<Gguf>,
    pub _parent: SharedType<Gguf_GgufBody_GgufValue>,
    pub _self: SharedType<Self>,
    value: RefCell<i32>,
    _io: RefCell<BytesReader>,
    _is_le: RefCell<i32>,
}
impl KStruct for Gguf_GgufBody_GgufInt32 {
    type Root = Gguf;
    type Parent = Gguf_GgufBody_GgufValue;

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
        *self_rc.value.borrow_mut() = if *self_rc._is_le.borrow() == 1 { _io.read_s4le()?.into() } else { _io.read_s4be()?.into() };
        Ok(())
    }
}
impl Gguf_GgufBody_GgufInt32 {
    pub fn set_endian(&mut self, _is_le: i32) {
        *self._is_le.borrow_mut() = _is_le;
    }
}
impl Gguf_GgufBody_GgufInt32 {
}
impl Gguf_GgufBody_GgufInt32 {
    pub fn value(&self) -> Ref<'_, i32> {
        self.value.borrow()
    }
}
impl Gguf_GgufBody_GgufInt32 {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Gguf_GgufBody_GgufInt64 {
    pub _root: SharedType<Gguf>,
    pub _parent: SharedType<Gguf_GgufBody_GgufValue>,
    pub _self: SharedType<Self>,
    value: RefCell<i64>,
    _io: RefCell<BytesReader>,
    _is_le: RefCell<i32>,
}
impl KStruct for Gguf_GgufBody_GgufInt64 {
    type Root = Gguf;
    type Parent = Gguf_GgufBody_GgufValue;

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
        *self_rc.value.borrow_mut() = if *self_rc._is_le.borrow() == 1 { _io.read_s8le()?.into() } else { _io.read_s8be()?.into() };
        Ok(())
    }
}
impl Gguf_GgufBody_GgufInt64 {
    pub fn set_endian(&mut self, _is_le: i32) {
        *self._is_le.borrow_mut() = _is_le;
    }
}
impl Gguf_GgufBody_GgufInt64 {
}
impl Gguf_GgufBody_GgufInt64 {
    pub fn value(&self) -> Ref<'_, i64> {
        self.value.borrow()
    }
}
impl Gguf_GgufBody_GgufInt64 {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Gguf_GgufBody_GgufInt8 {
    pub _root: SharedType<Gguf>,
    pub _parent: SharedType<Gguf_GgufBody_GgufValue>,
    pub _self: SharedType<Self>,
    value: RefCell<i8>,
    _io: RefCell<BytesReader>,
    _is_le: RefCell<i32>,
}
impl KStruct for Gguf_GgufBody_GgufInt8 {
    type Root = Gguf;
    type Parent = Gguf_GgufBody_GgufValue;

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
        *self_rc.value.borrow_mut() = _io.read_s1()?.into();
        Ok(())
    }
}
impl Gguf_GgufBody_GgufInt8 {
    pub fn set_endian(&mut self, _is_le: i32) {
        *self._is_le.borrow_mut() = _is_le;
    }
}
impl Gguf_GgufBody_GgufInt8 {
}
impl Gguf_GgufBody_GgufInt8 {
    pub fn value(&self) -> Ref<'_, i8> {
        self.value.borrow()
    }
}
impl Gguf_GgufBody_GgufInt8 {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * \sa https://github.com/ggml-org/ggml/blob/a05c9922613c6a2230dbb1d0de679519ecafb4f0/docs/gguf.md?plain=1#L262-L275 Git tag "v0.27.0"
 */

#[derive(Default, Debug, Clone)]
pub struct Gguf_GgufBody_GgufKv {
    pub _root: SharedType<Gguf>,
    pub _parent: SharedType<Gguf_GgufBody>,
    pub _self: SharedType<Self>,
    prev_alignment: RefCell<u32>,
    key: RefCell<OptRc<Gguf_GgufBody_GgufStr>>,
    type: RefCell<Gguf_GgufType>,
    value: RefCell<OptRc<Gguf_GgufBody_GgufValue>>,
    _io: RefCell<BytesReader>,
    f_alignment: Cell<bool>,
    alignment: RefCell<u32>,
    _is_le: RefCell<i32>,
}
impl KStruct for Gguf_GgufBody_GgufKv {
    type Root = Gguf;
    type Parent = Gguf_GgufBody;

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
        let f = |t : &mut Gguf_GgufBody_GgufStr| Ok(t.set_endian(*self_rc._is_le.borrow()));
        let t = Self::read_into_with_init::<_, Gguf_GgufBody_GgufStr>(&*_io, Some(self_rc._root.clone()), None, &f)?.into();
        *self_rc.key.borrow_mut() = t;
        let _tmpa = *self_rc.key();
        if !(((*_tmpa.len_value() as u64) != (0 as u64))) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::Expr, src_path: "/types/gguf_body/types/gguf_kv/seq/0".to_string() }));
        }
        *self_rc.type.borrow_mut() = (_io.read_u4()? as i64).try_into()?;
        let f = |t : &mut Gguf_GgufBody_GgufValue| Ok(t.set_params(&*self_rc.type()));
        let t = Self::read_into_with_init::<_, Gguf_GgufBody_GgufValue>(&*_io, Some(self_rc._root.clone()), None, &f)?.into();
        *self_rc.value.borrow_mut() = t;
        let _tmpa = *self_rc.value();
        if !(if *self_rc.key().value() == "general.alignment".to_string() {  ((*self_rc.type() == Gguf_GgufType::Uint32) && (((*Into::<OptRc<Gguf_GgufBody_GgufUint32>>::into(&*_tmpa.value()).value().as_ref().unwrap() as u32) != (0 as u32))) && (((((*Into::<OptRc<Gguf_GgufBody_GgufUint32>>::into(&*_tmpa.value()).value().as_ref().unwrap() as i32) & (((*Into::<OptRc<Gguf_GgufBody_GgufUint32>>::into(&*_tmpa.value()).value().as_ref().unwrap() as u32) - (1 as u32)) as i32)) as i32) == (0 as i32))))  } else { true }) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::Expr, src_path: "/types/gguf_body/types/gguf_kv/seq/2".to_string() }));
        }
        Ok(())
    }
}
impl Gguf_GgufBody_GgufKv {
    pub fn prev_alignment(&self) -> Ref<'_, u32> {
        self.prev_alignment.borrow()
    }
}
impl Gguf_GgufBody_GgufKv {
    pub fn set_params(&mut self, prev_alignment: u32) {
        *self.prev_alignment.borrow_mut() = prev_alignment;
    }
}
impl Gguf_GgufBody_GgufKv {
    pub fn set_endian(&mut self, _is_le: i32) {
        *self._is_le.borrow_mut() = _is_le;
    }
}
impl Gguf_GgufBody_GgufKv {
    pub fn alignment(
        &self
    ) -> KResult<Ref<'_, u32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_alignment.get() {
            return Ok(self.alignment.borrow());
        }
        self.f_alignment.set(true);
        *self.alignment.borrow_mut() = (if *self.key().value() == "general.alignment".to_string() { *Into::<OptRc<Gguf_GgufBody_GgufUint32>>::into(&*self.value().value().as_ref().unwrap()).value().as_ref().unwrap() } else { *self.prev_alignment() }) as u32;
        Ok(self.alignment.borrow())
    }
}
impl Gguf_GgufBody_GgufKv {
    pub fn key(&self) -> Ref<'_, OptRc<Gguf_GgufBody_GgufStr>> {
        self.key.borrow()
    }
}
impl Gguf_GgufBody_GgufKv {
    pub fn type(&self) -> Ref<'_, Gguf_GgufType> {
        self.type.borrow()
    }
}
impl Gguf_GgufBody_GgufKv {
    pub fn value(&self) -> Ref<'_, OptRc<Gguf_GgufBody_GgufValue>> {
        self.value.borrow()
    }
}
impl Gguf_GgufBody_GgufKv {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * \sa https://github.com/ggml-org/ggml/blob/a05c9922613c6a2230dbb1d0de679519ecafb4f0/docs/gguf.md?plain=1#L232-L237 Git tag "v0.27.0"
 */

#[derive(Default, Debug, Clone)]
pub struct Gguf_GgufBody_GgufStr {
    pub _root: SharedType<Gguf>,
    pub _parent: SharedType<KStructUnit>,
    pub _self: SharedType<Self>,
    len_value: RefCell<u64>,
    value: RefCell<String>,
    _io: RefCell<BytesReader>,
    _is_le: RefCell<i32>,
}
impl KStruct for Gguf_GgufBody_GgufStr {
    type Root = Gguf;
    type Parent = KStructUnit;

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
        *self_rc.len_value.borrow_mut() = if *self_rc._is_le.borrow() == 1 { _io.read_u8le()?.into() } else { _io.read_u8be()?.into() };
        *self_rc.value.borrow_mut() = bytes_to_str(&_io.read_bytes(*self_rc.len_value() as usize)?.into(), "UTF-8")?;
        Ok(())
    }
}
impl Gguf_GgufBody_GgufStr {
    pub fn set_endian(&mut self, _is_le: i32) {
        *self._is_le.borrow_mut() = _is_le;
    }
}
impl Gguf_GgufBody_GgufStr {
}
impl Gguf_GgufBody_GgufStr {
    pub fn len_value(&self) -> Ref<'_, u64> {
        self.len_value.borrow()
    }
}
impl Gguf_GgufBody_GgufStr {
    pub fn value(&self) -> Ref<'_, String> {
        self.value.borrow()
    }
}
impl Gguf_GgufBody_GgufStr {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * \sa https://github.com/ggml-org/ggml/blob/a05c9922613c6a2230dbb1d0de679519ecafb4f0/docs/gguf.md?plain=1#L305-L325 Git tag "v0.27.0"
 */

#[derive(Default, Debug, Clone)]
pub struct Gguf_GgufBody_GgufTensorInfo {
    pub _root: SharedType<Gguf>,
    pub _parent: SharedType<Gguf_GgufBody>,
    pub _self: SharedType<Self>,
    expected_offset: RefCell<u64>,
    name: RefCell<OptRc<Gguf_GgufBody_GgufStr>>,
    num_dims: RefCell<u32>,
    dims: RefCell<Vec<i64>>,
    type: RefCell<Gguf_GgmlType>,
    offset: RefCell<u64>,
    _io: RefCell<BytesReader>,
    f_data: Cell<bool>,
    data: RefCell<Vec<u8>>,
    f_dump_dims: Cell<bool>,
    dump_dims: RefCell<String>,
    f_expected_next_offset: Cell<bool>,
    expected_next_offset: RefCell<u64>,
    f_len_block: Cell<bool>,
    len_block: RefCell<i32>,
    f_len_data: Cell<bool>,
    len_data: RefCell<u64>,
    f_len_padding: Cell<bool>,
    len_padding: RefCell<i32>,
    f_num_blocks: Cell<bool>,
    num_blocks: RefCell<i64>,
    f_num_elements: Cell<bool>,
    num_elements: RefCell<i64>,
    f_num_elements_per_block: Cell<bool>,
    num_elements_per_block: RefCell<i32>,
    f_padding: Cell<bool>,
    padding: RefCell<Vec<u8>>,
    _is_le: RefCell<i32>,
}
impl KStruct for Gguf_GgufBody_GgufTensorInfo {
    type Root = Gguf;
    type Parent = Gguf_GgufBody;

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
        let f = |t : &mut Gguf_GgufBody_GgufStr| Ok(t.set_endian(*self_rc._is_le.borrow()));
        let t = Self::read_into_with_init::<_, Gguf_GgufBody_GgufStr>(&*_io, Some(self_rc._root.clone()), None, &f)?.into();
        *self_rc.name.borrow_mut() = t;
        let _tmpa = *self_rc.name();
        if !(((*_tmpa.len_value() as u64) < (64 as u64))) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::Expr, src_path: "/types/gguf_body/types/gguf_tensor_info/seq/0".to_string() }));
        }
        *self_rc.num_dims.borrow_mut() = if *self_rc._is_le.borrow() == 1 { _io.read_u4le()?.into() } else { _io.read_u4be()?.into() };
        if !(((*self_rc.num_dims() as u32) <= (4 as u32))) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::GreaterThan, src_path: "/types/gguf_body/types/gguf_tensor_info/seq/1".to_string() }));
        }
        *self_rc.dims.borrow_mut() = Vec::new();
        let l_dims = *self_rc.num_dims();
        for _i in 0..l_dims {
            self_rc.dims.borrow_mut().push(if *self_rc._is_le.borrow() == 1 { _io.read_s8le()?.into() } else { _io.read_s8be()?.into() });
            if !(((self_rc.dims()[_i as usize] as i64) >= (0 as i64))) {
                return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::LessThan, src_path: "/types/gguf_body/types/gguf_tensor_info/seq/2".to_string() }));
            }
        }
        *self_rc.type.borrow_mut() = (_io.read_u4()? as i64).try_into()?;
        let _tmpa = *self_rc.type();
        if !( ((((i64::from(&_tmpa) as i32) < (43 as i32))) && (((*self_rc.num_elements_per_block()? as i32) != (0 as i32))) && (((modulo(if ((*self_rc.num_dims() as u32) > (0 as u32)) { self_rc.dims()[0 as usize] } else { 1 } as i64, *self_rc.num_elements_per_block()? as i64) as i32) == (0 as i32)))) ) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::Expr, src_path: "/types/gguf_body/types/gguf_tensor_info/seq/3".to_string() }));
        }
        *self_rc.offset.borrow_mut() = if *self_rc._is_le.borrow() == 1 { _io.read_u8le()?.into() } else { _io.read_u8be()?.into() };
        if !(*self_rc.offset() == *self_rc.expected_offset()) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/gguf_body/types/gguf_tensor_info/seq/4".to_string() }));
        }
        Ok(())
    }
}
impl Gguf_GgufBody_GgufTensorInfo {
    pub fn expected_offset(&self) -> Ref<'_, u64> {
        self.expected_offset.borrow()
    }
}
impl Gguf_GgufBody_GgufTensorInfo {
    pub fn set_params(&mut self, expected_offset: u64) {
        *self.expected_offset.borrow_mut() = expected_offset;
    }
}
impl Gguf_GgufBody_GgufTensorInfo {
    pub fn set_endian(&mut self, _is_le: i32) {
        *self._is_le.borrow_mut() = _is_le;
    }
}
impl Gguf_GgufBody_GgufTensorInfo {
    pub fn data(
        &self
    ) -> KResult<Ref<'_, Vec<u8>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_data.get() {
            return Ok(self.data.borrow());
        }
        self.f_data.set(true);
        let _pos = _io.pos();
        _io.seek(((*_prc.as_ref().unwrap().ofs_tensor_data()? as u64) + (*self.offset() as u64)) as usize)?;
        *self.data.borrow_mut() = _io.read_bytes(*self.len_data()? as usize)?.into();
        _io.seek(_pos)?;
        Ok(self.data.borrow())
    }

    /**
     * `dims` joined with the string `" x "`. This is necessary for
     * `-webide-representation`, which cannot format `dims` directly -
     * see <https://github.com/kaitai-io/kaitai_struct_webide/issues/160>.
     */
    pub fn dump_dims(
        &self
    ) -> KResult<Ref<'_, String>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_dump_dims.get() {
            return Ok(self.dump_dims.borrow());
        }
        self.f_dump_dims.set(true);
        *self.dump_dims.borrow_mut() = format!("{}{}", format!("{}{}", format!("{}{}", if ((*self.num_dims() as u32) > (0 as u32)) { self.dims()[0 as usize].to_string().to_string() } else { "".to_string() }, if ((*self.num_dims() as u32) > (1 as u32)) { format!("{}{}", " x ", self.dims()[1 as usize].to_string()).to_string() } else { "".to_string() }), if ((*self.num_dims() as u32) > (2 as u32)) { format!("{}{}", " x ", self.dims()[2 as usize].to_string()).to_string() } else { "".to_string() }), if ((*self.num_dims() as u32) > (3 as u32)) { format!("{}{}", " x ", self.dims()[3 as usize].to_string()).to_string() } else { "".to_string() }).to_string();
        Ok(self.dump_dims.borrow())
    }

    /**
     * `offset` that the next tensor must have
     */
    pub fn expected_next_offset(
        &self
    ) -> KResult<Ref<'_, u64>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_expected_next_offset.get() {
            return Ok(self.expected_next_offset.borrow());
        }
        self.f_expected_next_offset.set(true);
        *self.expected_next_offset.borrow_mut() = ((((((*self.offset() as u64) + (*self.len_data()? as u64)) as i32) + (*self.len_padding()? as i32)) as u64)) as u64;
        Ok(self.expected_next_offset.borrow())
    }

    /**
     * Size of a block in bytes
     */
    pub fn len_block(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_len_block.get() {
            return Ok(self.len_block.borrow());
        }
        self.f_len_block.set(true);
        *self.len_block.borrow_mut() = (vec![4, 2, 18, 20, 0, 0, 22, 24, 34, 36, 84, 110, 144, 176, 210, 292, 66, 74, 98, 50, 18, 110, 82, 136, 1, 2, 4, 8, 8, 56, 2, 0, 0, 0, 54, 66, 0, 0, 0, 17, 36, 18, 18][i64::from(&*self.type()) as usize]) as i32;
        Ok(self.len_block.borrow())
    }
    pub fn len_data(
        &self
    ) -> KResult<Ref<'_, u64>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_len_data.get() {
            return Ok(self.len_data.borrow());
        }
        self.f_len_data.set(true);
        *self.len_data.borrow_mut() = ((((*self.len_block()? as i32) * (*self.num_blocks()? as i32)) as u64)) as u64;
        Ok(self.len_data.borrow())
    }

    /**
     * Number of padding bytes after the data
     */
    pub fn len_padding(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_len_padding.get() {
            return Ok(self.len_padding.borrow());
        }
        self.f_len_padding.set(true);
        *self.len_padding.borrow_mut() = (((((*_prc.as_ref().unwrap().alignment()? as i32) - (((*self.len_data()? as u64) % (*_prc.as_ref().unwrap().alignment()? as u64)) as i32)) as i32) % (*_prc.as_ref().unwrap().alignment()? as i32))) as i32;
        Ok(self.len_padding.borrow())
    }
    pub fn num_blocks(
        &self
    ) -> KResult<Ref<'_, i64>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_num_blocks.get() {
            return Ok(self.num_blocks.borrow());
        }
        self.f_num_blocks.set(true);
        *self.num_blocks.borrow_mut() = ((((*self.num_elements()? as i32) / (*self.num_elements_per_block()? as i32)) as i64)) as i64;
        Ok(self.num_blocks.borrow())
    }
    pub fn num_elements(
        &self
    ) -> KResult<Ref<'_, i64>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_num_elements.get() {
            return Ok(self.num_elements.borrow());
        }
        self.f_num_elements.set(true);
        *self.num_elements.borrow_mut() = ((((((((if ((*self.num_dims() as u32) > (0 as u32)) { self.dims()[0 as usize] } else { 1 } as i64) * (if ((*self.num_dims() as u32) > (1 as u32)) { self.dims()[1 as usize] } else { 1 } as i64)) as i32) * (if ((*self.num_dims() as u32) > (2 as u32)) { self.dims()[2 as usize] } else { 1 } as i32)) as i32) * (if ((*self.num_dims() as u32) > (3 as u32)) { self.dims()[3 as usize] } else { 1 } as i32)) as i64)) as i64;
        Ok(self.num_elements.borrow())
    }

    /**
     * Number of elements in a block
     */
    pub fn num_elements_per_block(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_num_elements_per_block.get() {
            return Ok(self.num_elements_per_block.borrow());
        }
        self.f_num_elements_per_block.set(true);
        *self.num_elements_per_block.borrow_mut() = (vec![1, 1, 32, 32, 0, 0, 32, 32, 32, 32, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 32, 256, 256, 256, 1, 1, 1, 1, 1, 256, 1, 0, 0, 0, 256, 256, 0, 0, 0, 32, 64, 128, 64][i64::from(&*self.type()) as usize]) as i32;
        Ok(self.num_elements_per_block.borrow())
    }

    /**
     * Padding after the data. ggml requires it even after the last tensor
     * when reading the tensor data.
     * \sa https://github.com/ggml-org/ggml/blob/a05c9922613c6a2230dbb1d0de679519ecafb4f0/src/gguf.cpp#L884-L893 Git tag "v0.27.0"
     */
    pub fn padding(
        &self
    ) -> KResult<Ref<'_, Vec<u8>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_padding.get() {
            return Ok(self.padding.borrow());
        }
        self.f_padding.set(true);
        let _pos = _io.pos();
        _io.seek(((((*_prc.as_ref().unwrap().ofs_tensor_data()? as u64) + (*self.offset() as u64)) as i32) + (*self.len_data()? as i32)) as usize)?;
        *self.padding.borrow_mut() = _io.read_bytes(*self.len_padding()? as usize)?.into();
        _io.seek(_pos)?;
        Ok(self.padding.borrow())
    }
}
impl Gguf_GgufBody_GgufTensorInfo {
    pub fn name(&self) -> Ref<'_, OptRc<Gguf_GgufBody_GgufStr>> {
        self.name.borrow()
    }
}
impl Gguf_GgufBody_GgufTensorInfo {
    pub fn num_dims(&self) -> Ref<'_, u32> {
        self.num_dims.borrow()
    }
}
impl Gguf_GgufBody_GgufTensorInfo {
    pub fn dims(&self) -> Ref<'_, Vec<i64>> {
        self.dims.borrow()
    }
}
impl Gguf_GgufBody_GgufTensorInfo {
    pub fn type(&self) -> Ref<'_, Gguf_GgmlType> {
        self.type.borrow()
    }
}

/**
 * Offset of the tensor's data, relative to `_parent.ofs_tensor_data`
 */
impl Gguf_GgufBody_GgufTensorInfo {
    pub fn offset(&self) -> Ref<'_, u64> {
        self.offset.borrow()
    }
}
impl Gguf_GgufBody_GgufTensorInfo {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Gguf_GgufBody_GgufUint16 {
    pub _root: SharedType<Gguf>,
    pub _parent: SharedType<Gguf_GgufBody_GgufValue>,
    pub _self: SharedType<Self>,
    value: RefCell<u16>,
    _io: RefCell<BytesReader>,
    _is_le: RefCell<i32>,
}
impl KStruct for Gguf_GgufBody_GgufUint16 {
    type Root = Gguf;
    type Parent = Gguf_GgufBody_GgufValue;

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
        *self_rc.value.borrow_mut() = if *self_rc._is_le.borrow() == 1 { _io.read_u2le()?.into() } else { _io.read_u2be()?.into() };
        Ok(())
    }
}
impl Gguf_GgufBody_GgufUint16 {
    pub fn set_endian(&mut self, _is_le: i32) {
        *self._is_le.borrow_mut() = _is_le;
    }
}
impl Gguf_GgufBody_GgufUint16 {
}
impl Gguf_GgufBody_GgufUint16 {
    pub fn value(&self) -> Ref<'_, u16> {
        self.value.borrow()
    }
}
impl Gguf_GgufBody_GgufUint16 {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Gguf_GgufBody_GgufUint32 {
    pub _root: SharedType<Gguf>,
    pub _parent: SharedType<Gguf_GgufBody_GgufValue>,
    pub _self: SharedType<Self>,
    value: RefCell<u32>,
    _io: RefCell<BytesReader>,
    _is_le: RefCell<i32>,
}
impl KStruct for Gguf_GgufBody_GgufUint32 {
    type Root = Gguf;
    type Parent = Gguf_GgufBody_GgufValue;

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
        *self_rc.value.borrow_mut() = if *self_rc._is_le.borrow() == 1 { _io.read_u4le()?.into() } else { _io.read_u4be()?.into() };
        Ok(())
    }
}
impl Gguf_GgufBody_GgufUint32 {
    pub fn set_endian(&mut self, _is_le: i32) {
        *self._is_le.borrow_mut() = _is_le;
    }
}
impl Gguf_GgufBody_GgufUint32 {
}
impl Gguf_GgufBody_GgufUint32 {
    pub fn value(&self) -> Ref<'_, u32> {
        self.value.borrow()
    }
}
impl Gguf_GgufBody_GgufUint32 {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Gguf_GgufBody_GgufUint64 {
    pub _root: SharedType<Gguf>,
    pub _parent: SharedType<Gguf_GgufBody_GgufValue>,
    pub _self: SharedType<Self>,
    value: RefCell<u64>,
    _io: RefCell<BytesReader>,
    _is_le: RefCell<i32>,
}
impl KStruct for Gguf_GgufBody_GgufUint64 {
    type Root = Gguf;
    type Parent = Gguf_GgufBody_GgufValue;

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
        *self_rc.value.borrow_mut() = if *self_rc._is_le.borrow() == 1 { _io.read_u8le()?.into() } else { _io.read_u8be()?.into() };
        Ok(())
    }
}
impl Gguf_GgufBody_GgufUint64 {
    pub fn set_endian(&mut self, _is_le: i32) {
        *self._is_le.borrow_mut() = _is_le;
    }
}
impl Gguf_GgufBody_GgufUint64 {
}
impl Gguf_GgufBody_GgufUint64 {
    pub fn value(&self) -> Ref<'_, u64> {
        self.value.borrow()
    }
}
impl Gguf_GgufBody_GgufUint64 {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Gguf_GgufBody_GgufUint8 {
    pub _root: SharedType<Gguf>,
    pub _parent: SharedType<Gguf_GgufBody_GgufValue>,
    pub _self: SharedType<Self>,
    value: RefCell<u8>,
    _io: RefCell<BytesReader>,
    _is_le: RefCell<i32>,
}
impl KStruct for Gguf_GgufBody_GgufUint8 {
    type Root = Gguf;
    type Parent = Gguf_GgufBody_GgufValue;

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
        *self_rc.value.borrow_mut() = _io.read_u1()?.into();
        Ok(())
    }
}
impl Gguf_GgufBody_GgufUint8 {
    pub fn set_endian(&mut self, _is_le: i32) {
        *self._is_le.borrow_mut() = _is_le;
    }
}
impl Gguf_GgufBody_GgufUint8 {
}
impl Gguf_GgufBody_GgufUint8 {
    pub fn value(&self) -> Ref<'_, u8> {
        self.value.borrow()
    }
}
impl Gguf_GgufBody_GgufUint8 {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

/**
 * \sa https://github.com/ggml-org/ggml/blob/a05c9922613c6a2230dbb1d0de679519ecafb4f0/docs/gguf.md?plain=1#L239-L260 Git tag "v0.27.0"
 */

#[derive(Default, Debug, Clone)]
pub struct Gguf_GgufBody_GgufValue {
    pub _root: SharedType<Gguf>,
    pub _parent: SharedType<KStructUnit>,
    pub _self: SharedType<Self>,
    type: RefCell<Gguf_GgufType>,
    value: RefCell<Option<Gguf_GgufBody_GgufValue_Value>>,
    _io: RefCell<BytesReader>,
    _is_le: RefCell<i32>,
}
#[derive(Debug, Clone)]
pub enum Gguf_GgufBody_GgufValue_Value {
    Gguf_GgufBody_GgufInt32(OptRc<Gguf_GgufBody_GgufInt32>),
    Gguf_GgufBody_GgufUint8(OptRc<Gguf_GgufBody_GgufUint8>),
    Gguf_GgufBody_GgufFloat32(OptRc<Gguf_GgufBody_GgufFloat32>),
    Gguf_GgufBody_GgufBool(OptRc<Gguf_GgufBody_GgufBool>),
    Gguf_GgufBody_GgufFloat64(OptRc<Gguf_GgufBody_GgufFloat64>),
    Gguf_GgufBody_GgufUint64(OptRc<Gguf_GgufBody_GgufUint64>),
    Gguf_GgufBody_GgufUint16(OptRc<Gguf_GgufBody_GgufUint16>),
    Gguf_GgufBody_GgufInt16(OptRc<Gguf_GgufBody_GgufInt16>),
    Gguf_GgufBody_GgufInt8(OptRc<Gguf_GgufBody_GgufInt8>),
    Gguf_GgufBody_GgufStr(OptRc<Gguf_GgufBody_GgufStr>),
    Gguf_GgufBody_GgufArray(OptRc<Gguf_GgufBody_GgufArray>),
    Gguf_GgufBody_GgufUint32(OptRc<Gguf_GgufBody_GgufUint32>),
    Gguf_GgufBody_GgufInt64(OptRc<Gguf_GgufBody_GgufInt64>),
}
impl From<&Gguf_GgufBody_GgufValue_Value> for OptRc<Gguf_GgufBody_GgufInt32> {
    fn from(v: &Gguf_GgufBody_GgufValue_Value) -> Self {
        if let Gguf_GgufBody_GgufValue_Value::Gguf_GgufBody_GgufInt32(x) = v {
            return x.clone();
        }
        panic!("expected Gguf_GgufBody_GgufValue_Value::Gguf_GgufBody_GgufInt32, got {:?}", v)
    }
}
impl From<OptRc<Gguf_GgufBody_GgufInt32>> for Gguf_GgufBody_GgufValue_Value {
    fn from(v: OptRc<Gguf_GgufBody_GgufInt32>) -> Self {
        Self::Gguf_GgufBody_GgufInt32(v)
    }
}
impl From<&Gguf_GgufBody_GgufValue_Value> for OptRc<Gguf_GgufBody_GgufUint8> {
    fn from(v: &Gguf_GgufBody_GgufValue_Value) -> Self {
        if let Gguf_GgufBody_GgufValue_Value::Gguf_GgufBody_GgufUint8(x) = v {
            return x.clone();
        }
        panic!("expected Gguf_GgufBody_GgufValue_Value::Gguf_GgufBody_GgufUint8, got {:?}", v)
    }
}
impl From<OptRc<Gguf_GgufBody_GgufUint8>> for Gguf_GgufBody_GgufValue_Value {
    fn from(v: OptRc<Gguf_GgufBody_GgufUint8>) -> Self {
        Self::Gguf_GgufBody_GgufUint8(v)
    }
}
impl From<&Gguf_GgufBody_GgufValue_Value> for OptRc<Gguf_GgufBody_GgufFloat32> {
    fn from(v: &Gguf_GgufBody_GgufValue_Value) -> Self {
        if let Gguf_GgufBody_GgufValue_Value::Gguf_GgufBody_GgufFloat32(x) = v {
            return x.clone();
        }
        panic!("expected Gguf_GgufBody_GgufValue_Value::Gguf_GgufBody_GgufFloat32, got {:?}", v)
    }
}
impl From<OptRc<Gguf_GgufBody_GgufFloat32>> for Gguf_GgufBody_GgufValue_Value {
    fn from(v: OptRc<Gguf_GgufBody_GgufFloat32>) -> Self {
        Self::Gguf_GgufBody_GgufFloat32(v)
    }
}
impl From<&Gguf_GgufBody_GgufValue_Value> for OptRc<Gguf_GgufBody_GgufBool> {
    fn from(v: &Gguf_GgufBody_GgufValue_Value) -> Self {
        if let Gguf_GgufBody_GgufValue_Value::Gguf_GgufBody_GgufBool(x) = v {
            return x.clone();
        }
        panic!("expected Gguf_GgufBody_GgufValue_Value::Gguf_GgufBody_GgufBool, got {:?}", v)
    }
}
impl From<OptRc<Gguf_GgufBody_GgufBool>> for Gguf_GgufBody_GgufValue_Value {
    fn from(v: OptRc<Gguf_GgufBody_GgufBool>) -> Self {
        Self::Gguf_GgufBody_GgufBool(v)
    }
}
impl From<&Gguf_GgufBody_GgufValue_Value> for OptRc<Gguf_GgufBody_GgufFloat64> {
    fn from(v: &Gguf_GgufBody_GgufValue_Value) -> Self {
        if let Gguf_GgufBody_GgufValue_Value::Gguf_GgufBody_GgufFloat64(x) = v {
            return x.clone();
        }
        panic!("expected Gguf_GgufBody_GgufValue_Value::Gguf_GgufBody_GgufFloat64, got {:?}", v)
    }
}
impl From<OptRc<Gguf_GgufBody_GgufFloat64>> for Gguf_GgufBody_GgufValue_Value {
    fn from(v: OptRc<Gguf_GgufBody_GgufFloat64>) -> Self {
        Self::Gguf_GgufBody_GgufFloat64(v)
    }
}
impl From<&Gguf_GgufBody_GgufValue_Value> for OptRc<Gguf_GgufBody_GgufUint64> {
    fn from(v: &Gguf_GgufBody_GgufValue_Value) -> Self {
        if let Gguf_GgufBody_GgufValue_Value::Gguf_GgufBody_GgufUint64(x) = v {
            return x.clone();
        }
        panic!("expected Gguf_GgufBody_GgufValue_Value::Gguf_GgufBody_GgufUint64, got {:?}", v)
    }
}
impl From<OptRc<Gguf_GgufBody_GgufUint64>> for Gguf_GgufBody_GgufValue_Value {
    fn from(v: OptRc<Gguf_GgufBody_GgufUint64>) -> Self {
        Self::Gguf_GgufBody_GgufUint64(v)
    }
}
impl From<&Gguf_GgufBody_GgufValue_Value> for OptRc<Gguf_GgufBody_GgufUint16> {
    fn from(v: &Gguf_GgufBody_GgufValue_Value) -> Self {
        if let Gguf_GgufBody_GgufValue_Value::Gguf_GgufBody_GgufUint16(x) = v {
            return x.clone();
        }
        panic!("expected Gguf_GgufBody_GgufValue_Value::Gguf_GgufBody_GgufUint16, got {:?}", v)
    }
}
impl From<OptRc<Gguf_GgufBody_GgufUint16>> for Gguf_GgufBody_GgufValue_Value {
    fn from(v: OptRc<Gguf_GgufBody_GgufUint16>) -> Self {
        Self::Gguf_GgufBody_GgufUint16(v)
    }
}
impl From<&Gguf_GgufBody_GgufValue_Value> for OptRc<Gguf_GgufBody_GgufInt16> {
    fn from(v: &Gguf_GgufBody_GgufValue_Value) -> Self {
        if let Gguf_GgufBody_GgufValue_Value::Gguf_GgufBody_GgufInt16(x) = v {
            return x.clone();
        }
        panic!("expected Gguf_GgufBody_GgufValue_Value::Gguf_GgufBody_GgufInt16, got {:?}", v)
    }
}
impl From<OptRc<Gguf_GgufBody_GgufInt16>> for Gguf_GgufBody_GgufValue_Value {
    fn from(v: OptRc<Gguf_GgufBody_GgufInt16>) -> Self {
        Self::Gguf_GgufBody_GgufInt16(v)
    }
}
impl From<&Gguf_GgufBody_GgufValue_Value> for OptRc<Gguf_GgufBody_GgufInt8> {
    fn from(v: &Gguf_GgufBody_GgufValue_Value) -> Self {
        if let Gguf_GgufBody_GgufValue_Value::Gguf_GgufBody_GgufInt8(x) = v {
            return x.clone();
        }
        panic!("expected Gguf_GgufBody_GgufValue_Value::Gguf_GgufBody_GgufInt8, got {:?}", v)
    }
}
impl From<OptRc<Gguf_GgufBody_GgufInt8>> for Gguf_GgufBody_GgufValue_Value {
    fn from(v: OptRc<Gguf_GgufBody_GgufInt8>) -> Self {
        Self::Gguf_GgufBody_GgufInt8(v)
    }
}
impl From<&Gguf_GgufBody_GgufValue_Value> for OptRc<Gguf_GgufBody_GgufStr> {
    fn from(v: &Gguf_GgufBody_GgufValue_Value) -> Self {
        if let Gguf_GgufBody_GgufValue_Value::Gguf_GgufBody_GgufStr(x) = v {
            return x.clone();
        }
        panic!("expected Gguf_GgufBody_GgufValue_Value::Gguf_GgufBody_GgufStr, got {:?}", v)
    }
}
impl From<OptRc<Gguf_GgufBody_GgufStr>> for Gguf_GgufBody_GgufValue_Value {
    fn from(v: OptRc<Gguf_GgufBody_GgufStr>) -> Self {
        Self::Gguf_GgufBody_GgufStr(v)
    }
}
impl From<&Gguf_GgufBody_GgufValue_Value> for OptRc<Gguf_GgufBody_GgufArray> {
    fn from(v: &Gguf_GgufBody_GgufValue_Value) -> Self {
        if let Gguf_GgufBody_GgufValue_Value::Gguf_GgufBody_GgufArray(x) = v {
            return x.clone();
        }
        panic!("expected Gguf_GgufBody_GgufValue_Value::Gguf_GgufBody_GgufArray, got {:?}", v)
    }
}
impl From<OptRc<Gguf_GgufBody_GgufArray>> for Gguf_GgufBody_GgufValue_Value {
    fn from(v: OptRc<Gguf_GgufBody_GgufArray>) -> Self {
        Self::Gguf_GgufBody_GgufArray(v)
    }
}
impl From<&Gguf_GgufBody_GgufValue_Value> for OptRc<Gguf_GgufBody_GgufUint32> {
    fn from(v: &Gguf_GgufBody_GgufValue_Value) -> Self {
        if let Gguf_GgufBody_GgufValue_Value::Gguf_GgufBody_GgufUint32(x) = v {
            return x.clone();
        }
        panic!("expected Gguf_GgufBody_GgufValue_Value::Gguf_GgufBody_GgufUint32, got {:?}", v)
    }
}
impl From<OptRc<Gguf_GgufBody_GgufUint32>> for Gguf_GgufBody_GgufValue_Value {
    fn from(v: OptRc<Gguf_GgufBody_GgufUint32>) -> Self {
        Self::Gguf_GgufBody_GgufUint32(v)
    }
}
impl From<&Gguf_GgufBody_GgufValue_Value> for OptRc<Gguf_GgufBody_GgufInt64> {
    fn from(v: &Gguf_GgufBody_GgufValue_Value) -> Self {
        if let Gguf_GgufBody_GgufValue_Value::Gguf_GgufBody_GgufInt64(x) = v {
            return x.clone();
        }
        panic!("expected Gguf_GgufBody_GgufValue_Value::Gguf_GgufBody_GgufInt64, got {:?}", v)
    }
}
impl From<OptRc<Gguf_GgufBody_GgufInt64>> for Gguf_GgufBody_GgufValue_Value {
    fn from(v: OptRc<Gguf_GgufBody_GgufInt64>) -> Self {
        Self::Gguf_GgufBody_GgufInt64(v)
    }
}
impl KStruct for Gguf_GgufBody_GgufValue {
    type Root = Gguf;
    type Parent = KStructUnit;

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
        match *self_rc.type() {
            Gguf_GgufType::Array => {
                let f = |t : &mut Gguf_GgufBody_GgufArray| Ok(t.set_endian(*self_rc._is_le.borrow()));
                let t = Self::read_into_with_init::<_, Gguf_GgufBody_GgufArray>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()), &f)?.into();
                *self_rc.value.borrow_mut() = Some(t);
            }
            Gguf_GgufType::Bool => {
                let f = |t : &mut Gguf_GgufBody_GgufBool| Ok(t.set_endian(*self_rc._is_le.borrow()));
                let t = Self::read_into_with_init::<_, Gguf_GgufBody_GgufBool>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()), &f)?.into();
                *self_rc.value.borrow_mut() = Some(t);
            }
            Gguf_GgufType::Float32 => {
                let f = |t : &mut Gguf_GgufBody_GgufFloat32| Ok(t.set_endian(*self_rc._is_le.borrow()));
                let t = Self::read_into_with_init::<_, Gguf_GgufBody_GgufFloat32>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()), &f)?.into();
                *self_rc.value.borrow_mut() = Some(t);
            }
            Gguf_GgufType::Float64 => {
                let f = |t : &mut Gguf_GgufBody_GgufFloat64| Ok(t.set_endian(*self_rc._is_le.borrow()));
                let t = Self::read_into_with_init::<_, Gguf_GgufBody_GgufFloat64>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()), &f)?.into();
                *self_rc.value.borrow_mut() = Some(t);
            }
            Gguf_GgufType::Int16 => {
                let f = |t : &mut Gguf_GgufBody_GgufInt16| Ok(t.set_endian(*self_rc._is_le.borrow()));
                let t = Self::read_into_with_init::<_, Gguf_GgufBody_GgufInt16>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()), &f)?.into();
                *self_rc.value.borrow_mut() = Some(t);
            }
            Gguf_GgufType::Int32 => {
                let f = |t : &mut Gguf_GgufBody_GgufInt32| Ok(t.set_endian(*self_rc._is_le.borrow()));
                let t = Self::read_into_with_init::<_, Gguf_GgufBody_GgufInt32>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()), &f)?.into();
                *self_rc.value.borrow_mut() = Some(t);
            }
            Gguf_GgufType::Int64 => {
                let f = |t : &mut Gguf_GgufBody_GgufInt64| Ok(t.set_endian(*self_rc._is_le.borrow()));
                let t = Self::read_into_with_init::<_, Gguf_GgufBody_GgufInt64>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()), &f)?.into();
                *self_rc.value.borrow_mut() = Some(t);
            }
            Gguf_GgufType::Int8 => {
                let f = |t : &mut Gguf_GgufBody_GgufInt8| Ok(t.set_endian(*self_rc._is_le.borrow()));
                let t = Self::read_into_with_init::<_, Gguf_GgufBody_GgufInt8>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()), &f)?.into();
                *self_rc.value.borrow_mut() = Some(t);
            }
            Gguf_GgufType::String => {
                let f = |t : &mut Gguf_GgufBody_GgufStr| Ok(t.set_endian(*self_rc._is_le.borrow()));
                let t = Self::read_into_with_init::<_, Gguf_GgufBody_GgufStr>(&*_io, Some(self_rc._root.clone()), None, &f)?.into();
                *self_rc.value.borrow_mut() = Some(t);
            }
            Gguf_GgufType::Uint16 => {
                let f = |t : &mut Gguf_GgufBody_GgufUint16| Ok(t.set_endian(*self_rc._is_le.borrow()));
                let t = Self::read_into_with_init::<_, Gguf_GgufBody_GgufUint16>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()), &f)?.into();
                *self_rc.value.borrow_mut() = Some(t);
            }
            Gguf_GgufType::Uint32 => {
                let f = |t : &mut Gguf_GgufBody_GgufUint32| Ok(t.set_endian(*self_rc._is_le.borrow()));
                let t = Self::read_into_with_init::<_, Gguf_GgufBody_GgufUint32>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()), &f)?.into();
                *self_rc.value.borrow_mut() = Some(t);
            }
            Gguf_GgufType::Uint64 => {
                let f = |t : &mut Gguf_GgufBody_GgufUint64| Ok(t.set_endian(*self_rc._is_le.borrow()));
                let t = Self::read_into_with_init::<_, Gguf_GgufBody_GgufUint64>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()), &f)?.into();
                *self_rc.value.borrow_mut() = Some(t);
            }
            Gguf_GgufType::Uint8 => {
                let f = |t : &mut Gguf_GgufBody_GgufUint8| Ok(t.set_endian(*self_rc._is_le.borrow()));
                let t = Self::read_into_with_init::<_, Gguf_GgufBody_GgufUint8>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()), &f)?.into();
                *self_rc.value.borrow_mut() = Some(t);
            }
            _ => {}
        }
        Ok(())
    }
}
impl Gguf_GgufBody_GgufValue {
    pub fn type(&self) -> Ref<'_, Gguf_GgufType> {
        self.type.borrow()
    }
}
impl Gguf_GgufBody_GgufValue {
    pub fn set_params(&mut self, type: &Gguf_GgufType) {
        *self.type.borrow_mut() = type.clone();
    }
}
impl Gguf_GgufBody_GgufValue {
    pub fn set_endian(&mut self, _is_le: i32) {
        *self._is_le.borrow_mut() = _is_le;
    }
}
impl Gguf_GgufBody_GgufValue {
}
impl Gguf_GgufBody_GgufValue {
    pub fn value(&self) -> Ref<'_, Option<Gguf_GgufBody_GgufValue_Value>> {
        self.value.borrow()
    }
}
impl Gguf_GgufBody_GgufValue {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
