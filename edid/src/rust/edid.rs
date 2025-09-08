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

#[derive(Default, Debug, Clone)]
pub struct Edid {
    pub _root: SharedType<Edid>,
    pub _parent: SharedType<Edid>,
    pub _self: SharedType<Self>,
    magic: RefCell<Vec<u8>>,
    mfg_bytes: RefCell<u16>,
    product_code: RefCell<u16>,
    serial: RefCell<u32>,
    mfg_week: RefCell<u8>,
    mfg_year_mod: RefCell<u8>,
    edid_version_major: RefCell<u8>,
    edid_version_minor: RefCell<u8>,
    input_flags: RefCell<u8>,
    screen_size_h: RefCell<u8>,
    screen_size_v: RefCell<u8>,
    gamma_mod: RefCell<u8>,
    features_flags: RefCell<u8>,
    chromacity: RefCell<OptRc<Edid_ChromacityInfo>>,
    est_timings: RefCell<OptRc<Edid_EstTimingsInfo>>,
    std_timings: RefCell<Vec<OptRc<Edid_StdTiming>>>,
    _io: RefCell<BytesReader>,
    std_timings_raw: RefCell<Vec<Vec<u8>>>,
    f_gamma: Cell<bool>,
    gamma: RefCell<f64>,
    f_mfg_id_ch1: Cell<bool>,
    mfg_id_ch1: RefCell<i32>,
    f_mfg_id_ch2: Cell<bool>,
    mfg_id_ch2: RefCell<i32>,
    f_mfg_id_ch3: Cell<bool>,
    mfg_id_ch3: RefCell<i32>,
    f_mfg_str: Cell<bool>,
    mfg_str: RefCell<String>,
    f_mfg_year: Cell<bool>,
    mfg_year: RefCell<i32>,
}
impl KStruct for Edid {
    type Root = Edid;
    type Parent = Edid;

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
        *self_rc.magic.borrow_mut() = _io.read_bytes(8 as usize)?.into();
        if !(*self_rc.magic() == vec![0x0u8, 0xffu8, 0xffu8, 0xffu8, 0xffu8, 0xffu8, 0xffu8, 0x0u8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/seq/0".to_string() }));
        }
        *self_rc.mfg_bytes.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.product_code.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.serial.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.mfg_week.borrow_mut() = _io.read_u1()?.into();
        *self_rc.mfg_year_mod.borrow_mut() = _io.read_u1()?.into();
        *self_rc.edid_version_major.borrow_mut() = _io.read_u1()?.into();
        *self_rc.edid_version_minor.borrow_mut() = _io.read_u1()?.into();
        *self_rc.input_flags.borrow_mut() = _io.read_u1()?.into();
        *self_rc.screen_size_h.borrow_mut() = _io.read_u1()?.into();
        *self_rc.screen_size_v.borrow_mut() = _io.read_u1()?.into();
        *self_rc.gamma_mod.borrow_mut() = _io.read_u1()?.into();
        *self_rc.features_flags.borrow_mut() = _io.read_u1()?.into();
        let t = Self::read_into::<_, Edid_ChromacityInfo>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.chromacity.borrow_mut() = t;
        let t = Self::read_into::<_, Edid_EstTimingsInfo>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.est_timings.borrow_mut() = t;
        *self_rc.std_timings_raw.borrow_mut() = Vec::new();
        *self_rc.std_timings.borrow_mut() = Vec::new();
        let l_std_timings = 8;
        for _i in 0..l_std_timings {
            self_rc.std_timings_raw.borrow_mut().push(_io.read_bytes(2 as usize)?.into());
            let std_timings_raw = self_rc.std_timings_raw.borrow();
            let io_std_timings_raw = BytesReader::from(std_timings_raw.last().unwrap().clone());
            let t = Self::read_into::<BytesReader, Edid_StdTiming>(&io_std_timings_raw, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
            self_rc.std_timings.borrow_mut().push(t);
        }
        Ok(())
    }
}
impl Edid {
    pub fn gamma(
        &self
    ) -> KResult<Ref<'_, f64>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_gamma.get() {
            return Ok(self.gamma.borrow());
        }
        self.f_gamma.set(true);
        if *self.gamma_mod() != 255 {
            *self.gamma.borrow_mut() = (((((*self.gamma_mod() as u8) + (100 as u8)) as f64) / (100.0 as f64))) as f64;
        }
        Ok(self.gamma.borrow())
    }
    pub fn mfg_id_ch1(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_mfg_id_ch1.get() {
            return Ok(self.mfg_id_ch1.borrow());
        }
        self.f_mfg_id_ch1.set(true);
        *self.mfg_id_ch1.borrow_mut() = ((((((*self.mfg_bytes() as i32) & (31744 as i32)) as u64) >> 10) as i32)) as i32;
        Ok(self.mfg_id_ch1.borrow())
    }
    pub fn mfg_id_ch2(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_mfg_id_ch2.get() {
            return Ok(self.mfg_id_ch2.borrow());
        }
        self.f_mfg_id_ch2.set(true);
        *self.mfg_id_ch2.borrow_mut() = ((((((*self.mfg_bytes() as i32) & (992 as i32)) as u64) >> 5) as i32)) as i32;
        Ok(self.mfg_id_ch2.borrow())
    }
    pub fn mfg_id_ch3(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_mfg_id_ch3.get() {
            return Ok(self.mfg_id_ch3.borrow());
        }
        self.f_mfg_id_ch3.set(true);
        *self.mfg_id_ch3.borrow_mut() = (((*self.mfg_bytes() as u16) & (31 as u16))) as i32;
        Ok(self.mfg_id_ch3.borrow())
    }
    pub fn mfg_str(
        &self
    ) -> KResult<Ref<'_, String>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_mfg_str.get() {
            return Ok(self.mfg_str.borrow());
        }
        self.f_mfg_str.set(true);
        *self.mfg_str.borrow_mut() = bytes_to_str(&vec![((*self.mfg_id_ch1()? as i32) + (64 as i32)), ((*self.mfg_id_ch2()? as i32) + (64 as i32)), ((*self.mfg_id_ch3()? as i32) + (64 as i32))], "ASCII")?.to_string();
        Ok(self.mfg_str.borrow())
    }
    pub fn mfg_year(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_mfg_year.get() {
            return Ok(self.mfg_year.borrow());
        }
        self.f_mfg_year.set(true);
        *self.mfg_year.borrow_mut() = (((*self.mfg_year_mod() as i32) + (1990 as i32))) as i32;
        Ok(self.mfg_year.borrow())
    }
}
impl Edid {
    pub fn magic(&self) -> Ref<'_, Vec<u8>> {
        self.magic.borrow()
    }
}
impl Edid {
    pub fn mfg_bytes(&self) -> Ref<'_, u16> {
        self.mfg_bytes.borrow()
    }
}

