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
 * A bootloader for Android used on various devices powered by Qualcomm
 * Snapdragon chips:
 * 
 * <https://en.wikipedia.org/wiki/Devices_using_Qualcomm_Snapdragon_processors>
 * 
 * Although not all of the Snapdragon based Android devices use this particular
 * bootloader format, it is known that devices with the following chips have used
 * it (example devices are given for each chip):
 * 
 * * APQ8064 ([devices](https://en.wikipedia.org/wiki/Devices_using_Qualcomm_Snapdragon_processors#Snapdragon_S4_Pro))
 *   - Nexus 4 "mako": [sample][sample-mako] ([other samples][others-mako]),
 *     [releasetools.py](https://android.googlesource.com/device/lge/mako/+/33f0114/releasetools.py#98)
 * 
 * * MSM8974AA ([devices](https://en.wikipedia.org/wiki/Devices_using_Qualcomm_Snapdragon_processors#Snapdragon_800,_801_and_805_(2013/14)))
 *   - Nexus 5 "hammerhead": [sample][sample-hammerhead] ([other samples][others-hammerhead]),
 *     [releasetools.py](https://android.googlesource.com/device/lge/hammerhead/+/7618a7d/releasetools.py#116)
 * 
 * * MSM8992 ([devices](https://en.wikipedia.org/wiki/Devices_using_Qualcomm_Snapdragon_processors#Snapdragon_808_and_810_(2015)))
 *   - Nexus 5X "bullhead": [sample][sample-bullhead] ([other samples][others-bullhead]),
 *     [releasetools.py](https://android.googlesource.com/device/lge/bullhead/+/2994b6b/releasetools.py#126)
 * 
 * * APQ8064-1AA ([devices](https://en.wikipedia.org/wiki/Devices_using_Qualcomm_Snapdragon_processors#Snapdragon_600_(2013)))
 *   - Nexus 7 \[2013] (Mobile) "deb" <a href="#doc-note-data-after-img-bodies">(\**)</a>: [sample][sample-deb] ([other samples][others-deb]),
 *     [releasetools.py](https://android.googlesource.com/device/asus/deb/+/14c1638/releasetools.py#105)
 *   - Nexus 7 \[2013] (Wi-Fi) "flo" <a href="#doc-note-data-after-img-bodies">(\**)</a>: [sample][sample-flo] ([other samples][others-flo]),
 *     [releasetools.py](https://android.googlesource.com/device/asus/flo/+/9d9fee9/releasetools.py#130)
 * 
 * * MSM8996 Pro-AB ([devices](https://en.wikipedia.org/wiki/Devices_using_Qualcomm_Snapdragon_processors#Snapdragon_820_and_821_(2016)))
 *   - Pixel "sailfish" <a href="#doc-note-bootloader-size">(\*)</a>:
 *     [sample][sample-sailfish] ([other samples][others-sailfish])
 *   - Pixel XL "marlin" <a href="#doc-note-bootloader-size">(\*)</a>:
 *     [sample][sample-marlin] ([other samples][others-marlin])
 * 
 * * MSM8998 ([devices](https://en.wikipedia.org/wiki/Devices_using_Qualcomm_Snapdragon_processors#Snapdragon_835_(2017)))
 *   - Pixel 2 "walleye" <a href="#doc-note-bootloader-size">(\*)</a>: [sample][sample-walleye] ([other samples][others-walleye])
 *   - Pixel 2 XL "taimen": [sample][sample-taimen] ([other samples][others-taimen])
 * 
 * <small id="doc-note-bootloader-size">(\*)
 * `bootloader_size` is equal to the size of the whole file (not just `img_bodies` as usual).
 * </small>
 * 
 * <small id="doc-note-data-after-img-bodies">(\**)
 * There are some data after the end of `img_bodies`.
 * </small>
 * 
 * ---
 * 
 * On the other hand, devices with these chips **do not** use this format:
 * 
 * * <del>APQ8084</del> ([devices](https://en.wikipedia.org/wiki/Devices_using_Qualcomm_Snapdragon_processors#Snapdragon_800,_801_and_805_(2013/14)))
 *   - Nexus 6 "shamu": [sample][foreign-sample-shamu] ([other samples][foreign-others-shamu]),
 *     [releasetools.py](https://android.googlesource.com/device/moto/shamu/+/df9354d/releasetools.py#12) -
 *     uses "Motoboot packed image format" instead
 * 
 * * <del>MSM8994</del> ([devices](https://en.wikipedia.org/wiki/Devices_using_Qualcomm_Snapdragon_processors#Snapdragon_808_and_810_(2015)))
 *   - Nexus 6P "angler": [sample][foreign-sample-angler] ([other samples][foreign-others-angler]),
 *     [releasetools.py](https://android.googlesource.com/device/huawei/angler/+/cf92cd8/releasetools.py#29) -
 *     uses "Huawei Bootloader packed image format" instead
 * 
 * [sample-mako]: https://androidfilehost.com/?fid=96039337900113996 "bootloader-mako-makoz30f.img"
 * [others-mako]: https://androidfilehost.com/?w=search&s=bootloader-mako&type=files
 * 
 * [sample-hammerhead]: https://androidfilehost.com/?fid=385035244224410247 "bootloader-hammerhead-hhz20h.img"
 * [others-hammerhead]: https://androidfilehost.com/?w=search&s=bootloader-hammerhead&type=files
 * 
 * [sample-bullhead]: https://androidfilehost.com/?fid=11410963190603870177 "bootloader-bullhead-bhz32c.img"
 * [others-bullhead]: https://androidfilehost.com/?w=search&s=bootloader-bullhead&type=files
 * 
 * [sample-deb]: https://androidfilehost.com/?fid=23501681358552487 "bootloader-deb-flo-04.02.img"
 * [others-deb]: https://androidfilehost.com/?w=search&s=bootloader-deb-flo&type=files
 * 
 * [sample-flo]: https://androidfilehost.com/?fid=23991606952593542 "bootloader-flo-flo-04.05.img"
 * [others-flo]: https://androidfilehost.com/?w=search&s=bootloader-flo-flo&type=files
 * 
 * [sample-sailfish]: https://androidfilehost.com/?fid=6006931924117907154 "bootloader-sailfish-8996-012001-1904111134.img"
 * [others-sailfish]: https://androidfilehost.com/?w=search&s=bootloader-sailfish&type=files
 * 
 * [sample-marlin]: https://androidfilehost.com/?fid=6006931924117907131 "bootloader-marlin-8996-012001-1904111134.img"
 * [others-marlin]: https://androidfilehost.com/?w=search&s=bootloader-marlin&type=files
 * 
 * [sample-walleye]: https://androidfilehost.com/?fid=14943124697586348540 "bootloader-walleye-mw8998-003.0085.00.img"
 * [others-walleye]: https://androidfilehost.com/?w=search&s=bootloader-walleye&type=files
 * 
 * [sample-taimen]: https://androidfilehost.com/?fid=14943124697586348536 "bootloader-taimen-tmz30m.img"
 * [others-taimen]: https://androidfilehost.com/?w=search&s=bootloader-taimen&type=files
 * 
 * [foreign-sample-shamu]: https://androidfilehost.com/?fid=745849072291678307 "bootloader-shamu-moto-apq8084-72.04.img"
 * [foreign-others-shamu]: https://androidfilehost.com/?w=search&s=bootloader-shamu&type=files
 * 
 * [foreign-sample-angler]: https://androidfilehost.com/?fid=11410963190603870158 "bootloader-angler-angler-03.84.img"
 * [foreign-others-angler]: https://androidfilehost.com/?w=search&s=bootloader-angler&type=files
 * 
 * ---
 * 
 * The `bootloader-*.img` samples referenced above originally come from factory
 * images packed in ZIP archives that can be found on the page [Factory Images
 * for Nexus and Pixel Devices](https://developers.google.com/android/images) on
 * the Google Developers site. Note that the codenames on that page may be
 * different than the ones that are written in the list above. That's because the
 * Google page indicates **ROM codenames** in headings (e.g. "occam" for Nexus 4)
 * but the above list uses **model codenames** (e.g. "mako" for Nexus 4) because
 * that is how the original `bootloader-*.img` files are identified. For most
 * devices, however, these code names are the same.
 * \sa https://android.googlesource.com/device/lge/hammerhead/+/7618a7d/releasetools.py Source
 */

#[derive(Default, Debug, Clone)]
pub struct AndroidBootldrQcom {
    pub _root: SharedType<AndroidBootldrQcom>,
    pub _parent: SharedType<AndroidBootldrQcom>,
    pub _self: SharedType<Self>,
    magic: RefCell<Vec<u8>>,
    num_images: RefCell<u32>,
    ofs_img_bodies: RefCell<u32>,
    bootloader_size: RefCell<u32>,
    img_headers: RefCell<Vec<OptRc<AndroidBootldrQcom_ImgHeader>>>,
    _io: RefCell<BytesReader>,
    f_img_bodies: Cell<bool>,
    img_bodies: RefCell<Vec<OptRc<AndroidBootldrQcom_ImgBody>>>,
}
impl KStruct for AndroidBootldrQcom {
    type Root = AndroidBootldrQcom;
    type Parent = AndroidBootldrQcom;

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
        if !(*self_rc.magic() == vec![0x42u8, 0x4fu8, 0x4fu8, 0x54u8, 0x4cu8, 0x44u8, 0x52u8, 0x21u8]) {
            return Err(KError::ValidationFailed(ValidationFailedError { kind: ValidationKind::NotEqual, src_path: "/seq/0".to_string() }));
        }
        *self_rc.num_images.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.ofs_img_bodies.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.bootloader_size.borrow_mut() = _io.read_u4le()?.into();
        *self_rc.img_headers.borrow_mut() = Vec::new();
        let l_img_headers = *self_rc.num_images();
        for _i in 0..l_img_headers {
            let t = Self::read_into::<_, AndroidBootldrQcom_ImgHeader>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
            self_rc.img_headers.borrow_mut().push(t);
        }
        Ok(())
    }
}
impl AndroidBootldrQcom {
    pub fn img_bodies(
        &self
    ) -> KResult<Ref<'_, Vec<OptRc<AndroidBootldrQcom_ImgBody>>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_img_bodies.get() {
            return Ok(self.img_bodies.borrow());
        }
        self.f_img_bodies.set(true);
        let _pos = _io.pos();
        _io.seek(*self.ofs_img_bodies() as usize)?;
        *self.img_bodies.borrow_mut() = Vec::new();
        let l_img_bodies = *self.num_images();
        for _i in 0..l_img_bodies {
            let f = |t : &mut AndroidBootldrQcom_ImgBody| Ok(t.set_params((_i).try_into().map_err(|_| KError::CastError)?));
            let t = Self::read_into_with_init::<_, AndroidBootldrQcom_ImgBody>(&*_io, Some(self._root.clone()), Some(self._self.clone()), &f)?.into();
            self.img_bodies.borrow_mut().push(t);
        }
        _io.seek(_pos)?;
        Ok(self.img_bodies.borrow())
    }
}
impl AndroidBootldrQcom {
    pub fn magic(&self) -> Ref<'_, Vec<u8>> {
        self.magic.borrow()
    }
}
impl AndroidBootldrQcom {
    pub fn num_images(&self) -> Ref<'_, u32> {
        self.num_images.borrow()
    }
}
impl AndroidBootldrQcom {
    pub fn ofs_img_bodies(&self) -> Ref<'_, u32> {
        self.ofs_img_bodies.borrow()
    }
}

/**
 * According to all available `releasetools.py` versions from AOSP (links are
 * in the top-level `/doc`), this should determine only the size of
 * `img_bodies` - there is [an assertion](
 * https://android.googlesource.com/device/lge/hammerhead/+/7618a7d/releasetools.py#167)
 * for it.
 * 
 * However, files for certain Pixel devices (see `/doc`) apparently declare
 * the entire file size here (i.e. including also fields from `magic` to
 * `img_headers`). So if you interpreted `bootloader_size` as the size of
 * `img_bodies` substream in these files, you would exceed the end of file.
 * Although you could check that it fits in the file before attempting to
 * create a substream of that size, you wouldn't know if it's meant to
 * specify the size of just `img_bodies` or the size of the entire bootloader
 * payload (whereas there may be additional data after the end of payload)
 * until parsing `img_bodies` (or at least summing sizes from `img_headers`,
 * but that's stupid).
 * 
 * So this field isn't reliable enough to be used as the size of any
 * substream. If you want to check if it has a reasonable value, do so in
 * your application code.
 */
impl AndroidBootldrQcom {
    pub fn bootloader_size(&self) -> Ref<'_, u32> {
        self.bootloader_size.borrow()
    }
}
impl AndroidBootldrQcom {
    pub fn img_headers(&self) -> Ref<'_, Vec<OptRc<AndroidBootldrQcom_ImgHeader>>> {
        self.img_headers.borrow()
    }
}
impl AndroidBootldrQcom {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct AndroidBootldrQcom_ImgBody {
    pub _root: SharedType<AndroidBootldrQcom>,
    pub _parent: SharedType<AndroidBootldrQcom>,
    pub _self: SharedType<Self>,
    idx: RefCell<i32>,
    body: RefCell<Vec<u8>>,
    _io: RefCell<BytesReader>,
    f_img_header: Cell<bool>,
    img_header: RefCell<OptRc<AndroidBootldrQcom_ImgHeader>>,
}
impl KStruct for AndroidBootldrQcom_ImgBody {
    type Root = AndroidBootldrQcom;
    type Parent = AndroidBootldrQcom;

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
        *self_rc.body.borrow_mut() = _io.read_bytes(*self_rc.img_header()?.len_body() as usize)?.into();
        Ok(())
    }
}
impl AndroidBootldrQcom_ImgBody {
    pub fn idx(&self) -> Ref<'_, i32> {
        self.idx.borrow()
    }
}
impl AndroidBootldrQcom_ImgBody {
    pub fn set_params(&mut self, idx: i32) {
        *self.idx.borrow_mut() = idx;
    }
}
impl AndroidBootldrQcom_ImgBody {
    pub fn img_header(
        &self
    ) -> KResult<Ref<'_, OptRc<AndroidBootldrQcom_ImgHeader>>> {
        let _io = self._io.borrow();
        let _rrc = self._root.get_value().borrow().upgrade();
        let _prc = self._parent.get_value().borrow().upgrade();
        let _r = _rrc.as_ref().unwrap();
        if self.f_img_header.get() {
            return Ok(self.img_header.borrow());
        }
        *self.img_header.borrow_mut() = _r.img_headers()[*self.idx() as usize].clone();
        Ok(self.img_header.borrow())
    }
}
impl AndroidBootldrQcom_ImgBody {
    pub fn body(&self) -> Ref<'_, Vec<u8>> {
        self.body.borrow()
    }
}
impl AndroidBootldrQcom_ImgBody {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct AndroidBootldrQcom_ImgHeader {
    pub _root: SharedType<AndroidBootldrQcom>,
    pub _parent: SharedType<AndroidBootldrQcom>,
    pub _self: SharedType<Self>,
    name: RefCell<String>,
    len_body: RefCell<u32>,
    _io: RefCell<BytesReader>,
}
impl KStruct for AndroidBootldrQcom_ImgHeader {
    type Root = AndroidBootldrQcom;
    type Parent = AndroidBootldrQcom;

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
        *self_rc.name.borrow_mut() = bytes_to_str(&bytes_terminate(&_io.read_bytes(64 as usize)?.into(), 0, false).into(), "ASCII")?;
        *self_rc.len_body.borrow_mut() = _io.read_u4le()?.into();
        Ok(())
    }
}
impl AndroidBootldrQcom_ImgHeader {
}
impl AndroidBootldrQcom_ImgHeader {
    pub fn name(&self) -> Ref<'_, String> {
        self.name.borrow()
    }
}
impl AndroidBootldrQcom_ImgHeader {
    pub fn len_body(&self) -> Ref<'_, u32> {
        self.len_body.borrow()
    }
}
impl AndroidBootldrQcom_ImgHeader {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
