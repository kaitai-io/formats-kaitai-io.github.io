// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "icc_4.h"
#include "kaitai/exceptions.h"

icc_4_t::icc_4_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root ? p__root : this;
    m_header = nullptr;
    m_tag_table = nullptr;
    _read();
}

void icc_4_t::_read() {
    m_header = std::unique_ptr<profile_header_t>(new profile_header_t(m__io, this, m__root));
    m_tag_table = std::unique_ptr<tag_table_t>(new tag_table_t(m__io, this, m__root));
}

icc_4_t::~icc_4_t() {
    _clean_up();
}

void icc_4_t::_clean_up() {
}

icc_4_t::date_time_number_t::date_time_number_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void icc_4_t::date_time_number_t::_read() {
    m_year = m__io->read_u2be();
    m_month = m__io->read_u2be();
    m_day = m__io->read_u2be();
    m_hour = m__io->read_u2be();
    m_minute = m__io->read_u2be();
    m_second = m__io->read_u2be();
}

icc_4_t::date_time_number_t::~date_time_number_t() {
    _clean_up();
}

void icc_4_t::date_time_number_t::_clean_up() {
}
const std::set<icc_4_t::device_attributes_t::device_attributes_colour_or_black_and_white_media_t> icc_4_t::device_attributes_t::_values_device_attributes_colour_or_black_and_white_media_t{
    icc_4_t::device_attributes_t::DEVICE_ATTRIBUTES_COLOUR_OR_BLACK_AND_WHITE_MEDIA_COLOUR_MEDIA,
    icc_4_t::device_attributes_t::DEVICE_ATTRIBUTES_COLOUR_OR_BLACK_AND_WHITE_MEDIA_BLACK_AND_WHITE_MEDIA,
};
bool icc_4_t::device_attributes_t::_is_defined_device_attributes_colour_or_black_and_white_media_t(icc_4_t::device_attributes_t::device_attributes_colour_or_black_and_white_media_t v) {
    return icc_4_t::device_attributes_t::_values_device_attributes_colour_or_black_and_white_media_t.find(v) != icc_4_t::device_attributes_t::_values_device_attributes_colour_or_black_and_white_media_t.end();
}
const std::set<icc_4_t::device_attributes_t::device_attributes_glossy_or_matte_t> icc_4_t::device_attributes_t::_values_device_attributes_glossy_or_matte_t{
    icc_4_t::device_attributes_t::DEVICE_ATTRIBUTES_GLOSSY_OR_MATTE_GLOSSY,
    icc_4_t::device_attributes_t::DEVICE_ATTRIBUTES_GLOSSY_OR_MATTE_MATTE,
};
bool icc_4_t::device_attributes_t::_is_defined_device_attributes_glossy_or_matte_t(icc_4_t::device_attributes_t::device_attributes_glossy_or_matte_t v) {
    return icc_4_t::device_attributes_t::_values_device_attributes_glossy_or_matte_t.find(v) != icc_4_t::device_attributes_t::_values_device_attributes_glossy_or_matte_t.end();
}
const std::set<icc_4_t::device_attributes_t::device_attributes_positive_or_negative_media_polarity_t> icc_4_t::device_attributes_t::_values_device_attributes_positive_or_negative_media_polarity_t{
    icc_4_t::device_attributes_t::DEVICE_ATTRIBUTES_POSITIVE_OR_NEGATIVE_MEDIA_POLARITY_POSITIVE_MEDIA_POLARITY,
    icc_4_t::device_attributes_t::DEVICE_ATTRIBUTES_POSITIVE_OR_NEGATIVE_MEDIA_POLARITY_NEGATIVE_MEDIA_POLARITY,
};
bool icc_4_t::device_attributes_t::_is_defined_device_attributes_positive_or_negative_media_polarity_t(icc_4_t::device_attributes_t::device_attributes_positive_or_negative_media_polarity_t v) {
    return icc_4_t::device_attributes_t::_values_device_attributes_positive_or_negative_media_polarity_t.find(v) != icc_4_t::device_attributes_t::_values_device_attributes_positive_or_negative_media_polarity_t.end();
}
const std::set<icc_4_t::device_attributes_t::device_attributes_reflective_or_transparency_t> icc_4_t::device_attributes_t::_values_device_attributes_reflective_or_transparency_t{
    icc_4_t::device_attributes_t::DEVICE_ATTRIBUTES_REFLECTIVE_OR_TRANSPARENCY_REFLECTIVE,
    icc_4_t::device_attributes_t::DEVICE_ATTRIBUTES_REFLECTIVE_OR_TRANSPARENCY_TRANSPARENCY,
};
bool icc_4_t::device_attributes_t::_is_defined_device_attributes_reflective_or_transparency_t(icc_4_t::device_attributes_t::device_attributes_reflective_or_transparency_t v) {
    return icc_4_t::device_attributes_t::_values_device_attributes_reflective_or_transparency_t.find(v) != icc_4_t::device_attributes_t::_values_device_attributes_reflective_or_transparency_t.end();
}

icc_4_t::device_attributes_t::device_attributes_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void icc_4_t::device_attributes_t::_read() {
    m_reflective_or_transparency = static_cast<icc_4_t::device_attributes_t::device_attributes_reflective_or_transparency_t>(m__io->read_bits_int_be(1));
    m_glossy_or_matte = static_cast<icc_4_t::device_attributes_t::device_attributes_glossy_or_matte_t>(m__io->read_bits_int_be(1));
    m_positive_or_negative_media_polarity = static_cast<icc_4_t::device_attributes_t::device_attributes_positive_or_negative_media_polarity_t>(m__io->read_bits_int_be(1));
    m_colour_or_black_and_white_media = static_cast<icc_4_t::device_attributes_t::device_attributes_colour_or_black_and_white_media_t>(m__io->read_bits_int_be(1));
    m_reserved = m__io->read_bits_int_be(28);
    m_vendor_specific = m__io->read_bits_int_be(32);
}

icc_4_t::device_attributes_t::~device_attributes_t() {
    _clean_up();
}

void icc_4_t::device_attributes_t::_clean_up() {
}
const std::set<icc_4_t::device_manufacturer_t::device_manufacturers_t> icc_4_t::device_manufacturer_t::_values_device_manufacturers_t{
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_ERDT_SYSTEMS_GMBH_AND_CO_KG,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_AAMAZING_TECHNOLOGIES_INC,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_ACER_PERIPHERALS,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_ACOLYTE_COLOR_RESEARCH,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_ACTIX_SYTEMS_INC,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_ADARA_TECHNOLOGY_INC,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_ADOBE_SYSTEMS_INCORPORATED,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_ADI_SYSTEMS_INC,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_AGFA_GRAPHICS_NV,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_ALPS_ELECTRIC_USA_INC,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_ALPS_ELECTRIC_USA_INC_2,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_ALWAN_COLOR_EXPERTISE,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_AMIABLE_TECHNOLOGIES_INC,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_AOC_INTERNATIONAL_USA_LTD,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_APAGO,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_APPLE_COMPUTER_INC,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_AST,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_ATANDT_COMPUTER_SYSTEMS,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_BARBIERI_ELECTRONIC,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_BARCO_NV,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_BREAKPOINT_PTY_LIMITED,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_BROTHER_INDUSTRIES_LTD,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_BULL,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_BUS_COMPUTER_SYSTEMS,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_C_ITOH,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_INTEL_CORPORATION,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_CANON_INC_CANON_DEVELOPMENT_AMERICAS_INC,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_CARROLL_TOUCH,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_CASIO_COMPUTER_CO_LTD,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_COLORBUS_PL,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_CROSSFIELD,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_CROSSFIELD_2,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_CGS_PUBLISHING_TECHNOLOGIES_INTERNATIONAL_GMBH,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_ROCHESTER_ROBOTICS,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_COLOUR_IMAGING_GROUP_LONDON,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_CITIZEN,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_CANDELA_LTD,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_COLOR_IQ,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_CHROMACO_INC,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_CHROMIX,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_COLORGRAPHIC_COMMUNICATIONS_CORPORATION,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_COMPAQ_COMPUTER_CORPORATION,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_COMPEQ_USA_FOCUS_TECHNOLOGY,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_CONRAC_DISPLAY_PRODUCTS,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_CORDATA_TECHNOLOGIES_INC,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_COMPAQ_COMPUTER_CORPORATION_2,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_COLORPRO,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_CORNERSTONE,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_CTX_INTERNATIONAL_INC,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_COLORVISION,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_FUJITSU_LABORATORIES_LTD,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_DARIUS_TECHNOLOGY_LTD,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_DATAPRODUCTS,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_DRY_CREEK_PHOTO,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_DIGITAL_CONTENTS_RESOURCE_CENTER_CHUNG_ANG_UNIVERSITY,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_DELL_COMPUTER_CORPORATION,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_DAINIPPON_INK_AND_CHEMICALS,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_DICONIX,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_DIGITAL,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_DIGITAL_LIGHT_AND_COLOR,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_DOPPELGANGER_LLC,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_DAINIPPON_SCREEN,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_DOOSOL,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_DUPONT,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_EPSON,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_ESKO_GRAPHICS,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_ELECTRONICS_AND_TELECOMMUNICATIONS_RESEARCH_INSTITUTE,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_EVEREX_SYSTEMS_INC,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_EXACTCODE_GMBH,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_EIZO_NANAO_CORPORATION,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_FALCO_DATA_PRODUCTS_INC,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_FUJI_PHOTO_FILM_COLTD,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_FUJIFILM_ELECTRONIC_IMAGING_LTD,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_FNORD_SOFTWARE,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_FORA_INC,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_FOREFRONT_TECHNOLOGY_CORPORATION,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_FUJITSU,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_WAYTECH_DEVELOPMENT_INC,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_FUJITSU_2,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_FUJI_XEROX_CO_LTD,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_GCC_TECHNOLOGIES_INC,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_GLOBAL_GRAPHICS_SOFTWARE_LIMITED,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_GRETAGMACBETH,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_GMG_GMBH_AND_CO_KG,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_GOLDSTAR_TECHNOLOGY_INC,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_GIANTPRINT_PTY_LTD,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_GRETAGMACBETH_2,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_WAYTECH_DEVELOPMENT_INC_2,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_SONY_CORPORATION,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_HCI,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_HEIDELBERGER_DRUCKMASCHINEN_AG,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_HERMES,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_HITACHI_AMERICA_LTD,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_HEWLETT_PACKARD,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_HITACHI_LTD,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_HITI_DIGITAL_INC,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_IBM_CORPORATION,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_SCITEX_CORPORATION_LTD,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_HEWLETT_PACKARD_2,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_IIYAMA_NORTH_AMERICA_INC,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_IKEGAMI_ELECTRONICS_INC,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_IMAGE_SYSTEMS_CORPORATION,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_INGRAM_MICRO_INC,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_INTEL_CORPORATION_2,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_INTL,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_INTRA_ELECTRONICS_USA_INC,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_IOCOMM_INTERNATIONAL_TECHNOLOGY_CORPORATION,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_INFOPRINT_SOLUTIONS_COMPANY,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_SCITEX_CORPORATION_LTD_3,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_ICHIKAWA_SOFT_LABORATORY,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_ITNL,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_IVM,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_IWATSU_ELECTRIC_CO_LTD,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_SCITEX_CORPORATION_LTD_2,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_INCA_DIGITAL_PRINTERS_LTD,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_SCITEX_CORPORATION_LTD_4,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_JETSOFT_DEVELOPMENT,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_JVC_INFORMATION_PRODUCTS_CO,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_SCITEX_CORPORATION_LTD_6,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_KFC_COMPUTEK_COMPONENTS_CORPORATION,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_KLH_COMPUTERS,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_KONICA_MINOLTA_HOLDINGS_INC,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_KONICA_CORPORATION,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_KODAK,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_KYOCERA,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_SCITEX_CORPORATION_LTD_7,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_LEICA_CAMERA_AG,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_LEEDS_COLOUR,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_LEFT_DAKOTA,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_LEADING_TECHNOLOGY_INC,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_LEXMARK_INTERNATIONAL_INC,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_LINK_COMPUTER_INC,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_LINOTRONIC,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_LITE_ON_INC,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_MAG_COMPUTRONIC_USA_INC,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_MAG_INNOVISION_INC,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_MANNESMANN,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_MICRON_TECHNOLOGY_INC,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_MICROTEK,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_MICROVITEC_INC,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_MINOLTA,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_MITSUBISHI_ELECTRONICS_AMERICA_INC,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_MITSUBA_CORPORATION,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_MINOLTA_2,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_MODGRAPH_INC,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_MONITRONIX_INC,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_MONACO_SYSTEMS_INC,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_MORSE_TECHNOLOGY_INC,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_MOTIVE_SYSTEMS,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_MICROSOFT_CORPORATION,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_MUTOH_INDUSTRIES_LTD,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_MITSUBISHI_ELECTRIC_CORPORATION_KYOTO_WORKS,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_NANAO_USA_CORPORATION,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_NEC_CORPORATION,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_NEXPRESS_SOLUTIONS_LLC,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_NISSEI_SANGYO_AMERICA_LTD,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_NIKON_CORPORATION,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_OCE_TECHNOLOGIES_BV,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_OCECOLOR,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_OKI,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_OKIDATA,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_OKIDATA_2,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_OLIVETTI,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_OLYMPUS_OPTICAL_CO_LTD,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_ONYX_GRAPHICS,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_OPTIQUEST,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_PACKARD_BELL,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_MATSUSHITA_ELECTRIC_INDUSTRIAL_CO_LTD,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_PANTONE_INC,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_PACKARD_BELL_2,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_PFU_LIMITED,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_PHILIPS_CONSUMER_ELECTRONICS_CO,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_HOYA_CORPORATION_PENTAX_IMAGING_SYSTEMS_DIVISION,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_PHASE_ONE_A_S,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_PREMIER_COMPUTER_INNOVATIONS,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_PRINCETON_GRAPHIC_SYSTEMS,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_PRINCETON_PUBLISHING_LABS,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_QLUX,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_QMS_INC,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_QPCARD_AB,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_QUADLASER,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_QUME_CORPORATION,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_RADIUS_INC,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_INTEGRATED_COLOR_SOLUTIONS_INC_2,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_ROLAND_DG_CORPORATION,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_REDMS_GROUP_INC,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_RELISYS,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_ROLF_GIERLING_MULTITOOLS,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_RICOH_CORPORATION,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_EDMUND_RONALD,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_ROYAL,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_RICOH_PRINTING_SYSTEMSLTD,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_ROYAL_INFORMATION_ELECTRONICS_CO_LTD,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_SAMPO_CORPORATION_OF_AMERICA,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_SAMSUNG_INC,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_JAIME_SANTANA_POMARES,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_SCITEX_CORPORATION_LTD_9,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_DAINIPPON_SCREEN_3,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_SCITEX_CORPORATION_LTD_12,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_SAMSUNG_ELECTRONICS_COLTD,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_SEIKO_INSTRUMENTS_USA_INC,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_SEIKOSHA,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_SCANGUYCOM,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_SHARP_LABORATORIES,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_INTERNATIONAL_COLOR_CONSORTIUM,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_SONY_CORPORATION_2,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_SPECTRACAL,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_STAR,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_SAMPO_TECHNOLOGY_CORPORATION,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_SCITEX_CORPORATION_LTD_10,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_SCITEX_CORPORATION_LTD_13,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_SONY_CORPORATION_3,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_TALON_TECHNOLOGY_CORPORATION,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_TANDY,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_TATUNG_CO_OF_AMERICA_INC,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_TAXAN_AMERICA_INC,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_TOKYO_DENSHI_SEKEI_KK,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_TECO_INFORMATION_SYSTEMS_INC,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_TEGRA,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_TEKTRONIX_INC,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_TEXAS_INSTRUMENTS,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_TYPEMAKER_LTD,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_TOSHIBA_CORP,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_TOSHIBA_INC,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_TOTOKU_ELECTRIC_CO_LTD,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_TRIUMPH,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_TOSHIBA_TEC_CORPORATION,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_TTX_COMPUTER_PRODUCTS_INC,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_TVM_PROFESSIONAL_MONITOR_CORPORATION,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_TW_CASPER_CORPORATION,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_ULEAD_SYSTEMS,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_UNISYS,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_UTZ_FEHLAU_AND_SOHN,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_VARITYPER,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_VIEWSONIC,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_VISUAL_COMMUNICATION,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_WANG,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_WILBUR_IMAGING,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_WARE_TO_GO,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_WYSE_TECHNOLOGY,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_XEROX_CORPORATION,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_X_RITE,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_LAVANYAS_TEST_COMPANY,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_ZORAN_CORPORATION,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_ZEBRA_TECHNOLOGIES_INC,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_BASICCOLOR_GMBH,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_BERGDESIGN_INCORPORATED,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_INTEGRATED_COLOR_SOLUTIONS_INC,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_MACDERMID_COLORSPAN_INC,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_DAINIPPON_SCREEN_2,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_DUPONT_2,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_FUJIFILM_ELECTRONIC_IMAGING_LTD_2,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_FLUXDATA_CORPORATION,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_SCITEX_CORPORATION_LTD_5,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_SCITEX_CORPORATION_LTD_8,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_ERDT_SYSTEMS_GMBH_AND_CO_KG_2,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_MEDIGRAPH_GMBH,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_QUBYX_SARL,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_SCITEX_CORPORATION_LTD_11,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_DAINIPPON_SCREEN_4,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_SCITEX_CORPORATION_LTD_14,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_SIWI_GRAFIKA_CORPORATION,
    icc_4_t::device_manufacturer_t::DEVICE_MANUFACTURERS_YXYMASTER_GMBH,
};
bool icc_4_t::device_manufacturer_t::_is_defined_device_manufacturers_t(icc_4_t::device_manufacturer_t::device_manufacturers_t v) {
    return icc_4_t::device_manufacturer_t::_values_device_manufacturers_t.find(v) != icc_4_t::device_manufacturer_t::_values_device_manufacturers_t.end();
}

icc_4_t::device_manufacturer_t::device_manufacturer_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void icc_4_t::device_manufacturer_t::_read() {
    m_device_manufacturer = static_cast<icc_4_t::device_manufacturer_t::device_manufacturers_t>(m__io->read_u4be());
}

icc_4_t::device_manufacturer_t::~device_manufacturer_t() {
    _clean_up();
}

void icc_4_t::device_manufacturer_t::_clean_up() {
}

icc_4_t::position_number_t::position_number_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void icc_4_t::position_number_t::_read() {
    m_offset_to_data_element = m__io->read_u4be();
    m_size_of_data_element = m__io->read_u4be();
}

icc_4_t::position_number_t::~position_number_t() {
    _clean_up();
}

void icc_4_t::position_number_t::_clean_up() {
}
const std::set<icc_4_t::profile_header_t::cmm_signatures_t> icc_4_t::profile_header_t::_values_cmm_signatures_t{
    icc_4_t::profile_header_t::CMM_SIGNATURES_THE_IMAGING_FACTORY_CMM,
    icc_4_t::profile_header_t::CMM_SIGNATURES_AGFA_CMM,
    icc_4_t::profile_header_t::CMM_SIGNATURES_ADOBE_CMM,
    icc_4_t::profile_header_t::CMM_SIGNATURES_COLOR_GEAR_CMM,
    icc_4_t::profile_header_t::CMM_SIGNATURES_DEMOICCMAX_CMM,
    icc_4_t::profile_header_t::CMM_SIGNATURES_LOGOSYNC_CMM,
    icc_4_t::profile_header_t::CMM_SIGNATURES_EFI_CMM,
    icc_4_t::profile_header_t::CMM_SIGNATURES_EXACT_SCAN_CMM,
    icc_4_t::profile_header_t::CMM_SIGNATURES_FUJI_FILM_CMM,
    icc_4_t::profile_header_t::CMM_SIGNATURES_HARLEQUIN_RIP_CMM,
    icc_4_t::profile_header_t::CMM_SIGNATURES_HEIDELBERG_CMM,
    icc_4_t::profile_header_t::CMM_SIGNATURES_KODAK_CMM,
    icc_4_t::profile_header_t::CMM_SIGNATURES_KONICA_MINOLTA_CMM,
    icc_4_t::profile_header_t::CMM_SIGNATURES_ONYX_GRAPHICS_CMM,
    icc_4_t::profile_header_t::CMM_SIGNATURES_DEVICE_LINK_CMM,
    icc_4_t::profile_header_t::CMM_SIGNATURES_REFICCMAX_CMM,
    icc_4_t::profile_header_t::CMM_SIGNATURES_SAMPLE_ICC_CMM,
    icc_4_t::profile_header_t::CMM_SIGNATURES_MUTOH_CMM,
    icc_4_t::profile_header_t::CMM_SIGNATURES_TOSHIBA_CMM,
    icc_4_t::profile_header_t::CMM_SIGNATURES_COLOR_GEAR_CMM_LITE,
    icc_4_t::profile_header_t::CMM_SIGNATURES_COLOR_GEAR_CMM_C,
    icc_4_t::profile_header_t::CMM_SIGNATURES_WINDOWS_COLOR_SYSTEM_CMM,
    icc_4_t::profile_header_t::CMM_SIGNATURES_WARE_TO_GO_CMM,
    icc_4_t::profile_header_t::CMM_SIGNATURES_APPLE_CMM,
    icc_4_t::profile_header_t::CMM_SIGNATURES_ARGYLL_CMS_CMM,
    icc_4_t::profile_header_t::CMM_SIGNATURES_LITTLE_CMS_CMM,
    icc_4_t::profile_header_t::CMM_SIGNATURES_VIVO_CMM,
    icc_4_t::profile_header_t::CMM_SIGNATURES_ZORAN_CMM,
};
bool icc_4_t::profile_header_t::_is_defined_cmm_signatures_t(icc_4_t::profile_header_t::cmm_signatures_t v) {
    return icc_4_t::profile_header_t::_values_cmm_signatures_t.find(v) != icc_4_t::profile_header_t::_values_cmm_signatures_t.end();
}
const std::set<icc_4_t::profile_header_t::data_colour_spaces_t> icc_4_t::profile_header_t::_values_data_colour_spaces_t{
    icc_4_t::profile_header_t::DATA_COLOUR_SPACES_TWO_COLOUR,
    icc_4_t::profile_header_t::DATA_COLOUR_SPACES_THREE_COLOUR,
    icc_4_t::profile_header_t::DATA_COLOUR_SPACES_FOUR_COLOUR,
    icc_4_t::profile_header_t::DATA_COLOUR_SPACES_FIVE_COLOUR,
    icc_4_t::profile_header_t::DATA_COLOUR_SPACES_SIX_COLOUR,
    icc_4_t::profile_header_t::DATA_COLOUR_SPACES_SEVEN_COLOUR,
    icc_4_t::profile_header_t::DATA_COLOUR_SPACES_EIGHT_COLOUR,
    icc_4_t::profile_header_t::DATA_COLOUR_SPACES_NINE_COLOUR,
    icc_4_t::profile_header_t::DATA_COLOUR_SPACES_TEN_COLOUR,
    icc_4_t::profile_header_t::DATA_COLOUR_SPACES_ELEVEN_COLOUR,
    icc_4_t::profile_header_t::DATA_COLOUR_SPACES_TWELVE_COLOUR,
    icc_4_t::profile_header_t::DATA_COLOUR_SPACES_CMY,
    icc_4_t::profile_header_t::DATA_COLOUR_SPACES_CMYK,
    icc_4_t::profile_header_t::DATA_COLOUR_SPACES_THIRTEEN_COLOUR,
    icc_4_t::profile_header_t::DATA_COLOUR_SPACES_FOURTEEN_COLOUR,
    icc_4_t::profile_header_t::DATA_COLOUR_SPACES_FIFTEEN_COLOUR,
    icc_4_t::profile_header_t::DATA_COLOUR_SPACES_GRAY,
    icc_4_t::profile_header_t::DATA_COLOUR_SPACES_HLS,
    icc_4_t::profile_header_t::DATA_COLOUR_SPACES_HSV,
    icc_4_t::profile_header_t::DATA_COLOUR_SPACES_CIELAB_OR_PCSLAB,
    icc_4_t::profile_header_t::DATA_COLOUR_SPACES_CIELUV,
    icc_4_t::profile_header_t::DATA_COLOUR_SPACES_RGB,
    icc_4_t::profile_header_t::DATA_COLOUR_SPACES_NCIEXYZ_OR_PCSXYZ,
    icc_4_t::profile_header_t::DATA_COLOUR_SPACES_YCBCR,
    icc_4_t::profile_header_t::DATA_COLOUR_SPACES_CIEYXY,
};
bool icc_4_t::profile_header_t::_is_defined_data_colour_spaces_t(icc_4_t::profile_header_t::data_colour_spaces_t v) {
    return icc_4_t::profile_header_t::_values_data_colour_spaces_t.find(v) != icc_4_t::profile_header_t::_values_data_colour_spaces_t.end();
}
const std::set<icc_4_t::profile_header_t::primary_platforms_t> icc_4_t::profile_header_t::_values_primary_platforms_t{
    icc_4_t::profile_header_t::PRIMARY_PLATFORMS_APPLE_COMPUTER_INC,
    icc_4_t::profile_header_t::PRIMARY_PLATFORMS_MICROSOFT_CORPORATION,
    icc_4_t::profile_header_t::PRIMARY_PLATFORMS_SILICON_GRAPHICS_INC,
    icc_4_t::profile_header_t::PRIMARY_PLATFORMS_SUN_MICROSYSTEMS,
};
bool icc_4_t::profile_header_t::_is_defined_primary_platforms_t(icc_4_t::profile_header_t::primary_platforms_t v) {
    return icc_4_t::profile_header_t::_values_primary_platforms_t.find(v) != icc_4_t::profile_header_t::_values_primary_platforms_t.end();
}
const std::set<icc_4_t::profile_header_t::profile_classes_t> icc_4_t::profile_header_t::_values_profile_classes_t{
    icc_4_t::profile_header_t::PROFILE_CLASSES_ABSTRACT_PROFILE,
    icc_4_t::profile_header_t::PROFILE_CLASSES_DEVICE_LINK_PROFILE,
    icc_4_t::profile_header_t::PROFILE_CLASSES_DISPLAY_DEVICE_PROFILE,
    icc_4_t::profile_header_t::PROFILE_CLASSES_NAMED_COLOR_PROFILE,
    icc_4_t::profile_header_t::PROFILE_CLASSES_OUTPUT_DEVICE_PROFILE,
    icc_4_t::profile_header_t::PROFILE_CLASSES_INPUT_DEVICE_PROFILE,
    icc_4_t::profile_header_t::PROFILE_CLASSES_COLOR_SPACE_PROFILE,
};
bool icc_4_t::profile_header_t::_is_defined_profile_classes_t(icc_4_t::profile_header_t::profile_classes_t v) {
    return icc_4_t::profile_header_t::_values_profile_classes_t.find(v) != icc_4_t::profile_header_t::_values_profile_classes_t.end();
}
const std::set<icc_4_t::profile_header_t::rendering_intents_t> icc_4_t::profile_header_t::_values_rendering_intents_t{
    icc_4_t::profile_header_t::RENDERING_INTENTS_PERCEPTUAL,
    icc_4_t::profile_header_t::RENDERING_INTENTS_MEDIA_RELATIVE_COLORIMETRIC,
    icc_4_t::profile_header_t::RENDERING_INTENTS_SATURATION,
    icc_4_t::profile_header_t::RENDERING_INTENTS_ICC_ABSOLUTE_COLORIMETRIC,
};
bool icc_4_t::profile_header_t::_is_defined_rendering_intents_t(icc_4_t::profile_header_t::rendering_intents_t v) {
    return icc_4_t::profile_header_t::_values_rendering_intents_t.find(v) != icc_4_t::profile_header_t::_values_rendering_intents_t.end();
}