/**
 * Manufacturer product code
 */
impl Edid {
    pub fn product_code(&self) -> Ref<'_, u16> {
        self.product_code.borrow()
    }
}

/**
 * Serial number
 */
impl Edid {
    pub fn serial(&self) -> Ref<'_, u32> {
        self.serial.borrow()
    }
}

/**
 * Week of manufacture. Week numbering is not consistent between manufacturers.
 */
impl Edid {
    pub fn mfg_week(&self) -> Ref<'_, u8> {
        self.mfg_week.borrow()
    }
}

/**
 * Year of manufacture, less 1990. (1990-2245). If week=255, it is the model year instead.
 */
impl Edid {
    pub fn mfg_year_mod(&self) -> Ref<'_, u8> {
        self.mfg_year_mod.borrow()
    }
}

/**
 * EDID version, usually 1 (for 1.3)
 */
impl Edid {
    pub fn edid_version_major(&self) -> Ref<'_, u8> {
        self.edid_version_major.borrow()
    }
}

/**
 * EDID revision, usually 3 (for 1.3)
 */
impl Edid {
    pub fn edid_version_minor(&self) -> Ref<'_, u8> {
        self.edid_version_minor.borrow()
    }
}
impl Edid {
    pub fn input_flags(&self) -> Ref<'_, u8> {
        self.input_flags.borrow()
    }
}

/**
 * Maximum horizontal image size, in centimetres (max 292 cm/115 in at 16:9 aspect ratio)
 */
impl Edid {
    pub fn screen_size_h(&self) -> Ref<'_, u8> {
        self.screen_size_h.borrow()
    }
}

/**
 * Maximum vertical image size, in centimetres. If either byte is 0, undefined (e.g. projector)
 */
impl Edid {
    pub fn screen_size_v(&self) -> Ref<'_, u8> {
        self.screen_size_v.borrow()
    }
}

/**
 * Display gamma, datavalue = (gamma*100)-100 (range 1.00-3.54)
 */
impl Edid {
    pub fn gamma_mod(&self) -> Ref<'_, u8> {
        self.gamma_mod.borrow()
    }
}
impl Edid {
    pub fn features_flags(&self) -> Ref<'_, u8> {
        self.features_flags.borrow()
    }
}

/**
 * Phosphor or filter chromaticity structure, which provides info on colorimetry and white point
 * \sa Standard, section 3.7
 */
