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
 * \sa https://bitcoin.org/en/developer-guide#transactions
 * https://en.bitcoin.it/wiki/Transaction
 *  Source
 */

#[derive(Default, Debug, Clone)]
pub struct BitcoinTransaction {
    pub _root: SharedType<BitcoinTransaction>,
    pub _parent: SharedType<BitcoinTransaction>,
    pub _self: SharedType<Self>,
    version: RefCell<u32>,
    num_vins: RefCell<u8>,
    vins: RefCell<Vec<OptRc<BitcoinTransaction_Vin>>>,
    num_vouts: RefCell<u8>,
    vouts: RefCell<Vec<OptRc<BitcoinTransaction_Vout>>>,
    locktime: RefCell<u32>,
    _io: RefCell<BytesReader>,
}
impl KStruct for BitcoinTransaction {
    type Root = BitcoinTransaction;
    type Parent = BitcoinTransaction;

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
        *self_rc.version.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.num_vins.borrow_mut() = _io.read_u1()?.into();
        *self_rc.vins.borrow_mut() = Vec::new();
        let l_vins = *self_rc.num_vins();
        for _i in 0..l_vins {
            let t = Self::read_into::<_, BitcoinTransaction_Vin>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
            self_rc.vins.borrow_mut().push(t);
        }
        *self_rc.num_vouts.borrow_mut() = _io.read_u1()?.into();
        *self_rc.vouts.borrow_mut() = Vec::new();
        let l_vouts = *self_rc.num_vouts();
        for _i in 0..l_vouts {
            let t = Self::read_into::<_, BitcoinTransaction_Vout>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
            self_rc.vouts.borrow_mut().push(t);
        }
        *self_rc.locktime.borrow_mut() = _io.read_u4le()?.into();
        Ok(())
    }
}
impl BitcoinTransaction {
}

/**
 * Version number.
 */
impl BitcoinTransaction {
    pub fn version(&self) -> Ref<'_, u32> {
        self.version.borrow()
    }
}

/**
 * Number of input transactions.
 */
impl BitcoinTransaction {
    pub fn num_vins(&self) -> Ref<'_, u8> {
        self.num_vins.borrow()
    }
}

/**
 * Input transactions.
 * An input refers to an output from a previous transaction.
 */
impl BitcoinTransaction {
    pub fn vins(&self) -> Ref<'_, Vec<OptRc<BitcoinTransaction_Vin>>> {
        self.vins.borrow()
    }
}

/**
 * Number of output transactions.
 */
impl BitcoinTransaction {
    pub fn num_vouts(&self) -> Ref<'_, u8> {
        self.num_vouts.borrow()
    }
}

/**
 * Output transactions.
 */
impl BitcoinTransaction {
    pub fn vouts(&self) -> Ref<'_, Vec<OptRc<BitcoinTransaction_Vout>>> {
        self.vouts.borrow()
    }
}
impl BitcoinTransaction {
    pub fn locktime(&self) -> Ref<'_, u32> {
        self.locktime.borrow()
    }
}
impl BitcoinTransaction {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct BitcoinTransaction_Vin {
    pub _root: SharedType<BitcoinTransaction>,
    pub _parent: SharedType<BitcoinTransaction>,
    pub _self: SharedType<Self>,
    txid: RefCell<Vec<u8>>,
    output_id: RefCell<u32>,
    len_script: RefCell<u8>,
    script_sig: RefCell<OptRc<BitcoinTransaction_Vin_ScriptSignature>>,
    end_of_vin: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
    script_sig_raw: RefCell<Vec<u8>>,
}
impl KStruct for BitcoinTransaction_Vin {
    type Root = BitcoinTransaction;
    type Parent = BitcoinTransaction;

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
        *self_rc.txid.borrow_mut() = _io.read_bytes(32 as usize)?.into();
        *self_rc.output_id.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.len_script.borrow_mut() = _io.read_u1()?.into();
        *self_rc.script_sig_raw.borrow_mut() = _io.read_bytes(*self_rc.len_script() as usize)?.into();
        let script_sig_raw = self_rc.script_sig_raw.borrow();
        let _t_script_sig_raw_io = BytesReader::from(script_sig_raw.clone());
        let t = Self::read_into::<BytesReader, BitcoinTransaction_Vin_ScriptSignature>(&_t_script_sig_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.script_sig.borrow_mut() = t;
        *self_rc.end_of_vin.borrow_mut() = _io.read_bytes(4 as usize)?.into();
        if !(*self_rc.end_of_vin() == vec![0xffu8, 0xffu8, 0xffu8, 0xffu8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/vin/seq/4".to_string() }));
        }
        Ok(())
    }
}
impl BitcoinTransaction_Vin {
}

/**
 * Previous transaction hash.
 */
impl BitcoinTransaction_Vin {
    pub fn txid(&self) -> Ref<'_, Vec<u8>> {
        self.txid.borrow()
    }
}

/**
 * ID indexing an ouput of the transaction refered by txid.
 * This output will be used as an input in the present transaction.
 */
impl BitcoinTransaction_Vin {
    pub fn output_id(&self) -> Ref<'_, u32> {
        self.output_id.borrow()
    }
}

