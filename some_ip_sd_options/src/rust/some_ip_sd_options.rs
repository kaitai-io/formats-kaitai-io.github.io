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
 * FormatOptions are used to transport additional information to the entries.
 * This includes forinstance the information how a service instance is
 * reachable (IP-Address, TransportProtocol, Port Number).
 * \sa https://www.autosar.org/fileadmin/standards/foundation/19-11/AUTOSAR_PRS_SOMEIPServiceDiscoveryProtocol.pdf
 * - section 4.1.2.4 Options Format
 */

#[derive(Default, Debug, Clone)]
pub struct SomeIpSdOptions {
    pub _root: SharedType<SomeIpSdOptions>,
    pub _parent: SharedType<SomeIpSdOptions>,
    pub _self: SharedType<Self>,
    entries: RefCell<Vec<OptRc<SomeIpSdOptions_SdOption>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for SomeIpSdOptions {
    type Root = SomeIpSdOptions;
    type Parent = SomeIpSdOptions;

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
                let t = Self::read_into::<_, SomeIpSdOptions_SdOption>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                self_rc.entries.borrow_mut().push(t);
                _i += 1;
            }
        }
        Ok(())
    }
}
impl SomeIpSdOptions {
}
impl SomeIpSdOptions {
    pub fn entries(&self) -> Ref<'_, Vec<OptRc<SomeIpSdOptions_SdOption>>> {
        self.entries.borrow()
    }
}
impl SomeIpSdOptions {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct SomeIpSdOptions_SdOption {
    pub _root: SharedType<SomeIpSdOptions>,
    pub _parent: SharedType<SomeIpSdOptions>,
    pub _self: SharedType<Self>,
    header: RefCell<OptRc<SomeIpSdOptions_SdOption_SdOptionHeader>>,
    content: RefCell<Option<SomeIpSdOptions_SdOption_Content>>,
    _io: RefCell<BytesReader>,
}
#[derive(Debug, Clone)]
pub enum SomeIpSdOptions_SdOption_Content {
    SomeIpSdOptions_SdOption_SdIpv4SdEndpointOption(OptRc<SomeIpSdOptions_SdOption_SdIpv4SdEndpointOption>),
    SomeIpSdOptions_SdOption_SdIpv4EndpointOption(OptRc<SomeIpSdOptions_SdOption_SdIpv4EndpointOption>),
    SomeIpSdOptions_SdOption_SdIpv6EndpointOption(OptRc<SomeIpSdOptions_SdOption_SdIpv6EndpointOption>),
    SomeIpSdOptions_SdOption_SdIpv6MulticastOption(OptRc<SomeIpSdOptions_SdOption_SdIpv6MulticastOption>),
    SomeIpSdOptions_SdOption_SdIpv4MulticastOption(OptRc<SomeIpSdOptions_SdOption_SdIpv4MulticastOption>),
    SomeIpSdOptions_SdOption_SdLoadBalancingOption(OptRc<SomeIpSdOptions_SdOption_SdLoadBalancingOption>),
    SomeIpSdOptions_SdOption_SdIpv6SdEndpointOption(OptRc<SomeIpSdOptions_SdOption_SdIpv6SdEndpointOption>),
    SomeIpSdOptions_SdOption_SdConfigurationOption(OptRc<SomeIpSdOptions_SdOption_SdConfigurationOption>),
}
impl From<&SomeIpSdOptions_SdOption_Content> for OptRc<SomeIpSdOptions_SdOption_SdIpv4SdEndpointOption> {
    fn from(v: &SomeIpSdOptions_SdOption_Content) -> Self {
        if let SomeIpSdOptions_SdOption_Content::SomeIpSdOptions_SdOption_SdIpv4SdEndpointOption(x) = v {
            return x.clone();
        }
        panic!("expected SomeIpSdOptions_SdOption_Content::SomeIpSdOptions_SdOption_SdIpv4SdEndpointOption, got {:?}", v)
    }
}
impl From<OptRc<SomeIpSdOptions_SdOption_SdIpv4SdEndpointOption>> for SomeIpSdOptions_SdOption_Content {
    fn from(v: OptRc<SomeIpSdOptions_SdOption_SdIpv4SdEndpointOption>) -> Self {
        Self::SomeIpSdOptions_SdOption_SdIpv4SdEndpointOption(v)
    }
}
impl From<&SomeIpSdOptions_SdOption_Content> for OptRc<SomeIpSdOptions_SdOption_SdIpv4EndpointOption> {
    fn from(v: &SomeIpSdOptions_SdOption_Content) -> Self {
        if let SomeIpSdOptions_SdOption_Content::SomeIpSdOptions_SdOption_SdIpv4EndpointOption(x) = v {
            return x.clone();
        }
        panic!("expected SomeIpSdOptions_SdOption_Content::SomeIpSdOptions_SdOption_SdIpv4EndpointOption, got {:?}", v)
    }
}
impl From<OptRc<SomeIpSdOptions_SdOption_SdIpv4EndpointOption>> for SomeIpSdOptions_SdOption_Content {
    fn from(v: OptRc<SomeIpSdOptions_SdOption_SdIpv4EndpointOption>) -> Self {
        Self::SomeIpSdOptions_SdOption_SdIpv4EndpointOption(v)
    }
}
impl From<&SomeIpSdOptions_SdOption_Content> for OptRc<SomeIpSdOptions_SdOption_SdIpv6EndpointOption> {
    fn from(v: &SomeIpSdOptions_SdOption_Content) -> Self {
        if let SomeIpSdOptions_SdOption_Content::SomeIpSdOptions_SdOption_SdIpv6EndpointOption(x) = v {
            return x.clone();
        }
        panic!("expected SomeIpSdOptions_SdOption_Content::SomeIpSdOptions_SdOption_SdIpv6EndpointOption, got {:?}", v)
    }
}
impl From<OptRc<SomeIpSdOptions_SdOption_SdIpv6EndpointOption>> for SomeIpSdOptions_SdOption_Content {
    fn from(v: OptRc<SomeIpSdOptions_SdOption_SdIpv6EndpointOption>) -> Self {
        Self::SomeIpSdOptions_SdOption_SdIpv6EndpointOption(v)
    }
}
impl From<&SomeIpSdOptions_SdOption_Content> for OptRc<SomeIpSdOptions_SdOption_SdIpv6MulticastOption> {
    fn from(v: &SomeIpSdOptions_SdOption_Content) -> Self {
        if let SomeIpSdOptions_SdOption_Content::SomeIpSdOptions_SdOption_SdIpv6MulticastOption(x) = v {
            return x.clone();
        }
        panic!("expected SomeIpSdOptions_SdOption_Content::SomeIpSdOptions_SdOption_SdIpv6MulticastOption, got {:?}", v)
    }
}
impl From<OptRc<SomeIpSdOptions_SdOption_SdIpv6MulticastOption>> for SomeIpSdOptions_SdOption_Content {
    fn from(v: OptRc<SomeIpSdOptions_SdOption_SdIpv6MulticastOption>) -> Self {
        Self::SomeIpSdOptions_SdOption_SdIpv6MulticastOption(v)
    }
}
impl From<&SomeIpSdOptions_SdOption_Content> for OptRc<SomeIpSdOptions_SdOption_SdIpv4MulticastOption> {
    fn from(v: &SomeIpSdOptions_SdOption_Content) -> Self {
        if let SomeIpSdOptions_SdOption_Content::SomeIpSdOptions_SdOption_SdIpv4MulticastOption(x) = v {
            return x.clone();
        }
        panic!("expected SomeIpSdOptions_SdOption_Content::SomeIpSdOptions_SdOption_SdIpv4MulticastOption, got {:?}", v)
    }
}
impl From<OptRc<SomeIpSdOptions_SdOption_SdIpv4MulticastOption>> for SomeIpSdOptions_SdOption_Content {
    fn from(v: OptRc<SomeIpSdOptions_SdOption_SdIpv4MulticastOption>) -> Self {
        Self::SomeIpSdOptions_SdOption_SdIpv4MulticastOption(v)
    }
}
impl From<&SomeIpSdOptions_SdOption_Content> for OptRc<SomeIpSdOptions_SdOption_SdLoadBalancingOption> {
    fn from(v: &SomeIpSdOptions_SdOption_Content) -> Self {
        if let SomeIpSdOptions_SdOption_Content::SomeIpSdOptions_SdOption_SdLoadBalancingOption(x) = v {
            return x.clone();
        }
        panic!("expected SomeIpSdOptions_SdOption_Content::SomeIpSdOptions_SdOption_SdLoadBalancingOption, got {:?}", v)
    }
}
impl From<OptRc<SomeIpSdOptions_SdOption_SdLoadBalancingOption>> for SomeIpSdOptions_SdOption_Content {
    fn from(v: OptRc<SomeIpSdOptions_SdOption_SdLoadBalancingOption>) -> Self {
        Self::SomeIpSdOptions_SdOption_SdLoadBalancingOption(v)
    }
}
impl From<&SomeIpSdOptions_SdOption_Content> for OptRc<SomeIpSdOptions_SdOption_SdIpv6SdEndpointOption> {
    fn from(v: &SomeIpSdOptions_SdOption_Content) -> Self {
        if let SomeIpSdOptions_SdOption_Content::SomeIpSdOptions_SdOption_SdIpv6SdEndpointOption(x) = v {
            return x.clone();
        }
        panic!("expected SomeIpSdOptions_SdOption_Content::SomeIpSdOptions_SdOption_SdIpv6SdEndpointOption, got {:?}", v)
    }
}
impl From<OptRc<SomeIpSdOptions_SdOption_SdIpv6SdEndpointOption>> for SomeIpSdOptions_SdOption_Content {
    fn from(v: OptRc<SomeIpSdOptions_SdOption_SdIpv6SdEndpointOption>) -> Self {
        Self::SomeIpSdOptions_SdOption_SdIpv6SdEndpointOption(v)
    }
}
impl From<&SomeIpSdOptions_SdOption_Content> for OptRc<SomeIpSdOptions_SdOption_SdConfigurationOption> {
    fn from(v: &SomeIpSdOptions_SdOption_Content) -> Self {
        if let SomeIpSdOptions_SdOption_Content::SomeIpSdOptions_SdOption_SdConfigurationOption(x) = v {
            return x.clone();
        }
        panic!("expected SomeIpSdOptions_SdOption_Content::SomeIpSdOptions_SdOption_SdConfigurationOption, got {:?}", v)
    }
}
impl From<OptRc<SomeIpSdOptions_SdOption_SdConfigurationOption>> for SomeIpSdOptions_SdOption_Content {
    fn from(v: OptRc<SomeIpSdOptions_SdOption_SdConfigurationOption>) -> Self {
        Self::SomeIpSdOptions_SdOption_SdConfigurationOption(v)
    }
}
impl KStruct for SomeIpSdOptions_SdOption {
    type Root = SomeIpSdOptions;
    type Parent = SomeIpSdOptions;

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
        let t = Self::read_into::<_, SomeIpSdOptions_SdOption_SdOptionHeader>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.header.borrow_mut() = t;
        match *self_rc.header().type() {
            SomeIpSdOptions_SdOption_OptionTypes::ConfigurationOption => {
                let t = Self::read_into::<_, SomeIpSdOptions_SdOption_SdConfigurationOption>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.content.borrow_mut() = Some(t);
            }
            SomeIpSdOptions_SdOption_OptionTypes::Ipv4EndpointOption => {
                let t = Self::read_into::<_, SomeIpSdOptions_SdOption_SdIpv4EndpointOption>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.content.borrow_mut() = Some(t);
            }
            SomeIpSdOptions_SdOption_OptionTypes::Ipv4MulticastOption => {
                let t = Self::read_into::<_, SomeIpSdOptions_SdOption_SdIpv4MulticastOption>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.content.borrow_mut() = Some(t);
            }
            SomeIpSdOptions_SdOption_OptionTypes::Ipv4SdEndpointOption => {
                let t = Self::read_into::<_, SomeIpSdOptions_SdOption_SdIpv4SdEndpointOption>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.content.borrow_mut() = Some(t);
            }
            SomeIpSdOptions_SdOption_OptionTypes::Ipv6EndpointOption => {
                let t = Self::read_into::<_, SomeIpSdOptions_SdOption_SdIpv6EndpointOption>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.content.borrow_mut() = Some(t);
            }
            SomeIpSdOptions_SdOption_OptionTypes::Ipv6MulticastOption => {
                let t = Self::read_into::<_, SomeIpSdOptions_SdOption_SdIpv6MulticastOption>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.content.borrow_mut() = Some(t);
            }
            SomeIpSdOptions_SdOption_OptionTypes::Ipv6SdEndpointOption => {
                let t = Self::read_into::<_, SomeIpSdOptions_SdOption_SdIpv6SdEndpointOption>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.content.borrow_mut() = Some(t);
            }
            SomeIpSdOptions_SdOption_OptionTypes::LoadBalancingOption => {
                let t = Self::read_into::<_, SomeIpSdOptions_SdOption_SdLoadBalancingOption>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                *self_rc.content.borrow_mut() = Some(t);
            }
            _ => {}
        }
        Ok(())
    }
}
impl SomeIpSdOptions_SdOption {
}
impl SomeIpSdOptions_SdOption {
    pub fn header(&self) -> Ref<'_, OptRc<SomeIpSdOptions_SdOption_SdOptionHeader>> {
        self.header.borrow()
    }
}
impl SomeIpSdOptions_SdOption {
    pub fn content(&self) -> Ref<'_, Option<SomeIpSdOptions_SdOption_Content>> {
        self.content.borrow()
    }
}
impl SomeIpSdOptions_SdOption {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
#[derive(Debug, PartialEq, Clone)]
pub enum SomeIpSdOptions_SdOption_OptionTypes {
    ConfigurationOption,
    LoadBalancingOption,
    Ipv4EndpointOption,
    Ipv6EndpointOption,
    Ipv4MulticastOption,
    Ipv6MulticastOption,
    Ipv4SdEndpointOption,
    Ipv6SdEndpointOption,
    Unknown(i64),
}

impl TryFrom<i64> for SomeIpSdOptions_SdOption_OptionTypes {
    type Error = KError;
    fn try_from(flag: i64) -> KResult<SomeIpSdOptions_SdOption_OptionTypes> {
        match flag {
            1 => Ok(SomeIpSdOptions_SdOption_OptionTypes::ConfigurationOption),
            2 => Ok(SomeIpSdOptions_SdOption_OptionTypes::LoadBalancingOption),
            4 => Ok(SomeIpSdOptions_SdOption_OptionTypes::Ipv4EndpointOption),
            6 => Ok(SomeIpSdOptions_SdOption_OptionTypes::Ipv6EndpointOption),
            20 => Ok(SomeIpSdOptions_SdOption_OptionTypes::Ipv4MulticastOption),
            22 => Ok(SomeIpSdOptions_SdOption_OptionTypes::Ipv6MulticastOption),
            36 => Ok(SomeIpSdOptions_SdOption_OptionTypes::Ipv4SdEndpointOption),
            38 => Ok(SomeIpSdOptions_SdOption_OptionTypes::Ipv6SdEndpointOption),
            _ => Ok(SomeIpSdOptions_SdOption_OptionTypes::Unknown(flag)),
        }
    }
}

impl From<&SomeIpSdOptions_SdOption_OptionTypes> for i64 {
    fn from(v: &SomeIpSdOptions_SdOption_OptionTypes) -> Self {
        match *v {
            SomeIpSdOptions_SdOption_OptionTypes::ConfigurationOption => 1,
            SomeIpSdOptions_SdOption_OptionTypes::LoadBalancingOption => 2,
            SomeIpSdOptions_SdOption_OptionTypes::Ipv4EndpointOption => 4,
            SomeIpSdOptions_SdOption_OptionTypes::Ipv6EndpointOption => 6,
            SomeIpSdOptions_SdOption_OptionTypes::Ipv4MulticastOption => 20,
            SomeIpSdOptions_SdOption_OptionTypes::Ipv6MulticastOption => 22,
            SomeIpSdOptions_SdOption_OptionTypes::Ipv4SdEndpointOption => 36,
            SomeIpSdOptions_SdOption_OptionTypes::Ipv6SdEndpointOption => 38,
            SomeIpSdOptions_SdOption_OptionTypes::Unknown(v) => v
        }
    }
}

impl Default for SomeIpSdOptions_SdOption_OptionTypes {
    fn default() -> Self { SomeIpSdOptions_SdOption_OptionTypes::Unknown(0) }
}


#[derive(Default, Debug, Clone)]
pub struct SomeIpSdOptions_SdOption_SdConfigKvPair {
    pub _root: SharedType<SomeIpSdOptions>,
    pub _parent: SharedType<SomeIpSdOptions_SdOption_SdConfigString>,
    pub _self: SharedType<Self>,
    key: RefCell<String>,
    value: RefCell<String>,
    _io: RefCell<BytesReader>,
}
impl KStruct for SomeIpSdOptions_SdOption_SdConfigKvPair {
    type Root = SomeIpSdOptions;
    type Parent = SomeIpSdOptions_SdOption_SdConfigString;

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
        *self_rc.key.borrow_mut() = bytes_to_str(&_io.read_bytes_term(61, false, true, true)?.into(), "ASCII")?;
        *self_rc.value.borrow_mut() = bytes_to_str(&_io.read_bytes_full()?.into(), "ASCII")?;
        Ok(())
    }
}
impl SomeIpSdOptions_SdOption_SdConfigKvPair {
}
impl SomeIpSdOptions_SdOption_SdConfigKvPair {
    pub fn key(&self) -> Ref<'_, String> {
        self.key.borrow()
    }
}
impl SomeIpSdOptions_SdOption_SdConfigKvPair {
    pub fn value(&self) -> Ref<'_, String> {
        self.value.borrow()
    }
}
impl SomeIpSdOptions_SdOption_SdConfigKvPair {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct SomeIpSdOptions_SdOption_SdConfigString {
    pub _root: SharedType<SomeIpSdOptions>,
    pub _parent: SharedType<SomeIpSdOptions_SdOption_SdConfigStringsContainer>,
    pub _self: SharedType<Self>,
    length: RefCell<u8>,
    config: RefCell<OptRc<SomeIpSdOptions_SdOption_SdConfigKvPair>>,
    _io: RefCell<BytesReader>,
    config_raw: RefCell<Vec<u8>>,
}
impl KStruct for SomeIpSdOptions_SdOption_SdConfigString {
    type Root = SomeIpSdOptions;
    type Parent = SomeIpSdOptions_SdOption_SdConfigStringsContainer;

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
        *self_rc.length.borrow_mut() = _io.read_u1()?.into();
        if ((*self_rc.length() as u8) != (0 as u8)) {
            *self_rc.config_raw.borrow_mut() = _io.read_bytes(*self_rc.length() as usize)?.into();
            let config_raw = self_rc.config_raw.borrow();
            let _t_config_raw_io = BytesReader::from(config_raw.clone());
            let t = Self::read_into::<BytesReader, SomeIpSdOptions_SdOption_SdConfigKvPair>(&_t_config_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
            *self_rc.config.borrow_mut() = t;
        }
        Ok(())
    }
}
impl SomeIpSdOptions_SdOption_SdConfigString {
}
impl SomeIpSdOptions_SdOption_SdConfigString {
    pub fn length(&self) -> Ref<'_, u8> {
        self.length.borrow()
    }
}
impl SomeIpSdOptions_SdOption_SdConfigString {
    pub fn config(&self) -> Ref<'_, OptRc<SomeIpSdOptions_SdOption_SdConfigKvPair>> {
        self.config.borrow()
    }
}
impl SomeIpSdOptions_SdOption_SdConfigString {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
impl SomeIpSdOptions_SdOption_SdConfigString {
    pub fn config_raw(&self) -> Ref<'_, Vec<u8>> {
        self.config_raw.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct SomeIpSdOptions_SdOption_SdConfigStringsContainer {
    pub _root: SharedType<SomeIpSdOptions>,
    pub _parent: SharedType<SomeIpSdOptions_SdOption_SdConfigurationOption>,
    pub _self: SharedType<Self>,
    config_strings: RefCell<Vec<OptRc<SomeIpSdOptions_SdOption_SdConfigString>>>,
    _io: RefCell<BytesReader>,
}
impl KStruct for SomeIpSdOptions_SdOption_SdConfigStringsContainer {
    type Root = SomeIpSdOptions;
    type Parent = SomeIpSdOptions_SdOption_SdConfigurationOption;

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
        *self_rc.config_strings.borrow_mut() = Vec::new();
        {
            let mut _i = 0;
            while !_io.is_eof() {
                let t = Self::read_into::<_, SomeIpSdOptions_SdOption_SdConfigString>(&*_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
                self_rc.config_strings.borrow_mut().push(t);
                _i += 1;
            }
        }
        Ok(())
    }
}
impl SomeIpSdOptions_SdOption_SdConfigStringsContainer {
}
impl SomeIpSdOptions_SdOption_SdConfigStringsContainer {
    pub fn config_strings(&self) -> Ref<'_, Vec<OptRc<SomeIpSdOptions_SdOption_SdConfigString>>> {
        self.config_strings.borrow()
    }
}
impl SomeIpSdOptions_SdOption_SdConfigStringsContainer {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct SomeIpSdOptions_SdOption_SdConfigurationOption {
    pub _root: SharedType<SomeIpSdOptions>,
    pub _parent: SharedType<SomeIpSdOptions_SdOption>,
    pub _self: SharedType<Self>,
    reserved: RefCell<u8>,
    configurations: RefCell<OptRc<SomeIpSdOptions_SdOption_SdConfigStringsContainer>>,
    _io: RefCell<BytesReader>,
    configurations_raw: RefCell<Vec<u8>>,
}
impl KStruct for SomeIpSdOptions_SdOption_SdConfigurationOption {
    type Root = SomeIpSdOptions;
    type Parent = SomeIpSdOptions_SdOption;

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
        *self_rc.reserved.borrow_mut() = _io.read_u1()?.into();
        *self_rc.configurations_raw.borrow_mut() = _io.read_bytes(((*_prc.as_ref().unwrap().header().length() as u16) - (1 as u16)) as usize)?.into();
        let configurations_raw = self_rc.configurations_raw.borrow();
        let _t_configurations_raw_io = BytesReader::from(configurations_raw.clone());
        let t = Self::read_into::<BytesReader, SomeIpSdOptions_SdOption_SdConfigStringsContainer>(&_t_configurations_raw_io, Some(self_rc._root.clone()), Some(self_rc._self.clone()))?.into();
        *self_rc.configurations.borrow_mut() = t;
        Ok(())
    }
}
impl SomeIpSdOptions_SdOption_SdConfigurationOption {
}
impl SomeIpSdOptions_SdOption_SdConfigurationOption {
    pub fn reserved(&self) -> Ref<'_, u8> {
        self.reserved.borrow()
    }
}
impl SomeIpSdOptions_SdOption_SdConfigurationOption {
    pub fn configurations(&self) -> Ref<'_, OptRc<SomeIpSdOptions_SdOption_SdConfigStringsContainer>> {
        self.configurations.borrow()
    }
}
impl SomeIpSdOptions_SdOption_SdConfigurationOption {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
impl SomeIpSdOptions_SdOption_SdConfigurationOption {
    pub fn configurations_raw(&self) -> Ref<'_, Vec<u8>> {
        self.configurations_raw.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct SomeIpSdOptions_SdOption_SdIpv4EndpointOption {
    pub _root: SharedType<SomeIpSdOptions>,
    pub _parent: SharedType<SomeIpSdOptions_SdOption>,
    pub _self: SharedType<Self>,
    reserved: RefCell<u8>,
    address: RefCell<Vec<u8>>,
    reserved2: RefCell<u8>,
    l4_protocol: RefCell<u8>,
    port: RefCell<u16>,
    _io: RefCell<BytesReader>,
}
impl KStruct for SomeIpSdOptions_SdOption_SdIpv4EndpointOption {
    type Root = SomeIpSdOptions;
    type Parent = SomeIpSdOptions_SdOption;

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
        *self_rc.reserved.borrow_mut() = _io.read_u1()?.into();
        *self_rc.address.borrow_mut() = _io.read_bytes(4 as usize)?.into();
        *self_rc.reserved2.borrow_mut() = _io.read_u1()?.into();
        *self_rc.l4_protocol.borrow_mut() = _io.read_u1()?.into();
        *self_rc.port.borrow_mut() = _io.read_u2be()?.into();
        Ok(())
    }
}
impl SomeIpSdOptions_SdOption_SdIpv4EndpointOption {
}
impl SomeIpSdOptions_SdOption_SdIpv4EndpointOption {
    pub fn reserved(&self) -> Ref<'_, u8> {
        self.reserved.borrow()
    }
}
impl SomeIpSdOptions_SdOption_SdIpv4EndpointOption {
    pub fn address(&self) -> Ref<'_, Vec<u8>> {
        self.address.borrow()
    }
}
impl SomeIpSdOptions_SdOption_SdIpv4EndpointOption {
    pub fn reserved2(&self) -> Ref<'_, u8> {
        self.reserved2.borrow()
    }
}
impl SomeIpSdOptions_SdOption_SdIpv4EndpointOption {
    pub fn l4_protocol(&self) -> Ref<'_, u8> {
        self.l4_protocol.borrow()
    }
}
impl SomeIpSdOptions_SdOption_SdIpv4EndpointOption {
    pub fn port(&self) -> Ref<'_, u16> {
        self.port.borrow()
    }
}
impl SomeIpSdOptions_SdOption_SdIpv4EndpointOption {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct SomeIpSdOptions_SdOption_SdIpv4MulticastOption {
    pub _root: SharedType<SomeIpSdOptions>,
    pub _parent: SharedType<SomeIpSdOptions_SdOption>,
    pub _self: SharedType<Self>,
    reserved: RefCell<u8>,
    address: RefCell<Vec<u8>>,
    reserved2: RefCell<u8>,
    l4_protocol: RefCell<u8>,
    port: RefCell<u16>,
    _io: RefCell<BytesReader>,
}
impl KStruct for SomeIpSdOptions_SdOption_SdIpv4MulticastOption {
    type Root = SomeIpSdOptions;
    type Parent = SomeIpSdOptions_SdOption;

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
        *self_rc.reserved.borrow_mut() = _io.read_u1()?.into();
        *self_rc.address.borrow_mut() = _io.read_bytes(4 as usize)?.into();
        *self_rc.reserved2.borrow_mut() = _io.read_u1()?.into();
        *self_rc.l4_protocol.borrow_mut() = _io.read_u1()?.into();
        *self_rc.port.borrow_mut() = _io.read_u2be()?.into();
        Ok(())
    }
}
impl SomeIpSdOptions_SdOption_SdIpv4MulticastOption {
}
impl SomeIpSdOptions_SdOption_SdIpv4MulticastOption {
    pub fn reserved(&self) -> Ref<'_, u8> {
        self.reserved.borrow()
    }
}
impl SomeIpSdOptions_SdOption_SdIpv4MulticastOption {
    pub fn address(&self) -> Ref<'_, Vec<u8>> {
        self.address.borrow()
    }
}
impl SomeIpSdOptions_SdOption_SdIpv4MulticastOption {
    pub fn reserved2(&self) -> Ref<'_, u8> {
        self.reserved2.borrow()
    }
}
impl SomeIpSdOptions_SdOption_SdIpv4MulticastOption {
    pub fn l4_protocol(&self) -> Ref<'_, u8> {
        self.l4_protocol.borrow()
    }
}
impl SomeIpSdOptions_SdOption_SdIpv4MulticastOption {
    pub fn port(&self) -> Ref<'_, u16> {
        self.port.borrow()
    }
}
impl SomeIpSdOptions_SdOption_SdIpv4MulticastOption {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct SomeIpSdOptions_SdOption_SdIpv4SdEndpointOption {
    pub _root: SharedType<SomeIpSdOptions>,
    pub _parent: SharedType<SomeIpSdOptions_SdOption>,
    pub _self: SharedType<Self>,
    reserved: RefCell<u8>,
    address: RefCell<Vec<u8>>,
    reserved2: RefCell<u8>,
    l4_protocol: RefCell<u8>,
    port: RefCell<u16>,
    _io: RefCell<BytesReader>,
}
impl KStruct for SomeIpSdOptions_SdOption_SdIpv4SdEndpointOption {
    type Root = SomeIpSdOptions;
    type Parent = SomeIpSdOptions_SdOption;

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
        *self_rc.reserved.borrow_mut() = _io.read_u1()?.into();
        *self_rc.address.borrow_mut() = _io.read_bytes(4 as usize)?.into();
        *self_rc.reserved2.borrow_mut() = _io.read_u1()?.into();
        *self_rc.l4_protocol.borrow_mut() = _io.read_u1()?.into();
        *self_rc.port.borrow_mut() = _io.read_u2be()?.into();
        Ok(())
    }
}
impl SomeIpSdOptions_SdOption_SdIpv4SdEndpointOption {
}
impl SomeIpSdOptions_SdOption_SdIpv4SdEndpointOption {
    pub fn reserved(&self) -> Ref<'_, u8> {
        self.reserved.borrow()
    }
}
impl SomeIpSdOptions_SdOption_SdIpv4SdEndpointOption {
    pub fn address(&self) -> Ref<'_, Vec<u8>> {
        self.address.borrow()
    }
}
impl SomeIpSdOptions_SdOption_SdIpv4SdEndpointOption {
    pub fn reserved2(&self) -> Ref<'_, u8> {
        self.reserved2.borrow()
    }
}
impl SomeIpSdOptions_SdOption_SdIpv4SdEndpointOption {
    pub fn l4_protocol(&self) -> Ref<'_, u8> {
        self.l4_protocol.borrow()
    }
}
impl SomeIpSdOptions_SdOption_SdIpv4SdEndpointOption {
    pub fn port(&self) -> Ref<'_, u16> {
        self.port.borrow()
    }
}
impl SomeIpSdOptions_SdOption_SdIpv4SdEndpointOption {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct SomeIpSdOptions_SdOption_SdIpv6EndpointOption {
    pub _root: SharedType<SomeIpSdOptions>,
    pub _parent: SharedType<SomeIpSdOptions_SdOption>,
    pub _self: SharedType<Self>,
    reserved: RefCell<u8>,
    address: RefCell<Vec<u8>>,
    reserved2: RefCell<u8>,
    l4_protocol: RefCell<u8>,
    port: RefCell<u16>,
    _io: RefCell<BytesReader>,
}
impl KStruct for SomeIpSdOptions_SdOption_SdIpv6EndpointOption {
    type Root = SomeIpSdOptions;
    type Parent = SomeIpSdOptions_SdOption;

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
        *self_rc.reserved.borrow_mut() = _io.read_u1()?.into();
        *self_rc.address.borrow_mut() = _io.read_bytes(16 as usize)?.into();
        *self_rc.reserved2.borrow_mut() = _io.read_u1()?.into();
        *self_rc.l4_protocol.borrow_mut() = _io.read_u1()?.into();
        *self_rc.port.borrow_mut() = _io.read_u2be()?.into();
        Ok(())
    }
}
impl SomeIpSdOptions_SdOption_SdIpv6EndpointOption {
}
impl SomeIpSdOptions_SdOption_SdIpv6EndpointOption {
    pub fn reserved(&self) -> Ref<'_, u8> {
        self.reserved.borrow()
    }
}
impl SomeIpSdOptions_SdOption_SdIpv6EndpointOption {
    pub fn address(&self) -> Ref<'_, Vec<u8>> {
        self.address.borrow()
    }
}
impl SomeIpSdOptions_SdOption_SdIpv6EndpointOption {
    pub fn reserved2(&self) -> Ref<'_, u8> {
        self.reserved2.borrow()
    }
}
impl SomeIpSdOptions_SdOption_SdIpv6EndpointOption {
    pub fn l4_protocol(&self) -> Ref<'_, u8> {
        self.l4_protocol.borrow()
    }
}
impl SomeIpSdOptions_SdOption_SdIpv6EndpointOption {
    pub fn port(&self) -> Ref<'_, u16> {
        self.port.borrow()
    }
}
impl SomeIpSdOptions_SdOption_SdIpv6EndpointOption {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct SomeIpSdOptions_SdOption_SdIpv6MulticastOption {
    pub _root: SharedType<SomeIpSdOptions>,
    pub _parent: SharedType<SomeIpSdOptions_SdOption>,
    pub _self: SharedType<Self>,
    reserved: RefCell<u8>,
    address: RefCell<Vec<u8>>,
    reserved2: RefCell<u8>,
    l4_protocol: RefCell<u8>,
    port: RefCell<u16>,
    _io: RefCell<BytesReader>,
}
impl KStruct for SomeIpSdOptions_SdOption_SdIpv6MulticastOption {
    type Root = SomeIpSdOptions;
    type Parent = SomeIpSdOptions_SdOption;

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
        *self_rc.reserved.borrow_mut() = _io.read_u1()?.into();
        *self_rc.address.borrow_mut() = _io.read_bytes(16 as usize)?.into();
        *self_rc.reserved2.borrow_mut() = _io.read_u1()?.into();
        *self_rc.l4_protocol.borrow_mut() = _io.read_u1()?.into();
        *self_rc.port.borrow_mut() = _io.read_u2be()?.into();
        Ok(())
    }
}
impl SomeIpSdOptions_SdOption_SdIpv6MulticastOption {
}
impl SomeIpSdOptions_SdOption_SdIpv6MulticastOption {
    pub fn reserved(&self) -> Ref<'_, u8> {
        self.reserved.borrow()
    }
}
impl SomeIpSdOptions_SdOption_SdIpv6MulticastOption {
    pub fn address(&self) -> Ref<'_, Vec<u8>> {
        self.address.borrow()
    }
}
impl SomeIpSdOptions_SdOption_SdIpv6MulticastOption {
    pub fn reserved2(&self) -> Ref<'_, u8> {
        self.reserved2.borrow()
    }
}
impl SomeIpSdOptions_SdOption_SdIpv6MulticastOption {
    pub fn l4_protocol(&self) -> Ref<'_, u8> {
        self.l4_protocol.borrow()
    }
}
impl SomeIpSdOptions_SdOption_SdIpv6MulticastOption {
    pub fn port(&self) -> Ref<'_, u16> {
        self.port.borrow()
    }
}
impl SomeIpSdOptions_SdOption_SdIpv6MulticastOption {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct SomeIpSdOptions_SdOption_SdIpv6SdEndpointOption {
    pub _root: SharedType<SomeIpSdOptions>,
    pub _parent: SharedType<SomeIpSdOptions_SdOption>,
    pub _self: SharedType<Self>,
    reserved: RefCell<u8>,
    address: RefCell<Vec<u8>>,
    reserved2: RefCell<u8>,
    l4_protocol: RefCell<u8>,
    port: RefCell<u16>,
    _io: RefCell<BytesReader>,
}
impl KStruct for SomeIpSdOptions_SdOption_SdIpv6SdEndpointOption {
    type Root = SomeIpSdOptions;
    type Parent = SomeIpSdOptions_SdOption;

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
        *self_rc.reserved.borrow_mut() = _io.read_u1()?.into();
        *self_rc.address.borrow_mut() = _io.read_bytes(16 as usize)?.into();
        *self_rc.reserved2.borrow_mut() = _io.read_u1()?.into();
        *self_rc.l4_protocol.borrow_mut() = _io.read_u1()?.into();
        *self_rc.port.borrow_mut() = _io.read_u2be()?.into();
        Ok(())
    }
}
impl SomeIpSdOptions_SdOption_SdIpv6SdEndpointOption {
}
impl SomeIpSdOptions_SdOption_SdIpv6SdEndpointOption {
    pub fn reserved(&self) -> Ref<'_, u8> {
        self.reserved.borrow()
    }
}
impl SomeIpSdOptions_SdOption_SdIpv6SdEndpointOption {
    pub fn address(&self) -> Ref<'_, Vec<u8>> {
        self.address.borrow()
    }
}
impl SomeIpSdOptions_SdOption_SdIpv6SdEndpointOption {
    pub fn reserved2(&self) -> Ref<'_, u8> {
        self.reserved2.borrow()
    }
}
impl SomeIpSdOptions_SdOption_SdIpv6SdEndpointOption {
    pub fn l4_protocol(&self) -> Ref<'_, u8> {
        self.l4_protocol.borrow()
    }
}
impl SomeIpSdOptions_SdOption_SdIpv6SdEndpointOption {
    pub fn port(&self) -> Ref<'_, u16> {
        self.port.borrow()
    }
}
impl SomeIpSdOptions_SdOption_SdIpv6SdEndpointOption {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct SomeIpSdOptions_SdOption_SdLoadBalancingOption {
    pub _root: SharedType<SomeIpSdOptions>,
    pub _parent: SharedType<SomeIpSdOptions_SdOption>,
    pub _self: SharedType<Self>,
    reserved: RefCell<u8>,
    priority: RefCell<u16>,
    weight: RefCell<u16>,
    _io: RefCell<BytesReader>,
}
impl KStruct for SomeIpSdOptions_SdOption_SdLoadBalancingOption {
    type Root = SomeIpSdOptions;
    type Parent = SomeIpSdOptions_SdOption;

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
        *self_rc.reserved.borrow_mut() = _io.read_u1()?.into();
        *self_rc.priority.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.weight.borrow_mut() = _io.read_u2be()?.into();
        Ok(())
    }
}
impl SomeIpSdOptions_SdOption_SdLoadBalancingOption {
}
impl SomeIpSdOptions_SdOption_SdLoadBalancingOption {
    pub fn reserved(&self) -> Ref<'_, u8> {
        self.reserved.borrow()
    }
}
impl SomeIpSdOptions_SdOption_SdLoadBalancingOption {
    pub fn priority(&self) -> Ref<'_, u16> {
        self.priority.borrow()
    }
}
impl SomeIpSdOptions_SdOption_SdLoadBalancingOption {
    pub fn weight(&self) -> Ref<'_, u16> {
        self.weight.borrow()
    }
}
impl SomeIpSdOptions_SdOption_SdLoadBalancingOption {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}