icc_4_t::profile_header_t::profile_header_t(kaitai::kstream* p__io, icc_4_t* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_version = nullptr;
    m_creation_date_time = nullptr;
    m_profile_flags = nullptr;
    m_device_manufacturer = nullptr;
    m_device_attributes = nullptr;
    m_nciexyz_values_of_illuminant_of_pcs = nullptr;
    m_creator = nullptr;
    _read();
}

void icc_4_t::profile_header_t::_read() {
    m_size = m__io->read_u4be();
    m_preferred_cmm_type = static_cast<icc_4_t::profile_header_t::cmm_signatures_t>(m__io->read_u4be());
    m_version = std::unique_ptr<version_field_t>(new version_field_t(m__io, this, m__root));
    m_device_class = static_cast<icc_4_t::profile_header_t::profile_classes_t>(m__io->read_u4be());
    m_color_space = static_cast<icc_4_t::profile_header_t::data_colour_spaces_t>(m__io->read_u4be());
    m_pcs = kaitai::kstream::bytes_to_str(m__io->read_bytes(4), "ASCII");
    m_creation_date_time = std::unique_ptr<date_time_number_t>(new date_time_number_t(m__io, this, m__root));
    m_file_signature = m__io->read_bytes(4);
    if (!(m_file_signature == std::string("\x61\x63\x73\x70", 4))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x61\x63\x73\x70", 4), m_file_signature, m__io, std::string("/types/profile_header/seq/7"));
    }
    m_primary_platform = static_cast<icc_4_t::profile_header_t::primary_platforms_t>(m__io->read_u4be());
    m_profile_flags = std::unique_ptr<profile_flags_t>(new profile_flags_t(m__io, this, m__root));
    m_device_manufacturer = std::unique_ptr<device_manufacturer_t>(new device_manufacturer_t(m__io, this, m__root));
    m_device_model = kaitai::kstream::bytes_to_str(m__io->read_bytes(4), "ASCII");
    m_device_attributes = std::unique_ptr<device_attributes_t>(new device_attributes_t(m__io, this, m__root));
    m_rendering_intent = static_cast<icc_4_t::profile_header_t::rendering_intents_t>(m__io->read_u4be());
    m_nciexyz_values_of_illuminant_of_pcs = std::unique_ptr<xyz_number_t>(new xyz_number_t(m__io, this, m__root));
    m_creator = std::unique_ptr<device_manufacturer_t>(new device_manufacturer_t(m__io, this, m__root));
    m_identifier = m__io->read_bytes(16);
    m_reserved_data = m__io->read_bytes(28);
}

icc_4_t::profile_header_t::~profile_header_t() {
    _clean_up();
}

void icc_4_t::profile_header_t::_clean_up() {
}