/**
 * ScriptSig's length.
 */
impl BitcoinTransaction_Vin {
    pub fn len_script(&self) -> Ref<'_, u8> {
        self.len_script.borrow()
    }
}

/**
 * ScriptSig.
 * \sa https://en.bitcoin.it/wiki/Transaction#Input
 * https://en.bitcoin.it/wiki/Script
 *  Source
 */
impl BitcoinTransaction_Vin {
    pub fn script_sig(&self) -> Ref<'_, OptRc<BitcoinTransaction_Vin_ScriptSignature>> {
        self.script_sig.borrow()
    }
}

/**
 * Magic number indicating the end of the current input.
 */
impl BitcoinTransaction_Vin {
    pub fn end_of_vin(&self) -> Ref<'_, Vec<u8>> {
        self.end_of_vin.borrow()
    }
}
impl BitcoinTransaction_Vin {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
impl BitcoinTransaction_Vin {
    pub fn script_sig_raw(&self) -> Ref<'_, Vec<u8>> {
        self.script_sig_raw.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct BitcoinTransaction_Vin_ScriptSignature {
    pub _root: SharedType<BitcoinTransaction>,
    pub _parent: SharedType<BitcoinTransaction_Vin>,
    pub _self: SharedType<Self>,
    len_sig_stack: RefCell<u8>,
    der_sig: RefCell<OptRc<BitcoinTransaction_Vin_ScriptSignature_DerSignature>>,
    sig_type: RefCell<BitcoinTransaction_Vin_ScriptSignature_SighashType>,
    len_pubkey_stack: RefCell<u8>,
    pubkey: RefCell<OptRc<BitcoinTransaction_Vin_ScriptSignature_PublicKey>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for BitcoinTransaction_Vin_ScriptSignature {
    type Root = BitcoinTransaction;
    type Parent = BitcoinTransaction_Vin;

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
        *self_rc.len_sig_stack.borrow_mut() = _io.read_u1()?.into();
        let t = Self::read_into::<_, BitcoinTransaction_Vin_ScriptSignature_DerSignature>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.der_sig.borrow_mut() = t;
        *self_rc.sig_type.borrow_mut() = (_io.read_u1()? as i64).try_into()?;
        *self_rc.len_pubkey_stack.borrow_mut() = _io.read_u1()?.into();
        let t = Self::read_into::<_, BitcoinTransaction_Vin_ScriptSignature_PublicKey>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.pubkey.borrow_mut() = t;
        Ok(())
    }
}
impl BitcoinTransaction_Vin_ScriptSignature {
}
impl BitcoinTransaction_Vin_ScriptSignature {
    pub fn len_sig_stack(&self) -> Ref<'_, u8> {
        self.len_sig_stack.borrow()
    }
}

/**
 * DER-encoded ECDSA signature.
 * \sa https://en.wikipedia.org/wiki/X.690#DER_encoding
 * https://en.wikipedia.org/wiki/Elliptic_Curve_Digital_Signature_Algorithm
 *  Source
 */
impl BitcoinTransaction_Vin_ScriptSignature {
    pub fn der_sig(&self) -> Ref<'_, OptRc<BitcoinTransaction_Vin_ScriptSignature_DerSignature>> {
        self.der_sig.borrow()
    }
}

/**
 * Type of signature.
 */
impl BitcoinTransaction_Vin_ScriptSignature {
    pub fn sig_type(&self) -> Ref<'_, BitcoinTransaction_Vin_ScriptSignature_SighashType> {
        self.sig_type.borrow()
    }
}
impl BitcoinTransaction_Vin_ScriptSignature {
    pub fn len_pubkey_stack(&self) -> Ref<'_, u8> {
        self.len_pubkey_stack.borrow()
    }
}

/**
 * Public key (bitcoin address of the recipient).
 */
