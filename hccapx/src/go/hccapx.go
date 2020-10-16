// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import (
	"github.com/kaitai-io/kaitai_struct_go_runtime/kaitai"
	"bytes"
)


/**
 * Native format of Hashcat password "recovery" utility
 * @see <a href="https://hashcat.net/wiki/doku.php?id=hccapx">Source</a>
 */
type Hccapx struct {
	Records []*Hccapx_HccapxRecord
	_io *kaitai.Stream
	_root *Hccapx
	_parent interface{}
}
func NewHccapx() *Hccapx {
	return &Hccapx{
	}
}

func (this *Hccapx) Read(io *kaitai.Stream, parent interface{}, root *Hccapx) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	for i := 1;; i++ {
		tmp1, err := this._io.EOF()
		if err != nil {
			return err
		}
		if tmp1 {
			break
		}
		tmp2 := NewHccapx_HccapxRecord()
		err = tmp2.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Records = append(this.Records, tmp2)
	}
	return err
}
type Hccapx_HccapxRecord struct {
	Magic []byte
	Version uint32
	IgnoreReplayCounter bool
	MessagePair uint64
	LenEssid uint8
	Essid []byte
	Padding1 []byte
	Keyver uint8
	Keymic []byte
	MacAp []byte
	NonceAp []byte
	MacStation []byte
	NonceStation []byte
	LenEapol uint16
	Eapol []byte
	Padding2 []byte
	_io *kaitai.Stream
	_root *Hccapx
	_parent *Hccapx
}
func NewHccapx_HccapxRecord() *Hccapx_HccapxRecord {
	return &Hccapx_HccapxRecord{
	}
}

func (this *Hccapx_HccapxRecord) Read(io *kaitai.Stream, parent *Hccapx, root *Hccapx) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp3, err := this._io.ReadBytes(int(4))
	if err != nil {
		return err
	}
	tmp3 = tmp3
	this.Magic = tmp3
	if !(bytes.Equal(this.Magic, []uint8{72, 67, 80, 88})) {
		return kaitai.NewValidationNotEqualError([]uint8{72, 67, 80, 88}, this.Magic, this._io, "/types/hccapx_record/seq/0")
	}
	tmp4, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Version = uint32(tmp4)
	tmp5, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.IgnoreReplayCounter = tmp5 != 0
	tmp6, err := this._io.ReadBitsIntBe(7)
	if err != nil {
		return err
	}
	this.MessagePair = tmp6
	this._io.AlignToByte()
	tmp7, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.LenEssid = tmp7
	tmp8, err := this._io.ReadBytes(int(this.LenEssid))
	if err != nil {
		return err
	}
	tmp8 = tmp8
	this.Essid = tmp8
	tmp9, err := this._io.ReadBytes(int((32 - this.LenEssid)))
	if err != nil {
		return err
	}
	tmp9 = tmp9
	this.Padding1 = tmp9
	tmp10, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Keyver = tmp10
	tmp11, err := this._io.ReadBytes(int(16))
	if err != nil {
		return err
	}
	tmp11 = tmp11
	this.Keymic = tmp11
	tmp12, err := this._io.ReadBytes(int(6))
	if err != nil {
		return err
	}
	tmp12 = tmp12
	this.MacAp = tmp12
	tmp13, err := this._io.ReadBytes(int(32))
	if err != nil {
		return err
	}
	tmp13 = tmp13
	this.NonceAp = tmp13
	tmp14, err := this._io.ReadBytes(int(6))
	if err != nil {
		return err
	}
	tmp14 = tmp14
	this.MacStation = tmp14
	tmp15, err := this._io.ReadBytes(int(32))
	if err != nil {
		return err
	}
	tmp15 = tmp15
	this.NonceStation = tmp15
	tmp16, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.LenEapol = uint16(tmp16)
	tmp17, err := this._io.ReadBytes(int(this.LenEapol))
	if err != nil {
		return err
	}
	tmp17 = tmp17
	this.Eapol = tmp17
	tmp18, err := this._io.ReadBytes(int((256 - this.LenEapol)))
	if err != nil {
		return err
	}
	tmp18 = tmp18
	this.Padding2 = tmp18
	return err
}

/**
 * The version number of the .hccapx file format.
 */

/**
 * Indicates if the message pair matching was done based on
 * replay counter or not.
 * 
 * Whenever it was set to 1 it means that the replay counter
 * was ignored (i.e. it was not considered at all by the
 * matching algorithm).
 * 
 * Hashcat currently does not perform any particular action
 * based on this bit, but nonetheless this information could be
 * crucial for some 3th party tools and for
 * analysis/statistics. There could be some opportunity to
 * implement some further logic based on this particular
 * information also within hashcat (in the future).
 */

/**
 * The message_pair value describes which messages of the 4-way
 * handshake were combined to form the .hccapx structure. It is
 * always a pair of 2 messages: 1 from the AP (access point)
 * and 1 from the STA (client).
 * 
 * Furthermore, the message_pair value also gives a hint from
 * which of the 2 messages the EAPOL origins. This is
 * interesting data, but not necessarily needed for hashcat to
 * be able to crack the hash.
 * 
 * On the other hand, it could be very important to know if
 * “only” message 1 and message 2 were captured or if for
 * instance message 3 and/or message 4 were captured too. If
 * message 3 and/or message 4 were captured it should be a hard
 * evidence that the connection was established and that the
 * password the client used was the correct one.
 */

/**
 * The flag used to distinguish WPA from WPA2 ciphers. Value of
 * 1 means WPA, other - WPA2.
 */

/**
 * The final hash value. MD5 for WPA and SHA-1 for WPA2
 * (truncated to 128 bit).
 */

/**
 * The BSSID (MAC address) of the access point.
 */

/**
 * Nonce (random salt) generated by the access point.
 */

/**
 * The MAC address of the client connecting to the access point.
 */

/**
 * Nonce (random salt) generated by the client connecting to the access point.
 */

/**
 * The length of the EAPOL data.
 */
