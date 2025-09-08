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
 * Bitmap font format for the GRUB 2 bootloader.
 * \sa https://grub.gibibit.com/New_font_format Source
 */

#[derive(Default, Debug, Clone)]
pub struct Grub2Font {
    pub _root: SharedType<Grub2Font>,
    pub _parent: SharedType<Grub2Font>,
    pub _self: SharedType<Self>,
    magic: RefCell<Vec<u8>>,
    sections: RefCell<Vec<OptRc<Grub2Font_Section>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Grub2Font {
    type Root = Grub2Font;
    type Parent = Grub2Font;

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
        *self_rc.magic.borrow_mut() = _io.read_bytes(12 as usize)?.into();
        if !(*self_rc.magic() == vec![0x46u8, 0x49u8, 0x4cu8, 0x45u8, 0x0u8, 0x0u8, 0x0u8, 0x4u8, 0x50u8, 0x46u8, 0x46u8, 0x32u8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/seq/0".to_string() }));
        }
        *self_rc.sections.borrow_mut() = Vec::new();
        {
            let mut _i = 0;
            while {
                let t = Self::read_into::<_, Grub2Font_Section>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                self_rc.sections.borrow_mut().push(t);
                let _t_sections = self_rc.sections.borrow();
                let _tmpa = _t_sections.last().unwrap();
                _i += 1;
                let x = !(*_tmpa.section_type() == "DATA".to_string());
                x
            } {}
        }
        Ok(())
    }
}
impl Grub2Font {
}
impl Grub2Font {
    pub fn magic(&self) -> Ref<'_, Vec<u8>> {
        self.magic.borrow()
    }
}

/**
 * The "DATA" section acts as a terminator. The documentation says:
 * "A marker that indicates the remainder of the file is data accessed
 * via the character index (CHIX) section. When reading this font file,
 * the rest of the file can be ignored when scanning the sections."
 */
impl Grub2Font {
    pub fn sections(&self) -> Ref<'_, Vec<OptRc<Grub2Font_Section>>> {
        self.sections.borrow()
    }
}
impl Grub2Font {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Grub2Font_AsceSection {
    pub _root: SharedType<Grub2Font>,
    pub _parent: SharedType<Grub2Font_Section>,
    pub _self: SharedType<Self>,
    ascent_in_pixels: RefCell<u16>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Grub2Font_AsceSection {
    type Root = Grub2Font;
    type Parent = Grub2Font_Section;

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
        *self_rc.ascent_in_pixels.borrow_mut() = _io.read_u2be()?.into();
        Ok(())
    }
}
impl Grub2Font_AsceSection {
}
impl Grub2Font_AsceSection {
    pub fn ascent_in_pixels(&self) -> Ref<'_, u16> {
        self.ascent_in_pixels.borrow()
    }
}
impl Grub2Font_AsceSection {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Grub2Font_ChixSection {
    pub _root: SharedType<Grub2Font>,
    pub _parent: SharedType<Grub2Font_Section>,
    pub _self: SharedType<Self>,
    characters: RefCell<Vec<OptRc<Grub2Font_ChixSection_Character>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Grub2Font_ChixSection {
    type Root = Grub2Font;
    type Parent = Grub2Font_Section;

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
        *self_rc.characters.borrow_mut() = Vec::new();
        {
            let mut _i = 0;
            while !_io.is_eof() {
                let t = Self::read_into::<_, Grub2Font_ChixSection_Character>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                self_rc.characters.borrow_mut().push(t);
                _i += 1;
            }
        }
        Ok(())
    }
}
impl Grub2Font_ChixSection {
}
impl Grub2Font_ChixSection {
    pub fn characters(&self) -> Ref<'_, Vec<OptRc<Grub2Font_ChixSection_Character>>> {
        self.characters.borrow()
    }
}
impl Grub2Font_ChixSection {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Grub2Font_ChixSection_Character {
    pub _root: SharedType<Grub2Font>,
    pub _parent: SharedType<Grub2Font_ChixSection>,
    pub _self: SharedType<Self>,
    code_point: RefCell<u32>,
    flags: RefCell<u8>,
    ofs_definition: RefCell<u32>,
    _io: RefCell<BytesReader>,
    f_definition: Cell<bool>,
    definition: RefCell<OptRc<Grub2Font_ChixSection_CharacterDefinition>>,
}
impl KStruct for Grub2Font_ChixSection_Character {
    type Root = Grub2Font;
    type Parent = Grub2Font_ChixSection;

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
        *self_rc.code_point.borrow_mut() = _io.read_u4be()?.into();
        *self_rc.flags.borrow_mut() = _io.read_u1()?.into();
        *self_rc.ofs_definition.borrow_mut() = _io.read_u4be()?.into();
        Ok(())
    }
}
impl Grub2Font_ChixSection_Character {
    pub fn definition(
        &self
    ) -> KResult<Ref<'_, OptRc<Grub2Font_ChixSection_CharacterDefinition>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_definition.get() {
            return Ok(self.definition.borrow());
        }
        let io = Clone::clone(&*_r._io());
        let _pos = io.pos();
        io.seek(*self.ofs_definition() as usize)?;
        let t = Self::read_into::<BytesReader, Grub2Font_ChixSection_CharacterDefinition>(&io, Some(self._root.clone()), Some(self._self.clone()))?.into();
        *self.definition.borrow_mut() = t;
        io.seek(_pos)?;
        Ok(self.definition.borrow())
    }
}