impl BitcoinTransaction_Vin_ScriptSignature {
    pub fn pubkey(&self) -> Ref<'_, OptRc<BitcoinTransaction_Vin_ScriptSignature_PublicKey>> {
        self.pubkey.borrow()
    }
}
impl BitcoinTransaction_Vin_ScriptSignature {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
#[derive(Debug, PartialEq, Clone)]
pub enum BitcoinTransaction_Vin_ScriptSignature_SighashType {
    SighashAll,
    SighashNone,
    SighashSingle,
    SighashAnyonecanpay,
    Unknown(i64),
}

impl TryFrom<i64> for BitcoinTransaction_Vin_ScriptSignature_SighashType {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<BitcoinTransaction_Vin_ScriptSignature_SighashType> {
        match flag {
            1 => Ok(BitcoinTransaction_Vin_ScriptSignature_SighashType::SighashAll),
            2 => Ok(BitcoinTransaction_Vin_ScriptSignature_SighashType::SighashNone),
            3 => Ok(BitcoinTransaction_Vin_ScriptSignature_SighashType::SighashSingle),
            80 => Ok(BitcoinTransaction_Vin_ScriptSignature_SighashType::SighashAnyonecanpay),
            _ => Ok(BitcoinTransaction_Vin_ScriptSignature_SighashType::Unknown(flag)),
        }
    }
}

impl From<&BitcoinTransaction_Vin_ScriptSignature_SighashType> for i64 {
    fn from(v: &BitcoinTransaction_Vin_ScriptSignature_SighashType) -> Self {
        match *v {
            BitcoinTransaction_Vin_ScriptSignature_SighashType::SighashAll => 1,
            BitcoinTransaction_Vin_ScriptSignature_SighashType::SighashNone => 2,
            BitcoinTransaction_Vin_ScriptSignature_SighashType::SighashSingle => 3,
            BitcoinTransaction_Vin_ScriptSignature_SighashType::SighashAnyonecanpay => 80,
            BitcoinTransaction_Vin_ScriptSignature_SighashType::Unknown(v) => v
        }
    }
}

impl Default for BitcoinTransaction_Vin_ScriptSignature_SighashType {
    fn default() -> Self { BitcoinTransaction_Vin_ScriptSignature_SighashType::Unknown(0) }
}


#[derive(Default, Debug, Clone)]
pub struct BitcoinTransaction_Vin_ScriptSignature_DerSignature {
    pub _root: SharedType<BitcoinTransaction>,
    pub _parent: SharedType<BitcoinTransaction_Vin_ScriptSignature>,
    pub _self: SharedType<Self>,
    sequence: RefCell<Vec<u8>>,
    len_sig: RefCell<u8>,
    sep_1: RefCell<Vec<u8>>,
    len_sig_r: RefCell<u8>,
    sig_r: RefCell<Vec<u8>>,
    sep_2: RefCell<Vec<u8>>,
    len_sig_s: RefCell<u8>,
    sig_s: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for BitcoinTransaction_Vin_ScriptSignature_DerSignature {
    type Root = BitcoinTransaction;
    type Parent = BitcoinTransaction_Vin_ScriptSignature;

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
        *self_rc.sequence.borrow_mut() = _io.read_bytes(1 as usize)?.into();
        if !(*self_rc.sequence() == vec![0x30u8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/vin/types/script_signature/types/der_signature/seq/0".to_string() }));
        }
        *self_rc.len_sig.borrow_mut() = _io.read_u1()?.into();
        *self_rc.sep_1.borrow_mut() = _io.read_bytes(1 as usize)?.into();
        if !(*self_rc.sep_1() == vec![0x2u8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/vin/types/script_signature/types/der_signature/seq/2".to_string() }));
        }
        *self_rc.len_sig_r.borrow_mut() = _io.read_u1()?.into();
        *self_rc.sig_r.borrow_mut() = _io.read_bytes(*self_rc.len_sig_r() as usize)?.into();
        *self_rc.sep_2.borrow_mut() = _io.read_bytes(1 as usize)?.into();
        if !(*self_rc.sep_2() == vec![0x2u8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/types/vin/types/script_signature/types/der_signature/seq/5".to_string() }));
        }
        *self_rc.len_sig_s.borrow_mut() = _io.read_u1()?.into();
        *self_rc.sig_s.borrow_mut() = _io.read_bytes(*self_rc.len_sig_s() as usize)?.into();
        Ok(())
    }
}
impl BitcoinTransaction_Vin_ScriptSignature_DerSignature {
}
impl BitcoinTransaction_Vin_ScriptSignature_DerSignature {
    pub fn sequence(&self) -> Ref<'_, Vec<u8>> {
        self.sequence.borrow()
    }
}
impl BitcoinTransaction_Vin_ScriptSignature_DerSignature {
    pub fn len_sig(&self) -> Ref<'_, u8> {
        self.len_sig.borrow()
    }
}
impl BitcoinTransaction_Vin_ScriptSignature_DerSignature {
    pub fn sep_1(&self) -> Ref<'_, Vec<u8>> {
        self.sep_1.borrow()
    }
}

/**
 * 'r' value's length.
 */
impl BitcoinTransaction_Vin_ScriptSignature_DerSignature {
    pub fn len_sig_r(&self) -> Ref<'_, u8> {
        self.len_sig_r.borrow()
    }
}

