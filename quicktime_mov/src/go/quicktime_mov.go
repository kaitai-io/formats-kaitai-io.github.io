// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import (
	"github.com/kaitai-io/kaitai_struct_go_runtime/kaitai"
	"bytes"
)


/**
 * @see <a href="https://developer.apple.com/library/content/documentation/QuickTime/QTFF/QTFFChap1/qtff1.html#//apple_ref/doc/uid/TP40000939-CH203-BBCGDDDF">Source</a>
 */

type QuicktimeMov_AtomType int
const (
	QuicktimeMov_AtomType__Xtra QuicktimeMov_AtomType = 1484026465
	QuicktimeMov_AtomType__Dinf QuicktimeMov_AtomType = 1684631142
	QuicktimeMov_AtomType__Dref QuicktimeMov_AtomType = 1685218662
	QuicktimeMov_AtomType__Edts QuicktimeMov_AtomType = 1701082227
	QuicktimeMov_AtomType__Elst QuicktimeMov_AtomType = 1701606260
	QuicktimeMov_AtomType__Free QuicktimeMov_AtomType = 1718773093
	QuicktimeMov_AtomType__Ftyp QuicktimeMov_AtomType = 1718909296
	QuicktimeMov_AtomType__Hdlr QuicktimeMov_AtomType = 1751411826
	QuicktimeMov_AtomType__Iods QuicktimeMov_AtomType = 1768907891
	QuicktimeMov_AtomType__Mdat QuicktimeMov_AtomType = 1835295092
	QuicktimeMov_AtomType__Mdhd QuicktimeMov_AtomType = 1835296868
	QuicktimeMov_AtomType__Mdia QuicktimeMov_AtomType = 1835297121
	QuicktimeMov_AtomType__Meta QuicktimeMov_AtomType = 1835365473
	QuicktimeMov_AtomType__Minf QuicktimeMov_AtomType = 1835626086
	QuicktimeMov_AtomType__Moof QuicktimeMov_AtomType = 1836019558
	QuicktimeMov_AtomType__Moov QuicktimeMov_AtomType = 1836019574
	QuicktimeMov_AtomType__Mvhd QuicktimeMov_AtomType = 1836476516
	QuicktimeMov_AtomType__Smhd QuicktimeMov_AtomType = 1936549988
	QuicktimeMov_AtomType__Stbl QuicktimeMov_AtomType = 1937007212
	QuicktimeMov_AtomType__Stco QuicktimeMov_AtomType = 1937007471
	QuicktimeMov_AtomType__Stsc QuicktimeMov_AtomType = 1937011555
	QuicktimeMov_AtomType__Stsd QuicktimeMov_AtomType = 1937011556
	QuicktimeMov_AtomType__Stsz QuicktimeMov_AtomType = 1937011578
	QuicktimeMov_AtomType__Stts QuicktimeMov_AtomType = 1937011827
	QuicktimeMov_AtomType__Tkhd QuicktimeMov_AtomType = 1953196132
	QuicktimeMov_AtomType__Traf QuicktimeMov_AtomType = 1953653094
	QuicktimeMov_AtomType__Trak QuicktimeMov_AtomType = 1953653099
	QuicktimeMov_AtomType__Tref QuicktimeMov_AtomType = 1953654118
	QuicktimeMov_AtomType__Udta QuicktimeMov_AtomType = 1969517665
	QuicktimeMov_AtomType__Vmhd QuicktimeMov_AtomType = 1986881636
)

