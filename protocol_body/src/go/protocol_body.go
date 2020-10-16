// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import "github.com/kaitai-io/kaitai_struct_go_runtime/kaitai"


/**
 * Protocol body represents particular payload on transport level (OSI
 * layer 4).
 * 
 * Typically this payload in encapsulated into network level (OSI layer
 * 3) packet, which includes "protocol number" field that would be used
 * to decide what's inside the payload and how to parse it. Thanks to
 * IANA's standardization effort, multiple network level use the same
 * IDs for these payloads named "protocol numbers".
 * 
 * This is effectively a "router" type: it expects to get protocol
 * number as a parameter, and then invokes relevant type parser based
 * on that parameter.
 * @see <a href="http://www.iana.org/assignments/protocol-numbers/protocol-numbers.xhtml">Source</a>
 */

type ProtocolBody_ProtocolEnum int
const (
	ProtocolBody_ProtocolEnum__Hopopt ProtocolBody_ProtocolEnum = 0
	ProtocolBody_ProtocolEnum__Icmp ProtocolBody_ProtocolEnum = 1
	ProtocolBody_ProtocolEnum__Igmp ProtocolBody_ProtocolEnum = 2
	ProtocolBody_ProtocolEnum__Ggp ProtocolBody_ProtocolEnum = 3
	ProtocolBody_ProtocolEnum__Ipv4 ProtocolBody_ProtocolEnum = 4
	ProtocolBody_ProtocolEnum__St ProtocolBody_ProtocolEnum = 5
	ProtocolBody_ProtocolEnum__Tcp ProtocolBody_ProtocolEnum = 6
	ProtocolBody_ProtocolEnum__Cbt ProtocolBody_ProtocolEnum = 7
	ProtocolBody_ProtocolEnum__Egp ProtocolBody_ProtocolEnum = 8
	ProtocolBody_ProtocolEnum__Igp ProtocolBody_ProtocolEnum = 9
	ProtocolBody_ProtocolEnum__BbnRccMon ProtocolBody_ProtocolEnum = 10
	ProtocolBody_ProtocolEnum__NvpIi ProtocolBody_ProtocolEnum = 11
	ProtocolBody_ProtocolEnum__Pup ProtocolBody_ProtocolEnum = 12
	ProtocolBody_ProtocolEnum__Argus ProtocolBody_ProtocolEnum = 13
	ProtocolBody_ProtocolEnum__Emcon ProtocolBody_ProtocolEnum = 14
	ProtocolBody_ProtocolEnum__Xnet ProtocolBody_ProtocolEnum = 15
	ProtocolBody_ProtocolEnum__Chaos ProtocolBody_ProtocolEnum = 16
	ProtocolBody_ProtocolEnum__Udp ProtocolBody_ProtocolEnum = 17
	ProtocolBody_ProtocolEnum__Mux ProtocolBody_ProtocolEnum = 18
	ProtocolBody_ProtocolEnum__DcnMeas ProtocolBody_ProtocolEnum = 19
	ProtocolBody_ProtocolEnum__Hmp ProtocolBody_ProtocolEnum = 20
	ProtocolBody_ProtocolEnum__Prm ProtocolBody_ProtocolEnum = 21
	ProtocolBody_ProtocolEnum__XnsIdp ProtocolBody_ProtocolEnum = 22
	ProtocolBody_ProtocolEnum__Trunk1 ProtocolBody_ProtocolEnum = 23
	ProtocolBody_ProtocolEnum__Trunk2 ProtocolBody_ProtocolEnum = 24
	ProtocolBody_ProtocolEnum__Leaf1 ProtocolBody_ProtocolEnum = 25
	ProtocolBody_ProtocolEnum__Leaf2 ProtocolBody_ProtocolEnum = 26
	ProtocolBody_ProtocolEnum__Rdp ProtocolBody_ProtocolEnum = 27
	ProtocolBody_ProtocolEnum__Irtp ProtocolBody_ProtocolEnum = 28
	ProtocolBody_ProtocolEnum__IsoTp4 ProtocolBody_ProtocolEnum = 29
	ProtocolBody_ProtocolEnum__Netblt ProtocolBody_ProtocolEnum = 30
	ProtocolBody_ProtocolEnum__MfeNsp ProtocolBody_ProtocolEnum = 31
	ProtocolBody_ProtocolEnum__MeritInp ProtocolBody_ProtocolEnum = 32
	ProtocolBody_ProtocolEnum__Dccp ProtocolBody_ProtocolEnum = 33
	ProtocolBody_ProtocolEnum__X3pc ProtocolBody_ProtocolEnum = 34
	ProtocolBody_ProtocolEnum__Idpr ProtocolBody_ProtocolEnum = 35
	ProtocolBody_ProtocolEnum__Xtp ProtocolBody_ProtocolEnum = 36
	ProtocolBody_ProtocolEnum__Ddp ProtocolBody_ProtocolEnum = 37
	ProtocolBody_ProtocolEnum__IdprCmtp ProtocolBody_ProtocolEnum = 38
	ProtocolBody_ProtocolEnum__TpPlusPlus ProtocolBody_ProtocolEnum = 39
	ProtocolBody_ProtocolEnum__Il ProtocolBody_ProtocolEnum = 40
	ProtocolBody_ProtocolEnum__Ipv6 ProtocolBody_ProtocolEnum = 41
	ProtocolBody_ProtocolEnum__Sdrp ProtocolBody_ProtocolEnum = 42
	ProtocolBody_ProtocolEnum__Ipv6Route ProtocolBody_ProtocolEnum = 43
	ProtocolBody_ProtocolEnum__Ipv6Frag ProtocolBody_ProtocolEnum = 44
	ProtocolBody_ProtocolEnum__Idrp ProtocolBody_ProtocolEnum = 45
	ProtocolBody_ProtocolEnum__Rsvp ProtocolBody_ProtocolEnum = 46
	ProtocolBody_ProtocolEnum__Gre ProtocolBody_ProtocolEnum = 47
	ProtocolBody_ProtocolEnum__Dsr ProtocolBody_ProtocolEnum = 48
	ProtocolBody_ProtocolEnum__Bna ProtocolBody_ProtocolEnum = 49
	ProtocolBody_ProtocolEnum__Esp ProtocolBody_ProtocolEnum = 50
	ProtocolBody_ProtocolEnum__Ah ProtocolBody_ProtocolEnum = 51
	ProtocolBody_ProtocolEnum__INlsp ProtocolBody_ProtocolEnum = 52
	ProtocolBody_ProtocolEnum__Swipe ProtocolBody_ProtocolEnum = 53
	ProtocolBody_ProtocolEnum__Narp ProtocolBody_ProtocolEnum = 54
	ProtocolBody_ProtocolEnum__Mobile ProtocolBody_ProtocolEnum = 55
	ProtocolBody_ProtocolEnum__Tlsp ProtocolBody_ProtocolEnum = 56
	ProtocolBody_ProtocolEnum__Skip ProtocolBody_ProtocolEnum = 57
	ProtocolBody_ProtocolEnum__Ipv6Icmp ProtocolBody_ProtocolEnum = 58
	ProtocolBody_ProtocolEnum__Ipv6Nonxt ProtocolBody_ProtocolEnum = 59
	ProtocolBody_ProtocolEnum__Ipv6Opts ProtocolBody_ProtocolEnum = 60
	ProtocolBody_ProtocolEnum__AnyHostInternalProtocol ProtocolBody_ProtocolEnum = 61
	ProtocolBody_ProtocolEnum__Cftp ProtocolBody_ProtocolEnum = 62
	ProtocolBody_ProtocolEnum__AnyLocalNetwork ProtocolBody_ProtocolEnum = 63
	ProtocolBody_ProtocolEnum__SatExpak ProtocolBody_ProtocolEnum = 64
	ProtocolBody_ProtocolEnum__Kryptolan ProtocolBody_ProtocolEnum = 65
	ProtocolBody_ProtocolEnum__Rvd ProtocolBody_ProtocolEnum = 66
	ProtocolBody_ProtocolEnum__Ippc ProtocolBody_ProtocolEnum = 67
	ProtocolBody_ProtocolEnum__AnyDistributedFileSystem ProtocolBody_ProtocolEnum = 68
	ProtocolBody_ProtocolEnum__SatMon ProtocolBody_ProtocolEnum = 69
	ProtocolBody_ProtocolEnum__Visa ProtocolBody_ProtocolEnum = 70
	ProtocolBody_ProtocolEnum__Ipcv ProtocolBody_ProtocolEnum = 71
	ProtocolBody_ProtocolEnum__Cpnx ProtocolBody_ProtocolEnum = 72
	ProtocolBody_ProtocolEnum__Cphb ProtocolBody_ProtocolEnum = 73
	ProtocolBody_ProtocolEnum__Wsn ProtocolBody_ProtocolEnum = 74
	ProtocolBody_ProtocolEnum__Pvp ProtocolBody_ProtocolEnum = 75
	ProtocolBody_ProtocolEnum__BrSatMon ProtocolBody_ProtocolEnum = 76
	ProtocolBody_ProtocolEnum__SunNd ProtocolBody_ProtocolEnum = 77
	ProtocolBody_ProtocolEnum__WbMon ProtocolBody_ProtocolEnum = 78
	ProtocolBody_ProtocolEnum__WbExpak ProtocolBody_ProtocolEnum = 79
	ProtocolBody_ProtocolEnum__IsoIp ProtocolBody_ProtocolEnum = 80
	ProtocolBody_ProtocolEnum__Vmtp ProtocolBody_ProtocolEnum = 81
	ProtocolBody_ProtocolEnum__SecureVmtp ProtocolBody_ProtocolEnum = 82
	ProtocolBody_ProtocolEnum__Vines ProtocolBody_ProtocolEnum = 83
	ProtocolBody_ProtocolEnum__TtpOrIptm ProtocolBody_ProtocolEnum = 84
	ProtocolBody_ProtocolEnum__NsfnetIgp ProtocolBody_ProtocolEnum = 85
	ProtocolBody_ProtocolEnum__Dgp ProtocolBody_ProtocolEnum = 86
	ProtocolBody_ProtocolEnum__Tcf ProtocolBody_ProtocolEnum = 87
	ProtocolBody_ProtocolEnum__Eigrp ProtocolBody_ProtocolEnum = 88
	ProtocolBody_ProtocolEnum__Ospfigp ProtocolBody_ProtocolEnum = 89
	ProtocolBody_ProtocolEnum__SpriteRpc ProtocolBody_ProtocolEnum = 90
	ProtocolBody_ProtocolEnum__Larp ProtocolBody_ProtocolEnum = 91
	ProtocolBody_ProtocolEnum__Mtp ProtocolBody_ProtocolEnum = 92
	ProtocolBody_ProtocolEnum__Ax25 ProtocolBody_ProtocolEnum = 93
	ProtocolBody_ProtocolEnum__Ipip ProtocolBody_ProtocolEnum = 94
	ProtocolBody_ProtocolEnum__Micp ProtocolBody_ProtocolEnum = 95
	ProtocolBody_ProtocolEnum__SccSp ProtocolBody_ProtocolEnum = 96
	ProtocolBody_ProtocolEnum__Etherip ProtocolBody_ProtocolEnum = 97
	ProtocolBody_ProtocolEnum__Encap ProtocolBody_ProtocolEnum = 98
	ProtocolBody_ProtocolEnum__AnyPrivateEncryptionScheme ProtocolBody_ProtocolEnum = 99
	ProtocolBody_ProtocolEnum__Gmtp ProtocolBody_ProtocolEnum = 100
	ProtocolBody_ProtocolEnum__Ifmp ProtocolBody_ProtocolEnum = 101
	ProtocolBody_ProtocolEnum__Pnni ProtocolBody_ProtocolEnum = 102
	ProtocolBody_ProtocolEnum__Pim ProtocolBody_ProtocolEnum = 103
	ProtocolBody_ProtocolEnum__Aris ProtocolBody_ProtocolEnum = 104
	ProtocolBody_ProtocolEnum__Scps ProtocolBody_ProtocolEnum = 105
	ProtocolBody_ProtocolEnum__Qnx ProtocolBody_ProtocolEnum = 106
	ProtocolBody_ProtocolEnum__AN ProtocolBody_ProtocolEnum = 107
	ProtocolBody_ProtocolEnum__Ipcomp ProtocolBody_ProtocolEnum = 108
	ProtocolBody_ProtocolEnum__Snp ProtocolBody_ProtocolEnum = 109
	ProtocolBody_ProtocolEnum__CompaqPeer ProtocolBody_ProtocolEnum = 110
	ProtocolBody_ProtocolEnum__IpxInIp ProtocolBody_ProtocolEnum = 111
	ProtocolBody_ProtocolEnum__Vrrp ProtocolBody_ProtocolEnum = 112
	ProtocolBody_ProtocolEnum__Pgm ProtocolBody_ProtocolEnum = 113
	ProtocolBody_ProtocolEnum__Any0Hop ProtocolBody_ProtocolEnum = 114
	ProtocolBody_ProtocolEnum__L2tp ProtocolBody_ProtocolEnum = 115
	ProtocolBody_ProtocolEnum__Ddx ProtocolBody_ProtocolEnum = 116
	ProtocolBody_ProtocolEnum__Iatp ProtocolBody_ProtocolEnum = 117
	ProtocolBody_ProtocolEnum__Stp ProtocolBody_ProtocolEnum = 118
	ProtocolBody_ProtocolEnum__Srp ProtocolBody_ProtocolEnum = 119
	ProtocolBody_ProtocolEnum__Uti ProtocolBody_ProtocolEnum = 120
	ProtocolBody_ProtocolEnum__Smp ProtocolBody_ProtocolEnum = 121
	ProtocolBody_ProtocolEnum__Sm ProtocolBody_ProtocolEnum = 122
	ProtocolBody_ProtocolEnum__Ptp ProtocolBody_ProtocolEnum = 123
	ProtocolBody_ProtocolEnum__IsisOverIpv4 ProtocolBody_ProtocolEnum = 124
	ProtocolBody_ProtocolEnum__Fire ProtocolBody_ProtocolEnum = 125
	ProtocolBody_ProtocolEnum__Crtp ProtocolBody_ProtocolEnum = 126
	ProtocolBody_ProtocolEnum__Crudp ProtocolBody_ProtocolEnum = 127
	ProtocolBody_ProtocolEnum__Sscopmce ProtocolBody_ProtocolEnum = 128
	ProtocolBody_ProtocolEnum__Iplt ProtocolBody_ProtocolEnum = 129
	ProtocolBody_ProtocolEnum__Sps ProtocolBody_ProtocolEnum = 130
	ProtocolBody_ProtocolEnum__Pipe ProtocolBody_ProtocolEnum = 131
	ProtocolBody_ProtocolEnum__Sctp ProtocolBody_ProtocolEnum = 132
	ProtocolBody_ProtocolEnum__Fc ProtocolBody_ProtocolEnum = 133
	ProtocolBody_ProtocolEnum__RsvpE2eIgnore ProtocolBody_ProtocolEnum = 134
	ProtocolBody_ProtocolEnum__MobilityHeader ProtocolBody_ProtocolEnum = 135
	ProtocolBody_ProtocolEnum__Udplite ProtocolBody_ProtocolEnum = 136
	ProtocolBody_ProtocolEnum__MplsInIp ProtocolBody_ProtocolEnum = 137
	ProtocolBody_ProtocolEnum__Manet ProtocolBody_ProtocolEnum = 138
	ProtocolBody_ProtocolEnum__Hip ProtocolBody_ProtocolEnum = 139
	ProtocolBody_ProtocolEnum__Shim6 ProtocolBody_ProtocolEnum = 140
	ProtocolBody_ProtocolEnum__Wesp ProtocolBody_ProtocolEnum = 141
	ProtocolBody_ProtocolEnum__Rohc ProtocolBody_ProtocolEnum = 142
	ProtocolBody_ProtocolEnum__Reserved255 ProtocolBody_ProtocolEnum = 255
)
type ProtocolBody struct {
	Body interface{}
	ProtocolNum uint8
	_io *kaitai.Stream
	_root *ProtocolBody
	_parent interface{}
	_f_protocol bool
	protocol ProtocolBody_ProtocolEnum
}
func NewProtocolBody(protocolNum uint8) *ProtocolBody {
	return &ProtocolBody{
		ProtocolNum: protocolNum,
	}
}