/**
 * 'r' value of the ECDSA signature.
 * \sa https://en.wikipedia.org/wiki/Elliptic_Curve_Digital_Signature_Algorithm Source
 */
impl BitcoinTransaction_Vin_ScriptSignature_DerSignature {
    pub fn sig_r(&self) -> Ref<'_, Vec<u8>> {
        self.sig_r.borrow()
    }
}
impl BitcoinTransaction_Vin_ScriptSignature_DerSignature {
    pub fn sep_2(&self) -> Ref<'_, Vec<u8>> {
        self.sep_2.borrow()
    }
}

/**
 * 's' value's length.
 */
impl BitcoinTransaction_Vin_ScriptSignature_DerSignature {
    pub fn len_sig_s(&self) -> Ref<'_, u8> {
        self.len_sig_s.borrow()
    }
}

/**
 * 's' value of the ECDSA signature.
 * \sa https://en.wikipedia.org/wiki/Elliptic_Curve_Digital_Signature_Algorithm Source
 */
impl BitcoinTransaction_Vin_ScriptSignature_DerSignature {
    pub fn sig_s(&self) -> Ref<'_, Vec<u8>> {
        self.sig_s.borrow()
    }
}
impl BitcoinTransaction_Vin_ScriptSignature_DerSignature {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct BitcoinTransaction_Vin_ScriptSignature_PublicKey {
    pub _root: SharedType<BitcoinTransaction>,
    pub _parent: SharedType<BitcoinTransaction_Vin_ScriptSignature>,
    pub _self: SharedType<Self>,
    type: RefCell<u8>,
    x: RefCell<Vec<u8>>,
    y: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for BitcoinTransaction_Vin_ScriptSignature_PublicKey {
    type Root = BitcoinTransaction;
    type Parent = BitcoinTransaction_Vin_ScriptSignature;

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
        *self_rc.type.borrow_mut() = _io.read_u1()?.into();
        *self_rc.x.borrow_mut() = _io.read_bytes(32 as usize)?.into();
        *self_rc.y.borrow_mut() = _io.read_bytes(32 as usize)?.into();
        Ok(())
    }
}
impl BitcoinTransaction_Vin_ScriptSignature_PublicKey {
}
impl BitcoinTransaction_Vin_ScriptSignature_PublicKey {
    pub fn type(&self) -> Ref<'_, u8> {
        self.type.borrow()
    }
}

/**
 * 'x' coordinate of the public key on the elliptic curve.
 */
impl BitcoinTransaction_Vin_ScriptSignature_PublicKey {
    pub fn x(&self) -> Ref<'_, Vec<u8>> {
        self.x.borrow()
    }
}

/**
 * 'y' coordinate of the public key on the elliptic curve.
 */
impl BitcoinTransaction_Vin_ScriptSignature_PublicKey {
    pub fn y(&self) -> Ref<'_, Vec<u8>> {
        self.y.borrow()
    }
}
impl BitcoinTransaction_Vin_ScriptSignature_PublicKey {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct BitcoinTransaction_Vout {
    pub _root: SharedType<BitcoinTransaction>,
    pub _parent: SharedType<BitcoinTransaction>,
    pub _self: SharedType<Self>,
    amount: RefCell<u64>,
    len_script: RefCell<u8>,
    script_pub_key: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for BitcoinTransaction_Vout {
    type Root = BitcoinTransaction;
    type Parent = BitcoinTransaction;

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
        *self_rc.amount.borrow_mut() = _io.read_u8le()?.into();
        *self_rc.len_script.borrow_mut() = _io.read_u1()?.into();
        *self_rc.script_pub_key.borrow_mut() = _io.read_bytes(*self_rc.len_script() as usize)?.into();
        Ok(())
    }
}
impl BitcoinTransaction_Vout {
}

/**
 * Number of Satoshis to be transfered.
 */
impl BitcoinTransaction_Vout {
    pub fn amount(&self) -> Ref<'_, u64> {
        self.amount.borrow()
    }
}

/**
 * ScriptPubKey's length.
 */
impl BitcoinTransaction_Vout {
    pub fn len_script(&self) -> Ref<'_, u8> {
        self.len_script.borrow()
    }
}

/**
 * ScriptPubKey.
 * \sa https://en.bitcoin.it/wiki/Transaction#Output
 * https://en.bitcoin.it/wiki/Script
 *  Source
 */
impl BitcoinTransaction_Vout {
    pub fn script_pub_key(&self) -> Ref<'_, Vec<u8>> {
        self.script_pub_key.borrow()
    }
}
impl BitcoinTransaction_Vout {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