icc_4_t::profile_header_t::profile_flags_t::profile_flags_t(kaitai::kstream* p__io, icc_4_t::profile_header_t* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void icc_4_t::profile_header_t::profile_flags_t::_read() {
    m_embedded_profile = m__io->read_bits_int_be(1);
    m_profile_can_be_used_independently_of_embedded_colour_data = m__io->read_bits_int_be(1);
    m_other_flags = m__io->read_bits_int_be(30);
}

icc_4_t::profile_header_t::profile_flags_t::~profile_flags_t() {
    _clean_up();
}

void icc_4_t::profile_header_t::profile_flags_t::_clean_up() {
}

icc_4_t::profile_header_t::version_field_t::version_field_t(kaitai::kstream* p__io, icc_4_t::profile_header_t* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void icc_4_t::profile_header_t::version_field_t::_read() {
    m_major = m__io->read_bytes(1);
    if (!(m_major == std::string("\x04", 1))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x04", 1), m_major, m__io, std::string("/types/profile_header/types/version_field/seq/0"));
    }
    m_minor = m__io->read_bits_int_be(4);
    m_bug_fix_level = m__io->read_bits_int_be(4);
    m__io->align_to_byte();
    m_reserved = m__io->read_bytes(2);
    if (!(m_reserved == std::string("\x00\x00", 2))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x00\x00", 2), m_reserved, m__io, std::string("/types/profile_header/types/version_field/seq/3"));
    }
}

icc_4_t::profile_header_t::version_field_t::~version_field_t() {
    _clean_up();
}

void icc_4_t::profile_header_t::version_field_t::_clean_up() {
}

icc_4_t::response_16_number_t::response_16_number_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_measurement_value = nullptr;
    _read();
}

void icc_4_t::response_16_number_t::_read() {
    m_number = m__io->read_u4be();
    m_reserved = m__io->read_bytes(2);
    if (!(m_reserved == std::string("\x00\x00", 2))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x00\x00", 2), m_reserved, m__io, std::string("/types/response_16_number/seq/1"));
    }
    m_measurement_value = std::unique_ptr<s_15_fixed_16_number_t>(new s_15_fixed_16_number_t(m__io, this, m__root));
}

icc_4_t::response_16_number_t::~response_16_number_t() {
    _clean_up();
}

void icc_4_t::response_16_number_t::_clean_up() {
}

icc_4_t::s_15_fixed_16_number_t::s_15_fixed_16_number_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void icc_4_t::s_15_fixed_16_number_t::_read() {
    m_number = m__io->read_bytes(4);
}

icc_4_t::s_15_fixed_16_number_t::~s_15_fixed_16_number_t() {
    _clean_up();
}

void icc_4_t::s_15_fixed_16_number_t::_clean_up() {
}
const std::set<icc_4_t::standard_illuminant_encoding_t::standard_illuminant_encodings_t> icc_4_t::standard_illuminant_encoding_t::_values_standard_illuminant_encodings_t{
    icc_4_t::standard_illuminant_encoding_t::STANDARD_ILLUMINANT_ENCODINGS_UNKNOWN,
    icc_4_t::standard_illuminant_encoding_t::STANDARD_ILLUMINANT_ENCODINGS_D50,
    icc_4_t::standard_illuminant_encoding_t::STANDARD_ILLUMINANT_ENCODINGS_D65,
    icc_4_t::standard_illuminant_encoding_t::STANDARD_ILLUMINANT_ENCODINGS_D93,
    icc_4_t::standard_illuminant_encoding_t::STANDARD_ILLUMINANT_ENCODINGS_F2,
    icc_4_t::standard_illuminant_encoding_t::STANDARD_ILLUMINANT_ENCODINGS_D55,
    icc_4_t::standard_illuminant_encoding_t::STANDARD_ILLUMINANT_ENCODINGS_A,
    icc_4_t::standard_illuminant_encoding_t::STANDARD_ILLUMINANT_ENCODINGS_EQUI_POWER,
    icc_4_t::standard_illuminant_encoding_t::STANDARD_ILLUMINANT_ENCODINGS_F8,
};
bool icc_4_t::standard_illuminant_encoding_t::_is_defined_standard_illuminant_encodings_t(icc_4_t::standard_illuminant_encoding_t::standard_illuminant_encodings_t v) {
    return icc_4_t::standard_illuminant_encoding_t::_values_standard_illuminant_encodings_t.find(v) != icc_4_t::standard_illuminant_encoding_t::_values_standard_illuminant_encodings_t.end();
}

icc_4_t::standard_illuminant_encoding_t::standard_illuminant_encoding_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void icc_4_t::standard_illuminant_encoding_t::_read() {
    m_standard_illuminant_encoding = static_cast<icc_4_t::standard_illuminant_encoding_t::standard_illuminant_encodings_t>(m__io->read_u4be());
}

icc_4_t::standard_illuminant_encoding_t::~standard_illuminant_encoding_t() {
    _clean_up();
}

void icc_4_t::standard_illuminant_encoding_t::_clean_up() {
}

icc_4_t::tag_table_t::tag_table_t(kaitai::kstream* p__io, icc_4_t* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_tags = nullptr;
    _read();
}

void icc_4_t::tag_table_t::_read() {
    m_tag_count = m__io->read_u4be();
    m_tags = std::unique_ptr<std::vector<std::unique_ptr<tag_definition_t>>>(new std::vector<std::unique_ptr<tag_definition_t>>());
    const int l_tags = tag_count();
    for (int i = 0; i < l_tags; i++) {
        m_tags->push_back(std::move(std::unique_ptr<tag_definition_t>(new tag_definition_t(m__io, this, m__root))));
    }
}

icc_4_t::tag_table_t::~tag_table_t() {
    _clean_up();
}

void icc_4_t::tag_table_t::_clean_up() {
}
const std::set<icc_4_t::tag_table_t::tag_definition_t::multi_process_elements_types_t> icc_4_t::tag_table_t::tag_definition_t::_values_multi_process_elements_types_t{
    icc_4_t::tag_table_t::tag_definition_t::MULTI_PROCESS_ELEMENTS_TYPES_BACS_ELEMENT_TYPE,
    icc_4_t::tag_table_t::tag_definition_t::MULTI_PROCESS_ELEMENTS_TYPES_CLUT_ELEMENT_TYPE,
    icc_4_t::tag_table_t::tag_definition_t::MULTI_PROCESS_ELEMENTS_TYPES_ONE_DIMENSIONAL_CURVES_TYPE,
    icc_4_t::tag_table_t::tag_definition_t::MULTI_PROCESS_ELEMENTS_TYPES_EACS_ELEMENT_TYPE,
    icc_4_t::tag_table_t::tag_definition_t::MULTI_PROCESS_ELEMENTS_TYPES_MATRIX_ELEMENT_TYPE,
    icc_4_t::tag_table_t::tag_definition_t::MULTI_PROCESS_ELEMENTS_TYPES_CURVE_SET_ELEMENT_TABLE_TYPE,
    icc_4_t::tag_table_t::tag_definition_t::MULTI_PROCESS_ELEMENTS_TYPES_FORMULA_CURVE_SEGMENTS_TYPE,
    icc_4_t::tag_table_t::tag_definition_t::MULTI_PROCESS_ELEMENTS_TYPES_SAMPLED_CURVE_SEGMENT_TYPE,
};
bool icc_4_t::tag_table_t::tag_definition_t::_is_defined_multi_process_elements_types_t(icc_4_t::tag_table_t::tag_definition_t::multi_process_elements_types_t v) {
    return icc_4_t::tag_table_t::tag_definition_t::_values_multi_process_elements_types_t.find(v) != icc_4_t::tag_table_t::tag_definition_t::_values_multi_process_elements_types_t.end();
}
const std::set<icc_4_t::tag_table_t::tag_definition_t::tag_signatures_t> icc_4_t::tag_table_t::tag_definition_t::_values_tag_signatures_t{
    icc_4_t::tag_table_t::tag_definition_t::TAG_SIGNATURES_A_TO_B_0,
    icc_4_t::tag_table_t::tag_definition_t::TAG_SIGNATURES_A_TO_B_1,
    icc_4_t::tag_table_t::tag_definition_t::TAG_SIGNATURES_A_TO_B_2,
    icc_4_t::tag_table_t::tag_definition_t::TAG_SIGNATURES_B_TO_A_0,
    icc_4_t::tag_table_t::tag_definition_t::TAG_SIGNATURES_B_TO_A_1,
    icc_4_t::tag_table_t::tag_definition_t::TAG_SIGNATURES_B_TO_A_2,
    icc_4_t::tag_table_t::tag_definition_t::TAG_SIGNATURES_B_TO_D_0,
    icc_4_t::tag_table_t::tag_definition_t::TAG_SIGNATURES_B_TO_D_1,
    icc_4_t::tag_table_t::tag_definition_t::TAG_SIGNATURES_B_TO_D_2,
    icc_4_t::tag_table_t::tag_definition_t::TAG_SIGNATURES_B_TO_D_3,
    icc_4_t::tag_table_t::tag_definition_t::TAG_SIGNATURES_D_TO_B_0,
    icc_4_t::tag_table_t::tag_definition_t::TAG_SIGNATURES_D_TO_B_1,
    icc_4_t::tag_table_t::tag_definition_t::TAG_SIGNATURES_D_TO_B_2,
    icc_4_t::tag_table_t::tag_definition_t::TAG_SIGNATURES_D_TO_B_3,
    icc_4_t::tag_table_t::tag_definition_t::TAG_SIGNATURES_BLUE_TRC,
    icc_4_t::tag_table_t::tag_definition_t::TAG_SIGNATURES_BLUE_MATRIX_COLUMN,
    icc_4_t::tag_table_t::tag_definition_t::TAG_SIGNATURES_CALIBRATION_DATE_TIME,
    icc_4_t::tag_table_t::tag_definition_t::TAG_SIGNATURES_CHROMATIC_ADAPTATION,
    icc_4_t::tag_table_t::tag_definition_t::TAG_SIGNATURES_CHROMATICITY,
    icc_4_t::tag_table_t::tag_definition_t::TAG_SIGNATURES_COLORIMETRIC_INTENT_IMAGE_STATE,
    icc_4_t::tag_table_t::tag_definition_t::TAG_SIGNATURES_COLORANT_TABLE_OUT,
    icc_4_t::tag_table_t::tag_definition_t::TAG_SIGNATURES_COLORANT_ORDER,
    icc_4_t::tag_table_t::tag_definition_t::TAG_SIGNATURES_COLORANT_TABLE,
    icc_4_t::tag_table_t::tag_definition_t::TAG_SIGNATURES_COPYRIGHT,
    icc_4_t::tag_table_t::tag_definition_t::TAG_SIGNATURES_PROFILE_DESCRIPTION,
    icc_4_t::tag_table_t::tag_definition_t::TAG_SIGNATURES_DEVICE_MODEL_DESC,
    icc_4_t::tag_table_t::tag_definition_t::TAG_SIGNATURES_DEVICE_MFG_DESC,
    icc_4_t::tag_table_t::tag_definition_t::TAG_SIGNATURES_GREEN_TRC,
    icc_4_t::tag_table_t::tag_definition_t::TAG_SIGNATURES_GREEN_MATRIX_COLUMN,
    icc_4_t::tag_table_t::tag_definition_t::TAG_SIGNATURES_GAMUT,
    icc_4_t::tag_table_t::tag_definition_t::TAG_SIGNATURES_GRAY_TRC,
    icc_4_t::tag_table_t::tag_definition_t::TAG_SIGNATURES_LUMINANCE,
    icc_4_t::tag_table_t::tag_definition_t::TAG_SIGNATURES_MEASUREMENT,
    icc_4_t::tag_table_t::tag_definition_t::TAG_SIGNATURES_NAMED_COLOR_2,
    icc_4_t::tag_table_t::tag_definition_t::TAG_SIGNATURES_PREVIEW_0,
    icc_4_t::tag_table_t::tag_definition_t::TAG_SIGNATURES_PREVIEW_1,
    icc_4_t::tag_table_t::tag_definition_t::TAG_SIGNATURES_PREVIEW_2,
    icc_4_t::tag_table_t::tag_definition_t::TAG_SIGNATURES_PROFILE_SEQUENCE,
    icc_4_t::tag_table_t::tag_definition_t::TAG_SIGNATURES_PROFILE_SEQUENCE_IDENTIFIER,
    icc_4_t::tag_table_t::tag_definition_t::TAG_SIGNATURES_RED_TRC,
    icc_4_t::tag_table_t::tag_definition_t::TAG_SIGNATURES_RED_MATRIX_COLUMN,
    icc_4_t::tag_table_t::tag_definition_t::TAG_SIGNATURES_OUTPUT_RESPONSE,
    icc_4_t::tag_table_t::tag_definition_t::TAG_SIGNATURES_PERCEPTUAL_RENDERING_INTENT_GAMUT,
    icc_4_t::tag_table_t::tag_definition_t::TAG_SIGNATURES_SATURATION_RENDERING_INTENT_GAMUT,
    icc_4_t::tag_table_t::tag_definition_t::TAG_SIGNATURES_CHAR_TARGET,
    icc_4_t::tag_table_t::tag_definition_t::TAG_SIGNATURES_TECHNOLOGY,
    icc_4_t::tag_table_t::tag_definition_t::TAG_SIGNATURES_VIEWING_CONDITIONS,
    icc_4_t::tag_table_t::tag_definition_t::TAG_SIGNATURES_VIEWING_COND_DESC,
    icc_4_t::tag_table_t::tag_definition_t::TAG_SIGNATURES_MEDIA_WHITE_POINT,
};
bool icc_4_t::tag_table_t::tag_definition_t::_is_defined_tag_signatures_t(icc_4_t::tag_table_t::tag_definition_t::tag_signatures_t v) {
    return icc_4_t::tag_table_t::tag_definition_t::_values_tag_signatures_t.find(v) != icc_4_t::tag_table_t::tag_definition_t::_values_tag_signatures_t.end();
}
const std::set<icc_4_t::tag_table_t::tag_definition_t::tag_type_signatures_t> icc_4_t::tag_table_t::tag_definition_t::_values_tag_type_signatures_t{
    icc_4_t::tag_table_t::tag_definition_t::TAG_TYPE_SIGNATURES_XYZ_TYPE,
    icc_4_t::tag_table_t::tag_definition_t::TAG_TYPE_SIGNATURES_CHROMATICITY_TYPE,
    icc_4_t::tag_table_t::tag_definition_t::TAG_TYPE_SIGNATURES_COLORANT_ORDER_TYPE,
    icc_4_t::tag_table_t::tag_definition_t::TAG_TYPE_SIGNATURES_COLORANT_TABLE_TYPE,
    icc_4_t::tag_table_t::tag_definition_t::TAG_TYPE_SIGNATURES_CURVE_TYPE,
    icc_4_t::tag_table_t::tag_definition_t::TAG_TYPE_SIGNATURES_DATA_TYPE,
    icc_4_t::tag_table_t::tag_definition_t::TAG_TYPE_SIGNATURES_DATE_TIME_TYPE,
    icc_4_t::tag_table_t::tag_definition_t::TAG_TYPE_SIGNATURES_MULTI_FUNCTION_A_TO_B_TABLE_TYPE,
    icc_4_t::tag_table_t::tag_definition_t::TAG_TYPE_SIGNATURES_MULTI_FUNCTION_B_TO_A_TABLE_TYPE,
    icc_4_t::tag_table_t::tag_definition_t::TAG_TYPE_SIGNATURES_MEASUREMENT_TYPE,
    icc_4_t::tag_table_t::tag_definition_t::TAG_TYPE_SIGNATURES_MULTI_FUNCTION_TABLE_WITH_ONE_BYTE_PRECISION_TYPE,
    icc_4_t::tag_table_t::tag_definition_t::TAG_TYPE_SIGNATURES_MULTI_FUNCTION_TABLE_WITH_TWO_BYTE_PRECISION_TYPE,
    icc_4_t::tag_table_t::tag_definition_t::TAG_TYPE_SIGNATURES_MULTI_LOCALIZED_UNICODE_TYPE,
    icc_4_t::tag_table_t::tag_definition_t::TAG_TYPE_SIGNATURES_MULTI_PROCESS_ELEMENTS_TYPE,
    icc_4_t::tag_table_t::tag_definition_t::TAG_TYPE_SIGNATURES_NAMED_COLOR_2_TYPE,
    icc_4_t::tag_table_t::tag_definition_t::TAG_TYPE_SIGNATURES_PARAMETRIC_CURVE_TYPE,
    icc_4_t::tag_table_t::tag_definition_t::TAG_TYPE_SIGNATURES_PROFILE_SEQUENCE_DESC_TYPE,
    icc_4_t::tag_table_t::tag_definition_t::TAG_TYPE_SIGNATURES_PROFILE_SEQUENCE_IDENTIFIER_TYPE,
    icc_4_t::tag_table_t::tag_definition_t::TAG_TYPE_SIGNATURES_RESPONSE_CURVE_SET_16_TYPE,
    icc_4_t::tag_table_t::tag_definition_t::TAG_TYPE_SIGNATURES_S_15_FIXED_16_ARRAY_TYPE,
    icc_4_t::tag_table_t::tag_definition_t::TAG_TYPE_SIGNATURES_SIGNATURE_TYPE,
    icc_4_t::tag_table_t::tag_definition_t::TAG_TYPE_SIGNATURES_TEXT_TYPE,
    icc_4_t::tag_table_t::tag_definition_t::TAG_TYPE_SIGNATURES_U_16_FIXED_16_ARRAY_TYPE,
    icc_4_t::tag_table_t::tag_definition_t::TAG_TYPE_SIGNATURES_U_INT_8_ARRAY_TYPE,
    icc_4_t::tag_table_t::tag_definition_t::TAG_TYPE_SIGNATURES_U_INT_16_ARRAY_TYPE,
    icc_4_t::tag_table_t::tag_definition_t::TAG_TYPE_SIGNATURES_U_INT_32_ARRAY_TYPE,
    icc_4_t::tag_table_t::tag_definition_t::TAG_TYPE_SIGNATURES_U_INT_64_ARRAY_TYPE,
    icc_4_t::tag_table_t::tag_definition_t::TAG_TYPE_SIGNATURES_VIEWING_CONDITIONS_TYPE,
};
bool icc_4_t::tag_table_t::tag_definition_t::_is_defined_tag_type_signatures_t(icc_4_t::tag_table_t::tag_definition_t::tag_type_signatures_t v) {
    return icc_4_t::tag_table_t::tag_definition_t::_values_tag_type_signatures_t.find(v) != icc_4_t::tag_table_t::tag_definition_t::_values_tag_type_signatures_t.end();
}

icc_4_t::tag_table_t::tag_definition_t::tag_definition_t(kaitai::kstream* p__io, icc_4_t::tag_table_t* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m__io__raw_tag_data_element = nullptr;
    f_tag_data_element = false;
    _read();
}

void icc_4_t::tag_table_t::tag_definition_t::_read() {
    m_tag_signature = static_cast<icc_4_t::tag_table_t::tag_definition_t::tag_signatures_t>(m__io->read_u4be());
    m_offset_to_data_element = m__io->read_u4be();
    m_size_of_data_element = m__io->read_u4be();
}

icc_4_t::tag_table_t::tag_definition_t::~tag_definition_t() {
    _clean_up();
}

void icc_4_t::tag_table_t::tag_definition_t::_clean_up() {
    if (f_tag_data_element && !n_tag_data_element) {
    }
}

icc_4_t::tag_table_t::tag_definition_t::a_to_b_0_tag_t::a_to_b_0_tag_t(kaitai::kstream* p__io, icc_4_t::tag_table_t::tag_definition_t* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void icc_4_t::tag_table_t::tag_definition_t::a_to_b_0_tag_t::_read() {
    m_tag_type = static_cast<icc_4_t::tag_table_t::tag_definition_t::tag_type_signatures_t>(m__io->read_u4be());
    n_tag_data = true;
    switch (tag_type()) {
    case icc_4_t::tag_table_t::tag_definition_t::TAG_TYPE_SIGNATURES_MULTI_FUNCTION_A_TO_B_TABLE_TYPE: {
        n_tag_data = false;
        m_tag_data = std::unique_ptr<lut_a_to_b_type_t>(new lut_a_to_b_type_t(m__io, this, m__root));
        break;
    }
    case icc_4_t::tag_table_t::tag_definition_t::TAG_TYPE_SIGNATURES_MULTI_FUNCTION_TABLE_WITH_ONE_BYTE_PRECISION_TYPE: {
        n_tag_data = false;
        m_tag_data = std::unique_ptr<lut_8_type_t>(new lut_8_type_t(m__io, this, m__root));
        break;
    }
    case icc_4_t::tag_table_t::tag_definition_t::TAG_TYPE_SIGNATURES_MULTI_FUNCTION_TABLE_WITH_TWO_BYTE_PRECISION_TYPE: {
        n_tag_data = false;
        m_tag_data = std::unique_ptr<lut_16_type_t>(new lut_16_type_t(m__io, this, m__root));
        break;
    }
    }
}

icc_4_t::tag_table_t::tag_definition_t::a_to_b_0_tag_t::~a_to_b_0_tag_t() {
    _clean_up();
}

void icc_4_t::tag_table_t::tag_definition_t::a_to_b_0_tag_t::_clean_up() {
    if (!n_tag_data) {
    }
}

icc_4_t::tag_table_t::tag_definition_t::a_to_b_1_tag_t::a_to_b_1_tag_t(kaitai::kstream* p__io, icc_4_t::tag_table_t::tag_definition_t* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void icc_4_t::tag_table_t::tag_definition_t::a_to_b_1_tag_t::_read() {
    m_tag_type = static_cast<icc_4_t::tag_table_t::tag_definition_t::tag_type_signatures_t>(m__io->read_u4be());
    n_tag_data = true;
    switch (tag_type()) {
    case icc_4_t::tag_table_t::tag_definition_t::TAG_TYPE_SIGNATURES_MULTI_FUNCTION_A_TO_B_TABLE_TYPE: {
        n_tag_data = false;
        m_tag_data = std::unique_ptr<lut_a_to_b_type_t>(new lut_a_to_b_type_t(m__io, this, m__root));
        break;
    }
    case icc_4_t::tag_table_t::tag_definition_t::TAG_TYPE_SIGNATURES_MULTI_FUNCTION_TABLE_WITH_ONE_BYTE_PRECISION_TYPE: {
        n_tag_data = false;
        m_tag_data = std::unique_ptr<lut_8_type_t>(new lut_8_type_t(m__io, this, m__root));
        break;
    }
    case icc_4_t::tag_table_t::tag_definition_t::TAG_TYPE_SIGNATURES_MULTI_FUNCTION_TABLE_WITH_TWO_BYTE_PRECISION_TYPE: {
        n_tag_data = false;
        m_tag_data = std::unique_ptr<lut_16_type_t>(new lut_16_type_t(m__io, this, m__root));
        break;
    }
    }
}

icc_4_t::tag_table_t::tag_definition_t::a_to_b_1_tag_t::~a_to_b_1_tag_t() {
    _clean_up();
}

void icc_4_t::tag_table_t::tag_definition_t::a_to_b_1_tag_t::_clean_up() {
    if (!n_tag_data) {
    }
}

icc_4_t::tag_table_t::tag_definition_t::a_to_b_2_tag_t::a_to_b_2_tag_t(kaitai::kstream* p__io, icc_4_t::tag_table_t::tag_definition_t* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void icc_4_t::tag_table_t::tag_definition_t::a_to_b_2_tag_t::_read() {
    m_tag_type = static_cast<icc_4_t::tag_table_t::tag_definition_t::tag_type_signatures_t>(m__io->read_u4be());
    n_tag_data = true;
    switch (tag_type()) {
    case icc_4_t::tag_table_t::tag_definition_t::TAG_TYPE_SIGNATURES_MULTI_FUNCTION_A_TO_B_TABLE_TYPE: {
        n_tag_data = false;
        m_tag_data = std::unique_ptr<lut_a_to_b_type_t>(new lut_a_to_b_type_t(m__io, this, m__root));
        break;
    }
    case icc_4_t::tag_table_t::tag_definition_t::TAG_TYPE_SIGNATURES_MULTI_FUNCTION_TABLE_WITH_ONE_BYTE_PRECISION_TYPE: {
        n_tag_data = false;
        m_tag_data = std::unique_ptr<lut_8_type_t>(new lut_8_type_t(m__io, this, m__root));
        break;
    }
    case icc_4_t::tag_table_t::tag_definition_t::TAG_TYPE_SIGNATURES_MULTI_FUNCTION_TABLE_WITH_TWO_BYTE_PRECISION_TYPE: {
        n_tag_data = false;
        m_tag_data = std::unique_ptr<lut_16_type_t>(new lut_16_type_t(m__io, this, m__root));
        break;
    }
    }
}

icc_4_t::tag_table_t::tag_definition_t::a_to_b_2_tag_t::~a_to_b_2_tag_t() {
    _clean_up();
}

void icc_4_t::tag_table_t::tag_definition_t::a_to_b_2_tag_t::_clean_up() {
    if (!n_tag_data) {
    }
}

icc_4_t::tag_table_t::tag_definition_t::b_to_a_0_tag_t::b_to_a_0_tag_t(kaitai::kstream* p__io, icc_4_t::tag_table_t::tag_definition_t* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void icc_4_t::tag_table_t::tag_definition_t::b_to_a_0_tag_t::_read() {
    m_tag_type = static_cast<icc_4_t::tag_table_t::tag_definition_t::tag_type_signatures_t>(m__io->read_u4be());
    n_tag_data = true;
    switch (tag_type()) {
    case icc_4_t::tag_table_t::tag_definition_t::TAG_TYPE_SIGNATURES_MULTI_FUNCTION_B_TO_A_TABLE_TYPE: {
        n_tag_data = false;
        m_tag_data = std::unique_ptr<lut_b_to_a_type_t>(new lut_b_to_a_type_t(m__io, this, m__root));
        break;
    }
    case icc_4_t::tag_table_t::tag_definition_t::TAG_TYPE_SIGNATURES_MULTI_FUNCTION_TABLE_WITH_ONE_BYTE_PRECISION_TYPE: {
        n_tag_data = false;
        m_tag_data = std::unique_ptr<lut_8_type_t>(new lut_8_type_t(m__io, this, m__root));
        break;
    }
    case icc_4_t::tag_table_t::tag_definition_t::TAG_TYPE_SIGNATURES_MULTI_FUNCTION_TABLE_WITH_TWO_BYTE_PRECISION_TYPE: {
        n_tag_data = false;
        m_tag_data = std::unique_ptr<lut_16_type_t>(new lut_16_type_t(m__io, this, m__root));
        break;
    }
    }
}

icc_4_t::tag_table_t::tag_definition_t::b_to_a_0_tag_t::~b_to_a_0_tag_t() {
    _clean_up();
}

void icc_4_t::tag_table_t::tag_definition_t::b_to_a_0_tag_t::_clean_up() {
    if (!n_tag_data) {
    }
}

icc_4_t::tag_table_t::tag_definition_t::b_to_a_1_tag_t::b_to_a_1_tag_t(kaitai::kstream* p__io, icc_4_t::tag_table_t::tag_definition_t* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void icc_4_t::tag_table_t::tag_definition_t::b_to_a_1_tag_t::_read() {
    m_tag_type = static_cast<icc_4_t::tag_table_t::tag_definition_t::tag_type_signatures_t>(m__io->read_u4be());
    n_tag_data = true;
    switch (tag_type()) {
    case icc_4_t::tag_table_t::tag_definition_t::TAG_TYPE_SIGNATURES_MULTI_FUNCTION_B_TO_A_TABLE_TYPE: {
        n_tag_data = false;
        m_tag_data = std::unique_ptr<lut_b_to_a_type_t>(new lut_b_to_a_type_t(m__io, this, m__root));
        break;
    }
    case icc_4_t::tag_table_t::tag_definition_t::TAG_TYPE_SIGNATURES_MULTI_FUNCTION_TABLE_WITH_ONE_BYTE_PRECISION_TYPE: {
        n_tag_data = false;
        m_tag_data = std::unique_ptr<lut_8_type_t>(new lut_8_type_t(m__io, this, m__root));
        break;
    }
    case icc_4_t::tag_table_t::tag_definition_t::TAG_TYPE_SIGNATURES_MULTI_FUNCTION_TABLE_WITH_TWO_BYTE_PRECISION_TYPE: {
        n_tag_data = false;
        m_tag_data = std::unique_ptr<lut_16_type_t>(new lut_16_type_t(m__io, this, m__root));
        break;
    }
    }
}

icc_4_t::tag_table_t::tag_definition_t::b_to_a_1_tag_t::~b_to_a_1_tag_t() {
    _clean_up();
}

void icc_4_t::tag_table_t::tag_definition_t::b_to_a_1_tag_t::_clean_up() {
    if (!n_tag_data) {
    }
}

icc_4_t::tag_table_t::tag_definition_t::b_to_a_2_tag_t::b_to_a_2_tag_t(kaitai::kstream* p__io, icc_4_t::tag_table_t::tag_definition_t* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void icc_4_t::tag_table_t::tag_definition_t::b_to_a_2_tag_t::_read() {
    m_tag_type = static_cast<icc_4_t::tag_table_t::tag_definition_t::tag_type_signatures_t>(m__io->read_u4be());
    n_tag_data = true;
    switch (tag_type()) {
    case icc_4_t::tag_table_t::tag_definition_t::TAG_TYPE_SIGNATURES_MULTI_FUNCTION_B_TO_A_TABLE_TYPE: {
        n_tag_data = false;
        m_tag_data = std::unique_ptr<lut_b_to_a_type_t>(new lut_b_to_a_type_t(m__io, this, m__root));
        break;
    }
    case icc_4_t::tag_table_t::tag_definition_t::TAG_TYPE_SIGNATURES_MULTI_FUNCTION_TABLE_WITH_ONE_BYTE_PRECISION_TYPE: {
        n_tag_data = false;
        m_tag_data = std::unique_ptr<lut_8_type_t>(new lut_8_type_t(m__io, this, m__root));
        break;
    }
    case icc_4_t::tag_table_t::tag_definition_t::TAG_TYPE_SIGNATURES_MULTI_FUNCTION_TABLE_WITH_TWO_BYTE_PRECISION_TYPE: {
        n_tag_data = false;
        m_tag_data = std::unique_ptr<lut_16_type_t>(new lut_16_type_t(m__io, this, m__root));
        break;
    }
    }
}

icc_4_t::tag_table_t::tag_definition_t::b_to_a_2_tag_t::~b_to_a_2_tag_t() {
    _clean_up();
}

void icc_4_t::tag_table_t::tag_definition_t::b_to_a_2_tag_t::_clean_up() {
    if (!n_tag_data) {
    }
}

icc_4_t::tag_table_t::tag_definition_t::b_to_d_0_tag_t::b_to_d_0_tag_t(kaitai::kstream* p__io, icc_4_t::tag_table_t::tag_definition_t* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void icc_4_t::tag_table_t::tag_definition_t::b_to_d_0_tag_t::_read() {
    m_tag_type = static_cast<icc_4_t::tag_table_t::tag_definition_t::tag_type_signatures_t>(m__io->read_u4be());
    n_tag_data = true;
    switch (tag_type()) {
    case icc_4_t::tag_table_t::tag_definition_t::TAG_TYPE_SIGNATURES_MULTI_PROCESS_ELEMENTS_TYPE: {
        n_tag_data = false;
        m_tag_data = std::unique_ptr<multi_process_elements_type_t>(new multi_process_elements_type_t(m__io, this, m__root));
        break;
    }
    }
}

icc_4_t::tag_table_t::tag_definition_t::b_to_d_0_tag_t::~b_to_d_0_tag_t() {
    _clean_up();
}

void icc_4_t::tag_table_t::tag_definition_t::b_to_d_0_tag_t::_clean_up() {
    if (!n_tag_data) {
    }
}

icc_4_t::tag_table_t::tag_definition_t::b_to_d_1_tag_t::b_to_d_1_tag_t(kaitai::kstream* p__io, icc_4_t::tag_table_t::tag_definition_t* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void icc_4_t::tag_table_t::tag_definition_t::b_to_d_1_tag_t::_read() {
    m_tag_type = static_cast<icc_4_t::tag_table_t::tag_definition_t::tag_type_signatures_t>(m__io->read_u4be());
    n_tag_data = true;
    switch (tag_type()) {
    case icc_4_t::tag_table_t::tag_definition_t::TAG_TYPE_SIGNATURES_MULTI_PROCESS_ELEMENTS_TYPE: {
        n_tag_data = false;
        m_tag_data = std::unique_ptr<multi_process_elements_type_t>(new multi_process_elements_type_t(m__io, this, m__root));
        break;
    }
    }
}

icc_4_t::tag_table_t::tag_definition_t::b_to_d_1_tag_t::~b_to_d_1_tag_t() {
    _clean_up();
}

void icc_4_t::tag_table_t::tag_definition_t::b_to_d_1_tag_t::_clean_up() {
    if (!n_tag_data) {
    }
}

icc_4_t::tag_table_t::tag_definition_t::b_to_d_2_tag_t::b_to_d_2_tag_t(kaitai::kstream* p__io, icc_4_t::tag_table_t::tag_definition_t* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void icc_4_t::tag_table_t::tag_definition_t::b_to_d_2_tag_t::_read() {
    m_tag_type = static_cast<icc_4_t::tag_table_t::tag_definition_t::tag_type_signatures_t>(m__io->read_u4be());
    n_tag_data = true;
    switch (tag_type()) {
    case icc_4_t::tag_table_t::tag_definition_t::TAG_TYPE_SIGNATURES_MULTI_PROCESS_ELEMENTS_TYPE: {
        n_tag_data = false;
        m_tag_data = std::unique_ptr<multi_process_elements_type_t>(new multi_process_elements_type_t(m__io, this, m__root));
        break;
    }
    }
}

icc_4_t::tag_table_t::tag_definition_t::b_to_d_2_tag_t::~b_to_d_2_tag_t() {
    _clean_up();
}

void icc_4_t::tag_table_t::tag_definition_t::b_to_d_2_tag_t::_clean_up() {
    if (!n_tag_data) {
    }
}

icc_4_t::tag_table_t::tag_definition_t::b_to_d_3_tag_t::b_to_d_3_tag_t(kaitai::kstream* p__io, icc_4_t::tag_table_t::tag_definition_t* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void icc_4_t::tag_table_t::tag_definition_t::b_to_d_3_tag_t::_read() {
    m_tag_type = static_cast<icc_4_t::tag_table_t::tag_definition_t::tag_type_signatures_t>(m__io->read_u4be());
    n_tag_data = true;
    switch (tag_type()) {
    case icc_4_t::tag_table_t::tag_definition_t::TAG_TYPE_SIGNATURES_MULTI_PROCESS_ELEMENTS_TYPE: {
        n_tag_data = false;
        m_tag_data = std::unique_ptr<multi_process_elements_type_t>(new multi_process_elements_type_t(m__io, this, m__root));
        break;
    }
    }
}

icc_4_t::tag_table_t::tag_definition_t::b_to_d_3_tag_t::~b_to_d_3_tag_t() {
    _clean_up();
}

void icc_4_t::tag_table_t::tag_definition_t::b_to_d_3_tag_t::_clean_up() {
    if (!n_tag_data) {
    }
}

icc_4_t::tag_table_t::tag_definition_t::blue_matrix_column_tag_t::blue_matrix_column_tag_t(kaitai::kstream* p__io, icc_4_t::tag_table_t::tag_definition_t* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void icc_4_t::tag_table_t::tag_definition_t::blue_matrix_column_tag_t::_read() {
    m_tag_type = static_cast<icc_4_t::tag_table_t::tag_definition_t::tag_type_signatures_t>(m__io->read_u4be());
    n_tag_data = true;
    switch (tag_type()) {
    case icc_4_t::tag_table_t::tag_definition_t::TAG_TYPE_SIGNATURES_XYZ_TYPE: {
        n_tag_data = false;
        m_tag_data = std::unique_ptr<xyz_type_t>(new xyz_type_t(m__io, this, m__root));
        break;
    }
    }
}

icc_4_t::tag_table_t::tag_definition_t::blue_matrix_column_tag_t::~blue_matrix_column_tag_t() {
    _clean_up();
}

void icc_4_t::tag_table_t::tag_definition_t::blue_matrix_column_tag_t::_clean_up() {
    if (!n_tag_data) {
    }
}

icc_4_t::tag_table_t::tag_definition_t::blue_trc_tag_t::blue_trc_tag_t(kaitai::kstream* p__io, icc_4_t::tag_table_t::tag_definition_t* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void icc_4_t::tag_table_t::tag_definition_t::blue_trc_tag_t::_read() {
    m_tag_type = static_cast<icc_4_t::tag_table_t::tag_definition_t::tag_type_signatures_t>(m__io->read_u4be());
    n_tag_data = true;
    switch (tag_type()) {
    case icc_4_t::tag_table_t::tag_definition_t::TAG_TYPE_SIGNATURES_CURVE_TYPE: {
        n_tag_data = false;
        m_tag_data = std::unique_ptr<curve_type_t>(new curve_type_t(m__io, this, m__root));
        break;
    }
    case icc_4_t::tag_table_t::tag_definition_t::TAG_TYPE_SIGNATURES_PARAMETRIC_CURVE_TYPE: {
        n_tag_data = false;
        m_tag_data = std::unique_ptr<parametric_curve_type_t>(new parametric_curve_type_t(m__io, this, m__root));
        break;
    }
    }
}

icc_4_t::tag_table_t::tag_definition_t::blue_trc_tag_t::~blue_trc_tag_t() {
    _clean_up();
}

void icc_4_t::tag_table_t::tag_definition_t::blue_trc_tag_t::_clean_up() {
    if (!n_tag_data) {
    }
}

icc_4_t::tag_table_t::tag_definition_t::calibration_date_time_tag_t::calibration_date_time_tag_t(kaitai::kstream* p__io, icc_4_t::tag_table_t::tag_definition_t* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void icc_4_t::tag_table_t::tag_definition_t::calibration_date_time_tag_t::_read() {
    m_tag_type = static_cast<icc_4_t::tag_table_t::tag_definition_t::tag_type_signatures_t>(m__io->read_u4be());
    n_tag_data = true;
    switch (tag_type()) {
    case icc_4_t::tag_table_t::tag_definition_t::TAG_TYPE_SIGNATURES_DATE_TIME_TYPE: {
        n_tag_data = false;
        m_tag_data = std::unique_ptr<date_time_type_t>(new date_time_type_t(m__io, this, m__root));
        break;
    }
    }
}

icc_4_t::tag_table_t::tag_definition_t::calibration_date_time_tag_t::~calibration_date_time_tag_t() {
    _clean_up();
}

void icc_4_t::tag_table_t::tag_definition_t::calibration_date_time_tag_t::_clean_up() {
    if (!n_tag_data) {
    }
}

icc_4_t::tag_table_t::tag_definition_t::char_target_tag_t::char_target_tag_t(kaitai::kstream* p__io, icc_4_t::tag_table_t::tag_definition_t* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void icc_4_t::tag_table_t::tag_definition_t::char_target_tag_t::_read() {
    m_tag_type = static_cast<icc_4_t::tag_table_t::tag_definition_t::tag_type_signatures_t>(m__io->read_u4be());
    n_tag_data = true;
    switch (tag_type()) {
    case icc_4_t::tag_table_t::tag_definition_t::TAG_TYPE_SIGNATURES_TEXT_TYPE: {
        n_tag_data = false;
        m_tag_data = std::unique_ptr<text_type_t>(new text_type_t(m__io, this, m__root));
        break;
    }
    }
}

icc_4_t::tag_table_t::tag_definition_t::char_target_tag_t::~char_target_tag_t() {
    _clean_up();
}

void icc_4_t::tag_table_t::tag_definition_t::char_target_tag_t::_clean_up() {
    if (!n_tag_data) {
    }
}

icc_4_t::tag_table_t::tag_definition_t::chromatic_adaptation_tag_t::chromatic_adaptation_tag_t(kaitai::kstream* p__io, icc_4_t::tag_table_t::tag_definition_t* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void icc_4_t::tag_table_t::tag_definition_t::chromatic_adaptation_tag_t::_read() {
    m_tag_type = static_cast<icc_4_t::tag_table_t::tag_definition_t::tag_type_signatures_t>(m__io->read_u4be());
    n_tag_data = true;
    switch (tag_type()) {
    case icc_4_t::tag_table_t::tag_definition_t::TAG_TYPE_SIGNATURES_S_15_FIXED_16_ARRAY_TYPE: {
        n_tag_data = false;
        m_tag_data = std::unique_ptr<s_15_fixed_16_array_type_t>(new s_15_fixed_16_array_type_t(m__io, this, m__root));
        break;
    }
    }
}

icc_4_t::tag_table_t::tag_definition_t::chromatic_adaptation_tag_t::~chromatic_adaptation_tag_t() {
    _clean_up();
}

void icc_4_t::tag_table_t::tag_definition_t::chromatic_adaptation_tag_t::_clean_up() {
    if (!n_tag_data) {
    }
}

icc_4_t::tag_table_t::tag_definition_t::chromaticity_tag_t::chromaticity_tag_t(kaitai::kstream* p__io, icc_4_t::tag_table_t::tag_definition_t* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void icc_4_t::tag_table_t::tag_definition_t::chromaticity_tag_t::_read() {
    m_tag_type = static_cast<icc_4_t::tag_table_t::tag_definition_t::tag_type_signatures_t>(m__io->read_u4be());
    n_tag_data = true;
    switch (tag_type()) {
    case icc_4_t::tag_table_t::tag_definition_t::TAG_TYPE_SIGNATURES_CHROMATICITY_TYPE: {
        n_tag_data = false;
        m_tag_data = std::unique_ptr<chromaticity_type_t>(new chromaticity_type_t(m__io, this, m__root));
        break;
    }
    }
}

icc_4_t::tag_table_t::tag_definition_t::chromaticity_tag_t::~chromaticity_tag_t() {
    _clean_up();
}

void icc_4_t::tag_table_t::tag_definition_t::chromaticity_tag_t::_clean_up() {
    if (!n_tag_data) {
    }
}
const std::set<icc_4_t::tag_table_t::tag_definition_t::chromaticity_type_t::colorant_and_phosphor_encodings_t> icc_4_t::tag_table_t::tag_definition_t::chromaticity_type_t::_values_colorant_and_phosphor_encodings_t{
    icc_4_t::tag_table_t::tag_definition_t::chromaticity_type_t::COLORANT_AND_PHOSPHOR_ENCODINGS_UNKNOWN,
    icc_4_t::tag_table_t::tag_definition_t::chromaticity_type_t::COLORANT_AND_PHOSPHOR_ENCODINGS_ITU_R_BT_709_2,
    icc_4_t::tag_table_t::tag_definition_t::chromaticity_type_t::COLORANT_AND_PHOSPHOR_ENCODINGS_SMPTE_RP145,
    icc_4_t::tag_table_t::tag_definition_t::chromaticity_type_t::COLORANT_AND_PHOSPHOR_ENCODINGS_EBU_TECH_3213_E,
    icc_4_t::tag_table_t::tag_definition_t::chromaticity_type_t::COLORANT_AND_PHOSPHOR_ENCODINGS_P22,
};
bool icc_4_t::tag_table_t::tag_definition_t::chromaticity_type_t::_is_defined_colorant_and_phosphor_encodings_t(icc_4_t::tag_table_t::tag_definition_t::chromaticity_type_t::colorant_and_phosphor_encodings_t v) {
    return icc_4_t::tag_table_t::tag_definition_t::chromaticity_type_t::_values_colorant_and_phosphor_encodings_t.find(v) != icc_4_t::tag_table_t::tag_definition_t::chromaticity_type_t::_values_colorant_and_phosphor_encodings_t.end();
}

icc_4_t::tag_table_t::tag_definition_t::chromaticity_type_t::chromaticity_type_t(kaitai::kstream* p__io, icc_4_t::tag_table_t::tag_definition_t::chromaticity_tag_t* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_ciexy_coordinates_per_channel = nullptr;
    _read();
}

void icc_4_t::tag_table_t::tag_definition_t::chromaticity_type_t::_read() {
    m_reserved = m__io->read_bytes(4);
    if (!(m_reserved == std::string("\x00\x00\x00\x00", 4))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x00\x00\x00\x00", 4), m_reserved, m__io, std::string("/types/tag_table/types/tag_definition/types/chromaticity_type/seq/0"));
    }
    m_number_of_device_channels = m__io->read_u2be();
    m_colorant_and_phosphor_encoding = static_cast<icc_4_t::tag_table_t::tag_definition_t::chromaticity_type_t::colorant_and_phosphor_encodings_t>(m__io->read_u2be());
    m_ciexy_coordinates_per_channel = std::unique_ptr<std::vector<std::unique_ptr<ciexy_coordinate_values_t>>>(new std::vector<std::unique_ptr<ciexy_coordinate_values_t>>());
    const int l_ciexy_coordinates_per_channel = number_of_device_channels();
    for (int i = 0; i < l_ciexy_coordinates_per_channel; i++) {
        m_ciexy_coordinates_per_channel->push_back(std::move(std::unique_ptr<ciexy_coordinate_values_t>(new ciexy_coordinate_values_t(m__io, this, m__root))));
    }
}

icc_4_t::tag_table_t::tag_definition_t::chromaticity_type_t::~chromaticity_type_t() {
    _clean_up();
}

void icc_4_t::tag_table_t::tag_definition_t::chromaticity_type_t::_clean_up() {
}

icc_4_t::tag_table_t::tag_definition_t::chromaticity_type_t::ciexy_coordinate_values_t::ciexy_coordinate_values_t(kaitai::kstream* p__io, icc_4_t::tag_table_t::tag_definition_t::chromaticity_type_t* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void icc_4_t::tag_table_t::tag_definition_t::chromaticity_type_t::ciexy_coordinate_values_t::_read() {
    m_x_coordinate = m__io->read_u2be();
    m_y_coordinate = m__io->read_u2be();
}

icc_4_t::tag_table_t::tag_definition_t::chromaticity_type_t::ciexy_coordinate_values_t::~ciexy_coordinate_values_t() {
    _clean_up();
}

void icc_4_t::tag_table_t::tag_definition_t::chromaticity_type_t::ciexy_coordinate_values_t::_clean_up() {
}

icc_4_t::tag_table_t::tag_definition_t::colorant_order_tag_t::colorant_order_tag_t(kaitai::kstream* p__io, icc_4_t::tag_table_t::tag_definition_t* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void icc_4_t::tag_table_t::tag_definition_t::colorant_order_tag_t::_read() {
    m_tag_type = static_cast<icc_4_t::tag_table_t::tag_definition_t::tag_type_signatures_t>(m__io->read_u4be());
    n_tag_data = true;
    switch (tag_type()) {
    case icc_4_t::tag_table_t::tag_definition_t::TAG_TYPE_SIGNATURES_COLORANT_ORDER_TYPE: {
        n_tag_data = false;
        m_tag_data = std::unique_ptr<colorant_order_type_t>(new colorant_order_type_t(m__io, this, m__root));
        break;
    }
    }
}

icc_4_t::tag_table_t::tag_definition_t::colorant_order_tag_t::~colorant_order_tag_t() {
    _clean_up();
}

void icc_4_t::tag_table_t::tag_definition_t::colorant_order_tag_t::_clean_up() {
    if (!n_tag_data) {
    }
}

icc_4_t::tag_table_t::tag_definition_t::colorant_order_type_t::colorant_order_type_t(kaitai::kstream* p__io, icc_4_t::tag_table_t::tag_definition_t::colorant_order_tag_t* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_numbers_of_colorants_in_order_of_printing = nullptr;
    _read();
}

void icc_4_t::tag_table_t::tag_definition_t::colorant_order_type_t::_read() {
    m_reserved = m__io->read_bytes(4);
    if (!(m_reserved == std::string("\x00\x00\x00\x00", 4))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x00\x00\x00\x00", 4), m_reserved, m__io, std::string("/types/tag_table/types/tag_definition/types/colorant_order_type/seq/0"));
    }
    m_count_of_colorants = m__io->read_u4be();
    m_numbers_of_colorants_in_order_of_printing = std::unique_ptr<std::vector<uint8_t>>(new std::vector<uint8_t>());
    const int l_numbers_of_colorants_in_order_of_printing = count_of_colorants();
    for (int i = 0; i < l_numbers_of_colorants_in_order_of_printing; i++) {
        m_numbers_of_colorants_in_order_of_printing->push_back(std::move(m__io->read_u1()));
    }
}

icc_4_t::tag_table_t::tag_definition_t::colorant_order_type_t::~colorant_order_type_t() {
    _clean_up();
}

void icc_4_t::tag_table_t::tag_definition_t::colorant_order_type_t::_clean_up() {
}

icc_4_t::tag_table_t::tag_definition_t::colorant_table_out_tag_t::colorant_table_out_tag_t(kaitai::kstream* p__io, icc_4_t::tag_table_t::tag_definition_t* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void icc_4_t::tag_table_t::tag_definition_t::colorant_table_out_tag_t::_read() {
    m_tag_type = static_cast<icc_4_t::tag_table_t::tag_definition_t::tag_type_signatures_t>(m__io->read_u4be());
    n_tag_data = true;
    switch (tag_type()) {
    case icc_4_t::tag_table_t::tag_definition_t::TAG_TYPE_SIGNATURES_COLORANT_TABLE_TYPE: {
        n_tag_data = false;
        m_tag_data = std::unique_ptr<colorant_table_type_t>(new colorant_table_type_t(m__io, this, m__root));
        break;
    }
    }
}

icc_4_t::tag_table_t::tag_definition_t::colorant_table_out_tag_t::~colorant_table_out_tag_t() {
    _clean_up();
}

void icc_4_t::tag_table_t::tag_definition_t::colorant_table_out_tag_t::_clean_up() {
    if (!n_tag_data) {
    }
}

icc_4_t::tag_table_t::tag_definition_t::colorant_table_tag_t::colorant_table_tag_t(kaitai::kstream* p__io, icc_4_t::tag_table_t::tag_definition_t* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void icc_4_t::tag_table_t::tag_definition_t::colorant_table_tag_t::_read() {
    m_tag_type = static_cast<icc_4_t::tag_table_t::tag_definition_t::tag_type_signatures_t>(m__io->read_u4be());
    n_tag_data = true;
    switch (tag_type()) {
    case icc_4_t::tag_table_t::tag_definition_t::TAG_TYPE_SIGNATURES_COLORANT_TABLE_TYPE: {
        n_tag_data = false;
        m_tag_data = std::unique_ptr<colorant_table_type_t>(new colorant_table_type_t(m__io, this, m__root));
        break;
    }
    }
}

icc_4_t::tag_table_t::tag_definition_t::colorant_table_tag_t::~colorant_table_tag_t() {
    _clean_up();
}

void icc_4_t::tag_table_t::tag_definition_t::colorant_table_tag_t::_clean_up() {
    if (!n_tag_data) {
    }
}

icc_4_t::tag_table_t::tag_definition_t::colorant_table_type_t::colorant_table_type_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_colorants = nullptr;
    _read();
}

void icc_4_t::tag_table_t::tag_definition_t::colorant_table_type_t::_read() {
    m_reserved = m__io->read_bytes(4);
    if (!(m_reserved == std::string("\x00\x00\x00\x00", 4))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x00\x00\x00\x00", 4), m_reserved, m__io, std::string("/types/tag_table/types/tag_definition/types/colorant_table_type/seq/0"));
    }
    m_count_of_colorants = m__io->read_u4be();
    m_colorants = std::unique_ptr<std::vector<std::unique_ptr<colorant_t>>>(new std::vector<std::unique_ptr<colorant_t>>());
    const int l_colorants = count_of_colorants();
    for (int i = 0; i < l_colorants; i++) {
        m_colorants->push_back(std::move(std::unique_ptr<colorant_t>(new colorant_t(m__io, this, m__root))));
    }
}

icc_4_t::tag_table_t::tag_definition_t::colorant_table_type_t::~colorant_table_type_t() {
    _clean_up();
}

void icc_4_t::tag_table_t::tag_definition_t::colorant_table_type_t::_clean_up() {
}

icc_4_t::tag_table_t::tag_definition_t::colorant_table_type_t::colorant_t::colorant_t(kaitai::kstream* p__io, icc_4_t::tag_table_t::tag_definition_t::colorant_table_type_t* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_padding = nullptr;
    _read();
}

void icc_4_t::tag_table_t::tag_definition_t::colorant_table_type_t::colorant_t::_read() {
    m_name = kaitai::kstream::bytes_to_str(m__io->read_bytes_term(0, false, true, true), "ASCII");
    m_padding = std::unique_ptr<std::vector<std::string>>(new std::vector<std::string>());
    const int l_padding = 32 - name().length();
    for (int i = 0; i < l_padding; i++) {
        m_padding->push_back(std::move(m__io->read_bytes(1)));
        if (!(m_padding->at(i) == std::string("\x00", 1))) {
            throw kaitai::validation_not_equal_error<std::string>(std::string("\x00", 1), m_padding->at(i), m__io, std::string("/types/tag_table/types/tag_definition/types/colorant_table_type/types/colorant/seq/1"));
        }
    }
    m_pcs_values = m__io->read_bytes(6);
}

icc_4_t::tag_table_t::tag_definition_t::colorant_table_type_t::colorant_t::~colorant_t() {
    _clean_up();
}

void icc_4_t::tag_table_t::tag_definition_t::colorant_table_type_t::colorant_t::_clean_up() {
}

icc_4_t::tag_table_t::tag_definition_t::colorimetric_intent_image_state_tag_t::colorimetric_intent_image_state_tag_t(kaitai::kstream* p__io, icc_4_t::tag_table_t::tag_definition_t* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void icc_4_t::tag_table_t::tag_definition_t::colorimetric_intent_image_state_tag_t::_read() {
    m_tag_type = static_cast<icc_4_t::tag_table_t::tag_definition_t::tag_type_signatures_t>(m__io->read_u4be());
    n_tag_data = true;
    switch (tag_type()) {
    case icc_4_t::tag_table_t::tag_definition_t::TAG_TYPE_SIGNATURES_SIGNATURE_TYPE: {
        n_tag_data = false;
        m_tag_data = std::unique_ptr<signature_type_t>(new signature_type_t(m__io, this, m__root));
        break;
    }
    }
}

icc_4_t::tag_table_t::tag_definition_t::colorimetric_intent_image_state_tag_t::~colorimetric_intent_image_state_tag_t() {
    _clean_up();
}

void icc_4_t::tag_table_t::tag_definition_t::colorimetric_intent_image_state_tag_t::_clean_up() {
    if (!n_tag_data) {
    }
}

icc_4_t::tag_table_t::tag_definition_t::copyright_tag_t::copyright_tag_t(kaitai::kstream* p__io, icc_4_t::tag_table_t::tag_definition_t* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void icc_4_t::tag_table_t::tag_definition_t::copyright_tag_t::_read() {
    m_tag_type = static_cast<icc_4_t::tag_table_t::tag_definition_t::tag_type_signatures_t>(m__io->read_u4be());
    n_tag_data = true;
    switch (tag_type()) {
    case icc_4_t::tag_table_t::tag_definition_t::TAG_TYPE_SIGNATURES_MULTI_LOCALIZED_UNICODE_TYPE: {
        n_tag_data = false;
        m_tag_data = std::unique_ptr<multi_localized_unicode_type_t>(new multi_localized_unicode_type_t(m__io, this, m__root));
        break;
    }
    }
}

icc_4_t::tag_table_t::tag_definition_t::copyright_tag_t::~copyright_tag_t() {
    _clean_up();
}

void icc_4_t::tag_table_t::tag_definition_t::copyright_tag_t::_clean_up() {
    if (!n_tag_data) {
    }
}

icc_4_t::tag_table_t::tag_definition_t::curve_type_t::curve_type_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_curve_values = nullptr;
    _read();
}

void icc_4_t::tag_table_t::tag_definition_t::curve_type_t::_read() {
    m_reserved = m__io->read_bytes(4);
    if (!(m_reserved == std::string("\x00\x00\x00\x00", 4))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x00\x00\x00\x00", 4), m_reserved, m__io, std::string("/types/tag_table/types/tag_definition/types/curve_type/seq/0"));
    }
    m_number_of_entries = m__io->read_u4be();
    n_curve_values = true;
    if (number_of_entries() > 1) {
        n_curve_values = false;
        m_curve_values = std::unique_ptr<std::vector<uint16_t>>(new std::vector<uint16_t>());
        const int l_curve_values = number_of_entries();
        for (int i = 0; i < l_curve_values; i++) {
            m_curve_values->push_back(std::move(m__io->read_u2be()));
        }
    }
    n_curve_value = true;
    if (number_of_entries() == 1) {
        n_curve_value = false;
        m_curve_value = m__io->read_u1();
    }
}

icc_4_t::tag_table_t::tag_definition_t::curve_type_t::~curve_type_t() {
    _clean_up();
}

void icc_4_t::tag_table_t::tag_definition_t::curve_type_t::_clean_up() {
    if (!n_curve_values) {
    }
    if (!n_curve_value) {
    }
}

icc_4_t::tag_table_t::tag_definition_t::d_to_b_0_tag_t::d_to_b_0_tag_t(kaitai::kstream* p__io, icc_4_t::tag_table_t::tag_definition_t* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void icc_4_t::tag_table_t::tag_definition_t::d_to_b_0_tag_t::_read() {
    m_tag_type = static_cast<icc_4_t::tag_table_t::tag_definition_t::tag_type_signatures_t>(m__io->read_u4be());
    n_tag_data = true;
    switch (tag_type()) {
    case icc_4_t::tag_table_t::tag_definition_t::TAG_TYPE_SIGNATURES_MULTI_PROCESS_ELEMENTS_TYPE: {
        n_tag_data = false;
        m_tag_data = std::unique_ptr<multi_process_elements_type_t>(new multi_process_elements_type_t(m__io, this, m__root));
        break;
    }
    }
}

icc_4_t::tag_table_t::tag_definition_t::d_to_b_0_tag_t::~d_to_b_0_tag_t() {
    _clean_up();
}

void icc_4_t::tag_table_t::tag_definition_t::d_to_b_0_tag_t::_clean_up() {
    if (!n_tag_data) {
    }
}

icc_4_t::tag_table_t::tag_definition_t::d_to_b_1_tag_t::d_to_b_1_tag_t(kaitai::kstream* p__io, icc_4_t::tag_table_t::tag_definition_t* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void icc_4_t::tag_table_t::tag_definition_t::d_to_b_1_tag_t::_read() {
    m_tag_type = static_cast<icc_4_t::tag_table_t::tag_definition_t::tag_type_signatures_t>(m__io->read_u4be());
    n_tag_data = true;
    switch (tag_type()) {
    case icc_4_t::tag_table_t::tag_definition_t::TAG_TYPE_SIGNATURES_MULTI_PROCESS_ELEMENTS_TYPE: {
        n_tag_data = false;
        m_tag_data = std::unique_ptr<multi_process_elements_type_t>(new multi_process_elements_type_t(m__io, this, m__root));
        break;
    }
    }
}

icc_4_t::tag_table_t::tag_definition_t::d_to_b_1_tag_t::~d_to_b_1_tag_t() {
    _clean_up();
}

void icc_4_t::tag_table_t::tag_definition_t::d_to_b_1_tag_t::_clean_up() {
    if (!n_tag_data) {
    }
}

icc_4_t::tag_table_t::tag_definition_t::d_to_b_2_tag_t::d_to_b_2_tag_t(kaitai::kstream* p__io, icc_4_t::tag_table_t::tag_definition_t* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void icc_4_t::tag_table_t::tag_definition_t::d_to_b_2_tag_t::_read() {
    m_tag_type = static_cast<icc_4_t::tag_table_t::tag_definition_t::tag_type_signatures_t>(m__io->read_u4be());
    n_tag_data = true;
    switch (tag_type()) {
    case icc_4_t::tag_table_t::tag_definition_t::TAG_TYPE_SIGNATURES_MULTI_PROCESS_ELEMENTS_TYPE: {
        n_tag_data = false;
        m_tag_data = std::unique_ptr<multi_process_elements_type_t>(new multi_process_elements_type_t(m__io, this, m__root));
        break;
    }
    }
}

icc_4_t::tag_table_t::tag_definition_t::d_to_b_2_tag_t::~d_to_b_2_tag_t() {
    _clean_up();
}

void icc_4_t::tag_table_t::tag_definition_t::d_to_b_2_tag_t::_clean_up() {
    if (!n_tag_data) {
    }
}

icc_4_t::tag_table_t::tag_definition_t::d_to_b_3_tag_t::d_to_b_3_tag_t(kaitai::kstream* p__io, icc_4_t::tag_table_t::tag_definition_t* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void icc_4_t::tag_table_t::tag_definition_t::d_to_b_3_tag_t::_read() {
    m_tag_type = static_cast<icc_4_t::tag_table_t::tag_definition_t::tag_type_signatures_t>(m__io->read_u4be());
    n_tag_data = true;
    switch (tag_type()) {
    case icc_4_t::tag_table_t::tag_definition_t::TAG_TYPE_SIGNATURES_MULTI_PROCESS_ELEMENTS_TYPE: {
        n_tag_data = false;
        m_tag_data = std::unique_ptr<multi_process_elements_type_t>(new multi_process_elements_type_t(m__io, this, m__root));
        break;
    }
    }
}

icc_4_t::tag_table_t::tag_definition_t::d_to_b_3_tag_t::~d_to_b_3_tag_t() {
    _clean_up();
}

void icc_4_t::tag_table_t::tag_definition_t::d_to_b_3_tag_t::_clean_up() {
    if (!n_tag_data) {
    }
}
const std::set<icc_4_t::tag_table_t::tag_definition_t::data_type_t::data_types_t> icc_4_t::tag_table_t::tag_definition_t::data_type_t::_values_data_types_t{
    icc_4_t::tag_table_t::tag_definition_t::data_type_t::DATA_TYPES_ASCII_DATA,
    icc_4_t::tag_table_t::tag_definition_t::data_type_t::DATA_TYPES_BINARY_DATA,
};
bool icc_4_t::tag_table_t::tag_definition_t::data_type_t::_is_defined_data_types_t(icc_4_t::tag_table_t::tag_definition_t::data_type_t::data_types_t v) {
    return icc_4_t::tag_table_t::tag_definition_t::data_type_t::_values_data_types_t.find(v) != icc_4_t::tag_table_t::tag_definition_t::data_type_t::_values_data_types_t.end();
}

icc_4_t::tag_table_t::tag_definition_t::data_type_t::data_type_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void icc_4_t::tag_table_t::tag_definition_t::data_type_t::_read() {
    m_data_flag = static_cast<icc_4_t::tag_table_t::tag_definition_t::data_type_t::data_types_t>(m__io->read_u4be());
}

icc_4_t::tag_table_t::tag_definition_t::data_type_t::~data_type_t() {
    _clean_up();
}

void icc_4_t::tag_table_t::tag_definition_t::data_type_t::_clean_up() {
}

icc_4_t::tag_table_t::tag_definition_t::date_time_type_t::date_time_type_t(kaitai::kstream* p__io, icc_4_t::tag_table_t::tag_definition_t::calibration_date_time_tag_t* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_date_and_time = nullptr;
    _read();
}

void icc_4_t::tag_table_t::tag_definition_t::date_time_type_t::_read() {
    m_reserved = m__io->read_bytes(4);
    if (!(m_reserved == std::string("\x00\x00\x00\x00", 4))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x00\x00\x00\x00", 4), m_reserved, m__io, std::string("/types/tag_table/types/tag_definition/types/date_time_type/seq/0"));
    }
    m_date_and_time = std::unique_ptr<date_time_number_t>(new date_time_number_t(m__io, this, m__root));
}

icc_4_t::tag_table_t::tag_definition_t::date_time_type_t::~date_time_type_t() {
    _clean_up();
}

void icc_4_t::tag_table_t::tag_definition_t::date_time_type_t::_clean_up() {
}

icc_4_t::tag_table_t::tag_definition_t::device_mfg_desc_tag_t::device_mfg_desc_tag_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void icc_4_t::tag_table_t::tag_definition_t::device_mfg_desc_tag_t::_read() {
    m_tag_type = static_cast<icc_4_t::tag_table_t::tag_definition_t::tag_type_signatures_t>(m__io->read_u4be());
    n_tag_data = true;
    switch (tag_type()) {
    case icc_4_t::tag_table_t::tag_definition_t::TAG_TYPE_SIGNATURES_MULTI_LOCALIZED_UNICODE_TYPE: {
        n_tag_data = false;
        m_tag_data = std::unique_ptr<multi_localized_unicode_type_t>(new multi_localized_unicode_type_t(m__io, this, m__root));
        break;
    }
    }
}

icc_4_t::tag_table_t::tag_definition_t::device_mfg_desc_tag_t::~device_mfg_desc_tag_t() {
    _clean_up();
}

void icc_4_t::tag_table_t::tag_definition_t::device_mfg_desc_tag_t::_clean_up() {
    if (!n_tag_data) {
    }
}

icc_4_t::tag_table_t::tag_definition_t::device_model_desc_tag_t::device_model_desc_tag_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void icc_4_t::tag_table_t::tag_definition_t::device_model_desc_tag_t::_read() {
    m_tag_type = static_cast<icc_4_t::tag_table_t::tag_definition_t::tag_type_signatures_t>(m__io->read_u4be());
    n_tag_data = true;
    switch (tag_type()) {
    case icc_4_t::tag_table_t::tag_definition_t::TAG_TYPE_SIGNATURES_MULTI_LOCALIZED_UNICODE_TYPE: {
        n_tag_data = false;
        m_tag_data = std::unique_ptr<multi_localized_unicode_type_t>(new multi_localized_unicode_type_t(m__io, this, m__root));
        break;
    }
    }
}

icc_4_t::tag_table_t::tag_definition_t::device_model_desc_tag_t::~device_model_desc_tag_t() {
    _clean_up();
}

void icc_4_t::tag_table_t::tag_definition_t::device_model_desc_tag_t::_clean_up() {
    if (!n_tag_data) {
    }
}

icc_4_t::tag_table_t::tag_definition_t::gamut_tag_t::gamut_tag_t(kaitai::kstream* p__io, icc_4_t::tag_table_t::tag_definition_t* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void icc_4_t::tag_table_t::tag_definition_t::gamut_tag_t::_read() {
    m_tag_type = static_cast<icc_4_t::tag_table_t::tag_definition_t::tag_type_signatures_t>(m__io->read_u4be());
    n_tag_data = true;
    switch (tag_type()) {
    case icc_4_t::tag_table_t::tag_definition_t::TAG_TYPE_SIGNATURES_MULTI_FUNCTION_B_TO_A_TABLE_TYPE: {
        n_tag_data = false;
        m_tag_data = std::unique_ptr<lut_b_to_a_type_t>(new lut_b_to_a_type_t(m__io, this, m__root));
        break;
    }
    case icc_4_t::tag_table_t::tag_definition_t::TAG_TYPE_SIGNATURES_MULTI_FUNCTION_TABLE_WITH_ONE_BYTE_PRECISION_TYPE: {
        n_tag_data = false;
        m_tag_data = std::unique_ptr<lut_8_type_t>(new lut_8_type_t(m__io, this, m__root));
        break;
    }
    case icc_4_t::tag_table_t::tag_definition_t::TAG_TYPE_SIGNATURES_MULTI_FUNCTION_TABLE_WITH_TWO_BYTE_PRECISION_TYPE: {
        n_tag_data = false;
        m_tag_data = std::unique_ptr<lut_16_type_t>(new lut_16_type_t(m__io, this, m__root));
        break;
    }
    }
}

icc_4_t::tag_table_t::tag_definition_t::gamut_tag_t::~gamut_tag_t() {
    _clean_up();
}

void icc_4_t::tag_table_t::tag_definition_t::gamut_tag_t::_clean_up() {
    if (!n_tag_data) {
    }
}

icc_4_t::tag_table_t::tag_definition_t::gray_trc_tag_t::gray_trc_tag_t(kaitai::kstream* p__io, icc_4_t::tag_table_t::tag_definition_t* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void icc_4_t::tag_table_t::tag_definition_t::gray_trc_tag_t::_read() {
    m_tag_type = static_cast<icc_4_t::tag_table_t::tag_definition_t::tag_type_signatures_t>(m__io->read_u4be());
    n_tag_data = true;
    switch (tag_type()) {
    case icc_4_t::tag_table_t::tag_definition_t::TAG_TYPE_SIGNATURES_CURVE_TYPE: {
        n_tag_data = false;
        m_tag_data = std::unique_ptr<curve_type_t>(new curve_type_t(m__io, this, m__root));
        break;
    }
    case icc_4_t::tag_table_t::tag_definition_t::TAG_TYPE_SIGNATURES_PARAMETRIC_CURVE_TYPE: {
        n_tag_data = false;
        m_tag_data = std::unique_ptr<parametric_curve_type_t>(new parametric_curve_type_t(m__io, this, m__root));
        break;
    }
    }
}

icc_4_t::tag_table_t::tag_definition_t::gray_trc_tag_t::~gray_trc_tag_t() {
    _clean_up();
}

void icc_4_t::tag_table_t::tag_definition_t::gray_trc_tag_t::_clean_up() {
    if (!n_tag_data) {
    }
}

icc_4_t::tag_table_t::tag_definition_t::green_matrix_column_tag_t::green_matrix_column_tag_t(kaitai::kstream* p__io, icc_4_t::tag_table_t::tag_definition_t* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void icc_4_t::tag_table_t::tag_definition_t::green_matrix_column_tag_t::_read() {
    m_tag_type = static_cast<icc_4_t::tag_table_t::tag_definition_t::tag_type_signatures_t>(m__io->read_u4be());
    n_tag_data = true;
    switch (tag_type()) {
    case icc_4_t::tag_table_t::tag_definition_t::TAG_TYPE_SIGNATURES_XYZ_TYPE: {
        n_tag_data = false;
        m_tag_data = std::unique_ptr<xyz_type_t>(new xyz_type_t(m__io, this, m__root));
        break;
    }
    }
}

icc_4_t::tag_table_t::tag_definition_t::green_matrix_column_tag_t::~green_matrix_column_tag_t() {
    _clean_up();
}

void icc_4_t::tag_table_t::tag_definition_t::green_matrix_column_tag_t::_clean_up() {
    if (!n_tag_data) {
    }
}

icc_4_t::tag_table_t::tag_definition_t::green_trc_tag_t::green_trc_tag_t(kaitai::kstream* p__io, icc_4_t::tag_table_t::tag_definition_t* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void icc_4_t::tag_table_t::tag_definition_t::green_trc_tag_t::_read() {
    m_tag_type = static_cast<icc_4_t::tag_table_t::tag_definition_t::tag_type_signatures_t>(m__io->read_u4be());
    n_tag_data = true;
    switch (tag_type()) {
    case icc_4_t::tag_table_t::tag_definition_t::TAG_TYPE_SIGNATURES_CURVE_TYPE: {
        n_tag_data = false;
        m_tag_data = std::unique_ptr<curve_type_t>(new curve_type_t(m__io, this, m__root));
        break;
    }
    case icc_4_t::tag_table_t::tag_definition_t::TAG_TYPE_SIGNATURES_PARAMETRIC_CURVE_TYPE: {
        n_tag_data = false;
        m_tag_data = std::unique_ptr<parametric_curve_type_t>(new parametric_curve_type_t(m__io, this, m__root));
        break;
    }
    }
}

icc_4_t::tag_table_t::tag_definition_t::green_trc_tag_t::~green_trc_tag_t() {
    _clean_up();
}

void icc_4_t::tag_table_t::tag_definition_t::green_trc_tag_t::_clean_up() {
    if (!n_tag_data) {
    }
}

icc_4_t::tag_table_t::tag_definition_t::luminance_tag_t::luminance_tag_t(kaitai::kstream* p__io, icc_4_t::tag_table_t::tag_definition_t* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void icc_4_t::tag_table_t::tag_definition_t::luminance_tag_t::_read() {
    m_tag_type = static_cast<icc_4_t::tag_table_t::tag_definition_t::tag_type_signatures_t>(m__io->read_u4be());
    n_tag_data = true;
    switch (tag_type()) {
    case icc_4_t::tag_table_t::tag_definition_t::TAG_TYPE_SIGNATURES_XYZ_TYPE: {
        n_tag_data = false;
        m_tag_data = std::unique_ptr<xyz_type_t>(new xyz_type_t(m__io, this, m__root));
        break;
    }
    }
}

icc_4_t::tag_table_t::tag_definition_t::luminance_tag_t::~luminance_tag_t() {
    _clean_up();
}

void icc_4_t::tag_table_t::tag_definition_t::luminance_tag_t::_clean_up() {
    if (!n_tag_data) {
    }
}

icc_4_t::tag_table_t::tag_definition_t::lut_16_type_t::lut_16_type_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_encoded_e_parameters = nullptr;
    _read();
}

void icc_4_t::tag_table_t::tag_definition_t::lut_16_type_t::_read() {
    m_reserved = m__io->read_bytes(4);
    if (!(m_reserved == std::string("\x00\x00\x00\x00", 4))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x00\x00\x00\x00", 4), m_reserved, m__io, std::string("/types/tag_table/types/tag_definition/types/lut_16_type/seq/0"));
    }
    m_number_of_input_channels = m__io->read_u1();
    m_number_of_output_channels = m__io->read_u1();
    m_number_of_clut_grid_points = m__io->read_u1();
    m_padding = m__io->read_bytes(1);
    if (!(m_padding == std::string("\x00", 1))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x00", 1), m_padding, m__io, std::string("/types/tag_table/types/tag_definition/types/lut_16_type/seq/4"));
    }
    m_encoded_e_parameters = std::unique_ptr<std::vector<int32_t>>(new std::vector<int32_t>());
    const int l_encoded_e_parameters = 9;
    for (int i = 0; i < l_encoded_e_parameters; i++) {
        m_encoded_e_parameters->push_back(std::move(m__io->read_s4be()));
    }
    m_number_of_input_table_entries = m__io->read_u2be();
    m_number_of_output_table_entries = m__io->read_u2be();
    m_input_tables = m__io->read_bytes((2 * number_of_input_channels()) * number_of_input_table_entries());
    m_clut_values = m__io->read_bytes((2 * (number_of_clut_grid_points() ^ number_of_input_channels())) * number_of_output_channels());
    m_output_tables = m__io->read_bytes((2 * number_of_output_channels()) * number_of_output_table_entries());
}

icc_4_t::tag_table_t::tag_definition_t::lut_16_type_t::~lut_16_type_t() {
    _clean_up();
}

void icc_4_t::tag_table_t::tag_definition_t::lut_16_type_t::_clean_up() {
}

icc_4_t::tag_table_t::tag_definition_t::lut_8_type_t::lut_8_type_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_encoded_e_parameters = nullptr;
    _read();
}

void icc_4_t::tag_table_t::tag_definition_t::lut_8_type_t::_read() {
    m_reserved = m__io->read_bytes(4);
    if (!(m_reserved == std::string("\x00\x00\x00\x00", 4))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x00\x00\x00\x00", 4), m_reserved, m__io, std::string("/types/tag_table/types/tag_definition/types/lut_8_type/seq/0"));
    }
    m_number_of_input_channels = m__io->read_u1();
    m_number_of_output_channels = m__io->read_u1();
    m_number_of_clut_grid_points = m__io->read_u1();
    m_padding = m__io->read_bytes(1);
    if (!(m_padding == std::string("\x00", 1))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x00", 1), m_padding, m__io, std::string("/types/tag_table/types/tag_definition/types/lut_8_type/seq/4"));
    }
    m_encoded_e_parameters = std::unique_ptr<std::vector<int32_t>>(new std::vector<int32_t>());
    const int l_encoded_e_parameters = 9;
    for (int i = 0; i < l_encoded_e_parameters; i++) {
        m_encoded_e_parameters->push_back(std::move(m__io->read_s4be()));
    }
    m_number_of_input_table_entries = m__io->read_u4be();
    m_number_of_output_table_entries = m__io->read_u4be();
    m_input_tables = m__io->read_bytes(256 * number_of_input_channels());
    m_clut_values = m__io->read_bytes((number_of_clut_grid_points() ^ number_of_input_channels()) * number_of_output_channels());
    m_output_tables = m__io->read_bytes(256 * number_of_output_channels());
}

icc_4_t::tag_table_t::tag_definition_t::lut_8_type_t::~lut_8_type_t() {
    _clean_up();
}

void icc_4_t::tag_table_t::tag_definition_t::lut_8_type_t::_clean_up() {
}

icc_4_t::tag_table_t::tag_definition_t::lut_a_to_b_type_t::lut_a_to_b_type_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void icc_4_t::tag_table_t::tag_definition_t::lut_a_to_b_type_t::_read() {
    m_reserved = m__io->read_bytes(4);
    if (!(m_reserved == std::string("\x00\x00\x00\x00", 4))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x00\x00\x00\x00", 4), m_reserved, m__io, std::string("/types/tag_table/types/tag_definition/types/lut_a_to_b_type/seq/0"));
    }
    m_number_of_input_channels = m__io->read_u1();
    m_number_of_output_channels = m__io->read_u1();
    m_padding = m__io->read_bytes(2);
    if (!(m_padding == std::string("\x00\x00", 2))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x00\x00", 2), m_padding, m__io, std::string("/types/tag_table/types/tag_definition/types/lut_a_to_b_type/seq/3"));
    }
    m_offset_to_first_b_curve = m__io->read_u4be();
    m_offset_to_matrix = m__io->read_u4be();
    m_offset_to_first_m_curve = m__io->read_u4be();
    m_offset_to_clut = m__io->read_u4be();
    m_offset_to_first_a_curve = m__io->read_u4be();
    m_data = m__io->read_bytes_full();
}

icc_4_t::tag_table_t::tag_definition_t::lut_a_to_b_type_t::~lut_a_to_b_type_t() {
    _clean_up();
}

void icc_4_t::tag_table_t::tag_definition_t::lut_a_to_b_type_t::_clean_up() {
}

icc_4_t::tag_table_t::tag_definition_t::lut_b_to_a_type_t::lut_b_to_a_type_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void icc_4_t::tag_table_t::tag_definition_t::lut_b_to_a_type_t::_read() {
    m_reserved = m__io->read_bytes(4);
    if (!(m_reserved == std::string("\x00\x00\x00\x00", 4))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x00\x00\x00\x00", 4), m_reserved, m__io, std::string("/types/tag_table/types/tag_definition/types/lut_b_to_a_type/seq/0"));
    }
    m_number_of_input_channels = m__io->read_u1();
    m_number_of_output_channels = m__io->read_u1();
    m_padding = m__io->read_bytes(2);
    if (!(m_padding == std::string("\x00\x00", 2))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x00\x00", 2), m_padding, m__io, std::string("/types/tag_table/types/tag_definition/types/lut_b_to_a_type/seq/3"));
    }
    m_offset_to_first_b_curve = m__io->read_u4be();
    m_offset_to_matrix = m__io->read_u4be();
    m_offset_to_first_m_curve = m__io->read_u4be();
    m_offset_to_clut = m__io->read_u4be();
    m_offset_to_first_a_curve = m__io->read_u4be();
    m_data = m__io->read_bytes_full();
}

icc_4_t::tag_table_t::tag_definition_t::lut_b_to_a_type_t::~lut_b_to_a_type_t() {
    _clean_up();
}

void icc_4_t::tag_table_t::tag_definition_t::lut_b_to_a_type_t::_clean_up() {
}

icc_4_t::tag_table_t::tag_definition_t::measurement_tag_t::measurement_tag_t(kaitai::kstream* p__io, icc_4_t::tag_table_t::tag_definition_t* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void icc_4_t::tag_table_t::tag_definition_t::measurement_tag_t::_read() {
    m_tag_type = static_cast<icc_4_t::tag_table_t::tag_definition_t::tag_type_signatures_t>(m__io->read_u4be());
    n_tag_data = true;
    switch (tag_type()) {
    case icc_4_t::tag_table_t::tag_definition_t::TAG_TYPE_SIGNATURES_MEASUREMENT_TYPE: {
        n_tag_data = false;
        m_tag_data = std::unique_ptr<measurement_type_t>(new measurement_type_t(m__io, this, m__root));
        break;
    }
    }
}

icc_4_t::tag_table_t::tag_definition_t::measurement_tag_t::~measurement_tag_t() {
    _clean_up();
}

void icc_4_t::tag_table_t::tag_definition_t::measurement_tag_t::_clean_up() {
    if (!n_tag_data) {
    }
}
const std::set<icc_4_t::tag_table_t::tag_definition_t::measurement_type_t::measurement_flare_encodings_t> icc_4_t::tag_table_t::tag_definition_t::measurement_type_t::_values_measurement_flare_encodings_t{
    icc_4_t::tag_table_t::tag_definition_t::measurement_type_t::MEASUREMENT_FLARE_ENCODINGS_ZERO_PERCENT,
    icc_4_t::tag_table_t::tag_definition_t::measurement_type_t::MEASUREMENT_FLARE_ENCODINGS_ONE_HUNDRED_PERCENT,
};
bool icc_4_t::tag_table_t::tag_definition_t::measurement_type_t::_is_defined_measurement_flare_encodings_t(icc_4_t::tag_table_t::tag_definition_t::measurement_type_t::measurement_flare_encodings_t v) {
    return icc_4_t::tag_table_t::tag_definition_t::measurement_type_t::_values_measurement_flare_encodings_t.find(v) != icc_4_t::tag_table_t::tag_definition_t::measurement_type_t::_values_measurement_flare_encodings_t.end();
}
const std::set<icc_4_t::tag_table_t::tag_definition_t::measurement_type_t::measurement_geometry_encodings_t> icc_4_t::tag_table_t::tag_definition_t::measurement_type_t::_values_measurement_geometry_encodings_t{
    icc_4_t::tag_table_t::tag_definition_t::measurement_type_t::MEASUREMENT_GEOMETRY_ENCODINGS_UNKNOWN,
    icc_4_t::tag_table_t::tag_definition_t::measurement_type_t::MEASUREMENT_GEOMETRY_ENCODINGS_ZERO_DEGREES_TO_45_DEGREES_OR_45_DEGREES_TO_ZERO_DEGREES,
    icc_4_t::tag_table_t::tag_definition_t::measurement_type_t::MEASUREMENT_GEOMETRY_ENCODINGS_ZERO_DEGREES_TO_D_DEGREES_OR_D_DEGREES_TO_ZERO_DEGREES,
};
bool icc_4_t::tag_table_t::tag_definition_t::measurement_type_t::_is_defined_measurement_geometry_encodings_t(icc_4_t::tag_table_t::tag_definition_t::measurement_type_t::measurement_geometry_encodings_t v) {
    return icc_4_t::tag_table_t::tag_definition_t::measurement_type_t::_values_measurement_geometry_encodings_t.find(v) != icc_4_t::tag_table_t::tag_definition_t::measurement_type_t::_values_measurement_geometry_encodings_t.end();
}
const std::set<icc_4_t::tag_table_t::tag_definition_t::measurement_type_t::standard_observer_encodings_t> icc_4_t::tag_table_t::tag_definition_t::measurement_type_t::_values_standard_observer_encodings_t{
    icc_4_t::tag_table_t::tag_definition_t::measurement_type_t::STANDARD_OBSERVER_ENCODINGS_UNKNOWN,
    icc_4_t::tag_table_t::tag_definition_t::measurement_type_t::STANDARD_OBSERVER_ENCODINGS_CIE_1931_STANDARD_COLORIMETRIC_OBSERVER,
    icc_4_t::tag_table_t::tag_definition_t::measurement_type_t::STANDARD_OBSERVER_ENCODINGS_CIE_1964_STANDARD_COLORIMETRIC_OBSERVER,
};
bool icc_4_t::tag_table_t::tag_definition_t::measurement_type_t::_is_defined_standard_observer_encodings_t(icc_4_t::tag_table_t::tag_definition_t::measurement_type_t::standard_observer_encodings_t v) {
    return icc_4_t::tag_table_t::tag_definition_t::measurement_type_t::_values_standard_observer_encodings_t.find(v) != icc_4_t::tag_table_t::tag_definition_t::measurement_type_t::_values_standard_observer_encodings_t.end();
}

icc_4_t::tag_table_t::tag_definition_t::measurement_type_t::measurement_type_t(kaitai::kstream* p__io, icc_4_t::tag_table_t::tag_definition_t::measurement_tag_t* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_nciexyz_tristimulus_values_for_measurement_backing = nullptr;
    m_standard_illuminant_encoding = nullptr;
    _read();
}

void icc_4_t::tag_table_t::tag_definition_t::measurement_type_t::_read() {
    m_reserved = m__io->read_bytes(4);
    if (!(m_reserved == std::string("\x00\x00\x00\x00", 4))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x00\x00\x00\x00", 4), m_reserved, m__io, std::string("/types/tag_table/types/tag_definition/types/measurement_type/seq/0"));
    }
    m_standard_observer_encoding = static_cast<icc_4_t::tag_table_t::tag_definition_t::measurement_type_t::standard_observer_encodings_t>(m__io->read_u4be());
    m_nciexyz_tristimulus_values_for_measurement_backing = std::unique_ptr<xyz_number_t>(new xyz_number_t(m__io, this, m__root));
    m_measurement_geometry_encoding = static_cast<icc_4_t::tag_table_t::tag_definition_t::measurement_type_t::measurement_geometry_encodings_t>(m__io->read_u4be());
    m_measurement_flare_encoding = static_cast<icc_4_t::tag_table_t::tag_definition_t::measurement_type_t::measurement_flare_encodings_t>(m__io->read_u4be());
    m_standard_illuminant_encoding = std::unique_ptr<standard_illuminant_encoding_t>(new standard_illuminant_encoding_t(m__io, this, m__root));
}

icc_4_t::tag_table_t::tag_definition_t::measurement_type_t::~measurement_type_t() {
    _clean_up();
}

void icc_4_t::tag_table_t::tag_definition_t::measurement_type_t::_clean_up() {
}

icc_4_t::tag_table_t::tag_definition_t::media_white_point_tag_t::media_white_point_tag_t(kaitai::kstream* p__io, icc_4_t::tag_table_t::tag_definition_t* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void icc_4_t::tag_table_t::tag_definition_t::media_white_point_tag_t::_read() {
    m_tag_type = static_cast<icc_4_t::tag_table_t::tag_definition_t::tag_type_signatures_t>(m__io->read_u4be());
    n_tag_data = true;
    switch (tag_type()) {
    case icc_4_t::tag_table_t::tag_definition_t::TAG_TYPE_SIGNATURES_XYZ_TYPE: {
        n_tag_data = false;
        m_tag_data = std::unique_ptr<xyz_type_t>(new xyz_type_t(m__io, this, m__root));
        break;
    }
    }
}

icc_4_t::tag_table_t::tag_definition_t::media_white_point_tag_t::~media_white_point_tag_t() {
    _clean_up();
}

void icc_4_t::tag_table_t::tag_definition_t::media_white_point_tag_t::_clean_up() {
    if (!n_tag_data) {
    }
}

icc_4_t::tag_table_t::tag_definition_t::multi_localized_unicode_type_t::multi_localized_unicode_type_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_records = nullptr;
    _read();
}

void icc_4_t::tag_table_t::tag_definition_t::multi_localized_unicode_type_t::_read() {
    m_reserved = m__io->read_bytes(4);
    if (!(m_reserved == std::string("\x00\x00\x00\x00", 4))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x00\x00\x00\x00", 4), m_reserved, m__io, std::string("/types/tag_table/types/tag_definition/types/multi_localized_unicode_type/seq/0"));
    }
    m_number_of_records = m__io->read_u4be();
    m_record_size = m__io->read_u4be();
    m_records = std::unique_ptr<std::vector<std::unique_ptr<record_t>>>(new std::vector<std::unique_ptr<record_t>>());
    const int l_records = number_of_records();
    for (int i = 0; i < l_records; i++) {
        m_records->push_back(std::move(std::unique_ptr<record_t>(new record_t(m__io, this, m__root))));
    }
}

icc_4_t::tag_table_t::tag_definition_t::multi_localized_unicode_type_t::~multi_localized_unicode_type_t() {
    _clean_up();
}

void icc_4_t::tag_table_t::tag_definition_t::multi_localized_unicode_type_t::_clean_up() {
}

icc_4_t::tag_table_t::tag_definition_t::multi_localized_unicode_type_t::record_t::record_t(kaitai::kstream* p__io, icc_4_t::tag_table_t::tag_definition_t::multi_localized_unicode_type_t* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_string_data = false;
    _read();
}

void icc_4_t::tag_table_t::tag_definition_t::multi_localized_unicode_type_t::record_t::_read() {
    m_language_code = m__io->read_u2be();
    m_country_code = m__io->read_u2be();
    m_string_length = m__io->read_u4be();
    m_string_offset = m__io->read_u4be();
}

icc_4_t::tag_table_t::tag_definition_t::multi_localized_unicode_type_t::record_t::~record_t() {
    _clean_up();
}

void icc_4_t::tag_table_t::tag_definition_t::multi_localized_unicode_type_t::record_t::_clean_up() {
    if (f_string_data) {
    }
}

std::string icc_4_t::tag_table_t::tag_definition_t::multi_localized_unicode_type_t::record_t::string_data() {
    if (f_string_data)
        return m_string_data;
    f_string_data = true;
    std::streampos _pos = m__io->pos();
    m__io->seek(string_offset());
    m_string_data = kaitai::kstream::bytes_to_str(m__io->read_bytes(string_length()), "UTF-16BE");
    m__io->seek(_pos);
    return m_string_data;
}

icc_4_t::tag_table_t::tag_definition_t::multi_process_elements_type_t::multi_process_elements_type_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_process_element_positions_table = nullptr;
    _read();
}

void icc_4_t::tag_table_t::tag_definition_t::multi_process_elements_type_t::_read() {
    m_reserved = m__io->read_bytes(4);
    if (!(m_reserved == std::string("\x00\x00\x00\x00", 4))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x00\x00\x00\x00", 4), m_reserved, m__io, std::string("/types/tag_table/types/tag_definition/types/multi_process_elements_type/seq/0"));
    }
    m_number_of_input_channels = m__io->read_u2be();
    m_number_of_output_channels = m__io->read_u2be();
    m_number_of_processing_elements = m__io->read_u4be();
    m_process_element_positions_table = std::unique_ptr<std::vector<std::unique_ptr<position_number_t>>>(new std::vector<std::unique_ptr<position_number_t>>());
    const int l_process_element_positions_table = number_of_processing_elements();
    for (int i = 0; i < l_process_element_positions_table; i++) {
        m_process_element_positions_table->push_back(std::move(std::unique_ptr<position_number_t>(new position_number_t(m__io, this, m__root))));
    }
    m_data = m__io->read_bytes_full();
}

icc_4_t::tag_table_t::tag_definition_t::multi_process_elements_type_t::~multi_process_elements_type_t() {
    _clean_up();
}

void icc_4_t::tag_table_t::tag_definition_t::multi_process_elements_type_t::_clean_up() {
}

icc_4_t::tag_table_t::tag_definition_t::named_color_2_tag_t::named_color_2_tag_t(kaitai::kstream* p__io, icc_4_t::tag_table_t::tag_definition_t* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void icc_4_t::tag_table_t::tag_definition_t::named_color_2_tag_t::_read() {
    m_tag_type = static_cast<icc_4_t::tag_table_t::tag_definition_t::tag_type_signatures_t>(m__io->read_u4be());
    n_tag_data = true;
    switch (tag_type()) {
    case icc_4_t::tag_table_t::tag_definition_t::TAG_TYPE_SIGNATURES_NAMED_COLOR_2_TYPE: {
        n_tag_data = false;
        m_tag_data = std::unique_ptr<named_color_2_type_t>(new named_color_2_type_t(m__io, this, m__root));
        break;
    }
    }
}

icc_4_t::tag_table_t::tag_definition_t::named_color_2_tag_t::~named_color_2_tag_t() {
    _clean_up();
}

void icc_4_t::tag_table_t::tag_definition_t::named_color_2_tag_t::_clean_up() {
    if (!n_tag_data) {
    }
}

icc_4_t::tag_table_t::tag_definition_t::named_color_2_type_t::named_color_2_type_t(kaitai::kstream* p__io, icc_4_t::tag_table_t::tag_definition_t::named_color_2_tag_t* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_prefix_for_each_colour_name_padding = nullptr;
    m_suffix_for_each_colour_name_padding = nullptr;
    m_named_colour_definitions = nullptr;
    _read();
}

void icc_4_t::tag_table_t::tag_definition_t::named_color_2_type_t::_read() {
    m_reserved = m__io->read_bytes(4);
    if (!(m_reserved == std::string("\x00\x00\x00\x00", 4))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x00\x00\x00\x00", 4), m_reserved, m__io, std::string("/types/tag_table/types/tag_definition/types/named_color_2_type/seq/0"));
    }
    m_vendor_specific_flag = m__io->read_u4be();
    m_count_of_named_colours = m__io->read_u4be();
    m_number_of_device_coordinates_for_each_named_colour = m__io->read_u4be();
    m_prefix_for_each_colour_name = kaitai::kstream::bytes_to_str(m__io->read_bytes_term(0, false, true, true), "ASCII");
    m_prefix_for_each_colour_name_padding = std::unique_ptr<std::vector<std::string>>(new std::vector<std::string>());
    const int l_prefix_for_each_colour_name_padding = 32 - prefix_for_each_colour_name().length();
    for (int i = 0; i < l_prefix_for_each_colour_name_padding; i++) {
        m_prefix_for_each_colour_name_padding->push_back(std::move(m__io->read_bytes(1)));
        if (!(m_prefix_for_each_colour_name_padding->at(i) == std::string("\x00", 1))) {
            throw kaitai::validation_not_equal_error<std::string>(std::string("\x00", 1), m_prefix_for_each_colour_name_padding->at(i), m__io, std::string("/types/tag_table/types/tag_definition/types/named_color_2_type/seq/5"));
        }
    }
    m_suffix_for_each_colour_name = kaitai::kstream::bytes_to_str(m__io->read_bytes_term(0, false, true, true), "ASCII");
    m_suffix_for_each_colour_name_padding = std::unique_ptr<std::vector<std::string>>(new std::vector<std::string>());
    const int l_suffix_for_each_colour_name_padding = 32 - suffix_for_each_colour_name().length();
    for (int i = 0; i < l_suffix_for_each_colour_name_padding; i++) {
        m_suffix_for_each_colour_name_padding->push_back(std::move(m__io->read_bytes(1)));
        if (!(m_suffix_for_each_colour_name_padding->at(i) == std::string("\x00", 1))) {
            throw kaitai::validation_not_equal_error<std::string>(std::string("\x00", 1), m_suffix_for_each_colour_name_padding->at(i), m__io, std::string("/types/tag_table/types/tag_definition/types/named_color_2_type/seq/7"));
        }
    }
    m_named_colour_definitions = std::unique_ptr<std::vector<std::unique_ptr<named_colour_definition_t>>>(new std::vector<std::unique_ptr<named_colour_definition_t>>());
    const int l_named_colour_definitions = count_of_named_colours();
    for (int i = 0; i < l_named_colour_definitions; i++) {
        m_named_colour_definitions->push_back(std::move(std::unique_ptr<named_colour_definition_t>(new named_colour_definition_t(m__io, this, m__root))));
    }
}

icc_4_t::tag_table_t::tag_definition_t::named_color_2_type_t::~named_color_2_type_t() {
    _clean_up();
}

void icc_4_t::tag_table_t::tag_definition_t::named_color_2_type_t::_clean_up() {
}

icc_4_t::tag_table_t::tag_definition_t::named_color_2_type_t::named_colour_definition_t::named_colour_definition_t(kaitai::kstream* p__io, icc_4_t::tag_table_t::tag_definition_t::named_color_2_type_t* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_root_name_padding = nullptr;
    m_device_coordinates = nullptr;
    _read();
}

void icc_4_t::tag_table_t::tag_definition_t::named_color_2_type_t::named_colour_definition_t::_read() {
    m_root_name = kaitai::kstream::bytes_to_str(m__io->read_bytes_term(0, false, true, true), "ASCII");
    m_root_name_padding = std::unique_ptr<std::vector<std::string>>(new std::vector<std::string>());
    const int l_root_name_padding = 32 - root_name().length();
    for (int i = 0; i < l_root_name_padding; i++) {
        m_root_name_padding->push_back(std::move(m__io->read_bytes(1)));
        if (!(m_root_name_padding->at(i) == std::string("\x00", 1))) {
            throw kaitai::validation_not_equal_error<std::string>(std::string("\x00", 1), m_root_name_padding->at(i), m__io, std::string("/types/tag_table/types/tag_definition/types/named_color_2_type/types/named_colour_definition/seq/1"));
        }
    }
    m_pcs_coordinates = m__io->read_bytes(6);
    n_device_coordinates = true;
    if (_parent()->number_of_device_coordinates_for_each_named_colour() > 0) {
        n_device_coordinates = false;
        m_device_coordinates = std::unique_ptr<std::vector<uint16_t>>(new std::vector<uint16_t>());
        const int l_device_coordinates = _parent()->number_of_device_coordinates_for_each_named_colour();
        for (int i = 0; i < l_device_coordinates; i++) {
            m_device_coordinates->push_back(std::move(m__io->read_u2be()));
        }
    }
}

icc_4_t::tag_table_t::tag_definition_t::named_color_2_type_t::named_colour_definition_t::~named_colour_definition_t() {
    _clean_up();
}

void icc_4_t::tag_table_t::tag_definition_t::named_color_2_type_t::named_colour_definition_t::_clean_up() {
    if (!n_device_coordinates) {
    }
}

icc_4_t::tag_table_t::tag_definition_t::output_response_tag_t::output_response_tag_t(kaitai::kstream* p__io, icc_4_t::tag_table_t::tag_definition_t* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void icc_4_t::tag_table_t::tag_definition_t::output_response_tag_t::_read() {
    m_tag_type = static_cast<icc_4_t::tag_table_t::tag_definition_t::tag_type_signatures_t>(m__io->read_u4be());
    n_tag_data = true;
    switch (tag_type()) {
    case icc_4_t::tag_table_t::tag_definition_t::TAG_TYPE_SIGNATURES_RESPONSE_CURVE_SET_16_TYPE: {
        n_tag_data = false;
        m_tag_data = std::unique_ptr<response_curve_set_16_type_t>(new response_curve_set_16_type_t(m__io, this, m__root));
        break;
    }
    }
}

icc_4_t::tag_table_t::tag_definition_t::output_response_tag_t::~output_response_tag_t() {
    _clean_up();
}

void icc_4_t::tag_table_t::tag_definition_t::output_response_tag_t::_clean_up() {
    if (!n_tag_data) {
    }
}
const std::set<icc_4_t::tag_table_t::tag_definition_t::parametric_curve_type_t::parametric_curve_type_functions_t> icc_4_t::tag_table_t::tag_definition_t::parametric_curve_type_t::_values_parametric_curve_type_functions_t{
    icc_4_t::tag_table_t::tag_definition_t::parametric_curve_type_t::PARAMETRIC_CURVE_TYPE_FUNCTIONS_Y_EQUALS_X_TO_POWER_OF_G,
    icc_4_t::tag_table_t::tag_definition_t::parametric_curve_type_t::PARAMETRIC_CURVE_TYPE_FUNCTIONS_CIE_122_1996,
    icc_4_t::tag_table_t::tag_definition_t::parametric_curve_type_t::PARAMETRIC_CURVE_TYPE_FUNCTIONS_IEC_61966_3,
    icc_4_t::tag_table_t::tag_definition_t::parametric_curve_type_t::PARAMETRIC_CURVE_TYPE_FUNCTIONS_IEC_61966_2_1,
    icc_4_t::tag_table_t::tag_definition_t::parametric_curve_type_t::PARAMETRIC_CURVE_TYPE_FUNCTIONS_Y_EQUALS_OB_AX_PLUS_B_CB_TO_POWER_OF_G_PLUS_C,
};
bool icc_4_t::tag_table_t::tag_definition_t::parametric_curve_type_t::_is_defined_parametric_curve_type_functions_t(icc_4_t::tag_table_t::tag_definition_t::parametric_curve_type_t::parametric_curve_type_functions_t v) {
    return icc_4_t::tag_table_t::tag_definition_t::parametric_curve_type_t::_values_parametric_curve_type_functions_t.find(v) != icc_4_t::tag_table_t::tag_definition_t::parametric_curve_type_t::_values_parametric_curve_type_functions_t.end();
}

icc_4_t::tag_table_t::tag_definition_t::parametric_curve_type_t::parametric_curve_type_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void icc_4_t::tag_table_t::tag_definition_t::parametric_curve_type_t::_read() {
    m_reserved = m__io->read_bytes(4);
    if (!(m_reserved == std::string("\x00\x00\x00\x00", 4))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x00\x00\x00\x00", 4), m_reserved, m__io, std::string("/types/tag_table/types/tag_definition/types/parametric_curve_type/seq/0"));
    }
    m_function_type = static_cast<icc_4_t::tag_table_t::tag_definition_t::parametric_curve_type_t::parametric_curve_type_functions_t>(m__io->read_u2be());
    m_reserved_2 = m__io->read_bytes(2);
    if (!(m_reserved_2 == std::string("\x00\x00", 2))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x00\x00", 2), m_reserved_2, m__io, std::string("/types/tag_table/types/tag_definition/types/parametric_curve_type/seq/2"));
    }
    n_parameters = true;
    switch (function_type()) {
    case icc_4_t::tag_table_t::tag_definition_t::parametric_curve_type_t::PARAMETRIC_CURVE_TYPE_FUNCTIONS_CIE_122_1996: {
        n_parameters = false;
        m_parameters = std::unique_ptr<params_cie_122_1996_t>(new params_cie_122_1996_t(m__io, this, m__root));
        break;
    }
    case icc_4_t::tag_table_t::tag_definition_t::parametric_curve_type_t::PARAMETRIC_CURVE_TYPE_FUNCTIONS_IEC_61966_2_1: {
        n_parameters = false;
        m_parameters = std::unique_ptr<params_iec_61966_2_1_t>(new params_iec_61966_2_1_t(m__io, this, m__root));
        break;
    }
    case icc_4_t::tag_table_t::tag_definition_t::parametric_curve_type_t::PARAMETRIC_CURVE_TYPE_FUNCTIONS_IEC_61966_3: {
        n_parameters = false;
        m_parameters = std::unique_ptr<params_iec_61966_3_t>(new params_iec_61966_3_t(m__io, this, m__root));
        break;
    }
    case icc_4_t::tag_table_t::tag_definition_t::parametric_curve_type_t::PARAMETRIC_CURVE_TYPE_FUNCTIONS_Y_EQUALS_OB_AX_PLUS_B_CB_TO_POWER_OF_G_PLUS_C: {
        n_parameters = false;
        m_parameters = std::unique_ptr<params_y_equals_ob_ax_plus_b_cb_to_power_of_g_plus_c_t>(new params_y_equals_ob_ax_plus_b_cb_to_power_of_g_plus_c_t(m__io, this, m__root));
        break;
    }
    case icc_4_t::tag_table_t::tag_definition_t::parametric_curve_type_t::PARAMETRIC_CURVE_TYPE_FUNCTIONS_Y_EQUALS_X_TO_POWER_OF_G: {
        n_parameters = false;
        m_parameters = std::unique_ptr<params_y_equals_x_to_power_of_g_t>(new params_y_equals_x_to_power_of_g_t(m__io, this, m__root));
        break;
    }
    }
}

icc_4_t::tag_table_t::tag_definition_t::parametric_curve_type_t::~parametric_curve_type_t() {
    _clean_up();
}

void icc_4_t::tag_table_t::tag_definition_t::parametric_curve_type_t::_clean_up() {
    if (!n_parameters) {
    }
}

icc_4_t::tag_table_t::tag_definition_t::parametric_curve_type_t::params_cie_122_1996_t::params_cie_122_1996_t(kaitai::kstream* p__io, icc_4_t::tag_table_t::tag_definition_t::parametric_curve_type_t* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void icc_4_t::tag_table_t::tag_definition_t::parametric_curve_type_t::params_cie_122_1996_t::_read() {
    m_g = m__io->read_s4be();
    m_a = m__io->read_s4be();
    m_b = m__io->read_s4be();
}

icc_4_t::tag_table_t::tag_definition_t::parametric_curve_type_t::params_cie_122_1996_t::~params_cie_122_1996_t() {
    _clean_up();
}

void icc_4_t::tag_table_t::tag_definition_t::parametric_curve_type_t::params_cie_122_1996_t::_clean_up() {
}

icc_4_t::tag_table_t::tag_definition_t::parametric_curve_type_t::params_iec_61966_2_1_t::params_iec_61966_2_1_t(kaitai::kstream* p__io, icc_4_t::tag_table_t::tag_definition_t::parametric_curve_type_t* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void icc_4_t::tag_table_t::tag_definition_t::parametric_curve_type_t::params_iec_61966_2_1_t::_read() {
    m_g = m__io->read_s4be();
    m_a = m__io->read_s4be();
    m_b = m__io->read_s4be();
    m_c = m__io->read_s4be();
    m_d = m__io->read_s4be();
}

icc_4_t::tag_table_t::tag_definition_t::parametric_curve_type_t::params_iec_61966_2_1_t::~params_iec_61966_2_1_t() {
    _clean_up();
}

void icc_4_t::tag_table_t::tag_definition_t::parametric_curve_type_t::params_iec_61966_2_1_t::_clean_up() {
}

icc_4_t::tag_table_t::tag_definition_t::parametric_curve_type_t::params_iec_61966_3_t::params_iec_61966_3_t(kaitai::kstream* p__io, icc_4_t::tag_table_t::tag_definition_t::parametric_curve_type_t* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void icc_4_t::tag_table_t::tag_definition_t::parametric_curve_type_t::params_iec_61966_3_t::_read() {
    m_g = m__io->read_s4be();
    m_a = m__io->read_s4be();
    m_b = m__io->read_s4be();
    m_c = m__io->read_s4be();
}

icc_4_t::tag_table_t::tag_definition_t::parametric_curve_type_t::params_iec_61966_3_t::~params_iec_61966_3_t() {
    _clean_up();
}

void icc_4_t::tag_table_t::tag_definition_t::parametric_curve_type_t::params_iec_61966_3_t::_clean_up() {
}

icc_4_t::tag_table_t::tag_definition_t::parametric_curve_type_t::params_y_equals_ob_ax_plus_b_cb_to_power_of_g_plus_c_t::params_y_equals_ob_ax_plus_b_cb_to_power_of_g_plus_c_t(kaitai::kstream* p__io, icc_4_t::tag_table_t::tag_definition_t::parametric_curve_type_t* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void icc_4_t::tag_table_t::tag_definition_t::parametric_curve_type_t::params_y_equals_ob_ax_plus_b_cb_to_power_of_g_plus_c_t::_read() {
    m_g = m__io->read_s4be();
    m_a = m__io->read_s4be();
    m_b = m__io->read_s4be();
    m_c = m__io->read_s4be();
    m_d = m__io->read_s4be();
    m_e = m__io->read_s4be();
    m_f = m__io->read_s4be();
}

icc_4_t::tag_table_t::tag_definition_t::parametric_curve_type_t::params_y_equals_ob_ax_plus_b_cb_to_power_of_g_plus_c_t::~params_y_equals_ob_ax_plus_b_cb_to_power_of_g_plus_c_t() {
    _clean_up();
}

void icc_4_t::tag_table_t::tag_definition_t::parametric_curve_type_t::params_y_equals_ob_ax_plus_b_cb_to_power_of_g_plus_c_t::_clean_up() {
}

icc_4_t::tag_table_t::tag_definition_t::parametric_curve_type_t::params_y_equals_x_to_power_of_g_t::params_y_equals_x_to_power_of_g_t(kaitai::kstream* p__io, icc_4_t::tag_table_t::tag_definition_t::parametric_curve_type_t* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void icc_4_t::tag_table_t::tag_definition_t::parametric_curve_type_t::params_y_equals_x_to_power_of_g_t::_read() {
    m_g = m__io->read_s4be();
}

icc_4_t::tag_table_t::tag_definition_t::parametric_curve_type_t::params_y_equals_x_to_power_of_g_t::~params_y_equals_x_to_power_of_g_t() {
    _clean_up();
}

void icc_4_t::tag_table_t::tag_definition_t::parametric_curve_type_t::params_y_equals_x_to_power_of_g_t::_clean_up() {
}

icc_4_t::tag_table_t::tag_definition_t::perceptual_rendering_intent_gamut_tag_t::perceptual_rendering_intent_gamut_tag_t(kaitai::kstream* p__io, icc_4_t::tag_table_t::tag_definition_t* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void icc_4_t::tag_table_t::tag_definition_t::perceptual_rendering_intent_gamut_tag_t::_read() {
    m_tag_type = static_cast<icc_4_t::tag_table_t::tag_definition_t::tag_type_signatures_t>(m__io->read_u4be());
    n_tag_data = true;
    switch (tag_type()) {
    case icc_4_t::tag_table_t::tag_definition_t::TAG_TYPE_SIGNATURES_SIGNATURE_TYPE: {
        n_tag_data = false;
        m_tag_data = std::unique_ptr<signature_type_t>(new signature_type_t(m__io, this, m__root));
        break;
    }
    }
}

icc_4_t::tag_table_t::tag_definition_t::perceptual_rendering_intent_gamut_tag_t::~perceptual_rendering_intent_gamut_tag_t() {
    _clean_up();
}

void icc_4_t::tag_table_t::tag_definition_t::perceptual_rendering_intent_gamut_tag_t::_clean_up() {
    if (!n_tag_data) {
    }
}

icc_4_t::tag_table_t::tag_definition_t::preview_0_tag_t::preview_0_tag_t(kaitai::kstream* p__io, icc_4_t::tag_table_t::tag_definition_t* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void icc_4_t::tag_table_t::tag_definition_t::preview_0_tag_t::_read() {
    m_tag_type = static_cast<icc_4_t::tag_table_t::tag_definition_t::tag_type_signatures_t>(m__io->read_u4be());
    n_tag_data = true;
    switch (tag_type()) {
    case icc_4_t::tag_table_t::tag_definition_t::TAG_TYPE_SIGNATURES_MULTI_FUNCTION_A_TO_B_TABLE_TYPE: {
        n_tag_data = false;
        m_tag_data = std::unique_ptr<lut_a_to_b_type_t>(new lut_a_to_b_type_t(m__io, this, m__root));
        break;
    }
    case icc_4_t::tag_table_t::tag_definition_t::TAG_TYPE_SIGNATURES_MULTI_FUNCTION_B_TO_A_TABLE_TYPE: {
        n_tag_data = false;
        m_tag_data = std::unique_ptr<lut_b_to_a_type_t>(new lut_b_to_a_type_t(m__io, this, m__root));
        break;
    }
    case icc_4_t::tag_table_t::tag_definition_t::TAG_TYPE_SIGNATURES_MULTI_FUNCTION_TABLE_WITH_ONE_BYTE_PRECISION_TYPE: {
        n_tag_data = false;
        m_tag_data = std::unique_ptr<lut_8_type_t>(new lut_8_type_t(m__io, this, m__root));
        break;
    }
    case icc_4_t::tag_table_t::tag_definition_t::TAG_TYPE_SIGNATURES_MULTI_FUNCTION_TABLE_WITH_TWO_BYTE_PRECISION_TYPE: {
        n_tag_data = false;
        m_tag_data = std::unique_ptr<lut_16_type_t>(new lut_16_type_t(m__io, this, m__root));
        break;
    }
    }
}

icc_4_t::tag_table_t::tag_definition_t::preview_0_tag_t::~preview_0_tag_t() {
    _clean_up();
}

void icc_4_t::tag_table_t::tag_definition_t::preview_0_tag_t::_clean_up() {
    if (!n_tag_data) {
    }
}

icc_4_t::tag_table_t::tag_definition_t::preview_1_tag_t::preview_1_tag_t(kaitai::kstream* p__io, icc_4_t::tag_table_t::tag_definition_t* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void icc_4_t::tag_table_t::tag_definition_t::preview_1_tag_t::_read() {
    m_tag_type = static_cast<icc_4_t::tag_table_t::tag_definition_t::tag_type_signatures_t>(m__io->read_u4be());
    n_tag_data = true;
    switch (tag_type()) {
    case icc_4_t::tag_table_t::tag_definition_t::TAG_TYPE_SIGNATURES_MULTI_FUNCTION_B_TO_A_TABLE_TYPE: {
        n_tag_data = false;
        m_tag_data = std::unique_ptr<lut_b_to_a_type_t>(new lut_b_to_a_type_t(m__io, this, m__root));
        break;
    }
    case icc_4_t::tag_table_t::tag_definition_t::TAG_TYPE_SIGNATURES_MULTI_FUNCTION_TABLE_WITH_ONE_BYTE_PRECISION_TYPE: {
        n_tag_data = false;
        m_tag_data = std::unique_ptr<lut_8_type_t>(new lut_8_type_t(m__io, this, m__root));
        break;
    }
    case icc_4_t::tag_table_t::tag_definition_t::TAG_TYPE_SIGNATURES_MULTI_FUNCTION_TABLE_WITH_TWO_BYTE_PRECISION_TYPE: {
        n_tag_data = false;
        m_tag_data = std::unique_ptr<lut_16_type_t>(new lut_16_type_t(m__io, this, m__root));
        break;
    }
    }
}

icc_4_t::tag_table_t::tag_definition_t::preview_1_tag_t::~preview_1_tag_t() {
    _clean_up();
}

void icc_4_t::tag_table_t::tag_definition_t::preview_1_tag_t::_clean_up() {
    if (!n_tag_data) {
    }
}

icc_4_t::tag_table_t::tag_definition_t::preview_2_tag_t::preview_2_tag_t(kaitai::kstream* p__io, icc_4_t::tag_table_t::tag_definition_t* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void icc_4_t::tag_table_t::tag_definition_t::preview_2_tag_t::_read() {
    m_tag_type = static_cast<icc_4_t::tag_table_t::tag_definition_t::tag_type_signatures_t>(m__io->read_u4be());
    n_tag_data = true;
    switch (tag_type()) {
    case icc_4_t::tag_table_t::tag_definition_t::TAG_TYPE_SIGNATURES_MULTI_FUNCTION_B_TO_A_TABLE_TYPE: {
        n_tag_data = false;
        m_tag_data = std::unique_ptr<lut_b_to_a_type_t>(new lut_b_to_a_type_t(m__io, this, m__root));
        break;
    }
    case icc_4_t::tag_table_t::tag_definition_t::TAG_TYPE_SIGNATURES_MULTI_FUNCTION_TABLE_WITH_ONE_BYTE_PRECISION_TYPE: {
        n_tag_data = false;
        m_tag_data = std::unique_ptr<lut_8_type_t>(new lut_8_type_t(m__io, this, m__root));
        break;
    }
    case icc_4_t::tag_table_t::tag_definition_t::TAG_TYPE_SIGNATURES_MULTI_FUNCTION_TABLE_WITH_TWO_BYTE_PRECISION_TYPE: {
        n_tag_data = false;
        m_tag_data = std::unique_ptr<lut_16_type_t>(new lut_16_type_t(m__io, this, m__root));
        break;
    }
    }
}

icc_4_t::tag_table_t::tag_definition_t::preview_2_tag_t::~preview_2_tag_t() {
    _clean_up();
}

void icc_4_t::tag_table_t::tag_definition_t::preview_2_tag_t::_clean_up() {
    if (!n_tag_data) {
    }
}

icc_4_t::tag_table_t::tag_definition_t::profile_description_tag_t::profile_description_tag_t(kaitai::kstream* p__io, icc_4_t::tag_table_t::tag_definition_t* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void icc_4_t::tag_table_t::tag_definition_t::profile_description_tag_t::_read() {
    m_tag_type = static_cast<icc_4_t::tag_table_t::tag_definition_t::tag_type_signatures_t>(m__io->read_u4be());
    n_tag_data = true;
    switch (tag_type()) {
    case icc_4_t::tag_table_t::tag_definition_t::TAG_TYPE_SIGNATURES_MULTI_LOCALIZED_UNICODE_TYPE: {
        n_tag_data = false;
        m_tag_data = std::unique_ptr<multi_localized_unicode_type_t>(new multi_localized_unicode_type_t(m__io, this, m__root));
        break;
    }
    }
}

icc_4_t::tag_table_t::tag_definition_t::profile_description_tag_t::~profile_description_tag_t() {
    _clean_up();
}

void icc_4_t::tag_table_t::tag_definition_t::profile_description_tag_t::_clean_up() {
    if (!n_tag_data) {
    }
}

icc_4_t::tag_table_t::tag_definition_t::profile_sequence_desc_type_t::profile_sequence_desc_type_t(kaitai::kstream* p__io, icc_4_t::tag_table_t::tag_definition_t::profile_sequence_tag_t* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_profile_descriptions = nullptr;
    _read();
}

void icc_4_t::tag_table_t::tag_definition_t::profile_sequence_desc_type_t::_read() {
    m_reserved = m__io->read_bytes(4);
    if (!(m_reserved == std::string("\x00\x00\x00\x00", 4))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x00\x00\x00\x00", 4), m_reserved, m__io, std::string("/types/tag_table/types/tag_definition/types/profile_sequence_desc_type/seq/0"));
    }
    m_number_of_description_structures = m__io->read_u4be();
    m_profile_descriptions = std::unique_ptr<std::vector<std::unique_ptr<profile_description_t>>>(new std::vector<std::unique_ptr<profile_description_t>>());
    const int l_profile_descriptions = number_of_description_structures();
    for (int i = 0; i < l_profile_descriptions; i++) {
        m_profile_descriptions->push_back(std::move(std::unique_ptr<profile_description_t>(new profile_description_t(m__io, this, m__root))));
    }
}

icc_4_t::tag_table_t::tag_definition_t::profile_sequence_desc_type_t::~profile_sequence_desc_type_t() {
    _clean_up();
}

void icc_4_t::tag_table_t::tag_definition_t::profile_sequence_desc_type_t::_clean_up() {
}

icc_4_t::tag_table_t::tag_definition_t::profile_sequence_desc_type_t::profile_description_t::profile_description_t(kaitai::kstream* p__io, icc_4_t::tag_table_t::tag_definition_t::profile_sequence_desc_type_t* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_device_manufacturer = nullptr;
    m_device_attributes = nullptr;
    m_device_technology = nullptr;
    m_description_of_device_manufacturer = nullptr;
    m_description_of_device_model = nullptr;
    _read();
}

void icc_4_t::tag_table_t::tag_definition_t::profile_sequence_desc_type_t::profile_description_t::_read() {
    m_device_manufacturer = std::unique_ptr<device_manufacturer_t>(new device_manufacturer_t(m__io, this, m__root));
    m_device_model = kaitai::kstream::bytes_to_str(m__io->read_bytes(4), "ASCII");
    m_device_attributes = std::unique_ptr<device_attributes_t>(new device_attributes_t(m__io, this, m__root));
    m_device_technology = std::unique_ptr<technology_tag_t>(new technology_tag_t(m__io, this, m__root));
    m_description_of_device_manufacturer = std::unique_ptr<device_mfg_desc_tag_t>(new device_mfg_desc_tag_t(m__io, this, m__root));
    m_description_of_device_model = std::unique_ptr<device_model_desc_tag_t>(new device_model_desc_tag_t(m__io, this, m__root));
}

icc_4_t::tag_table_t::tag_definition_t::profile_sequence_desc_type_t::profile_description_t::~profile_description_t() {
    _clean_up();
}

void icc_4_t::tag_table_t::tag_definition_t::profile_sequence_desc_type_t::profile_description_t::_clean_up() {
}

icc_4_t::tag_table_t::tag_definition_t::profile_sequence_identifier_tag_t::profile_sequence_identifier_tag_t(kaitai::kstream* p__io, icc_4_t::tag_table_t::tag_definition_t* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void icc_4_t::tag_table_t::tag_definition_t::profile_sequence_identifier_tag_t::_read() {
    m_tag_type = static_cast<icc_4_t::tag_table_t::tag_definition_t::tag_type_signatures_t>(m__io->read_u4be());
    n_tag_data = true;
    switch (tag_type()) {
    case icc_4_t::tag_table_t::tag_definition_t::TAG_TYPE_SIGNATURES_PROFILE_SEQUENCE_IDENTIFIER_TYPE: {
        n_tag_data = false;
        m_tag_data = std::unique_ptr<profile_sequence_identifier_type_t>(new profile_sequence_identifier_type_t(m__io, this, m__root));
        break;
    }
    }
}

icc_4_t::tag_table_t::tag_definition_t::profile_sequence_identifier_tag_t::~profile_sequence_identifier_tag_t() {
    _clean_up();
}

void icc_4_t::tag_table_t::tag_definition_t::profile_sequence_identifier_tag_t::_clean_up() {
    if (!n_tag_data) {
    }
}

icc_4_t::tag_table_t::tag_definition_t::profile_sequence_identifier_type_t::profile_sequence_identifier_type_t(kaitai::kstream* p__io, icc_4_t::tag_table_t::tag_definition_t::profile_sequence_identifier_tag_t* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_positions_table = nullptr;
    m_profile_identifiers = nullptr;
    _read();
}

void icc_4_t::tag_table_t::tag_definition_t::profile_sequence_identifier_type_t::_read() {
    m_reserved = m__io->read_bytes(4);
    if (!(m_reserved == std::string("\x00\x00\x00\x00", 4))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x00\x00\x00\x00", 4), m_reserved, m__io, std::string("/types/tag_table/types/tag_definition/types/profile_sequence_identifier_type/seq/0"));
    }
    m_number_of_structures = m__io->read_u4be();
    m_positions_table = std::unique_ptr<std::vector<std::unique_ptr<position_number_t>>>(new std::vector<std::unique_ptr<position_number_t>>());
    const int l_positions_table = number_of_structures();
    for (int i = 0; i < l_positions_table; i++) {
        m_positions_table->push_back(std::move(std::unique_ptr<position_number_t>(new position_number_t(m__io, this, m__root))));
    }
    m_profile_identifiers = std::unique_ptr<std::vector<std::unique_ptr<profile_identifier_t>>>(new std::vector<std::unique_ptr<profile_identifier_t>>());
    const int l_profile_identifiers = number_of_structures();
    for (int i = 0; i < l_profile_identifiers; i++) {
        m_profile_identifiers->push_back(std::move(std::unique_ptr<profile_identifier_t>(new profile_identifier_t(m__io, this, m__root))));
    }
}

icc_4_t::tag_table_t::tag_definition_t::profile_sequence_identifier_type_t::~profile_sequence_identifier_type_t() {
    _clean_up();
}

void icc_4_t::tag_table_t::tag_definition_t::profile_sequence_identifier_type_t::_clean_up() {
}

icc_4_t::tag_table_t::tag_definition_t::profile_sequence_identifier_type_t::profile_identifier_t::profile_identifier_t(kaitai::kstream* p__io, icc_4_t::tag_table_t::tag_definition_t::profile_sequence_identifier_type_t* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_profile_description = nullptr;
    _read();
}

void icc_4_t::tag_table_t::tag_definition_t::profile_sequence_identifier_type_t::profile_identifier_t::_read() {
    m_profile_id = m__io->read_bytes(16);
    m_profile_description = std::unique_ptr<multi_localized_unicode_type_t>(new multi_localized_unicode_type_t(m__io, this, m__root));
}

icc_4_t::tag_table_t::tag_definition_t::profile_sequence_identifier_type_t::profile_identifier_t::~profile_identifier_t() {
    _clean_up();
}

void icc_4_t::tag_table_t::tag_definition_t::profile_sequence_identifier_type_t::profile_identifier_t::_clean_up() {
}

icc_4_t::tag_table_t::tag_definition_t::profile_sequence_tag_t::profile_sequence_tag_t(kaitai::kstream* p__io, icc_4_t::tag_table_t::tag_definition_t* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void icc_4_t::tag_table_t::tag_definition_t::profile_sequence_tag_t::_read() {
    m_tag_type = static_cast<icc_4_t::tag_table_t::tag_definition_t::tag_type_signatures_t>(m__io->read_u4be());
    n_tag_data = true;
    switch (tag_type()) {
    case icc_4_t::tag_table_t::tag_definition_t::TAG_TYPE_SIGNATURES_PROFILE_SEQUENCE_DESC_TYPE: {
        n_tag_data = false;
        m_tag_data = std::unique_ptr<profile_sequence_desc_type_t>(new profile_sequence_desc_type_t(m__io, this, m__root));
        break;
    }
    }
}

icc_4_t::tag_table_t::tag_definition_t::profile_sequence_tag_t::~profile_sequence_tag_t() {
    _clean_up();
}

void icc_4_t::tag_table_t::tag_definition_t::profile_sequence_tag_t::_clean_up() {
    if (!n_tag_data) {
    }
}

icc_4_t::tag_table_t::tag_definition_t::red_matrix_column_tag_t::red_matrix_column_tag_t(kaitai::kstream* p__io, icc_4_t::tag_table_t::tag_definition_t* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void icc_4_t::tag_table_t::tag_definition_t::red_matrix_column_tag_t::_read() {
    m_tag_type = static_cast<icc_4_t::tag_table_t::tag_definition_t::tag_type_signatures_t>(m__io->read_u4be());
    n_tag_data = true;
    switch (tag_type()) {
    case icc_4_t::tag_table_t::tag_definition_t::TAG_TYPE_SIGNATURES_XYZ_TYPE: {
        n_tag_data = false;
        m_tag_data = std::unique_ptr<xyz_type_t>(new xyz_type_t(m__io, this, m__root));
        break;
    }
    }
}

icc_4_t::tag_table_t::tag_definition_t::red_matrix_column_tag_t::~red_matrix_column_tag_t() {
    _clean_up();
}

void icc_4_t::tag_table_t::tag_definition_t::red_matrix_column_tag_t::_clean_up() {
    if (!n_tag_data) {
    }
}

icc_4_t::tag_table_t::tag_definition_t::red_trc_tag_t::red_trc_tag_t(kaitai::kstream* p__io, icc_4_t::tag_table_t::tag_definition_t* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void icc_4_t::tag_table_t::tag_definition_t::red_trc_tag_t::_read() {
    m_tag_type = static_cast<icc_4_t::tag_table_t::tag_definition_t::tag_type_signatures_t>(m__io->read_u4be());
    n_tag_data = true;
    switch (tag_type()) {
    case icc_4_t::tag_table_t::tag_definition_t::TAG_TYPE_SIGNATURES_CURVE_TYPE: {
        n_tag_data = false;
        m_tag_data = std::unique_ptr<curve_type_t>(new curve_type_t(m__io, this, m__root));
        break;
    }
    case icc_4_t::tag_table_t::tag_definition_t::TAG_TYPE_SIGNATURES_PARAMETRIC_CURVE_TYPE: {
        n_tag_data = false;
        m_tag_data = std::unique_ptr<parametric_curve_type_t>(new parametric_curve_type_t(m__io, this, m__root));
        break;
    }
    }
}

icc_4_t::tag_table_t::tag_definition_t::red_trc_tag_t::~red_trc_tag_t() {
    _clean_up();
}

void icc_4_t::tag_table_t::tag_definition_t::red_trc_tag_t::_clean_up() {
    if (!n_tag_data) {
    }
}

icc_4_t::tag_table_t::tag_definition_t::response_curve_set_16_type_t::response_curve_set_16_type_t(kaitai::kstream* p__io, icc_4_t::tag_table_t::tag_definition_t::output_response_tag_t* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_response_curve_structure_offsets = nullptr;
    _read();
}

void icc_4_t::tag_table_t::tag_definition_t::response_curve_set_16_type_t::_read() {
    m_reserved = m__io->read_bytes(4);
    if (!(m_reserved == std::string("\x00\x00\x00\x00", 4))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x00\x00\x00\x00", 4), m_reserved, m__io, std::string("/types/tag_table/types/tag_definition/types/response_curve_set_16_type/seq/0"));
    }
    m_number_of_channels = m__io->read_u2be();
    m_count_of_measurement_types = m__io->read_u2be();
    m_response_curve_structure_offsets = std::unique_ptr<std::vector<uint32_t>>(new std::vector<uint32_t>());
    const int l_response_curve_structure_offsets = count_of_measurement_types();
    for (int i = 0; i < l_response_curve_structure_offsets; i++) {
        m_response_curve_structure_offsets->push_back(std::move(m__io->read_u4be()));
    }
    m_response_curve_structures = m__io->read_bytes_full();
}

icc_4_t::tag_table_t::tag_definition_t::response_curve_set_16_type_t::~response_curve_set_16_type_t() {
    _clean_up();
}

void icc_4_t::tag_table_t::tag_definition_t::response_curve_set_16_type_t::_clean_up() {
}

icc_4_t::tag_table_t::tag_definition_t::s_15_fixed_16_array_type_t::s_15_fixed_16_array_type_t(kaitai::kstream* p__io, icc_4_t::tag_table_t::tag_definition_t::chromatic_adaptation_tag_t* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_values = nullptr;
    _read();
}

void icc_4_t::tag_table_t::tag_definition_t::s_15_fixed_16_array_type_t::_read() {
    m_reserved = m__io->read_bytes(4);
    if (!(m_reserved == std::string("\x00\x00\x00\x00", 4))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x00\x00\x00\x00", 4), m_reserved, m__io, std::string("/types/tag_table/types/tag_definition/types/s_15_fixed_16_array_type/seq/0"));
    }
    m_values = std::unique_ptr<std::vector<std::unique_ptr<s_15_fixed_16_number_t>>>(new std::vector<std::unique_ptr<s_15_fixed_16_number_t>>());
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_values->push_back(std::move(std::unique_ptr<s_15_fixed_16_number_t>(new s_15_fixed_16_number_t(m__io, this, m__root))));
            i++;
        }
    }
}

icc_4_t::tag_table_t::tag_definition_t::s_15_fixed_16_array_type_t::~s_15_fixed_16_array_type_t() {
    _clean_up();
}

void icc_4_t::tag_table_t::tag_definition_t::s_15_fixed_16_array_type_t::_clean_up() {
}

icc_4_t::tag_table_t::tag_definition_t::saturation_rendering_intent_gamut_tag_t::saturation_rendering_intent_gamut_tag_t(kaitai::kstream* p__io, icc_4_t::tag_table_t::tag_definition_t* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void icc_4_t::tag_table_t::tag_definition_t::saturation_rendering_intent_gamut_tag_t::_read() {
    m_tag_type = static_cast<icc_4_t::tag_table_t::tag_definition_t::tag_type_signatures_t>(m__io->read_u4be());
    n_tag_data = true;
    switch (tag_type()) {
    case icc_4_t::tag_table_t::tag_definition_t::TAG_TYPE_SIGNATURES_SIGNATURE_TYPE: {
        n_tag_data = false;
        m_tag_data = std::unique_ptr<signature_type_t>(new signature_type_t(m__io, this, m__root));
        break;
    }
    }
}

icc_4_t::tag_table_t::tag_definition_t::saturation_rendering_intent_gamut_tag_t::~saturation_rendering_intent_gamut_tag_t() {
    _clean_up();
}

void icc_4_t::tag_table_t::tag_definition_t::saturation_rendering_intent_gamut_tag_t::_clean_up() {
    if (!n_tag_data) {
    }
}

icc_4_t::tag_table_t::tag_definition_t::signature_type_t::signature_type_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void icc_4_t::tag_table_t::tag_definition_t::signature_type_t::_read() {
    m_reserved = m__io->read_bytes(4);
    if (!(m_reserved == std::string("\x00\x00\x00\x00", 4))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x00\x00\x00\x00", 4), m_reserved, m__io, std::string("/types/tag_table/types/tag_definition/types/signature_type/seq/0"));
    }
    m_signature = kaitai::kstream::bytes_to_str(m__io->read_bytes(4), "ASCII");
}

icc_4_t::tag_table_t::tag_definition_t::signature_type_t::~signature_type_t() {
    _clean_up();
}

void icc_4_t::tag_table_t::tag_definition_t::signature_type_t::_clean_up() {
}

icc_4_t::tag_table_t::tag_definition_t::technology_tag_t::technology_tag_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void icc_4_t::tag_table_t::tag_definition_t::technology_tag_t::_read() {
    m_tag_type = static_cast<icc_4_t::tag_table_t::tag_definition_t::tag_type_signatures_t>(m__io->read_u4be());
    n_tag_data = true;
    switch (tag_type()) {
    case icc_4_t::tag_table_t::tag_definition_t::TAG_TYPE_SIGNATURES_SIGNATURE_TYPE: {
        n_tag_data = false;
        m_tag_data = std::unique_ptr<signature_type_t>(new signature_type_t(m__io, this, m__root));
        break;
    }
    }
}

icc_4_t::tag_table_t::tag_definition_t::technology_tag_t::~technology_tag_t() {
    _clean_up();
}

void icc_4_t::tag_table_t::tag_definition_t::technology_tag_t::_clean_up() {
    if (!n_tag_data) {
    }
}

icc_4_t::tag_table_t::tag_definition_t::text_type_t::text_type_t(kaitai::kstream* p__io, icc_4_t::tag_table_t::tag_definition_t::char_target_tag_t* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void icc_4_t::tag_table_t::tag_definition_t::text_type_t::_read() {
    m_reserved = m__io->read_bytes(4);
    if (!(m_reserved == std::string("\x00\x00\x00\x00", 4))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x00\x00\x00\x00", 4), m_reserved, m__io, std::string("/types/tag_table/types/tag_definition/types/text_type/seq/0"));
    }
    m_value = kaitai::kstream::bytes_to_str(kaitai::kstream::bytes_terminate(m__io->read_bytes_full(), 0, false), "ASCII");
}

icc_4_t::tag_table_t::tag_definition_t::text_type_t::~text_type_t() {
    _clean_up();
}

void icc_4_t::tag_table_t::tag_definition_t::text_type_t::_clean_up() {
}

icc_4_t::tag_table_t::tag_definition_t::u_16_fixed_16_array_type_t::u_16_fixed_16_array_type_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_values = nullptr;
    _read();
}

void icc_4_t::tag_table_t::tag_definition_t::u_16_fixed_16_array_type_t::_read() {
    m_reserved = m__io->read_bytes(4);
    if (!(m_reserved == std::string("\x00\x00\x00\x00", 4))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x00\x00\x00\x00", 4), m_reserved, m__io, std::string("/types/tag_table/types/tag_definition/types/u_16_fixed_16_array_type/seq/0"));
    }
    m_values = std::unique_ptr<std::vector<std::unique_ptr<u_16_fixed_16_number_t>>>(new std::vector<std::unique_ptr<u_16_fixed_16_number_t>>());
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_values->push_back(std::move(std::unique_ptr<u_16_fixed_16_number_t>(new u_16_fixed_16_number_t(m__io, this, m__root))));
            i++;
        }
    }
}

icc_4_t::tag_table_t::tag_definition_t::u_16_fixed_16_array_type_t::~u_16_fixed_16_array_type_t() {
    _clean_up();
}

void icc_4_t::tag_table_t::tag_definition_t::u_16_fixed_16_array_type_t::_clean_up() {
}

icc_4_t::tag_table_t::tag_definition_t::u_int_16_array_type_t::u_int_16_array_type_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_values = nullptr;
    _read();
}

void icc_4_t::tag_table_t::tag_definition_t::u_int_16_array_type_t::_read() {
    m_reserved = m__io->read_bytes(4);
    if (!(m_reserved == std::string("\x00\x00\x00\x00", 4))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x00\x00\x00\x00", 4), m_reserved, m__io, std::string("/types/tag_table/types/tag_definition/types/u_int_16_array_type/seq/0"));
    }
    m_values = std::unique_ptr<std::vector<uint16_t>>(new std::vector<uint16_t>());
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_values->push_back(std::move(m__io->read_u2be()));
            i++;
        }
    }
}

icc_4_t::tag_table_t::tag_definition_t::u_int_16_array_type_t::~u_int_16_array_type_t() {
    _clean_up();
}

void icc_4_t::tag_table_t::tag_definition_t::u_int_16_array_type_t::_clean_up() {
}

icc_4_t::tag_table_t::tag_definition_t::u_int_32_array_type_t::u_int_32_array_type_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_values = nullptr;
    _read();
}

void icc_4_t::tag_table_t::tag_definition_t::u_int_32_array_type_t::_read() {
    m_reserved = m__io->read_bytes(4);
    if (!(m_reserved == std::string("\x00\x00\x00\x00", 4))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x00\x00\x00\x00", 4), m_reserved, m__io, std::string("/types/tag_table/types/tag_definition/types/u_int_32_array_type/seq/0"));
    }
    m_values = std::unique_ptr<std::vector<uint32_t>>(new std::vector<uint32_t>());
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_values->push_back(std::move(m__io->read_u4be()));
            i++;
        }
    }
}

icc_4_t::tag_table_t::tag_definition_t::u_int_32_array_type_t::~u_int_32_array_type_t() {
    _clean_up();
}

void icc_4_t::tag_table_t::tag_definition_t::u_int_32_array_type_t::_clean_up() {
}

icc_4_t::tag_table_t::tag_definition_t::u_int_64_array_type_t::u_int_64_array_type_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_values = nullptr;
    _read();
}

void icc_4_t::tag_table_t::tag_definition_t::u_int_64_array_type_t::_read() {
    m_reserved = m__io->read_bytes(4);
    if (!(m_reserved == std::string("\x00\x00\x00\x00", 4))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x00\x00\x00\x00", 4), m_reserved, m__io, std::string("/types/tag_table/types/tag_definition/types/u_int_64_array_type/seq/0"));
    }
    m_values = std::unique_ptr<std::vector<uint64_t>>(new std::vector<uint64_t>());
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_values->push_back(std::move(m__io->read_u8be()));
            i++;
        }
    }
}

icc_4_t::tag_table_t::tag_definition_t::u_int_64_array_type_t::~u_int_64_array_type_t() {
    _clean_up();
}

void icc_4_t::tag_table_t::tag_definition_t::u_int_64_array_type_t::_clean_up() {
}

icc_4_t::tag_table_t::tag_definition_t::u_int_8_array_type_t::u_int_8_array_type_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_values = nullptr;
    _read();
}

void icc_4_t::tag_table_t::tag_definition_t::u_int_8_array_type_t::_read() {
    m_reserved = m__io->read_bytes(4);
    if (!(m_reserved == std::string("\x00\x00\x00\x00", 4))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x00\x00\x00\x00", 4), m_reserved, m__io, std::string("/types/tag_table/types/tag_definition/types/u_int_8_array_type/seq/0"));
    }
    m_values = std::unique_ptr<std::vector<uint8_t>>(new std::vector<uint8_t>());
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_values->push_back(std::move(m__io->read_u1()));
            i++;
        }
    }
}

icc_4_t::tag_table_t::tag_definition_t::u_int_8_array_type_t::~u_int_8_array_type_t() {
    _clean_up();
}

void icc_4_t::tag_table_t::tag_definition_t::u_int_8_array_type_t::_clean_up() {
}

icc_4_t::tag_table_t::tag_definition_t::viewing_cond_desc_tag_t::viewing_cond_desc_tag_t(kaitai::kstream* p__io, icc_4_t::tag_table_t::tag_definition_t* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void icc_4_t::tag_table_t::tag_definition_t::viewing_cond_desc_tag_t::_read() {
    m_tag_type = static_cast<icc_4_t::tag_table_t::tag_definition_t::tag_type_signatures_t>(m__io->read_u4be());
    n_tag_data = true;
    switch (tag_type()) {
    case icc_4_t::tag_table_t::tag_definition_t::TAG_TYPE_SIGNATURES_MULTI_LOCALIZED_UNICODE_TYPE: {
        n_tag_data = false;
        m_tag_data = std::unique_ptr<multi_localized_unicode_type_t>(new multi_localized_unicode_type_t(m__io, this, m__root));
        break;
    }
    }
}

icc_4_t::tag_table_t::tag_definition_t::viewing_cond_desc_tag_t::~viewing_cond_desc_tag_t() {
    _clean_up();
}

void icc_4_t::tag_table_t::tag_definition_t::viewing_cond_desc_tag_t::_clean_up() {
    if (!n_tag_data) {
    }
}

icc_4_t::tag_table_t::tag_definition_t::viewing_conditions_tag_t::viewing_conditions_tag_t(kaitai::kstream* p__io, icc_4_t::tag_table_t::tag_definition_t* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void icc_4_t::tag_table_t::tag_definition_t::viewing_conditions_tag_t::_read() {
    m_tag_type = static_cast<icc_4_t::tag_table_t::tag_definition_t::tag_type_signatures_t>(m__io->read_u4be());
    n_tag_data = true;
    switch (tag_type()) {
    case icc_4_t::tag_table_t::tag_definition_t::TAG_TYPE_SIGNATURES_VIEWING_CONDITIONS_TYPE: {
        n_tag_data = false;
        m_tag_data = std::unique_ptr<viewing_conditions_type_t>(new viewing_conditions_type_t(m__io, this, m__root));
        break;
    }
    }
}

icc_4_t::tag_table_t::tag_definition_t::viewing_conditions_tag_t::~viewing_conditions_tag_t() {
    _clean_up();
}

void icc_4_t::tag_table_t::tag_definition_t::viewing_conditions_tag_t::_clean_up() {
    if (!n_tag_data) {
    }
}

icc_4_t::tag_table_t::tag_definition_t::viewing_conditions_type_t::viewing_conditions_type_t(kaitai::kstream* p__io, icc_4_t::tag_table_t::tag_definition_t::viewing_conditions_tag_t* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_un_normalized_ciexyz_values_for_illuminant = nullptr;
    m_un_normalized_ciexyz_values_for_surround = nullptr;
    m_illuminant_type = nullptr;
    _read();
}

void icc_4_t::tag_table_t::tag_definition_t::viewing_conditions_type_t::_read() {
    m_reserved = m__io->read_bytes(4);
    if (!(m_reserved == std::string("\x00\x00\x00\x00", 4))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x00\x00\x00\x00", 4), m_reserved, m__io, std::string("/types/tag_table/types/tag_definition/types/viewing_conditions_type/seq/0"));
    }
    m_un_normalized_ciexyz_values_for_illuminant = std::unique_ptr<xyz_number_t>(new xyz_number_t(m__io, this, m__root));
    m_un_normalized_ciexyz_values_for_surround = std::unique_ptr<xyz_number_t>(new xyz_number_t(m__io, this, m__root));
    m_illuminant_type = std::unique_ptr<standard_illuminant_encoding_t>(new standard_illuminant_encoding_t(m__io, this, m__root));
}

icc_4_t::tag_table_t::tag_definition_t::viewing_conditions_type_t::~viewing_conditions_type_t() {
    _clean_up();
}

void icc_4_t::tag_table_t::tag_definition_t::viewing_conditions_type_t::_clean_up() {
}

icc_4_t::tag_table_t::tag_definition_t::xyz_type_t::xyz_type_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_values = nullptr;
    _read();
}

void icc_4_t::tag_table_t::tag_definition_t::xyz_type_t::_read() {
    m_reserved = m__io->read_bytes(4);
    if (!(m_reserved == std::string("\x00\x00\x00\x00", 4))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x00\x00\x00\x00", 4), m_reserved, m__io, std::string("/types/tag_table/types/tag_definition/types/xyz_type/seq/0"));
    }
    m_values = std::unique_ptr<std::vector<std::unique_ptr<xyz_number_t>>>(new std::vector<std::unique_ptr<xyz_number_t>>());
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_values->push_back(std::move(std::unique_ptr<xyz_number_t>(new xyz_number_t(m__io, this, m__root))));
            i++;
        }
    }
}

icc_4_t::tag_table_t::tag_definition_t::xyz_type_t::~xyz_type_t() {
    _clean_up();
}

void icc_4_t::tag_table_t::tag_definition_t::xyz_type_t::_clean_up() {
}

kaitai::kstruct* icc_4_t::tag_table_t::tag_definition_t::tag_data_element() {
    if (f_tag_data_element)
        return m_tag_data_element.get();
    f_tag_data_element = true;
    std::streampos _pos = m__io->pos();
    m__io->seek(offset_to_data_element());
    n_tag_data_element = true;
    switch (tag_signature()) {
    case icc_4_t::tag_table_t::tag_definition_t::TAG_SIGNATURES_A_TO_B_0: {
        n_tag_data_element = false;
        m__raw_tag_data_element = m__io->read_bytes(size_of_data_element());
        m__io__raw_tag_data_element = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_tag_data_element));
        m_tag_data_element = std::unique_ptr<a_to_b_0_tag_t>(new a_to_b_0_tag_t(m__io__raw_tag_data_element.get(), this, m__root));
        break;
    }
    case icc_4_t::tag_table_t::tag_definition_t::TAG_SIGNATURES_A_TO_B_1: {
        n_tag_data_element = false;
        m__raw_tag_data_element = m__io->read_bytes(size_of_data_element());
        m__io__raw_tag_data_element = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_tag_data_element));
        m_tag_data_element = std::unique_ptr<a_to_b_1_tag_t>(new a_to_b_1_tag_t(m__io__raw_tag_data_element.get(), this, m__root));
        break;
    }
    case icc_4_t::tag_table_t::tag_definition_t::TAG_SIGNATURES_A_TO_B_2: {
        n_tag_data_element = false;
        m__raw_tag_data_element = m__io->read_bytes(size_of_data_element());
        m__io__raw_tag_data_element = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_tag_data_element));
        m_tag_data_element = std::unique_ptr<a_to_b_2_tag_t>(new a_to_b_2_tag_t(m__io__raw_tag_data_element.get(), this, m__root));
        break;
    }
    case icc_4_t::tag_table_t::tag_definition_t::TAG_SIGNATURES_B_TO_A_0: {
        n_tag_data_element = false;
        m__raw_tag_data_element = m__io->read_bytes(size_of_data_element());
        m__io__raw_tag_data_element = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_tag_data_element));
        m_tag_data_element = std::unique_ptr<b_to_a_0_tag_t>(new b_to_a_0_tag_t(m__io__raw_tag_data_element.get(), this, m__root));
        break;
    }
    case icc_4_t::tag_table_t::tag_definition_t::TAG_SIGNATURES_B_TO_A_1: {
        n_tag_data_element = false;
        m__raw_tag_data_element = m__io->read_bytes(size_of_data_element());
        m__io__raw_tag_data_element = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_tag_data_element));
        m_tag_data_element = std::unique_ptr<b_to_a_1_tag_t>(new b_to_a_1_tag_t(m__io__raw_tag_data_element.get(), this, m__root));
        break;
    }
    case icc_4_t::tag_table_t::tag_definition_t::TAG_SIGNATURES_B_TO_A_2: {
        n_tag_data_element = false;
        m__raw_tag_data_element = m__io->read_bytes(size_of_data_element());
        m__io__raw_tag_data_element = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_tag_data_element));
        m_tag_data_element = std::unique_ptr<b_to_a_2_tag_t>(new b_to_a_2_tag_t(m__io__raw_tag_data_element.get(), this, m__root));
        break;
    }
    case icc_4_t::tag_table_t::tag_definition_t::TAG_SIGNATURES_B_TO_D_0: {
        n_tag_data_element = false;
        m__raw_tag_data_element = m__io->read_bytes(size_of_data_element());
        m__io__raw_tag_data_element = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_tag_data_element));
        m_tag_data_element = std::unique_ptr<b_to_d_0_tag_t>(new b_to_d_0_tag_t(m__io__raw_tag_data_element.get(), this, m__root));
        break;
    }
    case icc_4_t::tag_table_t::tag_definition_t::TAG_SIGNATURES_B_TO_D_1: {
        n_tag_data_element = false;
        m__raw_tag_data_element = m__io->read_bytes(size_of_data_element());
        m__io__raw_tag_data_element = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_tag_data_element));
        m_tag_data_element = std::unique_ptr<b_to_d_1_tag_t>(new b_to_d_1_tag_t(m__io__raw_tag_data_element.get(), this, m__root));
        break;
    }
    case icc_4_t::tag_table_t::tag_definition_t::TAG_SIGNATURES_B_TO_D_2: {
        n_tag_data_element = false;
        m__raw_tag_data_element = m__io->read_bytes(size_of_data_element());
        m__io__raw_tag_data_element = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_tag_data_element));
        m_tag_data_element = std::unique_ptr<b_to_d_2_tag_t>(new b_to_d_2_tag_t(m__io__raw_tag_data_element.get(), this, m__root));
        break;
    }
    case icc_4_t::tag_table_t::tag_definition_t::TAG_SIGNATURES_B_TO_D_3: {
        n_tag_data_element = false;
        m__raw_tag_data_element = m__io->read_bytes(size_of_data_element());
        m__io__raw_tag_data_element = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_tag_data_element));
        m_tag_data_element = std::unique_ptr<b_to_d_3_tag_t>(new b_to_d_3_tag_t(m__io__raw_tag_data_element.get(), this, m__root));
        break;
    }
    case icc_4_t::tag_table_t::tag_definition_t::TAG_SIGNATURES_BLUE_MATRIX_COLUMN: {
        n_tag_data_element = false;
        m__raw_tag_data_element = m__io->read_bytes(size_of_data_element());
        m__io__raw_tag_data_element = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_tag_data_element));
        m_tag_data_element = std::unique_ptr<blue_matrix_column_tag_t>(new blue_matrix_column_tag_t(m__io__raw_tag_data_element.get(), this, m__root));
        break;
    }
    case icc_4_t::tag_table_t::tag_definition_t::TAG_SIGNATURES_BLUE_TRC: {
        n_tag_data_element = false;
        m__raw_tag_data_element = m__io->read_bytes(size_of_data_element());
        m__io__raw_tag_data_element = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_tag_data_element));
        m_tag_data_element = std::unique_ptr<blue_trc_tag_t>(new blue_trc_tag_t(m__io__raw_tag_data_element.get(), this, m__root));
        break;
    }
    case icc_4_t::tag_table_t::tag_definition_t::TAG_SIGNATURES_CALIBRATION_DATE_TIME: {
        n_tag_data_element = false;
        m__raw_tag_data_element = m__io->read_bytes(size_of_data_element());
        m__io__raw_tag_data_element = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_tag_data_element));
        m_tag_data_element = std::unique_ptr<calibration_date_time_tag_t>(new calibration_date_time_tag_t(m__io__raw_tag_data_element.get(), this, m__root));
        break;
    }
    case icc_4_t::tag_table_t::tag_definition_t::TAG_SIGNATURES_CHAR_TARGET: {
        n_tag_data_element = false;
        m__raw_tag_data_element = m__io->read_bytes(size_of_data_element());
        m__io__raw_tag_data_element = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_tag_data_element));
        m_tag_data_element = std::unique_ptr<char_target_tag_t>(new char_target_tag_t(m__io__raw_tag_data_element.get(), this, m__root));
        break;
    }
    case icc_4_t::tag_table_t::tag_definition_t::TAG_SIGNATURES_CHROMATIC_ADAPTATION: {
        n_tag_data_element = false;
        m__raw_tag_data_element = m__io->read_bytes(size_of_data_element());
        m__io__raw_tag_data_element = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_tag_data_element));
        m_tag_data_element = std::unique_ptr<chromatic_adaptation_tag_t>(new chromatic_adaptation_tag_t(m__io__raw_tag_data_element.get(), this, m__root));
        break;
    }
    case icc_4_t::tag_table_t::tag_definition_t::TAG_SIGNATURES_CHROMATICITY: {
        n_tag_data_element = false;
        m__raw_tag_data_element = m__io->read_bytes(size_of_data_element());
        m__io__raw_tag_data_element = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_tag_data_element));
        m_tag_data_element = std::unique_ptr<chromaticity_tag_t>(new chromaticity_tag_t(m__io__raw_tag_data_element.get(), this, m__root));
        break;
    }
    case icc_4_t::tag_table_t::tag_definition_t::TAG_SIGNATURES_COLORANT_ORDER: {
        n_tag_data_element = false;
        m__raw_tag_data_element = m__io->read_bytes(size_of_data_element());
        m__io__raw_tag_data_element = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_tag_data_element));
        m_tag_data_element = std::unique_ptr<colorant_order_tag_t>(new colorant_order_tag_t(m__io__raw_tag_data_element.get(), this, m__root));
        break;
    }
    case icc_4_t::tag_table_t::tag_definition_t::TAG_SIGNATURES_COLORANT_TABLE: {
        n_tag_data_element = false;
        m__raw_tag_data_element = m__io->read_bytes(size_of_data_element());
        m__io__raw_tag_data_element = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_tag_data_element));
        m_tag_data_element = std::unique_ptr<colorant_table_tag_t>(new colorant_table_tag_t(m__io__raw_tag_data_element.get(), this, m__root));
        break;
    }
    case icc_4_t::tag_table_t::tag_definition_t::TAG_SIGNATURES_COLORANT_TABLE_OUT: {
        n_tag_data_element = false;
        m__raw_tag_data_element = m__io->read_bytes(size_of_data_element());
        m__io__raw_tag_data_element = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_tag_data_element));
        m_tag_data_element = std::unique_ptr<colorant_table_out_tag_t>(new colorant_table_out_tag_t(m__io__raw_tag_data_element.get(), this, m__root));
        break;
    }
    case icc_4_t::tag_table_t::tag_definition_t::TAG_SIGNATURES_COLORIMETRIC_INTENT_IMAGE_STATE: {
        n_tag_data_element = false;
        m__raw_tag_data_element = m__io->read_bytes(size_of_data_element());
        m__io__raw_tag_data_element = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_tag_data_element));
        m_tag_data_element = std::unique_ptr<colorimetric_intent_image_state_tag_t>(new colorimetric_intent_image_state_tag_t(m__io__raw_tag_data_element.get(), this, m__root));
        break;
    }
    case icc_4_t::tag_table_t::tag_definition_t::TAG_SIGNATURES_COPYRIGHT: {
        n_tag_data_element = false;
        m__raw_tag_data_element = m__io->read_bytes(size_of_data_element());
        m__io__raw_tag_data_element = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_tag_data_element));
        m_tag_data_element = std::unique_ptr<copyright_tag_t>(new copyright_tag_t(m__io__raw_tag_data_element.get(), this, m__root));
        break;
    }
    case icc_4_t::tag_table_t::tag_definition_t::TAG_SIGNATURES_D_TO_B_0: {
        n_tag_data_element = false;
        m__raw_tag_data_element = m__io->read_bytes(size_of_data_element());
        m__io__raw_tag_data_element = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_tag_data_element));
        m_tag_data_element = std::unique_ptr<d_to_b_0_tag_t>(new d_to_b_0_tag_t(m__io__raw_tag_data_element.get(), this, m__root));
        break;
    }
    case icc_4_t::tag_table_t::tag_definition_t::TAG_SIGNATURES_D_TO_B_1: {
        n_tag_data_element = false;
        m__raw_tag_data_element = m__io->read_bytes(size_of_data_element());
        m__io__raw_tag_data_element = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_tag_data_element));
        m_tag_data_element = std::unique_ptr<d_to_b_1_tag_t>(new d_to_b_1_tag_t(m__io__raw_tag_data_element.get(), this, m__root));
        break;
    }
    case icc_4_t::tag_table_t::tag_definition_t::TAG_SIGNATURES_D_TO_B_2: {
        n_tag_data_element = false;
        m__raw_tag_data_element = m__io->read_bytes(size_of_data_element());
        m__io__raw_tag_data_element = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_tag_data_element));
        m_tag_data_element = std::unique_ptr<d_to_b_2_tag_t>(new d_to_b_2_tag_t(m__io__raw_tag_data_element.get(), this, m__root));
        break;
    }
    case icc_4_t::tag_table_t::tag_definition_t::TAG_SIGNATURES_D_TO_B_3: {
        n_tag_data_element = false;
        m__raw_tag_data_element = m__io->read_bytes(size_of_data_element());
        m__io__raw_tag_data_element = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_tag_data_element));
        m_tag_data_element = std::unique_ptr<d_to_b_3_tag_t>(new d_to_b_3_tag_t(m__io__raw_tag_data_element.get(), this, m__root));
        break;
    }
    case icc_4_t::tag_table_t::tag_definition_t::TAG_SIGNATURES_DEVICE_MFG_DESC: {
        n_tag_data_element = false;
        m__raw_tag_data_element = m__io->read_bytes(size_of_data_element());
        m__io__raw_tag_data_element = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_tag_data_element));
        m_tag_data_element = std::unique_ptr<device_mfg_desc_tag_t>(new device_mfg_desc_tag_t(m__io__raw_tag_data_element.get(), this, m__root));
        break;
    }
    case icc_4_t::tag_table_t::tag_definition_t::TAG_SIGNATURES_DEVICE_MODEL_DESC: {
        n_tag_data_element = false;
        m__raw_tag_data_element = m__io->read_bytes(size_of_data_element());
        m__io__raw_tag_data_element = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_tag_data_element));
        m_tag_data_element = std::unique_ptr<device_model_desc_tag_t>(new device_model_desc_tag_t(m__io__raw_tag_data_element.get(), this, m__root));
        break;
    }
    case icc_4_t::tag_table_t::tag_definition_t::TAG_SIGNATURES_GAMUT: {
        n_tag_data_element = false;
        m__raw_tag_data_element = m__io->read_bytes(size_of_data_element());
        m__io__raw_tag_data_element = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_tag_data_element));
        m_tag_data_element = std::unique_ptr<gamut_tag_t>(new gamut_tag_t(m__io__raw_tag_data_element.get(), this, m__root));
        break;
    }
    case icc_4_t::tag_table_t::tag_definition_t::TAG_SIGNATURES_GRAY_TRC: {
        n_tag_data_element = false;
        m__raw_tag_data_element = m__io->read_bytes(size_of_data_element());
        m__io__raw_tag_data_element = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_tag_data_element));
        m_tag_data_element = std::unique_ptr<gray_trc_tag_t>(new gray_trc_tag_t(m__io__raw_tag_data_element.get(), this, m__root));
        break;
    }
    case icc_4_t::tag_table_t::tag_definition_t::TAG_SIGNATURES_GREEN_MATRIX_COLUMN: {
        n_tag_data_element = false;
        m__raw_tag_data_element = m__io->read_bytes(size_of_data_element());
        m__io__raw_tag_data_element = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_tag_data_element));
        m_tag_data_element = std::unique_ptr<green_matrix_column_tag_t>(new green_matrix_column_tag_t(m__io__raw_tag_data_element.get(), this, m__root));
        break;
    }
    case icc_4_t::tag_table_t::tag_definition_t::TAG_SIGNATURES_GREEN_TRC: {
        n_tag_data_element = false;
        m__raw_tag_data_element = m__io->read_bytes(size_of_data_element());
        m__io__raw_tag_data_element = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_tag_data_element));
        m_tag_data_element = std::unique_ptr<green_trc_tag_t>(new green_trc_tag_t(m__io__raw_tag_data_element.get(), this, m__root));
        break;
    }
    case icc_4_t::tag_table_t::tag_definition_t::TAG_SIGNATURES_LUMINANCE: {
        n_tag_data_element = false;
        m__raw_tag_data_element = m__io->read_bytes(size_of_data_element());
        m__io__raw_tag_data_element = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_tag_data_element));
        m_tag_data_element = std::unique_ptr<luminance_tag_t>(new luminance_tag_t(m__io__raw_tag_data_element.get(), this, m__root));
        break;
    }
    case icc_4_t::tag_table_t::tag_definition_t::TAG_SIGNATURES_MEASUREMENT: {
        n_tag_data_element = false;
        m__raw_tag_data_element = m__io->read_bytes(size_of_data_element());
        m__io__raw_tag_data_element = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_tag_data_element));
        m_tag_data_element = std::unique_ptr<measurement_tag_t>(new measurement_tag_t(m__io__raw_tag_data_element.get(), this, m__root));
        break;
    }
    case icc_4_t::tag_table_t::tag_definition_t::TAG_SIGNATURES_MEDIA_WHITE_POINT: {
        n_tag_data_element = false;
        m__raw_tag_data_element = m__io->read_bytes(size_of_data_element());
        m__io__raw_tag_data_element = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_tag_data_element));
        m_tag_data_element = std::unique_ptr<media_white_point_tag_t>(new media_white_point_tag_t(m__io__raw_tag_data_element.get(), this, m__root));
        break;
    }
    case icc_4_t::tag_table_t::tag_definition_t::TAG_SIGNATURES_NAMED_COLOR_2: {
        n_tag_data_element = false;
        m__raw_tag_data_element = m__io->read_bytes(size_of_data_element());
        m__io__raw_tag_data_element = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_tag_data_element));
        m_tag_data_element = std::unique_ptr<named_color_2_tag_t>(new named_color_2_tag_t(m__io__raw_tag_data_element.get(), this, m__root));
        break;
    }
    case icc_4_t::tag_table_t::tag_definition_t::TAG_SIGNATURES_OUTPUT_RESPONSE: {
        n_tag_data_element = false;
        m__raw_tag_data_element = m__io->read_bytes(size_of_data_element());
        m__io__raw_tag_data_element = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_tag_data_element));
        m_tag_data_element = std::unique_ptr<output_response_tag_t>(new output_response_tag_t(m__io__raw_tag_data_element.get(), this, m__root));
        break;
    }
    case icc_4_t::tag_table_t::tag_definition_t::TAG_SIGNATURES_PERCEPTUAL_RENDERING_INTENT_GAMUT: {
        n_tag_data_element = false;
        m__raw_tag_data_element = m__io->read_bytes(size_of_data_element());
        m__io__raw_tag_data_element = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_tag_data_element));
        m_tag_data_element = std::unique_ptr<perceptual_rendering_intent_gamut_tag_t>(new perceptual_rendering_intent_gamut_tag_t(m__io__raw_tag_data_element.get(), this, m__root));
        break;
    }
    case icc_4_t::tag_table_t::tag_definition_t::TAG_SIGNATURES_PREVIEW_0: {
        n_tag_data_element = false;
        m__raw_tag_data_element = m__io->read_bytes(size_of_data_element());
        m__io__raw_tag_data_element = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_tag_data_element));
        m_tag_data_element = std::unique_ptr<preview_0_tag_t>(new preview_0_tag_t(m__io__raw_tag_data_element.get(), this, m__root));
        break;
    }
    case icc_4_t::tag_table_t::tag_definition_t::TAG_SIGNATURES_PREVIEW_1: {
        n_tag_data_element = false;
        m__raw_tag_data_element = m__io->read_bytes(size_of_data_element());
        m__io__raw_tag_data_element = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_tag_data_element));
        m_tag_data_element = std::unique_ptr<preview_1_tag_t>(new preview_1_tag_t(m__io__raw_tag_data_element.get(), this, m__root));
        break;
    }
    case icc_4_t::tag_table_t::tag_definition_t::TAG_SIGNATURES_PREVIEW_2: {
        n_tag_data_element = false;
        m__raw_tag_data_element = m__io->read_bytes(size_of_data_element());
        m__io__raw_tag_data_element = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_tag_data_element));
        m_tag_data_element = std::unique_ptr<preview_2_tag_t>(new preview_2_tag_t(m__io__raw_tag_data_element.get(), this, m__root));
        break;
    }
    case icc_4_t::tag_table_t::tag_definition_t::TAG_SIGNATURES_PROFILE_DESCRIPTION: {
        n_tag_data_element = false;
        m__raw_tag_data_element = m__io->read_bytes(size_of_data_element());
        m__io__raw_tag_data_element = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_tag_data_element));
        m_tag_data_element = std::unique_ptr<profile_description_tag_t>(new profile_description_tag_t(m__io__raw_tag_data_element.get(), this, m__root));
        break;
    }
    case icc_4_t::tag_table_t::tag_definition_t::TAG_SIGNATURES_PROFILE_SEQUENCE: {
        n_tag_data_element = false;
        m__raw_tag_data_element = m__io->read_bytes(size_of_data_element());
        m__io__raw_tag_data_element = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_tag_data_element));
        m_tag_data_element = std::unique_ptr<profile_sequence_tag_t>(new profile_sequence_tag_t(m__io__raw_tag_data_element.get(), this, m__root));
        break;
    }
    case icc_4_t::tag_table_t::tag_definition_t::TAG_SIGNATURES_PROFILE_SEQUENCE_IDENTIFIER: {
        n_tag_data_element = false;
        m__raw_tag_data_element = m__io->read_bytes(size_of_data_element());
        m__io__raw_tag_data_element = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_tag_data_element));
        m_tag_data_element = std::unique_ptr<profile_sequence_identifier_tag_t>(new profile_sequence_identifier_tag_t(m__io__raw_tag_data_element.get(), this, m__root));
        break;
    }
    case icc_4_t::tag_table_t::tag_definition_t::TAG_SIGNATURES_RED_MATRIX_COLUMN: {
        n_tag_data_element = false;
        m__raw_tag_data_element = m__io->read_bytes(size_of_data_element());
        m__io__raw_tag_data_element = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_tag_data_element));
        m_tag_data_element = std::unique_ptr<red_matrix_column_tag_t>(new red_matrix_column_tag_t(m__io__raw_tag_data_element.get(), this, m__root));
        break;
    }
    case icc_4_t::tag_table_t::tag_definition_t::TAG_SIGNATURES_RED_TRC: {
        n_tag_data_element = false;
        m__raw_tag_data_element = m__io->read_bytes(size_of_data_element());
        m__io__raw_tag_data_element = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_tag_data_element));
        m_tag_data_element = std::unique_ptr<red_trc_tag_t>(new red_trc_tag_t(m__io__raw_tag_data_element.get(), this, m__root));
        break;
    }
    case icc_4_t::tag_table_t::tag_definition_t::TAG_SIGNATURES_SATURATION_RENDERING_INTENT_GAMUT: {
        n_tag_data_element = false;
        m__raw_tag_data_element = m__io->read_bytes(size_of_data_element());
        m__io__raw_tag_data_element = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_tag_data_element));
        m_tag_data_element = std::unique_ptr<saturation_rendering_intent_gamut_tag_t>(new saturation_rendering_intent_gamut_tag_t(m__io__raw_tag_data_element.get(), this, m__root));
        break;
    }
    case icc_4_t::tag_table_t::tag_definition_t::TAG_SIGNATURES_TECHNOLOGY: {
        n_tag_data_element = false;
        m__raw_tag_data_element = m__io->read_bytes(size_of_data_element());
        m__io__raw_tag_data_element = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_tag_data_element));
        m_tag_data_element = std::unique_ptr<technology_tag_t>(new technology_tag_t(m__io__raw_tag_data_element.get(), this, m__root));
        break;
    }
    case icc_4_t::tag_table_t::tag_definition_t::TAG_SIGNATURES_VIEWING_COND_DESC: {
        n_tag_data_element = false;
        m__raw_tag_data_element = m__io->read_bytes(size_of_data_element());
        m__io__raw_tag_data_element = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_tag_data_element));
        m_tag_data_element = std::unique_ptr<viewing_cond_desc_tag_t>(new viewing_cond_desc_tag_t(m__io__raw_tag_data_element.get(), this, m__root));
        break;
    }
    case icc_4_t::tag_table_t::tag_definition_t::TAG_SIGNATURES_VIEWING_CONDITIONS: {
        n_tag_data_element = false;
        m__raw_tag_data_element = m__io->read_bytes(size_of_data_element());
        m__io__raw_tag_data_element = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_tag_data_element));
        m_tag_data_element = std::unique_ptr<viewing_conditions_tag_t>(new viewing_conditions_tag_t(m__io__raw_tag_data_element.get(), this, m__root));
        break;
    }
    default: {
        m__raw_tag_data_element = m__io->read_bytes(size_of_data_element());
        break;
    }
    }
    m__io->seek(_pos);
    return m_tag_data_element.get();
}