impl Edid {
    pub fn chromacity(&self) -> Ref<'_, OptRc<Edid_ChromacityInfo>> {
        self.chromacity.borrow()
    }
}

/**
 * Block of bit flags that indicates support of so called
 * "established timings", which is a commonly used subset of VESA
 * DMT (Discrete Monitor Timings) modes.
 * \sa Standard, section 3.8
 */
impl Edid {
    pub fn est_timings(&self) -> Ref<'_, OptRc<Edid_EstTimingsInfo>> {
        self.est_timings.borrow()
    }
}

/**
 * Array of descriptions of so called "standard timings", which are
 * used to specify up to 8 additional timings not included in
 * "established timings".
 */
impl Edid {
    pub fn std_timings(&self) -> Ref<'_, Vec<OptRc<Edid_StdTiming>>> {
        self.std_timings.borrow()
    }
}
impl Edid {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
impl Edid {
    pub fn std_timings_raw(&self) -> Ref<'_, Vec<Vec<u8>>> {
        self.std_timings_raw.borrow()
    }
}

/**
 * Chromaticity information: colorimetry and white point
 * coordinates. All coordinates are stored as fixed precision
 * 10-bit numbers, bits are shuffled for compactness.
 */

#[derive(Default, Debug, Clone)]
pub struct Edid_ChromacityInfo {
    pub _root: SharedType<Edid>,
    pub _parent: SharedType<Edid>,
    pub _self: SharedType<Self>,
    red_x_1_0: RefCell<u64>,
    red_y_1_0: RefCell<u64>,
    green_x_1_0: RefCell<u64>,
    green_y_1_0: RefCell<u64>,
    blue_x_1_0: RefCell<u64>,
    blue_y_1_0: RefCell<u64>,
    white_x_1_0: RefCell<u64>,
    white_y_1_0: RefCell<u64>,
    red_x_9_2: RefCell<u8>,
    red_y_9_2: RefCell<u8>,
    green_x_9_2: RefCell<u8>,
    green_y_9_2: RefCell<u8>,
    blue_x_9_2: RefCell<u8>,
    blue_y_9_2: RefCell<u8>,
    white_x_9_2: RefCell<u8>,
    white_y_9_2: RefCell<u8>,
    _io: RefCell<BytesReader>,
    f_blue_x: Cell<bool>,
    blue_x: RefCell<f64>,
    f_blue_x_int: Cell<bool>,
    blue_x_int: RefCell<i32>,
    f_blue_y: Cell<bool>,
    blue_y: RefCell<f64>,
    f_blue_y_int: Cell<bool>,
    blue_y_int: RefCell<i32>,
    f_green_x: Cell<bool>,
    green_x: RefCell<f64>,
    f_green_x_int: Cell<bool>,
    green_x_int: RefCell<i32>,
    f_green_y: Cell<bool>,
    green_y: RefCell<f64>,
    f_green_y_int: Cell<bool>,
    green_y_int: RefCell<i32>,
    f_red_x: Cell<bool>,
    red_x: RefCell<f64>,
    f_red_x_int: Cell<bool>,
    red_x_int: RefCell<i32>,
    f_red_y: Cell<bool>,
    red_y: RefCell<f64>,
    f_red_y_int: Cell<bool>,
    red_y_int: RefCell<i32>,
    f_white_x: Cell<bool>,
    white_x: RefCell<f64>,
    f_white_x_int: Cell<bool>,
    white_x_int: RefCell<i32>,
    f_white_y: Cell<bool>,
    white_y: RefCell<f64>,
    f_white_y_int: Cell<bool>,
    white_y_int: RefCell<i32>,
}
impl KStruct for Edid_ChromacityInfo {
    type Root = Edid;
    type Parent = Edid;

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
        *self_rc.red_x_1_0.borrow_mut() = _io.read_bits_int_be(2)?;
        *self_rc.red_y_1_0.borrow_mut() = _io.read_bits_int_be(2)?;
        *self_rc.green_x_1_0.borrow_mut() = _io.read_bits_int_be(2)?;
        *self_rc.green_y_1_0.borrow_mut() = _io.read_bits_int_be(2)?;
        *self_rc.blue_x_1_0.borrow_mut() = _io.read_bits_int_be(2)?;
        *self_rc.blue_y_1_0.borrow_mut() = _io.read_bits_int_be(2)?;
        *self_rc.white_x_1_0.borrow_mut() = _io.read_bits_int_be(2)?;
        *self_rc.white_y_1_0.borrow_mut() = _io.read_bits_int_be(2)?;
        _io.align_to_byte()?;
        *self_rc.red_x_9_2.borrow_mut() = _io.read_u1()?.into();
        *self_rc.red_y_9_2.borrow_mut() = _io.read_u1()?.into();
        *self_rc.green_x_9_2.borrow_mut() = _io.read_u1()?.into();
        *self_rc.green_y_9_2.borrow_mut() = _io.read_u1()?.into();
        *self_rc.blue_x_9_2.borrow_mut() = _io.read_u1()?.into();
        *self_rc.blue_y_9_2.borrow_mut() = _io.read_u1()?.into();
        *self_rc.white_x_9_2.borrow_mut() = _io.read_u1()?.into();
        *self_rc.white_y_9_2.borrow_mut() = _io.read_u1()?.into();
        Ok(())
    }
}
impl Edid_ChromacityInfo {

