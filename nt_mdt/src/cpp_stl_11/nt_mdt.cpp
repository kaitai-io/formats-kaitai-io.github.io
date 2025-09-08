// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "nt_mdt.h"
#include "kaitai/exceptions.h"
const std::set<nt_mdt_t::adc_mode_t> nt_mdt_t::_values_adc_mode_t{
    nt_mdt_t::ADC_MODE_HEIGHT,
    nt_mdt_t::ADC_MODE_DFL,
    nt_mdt_t::ADC_MODE_LATERAL_F,
    nt_mdt_t::ADC_MODE_BIAS_V,
    nt_mdt_t::ADC_MODE_CURRENT,
    nt_mdt_t::ADC_MODE_FB_OUT,
    nt_mdt_t::ADC_MODE_MAG,
    nt_mdt_t::ADC_MODE_MAG_SIN,
    nt_mdt_t::ADC_MODE_MAG_COS,
    nt_mdt_t::ADC_MODE_RMS,
    nt_mdt_t::ADC_MODE_CALC_MAG,
    nt_mdt_t::ADC_MODE_PHASE1,
    nt_mdt_t::ADC_MODE_PHASE2,
    nt_mdt_t::ADC_MODE_CALC_PHASE,
    nt_mdt_t::ADC_MODE_EX1,
    nt_mdt_t::ADC_MODE_EX2,
    nt_mdt_t::ADC_MODE_HV_X,
    nt_mdt_t::ADC_MODE_HV_Y,
    nt_mdt_t::ADC_MODE_SNAP_BACK,
    nt_mdt_t::ADC_MODE_FALSE,
};
bool nt_mdt_t::_is_defined_adc_mode_t(nt_mdt_t::adc_mode_t v) {
    return nt_mdt_t::_values_adc_mode_t.find(v) != nt_mdt_t::_values_adc_mode_t.end();
}
const std::set<nt_mdt_t::consts_t> nt_mdt_t::_values_consts_t{
    nt_mdt_t::CONSTS_FRAME_MODE_SIZE,
    nt_mdt_t::CONSTS_FRAME_HEADER_SIZE,
    nt_mdt_t::CONSTS_AXIS_SCALES_SIZE,
    nt_mdt_t::CONSTS_FILE_HEADER_SIZE,
    nt_mdt_t::CONSTS_SPECTRO_VARS_MIN_SIZE,
    nt_mdt_t::CONSTS_SCAN_VARS_MIN_SIZE,
};
bool nt_mdt_t::_is_defined_consts_t(nt_mdt_t::consts_t v) {
    return nt_mdt_t::_values_consts_t.find(v) != nt_mdt_t::_values_consts_t.end();
}
const std::set<nt_mdt_t::data_type_t> nt_mdt_t::_values_data_type_t{
    nt_mdt_t::DATA_TYPE_FLOATFIX,
    nt_mdt_t::DATA_TYPE_FLOAT80,
    nt_mdt_t::DATA_TYPE_FLOAT64,
    nt_mdt_t::DATA_TYPE_FLOAT48,
    nt_mdt_t::DATA_TYPE_FLOAT32,
    nt_mdt_t::DATA_TYPE_INT64,
    nt_mdt_t::DATA_TYPE_INT32,
    nt_mdt_t::DATA_TYPE_INT16,
    nt_mdt_t::DATA_TYPE_INT8,
    nt_mdt_t::DATA_TYPE_UNKNOWN0,
    nt_mdt_t::DATA_TYPE_UINT8,
    nt_mdt_t::DATA_TYPE_UINT16,
    nt_mdt_t::DATA_TYPE_UINT32,
    nt_mdt_t::DATA_TYPE_UINT64,
};
bool nt_mdt_t::_is_defined_data_type_t(nt_mdt_t::data_type_t v) {
    return nt_mdt_t::_values_data_type_t.find(v) != nt_mdt_t::_values_data_type_t.end();
}
const std::set<nt_mdt_t::spm_mode_t> nt_mdt_t::_values_spm_mode_t{
    nt_mdt_t::SPM_MODE_CONSTANT_FORCE,
    nt_mdt_t::SPM_MODE_CONTACT_CONSTANT_HEIGHT,
    nt_mdt_t::SPM_MODE_CONTACT_ERROR,
    nt_mdt_t::SPM_MODE_LATERAL_FORCE,
    nt_mdt_t::SPM_MODE_FORCE_MODULATION,
    nt_mdt_t::SPM_MODE_SPREADING_RESISTANCE_IMAGING,
    nt_mdt_t::SPM_MODE_SEMICONTACT_TOPOGRAPHY,
    nt_mdt_t::SPM_MODE_SEMICONTACT_ERROR,
    nt_mdt_t::SPM_MODE_PHASE_CONTRAST,
    nt_mdt_t::SPM_MODE_AC_MAGNETIC_FORCE,
    nt_mdt_t::SPM_MODE_DC_MAGNETIC_FORCE,
    nt_mdt_t::SPM_MODE_ELECTROSTATIC_FORCE,
    nt_mdt_t::SPM_MODE_CAPACITANCE_CONTRAST,
    nt_mdt_t::SPM_MODE_KELVIN_PROBE,
    nt_mdt_t::SPM_MODE_CONSTANT_CURRENT,
    nt_mdt_t::SPM_MODE_BARRIER_HEIGHT,
    nt_mdt_t::SPM_MODE_CONSTANT_HEIGHT,
    nt_mdt_t::SPM_MODE_AFAM,
    nt_mdt_t::SPM_MODE_CONTACT_EFM,
    nt_mdt_t::SPM_MODE_SHEAR_FORCE_TOPOGRAPHY,
    nt_mdt_t::SPM_MODE_SFOM,
    nt_mdt_t::SPM_MODE_CONTACT_CAPACITANCE,
    nt_mdt_t::SPM_MODE_SNOM_TRANSMISSION,
    nt_mdt_t::SPM_MODE_SNOM_REFLECTION,
    nt_mdt_t::SPM_MODE_SNOM_ALL,
    nt_mdt_t::SPM_MODE_SNOM,
};
bool nt_mdt_t::_is_defined_spm_mode_t(nt_mdt_t::spm_mode_t v) {
    return nt_mdt_t::_values_spm_mode_t.find(v) != nt_mdt_t::_values_spm_mode_t.end();
}
const std::set<nt_mdt_t::spm_technique_t> nt_mdt_t::_values_spm_technique_t{
    nt_mdt_t::SPM_TECHNIQUE_CONTACT_MODE,
    nt_mdt_t::SPM_TECHNIQUE_SEMICONTACT_MODE,
    nt_mdt_t::SPM_TECHNIQUE_TUNNEL_CURRENT,
    nt_mdt_t::SPM_TECHNIQUE_SNOM,
};
bool nt_mdt_t::_is_defined_spm_technique_t(nt_mdt_t::spm_technique_t v) {
    return nt_mdt_t::_values_spm_technique_t.find(v) != nt_mdt_t::_values_spm_technique_t.end();
}
const std::set<nt_mdt_t::unit_t> nt_mdt_t::_values_unit_t{
    nt_mdt_t::UNIT_RAMAN_SHIFT,
    nt_mdt_t::UNIT_RESERVED0,
    nt_mdt_t::UNIT_RESERVED1,
    nt_mdt_t::UNIT_RESERVED2,
    nt_mdt_t::UNIT_RESERVED3,
    nt_mdt_t::UNIT_METER,
    nt_mdt_t::UNIT_CENTI_METER,
    nt_mdt_t::UNIT_MILLI_METER,
    nt_mdt_t::UNIT_MICRO_METER,
    nt_mdt_t::UNIT_NANO_METER,
    nt_mdt_t::UNIT_ANGSTROM,
    nt_mdt_t::UNIT_NANO_AMPERE,
    nt_mdt_t::UNIT_VOLT,
    nt_mdt_t::UNIT_NONE,
    nt_mdt_t::UNIT_KILO_HERTZ,
    nt_mdt_t::UNIT_DEGREES,
    nt_mdt_t::UNIT_PERCENT,
    nt_mdt_t::UNIT_CELSIUS_DEGREE,
    nt_mdt_t::UNIT_VOLT_HIGH,
    nt_mdt_t::UNIT_SECOND,
    nt_mdt_t::UNIT_MILLI_SECOND,
    nt_mdt_t::UNIT_MICRO_SECOND,
    nt_mdt_t::UNIT_NANO_SECOND,
    nt_mdt_t::UNIT_COUNTS,
    nt_mdt_t::UNIT_PIXELS,
    nt_mdt_t::UNIT_RESERVED_SFOM0,
    nt_mdt_t::UNIT_RESERVED_SFOM1,
    nt_mdt_t::UNIT_RESERVED_SFOM2,
    nt_mdt_t::UNIT_RESERVED_SFOM3,
    nt_mdt_t::UNIT_RESERVED_SFOM4,
    nt_mdt_t::UNIT_AMPERE2,
    nt_mdt_t::UNIT_MILLI_AMPERE,
    nt_mdt_t::UNIT_MICRO_AMPERE,
    nt_mdt_t::UNIT_NANO_AMPERE2,
    nt_mdt_t::UNIT_PICO_AMPERE,
    nt_mdt_t::UNIT_VOLT2,
    nt_mdt_t::UNIT_MILLI_VOLT,
    nt_mdt_t::UNIT_MICRO_VOLT,
    nt_mdt_t::UNIT_NANO_VOLT,
    nt_mdt_t::UNIT_PICO_VOLT,
    nt_mdt_t::UNIT_NEWTON,
    nt_mdt_t::UNIT_MILLI_NEWTON,
    nt_mdt_t::UNIT_MICRO_NEWTON,
    nt_mdt_t::UNIT_NANO_NEWTON,
    nt_mdt_t::UNIT_PICO_NEWTON,
    nt_mdt_t::UNIT_RESERVED_DOS0,
    nt_mdt_t::UNIT_RESERVED_DOS1,
    nt_mdt_t::UNIT_RESERVED_DOS2,
    nt_mdt_t::UNIT_RESERVED_DOS3,
    nt_mdt_t::UNIT_RESERVED_DOS4,
};
bool nt_mdt_t::_is_defined_unit_t(nt_mdt_t::unit_t v) {
    return nt_mdt_t::_values_unit_t.find(v) != nt_mdt_t::_values_unit_t.end();
}
const std::set<nt_mdt_t::xml_param_type_t> nt_mdt_t::_values_xml_param_type_t{
    nt_mdt_t::XML_PARAM_TYPE_NONE,
    nt_mdt_t::XML_PARAM_TYPE_LASER_WAVELENGTH,
    nt_mdt_t::XML_PARAM_TYPE_UNITS,
    nt_mdt_t::XML_PARAM_TYPE_DATA_ARRAY,
};
bool nt_mdt_t::_is_defined_xml_param_type_t(nt_mdt_t::xml_param_type_t v) {
    return nt_mdt_t::_values_xml_param_type_t.find(v) != nt_mdt_t::_values_xml_param_type_t.end();
}
const std::set<nt_mdt_t::xml_scan_location_t> nt_mdt_t::_values_xml_scan_location_t{
    nt_mdt_t::XML_SCAN_LOCATION_HLT,
    nt_mdt_t::XML_SCAN_LOCATION_HLB,
    nt_mdt_t::XML_SCAN_LOCATION_HRT,
    nt_mdt_t::XML_SCAN_LOCATION_HRB,
    nt_mdt_t::XML_SCAN_LOCATION_VLT,
    nt_mdt_t::XML_SCAN_LOCATION_VLB,
    nt_mdt_t::XML_SCAN_LOCATION_VRT,
    nt_mdt_t::XML_SCAN_LOCATION_VRB,
};
bool nt_mdt_t::_is_defined_xml_scan_location_t(nt_mdt_t::xml_scan_location_t v) {
    return nt_mdt_t::_values_xml_scan_location_t.find(v) != nt_mdt_t::_values_xml_scan_location_t.end();
}