type QuicktimeMov_Brand int
const (
	QuicktimeMov_Brand__X3g2a QuicktimeMov_Brand = 862401121
	QuicktimeMov_Brand__X3ge6 QuicktimeMov_Brand = 862414134
	QuicktimeMov_Brand__X3ge7 QuicktimeMov_Brand = 862414135
	QuicktimeMov_Brand__X3ge9 QuicktimeMov_Brand = 862414137
	QuicktimeMov_Brand__X3gf9 QuicktimeMov_Brand = 862414393
	QuicktimeMov_Brand__X3gg6 QuicktimeMov_Brand = 862414646
	QuicktimeMov_Brand__X3gg9 QuicktimeMov_Brand = 862414649
	QuicktimeMov_Brand__X3gh9 QuicktimeMov_Brand = 862414905
	QuicktimeMov_Brand__X3gm9 QuicktimeMov_Brand = 862416185
	QuicktimeMov_Brand__X3gma QuicktimeMov_Brand = 862416193
	QuicktimeMov_Brand__X3gp4 QuicktimeMov_Brand = 862416948
	QuicktimeMov_Brand__X3gp5 QuicktimeMov_Brand = 862416949
	QuicktimeMov_Brand__X3gp6 QuicktimeMov_Brand = 862416950
	QuicktimeMov_Brand__X3gp7 QuicktimeMov_Brand = 862416951
	QuicktimeMov_Brand__X3gp8 QuicktimeMov_Brand = 862416952
	QuicktimeMov_Brand__X3gp9 QuicktimeMov_Brand = 862416953
	QuicktimeMov_Brand__X3gr6 QuicktimeMov_Brand = 862417462
	QuicktimeMov_Brand__X3gr9 QuicktimeMov_Brand = 862417465
	QuicktimeMov_Brand__X3gs6 QuicktimeMov_Brand = 862417718
	QuicktimeMov_Brand__X3gs9 QuicktimeMov_Brand = 862417721
	QuicktimeMov_Brand__X3gt8 QuicktimeMov_Brand = 862417976
	QuicktimeMov_Brand__X3gt9 QuicktimeMov_Brand = 862417977
	QuicktimeMov_Brand__X3gtv QuicktimeMov_Brand = 862418038
	QuicktimeMov_Brand__X3gvr QuicktimeMov_Brand = 862418546
	QuicktimeMov_Brand__X3vra QuicktimeMov_Brand = 863400545
	QuicktimeMov_Brand__X3vrb QuicktimeMov_Brand = 863400546
	QuicktimeMov_Brand__X3vrm QuicktimeMov_Brand = 863400557
	QuicktimeMov_Brand__Arri QuicktimeMov_Brand = 1095914057
	QuicktimeMov_Brand__Caep QuicktimeMov_Brand = 1128351056
	QuicktimeMov_Brand__Cdes QuicktimeMov_Brand = 1128555891
	QuicktimeMov_Brand__J2p0 QuicktimeMov_Brand = 1244811312
	QuicktimeMov_Brand__J2p1 QuicktimeMov_Brand = 1244811313
	QuicktimeMov_Brand__Lcag QuicktimeMov_Brand = 1279476039
	QuicktimeMov_Brand__M4a QuicktimeMov_Brand = 1295270176
	QuicktimeMov_Brand__M4b QuicktimeMov_Brand = 1295270432
	QuicktimeMov_Brand__M4p QuicktimeMov_Brand = 1295274016
	QuicktimeMov_Brand__M4v QuicktimeMov_Brand = 1295275552
	QuicktimeMov_Brand__Ma1a QuicktimeMov_Brand = 1296118081
	QuicktimeMov_Brand__Ma1b QuicktimeMov_Brand = 1296118082
	QuicktimeMov_Brand__Mfsm QuicktimeMov_Brand = 1296454477
	QuicktimeMov_Brand__Mgsv QuicktimeMov_Brand = 1296520022
	QuicktimeMov_Brand__Mppi QuicktimeMov_Brand = 1297109065
	QuicktimeMov_Brand__Msnv QuicktimeMov_Brand = 1297305174
	QuicktimeMov_Brand__Miab QuicktimeMov_Brand = 1298743618
	QuicktimeMov_Brand__Miac QuicktimeMov_Brand = 1298743619
	QuicktimeMov_Brand__Mian QuicktimeMov_Brand = 1298743662
	QuicktimeMov_Brand__Mibu QuicktimeMov_Brand = 1298743925
	QuicktimeMov_Brand__Micm QuicktimeMov_Brand = 1298744173
	QuicktimeMov_Brand__Miha QuicktimeMov_Brand = 1298745409
	QuicktimeMov_Brand__Mihb QuicktimeMov_Brand = 1298745410
	QuicktimeMov_Brand__Mihe QuicktimeMov_Brand = 1298745413
	QuicktimeMov_Brand__Mipr QuicktimeMov_Brand = 1298747506
	QuicktimeMov_Brand__Ross QuicktimeMov_Brand = 1380930387
	QuicktimeMov_Brand__Seau QuicktimeMov_Brand = 1397047637
	QuicktimeMov_Brand__Sebk QuicktimeMov_Brand = 1397047883
	QuicktimeMov_Brand__Xavc QuicktimeMov_Brand = 1480676931
	QuicktimeMov_Brand__Adti QuicktimeMov_Brand = 1633973353
	QuicktimeMov_Brand__Aid3 QuicktimeMov_Brand = 1634296883
	QuicktimeMov_Brand__Av01 QuicktimeMov_Brand = 1635135537
	QuicktimeMov_Brand__Avc1 QuicktimeMov_Brand = 1635148593
	QuicktimeMov_Brand__Avci QuicktimeMov_Brand = 1635148649
	QuicktimeMov_Brand__Avcs QuicktimeMov_Brand = 1635148659
	QuicktimeMov_Brand__Avde QuicktimeMov_Brand = 1635148901
	QuicktimeMov_Brand__Avif QuicktimeMov_Brand = 1635150182
	QuicktimeMov_Brand__Avio QuicktimeMov_Brand = 1635150191
	QuicktimeMov_Brand__Avis QuicktimeMov_Brand = 1635150195
	QuicktimeMov_Brand__Bbxm QuicktimeMov_Brand = 1650620525
	QuicktimeMov_Brand__Ca4m QuicktimeMov_Brand = 1667314797
	QuicktimeMov_Brand__Ca4s QuicktimeMov_Brand = 1667314803
	QuicktimeMov_Brand__Caaa QuicktimeMov_Brand = 1667326305
	QuicktimeMov_Brand__Caac QuicktimeMov_Brand = 1667326307
	QuicktimeMov_Brand__Cabl QuicktimeMov_Brand = 1667326572
	QuicktimeMov_Brand__Cama QuicktimeMov_Brand = 1667329377
	QuicktimeMov_Brand__Camc QuicktimeMov_Brand = 1667329379
	QuicktimeMov_Brand__Caqv QuicktimeMov_Brand = 1667330422
	QuicktimeMov_Brand__Casu QuicktimeMov_Brand = 1667330933
	QuicktimeMov_Brand__Ccea QuicktimeMov_Brand = 1667458401
	QuicktimeMov_Brand__Ccff QuicktimeMov_Brand = 1667458662
	QuicktimeMov_Brand__Cdm1 QuicktimeMov_Brand = 1667525937
	QuicktimeMov_Brand__Cdm4 QuicktimeMov_Brand = 1667525940
	QuicktimeMov_Brand__Ceac QuicktimeMov_Brand = 1667588451
	QuicktimeMov_Brand__Cfhd QuicktimeMov_Brand = 1667655780
	QuicktimeMov_Brand__Cfsd QuicktimeMov_Brand = 1667658596
	QuicktimeMov_Brand__Chd1 QuicktimeMov_Brand = 1667785777
	QuicktimeMov_Brand__Chd2 QuicktimeMov_Brand = 1667785778
	QuicktimeMov_Brand__Chdf QuicktimeMov_Brand = 1667785830
	QuicktimeMov_Brand__Chev QuicktimeMov_Brand = 1667786102
	QuicktimeMov_Brand__Chh1 QuicktimeMov_Brand = 1667786801
	QuicktimeMov_Brand__Chhd QuicktimeMov_Brand = 1667786852
	QuicktimeMov_Brand__Cint QuicktimeMov_Brand = 1667853940
	QuicktimeMov_Brand__Clg1 QuicktimeMov_Brand = 1668048689
	QuicktimeMov_Brand__Clg2 QuicktimeMov_Brand = 1668048690
	QuicktimeMov_Brand__Cmf2 QuicktimeMov_Brand = 1668113970
	QuicktimeMov_Brand__Cmfc QuicktimeMov_Brand = 1668114019
	QuicktimeMov_Brand__Cmff QuicktimeMov_Brand = 1668114022
	QuicktimeMov_Brand__Cmfl QuicktimeMov_Brand = 1668114028
	QuicktimeMov_Brand__Cmfs QuicktimeMov_Brand = 1668114035
	QuicktimeMov_Brand__Cmhm QuicktimeMov_Brand = 1668114541
	QuicktimeMov_Brand__Cmhs QuicktimeMov_Brand = 1668114547
	QuicktimeMov_Brand__Comp QuicktimeMov_Brand = 1668246896
	QuicktimeMov_Brand__Csh1 QuicktimeMov_Brand = 1668507697
	QuicktimeMov_Brand__Cud1 QuicktimeMov_Brand = 1668637745
	QuicktimeMov_Brand__Cud2 QuicktimeMov_Brand = 1668637746
	QuicktimeMov_Brand__Cud8 QuicktimeMov_Brand = 1668637752
	QuicktimeMov_Brand__Cud9 QuicktimeMov_Brand = 1668637753
	QuicktimeMov_Brand__Cuvd QuicktimeMov_Brand = 1668642404
	QuicktimeMov_Brand__Cvid QuicktimeMov_Brand = 1668704612
	QuicktimeMov_Brand__Cwvt QuicktimeMov_Brand = 1668773492
	QuicktimeMov_Brand__Da0a QuicktimeMov_Brand = 1684090977
	QuicktimeMov_Brand__Da0b QuicktimeMov_Brand = 1684090978
	QuicktimeMov_Brand__Da1a QuicktimeMov_Brand = 1684091233
	QuicktimeMov_Brand__Da1b QuicktimeMov_Brand = 1684091234
	QuicktimeMov_Brand__Da2a QuicktimeMov_Brand = 1684091489
	QuicktimeMov_Brand__Da2b QuicktimeMov_Brand = 1684091490
	QuicktimeMov_Brand__Da3a QuicktimeMov_Brand = 1684091745
	QuicktimeMov_Brand__Da3b QuicktimeMov_Brand = 1684091746
	QuicktimeMov_Brand__Dash QuicktimeMov_Brand = 1684108136
	QuicktimeMov_Brand__Dby1 QuicktimeMov_Brand = 1684175153
	QuicktimeMov_Brand__Dmb1 QuicktimeMov_Brand = 1684890161
	QuicktimeMov_Brand__Dsms QuicktimeMov_Brand = 1685286259
	QuicktimeMov_Brand__Dts1 QuicktimeMov_Brand = 1685353265
	QuicktimeMov_Brand__Dts2 QuicktimeMov_Brand = 1685353266
	QuicktimeMov_Brand__Dts3 QuicktimeMov_Brand = 1685353267
	QuicktimeMov_Brand__Dv1a QuicktimeMov_Brand = 1685467489
	QuicktimeMov_Brand__Dv1b QuicktimeMov_Brand = 1685467490
	QuicktimeMov_Brand__Dv2a QuicktimeMov_Brand = 1685467745
	QuicktimeMov_Brand__Dv2b QuicktimeMov_Brand = 1685467746
	QuicktimeMov_Brand__Dv3a QuicktimeMov_Brand = 1685468001
	QuicktimeMov_Brand__Dv3b QuicktimeMov_Brand = 1685468002
	QuicktimeMov_Brand__Dvr1 QuicktimeMov_Brand = 1685484081
	QuicktimeMov_Brand__Dvt1 QuicktimeMov_Brand = 1685484593
	QuicktimeMov_Brand__Dxo QuicktimeMov_Brand = 1685614368
	QuicktimeMov_Brand__Emsg QuicktimeMov_Brand = 1701671783
	QuicktimeMov_Brand__Heic QuicktimeMov_Brand = 1751476579
	QuicktimeMov_Brand__Heim QuicktimeMov_Brand = 1751476589
	QuicktimeMov_Brand__Heis QuicktimeMov_Brand = 1751476595
	QuicktimeMov_Brand__Heix QuicktimeMov_Brand = 1751476600
	QuicktimeMov_Brand__Heoi QuicktimeMov_Brand = 1751478121
	QuicktimeMov_Brand__Hevc QuicktimeMov_Brand = 1751479907
	QuicktimeMov_Brand__Hevd QuicktimeMov_Brand = 1751479908
	QuicktimeMov_Brand__Hevi QuicktimeMov_Brand = 1751479913
	QuicktimeMov_Brand__Hevm QuicktimeMov_Brand = 1751479917
	QuicktimeMov_Brand__Hevs QuicktimeMov_Brand = 1751479923
	QuicktimeMov_Brand__Hevx QuicktimeMov_Brand = 1751479928
	QuicktimeMov_Brand__Hvce QuicktimeMov_Brand = 1752589157
	QuicktimeMov_Brand__Hvci QuicktimeMov_Brand = 1752589161
	QuicktimeMov_Brand__Hvcx QuicktimeMov_Brand = 1752589176
	QuicktimeMov_Brand__Hvti QuicktimeMov_Brand = 1752593513
	QuicktimeMov_Brand__Ifaa QuicktimeMov_Brand = 1768317281
	QuicktimeMov_Brand__Ifhd QuicktimeMov_Brand = 1768319076
	QuicktimeMov_Brand__Ifhh QuicktimeMov_Brand = 1768319080
	QuicktimeMov_Brand__Ifhr QuicktimeMov_Brand = 1768319090
	QuicktimeMov_Brand__Ifhs QuicktimeMov_Brand = 1768319091
	QuicktimeMov_Brand__Ifhu QuicktimeMov_Brand = 1768319093
	QuicktimeMov_Brand__Ifhx QuicktimeMov_Brand = 1768319096
	QuicktimeMov_Brand__Ifrm QuicktimeMov_Brand = 1768321645
	QuicktimeMov_Brand__Ifsd QuicktimeMov_Brand = 1768321892
	QuicktimeMov_Brand__Im1i QuicktimeMov_Brand = 1768763753
	QuicktimeMov_Brand__Im1t QuicktimeMov_Brand = 1768763764
	QuicktimeMov_Brand__Im2i QuicktimeMov_Brand = 1768764009
	QuicktimeMov_Brand__Im2t QuicktimeMov_Brand = 1768764020
	QuicktimeMov_Brand__Isc2 QuicktimeMov_Brand = 1769169714
	QuicktimeMov_Brand__Iso2 QuicktimeMov_Brand = 1769172786
	QuicktimeMov_Brand__Iso3 QuicktimeMov_Brand = 1769172787
	QuicktimeMov_Brand__Iso4 QuicktimeMov_Brand = 1769172788
	QuicktimeMov_Brand__Iso5 QuicktimeMov_Brand = 1769172789
	QuicktimeMov_Brand__Iso6 QuicktimeMov_Brand = 1769172790
	QuicktimeMov_Brand__Iso7 QuicktimeMov_Brand = 1769172791
	QuicktimeMov_Brand__Iso8 QuicktimeMov_Brand = 1769172792
	QuicktimeMov_Brand__Iso9 QuicktimeMov_Brand = 1769172793
	QuicktimeMov_Brand__Isoa QuicktimeMov_Brand = 1769172833
	QuicktimeMov_Brand__Isob QuicktimeMov_Brand = 1769172834
	QuicktimeMov_Brand__Isoc QuicktimeMov_Brand = 1769172835
	QuicktimeMov_Brand__Isom QuicktimeMov_Brand = 1769172845
	QuicktimeMov_Brand__J2is QuicktimeMov_Brand = 1781688691
	QuicktimeMov_Brand__J2ki QuicktimeMov_Brand = 1781689193
	QuicktimeMov_Brand__J2ks QuicktimeMov_Brand = 1781689203
	QuicktimeMov_Brand__Jp2 QuicktimeMov_Brand = 1785737760
	QuicktimeMov_Brand__Jpeg QuicktimeMov_Brand = 1785750887
	QuicktimeMov_Brand__Jpgs QuicktimeMov_Brand = 1785751411
	QuicktimeMov_Brand__Jpm QuicktimeMov_Brand = 1785752864
	QuicktimeMov_Brand__Jpoi QuicktimeMov_Brand = 1785753449
	QuicktimeMov_Brand__Jpsi QuicktimeMov_Brand = 1785754473
	QuicktimeMov_Brand__Jpx QuicktimeMov_Brand = 1785755680
	QuicktimeMov_Brand__Jpxb QuicktimeMov_Brand = 1785755746
	QuicktimeMov_Brand__Jxl QuicktimeMov_Brand = 1786276896
	QuicktimeMov_Brand__Jxs QuicktimeMov_Brand = 1786278688
	QuicktimeMov_Brand__Jxsc QuicktimeMov_Brand = 1786278755
	QuicktimeMov_Brand__Jxsi QuicktimeMov_Brand = 1786278761
	QuicktimeMov_Brand__Jxss QuicktimeMov_Brand = 1786278771
	QuicktimeMov_Brand__Lhte QuicktimeMov_Brand = 1818784869
	QuicktimeMov_Brand__Lhti QuicktimeMov_Brand = 1818784873
	QuicktimeMov_Brand__Lmsg QuicktimeMov_Brand = 1819112295
	QuicktimeMov_Brand__Miaf QuicktimeMov_Brand = 1835622758
	QuicktimeMov_Brand__Mif1 QuicktimeMov_Brand = 1835623985
	QuicktimeMov_Brand__Mif2 QuicktimeMov_Brand = 1835623986
	QuicktimeMov_Brand__Mj2s QuicktimeMov_Brand = 1835676275
	QuicktimeMov_Brand__Mjp2 QuicktimeMov_Brand = 1835692082
	QuicktimeMov_Brand__Mp21 QuicktimeMov_Brand = 1836069425
	QuicktimeMov_Brand__Mp41 QuicktimeMov_Brand = 1836069937
	QuicktimeMov_Brand__Mp42 QuicktimeMov_Brand = 1836069938
	QuicktimeMov_Brand__Mp71 QuicktimeMov_Brand = 1836070705
	QuicktimeMov_Brand__Mpuf QuicktimeMov_Brand = 1836086630
	QuicktimeMov_Brand__Msdh QuicktimeMov_Brand = 1836278888
	QuicktimeMov_Brand__Msf1 QuicktimeMov_Brand = 1836279345
	QuicktimeMov_Brand__Msix QuicktimeMov_Brand = 1836280184
	QuicktimeMov_Brand__Niko QuicktimeMov_Brand = 1852402543
	QuicktimeMov_Brand__Nlsl QuicktimeMov_Brand = 1852601196
	QuicktimeMov_Brand__Nras QuicktimeMov_Brand = 1852989811
	QuicktimeMov_Brand__Oa2d QuicktimeMov_Brand = 1868640868
	QuicktimeMov_Brand__Oabl QuicktimeMov_Brand = 1868653164
	QuicktimeMov_Brand__Odcf QuicktimeMov_Brand = 1868850022
	QuicktimeMov_Brand__Ompp QuicktimeMov_Brand = 1869443184
	QuicktimeMov_Brand__Opf2 QuicktimeMov_Brand = 1869637170
	QuicktimeMov_Brand__Opx2 QuicktimeMov_Brand = 1869641778
	QuicktimeMov_Brand__Ovdp QuicktimeMov_Brand = 1870029936
	QuicktimeMov_Brand__Ovly QuicktimeMov_Brand = 1870031993
	QuicktimeMov_Brand__Paff QuicktimeMov_Brand = 1885431398
	QuicktimeMov_Brand__Pana QuicktimeMov_Brand = 1885433441
	QuicktimeMov_Brand__Piff QuicktimeMov_Brand = 1885955686
	QuicktimeMov_Brand__Pmff QuicktimeMov_Brand = 1886217830
	QuicktimeMov_Brand__Pnvi QuicktimeMov_Brand = 1886287465
	QuicktimeMov_Brand__Pred QuicktimeMov_Brand = 1886545252
	QuicktimeMov_Brand__Qt QuicktimeMov_Brand = 1903435808
	QuicktimeMov_Brand__Relo QuicktimeMov_Brand = 1919249519
	QuicktimeMov_Brand__Risx QuicktimeMov_Brand = 1919513464
	QuicktimeMov_Brand__Sdv QuicktimeMov_Brand = 1935963680
	QuicktimeMov_Brand__Senv QuicktimeMov_Brand = 1936027254
	QuicktimeMov_Brand__Sims QuicktimeMov_Brand = 1936289139
	QuicktimeMov_Brand__Sisx QuicktimeMov_Brand = 1936290680
	QuicktimeMov_Brand__Siti QuicktimeMov_Brand = 1936290921
	QuicktimeMov_Brand__Slh1 QuicktimeMov_Brand = 1936484401
	QuicktimeMov_Brand__Slh2 QuicktimeMov_Brand = 1936484402
	QuicktimeMov_Brand__Slh3 QuicktimeMov_Brand = 1936484403
	QuicktimeMov_Brand__Ssss QuicktimeMov_Brand = 1936946035
	QuicktimeMov_Brand__Ttml QuicktimeMov_Brand = 1953787244
	QuicktimeMov_Brand__Ttwv QuicktimeMov_Brand = 1953789814
	QuicktimeMov_Brand__Uhvi QuicktimeMov_Brand = 1969780329
	QuicktimeMov_Brand__Unif QuicktimeMov_Brand = 1970170214
	QuicktimeMov_Brand__Uvvu QuicktimeMov_Brand = 1970697845
	QuicktimeMov_Brand__Vwpt QuicktimeMov_Brand = 1987539060
	QuicktimeMov_Brand__Yt4 QuicktimeMov_Brand = 2037658656
)
type QuicktimeMov struct {
	Atoms *QuicktimeMov_AtomList
	_io *kaitai.Stream
	_root *QuicktimeMov
	_parent interface{}
}
func NewQuicktimeMov() *QuicktimeMov {
	return &QuicktimeMov{
	}
}