/**
 * Unicode code point
 */
impl Grub2Font_ChixSection_Character {
    pub fn code_point(&self) -> Ref<'_, u32> {
        self.code_point.borrow()
    }
}
impl Grub2Font_ChixSection_Character {
    pub fn flags(&self) -> Ref<'_, u8> {
        self.flags.borrow()
    }
}
impl Grub2Font_ChixSection_Character {
    pub fn ofs_definition(&self) -> Ref<'_, u32> {
        self.ofs_definition.borrow()
    }
}
impl Grub2Font_ChixSection_Character {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Grub2Font_ChixSection_CharacterDefinition {
    pub _root: SharedType<Grub2Font>,
    pub _parent: SharedType<Grub2Font_ChixSection_Character>,
    pub _self: SharedType<Self>,
    width: RefCell<u16>,
    height: RefCell<u16>,
    x_offset: RefCell<i16>,
    y_offset: RefCell<i16>,
    device_width: RefCell<i16>,
    bitmap_data: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Grub2Font_ChixSection_CharacterDefinition {
    type Root = Grub2Font;
    type Parent = Grub2Font_ChixSection_Character;

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
        *self_rc.width.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.height.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.x_offset.borrow_mut() = _io.read_s2be()?.into();
        *self_rc.y_offset.borrow_mut() = _io.read_s2be()?.into();
        *self_rc.device_width.borrow_mut() = _io.read_s2be()?.into();
        *self_rc.bitmap_data.borrow_mut() = _io.read_bytes(((((((*self_rc.width() as u16) * (*self_rc.height() as u16)) as i32) + (7 as i32)) as i32) / (8 as i32)) as usize)?.into();
        Ok(())
    }
}
impl Grub2Font_ChixSection_CharacterDefinition {
}
impl Grub2Font_ChixSection_CharacterDefinition {
    pub fn width(&self) -> Ref<'_, u16> {
        self.width.borrow()
    }
}
impl Grub2Font_ChixSection_CharacterDefinition {
    pub fn height(&self) -> Ref<'_, u16> {
        self.height.borrow()
    }
}
impl Grub2Font_ChixSection_CharacterDefinition {
    pub fn x_offset(&self) -> Ref<'_, i16> {
        self.x_offset.borrow()
    }
}
impl Grub2Font_ChixSection_CharacterDefinition {
    pub fn y_offset(&self) -> Ref<'_, i16> {
        self.y_offset.borrow()
    }
}
impl Grub2Font_ChixSection_CharacterDefinition {
    pub fn device_width(&self) -> Ref<'_, i16> {
        self.device_width.borrow()
    }
}