nt_mdt_t::nt_mdt_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, nt_mdt_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root ? p__root : this;
    m_frames = nullptr;
    m__io__raw_frames = nullptr;
    _read();
}

void nt_mdt_t::_read() {
    m_signature = m__io->read_bytes(4);
    if (!(m_signature == std::string("\x01\xB0\x93\xFF", 4))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x01\xB0\x93\xFF", 4), m_signature, m__io, std::string("/seq/0"));
    }
    m_size = m__io->read_u4le();
    m_reserved0 = m__io->read_bytes(4);
    m_last_frame = m__io->read_u2le();
    m_reserved1 = m__io->read_bytes(18);
    m_wrond_doc = m__io->read_bytes(1);
    m__raw_frames = m__io->read_bytes(size());
    m__io__raw_frames = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_frames));
    m_frames = std::unique_ptr<framez_t>(new framez_t(m__io__raw_frames.get(), this, m__root));
}

nt_mdt_t::~nt_mdt_t() {
    _clean_up();
}

void nt_mdt_t::_clean_up() {
}
const std::set<nt_mdt_t::frame_t::frame_type_t> nt_mdt_t::frame_t::_values_frame_type_t{
    nt_mdt_t::frame_t::FRAME_TYPE_SCANNED,
    nt_mdt_t::frame_t::FRAME_TYPE_SPECTROSCOPY,
    nt_mdt_t::frame_t::FRAME_TYPE_TEXT,
    nt_mdt_t::frame_t::FRAME_TYPE_OLD_MDA,
    nt_mdt_t::frame_t::FRAME_TYPE_MDA,
    nt_mdt_t::frame_t::FRAME_TYPE_PALETTE,
    nt_mdt_t::frame_t::FRAME_TYPE_CURVES_NEW,
    nt_mdt_t::frame_t::FRAME_TYPE_CURVES,
};
bool nt_mdt_t::frame_t::_is_defined_frame_type_t(nt_mdt_t::frame_t::frame_type_t v) {
    return nt_mdt_t::frame_t::_values_frame_type_t.find(v) != nt_mdt_t::frame_t::_values_frame_type_t.end();
}

