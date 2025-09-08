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
 * This spec can be used to disassemble raw stream of 6502 CPU machine
 * code into individual operations. Each operation includes an opcode
 * and, optionally, an argument. Register arguments are part of the
 * `opcode` enum.
 */

#[derive(Default, Debug, Clone)]
pub struct Code6502 {
    pub _root: SharedType<Code6502>,
    pub _parent: SharedType<Code6502>,
    pub _self: SharedType<Self>,
    operations: RefCell<Vec<OptRc<Code6502_Operation>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Code6502 {
    type Root = Code6502;
    type Parent = Code6502;

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
        *self_rc.operations.borrow_mut() = Vec::new();
        {
            let mut _i = 0;
            while !_io.is_eof() {
                let t = Self::read_into::<_, Code6502_Operation>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                self_rc.operations.borrow_mut().push(t);
                _i += 1;
            }
        }
        Ok(())
    }
}
impl Code6502 {
}
impl Code6502 {
    pub fn operations(&self) -> Ref<'_, Vec<OptRc<Code6502_Operation>>> {
        self.operations.borrow()
    }
}
impl Code6502 {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
#[derive(Debug, PartialEq, Clone)]
pub enum Code6502_Opcode {
    BrkImpl,
    OraXInd,
    OraZpg,
    AslZpg,
    PhpImpl,
    OraImm,
    AslA,
    OraAbs,
    AslAbs,
    BplRel,
    OraIndY,
    OraZpgX,
    AslZpgX,
    ClcImpl,
    OraAbsY,
    OraAbsX,
    AslAbsX,
    JsrAbs,
    AndXInd,
    BitZpg,
    AndZpg,
    RolZpg,
    PlpImpl,
    AndImm,
    RolA,
    BitAbs,
    AndAbs,
    RolAbs,
    BmiRel,
    AndIndY,
    AndZpgX,
    RolZpgX,
    SecImpl,
    AndAbsY,
    AndAbsX,
    RolAbsX,
    RtiImpl,
    EorXInd,
    EorZpg,
    LsrZpg,
    PhaImpl,
    EorImm,
    LsrA,
    JmpAbs,
    EorAbs,
    LsrAbs,
    BvcRel,
    EorIndY,
    EorZpgX,
    LsrZpgX,
    CliImpl,
    EorAbsY,
    EorAbsX,
    LsrAbsX,
    RtsImpl,
    AdcXInd,
    AdcZpg,
    RorZpg,
    PlaImpl,
    AdcImm,
    RorA,
    JmpInd,
    AdcAbs,
    RorAbs,
    BvsRel,
    AdcIndY,
    AdcZpgX,
    RorZpgX,
    SeiImpl,
    AdcAbsY,
    AdcAbsX,
    RorAbsX,
    StaXInd,
    StyZpg,
    StaZpg,
    StxZpg,
    DeyImpl,
    TxaImpl,
    StyAbs,
    StaAbs,
    StxAbs,
    BccRel,
    StaIndY,
    StyZpgX,
    StaZpgX,
    StxZpgY,
    TyaImpl,
    StaAbsY,
    TxsImpl,
    StaAbsX,
    LdyImm,
    LdaXInd,
    LdxImm,
    LdyZpg,
    LdaZpg,
    LdxZpg,
    TayImpl,
    LdaImm,
    TaxImpl,
    LdyAbs,
    LdaAbs,
    LdxAbs,
    BcsRel,
    LdaIndY,
    LdyZpgX,
    LdaZpgX,
    LdxZpgY,
    ClvImpl,
    LdaAbsY,
    TsxImpl,
    LdyAbsX,
    LdaAbsX,
    LdxAbsY,
    CpyImm,
    CmpXInd,
    CpyZpg,
    CmpZpg,
    DecZpg,
    InyImpl,
    CmpImm,
    DexImpl,
    CpyAbs,
    CmpAbs,
    DecAbs,
    BneRel,
    CmpIndY,
    CmpZpgX,
    DecZpgX,
    CldImpl,
    CmpAbsY,
    CmpAbsX,
    DecAbsX,
    CpxImm,
    SbcXInd,
    CpxZpg,
    SbcZpg,
    IncZpg,
    InxImpl,
    SbcImm,
    NopImpl,
    CpxAbs,
    SbcAbs,
    IncAbs,
    BeqRel,
    SbcIndY,
    SbcZpgX,
    IncZpgX,
    SedImpl,
    SbcAbsY,
    SbcAbsX,
    IncAbsX,
    Unknown(i64),
}

impl TryFrom<i64> for Code6502_Opcode {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<Code6502_Opcode> {
        match flag {
            0 => Ok(Code6502_Opcode::BrkImpl),
            1 => Ok(Code6502_Opcode::OraXInd),
            5 => Ok(Code6502_Opcode::OraZpg),
            6 => Ok(Code6502_Opcode::AslZpg),
            8 => Ok(Code6502_Opcode::PhpImpl),
            9 => Ok(Code6502_Opcode::OraImm),
            10 => Ok(Code6502_Opcode::AslA),
            13 => Ok(Code6502_Opcode::OraAbs),
            14 => Ok(Code6502_Opcode::AslAbs),
            16 => Ok(Code6502_Opcode::BplRel),
            17 => Ok(Code6502_Opcode::OraIndY),
            21 => Ok(Code6502_Opcode::OraZpgX),
            22 => Ok(Code6502_Opcode::AslZpgX),
            24 => Ok(Code6502_Opcode::ClcImpl),
            25 => Ok(Code6502_Opcode::OraAbsY),
            29 => Ok(Code6502_Opcode::OraAbsX),
            30 => Ok(Code6502_Opcode::AslAbsX),
            32 => Ok(Code6502_Opcode::JsrAbs),
            33 => Ok(Code6502_Opcode::AndXInd),
            36 => Ok(Code6502_Opcode::BitZpg),
            37 => Ok(Code6502_Opcode::AndZpg),
            38 => Ok(Code6502_Opcode::RolZpg),
            40 => Ok(Code6502_Opcode::PlpImpl),
            41 => Ok(Code6502_Opcode::AndImm),
            42 => Ok(Code6502_Opcode::RolA),
            44 => Ok(Code6502_Opcode::BitAbs),
            45 => Ok(Code6502_Opcode::AndAbs),
            46 => Ok(Code6502_Opcode::RolAbs),
            48 => Ok(Code6502_Opcode::BmiRel),
            49 => Ok(Code6502_Opcode::AndIndY),
            53 => Ok(Code6502_Opcode::AndZpgX),
            54 => Ok(Code6502_Opcode::RolZpgX),
            56 => Ok(Code6502_Opcode::SecImpl),
            57 => Ok(Code6502_Opcode::AndAbsY),
            61 => Ok(Code6502_Opcode::AndAbsX),
            62 => Ok(Code6502_Opcode::RolAbsX),
            64 => Ok(Code6502_Opcode::RtiImpl),
            65 => Ok(Code6502_Opcode::EorXInd),
            69 => Ok(Code6502_Opcode::EorZpg),
            70 => Ok(Code6502_Opcode::LsrZpg),
            72 => Ok(Code6502_Opcode::PhaImpl),
            73 => Ok(Code6502_Opcode::EorImm),
            74 => Ok(Code6502_Opcode::LsrA),
            76 => Ok(Code6502_Opcode::JmpAbs),
            77 => Ok(Code6502_Opcode::EorAbs),
            78 => Ok(Code6502_Opcode::LsrAbs),
            80 => Ok(Code6502_Opcode::BvcRel),
            81 => Ok(Code6502_Opcode::EorIndY),
            85 => Ok(Code6502_Opcode::EorZpgX),
            86 => Ok(Code6502_Opcode::LsrZpgX),
            88 => Ok(Code6502_Opcode::CliImpl),
            89 => Ok(Code6502_Opcode::EorAbsY),
            93 => Ok(Code6502_Opcode::EorAbsX),
            94 => Ok(Code6502_Opcode::LsrAbsX),
            96 => Ok(Code6502_Opcode::RtsImpl),
            97 => Ok(Code6502_Opcode::AdcXInd),
            101 => Ok(Code6502_Opcode::AdcZpg),
            102 => Ok(Code6502_Opcode::RorZpg),
            104 => Ok(Code6502_Opcode::PlaImpl),
            105 => Ok(Code6502_Opcode::AdcImm),
            106 => Ok(Code6502_Opcode::RorA),
            108 => Ok(Code6502_Opcode::JmpInd),
            109 => Ok(Code6502_Opcode::AdcAbs),
            110 => Ok(Code6502_Opcode::RorAbs),
            112 => Ok(Code6502_Opcode::BvsRel),
            113 => Ok(Code6502_Opcode::AdcIndY),
            117 => Ok(Code6502_Opcode::AdcZpgX),
            118 => Ok(Code6502_Opcode::RorZpgX),
            120 => Ok(Code6502_Opcode::SeiImpl),
            121 => Ok(Code6502_Opcode::AdcAbsY),
            125 => Ok(Code6502_Opcode::AdcAbsX),
            126 => Ok(Code6502_Opcode::RorAbsX),
            129 => Ok(Code6502_Opcode::StaXInd),
            132 => Ok(Code6502_Opcode::StyZpg),
            133 => Ok(Code6502_Opcode::StaZpg),
            134 => Ok(Code6502_Opcode::StxZpg),
            136 => Ok(Code6502_Opcode::DeyImpl),
            138 => Ok(Code6502_Opcode::TxaImpl),
            140 => Ok(Code6502_Opcode::StyAbs),
            141 => Ok(Code6502_Opcode::StaAbs),
            142 => Ok(Code6502_Opcode::StxAbs),
            144 => Ok(Code6502_Opcode::BccRel),
            145 => Ok(Code6502_Opcode::StaIndY),
            148 => Ok(Code6502_Opcode::StyZpgX),
            149 => Ok(Code6502_Opcode::StaZpgX),
            150 => Ok(Code6502_Opcode::StxZpgY),
            152 => Ok(Code6502_Opcode::TyaImpl),
            153 => Ok(Code6502_Opcode::StaAbsY),
            154 => Ok(Code6502_Opcode::TxsImpl),
            157 => Ok(Code6502_Opcode::StaAbsX),
            160 => Ok(Code6502_Opcode::LdyImm),
            161 => Ok(Code6502_Opcode::LdaXInd),
            162 => Ok(Code6502_Opcode::LdxImm),
            164 => Ok(Code6502_Opcode::LdyZpg),
            165 => Ok(Code6502_Opcode::LdaZpg),
            166 => Ok(Code6502_Opcode::LdxZpg),
            168 => Ok(Code6502_Opcode::TayImpl),
            169 => Ok(Code6502_Opcode::LdaImm),
            170 => Ok(Code6502_Opcode::TaxImpl),
            172 => Ok(Code6502_Opcode::LdyAbs),
            173 => Ok(Code6502_Opcode::LdaAbs),
            174 => Ok(Code6502_Opcode::LdxAbs),
            176 => Ok(Code6502_Opcode::BcsRel),
            177 => Ok(Code6502_Opcode::LdaIndY),
            180 => Ok(Code6502_Opcode::LdyZpgX),
            181 => Ok(Code6502_Opcode::LdaZpgX),
            182 => Ok(Code6502_Opcode::LdxZpgY),
            184 => Ok(Code6502_Opcode::ClvImpl),
            185 => Ok(Code6502_Opcode::LdaAbsY),
            186 => Ok(Code6502_Opcode::TsxImpl),
            188 => Ok(Code6502_Opcode::LdyAbsX),
            189 => Ok(Code6502_Opcode::LdaAbsX),
            190 => Ok(Code6502_Opcode::LdxAbsY),
            192 => Ok(Code6502_Opcode::CpyImm),
            193 => Ok(Code6502_Opcode::CmpXInd),
            196 => Ok(Code6502_Opcode::CpyZpg),
            197 => Ok(Code6502_Opcode::CmpZpg),
            198 => Ok(Code6502_Opcode::DecZpg),
            200 => Ok(Code6502_Opcode::InyImpl),
            201 => Ok(Code6502_Opcode::CmpImm),
            202 => Ok(Code6502_Opcode::DexImpl),
            204 => Ok(Code6502_Opcode::CpyAbs),
            205 => Ok(Code6502_Opcode::CmpAbs),
            206 => Ok(Code6502_Opcode::DecAbs),
            208 => Ok(Code6502_Opcode::BneRel),
            209 => Ok(Code6502_Opcode::CmpIndY),
            213 => Ok(Code6502_Opcode::CmpZpgX),
            214 => Ok(Code6502_Opcode::DecZpgX),
            216 => Ok(Code6502_Opcode::CldImpl),
            217 => Ok(Code6502_Opcode::CmpAbsY),
            221 => Ok(Code6502_Opcode::CmpAbsX),
            222 => Ok(Code6502_Opcode::DecAbsX),
            224 => Ok(Code6502_Opcode::CpxImm),
            225 => Ok(Code6502_Opcode::SbcXInd),
            228 => Ok(Code6502_Opcode::CpxZpg),
            229 => Ok(Code6502_Opcode::SbcZpg),
            230 => Ok(Code6502_Opcode::IncZpg),
            232 => Ok(Code6502_Opcode::InxImpl),
            233 => Ok(Code6502_Opcode::SbcImm),
            234 => Ok(Code6502_Opcode::NopImpl),
            236 => Ok(Code6502_Opcode::CpxAbs),
            237 => Ok(Code6502_Opcode::SbcAbs),
            238 => Ok(Code6502_Opcode::IncAbs),
            240 => Ok(Code6502_Opcode::BeqRel),
            241 => Ok(Code6502_Opcode::SbcIndY),
            245 => Ok(Code6502_Opcode::SbcZpgX),
            246 => Ok(Code6502_Opcode::IncZpgX),
            248 => Ok(Code6502_Opcode::SedImpl),
            249 => Ok(Code6502_Opcode::SbcAbsY),
            253 => Ok(Code6502_Opcode::SbcAbsX),
            254 => Ok(Code6502_Opcode::IncAbsX),
            _ => Ok(Code6502_Opcode::Unknown(flag)),
        }
    }
}

impl From<&Code6502_Opcode> for i64 {
    fn from(v: &Code6502_Opcode) -> Self {
        match *v {
            Code6502_Opcode::BrkImpl => 0,
            Code6502_Opcode::OraXInd => 1,
            Code6502_Opcode::OraZpg => 5,
            Code6502_Opcode::AslZpg => 6,
            Code6502_Opcode::PhpImpl => 8,
            Code6502_Opcode::OraImm => 9,
            Code6502_Opcode::AslA => 10,
            Code6502_Opcode::OraAbs => 13,
            Code6502_Opcode::AslAbs => 14,
            Code6502_Opcode::BplRel => 16,
            Code6502_Opcode::OraIndY => 17,
            Code6502_Opcode::OraZpgX => 21,
            Code6502_Opcode::AslZpgX => 22,
            Code6502_Opcode::ClcImpl => 24,
            Code6502_Opcode::OraAbsY => 25,
            Code6502_Opcode::OraAbsX => 29,
            Code6502_Opcode::AslAbsX => 30,
            Code6502_Opcode::JsrAbs => 32,
            Code6502_Opcode::AndXInd => 33,
            Code6502_Opcode::BitZpg => 36,
            Code6502_Opcode::AndZpg => 37,
            Code6502_Opcode::RolZpg => 38,
            Code6502_Opcode::PlpImpl => 40,
            Code6502_Opcode::AndImm => 41,
            Code6502_Opcode::RolA => 42,
            Code6502_Opcode::BitAbs => 44,
            Code6502_Opcode::AndAbs => 45,
            Code6502_Opcode::RolAbs => 46,
            Code6502_Opcode::BmiRel => 48,
            Code6502_Opcode::AndIndY => 49,
            Code6502_Opcode::AndZpgX => 53,
            Code6502_Opcode::RolZpgX => 54,
            Code6502_Opcode::SecImpl => 56,
            Code6502_Opcode::AndAbsY => 57,
            Code6502_Opcode::AndAbsX => 61,
            Code6502_Opcode::RolAbsX => 62,
            Code6502_Opcode::RtiImpl => 64,
            Code6502_Opcode::EorXInd => 65,
            Code6502_Opcode::EorZpg => 69,
            Code6502_Opcode::LsrZpg => 70,
            Code6502_Opcode::PhaImpl => 72,
            Code6502_Opcode::EorImm => 73,
            Code6502_Opcode::LsrA => 74,
            Code6502_Opcode::JmpAbs => 76,
            Code6502_Opcode::EorAbs => 77,
            Code6502_Opcode::LsrAbs => 78,
            Code6502_Opcode::BvcRel => 80,
            Code6502_Opcode::EorIndY => 81,
            Code6502_Opcode::EorZpgX => 85,
            Code6502_Opcode::LsrZpgX => 86,
            Code6502_Opcode::CliImpl => 88,
            Code6502_Opcode::EorAbsY => 89,
            Code6502_Opcode::EorAbsX => 93,
            Code6502_Opcode::LsrAbsX => 94,
            Code6502_Opcode::RtsImpl => 96,
            Code6502_Opcode::AdcXInd => 97,
            Code6502_Opcode::AdcZpg => 101,
            Code6502_Opcode::RorZpg => 102,
            Code6502_Opcode::PlaImpl => 104,
            Code6502_Opcode::AdcImm => 105,
            Code6502_Opcode::RorA => 106,
            Code6502_Opcode::JmpInd => 108,
            Code6502_Opcode::AdcAbs => 109,
            Code6502_Opcode::RorAbs => 110,
            Code6502_Opcode::BvsRel => 112,
            Code6502_Opcode::AdcIndY => 113,
            Code6502_Opcode::AdcZpgX => 117,
            Code6502_Opcode::RorZpgX => 118,
            Code6502_Opcode::SeiImpl => 120,
            Code6502_Opcode::AdcAbsY => 121,
            Code6502_Opcode::AdcAbsX => 125,
            Code6502_Opcode::RorAbsX => 126,
            Code6502_Opcode::StaXInd => 129,
            Code6502_Opcode::StyZpg => 132,
            Code6502_Opcode::StaZpg => 133,
            Code6502_Opcode::StxZpg => 134,
            Code6502_Opcode::DeyImpl => 136,
            Code6502_Opcode::TxaImpl => 138,
            Code6502_Opcode::StyAbs => 140,
            Code6502_Opcode::StaAbs => 141,
            Code6502_Opcode::StxAbs => 142,
            Code6502_Opcode::BccRel => 144,
            Code6502_Opcode::StaIndY => 145,
            Code6502_Opcode::StyZpgX => 148,
            Code6502_Opcode::StaZpgX => 149,
            Code6502_Opcode::StxZpgY => 150,
            Code6502_Opcode::TyaImpl => 152,
            Code6502_Opcode::StaAbsY => 153,
            Code6502_Opcode::TxsImpl => 154,
            Code6502_Opcode::StaAbsX => 157,
            Code6502_Opcode::LdyImm => 160,
            Code6502_Opcode::LdaXInd => 161,
            Code6502_Opcode::LdxImm => 162,
            Code6502_Opcode::LdyZpg => 164,
            Code6502_Opcode::LdaZpg => 165,
            Code6502_Opcode::LdxZpg => 166,
            Code6502_Opcode::TayImpl => 168,
            Code6502_Opcode::LdaImm => 169,
            Code6502_Opcode::TaxImpl => 170,
            Code6502_Opcode::LdyAbs => 172,
            Code6502_Opcode::LdaAbs => 173,
            Code6502_Opcode::LdxAbs => 174,
            Code6502_Opcode::BcsRel => 176,
            Code6502_Opcode::LdaIndY => 177,
            Code6502_Opcode::LdyZpgX => 180,
            Code6502_Opcode::LdaZpgX => 181,
            Code6502_Opcode::LdxZpgY => 182,
            Code6502_Opcode::ClvImpl => 184,
            Code6502_Opcode::LdaAbsY => 185,
            Code6502_Opcode::TsxImpl => 186,
            Code6502_Opcode::LdyAbsX => 188,
            Code6502_Opcode::LdaAbsX => 189,
            Code6502_Opcode::LdxAbsY => 190,
            Code6502_Opcode::CpyImm => 192,
            Code6502_Opcode::CmpXInd => 193,
            Code6502_Opcode::CpyZpg => 196,
            Code6502_Opcode::CmpZpg => 197,
            Code6502_Opcode::DecZpg => 198,
            Code6502_Opcode::InyImpl => 200,
            Code6502_Opcode::CmpImm => 201,
            Code6502_Opcode::DexImpl => 202,
            Code6502_Opcode::CpyAbs => 204,
            Code6502_Opcode::CmpAbs => 205,
            Code6502_Opcode::DecAbs => 206,
            Code6502_Opcode::BneRel => 208,
            Code6502_Opcode::CmpIndY => 209,
            Code6502_Opcode::CmpZpgX => 213,
            Code6502_Opcode::DecZpgX => 214,
            Code6502_Opcode::CldImpl => 216,
            Code6502_Opcode::CmpAbsY => 217,
            Code6502_Opcode::CmpAbsX => 221,
            Code6502_Opcode::DecAbsX => 222,
            Code6502_Opcode::CpxImm => 224,
            Code6502_Opcode::SbcXInd => 225,
            Code6502_Opcode::CpxZpg => 228,
            Code6502_Opcode::SbcZpg => 229,
            Code6502_Opcode::IncZpg => 230,
            Code6502_Opcode::InxImpl => 232,
            Code6502_Opcode::SbcImm => 233,
            Code6502_Opcode::NopImpl => 234,
            Code6502_Opcode::CpxAbs => 236,
            Code6502_Opcode::SbcAbs => 237,
            Code6502_Opcode::IncAbs => 238,
            Code6502_Opcode::BeqRel => 240,
            Code6502_Opcode::SbcIndY => 241,
            Code6502_Opcode::SbcZpgX => 245,
            Code6502_Opcode::IncZpgX => 246,
            Code6502_Opcode::SedImpl => 248,
            Code6502_Opcode::SbcAbsY => 249,
            Code6502_Opcode::SbcAbsX => 253,
            Code6502_Opcode::IncAbsX => 254,
            Code6502_Opcode::Unknown(v) => v
        }
    }
}

impl Default for Code6502_Opcode {
    fn default() -> Self { Code6502_Opcode::Unknown(0) }
}


#[derive(Default, Debug, Clone)]
pub struct Code6502_Operation {
    pub _root: SharedType<Code6502>,
    pub _parent: SharedType<Code6502>,
    pub _self: SharedType<Self>,
    code: RefCell<Code6502_Opcode>,
    args: RefCell<Option<Code6502_Operation_Args>>,
    _io: RefCell<BytesReader>,
}
#[derive(Debug, Clone)]
pub enum Code6502_Operation_Args {
    U2(u16),
    U1(u8),
    S1(i8),
}
impl From<u16> for Code6502_Operation_Args {
    fn from(v: u16) -> Self {
        Self::U2(v)
    }
}
impl From<&Code6502_Operation_Args> for u16 {
    fn from(e: &Code6502_Operation_Args) -> Self {
        if let Code6502_Operation_Args::U2(v) = e {
            return *v
        }
        panic!("trying to convert from enum Code6502_Operation_Args::U2 to u16, enum value {:?}", e)
    }
}
impl From<u8> for Code6502_Operation_Args {
    fn from(v: u8) -> Self {
        Self::U1(v)
    }
}
impl From<&Code6502_Operation_Args> for u8 {
    fn from(e: &Code6502_Operation_Args) -> Self {
        if let Code6502_Operation_Args::U1(v) = e {
            return *v
        }
        panic!("trying to convert from enum Code6502_Operation_Args::U1 to u8, enum value {:?}", e)
    }
}
impl From<i8> for Code6502_Operation_Args {
    fn from(v: i8) -> Self {
        Self::S1(v)
    }
}
impl From<&Code6502_Operation_Args> for i8 {
    fn from(e: &Code6502_Operation_Args) -> Self {
        if let Code6502_Operation_Args::S1(v) = e {
            return *v
        }
        panic!("trying to convert from enum Code6502_Operation_Args::S1 to i8, enum value {:?}", e)
    }
}
impl From<&Code6502_Operation_Args> for usize {
    fn from(e: &Code6502_Operation_Args) -> Self {
        match e {
            Code6502_Operation_Args::U2(v) => *v as usize,
            Code6502_Operation_Args::U1(v) => *v as usize,
            Code6502_Operation_Args::S1(v) => *v as usize,
        }
    }
}

impl KStruct for Code6502_Operation {
    type Root = Code6502;
    type Parent = Code6502;

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
        *self_rc.code.borrow_mut() = (_io.read_u1()? as i64).try_into()?;
        match *self_rc.code() {
            Code6502_Opcode::AdcAbs => {
                *self_rc.args.borrow_mut() = Some(_io.read_u2le()?.into());
            }
            Code6502_Opcode::AdcAbsX => {
                *self_rc.args.borrow_mut() = Some(_io.read_u2le()?.into());
            }
            Code6502_Opcode::AdcAbsY => {
                *self_rc.args.borrow_mut() = Some(_io.read_u2le()?.into());
            }
            Code6502_Opcode::AdcImm => {
                *self_rc.args.borrow_mut() = Some(_io.read_u1()?.into());
            }
            Code6502_Opcode::AdcIndY => {
                *self_rc.args.borrow_mut() = Some(_io.read_u1()?.into());
            }
            Code6502_Opcode::AdcXInd => {
                *self_rc.args.borrow_mut() = Some(_io.read_u1()?.into());
            }
            Code6502_Opcode::AdcZpg => {
                *self_rc.args.borrow_mut() = Some(_io.read_u1()?.into());
            }
            Code6502_Opcode::AdcZpgX => {
                *self_rc.args.borrow_mut() = Some(_io.read_u1()?.into());
            }
            Code6502_Opcode::AndAbs => {
                *self_rc.args.borrow_mut() = Some(_io.read_u2le()?.into());
            }
            Code6502_Opcode::AndAbsX => {
                *self_rc.args.borrow_mut() = Some(_io.read_u2le()?.into());
            }
            Code6502_Opcode::AndAbsY => {
                *self_rc.args.borrow_mut() = Some(_io.read_u2le()?.into());
            }
            Code6502_Opcode::AndImm => {
                *self_rc.args.borrow_mut() = Some(_io.read_u1()?.into());
            }
            Code6502_Opcode::AndIndY => {
                *self_rc.args.borrow_mut() = Some(_io.read_u1()?.into());
            }
            Code6502_Opcode::AndXInd => {
                *self_rc.args.borrow_mut() = Some(_io.read_u1()?.into());
            }
            Code6502_Opcode::AndZpg => {
                *self_rc.args.borrow_mut() = Some(_io.read_u1()?.into());
            }
            Code6502_Opcode::AndZpgX => {
                *self_rc.args.borrow_mut() = Some(_io.read_u1()?.into());
            }
            Code6502_Opcode::AslAbs => {
                *self_rc.args.borrow_mut() = Some(_io.read_u2le()?.into());
            }
            Code6502_Opcode::AslAbsX => {
                *self_rc.args.borrow_mut() = Some(_io.read_u2le()?.into());
            }
            Code6502_Opcode::AslZpg => {
                *self_rc.args.borrow_mut() = Some(_io.read_u1()?.into());
            }
            Code6502_Opcode::AslZpgX => {
                *self_rc.args.borrow_mut() = Some(_io.read_u1()?.into());
            }
            Code6502_Opcode::BccRel => {
                *self_rc.args.borrow_mut() = Some(_io.read_s1()?.into());
            }
            Code6502_Opcode::BcsRel => {
                *self_rc.args.borrow_mut() = Some(_io.read_s1()?.into());
            }
            Code6502_Opcode::BeqRel => {
                *self_rc.args.borrow_mut() = Some(_io.read_s1()?.into());
            }
            Code6502_Opcode::BitAbs => {
                *self_rc.args.borrow_mut() = Some(_io.read_u2le()?.into());
            }
            Code6502_Opcode::BitZpg => {
                *self_rc.args.borrow_mut() = Some(_io.read_u1()?.into());
            }
            Code6502_Opcode::BmiRel => {
                *self_rc.args.borrow_mut() = Some(_io.read_s1()?.into());
            }
            Code6502_Opcode::BneRel => {
                *self_rc.args.borrow_mut() = Some(_io.read_s1()?.into());
            }
            Code6502_Opcode::BplRel => {
                *self_rc.args.borrow_mut() = Some(_io.read_s1()?.into());
            }
            Code6502_Opcode::BvcRel => {
                *self_rc.args.borrow_mut() = Some(_io.read_s1()?.into());
            }
            Code6502_Opcode::BvsRel => {
                *self_rc.args.borrow_mut() = Some(_io.read_s1()?.into());
            }
            Code6502_Opcode::CmpAbs => {
                *self_rc.args.borrow_mut() = Some(_io.read_u2le()?.into());
            }
            Code6502_Opcode::CmpAbsX => {
                *self_rc.args.borrow_mut() = Some(_io.read_u2le()?.into());
            }
            Code6502_Opcode::CmpAbsY => {
                *self_rc.args.borrow_mut() = Some(_io.read_u2le()?.into());
            }
            Code6502_Opcode::CmpImm => {
                *self_rc.args.borrow_mut() = Some(_io.read_u1()?.into());
            }
            Code6502_Opcode::CmpIndY => {
                *self_rc.args.borrow_mut() = Some(_io.read_u1()?.into());
            }
            Code6502_Opcode::CmpXInd => {
                *self_rc.args.borrow_mut() = Some(_io.read_u1()?.into());
            }
            Code6502_Opcode::CmpZpg => {
                *self_rc.args.borrow_mut() = Some(_io.read_u1()?.into());
            }
            Code6502_Opcode::CmpZpgX => {
                *self_rc.args.borrow_mut() = Some(_io.read_u1()?.into());
            }
            Code6502_Opcode::CpxAbs => {
                *self_rc.args.borrow_mut() = Some(_io.read_u2le()?.into());
            }
            Code6502_Opcode::CpxImm => {
                *self_rc.args.borrow_mut() = Some(_io.read_u1()?.into());
            }
            Code6502_Opcode::CpxZpg => {
                *self_rc.args.borrow_mut() = Some(_io.read_u1()?.into());
            }
            Code6502_Opcode::CpyAbs => {
                *self_rc.args.borrow_mut() = Some(_io.read_u2le()?.into());
            }
            Code6502_Opcode::CpyImm => {
                *self_rc.args.borrow_mut() = Some(_io.read_u1()?.into());
            }
            Code6502_Opcode::CpyZpg => {
                *self_rc.args.borrow_mut() = Some(_io.read_u1()?.into());
            }
            Code6502_Opcode::DecAbs => {
                *self_rc.args.borrow_mut() = Some(_io.read_u2le()?.into());
            }
            Code6502_Opcode::DecAbsX => {
                *self_rc.args.borrow_mut() = Some(_io.read_u2le()?.into());
            }
            Code6502_Opcode::DecZpg => {
                *self_rc.args.borrow_mut() = Some(_io.read_u1()?.into());
            }
            Code6502_Opcode::DecZpgX => {
                *self_rc.args.borrow_mut() = Some(_io.read_u1()?.into());
            }
            Code6502_Opcode::EorAbs => {
                *self_rc.args.borrow_mut() = Some(_io.read_u2le()?.into());
            }
            Code6502_Opcode::EorAbsX => {
                *self_rc.args.borrow_mut() = Some(_io.read_u2le()?.into());
            }
            Code6502_Opcode::EorAbsY => {
                *self_rc.args.borrow_mut() = Some(_io.read_u2le()?.into());
            }
            Code6502_Opcode::EorImm => {
                *self_rc.args.borrow_mut() = Some(_io.read_u1()?.into());
            }
            Code6502_Opcode::EorIndY => {
                *self_rc.args.borrow_mut() = Some(_io.read_u1()?.into());
            }
            Code6502_Opcode::EorXInd => {
                *self_rc.args.borrow_mut() = Some(_io.read_u1()?.into());
            }
            Code6502_Opcode::EorZpg => {
                *self_rc.args.borrow_mut() = Some(_io.read_u1()?.into());
            }
            Code6502_Opcode::EorZpgX => {
                *self_rc.args.borrow_mut() = Some(_io.read_u1()?.into());
            }
            Code6502_Opcode::IncAbs => {
                *self_rc.args.borrow_mut() = Some(_io.read_u2le()?.into());
            }
            Code6502_Opcode::IncAbsX => {
                *self_rc.args.borrow_mut() = Some(_io.read_u2le()?.into());
            }
            Code6502_Opcode::IncZpg => {
                *self_rc.args.borrow_mut() = Some(_io.read_u1()?.into());
            }
            Code6502_Opcode::IncZpgX => {
                *self_rc.args.borrow_mut() = Some(_io.read_u1()?.into());
            }
            Code6502_Opcode::JmpAbs => {
                *self_rc.args.borrow_mut() = Some(_io.read_u2le()?.into());
            }
            Code6502_Opcode::JmpInd => {
                *self_rc.args.borrow_mut() = Some(_io.read_u2le()?.into());
            }
            Code6502_Opcode::JsrAbs => {
                *self_rc.args.borrow_mut() = Some(_io.read_u2le()?.into());
            }
            Code6502_Opcode::LdaAbs => {
                *self_rc.args.borrow_mut() = Some(_io.read_u2le()?.into());
            }
            Code6502_Opcode::LdaAbsX => {
                *self_rc.args.borrow_mut() = Some(_io.read_u2le()?.into());
            }
            Code6502_Opcode::LdaAbsY => {
                *self_rc.args.borrow_mut() = Some(_io.read_u2le()?.into());
            }
            Code6502_Opcode::LdaImm => {
                *self_rc.args.borrow_mut() = Some(_io.read_u1()?.into());
            }
            Code6502_Opcode::LdaIndY => {
                *self_rc.args.borrow_mut() = Some(_io.read_u1()?.into());
            }
            Code6502_Opcode::LdaXInd => {
                *self_rc.args.borrow_mut() = Some(_io.read_u1()?.into());
            }
            Code6502_Opcode::LdaZpg => {
                *self_rc.args.borrow_mut() = Some(_io.read_u1()?.into());
            }
            Code6502_Opcode::LdaZpgX => {
                *self_rc.args.borrow_mut() = Some(_io.read_u1()?.into());
            }
            Code6502_Opcode::LdxAbs => {
                *self_rc.args.borrow_mut() = Some(_io.read_u2le()?.into());
            }
            Code6502_Opcode::LdxAbsY => {
                *self_rc.args.borrow_mut() = Some(_io.read_u2le()?.into());
            }
            Code6502_Opcode::LdxImm => {
                *self_rc.args.borrow_mut() = Some(_io.read_u1()?.into());
            }
            Code6502_Opcode::LdxZpg => {
                *self_rc.args.borrow_mut() = Some(_io.read_u1()?.into());
            }
            Code6502_Opcode::LdxZpgY => {
                *self_rc.args.borrow_mut() = Some(_io.read_u1()?.into());
            }
            Code6502_Opcode::LdyAbs => {
                *self_rc.args.borrow_mut() = Some(_io.read_u2le()?.into());
            }
            Code6502_Opcode::LdyAbsX => {
                *self_rc.args.borrow_mut() = Some(_io.read_u2le()?.into());
            }
            Code6502_Opcode::LdyImm => {
                *self_rc.args.borrow_mut() = Some(_io.read_u1()?.into());
            }
            Code6502_Opcode::LdyZpg => {
                *self_rc.args.borrow_mut() = Some(_io.read_u1()?.into());
            }
            Code6502_Opcode::LdyZpgX => {
                *self_rc.args.borrow_mut() = Some(_io.read_u1()?.into());
            }
            Code6502_Opcode::LsrAbs => {
                *self_rc.args.borrow_mut() = Some(_io.read_u2le()?.into());
            }
            Code6502_Opcode::LsrAbsX => {
                *self_rc.args.borrow_mut() = Some(_io.read_u2le()?.into());
            }
            Code6502_Opcode::LsrZpg => {
                *self_rc.args.borrow_mut() = Some(_io.read_u1()?.into());
            }
            Code6502_Opcode::LsrZpgX => {
                *self_rc.args.borrow_mut() = Some(_io.read_u1()?.into());
            }
            Code6502_Opcode::OraAbs => {
                *self_rc.args.borrow_mut() = Some(_io.read_u2le()?.into());
            }
            Code6502_Opcode::OraAbsX => {
                *self_rc.args.borrow_mut() = Some(_io.read_u2le()?.into());
            }
            Code6502_Opcode::OraAbsY => {
                *self_rc.args.borrow_mut() = Some(_io.read_u2le()?.into());
            }
            Code6502_Opcode::OraImm => {
                *self_rc.args.borrow_mut() = Some(_io.read_u1()?.into());
            }
            Code6502_Opcode::OraIndY => {
                *self_rc.args.borrow_mut() = Some(_io.read_u1()?.into());
            }
            Code6502_Opcode::OraXInd => {
                *self_rc.args.borrow_mut() = Some(_io.read_u1()?.into());
            }
            Code6502_Opcode::OraZpg => {
                *self_rc.args.borrow_mut() = Some(_io.read_u1()?.into());
            }
            Code6502_Opcode::OraZpgX => {
                *self_rc.args.borrow_mut() = Some(_io.read_u1()?.into());
            }
            Code6502_Opcode::RolAbs => {
                *self_rc.args.borrow_mut() = Some(_io.read_u2le()?.into());
            }
            Code6502_Opcode::RolAbsX => {
                *self_rc.args.borrow_mut() = Some(_io.read_u2le()?.into());
            }
            Code6502_Opcode::RolZpg => {
                *self_rc.args.borrow_mut() = Some(_io.read_u1()?.into());
            }
            Code6502_Opcode::RolZpgX => {
                *self_rc.args.borrow_mut() = Some(_io.read_u1()?.into());
            }
            Code6502_Opcode::RorAbs => {
                *self_rc.args.borrow_mut() = Some(_io.read_u2le()?.into());
            }
            Code6502_Opcode::RorAbsX => {
                *self_rc.args.borrow_mut() = Some(_io.read_u2le()?.into());
            }
            Code6502_Opcode::RorZpg => {
                *self_rc.args.borrow_mut() = Some(_io.read_u1()?.into());
            }
            Code6502_Opcode::RorZpgX => {
                *self_rc.args.borrow_mut() = Some(_io.read_u1()?.into());
            }
            Code6502_Opcode::SbcAbs => {
                *self_rc.args.borrow_mut() = Some(_io.read_u2le()?.into());
            }
            Code6502_Opcode::SbcAbsX => {
                *self_rc.args.borrow_mut() = Some(_io.read_u2le()?.into());
            }
            Code6502_Opcode::SbcAbsY => {
                *self_rc.args.borrow_mut() = Some(_io.read_u2le()?.into());
            }
            Code6502_Opcode::SbcImm => {
                *self_rc.args.borrow_mut() = Some(_io.read_u1()?.into());
            }
            Code6502_Opcode::SbcIndY => {
                *self_rc.args.borrow_mut() = Some(_io.read_u1()?.into());
            }
            Code6502_Opcode::SbcXInd => {
                *self_rc.args.borrow_mut() = Some(_io.read_u1()?.into());
            }
            Code6502_Opcode::SbcZpg => {
                *self_rc.args.borrow_mut() = Some(_io.read_u1()?.into());
            }
            Code6502_Opcode::SbcZpgX => {
                *self_rc.args.borrow_mut() = Some(_io.read_u1()?.into());
            }
            Code6502_Opcode::StaAbs => {
                *self_rc.args.borrow_mut() = Some(_io.read_u2le()?.into());
            }
            Code6502_Opcode::StaAbsX => {
                *self_rc.args.borrow_mut() = Some(_io.read_u2le()?.into());
            }
            Code6502_Opcode::StaAbsY => {
                *self_rc.args.borrow_mut() = Some(_io.read_u2le()?.into());
            }
            Code6502_Opcode::StaIndY => {
                *self_rc.args.borrow_mut() = Some(_io.read_u1()?.into());
            }
            Code6502_Opcode::StaXInd => {
                *self_rc.args.borrow_mut() = Some(_io.read_u1()?.into());
            }
            Code6502_Opcode::StaZpg => {
                *self_rc.args.borrow_mut() = Some(_io.read_u1()?.into());
            }
            Code6502_Opcode::StaZpgX => {
                *self_rc.args.borrow_mut() = Some(_io.read_u1()?.into());
            }
            Code6502_Opcode::StxAbs => {
                *self_rc.args.borrow_mut() = Some(_io.read_u2le()?.into());
            }
            Code6502_Opcode::StxZpg => {
                *self_rc.args.borrow_mut() = Some(_io.read_u1()?.into());
            }
            Code6502_Opcode::StxZpgY => {
                *self_rc.args.borrow_mut() = Some(_io.read_u1()?.into());
            }
            Code6502_Opcode::StyAbs => {
                *self_rc.args.borrow_mut() = Some(_io.read_u2le()?.into());
            }
            Code6502_Opcode::StyZpg => {
                *self_rc.args.borrow_mut() = Some(_io.read_u1()?.into());
            }
            Code6502_Opcode::StyZpgX => {
                *self_rc.args.borrow_mut() = Some(_io.read_u1()?.into());
            }
            _ => {}
        }
        Ok(())
    }
}
impl Code6502_Operation {
}
impl Code6502_Operation {
    pub fn code(&self) -> Ref<'_, Code6502_Opcode> {
        self.code.borrow()
    }
}
impl Code6502_Operation {
    pub fn args(&self) -> usize {
        self.args.borrow().as_ref().unwrap().into()
    }
    pub fn args_enum(&self) -> Ref<'_, Option<Code6502_Operation_Args>> {
        self.args.borrow()
    }
}
impl Code6502_Operation {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
