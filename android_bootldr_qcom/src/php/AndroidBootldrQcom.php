<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

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
 */

namespace {
    class AndroidBootldrQcom extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Kaitai\Struct\Struct $_parent = null, ?\AndroidBootldrQcom $_root = null) {
            parent::__construct($_io, $_parent, $_root === null ? $this : $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_magic = $this->_io->readBytes(8);
            if (!($this->_m_magic == "\x42\x4F\x4F\x54\x4C\x44\x52\x21")) {
                throw new \Kaitai\Struct\Error\ValidationNotEqualError("\x42\x4F\x4F\x54\x4C\x44\x52\x21", $this->_m_magic, $this->_io, "/seq/0");
            }
            $this->_m_numImages = $this->_io->readU4le();
            $this->_m_ofsImgBodies = $this->_io->readU4le();
            $this->_m_bootloaderSize = $this->_io->readU4le();
            $this->_m_imgHeaders = [];
            $n = $this->numImages();
            for ($i = 0; $i < $n; $i++) {
                $this->_m_imgHeaders[] = new \AndroidBootldrQcom\ImgHeader($this->_io, $this, $this->_root);
            }
        }
        protected $_m_imgBodies;
        public function imgBodies() {
            if ($this->_m_imgBodies !== null)
                return $this->_m_imgBodies;
            $_pos = $this->_io->pos();
            $this->_io->seek($this->ofsImgBodies());
            $this->_m_imgBodies = [];
            $n = $this->numImages();
            for ($i = 0; $i < $n; $i++) {
                $this->_m_imgBodies[] = new \AndroidBootldrQcom\ImgBody($i, $this->_io, $this, $this->_root);
            }
            $this->_io->seek($_pos);
            return $this->_m_imgBodies;
        }
        protected $_m_magic;
        protected $_m_numImages;
        protected $_m_ofsImgBodies;
        protected $_m_bootloaderSize;
        protected $_m_imgHeaders;
        public function magic() { return $this->_m_magic; }
        public function numImages() { return $this->_m_numImages; }
        public function ofsImgBodies() { return $this->_m_ofsImgBodies; }

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
        public function bootloaderSize() { return $this->_m_bootloaderSize; }
        public function imgHeaders() { return $this->_m_imgHeaders; }
    }
}

namespace AndroidBootldrQcom {
    class ImgBody extends \Kaitai\Struct\Struct {
        public function __construct(int $idx, \Kaitai\Struct\Stream $_io, ?\AndroidBootldrQcom $_parent = null, ?\AndroidBootldrQcom $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_m_idx = $idx;
            $this->_read();
        }

        private function _read() {
            $this->_m_body = $this->_io->readBytes($this->imgHeader()->lenBody());
        }
        protected $_m_imgHeader;
        public function imgHeader() {
            if ($this->_m_imgHeader !== null)
                return $this->_m_imgHeader;
            $this->_m_imgHeader = $this->_root()->imgHeaders()[$this->idx()];
            return $this->_m_imgHeader;
        }
        protected $_m_body;
        protected $_m_idx;
        public function body() { return $this->_m_body; }
        public function idx() { return $this->_m_idx; }
    }
}

namespace AndroidBootldrQcom {
    class ImgHeader extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\AndroidBootldrQcom $_parent = null, ?\AndroidBootldrQcom $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_name = \Kaitai\Struct\Stream::bytesToStr(\Kaitai\Struct\Stream::bytesTerminate($this->_io->readBytes(64), 0, false), "ASCII");
            $this->_m_lenBody = $this->_io->readU4le();
        }
        protected $_m_name;
        protected $_m_lenBody;
        public function name() { return $this->_m_name; }
        public function lenBody() { return $this->_m_lenBody; }
    }
}