nt_mdt_t::frame_t::frame_t(kaitai::kstream* p__io, nt_mdt_t::framez_t* p__parent, nt_mdt_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_main = nullptr;
    m__io__raw_main = nullptr;
    _read();
}

void nt_mdt_t::frame_t::_read() {
    m_size = m__io->read_u4le();
    m__raw_main = m__io->read_bytes(size() - 4);
    m__io__raw_main = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_main));
    m_main = std::unique_ptr<frame_main_t>(new frame_main_t(m__io__raw_main.get(), this, m__root));
}

nt_mdt_t::frame_t::~frame_t() {
    _clean_up();
}

void nt_mdt_t::frame_t::_clean_up() {
}

nt_mdt_t::frame_t::axis_scale_t::axis_scale_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, nt_mdt_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void nt_mdt_t::frame_t::axis_scale_t::_read() {
    m_offset = m__io->read_f4le();
    m_step = m__io->read_f4le();
    m_unit = static_cast<nt_mdt_t::unit_t>(m__io->read_s2le());
}

nt_mdt_t::frame_t::axis_scale_t::~axis_scale_t() {
    _clean_up();
}

void nt_mdt_t::frame_t::axis_scale_t::_clean_up() {
}

nt_mdt_t::frame_t::date_time_t::date_time_t(kaitai::kstream* p__io, nt_mdt_t::frame_t::frame_main_t* p__parent, nt_mdt_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_date = nullptr;
    m_time = nullptr;
    _read();
}

void nt_mdt_t::frame_t::date_time_t::_read() {
    m_date = std::unique_ptr<date_t>(new date_t(m__io, this, m__root));
    m_time = std::unique_ptr<time_t>(new time_t(m__io, this, m__root));
}

nt_mdt_t::frame_t::date_time_t::~date_time_t() {
    _clean_up();
}

void nt_mdt_t::frame_t::date_time_t::_clean_up() {
}

nt_mdt_t::frame_t::date_time_t::date_t::date_t(kaitai::kstream* p__io, nt_mdt_t::frame_t::date_time_t* p__parent, nt_mdt_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void nt_mdt_t::frame_t::date_time_t::date_t::_read() {
    m_year = m__io->read_u2le();
    m_month = m__io->read_u2le();
    m_day = m__io->read_u2le();
}

nt_mdt_t::frame_t::date_time_t::date_t::~date_t() {
    _clean_up();
}

void nt_mdt_t::frame_t::date_time_t::date_t::_clean_up() {
}

nt_mdt_t::frame_t::date_time_t::time_t::time_t(kaitai::kstream* p__io, nt_mdt_t::frame_t::date_time_t* p__parent, nt_mdt_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void nt_mdt_t::frame_t::date_time_t::time_t::_read() {
    m_hour = m__io->read_u2le();
    m_min = m__io->read_u2le();
    m_sec = m__io->read_u2le();
}

nt_mdt_t::frame_t::date_time_t::time_t::~time_t() {
    _clean_up();
}

void nt_mdt_t::frame_t::date_time_t::time_t::_clean_up() {
}

nt_mdt_t::frame_t::dots_t::dots_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, nt_mdt_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_coord_header = nullptr;
    m_coordinates = nullptr;
    m_data = nullptr;
    _read();
}

void nt_mdt_t::frame_t::dots_t::_read() {
    m_fm_ndots = m__io->read_u2le();
    n_coord_header = true;
    if (fm_ndots() > 0) {
        n_coord_header = false;
        m_coord_header = std::unique_ptr<dots_header_t>(new dots_header_t(m__io, this, m__root));
    }
    m_coordinates = std::unique_ptr<std::vector<std::unique_ptr<dots_data_t>>>(new std::vector<std::unique_ptr<dots_data_t>>());
    const int l_coordinates = fm_ndots();
    for (int i = 0; i < l_coordinates; i++) {
        m_coordinates->push_back(std::move(std::unique_ptr<dots_data_t>(new dots_data_t(m__io, this, m__root))));
    }
    m_data = std::unique_ptr<std::vector<std::unique_ptr<data_linez_t>>>(new std::vector<std::unique_ptr<data_linez_t>>());
    const int l_data = fm_ndots();
    for (int i = 0; i < l_data; i++) {
        m_data->push_back(std::move(std::unique_ptr<data_linez_t>(new data_linez_t(i, m__io, this, m__root))));
    }
}

nt_mdt_t::frame_t::dots_t::~dots_t() {
    _clean_up();
}

void nt_mdt_t::frame_t::dots_t::_clean_up() {
    if (!n_coord_header) {
    }
}

nt_mdt_t::frame_t::dots_t::data_linez_t::data_linez_t(uint16_t p_index, kaitai::kstream* p__io, nt_mdt_t::frame_t::dots_t* p__parent, nt_mdt_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_index = p_index;
    m_forward = nullptr;
    m_backward = nullptr;
    _read();
}

void nt_mdt_t::frame_t::dots_t::data_linez_t::_read() {
    m_forward = std::unique_ptr<std::vector<int16_t>>(new std::vector<int16_t>());
    const int l_forward = _parent()->coordinates()->at(index())->forward_size();
    for (int i = 0; i < l_forward; i++) {
        m_forward->push_back(std::move(m__io->read_s2le()));
    }
    m_backward = std::unique_ptr<std::vector<int16_t>>(new std::vector<int16_t>());
    const int l_backward = _parent()->coordinates()->at(index())->backward_size();
    for (int i = 0; i < l_backward; i++) {
        m_backward->push_back(std::move(m__io->read_s2le()));
    }
}

nt_mdt_t::frame_t::dots_t::data_linez_t::~data_linez_t() {
    _clean_up();
}

void nt_mdt_t::frame_t::dots_t::data_linez_t::_clean_up() {
}

nt_mdt_t::frame_t::dots_t::dots_data_t::dots_data_t(kaitai::kstream* p__io, nt_mdt_t::frame_t::dots_t* p__parent, nt_mdt_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void nt_mdt_t::frame_t::dots_t::dots_data_t::_read() {
    m_coord_x = m__io->read_f4le();
    m_coord_y = m__io->read_f4le();
    m_forward_size = m__io->read_s4le();
    m_backward_size = m__io->read_s4le();
}

nt_mdt_t::frame_t::dots_t::dots_data_t::~dots_data_t() {
    _clean_up();
}

void nt_mdt_t::frame_t::dots_t::dots_data_t::_clean_up() {
}

nt_mdt_t::frame_t::dots_t::dots_header_t::dots_header_t(kaitai::kstream* p__io, nt_mdt_t::frame_t::dots_t* p__parent, nt_mdt_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_header = nullptr;
    m__io__raw_header = nullptr;
    _read();
}

void nt_mdt_t::frame_t::dots_t::dots_header_t::_read() {
    m_header_size = m__io->read_s4le();
    m__raw_header = m__io->read_bytes(header_size());
    m__io__raw_header = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_header));
    m_header = std::unique_ptr<header__t>(new header__t(m__io__raw_header.get(), this, m__root));
}