func (this *QuicktimeMov) Read(io *kaitai.Stream, parent interface{}, root *QuicktimeMov) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp1 := NewQuicktimeMov_AtomList()
	err = tmp1.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Atoms = tmp1
	return err
}

/**
 * @see <a href="https://developer.apple.com/library/content/documentation/QuickTime/QTFF/QTFFChap2/qtff2.html#//apple_ref/doc/uid/TP40000939-CH204-BBCGFGJG">Source</a>
 */
type QuicktimeMov_MvhdBody struct {
	Version uint8
	Flags []byte
	CreationTime uint32
	ModificationTime uint32
	TimeScale uint32
	Duration uint32
	PreferredRate *QuicktimeMov_Fixed32
	PreferredVolume *QuicktimeMov_Fixed16
	Reserved1 []byte
	Matrix []byte
	PreviewTime uint32
	PreviewDuration uint32
	PosterTime uint32
	SelectionTime uint32
	SelectionDuration uint32
	CurrentTime uint32
	NextTrackId uint32
	_io *kaitai.Stream
	_root *QuicktimeMov
	_parent *QuicktimeMov_Atom
}
func NewQuicktimeMov_MvhdBody() *QuicktimeMov_MvhdBody {
	return &QuicktimeMov_MvhdBody{
	}
}