    /**
     * Blue X coordinate
     */
    pub fn blue_x(
        &self
    ) -> KResult<Ref<'_, f64>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_blue_x.get() {
            return Ok(self.blue_x.borrow());
        }
        self.f_blue_x.set(true);
        *self.blue_x.borrow_mut() = (((*self.blue_x_int()? as f64) / (1024.0 as f64))) as f64;
        Ok(self.blue_x.borrow())
    }
    pub fn blue_x_int(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_blue_x_int.get() {
            return Ok(self.blue_x_int.borrow());
        }
        self.f_blue_x_int.set(true);
        *self.blue_x_int.borrow_mut() = (((((*self.blue_x_9_2() as u8) << (2 as u8)) as i32) | (*self.blue_x_1_0() as i32))) as i32;
        Ok(self.blue_x_int.borrow())
    }

    /**
     * Blue Y coordinate
     */
    pub fn blue_y(
        &self
    ) -> KResult<Ref<'_, f64>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_blue_y.get() {
            return Ok(self.blue_y.borrow());
        }
        self.f_blue_y.set(true);
        *self.blue_y.borrow_mut() = (((*self.blue_y_int()? as f64) / (1024.0 as f64))) as f64;
        Ok(self.blue_y.borrow())
    }
    pub fn blue_y_int(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_blue_y_int.get() {
            return Ok(self.blue_y_int.borrow());
        }
        self.f_blue_y_int.set(true);
        *self.blue_y_int.borrow_mut() = (((((*self.blue_y_9_2() as u8) << (2 as u8)) as i32) | (*self.blue_y_1_0() as i32))) as i32;
        Ok(self.blue_y_int.borrow())
    }

    /**
     * Green X coordinate
     */
    pub fn green_x(
        &self
    ) -> KResult<Ref<'_, f64>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_green_x.get() {
            return Ok(self.green_x.borrow());
        }
        self.f_green_x.set(true);
        *self.green_x.borrow_mut() = (((*self.green_x_int()? as f64) / (1024.0 as f64))) as f64;
        Ok(self.green_x.borrow())
    }
    pub fn green_x_int(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_green_x_int.get() {
            return Ok(self.green_x_int.borrow());
        }
        self.f_green_x_int.set(true);
        *self.green_x_int.borrow_mut() = (((((*self.green_x_9_2() as u8) << (2 as u8)) as i32) | (*self.green_x_1_0() as i32))) as i32;
        Ok(self.green_x_int.borrow())
    }

    /**
     * Green Y coordinate
     */
    pub fn green_y(
        &self
    ) -> KResult<Ref<'_, f64>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_green_y.get() {
            return Ok(self.green_y.borrow());
        }
        self.f_green_y.set(true);
        *self.green_y.borrow_mut() = (((*self.green_y_int()? as f64) / (1024.0 as f64))) as f64;
        Ok(self.green_y.borrow())
    }
    pub fn green_y_int(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_green_y_int.get() {
            return Ok(self.green_y_int.borrow());
        }
        self.f_green_y_int.set(true);
        *self.green_y_int.borrow_mut() = (((((*self.green_y_9_2() as u8) << (2 as u8)) as i32) | (*self.green_y_1_0() as i32))) as i32;
        Ok(self.green_y_int.borrow())
    }

    /**
     * Red X coordinate
     */
    pub fn red_x(
        &self
    ) -> KResult<Ref<'_, f64>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_red_x.get() {
            return Ok(self.red_x.borrow());
        }
        self.f_red_x.set(true);
        *self.red_x.borrow_mut() = (((*self.red_x_int()? as f64) / (1024.0 as f64))) as f64;
        Ok(self.red_x.borrow())
    }
    pub fn red_x_int(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_red_x_int.get() {
            return Ok(self.red_x_int.borrow());
        }
        self.f_red_x_int.set(true);
        *self.red_x_int.borrow_mut() = (((((*self.red_x_9_2() as u8) << (2 as u8)) as i32) | (*self.red_x_1_0() as i32))) as i32;
        Ok(self.red_x_int.borrow())
    }

    /**
     * Red Y coordinate
     */
    pub fn red_y(
        &self
    ) -> KResult<Ref<'_, f64>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_red_y.get() {
            return Ok(self.red_y.borrow());
        }
        self.f_red_y.set(true);
        *self.red_y.borrow_mut() = (((*self.red_y_int()? as f64) / (1024.0 as f64))) as f64;
        Ok(self.red_y.borrow())
    }
    pub fn red_y_int(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_red_y_int.get() {
            return Ok(self.red_y_int.borrow());
        }
        self.f_red_y_int.set(true);
        *self.red_y_int.borrow_mut() = (((((*self.red_y_9_2() as u8) << (2 as u8)) as i32) | (*self.red_y_1_0() as i32))) as i32;
        Ok(self.red_y_int.borrow())
    }

    /**
     * White X coordinate
     */
    pub fn white_x(
        &self
    ) -> KResult<Ref<'_, f64>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_white_x.get() {
            return Ok(self.white_x.borrow());
        }
        self.f_white_x.set(true);
        *self.white_x.borrow_mut() = (((*self.white_x_int()? as f64) / (1024.0 as f64))) as f64;
        Ok(self.white_x.borrow())
    }
    pub fn white_x_int(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_white_x_int.get() {
            return Ok(self.white_x_int.borrow());
        }
        self.f_white_x_int.set(true);
        *self.white_x_int.borrow_mut() = (((((*self.white_x_9_2() as u8) << (2 as u8)) as i32) | (*self.white_x_1_0() as i32))) as i32;
        Ok(self.white_x_int.borrow())
    }

    /**
     * White Y coordinate
     */
    pub fn white_y(
        &self
    ) -> KResult<Ref<'_, f64>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_white_y.get() {
            return Ok(self.white_y.borrow());
        }
        self.f_white_y.set(true);
        *self.white_y.borrow_mut() = (((*self.white_y_int()? as f64) / (1024.0 as f64))) as f64;
        Ok(self.white_y.borrow())
    }
    pub fn white_y_int(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_white_y_int.get() {
            return Ok(self.white_y_int.borrow());
        }
        self.f_white_y_int.set(true);
        *self.white_y_int.borrow_mut() = (((((*self.white_y_9_2() as u8) << (2 as u8)) as i32) | (*self.white_y_1_0() as i32))) as i32;
        Ok(self.white_y_int.borrow())
    }
}