nt_mdt_t::frame_t::dots_t::dots_header_t::~dots_header_t() {
    _clean_up();
}

void nt_mdt_t::frame_t::dots_t::dots_header_t::_clean_up() {
}

nt_mdt_t::frame_t::dots_t::dots_header_t::header__t::header__t(kaitai::kstream* p__io, nt_mdt_t::frame_t::dots_t::dots_header_t* p__parent, nt_mdt_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void nt_mdt_t::frame_t::dots_t::dots_header_t::header__t::_read() {
    m_coord_size = m__io->read_s4le();
    m_version = m__io->read_s4le();
    m_xyunits = static_cast<nt_mdt_t::unit_t>(m__io->read_s2le());
}

nt_mdt_t::frame_t::dots_t::dots_header_t::header__t::~header__t() {
    _clean_up();
}

void nt_mdt_t::frame_t::dots_t::dots_header_t::header__t::_clean_up() {
}

nt_mdt_t::frame_t::fd_curves_new_t::fd_curves_new_t(kaitai::kstream* p__io, nt_mdt_t::frame_t::frame_main_t* p__parent, nt_mdt_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_blocks_headers = nullptr;
    m_blocks_names = nullptr;
    m_blocks_data = nullptr;
    _read();
}

void nt_mdt_t::frame_t::fd_curves_new_t::_read() {
    m_block_count = m__io->read_u4le();
    m_blocks_headers = std::unique_ptr<std::vector<std::unique_ptr<block_descr_t>>>(new std::vector<std::unique_ptr<block_descr_t>>());
    const int l_blocks_headers = block_count();
    for (int i = 0; i < l_blocks_headers; i++) {
        m_blocks_headers->push_back(std::move(std::unique_ptr<block_descr_t>(new block_descr_t(m__io, this, m__root))));
    }
    m_blocks_names = std::unique_ptr<std::vector<std::string>>(new std::vector<std::string>());
    const int l_blocks_names = block_count();
    for (int i = 0; i < l_blocks_names; i++) {
        m_blocks_names->push_back(std::move(kaitai::kstream::bytes_to_str(m__io->read_bytes(blocks_headers()->at(i)->name_len()), "UTF-8")));
    }
    m_blocks_data = std::unique_ptr<std::vector<std::string>>(new std::vector<std::string>());
    const int l_blocks_data = block_count();
    for (int i = 0; i < l_blocks_data; i++) {
        m_blocks_data->push_back(std::move(m__io->read_bytes(blocks_headers()->at(i)->len())));
    }
}

nt_mdt_t::frame_t::fd_curves_new_t::~fd_curves_new_t() {
    _clean_up();
}

void nt_mdt_t::frame_t::fd_curves_new_t::_clean_up() {
}

nt_mdt_t::frame_t::fd_curves_new_t::block_descr_t::block_descr_t(kaitai::kstream* p__io, nt_mdt_t::frame_t::fd_curves_new_t* p__parent, nt_mdt_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void nt_mdt_t::frame_t::fd_curves_new_t::block_descr_t::_read() {
    m_name_len = m__io->read_u4le();
    m_len = m__io->read_u4le();
}

nt_mdt_t::frame_t::fd_curves_new_t::block_descr_t::~block_descr_t() {
    _clean_up();
}

void nt_mdt_t::frame_t::fd_curves_new_t::block_descr_t::_clean_up() {
}

nt_mdt_t::frame_t::fd_meta_data_t::fd_meta_data_t(kaitai::kstream* p__io, nt_mdt_t::frame_t::frame_main_t* p__parent, nt_mdt_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_guids = nullptr;
    m_dimensions = nullptr;
    m_mesurands = nullptr;
    m_image = nullptr;
    m__io__raw_image = nullptr;
    f_image = false;
    _read();
}

void nt_mdt_t::frame_t::fd_meta_data_t::_read() {
    m_head_size = m__io->read_u4le();
    m_tot_len = m__io->read_u4le();
    m_guids = std::unique_ptr<std::vector<std::unique_ptr<uuid_t>>>(new std::vector<std::unique_ptr<uuid_t>>());
    const int l_guids = 2;
    for (int i = 0; i < l_guids; i++) {
        m_guids->push_back(std::move(std::unique_ptr<uuid_t>(new uuid_t(m__io, this, m__root))));
    }
    m_frame_status = m__io->read_bytes(4);
    m_name_size = m__io->read_u4le();
    m_comm_size = m__io->read_u4le();
    m_view_info_size = m__io->read_u4le();
    m_spec_size = m__io->read_u4le();
    m_source_info_size = m__io->read_u4le();
    m_var_size = m__io->read_u4le();
    m_data_offset = m__io->read_u4le();
    m_data_size = m__io->read_u4le();
    m_title = kaitai::kstream::bytes_to_str(m__io->read_bytes(name_size()), "UTF-8");
    m_xml = kaitai::kstream::bytes_to_str(m__io->read_bytes(comm_size()), "UTF-8");
    m_struct_len = m__io->read_u4le();
    m_array_size = m__io->read_u8le();
    m_cell_size = m__io->read_u4le();
    m_n_dimensions = m__io->read_u4le();
    m_n_mesurands = m__io->read_u4le();
    m_dimensions = std::unique_ptr<std::vector<std::unique_ptr<calibration_t>>>(new std::vector<std::unique_ptr<calibration_t>>());
    const int l_dimensions = n_dimensions();
    for (int i = 0; i < l_dimensions; i++) {
        m_dimensions->push_back(std::move(std::unique_ptr<calibration_t>(new calibration_t(m__io, this, m__root))));
    }
    m_mesurands = std::unique_ptr<std::vector<std::unique_ptr<calibration_t>>>(new std::vector<std::unique_ptr<calibration_t>>());
    const int l_mesurands = n_mesurands();
    for (int i = 0; i < l_mesurands; i++) {
        m_mesurands->push_back(std::move(std::unique_ptr<calibration_t>(new calibration_t(m__io, this, m__root))));
    }
}

nt_mdt_t::frame_t::fd_meta_data_t::~fd_meta_data_t() {
    _clean_up();
}

void nt_mdt_t::frame_t::fd_meta_data_t::_clean_up() {
    if (f_image) {
    }
}

nt_mdt_t::frame_t::fd_meta_data_t::calibration_t::calibration_t(kaitai::kstream* p__io, nt_mdt_t::frame_t::fd_meta_data_t* p__parent, nt_mdt_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_count = false;
    _read();
}

void nt_mdt_t::frame_t::fd_meta_data_t::calibration_t::_read() {
    m_len_tot = m__io->read_u4le();
    m_len_struct = m__io->read_u4le();
    m_len_name = m__io->read_u4le();
    m_len_comment = m__io->read_u4le();
    m_len_unit = m__io->read_u4le();
    m_si_unit = m__io->read_u8le();
    m_accuracy = m__io->read_f8le();
    m_function_id_and_dimensions = m__io->read_u8le();
    m_bias = m__io->read_f8le();
    m_scale = m__io->read_f8le();
    m_min_index = m__io->read_u8le();
    m_max_index = m__io->read_u8le();
    m_data_type = static_cast<nt_mdt_t::data_type_t>(m__io->read_s4le());
    m_len_author = m__io->read_u4le();
    m_name = kaitai::kstream::bytes_to_str(m__io->read_bytes(len_name()), "UTF-8");
    m_comment = kaitai::kstream::bytes_to_str(m__io->read_bytes(len_comment()), "UTF-8");
    m_unit = kaitai::kstream::bytes_to_str(m__io->read_bytes(len_unit()), "UTF-8");
    m_author = kaitai::kstream::bytes_to_str(m__io->read_bytes(len_author()), "UTF-8");
}

nt_mdt_t::frame_t::fd_meta_data_t::calibration_t::~calibration_t() {
    _clean_up();
}

void nt_mdt_t::frame_t::fd_meta_data_t::calibration_t::_clean_up() {
}

int32_t nt_mdt_t::frame_t::fd_meta_data_t::calibration_t::count() {
    if (f_count)
        return m_count;
    f_count = true;
    m_count = (max_index() - min_index()) + 1;
    return m_count;
}

nt_mdt_t::frame_t::fd_meta_data_t::image_t::image_t(kaitai::kstream* p__io, nt_mdt_t::frame_t::fd_meta_data_t* p__parent, nt_mdt_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_image = nullptr;
    _read();
}

void nt_mdt_t::frame_t::fd_meta_data_t::image_t::_read() {
    m_image = std::unique_ptr<std::vector<std::unique_ptr<vec_t>>>(new std::vector<std::unique_ptr<vec_t>>());
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_image->push_back(std::move(std::unique_ptr<vec_t>(new vec_t(m__io, this, m__root))));
            i++;
        }
    }
}