func (this *ProtocolBody) Read(io *kaitai.Stream, parent interface{}, root *ProtocolBody) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp1, err := this.Protocol()
	if err != nil {
		return err
	}
	switch (tmp1) {
	case ProtocolBody_ProtocolEnum__Ipv6Nonxt:
		tmp2 := NewProtocolBody_NoNextHeader()
		err = tmp2.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp2
	case ProtocolBody_ProtocolEnum__Ipv4:
		tmp3 := NewIpv4Packet()
		err = tmp3.Read(this._io, this, nil)
		if err != nil {
			return err
		}
		this.Body = tmp3
	case ProtocolBody_ProtocolEnum__Udp:
		tmp4 := NewUdpDatagram()
		err = tmp4.Read(this._io, this, nil)
		if err != nil {
			return err
		}
		this.Body = tmp4
	case ProtocolBody_ProtocolEnum__Icmp:
		tmp5 := NewIcmpPacket()
		err = tmp5.Read(this._io, this, nil)
		if err != nil {
			return err
		}
		this.Body = tmp5
	case ProtocolBody_ProtocolEnum__Hopopt:
		tmp6 := NewProtocolBody_OptionHopByHop()
		err = tmp6.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp6
	case ProtocolBody_ProtocolEnum__Ipv6:
		tmp7 := NewIpv6Packet()
		err = tmp7.Read(this._io, this, nil)
		if err != nil {
			return err
		}
		this.Body = tmp7
	case ProtocolBody_ProtocolEnum__Tcp:
		tmp8 := NewTcpSegment()
		err = tmp8.Read(this._io, this, nil)
		if err != nil {
			return err
		}
		this.Body = tmp8
	}
	return err
}
func (this *ProtocolBody) Protocol() (v ProtocolBody_ProtocolEnum, err error) {
	if (this._f_protocol) {
		return this.protocol, nil
	}
	this.protocol = ProtocolBody_ProtocolEnum(ProtocolBody_ProtocolEnum(this.ProtocolNum))
	this._f_protocol = true
	return this.protocol, nil
}