func (this *QuicktimeMov_MvhdBody) Read(io *kaitai.Stream, parent *QuicktimeMov_Atom, root *QuicktimeMov) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp2, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Version = tmp2
	tmp3, err := this._io.ReadBytes(int(3))
	if err != nil {
		return err
	}
	tmp3 = tmp3
	this.Flags = tmp3
	tmp4, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.CreationTime = uint32(tmp4)
	tmp5, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.ModificationTime = uint32(tmp5)
	tmp6, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.TimeScale = uint32(tmp6)
	tmp7, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.Duration = uint32(tmp7)
	tmp8 := NewQuicktimeMov_Fixed32()
	err = tmp8.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.PreferredRate = tmp8
	tmp9 := NewQuicktimeMov_Fixed16()
	err = tmp9.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.PreferredVolume = tmp9
	tmp10, err := this._io.ReadBytes(int(10))
	if err != nil {
		return err
	}
	tmp10 = tmp10
	this.Reserved1 = tmp10
	tmp11, err := this._io.ReadBytes(int(36))
	if err != nil {
		return err
	}
	tmp11 = tmp11
	this.Matrix = tmp11
	tmp12, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.PreviewTime = uint32(tmp12)
	tmp13, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.PreviewDuration = uint32(tmp13)
	tmp14, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.PosterTime = uint32(tmp14)
	tmp15, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.SelectionTime = uint32(tmp15)
	tmp16, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.SelectionDuration = uint32(tmp16)
	tmp17, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.CurrentTime = uint32(tmp17)
	tmp18, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.NextTrackId = uint32(tmp18)
	return err
}