nt_mdt_t::frame_t::fd_meta_data_t::image_t::~image_t() {
    _clean_up();
}

void nt_mdt_t::frame_t::fd_meta_data_t::image_t::_clean_up() {
}

nt_mdt_t::frame_t::fd_meta_data_t::image_t::vec_t::vec_t(kaitai::kstream* p__io, nt_mdt_t::frame_t::fd_meta_data_t::image_t* p__parent, nt_mdt_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_items = nullptr;
    _read();
}

void nt_mdt_t::frame_t::fd_meta_data_t::image_t::vec_t::_read() {
    m_items = std::unique_ptr<std::vector<double>>(new std::vector<double>());
    const int l_items = _parent()->_parent()->n_mesurands();
    for (int i = 0; i < l_items; i++) {
        switch (_parent()->_parent()->mesurands()->at(i)->data_type()) {
        case nt_mdt_t::DATA_TYPE_FLOAT32: {
            m_items->push_back(std::move(m__io->read_f4le()));
            break;
        }
        case nt_mdt_t::DATA_TYPE_FLOAT64: {
            m_items->push_back(std::move(m__io->read_f8le()));
            break;
        }
        case nt_mdt_t::DATA_TYPE_INT16: {
            m_items->push_back(std::move(m__io->read_s2le()));
            break;
        }
        case nt_mdt_t::DATA_TYPE_INT32: {
            m_items->push_back(std::move(m__io->read_s4le()));
            break;
        }
        case nt_mdt_t::DATA_TYPE_INT64: {
            m_items->push_back(std::move(m__io->read_s8le()));
            break;
        }
        case nt_mdt_t::DATA_TYPE_INT8: {
            m_items->push_back(std::move(m__io->read_s1()));
            break;
        }
        case nt_mdt_t::DATA_TYPE_UINT16: {
            m_items->push_back(std::move(m__io->read_u2le()));
            break;
        }
        case nt_mdt_t::DATA_TYPE_UINT32: {
            m_items->push_back(std::move(m__io->read_u4le()));
            break;
        }
        case nt_mdt_t::DATA_TYPE_UINT64: {
            m_items->push_back(std::move(m__io->read_u8le()));
            break;
        }
        case nt_mdt_t::DATA_TYPE_UINT8: {
            m_items->push_back(std::move(m__io->read_u1()));
            break;
        }
        }
    }
}

