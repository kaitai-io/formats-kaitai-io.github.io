-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
local str_decode = require("string_decode")

-- 
-- A bootloader for Android used on various devices powered by Qualcomm
-- Snapdragon chips:
-- 
-- <https://en.wikipedia.org/wiki/Devices_using_Qualcomm_Snapdragon_processors>
-- 
-- Although not all of the Snapdragon based Android devices use this particular
-- bootloader format, it is known that devices with the following chips have used
-- it (example devices are given for each chip):
-- 
-- * APQ8064 ([devices](https://en.wikipedia.org/wiki/Devices_using_Qualcomm_Snapdragon_processors#Snapdragon_S4_Pro))
--   - Nexus 4 "mako": [sample][sample-mako] ([other samples][others-mako]),
--     [releasetools.py](https://android.googlesource.com/device/lge/mako/+/33f0114/releasetools.py#98)
-- 
-- * MSM8974AA ([devices](https://en.wikipedia.org/wiki/Devices_using_Qualcomm_Snapdragon_processors#Snapdragon_800,_801_and_805_(2013/14)))
--   - Nexus 5 "hammerhead": [sample][sample-hammerhead] ([other samples][others-hammerhead]),
--     [releasetools.py](https://android.googlesource.com/device/lge/hammerhead/+/7618a7d/releasetools.py#116)
-- 
-- * MSM8992 ([devices](https://en.wikipedia.org/wiki/Devices_using_Qualcomm_Snapdragon_processors#Snapdragon_808_and_810_(2015)))
--   - Nexus 5X "bullhead": [sample][sample-bullhead] ([other samples][others-bullhead]),
--     [releasetools.py](https://android.googlesource.com/device/lge/bullhead/+/2994b6b/releasetools.py#126)
-- 
-- * APQ8064-1AA ([devices](https://en.wikipedia.org/wiki/Devices_using_Qualcomm_Snapdragon_processors#Snapdragon_600_(2013)))
--   - Nexus 7 \[2013] (Mobile) "deb" <a href="#doc-note-data-after-img-bodies">(\**)</a>: [sample][sample-deb] ([other samples][others-deb]),
--     [releasetools.py](https://android.googlesource.com/device/asus/deb/+/14c1638/releasetools.py#105)
--   - Nexus 7 \[2013] (Wi-Fi) "flo" <a href="#doc-note-data-after-img-bodies">(\**)</a>: [sample][sample-flo] ([other samples][others-flo]),
--     [releasetools.py](https://android.googlesource.com/device/asus/flo/+/9d9fee9/releasetools.py#130)
-- 
-- * MSM8996 Pro-AB ([devices](https://en.wikipedia.org/wiki/Devices_using_Qualcomm_Snapdragon_processors#Snapdragon_820_and_821_(2016)))
--   - Pixel "sailfish" <a href="#doc-note-bootloader-size">(\*)</a>:
--     [sample][sample-sailfish] ([other samples][others-sailfish])
--   - Pixel XL "marlin" <a href="#doc-note-bootloader-size">(\*)</a>:
--     [sample][sample-marlin] ([other samples][others-marlin])
-- 
-- * MSM8998 ([devices](https://en.wikipedia.org/wiki/Devices_using_Qualcomm_Snapdragon_processors#Snapdragon_835_(2017)))
--   - Pixel 2 "walleye" <a href="#doc-note-bootloader-size">(\*)</a>: [sample][sample-walleye] ([other samples][others-walleye])
--   - Pixel 2 XL "taimen": [sample][sample-taimen] ([other samples][others-taimen])
-- 
-- <small id="doc-note-bootloader-size">(\*)
-- `bootloader_size` is equal to the size of the whole file (not just `img_bodies` as usual).
-- </small>
-- 
-- <small id="doc-note-data-after-img-bodies">(\**)
-- There are some data after the end of `img_bodies`.
-- </small>
-- 
-- ---
-- 
-- On the other hand, devices with these chips **do not** use this format:
-- 
-- * <del>APQ8084</del> ([devices](https://en.wikipedia.org/wiki/Devices_using_Qualcomm_Snapdragon_processors#Snapdragon_800,_801_and_805_(2013/14)))
--   - Nexus 6 "shamu": [sample][foreign-sample-shamu] ([other samples][foreign-others-shamu]),
--     [releasetools.py](https://android.googlesource.com/device/moto/shamu/+/df9354d/releasetools.py#12) -
--     uses "Motoboot packed image format" instead
-- 
-- * <del>MSM8994</del> ([devices](https://en.wikipedia.org/wiki/Devices_using_Qualcomm_Snapdragon_processors#Snapdragon_808_and_810_(2015)))
--   - Nexus 6P "angler": [sample][foreign-sample-angler] ([other samples][foreign-others-angler]),
--     [releasetools.py](https://android.googlesource.com/device/huawei/angler/+/cf92cd8/releasetools.py#29) -
--     uses "Huawei Bootloader packed image format" instead
-- 
-- [sample-mako]: https://androidfilehost.com/?fid=96039337900113996 "bootloader-mako-makoz30f.img"
-- [others-mako]: https://androidfilehost.com/?w=search&s=bootloader-mako&type=files
-- 
-- [sample-hammerhead]: https://androidfilehost.com/?fid=385035244224410247 "bootloader-hammerhead-hhz20h.img"
-- [others-hammerhead]: https://androidfilehost.com/?w=search&s=bootloader-hammerhead&type=files
-- 
-- [sample-bullhead]: https://androidfilehost.com/?fid=11410963190603870177 "bootloader-bullhead-bhz32c.img"
-- [others-bullhead]: https://androidfilehost.com/?w=search&s=bootloader-bullhead&type=files
-- 
-- [sample-deb]: https://androidfilehost.com/?fid=23501681358552487 "bootloader-deb-flo-04.02.img"
-- [others-deb]: https://androidfilehost.com/?w=search&s=bootloader-deb-flo&type=files
-- 
-- [sample-flo]: https://androidfilehost.com/?fid=23991606952593542 "bootloader-flo-flo-04.05.img"
-- [others-flo]: https://androidfilehost.com/?w=search&s=bootloader-flo-flo&type=files
-- 
-- [sample-sailfish]: https://androidfilehost.com/?fid=6006931924117907154 "bootloader-sailfish-8996-012001-1904111134.img"
-- [others-sailfish]: https://androidfilehost.com/?w=search&s=bootloader-sailfish&type=files
-- 
-- [sample-marlin]: https://androidfilehost.com/?fid=6006931924117907131 "bootloader-marlin-8996-012001-1904111134.img"
-- [others-marlin]: https://androidfilehost.com/?w=search&s=bootloader-marlin&type=files
-- 
-- [sample-walleye]: https://androidfilehost.com/?fid=14943124697586348540 "bootloader-walleye-mw8998-003.0085.00.img"
-- [others-walleye]: https://androidfilehost.com/?w=search&s=bootloader-walleye&type=files
-- 
-- [sample-taimen]: https://androidfilehost.com/?fid=14943124697586348536 "bootloader-taimen-tmz30m.img"
-- [others-taimen]: https://androidfilehost.com/?w=search&s=bootloader-taimen&type=files
-- 
-- [foreign-sample-shamu]: https://androidfilehost.com/?fid=745849072291678307 "bootloader-shamu-moto-apq8084-72.04.img"
-- [foreign-others-shamu]: https://androidfilehost.com/?w=search&s=bootloader-shamu&type=files
-- 
-- [foreign-sample-angler]: https://androidfilehost.com/?fid=11410963190603870158 "bootloader-angler-angler-03.84.img"
-- [foreign-others-angler]: https://androidfilehost.com/?w=search&s=bootloader-angler&type=files
-- 
-- ---
-- 
-- The `bootloader-*.img` samples referenced above originally come from factory
-- images packed in ZIP archives that can be found on the page [Factory Images
-- for Nexus and Pixel Devices](https://developers.google.com/android/images) on
-- the Google Developers site. Note that the codenames on that page may be
-- different than the ones that are written in the list above. That's because the
-- Google page indicates **ROM codenames** in headings (e.g. "occam" for Nexus 4)
-- but the above list uses **model codenames** (e.g. "mako" for Nexus 4) because
-- that is how the original `bootloader-*.img` files are identified. For most
-- devices, however, these code names are the same.
-- See also: Source (https://android.googlesource.com/device/lge/hammerhead/+/7618a7d/releasetools.py)
AndroidBootldrQcom = class.class(KaitaiStruct)

function AndroidBootldrQcom:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function AndroidBootldrQcom:_read()
  self.magic = self._io:read_bytes(8)
  if not(self.magic == "\066\079\079\084\076\068\082\033") then
    error("not equal, expected " ..  "\066\079\079\084\076\068\082\033" .. ", but got " .. self.magic)
  end
  self.num_images = self._io:read_u4le()
  self.ofs_img_bodies = self._io:read_u4le()
  self.bootloader_size = self._io:read_u4le()
  self.img_headers = {}
  for i = 0, self.num_images - 1 do
    self.img_headers[i + 1] = AndroidBootldrQcom.ImgHeader(self._io, self, self._root)
  end
end

AndroidBootldrQcom.property.img_bodies = {}
function AndroidBootldrQcom.property.img_bodies:get()
  if self._m_img_bodies ~= nil then
    return self._m_img_bodies
  end

  local _pos = self._io:pos()
  self._io:seek(self.ofs_img_bodies)
  self._m_img_bodies = {}
  for i = 0, self.num_images - 1 do
    self._m_img_bodies[i + 1] = AndroidBootldrQcom.ImgBody(i, self._io, self, self._root)
  end
  self._io:seek(_pos)
  return self._m_img_bodies
end

-- 
-- According to all available `releasetools.py` versions from AOSP (links are
-- in the top-level `/doc`), this should determine only the size of
-- `img_bodies` - there is [an assertion](
-- https://android.googlesource.com/device/lge/hammerhead/+/7618a7d/releasetools.py#167)
-- for it.
-- 
-- However, files for certain Pixel devices (see `/doc`) apparently declare
-- the entire file size here (i.e. including also fields from `magic` to
-- `img_headers`). So if you interpreted `bootloader_size` as the size of
-- `img_bodies` substream in these files, you would exceed the end of file.
-- Although you could check that it fits in the file before attempting to
-- create a substream of that size, you wouldn't know if it's meant to
-- specify the size of just `img_bodies` or the size of the entire bootloader
-- payload (whereas there may be additional data after the end of payload)
-- until parsing `img_bodies` (or at least summing sizes from `img_headers`,
-- but that's stupid).
-- 
-- So this field isn't reliable enough to be used as the size of any
-- substream. If you want to check if it has a reasonable value, do so in
-- your application code.

AndroidBootldrQcom.ImgHeader = class.class(KaitaiStruct)

function AndroidBootldrQcom.ImgHeader:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function AndroidBootldrQcom.ImgHeader:_read()
  self.name = str_decode.decode(KaitaiStream.bytes_terminate(self._io:read_bytes(64), 0, false), "ASCII")
  self.len_body = self._io:read_u4le()
end


AndroidBootldrQcom.ImgBody = class.class(KaitaiStruct)

function AndroidBootldrQcom.ImgBody:_init(idx, io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self.idx = idx
  self:_read()
end

function AndroidBootldrQcom.ImgBody:_read()
  self.body = self._io:read_bytes(self.img_header.len_body)
end

AndroidBootldrQcom.ImgBody.property.img_header = {}
function AndroidBootldrQcom.ImgBody.property.img_header:get()
  if self._m_img_header ~= nil then
    return self._m_img_header
  end

  self._m_img_header = self._root.img_headers[self.idx + 1]
  return self._m_img_header
end