#[derive(Default, Debug, Clone)]
pub struct SomeIpSdOptions_SdOption_SdOptionHeader {
    pub _root: SharedType<SomeIpSdOptions>,
    pub _parent: SharedType<SomeIpSdOptions_SdOption>,
    pub _self: SharedType<Self>,
    length: RefCell<u16>,
    type: RefCell<SomeIpSdOptions_SdOption_OptionTypes>,
    _io: RefCell<BytesReader>,
}
impl KStruct for SomeIpSdOptions_SdOption_SdOptionHeader {
    type Root = SomeIpSdOptions;
    type Parent = SomeIpSdOptions_SdOption;

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
        *self_rc.length.borrow_mut() = _io.read_u2be()?.into();
        *self_rc.type.borrow_mut() = (_io.read_u1()? as i64).try_into()?;
        Ok(())
    }
}
impl SomeIpSdOptions_SdOption_SdOptionHeader {
}
impl SomeIpSdOptions_SdOption_SdOptionHeader {
    pub fn length(&self) -> Ref<'_, u16> {
        self.length.borrow()
    }
}
impl SomeIpSdOptions_SdOption_SdOptionHeader {
    pub fn type(&self) -> Ref<'_, SomeIpSdOptions_SdOption_OptionTypes> {
        self.type.borrow()
    }
}
impl SomeIpSdOptions_SdOption_SdOptionHeader {
    pub fn _io(&self) -> Ref<'_, BytesReader> {
        self._io.borrow()
    }
}