nt_mdt_t::frame_t::fd_meta_data_t::image_t::vec_t::~vec_t() {
    _clean_up();
}

void nt_mdt_t::frame_t::fd_meta_data_t::image_t::vec_t::_clean_up() {
}

nt_mdt_t::frame_t::fd_meta_data_t::image_t* nt_mdt_t::frame_t::fd_meta_data_t::image() {
    if (f_image)
        return m_image.get();
    f_image = true;
    std::streampos _pos = m__io->pos();
    m__io->seek(data_offset());
    m__raw_image = m__io->read_bytes(data_size());
    m__io__raw_image = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_image));
    m_image = std::unique_ptr<image_t>(new image_t(m__io__raw_image.get(), this, m__root));
    m__io->seek(_pos);
    return m_image.get();
}
const std::set<nt_mdt_t::frame_t::fd_scanned_t::input_signal_t> nt_mdt_t::frame_t::fd_scanned_t::_values_input_signal_t{
    nt_mdt_t::frame_t::fd_scanned_t::INPUT_SIGNAL_EXTENSION_SLOT,
    nt_mdt_t::frame_t::fd_scanned_t::INPUT_SIGNAL_BIAS_V,
    nt_mdt_t::frame_t::fd_scanned_t::INPUT_SIGNAL_GROUND,
};
bool nt_mdt_t::frame_t::fd_scanned_t::_is_defined_input_signal_t(nt_mdt_t::frame_t::fd_scanned_t::input_signal_t v) {
    return nt_mdt_t::frame_t::fd_scanned_t::_values_input_signal_t.find(v) != nt_mdt_t::frame_t::fd_scanned_t::_values_input_signal_t.end();
}
const std::set<nt_mdt_t::frame_t::fd_scanned_t::lift_mode_t> nt_mdt_t::frame_t::fd_scanned_t::_values_lift_mode_t{
    nt_mdt_t::frame_t::fd_scanned_t::LIFT_MODE_STEP,
    nt_mdt_t::frame_t::fd_scanned_t::LIFT_MODE_FINE,
    nt_mdt_t::frame_t::fd_scanned_t::LIFT_MODE_SLOPE,
};
bool nt_mdt_t::frame_t::fd_scanned_t::_is_defined_lift_mode_t(nt_mdt_t::frame_t::fd_scanned_t::lift_mode_t v) {
    return nt_mdt_t::frame_t::fd_scanned_t::_values_lift_mode_t.find(v) != nt_mdt_t::frame_t::fd_scanned_t::_values_lift_mode_t.end();
}
const std::set<nt_mdt_t::frame_t::fd_scanned_t::mode_t> nt_mdt_t::frame_t::fd_scanned_t::_values_mode_t{
    nt_mdt_t::frame_t::fd_scanned_t::MODE_STM,
    nt_mdt_t::frame_t::fd_scanned_t::MODE_AFM,
    nt_mdt_t::frame_t::fd_scanned_t::MODE_UNKNOWN2,
    nt_mdt_t::frame_t::fd_scanned_t::MODE_UNKNOWN3,
    nt_mdt_t::frame_t::fd_scanned_t::MODE_UNKNOWN4,
};
bool nt_mdt_t::frame_t::fd_scanned_t::_is_defined_mode_t(nt_mdt_t::frame_t::fd_scanned_t::mode_t v) {
    return nt_mdt_t::frame_t::fd_scanned_t::_values_mode_t.find(v) != nt_mdt_t::frame_t::fd_scanned_t::_values_mode_t.end();
}

nt_mdt_t::frame_t::fd_scanned_t::fd_scanned_t(kaitai::kstream* p__io, nt_mdt_t::frame_t::frame_main_t* p__parent, nt_mdt_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_vars = nullptr;
    m__io__raw_vars = nullptr;
    m_dots = nullptr;
    m_image = nullptr;
    m_title = nullptr;
    m_xml = nullptr;
    _read();
}

void nt_mdt_t::frame_t::fd_scanned_t::_read() {
    m__raw_vars = m__io->read_bytes(_parent()->var_size());
    m__io__raw_vars = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_vars));
    m_vars = std::unique_ptr<vars_t>(new vars_t(m__io__raw_vars.get(), this, m__root));
    n_orig_format = true;
    if (false) {
        n_orig_format = false;
        m_orig_format = m__io->read_u4le();
    }
    n_tune = true;
    if (false) {
        n_tune = false;
        m_tune = static_cast<nt_mdt_t::frame_t::fd_scanned_t::lift_mode_t>(m__io->read_u4le());
    }
    n_feedback_gain = true;
    if (false) {
        n_feedback_gain = false;
        m_feedback_gain = m__io->read_f8le();
    }
    n_dac_scale = true;
    if (false) {
        n_dac_scale = false;
        m_dac_scale = m__io->read_s4le();
    }
    n_overscan = true;
    if (false) {
        n_overscan = false;
        m_overscan = m__io->read_s4le();
    }
    m_fm_mode = m__io->read_u2le();
    m_fm_xres = m__io->read_u2le();
    m_fm_yres = m__io->read_u2le();
    m_dots = std::unique_ptr<dots_t>(new dots_t(m__io, this, m__root));
    m_image = std::unique_ptr<std::vector<int16_t>>(new std::vector<int16_t>());
    const int l_image = fm_xres() * fm_yres();
    for (int i = 0; i < l_image; i++) {
        m_image->push_back(std::move(m__io->read_s2le()));
    }
    m_title = std::unique_ptr<title_t>(new title_t(m__io, this, m__root));
    m_xml = std::unique_ptr<xml_t>(new xml_t(m__io, this, m__root));
}

nt_mdt_t::frame_t::fd_scanned_t::~fd_scanned_t() {
    _clean_up();
}

void nt_mdt_t::frame_t::fd_scanned_t::_clean_up() {
    if (!n_orig_format) {
    }
    if (!n_tune) {
    }
    if (!n_feedback_gain) {
    }
    if (!n_dac_scale) {
    }
    if (!n_overscan) {
    }
}