/**
 * Red X, bits 1..0
 */
impl Edid_ChromacityInfo {
    pub fn red_x_1_0(&self) -> Ref<'_, u64> {
        self.red_x_1_0.borrow()
    }
}

/**
 * Red Y, bits 1..0
 */
impl Edid_ChromacityInfo {
    pub fn red_y_1_0(&self) -> Ref<'_, u64> {
        self.red_y_1_0.borrow()
    }
}

/**
 * Green X, bits 1..0
 */
impl Edid_ChromacityInfo {
    pub fn green_x_1_0(&self) -> Ref<'_, u64> {
        self.green_x_1_0.borrow()
    }
}

/**
 * Green Y, bits 1..0
 */
impl Edid_ChromacityInfo {
    pub fn green_y_1_0(&self) -> Ref<'_, u64> {
        self.green_y_1_0.borrow()
    }
}

/**
 * Blue X, bits 1..0
 */
impl Edid_ChromacityInfo {
    pub fn blue_x_1_0(&self) -> Ref<'_, u64> {
        self.blue_x_1_0.borrow()
    }
}

/**
 * Blue Y, bits 1..0
 */
impl Edid_ChromacityInfo {
    pub fn blue_y_1_0(&self) -> Ref<'_, u64> {
        self.blue_y_1_0.borrow()
    }
}

/**
 * White X, bits 1..0
 */
impl Edid_ChromacityInfo {
    pub fn white_x_1_0(&self) -> Ref<'_, u64> {
        self.white_x_1_0.borrow()
    }
}

/**
 * White Y, bits 1..0
 */
impl Edid_ChromacityInfo {
    pub fn white_y_1_0(&self) -> Ref<'_, u64> {
        self.white_y_1_0.borrow()
    }
}

/**
 * Red X, bits 9..2
 */
impl Edid_ChromacityInfo {
    pub fn red_x_9_2(&self) -> Ref<'_, u8> {
        self.red_x_9_2.borrow()
    }
}

/**
 * Red Y, bits 9..2
 */