/**
 * Dummy type for IPv6 "no next header" type, which signifies end of headers chain.
 */
type ProtocolBody_NoNextHeader struct {
	_io *kaitai.Stream
	_root *ProtocolBody
	_parent *ProtocolBody
}
func NewProtocolBody_NoNextHeader() *ProtocolBody_NoNextHeader {
	return &ProtocolBody_NoNextHeader{
	}
}

func (this *ProtocolBody_NoNextHeader) Read(io *kaitai.Stream, parent *ProtocolBody, root *ProtocolBody) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	return err
}
type ProtocolBody_OptionHopByHop struct {
	NextHeaderType uint8
	HdrExtLen uint8
	Body []byte
	NextHeader *ProtocolBody
	_io *kaitai.Stream
	_root *ProtocolBody
	_parent *ProtocolBody
}
func NewProtocolBody_OptionHopByHop() *ProtocolBody_OptionHopByHop {
	return &ProtocolBody_OptionHopByHop{
	}
}

func (this *ProtocolBody_OptionHopByHop) Read(io *kaitai.Stream, parent *ProtocolBody, root *ProtocolBody) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp9, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.NextHeaderType = tmp9
	tmp10, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.HdrExtLen = tmp10
	tmp11, err := this._io.ReadBytes(int((this.HdrExtLen - 1)))
	if err != nil {
		return err
	}
	tmp11 = tmp11
	this.Body = tmp11
	tmp12 := NewProtocolBody(this.NextHeaderType)
	err = tmp12.Read(this._io, this, nil)
	if err != nil {
		return err
	}
	this.NextHeader = tmp12
	return err
}