nt_mdt_t::frame_t::fd_scanned_t::dot_t::dot_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, nt_mdt_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void nt_mdt_t::frame_t::fd_scanned_t::dot_t::_read() {
    m_x = m__io->read_s2le();
    m_y = m__io->read_s2le();
}

nt_mdt_t::frame_t::fd_scanned_t::dot_t::~dot_t() {
    _clean_up();
}

void nt_mdt_t::frame_t::fd_scanned_t::dot_t::_clean_up() {
}

nt_mdt_t::frame_t::fd_scanned_t::scan_dir_t::scan_dir_t(kaitai::kstream* p__io, nt_mdt_t::frame_t::fd_scanned_t::vars_t* p__parent, nt_mdt_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void nt_mdt_t::frame_t::fd_scanned_t::scan_dir_t::_read() {
    m_unkn = m__io->read_bits_int_be(4);
    m_double_pass = m__io->read_bits_int_be(1);
    m_bottom = m__io->read_bits_int_be(1);
    m_left = m__io->read_bits_int_be(1);
    m_horizontal = m__io->read_bits_int_be(1);
}

nt_mdt_t::frame_t::fd_scanned_t::scan_dir_t::~scan_dir_t() {
    _clean_up();
}

void nt_mdt_t::frame_t::fd_scanned_t::scan_dir_t::_clean_up() {
}

nt_mdt_t::frame_t::fd_scanned_t::vars_t::vars_t(kaitai::kstream* p__io, nt_mdt_t::frame_t::fd_scanned_t* p__parent, nt_mdt_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_x_scale = nullptr;
    m_y_scale = nullptr;
    m_z_scale = nullptr;
    m_scan_dir = nullptr;
    _read();
}

void nt_mdt_t::frame_t::fd_scanned_t::vars_t::_read() {
    m_x_scale = std::unique_ptr<axis_scale_t>(new axis_scale_t(m__io, this, m__root));
    m_y_scale = std::unique_ptr<axis_scale_t>(new axis_scale_t(m__io, this, m__root));
    m_z_scale = std::unique_ptr<axis_scale_t>(new axis_scale_t(m__io, this, m__root));
    m_channel_index = static_cast<nt_mdt_t::adc_mode_t>(m__io->read_u1());
    m_mode = static_cast<nt_mdt_t::frame_t::fd_scanned_t::mode_t>(m__io->read_u1());
    m_xres = m__io->read_u2le();
    m_yres = m__io->read_u2le();
    m_ndacq = m__io->read_u2le();
    m_step_length = m__io->read_f4le();
    m_adt = m__io->read_u2le();
    m_adc_gain_amp_log10 = m__io->read_u1();
    m_adc_index = m__io->read_u1();
    m_input_signal_or_version = m__io->read_u1();
    m_substr_plane_order_or_pass_num = m__io->read_u1();
    m_scan_dir = std::unique_ptr<scan_dir_t>(new scan_dir_t(m__io, this, m__root));
    m_power_of_2 = m__io->read_u1();
    m_velocity = m__io->read_f4le();
    m_setpoint = m__io->read_f4le();
    m_bias_voltage = m__io->read_f4le();
    m_draw = m__io->read_u1();
    m_reserved = m__io->read_u1();
    m_xoff = m__io->read_s4le();
    m_yoff = m__io->read_s4le();
    m_nl_corr = m__io->read_u1();
}

nt_mdt_t::frame_t::fd_scanned_t::vars_t::~vars_t() {
    _clean_up();
}

void nt_mdt_t::frame_t::fd_scanned_t::vars_t::_clean_up() {
}

nt_mdt_t::frame_t::fd_spectroscopy_t::fd_spectroscopy_t(kaitai::kstream* p__io, nt_mdt_t::frame_t::frame_main_t* p__parent, nt_mdt_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_vars = nullptr;
    m__io__raw_vars = nullptr;
    m_dots = nullptr;
    m_data = nullptr;
    m_title = nullptr;
    m_xml = nullptr;
    _read();
}

void nt_mdt_t::frame_t::fd_spectroscopy_t::_read() {
    m__raw_vars = m__io->read_bytes(_parent()->var_size());
    m__io__raw_vars = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_vars));
    m_vars = std::unique_ptr<vars_t>(new vars_t(m__io__raw_vars.get(), this, m__root));
    m_fm_mode = m__io->read_u2le();
    m_fm_xres = m__io->read_u2le();
    m_fm_yres = m__io->read_u2le();
    m_dots = std::unique_ptr<dots_t>(new dots_t(m__io, this, m__root));
    m_data = std::unique_ptr<std::vector<int16_t>>(new std::vector<int16_t>());
    const int l_data = fm_xres() * fm_yres();
    for (int i = 0; i < l_data; i++) {
        m_data->push_back(std::move(m__io->read_s2le()));
    }
    m_title = std::unique_ptr<title_t>(new title_t(m__io, this, m__root));
    m_xml = std::unique_ptr<xml_t>(new xml_t(m__io, this, m__root));
}

nt_mdt_t::frame_t::fd_spectroscopy_t::~fd_spectroscopy_t() {
    _clean_up();
}

void nt_mdt_t::frame_t::fd_spectroscopy_t::_clean_up() {
}

nt_mdt_t::frame_t::fd_spectroscopy_t::vars_t::vars_t(kaitai::kstream* p__io, nt_mdt_t::frame_t::fd_spectroscopy_t* p__parent, nt_mdt_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_x_scale = nullptr;
    m_y_scale = nullptr;
    m_z_scale = nullptr;
    _read();
}

void nt_mdt_t::frame_t::fd_spectroscopy_t::vars_t::_read() {
    m_x_scale = std::unique_ptr<axis_scale_t>(new axis_scale_t(m__io, this, m__root));
    m_y_scale = std::unique_ptr<axis_scale_t>(new axis_scale_t(m__io, this, m__root));
    m_z_scale = std::unique_ptr<axis_scale_t>(new axis_scale_t(m__io, this, m__root));
    m_sp_mode = m__io->read_u2le();
    m_sp_filter = m__io->read_u2le();
    m_u_begin = m__io->read_f4le();
    m_u_end = m__io->read_f4le();
    m_z_up = m__io->read_s2le();
    m_z_down = m__io->read_s2le();
    m_sp_averaging = m__io->read_u2le();
    m_sp_repeat = m__io->read_u1();
    m_sp_back = m__io->read_u1();
    m_sp_4nx = m__io->read_s2le();
    m_sp_osc = m__io->read_u1();
    m_sp_n4 = m__io->read_u1();
    m_sp_4x0 = m__io->read_f4le();
    m_sp_4xr = m__io->read_f4le();
    m_sp_4u = m__io->read_s2le();
    m_sp_4i = m__io->read_s2le();
    m_sp_nx = m__io->read_s2le();
}

