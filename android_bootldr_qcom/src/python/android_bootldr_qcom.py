# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import KaitaiStruct, KaitaiStream, BytesIO


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class AndroidBootldrQcom(KaitaiStruct):
    """A bootloader for Android used on various devices powered by Qualcomm
    Snapdragon chips:
    
    <https://en.wikipedia.org/wiki/Devices_using_Qualcomm_Snapdragon_processors>
    
    Although not all of the Snapdragon based Android devices use this particular
    bootloader format, it is known that devices with the following chips have used
    it (example devices are given for each chip):
    
    * APQ8064 ([devices](https://en.wikipedia.org/wiki/Devices_using_Qualcomm_Snapdragon_processors#Snapdragon_S4_Pro))
      - Nexus 4 "mako": [sample][sample-mako] ([other samples][others-mako]),
        [releasetools.py](https://android.googlesource.com/device/lge/mako/+/33f0114/releasetools.py#98)
    
    * MSM8974AA ([devices](https://en.wikipedia.org/wiki/Devices_using_Qualcomm_Snapdragon_processors#Snapdragon_800,_801_and_805_(2013/14)))
      - Nexus 5 "hammerhead": [sample][sample-hammerhead] ([other samples][others-hammerhead]),
        [releasetools.py](https://android.googlesource.com/device/lge/hammerhead/+/7618a7d/releasetools.py#116)
    
    * MSM8992 ([devices](https://en.wikipedia.org/wiki/Devices_using_Qualcomm_Snapdragon_processors#Snapdragon_808_and_810_(2015)))
      - Nexus 5X "bullhead": [sample][sample-bullhead] ([other samples][others-bullhead]),
        [releasetools.py](https://android.googlesource.com/device/lge/bullhead/+/2994b6b/releasetools.py#126)
    
    * APQ8064-1AA ([devices](https://en.wikipedia.org/wiki/Devices_using_Qualcomm_Snapdragon_processors#Snapdragon_600_(2013)))
      - Nexus 7 \[2013] (Mobile) "deb" <a href="#doc-note-data-after-img-bodies">(\**)</a>: [sample][sample-deb] ([other samples][others-deb]),
        [releasetools.py](https://android.googlesource.com/device/asus/deb/+/14c1638/releasetools.py#105)
      - Nexus 7 \[2013] (Wi-Fi) "flo" <a href="#doc-note-data-after-img-bodies">(\**)</a>: [sample][sample-flo] ([other samples][others-flo]),
        [releasetools.py](https://android.googlesource.com/device/asus/flo/+/9d9fee9/releasetools.py#130)
    
    * MSM8996 Pro-AB ([devices](https://en.wikipedia.org/wiki/Devices_using_Qualcomm_Snapdragon_processors#Snapdragon_820_and_821_(2016)))
      - Pixel "sailfish" <a href="#doc-note-bootloader-size">(\*)</a>:
        [sample][sample-sailfish] ([other samples][others-sailfish])
      - Pixel XL "marlin" <a href="#doc-note-bootloader-size">(\*)</a>:
        [sample][sample-marlin] ([other samples][others-marlin])
    
    * MSM8998 ([devices](https://en.wikipedia.org/wiki/Devices_using_Qualcomm_Snapdragon_processors#Snapdragon_835_(2017)))
      - Pixel 2 "walleye" <a href="#doc-note-bootloader-size">(\*)</a>: [sample][sample-walleye] ([other samples][others-walleye])
      - Pixel 2 XL "taimen": [sample][sample-taimen] ([other samples][others-taimen])
    
    <small id="doc-note-bootloader-size">(\*)
    `bootloader_size` is equal to the size of the whole file (not just `img_bodies` as usual).
    </small>
    
    <small id="doc-note-data-after-img-bodies">(\**)
    There are some data after the end of `img_bodies`.
    </small>
    
    ---
    
    On the other hand, devices with these chips **do not** use this format:
    
    * <del>APQ8084</del> ([devices](https://en.wikipedia.org/wiki/Devices_using_Qualcomm_Snapdragon_processors#Snapdragon_800,_801_and_805_(2013/14)))
      - Nexus 6 "shamu": [sample][foreign-sample-shamu] ([other samples][foreign-others-shamu]),
        [releasetools.py](https://android.googlesource.com/device/moto/shamu/+/df9354d/releasetools.py#12) -
        uses "Motoboot packed image format" instead
    
    * <del>MSM8994</del> ([devices](https://en.wikipedia.org/wiki/Devices_using_Qualcomm_Snapdragon_processors#Snapdragon_808_and_810_(2015)))
      - Nexus 6P "angler": [sample][foreign-sample-angler] ([other samples][foreign-others-angler]),
        [releasetools.py](https://android.googlesource.com/device/huawei/angler/+/cf92cd8/releasetools.py#29) -
        uses "Huawei Bootloader packed image format" instead
    
    [sample-mako]: https://androidfilehost.com/?fid=96039337900113996 "bootloader-mako-makoz30f.img"
    [others-mako]: https://androidfilehost.com/?w=search&s=bootloader-mako&type=files
    
    [sample-hammerhead]: https://androidfilehost.com/?fid=385035244224410247 "bootloader-hammerhead-hhz20h.img"
    [others-hammerhead]: https://androidfilehost.com/?w=search&s=bootloader-hammerhead&type=files
    
    [sample-bullhead]: https://androidfilehost.com/?fid=11410963190603870177 "bootloader-bullhead-bhz32c.img"
    [others-bullhead]: https://androidfilehost.com/?w=search&s=bootloader-bullhead&type=files
    
    [sample-deb]: https://androidfilehost.com/?fid=23501681358552487 "bootloader-deb-flo-04.02.img"
    [others-deb]: https://androidfilehost.com/?w=search&s=bootloader-deb-flo&type=files
    
    [sample-flo]: https://androidfilehost.com/?fid=23991606952593542 "bootloader-flo-flo-04.05.img"
    [others-flo]: https://androidfilehost.com/?w=search&s=bootloader-flo-flo&type=files
    
    [sample-sailfish]: https://androidfilehost.com/?fid=6006931924117907154 "bootloader-sailfish-8996-012001-1904111134.img"
    [others-sailfish]: https://androidfilehost.com/?w=search&s=bootloader-sailfish&type=files
    
    [sample-marlin]: https://androidfilehost.com/?fid=6006931924117907131 "bootloader-marlin-8996-012001-1904111134.img"
    [others-marlin]: https://androidfilehost.com/?w=search&s=bootloader-marlin&type=files
    
    [sample-walleye]: https://androidfilehost.com/?fid=14943124697586348540 "bootloader-walleye-mw8998-003.0085.00.img"
    [others-walleye]: https://androidfilehost.com/?w=search&s=bootloader-walleye&type=files
    
    [sample-taimen]: https://androidfilehost.com/?fid=14943124697586348536 "bootloader-taimen-tmz30m.img"
    [others-taimen]: https://androidfilehost.com/?w=search&s=bootloader-taimen&type=files
    
    [foreign-sample-shamu]: https://androidfilehost.com/?fid=745849072291678307 "bootloader-shamu-moto-apq8084-72.04.img"
    [foreign-others-shamu]: https://androidfilehost.com/?w=search&s=bootloader-shamu&type=files
    
    [foreign-sample-angler]: https://androidfilehost.com/?fid=11410963190603870158 "bootloader-angler-angler-03.84.img"
    [foreign-others-angler]: https://androidfilehost.com/?w=search&s=bootloader-angler&type=files
    
    ---
    
    The `bootloader-*.img` samples referenced above originally come from factory
    images packed in ZIP archives that can be found on the page [Factory Images
    for Nexus and Pixel Devices](https://developers.google.com/android/images) on
    the Google Developers site. Note that the codenames on that page may be
    different than the ones that are written in the list above. That's because the
    Google page indicates **ROM codenames** in headings (e.g. "occam" for Nexus 4)
    but the above list uses **model codenames** (e.g. "mako" for Nexus 4) because
    that is how the original `bootloader-*.img` files are identified. For most
    devices, however, these code names are the same.
    
    .. seealso::
       Source - https://android.googlesource.com/device/lge/hammerhead/+/7618a7d/releasetools.py
    """
    def __init__(self, _io, _parent=None, _root=None):
        super(AndroidBootldrQcom, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self
        self._read()

    def _read(self):
        self.magic = self._io.read_bytes(8)
        if not self.magic == b"\x42\x4F\x4F\x54\x4C\x44\x52\x21":
            raise kaitaistruct.ValidationNotEqualError(b"\x42\x4F\x4F\x54\x4C\x44\x52\x21", self.magic, self._io, u"/seq/0")
        self.num_images = self._io.read_u4le()
        self.ofs_img_bodies = self._io.read_u4le()
        self.bootloader_size = self._io.read_u4le()
        self.img_headers = []
        for i in range(self.num_images):
            self.img_headers.append(AndroidBootldrQcom.ImgHeader(self._io, self, self._root))



    def _fetch_instances(self):
        pass
        for i in range(len(self.img_headers)):
            pass
            self.img_headers[i]._fetch_instances()

        _ = self.img_bodies
        if hasattr(self, '_m_img_bodies'):
            pass
            for i in range(len(self._m_img_bodies)):
                pass
                self._m_img_bodies[i]._fetch_instances()



    class ImgBody(KaitaiStruct):
        def __init__(self, idx, _io, _parent=None, _root=None):
            super(AndroidBootldrQcom.ImgBody, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self.idx = idx
            self._read()

        def _read(self):
            self.body = self._io.read_bytes(self.img_header.len_body)


        def _fetch_instances(self):
            pass

        @property
        def img_header(self):
            if hasattr(self, '_m_img_header'):
                return self._m_img_header

            self._m_img_header = self._root.img_headers[self.idx]
            return getattr(self, '_m_img_header', None)


    class ImgHeader(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(AndroidBootldrQcom.ImgHeader, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.name = (KaitaiStream.bytes_terminate(self._io.read_bytes(64), 0, False)).decode(u"ASCII")
            self.len_body = self._io.read_u4le()


        def _fetch_instances(self):
            pass


    @property
    def img_bodies(self):
        if hasattr(self, '_m_img_bodies'):
            return self._m_img_bodies

        _pos = self._io.pos()
        self._io.seek(self.ofs_img_bodies)
        self._m_img_bodies = []
        for i in range(self.num_images):
            self._m_img_bodies.append(AndroidBootldrQcom.ImgBody(i, self._io, self, self._root))

        self._io.seek(_pos)
        return getattr(self, '_m_img_bodies', None)


