// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import (
	"github.com/kaitai-io/kaitai_struct_go_runtime/kaitai"
	"bytes"
	"io"
)


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
 * @see <a href="https://android.googlesource.com/device/lge/hammerhead/+/7618a7d/releasetools.py">Source</a>
 */
type AndroidBootldrQcom struct {
	Magic []byte
	NumImages uint32
	OfsImgBodies uint32
	BootloaderSize uint32
	ImgHeaders []*AndroidBootldrQcom_ImgHeader
	_io *kaitai.Stream
	_root *AndroidBootldrQcom
	_parent interface{}
	_f_imgBodies bool
	imgBodies []*AndroidBootldrQcom_ImgBody
}
func NewAndroidBootldrQcom() *AndroidBootldrQcom {
	return &AndroidBootldrQcom{
	}
}

func (this *AndroidBootldrQcom) Read(io *kaitai.Stream, parent interface{}, root *AndroidBootldrQcom) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp1, err := this._io.ReadBytes(int(8))
	if err != nil {
		return err
	}
	tmp1 = tmp1
	this.Magic = tmp1
	if !(bytes.Equal(this.Magic, []uint8{66, 79, 79, 84, 76, 68, 82, 33})) {
		return kaitai.NewValidationNotEqualError([]uint8{66, 79, 79, 84, 76, 68, 82, 33}, this.Magic, this._io, "/seq/0")
	}
	tmp2, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.NumImages = uint32(tmp2)
	tmp3, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.OfsImgBodies = uint32(tmp3)
	tmp4, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.BootloaderSize = uint32(tmp4)
	this.ImgHeaders = make([]*AndroidBootldrQcom_ImgHeader, this.NumImages)
	for i := range this.ImgHeaders {
		tmp5 := NewAndroidBootldrQcom_ImgHeader()
		err = tmp5.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.ImgHeaders[i] = tmp5
	}
	return err
}
func (this *AndroidBootldrQcom) ImgBodies() (v []*AndroidBootldrQcom_ImgBody, err error) {
	if (this._f_imgBodies) {
		return this.imgBodies, nil
	}
	_pos, err := this._io.Pos()
	if err != nil {
		return nil, err
	}
	_, err = this._io.Seek(int64(this.OfsImgBodies), io.SeekStart)
	if err != nil {
		return nil, err
	}
	this.imgBodies = make([]*AndroidBootldrQcom_ImgBody, this.NumImages)
	for i := range this.imgBodies {
		tmp6 := NewAndroidBootldrQcom_ImgBody(i)
		err = tmp6.Read(this._io, this, this._root)
		if err != nil {
			return nil, err
		}
		this.imgBodies[i] = tmp6
	}
	_, err = this._io.Seek(_pos, io.SeekStart)
	if err != nil {
		return nil, err
	}
	this._f_imgBodies = true
	this._f_imgBodies = true
	return this.imgBodies, nil
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
type AndroidBootldrQcom_ImgHeader struct {
	Name string
	LenBody uint32
	_io *kaitai.Stream
	_root *AndroidBootldrQcom
	_parent *AndroidBootldrQcom
}
func NewAndroidBootldrQcom_ImgHeader() *AndroidBootldrQcom_ImgHeader {
	return &AndroidBootldrQcom_ImgHeader{
	}
}

func (this *AndroidBootldrQcom_ImgHeader) Read(io *kaitai.Stream, parent *AndroidBootldrQcom, root *AndroidBootldrQcom) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp7, err := this._io.ReadBytes(int(64))
	if err != nil {
		return err
	}
	tmp7 = kaitai.BytesTerminate(tmp7, 0, false)
	this.Name = string(tmp7)
	tmp8, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.LenBody = uint32(tmp8)
	return err
}
type AndroidBootldrQcom_ImgBody struct {
	Body []byte
	Idx int32
	_io *kaitai.Stream
	_root *AndroidBootldrQcom
	_parent *AndroidBootldrQcom
	_f_imgHeader bool
	imgHeader *AndroidBootldrQcom_ImgHeader
}
func NewAndroidBootldrQcom_ImgBody(idx int32) *AndroidBootldrQcom_ImgBody {
	return &AndroidBootldrQcom_ImgBody{
		Idx: idx,
	}
}

func (this *AndroidBootldrQcom_ImgBody) Read(io *kaitai.Stream, parent *AndroidBootldrQcom, root *AndroidBootldrQcom) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp9, err := this.ImgHeader()
	if err != nil {
		return err
	}
	tmp10, err := this._io.ReadBytes(int(tmp9.LenBody))
	if err != nil {
		return err
	}
	tmp10 = tmp10
	this.Body = tmp10
	return err
}
func (this *AndroidBootldrQcom_ImgBody) ImgHeader() (v *AndroidBootldrQcom_ImgHeader, err error) {
	if (this._f_imgHeader) {
		return this.imgHeader, nil
	}
	this.imgHeader = this._root.ImgHeaders[this.Idx]
	this._f_imgHeader = true
	return this.imgHeader, nil
}