nt_mdt_t::frame_t::fd_spectroscopy_t::vars_t::~vars_t() {
    _clean_up();
}

void nt_mdt_t::frame_t::fd_spectroscopy_t::vars_t::_clean_up() {
}

nt_mdt_t::frame_t::frame_main_t::frame_main_t(kaitai::kstream* p__io, nt_mdt_t::frame_t* p__parent, nt_mdt_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_version = nullptr;
    m_date_time = nullptr;
    m__io__raw_frame_data = nullptr;
    _read();
}

void nt_mdt_t::frame_t::frame_main_t::_read() {
    m_type = static_cast<nt_mdt_t::frame_t::frame_type_t>(m__io->read_u2le());
    m_version = std::unique_ptr<version_t>(new version_t(m__io, this, m__root));
    m_date_time = std::unique_ptr<date_time_t>(new date_time_t(m__io, this, m__root));
    m_var_size = m__io->read_u2le();
    n_frame_data = true;
    switch (type()) {
    case nt_mdt_t::frame_t::FRAME_TYPE_CURVES: {
        n_frame_data = false;
        m__raw_frame_data = m__io->read_bytes_full();
        m__io__raw_frame_data = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_frame_data));
        m_frame_data = std::unique_ptr<fd_spectroscopy_t>(new fd_spectroscopy_t(m__io__raw_frame_data.get(), this, m__root));
        break;
    }
    case nt_mdt_t::frame_t::FRAME_TYPE_CURVES_NEW: {
        n_frame_data = false;
        m__raw_frame_data = m__io->read_bytes_full();
        m__io__raw_frame_data = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_frame_data));
        m_frame_data = std::unique_ptr<fd_curves_new_t>(new fd_curves_new_t(m__io__raw_frame_data.get(), this, m__root));
        break;
    }
    case nt_mdt_t::frame_t::FRAME_TYPE_MDA: {
        n_frame_data = false;
        m__raw_frame_data = m__io->read_bytes_full();
        m__io__raw_frame_data = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_frame_data));
        m_frame_data = std::unique_ptr<fd_meta_data_t>(new fd_meta_data_t(m__io__raw_frame_data.get(), this, m__root));
        break;
    }
    case nt_mdt_t::frame_t::FRAME_TYPE_SCANNED: {
        n_frame_data = false;
        m__raw_frame_data = m__io->read_bytes_full();
        m__io__raw_frame_data = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_frame_data));
        m_frame_data = std::unique_ptr<fd_scanned_t>(new fd_scanned_t(m__io__raw_frame_data.get(), this, m__root));
        break;
    }
    case nt_mdt_t::frame_t::FRAME_TYPE_SPECTROSCOPY: {
        n_frame_data = false;
        m__raw_frame_data = m__io->read_bytes_full();
        m__io__raw_frame_data = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_frame_data));
        m_frame_data = std::unique_ptr<fd_spectroscopy_t>(new fd_spectroscopy_t(m__io__raw_frame_data.get(), this, m__root));
        break;
    }
    default: {
        m__raw_frame_data = m__io->read_bytes_full();
        break;
    }
    }
}

nt_mdt_t::frame_t::frame_main_t::~frame_main_t() {
    _clean_up();
}

void nt_mdt_t::frame_t::frame_main_t::_clean_up() {
    if (!n_frame_data) {
    }
}

nt_mdt_t::framez_t::framez_t(kaitai::kstream* p__io, nt_mdt_t* p__parent, nt_mdt_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_frames = nullptr;
    _read();
}

void nt_mdt_t::framez_t::_read() {
    m_frames = std::unique_ptr<std::vector<std::unique_ptr<frame_t>>>(new std::vector<std::unique_ptr<frame_t>>());
    const int l_frames = _root()->last_frame() + 1;
    for (int i = 0; i < l_frames; i++) {
        m_frames->push_back(std::move(std::unique_ptr<frame_t>(new frame_t(m__io, this, m__root))));
    }
}

nt_mdt_t::framez_t::~framez_t() {
    _clean_up();
}

void nt_mdt_t::framez_t::_clean_up() {
}

nt_mdt_t::title_t::title_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, nt_mdt_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void nt_mdt_t::title_t::_read() {
    m_title_len = m__io->read_u4le();
    m_title = kaitai::kstream::bytes_to_str(m__io->read_bytes(title_len()), "windows-1251");
}

nt_mdt_t::title_t::~title_t() {
    _clean_up();
}

void nt_mdt_t::title_t::_clean_up() {
}

nt_mdt_t::uuid_t::uuid_t(kaitai::kstream* p__io, nt_mdt_t::frame_t::fd_meta_data_t* p__parent, nt_mdt_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_data = nullptr;
    _read();
}

void nt_mdt_t::uuid_t::_read() {
    m_data = std::unique_ptr<std::vector<uint8_t>>(new std::vector<uint8_t>());
    const int l_data = 16;
    for (int i = 0; i < l_data; i++) {
        m_data->push_back(std::move(m__io->read_u1()));
    }
}

nt_mdt_t::uuid_t::~uuid_t() {
    _clean_up();
}

void nt_mdt_t::uuid_t::_clean_up() {
}

nt_mdt_t::version_t::version_t(kaitai::kstream* p__io, nt_mdt_t::frame_t::frame_main_t* p__parent, nt_mdt_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void nt_mdt_t::version_t::_read() {
    m_minor = m__io->read_u1();
    m_major = m__io->read_u1();
}

nt_mdt_t::version_t::~version_t() {
    _clean_up();
}

void nt_mdt_t::version_t::_clean_up() {
}

nt_mdt_t::xml_t::xml_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, nt_mdt_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void nt_mdt_t::xml_t::_read() {
    m_xml_len = m__io->read_u4le();
    m_xml = kaitai::kstream::bytes_to_str(m__io->read_bytes(xml_len()), "UTF-16LE");
}

nt_mdt_t::xml_t::~xml_t() {
    _clean_up();
}

void nt_mdt_t::xml_t::_clean_up() {
}