impl Edid_ChromacityInfo {
    pub fn red_y_9_2(&self) -> Ref<'_, u8> {
        self.red_y_9_2.borrow()
    }
}

/**
 * Green X, bits 9..2
 */
impl Edid_ChromacityInfo {
    pub fn green_x_9_2(&self) -> Ref<'_, u8> {
        self.green_x_9_2.borrow()
    }
}

/**
 * Green Y, bits 9..2
 */
impl Edid_ChromacityInfo {
    pub fn green_y_9_2(&self) -> Ref<'_, u8> {
        self.green_y_9_2.borrow()
    }
}

/**
 * Blue X, bits 9..2
 */
impl Edid_ChromacityInfo {
    pub fn blue_x_9_2(&self) -> Ref<'_, u8> {
        self.blue_x_9_2.borrow()
    }
}

/**
 * Blue Y, bits 9..2
 */
impl Edid_ChromacityInfo {
    pub fn blue_y_9_2(&self) -> Ref<'_, u8> {
        self.blue_y_9_2.borrow()
    }
}

/**
 * White X, bits 9..2
 */
impl Edid_ChromacityInfo {
    pub fn white_x_9_2(&self) -> Ref<'_, u8> {
        self.white_x_9_2.borrow()
    }
}

/**
 * White Y, bits 9..2
 */
impl Edid_ChromacityInfo {
    pub fn white_y_9_2(&self) -> Ref<'_, u8> {
        self.white_y_9_2.borrow()
    }
}
impl Edid_ChromacityInfo {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Edid_EstTimingsInfo {
    pub _root: SharedType<Edid>,
    pub _parent: SharedType<Edid>,
    pub _self: SharedType<Self>,
    can_720x400px_70hz: RefCell<bool>,
    can_720x400px_88hz: RefCell<bool>,
    can_640x480px_60hz: RefCell<bool>,
    can_640x480px_67hz: RefCell<bool>,
    can_640x480px_72hz: RefCell<bool>,
    can_640x480px_75hz: RefCell<bool>,
    can_800x600px_56hz: RefCell<bool>,
    can_800x600px_60hz: RefCell<bool>,
    can_800x600px_72hz: RefCell<bool>,
    can_800x600px_75hz: RefCell<bool>,
    can_832x624px_75hz: RefCell<bool>,
    can_1024x768px_87hz_i: RefCell<bool>,
    can_1024x768px_60hz: RefCell<bool>,
    can_1024x768px_70hz: RefCell<bool>,
    can_1024x768px_75hz: RefCell<bool>,
    can_1280x1024px_75hz: RefCell<bool>,
    can_1152x870px_75hz: RefCell<bool>,
    reserved: RefCell<u64>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Edid_EstTimingsInfo {
    type Root = Edid;
    type Parent = Edid;

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
        *self_rc.can_720x400px_70hz.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.can_720x400px_88hz.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.can_640x480px_60hz.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.can_640x480px_67hz.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.can_640x480px_72hz.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.can_640x480px_75hz.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.can_800x600px_56hz.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.can_800x600px_60hz.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.can_800x600px_72hz.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.can_800x600px_75hz.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.can_832x624px_75hz.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.can_1024x768px_87hz_i.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.can_1024x768px_60hz.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.can_1024x768px_70hz.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.can_1024x768px_75hz.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.can_1280x1024px_75hz.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.can_1152x870px_75hz.borrow_mut() = _io.read_bits_int_be(1)? != 0;
        *self_rc.reserved.borrow_mut() = _io.read_bits_int_be(7)?;
        Ok(())
    }
}
impl Edid_EstTimingsInfo {
}

/**
 * Supports 720 x 400 @ 70Hz
 */
impl Edid_EstTimingsInfo {
    pub fn can_720x400px_70hz(&self) -> Ref<'_, bool> {
        self.can_720x400px_70hz.borrow()
    }
}

/**
 * Supports 720 x 400 @ 88Hz
 */
impl Edid_EstTimingsInfo {
    pub fn can_720x400px_88hz(&self) -> Ref<'_, bool> {
        self.can_720x400px_88hz.borrow()
    }
}

/**
 * Supports 640 x 480 @ 60Hz
 */
impl Edid_EstTimingsInfo {
    pub fn can_640x480px_60hz(&self) -> Ref<'_, bool> {
        self.can_640x480px_60hz.borrow()
    }
}

/**
 * Supports 640 x 480 @ 67Hz
 */
impl Edid_EstTimingsInfo {
    pub fn can_640x480px_67hz(&self) -> Ref<'_, bool> {
        self.can_640x480px_67hz.borrow()
    }
}

/**
 * Supports 640 x 480 @ 72Hz
 */