icc_4_t::u_16_fixed_16_number_t::u_16_fixed_16_number_t(kaitai::kstream* p__io, icc_4_t::tag_table_t::tag_definition_t::u_16_fixed_16_array_type_t* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void icc_4_t::u_16_fixed_16_number_t::_read() {
    m_number = m__io->read_bytes(4);
}

icc_4_t::u_16_fixed_16_number_t::~u_16_fixed_16_number_t() {
    _clean_up();
}

void icc_4_t::u_16_fixed_16_number_t::_clean_up() {
}

icc_4_t::u_1_fixed_15_number_t::u_1_fixed_15_number_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void icc_4_t::u_1_fixed_15_number_t::_read() {
    m_number = m__io->read_bytes(2);
}

icc_4_t::u_1_fixed_15_number_t::~u_1_fixed_15_number_t() {
    _clean_up();
}

void icc_4_t::u_1_fixed_15_number_t::_clean_up() {
}

icc_4_t::u_8_fixed_8_number_t::u_8_fixed_8_number_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void icc_4_t::u_8_fixed_8_number_t::_read() {
    m_number = m__io->read_bytes(2);
}

icc_4_t::u_8_fixed_8_number_t::~u_8_fixed_8_number_t() {
    _clean_up();
}

void icc_4_t::u_8_fixed_8_number_t::_clean_up() {
}

icc_4_t::xyz_number_t::xyz_number_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, icc_4_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void icc_4_t::xyz_number_t::_read() {
    m_x = m__io->read_bytes(4);
    m_y = m__io->read_bytes(4);
    m_z = m__io->read_bytes(4);
}

icc_4_t::xyz_number_t::~xyz_number_t() {
    _clean_up();
}

void icc_4_t::xyz_number_t::_clean_up() {
}