/**
 * Version of this movie header atom
 */

/**
 * A time value that indicates the time scale for this
 * movie - the number of time units that pass per second
 * in its time coordinate system. A time coordinate system that
 * measures time in sixtieths of a second, for example, has a
 * time scale of 60.
 */

/**
 * A time value that indicates the duration of the movie in
 * time scale units. Note that this property is derived from
 * the movie's tracks. The value of this field corresponds to
 * the duration of the longest track in the movie.
 */

/**
 * The rate at which to play this movie. A value of 1.0 indicates normal rate.
 */

/**
 * How loud to play this movie's sound. A value of 1.0 indicates full volume.
 */

/**
 * A matrix shows how to map points from one coordinate space into another.
 */

/**
 * The time value in the movie at which the preview begins.
 */

/**
 * The duration of the movie preview in movie time scale units.
 */

/**
 * The time value of the time of the movie poster.
 */

/**
 * The time value for the start time of the current selection.
 */

/**
 * The duration of the current selection in movie time scale units.
 */

/**
 * The time value for current time position within the movie.
 */

/**
 * Indicates a value to use for the track ID number of the next
 * track added to this movie. Note that 0 is not a valid track
 * ID value.
 */

/**
 * @see <a href="https://developer.apple.com/library/content/documentation/QuickTime/QTFF/QTFFChap1/qtff1.html#//apple_ref/doc/uid/TP40000939-CH203-CJBCBIFF">Source</a>
 */