impl Edid_EstTimingsInfo {
    pub fn can_640x480px_72hz(&self) -> Ref<'_, bool> {
        self.can_640x480px_72hz.borrow()
    }
}

/**
 * Supports 640 x 480 @ 75Hz
 */
impl Edid_EstTimingsInfo {
    pub fn can_640x480px_75hz(&self) -> Ref<'_, bool> {
        self.can_640x480px_75hz.borrow()
    }
}

/**
 * Supports 800 x 600 @ 56Hz
 */
impl Edid_EstTimingsInfo {
    pub fn can_800x600px_56hz(&self) -> Ref<'_, bool> {
        self.can_800x600px_56hz.borrow()
    }
}

/**
 * Supports 800 x 600 @ 60Hz
 */
impl Edid_EstTimingsInfo {
    pub fn can_800x600px_60hz(&self) -> Ref<'_, bool> {
        self.can_800x600px_60hz.borrow()
    }
}

/**
 * Supports 800 x 600 @ 72Hz
 */
impl Edid_EstTimingsInfo {
    pub fn can_800x600px_72hz(&self) -> Ref<'_, bool> {
        self.can_800x600px_72hz.borrow()
    }
}

/**
 * Supports 800 x 600 @ 75Hz
 */
impl Edid_EstTimingsInfo {
    pub fn can_800x600px_75hz(&self) -> Ref<'_, bool> {
        self.can_800x600px_75hz.borrow()
    }
}

/**
 * Supports 832 x 624 @ 75Hz
 */
impl Edid_EstTimingsInfo {
    pub fn can_832x624px_75hz(&self) -> Ref<'_, bool> {
        self.can_832x624px_75hz.borrow()
    }
}

/**
 * Supports 1024 x 768 @ 87Hz(I)
 */
impl Edid_EstTimingsInfo {
    pub fn can_1024x768px_87hz_i(&self) -> Ref<'_, bool> {
        self.can_1024x768px_87hz_i.borrow()
    }
}

/**
 * Supports 1024 x 768 @ 60Hz
 */
impl Edid_EstTimingsInfo {
    pub fn can_1024x768px_60hz(&self) -> Ref<'_, bool> {
        self.can_1024x768px_60hz.borrow()
    }
}

/**
 * Supports 1024 x 768 @ 70Hz
 */
impl Edid_EstTimingsInfo {
    pub fn can_1024x768px_70hz(&self) -> Ref<'_, bool> {
        self.can_1024x768px_70hz.borrow()
    }
}

/**
 * Supports 1024 x 768 @ 75Hz
 */
impl Edid_EstTimingsInfo {
    pub fn can_1024x768px_75hz(&self) -> Ref<'_, bool> {
        self.can_1024x768px_75hz.borrow()
    }
}

/**
 * Supports 1280 x 1024 @ 75Hz
 */
impl Edid_EstTimingsInfo {
    pub fn can_1280x1024px_75hz(&self) -> Ref<'_, bool> {
        self.can_1280x1024px_75hz.borrow()
    }
}

/**
 * Supports 1152 x 870 @ 75Hz
 */
