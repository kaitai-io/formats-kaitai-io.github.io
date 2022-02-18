-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
local stringstream = require("string_stream")
local str_decode = require("string_decode")
local utils = require("utils")

-- 
-- The NITF (National Image Transition Format) format is a file format developed by the U.S. Government for
-- storing imagery, e.g. from satellites.
-- 
-- According to the [foreword of the specification](https://web.archive.org/web/20181105050336/https://www.gwg.nga.mil/ntb/baseline/docs/2500c/2500C.pdf):
-- > The National Imagery Transmission Format Standard (NITFS) is the suite of standards for formatting digital
-- > imagery and imagery-related products and exchanging them among members of the Intelligence Community (IC) as
-- > defined by the Executive Order 12333, and other United States Government departments and agencies."
-- 
-- This implementation is set to version format (`file_version`) of 02.10 and `standard_type` of `BF01`.
-- It was implemented by [River Loop Security](https://riverloopsecurity.com).
-- See also: Source (https://web.archive.org/web/20181105050336/https://www.gwg.nga.mil/ntb/baseline/docs/2500c/2500C.pdf)
Nitf = class.class(KaitaiStruct)

function Nitf:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Nitf:_read()
  self.header = Nitf.Header(self._io, self, self._root)
  self.image_segments = {}
  for i = 0, tonumber(self.header.num_image_segments) - 1 do
    self.image_segments[i + 1] = Nitf.ImageSegment(i, self._io, self, self._root)
  end
  self.graphics_segments = {}
  for i = 0, tonumber(self.header.num_graphics_segments) - 1 do
    self.graphics_segments[i + 1] = Nitf.GraphicsSegment(i, self._io, self, self._root)
  end
  self.text_segments = {}
  for i = 0, tonumber(self.header.num_text_files) - 1 do
    self.text_segments[i + 1] = Nitf.TextSegment(i, self._io, self, self._root)
  end
  self.data_extension_segments = {}
  for i = 0, tonumber(self.header.num_data_extension) - 1 do
    self.data_extension_segments[i + 1] = Nitf.DataExtensionSegment(i, self._io, self, self._root)
  end
  self.reserved_extension_segments = {}
  for i = 0, tonumber(self.header.num_reserved_extension) - 1 do
    self.reserved_extension_segments[i + 1] = Nitf.ReservedExtensionSegment(i, self._io, self, self._root)
  end
end


Nitf.ReservedExtensionSegment = class.class(KaitaiStruct)

function Nitf.ReservedExtensionSegment:_init(idx, io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self.idx = idx
  self:_read()
end

function Nitf.ReservedExtensionSegment:_read()
  self._raw_reserved_sub_header = self._io:read_bytes(tonumber(self._parent.header.lrnfo[self.idx + 1].length_reserved_extension_subheader))
  local _io = KaitaiStream(stringstream(self._raw_reserved_sub_header))
  self.reserved_sub_header = Nitf.ReservedSubHeader(_io, self, self._root)
  self.reserved_data_field = self._io:read_bytes(tonumber(self._parent.header.lrnfo[self.idx + 1].length_reserved_extension_segment))
end


Nitf.ImageComment = class.class(KaitaiStruct)

function Nitf.ImageComment:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Nitf.ImageComment:_read()
  self._unnamed0 = str_decode.decode(self._io:read_bytes(80), "UTF-8")
end


Nitf.LengthReservedInfo = class.class(KaitaiStruct)

function Nitf.LengthReservedInfo:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Nitf.LengthReservedInfo:_read()
  self.length_reserved_extension_subheader = str_decode.decode(self._io:read_bytes(4), "UTF-8")
  self.length_reserved_extension_segment = str_decode.decode(self._io:read_bytes(7), "UTF-8")
end


Nitf.Tre = class.class(KaitaiStruct)

function Nitf.Tre:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Nitf.Tre:_read()
  self.extension_type_id = str_decode.decode(self._io:read_bytes(6), "UTF-8")
  self.edata_length = str_decode.decode(self._io:read_bytes(5), "UTF-8")
  self.edata = str_decode.decode(self._io:read_bytes(tonumber(self.edata_length)), "UTF-8")
end

-- 
-- RETAG or CETAG.
-- 
-- REL or CEL.
-- 
-- REDATA or CEDATA.

Nitf.BandInfo = class.class(KaitaiStruct)

function Nitf.BandInfo:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Nitf.BandInfo:_read()
  self.representation = str_decode.decode(self._io:read_bytes(2), "UTF-8")
  self.subcategory = str_decode.decode(self._io:read_bytes(6), "UTF-8")
  self.img_filter_condition = self._io:read_bytes(1)
  if not(self.img_filter_condition == "\078") then
    error("not equal, expected " ..  "\078" .. ", but got " .. self.img_filter_condition)
  end
  self.img_filter_code = str_decode.decode(self._io:read_bytes(3), "UTF-8")
  self.num_luts = str_decode.decode(self._io:read_bytes(1), "UTF-8")
  if tonumber(self.num_luts) ~= 0 then
    self.num_lut_entries = str_decode.decode(self._io:read_bytes(5), "UTF-8")
  end
  self.luts = {}
  for i = 0, tonumber(self.num_luts) - 1 do
    self.luts[i + 1] = self._io:read_bytes(tonumber(self.num_lut_entries))
  end
end

-- 
-- Indicates processing required to display the nth band of image w.r.t. the general image type recorded by IREP field.
-- 
-- Reserved.
-- 
-- Number of entries in each of the LUTs for the nth image band.

Nitf.ImageSegment = class.class(KaitaiStruct)

function Nitf.ImageSegment:_init(idx, io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self.idx = idx
  self:_read()
end

function Nitf.ImageSegment:_read()
  self.image_sub_header = Nitf.ImageSubHeader(self._io, self, self._root)
  if self.has_mask then
    self.image_data_mask = Nitf.ImageDataMask(self._io, self, self._root)
  end
  if self.has_mask then
    self.image_data_field = self._io:read_bytes((tonumber(self._parent.header.linfo[self.idx + 1].length_image_segment) - self.image_data_mask.total_size))
  end
end

Nitf.ImageSegment.property.has_mask = {}
function Nitf.ImageSegment.property.has_mask:get()
  if self._m_has_mask ~= nil then
    return self._m_has_mask
  end

  self._m_has_mask = string.sub(self.image_sub_header.img_compression, 0 + 1, 2) == "MM"
  return self._m_has_mask
end


Nitf.TextSegment = class.class(KaitaiStruct)

function Nitf.TextSegment:_init(idx, io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self.idx = idx
  self:_read()
end

function Nitf.TextSegment:_read()
  self.text_sub_header = self._io:read_bytes(1)
  self.text_data_field = self._io:read_bytes(tonumber(self._parent.header.ltnfo[self.idx + 1].length_text_segment))
end


Nitf.GraphicSubHeader = class.class(KaitaiStruct)

function Nitf.GraphicSubHeader:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Nitf.GraphicSubHeader:_read()
  self.file_part_type_sy = self._io:read_bytes(2)
  if not(self.file_part_type_sy == "\083\089") then
    error("not equal, expected " ..  "\083\089" .. ", but got " .. self.file_part_type_sy)
  end
  self.graphic_id = str_decode.decode(self._io:read_bytes(10), "UTF-8")
  self.graphic_name = str_decode.decode(self._io:read_bytes(20), "UTF-8")
  self.graphic_classification = Nitf.Clasnfo(self._io, self, self._root)
  self.encryption = Nitf.Encrypt(self._io, self, self._root)
  self.graphic_type = self._io:read_bytes(1)
  if not(self.graphic_type == "\067") then
    error("not equal, expected " ..  "\067" .. ", but got " .. self.graphic_type)
  end
  self.reserved1 = str_decode.decode(self._io:read_bytes(13), "UTF-8")
  self.graphic_display_level = str_decode.decode(self._io:read_bytes(3), "UTF-8")
  self.graphic_attachment_level = str_decode.decode(self._io:read_bytes(3), "UTF-8")
  self.graphic_location = str_decode.decode(self._io:read_bytes(10), "UTF-8")
  self.first_graphic_bound_loc = str_decode.decode(self._io:read_bytes(10), "UTF-8")
  self.graphic_color = str_decode.decode(self._io:read_bytes(1), "UTF-8")
  self.second_graphic_bound_loc = str_decode.decode(self._io:read_bytes(10), "UTF-8")
  self.reserved2 = str_decode.decode(self._io:read_bytes(2), "UTF-8")
  self.graphics_extended_sub_header = Nitf.TreHeader(self._io, self, self._root)
end

-- 
-- Reserved.
-- 
-- Reserved.

Nitf.Clasnfo = class.class(KaitaiStruct)

function Nitf.Clasnfo:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Nitf.Clasnfo:_read()
  self.security_class = str_decode.decode(self._io:read_bytes(1), "UTF-8")
  self.security_system = str_decode.decode(self._io:read_bytes(2), "UTF-8")
  self.codewords = str_decode.decode(self._io:read_bytes(11), "UTF-8")
  self.control_and_handling = str_decode.decode(self._io:read_bytes(2), "UTF-8")
  self.releaseability = str_decode.decode(self._io:read_bytes(20), "UTF-8")
  self.declass_type = str_decode.decode(self._io:read_bytes(2), "UTF-8")
  self.declass_date = str_decode.decode(self._io:read_bytes(8), "UTF-8")
  self.declass_exemption = str_decode.decode(self._io:read_bytes(4), "UTF-8")
  self.downgrade = str_decode.decode(self._io:read_bytes(1), "UTF-8")
  self.downgrade_date = str_decode.decode(self._io:read_bytes(8), "UTF-8")
  self.class_text = str_decode.decode(self._io:read_bytes(43), "UTF-8")
  self.class_authority_type = str_decode.decode(self._io:read_bytes(1), "UTF-8")
  self.class_authority = str_decode.decode(self._io:read_bytes(40), "UTF-8")
  self.class_reason = str_decode.decode(self._io:read_bytes(1), "UTF-8")
  self.source_date = str_decode.decode(self._io:read_bytes(8), "UTF-8")
  self.control_number = str_decode.decode(self._io:read_bytes(15), "UTF-8")
end


Nitf.LengthGraphicInfo = class.class(KaitaiStruct)

function Nitf.LengthGraphicInfo:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Nitf.LengthGraphicInfo:_read()
  self.length_graphic_subheader = str_decode.decode(self._io:read_bytes(4), "UTF-8")
  self.length_graphic_segment = str_decode.decode(self._io:read_bytes(6), "UTF-8")
end


Nitf.Encrypt = class.class(KaitaiStruct)

function Nitf.Encrypt:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Nitf.Encrypt:_read()
  self._unnamed0 = str_decode.decode(self._io:read_bytes(1), "UTF-8")
end


Nitf.ImageDataMask = class.class(KaitaiStruct)

function Nitf.ImageDataMask:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Nitf.ImageDataMask:_read()
  self.blocked_img_data_offset = self._io:read_u4be()
  self.bmrlnth = self._io:read_u2be()
  self.tmrlnth = self._io:read_u2be()
  self.tpxcdlnth = self._io:read_u2be()
  self.tpxcd = self._io:read_bytes(self.tpxcd_size)
  if self.has_bmr then
    self.bmrbnd = {}
    for i = 0, self.bmrtmr_count - 1 do
      self.bmrbnd[i + 1] = self._io:read_u4be()
    end
  end
  if self.has_tmr then
    self.tmrbnd = {}
    for i = 0, self.bmrtmr_count - 1 do
      self.tmrbnd[i + 1] = self._io:read_u4be()
    end
  end
end

Nitf.ImageDataMask.property.has_bmr = {}
function Nitf.ImageDataMask.property.has_bmr:get()
  if self._m_has_bmr ~= nil then
    return self._m_has_bmr
  end

  self._m_has_bmr = self.bmrlnth ~= 0
  return self._m_has_bmr
end

Nitf.ImageDataMask.property.has_tmr = {}
function Nitf.ImageDataMask.property.has_tmr:get()
  if self._m_has_tmr ~= nil then
    return self._m_has_tmr
  end

  self._m_has_tmr = self.tmrlnth ~= 0
  return self._m_has_tmr
end

Nitf.ImageDataMask.property.tmrbnd_size = {}
function Nitf.ImageDataMask.property.tmrbnd_size:get()
  if self._m_tmrbnd_size ~= nil then
    return self._m_tmrbnd_size
  end

  self._m_tmrbnd_size = utils.box_unwrap((self.has_tmr) and utils.box_wrap((self.bmrtmr_count * 4)) or (0))
  return self._m_tmrbnd_size
end

Nitf.ImageDataMask.property.tpxcd_size = {}
function Nitf.ImageDataMask.property.tpxcd_size:get()
  if self._m_tpxcd_size ~= nil then
    return self._m_tpxcd_size
  end

  self._m_tpxcd_size = math.floor(utils.box_unwrap(((self.tpxcdlnth % 8) == 0) and utils.box_wrap(self.tpxcdlnth) or ((self.tpxcdlnth + (8 - (self.tpxcdlnth % 8))))) / 8)
  return self._m_tpxcd_size
end

Nitf.ImageDataMask.property.total_size = {}
function Nitf.ImageDataMask.property.total_size:get()
  if self._m_total_size ~= nil then
    return self._m_total_size
  end

  self._m_total_size = ((((((4 + 2) + 2) + 2) + self.tpxcd_size) + self.bmrbnd_size) + self.tmrbnd_size)
  return self._m_total_size
end

Nitf.ImageDataMask.property.bmrbnd_size = {}
function Nitf.ImageDataMask.property.bmrbnd_size:get()
  if self._m_bmrbnd_size ~= nil then
    return self._m_bmrbnd_size
  end

  self._m_bmrbnd_size = utils.box_unwrap((self.has_bmr) and utils.box_wrap((self.bmrtmr_count * 4)) or (0))
  return self._m_bmrbnd_size
end

Nitf.ImageDataMask.property.bmrtmr_count = {}
function Nitf.ImageDataMask.property.bmrtmr_count:get()
  if self._m_bmrtmr_count ~= nil then
    return self._m_bmrtmr_count
  end

  self._m_bmrtmr_count = ((tonumber(self._parent.image_sub_header.num_blocks_per_row) * tonumber(self._parent.image_sub_header.num_blocks_per_col)) * utils.box_unwrap((self._parent.image_sub_header.img_mode ~= "S") and utils.box_wrap(1) or (utils.box_unwrap((tonumber(self._parent.image_sub_header.num_bands) ~= 0) and utils.box_wrap(tonumber(self._parent.image_sub_header.num_bands)) or (tonumber(self._parent.image_sub_header.num_multispectral_bands))))))
  return self._m_bmrtmr_count
end

-- 
-- Block Mask Record Length.
-- 
-- Pad Pixel Mask Record Length.
-- 
-- Pad Output Pixel Code Length.
-- 
-- Pad Output Pixel Code.
-- 
-- Block n, Band m Offset.
-- 
-- Pad Pixel n, Band m.

Nitf.GraphicsSegment = class.class(KaitaiStruct)

function Nitf.GraphicsSegment:_init(idx, io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self.idx = idx
  self:_read()
end

function Nitf.GraphicsSegment:_read()
  self.graphic_sub_header = Nitf.GraphicSubHeader(self._io, self, self._root)
  self.graphic_data_field = self._io:read_bytes(tonumber(self._parent.header.lnnfo[self.idx + 1].length_graphic_segment))
end


Nitf.DataSubHeader = class.class(KaitaiStruct)

function Nitf.DataSubHeader:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Nitf.DataSubHeader:_read()
  self.des_base = Nitf.DataSubHeaderBase(self._io, self, self._root)
  if self.tre_ofl then
    self.overflowed_header_type = str_decode.decode(self._io:read_bytes(6), "UTF-8")
  end
  if self.tre_ofl then
    self.data_item_overflowed = str_decode.decode(self._io:read_bytes(3), "UTF-8")
  end
  self.des_defined_subheader_fields_len = str_decode.decode(self._io:read_bytes(4), "UTF-8")
  self.desshf = str_decode.decode(self._io:read_bytes(tonumber(self.des_defined_subheader_fields_len)), "UTF-8")
  self.des_defined_data_field = str_decode.decode(self._io:read_bytes_full(), "UTF-8")
end

Nitf.DataSubHeader.property.tre_ofl = {}
function Nitf.DataSubHeader.property.tre_ofl:get()
  if self._m_tre_ofl ~= nil then
    return self._m_tre_ofl
  end

  self._m_tre_ofl = self.des_base.desid == "TRE_OVERFLOW"
  return self._m_tre_ofl
end


Nitf.DataExtensionSegment = class.class(KaitaiStruct)

function Nitf.DataExtensionSegment:_init(idx, io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self.idx = idx
  self:_read()
end

function Nitf.DataExtensionSegment:_read()
  self._raw_data_sub_header = self._io:read_bytes(tonumber(self._parent.header.ldnfo[self.idx + 1].length_data_extension_subheader))
  local _io = KaitaiStream(stringstream(self._raw_data_sub_header))
  self.data_sub_header = Nitf.DataSubHeader(_io, self, self._root)
  self.data_data_field = self._io:read_bytes(tonumber(self._parent.header.ldnfo[self.idx + 1].length_data_extension_segment))
end


Nitf.DataSubHeaderTre = class.class(KaitaiStruct)

function Nitf.DataSubHeaderTre:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Nitf.DataSubHeaderTre:_read()
  self.des_base = Nitf.DataSubHeaderBase(self._io, self, self._root)
  if self.des_base.desid == "TRE_OVERFLOW" then
    self.overflowed_header_type = str_decode.decode(self._io:read_bytes(6), "UTF-8")
  end
  if self.des_base.desid == "TRE_OVERFLOW" then
    self.data_item_overflowed = str_decode.decode(self._io:read_bytes(3), "UTF-8")
  end
  self.des_defined_subheader_fields_len = str_decode.decode(self._io:read_bytes(4), "UTF-8")
  self.des_defined_data_field = str_decode.decode(self._io:read_bytes(tonumber(self.des_defined_subheader_fields_len)), "UTF-8")
end


Nitf.ImageSubHeader = class.class(KaitaiStruct)

function Nitf.ImageSubHeader:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Nitf.ImageSubHeader:_read()
  self.file_part_type = self._io:read_bytes(2)
  if not(self.file_part_type == "\073\077") then
    error("not equal, expected " ..  "\073\077" .. ", but got " .. self.file_part_type)
  end
  self.image_id_1 = str_decode.decode(self._io:read_bytes(10), "UTF-8")
  self.image_date_time = Nitf.DateTime(self._io, self, self._root)
  self.target_id = str_decode.decode(self._io:read_bytes(17), "UTF-8")
  self.image_id_2 = str_decode.decode(self._io:read_bytes(80), "UTF-8")
  self.image_security_classification = Nitf.Clasnfo(self._io, self, self._root)
  self.encryption = Nitf.Encrypt(self._io, self, self._root)
  self.image_source = str_decode.decode(self._io:read_bytes(42), "UTF-8")
  self.num_sig_rows = str_decode.decode(self._io:read_bytes(8), "UTF-8")
  self.num_sig_cols = str_decode.decode(self._io:read_bytes(8), "UTF-8")
  self.pixel_value_type = str_decode.decode(self._io:read_bytes(3), "UTF-8")
  self.image_representation = str_decode.decode(self._io:read_bytes(8), "UTF-8")
  self.image_category = str_decode.decode(self._io:read_bytes(8), "UTF-8")
  self.actual_bits_per_pixel_per_band = str_decode.decode(self._io:read_bytes(2), "UTF-8")
  self.pixel_justification = str_decode.decode(self._io:read_bytes(1), "UTF-8")
  self.image_coordinate_rep = str_decode.decode(self._io:read_bytes(1), "UTF-8")
  self.image_geo_loc = str_decode.decode(self._io:read_bytes(60), "UTF-8")
  self.num_img_comments = str_decode.decode(self._io:read_bytes(1), "UTF-8")
  self.img_comments = {}
  for i = 0, tonumber(self.num_img_comments) - 1 do
    self.img_comments[i + 1] = Nitf.ImageComment(self._io, self, self._root)
  end
  self.img_compression = str_decode.decode(self._io:read_bytes(2), "UTF-8")
  self.compression_rate_code = str_decode.decode(self._io:read_bytes(4), "UTF-8")
  self.num_bands = str_decode.decode(self._io:read_bytes(1), "UTF-8")
  if tonumber(self.num_bands) == 0 then
    self.num_multispectral_bands = str_decode.decode(self._io:read_bytes(5), "UTF-8")
  end
  self.bands = {}
  for i = 0, utils.box_unwrap((tonumber(self.num_bands) ~= 0) and utils.box_wrap(tonumber(self.num_bands)) or (tonumber(self.num_multispectral_bands))) - 1 do
    self.bands[i + 1] = Nitf.BandInfo(self._io, self, self._root)
  end
  self.img_sync_code = str_decode.decode(self._io:read_bytes(1), "UTF-8")
  self.img_mode = str_decode.decode(self._io:read_bytes(1), "UTF-8")
  self.num_blocks_per_row = str_decode.decode(self._io:read_bytes(4), "UTF-8")
  self.num_blocks_per_col = str_decode.decode(self._io:read_bytes(4), "UTF-8")
  self.num_pixels_per_block_horz = str_decode.decode(self._io:read_bytes(4), "UTF-8")
  self.num_pixels_per_block_vert = str_decode.decode(self._io:read_bytes(4), "UTF-8")
  self.num_pixels_per_band = str_decode.decode(self._io:read_bytes(2), "UTF-8")
  self.img_display_level = str_decode.decode(self._io:read_bytes(3), "UTF-8")
  self.attachment_level = str_decode.decode(self._io:read_bytes(3), "UTF-8")
  self.img_location = str_decode.decode(self._io:read_bytes(10), "UTF-8")
  self.img_magnification = str_decode.decode(self._io:read_bytes(4), "UTF-8")
  self.user_def_img_data_len = str_decode.decode(self._io:read_bytes(5), "UTF-8")
  if tonumber(self.user_def_img_data_len) ~= 0 then
    self.user_def_overflow = str_decode.decode(self._io:read_bytes(3), "UTF-8")
  end
  if tonumber(self.user_def_img_data_len) > 2 then
    self.user_def_img_data = {}
    for i = 0, (tonumber(self.user_def_img_data_len) - 3) - 1 do
      self.user_def_img_data[i + 1] = self._io:read_u1()
    end
  end
  self.image_extended_sub_header = Nitf.TreHeader(self._io, self, self._root)
end

-- 
-- Total number of rows of significant pixels in the image; only rows indexed 0 to (NROWS - 1) of the image contain significant data.
-- 
-- MONO, RGB, RGB/LUT, MULTI, NODISPLY, NVECTOR, POLAR, VPH, YCbCr601.
-- 
-- VIS, SL, TI, FL, RD, EO, OP, HR, HS,CP, BP, SAR, SARIQ, IR, MAP, MS, FP, MRI, XRAY, CAT, VD, PAT, LEG, DTEM, MATR, LOCG, BARO, CURRENT, DEPTH, WIND.
-- 
-- Reserved for future use.
-- 
-- B = Band Interleaved by Block, P = Band Interleaved by Pixel, R = Band Interleaved by Row, S = Band Sequential.

Nitf.ReservedSubHeader = class.class(KaitaiStruct)

function Nitf.ReservedSubHeader:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Nitf.ReservedSubHeader:_read()
  self.file_part_type_re = self._io:read_bytes(2)
  if not(self.file_part_type_re == "\082\069") then
    error("not equal, expected " ..  "\082\069" .. ", but got " .. self.file_part_type_re)
  end
  self.res_type_id = str_decode.decode(self._io:read_bytes(25), "UTF-8")
  self.res_version = str_decode.decode(self._io:read_bytes(2), "UTF-8")
  self.reclasnfo = Nitf.Clasnfo(self._io, self, self._root)
  self.res_user_defined_subheader_length = str_decode.decode(self._io:read_bytes(4), "UTF-8")
  self.res_user_defined_subheader_fields = str_decode.decode(self._io:read_bytes(tonumber(self.res_user_defined_subheader_length)), "UTF-8")
  self.res_user_defined_data = str_decode.decode(self._io:read_bytes_full(), "UTF-8")
end


Nitf.DataSubHeaderBase = class.class(KaitaiStruct)

function Nitf.DataSubHeaderBase:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Nitf.DataSubHeaderBase:_read()
  self.file_part_type_de = self._io:read_bytes(2)
  if not(self.file_part_type_de == "\068\069") then
    error("not equal, expected " ..  "\068\069" .. ", but got " .. self.file_part_type_de)
  end
  self.desid = str_decode.decode(self._io:read_bytes(25), "UTF-8")
  self.data_definition_version = str_decode.decode(self._io:read_bytes(2), "UTF-8")
  self.declasnfo = Nitf.Clasnfo(self._io, self, self._root)
end

-- 
-- File Part Type desigantor for Data Extension.

Nitf.TextSubHeader = class.class(KaitaiStruct)

function Nitf.TextSubHeader:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Nitf.TextSubHeader:_read()
  self.text_date_time = str_decode.decode(self._io:read_bytes(14), "UTF-8")
  self.text_title = str_decode.decode(self._io:read_bytes(80), "UTF-8")
  self.text_security_class = Nitf.Clasnfo(self._io, self, self._root)
  self.encryp = Nitf.Encrypt(self._io, self, self._root)
  self.text_format = str_decode.decode(self._io:read_bytes(3), "UTF-8")
  self.text_extended_sub_header = Nitf.TreHeader(self._io, self, self._root)
end

-- 
-- MTF (USMTF see MIL-STD-6040), STA (indicates BCS), UT1 (indicates ECS), U8S.

Nitf.DateTime = class.class(KaitaiStruct)

function Nitf.DateTime:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Nitf.DateTime:_read()
  self._unnamed0 = str_decode.decode(self._io:read_bytes(14), "UTF-8")
end

-- 
-- UTC time of image acquisition in the format CCYYMMDDhhmmss: CC century, YY last two digits of the year, MM month, DD day, hh hour, mm minute, ss second.

Nitf.Header = class.class(KaitaiStruct)

function Nitf.Header:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Nitf.Header:_read()
  self.file_profile_name = self._io:read_bytes(4)
  if not(self.file_profile_name == "\078\073\084\070") then
    error("not equal, expected " ..  "\078\073\084\070" .. ", but got " .. self.file_profile_name)
  end
  self.file_version = self._io:read_bytes(5)
  if not(self.file_version == "\048\050\046\049\048") then
    error("not equal, expected " ..  "\048\050\046\049\048" .. ", but got " .. self.file_version)
  end
  self.complexity_level = self._io:read_bytes(2)
  self.standard_type = self._io:read_bytes(4)
  if not(self.standard_type == "\066\070\048\049") then
    error("not equal, expected " ..  "\066\070\048\049" .. ", but got " .. self.standard_type)
  end
  self.originating_station_id = str_decode.decode(self._io:read_bytes(10), "UTF-8")
  self.file_date_time = Nitf.DateTime(self._io, self, self._root)
  self.file_title = str_decode.decode(self._io:read_bytes(80), "UTF-8")
  self.file_security = Nitf.Clasnfo(self._io, self, self._root)
  self.file_copy_number = str_decode.decode(self._io:read_bytes(5), "UTF-8")
  self.file_num_of_copys = str_decode.decode(self._io:read_bytes(5), "UTF-8")
  self.encryption = Nitf.Encrypt(self._io, self, self._root)
  self.file_bg_color = self._io:read_bytes(3)
  self.originator_name = str_decode.decode(self._io:read_bytes(24), "UTF-8")
  self.originator_phone = str_decode.decode(self._io:read_bytes(18), "UTF-8")
  self.file_length = str_decode.decode(self._io:read_bytes(12), "UTF-8")
  self.file_header_length = str_decode.decode(self._io:read_bytes(6), "UTF-8")
  self.num_image_segments = str_decode.decode(self._io:read_bytes(3), "UTF-8")
  self.linfo = {}
  for i = 0, tonumber(self.num_image_segments) - 1 do
    self.linfo[i + 1] = Nitf.LengthImageInfo(self._io, self, self._root)
  end
  self.num_graphics_segments = str_decode.decode(self._io:read_bytes(3), "UTF-8")
  self.lnnfo = {}
  for i = 0, tonumber(self.num_graphics_segments) - 1 do
    self.lnnfo[i + 1] = Nitf.LengthGraphicInfo(self._io, self, self._root)
  end
  self.reserved_numx = str_decode.decode(self._io:read_bytes(3), "UTF-8")
  self.num_text_files = str_decode.decode(self._io:read_bytes(3), "UTF-8")
  self.ltnfo = {}
  for i = 0, tonumber(self.num_text_files) - 1 do
    self.ltnfo[i + 1] = Nitf.LengthTextInfo(self._io, self, self._root)
  end
  self.num_data_extension = str_decode.decode(self._io:read_bytes(3), "UTF-8")
  self.ldnfo = {}
  for i = 0, tonumber(self.num_data_extension) - 1 do
    self.ldnfo[i + 1] = Nitf.LengthDataInfo(self._io, self, self._root)
  end
  self.num_reserved_extension = str_decode.decode(self._io:read_bytes(3), "UTF-8")
  self.lrnfo = {}
  for i = 0, tonumber(self.num_reserved_extension) - 1 do
    self.lrnfo[i + 1] = Nitf.LengthReservedInfo(self._io, self, self._root)
  end
  self.user_defined_header = Nitf.TreHeader(self._io, self, self._root)
  self.extended_header = Nitf.TreHeader(self._io, self, self._root)
end

-- 
-- Value of BF01 indicates the file is formatted using ISO/IEC IS 12087-5.

-- 
-- Streaming file Header Data Extension Segment Subheader.
Nitf.DataSubHeaderStreaming = class.class(KaitaiStruct)

function Nitf.DataSubHeaderStreaming:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Nitf.DataSubHeaderStreaming:_read()
  self.des_base = Nitf.DataSubHeaderBase(self._io, self, self._root)
  self.des_defined_subheader_fields_len = str_decode.decode(self._io:read_bytes(4), "UTF-8")
  self.sfh_l1 = str_decode.decode(self._io:read_bytes(7), "UTF-8")
  self.sfh_delim1 = self._io:read_u4be()
  self.sfh_dr = {}
  for i = 0, tonumber(self.sfh_l1) - 1 do
    self.sfh_dr[i + 1] = self._io:read_u1()
  end
  self.sfh_delim2 = self._io:read_u4be()
  self.sfh_l2 = str_decode.decode(self._io:read_bytes(7), "UTF-8")
end

-- 
-- SFH Length 1: number of bytes in sfh_dr field.
-- 
-- Shall contain the value 0x0A6E1D97.
-- 
-- Shall contain the value 0x0ECA14BF.
-- 
-- A repeat of sfh_l1.

Nitf.TreHeader = class.class(KaitaiStruct)

function Nitf.TreHeader:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Nitf.TreHeader:_read()
  self.header_data_length = str_decode.decode(self._io:read_bytes(5), "UTF-8")
  if tonumber(self.header_data_length) ~= 0 then
    self.header_overflow = str_decode.decode(self._io:read_bytes(3), "UTF-8")
  end
  if tonumber(self.header_data_length) > 2 then
    self.header_data = {}
    for i = 0, (tonumber(self.header_data_length) - 3) - 1 do
      self.header_data[i + 1] = self._io:read_u1()
    end
  end
end


Nitf.LengthImageInfo = class.class(KaitaiStruct)

function Nitf.LengthImageInfo:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Nitf.LengthImageInfo:_read()
  self.length_image_subheader = str_decode.decode(self._io:read_bytes(6), "UTF-8")
  self.length_image_segment = str_decode.decode(self._io:read_bytes(10), "UTF-8")
end


Nitf.LengthDataInfo = class.class(KaitaiStruct)

function Nitf.LengthDataInfo:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Nitf.LengthDataInfo:_read()
  self.length_data_extension_subheader = str_decode.decode(self._io:read_bytes(4), "UTF-8")
  self.length_data_extension_segment = str_decode.decode(self._io:read_bytes(9), "UTF-8")
end


Nitf.LengthTextInfo = class.class(KaitaiStruct)

function Nitf.LengthTextInfo:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function Nitf.LengthTextInfo:_read()
  self.length_text_subheader = str_decode.decode(self._io:read_bytes(4), "UTF-8")
  self.length_text_segment = str_decode.decode(self._io:read_bytes(5), "UTF-8")
end