type QuicktimeMov_FtypBody struct {
	MajorBrand QuicktimeMov_Brand
	MinorVersion []byte
	CompatibleBrands []QuicktimeMov_Brand
	_io *kaitai.Stream
	_root *QuicktimeMov
	_parent *QuicktimeMov_Atom
}
func NewQuicktimeMov_FtypBody() *QuicktimeMov_FtypBody {
	return &QuicktimeMov_FtypBody{
	}
}

func (this *QuicktimeMov_FtypBody) Read(io *kaitai.Stream, parent *QuicktimeMov_Atom, root *QuicktimeMov) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp19, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.MajorBrand = QuicktimeMov_Brand(tmp19)
	tmp20, err := this._io.ReadBytes(int(4))
	if err != nil {
		return err
	}
	tmp20 = tmp20
	this.MinorVersion = tmp20
	for i := 1;; i++ {
		tmp21, err := this._io.EOF()
		if err != nil {
			return err
		}
		if tmp21 {
			break
		}
		tmp22, err := this._io.ReadU4be()
		if err != nil {
			return err
		}
		this.CompatibleBrands = append(this.CompatibleBrands, QuicktimeMov_Brand(tmp22))
	}
	return err
}

/**
 * Fixed-point 32-bit number.
 */
type QuicktimeMov_Fixed32 struct {
	IntPart int16
	FracPart uint16
	_io *kaitai.Stream
	_root *QuicktimeMov
	_parent interface{}
}
func NewQuicktimeMov_Fixed32() *QuicktimeMov_Fixed32 {
	return &QuicktimeMov_Fixed32{
	}
}

func (this *QuicktimeMov_Fixed32) Read(io *kaitai.Stream, parent interface{}, root *QuicktimeMov) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp23, err := this._io.ReadS2be()
	if err != nil {
		return err
	}
	this.IntPart = int16(tmp23)
	tmp24, err := this._io.ReadU2be()
	if err != nil {
		return err
	}
	this.FracPart = uint16(tmp24)
	return err
}

/**
 * Fixed-point 16-bit number.
 */
type QuicktimeMov_Fixed16 struct {
	IntPart int8
	FracPart uint8
	_io *kaitai.Stream
	_root *QuicktimeMov
	_parent *QuicktimeMov_MvhdBody
}
func NewQuicktimeMov_Fixed16() *QuicktimeMov_Fixed16 {
	return &QuicktimeMov_Fixed16{
	}
}

