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
 * Microsoft Windows SYSTEMTIME structure, stores individual components
 * of date and time as individual fields, up to millisecond precision.
 * \sa https://learn.microsoft.com/en-us/windows/win32/api/minwinbase/ns-minwinbase-systemtime Source
 */

#[derive(Default, Debug, Clone)]
pub struct WindowsSystemtime {
    pub _root: SharedType<WindowsSystemtime>,
    pub _parent: SharedType<WindowsSystemtime>,
    pub _self: SharedType<Self>,
    year: RefCell<u16>,
    month: RefCell<u16>,
    dow: RefCell<u16>,
    day: RefCell<u16>,
    hour: RefCell<u16>,
    min: RefCell<u16>,
    sec: RefCell<u16>,
    msec: RefCell<u16>,
    _io: RefCell<BytesReader>,
}
impl KStruct for WindowsSystemtime {
    type Root = WindowsSystemtime;
    type Parent = WindowsSystemtime;

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
        *self_rc.year.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.month.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.dow.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.day.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.hour.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.min.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.sec.borrow_mut() = _io.read_u2le()?.into();
        *self_rc.msec.borrow_mut() = _io.read_u2le()?.into();
        Ok(())
    }
}
impl WindowsSystemtime {
}

/**
 * Year
 */
impl WindowsSystemtime {
    pub fn year(&self) -> Ref<'_, u16> {
        self.year.borrow()
    }
}

/**
 * Month (January = 1)
 */
impl WindowsSystemtime {
    pub fn month(&self) -> Ref<'_, u16> {
        self.month.borrow()
    }
}

/**
 * Day of week (Sun = 0)
 */
impl WindowsSystemtime {
    pub fn dow(&self) -> Ref<'_, u16> {
        self.dow.borrow()
    }
}

/**
 * Day of month
 */
impl WindowsSystemtime {
    pub fn day(&self) -> Ref<'_, u16> {
        self.day.borrow()
    }
}

/**
 * Hours
 */
impl WindowsSystemtime {
    pub fn hour(&self) -> Ref<'_, u16> {
        self.hour.borrow()
    }
}

/**
 * Minutes
 */
impl WindowsSystemtime {
    pub fn min(&self) -> Ref<'_, u16> {
        self.min.borrow()
    }
}

/**
 * Seconds
 */
impl WindowsSystemtime {
    pub fn sec(&self) -> Ref<'_, u16> {
        self.sec.borrow()
    }
}

/**
 * Milliseconds
 */
impl WindowsSystemtime {
    pub fn msec(&self) -> Ref<'_, u16> {
        self.msec.borrow()
    }
}
impl WindowsSystemtime {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