/**
 * A two-dimensional bitmap, one bit per pixel. It is organized as
 * row-major, top-down, left-to-right. The most significant bit of
 * each byte corresponds to the leftmost or uppermost pixel from all
 * bits of the byte. If a bit is set (1, `true`), the pixel is set to
 * the font color, if a bit is clear (0, `false`), the pixel is
 * transparent.
 * 
 * Rows are **not** padded to byte boundaries (i.e., a
 * single byte may contain bits belonging to multiple rows). The last
 * byte of the bitmap _is_ padded with zero bits at all unused least
 * significant bit positions so that the bitmap ends on a byte
 * boundary.
 */
impl Grub2Font_ChixSection_CharacterDefinition {
    pub fn bitmap_data(&self) -> Ref<'_, Vec<u8>> {
        self.bitmap_data.borrow()
    }
}
impl Grub2Font_ChixSection_CharacterDefinition {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Grub2Font_DescSection {
    pub _root: SharedType<Grub2Font>,
    pub _parent: SharedType<Grub2Font_Section>,
    pub _self: SharedType<Self>,
    descent_in_pixels: RefCell<u16>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Grub2Font_DescSection {
    type Root = Grub2Font;
    type Parent = Grub2Font_Section;

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
        *self_rc.descent_in_pixels.borrow_mut() = _io.read_u2be()?.into();
        Ok(())
    }
}
impl Grub2Font_DescSection {
}
impl Grub2Font_DescSection {
    pub fn descent_in_pixels(&self) -> Ref<'_, u16> {
        self.descent_in_pixels.borrow()
    }
}
impl Grub2Font_DescSection {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Grub2Font_FamiSection {
    pub _root: SharedType<Grub2Font>,
    pub _parent: SharedType<Grub2Font_Section>,
    pub _self: SharedType<Self>,
    font_family_name: RefCell<String>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Grub2Font_FamiSection {
    type Root = Grub2Font;
    type Parent = Grub2Font_Section;

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
        *self_rc.font_family_name.borrow_mut() = bytes_to_str(&_io.read_bytes_term(0, false, true, true)?.into(), "ASCII")?;
        Ok(())
    }
}
impl Grub2Font_FamiSection {
}
impl Grub2Font_FamiSection {
    pub fn font_family_name(&self) -> Ref<'_, String> {
        self.font_family_name.borrow()
    }
}
impl Grub2Font_FamiSection {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Grub2Font_MaxhSection {
    pub _root: SharedType<Grub2Font>,
    pub _parent: SharedType<Grub2Font_Section>,
    pub _self: SharedType<Self>,
    maximum_character_height: RefCell<u16>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Grub2Font_MaxhSection {
    type Root = Grub2Font;
    type Parent = Grub2Font_Section;

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
        *self_rc.maximum_character_height.borrow_mut() = _io.read_u2be()?.into();
        Ok(())
    }
}
impl Grub2Font_MaxhSection {
}
impl Grub2Font_MaxhSection {
    pub fn maximum_character_height(&self) -> Ref<'_, u16> {
        self.maximum_character_height.borrow()
    }
}
impl Grub2Font_MaxhSection {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Grub2Font_MaxwSection {
    pub _root: SharedType<Grub2Font>,
    pub _parent: SharedType<Grub2Font_Section>,
    pub _self: SharedType<Self>,
    maximum_character_width: RefCell<u16>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Grub2Font_MaxwSection {
    type Root = Grub2Font;
    type Parent = Grub2Font_Section;

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
        *self_rc.maximum_character_width.borrow_mut() = _io.read_u2be()?.into();
        Ok(())
    }
}
impl Grub2Font_MaxwSection {
}
impl Grub2Font_MaxwSection {
    pub fn maximum_character_width(&self) -> Ref<'_, u16> {
        self.maximum_character_width.borrow()
    }
}
impl Grub2Font_MaxwSection {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Grub2Font_NameSection {
    pub _root: SharedType<Grub2Font>,
    pub _parent: SharedType<Grub2Font_Section>,
    pub _self: SharedType<Self>,
    font_name: RefCell<String>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Grub2Font_NameSection {
    type Root = Grub2Font;
    type Parent = Grub2Font_Section;

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
        *self_rc.font_name.borrow_mut() = bytes_to_str(&_io.read_bytes_term(0, false, true, true)?.into(), "ASCII")?;
        Ok(())
    }
}
impl Grub2Font_NameSection {
}
impl Grub2Font_NameSection {
    pub fn font_name(&self) -> Ref<'_, String> {
        self.font_name.borrow()
    }
}
impl Grub2Font_NameSection {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Grub2Font_PtszSection {
    pub _root: SharedType<Grub2Font>,
    pub _parent: SharedType<Grub2Font_Section>,
    pub _self: SharedType<Self>,
    font_point_size: RefCell<u16>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Grub2Font_PtszSection {
    type Root = Grub2Font;
    type Parent = Grub2Font_Section;

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
        *self_rc.font_point_size.borrow_mut() = _io.read_u2be()?.into();
        Ok(())
    }
}
impl Grub2Font_PtszSection {
}
impl Grub2Font_PtszSection {
    pub fn font_point_size(&self) -> Ref<'_, u16> {
        self.font_point_size.borrow()
    }
}
impl Grub2Font_PtszSection {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Grub2Font_Section {
    pub _root: SharedType<Grub2Font>,
    pub _parent: SharedType<Grub2Font>,
    pub _self: SharedType<Self>,
    section_type: RefCell<String>,
    len_body: RefCell<u32>,
    body: RefCell<Option<Grub2Font_Section_Body>>,
    _io: RefCell<BytesReader>,
    body_raw: RefCell<Vec<u8>>,
}
#[derive(Debug, Clone)]
pub enum Grub2Font_Section_Body {
    Grub2Font_NameSection(OptRc<Grub2Font_NameSection>),
    Bytes(Vec<u8>),
    Grub2Font_DescSection(OptRc<Grub2Font_DescSection>),
    Grub2Font_WeigSection(OptRc<Grub2Font_WeigSection>),
    Grub2Font_AsceSection(OptRc<Grub2Font_AsceSection>),
    Grub2Font_FamiSection(OptRc<Grub2Font_FamiSection>),
    Grub2Font_ChixSection(OptRc<Grub2Font_ChixSection>),
    Grub2Font_MaxwSection(OptRc<Grub2Font_MaxwSection>),
    Grub2Font_MaxhSection(OptRc<Grub2Font_MaxhSection>),
    Grub2Font_SlanSection(OptRc<Grub2Font_SlanSection>),
    Grub2Font_PtszSection(OptRc<Grub2Font_PtszSection>),
}
impl From<&Grub2Font_Section_Body> for OptRc<Grub2Font_NameSection> {
    fn from(v: &Grub2Font_Section_Body) -> Self {
        if let Grub2Font_Section_Body::Grub2Font_NameSection(x) = v {
            return x.clone();
        }
        panic!("expected Grub2Font_Section_Body::Grub2Font_NameSection, got {:?}", v)
    }
}
impl From<OptRc<Grub2Font_NameSection>> for Grub2Font_Section_Body {
    fn from(v: OptRc<Grub2Font_NameSection>) -> Self {
        Self::Grub2Font_NameSection(v)
    }
}
impl From<&Grub2Font_Section_Body> for Vec<u8> {
    fn from(v: &Grub2Font_Section_Body) -> Self {
        if let Grub2Font_Section_Body::Bytes(x) = v {
            return x.clone();
        }
        panic!("expected Grub2Font_Section_Body::Bytes, got {:?}", v)
    }
}
impl From<Vec<u8>> for Grub2Font_Section_Body {
    fn from(v: Vec<u8>) -> Self {
        Self::Bytes(v)
    }
}
impl From<&Grub2Font_Section_Body> for OptRc<Grub2Font_DescSection> {
    fn from(v: &Grub2Font_Section_Body) -> Self {
        if let Grub2Font_Section_Body::Grub2Font_DescSection(x) = v {
            return x.clone();
        }
        panic!("expected Grub2Font_Section_Body::Grub2Font_DescSection, got {:?}", v)
    }
}
impl From<OptRc<Grub2Font_DescSection>> for Grub2Font_Section_Body {
    fn from(v: OptRc<Grub2Font_DescSection>) -> Self {
        Self::Grub2Font_DescSection(v)
    }
}
impl From<&Grub2Font_Section_Body> for OptRc<Grub2Font_WeigSection> {
    fn from(v: &Grub2Font_Section_Body) -> Self {
        if let Grub2Font_Section_Body::Grub2Font_WeigSection(x) = v {
            return x.clone();
        }
        panic!("expected Grub2Font_Section_Body::Grub2Font_WeigSection, got {:?}", v)
    }
}
impl From<OptRc<Grub2Font_WeigSection>> for Grub2Font_Section_Body {
    fn from(v: OptRc<Grub2Font_WeigSection>) -> Self {
        Self::Grub2Font_WeigSection(v)
    }
}
impl From<&Grub2Font_Section_Body> for OptRc<Grub2Font_AsceSection> {
    fn from(v: &Grub2Font_Section_Body) -> Self {
        if let Grub2Font_Section_Body::Grub2Font_AsceSection(x) = v {
            return x.clone();
        }
        panic!("expected Grub2Font_Section_Body::Grub2Font_AsceSection, got {:?}", v)
    }
}
impl From<OptRc<Grub2Font_AsceSection>> for Grub2Font_Section_Body {
    fn from(v: OptRc<Grub2Font_AsceSection>) -> Self {
        Self::Grub2Font_AsceSection(v)
    }
}
impl From<&Grub2Font_Section_Body> for OptRc<Grub2Font_FamiSection> {
    fn from(v: &Grub2Font_Section_Body) -> Self {
        if let Grub2Font_Section_Body::Grub2Font_FamiSection(x) = v {
            return x.clone();
        }
        panic!("expected Grub2Font_Section_Body::Grub2Font_FamiSection, got {:?}", v)
    }
}
impl From<OptRc<Grub2Font_FamiSection>> for Grub2Font_Section_Body {
    fn from(v: OptRc<Grub2Font_FamiSection>) -> Self {
        Self::Grub2Font_FamiSection(v)
    }
}
impl From<&Grub2Font_Section_Body> for OptRc<Grub2Font_ChixSection> {
    fn from(v: &Grub2Font_Section_Body) -> Self {
        if let Grub2Font_Section_Body::Grub2Font_ChixSection(x) = v {
            return x.clone();
        }
        panic!("expected Grub2Font_Section_Body::Grub2Font_ChixSection, got {:?}", v)
    }
}
impl From<OptRc<Grub2Font_ChixSection>> for Grub2Font_Section_Body {
    fn from(v: OptRc<Grub2Font_ChixSection>) -> Self {
        Self::Grub2Font_ChixSection(v)
    }
}
impl From<&Grub2Font_Section_Body> for OptRc<Grub2Font_MaxwSection> {
    fn from(v: &Grub2Font_Section_Body) -> Self {
        if let Grub2Font_Section_Body::Grub2Font_MaxwSection(x) = v {
            return x.clone();
        }
        panic!("expected Grub2Font_Section_Body::Grub2Font_MaxwSection, got {:?}", v)
    }
}
impl From<OptRc<Grub2Font_MaxwSection>> for Grub2Font_Section_Body {
    fn from(v: OptRc<Grub2Font_MaxwSection>) -> Self {
        Self::Grub2Font_MaxwSection(v)
    }
}
impl From<&Grub2Font_Section_Body> for OptRc<Grub2Font_MaxhSection> {
    fn from(v: &Grub2Font_Section_Body) -> Self {
        if let Grub2Font_Section_Body::Grub2Font_MaxhSection(x) = v {
            return x.clone();
        }
        panic!("expected Grub2Font_Section_Body::Grub2Font_MaxhSection, got {:?}", v)
    }
}
impl From<OptRc<Grub2Font_MaxhSection>> for Grub2Font_Section_Body {
    fn from(v: OptRc<Grub2Font_MaxhSection>) -> Self {
        Self::Grub2Font_MaxhSection(v)
    }
}
impl From<&Grub2Font_Section_Body> for OptRc<Grub2Font_SlanSection> {
    fn from(v: &Grub2Font_Section_Body) -> Self {
        if let Grub2Font_Section_Body::Grub2Font_SlanSection(x) = v {
            return x.clone();
        }
        panic!("expected Grub2Font_Section_Body::Grub2Font_SlanSection, got {:?}", v)
    }
}
impl From<OptRc<Grub2Font_SlanSection>> for Grub2Font_Section_Body {
    fn from(v: OptRc<Grub2Font_SlanSection>) -> Self {
        Self::Grub2Font_SlanSection(v)
    }
}
impl From<&Grub2Font_Section_Body> for OptRc<Grub2Font_PtszSection> {
    fn from(v: &Grub2Font_Section_Body) -> Self {
        if let Grub2Font_Section_Body::Grub2Font_PtszSection(x) = v {
            return x.clone();
        }
        panic!("expected Grub2Font_Section_Body::Grub2Font_PtszSection, got {:?}", v)
    }
}
impl From<OptRc<Grub2Font_PtszSection>> for Grub2Font_Section_Body {
    fn from(v: OptRc<Grub2Font_PtszSection>) -> Self {
        Self::Grub2Font_PtszSection(v)
    }
}
impl KStruct for Grub2Font_Section {
    type Root = Grub2Font;
    type Parent = Grub2Font;

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
        *self_rc.section_type.borrow_mut() = bytes_to_str(&_io.read_bytes(4 as usize)?.into(), "ASCII")?;
        *self_rc.len_body.borrow_mut() = _io.read_u4be()?.into();
        if *self_rc.section_type() != "DATA".to_string() {
            {
                let on = self_rc.section_type();
                if *on == "ASCE" {
                    *self_rc.body_raw.borrow_mut() = _io.read_bytes(*self_rc.len_body() as usize)?.into();
                    let body_raw = self_rc.body_raw.borrow();
                    let _t_body_raw_io = BytesReader::from(body_raw.clone());
                    let t = Self::read_into::<BytesReader, Grub2Font_AsceSection>(&_t_body_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                    *self_rc.body.borrow_mut() = Some(t);
                }
                else if *on == "CHIX" {
                    *self_rc.body_raw.borrow_mut() = _io.read_bytes(*self_rc.len_body() as usize)?.into();
                    let body_raw = self_rc.body_raw.borrow();
                    let _t_body_raw_io = BytesReader::from(body_raw.clone());
                    let t = Self::read_into::<BytesReader, Grub2Font_ChixSection>(&_t_body_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                    *self_rc.body.borrow_mut() = Some(t);
                }
                else if *on == "DESC" {
                    *self_rc.body_raw.borrow_mut() = _io.read_bytes(*self_rc.len_body() as usize)?.into();
                    let body_raw = self_rc.body_raw.borrow();
                    let _t_body_raw_io = BytesReader::from(body_raw.clone());
                    let t = Self::read_into::<BytesReader, Grub2Font_DescSection>(&_t_body_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                    *self_rc.body.borrow_mut() = Some(t);
                }
                else if *on == "FAMI" {
                    *self_rc.body_raw.borrow_mut() = _io.read_bytes(*self_rc.len_body() as usize)?.into();
                    let body_raw = self_rc.body_raw.borrow();
                    let _t_body_raw_io = BytesReader::from(body_raw.clone());
                    let t = Self::read_into::<BytesReader, Grub2Font_FamiSection>(&_t_body_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                    *self_rc.body.borrow_mut() = Some(t);
                }
                else if *on == "MAXH" {
                    *self_rc.body_raw.borrow_mut() = _io.read_bytes(*self_rc.len_body() as usize)?.into();
                    let body_raw = self_rc.body_raw.borrow();
                    let _t_body_raw_io = BytesReader::from(body_raw.clone());
                    let t = Self::read_into::<BytesReader, Grub2Font_MaxhSection>(&_t_body_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                    *self_rc.body.borrow_mut() = Some(t);
                }
                else if *on == "MAXW" {
                    *self_rc.body_raw.borrow_mut() = _io.read_bytes(*self_rc.len_body() as usize)?.into();
                    let body_raw = self_rc.body_raw.borrow();
                    let _t_body_raw_io = BytesReader::from(body_raw.clone());
                    let t = Self::read_into::<BytesReader, Grub2Font_MaxwSection>(&_t_body_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                    *self_rc.body.borrow_mut() = Some(t);
                }
                else if *on == "NAME" {
                    *self_rc.body_raw.borrow_mut() = _io.read_bytes(*self_rc.len_body() as usize)?.into();
                    let body_raw = self_rc.body_raw.borrow();
                    let _t_body_raw_io = BytesReader::from(body_raw.clone());
                    let t = Self::read_into::<BytesReader, Grub2Font_NameSection>(&_t_body_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                    *self_rc.body.borrow_mut() = Some(t);
                }
                else if *on == "PTSZ" {
                    *self_rc.body_raw.borrow_mut() = _io.read_bytes(*self_rc.len_body() as usize)?.into();
                    let body_raw = self_rc.body_raw.borrow();
                    let _t_body_raw_io = BytesReader::from(body_raw.clone());
                    let t = Self::read_into::<BytesReader, Grub2Font_PtszSection>(&_t_body_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                    *self_rc.body.borrow_mut() = Some(t);
                }
                else if *on == "SLAN" {
                    *self_rc.body_raw.borrow_mut() = _io.read_bytes(*self_rc.len_body() as usize)?.into();
                    let body_raw = self_rc.body_raw.borrow();
                    let _t_body_raw_io = BytesReader::from(body_raw.clone());
                    let t = Self::read_into::<BytesReader, Grub2Font_SlanSection>(&_t_body_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                    *self_rc.body.borrow_mut() = Some(t);
                }
                else if *on == "WEIG" {
                    *self_rc.body_raw.borrow_mut() = _io.read_bytes(*self_rc.len_body() as usize)?.into();
                    let body_raw = self_rc.body_raw.borrow();
                    let _t_body_raw_io = BytesReader::from(body_raw.clone());
                    let t = Self::read_into::<BytesReader, Grub2Font_WeigSection>(&_t_body_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                    *self_rc.body.borrow_mut() = Some(t);
                }
                else {
                    *self_rc.body.borrow_mut() = Some(_io.read_bytes(*self_rc.len_body() as usize)?.into());
                }
            }
        }
        Ok(())
    }
}
impl Grub2Font_Section {
}
impl Grub2Font_Section {
    pub fn section_type(&self) -> Ref<'_, String> {
        self.section_type.borrow()
    }
}

/**
 * Should be set to `0xFFFF_FFFF` for `section_type != "DATA"`
 */
impl Grub2Font_Section {
    pub fn len_body(&self) -> Ref<'_, u32> {
        self.len_body.borrow()
    }
}
impl Grub2Font_Section {
    pub fn body(&self) -> Ref<'_, Option<Grub2Font_Section_Body>> {
        self.body.borrow()
    }
}
impl Grub2Font_Section {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
impl Grub2Font_Section {
    pub fn body_raw(&self) -> Ref<'_, Vec<u8>> {
        self.body_raw.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Grub2Font_SlanSection {
    pub _root: SharedType<Grub2Font>,
    pub _parent: SharedType<Grub2Font_Section>,
    pub _self: SharedType<Self>,
    font_slant: RefCell<String>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Grub2Font_SlanSection {
    type Root = Grub2Font;
    type Parent = Grub2Font_Section;

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
        *self_rc.font_slant.borrow_mut() = bytes_to_str(&_io.read_bytes_term(0, false, true, true)?.into(), "ASCII")?;
        Ok(())
    }
}
impl Grub2Font_SlanSection {
}
impl Grub2Font_SlanSection {
    pub fn font_slant(&self) -> Ref<'_, String> {
        self.font_slant.borrow()
    }
}
impl Grub2Font_SlanSection {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct Grub2Font_WeigSection {
    pub _root: SharedType<Grub2Font>,
    pub _parent: SharedType<Grub2Font_Section>,
    pub _self: SharedType<Self>,
    font_weight: RefCell<String>,
    _io: RefCell<BytesReader>,
}
impl KStruct for Grub2Font_WeigSection {
    type Root = Grub2Font;
    type Parent = Grub2Font_Section;

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
        *self_rc.font_weight.borrow_mut() = bytes_to_str(&_io.read_bytes_term(0, false, true, true)?.into(), "ASCII")?;
        Ok(())
    }
}
impl Grub2Font_WeigSection {
}
impl Grub2Font_WeigSection {
    pub fn font_weight(&self) -> Ref<'_, String> {
        self.font_weight.borrow()
    }
}
impl Grub2Font_WeigSection {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