impl Edid_EstTimingsInfo {
    pub fn can_1152x870px_75hz(&self) -> Ref<'_, bool> {
        self.can_1152x870px_75hz.borrow()
    }
}
impl Edid_EstTimingsInfo {
    pub fn reserved(&self) -> Ref<'_, u64> {
        self.reserved.borrow()
    }
}
impl Edid_EstTimingsInfo {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Edid_StdTiming {
    pub _root: SharedType<Edid>,
    pub _parent: SharedType<Edid>,
    pub _self: SharedType<Self>,
    horiz_active_pixels_mod: RefCell<u8>,
    aspect_ratio: RefCell<Edid_StdTiming_AspectRatios>,
    refresh_rate_mod: RefCell<u64>,
    _io: RefCell<BytesReader>,
    f_bytes_lookahead: Cell<bool>,
    bytes_lookahead: RefCell<Vec<u8>>,
    f_horiz_active_pixels: Cell<bool>,
    horiz_active_pixels: RefCell<i32>,
    f_is_used: Cell<bool>,
    is_used: RefCell<bool>,
    f_refresh_rate: Cell<bool>,
    refresh_rate: RefCell<i32>,
}
impl KStruct for Edid_StdTiming {
    type Root = Edid;
    type Parent = Edid;

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
        *self_rc.horiz_active_pixels_mod.borrow_mut() = _io.read_u1()?.into();
        *self_rc.aspect_ratio.borrow_mut() = (_io.read_bits_int_be(2)? as i64).try_into()?;
        *self_rc.refresh_rate_mod.borrow_mut() = _io.read_bits_int_be(6)?;
        Ok(())
    }
}
impl Edid_StdTiming {
    pub fn bytes_lookahead(
        &self
    ) -> KResult<Ref<'_, Vec<u8>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_bytes_lookahead.get() {
            return Ok(self.bytes_lookahead.borrow());
        }
        self.f_bytes_lookahead.set(true);
        let _pos = _io.pos();
        _io.seek(0 as usize)?;
        *self.bytes_lookahead.borrow_mut() = _io.read_bytes(2 as usize)?.into();
        _io.seek(_pos)?;
        Ok(self.bytes_lookahead.borrow())
    }

    /**
     * Range of horizontal active pixels.
     */
    pub fn horiz_active_pixels(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_horiz_active_pixels.get() {
            return Ok(self.horiz_active_pixels.borrow());
        }
        self.f_horiz_active_pixels.set(true);
        if *self.is_used()? {
            *self.horiz_active_pixels.borrow_mut() = (((((*self.horiz_active_pixels_mod() as u8) + (31 as u8)) as i32) * (8 as i32))) as i32;
        }
        Ok(self.horiz_active_pixels.borrow())
    }
    pub fn is_used(
        &self
    ) -> KResult<Ref<'_, bool>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_is_used.get() {
            return Ok(self.is_used.borrow());
        }
        self.f_is_used.set(true);
        *self.is_used.borrow_mut() = (*self.bytes_lookahead()? != vec![0x1u8, 0x1u8]) as bool;
        Ok(self.is_used.borrow())
    }

    /**
     * Vertical refresh rate, Hz.
     */
    pub fn refresh_rate(
        &self
    ) -> KResult<Ref<'_, i32>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_refresh_rate.get() {
            return Ok(self.refresh_rate.borrow());
        }
        self.f_refresh_rate.set(true);
        if *self.is_used()? {
            *self.refresh_rate.borrow_mut() = (((*self.refresh_rate_mod() as i32) + (60 as i32))) as i32;
        }
        Ok(self.refresh_rate.borrow())
    }
}

/**
 * Range of horizontal active pixels, written in modified form:
 * `(horiz_active_pixels / 8) - 31`. This yields an effective
 * range of 256..2288, with steps of 8 pixels.
 */
impl Edid_StdTiming {
    pub fn horiz_active_pixels_mod(&self) -> Ref<'_, u8> {
        self.horiz_active_pixels_mod.borrow()
    }
}

/**
 * Aspect ratio of the image. Can be used to calculate number
 * of vertical pixels.
 */
impl Edid_StdTiming {
    pub fn aspect_ratio(&self) -> Ref<'_, Edid_StdTiming_AspectRatios> {
        self.aspect_ratio.borrow()
    }
}

/**
 * Refresh rate in Hz, written in modified form: `refresh_rate
 * - 60`. This yields an effective range of 60..123 Hz.
 */
impl Edid_StdTiming {
    pub fn refresh_rate_mod(&self) -> Ref<'_, u64> {
        self.refresh_rate_mod.borrow()
    }
}
impl Edid_StdTiming {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
#[derive(Debug, PartialEq, Clone)]
pub enum Edid_StdTiming_AspectRatios {
    Ratio1610,
    Ratio43,
    Ratio54,
    Ratio169,
    Unknown(i64),
}

impl TryFrom<i64> for Edid_StdTiming_AspectRatios {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<Edid_StdTiming_AspectRatios> {
        match flag {
            0 => Ok(Edid_StdTiming_AspectRatios::Ratio1610),
            1 => Ok(Edid_StdTiming_AspectRatios::Ratio43),
            2 => Ok(Edid_StdTiming_AspectRatios::Ratio54),
            3 => Ok(Edid_StdTiming_AspectRatios::Ratio169),
            _ => Ok(Edid_StdTiming_AspectRatios::Unknown(flag)),
        }
    }
}

impl From<&Edid_StdTiming_AspectRatios> for i64 {
    fn from(v: &Edid_StdTiming_AspectRatios) -> Self {
        match *v {
            Edid_StdTiming_AspectRatios::Ratio1610 => 0,
            Edid_StdTiming_AspectRatios::Ratio43 => 1,
            Edid_StdTiming_AspectRatios::Ratio54 => 2,
            Edid_StdTiming_AspectRatios::Ratio169 => 3,
            Edid_StdTiming_AspectRatios::Unknown(v) => v
        }
    }
}

impl Default for Edid_StdTiming_AspectRatios {
    fn default() -> Self { Edid_StdTiming_AspectRatios::Unknown(0) }
}