func (this *QuicktimeMov_Fixed16) Read(io *kaitai.Stream, parent *QuicktimeMov_MvhdBody, root *QuicktimeMov) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp25, err := this._io.ReadS1()
	if err != nil {
		return err
	}
	this.IntPart = tmp25
	tmp26, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.FracPart = tmp26
	return err
}
type QuicktimeMov_Atom struct {
	Len32 uint32
	AtomType QuicktimeMov_AtomType
	Len64 uint64
	Body interface{}
	_io *kaitai.Stream
	_root *QuicktimeMov
	_parent *QuicktimeMov_AtomList
	_raw_Body []byte
	_f_len bool
	len int
}
func NewQuicktimeMov_Atom() *QuicktimeMov_Atom {
	return &QuicktimeMov_Atom{
	}
}

func (this *QuicktimeMov_Atom) Read(io *kaitai.Stream, parent *QuicktimeMov_AtomList, root *QuicktimeMov) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp27, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.Len32 = uint32(tmp27)
	tmp28, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.AtomType = QuicktimeMov_AtomType(tmp28)
	if (this.Len32 == 1) {
		tmp29, err := this._io.ReadU8be()
		if err != nil {
			return err
		}
		this.Len64 = uint64(tmp29)
	}
	switch (this.AtomType) {
	case QuicktimeMov_AtomType__Moof:
		tmp30, err := this.Len()
		if err != nil {
			return err
		}
		tmp31, err := this._io.ReadBytes(int(tmp30))
		if err != nil {
			return err
		}
		tmp31 = tmp31
		this._raw_Body = tmp31
		_io__raw_Body := kaitai.NewStream(bytes.NewReader(this._raw_Body))
		tmp32 := NewQuicktimeMov_AtomList()
		err = tmp32.Read(_io__raw_Body, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp32
	case QuicktimeMov_AtomType__Tkhd:
		tmp33, err := this.Len()
		if err != nil {
			return err
		}
		tmp34, err := this._io.ReadBytes(int(tmp33))
		if err != nil {
			return err
		}
		tmp34 = tmp34
		this._raw_Body = tmp34
		_io__raw_Body := kaitai.NewStream(bytes.NewReader(this._raw_Body))
		tmp35 := NewQuicktimeMov_TkhdBody()
		err = tmp35.Read(_io__raw_Body, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp35
	case QuicktimeMov_AtomType__Stbl:
		tmp36, err := this.Len()
		if err != nil {
			return err
		}
		tmp37, err := this._io.ReadBytes(int(tmp36))
		if err != nil {
			return err
		}
		tmp37 = tmp37
		this._raw_Body = tmp37
		_io__raw_Body := kaitai.NewStream(bytes.NewReader(this._raw_Body))
		tmp38 := NewQuicktimeMov_AtomList()
		err = tmp38.Read(_io__raw_Body, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp38
	case QuicktimeMov_AtomType__Traf:
		tmp39, err := this.Len()
		if err != nil {
			return err
		}
		tmp40, err := this._io.ReadBytes(int(tmp39))
		if err != nil {
			return err
		}
		tmp40 = tmp40
		this._raw_Body = tmp40
		_io__raw_Body := kaitai.NewStream(bytes.NewReader(this._raw_Body))
		tmp41 := NewQuicktimeMov_AtomList()
		err = tmp41.Read(_io__raw_Body, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp41
	case QuicktimeMov_AtomType__Minf:
		tmp42, err := this.Len()
		if err != nil {
			return err
		}
		tmp43, err := this._io.ReadBytes(int(tmp42))
		if err != nil {
			return err
		}
		tmp43 = tmp43
		this._raw_Body = tmp43
		_io__raw_Body := kaitai.NewStream(bytes.NewReader(this._raw_Body))
		tmp44 := NewQuicktimeMov_AtomList()
		err = tmp44.Read(_io__raw_Body, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp44
	case QuicktimeMov_AtomType__Trak:
		tmp45, err := this.Len()
		if err != nil {
			return err
		}
		tmp46, err := this._io.ReadBytes(int(tmp45))
		if err != nil {
			return err
		}
		tmp46 = tmp46
		this._raw_Body = tmp46
		_io__raw_Body := kaitai.NewStream(bytes.NewReader(this._raw_Body))
		tmp47 := NewQuicktimeMov_AtomList()
		err = tmp47.Read(_io__raw_Body, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp47
	case QuicktimeMov_AtomType__Moov:
		tmp48, err := this.Len()
		if err != nil {
			return err
		}
		tmp49, err := this._io.ReadBytes(int(tmp48))
		if err != nil {
			return err
		}
		tmp49 = tmp49
		this._raw_Body = tmp49
		_io__raw_Body := kaitai.NewStream(bytes.NewReader(this._raw_Body))
		tmp50 := NewQuicktimeMov_AtomList()
		err = tmp50.Read(_io__raw_Body, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp50
	case QuicktimeMov_AtomType__Mdia:
		tmp51, err := this.Len()
		if err != nil {
			return err
		}
		tmp52, err := this._io.ReadBytes(int(tmp51))
		if err != nil {
			return err
		}
		tmp52 = tmp52
		this._raw_Body = tmp52
		_io__raw_Body := kaitai.NewStream(bytes.NewReader(this._raw_Body))
		tmp53 := NewQuicktimeMov_AtomList()
		err = tmp53.Read(_io__raw_Body, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp53
	case QuicktimeMov_AtomType__Dinf:
		tmp54, err := this.Len()
		if err != nil {
			return err
		}
		tmp55, err := this._io.ReadBytes(int(tmp54))
		if err != nil {
			return err
		}
		tmp55 = tmp55
		this._raw_Body = tmp55
		_io__raw_Body := kaitai.NewStream(bytes.NewReader(this._raw_Body))
		tmp56 := NewQuicktimeMov_AtomList()
		err = tmp56.Read(_io__raw_Body, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp56
	case QuicktimeMov_AtomType__Mvhd:
		tmp57, err := this.Len()
		if err != nil {
			return err
		}
		tmp58, err := this._io.ReadBytes(int(tmp57))
		if err != nil {
			return err
		}
		tmp58 = tmp58
		this._raw_Body = tmp58
		_io__raw_Body := kaitai.NewStream(bytes.NewReader(this._raw_Body))
		tmp59 := NewQuicktimeMov_MvhdBody()
		err = tmp59.Read(_io__raw_Body, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp59
	case QuicktimeMov_AtomType__Ftyp:
		tmp60, err := this.Len()
		if err != nil {
			return err
		}
		tmp61, err := this._io.ReadBytes(int(tmp60))
		if err != nil {
			return err
		}
		tmp61 = tmp61
		this._raw_Body = tmp61
		_io__raw_Body := kaitai.NewStream(bytes.NewReader(this._raw_Body))
		tmp62 := NewQuicktimeMov_FtypBody()
		err = tmp62.Read(_io__raw_Body, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp62
	default:
		tmp63, err := this.Len()
		if err != nil {
			return err
		}
		tmp64, err := this._io.ReadBytes(int(tmp63))
		if err != nil {
			return err
		}
		tmp64 = tmp64
		this._raw_Body = tmp64
	}
	return err
}
func (this *QuicktimeMov_Atom) Len() (v int, err error) {
	if (this._f_len) {
		return this.len, nil
	}
	var tmp65 int;
	if (this.Len32 == 0) {
		tmp66, err := this._io.Size()
		if err != nil {
			return 0, err
		}
		tmp65 = (tmp66 - 8)
	} else {
		var tmp67 int;
		if (this.Len32 == 1) {
			tmp67 = (this.Len64 - 16)
		} else {
			tmp67 = (this.Len32 - 8)
		}
		tmp65 = tmp67
	}
	this.len = int(tmp65)
	this._f_len = true
	return this.len, nil
}

/**
 * @see <a href="https://developer.apple.com/library/content/documentation/QuickTime/QTFF/QTFFChap2/qtff2.html#//apple_ref/doc/uid/TP40000939-CH204-25550">Source</a>
 */
type QuicktimeMov_TkhdBody struct {
	Version uint8
	Flags []byte
	CreationTime uint32
	ModificationTime uint32
	TrackId uint32
	Reserved1 []byte
	Duration uint32
	Reserved2 []byte
	Layer uint16
	AlternativeGroup uint16
	Volume uint16
	Reserved3 uint16
	Matrix []byte
	Width *QuicktimeMov_Fixed32
	Height *QuicktimeMov_Fixed32
	_io *kaitai.Stream
	_root *QuicktimeMov
	_parent *QuicktimeMov_Atom
}
func NewQuicktimeMov_TkhdBody() *QuicktimeMov_TkhdBody {
	return &QuicktimeMov_TkhdBody{
	}
}

func (this *QuicktimeMov_TkhdBody) Read(io *kaitai.Stream, parent *QuicktimeMov_Atom, root *QuicktimeMov) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp68, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Version = tmp68
	tmp69, err := this._io.ReadBytes(int(3))
	if err != nil {
		return err
	}
	tmp69 = tmp69
	this.Flags = tmp69
	tmp70, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.CreationTime = uint32(tmp70)
	tmp71, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.ModificationTime = uint32(tmp71)
	tmp72, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.TrackId = uint32(tmp72)
	tmp73, err := this._io.ReadBytes(int(4))
	if err != nil {
		return err
	}
	tmp73 = tmp73
	this.Reserved1 = tmp73
	tmp74, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.Duration = uint32(tmp74)
	tmp75, err := this._io.ReadBytes(int(8))
	if err != nil {
		return err
	}
	tmp75 = tmp75
	this.Reserved2 = tmp75
	tmp76, err := this._io.ReadU2be()
	if err != nil {
		return err
	}
	this.Layer = uint16(tmp76)
	tmp77, err := this._io.ReadU2be()
	if err != nil {
		return err
	}
	this.AlternativeGroup = uint16(tmp77)
	tmp78, err := this._io.ReadU2be()
	if err != nil {
		return err
	}
	this.Volume = uint16(tmp78)
	tmp79, err := this._io.ReadU2be()
	if err != nil {
		return err
	}
	this.Reserved3 = uint16(tmp79)
	tmp80, err := this._io.ReadBytes(int(36))
	if err != nil {
		return err
	}
	tmp80 = tmp80
	this.Matrix = tmp80
	tmp81 := NewQuicktimeMov_Fixed32()
	err = tmp81.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Width = tmp81
	tmp82 := NewQuicktimeMov_Fixed32()
	err = tmp82.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Height = tmp82
	return err
}

/**
 * Integer that uniquely identifies the track. The value 0 cannot be used.
 */
type QuicktimeMov_AtomList struct {
	Items []*QuicktimeMov_Atom
	_io *kaitai.Stream
	_root *QuicktimeMov
	_parent interface{}
}
func NewQuicktimeMov_AtomList() *QuicktimeMov_AtomList {
	return &QuicktimeMov_AtomList{
	}
}

func (this *QuicktimeMov_AtomList) Read(io *kaitai.Stream, parent interface{}, root *QuicktimeMov) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	for i := 1;; i++ {
		tmp83, err := this._io.EOF()
		if err != nil {
			return err
		}
		if tmp83 {
			break
		}
		tmp84 := NewQuicktimeMov_Atom()
		err = tmp84.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Items = append(this.Items, tmp84)
	}
	return err
}
