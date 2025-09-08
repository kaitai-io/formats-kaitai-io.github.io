// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Objects;
import io.kaitai.struct.ConsistencyError;
import java.util.Map;
import java.util.HashMap;
import java.nio.charset.StandardCharsets;
import java.util.Arrays;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.List;

public class Icc4 extends KaitaiStruct.ReadWrite {
    public static Icc4 fromFile(String fileName) throws IOException {
        return new Icc4(new ByteBufferKaitaiStream(fileName));
    }
    public Icc4() {
        this(null, null, null);
    }

    public Icc4(KaitaiStream _io) {
        this(_io, null, null);
    }

    public Icc4(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
        this(_io, _parent, null);
    }

    public Icc4(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, Icc4 _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
    }
    public void _read() {
        this.header = new ProfileHeader(this._io, this, _root);
        this.header._read();
        this.tagTable = new TagTable(this._io, this, _root);
        this.tagTable._read();
        _dirty = false;
    }

    public void _fetchInstances() {
        this.header._fetchInstances();
        this.tagTable._fetchInstances();
    }

    public void _write_Seq() {
        _assertNotDirty();
        this.header._write_Seq(this._io);
        this.tagTable._write_Seq(this._io);
    }

    public void _check() {
        if (!Objects.equals(this.header._root(), _root()))
            throw new ConsistencyError("header", _root(), this.header._root());
        if (!Objects.equals(this.header._parent(), this))
            throw new ConsistencyError("header", this, this.header._parent());
        if (!Objects.equals(this.tagTable._root(), _root()))
            throw new ConsistencyError("tag_table", _root(), this.tagTable._root());
        if (!Objects.equals(this.tagTable._parent(), this))
            throw new ConsistencyError("tag_table", this, this.tagTable._parent());
        _dirty = false;
    }
    public static class DateTimeNumber extends KaitaiStruct.ReadWrite {
        public static DateTimeNumber fromFile(String fileName) throws IOException {
            return new DateTimeNumber(new ByteBufferKaitaiStream(fileName));
        }
        public DateTimeNumber() {
            this(null, null, null);
        }

        public DateTimeNumber(KaitaiStream _io) {
            this(_io, null, null);
        }

        public DateTimeNumber(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
            this(_io, _parent, null);
        }

        public DateTimeNumber(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, Icc4 _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.year = this._io.readU2be();
            this.month = this._io.readU2be();
            this.day = this._io.readU2be();
            this.hour = this._io.readU2be();
            this.minute = this._io.readU2be();
            this.second = this._io.readU2be();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU2be(this.year);
            this._io.writeU2be(this.month);
            this._io.writeU2be(this.day);
            this._io.writeU2be(this.hour);
            this._io.writeU2be(this.minute);
            this._io.writeU2be(this.second);
        }

        public void _check() {
            _dirty = false;
        }
        private int year;
        private int month;
        private int day;
        private int hour;
        private int minute;
        private int second;
        private Icc4 _root;
        private KaitaiStruct.ReadWrite _parent;
        public int year() { return year; }
        public void setYear(int _v) { _dirty = true; year = _v; }
        public int month() { return month; }
        public void setMonth(int _v) { _dirty = true; month = _v; }
        public int day() { return day; }
        public void setDay(int _v) { _dirty = true; day = _v; }
        public int hour() { return hour; }
        public void setHour(int _v) { _dirty = true; hour = _v; }
        public int minute() { return minute; }
        public void setMinute(int _v) { _dirty = true; minute = _v; }
        public int second() { return second; }
        public void setSecond(int _v) { _dirty = true; second = _v; }
        public Icc4 _root() { return _root; }
        public void set_root(Icc4 _v) { _dirty = true; _root = _v; }
        public KaitaiStruct.ReadWrite _parent() { return _parent; }
        public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
    }
    public static class DeviceAttributes extends KaitaiStruct.ReadWrite {
        public static DeviceAttributes fromFile(String fileName) throws IOException {
            return new DeviceAttributes(new ByteBufferKaitaiStream(fileName));
        }

        public enum DeviceAttributesColourOrBlackAndWhiteMedia {
            COLOUR_MEDIA(0),
            BLACK_AND_WHITE_MEDIA(1);

            private final long id;
            DeviceAttributesColourOrBlackAndWhiteMedia(long id) { this.id = id; }
            public long id() { return id; }
            private static final Map<Long, DeviceAttributesColourOrBlackAndWhiteMedia> byId = new HashMap<Long, DeviceAttributesColourOrBlackAndWhiteMedia>(2);
            static {
                for (DeviceAttributesColourOrBlackAndWhiteMedia e : DeviceAttributesColourOrBlackAndWhiteMedia.values())
                    byId.put(e.id(), e);
            }
            public static DeviceAttributesColourOrBlackAndWhiteMedia byId(long id) { return byId.get(id); }
        }

        public enum DeviceAttributesGlossyOrMatte {
            GLOSSY(0),
            MATTE(1);

            private final long id;
            DeviceAttributesGlossyOrMatte(long id) { this.id = id; }
            public long id() { return id; }
            private static final Map<Long, DeviceAttributesGlossyOrMatte> byId = new HashMap<Long, DeviceAttributesGlossyOrMatte>(2);
            static {
                for (DeviceAttributesGlossyOrMatte e : DeviceAttributesGlossyOrMatte.values())
                    byId.put(e.id(), e);
            }
            public static DeviceAttributesGlossyOrMatte byId(long id) { return byId.get(id); }
        }

        public enum DeviceAttributesPositiveOrNegativeMediaPolarity {
            POSITIVE_MEDIA_POLARITY(0),
            NEGATIVE_MEDIA_POLARITY(1);

            private final long id;
            DeviceAttributesPositiveOrNegativeMediaPolarity(long id) { this.id = id; }
            public long id() { return id; }
            private static final Map<Long, DeviceAttributesPositiveOrNegativeMediaPolarity> byId = new HashMap<Long, DeviceAttributesPositiveOrNegativeMediaPolarity>(2);
            static {
                for (DeviceAttributesPositiveOrNegativeMediaPolarity e : DeviceAttributesPositiveOrNegativeMediaPolarity.values())
                    byId.put(e.id(), e);
            }
            public static DeviceAttributesPositiveOrNegativeMediaPolarity byId(long id) { return byId.get(id); }
        }

        public enum DeviceAttributesReflectiveOrTransparency {
            REFLECTIVE(0),
            TRANSPARENCY(1);

            private final long id;
            DeviceAttributesReflectiveOrTransparency(long id) { this.id = id; }
            public long id() { return id; }
            private static final Map<Long, DeviceAttributesReflectiveOrTransparency> byId = new HashMap<Long, DeviceAttributesReflectiveOrTransparency>(2);
            static {
                for (DeviceAttributesReflectiveOrTransparency e : DeviceAttributesReflectiveOrTransparency.values())
                    byId.put(e.id(), e);
            }
            public static DeviceAttributesReflectiveOrTransparency byId(long id) { return byId.get(id); }
        }
        public DeviceAttributes() {
            this(null, null, null);
        }

        public DeviceAttributes(KaitaiStream _io) {
            this(_io, null, null);
        }

        public DeviceAttributes(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
            this(_io, _parent, null);
        }

        public DeviceAttributes(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, Icc4 _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.reflectiveOrTransparency = DeviceAttributesReflectiveOrTransparency.byId(this._io.readBitsIntBe(1));
            this.glossyOrMatte = DeviceAttributesGlossyOrMatte.byId(this._io.readBitsIntBe(1));
            this.positiveOrNegativeMediaPolarity = DeviceAttributesPositiveOrNegativeMediaPolarity.byId(this._io.readBitsIntBe(1));
            this.colourOrBlackAndWhiteMedia = DeviceAttributesColourOrBlackAndWhiteMedia.byId(this._io.readBitsIntBe(1));
            this.reserved = this._io.readBitsIntBe(28);
            this.vendorSpecific = this._io.readBitsIntBe(32);
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBitsIntBe(1, ((Number) (this.reflectiveOrTransparency.id())).longValue());
            this._io.writeBitsIntBe(1, ((Number) (this.glossyOrMatte.id())).longValue());
            this._io.writeBitsIntBe(1, ((Number) (this.positiveOrNegativeMediaPolarity.id())).longValue());
            this._io.writeBitsIntBe(1, ((Number) (this.colourOrBlackAndWhiteMedia.id())).longValue());
            this._io.writeBitsIntBe(28, this.reserved);
            this._io.writeBitsIntBe(32, this.vendorSpecific);
        }

        public void _check() {
            _dirty = false;
        }
        private DeviceAttributesReflectiveOrTransparency reflectiveOrTransparency;
        private DeviceAttributesGlossyOrMatte glossyOrMatte;
        private DeviceAttributesPositiveOrNegativeMediaPolarity positiveOrNegativeMediaPolarity;
        private DeviceAttributesColourOrBlackAndWhiteMedia colourOrBlackAndWhiteMedia;
        private long reserved;
        private long vendorSpecific;
        private Icc4 _root;
        private KaitaiStruct.ReadWrite _parent;
        public DeviceAttributesReflectiveOrTransparency reflectiveOrTransparency() { return reflectiveOrTransparency; }
        public void setReflectiveOrTransparency(DeviceAttributesReflectiveOrTransparency _v) { _dirty = true; reflectiveOrTransparency = _v; }
        public DeviceAttributesGlossyOrMatte glossyOrMatte() { return glossyOrMatte; }
        public void setGlossyOrMatte(DeviceAttributesGlossyOrMatte _v) { _dirty = true; glossyOrMatte = _v; }
        public DeviceAttributesPositiveOrNegativeMediaPolarity positiveOrNegativeMediaPolarity() { return positiveOrNegativeMediaPolarity; }
        public void setPositiveOrNegativeMediaPolarity(DeviceAttributesPositiveOrNegativeMediaPolarity _v) { _dirty = true; positiveOrNegativeMediaPolarity = _v; }
        public DeviceAttributesColourOrBlackAndWhiteMedia colourOrBlackAndWhiteMedia() { return colourOrBlackAndWhiteMedia; }
        public void setColourOrBlackAndWhiteMedia(DeviceAttributesColourOrBlackAndWhiteMedia _v) { _dirty = true; colourOrBlackAndWhiteMedia = _v; }
        public long reserved() { return reserved; }
        public void setReserved(long _v) { _dirty = true; reserved = _v; }
        public long vendorSpecific() { return vendorSpecific; }
        public void setVendorSpecific(long _v) { _dirty = true; vendorSpecific = _v; }
        public Icc4 _root() { return _root; }
        public void set_root(Icc4 _v) { _dirty = true; _root = _v; }
        public KaitaiStruct.ReadWrite _parent() { return _parent; }
        public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
    }
    public static class DeviceManufacturer extends KaitaiStruct.ReadWrite {
        public static DeviceManufacturer fromFile(String fileName) throws IOException {
            return new DeviceManufacturer(new ByteBufferKaitaiStream(fileName));
        }

        public enum DeviceManufacturers {
            ERDT_SYSTEMS_GMBH_AND_CO_KG(878981744),
            AAMAZING_TECHNOLOGIES_INC(1094798657),
            ACER_PERIPHERALS(1094927698),
            ACOLYTE_COLOR_RESEARCH(1094929492),
            ACTIX_SYTEMS_INC(1094931529),
            ADARA_TECHNOLOGY_INC(1094992210),
            ADOBE_SYSTEMS_INCORPORATED(1094992453),
            ADI_SYSTEMS_INC(1094994208),
            AGFA_GRAPHICS_NV(1095190081),
            ALPS_ELECTRIC_USA_INC(1095519556),
            ALPS_ELECTRIC_USA_INC_2(1095520339),
            ALWAN_COLOR_EXPERTISE(1095522126),
            AMIABLE_TECHNOLOGIES_INC(1095586889),
            AOC_INTERNATIONAL_USA_LTD(1095713568),
            APAGO(1095778631),
            APPLE_COMPUTER_INC(1095782476),
            AST(1095980064),
            ATANDT_COMPUTER_SYSTEMS(1096033876),
            BARBIERI_ELECTRONIC(1111573836),
            BARCO_NV(1112687439),
            BREAKPOINT_PTY_LIMITED(1112689488),
            BROTHER_INDUSTRIES_LTD(1112690516),
            BULL(1112886348),
            BUS_COMPUTER_SYSTEMS(1112888096),
            C_ITOH(1127041364),
            INTEL_CORPORATION(1128353106),
            CANON_INC_CANON_DEVELOPMENT_AMERICAS_INC(1128353359),
            CARROLL_TOUCH(1128354386),
            CASIO_COMPUTER_CO_LTD(1128354633),
            COLORBUS_PL(1128420691),
            CROSSFIELD(1128614944),
            CROSSFIELD_2(1128615032),
            CGS_PUBLISHING_TECHNOLOGIES_INTERNATIONAL_GMBH(1128747808),
            ROCHESTER_ROBOTICS(1128811808),
            COLOUR_IMAGING_GROUP_LONDON(1128875852),
            CITIZEN(1128879177),
            CANDELA_LTD(1129066544),
            COLOR_IQ(1129072977),
            CHROMACO_INC(1129136975),
            CHROMIX(1129146712),
            COLORGRAPHIC_COMMUNICATIONS_CORPORATION(1129270351),
            COMPAQ_COMPUTER_CORPORATION(1129270608),
            COMPEQ_USA_FOCUS_TECHNOLOGY(1129270640),
            CONRAC_DISPLAY_PRODUCTS(1129270866),
            CORDATA_TECHNOLOGIES_INC(1129271876),
            COMPAQ_COMPUTER_CORPORATION_2(1129337120),
            COLORPRO(1129337423),
            CORNERSTONE(1129467424),
            CTX_INTERNATIONAL_INC(1129601056),
            COLORVISION(1129728339),
            FUJITSU_LABORATORIES_LTD(1129792288),
            DARIUS_TECHNOLOGY_LTD(1145131593),
            DATAPRODUCTS(1145132097),
            DRY_CREEK_PHOTO(1145262112),
            DIGITAL_CONTENTS_RESOURCE_CENTER_CHUNG_ANG_UNIVERSITY(1145262659),
            DELL_COMPUTER_CORPORATION(1145392204),
            DAINIPPON_INK_AND_CHEMICALS(1145652000),
            DICONIX(1145652047),
            DIGITAL(1145653065),
            DIGITAL_LIGHT_AND_COLOR(1145841219),
            DOPPELGANGER_LLC(1146113095),
            DAINIPPON_SCREEN(1146298400),
            DOOSOL(1146310476),
            DUPONT(1146441806),
            EPSON(1162892111),
            ESKO_GRAPHICS(1163086671),
            ELECTRONICS_AND_TELECOMMUNICATIONS_RESEARCH_INSTITUTE(1163153993),
            EVEREX_SYSTEMS_INC(1163281746),
            EXACTCODE_GMBH(1163411779),
            EIZO_NANAO_CORPORATION(1164540527),
            FALCO_DATA_PRODUCTS_INC(1178684483),
            FUJI_PHOTO_FILM_COLTD(1179000864),
            FUJIFILM_ELECTRONIC_IMAGING_LTD(1179010377),
            FNORD_SOFTWARE(1179537988),
            FORA_INC(1179603521),
            FOREFRONT_TECHNOLOGY_CORPORATION(1179603525),
            FUJITSU(1179658794),
            WAYTECH_DEVELOPMENT_INC(1179664672),
            FUJITSU_2(1179994697),
            FUJI_XEROX_CO_LTD(1180180512),
            GCC_TECHNOLOGIES_INC(1195590432),
            GLOBAL_GRAPHICS_SOFTWARE_LIMITED(1195856716),
            GRETAGMACBETH(1196245536),
            GMG_GMBH_AND_CO_KG(1196246816),
            GOLDSTAR_TECHNOLOGY_INC(1196379204),
            GIANTPRINT_PTY_LTD(1196446292),
            GRETAGMACBETH_2(1196707138),
            WAYTECH_DEVELOPMENT_INC_2(1196835616),
            SONY_CORPORATION(1196896843),
            HCI(1212369184),
            HEIDELBERGER_DRUCKMASCHINEN_AG(1212435744),
            HERMES(1212502605),
            HITACHI_AMERICA_LTD(1212765249),
            HEWLETT_PACKARD(1213210656),
            HITACHI_LTD(1213481760),
            HITI_DIGITAL_INC(1214862441),
            IBM_CORPORATION(1229081888),
            SCITEX_CORPORATION_LTD(1229213268),
            HEWLETT_PACKARD_2(1229275936),
            IIYAMA_NORTH_AMERICA_INC(1229543745),
            IKEGAMI_ELECTRONICS_INC(1229669703),
            IMAGE_SYSTEMS_CORPORATION(1229799751),
            INGRAM_MICRO_INC(1229801760),
            INTEL_CORPORATION_2(1229870147),
            INTL(1229870156),
            INTRA_ELECTRONICS_USA_INC(1229870162),
            IOCOMM_INTERNATIONAL_TECHNOLOGY_CORPORATION(1229931343),
            INFOPRINT_SOLUTIONS_COMPANY(1230000928),
            SCITEX_CORPORATION_LTD_3(1230129491),
            ICHIKAWA_SOFT_LABORATORY(1230195744),
            ITNL(1230261836),
            IVM(1230392608),
            IWATSU_ELECTRIC_CO_LTD(1230455124),
            SCITEX_CORPORATION_LTD_2(1231318644),
            INCA_DIGITAL_PRINTERS_LTD(1231971169),
            SCITEX_CORPORATION_LTD_4(1232234867),
            JETSOFT_DEVELOPMENT(1246971476),
            JVC_INFORMATION_PRODUCTS_CO(1247167264),
            SCITEX_CORPORATION_LTD_6(1262572116),
            KFC_COMPUTEK_COMPONENTS_CORPORATION(1262895904),
            KLH_COMPUTERS(1263290400),
            KONICA_MINOLTA_HOLDINGS_INC(1263355972),
            KONICA_CORPORATION(1263420225),
            KODAK(1263486017),
            KYOCERA(1264144195),
            SCITEX_CORPORATION_LTD_7(1264677492),
            LEICA_CAMERA_AG(1279476039),
            LEEDS_COLOUR(1279476548),
            LEFT_DAKOTA(1279541579),
            LEADING_TECHNOLOGY_INC(1279607108),
            LEXMARK_INTERNATIONAL_INC(1279613005),
            LINK_COMPUTER_INC(1279872587),
            LINOTRONIC(1279872591),
            LITE_ON_INC(1279874117),
            MAG_COMPUTRONIC_USA_INC(1296123715),
            MAG_INNOVISION_INC(1296123721),
            MANNESMANN(1296125518),
            MICRON_TECHNOLOGY_INC(1296646990),
            MICROTEK(1296646994),
            MICROVITEC_INC(1296646998),
            MINOLTA(1296649807),
            MITSUBISHI_ELECTRONICS_AMERICA_INC(1296651347),
            MITSUBA_CORPORATION(1296651379),
            MINOLTA_2(1296976980),
            MODGRAPH_INC(1297040455),
            MONITRONIX_INC(1297043017),
            MONACO_SYSTEMS_INC(1297043027),
            MORSE_TECHNOLOGY_INC(1297044051),
            MOTIVE_SYSTEMS(1297044553),
            MICROSOFT_CORPORATION(1297303124),
            MUTOH_INDUSTRIES_LTD(1297437775),
            MITSUBISHI_ELECTRIC_CORPORATION_KYOTO_WORKS(1298756723),
            NANAO_USA_CORPORATION(1312902721),
            NEC_CORPORATION(1313162016),
            NEXPRESS_SOLUTIONS_LLC(1313167440),
            NISSEI_SANGYO_AMERICA_LTD(1313428307),
            NIKON_CORPORATION(1313558350),
            OCE_TECHNOLOGIES_BV(1329808672),
            OCECOLOR(1329808707),
            OKI(1330333984),
            OKIDATA(1330334020),
            OKIDATA_2(1330334032),
            OLIVETTI(1330399574),
            OLYMPUS_OPTICAL_CO_LTD(1330403661),
            ONYX_GRAPHICS(1330534744),
            OPTIQUEST(1330664521),
            PACKARD_BELL(1346454347),
            MATSUSHITA_ELECTRIC_INDUSTRIAL_CO_LTD(1346457153),
            PANTONE_INC(1346457172),
            PACKARD_BELL_2(1346522656),
            PFU_LIMITED(1346786592),
            PHILIPS_CONSUMER_ELECTRONICS_CO(1346914636),
            HOYA_CORPORATION_PENTAX_IMAGING_SYSTEMS_DIVISION(1347310680),
            PHASE_ONE_A_S(1347382885),
            PREMIER_COMPUTER_INNOVATIONS(1347568973),
            PRINCETON_GRAPHIC_SYSTEMS(1347569998),
            PRINCETON_PUBLISHING_LABS(1347570000),
            QLUX(1363957080),
            QMS_INC(1364022048),
            QPCARD_AB(1364214596),
            QUADLASER(1364541764),
            QUME_CORPORATION(1364544837),
            RADIUS_INC(1380009033),
            INTEGRATED_COLOR_SOLUTIONS_INC_2(1380205688),
            ROLAND_DG_CORPORATION(1380206368),
            REDMS_GROUP_INC(1380271181),
            RELISYS(1380273225),
            ROLF_GIERLING_MULTITOOLS(1380404563),
            RICOH_CORPORATION(1380533071),
            EDMUND_RONALD(1380863044),
            ROYAL(1380931905),
            RICOH_PRINTING_SYSTEMSLTD(1380991776),
            ROYAL_INFORMATION_ELECTRONICS_CO_LTD(1381256224),
            SAMPO_CORPORATION_OF_AMERICA(1396788560),
            SAMSUNG_INC(1396788563),
            JAIME_SANTANA_POMARES(1396788820),
            SCITEX_CORPORATION_LTD_9(1396918612),
            DAINIPPON_SCREEN_3(1396920910),
            SCITEX_CORPORATION_LTD_12(1396985888),
            SAMSUNG_ELECTRONICS_COLTD(1397048096),
            SEIKO_INSTRUMENTS_USA_INC(1397049675),
            SEIKOSHA(1397049707),
            SCANGUYCOM(1397183833),
            SHARP_LABORATORIES(1397244242),
            INTERNATIONAL_COLOR_CONSORTIUM(1397310275),
            SONY_CORPORATION_2(1397706329),
            SPECTRACAL(1397769036),
            STAR(1398030674),
            SAMPO_TECHNOLOGY_CORPORATION(1398031136),
            SCITEX_CORPORATION_LTD_10(1399023988),
            SCITEX_CORPORATION_LTD_13(1399091232),
            SONY_CORPORATION_3(1399811705),
            TALON_TECHNOLOGY_CORPORATION(1413565519),
            TANDY(1413566020),
            TATUNG_CO_OF_AMERICA_INC(1413567573),
            TAXAN_AMERICA_INC(1413568577),
            TOKYO_DENSHI_SEKEI_KK(1413763872),
            TECO_INFORMATION_SYSTEMS_INC(1413825359),
            TEGRA(1413826386),
            TEKTRONIX_INC(1413827412),
            TEXAS_INSTRUMENTS(1414078496),
            TYPEMAKER_LTD(1414351698),
            TOSHIBA_CORP(1414484802),
            TOSHIBA_INC(1414484808),
            TOTOKU_ELECTRIC_CO_LTD(1414485067),
            TRIUMPH(1414678869),
            TOSHIBA_TEC_CORPORATION(1414742612),
            TTX_COMPUTER_PRODUCTS_INC(1414813728),
            TVM_PROFESSIONAL_MONITOR_CORPORATION(1414941984),
            TW_CASPER_CORPORATION(1414996000),
            ULEAD_SYSTEMS(1431065432),
            UNISYS(1431193939),
            UTZ_FEHLAU_AND_SOHN(1431591494),
            VARITYPER(1447121481),
            VIEWSONIC(1447642455),
            VISUAL_COMMUNICATION(1447646028),
            WANG(1463897671),
            WILBUR_IMAGING(1464615506),
            WARE_TO_GO(1465141042),
            WYSE_TECHNOLOGY(1465471813),
            XEROX_CORPORATION(1480938072),
            X_RITE(1481787732),
            LAVANYAS_TEST_COMPANY(1513173555),
            ZORAN_CORPORATION(1515340110),
            ZEBRA_TECHNOLOGIES_INC(1516593778),
            BASICCOLOR_GMBH(1648968515),
            BERGDESIGN_INCORPORATED(1650815591),
            INTEGRATED_COLOR_SOLUTIONS_INC(1667594596),
            MACDERMID_COLORSPAN_INC(1668051824),
            DAINIPPON_SCREEN_2(1685266464),
            DUPONT_2(1685418094),
            FUJIFILM_ELECTRONIC_IMAGING_LTD_2(1717986665),
            FLUXDATA_CORPORATION(1718383992),
            SCITEX_CORPORATION_LTD_5(1769105779),
            SCITEX_CORPORATION_LTD_8(1801548404),
            ERDT_SYSTEMS_GMBH_AND_CO_KG_2(1868706916),
            MEDIGRAPH_GMBH(1868720483),
            QUBYX_SARL(1903518329),
            SCITEX_CORPORATION_LTD_11(1935894900),
            DAINIPPON_SCREEN_4(1935897198),
            SCITEX_CORPORATION_LTD_14(1935962144),
            SIWI_GRAFIKA_CORPORATION(1936291689),
            YXYMASTER_GMBH(2037938541);

            private final long id;
            DeviceManufacturers(long id) { this.id = id; }
            public long id() { return id; }
            private static final Map<Long, DeviceManufacturers> byId = new HashMap<Long, DeviceManufacturers>(263);
            static {
                for (DeviceManufacturers e : DeviceManufacturers.values())
                    byId.put(e.id(), e);
            }
            public static DeviceManufacturers byId(long id) { return byId.get(id); }
        }
        public DeviceManufacturer() {
            this(null, null, null);
        }

        public DeviceManufacturer(KaitaiStream _io) {
            this(_io, null, null);
        }

        public DeviceManufacturer(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
            this(_io, _parent, null);
        }

        public DeviceManufacturer(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, Icc4 _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.deviceManufacturer = DeviceManufacturers.byId(this._io.readU4be());
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU4be(((Number) (this.deviceManufacturer.id())).longValue());
        }

        public void _check() {
            _dirty = false;
        }
        private DeviceManufacturers deviceManufacturer;
        private Icc4 _root;
        private KaitaiStruct.ReadWrite _parent;
        public DeviceManufacturers deviceManufacturer() { return deviceManufacturer; }
        public void setDeviceManufacturer(DeviceManufacturers _v) { _dirty = true; deviceManufacturer = _v; }
        public Icc4 _root() { return _root; }
        public void set_root(Icc4 _v) { _dirty = true; _root = _v; }
        public KaitaiStruct.ReadWrite _parent() { return _parent; }
        public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
    }
    public static class PositionNumber extends KaitaiStruct.ReadWrite {
        public static PositionNumber fromFile(String fileName) throws IOException {
            return new PositionNumber(new ByteBufferKaitaiStream(fileName));
        }
        public PositionNumber() {
            this(null, null, null);
        }

        public PositionNumber(KaitaiStream _io) {
            this(_io, null, null);
        }

        public PositionNumber(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
            this(_io, _parent, null);
        }

        public PositionNumber(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, Icc4 _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.offsetToDataElement = this._io.readU4be();
            this.sizeOfDataElement = this._io.readU4be();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU4be(this.offsetToDataElement);
            this._io.writeU4be(this.sizeOfDataElement);
        }

        public void _check() {
            _dirty = false;
        }
        private long offsetToDataElement;
        private long sizeOfDataElement;
        private Icc4 _root;
        private KaitaiStruct.ReadWrite _parent;
        public long offsetToDataElement() { return offsetToDataElement; }
        public void setOffsetToDataElement(long _v) { _dirty = true; offsetToDataElement = _v; }
        public long sizeOfDataElement() { return sizeOfDataElement; }
        public void setSizeOfDataElement(long _v) { _dirty = true; sizeOfDataElement = _v; }
        public Icc4 _root() { return _root; }
        public void set_root(Icc4 _v) { _dirty = true; _root = _v; }
        public KaitaiStruct.ReadWrite _parent() { return _parent; }
        public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
    }
    public static class ProfileHeader extends KaitaiStruct.ReadWrite {
        public static ProfileHeader fromFile(String fileName) throws IOException {
            return new ProfileHeader(new ByteBufferKaitaiStream(fileName));
        }

        public enum CmmSignatures {
            THE_IMAGING_FACTORY_CMM(858931796),
            AGFA_CMM(1094929747),
            ADOBE_CMM(1094992453),
            COLOR_GEAR_CMM(1128484179),
            DEMOICCMAX_CMM(1145654616),
            LOGOSYNC_CMM(1147629395),
            EFI_CMM(1162234144),
            EXACT_SCAN_CMM(1163411779),
            FUJI_FILM_CMM(1179000864),
            HARLEQUIN_RIP_CMM(1212370253),
            HEIDELBERG_CMM(1212435744),
            KODAK_CMM(1262701907),
            KONICA_MINOLTA_CMM(1296256324),
            ONYX_GRAPHICS_CMM(1330534744),
            DEVICE_LINK_CMM(1380404563),
            REFICCMAX_CMM(1380535640),
            SAMPLE_ICC_CMM(1397310275),
            MUTOH_CMM(1397311310),
            TOSHIBA_CMM(1413696845),
            COLOR_GEAR_CMM_LITE(1430471501),
            COLOR_GEAR_CMM_C(1430474067),
            WINDOWS_COLOR_SYSTEM_CMM(1464029984),
            WARE_TO_GO_CMM(1465141024),
            APPLE_CMM(1634758764),
            ARGYLL_CMS_CMM(1634887532),
            LITTLE_CMS_CMM(1818455411),
            VIVO_CMM(1986623087),
            ZORAN_CMM(2053320752);

            private final long id;
            CmmSignatures(long id) { this.id = id; }
            public long id() { return id; }
            private static final Map<Long, CmmSignatures> byId = new HashMap<Long, CmmSignatures>(28);
            static {
                for (CmmSignatures e : CmmSignatures.values())
                    byId.put(e.id(), e);
            }
            public static CmmSignatures byId(long id) { return byId.get(id); }
        }

        public enum DataColourSpaces {
            TWO_COLOUR(843271250),
            THREE_COLOUR(860048466),
            FOUR_COLOUR(876825682),
            FIVE_COLOUR(893602898),
            SIX_COLOUR(910380114),
            SEVEN_COLOUR(927157330),
            EIGHT_COLOUR(943934546),
            NINE_COLOUR(960711762),
            TEN_COLOUR(1094929490),
            ELEVEN_COLOUR(1111706706),
            TWELVE_COLOUR(1128483922),
            CMY(1129142560),
            CMYK(1129142603),
            THIRTEEN_COLOUR(1145261138),
            FOURTEEN_COLOUR(1162038354),
            FIFTEEN_COLOUR(1178815570),
            GRAY(1196573017),
            HLS(1212961568),
            HSV(1213421088),
            CIELAB_OR_PCSLAB(1281450528),
            CIELUV(1282766368),
            RGB(1380401696),
            NCIEXYZ_OR_PCSXYZ(1482250784),
            YCBCR(1497588338),
            CIEYXY(1501067552);

            private final long id;
            DataColourSpaces(long id) { this.id = id; }
            public long id() { return id; }
            private static final Map<Long, DataColourSpaces> byId = new HashMap<Long, DataColourSpaces>(25);
            static {
                for (DataColourSpaces e : DataColourSpaces.values())
                    byId.put(e.id(), e);
            }
            public static DataColourSpaces byId(long id) { return byId.get(id); }
        }

        public enum PrimaryPlatforms {
            APPLE_COMPUTER_INC(1095782476),
            MICROSOFT_CORPORATION(1297303124),
            SILICON_GRAPHICS_INC(1397180704),
            SUN_MICROSYSTEMS(1398099543);

            private final long id;
            PrimaryPlatforms(long id) { this.id = id; }
            public long id() { return id; }
            private static final Map<Long, PrimaryPlatforms> byId = new HashMap<Long, PrimaryPlatforms>(4);
            static {
                for (PrimaryPlatforms e : PrimaryPlatforms.values())
                    byId.put(e.id(), e);
            }
            public static PrimaryPlatforms byId(long id) { return byId.get(id); }
        }

        public enum ProfileClasses {
            ABSTRACT_PROFILE(1633842036),
            DEVICE_LINK_PROFILE(1818848875),
            DISPLAY_DEVICE_PROFILE(1835955314),
            NAMED_COLOR_PROFILE(1852662636),
            OUTPUT_DEVICE_PROFILE(1886549106),
            INPUT_DEVICE_PROFILE(1935896178),
            COLOR_SPACE_PROFILE(1936744803);

            private final long id;
            ProfileClasses(long id) { this.id = id; }
            public long id() { return id; }
            private static final Map<Long, ProfileClasses> byId = new HashMap<Long, ProfileClasses>(7);
            static {
                for (ProfileClasses e : ProfileClasses.values())
                    byId.put(e.id(), e);
            }
            public static ProfileClasses byId(long id) { return byId.get(id); }
        }

        public enum RenderingIntents {
            PERCEPTUAL(0),
            MEDIA_RELATIVE_COLORIMETRIC(1),
            SATURATION(2),
            ICC_ABSOLUTE_COLORIMETRIC(3);

            private final long id;
            RenderingIntents(long id) { this.id = id; }
            public long id() { return id; }
            private static final Map<Long, RenderingIntents> byId = new HashMap<Long, RenderingIntents>(4);
            static {
                for (RenderingIntents e : RenderingIntents.values())
                    byId.put(e.id(), e);
            }
            public static RenderingIntents byId(long id) { return byId.get(id); }
        }
        public ProfileHeader() {
            this(null, null, null);
        }

        public ProfileHeader(KaitaiStream _io) {
            this(_io, null, null);
        }

        public ProfileHeader(KaitaiStream _io, Icc4 _parent) {
            this(_io, _parent, null);
        }

        public ProfileHeader(KaitaiStream _io, Icc4 _parent, Icc4 _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.size = this._io.readU4be();
            this.preferredCmmType = CmmSignatures.byId(this._io.readU4be());
            this.version = new VersionField(this._io, this, _root);
            this.version._read();
            this.deviceClass = ProfileClasses.byId(this._io.readU4be());
            this.colorSpace = DataColourSpaces.byId(this._io.readU4be());
            this.pcs = new String(this._io.readBytes(4), StandardCharsets.US_ASCII);
            this.creationDateTime = new DateTimeNumber(this._io, this, _root);
            this.creationDateTime._read();
            this.fileSignature = this._io.readBytes(4);
            if (!(Arrays.equals(this.fileSignature, new byte[] { 97, 99, 115, 112 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 97, 99, 115, 112 }, this.fileSignature, this._io, "/types/profile_header/seq/7");
            }
            this.primaryPlatform = PrimaryPlatforms.byId(this._io.readU4be());
            this.profileFlags = new ProfileFlags(this._io, this, _root);
            this.profileFlags._read();
            this.deviceManufacturer = new DeviceManufacturer(this._io, this, _root);
            this.deviceManufacturer._read();
            this.deviceModel = new String(this._io.readBytes(4), StandardCharsets.US_ASCII);
            this.deviceAttributes = new DeviceAttributes(this._io, this, _root);
            this.deviceAttributes._read();
            this.renderingIntent = RenderingIntents.byId(this._io.readU4be());
            this.nciexyzValuesOfIlluminantOfPcs = new XyzNumber(this._io, this, _root);
            this.nciexyzValuesOfIlluminantOfPcs._read();
            this.creator = new DeviceManufacturer(this._io, this, _root);
            this.creator._read();
            this.identifier = this._io.readBytes(16);
            this.reservedData = this._io.readBytes(28);
            _dirty = false;
        }

        public void _fetchInstances() {
            this.version._fetchInstances();
            this.creationDateTime._fetchInstances();
            this.profileFlags._fetchInstances();
            this.deviceManufacturer._fetchInstances();
            this.deviceAttributes._fetchInstances();
            this.nciexyzValuesOfIlluminantOfPcs._fetchInstances();
            this.creator._fetchInstances();
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU4be(this.size);
            this._io.writeU4be(((Number) (this.preferredCmmType.id())).longValue());
            this.version._write_Seq(this._io);
            this._io.writeU4be(((Number) (this.deviceClass.id())).longValue());
            this._io.writeU4be(((Number) (this.colorSpace.id())).longValue());
            this._io.writeBytes((this.pcs).getBytes(Charset.forName("ASCII")));
            this.creationDateTime._write_Seq(this._io);
            this._io.writeBytes(this.fileSignature);
            this._io.writeU4be(((Number) (this.primaryPlatform.id())).longValue());
            this.profileFlags._write_Seq(this._io);
            this.deviceManufacturer._write_Seq(this._io);
            this._io.writeBytes((this.deviceModel).getBytes(Charset.forName("ASCII")));
            this.deviceAttributes._write_Seq(this._io);
            this._io.writeU4be(((Number) (this.renderingIntent.id())).longValue());
            this.nciexyzValuesOfIlluminantOfPcs._write_Seq(this._io);
            this.creator._write_Seq(this._io);
            this._io.writeBytes(this.identifier);
            this._io.writeBytes(this.reservedData);
        }

        public void _check() {
            if (!Objects.equals(this.version._root(), _root()))
                throw new ConsistencyError("version", _root(), this.version._root());
            if (!Objects.equals(this.version._parent(), this))
                throw new ConsistencyError("version", this, this.version._parent());
            if ((this.pcs).getBytes(Charset.forName("ASCII")).length != 4)
                throw new ConsistencyError("pcs", 4, (this.pcs).getBytes(Charset.forName("ASCII")).length);
            if (!Objects.equals(this.creationDateTime._root(), _root()))
                throw new ConsistencyError("creation_date_time", _root(), this.creationDateTime._root());
            if (!Objects.equals(this.creationDateTime._parent(), this))
                throw new ConsistencyError("creation_date_time", this, this.creationDateTime._parent());
            if (this.fileSignature.length != 4)
                throw new ConsistencyError("file_signature", 4, this.fileSignature.length);
            if (!(Arrays.equals(this.fileSignature, new byte[] { 97, 99, 115, 112 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 97, 99, 115, 112 }, this.fileSignature, null, "/types/profile_header/seq/7");
            }
            if (!Objects.equals(this.profileFlags._root(), _root()))
                throw new ConsistencyError("profile_flags", _root(), this.profileFlags._root());
            if (!Objects.equals(this.profileFlags._parent(), this))
                throw new ConsistencyError("profile_flags", this, this.profileFlags._parent());
            if (!Objects.equals(this.deviceManufacturer._root(), _root()))
                throw new ConsistencyError("device_manufacturer", _root(), this.deviceManufacturer._root());
            if (!Objects.equals(this.deviceManufacturer._parent(), this))
                throw new ConsistencyError("device_manufacturer", this, this.deviceManufacturer._parent());
            if ((this.deviceModel).getBytes(Charset.forName("ASCII")).length != 4)
                throw new ConsistencyError("device_model", 4, (this.deviceModel).getBytes(Charset.forName("ASCII")).length);
            if (!Objects.equals(this.deviceAttributes._root(), _root()))
                throw new ConsistencyError("device_attributes", _root(), this.deviceAttributes._root());
            if (!Objects.equals(this.deviceAttributes._parent(), this))
                throw new ConsistencyError("device_attributes", this, this.deviceAttributes._parent());
            if (!Objects.equals(this.nciexyzValuesOfIlluminantOfPcs._root(), _root()))
                throw new ConsistencyError("nciexyz_values_of_illuminant_of_pcs", _root(), this.nciexyzValuesOfIlluminantOfPcs._root());
            if (!Objects.equals(this.nciexyzValuesOfIlluminantOfPcs._parent(), this))
                throw new ConsistencyError("nciexyz_values_of_illuminant_of_pcs", this, this.nciexyzValuesOfIlluminantOfPcs._parent());
            if (!Objects.equals(this.creator._root(), _root()))
                throw new ConsistencyError("creator", _root(), this.creator._root());
            if (!Objects.equals(this.creator._parent(), this))
                throw new ConsistencyError("creator", this, this.creator._parent());
            if (this.identifier.length != 16)
                throw new ConsistencyError("identifier", 16, this.identifier.length);
            if (this.reservedData.length != 28)
                throw new ConsistencyError("reserved_data", 28, this.reservedData.length);
            _dirty = false;
        }
        public static class ProfileFlags extends KaitaiStruct.ReadWrite {
            public static ProfileFlags fromFile(String fileName) throws IOException {
                return new ProfileFlags(new ByteBufferKaitaiStream(fileName));
            }
            public ProfileFlags() {
                this(null, null, null);
            }

            public ProfileFlags(KaitaiStream _io) {
                this(_io, null, null);
            }

            public ProfileFlags(KaitaiStream _io, Icc4.ProfileHeader _parent) {
                this(_io, _parent, null);
            }

            public ProfileFlags(KaitaiStream _io, Icc4.ProfileHeader _parent, Icc4 _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
            }
            public void _read() {
                this.embeddedProfile = this._io.readBitsIntBe(1) != 0;
                this.profileCanBeUsedIndependentlyOfEmbeddedColourData = this._io.readBitsIntBe(1) != 0;
                this.otherFlags = this._io.readBitsIntBe(30);
                _dirty = false;
            }

            public void _fetchInstances() {
            }

            public void _write_Seq() {
                _assertNotDirty();
                this._io.writeBitsIntBe(1, (this.embeddedProfile ? 1 : 0));
                this._io.writeBitsIntBe(1, (this.profileCanBeUsedIndependentlyOfEmbeddedColourData ? 1 : 0));
                this._io.writeBitsIntBe(30, this.otherFlags);
            }

            public void _check() {
                _dirty = false;
            }
            private boolean embeddedProfile;
            private boolean profileCanBeUsedIndependentlyOfEmbeddedColourData;
            private long otherFlags;
            private Icc4 _root;
            private Icc4.ProfileHeader _parent;
            public boolean embeddedProfile() { return embeddedProfile; }
            public void setEmbeddedProfile(boolean _v) { _dirty = true; embeddedProfile = _v; }
            public boolean profileCanBeUsedIndependentlyOfEmbeddedColourData() { return profileCanBeUsedIndependentlyOfEmbeddedColourData; }
            public void setProfileCanBeUsedIndependentlyOfEmbeddedColourData(boolean _v) { _dirty = true; profileCanBeUsedIndependentlyOfEmbeddedColourData = _v; }
            public long otherFlags() { return otherFlags; }
            public void setOtherFlags(long _v) { _dirty = true; otherFlags = _v; }
            public Icc4 _root() { return _root; }
            public void set_root(Icc4 _v) { _dirty = true; _root = _v; }
            public Icc4.ProfileHeader _parent() { return _parent; }
            public void set_parent(Icc4.ProfileHeader _v) { _dirty = true; _parent = _v; }
        }
        public static class VersionField extends KaitaiStruct.ReadWrite {
            public static VersionField fromFile(String fileName) throws IOException {
                return new VersionField(new ByteBufferKaitaiStream(fileName));
            }
            public VersionField() {
                this(null, null, null);
            }

            public VersionField(KaitaiStream _io) {
                this(_io, null, null);
            }

            public VersionField(KaitaiStream _io, Icc4.ProfileHeader _parent) {
                this(_io, _parent, null);
            }

            public VersionField(KaitaiStream _io, Icc4.ProfileHeader _parent, Icc4 _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
            }
            public void _read() {
                this.major = this._io.readBytes(1);
                if (!(Arrays.equals(this.major, new byte[] { 4 }))) {
                    throw new KaitaiStream.ValidationNotEqualError(new byte[] { 4 }, this.major, this._io, "/types/profile_header/types/version_field/seq/0");
                }
                this.minor = this._io.readBitsIntBe(4);
                this.bugFixLevel = this._io.readBitsIntBe(4);
                this.reserved = this._io.readBytes(2);
                if (!(Arrays.equals(this.reserved, new byte[] { 0, 0 }))) {
                    throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0, 0 }, this.reserved, this._io, "/types/profile_header/types/version_field/seq/3");
                }
                _dirty = false;
            }

            public void _fetchInstances() {
            }

            public void _write_Seq() {
                _assertNotDirty();
                this._io.writeBytes(this.major);
                this._io.writeBitsIntBe(4, this.minor);
                this._io.writeBitsIntBe(4, this.bugFixLevel);
                this._io.writeBytes(this.reserved);
            }

            public void _check() {
                if (this.major.length != 1)
                    throw new ConsistencyError("major", 1, this.major.length);
                if (!(Arrays.equals(this.major, new byte[] { 4 }))) {
                    throw new KaitaiStream.ValidationNotEqualError(new byte[] { 4 }, this.major, null, "/types/profile_header/types/version_field/seq/0");
                }
                if (this.reserved.length != 2)
                    throw new ConsistencyError("reserved", 2, this.reserved.length);
                if (!(Arrays.equals(this.reserved, new byte[] { 0, 0 }))) {
                    throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0, 0 }, this.reserved, null, "/types/profile_header/types/version_field/seq/3");
                }
                _dirty = false;
            }
            private byte[] major;
            private long minor;
            private long bugFixLevel;
            private byte[] reserved;
            private Icc4 _root;
            private Icc4.ProfileHeader _parent;
            public byte[] major() { return major; }
            public void setMajor(byte[] _v) { _dirty = true; major = _v; }
            public long minor() { return minor; }
            public void setMinor(long _v) { _dirty = true; minor = _v; }
            public long bugFixLevel() { return bugFixLevel; }
            public void setBugFixLevel(long _v) { _dirty = true; bugFixLevel = _v; }
            public byte[] reserved() { return reserved; }
            public void setReserved(byte[] _v) { _dirty = true; reserved = _v; }
            public Icc4 _root() { return _root; }
            public void set_root(Icc4 _v) { _dirty = true; _root = _v; }
            public Icc4.ProfileHeader _parent() { return _parent; }
            public void set_parent(Icc4.ProfileHeader _v) { _dirty = true; _parent = _v; }
        }
        private long size;
        private CmmSignatures preferredCmmType;
        private VersionField version;
        private ProfileClasses deviceClass;
        private DataColourSpaces colorSpace;
        private String pcs;
        private DateTimeNumber creationDateTime;
        private byte[] fileSignature;
        private PrimaryPlatforms primaryPlatform;
        private ProfileFlags profileFlags;
        private DeviceManufacturer deviceManufacturer;
        private String deviceModel;
        private DeviceAttributes deviceAttributes;
        private RenderingIntents renderingIntent;
        private XyzNumber nciexyzValuesOfIlluminantOfPcs;
        private DeviceManufacturer creator;
        private byte[] identifier;
        private byte[] reservedData;
        private Icc4 _root;
        private Icc4 _parent;
        public long size() { return size; }
        public void setSize(long _v) { _dirty = true; size = _v; }
        public CmmSignatures preferredCmmType() { return preferredCmmType; }
        public void setPreferredCmmType(CmmSignatures _v) { _dirty = true; preferredCmmType = _v; }
        public VersionField version() { return version; }
        public void setVersion(VersionField _v) { _dirty = true; version = _v; }
        public ProfileClasses deviceClass() { return deviceClass; }
        public void setDeviceClass(ProfileClasses _v) { _dirty = true; deviceClass = _v; }
        public DataColourSpaces colorSpace() { return colorSpace; }
        public void setColorSpace(DataColourSpaces _v) { _dirty = true; colorSpace = _v; }
        public String pcs() { return pcs; }
        public void setPcs(String _v) { _dirty = true; pcs = _v; }
        public DateTimeNumber creationDateTime() { return creationDateTime; }
        public void setCreationDateTime(DateTimeNumber _v) { _dirty = true; creationDateTime = _v; }
        public byte[] fileSignature() { return fileSignature; }
        public void setFileSignature(byte[] _v) { _dirty = true; fileSignature = _v; }
        public PrimaryPlatforms primaryPlatform() { return primaryPlatform; }
        public void setPrimaryPlatform(PrimaryPlatforms _v) { _dirty = true; primaryPlatform = _v; }
        public ProfileFlags profileFlags() { return profileFlags; }
        public void setProfileFlags(ProfileFlags _v) { _dirty = true; profileFlags = _v; }
        public DeviceManufacturer deviceManufacturer() { return deviceManufacturer; }
        public void setDeviceManufacturer(DeviceManufacturer _v) { _dirty = true; deviceManufacturer = _v; }
        public String deviceModel() { return deviceModel; }
        public void setDeviceModel(String _v) { _dirty = true; deviceModel = _v; }
        public DeviceAttributes deviceAttributes() { return deviceAttributes; }
        public void setDeviceAttributes(DeviceAttributes _v) { _dirty = true; deviceAttributes = _v; }
        public RenderingIntents renderingIntent() { return renderingIntent; }
        public void setRenderingIntent(RenderingIntents _v) { _dirty = true; renderingIntent = _v; }
        public XyzNumber nciexyzValuesOfIlluminantOfPcs() { return nciexyzValuesOfIlluminantOfPcs; }
        public void setNciexyzValuesOfIlluminantOfPcs(XyzNumber _v) { _dirty = true; nciexyzValuesOfIlluminantOfPcs = _v; }
        public DeviceManufacturer creator() { return creator; }
        public void setCreator(DeviceManufacturer _v) { _dirty = true; creator = _v; }
        public byte[] identifier() { return identifier; }
        public void setIdentifier(byte[] _v) { _dirty = true; identifier = _v; }
        public byte[] reservedData() { return reservedData; }
        public void setReservedData(byte[] _v) { _dirty = true; reservedData = _v; }
        public Icc4 _root() { return _root; }
        public void set_root(Icc4 _v) { _dirty = true; _root = _v; }
        public Icc4 _parent() { return _parent; }
        public void set_parent(Icc4 _v) { _dirty = true; _parent = _v; }
    }
    public static class Response16Number extends KaitaiStruct.ReadWrite {
        public static Response16Number fromFile(String fileName) throws IOException {
            return new Response16Number(new ByteBufferKaitaiStream(fileName));
        }
        public Response16Number() {
            this(null, null, null);
        }

        public Response16Number(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Response16Number(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
            this(_io, _parent, null);
        }

        public Response16Number(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, Icc4 _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.number = this._io.readU4be();
            this.reserved = this._io.readBytes(2);
            if (!(Arrays.equals(this.reserved, new byte[] { 0, 0 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0, 0 }, this.reserved, this._io, "/types/response_16_number/seq/1");
            }
            this.measurementValue = new S15Fixed16Number(this._io, this, _root);
            this.measurementValue._read();
            _dirty = false;
        }

        public void _fetchInstances() {
            this.measurementValue._fetchInstances();
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU4be(this.number);
            this._io.writeBytes(this.reserved);
            this.measurementValue._write_Seq(this._io);
        }

        public void _check() {
            if (this.reserved.length != 2)
                throw new ConsistencyError("reserved", 2, this.reserved.length);
            if (!(Arrays.equals(this.reserved, new byte[] { 0, 0 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0, 0 }, this.reserved, null, "/types/response_16_number/seq/1");
            }
            if (!Objects.equals(this.measurementValue._root(), _root()))
                throw new ConsistencyError("measurement_value", _root(), this.measurementValue._root());
            if (!Objects.equals(this.measurementValue._parent(), this))
                throw new ConsistencyError("measurement_value", this, this.measurementValue._parent());
            _dirty = false;
        }
        private long number;
        private byte[] reserved;
        private S15Fixed16Number measurementValue;
        private Icc4 _root;
        private KaitaiStruct.ReadWrite _parent;
        public long number() { return number; }
        public void setNumber(long _v) { _dirty = true; number = _v; }
        public byte[] reserved() { return reserved; }
        public void setReserved(byte[] _v) { _dirty = true; reserved = _v; }
        public S15Fixed16Number measurementValue() { return measurementValue; }
        public void setMeasurementValue(S15Fixed16Number _v) { _dirty = true; measurementValue = _v; }
        public Icc4 _root() { return _root; }
        public void set_root(Icc4 _v) { _dirty = true; _root = _v; }
        public KaitaiStruct.ReadWrite _parent() { return _parent; }
        public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
    }
    public static class S15Fixed16Number extends KaitaiStruct.ReadWrite {
        public static S15Fixed16Number fromFile(String fileName) throws IOException {
            return new S15Fixed16Number(new ByteBufferKaitaiStream(fileName));
        }
        public S15Fixed16Number() {
            this(null, null, null);
        }

        public S15Fixed16Number(KaitaiStream _io) {
            this(_io, null, null);
        }

        public S15Fixed16Number(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
            this(_io, _parent, null);
        }

        public S15Fixed16Number(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, Icc4 _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.number = this._io.readBytes(4);
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBytes(this.number);
        }

        public void _check() {
            if (this.number.length != 4)
                throw new ConsistencyError("number", 4, this.number.length);
            _dirty = false;
        }
        private byte[] number;
        private Icc4 _root;
        private KaitaiStruct.ReadWrite _parent;
        public byte[] number() { return number; }
        public void setNumber(byte[] _v) { _dirty = true; number = _v; }
        public Icc4 _root() { return _root; }
        public void set_root(Icc4 _v) { _dirty = true; _root = _v; }
        public KaitaiStruct.ReadWrite _parent() { return _parent; }
        public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
    }
    public static class StandardIlluminantEncoding extends KaitaiStruct.ReadWrite {
        public static StandardIlluminantEncoding fromFile(String fileName) throws IOException {
            return new StandardIlluminantEncoding(new ByteBufferKaitaiStream(fileName));
        }

        public enum StandardIlluminantEncodings {
            UNKNOWN(0),
            D50(1),
            D65(2),
            D93(3),
            F2(4),
            D55(5),
            A(6),
            EQUI_POWER(7),
            F8(8);

            private final long id;
            StandardIlluminantEncodings(long id) { this.id = id; }
            public long id() { return id; }
            private static final Map<Long, StandardIlluminantEncodings> byId = new HashMap<Long, StandardIlluminantEncodings>(9);
            static {
                for (StandardIlluminantEncodings e : StandardIlluminantEncodings.values())
                    byId.put(e.id(), e);
            }
            public static StandardIlluminantEncodings byId(long id) { return byId.get(id); }
        }
        public StandardIlluminantEncoding() {
            this(null, null, null);
        }

        public StandardIlluminantEncoding(KaitaiStream _io) {
            this(_io, null, null);
        }

        public StandardIlluminantEncoding(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
            this(_io, _parent, null);
        }

        public StandardIlluminantEncoding(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, Icc4 _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.standardIlluminantEncoding = StandardIlluminantEncodings.byId(this._io.readU4be());
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU4be(((Number) (this.standardIlluminantEncoding.id())).longValue());
        }

        public void _check() {
            _dirty = false;
        }
        private StandardIlluminantEncodings standardIlluminantEncoding;
        private Icc4 _root;
        private KaitaiStruct.ReadWrite _parent;
        public StandardIlluminantEncodings standardIlluminantEncoding() { return standardIlluminantEncoding; }
        public void setStandardIlluminantEncoding(StandardIlluminantEncodings _v) { _dirty = true; standardIlluminantEncoding = _v; }
        public Icc4 _root() { return _root; }
        public void set_root(Icc4 _v) { _dirty = true; _root = _v; }
        public KaitaiStruct.ReadWrite _parent() { return _parent; }
        public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
    }
    public static class TagTable extends KaitaiStruct.ReadWrite {
        public static TagTable fromFile(String fileName) throws IOException {
            return new TagTable(new ByteBufferKaitaiStream(fileName));
        }
        public TagTable() {
            this(null, null, null);
        }

        public TagTable(KaitaiStream _io) {
            this(_io, null, null);
        }

        public TagTable(KaitaiStream _io, Icc4 _parent) {
            this(_io, _parent, null);
        }

        public TagTable(KaitaiStream _io, Icc4 _parent, Icc4 _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.tagCount = this._io.readU4be();
            this.tags = new ArrayList<TagDefinition>();
            for (int i = 0; i < tagCount(); i++) {
                TagDefinition _t_tags = new TagDefinition(this._io, this, _root);
                try {
                    _t_tags._read();
                } finally {
                    this.tags.add(_t_tags);
                }
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            for (int i = 0; i < this.tags.size(); i++) {
                this.tags.get(((Number) (i)).intValue())._fetchInstances();
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU4be(this.tagCount);
            for (int i = 0; i < this.tags.size(); i++) {
                this.tags.get(((Number) (i)).intValue())._write_Seq(this._io);
            }
        }

        public void _check() {
            if (this.tags.size() != tagCount())
                throw new ConsistencyError("tags", tagCount(), this.tags.size());
            for (int i = 0; i < this.tags.size(); i++) {
                if (!Objects.equals(this.tags.get(((Number) (i)).intValue())._root(), _root()))
                    throw new ConsistencyError("tags", _root(), this.tags.get(((Number) (i)).intValue())._root());
                if (!Objects.equals(this.tags.get(((Number) (i)).intValue())._parent(), this))
                    throw new ConsistencyError("tags", this, this.tags.get(((Number) (i)).intValue())._parent());
            }
            _dirty = false;
        }
        public static class TagDefinition extends KaitaiStruct.ReadWrite {
            public static TagDefinition fromFile(String fileName) throws IOException {
                return new TagDefinition(new ByteBufferKaitaiStream(fileName));
            }

            public enum MultiProcessElementsTypes {
                BACS_ELEMENT_TYPE(1648444243),
                CLUT_ELEMENT_TYPE(1668052340),
                ONE_DIMENSIONAL_CURVES_TYPE(1668641382),
                EACS_ELEMENT_TYPE(1698775891),
                MATRIX_ELEMENT_TYPE(1835103334),
                CURVE_SET_ELEMENT_TABLE_TYPE(1835428980),
                FORMULA_CURVE_SEGMENTS_TYPE(1885434470),
                SAMPLED_CURVE_SEGMENT_TYPE(1935764838);

                private final long id;
                MultiProcessElementsTypes(long id) { this.id = id; }
                public long id() { return id; }
                private static final Map<Long, MultiProcessElementsTypes> byId = new HashMap<Long, MultiProcessElementsTypes>(8);
                static {
                    for (MultiProcessElementsTypes e : MultiProcessElementsTypes.values())
                        byId.put(e.id(), e);
                }
                public static MultiProcessElementsTypes byId(long id) { return byId.get(id); }
            }

            public enum TagSignatures {
                A_TO_B_0(1093812784),
                A_TO_B_1(1093812785),
                A_TO_B_2(1093812786),
                B_TO_A_0(1110589744),
                B_TO_A_1(1110589745),
                B_TO_A_2(1110589746),
                B_TO_D_0(1110590512),
                B_TO_D_1(1110590513),
                B_TO_D_2(1110590514),
                B_TO_D_3(1110590515),
                D_TO_B_0(1144144432),
                D_TO_B_1(1144144433),
                D_TO_B_2(1144144434),
                D_TO_B_3(1144144435),
                BLUE_TRC(1649693251),
                BLUE_MATRIX_COLUMN(1649957210),
                CALIBRATION_DATE_TIME(1667329140),
                CHROMATIC_ADAPTATION(1667785060),
                CHROMATICITY(1667789421),
                COLORIMETRIC_INTENT_IMAGE_STATE(1667852659),
                COLORANT_TABLE_OUT(1668050804),
                COLORANT_ORDER(1668051567),
                COLORANT_TABLE(1668051572),
                COPYRIGHT(1668313716),
                PROFILE_DESCRIPTION(1684370275),
                DEVICE_MODEL_DESC(1684890724),
                DEVICE_MFG_DESC(1684893284),
                GREEN_TRC(1733579331),
                GREEN_MATRIX_COLUMN(1733843290),
                GAMUT(1734438260),
                GRAY_TRC(1800688195),
                LUMINANCE(1819635049),
                MEASUREMENT(1835360627),
                NAMED_COLOR_2(1852009522),
                PREVIEW_0(1886545200),
                PREVIEW_1(1886545201),
                PREVIEW_2(1886545202),
                PROFILE_SEQUENCE(1886610801),
                PROFILE_SEQUENCE_IDENTIFIER(1886611812),
                RED_TRC(1918128707),
                RED_MATRIX_COLUMN(1918392666),
                OUTPUT_RESPONSE(1919251312),
                PERCEPTUAL_RENDERING_INTENT_GAMUT(1919510320),
                SATURATION_RENDERING_INTENT_GAMUT(1919510322),
                CHAR_TARGET(1952543335),
                TECHNOLOGY(1952801640),
                VIEWING_CONDITIONS(1986618743),
                VIEWING_COND_DESC(1987405156),
                MEDIA_WHITE_POINT(2004119668);

                private final long id;
                TagSignatures(long id) { this.id = id; }
                public long id() { return id; }
                private static final Map<Long, TagSignatures> byId = new HashMap<Long, TagSignatures>(49);
                static {
                    for (TagSignatures e : TagSignatures.values())
                        byId.put(e.id(), e);
                }
                public static TagSignatures byId(long id) { return byId.get(id); }
            }

            public enum TagTypeSignatures {
                XYZ_TYPE(1482250784),
                CHROMATICITY_TYPE(1667789421),
                COLORANT_ORDER_TYPE(1668051567),
                COLORANT_TABLE_TYPE(1668051572),
                CURVE_TYPE(1668641398),
                DATA_TYPE(1684108385),
                DATE_TIME_TYPE(1685350765),
                MULTI_FUNCTION_A_TO_B_TABLE_TYPE(1832993312),
                MULTI_FUNCTION_B_TO_A_TABLE_TYPE(1833058592),
                MEASUREMENT_TYPE(1835360627),
                MULTI_FUNCTION_TABLE_WITH_ONE_BYTE_PRECISION_TYPE(1835430961),
                MULTI_FUNCTION_TABLE_WITH_TWO_BYTE_PRECISION_TYPE(1835430962),
                MULTI_LOCALIZED_UNICODE_TYPE(1835824483),
                MULTI_PROCESS_ELEMENTS_TYPE(1836082548),
                NAMED_COLOR_2_TYPE(1852009522),
                PARAMETRIC_CURVE_TYPE(1885434465),
                PROFILE_SEQUENCE_DESC_TYPE(1886610801),
                PROFILE_SEQUENCE_IDENTIFIER_TYPE(1886611812),
                RESPONSE_CURVE_SET_16_TYPE(1919120178),
                S_15_FIXED_16_ARRAY_TYPE(1936077618),
                SIGNATURE_TYPE(1936287520),
                TEXT_TYPE(1952807028),
                U_16_FIXED_16_ARRAY_TYPE(1969632050),
                U_INT_8_ARRAY_TYPE(1969827896),
                U_INT_16_ARRAY_TYPE(1969828150),
                U_INT_32_ARRAY_TYPE(1969828658),
                U_INT_64_ARRAY_TYPE(1969829428),
                VIEWING_CONDITIONS_TYPE(1986618743);

                private final long id;
                TagTypeSignatures(long id) { this.id = id; }
                public long id() { return id; }
                private static final Map<Long, TagTypeSignatures> byId = new HashMap<Long, TagTypeSignatures>(28);
                static {
                    for (TagTypeSignatures e : TagTypeSignatures.values())
                        byId.put(e.id(), e);
                }
                public static TagTypeSignatures byId(long id) { return byId.get(id); }
            }
            public TagDefinition() {
                this(null, null, null);
            }

            public TagDefinition(KaitaiStream _io) {
                this(_io, null, null);
            }

            public TagDefinition(KaitaiStream _io, Icc4.TagTable _parent) {
                this(_io, _parent, null);
            }

            public TagDefinition(KaitaiStream _io, Icc4.TagTable _parent, Icc4 _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
            }
            public void _read() {
                this.tagSignature = TagSignatures.byId(this._io.readU4be());
                this.offsetToDataElement = this._io.readU4be();
                this.sizeOfDataElement = this._io.readU4be();
                _dirty = false;
            }

            public void _fetchInstances() {
                tagDataElement();
                if (this.tagDataElement != null) {
                    {
                        TagSignatures on = tagSignature();
                        if (on != null) {
                            switch (tagSignature()) {
                            case A_TO_B_0: {
                                ((AToB0Tag) (this.tagDataElement))._fetchInstances();
                                break;
                            }
                            case A_TO_B_1: {
                                ((AToB1Tag) (this.tagDataElement))._fetchInstances();
                                break;
                            }
                            case A_TO_B_2: {
                                ((AToB2Tag) (this.tagDataElement))._fetchInstances();
                                break;
                            }
                            case B_TO_A_0: {
                                ((BToA0Tag) (this.tagDataElement))._fetchInstances();
                                break;
                            }
                            case B_TO_A_1: {
                                ((BToA1Tag) (this.tagDataElement))._fetchInstances();
                                break;
                            }
                            case B_TO_A_2: {
                                ((BToA2Tag) (this.tagDataElement))._fetchInstances();
                                break;
                            }
                            case B_TO_D_0: {
                                ((BToD0Tag) (this.tagDataElement))._fetchInstances();
                                break;
                            }
                            case B_TO_D_1: {
                                ((BToD1Tag) (this.tagDataElement))._fetchInstances();
                                break;
                            }
                            case B_TO_D_2: {
                                ((BToD2Tag) (this.tagDataElement))._fetchInstances();
                                break;
                            }
                            case B_TO_D_3: {
                                ((BToD3Tag) (this.tagDataElement))._fetchInstances();
                                break;
                            }
                            case BLUE_MATRIX_COLUMN: {
                                ((BlueMatrixColumnTag) (this.tagDataElement))._fetchInstances();
                                break;
                            }
                            case BLUE_TRC: {
                                ((BlueTrcTag) (this.tagDataElement))._fetchInstances();
                                break;
                            }
                            case CALIBRATION_DATE_TIME: {
                                ((CalibrationDateTimeTag) (this.tagDataElement))._fetchInstances();
                                break;
                            }
                            case CHAR_TARGET: {
                                ((CharTargetTag) (this.tagDataElement))._fetchInstances();
                                break;
                            }
                            case CHROMATIC_ADAPTATION: {
                                ((ChromaticAdaptationTag) (this.tagDataElement))._fetchInstances();
                                break;
                            }
                            case CHROMATICITY: {
                                ((ChromaticityTag) (this.tagDataElement))._fetchInstances();
                                break;
                            }
                            case COLORANT_ORDER: {
                                ((ColorantOrderTag) (this.tagDataElement))._fetchInstances();
                                break;
                            }
                            case COLORANT_TABLE: {
                                ((ColorantTableTag) (this.tagDataElement))._fetchInstances();
                                break;
                            }
                            case COLORANT_TABLE_OUT: {
                                ((ColorantTableOutTag) (this.tagDataElement))._fetchInstances();
                                break;
                            }
                            case COLORIMETRIC_INTENT_IMAGE_STATE: {
                                ((ColorimetricIntentImageStateTag) (this.tagDataElement))._fetchInstances();
                                break;
                            }
                            case COPYRIGHT: {
                                ((CopyrightTag) (this.tagDataElement))._fetchInstances();
                                break;
                            }
                            case D_TO_B_0: {
                                ((DToB0Tag) (this.tagDataElement))._fetchInstances();
                                break;
                            }
                            case D_TO_B_1: {
                                ((DToB1Tag) (this.tagDataElement))._fetchInstances();
                                break;
                            }
                            case D_TO_B_2: {
                                ((DToB2Tag) (this.tagDataElement))._fetchInstances();
                                break;
                            }
                            case D_TO_B_3: {
                                ((DToB3Tag) (this.tagDataElement))._fetchInstances();
                                break;
                            }
                            case DEVICE_MFG_DESC: {
                                ((DeviceMfgDescTag) (this.tagDataElement))._fetchInstances();
                                break;
                            }
                            case DEVICE_MODEL_DESC: {
                                ((DeviceModelDescTag) (this.tagDataElement))._fetchInstances();
                                break;
                            }
                            case GAMUT: {
                                ((GamutTag) (this.tagDataElement))._fetchInstances();
                                break;
                            }
                            case GRAY_TRC: {
                                ((GrayTrcTag) (this.tagDataElement))._fetchInstances();
                                break;
                            }
                            case GREEN_MATRIX_COLUMN: {
                                ((GreenMatrixColumnTag) (this.tagDataElement))._fetchInstances();
                                break;
                            }
                            case GREEN_TRC: {
                                ((GreenTrcTag) (this.tagDataElement))._fetchInstances();
                                break;
                            }
                            case LUMINANCE: {
                                ((LuminanceTag) (this.tagDataElement))._fetchInstances();
                                break;
                            }
                            case MEASUREMENT: {
                                ((MeasurementTag) (this.tagDataElement))._fetchInstances();
                                break;
                            }
                            case MEDIA_WHITE_POINT: {
                                ((MediaWhitePointTag) (this.tagDataElement))._fetchInstances();
                                break;
                            }
                            case NAMED_COLOR_2: {
                                ((NamedColor2Tag) (this.tagDataElement))._fetchInstances();
                                break;
                            }
                            case OUTPUT_RESPONSE: {
                                ((OutputResponseTag) (this.tagDataElement))._fetchInstances();
                                break;
                            }
                            case PERCEPTUAL_RENDERING_INTENT_GAMUT: {
                                ((PerceptualRenderingIntentGamutTag) (this.tagDataElement))._fetchInstances();
                                break;
                            }
                            case PREVIEW_0: {
                                ((Preview0Tag) (this.tagDataElement))._fetchInstances();
                                break;
                            }
                            case PREVIEW_1: {
                                ((Preview1Tag) (this.tagDataElement))._fetchInstances();
                                break;
                            }
                            case PREVIEW_2: {
                                ((Preview2Tag) (this.tagDataElement))._fetchInstances();
                                break;
                            }
                            case PROFILE_DESCRIPTION: {
                                ((ProfileDescriptionTag) (this.tagDataElement))._fetchInstances();
                                break;
                            }
                            case PROFILE_SEQUENCE: {
                                ((ProfileSequenceTag) (this.tagDataElement))._fetchInstances();
                                break;
                            }
                            case PROFILE_SEQUENCE_IDENTIFIER: {
                                ((ProfileSequenceIdentifierTag) (this.tagDataElement))._fetchInstances();
                                break;
                            }
                            case RED_MATRIX_COLUMN: {
                                ((RedMatrixColumnTag) (this.tagDataElement))._fetchInstances();
                                break;
                            }
                            case RED_TRC: {
                                ((RedTrcTag) (this.tagDataElement))._fetchInstances();
                                break;
                            }
                            case SATURATION_RENDERING_INTENT_GAMUT: {
                                ((SaturationRenderingIntentGamutTag) (this.tagDataElement))._fetchInstances();
                                break;
                            }
                            case TECHNOLOGY: {
                                ((TechnologyTag) (this.tagDataElement))._fetchInstances();
                                break;
                            }
                            case VIEWING_COND_DESC: {
                                ((ViewingCondDescTag) (this.tagDataElement))._fetchInstances();
                                break;
                            }
                            case VIEWING_CONDITIONS: {
                                ((ViewingConditionsTag) (this.tagDataElement))._fetchInstances();
                                break;
                            }
                            default: {
                                break;
                            }
                            }
                        } else {
                        }
                    }
                }
            }

            public void _write_Seq() {
                _assertNotDirty();
                _shouldWriteTagDataElement = _enabledTagDataElement;
                this._io.writeU4be(((Number) (this.tagSignature.id())).longValue());
                this._io.writeU4be(this.offsetToDataElement);
                this._io.writeU4be(this.sizeOfDataElement);
            }

            public void _check() {
                if (_enabledTagDataElement) {
                    {
                        TagSignatures on = tagSignature();
                        if (on != null) {
                            switch (tagSignature()) {
                            case A_TO_B_0: {
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.AToB0Tag) (this.tagDataElement))._root(), _root()))
                                    throw new ConsistencyError("tag_data_element", _root(), ((Icc4.TagTable.TagDefinition.AToB0Tag) (this.tagDataElement))._root());
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.AToB0Tag) (this.tagDataElement))._parent(), this))
                                    throw new ConsistencyError("tag_data_element", this, ((Icc4.TagTable.TagDefinition.AToB0Tag) (this.tagDataElement))._parent());
                                break;
                            }
                            case A_TO_B_1: {
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.AToB1Tag) (this.tagDataElement))._root(), _root()))
                                    throw new ConsistencyError("tag_data_element", _root(), ((Icc4.TagTable.TagDefinition.AToB1Tag) (this.tagDataElement))._root());
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.AToB1Tag) (this.tagDataElement))._parent(), this))
                                    throw new ConsistencyError("tag_data_element", this, ((Icc4.TagTable.TagDefinition.AToB1Tag) (this.tagDataElement))._parent());
                                break;
                            }
                            case A_TO_B_2: {
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.AToB2Tag) (this.tagDataElement))._root(), _root()))
                                    throw new ConsistencyError("tag_data_element", _root(), ((Icc4.TagTable.TagDefinition.AToB2Tag) (this.tagDataElement))._root());
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.AToB2Tag) (this.tagDataElement))._parent(), this))
                                    throw new ConsistencyError("tag_data_element", this, ((Icc4.TagTable.TagDefinition.AToB2Tag) (this.tagDataElement))._parent());
                                break;
                            }
                            case B_TO_A_0: {
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.BToA0Tag) (this.tagDataElement))._root(), _root()))
                                    throw new ConsistencyError("tag_data_element", _root(), ((Icc4.TagTable.TagDefinition.BToA0Tag) (this.tagDataElement))._root());
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.BToA0Tag) (this.tagDataElement))._parent(), this))
                                    throw new ConsistencyError("tag_data_element", this, ((Icc4.TagTable.TagDefinition.BToA0Tag) (this.tagDataElement))._parent());
                                break;
                            }
                            case B_TO_A_1: {
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.BToA1Tag) (this.tagDataElement))._root(), _root()))
                                    throw new ConsistencyError("tag_data_element", _root(), ((Icc4.TagTable.TagDefinition.BToA1Tag) (this.tagDataElement))._root());
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.BToA1Tag) (this.tagDataElement))._parent(), this))
                                    throw new ConsistencyError("tag_data_element", this, ((Icc4.TagTable.TagDefinition.BToA1Tag) (this.tagDataElement))._parent());
                                break;
                            }
                            case B_TO_A_2: {
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.BToA2Tag) (this.tagDataElement))._root(), _root()))
                                    throw new ConsistencyError("tag_data_element", _root(), ((Icc4.TagTable.TagDefinition.BToA2Tag) (this.tagDataElement))._root());
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.BToA2Tag) (this.tagDataElement))._parent(), this))
                                    throw new ConsistencyError("tag_data_element", this, ((Icc4.TagTable.TagDefinition.BToA2Tag) (this.tagDataElement))._parent());
                                break;
                            }
                            case B_TO_D_0: {
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.BToD0Tag) (this.tagDataElement))._root(), _root()))
                                    throw new ConsistencyError("tag_data_element", _root(), ((Icc4.TagTable.TagDefinition.BToD0Tag) (this.tagDataElement))._root());
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.BToD0Tag) (this.tagDataElement))._parent(), this))
                                    throw new ConsistencyError("tag_data_element", this, ((Icc4.TagTable.TagDefinition.BToD0Tag) (this.tagDataElement))._parent());
                                break;
                            }
                            case B_TO_D_1: {
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.BToD1Tag) (this.tagDataElement))._root(), _root()))
                                    throw new ConsistencyError("tag_data_element", _root(), ((Icc4.TagTable.TagDefinition.BToD1Tag) (this.tagDataElement))._root());
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.BToD1Tag) (this.tagDataElement))._parent(), this))
                                    throw new ConsistencyError("tag_data_element", this, ((Icc4.TagTable.TagDefinition.BToD1Tag) (this.tagDataElement))._parent());
                                break;
                            }
                            case B_TO_D_2: {
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.BToD2Tag) (this.tagDataElement))._root(), _root()))
                                    throw new ConsistencyError("tag_data_element", _root(), ((Icc4.TagTable.TagDefinition.BToD2Tag) (this.tagDataElement))._root());
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.BToD2Tag) (this.tagDataElement))._parent(), this))
                                    throw new ConsistencyError("tag_data_element", this, ((Icc4.TagTable.TagDefinition.BToD2Tag) (this.tagDataElement))._parent());
                                break;
                            }
                            case B_TO_D_3: {
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.BToD3Tag) (this.tagDataElement))._root(), _root()))
                                    throw new ConsistencyError("tag_data_element", _root(), ((Icc4.TagTable.TagDefinition.BToD3Tag) (this.tagDataElement))._root());
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.BToD3Tag) (this.tagDataElement))._parent(), this))
                                    throw new ConsistencyError("tag_data_element", this, ((Icc4.TagTable.TagDefinition.BToD3Tag) (this.tagDataElement))._parent());
                                break;
                            }
                            case BLUE_MATRIX_COLUMN: {
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.BlueMatrixColumnTag) (this.tagDataElement))._root(), _root()))
                                    throw new ConsistencyError("tag_data_element", _root(), ((Icc4.TagTable.TagDefinition.BlueMatrixColumnTag) (this.tagDataElement))._root());
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.BlueMatrixColumnTag) (this.tagDataElement))._parent(), this))
                                    throw new ConsistencyError("tag_data_element", this, ((Icc4.TagTable.TagDefinition.BlueMatrixColumnTag) (this.tagDataElement))._parent());
                                break;
                            }
                            case BLUE_TRC: {
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.BlueTrcTag) (this.tagDataElement))._root(), _root()))
                                    throw new ConsistencyError("tag_data_element", _root(), ((Icc4.TagTable.TagDefinition.BlueTrcTag) (this.tagDataElement))._root());
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.BlueTrcTag) (this.tagDataElement))._parent(), this))
                                    throw new ConsistencyError("tag_data_element", this, ((Icc4.TagTable.TagDefinition.BlueTrcTag) (this.tagDataElement))._parent());
                                break;
                            }
                            case CALIBRATION_DATE_TIME: {
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.CalibrationDateTimeTag) (this.tagDataElement))._root(), _root()))
                                    throw new ConsistencyError("tag_data_element", _root(), ((Icc4.TagTable.TagDefinition.CalibrationDateTimeTag) (this.tagDataElement))._root());
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.CalibrationDateTimeTag) (this.tagDataElement))._parent(), this))
                                    throw new ConsistencyError("tag_data_element", this, ((Icc4.TagTable.TagDefinition.CalibrationDateTimeTag) (this.tagDataElement))._parent());
                                break;
                            }
                            case CHAR_TARGET: {
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.CharTargetTag) (this.tagDataElement))._root(), _root()))
                                    throw new ConsistencyError("tag_data_element", _root(), ((Icc4.TagTable.TagDefinition.CharTargetTag) (this.tagDataElement))._root());
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.CharTargetTag) (this.tagDataElement))._parent(), this))
                                    throw new ConsistencyError("tag_data_element", this, ((Icc4.TagTable.TagDefinition.CharTargetTag) (this.tagDataElement))._parent());
                                break;
                            }
                            case CHROMATIC_ADAPTATION: {
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.ChromaticAdaptationTag) (this.tagDataElement))._root(), _root()))
                                    throw new ConsistencyError("tag_data_element", _root(), ((Icc4.TagTable.TagDefinition.ChromaticAdaptationTag) (this.tagDataElement))._root());
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.ChromaticAdaptationTag) (this.tagDataElement))._parent(), this))
                                    throw new ConsistencyError("tag_data_element", this, ((Icc4.TagTable.TagDefinition.ChromaticAdaptationTag) (this.tagDataElement))._parent());
                                break;
                            }
                            case CHROMATICITY: {
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.ChromaticityTag) (this.tagDataElement))._root(), _root()))
                                    throw new ConsistencyError("tag_data_element", _root(), ((Icc4.TagTable.TagDefinition.ChromaticityTag) (this.tagDataElement))._root());
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.ChromaticityTag) (this.tagDataElement))._parent(), this))
                                    throw new ConsistencyError("tag_data_element", this, ((Icc4.TagTable.TagDefinition.ChromaticityTag) (this.tagDataElement))._parent());
                                break;
                            }
                            case COLORANT_ORDER: {
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.ColorantOrderTag) (this.tagDataElement))._root(), _root()))
                                    throw new ConsistencyError("tag_data_element", _root(), ((Icc4.TagTable.TagDefinition.ColorantOrderTag) (this.tagDataElement))._root());
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.ColorantOrderTag) (this.tagDataElement))._parent(), this))
                                    throw new ConsistencyError("tag_data_element", this, ((Icc4.TagTable.TagDefinition.ColorantOrderTag) (this.tagDataElement))._parent());
                                break;
                            }
                            case COLORANT_TABLE: {
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.ColorantTableTag) (this.tagDataElement))._root(), _root()))
                                    throw new ConsistencyError("tag_data_element", _root(), ((Icc4.TagTable.TagDefinition.ColorantTableTag) (this.tagDataElement))._root());
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.ColorantTableTag) (this.tagDataElement))._parent(), this))
                                    throw new ConsistencyError("tag_data_element", this, ((Icc4.TagTable.TagDefinition.ColorantTableTag) (this.tagDataElement))._parent());
                                break;
                            }
                            case COLORANT_TABLE_OUT: {
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.ColorantTableOutTag) (this.tagDataElement))._root(), _root()))
                                    throw new ConsistencyError("tag_data_element", _root(), ((Icc4.TagTable.TagDefinition.ColorantTableOutTag) (this.tagDataElement))._root());
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.ColorantTableOutTag) (this.tagDataElement))._parent(), this))
                                    throw new ConsistencyError("tag_data_element", this, ((Icc4.TagTable.TagDefinition.ColorantTableOutTag) (this.tagDataElement))._parent());
                                break;
                            }
                            case COLORIMETRIC_INTENT_IMAGE_STATE: {
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.ColorimetricIntentImageStateTag) (this.tagDataElement))._root(), _root()))
                                    throw new ConsistencyError("tag_data_element", _root(), ((Icc4.TagTable.TagDefinition.ColorimetricIntentImageStateTag) (this.tagDataElement))._root());
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.ColorimetricIntentImageStateTag) (this.tagDataElement))._parent(), this))
                                    throw new ConsistencyError("tag_data_element", this, ((Icc4.TagTable.TagDefinition.ColorimetricIntentImageStateTag) (this.tagDataElement))._parent());
                                break;
                            }
                            case COPYRIGHT: {
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.CopyrightTag) (this.tagDataElement))._root(), _root()))
                                    throw new ConsistencyError("tag_data_element", _root(), ((Icc4.TagTable.TagDefinition.CopyrightTag) (this.tagDataElement))._root());
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.CopyrightTag) (this.tagDataElement))._parent(), this))
                                    throw new ConsistencyError("tag_data_element", this, ((Icc4.TagTable.TagDefinition.CopyrightTag) (this.tagDataElement))._parent());
                                break;
                            }
                            case D_TO_B_0: {
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.DToB0Tag) (this.tagDataElement))._root(), _root()))
                                    throw new ConsistencyError("tag_data_element", _root(), ((Icc4.TagTable.TagDefinition.DToB0Tag) (this.tagDataElement))._root());
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.DToB0Tag) (this.tagDataElement))._parent(), this))
                                    throw new ConsistencyError("tag_data_element", this, ((Icc4.TagTable.TagDefinition.DToB0Tag) (this.tagDataElement))._parent());
                                break;
                            }
                            case D_TO_B_1: {
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.DToB1Tag) (this.tagDataElement))._root(), _root()))
                                    throw new ConsistencyError("tag_data_element", _root(), ((Icc4.TagTable.TagDefinition.DToB1Tag) (this.tagDataElement))._root());
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.DToB1Tag) (this.tagDataElement))._parent(), this))
                                    throw new ConsistencyError("tag_data_element", this, ((Icc4.TagTable.TagDefinition.DToB1Tag) (this.tagDataElement))._parent());
                                break;
                            }
                            case D_TO_B_2: {
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.DToB2Tag) (this.tagDataElement))._root(), _root()))
                                    throw new ConsistencyError("tag_data_element", _root(), ((Icc4.TagTable.TagDefinition.DToB2Tag) (this.tagDataElement))._root());
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.DToB2Tag) (this.tagDataElement))._parent(), this))
                                    throw new ConsistencyError("tag_data_element", this, ((Icc4.TagTable.TagDefinition.DToB2Tag) (this.tagDataElement))._parent());
                                break;
                            }
                            case D_TO_B_3: {
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.DToB3Tag) (this.tagDataElement))._root(), _root()))
                                    throw new ConsistencyError("tag_data_element", _root(), ((Icc4.TagTable.TagDefinition.DToB3Tag) (this.tagDataElement))._root());
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.DToB3Tag) (this.tagDataElement))._parent(), this))
                                    throw new ConsistencyError("tag_data_element", this, ((Icc4.TagTable.TagDefinition.DToB3Tag) (this.tagDataElement))._parent());
                                break;
                            }
                            case DEVICE_MFG_DESC: {
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.DeviceMfgDescTag) (this.tagDataElement))._root(), _root()))
                                    throw new ConsistencyError("tag_data_element", _root(), ((Icc4.TagTable.TagDefinition.DeviceMfgDescTag) (this.tagDataElement))._root());
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.DeviceMfgDescTag) (this.tagDataElement))._parent(), this))
                                    throw new ConsistencyError("tag_data_element", this, ((Icc4.TagTable.TagDefinition.DeviceMfgDescTag) (this.tagDataElement))._parent());
                                break;
                            }
                            case DEVICE_MODEL_DESC: {
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.DeviceModelDescTag) (this.tagDataElement))._root(), _root()))
                                    throw new ConsistencyError("tag_data_element", _root(), ((Icc4.TagTable.TagDefinition.DeviceModelDescTag) (this.tagDataElement))._root());
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.DeviceModelDescTag) (this.tagDataElement))._parent(), this))
                                    throw new ConsistencyError("tag_data_element", this, ((Icc4.TagTable.TagDefinition.DeviceModelDescTag) (this.tagDataElement))._parent());
                                break;
                            }
                            case GAMUT: {
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.GamutTag) (this.tagDataElement))._root(), _root()))
                                    throw new ConsistencyError("tag_data_element", _root(), ((Icc4.TagTable.TagDefinition.GamutTag) (this.tagDataElement))._root());
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.GamutTag) (this.tagDataElement))._parent(), this))
                                    throw new ConsistencyError("tag_data_element", this, ((Icc4.TagTable.TagDefinition.GamutTag) (this.tagDataElement))._parent());
                                break;
                            }
                            case GRAY_TRC: {
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.GrayTrcTag) (this.tagDataElement))._root(), _root()))
                                    throw new ConsistencyError("tag_data_element", _root(), ((Icc4.TagTable.TagDefinition.GrayTrcTag) (this.tagDataElement))._root());
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.GrayTrcTag) (this.tagDataElement))._parent(), this))
                                    throw new ConsistencyError("tag_data_element", this, ((Icc4.TagTable.TagDefinition.GrayTrcTag) (this.tagDataElement))._parent());
                                break;
                            }
                            case GREEN_MATRIX_COLUMN: {
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.GreenMatrixColumnTag) (this.tagDataElement))._root(), _root()))
                                    throw new ConsistencyError("tag_data_element", _root(), ((Icc4.TagTable.TagDefinition.GreenMatrixColumnTag) (this.tagDataElement))._root());
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.GreenMatrixColumnTag) (this.tagDataElement))._parent(), this))
                                    throw new ConsistencyError("tag_data_element", this, ((Icc4.TagTable.TagDefinition.GreenMatrixColumnTag) (this.tagDataElement))._parent());
                                break;
                            }
                            case GREEN_TRC: {
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.GreenTrcTag) (this.tagDataElement))._root(), _root()))
                                    throw new ConsistencyError("tag_data_element", _root(), ((Icc4.TagTable.TagDefinition.GreenTrcTag) (this.tagDataElement))._root());
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.GreenTrcTag) (this.tagDataElement))._parent(), this))
                                    throw new ConsistencyError("tag_data_element", this, ((Icc4.TagTable.TagDefinition.GreenTrcTag) (this.tagDataElement))._parent());
                                break;
                            }
                            case LUMINANCE: {
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.LuminanceTag) (this.tagDataElement))._root(), _root()))
                                    throw new ConsistencyError("tag_data_element", _root(), ((Icc4.TagTable.TagDefinition.LuminanceTag) (this.tagDataElement))._root());
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.LuminanceTag) (this.tagDataElement))._parent(), this))
                                    throw new ConsistencyError("tag_data_element", this, ((Icc4.TagTable.TagDefinition.LuminanceTag) (this.tagDataElement))._parent());
                                break;
                            }
                            case MEASUREMENT: {
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.MeasurementTag) (this.tagDataElement))._root(), _root()))
                                    throw new ConsistencyError("tag_data_element", _root(), ((Icc4.TagTable.TagDefinition.MeasurementTag) (this.tagDataElement))._root());
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.MeasurementTag) (this.tagDataElement))._parent(), this))
                                    throw new ConsistencyError("tag_data_element", this, ((Icc4.TagTable.TagDefinition.MeasurementTag) (this.tagDataElement))._parent());
                                break;
                            }
                            case MEDIA_WHITE_POINT: {
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.MediaWhitePointTag) (this.tagDataElement))._root(), _root()))
                                    throw new ConsistencyError("tag_data_element", _root(), ((Icc4.TagTable.TagDefinition.MediaWhitePointTag) (this.tagDataElement))._root());
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.MediaWhitePointTag) (this.tagDataElement))._parent(), this))
                                    throw new ConsistencyError("tag_data_element", this, ((Icc4.TagTable.TagDefinition.MediaWhitePointTag) (this.tagDataElement))._parent());
                                break;
                            }
                            case NAMED_COLOR_2: {
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.NamedColor2Tag) (this.tagDataElement))._root(), _root()))
                                    throw new ConsistencyError("tag_data_element", _root(), ((Icc4.TagTable.TagDefinition.NamedColor2Tag) (this.tagDataElement))._root());
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.NamedColor2Tag) (this.tagDataElement))._parent(), this))
                                    throw new ConsistencyError("tag_data_element", this, ((Icc4.TagTable.TagDefinition.NamedColor2Tag) (this.tagDataElement))._parent());
                                break;
                            }
                            case OUTPUT_RESPONSE: {
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.OutputResponseTag) (this.tagDataElement))._root(), _root()))
                                    throw new ConsistencyError("tag_data_element", _root(), ((Icc4.TagTable.TagDefinition.OutputResponseTag) (this.tagDataElement))._root());
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.OutputResponseTag) (this.tagDataElement))._parent(), this))
                                    throw new ConsistencyError("tag_data_element", this, ((Icc4.TagTable.TagDefinition.OutputResponseTag) (this.tagDataElement))._parent());
                                break;
                            }
                            case PERCEPTUAL_RENDERING_INTENT_GAMUT: {
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.PerceptualRenderingIntentGamutTag) (this.tagDataElement))._root(), _root()))
                                    throw new ConsistencyError("tag_data_element", _root(), ((Icc4.TagTable.TagDefinition.PerceptualRenderingIntentGamutTag) (this.tagDataElement))._root());
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.PerceptualRenderingIntentGamutTag) (this.tagDataElement))._parent(), this))
                                    throw new ConsistencyError("tag_data_element", this, ((Icc4.TagTable.TagDefinition.PerceptualRenderingIntentGamutTag) (this.tagDataElement))._parent());
                                break;
                            }
                            case PREVIEW_0: {
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.Preview0Tag) (this.tagDataElement))._root(), _root()))
                                    throw new ConsistencyError("tag_data_element", _root(), ((Icc4.TagTable.TagDefinition.Preview0Tag) (this.tagDataElement))._root());
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.Preview0Tag) (this.tagDataElement))._parent(), this))
                                    throw new ConsistencyError("tag_data_element", this, ((Icc4.TagTable.TagDefinition.Preview0Tag) (this.tagDataElement))._parent());
                                break;
                            }
                            case PREVIEW_1: {
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.Preview1Tag) (this.tagDataElement))._root(), _root()))
                                    throw new ConsistencyError("tag_data_element", _root(), ((Icc4.TagTable.TagDefinition.Preview1Tag) (this.tagDataElement))._root());
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.Preview1Tag) (this.tagDataElement))._parent(), this))
                                    throw new ConsistencyError("tag_data_element", this, ((Icc4.TagTable.TagDefinition.Preview1Tag) (this.tagDataElement))._parent());
                                break;
                            }
                            case PREVIEW_2: {
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.Preview2Tag) (this.tagDataElement))._root(), _root()))
                                    throw new ConsistencyError("tag_data_element", _root(), ((Icc4.TagTable.TagDefinition.Preview2Tag) (this.tagDataElement))._root());
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.Preview2Tag) (this.tagDataElement))._parent(), this))
                                    throw new ConsistencyError("tag_data_element", this, ((Icc4.TagTable.TagDefinition.Preview2Tag) (this.tagDataElement))._parent());
                                break;
                            }
                            case PROFILE_DESCRIPTION: {
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.ProfileDescriptionTag) (this.tagDataElement))._root(), _root()))
                                    throw new ConsistencyError("tag_data_element", _root(), ((Icc4.TagTable.TagDefinition.ProfileDescriptionTag) (this.tagDataElement))._root());
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.ProfileDescriptionTag) (this.tagDataElement))._parent(), this))
                                    throw new ConsistencyError("tag_data_element", this, ((Icc4.TagTable.TagDefinition.ProfileDescriptionTag) (this.tagDataElement))._parent());
                                break;
                            }
                            case PROFILE_SEQUENCE: {
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.ProfileSequenceTag) (this.tagDataElement))._root(), _root()))
                                    throw new ConsistencyError("tag_data_element", _root(), ((Icc4.TagTable.TagDefinition.ProfileSequenceTag) (this.tagDataElement))._root());
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.ProfileSequenceTag) (this.tagDataElement))._parent(), this))
                                    throw new ConsistencyError("tag_data_element", this, ((Icc4.TagTable.TagDefinition.ProfileSequenceTag) (this.tagDataElement))._parent());
                                break;
                            }
                            case PROFILE_SEQUENCE_IDENTIFIER: {
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.ProfileSequenceIdentifierTag) (this.tagDataElement))._root(), _root()))
                                    throw new ConsistencyError("tag_data_element", _root(), ((Icc4.TagTable.TagDefinition.ProfileSequenceIdentifierTag) (this.tagDataElement))._root());
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.ProfileSequenceIdentifierTag) (this.tagDataElement))._parent(), this))
                                    throw new ConsistencyError("tag_data_element", this, ((Icc4.TagTable.TagDefinition.ProfileSequenceIdentifierTag) (this.tagDataElement))._parent());
                                break;
                            }
                            case RED_MATRIX_COLUMN: {
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.RedMatrixColumnTag) (this.tagDataElement))._root(), _root()))
                                    throw new ConsistencyError("tag_data_element", _root(), ((Icc4.TagTable.TagDefinition.RedMatrixColumnTag) (this.tagDataElement))._root());
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.RedMatrixColumnTag) (this.tagDataElement))._parent(), this))
                                    throw new ConsistencyError("tag_data_element", this, ((Icc4.TagTable.TagDefinition.RedMatrixColumnTag) (this.tagDataElement))._parent());
                                break;
                            }
                            case RED_TRC: {
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.RedTrcTag) (this.tagDataElement))._root(), _root()))
                                    throw new ConsistencyError("tag_data_element", _root(), ((Icc4.TagTable.TagDefinition.RedTrcTag) (this.tagDataElement))._root());
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.RedTrcTag) (this.tagDataElement))._parent(), this))
                                    throw new ConsistencyError("tag_data_element", this, ((Icc4.TagTable.TagDefinition.RedTrcTag) (this.tagDataElement))._parent());
                                break;
                            }
                            case SATURATION_RENDERING_INTENT_GAMUT: {
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.SaturationRenderingIntentGamutTag) (this.tagDataElement))._root(), _root()))
                                    throw new ConsistencyError("tag_data_element", _root(), ((Icc4.TagTable.TagDefinition.SaturationRenderingIntentGamutTag) (this.tagDataElement))._root());
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.SaturationRenderingIntentGamutTag) (this.tagDataElement))._parent(), this))
                                    throw new ConsistencyError("tag_data_element", this, ((Icc4.TagTable.TagDefinition.SaturationRenderingIntentGamutTag) (this.tagDataElement))._parent());
                                break;
                            }
                            case TECHNOLOGY: {
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.TechnologyTag) (this.tagDataElement))._root(), _root()))
                                    throw new ConsistencyError("tag_data_element", _root(), ((Icc4.TagTable.TagDefinition.TechnologyTag) (this.tagDataElement))._root());
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.TechnologyTag) (this.tagDataElement))._parent(), this))
                                    throw new ConsistencyError("tag_data_element", this, ((Icc4.TagTable.TagDefinition.TechnologyTag) (this.tagDataElement))._parent());
                                break;
                            }
                            case VIEWING_COND_DESC: {
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.ViewingCondDescTag) (this.tagDataElement))._root(), _root()))
                                    throw new ConsistencyError("tag_data_element", _root(), ((Icc4.TagTable.TagDefinition.ViewingCondDescTag) (this.tagDataElement))._root());
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.ViewingCondDescTag) (this.tagDataElement))._parent(), this))
                                    throw new ConsistencyError("tag_data_element", this, ((Icc4.TagTable.TagDefinition.ViewingCondDescTag) (this.tagDataElement))._parent());
                                break;
                            }
                            case VIEWING_CONDITIONS: {
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.ViewingConditionsTag) (this.tagDataElement))._root(), _root()))
                                    throw new ConsistencyError("tag_data_element", _root(), ((Icc4.TagTable.TagDefinition.ViewingConditionsTag) (this.tagDataElement))._root());
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.ViewingConditionsTag) (this.tagDataElement))._parent(), this))
                                    throw new ConsistencyError("tag_data_element", this, ((Icc4.TagTable.TagDefinition.ViewingConditionsTag) (this.tagDataElement))._parent());
                                break;
                            }
                            default: {
                                if (((byte[]) (this.tagDataElement)).length != sizeOfDataElement())
                                    throw new ConsistencyError("tag_data_element", sizeOfDataElement(), ((byte[]) (this.tagDataElement)).length);
                                break;
                            }
                            }
                        } else {
                            if (((byte[]) (this.tagDataElement)).length != sizeOfDataElement())
                                throw new ConsistencyError("tag_data_element", sizeOfDataElement(), ((byte[]) (this.tagDataElement)).length);
                        }
                    }
                }
                _dirty = false;
            }
            public static class AToB0Tag extends KaitaiStruct.ReadWrite {
                public static AToB0Tag fromFile(String fileName) throws IOException {
                    return new AToB0Tag(new ByteBufferKaitaiStream(fileName));
                }
                public AToB0Tag() {
                    this(null, null, null);
                }

                public AToB0Tag(KaitaiStream _io) {
                    this(_io, null, null);
                }

                public AToB0Tag(KaitaiStream _io, Icc4.TagTable.TagDefinition _parent) {
                    this(_io, _parent, null);
                }

                public AToB0Tag(KaitaiStream _io, Icc4.TagTable.TagDefinition _parent, Icc4 _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                }
                public void _read() {
                    this.tagType = Icc4.TagTable.TagDefinition.TagTypeSignatures.byId(this._io.readU4be());
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case MULTI_FUNCTION_A_TO_B_TABLE_TYPE: {
                                this.tagData = new LutAToBType(this._io, this, _root);
                                ((LutAToBType) (this.tagData))._read();
                                break;
                            }
                            case MULTI_FUNCTION_TABLE_WITH_ONE_BYTE_PRECISION_TYPE: {
                                this.tagData = new Lut8Type(this._io, this, _root);
                                ((Lut8Type) (this.tagData))._read();
                                break;
                            }
                            case MULTI_FUNCTION_TABLE_WITH_TWO_BYTE_PRECISION_TYPE: {
                                this.tagData = new Lut16Type(this._io, this, _root);
                                ((Lut16Type) (this.tagData))._read();
                                break;
                            }
                            }
                        }
                    }
                    _dirty = false;
                }

                public void _fetchInstances() {
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case MULTI_FUNCTION_A_TO_B_TABLE_TYPE: {
                                ((LutAToBType) (this.tagData))._fetchInstances();
                                break;
                            }
                            case MULTI_FUNCTION_TABLE_WITH_ONE_BYTE_PRECISION_TYPE: {
                                ((Lut8Type) (this.tagData))._fetchInstances();
                                break;
                            }
                            case MULTI_FUNCTION_TABLE_WITH_TWO_BYTE_PRECISION_TYPE: {
                                ((Lut16Type) (this.tagData))._fetchInstances();
                                break;
                            }
                            }
                        }
                    }
                }

                public void _write_Seq() {
                    _assertNotDirty();
                    this._io.writeU4be(((Number) (this.tagType.id())).longValue());
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case MULTI_FUNCTION_A_TO_B_TABLE_TYPE: {
                                ((LutAToBType) (this.tagData))._write_Seq(this._io);
                                break;
                            }
                            case MULTI_FUNCTION_TABLE_WITH_ONE_BYTE_PRECISION_TYPE: {
                                ((Lut8Type) (this.tagData))._write_Seq(this._io);
                                break;
                            }
                            case MULTI_FUNCTION_TABLE_WITH_TWO_BYTE_PRECISION_TYPE: {
                                ((Lut16Type) (this.tagData))._write_Seq(this._io);
                                break;
                            }
                            }
                        }
                    }
                }

                public void _check() {
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case MULTI_FUNCTION_A_TO_B_TABLE_TYPE: {
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.LutAToBType) (this.tagData))._root(), _root()))
                                    throw new ConsistencyError("tag_data", _root(), ((Icc4.TagTable.TagDefinition.LutAToBType) (this.tagData))._root());
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.LutAToBType) (this.tagData))._parent(), this))
                                    throw new ConsistencyError("tag_data", this, ((Icc4.TagTable.TagDefinition.LutAToBType) (this.tagData))._parent());
                                break;
                            }
                            case MULTI_FUNCTION_TABLE_WITH_ONE_BYTE_PRECISION_TYPE: {
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.Lut8Type) (this.tagData))._root(), _root()))
                                    throw new ConsistencyError("tag_data", _root(), ((Icc4.TagTable.TagDefinition.Lut8Type) (this.tagData))._root());
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.Lut8Type) (this.tagData))._parent(), this))
                                    throw new ConsistencyError("tag_data", this, ((Icc4.TagTable.TagDefinition.Lut8Type) (this.tagData))._parent());
                                break;
                            }
                            case MULTI_FUNCTION_TABLE_WITH_TWO_BYTE_PRECISION_TYPE: {
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.Lut16Type) (this.tagData))._root(), _root()))
                                    throw new ConsistencyError("tag_data", _root(), ((Icc4.TagTable.TagDefinition.Lut16Type) (this.tagData))._root());
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.Lut16Type) (this.tagData))._parent(), this))
                                    throw new ConsistencyError("tag_data", this, ((Icc4.TagTable.TagDefinition.Lut16Type) (this.tagData))._parent());
                                break;
                            }
                            }
                        }
                    }
                    _dirty = false;
                }
                private TagTypeSignatures tagType;
                private KaitaiStruct.ReadWrite tagData;
                private Icc4 _root;
                private Icc4.TagTable.TagDefinition _parent;
                public TagTypeSignatures tagType() { return tagType; }
                public void setTagType(TagTypeSignatures _v) { _dirty = true; tagType = _v; }
                public KaitaiStruct.ReadWrite tagData() { return tagData; }
                public void setTagData(KaitaiStruct.ReadWrite _v) { _dirty = true; tagData = _v; }
                public Icc4 _root() { return _root; }
                public void set_root(Icc4 _v) { _dirty = true; _root = _v; }
                public Icc4.TagTable.TagDefinition _parent() { return _parent; }
                public void set_parent(Icc4.TagTable.TagDefinition _v) { _dirty = true; _parent = _v; }
            }
            public static class AToB1Tag extends KaitaiStruct.ReadWrite {
                public static AToB1Tag fromFile(String fileName) throws IOException {
                    return new AToB1Tag(new ByteBufferKaitaiStream(fileName));
                }
                public AToB1Tag() {
                    this(null, null, null);
                }

                public AToB1Tag(KaitaiStream _io) {
                    this(_io, null, null);
                }

                public AToB1Tag(KaitaiStream _io, Icc4.TagTable.TagDefinition _parent) {
                    this(_io, _parent, null);
                }

                public AToB1Tag(KaitaiStream _io, Icc4.TagTable.TagDefinition _parent, Icc4 _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                }
                public void _read() {
                    this.tagType = Icc4.TagTable.TagDefinition.TagTypeSignatures.byId(this._io.readU4be());
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case MULTI_FUNCTION_A_TO_B_TABLE_TYPE: {
                                this.tagData = new LutAToBType(this._io, this, _root);
                                ((LutAToBType) (this.tagData))._read();
                                break;
                            }
                            case MULTI_FUNCTION_TABLE_WITH_ONE_BYTE_PRECISION_TYPE: {
                                this.tagData = new Lut8Type(this._io, this, _root);
                                ((Lut8Type) (this.tagData))._read();
                                break;
                            }
                            case MULTI_FUNCTION_TABLE_WITH_TWO_BYTE_PRECISION_TYPE: {
                                this.tagData = new Lut16Type(this._io, this, _root);
                                ((Lut16Type) (this.tagData))._read();
                                break;
                            }
                            }
                        }
                    }
                    _dirty = false;
                }

                public void _fetchInstances() {
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case MULTI_FUNCTION_A_TO_B_TABLE_TYPE: {
                                ((LutAToBType) (this.tagData))._fetchInstances();
                                break;
                            }
                            case MULTI_FUNCTION_TABLE_WITH_ONE_BYTE_PRECISION_TYPE: {
                                ((Lut8Type) (this.tagData))._fetchInstances();
                                break;
                            }
                            case MULTI_FUNCTION_TABLE_WITH_TWO_BYTE_PRECISION_TYPE: {
                                ((Lut16Type) (this.tagData))._fetchInstances();
                                break;
                            }
                            }
                        }
                    }
                }

                public void _write_Seq() {
                    _assertNotDirty();
                    this._io.writeU4be(((Number) (this.tagType.id())).longValue());
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case MULTI_FUNCTION_A_TO_B_TABLE_TYPE: {
                                ((LutAToBType) (this.tagData))._write_Seq(this._io);
                                break;
                            }
                            case MULTI_FUNCTION_TABLE_WITH_ONE_BYTE_PRECISION_TYPE: {
                                ((Lut8Type) (this.tagData))._write_Seq(this._io);
                                break;
                            }
                            case MULTI_FUNCTION_TABLE_WITH_TWO_BYTE_PRECISION_TYPE: {
                                ((Lut16Type) (this.tagData))._write_Seq(this._io);
                                break;
                            }
                            }
                        }
                    }
                }

                public void _check() {
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case MULTI_FUNCTION_A_TO_B_TABLE_TYPE: {
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.LutAToBType) (this.tagData))._root(), _root()))
                                    throw new ConsistencyError("tag_data", _root(), ((Icc4.TagTable.TagDefinition.LutAToBType) (this.tagData))._root());
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.LutAToBType) (this.tagData))._parent(), this))
                                    throw new ConsistencyError("tag_data", this, ((Icc4.TagTable.TagDefinition.LutAToBType) (this.tagData))._parent());
                                break;
                            }
                            case MULTI_FUNCTION_TABLE_WITH_ONE_BYTE_PRECISION_TYPE: {
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.Lut8Type) (this.tagData))._root(), _root()))
                                    throw new ConsistencyError("tag_data", _root(), ((Icc4.TagTable.TagDefinition.Lut8Type) (this.tagData))._root());
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.Lut8Type) (this.tagData))._parent(), this))
                                    throw new ConsistencyError("tag_data", this, ((Icc4.TagTable.TagDefinition.Lut8Type) (this.tagData))._parent());
                                break;
                            }
                            case MULTI_FUNCTION_TABLE_WITH_TWO_BYTE_PRECISION_TYPE: {
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.Lut16Type) (this.tagData))._root(), _root()))
                                    throw new ConsistencyError("tag_data", _root(), ((Icc4.TagTable.TagDefinition.Lut16Type) (this.tagData))._root());
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.Lut16Type) (this.tagData))._parent(), this))
                                    throw new ConsistencyError("tag_data", this, ((Icc4.TagTable.TagDefinition.Lut16Type) (this.tagData))._parent());
                                break;
                            }
                            }
                        }
                    }
                    _dirty = false;
                }
                private TagTypeSignatures tagType;
                private KaitaiStruct.ReadWrite tagData;
                private Icc4 _root;
                private Icc4.TagTable.TagDefinition _parent;
                public TagTypeSignatures tagType() { return tagType; }
                public void setTagType(TagTypeSignatures _v) { _dirty = true; tagType = _v; }
                public KaitaiStruct.ReadWrite tagData() { return tagData; }
                public void setTagData(KaitaiStruct.ReadWrite _v) { _dirty = true; tagData = _v; }
                public Icc4 _root() { return _root; }
                public void set_root(Icc4 _v) { _dirty = true; _root = _v; }
                public Icc4.TagTable.TagDefinition _parent() { return _parent; }
                public void set_parent(Icc4.TagTable.TagDefinition _v) { _dirty = true; _parent = _v; }
            }
            public static class AToB2Tag extends KaitaiStruct.ReadWrite {
                public static AToB2Tag fromFile(String fileName) throws IOException {
                    return new AToB2Tag(new ByteBufferKaitaiStream(fileName));
                }
                public AToB2Tag() {
                    this(null, null, null);
                }

                public AToB2Tag(KaitaiStream _io) {
                    this(_io, null, null);
                }

                public AToB2Tag(KaitaiStream _io, Icc4.TagTable.TagDefinition _parent) {
                    this(_io, _parent, null);
                }

                public AToB2Tag(KaitaiStream _io, Icc4.TagTable.TagDefinition _parent, Icc4 _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                }
                public void _read() {
                    this.tagType = Icc4.TagTable.TagDefinition.TagTypeSignatures.byId(this._io.readU4be());
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case MULTI_FUNCTION_A_TO_B_TABLE_TYPE: {
                                this.tagData = new LutAToBType(this._io, this, _root);
                                ((LutAToBType) (this.tagData))._read();
                                break;
                            }
                            case MULTI_FUNCTION_TABLE_WITH_ONE_BYTE_PRECISION_TYPE: {
                                this.tagData = new Lut8Type(this._io, this, _root);
                                ((Lut8Type) (this.tagData))._read();
                                break;
                            }
                            case MULTI_FUNCTION_TABLE_WITH_TWO_BYTE_PRECISION_TYPE: {
                                this.tagData = new Lut16Type(this._io, this, _root);
                                ((Lut16Type) (this.tagData))._read();
                                break;
                            }
                            }
                        }
                    }
                    _dirty = false;
                }

                public void _fetchInstances() {
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case MULTI_FUNCTION_A_TO_B_TABLE_TYPE: {
                                ((LutAToBType) (this.tagData))._fetchInstances();
                                break;
                            }
                            case MULTI_FUNCTION_TABLE_WITH_ONE_BYTE_PRECISION_TYPE: {
                                ((Lut8Type) (this.tagData))._fetchInstances();
                                break;
                            }
                            case MULTI_FUNCTION_TABLE_WITH_TWO_BYTE_PRECISION_TYPE: {
                                ((Lut16Type) (this.tagData))._fetchInstances();
                                break;
                            }
                            }
                        }
                    }
                }

                public void _write_Seq() {
                    _assertNotDirty();
                    this._io.writeU4be(((Number) (this.tagType.id())).longValue());
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case MULTI_FUNCTION_A_TO_B_TABLE_TYPE: {
                                ((LutAToBType) (this.tagData))._write_Seq(this._io);
                                break;
                            }
                            case MULTI_FUNCTION_TABLE_WITH_ONE_BYTE_PRECISION_TYPE: {
                                ((Lut8Type) (this.tagData))._write_Seq(this._io);
                                break;
                            }
                            case MULTI_FUNCTION_TABLE_WITH_TWO_BYTE_PRECISION_TYPE: {
                                ((Lut16Type) (this.tagData))._write_Seq(this._io);
                                break;
                            }
                            }
                        }
                    }
                }

                public void _check() {
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case MULTI_FUNCTION_A_TO_B_TABLE_TYPE: {
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.LutAToBType) (this.tagData))._root(), _root()))
                                    throw new ConsistencyError("tag_data", _root(), ((Icc4.TagTable.TagDefinition.LutAToBType) (this.tagData))._root());
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.LutAToBType) (this.tagData))._parent(), this))
                                    throw new ConsistencyError("tag_data", this, ((Icc4.TagTable.TagDefinition.LutAToBType) (this.tagData))._parent());
                                break;
                            }
                            case MULTI_FUNCTION_TABLE_WITH_ONE_BYTE_PRECISION_TYPE: {
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.Lut8Type) (this.tagData))._root(), _root()))
                                    throw new ConsistencyError("tag_data", _root(), ((Icc4.TagTable.TagDefinition.Lut8Type) (this.tagData))._root());
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.Lut8Type) (this.tagData))._parent(), this))
                                    throw new ConsistencyError("tag_data", this, ((Icc4.TagTable.TagDefinition.Lut8Type) (this.tagData))._parent());
                                break;
                            }
                            case MULTI_FUNCTION_TABLE_WITH_TWO_BYTE_PRECISION_TYPE: {
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.Lut16Type) (this.tagData))._root(), _root()))
                                    throw new ConsistencyError("tag_data", _root(), ((Icc4.TagTable.TagDefinition.Lut16Type) (this.tagData))._root());
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.Lut16Type) (this.tagData))._parent(), this))
                                    throw new ConsistencyError("tag_data", this, ((Icc4.TagTable.TagDefinition.Lut16Type) (this.tagData))._parent());
                                break;
                            }
                            }
                        }
                    }
                    _dirty = false;
                }
                private TagTypeSignatures tagType;
                private KaitaiStruct.ReadWrite tagData;
                private Icc4 _root;
                private Icc4.TagTable.TagDefinition _parent;
                public TagTypeSignatures tagType() { return tagType; }
                public void setTagType(TagTypeSignatures _v) { _dirty = true; tagType = _v; }
                public KaitaiStruct.ReadWrite tagData() { return tagData; }
                public void setTagData(KaitaiStruct.ReadWrite _v) { _dirty = true; tagData = _v; }
                public Icc4 _root() { return _root; }
                public void set_root(Icc4 _v) { _dirty = true; _root = _v; }
                public Icc4.TagTable.TagDefinition _parent() { return _parent; }
                public void set_parent(Icc4.TagTable.TagDefinition _v) { _dirty = true; _parent = _v; }
            }
            public static class BToA0Tag extends KaitaiStruct.ReadWrite {
                public static BToA0Tag fromFile(String fileName) throws IOException {
                    return new BToA0Tag(new ByteBufferKaitaiStream(fileName));
                }
                public BToA0Tag() {
                    this(null, null, null);
                }

                public BToA0Tag(KaitaiStream _io) {
                    this(_io, null, null);
                }

                public BToA0Tag(KaitaiStream _io, Icc4.TagTable.TagDefinition _parent) {
                    this(_io, _parent, null);
                }

                public BToA0Tag(KaitaiStream _io, Icc4.TagTable.TagDefinition _parent, Icc4 _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                }
                public void _read() {
                    this.tagType = Icc4.TagTable.TagDefinition.TagTypeSignatures.byId(this._io.readU4be());
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case MULTI_FUNCTION_B_TO_A_TABLE_TYPE: {
                                this.tagData = new LutBToAType(this._io, this, _root);
                                ((LutBToAType) (this.tagData))._read();
                                break;
                            }
                            case MULTI_FUNCTION_TABLE_WITH_ONE_BYTE_PRECISION_TYPE: {
                                this.tagData = new Lut8Type(this._io, this, _root);
                                ((Lut8Type) (this.tagData))._read();
                                break;
                            }
                            case MULTI_FUNCTION_TABLE_WITH_TWO_BYTE_PRECISION_TYPE: {
                                this.tagData = new Lut16Type(this._io, this, _root);
                                ((Lut16Type) (this.tagData))._read();
                                break;
                            }
                            }
                        }
                    }
                    _dirty = false;
                }

                public void _fetchInstances() {
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case MULTI_FUNCTION_B_TO_A_TABLE_TYPE: {
                                ((LutBToAType) (this.tagData))._fetchInstances();
                                break;
                            }
                            case MULTI_FUNCTION_TABLE_WITH_ONE_BYTE_PRECISION_TYPE: {
                                ((Lut8Type) (this.tagData))._fetchInstances();
                                break;
                            }
                            case MULTI_FUNCTION_TABLE_WITH_TWO_BYTE_PRECISION_TYPE: {
                                ((Lut16Type) (this.tagData))._fetchInstances();
                                break;
                            }
                            }
                        }
                    }
                }

                public void _write_Seq() {
                    _assertNotDirty();
                    this._io.writeU4be(((Number) (this.tagType.id())).longValue());
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case MULTI_FUNCTION_B_TO_A_TABLE_TYPE: {
                                ((LutBToAType) (this.tagData))._write_Seq(this._io);
                                break;
                            }
                            case MULTI_FUNCTION_TABLE_WITH_ONE_BYTE_PRECISION_TYPE: {
                                ((Lut8Type) (this.tagData))._write_Seq(this._io);
                                break;
                            }
                            case MULTI_FUNCTION_TABLE_WITH_TWO_BYTE_PRECISION_TYPE: {
                                ((Lut16Type) (this.tagData))._write_Seq(this._io);
                                break;
                            }
                            }
                        }
                    }
                }

                public void _check() {
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case MULTI_FUNCTION_B_TO_A_TABLE_TYPE: {
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.LutBToAType) (this.tagData))._root(), _root()))
                                    throw new ConsistencyError("tag_data", _root(), ((Icc4.TagTable.TagDefinition.LutBToAType) (this.tagData))._root());
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.LutBToAType) (this.tagData))._parent(), this))
                                    throw new ConsistencyError("tag_data", this, ((Icc4.TagTable.TagDefinition.LutBToAType) (this.tagData))._parent());
                                break;
                            }
                            case MULTI_FUNCTION_TABLE_WITH_ONE_BYTE_PRECISION_TYPE: {
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.Lut8Type) (this.tagData))._root(), _root()))
                                    throw new ConsistencyError("tag_data", _root(), ((Icc4.TagTable.TagDefinition.Lut8Type) (this.tagData))._root());
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.Lut8Type) (this.tagData))._parent(), this))
                                    throw new ConsistencyError("tag_data", this, ((Icc4.TagTable.TagDefinition.Lut8Type) (this.tagData))._parent());
                                break;
                            }
                            case MULTI_FUNCTION_TABLE_WITH_TWO_BYTE_PRECISION_TYPE: {
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.Lut16Type) (this.tagData))._root(), _root()))
                                    throw new ConsistencyError("tag_data", _root(), ((Icc4.TagTable.TagDefinition.Lut16Type) (this.tagData))._root());
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.Lut16Type) (this.tagData))._parent(), this))
                                    throw new ConsistencyError("tag_data", this, ((Icc4.TagTable.TagDefinition.Lut16Type) (this.tagData))._parent());
                                break;
                            }
                            }
                        }
                    }
                    _dirty = false;
                }
                private TagTypeSignatures tagType;
                private KaitaiStruct.ReadWrite tagData;
                private Icc4 _root;
                private Icc4.TagTable.TagDefinition _parent;
                public TagTypeSignatures tagType() { return tagType; }
                public void setTagType(TagTypeSignatures _v) { _dirty = true; tagType = _v; }
                public KaitaiStruct.ReadWrite tagData() { return tagData; }
                public void setTagData(KaitaiStruct.ReadWrite _v) { _dirty = true; tagData = _v; }
                public Icc4 _root() { return _root; }
                public void set_root(Icc4 _v) { _dirty = true; _root = _v; }
                public Icc4.TagTable.TagDefinition _parent() { return _parent; }
                public void set_parent(Icc4.TagTable.TagDefinition _v) { _dirty = true; _parent = _v; }
            }
            public static class BToA1Tag extends KaitaiStruct.ReadWrite {
                public static BToA1Tag fromFile(String fileName) throws IOException {
                    return new BToA1Tag(new ByteBufferKaitaiStream(fileName));
                }
                public BToA1Tag() {
                    this(null, null, null);
                }

                public BToA1Tag(KaitaiStream _io) {
                    this(_io, null, null);
                }

                public BToA1Tag(KaitaiStream _io, Icc4.TagTable.TagDefinition _parent) {
                    this(_io, _parent, null);
                }

                public BToA1Tag(KaitaiStream _io, Icc4.TagTable.TagDefinition _parent, Icc4 _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                }
                public void _read() {
                    this.tagType = Icc4.TagTable.TagDefinition.TagTypeSignatures.byId(this._io.readU4be());
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case MULTI_FUNCTION_B_TO_A_TABLE_TYPE: {
                                this.tagData = new LutBToAType(this._io, this, _root);
                                ((LutBToAType) (this.tagData))._read();
                                break;
                            }
                            case MULTI_FUNCTION_TABLE_WITH_ONE_BYTE_PRECISION_TYPE: {
                                this.tagData = new Lut8Type(this._io, this, _root);
                                ((Lut8Type) (this.tagData))._read();
                                break;
                            }
                            case MULTI_FUNCTION_TABLE_WITH_TWO_BYTE_PRECISION_TYPE: {
                                this.tagData = new Lut16Type(this._io, this, _root);
                                ((Lut16Type) (this.tagData))._read();
                                break;
                            }
                            }
                        }
                    }
                    _dirty = false;
                }

                public void _fetchInstances() {
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case MULTI_FUNCTION_B_TO_A_TABLE_TYPE: {
                                ((LutBToAType) (this.tagData))._fetchInstances();
                                break;
                            }
                            case MULTI_FUNCTION_TABLE_WITH_ONE_BYTE_PRECISION_TYPE: {
                                ((Lut8Type) (this.tagData))._fetchInstances();
                                break;
                            }
                            case MULTI_FUNCTION_TABLE_WITH_TWO_BYTE_PRECISION_TYPE: {
                                ((Lut16Type) (this.tagData))._fetchInstances();
                                break;
                            }
                            }
                        }
                    }
                }

                public void _write_Seq() {
                    _assertNotDirty();
                    this._io.writeU4be(((Number) (this.tagType.id())).longValue());
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case MULTI_FUNCTION_B_TO_A_TABLE_TYPE: {
                                ((LutBToAType) (this.tagData))._write_Seq(this._io);
                                break;
                            }
                            case MULTI_FUNCTION_TABLE_WITH_ONE_BYTE_PRECISION_TYPE: {
                                ((Lut8Type) (this.tagData))._write_Seq(this._io);
                                break;
                            }
                            case MULTI_FUNCTION_TABLE_WITH_TWO_BYTE_PRECISION_TYPE: {
                                ((Lut16Type) (this.tagData))._write_Seq(this._io);
                                break;
                            }
                            }
                        }
                    }
                }

                public void _check() {
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case MULTI_FUNCTION_B_TO_A_TABLE_TYPE: {
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.LutBToAType) (this.tagData))._root(), _root()))
                                    throw new ConsistencyError("tag_data", _root(), ((Icc4.TagTable.TagDefinition.LutBToAType) (this.tagData))._root());
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.LutBToAType) (this.tagData))._parent(), this))
                                    throw new ConsistencyError("tag_data", this, ((Icc4.TagTable.TagDefinition.LutBToAType) (this.tagData))._parent());
                                break;
                            }
                            case MULTI_FUNCTION_TABLE_WITH_ONE_BYTE_PRECISION_TYPE: {
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.Lut8Type) (this.tagData))._root(), _root()))
                                    throw new ConsistencyError("tag_data", _root(), ((Icc4.TagTable.TagDefinition.Lut8Type) (this.tagData))._root());
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.Lut8Type) (this.tagData))._parent(), this))
                                    throw new ConsistencyError("tag_data", this, ((Icc4.TagTable.TagDefinition.Lut8Type) (this.tagData))._parent());
                                break;
                            }
                            case MULTI_FUNCTION_TABLE_WITH_TWO_BYTE_PRECISION_TYPE: {
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.Lut16Type) (this.tagData))._root(), _root()))
                                    throw new ConsistencyError("tag_data", _root(), ((Icc4.TagTable.TagDefinition.Lut16Type) (this.tagData))._root());
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.Lut16Type) (this.tagData))._parent(), this))
                                    throw new ConsistencyError("tag_data", this, ((Icc4.TagTable.TagDefinition.Lut16Type) (this.tagData))._parent());
                                break;
                            }
                            }
                        }
                    }
                    _dirty = false;
                }
                private TagTypeSignatures tagType;
                private KaitaiStruct.ReadWrite tagData;
                private Icc4 _root;
                private Icc4.TagTable.TagDefinition _parent;
                public TagTypeSignatures tagType() { return tagType; }
                public void setTagType(TagTypeSignatures _v) { _dirty = true; tagType = _v; }
                public KaitaiStruct.ReadWrite tagData() { return tagData; }
                public void setTagData(KaitaiStruct.ReadWrite _v) { _dirty = true; tagData = _v; }
                public Icc4 _root() { return _root; }
                public void set_root(Icc4 _v) { _dirty = true; _root = _v; }
                public Icc4.TagTable.TagDefinition _parent() { return _parent; }
                public void set_parent(Icc4.TagTable.TagDefinition _v) { _dirty = true; _parent = _v; }
            }
            public static class BToA2Tag extends KaitaiStruct.ReadWrite {
                public static BToA2Tag fromFile(String fileName) throws IOException {
                    return new BToA2Tag(new ByteBufferKaitaiStream(fileName));
                }
                public BToA2Tag() {
                    this(null, null, null);
                }

                public BToA2Tag(KaitaiStream _io) {
                    this(_io, null, null);
                }

                public BToA2Tag(KaitaiStream _io, Icc4.TagTable.TagDefinition _parent) {
                    this(_io, _parent, null);
                }

                public BToA2Tag(KaitaiStream _io, Icc4.TagTable.TagDefinition _parent, Icc4 _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                }
                public void _read() {
                    this.tagType = Icc4.TagTable.TagDefinition.TagTypeSignatures.byId(this._io.readU4be());
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case MULTI_FUNCTION_B_TO_A_TABLE_TYPE: {
                                this.tagData = new LutBToAType(this._io, this, _root);
                                ((LutBToAType) (this.tagData))._read();
                                break;
                            }
                            case MULTI_FUNCTION_TABLE_WITH_ONE_BYTE_PRECISION_TYPE: {
                                this.tagData = new Lut8Type(this._io, this, _root);
                                ((Lut8Type) (this.tagData))._read();
                                break;
                            }
                            case MULTI_FUNCTION_TABLE_WITH_TWO_BYTE_PRECISION_TYPE: {
                                this.tagData = new Lut16Type(this._io, this, _root);
                                ((Lut16Type) (this.tagData))._read();
                                break;
                            }
                            }
                        }
                    }
                    _dirty = false;
                }

                public void _fetchInstances() {
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case MULTI_FUNCTION_B_TO_A_TABLE_TYPE: {
                                ((LutBToAType) (this.tagData))._fetchInstances();
                                break;
                            }
                            case MULTI_FUNCTION_TABLE_WITH_ONE_BYTE_PRECISION_TYPE: {
                                ((Lut8Type) (this.tagData))._fetchInstances();
                                break;
                            }
                            case MULTI_FUNCTION_TABLE_WITH_TWO_BYTE_PRECISION_TYPE: {
                                ((Lut16Type) (this.tagData))._fetchInstances();
                                break;
                            }
                            }
                        }
                    }
                }

                public void _write_Seq() {
                    _assertNotDirty();
                    this._io.writeU4be(((Number) (this.tagType.id())).longValue());
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case MULTI_FUNCTION_B_TO_A_TABLE_TYPE: {
                                ((LutBToAType) (this.tagData))._write_Seq(this._io);
                                break;
                            }
                            case MULTI_FUNCTION_TABLE_WITH_ONE_BYTE_PRECISION_TYPE: {
                                ((Lut8Type) (this.tagData))._write_Seq(this._io);
                                break;
                            }
                            case MULTI_FUNCTION_TABLE_WITH_TWO_BYTE_PRECISION_TYPE: {
                                ((Lut16Type) (this.tagData))._write_Seq(this._io);
                                break;
                            }
                            }
                        }
                    }
                }

                public void _check() {
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case MULTI_FUNCTION_B_TO_A_TABLE_TYPE: {
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.LutBToAType) (this.tagData))._root(), _root()))
                                    throw new ConsistencyError("tag_data", _root(), ((Icc4.TagTable.TagDefinition.LutBToAType) (this.tagData))._root());
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.LutBToAType) (this.tagData))._parent(), this))
                                    throw new ConsistencyError("tag_data", this, ((Icc4.TagTable.TagDefinition.LutBToAType) (this.tagData))._parent());
                                break;
                            }
                            case MULTI_FUNCTION_TABLE_WITH_ONE_BYTE_PRECISION_TYPE: {
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.Lut8Type) (this.tagData))._root(), _root()))
                                    throw new ConsistencyError("tag_data", _root(), ((Icc4.TagTable.TagDefinition.Lut8Type) (this.tagData))._root());
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.Lut8Type) (this.tagData))._parent(), this))
                                    throw new ConsistencyError("tag_data", this, ((Icc4.TagTable.TagDefinition.Lut8Type) (this.tagData))._parent());
                                break;
                            }
                            case MULTI_FUNCTION_TABLE_WITH_TWO_BYTE_PRECISION_TYPE: {
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.Lut16Type) (this.tagData))._root(), _root()))
                                    throw new ConsistencyError("tag_data", _root(), ((Icc4.TagTable.TagDefinition.Lut16Type) (this.tagData))._root());
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.Lut16Type) (this.tagData))._parent(), this))
                                    throw new ConsistencyError("tag_data", this, ((Icc4.TagTable.TagDefinition.Lut16Type) (this.tagData))._parent());
                                break;
                            }
                            }
                        }
                    }
                    _dirty = false;
                }
                private TagTypeSignatures tagType;
                private KaitaiStruct.ReadWrite tagData;
                private Icc4 _root;
                private Icc4.TagTable.TagDefinition _parent;
                public TagTypeSignatures tagType() { return tagType; }
                public void setTagType(TagTypeSignatures _v) { _dirty = true; tagType = _v; }
                public KaitaiStruct.ReadWrite tagData() { return tagData; }
                public void setTagData(KaitaiStruct.ReadWrite _v) { _dirty = true; tagData = _v; }
                public Icc4 _root() { return _root; }
                public void set_root(Icc4 _v) { _dirty = true; _root = _v; }
                public Icc4.TagTable.TagDefinition _parent() { return _parent; }
                public void set_parent(Icc4.TagTable.TagDefinition _v) { _dirty = true; _parent = _v; }
            }
            public static class BToD0Tag extends KaitaiStruct.ReadWrite {
                public static BToD0Tag fromFile(String fileName) throws IOException {
                    return new BToD0Tag(new ByteBufferKaitaiStream(fileName));
                }
                public BToD0Tag() {
                    this(null, null, null);
                }

                public BToD0Tag(KaitaiStream _io) {
                    this(_io, null, null);
                }

                public BToD0Tag(KaitaiStream _io, Icc4.TagTable.TagDefinition _parent) {
                    this(_io, _parent, null);
                }

                public BToD0Tag(KaitaiStream _io, Icc4.TagTable.TagDefinition _parent, Icc4 _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                }
                public void _read() {
                    this.tagType = Icc4.TagTable.TagDefinition.TagTypeSignatures.byId(this._io.readU4be());
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case MULTI_PROCESS_ELEMENTS_TYPE: {
                                this.tagData = new MultiProcessElementsType(this._io, this, _root);
                                this.tagData._read();
                                break;
                            }
                            }
                        }
                    }
                    _dirty = false;
                }

                public void _fetchInstances() {
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case MULTI_PROCESS_ELEMENTS_TYPE: {
                                this.tagData._fetchInstances();
                                break;
                            }
                            }
                        }
                    }
                }

                public void _write_Seq() {
                    _assertNotDirty();
                    this._io.writeU4be(((Number) (this.tagType.id())).longValue());
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case MULTI_PROCESS_ELEMENTS_TYPE: {
                                this.tagData._write_Seq(this._io);
                                break;
                            }
                            }
                        }
                    }
                }

                public void _check() {
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case MULTI_PROCESS_ELEMENTS_TYPE: {
                                if (!Objects.equals(this.tagData._root(), _root()))
                                    throw new ConsistencyError("tag_data", _root(), this.tagData._root());
                                if (!Objects.equals(this.tagData._parent(), this))
                                    throw new ConsistencyError("tag_data", this, this.tagData._parent());
                                break;
                            }
                            }
                        }
                    }
                    _dirty = false;
                }
                private TagTypeSignatures tagType;
                private MultiProcessElementsType tagData;
                private Icc4 _root;
                private Icc4.TagTable.TagDefinition _parent;
                public TagTypeSignatures tagType() { return tagType; }
                public void setTagType(TagTypeSignatures _v) { _dirty = true; tagType = _v; }
                public MultiProcessElementsType tagData() { return tagData; }
                public void setTagData(MultiProcessElementsType _v) { _dirty = true; tagData = _v; }
                public Icc4 _root() { return _root; }
                public void set_root(Icc4 _v) { _dirty = true; _root = _v; }
                public Icc4.TagTable.TagDefinition _parent() { return _parent; }
                public void set_parent(Icc4.TagTable.TagDefinition _v) { _dirty = true; _parent = _v; }
            }
            public static class BToD1Tag extends KaitaiStruct.ReadWrite {
                public static BToD1Tag fromFile(String fileName) throws IOException {
                    return new BToD1Tag(new ByteBufferKaitaiStream(fileName));
                }
                public BToD1Tag() {
                    this(null, null, null);
                }

                public BToD1Tag(KaitaiStream _io) {
                    this(_io, null, null);
                }

                public BToD1Tag(KaitaiStream _io, Icc4.TagTable.TagDefinition _parent) {
                    this(_io, _parent, null);
                }

                public BToD1Tag(KaitaiStream _io, Icc4.TagTable.TagDefinition _parent, Icc4 _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                }
                public void _read() {
                    this.tagType = Icc4.TagTable.TagDefinition.TagTypeSignatures.byId(this._io.readU4be());
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case MULTI_PROCESS_ELEMENTS_TYPE: {
                                this.tagData = new MultiProcessElementsType(this._io, this, _root);
                                this.tagData._read();
                                break;
                            }
                            }
                        }
                    }
                    _dirty = false;
                }

                public void _fetchInstances() {
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case MULTI_PROCESS_ELEMENTS_TYPE: {
                                this.tagData._fetchInstances();
                                break;
                            }
                            }
                        }
                    }
                }

                public void _write_Seq() {
                    _assertNotDirty();
                    this._io.writeU4be(((Number) (this.tagType.id())).longValue());
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case MULTI_PROCESS_ELEMENTS_TYPE: {
                                this.tagData._write_Seq(this._io);
                                break;
                            }
                            }
                        }
                    }
                }

                public void _check() {
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case MULTI_PROCESS_ELEMENTS_TYPE: {
                                if (!Objects.equals(this.tagData._root(), _root()))
                                    throw new ConsistencyError("tag_data", _root(), this.tagData._root());
                                if (!Objects.equals(this.tagData._parent(), this))
                                    throw new ConsistencyError("tag_data", this, this.tagData._parent());
                                break;
                            }
                            }
                        }
                    }
                    _dirty = false;
                }
                private TagTypeSignatures tagType;
                private MultiProcessElementsType tagData;
                private Icc4 _root;
                private Icc4.TagTable.TagDefinition _parent;
                public TagTypeSignatures tagType() { return tagType; }
                public void setTagType(TagTypeSignatures _v) { _dirty = true; tagType = _v; }
                public MultiProcessElementsType tagData() { return tagData; }
                public void setTagData(MultiProcessElementsType _v) { _dirty = true; tagData = _v; }
                public Icc4 _root() { return _root; }
                public void set_root(Icc4 _v) { _dirty = true; _root = _v; }
                public Icc4.TagTable.TagDefinition _parent() { return _parent; }
                public void set_parent(Icc4.TagTable.TagDefinition _v) { _dirty = true; _parent = _v; }
            }
            public static class BToD2Tag extends KaitaiStruct.ReadWrite {
                public static BToD2Tag fromFile(String fileName) throws IOException {
                    return new BToD2Tag(new ByteBufferKaitaiStream(fileName));
                }
                public BToD2Tag() {
                    this(null, null, null);
                }

                public BToD2Tag(KaitaiStream _io) {
                    this(_io, null, null);
                }

                public BToD2Tag(KaitaiStream _io, Icc4.TagTable.TagDefinition _parent) {
                    this(_io, _parent, null);
                }

                public BToD2Tag(KaitaiStream _io, Icc4.TagTable.TagDefinition _parent, Icc4 _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                }
                public void _read() {
                    this.tagType = Icc4.TagTable.TagDefinition.TagTypeSignatures.byId(this._io.readU4be());
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case MULTI_PROCESS_ELEMENTS_TYPE: {
                                this.tagData = new MultiProcessElementsType(this._io, this, _root);
                                this.tagData._read();
                                break;
                            }
                            }
                        }
                    }
                    _dirty = false;
                }

                public void _fetchInstances() {
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case MULTI_PROCESS_ELEMENTS_TYPE: {
                                this.tagData._fetchInstances();
                                break;
                            }
                            }
                        }
                    }
                }

                public void _write_Seq() {
                    _assertNotDirty();
                    this._io.writeU4be(((Number) (this.tagType.id())).longValue());
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case MULTI_PROCESS_ELEMENTS_TYPE: {
                                this.tagData._write_Seq(this._io);
                                break;
                            }
                            }
                        }
                    }
                }

                public void _check() {
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case MULTI_PROCESS_ELEMENTS_TYPE: {
                                if (!Objects.equals(this.tagData._root(), _root()))
                                    throw new ConsistencyError("tag_data", _root(), this.tagData._root());
                                if (!Objects.equals(this.tagData._parent(), this))
                                    throw new ConsistencyError("tag_data", this, this.tagData._parent());
                                break;
                            }
                            }
                        }
                    }
                    _dirty = false;
                }
                private TagTypeSignatures tagType;
                private MultiProcessElementsType tagData;
                private Icc4 _root;
                private Icc4.TagTable.TagDefinition _parent;
                public TagTypeSignatures tagType() { return tagType; }
                public void setTagType(TagTypeSignatures _v) { _dirty = true; tagType = _v; }
                public MultiProcessElementsType tagData() { return tagData; }
                public void setTagData(MultiProcessElementsType _v) { _dirty = true; tagData = _v; }
                public Icc4 _root() { return _root; }
                public void set_root(Icc4 _v) { _dirty = true; _root = _v; }
                public Icc4.TagTable.TagDefinition _parent() { return _parent; }
                public void set_parent(Icc4.TagTable.TagDefinition _v) { _dirty = true; _parent = _v; }
            }
            public static class BToD3Tag extends KaitaiStruct.ReadWrite {
                public static BToD3Tag fromFile(String fileName) throws IOException {
                    return new BToD3Tag(new ByteBufferKaitaiStream(fileName));
                }
                public BToD3Tag() {
                    this(null, null, null);
                }

                public BToD3Tag(KaitaiStream _io) {
                    this(_io, null, null);
                }

                public BToD3Tag(KaitaiStream _io, Icc4.TagTable.TagDefinition _parent) {
                    this(_io, _parent, null);
                }

                public BToD3Tag(KaitaiStream _io, Icc4.TagTable.TagDefinition _parent, Icc4 _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                }
                public void _read() {
                    this.tagType = Icc4.TagTable.TagDefinition.TagTypeSignatures.byId(this._io.readU4be());
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case MULTI_PROCESS_ELEMENTS_TYPE: {
                                this.tagData = new MultiProcessElementsType(this._io, this, _root);
                                this.tagData._read();
                                break;
                            }
                            }
                        }
                    }
                    _dirty = false;
                }

                public void _fetchInstances() {
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case MULTI_PROCESS_ELEMENTS_TYPE: {
                                this.tagData._fetchInstances();
                                break;
                            }
                            }
                        }
                    }
                }

                public void _write_Seq() {
                    _assertNotDirty();
                    this._io.writeU4be(((Number) (this.tagType.id())).longValue());
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case MULTI_PROCESS_ELEMENTS_TYPE: {
                                this.tagData._write_Seq(this._io);
                                break;
                            }
                            }
                        }
                    }
                }

                public void _check() {
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case MULTI_PROCESS_ELEMENTS_TYPE: {
                                if (!Objects.equals(this.tagData._root(), _root()))
                                    throw new ConsistencyError("tag_data", _root(), this.tagData._root());
                                if (!Objects.equals(this.tagData._parent(), this))
                                    throw new ConsistencyError("tag_data", this, this.tagData._parent());
                                break;
                            }
                            }
                        }
                    }
                    _dirty = false;
                }
                private TagTypeSignatures tagType;
                private MultiProcessElementsType tagData;
                private Icc4 _root;
                private Icc4.TagTable.TagDefinition _parent;
                public TagTypeSignatures tagType() { return tagType; }
                public void setTagType(TagTypeSignatures _v) { _dirty = true; tagType = _v; }
                public MultiProcessElementsType tagData() { return tagData; }
                public void setTagData(MultiProcessElementsType _v) { _dirty = true; tagData = _v; }
                public Icc4 _root() { return _root; }
                public void set_root(Icc4 _v) { _dirty = true; _root = _v; }
                public Icc4.TagTable.TagDefinition _parent() { return _parent; }
                public void set_parent(Icc4.TagTable.TagDefinition _v) { _dirty = true; _parent = _v; }
            }
            public static class BlueMatrixColumnTag extends KaitaiStruct.ReadWrite {
                public static BlueMatrixColumnTag fromFile(String fileName) throws IOException {
                    return new BlueMatrixColumnTag(new ByteBufferKaitaiStream(fileName));
                }
                public BlueMatrixColumnTag() {
                    this(null, null, null);
                }

                public BlueMatrixColumnTag(KaitaiStream _io) {
                    this(_io, null, null);
                }

                public BlueMatrixColumnTag(KaitaiStream _io, Icc4.TagTable.TagDefinition _parent) {
                    this(_io, _parent, null);
                }

                public BlueMatrixColumnTag(KaitaiStream _io, Icc4.TagTable.TagDefinition _parent, Icc4 _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                }
                public void _read() {
                    this.tagType = Icc4.TagTable.TagDefinition.TagTypeSignatures.byId(this._io.readU4be());
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case XYZ_TYPE: {
                                this.tagData = new XyzType(this._io, this, _root);
                                this.tagData._read();
                                break;
                            }
                            }
                        }
                    }
                    _dirty = false;
                }

                public void _fetchInstances() {
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case XYZ_TYPE: {
                                this.tagData._fetchInstances();
                                break;
                            }
                            }
                        }
                    }
                }

                public void _write_Seq() {
                    _assertNotDirty();
                    this._io.writeU4be(((Number) (this.tagType.id())).longValue());
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case XYZ_TYPE: {
                                this.tagData._write_Seq(this._io);
                                break;
                            }
                            }
                        }
                    }
                }

                public void _check() {
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case XYZ_TYPE: {
                                if (!Objects.equals(this.tagData._root(), _root()))
                                    throw new ConsistencyError("tag_data", _root(), this.tagData._root());
                                if (!Objects.equals(this.tagData._parent(), this))
                                    throw new ConsistencyError("tag_data", this, this.tagData._parent());
                                break;
                            }
                            }
                        }
                    }
                    _dirty = false;
                }
                private TagTypeSignatures tagType;
                private XyzType tagData;
                private Icc4 _root;
                private Icc4.TagTable.TagDefinition _parent;
                public TagTypeSignatures tagType() { return tagType; }
                public void setTagType(TagTypeSignatures _v) { _dirty = true; tagType = _v; }
                public XyzType tagData() { return tagData; }
                public void setTagData(XyzType _v) { _dirty = true; tagData = _v; }
                public Icc4 _root() { return _root; }
                public void set_root(Icc4 _v) { _dirty = true; _root = _v; }
                public Icc4.TagTable.TagDefinition _parent() { return _parent; }
                public void set_parent(Icc4.TagTable.TagDefinition _v) { _dirty = true; _parent = _v; }
            }
            public static class BlueTrcTag extends KaitaiStruct.ReadWrite {
                public static BlueTrcTag fromFile(String fileName) throws IOException {
                    return new BlueTrcTag(new ByteBufferKaitaiStream(fileName));
                }
                public BlueTrcTag() {
                    this(null, null, null);
                }

                public BlueTrcTag(KaitaiStream _io) {
                    this(_io, null, null);
                }

                public BlueTrcTag(KaitaiStream _io, Icc4.TagTable.TagDefinition _parent) {
                    this(_io, _parent, null);
                }

                public BlueTrcTag(KaitaiStream _io, Icc4.TagTable.TagDefinition _parent, Icc4 _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                }
                public void _read() {
                    this.tagType = Icc4.TagTable.TagDefinition.TagTypeSignatures.byId(this._io.readU4be());
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case CURVE_TYPE: {
                                this.tagData = new CurveType(this._io, this, _root);
                                ((CurveType) (this.tagData))._read();
                                break;
                            }
                            case PARAMETRIC_CURVE_TYPE: {
                                this.tagData = new ParametricCurveType(this._io, this, _root);
                                ((ParametricCurveType) (this.tagData))._read();
                                break;
                            }
                            }
                        }
                    }
                    _dirty = false;
                }

                public void _fetchInstances() {
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case CURVE_TYPE: {
                                ((CurveType) (this.tagData))._fetchInstances();
                                break;
                            }
                            case PARAMETRIC_CURVE_TYPE: {
                                ((ParametricCurveType) (this.tagData))._fetchInstances();
                                break;
                            }
                            }
                        }
                    }
                }

                public void _write_Seq() {
                    _assertNotDirty();
                    this._io.writeU4be(((Number) (this.tagType.id())).longValue());
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case CURVE_TYPE: {
                                ((CurveType) (this.tagData))._write_Seq(this._io);
                                break;
                            }
                            case PARAMETRIC_CURVE_TYPE: {
                                ((ParametricCurveType) (this.tagData))._write_Seq(this._io);
                                break;
                            }
                            }
                        }
                    }
                }

                public void _check() {
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case CURVE_TYPE: {
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.CurveType) (this.tagData))._root(), _root()))
                                    throw new ConsistencyError("tag_data", _root(), ((Icc4.TagTable.TagDefinition.CurveType) (this.tagData))._root());
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.CurveType) (this.tagData))._parent(), this))
                                    throw new ConsistencyError("tag_data", this, ((Icc4.TagTable.TagDefinition.CurveType) (this.tagData))._parent());
                                break;
                            }
                            case PARAMETRIC_CURVE_TYPE: {
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.ParametricCurveType) (this.tagData))._root(), _root()))
                                    throw new ConsistencyError("tag_data", _root(), ((Icc4.TagTable.TagDefinition.ParametricCurveType) (this.tagData))._root());
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.ParametricCurveType) (this.tagData))._parent(), this))
                                    throw new ConsistencyError("tag_data", this, ((Icc4.TagTable.TagDefinition.ParametricCurveType) (this.tagData))._parent());
                                break;
                            }
                            }
                        }
                    }
                    _dirty = false;
                }
                private TagTypeSignatures tagType;
                private KaitaiStruct.ReadWrite tagData;
                private Icc4 _root;
                private Icc4.TagTable.TagDefinition _parent;
                public TagTypeSignatures tagType() { return tagType; }
                public void setTagType(TagTypeSignatures _v) { _dirty = true; tagType = _v; }
                public KaitaiStruct.ReadWrite tagData() { return tagData; }
                public void setTagData(KaitaiStruct.ReadWrite _v) { _dirty = true; tagData = _v; }
                public Icc4 _root() { return _root; }
                public void set_root(Icc4 _v) { _dirty = true; _root = _v; }
                public Icc4.TagTable.TagDefinition _parent() { return _parent; }
                public void set_parent(Icc4.TagTable.TagDefinition _v) { _dirty = true; _parent = _v; }
            }
            public static class CalibrationDateTimeTag extends KaitaiStruct.ReadWrite {
                public static CalibrationDateTimeTag fromFile(String fileName) throws IOException {
                    return new CalibrationDateTimeTag(new ByteBufferKaitaiStream(fileName));
                }
                public CalibrationDateTimeTag() {
                    this(null, null, null);
                }

                public CalibrationDateTimeTag(KaitaiStream _io) {
                    this(_io, null, null);
                }

                public CalibrationDateTimeTag(KaitaiStream _io, Icc4.TagTable.TagDefinition _parent) {
                    this(_io, _parent, null);
                }

                public CalibrationDateTimeTag(KaitaiStream _io, Icc4.TagTable.TagDefinition _parent, Icc4 _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                }
                public void _read() {
                    this.tagType = Icc4.TagTable.TagDefinition.TagTypeSignatures.byId(this._io.readU4be());
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case DATE_TIME_TYPE: {
                                this.tagData = new DateTimeType(this._io, this, _root);
                                this.tagData._read();
                                break;
                            }
                            }
                        }
                    }
                    _dirty = false;
                }

                public void _fetchInstances() {
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case DATE_TIME_TYPE: {
                                this.tagData._fetchInstances();
                                break;
                            }
                            }
                        }
                    }
                }

                public void _write_Seq() {
                    _assertNotDirty();
                    this._io.writeU4be(((Number) (this.tagType.id())).longValue());
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case DATE_TIME_TYPE: {
                                this.tagData._write_Seq(this._io);
                                break;
                            }
                            }
                        }
                    }
                }

                public void _check() {
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case DATE_TIME_TYPE: {
                                if (!Objects.equals(this.tagData._root(), _root()))
                                    throw new ConsistencyError("tag_data", _root(), this.tagData._root());
                                if (!Objects.equals(this.tagData._parent(), this))
                                    throw new ConsistencyError("tag_data", this, this.tagData._parent());
                                break;
                            }
                            }
                        }
                    }
                    _dirty = false;
                }
                private TagTypeSignatures tagType;
                private DateTimeType tagData;
                private Icc4 _root;
                private Icc4.TagTable.TagDefinition _parent;
                public TagTypeSignatures tagType() { return tagType; }
                public void setTagType(TagTypeSignatures _v) { _dirty = true; tagType = _v; }
                public DateTimeType tagData() { return tagData; }
                public void setTagData(DateTimeType _v) { _dirty = true; tagData = _v; }
                public Icc4 _root() { return _root; }
                public void set_root(Icc4 _v) { _dirty = true; _root = _v; }
                public Icc4.TagTable.TagDefinition _parent() { return _parent; }
                public void set_parent(Icc4.TagTable.TagDefinition _v) { _dirty = true; _parent = _v; }
            }
            public static class CharTargetTag extends KaitaiStruct.ReadWrite {
                public static CharTargetTag fromFile(String fileName) throws IOException {
                    return new CharTargetTag(new ByteBufferKaitaiStream(fileName));
                }
                public CharTargetTag() {
                    this(null, null, null);
                }

                public CharTargetTag(KaitaiStream _io) {
                    this(_io, null, null);
                }

                public CharTargetTag(KaitaiStream _io, Icc4.TagTable.TagDefinition _parent) {
                    this(_io, _parent, null);
                }

                public CharTargetTag(KaitaiStream _io, Icc4.TagTable.TagDefinition _parent, Icc4 _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                }
                public void _read() {
                    this.tagType = Icc4.TagTable.TagDefinition.TagTypeSignatures.byId(this._io.readU4be());
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case TEXT_TYPE: {
                                this.tagData = new TextType(this._io, this, _root);
                                this.tagData._read();
                                break;
                            }
                            }
                        }
                    }
                    _dirty = false;
                }

                public void _fetchInstances() {
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case TEXT_TYPE: {
                                this.tagData._fetchInstances();
                                break;
                            }
                            }
                        }
                    }
                }

                public void _write_Seq() {
                    _assertNotDirty();
                    this._io.writeU4be(((Number) (this.tagType.id())).longValue());
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case TEXT_TYPE: {
                                this.tagData._write_Seq(this._io);
                                break;
                            }
                            }
                        }
                    }
                }

                public void _check() {
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case TEXT_TYPE: {
                                if (!Objects.equals(this.tagData._root(), _root()))
                                    throw new ConsistencyError("tag_data", _root(), this.tagData._root());
                                if (!Objects.equals(this.tagData._parent(), this))
                                    throw new ConsistencyError("tag_data", this, this.tagData._parent());
                                break;
                            }
                            }
                        }
                    }
                    _dirty = false;
                }
                private TagTypeSignatures tagType;
                private TextType tagData;
                private Icc4 _root;
                private Icc4.TagTable.TagDefinition _parent;
                public TagTypeSignatures tagType() { return tagType; }
                public void setTagType(TagTypeSignatures _v) { _dirty = true; tagType = _v; }
                public TextType tagData() { return tagData; }
                public void setTagData(TextType _v) { _dirty = true; tagData = _v; }
                public Icc4 _root() { return _root; }
                public void set_root(Icc4 _v) { _dirty = true; _root = _v; }
                public Icc4.TagTable.TagDefinition _parent() { return _parent; }
                public void set_parent(Icc4.TagTable.TagDefinition _v) { _dirty = true; _parent = _v; }
            }
            public static class ChromaticAdaptationTag extends KaitaiStruct.ReadWrite {
                public static ChromaticAdaptationTag fromFile(String fileName) throws IOException {
                    return new ChromaticAdaptationTag(new ByteBufferKaitaiStream(fileName));
                }
                public ChromaticAdaptationTag() {
                    this(null, null, null);
                }

                public ChromaticAdaptationTag(KaitaiStream _io) {
                    this(_io, null, null);
                }

                public ChromaticAdaptationTag(KaitaiStream _io, Icc4.TagTable.TagDefinition _parent) {
                    this(_io, _parent, null);
                }

                public ChromaticAdaptationTag(KaitaiStream _io, Icc4.TagTable.TagDefinition _parent, Icc4 _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                }
                public void _read() {
                    this.tagType = Icc4.TagTable.TagDefinition.TagTypeSignatures.byId(this._io.readU4be());
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case S_15_FIXED_16_ARRAY_TYPE: {
                                this.tagData = new S15Fixed16ArrayType(this._io, this, _root);
                                this.tagData._read();
                                break;
                            }
                            }
                        }
                    }
                    _dirty = false;
                }

                public void _fetchInstances() {
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case S_15_FIXED_16_ARRAY_TYPE: {
                                this.tagData._fetchInstances();
                                break;
                            }
                            }
                        }
                    }
                }

                public void _write_Seq() {
                    _assertNotDirty();
                    this._io.writeU4be(((Number) (this.tagType.id())).longValue());
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case S_15_FIXED_16_ARRAY_TYPE: {
                                this.tagData._write_Seq(this._io);
                                break;
                            }
                            }
                        }
                    }
                }

                public void _check() {
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case S_15_FIXED_16_ARRAY_TYPE: {
                                if (!Objects.equals(this.tagData._root(), _root()))
                                    throw new ConsistencyError("tag_data", _root(), this.tagData._root());
                                if (!Objects.equals(this.tagData._parent(), this))
                                    throw new ConsistencyError("tag_data", this, this.tagData._parent());
                                break;
                            }
                            }
                        }
                    }
                    _dirty = false;
                }
                private TagTypeSignatures tagType;
                private S15Fixed16ArrayType tagData;
                private Icc4 _root;
                private Icc4.TagTable.TagDefinition _parent;
                public TagTypeSignatures tagType() { return tagType; }
                public void setTagType(TagTypeSignatures _v) { _dirty = true; tagType = _v; }
                public S15Fixed16ArrayType tagData() { return tagData; }
                public void setTagData(S15Fixed16ArrayType _v) { _dirty = true; tagData = _v; }
                public Icc4 _root() { return _root; }
                public void set_root(Icc4 _v) { _dirty = true; _root = _v; }
                public Icc4.TagTable.TagDefinition _parent() { return _parent; }
                public void set_parent(Icc4.TagTable.TagDefinition _v) { _dirty = true; _parent = _v; }
            }
            public static class ChromaticityTag extends KaitaiStruct.ReadWrite {
                public static ChromaticityTag fromFile(String fileName) throws IOException {
                    return new ChromaticityTag(new ByteBufferKaitaiStream(fileName));
                }
                public ChromaticityTag() {
                    this(null, null, null);
                }

                public ChromaticityTag(KaitaiStream _io) {
                    this(_io, null, null);
                }

                public ChromaticityTag(KaitaiStream _io, Icc4.TagTable.TagDefinition _parent) {
                    this(_io, _parent, null);
                }

                public ChromaticityTag(KaitaiStream _io, Icc4.TagTable.TagDefinition _parent, Icc4 _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                }
                public void _read() {
                    this.tagType = Icc4.TagTable.TagDefinition.TagTypeSignatures.byId(this._io.readU4be());
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case CHROMATICITY_TYPE: {
                                this.tagData = new ChromaticityType(this._io, this, _root);
                                this.tagData._read();
                                break;
                            }
                            }
                        }
                    }
                    _dirty = false;
                }

                public void _fetchInstances() {
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case CHROMATICITY_TYPE: {
                                this.tagData._fetchInstances();
                                break;
                            }
                            }
                        }
                    }
                }

                public void _write_Seq() {
                    _assertNotDirty();
                    this._io.writeU4be(((Number) (this.tagType.id())).longValue());
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case CHROMATICITY_TYPE: {
                                this.tagData._write_Seq(this._io);
                                break;
                            }
                            }
                        }
                    }
                }

                public void _check() {
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case CHROMATICITY_TYPE: {
                                if (!Objects.equals(this.tagData._root(), _root()))
                                    throw new ConsistencyError("tag_data", _root(), this.tagData._root());
                                if (!Objects.equals(this.tagData._parent(), this))
                                    throw new ConsistencyError("tag_data", this, this.tagData._parent());
                                break;
                            }
                            }
                        }
                    }
                    _dirty = false;
                }
                private TagTypeSignatures tagType;
                private ChromaticityType tagData;
                private Icc4 _root;
                private Icc4.TagTable.TagDefinition _parent;
                public TagTypeSignatures tagType() { return tagType; }
                public void setTagType(TagTypeSignatures _v) { _dirty = true; tagType = _v; }
                public ChromaticityType tagData() { return tagData; }
                public void setTagData(ChromaticityType _v) { _dirty = true; tagData = _v; }
                public Icc4 _root() { return _root; }
                public void set_root(Icc4 _v) { _dirty = true; _root = _v; }
                public Icc4.TagTable.TagDefinition _parent() { return _parent; }
                public void set_parent(Icc4.TagTable.TagDefinition _v) { _dirty = true; _parent = _v; }
            }
            public static class ChromaticityType extends KaitaiStruct.ReadWrite {
                public static ChromaticityType fromFile(String fileName) throws IOException {
                    return new ChromaticityType(new ByteBufferKaitaiStream(fileName));
                }

                public enum ColorantAndPhosphorEncodings {
                    UNKNOWN(0),
                    ITU_R_BT_709_2(1),
                    SMPTE_RP145(2),
                    EBU_TECH_3213_E(3),
                    P22(4);

                    private final long id;
                    ColorantAndPhosphorEncodings(long id) { this.id = id; }
                    public long id() { return id; }
                    private static final Map<Long, ColorantAndPhosphorEncodings> byId = new HashMap<Long, ColorantAndPhosphorEncodings>(5);
                    static {
                        for (ColorantAndPhosphorEncodings e : ColorantAndPhosphorEncodings.values())
                            byId.put(e.id(), e);
                    }
                    public static ColorantAndPhosphorEncodings byId(long id) { return byId.get(id); }
                }
                public ChromaticityType() {
                    this(null, null, null);
                }

                public ChromaticityType(KaitaiStream _io) {
                    this(_io, null, null);
                }

                public ChromaticityType(KaitaiStream _io, Icc4.TagTable.TagDefinition.ChromaticityTag _parent) {
                    this(_io, _parent, null);
                }

                public ChromaticityType(KaitaiStream _io, Icc4.TagTable.TagDefinition.ChromaticityTag _parent, Icc4 _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                }
                public void _read() {
                    this.reserved = this._io.readBytes(4);
                    if (!(Arrays.equals(this.reserved, new byte[] { 0, 0, 0, 0 }))) {
                        throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0, 0, 0, 0 }, this.reserved, this._io, "/types/tag_table/types/tag_definition/types/chromaticity_type/seq/0");
                    }
                    this.numberOfDeviceChannels = this._io.readU2be();
                    this.colorantAndPhosphorEncoding = ColorantAndPhosphorEncodings.byId(this._io.readU2be());
                    this.ciexyCoordinatesPerChannel = new ArrayList<CiexyCoordinateValues>();
                    for (int i = 0; i < numberOfDeviceChannels(); i++) {
                        CiexyCoordinateValues _t_ciexyCoordinatesPerChannel = new CiexyCoordinateValues(this._io, this, _root);
                        try {
                            _t_ciexyCoordinatesPerChannel._read();
                        } finally {
                            this.ciexyCoordinatesPerChannel.add(_t_ciexyCoordinatesPerChannel);
                        }
                    }
                    _dirty = false;
                }

                public void _fetchInstances() {
                    for (int i = 0; i < this.ciexyCoordinatesPerChannel.size(); i++) {
                        this.ciexyCoordinatesPerChannel.get(((Number) (i)).intValue())._fetchInstances();
                    }
                }

                public void _write_Seq() {
                    _assertNotDirty();
                    this._io.writeBytes(this.reserved);
                    this._io.writeU2be(this.numberOfDeviceChannels);
                    this._io.writeU2be(((Number) (this.colorantAndPhosphorEncoding.id())).intValue());
                    for (int i = 0; i < this.ciexyCoordinatesPerChannel.size(); i++) {
                        this.ciexyCoordinatesPerChannel.get(((Number) (i)).intValue())._write_Seq(this._io);
                    }
                }

                public void _check() {
                    if (this.reserved.length != 4)
                        throw new ConsistencyError("reserved", 4, this.reserved.length);
                    if (!(Arrays.equals(this.reserved, new byte[] { 0, 0, 0, 0 }))) {
                        throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0, 0, 0, 0 }, this.reserved, null, "/types/tag_table/types/tag_definition/types/chromaticity_type/seq/0");
                    }
                    if (this.ciexyCoordinatesPerChannel.size() != numberOfDeviceChannels())
                        throw new ConsistencyError("ciexy_coordinates_per_channel", numberOfDeviceChannels(), this.ciexyCoordinatesPerChannel.size());
                    for (int i = 0; i < this.ciexyCoordinatesPerChannel.size(); i++) {
                        if (!Objects.equals(this.ciexyCoordinatesPerChannel.get(((Number) (i)).intValue())._root(), _root()))
                            throw new ConsistencyError("ciexy_coordinates_per_channel", _root(), this.ciexyCoordinatesPerChannel.get(((Number) (i)).intValue())._root());
                        if (!Objects.equals(this.ciexyCoordinatesPerChannel.get(((Number) (i)).intValue())._parent(), this))
                            throw new ConsistencyError("ciexy_coordinates_per_channel", this, this.ciexyCoordinatesPerChannel.get(((Number) (i)).intValue())._parent());
                    }
                    _dirty = false;
                }
                public static class CiexyCoordinateValues extends KaitaiStruct.ReadWrite {
                    public static CiexyCoordinateValues fromFile(String fileName) throws IOException {
                        return new CiexyCoordinateValues(new ByteBufferKaitaiStream(fileName));
                    }
                    public CiexyCoordinateValues() {
                        this(null, null, null);
                    }

                    public CiexyCoordinateValues(KaitaiStream _io) {
                        this(_io, null, null);
                    }

                    public CiexyCoordinateValues(KaitaiStream _io, Icc4.TagTable.TagDefinition.ChromaticityType _parent) {
                        this(_io, _parent, null);
                    }

                    public CiexyCoordinateValues(KaitaiStream _io, Icc4.TagTable.TagDefinition.ChromaticityType _parent, Icc4 _root) {
                        super(_io);
                        this._parent = _parent;
                        this._root = _root;
                    }
                    public void _read() {
                        this.xCoordinate = this._io.readU2be();
                        this.yCoordinate = this._io.readU2be();
                        _dirty = false;
                    }

                    public void _fetchInstances() {
                    }

                    public void _write_Seq() {
                        _assertNotDirty();
                        this._io.writeU2be(this.xCoordinate);
                        this._io.writeU2be(this.yCoordinate);
                    }

                    public void _check() {
                        _dirty = false;
                    }
                    private int xCoordinate;
                    private int yCoordinate;
                    private Icc4 _root;
                    private Icc4.TagTable.TagDefinition.ChromaticityType _parent;
                    public int xCoordinate() { return xCoordinate; }
                    public void setXCoordinate(int _v) { _dirty = true; xCoordinate = _v; }
                    public int yCoordinate() { return yCoordinate; }
                    public void setYCoordinate(int _v) { _dirty = true; yCoordinate = _v; }
                    public Icc4 _root() { return _root; }
                    public void set_root(Icc4 _v) { _dirty = true; _root = _v; }
                    public Icc4.TagTable.TagDefinition.ChromaticityType _parent() { return _parent; }
                    public void set_parent(Icc4.TagTable.TagDefinition.ChromaticityType _v) { _dirty = true; _parent = _v; }
                }
                private byte[] reserved;
                private int numberOfDeviceChannels;
                private ColorantAndPhosphorEncodings colorantAndPhosphorEncoding;
                private List<CiexyCoordinateValues> ciexyCoordinatesPerChannel;
                private Icc4 _root;
                private Icc4.TagTable.TagDefinition.ChromaticityTag _parent;
                public byte[] reserved() { return reserved; }
                public void setReserved(byte[] _v) { _dirty = true; reserved = _v; }
                public int numberOfDeviceChannels() { return numberOfDeviceChannels; }
                public void setNumberOfDeviceChannels(int _v) { _dirty = true; numberOfDeviceChannels = _v; }
                public ColorantAndPhosphorEncodings colorantAndPhosphorEncoding() { return colorantAndPhosphorEncoding; }
                public void setColorantAndPhosphorEncoding(ColorantAndPhosphorEncodings _v) { _dirty = true; colorantAndPhosphorEncoding = _v; }
                public List<CiexyCoordinateValues> ciexyCoordinatesPerChannel() { return ciexyCoordinatesPerChannel; }
                public void setCiexyCoordinatesPerChannel(List<CiexyCoordinateValues> _v) { _dirty = true; ciexyCoordinatesPerChannel = _v; }
                public Icc4 _root() { return _root; }
                public void set_root(Icc4 _v) { _dirty = true; _root = _v; }
                public Icc4.TagTable.TagDefinition.ChromaticityTag _parent() { return _parent; }
                public void set_parent(Icc4.TagTable.TagDefinition.ChromaticityTag _v) { _dirty = true; _parent = _v; }
            }
            public static class ColorantOrderTag extends KaitaiStruct.ReadWrite {
                public static ColorantOrderTag fromFile(String fileName) throws IOException {
                    return new ColorantOrderTag(new ByteBufferKaitaiStream(fileName));
                }
                public ColorantOrderTag() {
                    this(null, null, null);
                }

                public ColorantOrderTag(KaitaiStream _io) {
                    this(_io, null, null);
                }

                public ColorantOrderTag(KaitaiStream _io, Icc4.TagTable.TagDefinition _parent) {
                    this(_io, _parent, null);
                }

                public ColorantOrderTag(KaitaiStream _io, Icc4.TagTable.TagDefinition _parent, Icc4 _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                }
                public void _read() {
                    this.tagType = Icc4.TagTable.TagDefinition.TagTypeSignatures.byId(this._io.readU4be());
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case COLORANT_ORDER_TYPE: {
                                this.tagData = new ColorantOrderType(this._io, this, _root);
                                this.tagData._read();
                                break;
                            }
                            }
                        }
                    }
                    _dirty = false;
                }

                public void _fetchInstances() {
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case COLORANT_ORDER_TYPE: {
                                this.tagData._fetchInstances();
                                break;
                            }
                            }
                        }
                    }
                }

                public void _write_Seq() {
                    _assertNotDirty();
                    this._io.writeU4be(((Number) (this.tagType.id())).longValue());
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case COLORANT_ORDER_TYPE: {
                                this.tagData._write_Seq(this._io);
                                break;
                            }
                            }
                        }
                    }
                }

                public void _check() {
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case COLORANT_ORDER_TYPE: {
                                if (!Objects.equals(this.tagData._root(), _root()))
                                    throw new ConsistencyError("tag_data", _root(), this.tagData._root());
                                if (!Objects.equals(this.tagData._parent(), this))
                                    throw new ConsistencyError("tag_data", this, this.tagData._parent());
                                break;
                            }
                            }
                        }
                    }
                    _dirty = false;
                }
                private TagTypeSignatures tagType;
                private ColorantOrderType tagData;
                private Icc4 _root;
                private Icc4.TagTable.TagDefinition _parent;
                public TagTypeSignatures tagType() { return tagType; }
                public void setTagType(TagTypeSignatures _v) { _dirty = true; tagType = _v; }
                public ColorantOrderType tagData() { return tagData; }
                public void setTagData(ColorantOrderType _v) { _dirty = true; tagData = _v; }
                public Icc4 _root() { return _root; }
                public void set_root(Icc4 _v) { _dirty = true; _root = _v; }
                public Icc4.TagTable.TagDefinition _parent() { return _parent; }
                public void set_parent(Icc4.TagTable.TagDefinition _v) { _dirty = true; _parent = _v; }
            }
            public static class ColorantOrderType extends KaitaiStruct.ReadWrite {
                public static ColorantOrderType fromFile(String fileName) throws IOException {
                    return new ColorantOrderType(new ByteBufferKaitaiStream(fileName));
                }
                public ColorantOrderType() {
                    this(null, null, null);
                }

                public ColorantOrderType(KaitaiStream _io) {
                    this(_io, null, null);
                }

                public ColorantOrderType(KaitaiStream _io, Icc4.TagTable.TagDefinition.ColorantOrderTag _parent) {
                    this(_io, _parent, null);
                }

                public ColorantOrderType(KaitaiStream _io, Icc4.TagTable.TagDefinition.ColorantOrderTag _parent, Icc4 _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                }
                public void _read() {
                    this.reserved = this._io.readBytes(4);
                    if (!(Arrays.equals(this.reserved, new byte[] { 0, 0, 0, 0 }))) {
                        throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0, 0, 0, 0 }, this.reserved, this._io, "/types/tag_table/types/tag_definition/types/colorant_order_type/seq/0");
                    }
                    this.countOfColorants = this._io.readU4be();
                    this.numbersOfColorantsInOrderOfPrinting = new ArrayList<Integer>();
                    for (int i = 0; i < countOfColorants(); i++) {
                        this.numbersOfColorantsInOrderOfPrinting.add(this._io.readU1());
                    }
                    _dirty = false;
                }

                public void _fetchInstances() {
                    for (int i = 0; i < this.numbersOfColorantsInOrderOfPrinting.size(); i++) {
                    }
                }

                public void _write_Seq() {
                    _assertNotDirty();
                    this._io.writeBytes(this.reserved);
                    this._io.writeU4be(this.countOfColorants);
                    for (int i = 0; i < this.numbersOfColorantsInOrderOfPrinting.size(); i++) {
                        this._io.writeU1(this.numbersOfColorantsInOrderOfPrinting.get(((Number) (i)).intValue()));
                    }
                }

                public void _check() {
                    if (this.reserved.length != 4)
                        throw new ConsistencyError("reserved", 4, this.reserved.length);
                    if (!(Arrays.equals(this.reserved, new byte[] { 0, 0, 0, 0 }))) {
                        throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0, 0, 0, 0 }, this.reserved, null, "/types/tag_table/types/tag_definition/types/colorant_order_type/seq/0");
                    }
                    if (this.numbersOfColorantsInOrderOfPrinting.size() != countOfColorants())
                        throw new ConsistencyError("numbers_of_colorants_in_order_of_printing", countOfColorants(), this.numbersOfColorantsInOrderOfPrinting.size());
                    for (int i = 0; i < this.numbersOfColorantsInOrderOfPrinting.size(); i++) {
                    }
                    _dirty = false;
                }
                private byte[] reserved;
                private long countOfColorants;
                private List<Integer> numbersOfColorantsInOrderOfPrinting;
                private Icc4 _root;
                private Icc4.TagTable.TagDefinition.ColorantOrderTag _parent;
                public byte[] reserved() { return reserved; }
                public void setReserved(byte[] _v) { _dirty = true; reserved = _v; }
                public long countOfColorants() { return countOfColorants; }
                public void setCountOfColorants(long _v) { _dirty = true; countOfColorants = _v; }
                public List<Integer> numbersOfColorantsInOrderOfPrinting() { return numbersOfColorantsInOrderOfPrinting; }
                public void setNumbersOfColorantsInOrderOfPrinting(List<Integer> _v) { _dirty = true; numbersOfColorantsInOrderOfPrinting = _v; }
                public Icc4 _root() { return _root; }
                public void set_root(Icc4 _v) { _dirty = true; _root = _v; }
                public Icc4.TagTable.TagDefinition.ColorantOrderTag _parent() { return _parent; }
                public void set_parent(Icc4.TagTable.TagDefinition.ColorantOrderTag _v) { _dirty = true; _parent = _v; }
            }
            public static class ColorantTableOutTag extends KaitaiStruct.ReadWrite {
                public static ColorantTableOutTag fromFile(String fileName) throws IOException {
                    return new ColorantTableOutTag(new ByteBufferKaitaiStream(fileName));
                }
                public ColorantTableOutTag() {
                    this(null, null, null);
                }

                public ColorantTableOutTag(KaitaiStream _io) {
                    this(_io, null, null);
                }

                public ColorantTableOutTag(KaitaiStream _io, Icc4.TagTable.TagDefinition _parent) {
                    this(_io, _parent, null);
                }

                public ColorantTableOutTag(KaitaiStream _io, Icc4.TagTable.TagDefinition _parent, Icc4 _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                }
                public void _read() {
                    this.tagType = Icc4.TagTable.TagDefinition.TagTypeSignatures.byId(this._io.readU4be());
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case COLORANT_TABLE_TYPE: {
                                this.tagData = new ColorantTableType(this._io, this, _root);
                                this.tagData._read();
                                break;
                            }
                            }
                        }
                    }
                    _dirty = false;
                }

                public void _fetchInstances() {
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case COLORANT_TABLE_TYPE: {
                                this.tagData._fetchInstances();
                                break;
                            }
                            }
                        }
                    }
                }

                public void _write_Seq() {
                    _assertNotDirty();
                    this._io.writeU4be(((Number) (this.tagType.id())).longValue());
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case COLORANT_TABLE_TYPE: {
                                this.tagData._write_Seq(this._io);
                                break;
                            }
                            }
                        }
                    }
                }

                public void _check() {
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case COLORANT_TABLE_TYPE: {
                                if (!Objects.equals(this.tagData._root(), _root()))
                                    throw new ConsistencyError("tag_data", _root(), this.tagData._root());
                                if (!Objects.equals(this.tagData._parent(), this))
                                    throw new ConsistencyError("tag_data", this, this.tagData._parent());
                                break;
                            }
                            }
                        }
                    }
                    _dirty = false;
                }
                private TagTypeSignatures tagType;
                private ColorantTableType tagData;
                private Icc4 _root;
                private Icc4.TagTable.TagDefinition _parent;
                public TagTypeSignatures tagType() { return tagType; }
                public void setTagType(TagTypeSignatures _v) { _dirty = true; tagType = _v; }
                public ColorantTableType tagData() { return tagData; }
                public void setTagData(ColorantTableType _v) { _dirty = true; tagData = _v; }
                public Icc4 _root() { return _root; }
                public void set_root(Icc4 _v) { _dirty = true; _root = _v; }
                public Icc4.TagTable.TagDefinition _parent() { return _parent; }
                public void set_parent(Icc4.TagTable.TagDefinition _v) { _dirty = true; _parent = _v; }
            }
            public static class ColorantTableTag extends KaitaiStruct.ReadWrite {
                public static ColorantTableTag fromFile(String fileName) throws IOException {
                    return new ColorantTableTag(new ByteBufferKaitaiStream(fileName));
                }
                public ColorantTableTag() {
                    this(null, null, null);
                }

                public ColorantTableTag(KaitaiStream _io) {
                    this(_io, null, null);
                }

                public ColorantTableTag(KaitaiStream _io, Icc4.TagTable.TagDefinition _parent) {
                    this(_io, _parent, null);
                }

                public ColorantTableTag(KaitaiStream _io, Icc4.TagTable.TagDefinition _parent, Icc4 _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                }
                public void _read() {
                    this.tagType = Icc4.TagTable.TagDefinition.TagTypeSignatures.byId(this._io.readU4be());
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case COLORANT_TABLE_TYPE: {
                                this.tagData = new ColorantTableType(this._io, this, _root);
                                this.tagData._read();
                                break;
                            }
                            }
                        }
                    }
                    _dirty = false;
                }

                public void _fetchInstances() {
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case COLORANT_TABLE_TYPE: {
                                this.tagData._fetchInstances();
                                break;
                            }
                            }
                        }
                    }
                }

                public void _write_Seq() {
                    _assertNotDirty();
                    this._io.writeU4be(((Number) (this.tagType.id())).longValue());
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case COLORANT_TABLE_TYPE: {
                                this.tagData._write_Seq(this._io);
                                break;
                            }
                            }
                        }
                    }
                }

                public void _check() {
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case COLORANT_TABLE_TYPE: {
                                if (!Objects.equals(this.tagData._root(), _root()))
                                    throw new ConsistencyError("tag_data", _root(), this.tagData._root());
                                if (!Objects.equals(this.tagData._parent(), this))
                                    throw new ConsistencyError("tag_data", this, this.tagData._parent());
                                break;
                            }
                            }
                        }
                    }
                    _dirty = false;
                }
                private TagTypeSignatures tagType;
                private ColorantTableType tagData;
                private Icc4 _root;
                private Icc4.TagTable.TagDefinition _parent;
                public TagTypeSignatures tagType() { return tagType; }
                public void setTagType(TagTypeSignatures _v) { _dirty = true; tagType = _v; }
                public ColorantTableType tagData() { return tagData; }
                public void setTagData(ColorantTableType _v) { _dirty = true; tagData = _v; }
                public Icc4 _root() { return _root; }
                public void set_root(Icc4 _v) { _dirty = true; _root = _v; }
                public Icc4.TagTable.TagDefinition _parent() { return _parent; }
                public void set_parent(Icc4.TagTable.TagDefinition _v) { _dirty = true; _parent = _v; }
            }
            public static class ColorantTableType extends KaitaiStruct.ReadWrite {
                public static ColorantTableType fromFile(String fileName) throws IOException {
                    return new ColorantTableType(new ByteBufferKaitaiStream(fileName));
                }
                public ColorantTableType() {
                    this(null, null, null);
                }

                public ColorantTableType(KaitaiStream _io) {
                    this(_io, null, null);
                }

                public ColorantTableType(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
                    this(_io, _parent, null);
                }

                public ColorantTableType(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, Icc4 _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                }
                public void _read() {
                    this.reserved = this._io.readBytes(4);
                    if (!(Arrays.equals(this.reserved, new byte[] { 0, 0, 0, 0 }))) {
                        throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0, 0, 0, 0 }, this.reserved, this._io, "/types/tag_table/types/tag_definition/types/colorant_table_type/seq/0");
                    }
                    this.countOfColorants = this._io.readU4be();
                    this.colorants = new ArrayList<Colorant>();
                    for (int i = 0; i < countOfColorants(); i++) {
                        Colorant _t_colorants = new Colorant(this._io, this, _root);
                        try {
                            _t_colorants._read();
                        } finally {
                            this.colorants.add(_t_colorants);
                        }
                    }
                    _dirty = false;
                }

                public void _fetchInstances() {
                    for (int i = 0; i < this.colorants.size(); i++) {
                        this.colorants.get(((Number) (i)).intValue())._fetchInstances();
                    }
                }

                public void _write_Seq() {
                    _assertNotDirty();
                    this._io.writeBytes(this.reserved);
                    this._io.writeU4be(this.countOfColorants);
                    for (int i = 0; i < this.colorants.size(); i++) {
                        this.colorants.get(((Number) (i)).intValue())._write_Seq(this._io);
                    }
                }

                public void _check() {
                    if (this.reserved.length != 4)
                        throw new ConsistencyError("reserved", 4, this.reserved.length);
                    if (!(Arrays.equals(this.reserved, new byte[] { 0, 0, 0, 0 }))) {
                        throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0, 0, 0, 0 }, this.reserved, null, "/types/tag_table/types/tag_definition/types/colorant_table_type/seq/0");
                    }
                    if (this.colorants.size() != countOfColorants())
                        throw new ConsistencyError("colorants", countOfColorants(), this.colorants.size());
                    for (int i = 0; i < this.colorants.size(); i++) {
                        if (!Objects.equals(this.colorants.get(((Number) (i)).intValue())._root(), _root()))
                            throw new ConsistencyError("colorants", _root(), this.colorants.get(((Number) (i)).intValue())._root());
                        if (!Objects.equals(this.colorants.get(((Number) (i)).intValue())._parent(), this))
                            throw new ConsistencyError("colorants", this, this.colorants.get(((Number) (i)).intValue())._parent());
                    }
                    _dirty = false;
                }
                public static class Colorant extends KaitaiStruct.ReadWrite {
                    public static Colorant fromFile(String fileName) throws IOException {
                        return new Colorant(new ByteBufferKaitaiStream(fileName));
                    }
                    public Colorant() {
                        this(null, null, null);
                    }

                    public Colorant(KaitaiStream _io) {
                        this(_io, null, null);
                    }

                    public Colorant(KaitaiStream _io, Icc4.TagTable.TagDefinition.ColorantTableType _parent) {
                        this(_io, _parent, null);
                    }

                    public Colorant(KaitaiStream _io, Icc4.TagTable.TagDefinition.ColorantTableType _parent, Icc4 _root) {
                        super(_io);
                        this._parent = _parent;
                        this._root = _root;
                    }
                    public void _read() {
                        this.name = new String(this._io.readBytesTerm((byte) 0, false, true, true), StandardCharsets.US_ASCII);
                        this.padding = new ArrayList<byte[]>();
                        for (int i = 0; i < 32 - name().length(); i++) {
                            this.padding.add(this._io.readBytes(1));
                            if (!(Arrays.equals(this.padding.get(((Number) (i)).intValue()), new byte[] { 0 }))) {
                                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0 }, this.padding.get(((Number) (i)).intValue()), this._io, "/types/tag_table/types/tag_definition/types/colorant_table_type/types/colorant/seq/1");
                            }
                        }
                        this.pcsValues = this._io.readBytes(6);
                        _dirty = false;
                    }

                    public void _fetchInstances() {
                        for (int i = 0; i < this.padding.size(); i++) {
                        }
                    }

                    public void _write_Seq() {
                        _assertNotDirty();
                        this._io.writeBytes((this.name).getBytes(Charset.forName("ASCII")));
                        this._io.writeU1(0);
                        for (int i = 0; i < this.padding.size(); i++) {
                            this._io.writeBytes(this.padding.get(((Number) (i)).intValue()));
                        }
                        this._io.writeBytes(this.pcsValues);
                    }

                    public void _check() {
                        if (KaitaiStream.byteArrayIndexOf((this.name).getBytes(Charset.forName("ASCII")), ((byte) 0)) != -1)
                            throw new ConsistencyError("name", -1, KaitaiStream.byteArrayIndexOf((this.name).getBytes(Charset.forName("ASCII")), ((byte) 0)));
                        if (this.padding.size() != 32 - name().length())
                            throw new ConsistencyError("padding", 32 - name().length(), this.padding.size());
                        for (int i = 0; i < this.padding.size(); i++) {
                            if (this.padding.get(((Number) (i)).intValue()).length != 1)
                                throw new ConsistencyError("padding", 1, this.padding.get(((Number) (i)).intValue()).length);
                            if (!(Arrays.equals(this.padding.get(((Number) (i)).intValue()), new byte[] { 0 }))) {
                                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0 }, this.padding.get(((Number) (i)).intValue()), null, "/types/tag_table/types/tag_definition/types/colorant_table_type/types/colorant/seq/1");
                            }
                        }
                        if (this.pcsValues.length != 6)
                            throw new ConsistencyError("pcs_values", 6, this.pcsValues.length);
                        _dirty = false;
                    }
                    private String name;
                    private List<byte[]> padding;
                    private byte[] pcsValues;
                    private Icc4 _root;
                    private Icc4.TagTable.TagDefinition.ColorantTableType _parent;
                    public String name() { return name; }
                    public void setName(String _v) { _dirty = true; name = _v; }
                    public List<byte[]> padding() { return padding; }
                    public void setPadding(List<byte[]> _v) { _dirty = true; padding = _v; }
                    public byte[] pcsValues() { return pcsValues; }
                    public void setPcsValues(byte[] _v) { _dirty = true; pcsValues = _v; }
                    public Icc4 _root() { return _root; }
                    public void set_root(Icc4 _v) { _dirty = true; _root = _v; }
                    public Icc4.TagTable.TagDefinition.ColorantTableType _parent() { return _parent; }
                    public void set_parent(Icc4.TagTable.TagDefinition.ColorantTableType _v) { _dirty = true; _parent = _v; }
                }
                private byte[] reserved;
                private long countOfColorants;
                private List<Colorant> colorants;
                private Icc4 _root;
                private KaitaiStruct.ReadWrite _parent;
                public byte[] reserved() { return reserved; }
                public void setReserved(byte[] _v) { _dirty = true; reserved = _v; }
                public long countOfColorants() { return countOfColorants; }
                public void setCountOfColorants(long _v) { _dirty = true; countOfColorants = _v; }
                public List<Colorant> colorants() { return colorants; }
                public void setColorants(List<Colorant> _v) { _dirty = true; colorants = _v; }
                public Icc4 _root() { return _root; }
                public void set_root(Icc4 _v) { _dirty = true; _root = _v; }
                public KaitaiStruct.ReadWrite _parent() { return _parent; }
                public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
            }
            public static class ColorimetricIntentImageStateTag extends KaitaiStruct.ReadWrite {
                public static ColorimetricIntentImageStateTag fromFile(String fileName) throws IOException {
                    return new ColorimetricIntentImageStateTag(new ByteBufferKaitaiStream(fileName));
                }
                public ColorimetricIntentImageStateTag() {
                    this(null, null, null);
                }

                public ColorimetricIntentImageStateTag(KaitaiStream _io) {
                    this(_io, null, null);
                }

                public ColorimetricIntentImageStateTag(KaitaiStream _io, Icc4.TagTable.TagDefinition _parent) {
                    this(_io, _parent, null);
                }

                public ColorimetricIntentImageStateTag(KaitaiStream _io, Icc4.TagTable.TagDefinition _parent, Icc4 _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                }
                public void _read() {
                    this.tagType = Icc4.TagTable.TagDefinition.TagTypeSignatures.byId(this._io.readU4be());
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case SIGNATURE_TYPE: {
                                this.tagData = new SignatureType(this._io, this, _root);
                                this.tagData._read();
                                break;
                            }
                            }
                        }
                    }
                    _dirty = false;
                }

                public void _fetchInstances() {
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case SIGNATURE_TYPE: {
                                this.tagData._fetchInstances();
                                break;
                            }
                            }
                        }
                    }
                }

                public void _write_Seq() {
                    _assertNotDirty();
                    this._io.writeU4be(((Number) (this.tagType.id())).longValue());
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case SIGNATURE_TYPE: {
                                this.tagData._write_Seq(this._io);
                                break;
                            }
                            }
                        }
                    }
                }

                public void _check() {
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case SIGNATURE_TYPE: {
                                if (!Objects.equals(this.tagData._root(), _root()))
                                    throw new ConsistencyError("tag_data", _root(), this.tagData._root());
                                if (!Objects.equals(this.tagData._parent(), this))
                                    throw new ConsistencyError("tag_data", this, this.tagData._parent());
                                break;
                            }
                            }
                        }
                    }
                    _dirty = false;
                }
                private TagTypeSignatures tagType;
                private SignatureType tagData;
                private Icc4 _root;
                private Icc4.TagTable.TagDefinition _parent;
                public TagTypeSignatures tagType() { return tagType; }
                public void setTagType(TagTypeSignatures _v) { _dirty = true; tagType = _v; }
                public SignatureType tagData() { return tagData; }
                public void setTagData(SignatureType _v) { _dirty = true; tagData = _v; }
                public Icc4 _root() { return _root; }
                public void set_root(Icc4 _v) { _dirty = true; _root = _v; }
                public Icc4.TagTable.TagDefinition _parent() { return _parent; }
                public void set_parent(Icc4.TagTable.TagDefinition _v) { _dirty = true; _parent = _v; }
            }
            public static class CopyrightTag extends KaitaiStruct.ReadWrite {
                public static CopyrightTag fromFile(String fileName) throws IOException {
                    return new CopyrightTag(new ByteBufferKaitaiStream(fileName));
                }
                public CopyrightTag() {
                    this(null, null, null);
                }

                public CopyrightTag(KaitaiStream _io) {
                    this(_io, null, null);
                }

                public CopyrightTag(KaitaiStream _io, Icc4.TagTable.TagDefinition _parent) {
                    this(_io, _parent, null);
                }

                public CopyrightTag(KaitaiStream _io, Icc4.TagTable.TagDefinition _parent, Icc4 _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                }
                public void _read() {
                    this.tagType = Icc4.TagTable.TagDefinition.TagTypeSignatures.byId(this._io.readU4be());
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case MULTI_LOCALIZED_UNICODE_TYPE: {
                                this.tagData = new MultiLocalizedUnicodeType(this._io, this, _root);
                                this.tagData._read();
                                break;
                            }
                            }
                        }
                    }
                    _dirty = false;
                }

                public void _fetchInstances() {
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case MULTI_LOCALIZED_UNICODE_TYPE: {
                                this.tagData._fetchInstances();
                                break;
                            }
                            }
                        }
                    }
                }

                public void _write_Seq() {
                    _assertNotDirty();
                    this._io.writeU4be(((Number) (this.tagType.id())).longValue());
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case MULTI_LOCALIZED_UNICODE_TYPE: {
                                this.tagData._write_Seq(this._io);
                                break;
                            }
                            }
                        }
                    }
                }

                public void _check() {
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case MULTI_LOCALIZED_UNICODE_TYPE: {
                                if (!Objects.equals(this.tagData._root(), _root()))
                                    throw new ConsistencyError("tag_data", _root(), this.tagData._root());
                                if (!Objects.equals(this.tagData._parent(), this))
                                    throw new ConsistencyError("tag_data", this, this.tagData._parent());
                                break;
                            }
                            }
                        }
                    }
                    _dirty = false;
                }
                private TagTypeSignatures tagType;
                private MultiLocalizedUnicodeType tagData;
                private Icc4 _root;
                private Icc4.TagTable.TagDefinition _parent;
                public TagTypeSignatures tagType() { return tagType; }
                public void setTagType(TagTypeSignatures _v) { _dirty = true; tagType = _v; }
                public MultiLocalizedUnicodeType tagData() { return tagData; }
                public void setTagData(MultiLocalizedUnicodeType _v) { _dirty = true; tagData = _v; }
                public Icc4 _root() { return _root; }
                public void set_root(Icc4 _v) { _dirty = true; _root = _v; }
                public Icc4.TagTable.TagDefinition _parent() { return _parent; }
                public void set_parent(Icc4.TagTable.TagDefinition _v) { _dirty = true; _parent = _v; }
            }
            public static class CurveType extends KaitaiStruct.ReadWrite {
                public static CurveType fromFile(String fileName) throws IOException {
                    return new CurveType(new ByteBufferKaitaiStream(fileName));
                }
                public CurveType() {
                    this(null, null, null);
                }

                public CurveType(KaitaiStream _io) {
                    this(_io, null, null);
                }

                public CurveType(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
                    this(_io, _parent, null);
                }

                public CurveType(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, Icc4 _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                }
                public void _read() {
                    this.reserved = this._io.readBytes(4);
                    if (!(Arrays.equals(this.reserved, new byte[] { 0, 0, 0, 0 }))) {
                        throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0, 0, 0, 0 }, this.reserved, this._io, "/types/tag_table/types/tag_definition/types/curve_type/seq/0");
                    }
                    this.numberOfEntries = this._io.readU4be();
                    if (numberOfEntries() > 1) {
                        this.curveValues = new ArrayList<Integer>();
                        for (int i = 0; i < numberOfEntries(); i++) {
                            this.curveValues.add(this._io.readU2be());
                        }
                    }
                    if (numberOfEntries() == 1) {
                        this.curveValue = this._io.readU1();
                    }
                    _dirty = false;
                }

                public void _fetchInstances() {
                    if (numberOfEntries() > 1) {
                        for (int i = 0; i < this.curveValues.size(); i++) {
                        }
                    }
                    if (numberOfEntries() == 1) {
                    }
                }

                public void _write_Seq() {
                    _assertNotDirty();
                    this._io.writeBytes(this.reserved);
                    this._io.writeU4be(this.numberOfEntries);
                    if (numberOfEntries() > 1) {
                        for (int i = 0; i < this.curveValues.size(); i++) {
                            this._io.writeU2be(this.curveValues.get(((Number) (i)).intValue()));
                        }
                    }
                    if (numberOfEntries() == 1) {
                        this._io.writeU1(this.curveValue);
                    }
                }

                public void _check() {
                    if (this.reserved.length != 4)
                        throw new ConsistencyError("reserved", 4, this.reserved.length);
                    if (!(Arrays.equals(this.reserved, new byte[] { 0, 0, 0, 0 }))) {
                        throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0, 0, 0, 0 }, this.reserved, null, "/types/tag_table/types/tag_definition/types/curve_type/seq/0");
                    }
                    if (numberOfEntries() > 1) {
                        if (this.curveValues.size() != numberOfEntries())
                            throw new ConsistencyError("curve_values", numberOfEntries(), this.curveValues.size());
                        for (int i = 0; i < this.curveValues.size(); i++) {
                        }
                    }
                    if (numberOfEntries() == 1) {
                    }
                    _dirty = false;
                }
                private byte[] reserved;
                private long numberOfEntries;
                private List<Integer> curveValues;
                private Integer curveValue;
                private Icc4 _root;
                private KaitaiStruct.ReadWrite _parent;
                public byte[] reserved() { return reserved; }
                public void setReserved(byte[] _v) { _dirty = true; reserved = _v; }
                public long numberOfEntries() { return numberOfEntries; }
                public void setNumberOfEntries(long _v) { _dirty = true; numberOfEntries = _v; }
                public List<Integer> curveValues() { return curveValues; }
                public void setCurveValues(List<Integer> _v) { _dirty = true; curveValues = _v; }
                public Integer curveValue() { return curveValue; }
                public void setCurveValue(Integer _v) { _dirty = true; curveValue = _v; }
                public Icc4 _root() { return _root; }
                public void set_root(Icc4 _v) { _dirty = true; _root = _v; }
                public KaitaiStruct.ReadWrite _parent() { return _parent; }
                public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
            }
            public static class DToB0Tag extends KaitaiStruct.ReadWrite {
                public static DToB0Tag fromFile(String fileName) throws IOException {
                    return new DToB0Tag(new ByteBufferKaitaiStream(fileName));
                }
                public DToB0Tag() {
                    this(null, null, null);
                }

                public DToB0Tag(KaitaiStream _io) {
                    this(_io, null, null);
                }

                public DToB0Tag(KaitaiStream _io, Icc4.TagTable.TagDefinition _parent) {
                    this(_io, _parent, null);
                }

                public DToB0Tag(KaitaiStream _io, Icc4.TagTable.TagDefinition _parent, Icc4 _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                }
                public void _read() {
                    this.tagType = Icc4.TagTable.TagDefinition.TagTypeSignatures.byId(this._io.readU4be());
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case MULTI_PROCESS_ELEMENTS_TYPE: {
                                this.tagData = new MultiProcessElementsType(this._io, this, _root);
                                this.tagData._read();
                                break;
                            }
                            }
                        }
                    }
                    _dirty = false;
                }

                public void _fetchInstances() {
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case MULTI_PROCESS_ELEMENTS_TYPE: {
                                this.tagData._fetchInstances();
                                break;
                            }
                            }
                        }
                    }
                }

                public void _write_Seq() {
                    _assertNotDirty();
                    this._io.writeU4be(((Number) (this.tagType.id())).longValue());
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case MULTI_PROCESS_ELEMENTS_TYPE: {
                                this.tagData._write_Seq(this._io);
                                break;
                            }
                            }
                        }
                    }
                }

                public void _check() {
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case MULTI_PROCESS_ELEMENTS_TYPE: {
                                if (!Objects.equals(this.tagData._root(), _root()))
                                    throw new ConsistencyError("tag_data", _root(), this.tagData._root());
                                if (!Objects.equals(this.tagData._parent(), this))
                                    throw new ConsistencyError("tag_data", this, this.tagData._parent());
                                break;
                            }
                            }
                        }
                    }
                    _dirty = false;
                }
                private TagTypeSignatures tagType;
                private MultiProcessElementsType tagData;
                private Icc4 _root;
                private Icc4.TagTable.TagDefinition _parent;
                public TagTypeSignatures tagType() { return tagType; }
                public void setTagType(TagTypeSignatures _v) { _dirty = true; tagType = _v; }
                public MultiProcessElementsType tagData() { return tagData; }
                public void setTagData(MultiProcessElementsType _v) { _dirty = true; tagData = _v; }
                public Icc4 _root() { return _root; }
                public void set_root(Icc4 _v) { _dirty = true; _root = _v; }
                public Icc4.TagTable.TagDefinition _parent() { return _parent; }
                public void set_parent(Icc4.TagTable.TagDefinition _v) { _dirty = true; _parent = _v; }
            }
            public static class DToB1Tag extends KaitaiStruct.ReadWrite {
                public static DToB1Tag fromFile(String fileName) throws IOException {
                    return new DToB1Tag(new ByteBufferKaitaiStream(fileName));
                }
                public DToB1Tag() {
                    this(null, null, null);
                }

                public DToB1Tag(KaitaiStream _io) {
                    this(_io, null, null);
                }

                public DToB1Tag(KaitaiStream _io, Icc4.TagTable.TagDefinition _parent) {
                    this(_io, _parent, null);
                }

                public DToB1Tag(KaitaiStream _io, Icc4.TagTable.TagDefinition _parent, Icc4 _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                }
                public void _read() {
                    this.tagType = Icc4.TagTable.TagDefinition.TagTypeSignatures.byId(this._io.readU4be());
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case MULTI_PROCESS_ELEMENTS_TYPE: {
                                this.tagData = new MultiProcessElementsType(this._io, this, _root);
                                this.tagData._read();
                                break;
                            }
                            }
                        }
                    }
                    _dirty = false;
                }

                public void _fetchInstances() {
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case MULTI_PROCESS_ELEMENTS_TYPE: {
                                this.tagData._fetchInstances();
                                break;
                            }
                            }
                        }
                    }
                }

                public void _write_Seq() {
                    _assertNotDirty();
                    this._io.writeU4be(((Number) (this.tagType.id())).longValue());
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case MULTI_PROCESS_ELEMENTS_TYPE: {
                                this.tagData._write_Seq(this._io);
                                break;
                            }
                            }
                        }
                    }
                }

                public void _check() {
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case MULTI_PROCESS_ELEMENTS_TYPE: {
                                if (!Objects.equals(this.tagData._root(), _root()))
                                    throw new ConsistencyError("tag_data", _root(), this.tagData._root());
                                if (!Objects.equals(this.tagData._parent(), this))
                                    throw new ConsistencyError("tag_data", this, this.tagData._parent());
                                break;
                            }
                            }
                        }
                    }
                    _dirty = false;
                }
                private TagTypeSignatures tagType;
                private MultiProcessElementsType tagData;
                private Icc4 _root;
                private Icc4.TagTable.TagDefinition _parent;
                public TagTypeSignatures tagType() { return tagType; }
                public void setTagType(TagTypeSignatures _v) { _dirty = true; tagType = _v; }
                public MultiProcessElementsType tagData() { return tagData; }
                public void setTagData(MultiProcessElementsType _v) { _dirty = true; tagData = _v; }
                public Icc4 _root() { return _root; }
                public void set_root(Icc4 _v) { _dirty = true; _root = _v; }
                public Icc4.TagTable.TagDefinition _parent() { return _parent; }
                public void set_parent(Icc4.TagTable.TagDefinition _v) { _dirty = true; _parent = _v; }
            }
            public static class DToB2Tag extends KaitaiStruct.ReadWrite {
                public static DToB2Tag fromFile(String fileName) throws IOException {
                    return new DToB2Tag(new ByteBufferKaitaiStream(fileName));
                }
                public DToB2Tag() {
                    this(null, null, null);
                }

                public DToB2Tag(KaitaiStream _io) {
                    this(_io, null, null);
                }

                public DToB2Tag(KaitaiStream _io, Icc4.TagTable.TagDefinition _parent) {
                    this(_io, _parent, null);
                }

                public DToB2Tag(KaitaiStream _io, Icc4.TagTable.TagDefinition _parent, Icc4 _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                }
                public void _read() {
                    this.tagType = Icc4.TagTable.TagDefinition.TagTypeSignatures.byId(this._io.readU4be());
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case MULTI_PROCESS_ELEMENTS_TYPE: {
                                this.tagData = new MultiProcessElementsType(this._io, this, _root);
                                this.tagData._read();
                                break;
                            }
                            }
                        }
                    }
                    _dirty = false;
                }

                public void _fetchInstances() {
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case MULTI_PROCESS_ELEMENTS_TYPE: {
                                this.tagData._fetchInstances();
                                break;
                            }
                            }
                        }
                    }
                }

                public void _write_Seq() {
                    _assertNotDirty();
                    this._io.writeU4be(((Number) (this.tagType.id())).longValue());
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case MULTI_PROCESS_ELEMENTS_TYPE: {
                                this.tagData._write_Seq(this._io);
                                break;
                            }
                            }
                        }
                    }
                }

                public void _check() {
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case MULTI_PROCESS_ELEMENTS_TYPE: {
                                if (!Objects.equals(this.tagData._root(), _root()))
                                    throw new ConsistencyError("tag_data", _root(), this.tagData._root());
                                if (!Objects.equals(this.tagData._parent(), this))
                                    throw new ConsistencyError("tag_data", this, this.tagData._parent());
                                break;
                            }
                            }
                        }
                    }
                    _dirty = false;
                }
                private TagTypeSignatures tagType;
                private MultiProcessElementsType tagData;
                private Icc4 _root;
                private Icc4.TagTable.TagDefinition _parent;
                public TagTypeSignatures tagType() { return tagType; }
                public void setTagType(TagTypeSignatures _v) { _dirty = true; tagType = _v; }
                public MultiProcessElementsType tagData() { return tagData; }
                public void setTagData(MultiProcessElementsType _v) { _dirty = true; tagData = _v; }
                public Icc4 _root() { return _root; }
                public void set_root(Icc4 _v) { _dirty = true; _root = _v; }
                public Icc4.TagTable.TagDefinition _parent() { return _parent; }
                public void set_parent(Icc4.TagTable.TagDefinition _v) { _dirty = true; _parent = _v; }
            }
            public static class DToB3Tag extends KaitaiStruct.ReadWrite {
                public static DToB3Tag fromFile(String fileName) throws IOException {
                    return new DToB3Tag(new ByteBufferKaitaiStream(fileName));
                }
                public DToB3Tag() {
                    this(null, null, null);
                }

                public DToB3Tag(KaitaiStream _io) {
                    this(_io, null, null);
                }

                public DToB3Tag(KaitaiStream _io, Icc4.TagTable.TagDefinition _parent) {
                    this(_io, _parent, null);
                }

                public DToB3Tag(KaitaiStream _io, Icc4.TagTable.TagDefinition _parent, Icc4 _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                }
                public void _read() {
                    this.tagType = Icc4.TagTable.TagDefinition.TagTypeSignatures.byId(this._io.readU4be());
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case MULTI_PROCESS_ELEMENTS_TYPE: {
                                this.tagData = new MultiProcessElementsType(this._io, this, _root);
                                this.tagData._read();
                                break;
                            }
                            }
                        }
                    }
                    _dirty = false;
                }

                public void _fetchInstances() {
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case MULTI_PROCESS_ELEMENTS_TYPE: {
                                this.tagData._fetchInstances();
                                break;
                            }
                            }
                        }
                    }
                }

                public void _write_Seq() {
                    _assertNotDirty();
                    this._io.writeU4be(((Number) (this.tagType.id())).longValue());
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case MULTI_PROCESS_ELEMENTS_TYPE: {
                                this.tagData._write_Seq(this._io);
                                break;
                            }
                            }
                        }
                    }
                }

                public void _check() {
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case MULTI_PROCESS_ELEMENTS_TYPE: {
                                if (!Objects.equals(this.tagData._root(), _root()))
                                    throw new ConsistencyError("tag_data", _root(), this.tagData._root());
                                if (!Objects.equals(this.tagData._parent(), this))
                                    throw new ConsistencyError("tag_data", this, this.tagData._parent());
                                break;
                            }
                            }
                        }
                    }
                    _dirty = false;
                }
                private TagTypeSignatures tagType;
                private MultiProcessElementsType tagData;
                private Icc4 _root;
                private Icc4.TagTable.TagDefinition _parent;
                public TagTypeSignatures tagType() { return tagType; }
                public void setTagType(TagTypeSignatures _v) { _dirty = true; tagType = _v; }
                public MultiProcessElementsType tagData() { return tagData; }
                public void setTagData(MultiProcessElementsType _v) { _dirty = true; tagData = _v; }
                public Icc4 _root() { return _root; }
                public void set_root(Icc4 _v) { _dirty = true; _root = _v; }
                public Icc4.TagTable.TagDefinition _parent() { return _parent; }
                public void set_parent(Icc4.TagTable.TagDefinition _v) { _dirty = true; _parent = _v; }
            }
            public static class DataType extends KaitaiStruct.ReadWrite {
                public static DataType fromFile(String fileName) throws IOException {
                    return new DataType(new ByteBufferKaitaiStream(fileName));
                }

                public enum DataTypes {
                    ASCII_DATA(0),
                    BINARY_DATA(1);

                    private final long id;
                    DataTypes(long id) { this.id = id; }
                    public long id() { return id; }
                    private static final Map<Long, DataTypes> byId = new HashMap<Long, DataTypes>(2);
                    static {
                        for (DataTypes e : DataTypes.values())
                            byId.put(e.id(), e);
                    }
                    public static DataTypes byId(long id) { return byId.get(id); }
                }
                public DataType() {
                    this(null, null, null);
                }

                public DataType(KaitaiStream _io) {
                    this(_io, null, null);
                }

                public DataType(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
                    this(_io, _parent, null);
                }

                public DataType(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, Icc4 _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                }
                public void _read() {
                    this.dataFlag = DataTypes.byId(this._io.readU4be());
                    _dirty = false;
                }

                public void _fetchInstances() {
                }

                public void _write_Seq() {
                    _assertNotDirty();
                    this._io.writeU4be(((Number) (this.dataFlag.id())).longValue());
                }

                public void _check() {
                    _dirty = false;
                }
                private DataTypes dataFlag;
                private Icc4 _root;
                private KaitaiStruct.ReadWrite _parent;
                public DataTypes dataFlag() { return dataFlag; }
                public void setDataFlag(DataTypes _v) { _dirty = true; dataFlag = _v; }
                public Icc4 _root() { return _root; }
                public void set_root(Icc4 _v) { _dirty = true; _root = _v; }
                public KaitaiStruct.ReadWrite _parent() { return _parent; }
                public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
            }
            public static class DateTimeType extends KaitaiStruct.ReadWrite {
                public static DateTimeType fromFile(String fileName) throws IOException {
                    return new DateTimeType(new ByteBufferKaitaiStream(fileName));
                }
                public DateTimeType() {
                    this(null, null, null);
                }

                public DateTimeType(KaitaiStream _io) {
                    this(_io, null, null);
                }

                public DateTimeType(KaitaiStream _io, Icc4.TagTable.TagDefinition.CalibrationDateTimeTag _parent) {
                    this(_io, _parent, null);
                }

                public DateTimeType(KaitaiStream _io, Icc4.TagTable.TagDefinition.CalibrationDateTimeTag _parent, Icc4 _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                }
                public void _read() {
                    this.reserved = this._io.readBytes(4);
                    if (!(Arrays.equals(this.reserved, new byte[] { 0, 0, 0, 0 }))) {
                        throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0, 0, 0, 0 }, this.reserved, this._io, "/types/tag_table/types/tag_definition/types/date_time_type/seq/0");
                    }
                    this.dateAndTime = new DateTimeNumber(this._io, this, _root);
                    this.dateAndTime._read();
                    _dirty = false;
                }

                public void _fetchInstances() {
                    this.dateAndTime._fetchInstances();
                }

                public void _write_Seq() {
                    _assertNotDirty();
                    this._io.writeBytes(this.reserved);
                    this.dateAndTime._write_Seq(this._io);
                }

                public void _check() {
                    if (this.reserved.length != 4)
                        throw new ConsistencyError("reserved", 4, this.reserved.length);
                    if (!(Arrays.equals(this.reserved, new byte[] { 0, 0, 0, 0 }))) {
                        throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0, 0, 0, 0 }, this.reserved, null, "/types/tag_table/types/tag_definition/types/date_time_type/seq/0");
                    }
                    if (!Objects.equals(this.dateAndTime._root(), _root()))
                        throw new ConsistencyError("date_and_time", _root(), this.dateAndTime._root());
                    if (!Objects.equals(this.dateAndTime._parent(), this))
                        throw new ConsistencyError("date_and_time", this, this.dateAndTime._parent());
                    _dirty = false;
                }
                private byte[] reserved;
                private DateTimeNumber dateAndTime;
                private Icc4 _root;
                private Icc4.TagTable.TagDefinition.CalibrationDateTimeTag _parent;
                public byte[] reserved() { return reserved; }
                public void setReserved(byte[] _v) { _dirty = true; reserved = _v; }
                public DateTimeNumber dateAndTime() { return dateAndTime; }
                public void setDateAndTime(DateTimeNumber _v) { _dirty = true; dateAndTime = _v; }
                public Icc4 _root() { return _root; }
                public void set_root(Icc4 _v) { _dirty = true; _root = _v; }
                public Icc4.TagTable.TagDefinition.CalibrationDateTimeTag _parent() { return _parent; }
                public void set_parent(Icc4.TagTable.TagDefinition.CalibrationDateTimeTag _v) { _dirty = true; _parent = _v; }
            }
            public static class DeviceMfgDescTag extends KaitaiStruct.ReadWrite {
                public static DeviceMfgDescTag fromFile(String fileName) throws IOException {
                    return new DeviceMfgDescTag(new ByteBufferKaitaiStream(fileName));
                }
                public DeviceMfgDescTag() {
                    this(null, null, null);
                }

                public DeviceMfgDescTag(KaitaiStream _io) {
                    this(_io, null, null);
                }

                public DeviceMfgDescTag(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
                    this(_io, _parent, null);
                }

                public DeviceMfgDescTag(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, Icc4 _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                }
                public void _read() {
                    this.tagType = Icc4.TagTable.TagDefinition.TagTypeSignatures.byId(this._io.readU4be());
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case MULTI_LOCALIZED_UNICODE_TYPE: {
                                this.tagData = new MultiLocalizedUnicodeType(this._io, this, _root);
                                this.tagData._read();
                                break;
                            }
                            }
                        }
                    }
                    _dirty = false;
                }

                public void _fetchInstances() {
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case MULTI_LOCALIZED_UNICODE_TYPE: {
                                this.tagData._fetchInstances();
                                break;
                            }
                            }
                        }
                    }
                }

                public void _write_Seq() {
                    _assertNotDirty();
                    this._io.writeU4be(((Number) (this.tagType.id())).longValue());
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case MULTI_LOCALIZED_UNICODE_TYPE: {
                                this.tagData._write_Seq(this._io);
                                break;
                            }
                            }
                        }
                    }
                }

                public void _check() {
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case MULTI_LOCALIZED_UNICODE_TYPE: {
                                if (!Objects.equals(this.tagData._root(), _root()))
                                    throw new ConsistencyError("tag_data", _root(), this.tagData._root());
                                if (!Objects.equals(this.tagData._parent(), this))
                                    throw new ConsistencyError("tag_data", this, this.tagData._parent());
                                break;
                            }
                            }
                        }
                    }
                    _dirty = false;
                }
                private TagTypeSignatures tagType;
                private MultiLocalizedUnicodeType tagData;
                private Icc4 _root;
                private KaitaiStruct.ReadWrite _parent;
                public TagTypeSignatures tagType() { return tagType; }
                public void setTagType(TagTypeSignatures _v) { _dirty = true; tagType = _v; }
                public MultiLocalizedUnicodeType tagData() { return tagData; }
                public void setTagData(MultiLocalizedUnicodeType _v) { _dirty = true; tagData = _v; }
                public Icc4 _root() { return _root; }
                public void set_root(Icc4 _v) { _dirty = true; _root = _v; }
                public KaitaiStruct.ReadWrite _parent() { return _parent; }
                public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
            }
            public static class DeviceModelDescTag extends KaitaiStruct.ReadWrite {
                public static DeviceModelDescTag fromFile(String fileName) throws IOException {
                    return new DeviceModelDescTag(new ByteBufferKaitaiStream(fileName));
                }
                public DeviceModelDescTag() {
                    this(null, null, null);
                }

                public DeviceModelDescTag(KaitaiStream _io) {
                    this(_io, null, null);
                }

                public DeviceModelDescTag(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
                    this(_io, _parent, null);
                }

                public DeviceModelDescTag(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, Icc4 _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                }
                public void _read() {
                    this.tagType = Icc4.TagTable.TagDefinition.TagTypeSignatures.byId(this._io.readU4be());
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case MULTI_LOCALIZED_UNICODE_TYPE: {
                                this.tagData = new MultiLocalizedUnicodeType(this._io, this, _root);
                                this.tagData._read();
                                break;
                            }
                            }
                        }
                    }
                    _dirty = false;
                }

                public void _fetchInstances() {
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case MULTI_LOCALIZED_UNICODE_TYPE: {
                                this.tagData._fetchInstances();
                                break;
                            }
                            }
                        }
                    }
                }

                public void _write_Seq() {
                    _assertNotDirty();
                    this._io.writeU4be(((Number) (this.tagType.id())).longValue());
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case MULTI_LOCALIZED_UNICODE_TYPE: {
                                this.tagData._write_Seq(this._io);
                                break;
                            }
                            }
                        }
                    }
                }

                public void _check() {
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case MULTI_LOCALIZED_UNICODE_TYPE: {
                                if (!Objects.equals(this.tagData._root(), _root()))
                                    throw new ConsistencyError("tag_data", _root(), this.tagData._root());
                                if (!Objects.equals(this.tagData._parent(), this))
                                    throw new ConsistencyError("tag_data", this, this.tagData._parent());
                                break;
                            }
                            }
                        }
                    }
                    _dirty = false;
                }
                private TagTypeSignatures tagType;
                private MultiLocalizedUnicodeType tagData;
                private Icc4 _root;
                private KaitaiStruct.ReadWrite _parent;
                public TagTypeSignatures tagType() { return tagType; }
                public void setTagType(TagTypeSignatures _v) { _dirty = true; tagType = _v; }
                public MultiLocalizedUnicodeType tagData() { return tagData; }
                public void setTagData(MultiLocalizedUnicodeType _v) { _dirty = true; tagData = _v; }
                public Icc4 _root() { return _root; }
                public void set_root(Icc4 _v) { _dirty = true; _root = _v; }
                public KaitaiStruct.ReadWrite _parent() { return _parent; }
                public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
            }
            public static class GamutTag extends KaitaiStruct.ReadWrite {
                public static GamutTag fromFile(String fileName) throws IOException {
                    return new GamutTag(new ByteBufferKaitaiStream(fileName));
                }
                public GamutTag() {
                    this(null, null, null);
                }

                public GamutTag(KaitaiStream _io) {
                    this(_io, null, null);
                }

                public GamutTag(KaitaiStream _io, Icc4.TagTable.TagDefinition _parent) {
                    this(_io, _parent, null);
                }

                public GamutTag(KaitaiStream _io, Icc4.TagTable.TagDefinition _parent, Icc4 _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                }
                public void _read() {
                    this.tagType = Icc4.TagTable.TagDefinition.TagTypeSignatures.byId(this._io.readU4be());
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case MULTI_FUNCTION_B_TO_A_TABLE_TYPE: {
                                this.tagData = new LutBToAType(this._io, this, _root);
                                ((LutBToAType) (this.tagData))._read();
                                break;
                            }
                            case MULTI_FUNCTION_TABLE_WITH_ONE_BYTE_PRECISION_TYPE: {
                                this.tagData = new Lut8Type(this._io, this, _root);
                                ((Lut8Type) (this.tagData))._read();
                                break;
                            }
                            case MULTI_FUNCTION_TABLE_WITH_TWO_BYTE_PRECISION_TYPE: {
                                this.tagData = new Lut16Type(this._io, this, _root);
                                ((Lut16Type) (this.tagData))._read();
                                break;
                            }
                            }
                        }
                    }
                    _dirty = false;
                }

                public void _fetchInstances() {
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case MULTI_FUNCTION_B_TO_A_TABLE_TYPE: {
                                ((LutBToAType) (this.tagData))._fetchInstances();
                                break;
                            }
                            case MULTI_FUNCTION_TABLE_WITH_ONE_BYTE_PRECISION_TYPE: {
                                ((Lut8Type) (this.tagData))._fetchInstances();
                                break;
                            }
                            case MULTI_FUNCTION_TABLE_WITH_TWO_BYTE_PRECISION_TYPE: {
                                ((Lut16Type) (this.tagData))._fetchInstances();
                                break;
                            }
                            }
                        }
                    }
                }

                public void _write_Seq() {
                    _assertNotDirty();
                    this._io.writeU4be(((Number) (this.tagType.id())).longValue());
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case MULTI_FUNCTION_B_TO_A_TABLE_TYPE: {
                                ((LutBToAType) (this.tagData))._write_Seq(this._io);
                                break;
                            }
                            case MULTI_FUNCTION_TABLE_WITH_ONE_BYTE_PRECISION_TYPE: {
                                ((Lut8Type) (this.tagData))._write_Seq(this._io);
                                break;
                            }
                            case MULTI_FUNCTION_TABLE_WITH_TWO_BYTE_PRECISION_TYPE: {
                                ((Lut16Type) (this.tagData))._write_Seq(this._io);
                                break;
                            }
                            }
                        }
                    }
                }

                public void _check() {
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case MULTI_FUNCTION_B_TO_A_TABLE_TYPE: {
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.LutBToAType) (this.tagData))._root(), _root()))
                                    throw new ConsistencyError("tag_data", _root(), ((Icc4.TagTable.TagDefinition.LutBToAType) (this.tagData))._root());
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.LutBToAType) (this.tagData))._parent(), this))
                                    throw new ConsistencyError("tag_data", this, ((Icc4.TagTable.TagDefinition.LutBToAType) (this.tagData))._parent());
                                break;
                            }
                            case MULTI_FUNCTION_TABLE_WITH_ONE_BYTE_PRECISION_TYPE: {
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.Lut8Type) (this.tagData))._root(), _root()))
                                    throw new ConsistencyError("tag_data", _root(), ((Icc4.TagTable.TagDefinition.Lut8Type) (this.tagData))._root());
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.Lut8Type) (this.tagData))._parent(), this))
                                    throw new ConsistencyError("tag_data", this, ((Icc4.TagTable.TagDefinition.Lut8Type) (this.tagData))._parent());
                                break;
                            }
                            case MULTI_FUNCTION_TABLE_WITH_TWO_BYTE_PRECISION_TYPE: {
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.Lut16Type) (this.tagData))._root(), _root()))
                                    throw new ConsistencyError("tag_data", _root(), ((Icc4.TagTable.TagDefinition.Lut16Type) (this.tagData))._root());
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.Lut16Type) (this.tagData))._parent(), this))
                                    throw new ConsistencyError("tag_data", this, ((Icc4.TagTable.TagDefinition.Lut16Type) (this.tagData))._parent());
                                break;
                            }
                            }
                        }
                    }
                    _dirty = false;
                }
                private TagTypeSignatures tagType;
                private KaitaiStruct.ReadWrite tagData;
                private Icc4 _root;
                private Icc4.TagTable.TagDefinition _parent;
                public TagTypeSignatures tagType() { return tagType; }
                public void setTagType(TagTypeSignatures _v) { _dirty = true; tagType = _v; }
                public KaitaiStruct.ReadWrite tagData() { return tagData; }
                public void setTagData(KaitaiStruct.ReadWrite _v) { _dirty = true; tagData = _v; }
                public Icc4 _root() { return _root; }
                public void set_root(Icc4 _v) { _dirty = true; _root = _v; }
                public Icc4.TagTable.TagDefinition _parent() { return _parent; }
                public void set_parent(Icc4.TagTable.TagDefinition _v) { _dirty = true; _parent = _v; }
            }
            public static class GrayTrcTag extends KaitaiStruct.ReadWrite {
                public static GrayTrcTag fromFile(String fileName) throws IOException {
                    return new GrayTrcTag(new ByteBufferKaitaiStream(fileName));
                }
                public GrayTrcTag() {
                    this(null, null, null);
                }

                public GrayTrcTag(KaitaiStream _io) {
                    this(_io, null, null);
                }

                public GrayTrcTag(KaitaiStream _io, Icc4.TagTable.TagDefinition _parent) {
                    this(_io, _parent, null);
                }

                public GrayTrcTag(KaitaiStream _io, Icc4.TagTable.TagDefinition _parent, Icc4 _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                }
                public void _read() {
                    this.tagType = Icc4.TagTable.TagDefinition.TagTypeSignatures.byId(this._io.readU4be());
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case CURVE_TYPE: {
                                this.tagData = new CurveType(this._io, this, _root);
                                ((CurveType) (this.tagData))._read();
                                break;
                            }
                            case PARAMETRIC_CURVE_TYPE: {
                                this.tagData = new ParametricCurveType(this._io, this, _root);
                                ((ParametricCurveType) (this.tagData))._read();
                                break;
                            }
                            }
                        }
                    }
                    _dirty = false;
                }

                public void _fetchInstances() {
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case CURVE_TYPE: {
                                ((CurveType) (this.tagData))._fetchInstances();
                                break;
                            }
                            case PARAMETRIC_CURVE_TYPE: {
                                ((ParametricCurveType) (this.tagData))._fetchInstances();
                                break;
                            }
                            }
                        }
                    }
                }

                public void _write_Seq() {
                    _assertNotDirty();
                    this._io.writeU4be(((Number) (this.tagType.id())).longValue());
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case CURVE_TYPE: {
                                ((CurveType) (this.tagData))._write_Seq(this._io);
                                break;
                            }
                            case PARAMETRIC_CURVE_TYPE: {
                                ((ParametricCurveType) (this.tagData))._write_Seq(this._io);
                                break;
                            }
                            }
                        }
                    }
                }

                public void _check() {
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case CURVE_TYPE: {
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.CurveType) (this.tagData))._root(), _root()))
                                    throw new ConsistencyError("tag_data", _root(), ((Icc4.TagTable.TagDefinition.CurveType) (this.tagData))._root());
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.CurveType) (this.tagData))._parent(), this))
                                    throw new ConsistencyError("tag_data", this, ((Icc4.TagTable.TagDefinition.CurveType) (this.tagData))._parent());
                                break;
                            }
                            case PARAMETRIC_CURVE_TYPE: {
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.ParametricCurveType) (this.tagData))._root(), _root()))
                                    throw new ConsistencyError("tag_data", _root(), ((Icc4.TagTable.TagDefinition.ParametricCurveType) (this.tagData))._root());
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.ParametricCurveType) (this.tagData))._parent(), this))
                                    throw new ConsistencyError("tag_data", this, ((Icc4.TagTable.TagDefinition.ParametricCurveType) (this.tagData))._parent());
                                break;
                            }
                            }
                        }
                    }
                    _dirty = false;
                }
                private TagTypeSignatures tagType;
                private KaitaiStruct.ReadWrite tagData;
                private Icc4 _root;
                private Icc4.TagTable.TagDefinition _parent;
                public TagTypeSignatures tagType() { return tagType; }
                public void setTagType(TagTypeSignatures _v) { _dirty = true; tagType = _v; }
                public KaitaiStruct.ReadWrite tagData() { return tagData; }
                public void setTagData(KaitaiStruct.ReadWrite _v) { _dirty = true; tagData = _v; }
                public Icc4 _root() { return _root; }
                public void set_root(Icc4 _v) { _dirty = true; _root = _v; }
                public Icc4.TagTable.TagDefinition _parent() { return _parent; }
                public void set_parent(Icc4.TagTable.TagDefinition _v) { _dirty = true; _parent = _v; }
            }
            public static class GreenMatrixColumnTag extends KaitaiStruct.ReadWrite {
                public static GreenMatrixColumnTag fromFile(String fileName) throws IOException {
                    return new GreenMatrixColumnTag(new ByteBufferKaitaiStream(fileName));
                }
                public GreenMatrixColumnTag() {
                    this(null, null, null);
                }

                public GreenMatrixColumnTag(KaitaiStream _io) {
                    this(_io, null, null);
                }

                public GreenMatrixColumnTag(KaitaiStream _io, Icc4.TagTable.TagDefinition _parent) {
                    this(_io, _parent, null);
                }

                public GreenMatrixColumnTag(KaitaiStream _io, Icc4.TagTable.TagDefinition _parent, Icc4 _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                }
                public void _read() {
                    this.tagType = Icc4.TagTable.TagDefinition.TagTypeSignatures.byId(this._io.readU4be());
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case XYZ_TYPE: {
                                this.tagData = new XyzType(this._io, this, _root);
                                this.tagData._read();
                                break;
                            }
                            }
                        }
                    }
                    _dirty = false;
                }

                public void _fetchInstances() {
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case XYZ_TYPE: {
                                this.tagData._fetchInstances();
                                break;
                            }
                            }
                        }
                    }
                }

                public void _write_Seq() {
                    _assertNotDirty();
                    this._io.writeU4be(((Number) (this.tagType.id())).longValue());
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case XYZ_TYPE: {
                                this.tagData._write_Seq(this._io);
                                break;
                            }
                            }
                        }
                    }
                }

                public void _check() {
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case XYZ_TYPE: {
                                if (!Objects.equals(this.tagData._root(), _root()))
                                    throw new ConsistencyError("tag_data", _root(), this.tagData._root());
                                if (!Objects.equals(this.tagData._parent(), this))
                                    throw new ConsistencyError("tag_data", this, this.tagData._parent());
                                break;
                            }
                            }
                        }
                    }
                    _dirty = false;
                }
                private TagTypeSignatures tagType;
                private XyzType tagData;
                private Icc4 _root;
                private Icc4.TagTable.TagDefinition _parent;
                public TagTypeSignatures tagType() { return tagType; }
                public void setTagType(TagTypeSignatures _v) { _dirty = true; tagType = _v; }
                public XyzType tagData() { return tagData; }
                public void setTagData(XyzType _v) { _dirty = true; tagData = _v; }
                public Icc4 _root() { return _root; }
                public void set_root(Icc4 _v) { _dirty = true; _root = _v; }
                public Icc4.TagTable.TagDefinition _parent() { return _parent; }
                public void set_parent(Icc4.TagTable.TagDefinition _v) { _dirty = true; _parent = _v; }
            }
            public static class GreenTrcTag extends KaitaiStruct.ReadWrite {
                public static GreenTrcTag fromFile(String fileName) throws IOException {
                    return new GreenTrcTag(new ByteBufferKaitaiStream(fileName));
                }
                public GreenTrcTag() {
                    this(null, null, null);
                }

                public GreenTrcTag(KaitaiStream _io) {
                    this(_io, null, null);
                }

                public GreenTrcTag(KaitaiStream _io, Icc4.TagTable.TagDefinition _parent) {
                    this(_io, _parent, null);
                }

                public GreenTrcTag(KaitaiStream _io, Icc4.TagTable.TagDefinition _parent, Icc4 _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                }
                public void _read() {
                    this.tagType = Icc4.TagTable.TagDefinition.TagTypeSignatures.byId(this._io.readU4be());
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case CURVE_TYPE: {
                                this.tagData = new CurveType(this._io, this, _root);
                                ((CurveType) (this.tagData))._read();
                                break;
                            }
                            case PARAMETRIC_CURVE_TYPE: {
                                this.tagData = new ParametricCurveType(this._io, this, _root);
                                ((ParametricCurveType) (this.tagData))._read();
                                break;
                            }
                            }
                        }
                    }
                    _dirty = false;
                }

                public void _fetchInstances() {
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case CURVE_TYPE: {
                                ((CurveType) (this.tagData))._fetchInstances();
                                break;
                            }
                            case PARAMETRIC_CURVE_TYPE: {
                                ((ParametricCurveType) (this.tagData))._fetchInstances();
                                break;
                            }
                            }
                        }
                    }
                }

                public void _write_Seq() {
                    _assertNotDirty();
                    this._io.writeU4be(((Number) (this.tagType.id())).longValue());
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case CURVE_TYPE: {
                                ((CurveType) (this.tagData))._write_Seq(this._io);
                                break;
                            }
                            case PARAMETRIC_CURVE_TYPE: {
                                ((ParametricCurveType) (this.tagData))._write_Seq(this._io);
                                break;
                            }
                            }
                        }
                    }
                }

                public void _check() {
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case CURVE_TYPE: {
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.CurveType) (this.tagData))._root(), _root()))
                                    throw new ConsistencyError("tag_data", _root(), ((Icc4.TagTable.TagDefinition.CurveType) (this.tagData))._root());
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.CurveType) (this.tagData))._parent(), this))
                                    throw new ConsistencyError("tag_data", this, ((Icc4.TagTable.TagDefinition.CurveType) (this.tagData))._parent());
                                break;
                            }
                            case PARAMETRIC_CURVE_TYPE: {
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.ParametricCurveType) (this.tagData))._root(), _root()))
                                    throw new ConsistencyError("tag_data", _root(), ((Icc4.TagTable.TagDefinition.ParametricCurveType) (this.tagData))._root());
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.ParametricCurveType) (this.tagData))._parent(), this))
                                    throw new ConsistencyError("tag_data", this, ((Icc4.TagTable.TagDefinition.ParametricCurveType) (this.tagData))._parent());
                                break;
                            }
                            }
                        }
                    }
                    _dirty = false;
                }
                private TagTypeSignatures tagType;
                private KaitaiStruct.ReadWrite tagData;
                private Icc4 _root;
                private Icc4.TagTable.TagDefinition _parent;
                public TagTypeSignatures tagType() { return tagType; }
                public void setTagType(TagTypeSignatures _v) { _dirty = true; tagType = _v; }
                public KaitaiStruct.ReadWrite tagData() { return tagData; }
                public void setTagData(KaitaiStruct.ReadWrite _v) { _dirty = true; tagData = _v; }
                public Icc4 _root() { return _root; }
                public void set_root(Icc4 _v) { _dirty = true; _root = _v; }
                public Icc4.TagTable.TagDefinition _parent() { return _parent; }
                public void set_parent(Icc4.TagTable.TagDefinition _v) { _dirty = true; _parent = _v; }
            }
            public static class LuminanceTag extends KaitaiStruct.ReadWrite {
                public static LuminanceTag fromFile(String fileName) throws IOException {
                    return new LuminanceTag(new ByteBufferKaitaiStream(fileName));
                }
                public LuminanceTag() {
                    this(null, null, null);
                }

                public LuminanceTag(KaitaiStream _io) {
                    this(_io, null, null);
                }

                public LuminanceTag(KaitaiStream _io, Icc4.TagTable.TagDefinition _parent) {
                    this(_io, _parent, null);
                }

                public LuminanceTag(KaitaiStream _io, Icc4.TagTable.TagDefinition _parent, Icc4 _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                }
                public void _read() {
                    this.tagType = Icc4.TagTable.TagDefinition.TagTypeSignatures.byId(this._io.readU4be());
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case XYZ_TYPE: {
                                this.tagData = new XyzType(this._io, this, _root);
                                this.tagData._read();
                                break;
                            }
                            }
                        }
                    }
                    _dirty = false;
                }

                public void _fetchInstances() {
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case XYZ_TYPE: {
                                this.tagData._fetchInstances();
                                break;
                            }
                            }
                        }
                    }
                }

                public void _write_Seq() {
                    _assertNotDirty();
                    this._io.writeU4be(((Number) (this.tagType.id())).longValue());
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case XYZ_TYPE: {
                                this.tagData._write_Seq(this._io);
                                break;
                            }
                            }
                        }
                    }
                }

                public void _check() {
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case XYZ_TYPE: {
                                if (!Objects.equals(this.tagData._root(), _root()))
                                    throw new ConsistencyError("tag_data", _root(), this.tagData._root());
                                if (!Objects.equals(this.tagData._parent(), this))
                                    throw new ConsistencyError("tag_data", this, this.tagData._parent());
                                break;
                            }
                            }
                        }
                    }
                    _dirty = false;
                }
                private TagTypeSignatures tagType;
                private XyzType tagData;
                private Icc4 _root;
                private Icc4.TagTable.TagDefinition _parent;
                public TagTypeSignatures tagType() { return tagType; }
                public void setTagType(TagTypeSignatures _v) { _dirty = true; tagType = _v; }
                public XyzType tagData() { return tagData; }
                public void setTagData(XyzType _v) { _dirty = true; tagData = _v; }
                public Icc4 _root() { return _root; }
                public void set_root(Icc4 _v) { _dirty = true; _root = _v; }
                public Icc4.TagTable.TagDefinition _parent() { return _parent; }
                public void set_parent(Icc4.TagTable.TagDefinition _v) { _dirty = true; _parent = _v; }
            }
            public static class Lut16Type extends KaitaiStruct.ReadWrite {
                public static Lut16Type fromFile(String fileName) throws IOException {
                    return new Lut16Type(new ByteBufferKaitaiStream(fileName));
                }
                public Lut16Type() {
                    this(null, null, null);
                }

                public Lut16Type(KaitaiStream _io) {
                    this(_io, null, null);
                }

                public Lut16Type(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
                    this(_io, _parent, null);
                }

                public Lut16Type(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, Icc4 _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                }
                public void _read() {
                    this.reserved = this._io.readBytes(4);
                    if (!(Arrays.equals(this.reserved, new byte[] { 0, 0, 0, 0 }))) {
                        throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0, 0, 0, 0 }, this.reserved, this._io, "/types/tag_table/types/tag_definition/types/lut_16_type/seq/0");
                    }
                    this.numberOfInputChannels = this._io.readU1();
                    this.numberOfOutputChannels = this._io.readU1();
                    this.numberOfClutGridPoints = this._io.readU1();
                    this.padding = this._io.readBytes(1);
                    if (!(Arrays.equals(this.padding, new byte[] { 0 }))) {
                        throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0 }, this.padding, this._io, "/types/tag_table/types/tag_definition/types/lut_16_type/seq/4");
                    }
                    this.encodedEParameters = new ArrayList<Integer>();
                    for (int i = 0; i < 9; i++) {
                        this.encodedEParameters.add(this._io.readS4be());
                    }
                    this.numberOfInputTableEntries = this._io.readU2be();
                    this.numberOfOutputTableEntries = this._io.readU2be();
                    this.inputTables = this._io.readBytes((2 * numberOfInputChannels()) * numberOfInputTableEntries());
                    this.clutValues = this._io.readBytes((2 * (numberOfClutGridPoints() ^ numberOfInputChannels())) * numberOfOutputChannels());
                    this.outputTables = this._io.readBytes((2 * numberOfOutputChannels()) * numberOfOutputTableEntries());
                    _dirty = false;
                }

                public void _fetchInstances() {
                    for (int i = 0; i < this.encodedEParameters.size(); i++) {
                    }
                }

                public void _write_Seq() {
                    _assertNotDirty();
                    this._io.writeBytes(this.reserved);
                    this._io.writeU1(this.numberOfInputChannels);
                    this._io.writeU1(this.numberOfOutputChannels);
                    this._io.writeU1(this.numberOfClutGridPoints);
                    this._io.writeBytes(this.padding);
                    for (int i = 0; i < this.encodedEParameters.size(); i++) {
                        this._io.writeS4be(this.encodedEParameters.get(((Number) (i)).intValue()));
                    }
                    this._io.writeU2be(this.numberOfInputTableEntries);
                    this._io.writeU2be(this.numberOfOutputTableEntries);
                    this._io.writeBytes(this.inputTables);
                    this._io.writeBytes(this.clutValues);
                    this._io.writeBytes(this.outputTables);
                }

                public void _check() {
                    if (this.reserved.length != 4)
                        throw new ConsistencyError("reserved", 4, this.reserved.length);
                    if (!(Arrays.equals(this.reserved, new byte[] { 0, 0, 0, 0 }))) {
                        throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0, 0, 0, 0 }, this.reserved, null, "/types/tag_table/types/tag_definition/types/lut_16_type/seq/0");
                    }
                    if (this.padding.length != 1)
                        throw new ConsistencyError("padding", 1, this.padding.length);
                    if (!(Arrays.equals(this.padding, new byte[] { 0 }))) {
                        throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0 }, this.padding, null, "/types/tag_table/types/tag_definition/types/lut_16_type/seq/4");
                    }
                    if (this.encodedEParameters.size() != 9)
                        throw new ConsistencyError("encoded_e_parameters", 9, this.encodedEParameters.size());
                    for (int i = 0; i < this.encodedEParameters.size(); i++) {
                    }
                    if (this.inputTables.length != (2 * numberOfInputChannels()) * numberOfInputTableEntries())
                        throw new ConsistencyError("input_tables", (2 * numberOfInputChannels()) * numberOfInputTableEntries(), this.inputTables.length);
                    if (this.clutValues.length != (2 * (numberOfClutGridPoints() ^ numberOfInputChannels())) * numberOfOutputChannels())
                        throw new ConsistencyError("clut_values", (2 * (numberOfClutGridPoints() ^ numberOfInputChannels())) * numberOfOutputChannels(), this.clutValues.length);
                    if (this.outputTables.length != (2 * numberOfOutputChannels()) * numberOfOutputTableEntries())
                        throw new ConsistencyError("output_tables", (2 * numberOfOutputChannels()) * numberOfOutputTableEntries(), this.outputTables.length);
                    _dirty = false;
                }
                private byte[] reserved;
                private int numberOfInputChannels;
                private int numberOfOutputChannels;
                private int numberOfClutGridPoints;
                private byte[] padding;
                private List<Integer> encodedEParameters;
                private int numberOfInputTableEntries;
                private int numberOfOutputTableEntries;
                private byte[] inputTables;
                private byte[] clutValues;
                private byte[] outputTables;
                private Icc4 _root;
                private KaitaiStruct.ReadWrite _parent;
                public byte[] reserved() { return reserved; }
                public void setReserved(byte[] _v) { _dirty = true; reserved = _v; }
                public int numberOfInputChannels() { return numberOfInputChannels; }
                public void setNumberOfInputChannels(int _v) { _dirty = true; numberOfInputChannels = _v; }
                public int numberOfOutputChannels() { return numberOfOutputChannels; }
                public void setNumberOfOutputChannels(int _v) { _dirty = true; numberOfOutputChannels = _v; }
                public int numberOfClutGridPoints() { return numberOfClutGridPoints; }
                public void setNumberOfClutGridPoints(int _v) { _dirty = true; numberOfClutGridPoints = _v; }
                public byte[] padding() { return padding; }
                public void setPadding(byte[] _v) { _dirty = true; padding = _v; }
                public List<Integer> encodedEParameters() { return encodedEParameters; }
                public void setEncodedEParameters(List<Integer> _v) { _dirty = true; encodedEParameters = _v; }
                public int numberOfInputTableEntries() { return numberOfInputTableEntries; }
                public void setNumberOfInputTableEntries(int _v) { _dirty = true; numberOfInputTableEntries = _v; }
                public int numberOfOutputTableEntries() { return numberOfOutputTableEntries; }
                public void setNumberOfOutputTableEntries(int _v) { _dirty = true; numberOfOutputTableEntries = _v; }
                public byte[] inputTables() { return inputTables; }
                public void setInputTables(byte[] _v) { _dirty = true; inputTables = _v; }
                public byte[] clutValues() { return clutValues; }
                public void setClutValues(byte[] _v) { _dirty = true; clutValues = _v; }
                public byte[] outputTables() { return outputTables; }
                public void setOutputTables(byte[] _v) { _dirty = true; outputTables = _v; }
                public Icc4 _root() { return _root; }
                public void set_root(Icc4 _v) { _dirty = true; _root = _v; }
                public KaitaiStruct.ReadWrite _parent() { return _parent; }
                public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
            }
            public static class Lut8Type extends KaitaiStruct.ReadWrite {
                public static Lut8Type fromFile(String fileName) throws IOException {
                    return new Lut8Type(new ByteBufferKaitaiStream(fileName));
                }
                public Lut8Type() {
                    this(null, null, null);
                }

                public Lut8Type(KaitaiStream _io) {
                    this(_io, null, null);
                }

                public Lut8Type(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
                    this(_io, _parent, null);
                }

                public Lut8Type(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, Icc4 _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                }
                public void _read() {
                    this.reserved = this._io.readBytes(4);
                    if (!(Arrays.equals(this.reserved, new byte[] { 0, 0, 0, 0 }))) {
                        throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0, 0, 0, 0 }, this.reserved, this._io, "/types/tag_table/types/tag_definition/types/lut_8_type/seq/0");
                    }
                    this.numberOfInputChannels = this._io.readU1();
                    this.numberOfOutputChannels = this._io.readU1();
                    this.numberOfClutGridPoints = this._io.readU1();
                    this.padding = this._io.readBytes(1);
                    if (!(Arrays.equals(this.padding, new byte[] { 0 }))) {
                        throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0 }, this.padding, this._io, "/types/tag_table/types/tag_definition/types/lut_8_type/seq/4");
                    }
                    this.encodedEParameters = new ArrayList<Integer>();
                    for (int i = 0; i < 9; i++) {
                        this.encodedEParameters.add(this._io.readS4be());
                    }
                    this.numberOfInputTableEntries = this._io.readU4be();
                    this.numberOfOutputTableEntries = this._io.readU4be();
                    this.inputTables = this._io.readBytes(256 * numberOfInputChannels());
                    this.clutValues = this._io.readBytes((numberOfClutGridPoints() ^ numberOfInputChannels()) * numberOfOutputChannels());
                    this.outputTables = this._io.readBytes(256 * numberOfOutputChannels());
                    _dirty = false;
                }

                public void _fetchInstances() {
                    for (int i = 0; i < this.encodedEParameters.size(); i++) {
                    }
                }

                public void _write_Seq() {
                    _assertNotDirty();
                    this._io.writeBytes(this.reserved);
                    this._io.writeU1(this.numberOfInputChannels);
                    this._io.writeU1(this.numberOfOutputChannels);
                    this._io.writeU1(this.numberOfClutGridPoints);
                    this._io.writeBytes(this.padding);
                    for (int i = 0; i < this.encodedEParameters.size(); i++) {
                        this._io.writeS4be(this.encodedEParameters.get(((Number) (i)).intValue()));
                    }
                    this._io.writeU4be(this.numberOfInputTableEntries);
                    this._io.writeU4be(this.numberOfOutputTableEntries);
                    this._io.writeBytes(this.inputTables);
                    this._io.writeBytes(this.clutValues);
                    this._io.writeBytes(this.outputTables);
                }

                public void _check() {
                    if (this.reserved.length != 4)
                        throw new ConsistencyError("reserved", 4, this.reserved.length);
                    if (!(Arrays.equals(this.reserved, new byte[] { 0, 0, 0, 0 }))) {
                        throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0, 0, 0, 0 }, this.reserved, null, "/types/tag_table/types/tag_definition/types/lut_8_type/seq/0");
                    }
                    if (this.padding.length != 1)
                        throw new ConsistencyError("padding", 1, this.padding.length);
                    if (!(Arrays.equals(this.padding, new byte[] { 0 }))) {
                        throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0 }, this.padding, null, "/types/tag_table/types/tag_definition/types/lut_8_type/seq/4");
                    }
                    if (this.encodedEParameters.size() != 9)
                        throw new ConsistencyError("encoded_e_parameters", 9, this.encodedEParameters.size());
                    for (int i = 0; i < this.encodedEParameters.size(); i++) {
                    }
                    if (this.inputTables.length != 256 * numberOfInputChannels())
                        throw new ConsistencyError("input_tables", 256 * numberOfInputChannels(), this.inputTables.length);
                    if (this.clutValues.length != (numberOfClutGridPoints() ^ numberOfInputChannels()) * numberOfOutputChannels())
                        throw new ConsistencyError("clut_values", (numberOfClutGridPoints() ^ numberOfInputChannels()) * numberOfOutputChannels(), this.clutValues.length);
                    if (this.outputTables.length != 256 * numberOfOutputChannels())
                        throw new ConsistencyError("output_tables", 256 * numberOfOutputChannels(), this.outputTables.length);
                    _dirty = false;
                }
                private byte[] reserved;
                private int numberOfInputChannels;
                private int numberOfOutputChannels;
                private int numberOfClutGridPoints;
                private byte[] padding;
                private List<Integer> encodedEParameters;
                private long numberOfInputTableEntries;
                private long numberOfOutputTableEntries;
                private byte[] inputTables;
                private byte[] clutValues;
                private byte[] outputTables;
                private Icc4 _root;
                private KaitaiStruct.ReadWrite _parent;
                public byte[] reserved() { return reserved; }
                public void setReserved(byte[] _v) { _dirty = true; reserved = _v; }
                public int numberOfInputChannels() { return numberOfInputChannels; }
                public void setNumberOfInputChannels(int _v) { _dirty = true; numberOfInputChannels = _v; }
                public int numberOfOutputChannels() { return numberOfOutputChannels; }
                public void setNumberOfOutputChannels(int _v) { _dirty = true; numberOfOutputChannels = _v; }
                public int numberOfClutGridPoints() { return numberOfClutGridPoints; }
                public void setNumberOfClutGridPoints(int _v) { _dirty = true; numberOfClutGridPoints = _v; }
                public byte[] padding() { return padding; }
                public void setPadding(byte[] _v) { _dirty = true; padding = _v; }
                public List<Integer> encodedEParameters() { return encodedEParameters; }
                public void setEncodedEParameters(List<Integer> _v) { _dirty = true; encodedEParameters = _v; }
                public long numberOfInputTableEntries() { return numberOfInputTableEntries; }
                public void setNumberOfInputTableEntries(long _v) { _dirty = true; numberOfInputTableEntries = _v; }
                public long numberOfOutputTableEntries() { return numberOfOutputTableEntries; }
                public void setNumberOfOutputTableEntries(long _v) { _dirty = true; numberOfOutputTableEntries = _v; }
                public byte[] inputTables() { return inputTables; }
                public void setInputTables(byte[] _v) { _dirty = true; inputTables = _v; }
                public byte[] clutValues() { return clutValues; }
                public void setClutValues(byte[] _v) { _dirty = true; clutValues = _v; }
                public byte[] outputTables() { return outputTables; }
                public void setOutputTables(byte[] _v) { _dirty = true; outputTables = _v; }
                public Icc4 _root() { return _root; }
                public void set_root(Icc4 _v) { _dirty = true; _root = _v; }
                public KaitaiStruct.ReadWrite _parent() { return _parent; }
                public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
            }
            public static class LutAToBType extends KaitaiStruct.ReadWrite {
                public static LutAToBType fromFile(String fileName) throws IOException {
                    return new LutAToBType(new ByteBufferKaitaiStream(fileName));
                }
                public LutAToBType() {
                    this(null, null, null);
                }

                public LutAToBType(KaitaiStream _io) {
                    this(_io, null, null);
                }

                public LutAToBType(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
                    this(_io, _parent, null);
                }

                public LutAToBType(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, Icc4 _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                }
                public void _read() {
                    this.reserved = this._io.readBytes(4);
                    if (!(Arrays.equals(this.reserved, new byte[] { 0, 0, 0, 0 }))) {
                        throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0, 0, 0, 0 }, this.reserved, this._io, "/types/tag_table/types/tag_definition/types/lut_a_to_b_type/seq/0");
                    }
                    this.numberOfInputChannels = this._io.readU1();
                    this.numberOfOutputChannels = this._io.readU1();
                    this.padding = this._io.readBytes(2);
                    if (!(Arrays.equals(this.padding, new byte[] { 0, 0 }))) {
                        throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0, 0 }, this.padding, this._io, "/types/tag_table/types/tag_definition/types/lut_a_to_b_type/seq/3");
                    }
                    this.offsetToFirstBCurve = this._io.readU4be();
                    this.offsetToMatrix = this._io.readU4be();
                    this.offsetToFirstMCurve = this._io.readU4be();
                    this.offsetToClut = this._io.readU4be();
                    this.offsetToFirstACurve = this._io.readU4be();
                    this.data = this._io.readBytesFull();
                    _dirty = false;
                }

                public void _fetchInstances() {
                }

                public void _write_Seq() {
                    _assertNotDirty();
                    this._io.writeBytes(this.reserved);
                    this._io.writeU1(this.numberOfInputChannels);
                    this._io.writeU1(this.numberOfOutputChannels);
                    this._io.writeBytes(this.padding);
                    this._io.writeU4be(this.offsetToFirstBCurve);
                    this._io.writeU4be(this.offsetToMatrix);
                    this._io.writeU4be(this.offsetToFirstMCurve);
                    this._io.writeU4be(this.offsetToClut);
                    this._io.writeU4be(this.offsetToFirstACurve);
                    this._io.writeBytes(this.data);
                    if (!(this._io.isEof()))
                        throw new ConsistencyError("data", 0, this._io.size() - this._io.pos());
                }

                public void _check() {
                    if (this.reserved.length != 4)
                        throw new ConsistencyError("reserved", 4, this.reserved.length);
                    if (!(Arrays.equals(this.reserved, new byte[] { 0, 0, 0, 0 }))) {
                        throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0, 0, 0, 0 }, this.reserved, null, "/types/tag_table/types/tag_definition/types/lut_a_to_b_type/seq/0");
                    }
                    if (this.padding.length != 2)
                        throw new ConsistencyError("padding", 2, this.padding.length);
                    if (!(Arrays.equals(this.padding, new byte[] { 0, 0 }))) {
                        throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0, 0 }, this.padding, null, "/types/tag_table/types/tag_definition/types/lut_a_to_b_type/seq/3");
                    }
                    _dirty = false;
                }
                private byte[] reserved;
                private int numberOfInputChannels;
                private int numberOfOutputChannels;
                private byte[] padding;
                private long offsetToFirstBCurve;
                private long offsetToMatrix;
                private long offsetToFirstMCurve;
                private long offsetToClut;
                private long offsetToFirstACurve;
                private byte[] data;
                private Icc4 _root;
                private KaitaiStruct.ReadWrite _parent;
                public byte[] reserved() { return reserved; }
                public void setReserved(byte[] _v) { _dirty = true; reserved = _v; }
                public int numberOfInputChannels() { return numberOfInputChannels; }
                public void setNumberOfInputChannels(int _v) { _dirty = true; numberOfInputChannels = _v; }
                public int numberOfOutputChannels() { return numberOfOutputChannels; }
                public void setNumberOfOutputChannels(int _v) { _dirty = true; numberOfOutputChannels = _v; }
                public byte[] padding() { return padding; }
                public void setPadding(byte[] _v) { _dirty = true; padding = _v; }
                public long offsetToFirstBCurve() { return offsetToFirstBCurve; }
                public void setOffsetToFirstBCurve(long _v) { _dirty = true; offsetToFirstBCurve = _v; }
                public long offsetToMatrix() { return offsetToMatrix; }
                public void setOffsetToMatrix(long _v) { _dirty = true; offsetToMatrix = _v; }
                public long offsetToFirstMCurve() { return offsetToFirstMCurve; }
                public void setOffsetToFirstMCurve(long _v) { _dirty = true; offsetToFirstMCurve = _v; }
                public long offsetToClut() { return offsetToClut; }
                public void setOffsetToClut(long _v) { _dirty = true; offsetToClut = _v; }
                public long offsetToFirstACurve() { return offsetToFirstACurve; }
                public void setOffsetToFirstACurve(long _v) { _dirty = true; offsetToFirstACurve = _v; }
                public byte[] data() { return data; }
                public void setData(byte[] _v) { _dirty = true; data = _v; }
                public Icc4 _root() { return _root; }
                public void set_root(Icc4 _v) { _dirty = true; _root = _v; }
                public KaitaiStruct.ReadWrite _parent() { return _parent; }
                public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
            }
            public static class LutBToAType extends KaitaiStruct.ReadWrite {
                public static LutBToAType fromFile(String fileName) throws IOException {
                    return new LutBToAType(new ByteBufferKaitaiStream(fileName));
                }
                public LutBToAType() {
                    this(null, null, null);
                }

                public LutBToAType(KaitaiStream _io) {
                    this(_io, null, null);
                }

                public LutBToAType(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
                    this(_io, _parent, null);
                }

                public LutBToAType(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, Icc4 _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                }
                public void _read() {
                    this.reserved = this._io.readBytes(4);
                    if (!(Arrays.equals(this.reserved, new byte[] { 0, 0, 0, 0 }))) {
                        throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0, 0, 0, 0 }, this.reserved, this._io, "/types/tag_table/types/tag_definition/types/lut_b_to_a_type/seq/0");
                    }
                    this.numberOfInputChannels = this._io.readU1();
                    this.numberOfOutputChannels = this._io.readU1();
                    this.padding = this._io.readBytes(2);
                    if (!(Arrays.equals(this.padding, new byte[] { 0, 0 }))) {
                        throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0, 0 }, this.padding, this._io, "/types/tag_table/types/tag_definition/types/lut_b_to_a_type/seq/3");
                    }
                    this.offsetToFirstBCurve = this._io.readU4be();
                    this.offsetToMatrix = this._io.readU4be();
                    this.offsetToFirstMCurve = this._io.readU4be();
                    this.offsetToClut = this._io.readU4be();
                    this.offsetToFirstACurve = this._io.readU4be();
                    this.data = this._io.readBytesFull();
                    _dirty = false;
                }

                public void _fetchInstances() {
                }

                public void _write_Seq() {
                    _assertNotDirty();
                    this._io.writeBytes(this.reserved);
                    this._io.writeU1(this.numberOfInputChannels);
                    this._io.writeU1(this.numberOfOutputChannels);
                    this._io.writeBytes(this.padding);
                    this._io.writeU4be(this.offsetToFirstBCurve);
                    this._io.writeU4be(this.offsetToMatrix);
                    this._io.writeU4be(this.offsetToFirstMCurve);
                    this._io.writeU4be(this.offsetToClut);
                    this._io.writeU4be(this.offsetToFirstACurve);
                    this._io.writeBytes(this.data);
                    if (!(this._io.isEof()))
                        throw new ConsistencyError("data", 0, this._io.size() - this._io.pos());
                }

                public void _check() {
                    if (this.reserved.length != 4)
                        throw new ConsistencyError("reserved", 4, this.reserved.length);
                    if (!(Arrays.equals(this.reserved, new byte[] { 0, 0, 0, 0 }))) {
                        throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0, 0, 0, 0 }, this.reserved, null, "/types/tag_table/types/tag_definition/types/lut_b_to_a_type/seq/0");
                    }
                    if (this.padding.length != 2)
                        throw new ConsistencyError("padding", 2, this.padding.length);
                    if (!(Arrays.equals(this.padding, new byte[] { 0, 0 }))) {
                        throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0, 0 }, this.padding, null, "/types/tag_table/types/tag_definition/types/lut_b_to_a_type/seq/3");
                    }
                    _dirty = false;
                }
                private byte[] reserved;
                private int numberOfInputChannels;
                private int numberOfOutputChannels;
                private byte[] padding;
                private long offsetToFirstBCurve;
                private long offsetToMatrix;
                private long offsetToFirstMCurve;
                private long offsetToClut;
                private long offsetToFirstACurve;
                private byte[] data;
                private Icc4 _root;
                private KaitaiStruct.ReadWrite _parent;
                public byte[] reserved() { return reserved; }
                public void setReserved(byte[] _v) { _dirty = true; reserved = _v; }
                public int numberOfInputChannels() { return numberOfInputChannels; }
                public void setNumberOfInputChannels(int _v) { _dirty = true; numberOfInputChannels = _v; }
                public int numberOfOutputChannels() { return numberOfOutputChannels; }
                public void setNumberOfOutputChannels(int _v) { _dirty = true; numberOfOutputChannels = _v; }
                public byte[] padding() { return padding; }
                public void setPadding(byte[] _v) { _dirty = true; padding = _v; }
                public long offsetToFirstBCurve() { return offsetToFirstBCurve; }
                public void setOffsetToFirstBCurve(long _v) { _dirty = true; offsetToFirstBCurve = _v; }
                public long offsetToMatrix() { return offsetToMatrix; }
                public void setOffsetToMatrix(long _v) { _dirty = true; offsetToMatrix = _v; }
                public long offsetToFirstMCurve() { return offsetToFirstMCurve; }
                public void setOffsetToFirstMCurve(long _v) { _dirty = true; offsetToFirstMCurve = _v; }
                public long offsetToClut() { return offsetToClut; }
                public void setOffsetToClut(long _v) { _dirty = true; offsetToClut = _v; }
                public long offsetToFirstACurve() { return offsetToFirstACurve; }
                public void setOffsetToFirstACurve(long _v) { _dirty = true; offsetToFirstACurve = _v; }
                public byte[] data() { return data; }
                public void setData(byte[] _v) { _dirty = true; data = _v; }
                public Icc4 _root() { return _root; }
                public void set_root(Icc4 _v) { _dirty = true; _root = _v; }
                public KaitaiStruct.ReadWrite _parent() { return _parent; }
                public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
            }
            public static class MeasurementTag extends KaitaiStruct.ReadWrite {
                public static MeasurementTag fromFile(String fileName) throws IOException {
                    return new MeasurementTag(new ByteBufferKaitaiStream(fileName));
                }
                public MeasurementTag() {
                    this(null, null, null);
                }

                public MeasurementTag(KaitaiStream _io) {
                    this(_io, null, null);
                }

                public MeasurementTag(KaitaiStream _io, Icc4.TagTable.TagDefinition _parent) {
                    this(_io, _parent, null);
                }

                public MeasurementTag(KaitaiStream _io, Icc4.TagTable.TagDefinition _parent, Icc4 _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                }
                public void _read() {
                    this.tagType = Icc4.TagTable.TagDefinition.TagTypeSignatures.byId(this._io.readU4be());
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case MEASUREMENT_TYPE: {
                                this.tagData = new MeasurementType(this._io, this, _root);
                                this.tagData._read();
                                break;
                            }
                            }
                        }
                    }
                    _dirty = false;
                }

                public void _fetchInstances() {
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case MEASUREMENT_TYPE: {
                                this.tagData._fetchInstances();
                                break;
                            }
                            }
                        }
                    }
                }

                public void _write_Seq() {
                    _assertNotDirty();
                    this._io.writeU4be(((Number) (this.tagType.id())).longValue());
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case MEASUREMENT_TYPE: {
                                this.tagData._write_Seq(this._io);
                                break;
                            }
                            }
                        }
                    }
                }

                public void _check() {
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case MEASUREMENT_TYPE: {
                                if (!Objects.equals(this.tagData._root(), _root()))
                                    throw new ConsistencyError("tag_data", _root(), this.tagData._root());
                                if (!Objects.equals(this.tagData._parent(), this))
                                    throw new ConsistencyError("tag_data", this, this.tagData._parent());
                                break;
                            }
                            }
                        }
                    }
                    _dirty = false;
                }
                private TagTypeSignatures tagType;
                private MeasurementType tagData;
                private Icc4 _root;
                private Icc4.TagTable.TagDefinition _parent;
                public TagTypeSignatures tagType() { return tagType; }
                public void setTagType(TagTypeSignatures _v) { _dirty = true; tagType = _v; }
                public MeasurementType tagData() { return tagData; }
                public void setTagData(MeasurementType _v) { _dirty = true; tagData = _v; }
                public Icc4 _root() { return _root; }
                public void set_root(Icc4 _v) { _dirty = true; _root = _v; }
                public Icc4.TagTable.TagDefinition _parent() { return _parent; }
                public void set_parent(Icc4.TagTable.TagDefinition _v) { _dirty = true; _parent = _v; }
            }
            public static class MeasurementType extends KaitaiStruct.ReadWrite {
                public static MeasurementType fromFile(String fileName) throws IOException {
                    return new MeasurementType(new ByteBufferKaitaiStream(fileName));
                }

                public enum MeasurementFlareEncodings {
                    ZERO_PERCENT(0),
                    ONE_HUNDRED_PERCENT(65536);

                    private final long id;
                    MeasurementFlareEncodings(long id) { this.id = id; }
                    public long id() { return id; }
                    private static final Map<Long, MeasurementFlareEncodings> byId = new HashMap<Long, MeasurementFlareEncodings>(2);
                    static {
                        for (MeasurementFlareEncodings e : MeasurementFlareEncodings.values())
                            byId.put(e.id(), e);
                    }
                    public static MeasurementFlareEncodings byId(long id) { return byId.get(id); }
                }

                public enum MeasurementGeometryEncodings {
                    UNKNOWN(0),
                    ZERO_DEGREES_TO_45_DEGREES_OR_45_DEGREES_TO_ZERO_DEGREES(1),
                    ZERO_DEGREES_TO_D_DEGREES_OR_D_DEGREES_TO_ZERO_DEGREES(2);

                    private final long id;
                    MeasurementGeometryEncodings(long id) { this.id = id; }
                    public long id() { return id; }
                    private static final Map<Long, MeasurementGeometryEncodings> byId = new HashMap<Long, MeasurementGeometryEncodings>(3);
                    static {
                        for (MeasurementGeometryEncodings e : MeasurementGeometryEncodings.values())
                            byId.put(e.id(), e);
                    }
                    public static MeasurementGeometryEncodings byId(long id) { return byId.get(id); }
                }

                public enum StandardObserverEncodings {
                    UNKNOWN(0),
                    CIE_1931_STANDARD_COLORIMETRIC_OBSERVER(1),
                    CIE_1964_STANDARD_COLORIMETRIC_OBSERVER(2);

                    private final long id;
                    StandardObserverEncodings(long id) { this.id = id; }
                    public long id() { return id; }
                    private static final Map<Long, StandardObserverEncodings> byId = new HashMap<Long, StandardObserverEncodings>(3);
                    static {
                        for (StandardObserverEncodings e : StandardObserverEncodings.values())
                            byId.put(e.id(), e);
                    }
                    public static StandardObserverEncodings byId(long id) { return byId.get(id); }
                }
                public MeasurementType() {
                    this(null, null, null);
                }

                public MeasurementType(KaitaiStream _io) {
                    this(_io, null, null);
                }

                public MeasurementType(KaitaiStream _io, Icc4.TagTable.TagDefinition.MeasurementTag _parent) {
                    this(_io, _parent, null);
                }

                public MeasurementType(KaitaiStream _io, Icc4.TagTable.TagDefinition.MeasurementTag _parent, Icc4 _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                }
                public void _read() {
                    this.reserved = this._io.readBytes(4);
                    if (!(Arrays.equals(this.reserved, new byte[] { 0, 0, 0, 0 }))) {
                        throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0, 0, 0, 0 }, this.reserved, this._io, "/types/tag_table/types/tag_definition/types/measurement_type/seq/0");
                    }
                    this.standardObserverEncoding = StandardObserverEncodings.byId(this._io.readU4be());
                    this.nciexyzTristimulusValuesForMeasurementBacking = new XyzNumber(this._io, this, _root);
                    this.nciexyzTristimulusValuesForMeasurementBacking._read();
                    this.measurementGeometryEncoding = MeasurementGeometryEncodings.byId(this._io.readU4be());
                    this.measurementFlareEncoding = MeasurementFlareEncodings.byId(this._io.readU4be());
                    this.standardIlluminantEncoding = new StandardIlluminantEncoding(this._io, this, _root);
                    this.standardIlluminantEncoding._read();
                    _dirty = false;
                }

                public void _fetchInstances() {
                    this.nciexyzTristimulusValuesForMeasurementBacking._fetchInstances();
                    this.standardIlluminantEncoding._fetchInstances();
                }

                public void _write_Seq() {
                    _assertNotDirty();
                    this._io.writeBytes(this.reserved);
                    this._io.writeU4be(((Number) (this.standardObserverEncoding.id())).longValue());
                    this.nciexyzTristimulusValuesForMeasurementBacking._write_Seq(this._io);
                    this._io.writeU4be(((Number) (this.measurementGeometryEncoding.id())).longValue());
                    this._io.writeU4be(((Number) (this.measurementFlareEncoding.id())).longValue());
                    this.standardIlluminantEncoding._write_Seq(this._io);
                }

                public void _check() {
                    if (this.reserved.length != 4)
                        throw new ConsistencyError("reserved", 4, this.reserved.length);
                    if (!(Arrays.equals(this.reserved, new byte[] { 0, 0, 0, 0 }))) {
                        throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0, 0, 0, 0 }, this.reserved, null, "/types/tag_table/types/tag_definition/types/measurement_type/seq/0");
                    }
                    if (!Objects.equals(this.nciexyzTristimulusValuesForMeasurementBacking._root(), _root()))
                        throw new ConsistencyError("nciexyz_tristimulus_values_for_measurement_backing", _root(), this.nciexyzTristimulusValuesForMeasurementBacking._root());
                    if (!Objects.equals(this.nciexyzTristimulusValuesForMeasurementBacking._parent(), this))
                        throw new ConsistencyError("nciexyz_tristimulus_values_for_measurement_backing", this, this.nciexyzTristimulusValuesForMeasurementBacking._parent());
                    if (!Objects.equals(this.standardIlluminantEncoding._root(), _root()))
                        throw new ConsistencyError("standard_illuminant_encoding", _root(), this.standardIlluminantEncoding._root());
                    if (!Objects.equals(this.standardIlluminantEncoding._parent(), this))
                        throw new ConsistencyError("standard_illuminant_encoding", this, this.standardIlluminantEncoding._parent());
                    _dirty = false;
                }
                private byte[] reserved;
                private StandardObserverEncodings standardObserverEncoding;
                private XyzNumber nciexyzTristimulusValuesForMeasurementBacking;
                private MeasurementGeometryEncodings measurementGeometryEncoding;
                private MeasurementFlareEncodings measurementFlareEncoding;
                private StandardIlluminantEncoding standardIlluminantEncoding;
                private Icc4 _root;
                private Icc4.TagTable.TagDefinition.MeasurementTag _parent;
                public byte[] reserved() { return reserved; }
                public void setReserved(byte[] _v) { _dirty = true; reserved = _v; }
                public StandardObserverEncodings standardObserverEncoding() { return standardObserverEncoding; }
                public void setStandardObserverEncoding(StandardObserverEncodings _v) { _dirty = true; standardObserverEncoding = _v; }
                public XyzNumber nciexyzTristimulusValuesForMeasurementBacking() { return nciexyzTristimulusValuesForMeasurementBacking; }
                public void setNciexyzTristimulusValuesForMeasurementBacking(XyzNumber _v) { _dirty = true; nciexyzTristimulusValuesForMeasurementBacking = _v; }
                public MeasurementGeometryEncodings measurementGeometryEncoding() { return measurementGeometryEncoding; }
                public void setMeasurementGeometryEncoding(MeasurementGeometryEncodings _v) { _dirty = true; measurementGeometryEncoding = _v; }
                public MeasurementFlareEncodings measurementFlareEncoding() { return measurementFlareEncoding; }
                public void setMeasurementFlareEncoding(MeasurementFlareEncodings _v) { _dirty = true; measurementFlareEncoding = _v; }
                public StandardIlluminantEncoding standardIlluminantEncoding() { return standardIlluminantEncoding; }
                public void setStandardIlluminantEncoding(StandardIlluminantEncoding _v) { _dirty = true; standardIlluminantEncoding = _v; }
                public Icc4 _root() { return _root; }
                public void set_root(Icc4 _v) { _dirty = true; _root = _v; }
                public Icc4.TagTable.TagDefinition.MeasurementTag _parent() { return _parent; }
                public void set_parent(Icc4.TagTable.TagDefinition.MeasurementTag _v) { _dirty = true; _parent = _v; }
            }
            public static class MediaWhitePointTag extends KaitaiStruct.ReadWrite {
                public static MediaWhitePointTag fromFile(String fileName) throws IOException {
                    return new MediaWhitePointTag(new ByteBufferKaitaiStream(fileName));
                }
                public MediaWhitePointTag() {
                    this(null, null, null);
                }

                public MediaWhitePointTag(KaitaiStream _io) {
                    this(_io, null, null);
                }

                public MediaWhitePointTag(KaitaiStream _io, Icc4.TagTable.TagDefinition _parent) {
                    this(_io, _parent, null);
                }

                public MediaWhitePointTag(KaitaiStream _io, Icc4.TagTable.TagDefinition _parent, Icc4 _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                }
                public void _read() {
                    this.tagType = Icc4.TagTable.TagDefinition.TagTypeSignatures.byId(this._io.readU4be());
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case XYZ_TYPE: {
                                this.tagData = new XyzType(this._io, this, _root);
                                this.tagData._read();
                                break;
                            }
                            }
                        }
                    }
                    _dirty = false;
                }

                public void _fetchInstances() {
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case XYZ_TYPE: {
                                this.tagData._fetchInstances();
                                break;
                            }
                            }
                        }
                    }
                }

                public void _write_Seq() {
                    _assertNotDirty();
                    this._io.writeU4be(((Number) (this.tagType.id())).longValue());
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case XYZ_TYPE: {
                                this.tagData._write_Seq(this._io);
                                break;
                            }
                            }
                        }
                    }
                }

                public void _check() {
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case XYZ_TYPE: {
                                if (!Objects.equals(this.tagData._root(), _root()))
                                    throw new ConsistencyError("tag_data", _root(), this.tagData._root());
                                if (!Objects.equals(this.tagData._parent(), this))
                                    throw new ConsistencyError("tag_data", this, this.tagData._parent());
                                break;
                            }
                            }
                        }
                    }
                    _dirty = false;
                }
                private TagTypeSignatures tagType;
                private XyzType tagData;
                private Icc4 _root;
                private Icc4.TagTable.TagDefinition _parent;
                public TagTypeSignatures tagType() { return tagType; }
                public void setTagType(TagTypeSignatures _v) { _dirty = true; tagType = _v; }
                public XyzType tagData() { return tagData; }
                public void setTagData(XyzType _v) { _dirty = true; tagData = _v; }
                public Icc4 _root() { return _root; }
                public void set_root(Icc4 _v) { _dirty = true; _root = _v; }
                public Icc4.TagTable.TagDefinition _parent() { return _parent; }
                public void set_parent(Icc4.TagTable.TagDefinition _v) { _dirty = true; _parent = _v; }
            }
            public static class MultiLocalizedUnicodeType extends KaitaiStruct.ReadWrite {
                public static MultiLocalizedUnicodeType fromFile(String fileName) throws IOException {
                    return new MultiLocalizedUnicodeType(new ByteBufferKaitaiStream(fileName));
                }
                public MultiLocalizedUnicodeType() {
                    this(null, null, null);
                }

                public MultiLocalizedUnicodeType(KaitaiStream _io) {
                    this(_io, null, null);
                }

                public MultiLocalizedUnicodeType(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
                    this(_io, _parent, null);
                }

                public MultiLocalizedUnicodeType(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, Icc4 _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                }
                public void _read() {
                    this.reserved = this._io.readBytes(4);
                    if (!(Arrays.equals(this.reserved, new byte[] { 0, 0, 0, 0 }))) {
                        throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0, 0, 0, 0 }, this.reserved, this._io, "/types/tag_table/types/tag_definition/types/multi_localized_unicode_type/seq/0");
                    }
                    this.numberOfRecords = this._io.readU4be();
                    this.recordSize = this._io.readU4be();
                    this.records = new ArrayList<Record>();
                    for (int i = 0; i < numberOfRecords(); i++) {
                        Record _t_records = new Record(this._io, this, _root);
                        try {
                            _t_records._read();
                        } finally {
                            this.records.add(_t_records);
                        }
                    }
                    _dirty = false;
                }

                public void _fetchInstances() {
                    for (int i = 0; i < this.records.size(); i++) {
                        this.records.get(((Number) (i)).intValue())._fetchInstances();
                    }
                }

                public void _write_Seq() {
                    _assertNotDirty();
                    this._io.writeBytes(this.reserved);
                    this._io.writeU4be(this.numberOfRecords);
                    this._io.writeU4be(this.recordSize);
                    for (int i = 0; i < this.records.size(); i++) {
                        this.records.get(((Number) (i)).intValue())._write_Seq(this._io);
                    }
                }

                public void _check() {
                    if (this.reserved.length != 4)
                        throw new ConsistencyError("reserved", 4, this.reserved.length);
                    if (!(Arrays.equals(this.reserved, new byte[] { 0, 0, 0, 0 }))) {
                        throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0, 0, 0, 0 }, this.reserved, null, "/types/tag_table/types/tag_definition/types/multi_localized_unicode_type/seq/0");
                    }
                    if (this.records.size() != numberOfRecords())
                        throw new ConsistencyError("records", numberOfRecords(), this.records.size());
                    for (int i = 0; i < this.records.size(); i++) {
                        if (!Objects.equals(this.records.get(((Number) (i)).intValue())._root(), _root()))
                            throw new ConsistencyError("records", _root(), this.records.get(((Number) (i)).intValue())._root());
                        if (!Objects.equals(this.records.get(((Number) (i)).intValue())._parent(), this))
                            throw new ConsistencyError("records", this, this.records.get(((Number) (i)).intValue())._parent());
                    }
                    _dirty = false;
                }
                public static class Record extends KaitaiStruct.ReadWrite {
                    public static Record fromFile(String fileName) throws IOException {
                        return new Record(new ByteBufferKaitaiStream(fileName));
                    }
                    public Record() {
                        this(null, null, null);
                    }

                    public Record(KaitaiStream _io) {
                        this(_io, null, null);
                    }

                    public Record(KaitaiStream _io, Icc4.TagTable.TagDefinition.MultiLocalizedUnicodeType _parent) {
                        this(_io, _parent, null);
                    }

                    public Record(KaitaiStream _io, Icc4.TagTable.TagDefinition.MultiLocalizedUnicodeType _parent, Icc4 _root) {
                        super(_io);
                        this._parent = _parent;
                        this._root = _root;
                    }
                    public void _read() {
                        this.languageCode = this._io.readU2be();
                        this.countryCode = this._io.readU2be();
                        this.stringLength = this._io.readU4be();
                        this.stringOffset = this._io.readU4be();
                        _dirty = false;
                    }

                    public void _fetchInstances() {
                        stringData();
                        if (this.stringData != null) {
                        }
                    }

                    public void _write_Seq() {
                        _assertNotDirty();
                        _shouldWriteStringData = _enabledStringData;
                        this._io.writeU2be(this.languageCode);
                        this._io.writeU2be(this.countryCode);
                        this._io.writeU4be(this.stringLength);
                        this._io.writeU4be(this.stringOffset);
                    }

                    public void _check() {
                        if (_enabledStringData) {
                            if ((this.stringData).getBytes(Charset.forName("UTF-16BE")).length != stringLength())
                                throw new ConsistencyError("string_data", stringLength(), (this.stringData).getBytes(Charset.forName("UTF-16BE")).length);
                        }
                        _dirty = false;
                    }
                    private String stringData;
                    private boolean _shouldWriteStringData = false;
                    private boolean _enabledStringData = true;
                    public String stringData() {
                        if (_shouldWriteStringData)
                            _writeStringData();
                        if (this.stringData != null)
                            return this.stringData;
                        if (!_enabledStringData)
                            return null;
                        long _pos = this._io.pos();
                        this._io.seek(stringOffset());
                        this.stringData = new String(this._io.readBytes(stringLength()), StandardCharsets.UTF_16BE);
                        this._io.seek(_pos);
                        return this.stringData;
                    }
                    public void setStringData(String _v) { _dirty = true; stringData = _v; }
                    public void setStringData_Enabled(boolean _v) { _dirty = true; _enabledStringData = _v; }

                    private void _writeStringData() {
                        _shouldWriteStringData = false;
                        long _pos = this._io.pos();
                        this._io.seek(stringOffset());
                        this._io.writeBytes((this.stringData).getBytes(Charset.forName("UTF-16BE")));
                        this._io.seek(_pos);
                    }
                    private int languageCode;
                    private int countryCode;
                    private long stringLength;
                    private long stringOffset;
                    private Icc4 _root;
                    private Icc4.TagTable.TagDefinition.MultiLocalizedUnicodeType _parent;
                    public int languageCode() { return languageCode; }
                    public void setLanguageCode(int _v) { _dirty = true; languageCode = _v; }
                    public int countryCode() { return countryCode; }
                    public void setCountryCode(int _v) { _dirty = true; countryCode = _v; }
                    public long stringLength() { return stringLength; }
                    public void setStringLength(long _v) { _dirty = true; stringLength = _v; }
                    public long stringOffset() { return stringOffset; }
                    public void setStringOffset(long _v) { _dirty = true; stringOffset = _v; }
                    public Icc4 _root() { return _root; }
                    public void set_root(Icc4 _v) { _dirty = true; _root = _v; }
                    public Icc4.TagTable.TagDefinition.MultiLocalizedUnicodeType _parent() { return _parent; }
                    public void set_parent(Icc4.TagTable.TagDefinition.MultiLocalizedUnicodeType _v) { _dirty = true; _parent = _v; }
                }
                private byte[] reserved;
                private long numberOfRecords;
                private long recordSize;
                private List<Record> records;
                private Icc4 _root;
                private KaitaiStruct.ReadWrite _parent;
                public byte[] reserved() { return reserved; }
                public void setReserved(byte[] _v) { _dirty = true; reserved = _v; }
                public long numberOfRecords() { return numberOfRecords; }
                public void setNumberOfRecords(long _v) { _dirty = true; numberOfRecords = _v; }
                public long recordSize() { return recordSize; }
                public void setRecordSize(long _v) { _dirty = true; recordSize = _v; }
                public List<Record> records() { return records; }
                public void setRecords(List<Record> _v) { _dirty = true; records = _v; }
                public Icc4 _root() { return _root; }
                public void set_root(Icc4 _v) { _dirty = true; _root = _v; }
                public KaitaiStruct.ReadWrite _parent() { return _parent; }
                public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
            }
            public static class MultiProcessElementsType extends KaitaiStruct.ReadWrite {
                public static MultiProcessElementsType fromFile(String fileName) throws IOException {
                    return new MultiProcessElementsType(new ByteBufferKaitaiStream(fileName));
                }
                public MultiProcessElementsType() {
                    this(null, null, null);
                }

                public MultiProcessElementsType(KaitaiStream _io) {
                    this(_io, null, null);
                }

                public MultiProcessElementsType(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
                    this(_io, _parent, null);
                }

                public MultiProcessElementsType(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, Icc4 _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                }
                public void _read() {
                    this.reserved = this._io.readBytes(4);
                    if (!(Arrays.equals(this.reserved, new byte[] { 0, 0, 0, 0 }))) {
                        throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0, 0, 0, 0 }, this.reserved, this._io, "/types/tag_table/types/tag_definition/types/multi_process_elements_type/seq/0");
                    }
                    this.numberOfInputChannels = this._io.readU2be();
                    this.numberOfOutputChannels = this._io.readU2be();
                    this.numberOfProcessingElements = this._io.readU4be();
                    this.processElementPositionsTable = new ArrayList<PositionNumber>();
                    for (int i = 0; i < numberOfProcessingElements(); i++) {
                        PositionNumber _t_processElementPositionsTable = new PositionNumber(this._io, this, _root);
                        try {
                            _t_processElementPositionsTable._read();
                        } finally {
                            this.processElementPositionsTable.add(_t_processElementPositionsTable);
                        }
                    }
                    this.data = this._io.readBytesFull();
                    _dirty = false;
                }

                public void _fetchInstances() {
                    for (int i = 0; i < this.processElementPositionsTable.size(); i++) {
                        this.processElementPositionsTable.get(((Number) (i)).intValue())._fetchInstances();
                    }
                }

                public void _write_Seq() {
                    _assertNotDirty();
                    this._io.writeBytes(this.reserved);
                    this._io.writeU2be(this.numberOfInputChannels);
                    this._io.writeU2be(this.numberOfOutputChannels);
                    this._io.writeU4be(this.numberOfProcessingElements);
                    for (int i = 0; i < this.processElementPositionsTable.size(); i++) {
                        this.processElementPositionsTable.get(((Number) (i)).intValue())._write_Seq(this._io);
                    }
                    this._io.writeBytes(this.data);
                    if (!(this._io.isEof()))
                        throw new ConsistencyError("data", 0, this._io.size() - this._io.pos());
                }

                public void _check() {
                    if (this.reserved.length != 4)
                        throw new ConsistencyError("reserved", 4, this.reserved.length);
                    if (!(Arrays.equals(this.reserved, new byte[] { 0, 0, 0, 0 }))) {
                        throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0, 0, 0, 0 }, this.reserved, null, "/types/tag_table/types/tag_definition/types/multi_process_elements_type/seq/0");
                    }
                    if (this.processElementPositionsTable.size() != numberOfProcessingElements())
                        throw new ConsistencyError("process_element_positions_table", numberOfProcessingElements(), this.processElementPositionsTable.size());
                    for (int i = 0; i < this.processElementPositionsTable.size(); i++) {
                        if (!Objects.equals(this.processElementPositionsTable.get(((Number) (i)).intValue())._root(), _root()))
                            throw new ConsistencyError("process_element_positions_table", _root(), this.processElementPositionsTable.get(((Number) (i)).intValue())._root());
                        if (!Objects.equals(this.processElementPositionsTable.get(((Number) (i)).intValue())._parent(), this))
                            throw new ConsistencyError("process_element_positions_table", this, this.processElementPositionsTable.get(((Number) (i)).intValue())._parent());
                    }
                    _dirty = false;
                }
                private byte[] reserved;
                private int numberOfInputChannels;
                private int numberOfOutputChannels;
                private long numberOfProcessingElements;
                private List<PositionNumber> processElementPositionsTable;
                private byte[] data;
                private Icc4 _root;
                private KaitaiStruct.ReadWrite _parent;
                public byte[] reserved() { return reserved; }
                public void setReserved(byte[] _v) { _dirty = true; reserved = _v; }
                public int numberOfInputChannels() { return numberOfInputChannels; }
                public void setNumberOfInputChannels(int _v) { _dirty = true; numberOfInputChannels = _v; }
                public int numberOfOutputChannels() { return numberOfOutputChannels; }
                public void setNumberOfOutputChannels(int _v) { _dirty = true; numberOfOutputChannels = _v; }
                public long numberOfProcessingElements() { return numberOfProcessingElements; }
                public void setNumberOfProcessingElements(long _v) { _dirty = true; numberOfProcessingElements = _v; }
                public List<PositionNumber> processElementPositionsTable() { return processElementPositionsTable; }
                public void setProcessElementPositionsTable(List<PositionNumber> _v) { _dirty = true; processElementPositionsTable = _v; }
                public byte[] data() { return data; }
                public void setData(byte[] _v) { _dirty = true; data = _v; }
                public Icc4 _root() { return _root; }
                public void set_root(Icc4 _v) { _dirty = true; _root = _v; }
                public KaitaiStruct.ReadWrite _parent() { return _parent; }
                public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
            }
            public static class NamedColor2Tag extends KaitaiStruct.ReadWrite {
                public static NamedColor2Tag fromFile(String fileName) throws IOException {
                    return new NamedColor2Tag(new ByteBufferKaitaiStream(fileName));
                }
                public NamedColor2Tag() {
                    this(null, null, null);
                }

                public NamedColor2Tag(KaitaiStream _io) {
                    this(_io, null, null);
                }

                public NamedColor2Tag(KaitaiStream _io, Icc4.TagTable.TagDefinition _parent) {
                    this(_io, _parent, null);
                }

                public NamedColor2Tag(KaitaiStream _io, Icc4.TagTable.TagDefinition _parent, Icc4 _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                }
                public void _read() {
                    this.tagType = Icc4.TagTable.TagDefinition.TagTypeSignatures.byId(this._io.readU4be());
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case NAMED_COLOR_2_TYPE: {
                                this.tagData = new NamedColor2Type(this._io, this, _root);
                                this.tagData._read();
                                break;
                            }
                            }
                        }
                    }
                    _dirty = false;
                }

                public void _fetchInstances() {
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case NAMED_COLOR_2_TYPE: {
                                this.tagData._fetchInstances();
                                break;
                            }
                            }
                        }
                    }
                }

                public void _write_Seq() {
                    _assertNotDirty();
                    this._io.writeU4be(((Number) (this.tagType.id())).longValue());
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case NAMED_COLOR_2_TYPE: {
                                this.tagData._write_Seq(this._io);
                                break;
                            }
                            }
                        }
                    }
                }

                public void _check() {
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case NAMED_COLOR_2_TYPE: {
                                if (!Objects.equals(this.tagData._root(), _root()))
                                    throw new ConsistencyError("tag_data", _root(), this.tagData._root());
                                if (!Objects.equals(this.tagData._parent(), this))
                                    throw new ConsistencyError("tag_data", this, this.tagData._parent());
                                break;
                            }
                            }
                        }
                    }
                    _dirty = false;
                }
                private TagTypeSignatures tagType;
                private NamedColor2Type tagData;
                private Icc4 _root;
                private Icc4.TagTable.TagDefinition _parent;
                public TagTypeSignatures tagType() { return tagType; }
                public void setTagType(TagTypeSignatures _v) { _dirty = true; tagType = _v; }
                public NamedColor2Type tagData() { return tagData; }
                public void setTagData(NamedColor2Type _v) { _dirty = true; tagData = _v; }
                public Icc4 _root() { return _root; }
                public void set_root(Icc4 _v) { _dirty = true; _root = _v; }
                public Icc4.TagTable.TagDefinition _parent() { return _parent; }
                public void set_parent(Icc4.TagTable.TagDefinition _v) { _dirty = true; _parent = _v; }
            }
            public static class NamedColor2Type extends KaitaiStruct.ReadWrite {
                public static NamedColor2Type fromFile(String fileName) throws IOException {
                    return new NamedColor2Type(new ByteBufferKaitaiStream(fileName));
                }
                public NamedColor2Type() {
                    this(null, null, null);
                }

                public NamedColor2Type(KaitaiStream _io) {
                    this(_io, null, null);
                }

                public NamedColor2Type(KaitaiStream _io, Icc4.TagTable.TagDefinition.NamedColor2Tag _parent) {
                    this(_io, _parent, null);
                }

                public NamedColor2Type(KaitaiStream _io, Icc4.TagTable.TagDefinition.NamedColor2Tag _parent, Icc4 _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                }
                public void _read() {
                    this.reserved = this._io.readBytes(4);
                    if (!(Arrays.equals(this.reserved, new byte[] { 0, 0, 0, 0 }))) {
                        throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0, 0, 0, 0 }, this.reserved, this._io, "/types/tag_table/types/tag_definition/types/named_color_2_type/seq/0");
                    }
                    this.vendorSpecificFlag = this._io.readU4be();
                    this.countOfNamedColours = this._io.readU4be();
                    this.numberOfDeviceCoordinatesForEachNamedColour = this._io.readU4be();
                    this.prefixForEachColourName = new String(this._io.readBytesTerm((byte) 0, false, true, true), StandardCharsets.US_ASCII);
                    this.prefixForEachColourNamePadding = new ArrayList<byte[]>();
                    for (int i = 0; i < 32 - prefixForEachColourName().length(); i++) {
                        this.prefixForEachColourNamePadding.add(this._io.readBytes(1));
                        if (!(Arrays.equals(this.prefixForEachColourNamePadding.get(((Number) (i)).intValue()), new byte[] { 0 }))) {
                            throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0 }, this.prefixForEachColourNamePadding.get(((Number) (i)).intValue()), this._io, "/types/tag_table/types/tag_definition/types/named_color_2_type/seq/5");
                        }
                    }
                    this.suffixForEachColourName = new String(this._io.readBytesTerm((byte) 0, false, true, true), StandardCharsets.US_ASCII);
                    this.suffixForEachColourNamePadding = new ArrayList<byte[]>();
                    for (int i = 0; i < 32 - suffixForEachColourName().length(); i++) {
                        this.suffixForEachColourNamePadding.add(this._io.readBytes(1));
                        if (!(Arrays.equals(this.suffixForEachColourNamePadding.get(((Number) (i)).intValue()), new byte[] { 0 }))) {
                            throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0 }, this.suffixForEachColourNamePadding.get(((Number) (i)).intValue()), this._io, "/types/tag_table/types/tag_definition/types/named_color_2_type/seq/7");
                        }
                    }
                    this.namedColourDefinitions = new ArrayList<NamedColourDefinition>();
                    for (int i = 0; i < countOfNamedColours(); i++) {
                        NamedColourDefinition _t_namedColourDefinitions = new NamedColourDefinition(this._io, this, _root);
                        try {
                            _t_namedColourDefinitions._read();
                        } finally {
                            this.namedColourDefinitions.add(_t_namedColourDefinitions);
                        }
                    }
                    _dirty = false;
                }

                public void _fetchInstances() {
                    for (int i = 0; i < this.prefixForEachColourNamePadding.size(); i++) {
                    }
                    for (int i = 0; i < this.suffixForEachColourNamePadding.size(); i++) {
                    }
                    for (int i = 0; i < this.namedColourDefinitions.size(); i++) {
                        this.namedColourDefinitions.get(((Number) (i)).intValue())._fetchInstances();
                    }
                }

                public void _write_Seq() {
                    _assertNotDirty();
                    this._io.writeBytes(this.reserved);
                    this._io.writeU4be(this.vendorSpecificFlag);
                    this._io.writeU4be(this.countOfNamedColours);
                    this._io.writeU4be(this.numberOfDeviceCoordinatesForEachNamedColour);
                    this._io.writeBytes((this.prefixForEachColourName).getBytes(Charset.forName("ASCII")));
                    this._io.writeU1(0);
                    for (int i = 0; i < this.prefixForEachColourNamePadding.size(); i++) {
                        this._io.writeBytes(this.prefixForEachColourNamePadding.get(((Number) (i)).intValue()));
                    }
                    this._io.writeBytes((this.suffixForEachColourName).getBytes(Charset.forName("ASCII")));
                    this._io.writeU1(0);
                    for (int i = 0; i < this.suffixForEachColourNamePadding.size(); i++) {
                        this._io.writeBytes(this.suffixForEachColourNamePadding.get(((Number) (i)).intValue()));
                    }
                    for (int i = 0; i < this.namedColourDefinitions.size(); i++) {
                        this.namedColourDefinitions.get(((Number) (i)).intValue())._write_Seq(this._io);
                    }
                }

                public void _check() {
                    if (this.reserved.length != 4)
                        throw new ConsistencyError("reserved", 4, this.reserved.length);
                    if (!(Arrays.equals(this.reserved, new byte[] { 0, 0, 0, 0 }))) {
                        throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0, 0, 0, 0 }, this.reserved, null, "/types/tag_table/types/tag_definition/types/named_color_2_type/seq/0");
                    }
                    if (KaitaiStream.byteArrayIndexOf((this.prefixForEachColourName).getBytes(Charset.forName("ASCII")), ((byte) 0)) != -1)
                        throw new ConsistencyError("prefix_for_each_colour_name", -1, KaitaiStream.byteArrayIndexOf((this.prefixForEachColourName).getBytes(Charset.forName("ASCII")), ((byte) 0)));
                    if (this.prefixForEachColourNamePadding.size() != 32 - prefixForEachColourName().length())
                        throw new ConsistencyError("prefix_for_each_colour_name_padding", 32 - prefixForEachColourName().length(), this.prefixForEachColourNamePadding.size());
                    for (int i = 0; i < this.prefixForEachColourNamePadding.size(); i++) {
                        if (this.prefixForEachColourNamePadding.get(((Number) (i)).intValue()).length != 1)
                            throw new ConsistencyError("prefix_for_each_colour_name_padding", 1, this.prefixForEachColourNamePadding.get(((Number) (i)).intValue()).length);
                        if (!(Arrays.equals(this.prefixForEachColourNamePadding.get(((Number) (i)).intValue()), new byte[] { 0 }))) {
                            throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0 }, this.prefixForEachColourNamePadding.get(((Number) (i)).intValue()), null, "/types/tag_table/types/tag_definition/types/named_color_2_type/seq/5");
                        }
                    }
                    if (KaitaiStream.byteArrayIndexOf((this.suffixForEachColourName).getBytes(Charset.forName("ASCII")), ((byte) 0)) != -1)
                        throw new ConsistencyError("suffix_for_each_colour_name", -1, KaitaiStream.byteArrayIndexOf((this.suffixForEachColourName).getBytes(Charset.forName("ASCII")), ((byte) 0)));
                    if (this.suffixForEachColourNamePadding.size() != 32 - suffixForEachColourName().length())
                        throw new ConsistencyError("suffix_for_each_colour_name_padding", 32 - suffixForEachColourName().length(), this.suffixForEachColourNamePadding.size());
                    for (int i = 0; i < this.suffixForEachColourNamePadding.size(); i++) {
                        if (this.suffixForEachColourNamePadding.get(((Number) (i)).intValue()).length != 1)
                            throw new ConsistencyError("suffix_for_each_colour_name_padding", 1, this.suffixForEachColourNamePadding.get(((Number) (i)).intValue()).length);
                        if (!(Arrays.equals(this.suffixForEachColourNamePadding.get(((Number) (i)).intValue()), new byte[] { 0 }))) {
                            throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0 }, this.suffixForEachColourNamePadding.get(((Number) (i)).intValue()), null, "/types/tag_table/types/tag_definition/types/named_color_2_type/seq/7");
                        }
                    }
                    if (this.namedColourDefinitions.size() != countOfNamedColours())
                        throw new ConsistencyError("named_colour_definitions", countOfNamedColours(), this.namedColourDefinitions.size());
                    for (int i = 0; i < this.namedColourDefinitions.size(); i++) {
                        if (!Objects.equals(this.namedColourDefinitions.get(((Number) (i)).intValue())._root(), _root()))
                            throw new ConsistencyError("named_colour_definitions", _root(), this.namedColourDefinitions.get(((Number) (i)).intValue())._root());
                        if (!Objects.equals(this.namedColourDefinitions.get(((Number) (i)).intValue())._parent(), this))
                            throw new ConsistencyError("named_colour_definitions", this, this.namedColourDefinitions.get(((Number) (i)).intValue())._parent());
                    }
                    _dirty = false;
                }
                public static class NamedColourDefinition extends KaitaiStruct.ReadWrite {
                    public static NamedColourDefinition fromFile(String fileName) throws IOException {
                        return new NamedColourDefinition(new ByteBufferKaitaiStream(fileName));
                    }
                    public NamedColourDefinition() {
                        this(null, null, null);
                    }

                    public NamedColourDefinition(KaitaiStream _io) {
                        this(_io, null, null);
                    }

                    public NamedColourDefinition(KaitaiStream _io, Icc4.TagTable.TagDefinition.NamedColor2Type _parent) {
                        this(_io, _parent, null);
                    }

                    public NamedColourDefinition(KaitaiStream _io, Icc4.TagTable.TagDefinition.NamedColor2Type _parent, Icc4 _root) {
                        super(_io);
                        this._parent = _parent;
                        this._root = _root;
                    }
                    public void _read() {
                        this.rootName = new String(this._io.readBytesTerm((byte) 0, false, true, true), StandardCharsets.US_ASCII);
                        this.rootNamePadding = new ArrayList<byte[]>();
                        for (int i = 0; i < 32 - rootName().length(); i++) {
                            this.rootNamePadding.add(this._io.readBytes(1));
                            if (!(Arrays.equals(this.rootNamePadding.get(((Number) (i)).intValue()), new byte[] { 0 }))) {
                                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0 }, this.rootNamePadding.get(((Number) (i)).intValue()), this._io, "/types/tag_table/types/tag_definition/types/named_color_2_type/types/named_colour_definition/seq/1");
                            }
                        }
                        this.pcsCoordinates = this._io.readBytes(6);
                        if (_parent().numberOfDeviceCoordinatesForEachNamedColour() > 0) {
                            this.deviceCoordinates = new ArrayList<Integer>();
                            for (int i = 0; i < _parent().numberOfDeviceCoordinatesForEachNamedColour(); i++) {
                                this.deviceCoordinates.add(this._io.readU2be());
                            }
                        }
                        _dirty = false;
                    }

                    public void _fetchInstances() {
                        for (int i = 0; i < this.rootNamePadding.size(); i++) {
                        }
                        if (_parent().numberOfDeviceCoordinatesForEachNamedColour() > 0) {
                            for (int i = 0; i < this.deviceCoordinates.size(); i++) {
                            }
                        }
                    }

                    public void _write_Seq() {
                        _assertNotDirty();
                        this._io.writeBytes((this.rootName).getBytes(Charset.forName("ASCII")));
                        this._io.writeU1(0);
                        for (int i = 0; i < this.rootNamePadding.size(); i++) {
                            this._io.writeBytes(this.rootNamePadding.get(((Number) (i)).intValue()));
                        }
                        this._io.writeBytes(this.pcsCoordinates);
                        if (_parent().numberOfDeviceCoordinatesForEachNamedColour() > 0) {
                            for (int i = 0; i < this.deviceCoordinates.size(); i++) {
                                this._io.writeU2be(this.deviceCoordinates.get(((Number) (i)).intValue()));
                            }
                        }
                    }

                    public void _check() {
                        if (KaitaiStream.byteArrayIndexOf((this.rootName).getBytes(Charset.forName("ASCII")), ((byte) 0)) != -1)
                            throw new ConsistencyError("root_name", -1, KaitaiStream.byteArrayIndexOf((this.rootName).getBytes(Charset.forName("ASCII")), ((byte) 0)));
                        if (this.rootNamePadding.size() != 32 - rootName().length())
                            throw new ConsistencyError("root_name_padding", 32 - rootName().length(), this.rootNamePadding.size());
                        for (int i = 0; i < this.rootNamePadding.size(); i++) {
                            if (this.rootNamePadding.get(((Number) (i)).intValue()).length != 1)
                                throw new ConsistencyError("root_name_padding", 1, this.rootNamePadding.get(((Number) (i)).intValue()).length);
                            if (!(Arrays.equals(this.rootNamePadding.get(((Number) (i)).intValue()), new byte[] { 0 }))) {
                                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0 }, this.rootNamePadding.get(((Number) (i)).intValue()), null, "/types/tag_table/types/tag_definition/types/named_color_2_type/types/named_colour_definition/seq/1");
                            }
                        }
                        if (this.pcsCoordinates.length != 6)
                            throw new ConsistencyError("pcs_coordinates", 6, this.pcsCoordinates.length);
                        if (_parent().numberOfDeviceCoordinatesForEachNamedColour() > 0) {
                            if (this.deviceCoordinates.size() != _parent().numberOfDeviceCoordinatesForEachNamedColour())
                                throw new ConsistencyError("device_coordinates", _parent().numberOfDeviceCoordinatesForEachNamedColour(), this.deviceCoordinates.size());
                            for (int i = 0; i < this.deviceCoordinates.size(); i++) {
                            }
                        }
                        _dirty = false;
                    }
                    private String rootName;
                    private List<byte[]> rootNamePadding;
                    private byte[] pcsCoordinates;
                    private List<Integer> deviceCoordinates;
                    private Icc4 _root;
                    private Icc4.TagTable.TagDefinition.NamedColor2Type _parent;
                    public String rootName() { return rootName; }
                    public void setRootName(String _v) { _dirty = true; rootName = _v; }
                    public List<byte[]> rootNamePadding() { return rootNamePadding; }
                    public void setRootNamePadding(List<byte[]> _v) { _dirty = true; rootNamePadding = _v; }
                    public byte[] pcsCoordinates() { return pcsCoordinates; }
                    public void setPcsCoordinates(byte[] _v) { _dirty = true; pcsCoordinates = _v; }
                    public List<Integer> deviceCoordinates() { return deviceCoordinates; }
                    public void setDeviceCoordinates(List<Integer> _v) { _dirty = true; deviceCoordinates = _v; }
                    public Icc4 _root() { return _root; }
                    public void set_root(Icc4 _v) { _dirty = true; _root = _v; }
                    public Icc4.TagTable.TagDefinition.NamedColor2Type _parent() { return _parent; }
                    public void set_parent(Icc4.TagTable.TagDefinition.NamedColor2Type _v) { _dirty = true; _parent = _v; }
                }
                private byte[] reserved;
                private long vendorSpecificFlag;
                private long countOfNamedColours;
                private long numberOfDeviceCoordinatesForEachNamedColour;
                private String prefixForEachColourName;
                private List<byte[]> prefixForEachColourNamePadding;
                private String suffixForEachColourName;
                private List<byte[]> suffixForEachColourNamePadding;
                private List<NamedColourDefinition> namedColourDefinitions;
                private Icc4 _root;
                private Icc4.TagTable.TagDefinition.NamedColor2Tag _parent;
                public byte[] reserved() { return reserved; }
                public void setReserved(byte[] _v) { _dirty = true; reserved = _v; }
                public long vendorSpecificFlag() { return vendorSpecificFlag; }
                public void setVendorSpecificFlag(long _v) { _dirty = true; vendorSpecificFlag = _v; }
                public long countOfNamedColours() { return countOfNamedColours; }
                public void setCountOfNamedColours(long _v) { _dirty = true; countOfNamedColours = _v; }
                public long numberOfDeviceCoordinatesForEachNamedColour() { return numberOfDeviceCoordinatesForEachNamedColour; }
                public void setNumberOfDeviceCoordinatesForEachNamedColour(long _v) { _dirty = true; numberOfDeviceCoordinatesForEachNamedColour = _v; }
                public String prefixForEachColourName() { return prefixForEachColourName; }
                public void setPrefixForEachColourName(String _v) { _dirty = true; prefixForEachColourName = _v; }
                public List<byte[]> prefixForEachColourNamePadding() { return prefixForEachColourNamePadding; }
                public void setPrefixForEachColourNamePadding(List<byte[]> _v) { _dirty = true; prefixForEachColourNamePadding = _v; }
                public String suffixForEachColourName() { return suffixForEachColourName; }
                public void setSuffixForEachColourName(String _v) { _dirty = true; suffixForEachColourName = _v; }
                public List<byte[]> suffixForEachColourNamePadding() { return suffixForEachColourNamePadding; }
                public void setSuffixForEachColourNamePadding(List<byte[]> _v) { _dirty = true; suffixForEachColourNamePadding = _v; }
                public List<NamedColourDefinition> namedColourDefinitions() { return namedColourDefinitions; }
                public void setNamedColourDefinitions(List<NamedColourDefinition> _v) { _dirty = true; namedColourDefinitions = _v; }
                public Icc4 _root() { return _root; }
                public void set_root(Icc4 _v) { _dirty = true; _root = _v; }
                public Icc4.TagTable.TagDefinition.NamedColor2Tag _parent() { return _parent; }
                public void set_parent(Icc4.TagTable.TagDefinition.NamedColor2Tag _v) { _dirty = true; _parent = _v; }
            }
            public static class OutputResponseTag extends KaitaiStruct.ReadWrite {
                public static OutputResponseTag fromFile(String fileName) throws IOException {
                    return new OutputResponseTag(new ByteBufferKaitaiStream(fileName));
                }
                public OutputResponseTag() {
                    this(null, null, null);
                }

                public OutputResponseTag(KaitaiStream _io) {
                    this(_io, null, null);
                }

                public OutputResponseTag(KaitaiStream _io, Icc4.TagTable.TagDefinition _parent) {
                    this(_io, _parent, null);
                }

                public OutputResponseTag(KaitaiStream _io, Icc4.TagTable.TagDefinition _parent, Icc4 _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                }
                public void _read() {
                    this.tagType = Icc4.TagTable.TagDefinition.TagTypeSignatures.byId(this._io.readU4be());
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case RESPONSE_CURVE_SET_16_TYPE: {
                                this.tagData = new ResponseCurveSet16Type(this._io, this, _root);
                                this.tagData._read();
                                break;
                            }
                            }
                        }
                    }
                    _dirty = false;
                }

                public void _fetchInstances() {
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case RESPONSE_CURVE_SET_16_TYPE: {
                                this.tagData._fetchInstances();
                                break;
                            }
                            }
                        }
                    }
                }

                public void _write_Seq() {
                    _assertNotDirty();
                    this._io.writeU4be(((Number) (this.tagType.id())).longValue());
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case RESPONSE_CURVE_SET_16_TYPE: {
                                this.tagData._write_Seq(this._io);
                                break;
                            }
                            }
                        }
                    }
                }

                public void _check() {
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case RESPONSE_CURVE_SET_16_TYPE: {
                                if (!Objects.equals(this.tagData._root(), _root()))
                                    throw new ConsistencyError("tag_data", _root(), this.tagData._root());
                                if (!Objects.equals(this.tagData._parent(), this))
                                    throw new ConsistencyError("tag_data", this, this.tagData._parent());
                                break;
                            }
                            }
                        }
                    }
                    _dirty = false;
                }
                private TagTypeSignatures tagType;
                private ResponseCurveSet16Type tagData;
                private Icc4 _root;
                private Icc4.TagTable.TagDefinition _parent;
                public TagTypeSignatures tagType() { return tagType; }
                public void setTagType(TagTypeSignatures _v) { _dirty = true; tagType = _v; }
                public ResponseCurveSet16Type tagData() { return tagData; }
                public void setTagData(ResponseCurveSet16Type _v) { _dirty = true; tagData = _v; }
                public Icc4 _root() { return _root; }
                public void set_root(Icc4 _v) { _dirty = true; _root = _v; }
                public Icc4.TagTable.TagDefinition _parent() { return _parent; }
                public void set_parent(Icc4.TagTable.TagDefinition _v) { _dirty = true; _parent = _v; }
            }
            public static class ParametricCurveType extends KaitaiStruct.ReadWrite {
                public static ParametricCurveType fromFile(String fileName) throws IOException {
                    return new ParametricCurveType(new ByteBufferKaitaiStream(fileName));
                }

                public enum ParametricCurveTypeFunctions {
                    Y_EQUALS_X_TO_POWER_OF_G(0),
                    CIE_122_1996(1),
                    IEC_61966_3(2),
                    IEC_61966_2_1(3),
                    Y_EQUALS_OB_AX_PLUS_B_CB_TO_POWER_OF_G_PLUS_C(4);

                    private final long id;
                    ParametricCurveTypeFunctions(long id) { this.id = id; }
                    public long id() { return id; }
                    private static final Map<Long, ParametricCurveTypeFunctions> byId = new HashMap<Long, ParametricCurveTypeFunctions>(5);
                    static {
                        for (ParametricCurveTypeFunctions e : ParametricCurveTypeFunctions.values())
                            byId.put(e.id(), e);
                    }
                    public static ParametricCurveTypeFunctions byId(long id) { return byId.get(id); }
                }
                public ParametricCurveType() {
                    this(null, null, null);
                }

                public ParametricCurveType(KaitaiStream _io) {
                    this(_io, null, null);
                }

                public ParametricCurveType(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
                    this(_io, _parent, null);
                }

                public ParametricCurveType(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, Icc4 _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                }
                public void _read() {
                    this.reserved = this._io.readBytes(4);
                    if (!(Arrays.equals(this.reserved, new byte[] { 0, 0, 0, 0 }))) {
                        throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0, 0, 0, 0 }, this.reserved, this._io, "/types/tag_table/types/tag_definition/types/parametric_curve_type/seq/0");
                    }
                    this.functionType = ParametricCurveTypeFunctions.byId(this._io.readU2be());
                    this.reserved2 = this._io.readBytes(2);
                    if (!(Arrays.equals(this.reserved2, new byte[] { 0, 0 }))) {
                        throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0, 0 }, this.reserved2, this._io, "/types/tag_table/types/tag_definition/types/parametric_curve_type/seq/2");
                    }
                    {
                        ParametricCurveTypeFunctions on = functionType();
                        if (on != null) {
                            switch (functionType()) {
                            case CIE_122_1996: {
                                this.parameters = new ParamsCie1221996(this._io, this, _root);
                                ((ParamsCie1221996) (this.parameters))._read();
                                break;
                            }
                            case IEC_61966_2_1: {
                                this.parameters = new ParamsIec6196621(this._io, this, _root);
                                ((ParamsIec6196621) (this.parameters))._read();
                                break;
                            }
                            case IEC_61966_3: {
                                this.parameters = new ParamsIec619663(this._io, this, _root);
                                ((ParamsIec619663) (this.parameters))._read();
                                break;
                            }
                            case Y_EQUALS_OB_AX_PLUS_B_CB_TO_POWER_OF_G_PLUS_C: {
                                this.parameters = new ParamsYEqualsObAxPlusBCbToPowerOfGPlusC(this._io, this, _root);
                                ((ParamsYEqualsObAxPlusBCbToPowerOfGPlusC) (this.parameters))._read();
                                break;
                            }
                            case Y_EQUALS_X_TO_POWER_OF_G: {
                                this.parameters = new ParamsYEqualsXToPowerOfG(this._io, this, _root);
                                ((ParamsYEqualsXToPowerOfG) (this.parameters))._read();
                                break;
                            }
                            }
                        }
                    }
                    _dirty = false;
                }

                public void _fetchInstances() {
                    {
                        ParametricCurveTypeFunctions on = functionType();
                        if (on != null) {
                            switch (functionType()) {
                            case CIE_122_1996: {
                                ((ParamsCie1221996) (this.parameters))._fetchInstances();
                                break;
                            }
                            case IEC_61966_2_1: {
                                ((ParamsIec6196621) (this.parameters))._fetchInstances();
                                break;
                            }
                            case IEC_61966_3: {
                                ((ParamsIec619663) (this.parameters))._fetchInstances();
                                break;
                            }
                            case Y_EQUALS_OB_AX_PLUS_B_CB_TO_POWER_OF_G_PLUS_C: {
                                ((ParamsYEqualsObAxPlusBCbToPowerOfGPlusC) (this.parameters))._fetchInstances();
                                break;
                            }
                            case Y_EQUALS_X_TO_POWER_OF_G: {
                                ((ParamsYEqualsXToPowerOfG) (this.parameters))._fetchInstances();
                                break;
                            }
                            }
                        }
                    }
                }

                public void _write_Seq() {
                    _assertNotDirty();
                    this._io.writeBytes(this.reserved);
                    this._io.writeU2be(((Number) (this.functionType.id())).intValue());
                    this._io.writeBytes(this.reserved2);
                    {
                        ParametricCurveTypeFunctions on = functionType();
                        if (on != null) {
                            switch (functionType()) {
                            case CIE_122_1996: {
                                ((ParamsCie1221996) (this.parameters))._write_Seq(this._io);
                                break;
                            }
                            case IEC_61966_2_1: {
                                ((ParamsIec6196621) (this.parameters))._write_Seq(this._io);
                                break;
                            }
                            case IEC_61966_3: {
                                ((ParamsIec619663) (this.parameters))._write_Seq(this._io);
                                break;
                            }
                            case Y_EQUALS_OB_AX_PLUS_B_CB_TO_POWER_OF_G_PLUS_C: {
                                ((ParamsYEqualsObAxPlusBCbToPowerOfGPlusC) (this.parameters))._write_Seq(this._io);
                                break;
                            }
                            case Y_EQUALS_X_TO_POWER_OF_G: {
                                ((ParamsYEqualsXToPowerOfG) (this.parameters))._write_Seq(this._io);
                                break;
                            }
                            }
                        }
                    }
                }

                public void _check() {
                    if (this.reserved.length != 4)
                        throw new ConsistencyError("reserved", 4, this.reserved.length);
                    if (!(Arrays.equals(this.reserved, new byte[] { 0, 0, 0, 0 }))) {
                        throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0, 0, 0, 0 }, this.reserved, null, "/types/tag_table/types/tag_definition/types/parametric_curve_type/seq/0");
                    }
                    if (this.reserved2.length != 2)
                        throw new ConsistencyError("reserved_2", 2, this.reserved2.length);
                    if (!(Arrays.equals(this.reserved2, new byte[] { 0, 0 }))) {
                        throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0, 0 }, this.reserved2, null, "/types/tag_table/types/tag_definition/types/parametric_curve_type/seq/2");
                    }
                    {
                        ParametricCurveTypeFunctions on = functionType();
                        if (on != null) {
                            switch (functionType()) {
                            case CIE_122_1996: {
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.ParametricCurveType.ParamsCie1221996) (this.parameters))._root(), _root()))
                                    throw new ConsistencyError("parameters", _root(), ((Icc4.TagTable.TagDefinition.ParametricCurveType.ParamsCie1221996) (this.parameters))._root());
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.ParametricCurveType.ParamsCie1221996) (this.parameters))._parent(), this))
                                    throw new ConsistencyError("parameters", this, ((Icc4.TagTable.TagDefinition.ParametricCurveType.ParamsCie1221996) (this.parameters))._parent());
                                break;
                            }
                            case IEC_61966_2_1: {
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.ParametricCurveType.ParamsIec6196621) (this.parameters))._root(), _root()))
                                    throw new ConsistencyError("parameters", _root(), ((Icc4.TagTable.TagDefinition.ParametricCurveType.ParamsIec6196621) (this.parameters))._root());
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.ParametricCurveType.ParamsIec6196621) (this.parameters))._parent(), this))
                                    throw new ConsistencyError("parameters", this, ((Icc4.TagTable.TagDefinition.ParametricCurveType.ParamsIec6196621) (this.parameters))._parent());
                                break;
                            }
                            case IEC_61966_3: {
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.ParametricCurveType.ParamsIec619663) (this.parameters))._root(), _root()))
                                    throw new ConsistencyError("parameters", _root(), ((Icc4.TagTable.TagDefinition.ParametricCurveType.ParamsIec619663) (this.parameters))._root());
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.ParametricCurveType.ParamsIec619663) (this.parameters))._parent(), this))
                                    throw new ConsistencyError("parameters", this, ((Icc4.TagTable.TagDefinition.ParametricCurveType.ParamsIec619663) (this.parameters))._parent());
                                break;
                            }
                            case Y_EQUALS_OB_AX_PLUS_B_CB_TO_POWER_OF_G_PLUS_C: {
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.ParametricCurveType.ParamsYEqualsObAxPlusBCbToPowerOfGPlusC) (this.parameters))._root(), _root()))
                                    throw new ConsistencyError("parameters", _root(), ((Icc4.TagTable.TagDefinition.ParametricCurveType.ParamsYEqualsObAxPlusBCbToPowerOfGPlusC) (this.parameters))._root());
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.ParametricCurveType.ParamsYEqualsObAxPlusBCbToPowerOfGPlusC) (this.parameters))._parent(), this))
                                    throw new ConsistencyError("parameters", this, ((Icc4.TagTable.TagDefinition.ParametricCurveType.ParamsYEqualsObAxPlusBCbToPowerOfGPlusC) (this.parameters))._parent());
                                break;
                            }
                            case Y_EQUALS_X_TO_POWER_OF_G: {
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.ParametricCurveType.ParamsYEqualsXToPowerOfG) (this.parameters))._root(), _root()))
                                    throw new ConsistencyError("parameters", _root(), ((Icc4.TagTable.TagDefinition.ParametricCurveType.ParamsYEqualsXToPowerOfG) (this.parameters))._root());
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.ParametricCurveType.ParamsYEqualsXToPowerOfG) (this.parameters))._parent(), this))
                                    throw new ConsistencyError("parameters", this, ((Icc4.TagTable.TagDefinition.ParametricCurveType.ParamsYEqualsXToPowerOfG) (this.parameters))._parent());
                                break;
                            }
                            }
                        }
                    }
                    _dirty = false;
                }
                public static class ParamsCie1221996 extends KaitaiStruct.ReadWrite {
                    public static ParamsCie1221996 fromFile(String fileName) throws IOException {
                        return new ParamsCie1221996(new ByteBufferKaitaiStream(fileName));
                    }
                    public ParamsCie1221996() {
                        this(null, null, null);
                    }

                    public ParamsCie1221996(KaitaiStream _io) {
                        this(_io, null, null);
                    }

                    public ParamsCie1221996(KaitaiStream _io, Icc4.TagTable.TagDefinition.ParametricCurveType _parent) {
                        this(_io, _parent, null);
                    }

                    public ParamsCie1221996(KaitaiStream _io, Icc4.TagTable.TagDefinition.ParametricCurveType _parent, Icc4 _root) {
                        super(_io);
                        this._parent = _parent;
                        this._root = _root;
                    }
                    public void _read() {
                        this.g = this._io.readS4be();
                        this.a = this._io.readS4be();
                        this.b = this._io.readS4be();
                        _dirty = false;
                    }

                    public void _fetchInstances() {
                    }

                    public void _write_Seq() {
                        _assertNotDirty();
                        this._io.writeS4be(this.g);
                        this._io.writeS4be(this.a);
                        this._io.writeS4be(this.b);
                    }

                    public void _check() {
                        _dirty = false;
                    }
                    private int g;
                    private int a;
                    private int b;
                    private Icc4 _root;
                    private Icc4.TagTable.TagDefinition.ParametricCurveType _parent;
                    public int g() { return g; }
                    public void setG(int _v) { _dirty = true; g = _v; }
                    public int a() { return a; }
                    public void setA(int _v) { _dirty = true; a = _v; }
                    public int b() { return b; }
                    public void setB(int _v) { _dirty = true; b = _v; }
                    public Icc4 _root() { return _root; }
                    public void set_root(Icc4 _v) { _dirty = true; _root = _v; }
                    public Icc4.TagTable.TagDefinition.ParametricCurveType _parent() { return _parent; }
                    public void set_parent(Icc4.TagTable.TagDefinition.ParametricCurveType _v) { _dirty = true; _parent = _v; }
                }
                public static class ParamsIec6196621 extends KaitaiStruct.ReadWrite {
                    public static ParamsIec6196621 fromFile(String fileName) throws IOException {
                        return new ParamsIec6196621(new ByteBufferKaitaiStream(fileName));
                    }
                    public ParamsIec6196621() {
                        this(null, null, null);
                    }

                    public ParamsIec6196621(KaitaiStream _io) {
                        this(_io, null, null);
                    }

                    public ParamsIec6196621(KaitaiStream _io, Icc4.TagTable.TagDefinition.ParametricCurveType _parent) {
                        this(_io, _parent, null);
                    }

                    public ParamsIec6196621(KaitaiStream _io, Icc4.TagTable.TagDefinition.ParametricCurveType _parent, Icc4 _root) {
                        super(_io);
                        this._parent = _parent;
                        this._root = _root;
                    }
                    public void _read() {
                        this.g = this._io.readS4be();
                        this.a = this._io.readS4be();
                        this.b = this._io.readS4be();
                        this.c = this._io.readS4be();
                        this.d = this._io.readS4be();
                        _dirty = false;
                    }

                    public void _fetchInstances() {
                    }

                    public void _write_Seq() {
                        _assertNotDirty();
                        this._io.writeS4be(this.g);
                        this._io.writeS4be(this.a);
                        this._io.writeS4be(this.b);
                        this._io.writeS4be(this.c);
                        this._io.writeS4be(this.d);
                    }

                    public void _check() {
                        _dirty = false;
                    }
                    private int g;
                    private int a;
                    private int b;
                    private int c;
                    private int d;
                    private Icc4 _root;
                    private Icc4.TagTable.TagDefinition.ParametricCurveType _parent;
                    public int g() { return g; }
                    public void setG(int _v) { _dirty = true; g = _v; }
                    public int a() { return a; }
                    public void setA(int _v) { _dirty = true; a = _v; }
                    public int b() { return b; }
                    public void setB(int _v) { _dirty = true; b = _v; }
                    public int c() { return c; }
                    public void setC(int _v) { _dirty = true; c = _v; }
                    public int d() { return d; }
                    public void setD(int _v) { _dirty = true; d = _v; }
                    public Icc4 _root() { return _root; }
                    public void set_root(Icc4 _v) { _dirty = true; _root = _v; }
                    public Icc4.TagTable.TagDefinition.ParametricCurveType _parent() { return _parent; }
                    public void set_parent(Icc4.TagTable.TagDefinition.ParametricCurveType _v) { _dirty = true; _parent = _v; }
                }
                public static class ParamsIec619663 extends KaitaiStruct.ReadWrite {
                    public static ParamsIec619663 fromFile(String fileName) throws IOException {
                        return new ParamsIec619663(new ByteBufferKaitaiStream(fileName));
                    }
                    public ParamsIec619663() {
                        this(null, null, null);
                    }

                    public ParamsIec619663(KaitaiStream _io) {
                        this(_io, null, null);
                    }

                    public ParamsIec619663(KaitaiStream _io, Icc4.TagTable.TagDefinition.ParametricCurveType _parent) {
                        this(_io, _parent, null);
                    }

                    public ParamsIec619663(KaitaiStream _io, Icc4.TagTable.TagDefinition.ParametricCurveType _parent, Icc4 _root) {
                        super(_io);
                        this._parent = _parent;
                        this._root = _root;
                    }
                    public void _read() {
                        this.g = this._io.readS4be();
                        this.a = this._io.readS4be();
                        this.b = this._io.readS4be();
                        this.c = this._io.readS4be();
                        _dirty = false;
                    }

                    public void _fetchInstances() {
                    }

                    public void _write_Seq() {
                        _assertNotDirty();
                        this._io.writeS4be(this.g);
                        this._io.writeS4be(this.a);
                        this._io.writeS4be(this.b);
                        this._io.writeS4be(this.c);
                    }

                    public void _check() {
                        _dirty = false;
                    }
                    private int g;
                    private int a;
                    private int b;
                    private int c;
                    private Icc4 _root;
                    private Icc4.TagTable.TagDefinition.ParametricCurveType _parent;
                    public int g() { return g; }
                    public void setG(int _v) { _dirty = true; g = _v; }
                    public int a() { return a; }
                    public void setA(int _v) { _dirty = true; a = _v; }
                    public int b() { return b; }
                    public void setB(int _v) { _dirty = true; b = _v; }
                    public int c() { return c; }
                    public void setC(int _v) { _dirty = true; c = _v; }
                    public Icc4 _root() { return _root; }
                    public void set_root(Icc4 _v) { _dirty = true; _root = _v; }
                    public Icc4.TagTable.TagDefinition.ParametricCurveType _parent() { return _parent; }
                    public void set_parent(Icc4.TagTable.TagDefinition.ParametricCurveType _v) { _dirty = true; _parent = _v; }
                }
                public static class ParamsYEqualsObAxPlusBCbToPowerOfGPlusC extends KaitaiStruct.ReadWrite {
                    public static ParamsYEqualsObAxPlusBCbToPowerOfGPlusC fromFile(String fileName) throws IOException {
                        return new ParamsYEqualsObAxPlusBCbToPowerOfGPlusC(new ByteBufferKaitaiStream(fileName));
                    }
                    public ParamsYEqualsObAxPlusBCbToPowerOfGPlusC() {
                        this(null, null, null);
                    }

                    public ParamsYEqualsObAxPlusBCbToPowerOfGPlusC(KaitaiStream _io) {
                        this(_io, null, null);
                    }

                    public ParamsYEqualsObAxPlusBCbToPowerOfGPlusC(KaitaiStream _io, Icc4.TagTable.TagDefinition.ParametricCurveType _parent) {
                        this(_io, _parent, null);
                    }

                    public ParamsYEqualsObAxPlusBCbToPowerOfGPlusC(KaitaiStream _io, Icc4.TagTable.TagDefinition.ParametricCurveType _parent, Icc4 _root) {
                        super(_io);
                        this._parent = _parent;
                        this._root = _root;
                    }
                    public void _read() {
                        this.g = this._io.readS4be();
                        this.a = this._io.readS4be();
                        this.b = this._io.readS4be();
                        this.c = this._io.readS4be();
                        this.d = this._io.readS4be();
                        this.e = this._io.readS4be();
                        this.f = this._io.readS4be();
                        _dirty = false;
                    }

                    public void _fetchInstances() {
                    }

                    public void _write_Seq() {
                        _assertNotDirty();
                        this._io.writeS4be(this.g);
                        this._io.writeS4be(this.a);
                        this._io.writeS4be(this.b);
                        this._io.writeS4be(this.c);
                        this._io.writeS4be(this.d);
                        this._io.writeS4be(this.e);
                        this._io.writeS4be(this.f);
                    }

                    public void _check() {
                        _dirty = false;
                    }
                    private int g;
                    private int a;
                    private int b;
                    private int c;
                    private int d;
                    private int e;
                    private int f;
                    private Icc4 _root;
                    private Icc4.TagTable.TagDefinition.ParametricCurveType _parent;
                    public int g() { return g; }
                    public void setG(int _v) { _dirty = true; g = _v; }
                    public int a() { return a; }
                    public void setA(int _v) { _dirty = true; a = _v; }
                    public int b() { return b; }
                    public void setB(int _v) { _dirty = true; b = _v; }
                    public int c() { return c; }
                    public void setC(int _v) { _dirty = true; c = _v; }
                    public int d() { return d; }
                    public void setD(int _v) { _dirty = true; d = _v; }
                    public int e() { return e; }
                    public void setE(int _v) { _dirty = true; e = _v; }
                    public int f() { return f; }
                    public void setF(int _v) { _dirty = true; f = _v; }
                    public Icc4 _root() { return _root; }
                    public void set_root(Icc4 _v) { _dirty = true; _root = _v; }
                    public Icc4.TagTable.TagDefinition.ParametricCurveType _parent() { return _parent; }
                    public void set_parent(Icc4.TagTable.TagDefinition.ParametricCurveType _v) { _dirty = true; _parent = _v; }
                }
                public static class ParamsYEqualsXToPowerOfG extends KaitaiStruct.ReadWrite {
                    public static ParamsYEqualsXToPowerOfG fromFile(String fileName) throws IOException {
                        return new ParamsYEqualsXToPowerOfG(new ByteBufferKaitaiStream(fileName));
                    }
                    public ParamsYEqualsXToPowerOfG() {
                        this(null, null, null);
                    }

                    public ParamsYEqualsXToPowerOfG(KaitaiStream _io) {
                        this(_io, null, null);
                    }

                    public ParamsYEqualsXToPowerOfG(KaitaiStream _io, Icc4.TagTable.TagDefinition.ParametricCurveType _parent) {
                        this(_io, _parent, null);
                    }

                    public ParamsYEqualsXToPowerOfG(KaitaiStream _io, Icc4.TagTable.TagDefinition.ParametricCurveType _parent, Icc4 _root) {
                        super(_io);
                        this._parent = _parent;
                        this._root = _root;
                    }
                    public void _read() {
                        this.g = this._io.readS4be();
                        _dirty = false;
                    }

                    public void _fetchInstances() {
                    }

                    public void _write_Seq() {
                        _assertNotDirty();
                        this._io.writeS4be(this.g);
                    }

                    public void _check() {
                        _dirty = false;
                    }
                    private int g;
                    private Icc4 _root;
                    private Icc4.TagTable.TagDefinition.ParametricCurveType _parent;
                    public int g() { return g; }
                    public void setG(int _v) { _dirty = true; g = _v; }
                    public Icc4 _root() { return _root; }
                    public void set_root(Icc4 _v) { _dirty = true; _root = _v; }
                    public Icc4.TagTable.TagDefinition.ParametricCurveType _parent() { return _parent; }
                    public void set_parent(Icc4.TagTable.TagDefinition.ParametricCurveType _v) { _dirty = true; _parent = _v; }
                }
                private byte[] reserved;
                private ParametricCurveTypeFunctions functionType;
                private byte[] reserved2;
                private KaitaiStruct.ReadWrite parameters;
                private Icc4 _root;
                private KaitaiStruct.ReadWrite _parent;
                public byte[] reserved() { return reserved; }
                public void setReserved(byte[] _v) { _dirty = true; reserved = _v; }
                public ParametricCurveTypeFunctions functionType() { return functionType; }
                public void setFunctionType(ParametricCurveTypeFunctions _v) { _dirty = true; functionType = _v; }
                public byte[] reserved2() { return reserved2; }
                public void setReserved2(byte[] _v) { _dirty = true; reserved2 = _v; }
                public KaitaiStruct.ReadWrite parameters() { return parameters; }
                public void setParameters(KaitaiStruct.ReadWrite _v) { _dirty = true; parameters = _v; }
                public Icc4 _root() { return _root; }
                public void set_root(Icc4 _v) { _dirty = true; _root = _v; }
                public KaitaiStruct.ReadWrite _parent() { return _parent; }
                public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
            }
            public static class PerceptualRenderingIntentGamutTag extends KaitaiStruct.ReadWrite {
                public static PerceptualRenderingIntentGamutTag fromFile(String fileName) throws IOException {
                    return new PerceptualRenderingIntentGamutTag(new ByteBufferKaitaiStream(fileName));
                }
                public PerceptualRenderingIntentGamutTag() {
                    this(null, null, null);
                }

                public PerceptualRenderingIntentGamutTag(KaitaiStream _io) {
                    this(_io, null, null);
                }

                public PerceptualRenderingIntentGamutTag(KaitaiStream _io, Icc4.TagTable.TagDefinition _parent) {
                    this(_io, _parent, null);
                }

                public PerceptualRenderingIntentGamutTag(KaitaiStream _io, Icc4.TagTable.TagDefinition _parent, Icc4 _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                }
                public void _read() {
                    this.tagType = Icc4.TagTable.TagDefinition.TagTypeSignatures.byId(this._io.readU4be());
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case SIGNATURE_TYPE: {
                                this.tagData = new SignatureType(this._io, this, _root);
                                this.tagData._read();
                                break;
                            }
                            }
                        }
                    }
                    _dirty = false;
                }

                public void _fetchInstances() {
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case SIGNATURE_TYPE: {
                                this.tagData._fetchInstances();
                                break;
                            }
                            }
                        }
                    }
                }

                public void _write_Seq() {
                    _assertNotDirty();
                    this._io.writeU4be(((Number) (this.tagType.id())).longValue());
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case SIGNATURE_TYPE: {
                                this.tagData._write_Seq(this._io);
                                break;
                            }
                            }
                        }
                    }
                }

                public void _check() {
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case SIGNATURE_TYPE: {
                                if (!Objects.equals(this.tagData._root(), _root()))
                                    throw new ConsistencyError("tag_data", _root(), this.tagData._root());
                                if (!Objects.equals(this.tagData._parent(), this))
                                    throw new ConsistencyError("tag_data", this, this.tagData._parent());
                                break;
                            }
                            }
                        }
                    }
                    _dirty = false;
                }
                private TagTypeSignatures tagType;
                private SignatureType tagData;
                private Icc4 _root;
                private Icc4.TagTable.TagDefinition _parent;
                public TagTypeSignatures tagType() { return tagType; }
                public void setTagType(TagTypeSignatures _v) { _dirty = true; tagType = _v; }
                public SignatureType tagData() { return tagData; }
                public void setTagData(SignatureType _v) { _dirty = true; tagData = _v; }
                public Icc4 _root() { return _root; }
                public void set_root(Icc4 _v) { _dirty = true; _root = _v; }
                public Icc4.TagTable.TagDefinition _parent() { return _parent; }
                public void set_parent(Icc4.TagTable.TagDefinition _v) { _dirty = true; _parent = _v; }
            }
            public static class Preview0Tag extends KaitaiStruct.ReadWrite {
                public static Preview0Tag fromFile(String fileName) throws IOException {
                    return new Preview0Tag(new ByteBufferKaitaiStream(fileName));
                }
                public Preview0Tag() {
                    this(null, null, null);
                }

                public Preview0Tag(KaitaiStream _io) {
                    this(_io, null, null);
                }

                public Preview0Tag(KaitaiStream _io, Icc4.TagTable.TagDefinition _parent) {
                    this(_io, _parent, null);
                }

                public Preview0Tag(KaitaiStream _io, Icc4.TagTable.TagDefinition _parent, Icc4 _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                }
                public void _read() {
                    this.tagType = Icc4.TagTable.TagDefinition.TagTypeSignatures.byId(this._io.readU4be());
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case MULTI_FUNCTION_A_TO_B_TABLE_TYPE: {
                                this.tagData = new LutAToBType(this._io, this, _root);
                                ((LutAToBType) (this.tagData))._read();
                                break;
                            }
                            case MULTI_FUNCTION_B_TO_A_TABLE_TYPE: {
                                this.tagData = new LutBToAType(this._io, this, _root);
                                ((LutBToAType) (this.tagData))._read();
                                break;
                            }
                            case MULTI_FUNCTION_TABLE_WITH_ONE_BYTE_PRECISION_TYPE: {
                                this.tagData = new Lut8Type(this._io, this, _root);
                                ((Lut8Type) (this.tagData))._read();
                                break;
                            }
                            case MULTI_FUNCTION_TABLE_WITH_TWO_BYTE_PRECISION_TYPE: {
                                this.tagData = new Lut16Type(this._io, this, _root);
                                ((Lut16Type) (this.tagData))._read();
                                break;
                            }
                            }
                        }
                    }
                    _dirty = false;
                }

                public void _fetchInstances() {
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case MULTI_FUNCTION_A_TO_B_TABLE_TYPE: {
                                ((LutAToBType) (this.tagData))._fetchInstances();
                                break;
                            }
                            case MULTI_FUNCTION_B_TO_A_TABLE_TYPE: {
                                ((LutBToAType) (this.tagData))._fetchInstances();
                                break;
                            }
                            case MULTI_FUNCTION_TABLE_WITH_ONE_BYTE_PRECISION_TYPE: {
                                ((Lut8Type) (this.tagData))._fetchInstances();
                                break;
                            }
                            case MULTI_FUNCTION_TABLE_WITH_TWO_BYTE_PRECISION_TYPE: {
                                ((Lut16Type) (this.tagData))._fetchInstances();
                                break;
                            }
                            }
                        }
                    }
                }

                public void _write_Seq() {
                    _assertNotDirty();
                    this._io.writeU4be(((Number) (this.tagType.id())).longValue());
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case MULTI_FUNCTION_A_TO_B_TABLE_TYPE: {
                                ((LutAToBType) (this.tagData))._write_Seq(this._io);
                                break;
                            }
                            case MULTI_FUNCTION_B_TO_A_TABLE_TYPE: {
                                ((LutBToAType) (this.tagData))._write_Seq(this._io);
                                break;
                            }
                            case MULTI_FUNCTION_TABLE_WITH_ONE_BYTE_PRECISION_TYPE: {
                                ((Lut8Type) (this.tagData))._write_Seq(this._io);
                                break;
                            }
                            case MULTI_FUNCTION_TABLE_WITH_TWO_BYTE_PRECISION_TYPE: {
                                ((Lut16Type) (this.tagData))._write_Seq(this._io);
                                break;
                            }
                            }
                        }
                    }
                }

                public void _check() {
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case MULTI_FUNCTION_A_TO_B_TABLE_TYPE: {
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.LutAToBType) (this.tagData))._root(), _root()))
                                    throw new ConsistencyError("tag_data", _root(), ((Icc4.TagTable.TagDefinition.LutAToBType) (this.tagData))._root());
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.LutAToBType) (this.tagData))._parent(), this))
                                    throw new ConsistencyError("tag_data", this, ((Icc4.TagTable.TagDefinition.LutAToBType) (this.tagData))._parent());
                                break;
                            }
                            case MULTI_FUNCTION_B_TO_A_TABLE_TYPE: {
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.LutBToAType) (this.tagData))._root(), _root()))
                                    throw new ConsistencyError("tag_data", _root(), ((Icc4.TagTable.TagDefinition.LutBToAType) (this.tagData))._root());
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.LutBToAType) (this.tagData))._parent(), this))
                                    throw new ConsistencyError("tag_data", this, ((Icc4.TagTable.TagDefinition.LutBToAType) (this.tagData))._parent());
                                break;
                            }
                            case MULTI_FUNCTION_TABLE_WITH_ONE_BYTE_PRECISION_TYPE: {
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.Lut8Type) (this.tagData))._root(), _root()))
                                    throw new ConsistencyError("tag_data", _root(), ((Icc4.TagTable.TagDefinition.Lut8Type) (this.tagData))._root());
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.Lut8Type) (this.tagData))._parent(), this))
                                    throw new ConsistencyError("tag_data", this, ((Icc4.TagTable.TagDefinition.Lut8Type) (this.tagData))._parent());
                                break;
                            }
                            case MULTI_FUNCTION_TABLE_WITH_TWO_BYTE_PRECISION_TYPE: {
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.Lut16Type) (this.tagData))._root(), _root()))
                                    throw new ConsistencyError("tag_data", _root(), ((Icc4.TagTable.TagDefinition.Lut16Type) (this.tagData))._root());
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.Lut16Type) (this.tagData))._parent(), this))
                                    throw new ConsistencyError("tag_data", this, ((Icc4.TagTable.TagDefinition.Lut16Type) (this.tagData))._parent());
                                break;
                            }
                            }
                        }
                    }
                    _dirty = false;
                }
                private TagTypeSignatures tagType;
                private KaitaiStruct.ReadWrite tagData;
                private Icc4 _root;
                private Icc4.TagTable.TagDefinition _parent;
                public TagTypeSignatures tagType() { return tagType; }
                public void setTagType(TagTypeSignatures _v) { _dirty = true; tagType = _v; }
                public KaitaiStruct.ReadWrite tagData() { return tagData; }
                public void setTagData(KaitaiStruct.ReadWrite _v) { _dirty = true; tagData = _v; }
                public Icc4 _root() { return _root; }
                public void set_root(Icc4 _v) { _dirty = true; _root = _v; }
                public Icc4.TagTable.TagDefinition _parent() { return _parent; }
                public void set_parent(Icc4.TagTable.TagDefinition _v) { _dirty = true; _parent = _v; }
            }
            public static class Preview1Tag extends KaitaiStruct.ReadWrite {
                public static Preview1Tag fromFile(String fileName) throws IOException {
                    return new Preview1Tag(new ByteBufferKaitaiStream(fileName));
                }
                public Preview1Tag() {
                    this(null, null, null);
                }

                public Preview1Tag(KaitaiStream _io) {
                    this(_io, null, null);
                }

                public Preview1Tag(KaitaiStream _io, Icc4.TagTable.TagDefinition _parent) {
                    this(_io, _parent, null);
                }

                public Preview1Tag(KaitaiStream _io, Icc4.TagTable.TagDefinition _parent, Icc4 _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                }
                public void _read() {
                    this.tagType = Icc4.TagTable.TagDefinition.TagTypeSignatures.byId(this._io.readU4be());
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case MULTI_FUNCTION_B_TO_A_TABLE_TYPE: {
                                this.tagData = new LutBToAType(this._io, this, _root);
                                ((LutBToAType) (this.tagData))._read();
                                break;
                            }
                            case MULTI_FUNCTION_TABLE_WITH_ONE_BYTE_PRECISION_TYPE: {
                                this.tagData = new Lut8Type(this._io, this, _root);
                                ((Lut8Type) (this.tagData))._read();
                                break;
                            }
                            case MULTI_FUNCTION_TABLE_WITH_TWO_BYTE_PRECISION_TYPE: {
                                this.tagData = new Lut16Type(this._io, this, _root);
                                ((Lut16Type) (this.tagData))._read();
                                break;
                            }
                            }
                        }
                    }
                    _dirty = false;
                }

                public void _fetchInstances() {
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case MULTI_FUNCTION_B_TO_A_TABLE_TYPE: {
                                ((LutBToAType) (this.tagData))._fetchInstances();
                                break;
                            }
                            case MULTI_FUNCTION_TABLE_WITH_ONE_BYTE_PRECISION_TYPE: {
                                ((Lut8Type) (this.tagData))._fetchInstances();
                                break;
                            }
                            case MULTI_FUNCTION_TABLE_WITH_TWO_BYTE_PRECISION_TYPE: {
                                ((Lut16Type) (this.tagData))._fetchInstances();
                                break;
                            }
                            }
                        }
                    }
                }

                public void _write_Seq() {
                    _assertNotDirty();
                    this._io.writeU4be(((Number) (this.tagType.id())).longValue());
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case MULTI_FUNCTION_B_TO_A_TABLE_TYPE: {
                                ((LutBToAType) (this.tagData))._write_Seq(this._io);
                                break;
                            }
                            case MULTI_FUNCTION_TABLE_WITH_ONE_BYTE_PRECISION_TYPE: {
                                ((Lut8Type) (this.tagData))._write_Seq(this._io);
                                break;
                            }
                            case MULTI_FUNCTION_TABLE_WITH_TWO_BYTE_PRECISION_TYPE: {
                                ((Lut16Type) (this.tagData))._write_Seq(this._io);
                                break;
                            }
                            }
                        }
                    }
                }

                public void _check() {
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case MULTI_FUNCTION_B_TO_A_TABLE_TYPE: {
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.LutBToAType) (this.tagData))._root(), _root()))
                                    throw new ConsistencyError("tag_data", _root(), ((Icc4.TagTable.TagDefinition.LutBToAType) (this.tagData))._root());
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.LutBToAType) (this.tagData))._parent(), this))
                                    throw new ConsistencyError("tag_data", this, ((Icc4.TagTable.TagDefinition.LutBToAType) (this.tagData))._parent());
                                break;
                            }
                            case MULTI_FUNCTION_TABLE_WITH_ONE_BYTE_PRECISION_TYPE: {
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.Lut8Type) (this.tagData))._root(), _root()))
                                    throw new ConsistencyError("tag_data", _root(), ((Icc4.TagTable.TagDefinition.Lut8Type) (this.tagData))._root());
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.Lut8Type) (this.tagData))._parent(), this))
                                    throw new ConsistencyError("tag_data", this, ((Icc4.TagTable.TagDefinition.Lut8Type) (this.tagData))._parent());
                                break;
                            }
                            case MULTI_FUNCTION_TABLE_WITH_TWO_BYTE_PRECISION_TYPE: {
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.Lut16Type) (this.tagData))._root(), _root()))
                                    throw new ConsistencyError("tag_data", _root(), ((Icc4.TagTable.TagDefinition.Lut16Type) (this.tagData))._root());
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.Lut16Type) (this.tagData))._parent(), this))
                                    throw new ConsistencyError("tag_data", this, ((Icc4.TagTable.TagDefinition.Lut16Type) (this.tagData))._parent());
                                break;
                            }
                            }
                        }
                    }
                    _dirty = false;
                }
                private TagTypeSignatures tagType;
                private KaitaiStruct.ReadWrite tagData;
                private Icc4 _root;
                private Icc4.TagTable.TagDefinition _parent;
                public TagTypeSignatures tagType() { return tagType; }
                public void setTagType(TagTypeSignatures _v) { _dirty = true; tagType = _v; }
                public KaitaiStruct.ReadWrite tagData() { return tagData; }
                public void setTagData(KaitaiStruct.ReadWrite _v) { _dirty = true; tagData = _v; }
                public Icc4 _root() { return _root; }
                public void set_root(Icc4 _v) { _dirty = true; _root = _v; }
                public Icc4.TagTable.TagDefinition _parent() { return _parent; }
                public void set_parent(Icc4.TagTable.TagDefinition _v) { _dirty = true; _parent = _v; }
            }
            public static class Preview2Tag extends KaitaiStruct.ReadWrite {
                public static Preview2Tag fromFile(String fileName) throws IOException {
                    return new Preview2Tag(new ByteBufferKaitaiStream(fileName));
                }
                public Preview2Tag() {
                    this(null, null, null);
                }

                public Preview2Tag(KaitaiStream _io) {
                    this(_io, null, null);
                }

                public Preview2Tag(KaitaiStream _io, Icc4.TagTable.TagDefinition _parent) {
                    this(_io, _parent, null);
                }

                public Preview2Tag(KaitaiStream _io, Icc4.TagTable.TagDefinition _parent, Icc4 _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                }
                public void _read() {
                    this.tagType = Icc4.TagTable.TagDefinition.TagTypeSignatures.byId(this._io.readU4be());
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case MULTI_FUNCTION_B_TO_A_TABLE_TYPE: {
                                this.tagData = new LutBToAType(this._io, this, _root);
                                ((LutBToAType) (this.tagData))._read();
                                break;
                            }
                            case MULTI_FUNCTION_TABLE_WITH_ONE_BYTE_PRECISION_TYPE: {
                                this.tagData = new Lut8Type(this._io, this, _root);
                                ((Lut8Type) (this.tagData))._read();
                                break;
                            }
                            case MULTI_FUNCTION_TABLE_WITH_TWO_BYTE_PRECISION_TYPE: {
                                this.tagData = new Lut16Type(this._io, this, _root);
                                ((Lut16Type) (this.tagData))._read();
                                break;
                            }
                            }
                        }
                    }
                    _dirty = false;
                }

                public void _fetchInstances() {
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case MULTI_FUNCTION_B_TO_A_TABLE_TYPE: {
                                ((LutBToAType) (this.tagData))._fetchInstances();
                                break;
                            }
                            case MULTI_FUNCTION_TABLE_WITH_ONE_BYTE_PRECISION_TYPE: {
                                ((Lut8Type) (this.tagData))._fetchInstances();
                                break;
                            }
                            case MULTI_FUNCTION_TABLE_WITH_TWO_BYTE_PRECISION_TYPE: {
                                ((Lut16Type) (this.tagData))._fetchInstances();
                                break;
                            }
                            }
                        }
                    }
                }

                public void _write_Seq() {
                    _assertNotDirty();
                    this._io.writeU4be(((Number) (this.tagType.id())).longValue());
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case MULTI_FUNCTION_B_TO_A_TABLE_TYPE: {
                                ((LutBToAType) (this.tagData))._write_Seq(this._io);
                                break;
                            }
                            case MULTI_FUNCTION_TABLE_WITH_ONE_BYTE_PRECISION_TYPE: {
                                ((Lut8Type) (this.tagData))._write_Seq(this._io);
                                break;
                            }
                            case MULTI_FUNCTION_TABLE_WITH_TWO_BYTE_PRECISION_TYPE: {
                                ((Lut16Type) (this.tagData))._write_Seq(this._io);
                                break;
                            }
                            }
                        }
                    }
                }

                public void _check() {
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case MULTI_FUNCTION_B_TO_A_TABLE_TYPE: {
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.LutBToAType) (this.tagData))._root(), _root()))
                                    throw new ConsistencyError("tag_data", _root(), ((Icc4.TagTable.TagDefinition.LutBToAType) (this.tagData))._root());
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.LutBToAType) (this.tagData))._parent(), this))
                                    throw new ConsistencyError("tag_data", this, ((Icc4.TagTable.TagDefinition.LutBToAType) (this.tagData))._parent());
                                break;
                            }
                            case MULTI_FUNCTION_TABLE_WITH_ONE_BYTE_PRECISION_TYPE: {
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.Lut8Type) (this.tagData))._root(), _root()))
                                    throw new ConsistencyError("tag_data", _root(), ((Icc4.TagTable.TagDefinition.Lut8Type) (this.tagData))._root());
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.Lut8Type) (this.tagData))._parent(), this))
                                    throw new ConsistencyError("tag_data", this, ((Icc4.TagTable.TagDefinition.Lut8Type) (this.tagData))._parent());
                                break;
                            }
                            case MULTI_FUNCTION_TABLE_WITH_TWO_BYTE_PRECISION_TYPE: {
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.Lut16Type) (this.tagData))._root(), _root()))
                                    throw new ConsistencyError("tag_data", _root(), ((Icc4.TagTable.TagDefinition.Lut16Type) (this.tagData))._root());
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.Lut16Type) (this.tagData))._parent(), this))
                                    throw new ConsistencyError("tag_data", this, ((Icc4.TagTable.TagDefinition.Lut16Type) (this.tagData))._parent());
                                break;
                            }
                            }
                        }
                    }
                    _dirty = false;
                }
                private TagTypeSignatures tagType;
                private KaitaiStruct.ReadWrite tagData;
                private Icc4 _root;
                private Icc4.TagTable.TagDefinition _parent;
                public TagTypeSignatures tagType() { return tagType; }
                public void setTagType(TagTypeSignatures _v) { _dirty = true; tagType = _v; }
                public KaitaiStruct.ReadWrite tagData() { return tagData; }
                public void setTagData(KaitaiStruct.ReadWrite _v) { _dirty = true; tagData = _v; }
                public Icc4 _root() { return _root; }
                public void set_root(Icc4 _v) { _dirty = true; _root = _v; }
                public Icc4.TagTable.TagDefinition _parent() { return _parent; }
                public void set_parent(Icc4.TagTable.TagDefinition _v) { _dirty = true; _parent = _v; }
            }
            public static class ProfileDescriptionTag extends KaitaiStruct.ReadWrite {
                public static ProfileDescriptionTag fromFile(String fileName) throws IOException {
                    return new ProfileDescriptionTag(new ByteBufferKaitaiStream(fileName));
                }
                public ProfileDescriptionTag() {
                    this(null, null, null);
                }

                public ProfileDescriptionTag(KaitaiStream _io) {
                    this(_io, null, null);
                }

                public ProfileDescriptionTag(KaitaiStream _io, Icc4.TagTable.TagDefinition _parent) {
                    this(_io, _parent, null);
                }

                public ProfileDescriptionTag(KaitaiStream _io, Icc4.TagTable.TagDefinition _parent, Icc4 _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                }
                public void _read() {
                    this.tagType = Icc4.TagTable.TagDefinition.TagTypeSignatures.byId(this._io.readU4be());
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case MULTI_LOCALIZED_UNICODE_TYPE: {
                                this.tagData = new MultiLocalizedUnicodeType(this._io, this, _root);
                                this.tagData._read();
                                break;
                            }
                            }
                        }
                    }
                    _dirty = false;
                }

                public void _fetchInstances() {
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case MULTI_LOCALIZED_UNICODE_TYPE: {
                                this.tagData._fetchInstances();
                                break;
                            }
                            }
                        }
                    }
                }

                public void _write_Seq() {
                    _assertNotDirty();
                    this._io.writeU4be(((Number) (this.tagType.id())).longValue());
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case MULTI_LOCALIZED_UNICODE_TYPE: {
                                this.tagData._write_Seq(this._io);
                                break;
                            }
                            }
                        }
                    }
                }

                public void _check() {
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case MULTI_LOCALIZED_UNICODE_TYPE: {
                                if (!Objects.equals(this.tagData._root(), _root()))
                                    throw new ConsistencyError("tag_data", _root(), this.tagData._root());
                                if (!Objects.equals(this.tagData._parent(), this))
                                    throw new ConsistencyError("tag_data", this, this.tagData._parent());
                                break;
                            }
                            }
                        }
                    }
                    _dirty = false;
                }
                private TagTypeSignatures tagType;
                private MultiLocalizedUnicodeType tagData;
                private Icc4 _root;
                private Icc4.TagTable.TagDefinition _parent;
                public TagTypeSignatures tagType() { return tagType; }
                public void setTagType(TagTypeSignatures _v) { _dirty = true; tagType = _v; }
                public MultiLocalizedUnicodeType tagData() { return tagData; }
                public void setTagData(MultiLocalizedUnicodeType _v) { _dirty = true; tagData = _v; }
                public Icc4 _root() { return _root; }
                public void set_root(Icc4 _v) { _dirty = true; _root = _v; }
                public Icc4.TagTable.TagDefinition _parent() { return _parent; }
                public void set_parent(Icc4.TagTable.TagDefinition _v) { _dirty = true; _parent = _v; }
            }
            public static class ProfileSequenceDescType extends KaitaiStruct.ReadWrite {
                public static ProfileSequenceDescType fromFile(String fileName) throws IOException {
                    return new ProfileSequenceDescType(new ByteBufferKaitaiStream(fileName));
                }
                public ProfileSequenceDescType() {
                    this(null, null, null);
                }

                public ProfileSequenceDescType(KaitaiStream _io) {
                    this(_io, null, null);
                }

                public ProfileSequenceDescType(KaitaiStream _io, Icc4.TagTable.TagDefinition.ProfileSequenceTag _parent) {
                    this(_io, _parent, null);
                }

                public ProfileSequenceDescType(KaitaiStream _io, Icc4.TagTable.TagDefinition.ProfileSequenceTag _parent, Icc4 _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                }
                public void _read() {
                    this.reserved = this._io.readBytes(4);
                    if (!(Arrays.equals(this.reserved, new byte[] { 0, 0, 0, 0 }))) {
                        throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0, 0, 0, 0 }, this.reserved, this._io, "/types/tag_table/types/tag_definition/types/profile_sequence_desc_type/seq/0");
                    }
                    this.numberOfDescriptionStructures = this._io.readU4be();
                    this.profileDescriptions = new ArrayList<ProfileDescription>();
                    for (int i = 0; i < numberOfDescriptionStructures(); i++) {
                        ProfileDescription _t_profileDescriptions = new ProfileDescription(this._io, this, _root);
                        try {
                            _t_profileDescriptions._read();
                        } finally {
                            this.profileDescriptions.add(_t_profileDescriptions);
                        }
                    }
                    _dirty = false;
                }

                public void _fetchInstances() {
                    for (int i = 0; i < this.profileDescriptions.size(); i++) {
                        this.profileDescriptions.get(((Number) (i)).intValue())._fetchInstances();
                    }
                }

                public void _write_Seq() {
                    _assertNotDirty();
                    this._io.writeBytes(this.reserved);
                    this._io.writeU4be(this.numberOfDescriptionStructures);
                    for (int i = 0; i < this.profileDescriptions.size(); i++) {
                        this.profileDescriptions.get(((Number) (i)).intValue())._write_Seq(this._io);
                    }
                }

                public void _check() {
                    if (this.reserved.length != 4)
                        throw new ConsistencyError("reserved", 4, this.reserved.length);
                    if (!(Arrays.equals(this.reserved, new byte[] { 0, 0, 0, 0 }))) {
                        throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0, 0, 0, 0 }, this.reserved, null, "/types/tag_table/types/tag_definition/types/profile_sequence_desc_type/seq/0");
                    }
                    if (this.profileDescriptions.size() != numberOfDescriptionStructures())
                        throw new ConsistencyError("profile_descriptions", numberOfDescriptionStructures(), this.profileDescriptions.size());
                    for (int i = 0; i < this.profileDescriptions.size(); i++) {
                        if (!Objects.equals(this.profileDescriptions.get(((Number) (i)).intValue())._root(), _root()))
                            throw new ConsistencyError("profile_descriptions", _root(), this.profileDescriptions.get(((Number) (i)).intValue())._root());
                        if (!Objects.equals(this.profileDescriptions.get(((Number) (i)).intValue())._parent(), this))
                            throw new ConsistencyError("profile_descriptions", this, this.profileDescriptions.get(((Number) (i)).intValue())._parent());
                    }
                    _dirty = false;
                }
                public static class ProfileDescription extends KaitaiStruct.ReadWrite {
                    public static ProfileDescription fromFile(String fileName) throws IOException {
                        return new ProfileDescription(new ByteBufferKaitaiStream(fileName));
                    }
                    public ProfileDescription() {
                        this(null, null, null);
                    }

                    public ProfileDescription(KaitaiStream _io) {
                        this(_io, null, null);
                    }

                    public ProfileDescription(KaitaiStream _io, Icc4.TagTable.TagDefinition.ProfileSequenceDescType _parent) {
                        this(_io, _parent, null);
                    }

                    public ProfileDescription(KaitaiStream _io, Icc4.TagTable.TagDefinition.ProfileSequenceDescType _parent, Icc4 _root) {
                        super(_io);
                        this._parent = _parent;
                        this._root = _root;
                    }
                    public void _read() {
                        this.deviceManufacturer = new DeviceManufacturer(this._io, this, _root);
                        this.deviceManufacturer._read();
                        this.deviceModel = new String(this._io.readBytes(4), StandardCharsets.US_ASCII);
                        this.deviceAttributes = new DeviceAttributes(this._io, this, _root);
                        this.deviceAttributes._read();
                        this.deviceTechnology = new TechnologyTag(this._io, this, _root);
                        this.deviceTechnology._read();
                        this.descriptionOfDeviceManufacturer = new DeviceMfgDescTag(this._io, this, _root);
                        this.descriptionOfDeviceManufacturer._read();
                        this.descriptionOfDeviceModel = new DeviceModelDescTag(this._io, this, _root);
                        this.descriptionOfDeviceModel._read();
                        _dirty = false;
                    }

                    public void _fetchInstances() {
                        this.deviceManufacturer._fetchInstances();
                        this.deviceAttributes._fetchInstances();
                        this.deviceTechnology._fetchInstances();
                        this.descriptionOfDeviceManufacturer._fetchInstances();
                        this.descriptionOfDeviceModel._fetchInstances();
                    }

                    public void _write_Seq() {
                        _assertNotDirty();
                        this.deviceManufacturer._write_Seq(this._io);
                        this._io.writeBytes((this.deviceModel).getBytes(Charset.forName("ASCII")));
                        this.deviceAttributes._write_Seq(this._io);
                        this.deviceTechnology._write_Seq(this._io);
                        this.descriptionOfDeviceManufacturer._write_Seq(this._io);
                        this.descriptionOfDeviceModel._write_Seq(this._io);
                    }

                    public void _check() {
                        if (!Objects.equals(this.deviceManufacturer._root(), _root()))
                            throw new ConsistencyError("device_manufacturer", _root(), this.deviceManufacturer._root());
                        if (!Objects.equals(this.deviceManufacturer._parent(), this))
                            throw new ConsistencyError("device_manufacturer", this, this.deviceManufacturer._parent());
                        if ((this.deviceModel).getBytes(Charset.forName("ASCII")).length != 4)
                            throw new ConsistencyError("device_model", 4, (this.deviceModel).getBytes(Charset.forName("ASCII")).length);
                        if (!Objects.equals(this.deviceAttributes._root(), _root()))
                            throw new ConsistencyError("device_attributes", _root(), this.deviceAttributes._root());
                        if (!Objects.equals(this.deviceAttributes._parent(), this))
                            throw new ConsistencyError("device_attributes", this, this.deviceAttributes._parent());
                        if (!Objects.equals(this.deviceTechnology._root(), _root()))
                            throw new ConsistencyError("device_technology", _root(), this.deviceTechnology._root());
                        if (!Objects.equals(this.deviceTechnology._parent(), this))
                            throw new ConsistencyError("device_technology", this, this.deviceTechnology._parent());
                        if (!Objects.equals(this.descriptionOfDeviceManufacturer._root(), _root()))
                            throw new ConsistencyError("description_of_device_manufacturer", _root(), this.descriptionOfDeviceManufacturer._root());
                        if (!Objects.equals(this.descriptionOfDeviceManufacturer._parent(), this))
                            throw new ConsistencyError("description_of_device_manufacturer", this, this.descriptionOfDeviceManufacturer._parent());
                        if (!Objects.equals(this.descriptionOfDeviceModel._root(), _root()))
                            throw new ConsistencyError("description_of_device_model", _root(), this.descriptionOfDeviceModel._root());
                        if (!Objects.equals(this.descriptionOfDeviceModel._parent(), this))
                            throw new ConsistencyError("description_of_device_model", this, this.descriptionOfDeviceModel._parent());
                        _dirty = false;
                    }
                    private DeviceManufacturer deviceManufacturer;
                    private String deviceModel;
                    private DeviceAttributes deviceAttributes;
                    private TechnologyTag deviceTechnology;
                    private DeviceMfgDescTag descriptionOfDeviceManufacturer;
                    private DeviceModelDescTag descriptionOfDeviceModel;
                    private Icc4 _root;
                    private Icc4.TagTable.TagDefinition.ProfileSequenceDescType _parent;
                    public DeviceManufacturer deviceManufacturer() { return deviceManufacturer; }
                    public void setDeviceManufacturer(DeviceManufacturer _v) { _dirty = true; deviceManufacturer = _v; }
                    public String deviceModel() { return deviceModel; }
                    public void setDeviceModel(String _v) { _dirty = true; deviceModel = _v; }
                    public DeviceAttributes deviceAttributes() { return deviceAttributes; }
                    public void setDeviceAttributes(DeviceAttributes _v) { _dirty = true; deviceAttributes = _v; }
                    public TechnologyTag deviceTechnology() { return deviceTechnology; }
                    public void setDeviceTechnology(TechnologyTag _v) { _dirty = true; deviceTechnology = _v; }
                    public DeviceMfgDescTag descriptionOfDeviceManufacturer() { return descriptionOfDeviceManufacturer; }
                    public void setDescriptionOfDeviceManufacturer(DeviceMfgDescTag _v) { _dirty = true; descriptionOfDeviceManufacturer = _v; }
                    public DeviceModelDescTag descriptionOfDeviceModel() { return descriptionOfDeviceModel; }
                    public void setDescriptionOfDeviceModel(DeviceModelDescTag _v) { _dirty = true; descriptionOfDeviceModel = _v; }
                    public Icc4 _root() { return _root; }
                    public void set_root(Icc4 _v) { _dirty = true; _root = _v; }
                    public Icc4.TagTable.TagDefinition.ProfileSequenceDescType _parent() { return _parent; }
                    public void set_parent(Icc4.TagTable.TagDefinition.ProfileSequenceDescType _v) { _dirty = true; _parent = _v; }
                }
                private byte[] reserved;
                private long numberOfDescriptionStructures;
                private List<ProfileDescription> profileDescriptions;
                private Icc4 _root;
                private Icc4.TagTable.TagDefinition.ProfileSequenceTag _parent;
                public byte[] reserved() { return reserved; }
                public void setReserved(byte[] _v) { _dirty = true; reserved = _v; }
                public long numberOfDescriptionStructures() { return numberOfDescriptionStructures; }
                public void setNumberOfDescriptionStructures(long _v) { _dirty = true; numberOfDescriptionStructures = _v; }
                public List<ProfileDescription> profileDescriptions() { return profileDescriptions; }
                public void setProfileDescriptions(List<ProfileDescription> _v) { _dirty = true; profileDescriptions = _v; }
                public Icc4 _root() { return _root; }
                public void set_root(Icc4 _v) { _dirty = true; _root = _v; }
                public Icc4.TagTable.TagDefinition.ProfileSequenceTag _parent() { return _parent; }
                public void set_parent(Icc4.TagTable.TagDefinition.ProfileSequenceTag _v) { _dirty = true; _parent = _v; }
            }
            public static class ProfileSequenceIdentifierTag extends KaitaiStruct.ReadWrite {
                public static ProfileSequenceIdentifierTag fromFile(String fileName) throws IOException {
                    return new ProfileSequenceIdentifierTag(new ByteBufferKaitaiStream(fileName));
                }
                public ProfileSequenceIdentifierTag() {
                    this(null, null, null);
                }

                public ProfileSequenceIdentifierTag(KaitaiStream _io) {
                    this(_io, null, null);
                }

                public ProfileSequenceIdentifierTag(KaitaiStream _io, Icc4.TagTable.TagDefinition _parent) {
                    this(_io, _parent, null);
                }

                public ProfileSequenceIdentifierTag(KaitaiStream _io, Icc4.TagTable.TagDefinition _parent, Icc4 _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                }
                public void _read() {
                    this.tagType = Icc4.TagTable.TagDefinition.TagTypeSignatures.byId(this._io.readU4be());
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case PROFILE_SEQUENCE_IDENTIFIER_TYPE: {
                                this.tagData = new ProfileSequenceIdentifierType(this._io, this, _root);
                                this.tagData._read();
                                break;
                            }
                            }
                        }
                    }
                    _dirty = false;
                }

                public void _fetchInstances() {
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case PROFILE_SEQUENCE_IDENTIFIER_TYPE: {
                                this.tagData._fetchInstances();
                                break;
                            }
                            }
                        }
                    }
                }

                public void _write_Seq() {
                    _assertNotDirty();
                    this._io.writeU4be(((Number) (this.tagType.id())).longValue());
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case PROFILE_SEQUENCE_IDENTIFIER_TYPE: {
                                this.tagData._write_Seq(this._io);
                                break;
                            }
                            }
                        }
                    }
                }

                public void _check() {
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case PROFILE_SEQUENCE_IDENTIFIER_TYPE: {
                                if (!Objects.equals(this.tagData._root(), _root()))
                                    throw new ConsistencyError("tag_data", _root(), this.tagData._root());
                                if (!Objects.equals(this.tagData._parent(), this))
                                    throw new ConsistencyError("tag_data", this, this.tagData._parent());
                                break;
                            }
                            }
                        }
                    }
                    _dirty = false;
                }
                private TagTypeSignatures tagType;
                private ProfileSequenceIdentifierType tagData;
                private Icc4 _root;
                private Icc4.TagTable.TagDefinition _parent;
                public TagTypeSignatures tagType() { return tagType; }
                public void setTagType(TagTypeSignatures _v) { _dirty = true; tagType = _v; }
                public ProfileSequenceIdentifierType tagData() { return tagData; }
                public void setTagData(ProfileSequenceIdentifierType _v) { _dirty = true; tagData = _v; }
                public Icc4 _root() { return _root; }
                public void set_root(Icc4 _v) { _dirty = true; _root = _v; }
                public Icc4.TagTable.TagDefinition _parent() { return _parent; }
                public void set_parent(Icc4.TagTable.TagDefinition _v) { _dirty = true; _parent = _v; }
            }
            public static class ProfileSequenceIdentifierType extends KaitaiStruct.ReadWrite {
                public static ProfileSequenceIdentifierType fromFile(String fileName) throws IOException {
                    return new ProfileSequenceIdentifierType(new ByteBufferKaitaiStream(fileName));
                }
                public ProfileSequenceIdentifierType() {
                    this(null, null, null);
                }

                public ProfileSequenceIdentifierType(KaitaiStream _io) {
                    this(_io, null, null);
                }

                public ProfileSequenceIdentifierType(KaitaiStream _io, Icc4.TagTable.TagDefinition.ProfileSequenceIdentifierTag _parent) {
                    this(_io, _parent, null);
                }

                public ProfileSequenceIdentifierType(KaitaiStream _io, Icc4.TagTable.TagDefinition.ProfileSequenceIdentifierTag _parent, Icc4 _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                }
                public void _read() {
                    this.reserved = this._io.readBytes(4);
                    if (!(Arrays.equals(this.reserved, new byte[] { 0, 0, 0, 0 }))) {
                        throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0, 0, 0, 0 }, this.reserved, this._io, "/types/tag_table/types/tag_definition/types/profile_sequence_identifier_type/seq/0");
                    }
                    this.numberOfStructures = this._io.readU4be();
                    this.positionsTable = new ArrayList<PositionNumber>();
                    for (int i = 0; i < numberOfStructures(); i++) {
                        PositionNumber _t_positionsTable = new PositionNumber(this._io, this, _root);
                        try {
                            _t_positionsTable._read();
                        } finally {
                            this.positionsTable.add(_t_positionsTable);
                        }
                    }
                    this.profileIdentifiers = new ArrayList<ProfileIdentifier>();
                    for (int i = 0; i < numberOfStructures(); i++) {
                        ProfileIdentifier _t_profileIdentifiers = new ProfileIdentifier(this._io, this, _root);
                        try {
                            _t_profileIdentifiers._read();
                        } finally {
                            this.profileIdentifiers.add(_t_profileIdentifiers);
                        }
                    }
                    _dirty = false;
                }

                public void _fetchInstances() {
                    for (int i = 0; i < this.positionsTable.size(); i++) {
                        this.positionsTable.get(((Number) (i)).intValue())._fetchInstances();
                    }
                    for (int i = 0; i < this.profileIdentifiers.size(); i++) {
                        this.profileIdentifiers.get(((Number) (i)).intValue())._fetchInstances();
                    }
                }

                public void _write_Seq() {
                    _assertNotDirty();
                    this._io.writeBytes(this.reserved);
                    this._io.writeU4be(this.numberOfStructures);
                    for (int i = 0; i < this.positionsTable.size(); i++) {
                        this.positionsTable.get(((Number) (i)).intValue())._write_Seq(this._io);
                    }
                    for (int i = 0; i < this.profileIdentifiers.size(); i++) {
                        this.profileIdentifiers.get(((Number) (i)).intValue())._write_Seq(this._io);
                    }
                }

                public void _check() {
                    if (this.reserved.length != 4)
                        throw new ConsistencyError("reserved", 4, this.reserved.length);
                    if (!(Arrays.equals(this.reserved, new byte[] { 0, 0, 0, 0 }))) {
                        throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0, 0, 0, 0 }, this.reserved, null, "/types/tag_table/types/tag_definition/types/profile_sequence_identifier_type/seq/0");
                    }
                    if (this.positionsTable.size() != numberOfStructures())
                        throw new ConsistencyError("positions_table", numberOfStructures(), this.positionsTable.size());
                    for (int i = 0; i < this.positionsTable.size(); i++) {
                        if (!Objects.equals(this.positionsTable.get(((Number) (i)).intValue())._root(), _root()))
                            throw new ConsistencyError("positions_table", _root(), this.positionsTable.get(((Number) (i)).intValue())._root());
                        if (!Objects.equals(this.positionsTable.get(((Number) (i)).intValue())._parent(), this))
                            throw new ConsistencyError("positions_table", this, this.positionsTable.get(((Number) (i)).intValue())._parent());
                    }
                    if (this.profileIdentifiers.size() != numberOfStructures())
                        throw new ConsistencyError("profile_identifiers", numberOfStructures(), this.profileIdentifiers.size());
                    for (int i = 0; i < this.profileIdentifiers.size(); i++) {
                        if (!Objects.equals(this.profileIdentifiers.get(((Number) (i)).intValue())._root(), _root()))
                            throw new ConsistencyError("profile_identifiers", _root(), this.profileIdentifiers.get(((Number) (i)).intValue())._root());
                        if (!Objects.equals(this.profileIdentifiers.get(((Number) (i)).intValue())._parent(), this))
                            throw new ConsistencyError("profile_identifiers", this, this.profileIdentifiers.get(((Number) (i)).intValue())._parent());
                    }
                    _dirty = false;
                }
                public static class ProfileIdentifier extends KaitaiStruct.ReadWrite {
                    public static ProfileIdentifier fromFile(String fileName) throws IOException {
                        return new ProfileIdentifier(new ByteBufferKaitaiStream(fileName));
                    }
                    public ProfileIdentifier() {
                        this(null, null, null);
                    }

                    public ProfileIdentifier(KaitaiStream _io) {
                        this(_io, null, null);
                    }

                    public ProfileIdentifier(KaitaiStream _io, Icc4.TagTable.TagDefinition.ProfileSequenceIdentifierType _parent) {
                        this(_io, _parent, null);
                    }

                    public ProfileIdentifier(KaitaiStream _io, Icc4.TagTable.TagDefinition.ProfileSequenceIdentifierType _parent, Icc4 _root) {
                        super(_io);
                        this._parent = _parent;
                        this._root = _root;
                    }
                    public void _read() {
                        this.profileId = this._io.readBytes(16);
                        this.profileDescription = new MultiLocalizedUnicodeType(this._io, this, _root);
                        this.profileDescription._read();
                        _dirty = false;
                    }

                    public void _fetchInstances() {
                        this.profileDescription._fetchInstances();
                    }

                    public void _write_Seq() {
                        _assertNotDirty();
                        this._io.writeBytes(this.profileId);
                        this.profileDescription._write_Seq(this._io);
                    }

                    public void _check() {
                        if (this.profileId.length != 16)
                            throw new ConsistencyError("profile_id", 16, this.profileId.length);
                        if (!Objects.equals(this.profileDescription._root(), _root()))
                            throw new ConsistencyError("profile_description", _root(), this.profileDescription._root());
                        if (!Objects.equals(this.profileDescription._parent(), this))
                            throw new ConsistencyError("profile_description", this, this.profileDescription._parent());
                        _dirty = false;
                    }
                    private byte[] profileId;
                    private MultiLocalizedUnicodeType profileDescription;
                    private Icc4 _root;
                    private Icc4.TagTable.TagDefinition.ProfileSequenceIdentifierType _parent;
                    public byte[] profileId() { return profileId; }
                    public void setProfileId(byte[] _v) { _dirty = true; profileId = _v; }
                    public MultiLocalizedUnicodeType profileDescription() { return profileDescription; }
                    public void setProfileDescription(MultiLocalizedUnicodeType _v) { _dirty = true; profileDescription = _v; }
                    public Icc4 _root() { return _root; }
                    public void set_root(Icc4 _v) { _dirty = true; _root = _v; }
                    public Icc4.TagTable.TagDefinition.ProfileSequenceIdentifierType _parent() { return _parent; }
                    public void set_parent(Icc4.TagTable.TagDefinition.ProfileSequenceIdentifierType _v) { _dirty = true; _parent = _v; }
                }
                private byte[] reserved;
                private long numberOfStructures;
                private List<PositionNumber> positionsTable;
                private List<ProfileIdentifier> profileIdentifiers;
                private Icc4 _root;
                private Icc4.TagTable.TagDefinition.ProfileSequenceIdentifierTag _parent;
                public byte[] reserved() { return reserved; }
                public void setReserved(byte[] _v) { _dirty = true; reserved = _v; }
                public long numberOfStructures() { return numberOfStructures; }
                public void setNumberOfStructures(long _v) { _dirty = true; numberOfStructures = _v; }
                public List<PositionNumber> positionsTable() { return positionsTable; }
                public void setPositionsTable(List<PositionNumber> _v) { _dirty = true; positionsTable = _v; }
                public List<ProfileIdentifier> profileIdentifiers() { return profileIdentifiers; }
                public void setProfileIdentifiers(List<ProfileIdentifier> _v) { _dirty = true; profileIdentifiers = _v; }
                public Icc4 _root() { return _root; }
                public void set_root(Icc4 _v) { _dirty = true; _root = _v; }
                public Icc4.TagTable.TagDefinition.ProfileSequenceIdentifierTag _parent() { return _parent; }
                public void set_parent(Icc4.TagTable.TagDefinition.ProfileSequenceIdentifierTag _v) { _dirty = true; _parent = _v; }
            }
            public static class ProfileSequenceTag extends KaitaiStruct.ReadWrite {
                public static ProfileSequenceTag fromFile(String fileName) throws IOException {
                    return new ProfileSequenceTag(new ByteBufferKaitaiStream(fileName));
                }
                public ProfileSequenceTag() {
                    this(null, null, null);
                }

                public ProfileSequenceTag(KaitaiStream _io) {
                    this(_io, null, null);
                }

                public ProfileSequenceTag(KaitaiStream _io, Icc4.TagTable.TagDefinition _parent) {
                    this(_io, _parent, null);
                }

                public ProfileSequenceTag(KaitaiStream _io, Icc4.TagTable.TagDefinition _parent, Icc4 _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                }
                public void _read() {
                    this.tagType = Icc4.TagTable.TagDefinition.TagTypeSignatures.byId(this._io.readU4be());
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case PROFILE_SEQUENCE_DESC_TYPE: {
                                this.tagData = new ProfileSequenceDescType(this._io, this, _root);
                                this.tagData._read();
                                break;
                            }
                            }
                        }
                    }
                    _dirty = false;
                }

                public void _fetchInstances() {
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case PROFILE_SEQUENCE_DESC_TYPE: {
                                this.tagData._fetchInstances();
                                break;
                            }
                            }
                        }
                    }
                }

                public void _write_Seq() {
                    _assertNotDirty();
                    this._io.writeU4be(((Number) (this.tagType.id())).longValue());
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case PROFILE_SEQUENCE_DESC_TYPE: {
                                this.tagData._write_Seq(this._io);
                                break;
                            }
                            }
                        }
                    }
                }

                public void _check() {
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case PROFILE_SEQUENCE_DESC_TYPE: {
                                if (!Objects.equals(this.tagData._root(), _root()))
                                    throw new ConsistencyError("tag_data", _root(), this.tagData._root());
                                if (!Objects.equals(this.tagData._parent(), this))
                                    throw new ConsistencyError("tag_data", this, this.tagData._parent());
                                break;
                            }
                            }
                        }
                    }
                    _dirty = false;
                }
                private TagTypeSignatures tagType;
                private ProfileSequenceDescType tagData;
                private Icc4 _root;
                private Icc4.TagTable.TagDefinition _parent;
                public TagTypeSignatures tagType() { return tagType; }
                public void setTagType(TagTypeSignatures _v) { _dirty = true; tagType = _v; }
                public ProfileSequenceDescType tagData() { return tagData; }
                public void setTagData(ProfileSequenceDescType _v) { _dirty = true; tagData = _v; }
                public Icc4 _root() { return _root; }
                public void set_root(Icc4 _v) { _dirty = true; _root = _v; }
                public Icc4.TagTable.TagDefinition _parent() { return _parent; }
                public void set_parent(Icc4.TagTable.TagDefinition _v) { _dirty = true; _parent = _v; }
            }
            public static class RedMatrixColumnTag extends KaitaiStruct.ReadWrite {
                public static RedMatrixColumnTag fromFile(String fileName) throws IOException {
                    return new RedMatrixColumnTag(new ByteBufferKaitaiStream(fileName));
                }
                public RedMatrixColumnTag() {
                    this(null, null, null);
                }

                public RedMatrixColumnTag(KaitaiStream _io) {
                    this(_io, null, null);
                }

                public RedMatrixColumnTag(KaitaiStream _io, Icc4.TagTable.TagDefinition _parent) {
                    this(_io, _parent, null);
                }

                public RedMatrixColumnTag(KaitaiStream _io, Icc4.TagTable.TagDefinition _parent, Icc4 _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                }
                public void _read() {
                    this.tagType = Icc4.TagTable.TagDefinition.TagTypeSignatures.byId(this._io.readU4be());
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case XYZ_TYPE: {
                                this.tagData = new XyzType(this._io, this, _root);
                                this.tagData._read();
                                break;
                            }
                            }
                        }
                    }
                    _dirty = false;
                }

                public void _fetchInstances() {
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case XYZ_TYPE: {
                                this.tagData._fetchInstances();
                                break;
                            }
                            }
                        }
                    }
                }

                public void _write_Seq() {
                    _assertNotDirty();
                    this._io.writeU4be(((Number) (this.tagType.id())).longValue());
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case XYZ_TYPE: {
                                this.tagData._write_Seq(this._io);
                                break;
                            }
                            }
                        }
                    }
                }

                public void _check() {
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case XYZ_TYPE: {
                                if (!Objects.equals(this.tagData._root(), _root()))
                                    throw new ConsistencyError("tag_data", _root(), this.tagData._root());
                                if (!Objects.equals(this.tagData._parent(), this))
                                    throw new ConsistencyError("tag_data", this, this.tagData._parent());
                                break;
                            }
                            }
                        }
                    }
                    _dirty = false;
                }
                private TagTypeSignatures tagType;
                private XyzType tagData;
                private Icc4 _root;
                private Icc4.TagTable.TagDefinition _parent;
                public TagTypeSignatures tagType() { return tagType; }
                public void setTagType(TagTypeSignatures _v) { _dirty = true; tagType = _v; }
                public XyzType tagData() { return tagData; }
                public void setTagData(XyzType _v) { _dirty = true; tagData = _v; }
                public Icc4 _root() { return _root; }
                public void set_root(Icc4 _v) { _dirty = true; _root = _v; }
                public Icc4.TagTable.TagDefinition _parent() { return _parent; }
                public void set_parent(Icc4.TagTable.TagDefinition _v) { _dirty = true; _parent = _v; }
            }
            public static class RedTrcTag extends KaitaiStruct.ReadWrite {
                public static RedTrcTag fromFile(String fileName) throws IOException {
                    return new RedTrcTag(new ByteBufferKaitaiStream(fileName));
                }
                public RedTrcTag() {
                    this(null, null, null);
                }

                public RedTrcTag(KaitaiStream _io) {
                    this(_io, null, null);
                }

                public RedTrcTag(KaitaiStream _io, Icc4.TagTable.TagDefinition _parent) {
                    this(_io, _parent, null);
                }

                public RedTrcTag(KaitaiStream _io, Icc4.TagTable.TagDefinition _parent, Icc4 _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                }
                public void _read() {
                    this.tagType = Icc4.TagTable.TagDefinition.TagTypeSignatures.byId(this._io.readU4be());
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case CURVE_TYPE: {
                                this.tagData = new CurveType(this._io, this, _root);
                                ((CurveType) (this.tagData))._read();
                                break;
                            }
                            case PARAMETRIC_CURVE_TYPE: {
                                this.tagData = new ParametricCurveType(this._io, this, _root);
                                ((ParametricCurveType) (this.tagData))._read();
                                break;
                            }
                            }
                        }
                    }
                    _dirty = false;
                }

                public void _fetchInstances() {
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case CURVE_TYPE: {
                                ((CurveType) (this.tagData))._fetchInstances();
                                break;
                            }
                            case PARAMETRIC_CURVE_TYPE: {
                                ((ParametricCurveType) (this.tagData))._fetchInstances();
                                break;
                            }
                            }
                        }
                    }
                }

                public void _write_Seq() {
                    _assertNotDirty();
                    this._io.writeU4be(((Number) (this.tagType.id())).longValue());
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case CURVE_TYPE: {
                                ((CurveType) (this.tagData))._write_Seq(this._io);
                                break;
                            }
                            case PARAMETRIC_CURVE_TYPE: {
                                ((ParametricCurveType) (this.tagData))._write_Seq(this._io);
                                break;
                            }
                            }
                        }
                    }
                }

                public void _check() {
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case CURVE_TYPE: {
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.CurveType) (this.tagData))._root(), _root()))
                                    throw new ConsistencyError("tag_data", _root(), ((Icc4.TagTable.TagDefinition.CurveType) (this.tagData))._root());
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.CurveType) (this.tagData))._parent(), this))
                                    throw new ConsistencyError("tag_data", this, ((Icc4.TagTable.TagDefinition.CurveType) (this.tagData))._parent());
                                break;
                            }
                            case PARAMETRIC_CURVE_TYPE: {
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.ParametricCurveType) (this.tagData))._root(), _root()))
                                    throw new ConsistencyError("tag_data", _root(), ((Icc4.TagTable.TagDefinition.ParametricCurveType) (this.tagData))._root());
                                if (!Objects.equals(((Icc4.TagTable.TagDefinition.ParametricCurveType) (this.tagData))._parent(), this))
                                    throw new ConsistencyError("tag_data", this, ((Icc4.TagTable.TagDefinition.ParametricCurveType) (this.tagData))._parent());
                                break;
                            }
                            }
                        }
                    }
                    _dirty = false;
                }
                private TagTypeSignatures tagType;
                private KaitaiStruct.ReadWrite tagData;
                private Icc4 _root;
                private Icc4.TagTable.TagDefinition _parent;
                public TagTypeSignatures tagType() { return tagType; }
                public void setTagType(TagTypeSignatures _v) { _dirty = true; tagType = _v; }
                public KaitaiStruct.ReadWrite tagData() { return tagData; }
                public void setTagData(KaitaiStruct.ReadWrite _v) { _dirty = true; tagData = _v; }
                public Icc4 _root() { return _root; }
                public void set_root(Icc4 _v) { _dirty = true; _root = _v; }
                public Icc4.TagTable.TagDefinition _parent() { return _parent; }
                public void set_parent(Icc4.TagTable.TagDefinition _v) { _dirty = true; _parent = _v; }
            }
            public static class ResponseCurveSet16Type extends KaitaiStruct.ReadWrite {
                public static ResponseCurveSet16Type fromFile(String fileName) throws IOException {
                    return new ResponseCurveSet16Type(new ByteBufferKaitaiStream(fileName));
                }
                public ResponseCurveSet16Type() {
                    this(null, null, null);
                }

                public ResponseCurveSet16Type(KaitaiStream _io) {
                    this(_io, null, null);
                }

                public ResponseCurveSet16Type(KaitaiStream _io, Icc4.TagTable.TagDefinition.OutputResponseTag _parent) {
                    this(_io, _parent, null);
                }

                public ResponseCurveSet16Type(KaitaiStream _io, Icc4.TagTable.TagDefinition.OutputResponseTag _parent, Icc4 _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                }
                public void _read() {
                    this.reserved = this._io.readBytes(4);
                    if (!(Arrays.equals(this.reserved, new byte[] { 0, 0, 0, 0 }))) {
                        throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0, 0, 0, 0 }, this.reserved, this._io, "/types/tag_table/types/tag_definition/types/response_curve_set_16_type/seq/0");
                    }
                    this.numberOfChannels = this._io.readU2be();
                    this.countOfMeasurementTypes = this._io.readU2be();
                    this.responseCurveStructureOffsets = new ArrayList<Long>();
                    for (int i = 0; i < countOfMeasurementTypes(); i++) {
                        this.responseCurveStructureOffsets.add(this._io.readU4be());
                    }
                    this.responseCurveStructures = this._io.readBytesFull();
                    _dirty = false;
                }

                public void _fetchInstances() {
                    for (int i = 0; i < this.responseCurveStructureOffsets.size(); i++) {
                    }
                }

                public void _write_Seq() {
                    _assertNotDirty();
                    this._io.writeBytes(this.reserved);
                    this._io.writeU2be(this.numberOfChannels);
                    this._io.writeU2be(this.countOfMeasurementTypes);
                    for (int i = 0; i < this.responseCurveStructureOffsets.size(); i++) {
                        this._io.writeU4be(this.responseCurveStructureOffsets.get(((Number) (i)).intValue()));
                    }
                    this._io.writeBytes(this.responseCurveStructures);
                    if (!(this._io.isEof()))
                        throw new ConsistencyError("response_curve_structures", 0, this._io.size() - this._io.pos());
                }

                public void _check() {
                    if (this.reserved.length != 4)
                        throw new ConsistencyError("reserved", 4, this.reserved.length);
                    if (!(Arrays.equals(this.reserved, new byte[] { 0, 0, 0, 0 }))) {
                        throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0, 0, 0, 0 }, this.reserved, null, "/types/tag_table/types/tag_definition/types/response_curve_set_16_type/seq/0");
                    }
                    if (this.responseCurveStructureOffsets.size() != countOfMeasurementTypes())
                        throw new ConsistencyError("response_curve_structure_offsets", countOfMeasurementTypes(), this.responseCurveStructureOffsets.size());
                    for (int i = 0; i < this.responseCurveStructureOffsets.size(); i++) {
                    }
                    _dirty = false;
                }
                private byte[] reserved;
                private int numberOfChannels;
                private int countOfMeasurementTypes;
                private List<Long> responseCurveStructureOffsets;
                private byte[] responseCurveStructures;
                private Icc4 _root;
                private Icc4.TagTable.TagDefinition.OutputResponseTag _parent;
                public byte[] reserved() { return reserved; }
                public void setReserved(byte[] _v) { _dirty = true; reserved = _v; }
                public int numberOfChannels() { return numberOfChannels; }
                public void setNumberOfChannels(int _v) { _dirty = true; numberOfChannels = _v; }
                public int countOfMeasurementTypes() { return countOfMeasurementTypes; }
                public void setCountOfMeasurementTypes(int _v) { _dirty = true; countOfMeasurementTypes = _v; }
                public List<Long> responseCurveStructureOffsets() { return responseCurveStructureOffsets; }
                public void setResponseCurveStructureOffsets(List<Long> _v) { _dirty = true; responseCurveStructureOffsets = _v; }
                public byte[] responseCurveStructures() { return responseCurveStructures; }
                public void setResponseCurveStructures(byte[] _v) { _dirty = true; responseCurveStructures = _v; }
                public Icc4 _root() { return _root; }
                public void set_root(Icc4 _v) { _dirty = true; _root = _v; }
                public Icc4.TagTable.TagDefinition.OutputResponseTag _parent() { return _parent; }
                public void set_parent(Icc4.TagTable.TagDefinition.OutputResponseTag _v) { _dirty = true; _parent = _v; }
            }
            public static class S15Fixed16ArrayType extends KaitaiStruct.ReadWrite {
                public static S15Fixed16ArrayType fromFile(String fileName) throws IOException {
                    return new S15Fixed16ArrayType(new ByteBufferKaitaiStream(fileName));
                }
                public S15Fixed16ArrayType() {
                    this(null, null, null);
                }

                public S15Fixed16ArrayType(KaitaiStream _io) {
                    this(_io, null, null);
                }

                public S15Fixed16ArrayType(KaitaiStream _io, Icc4.TagTable.TagDefinition.ChromaticAdaptationTag _parent) {
                    this(_io, _parent, null);
                }

                public S15Fixed16ArrayType(KaitaiStream _io, Icc4.TagTable.TagDefinition.ChromaticAdaptationTag _parent, Icc4 _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                }
                public void _read() {
                    this.reserved = this._io.readBytes(4);
                    if (!(Arrays.equals(this.reserved, new byte[] { 0, 0, 0, 0 }))) {
                        throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0, 0, 0, 0 }, this.reserved, this._io, "/types/tag_table/types/tag_definition/types/s_15_fixed_16_array_type/seq/0");
                    }
                    this.values = new ArrayList<S15Fixed16Number>();
                    {
                        int i = 0;
                        while (!this._io.isEof()) {
                            S15Fixed16Number _t_values = new S15Fixed16Number(this._io, this, _root);
                            try {
                                _t_values._read();
                            } finally {
                                this.values.add(_t_values);
                            }
                            i++;
                        }
                    }
                    _dirty = false;
                }

                public void _fetchInstances() {
                    for (int i = 0; i < this.values.size(); i++) {
                        this.values.get(((Number) (i)).intValue())._fetchInstances();
                    }
                }

                public void _write_Seq() {
                    _assertNotDirty();
                    this._io.writeBytes(this.reserved);
                    for (int i = 0; i < this.values.size(); i++) {
                        if (this._io.isEof())
                            throw new ConsistencyError("values", 0, this._io.size() - this._io.pos());
                        this.values.get(((Number) (i)).intValue())._write_Seq(this._io);
                    }
                    if (!(this._io.isEof()))
                        throw new ConsistencyError("values", 0, this._io.size() - this._io.pos());
                }

                public void _check() {
                    if (this.reserved.length != 4)
                        throw new ConsistencyError("reserved", 4, this.reserved.length);
                    if (!(Arrays.equals(this.reserved, new byte[] { 0, 0, 0, 0 }))) {
                        throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0, 0, 0, 0 }, this.reserved, null, "/types/tag_table/types/tag_definition/types/s_15_fixed_16_array_type/seq/0");
                    }
                    for (int i = 0; i < this.values.size(); i++) {
                        if (!Objects.equals(this.values.get(((Number) (i)).intValue())._root(), _root()))
                            throw new ConsistencyError("values", _root(), this.values.get(((Number) (i)).intValue())._root());
                        if (!Objects.equals(this.values.get(((Number) (i)).intValue())._parent(), this))
                            throw new ConsistencyError("values", this, this.values.get(((Number) (i)).intValue())._parent());
                    }
                    _dirty = false;
                }
                private byte[] reserved;
                private List<S15Fixed16Number> values;
                private Icc4 _root;
                private Icc4.TagTable.TagDefinition.ChromaticAdaptationTag _parent;
                public byte[] reserved() { return reserved; }
                public void setReserved(byte[] _v) { _dirty = true; reserved = _v; }
                public List<S15Fixed16Number> values() { return values; }
                public void setValues(List<S15Fixed16Number> _v) { _dirty = true; values = _v; }
                public Icc4 _root() { return _root; }
                public void set_root(Icc4 _v) { _dirty = true; _root = _v; }
                public Icc4.TagTable.TagDefinition.ChromaticAdaptationTag _parent() { return _parent; }
                public void set_parent(Icc4.TagTable.TagDefinition.ChromaticAdaptationTag _v) { _dirty = true; _parent = _v; }
            }
            public static class SaturationRenderingIntentGamutTag extends KaitaiStruct.ReadWrite {
                public static SaturationRenderingIntentGamutTag fromFile(String fileName) throws IOException {
                    return new SaturationRenderingIntentGamutTag(new ByteBufferKaitaiStream(fileName));
                }
                public SaturationRenderingIntentGamutTag() {
                    this(null, null, null);
                }

                public SaturationRenderingIntentGamutTag(KaitaiStream _io) {
                    this(_io, null, null);
                }

                public SaturationRenderingIntentGamutTag(KaitaiStream _io, Icc4.TagTable.TagDefinition _parent) {
                    this(_io, _parent, null);
                }

                public SaturationRenderingIntentGamutTag(KaitaiStream _io, Icc4.TagTable.TagDefinition _parent, Icc4 _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                }
                public void _read() {
                    this.tagType = Icc4.TagTable.TagDefinition.TagTypeSignatures.byId(this._io.readU4be());
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case SIGNATURE_TYPE: {
                                this.tagData = new SignatureType(this._io, this, _root);
                                this.tagData._read();
                                break;
                            }
                            }
                        }
                    }
                    _dirty = false;
                }

                public void _fetchInstances() {
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case SIGNATURE_TYPE: {
                                this.tagData._fetchInstances();
                                break;
                            }
                            }
                        }
                    }
                }

                public void _write_Seq() {
                    _assertNotDirty();
                    this._io.writeU4be(((Number) (this.tagType.id())).longValue());
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case SIGNATURE_TYPE: {
                                this.tagData._write_Seq(this._io);
                                break;
                            }
                            }
                        }
                    }
                }

                public void _check() {
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case SIGNATURE_TYPE: {
                                if (!Objects.equals(this.tagData._root(), _root()))
                                    throw new ConsistencyError("tag_data", _root(), this.tagData._root());
                                if (!Objects.equals(this.tagData._parent(), this))
                                    throw new ConsistencyError("tag_data", this, this.tagData._parent());
                                break;
                            }
                            }
                        }
                    }
                    _dirty = false;
                }
                private TagTypeSignatures tagType;
                private SignatureType tagData;
                private Icc4 _root;
                private Icc4.TagTable.TagDefinition _parent;
                public TagTypeSignatures tagType() { return tagType; }
                public void setTagType(TagTypeSignatures _v) { _dirty = true; tagType = _v; }
                public SignatureType tagData() { return tagData; }
                public void setTagData(SignatureType _v) { _dirty = true; tagData = _v; }
                public Icc4 _root() { return _root; }
                public void set_root(Icc4 _v) { _dirty = true; _root = _v; }
                public Icc4.TagTable.TagDefinition _parent() { return _parent; }
                public void set_parent(Icc4.TagTable.TagDefinition _v) { _dirty = true; _parent = _v; }
            }
            public static class SignatureType extends KaitaiStruct.ReadWrite {
                public static SignatureType fromFile(String fileName) throws IOException {
                    return new SignatureType(new ByteBufferKaitaiStream(fileName));
                }
                public SignatureType() {
                    this(null, null, null);
                }

                public SignatureType(KaitaiStream _io) {
                    this(_io, null, null);
                }

                public SignatureType(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
                    this(_io, _parent, null);
                }

                public SignatureType(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, Icc4 _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                }
                public void _read() {
                    this.reserved = this._io.readBytes(4);
                    if (!(Arrays.equals(this.reserved, new byte[] { 0, 0, 0, 0 }))) {
                        throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0, 0, 0, 0 }, this.reserved, this._io, "/types/tag_table/types/tag_definition/types/signature_type/seq/0");
                    }
                    this.signature = new String(this._io.readBytes(4), StandardCharsets.US_ASCII);
                    _dirty = false;
                }

                public void _fetchInstances() {
                }

                public void _write_Seq() {
                    _assertNotDirty();
                    this._io.writeBytes(this.reserved);
                    this._io.writeBytes((this.signature).getBytes(Charset.forName("ASCII")));
                }

                public void _check() {
                    if (this.reserved.length != 4)
                        throw new ConsistencyError("reserved", 4, this.reserved.length);
                    if (!(Arrays.equals(this.reserved, new byte[] { 0, 0, 0, 0 }))) {
                        throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0, 0, 0, 0 }, this.reserved, null, "/types/tag_table/types/tag_definition/types/signature_type/seq/0");
                    }
                    if ((this.signature).getBytes(Charset.forName("ASCII")).length != 4)
                        throw new ConsistencyError("signature", 4, (this.signature).getBytes(Charset.forName("ASCII")).length);
                    _dirty = false;
                }
                private byte[] reserved;
                private String signature;
                private Icc4 _root;
                private KaitaiStruct.ReadWrite _parent;
                public byte[] reserved() { return reserved; }
                public void setReserved(byte[] _v) { _dirty = true; reserved = _v; }
                public String signature() { return signature; }
                public void setSignature(String _v) { _dirty = true; signature = _v; }
                public Icc4 _root() { return _root; }
                public void set_root(Icc4 _v) { _dirty = true; _root = _v; }
                public KaitaiStruct.ReadWrite _parent() { return _parent; }
                public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
            }
            public static class TechnologyTag extends KaitaiStruct.ReadWrite {
                public static TechnologyTag fromFile(String fileName) throws IOException {
                    return new TechnologyTag(new ByteBufferKaitaiStream(fileName));
                }
                public TechnologyTag() {
                    this(null, null, null);
                }

                public TechnologyTag(KaitaiStream _io) {
                    this(_io, null, null);
                }

                public TechnologyTag(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
                    this(_io, _parent, null);
                }

                public TechnologyTag(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, Icc4 _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                }
                public void _read() {
                    this.tagType = Icc4.TagTable.TagDefinition.TagTypeSignatures.byId(this._io.readU4be());
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case SIGNATURE_TYPE: {
                                this.tagData = new SignatureType(this._io, this, _root);
                                this.tagData._read();
                                break;
                            }
                            }
                        }
                    }
                    _dirty = false;
                }

                public void _fetchInstances() {
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case SIGNATURE_TYPE: {
                                this.tagData._fetchInstances();
                                break;
                            }
                            }
                        }
                    }
                }

                public void _write_Seq() {
                    _assertNotDirty();
                    this._io.writeU4be(((Number) (this.tagType.id())).longValue());
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case SIGNATURE_TYPE: {
                                this.tagData._write_Seq(this._io);
                                break;
                            }
                            }
                        }
                    }
                }

                public void _check() {
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case SIGNATURE_TYPE: {
                                if (!Objects.equals(this.tagData._root(), _root()))
                                    throw new ConsistencyError("tag_data", _root(), this.tagData._root());
                                if (!Objects.equals(this.tagData._parent(), this))
                                    throw new ConsistencyError("tag_data", this, this.tagData._parent());
                                break;
                            }
                            }
                        }
                    }
                    _dirty = false;
                }
                private TagTypeSignatures tagType;
                private SignatureType tagData;
                private Icc4 _root;
                private KaitaiStruct.ReadWrite _parent;
                public TagTypeSignatures tagType() { return tagType; }
                public void setTagType(TagTypeSignatures _v) { _dirty = true; tagType = _v; }
                public SignatureType tagData() { return tagData; }
                public void setTagData(SignatureType _v) { _dirty = true; tagData = _v; }
                public Icc4 _root() { return _root; }
                public void set_root(Icc4 _v) { _dirty = true; _root = _v; }
                public KaitaiStruct.ReadWrite _parent() { return _parent; }
                public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
            }
            public static class TextType extends KaitaiStruct.ReadWrite {
                public static TextType fromFile(String fileName) throws IOException {
                    return new TextType(new ByteBufferKaitaiStream(fileName));
                }
                public TextType() {
                    this(null, null, null);
                }

                public TextType(KaitaiStream _io) {
                    this(_io, null, null);
                }

                public TextType(KaitaiStream _io, Icc4.TagTable.TagDefinition.CharTargetTag _parent) {
                    this(_io, _parent, null);
                }

                public TextType(KaitaiStream _io, Icc4.TagTable.TagDefinition.CharTargetTag _parent, Icc4 _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                }
                public void _read() {
                    this.reserved = this._io.readBytes(4);
                    if (!(Arrays.equals(this.reserved, new byte[] { 0, 0, 0, 0 }))) {
                        throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0, 0, 0, 0 }, this.reserved, this._io, "/types/tag_table/types/tag_definition/types/text_type/seq/0");
                    }
                    this.value = new String(KaitaiStream.bytesTerminate(this._io.readBytesFull(), (byte) 0, false), StandardCharsets.US_ASCII);
                    _dirty = false;
                }

                public void _fetchInstances() {
                }

                public void _write_Seq() {
                    _assertNotDirty();
                    this._io.writeBytes(this.reserved);
                    this._io.writeBytesLimit((this.value).getBytes(Charset.forName("ASCII")), this._io.size() - this._io.pos(), (byte) 0, (byte) 0);
                    if (!(this._io.isEof()))
                        throw new ConsistencyError("value", 0, this._io.size() - this._io.pos());
                }

                public void _check() {
                    if (this.reserved.length != 4)
                        throw new ConsistencyError("reserved", 4, this.reserved.length);
                    if (!(Arrays.equals(this.reserved, new byte[] { 0, 0, 0, 0 }))) {
                        throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0, 0, 0, 0 }, this.reserved, null, "/types/tag_table/types/tag_definition/types/text_type/seq/0");
                    }
                    _dirty = false;
                }
                private byte[] reserved;
                private String value;
                private Icc4 _root;
                private Icc4.TagTable.TagDefinition.CharTargetTag _parent;
                public byte[] reserved() { return reserved; }
                public void setReserved(byte[] _v) { _dirty = true; reserved = _v; }
                public String value() { return value; }
                public void setValue(String _v) { _dirty = true; value = _v; }
                public Icc4 _root() { return _root; }
                public void set_root(Icc4 _v) { _dirty = true; _root = _v; }
                public Icc4.TagTable.TagDefinition.CharTargetTag _parent() { return _parent; }
                public void set_parent(Icc4.TagTable.TagDefinition.CharTargetTag _v) { _dirty = true; _parent = _v; }
            }
            public static class U16Fixed16ArrayType extends KaitaiStruct.ReadWrite {
                public static U16Fixed16ArrayType fromFile(String fileName) throws IOException {
                    return new U16Fixed16ArrayType(new ByteBufferKaitaiStream(fileName));
                }
                public U16Fixed16ArrayType() {
                    this(null, null, null);
                }

                public U16Fixed16ArrayType(KaitaiStream _io) {
                    this(_io, null, null);
                }

                public U16Fixed16ArrayType(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
                    this(_io, _parent, null);
                }

                public U16Fixed16ArrayType(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, Icc4 _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                }
                public void _read() {
                    this.reserved = this._io.readBytes(4);
                    if (!(Arrays.equals(this.reserved, new byte[] { 0, 0, 0, 0 }))) {
                        throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0, 0, 0, 0 }, this.reserved, this._io, "/types/tag_table/types/tag_definition/types/u_16_fixed_16_array_type/seq/0");
                    }
                    this.values = new ArrayList<U16Fixed16Number>();
                    {
                        int i = 0;
                        while (!this._io.isEof()) {
                            U16Fixed16Number _t_values = new U16Fixed16Number(this._io, this, _root);
                            try {
                                _t_values._read();
                            } finally {
                                this.values.add(_t_values);
                            }
                            i++;
                        }
                    }
                    _dirty = false;
                }

                public void _fetchInstances() {
                    for (int i = 0; i < this.values.size(); i++) {
                        this.values.get(((Number) (i)).intValue())._fetchInstances();
                    }
                }

                public void _write_Seq() {
                    _assertNotDirty();
                    this._io.writeBytes(this.reserved);
                    for (int i = 0; i < this.values.size(); i++) {
                        if (this._io.isEof())
                            throw new ConsistencyError("values", 0, this._io.size() - this._io.pos());
                        this.values.get(((Number) (i)).intValue())._write_Seq(this._io);
                    }
                    if (!(this._io.isEof()))
                        throw new ConsistencyError("values", 0, this._io.size() - this._io.pos());
                }

                public void _check() {
                    if (this.reserved.length != 4)
                        throw new ConsistencyError("reserved", 4, this.reserved.length);
                    if (!(Arrays.equals(this.reserved, new byte[] { 0, 0, 0, 0 }))) {
                        throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0, 0, 0, 0 }, this.reserved, null, "/types/tag_table/types/tag_definition/types/u_16_fixed_16_array_type/seq/0");
                    }
                    for (int i = 0; i < this.values.size(); i++) {
                        if (!Objects.equals(this.values.get(((Number) (i)).intValue())._root(), _root()))
                            throw new ConsistencyError("values", _root(), this.values.get(((Number) (i)).intValue())._root());
                        if (!Objects.equals(this.values.get(((Number) (i)).intValue())._parent(), this))
                            throw new ConsistencyError("values", this, this.values.get(((Number) (i)).intValue())._parent());
                    }
                    _dirty = false;
                }
                private byte[] reserved;
                private List<U16Fixed16Number> values;
                private Icc4 _root;
                private KaitaiStruct.ReadWrite _parent;
                public byte[] reserved() { return reserved; }
                public void setReserved(byte[] _v) { _dirty = true; reserved = _v; }
                public List<U16Fixed16Number> values() { return values; }
                public void setValues(List<U16Fixed16Number> _v) { _dirty = true; values = _v; }
                public Icc4 _root() { return _root; }
                public void set_root(Icc4 _v) { _dirty = true; _root = _v; }
                public KaitaiStruct.ReadWrite _parent() { return _parent; }
                public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
            }
            public static class UInt16ArrayType extends KaitaiStruct.ReadWrite {
                public static UInt16ArrayType fromFile(String fileName) throws IOException {
                    return new UInt16ArrayType(new ByteBufferKaitaiStream(fileName));
                }
                public UInt16ArrayType() {
                    this(null, null, null);
                }

                public UInt16ArrayType(KaitaiStream _io) {
                    this(_io, null, null);
                }

                public UInt16ArrayType(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
                    this(_io, _parent, null);
                }

                public UInt16ArrayType(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, Icc4 _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                }
                public void _read() {
                    this.reserved = this._io.readBytes(4);
                    if (!(Arrays.equals(this.reserved, new byte[] { 0, 0, 0, 0 }))) {
                        throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0, 0, 0, 0 }, this.reserved, this._io, "/types/tag_table/types/tag_definition/types/u_int_16_array_type/seq/0");
                    }
                    this.values = new ArrayList<Integer>();
                    {
                        int i = 0;
                        while (!this._io.isEof()) {
                            this.values.add(this._io.readU2be());
                            i++;
                        }
                    }
                    _dirty = false;
                }

                public void _fetchInstances() {
                    for (int i = 0; i < this.values.size(); i++) {
                    }
                }

                public void _write_Seq() {
                    _assertNotDirty();
                    this._io.writeBytes(this.reserved);
                    for (int i = 0; i < this.values.size(); i++) {
                        if (this._io.isEof())
                            throw new ConsistencyError("values", 0, this._io.size() - this._io.pos());
                        this._io.writeU2be(this.values.get(((Number) (i)).intValue()));
                    }
                    if (!(this._io.isEof()))
                        throw new ConsistencyError("values", 0, this._io.size() - this._io.pos());
                }

                public void _check() {
                    if (this.reserved.length != 4)
                        throw new ConsistencyError("reserved", 4, this.reserved.length);
                    if (!(Arrays.equals(this.reserved, new byte[] { 0, 0, 0, 0 }))) {
                        throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0, 0, 0, 0 }, this.reserved, null, "/types/tag_table/types/tag_definition/types/u_int_16_array_type/seq/0");
                    }
                    for (int i = 0; i < this.values.size(); i++) {
                    }
                    _dirty = false;
                }
                private byte[] reserved;
                private List<Integer> values;
                private Icc4 _root;
                private KaitaiStruct.ReadWrite _parent;
                public byte[] reserved() { return reserved; }
                public void setReserved(byte[] _v) { _dirty = true; reserved = _v; }
                public List<Integer> values() { return values; }
                public void setValues(List<Integer> _v) { _dirty = true; values = _v; }
                public Icc4 _root() { return _root; }
                public void set_root(Icc4 _v) { _dirty = true; _root = _v; }
                public KaitaiStruct.ReadWrite _parent() { return _parent; }
                public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
            }
            public static class UInt32ArrayType extends KaitaiStruct.ReadWrite {
                public static UInt32ArrayType fromFile(String fileName) throws IOException {
                    return new UInt32ArrayType(new ByteBufferKaitaiStream(fileName));
                }
                public UInt32ArrayType() {
                    this(null, null, null);
                }

                public UInt32ArrayType(KaitaiStream _io) {
                    this(_io, null, null);
                }

                public UInt32ArrayType(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
                    this(_io, _parent, null);
                }

                public UInt32ArrayType(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, Icc4 _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                }
                public void _read() {
                    this.reserved = this._io.readBytes(4);
                    if (!(Arrays.equals(this.reserved, new byte[] { 0, 0, 0, 0 }))) {
                        throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0, 0, 0, 0 }, this.reserved, this._io, "/types/tag_table/types/tag_definition/types/u_int_32_array_type/seq/0");
                    }
                    this.values = new ArrayList<Long>();
                    {
                        int i = 0;
                        while (!this._io.isEof()) {
                            this.values.add(this._io.readU4be());
                            i++;
                        }
                    }
                    _dirty = false;
                }

                public void _fetchInstances() {
                    for (int i = 0; i < this.values.size(); i++) {
                    }
                }

                public void _write_Seq() {
                    _assertNotDirty();
                    this._io.writeBytes(this.reserved);
                    for (int i = 0; i < this.values.size(); i++) {
                        if (this._io.isEof())
                            throw new ConsistencyError("values", 0, this._io.size() - this._io.pos());
                        this._io.writeU4be(this.values.get(((Number) (i)).intValue()));
                    }
                    if (!(this._io.isEof()))
                        throw new ConsistencyError("values", 0, this._io.size() - this._io.pos());
                }

                public void _check() {
                    if (this.reserved.length != 4)
                        throw new ConsistencyError("reserved", 4, this.reserved.length);
                    if (!(Arrays.equals(this.reserved, new byte[] { 0, 0, 0, 0 }))) {
                        throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0, 0, 0, 0 }, this.reserved, null, "/types/tag_table/types/tag_definition/types/u_int_32_array_type/seq/0");
                    }
                    for (int i = 0; i < this.values.size(); i++) {
                    }
                    _dirty = false;
                }
                private byte[] reserved;
                private List<Long> values;
                private Icc4 _root;
                private KaitaiStruct.ReadWrite _parent;
                public byte[] reserved() { return reserved; }
                public void setReserved(byte[] _v) { _dirty = true; reserved = _v; }
                public List<Long> values() { return values; }
                public void setValues(List<Long> _v) { _dirty = true; values = _v; }
                public Icc4 _root() { return _root; }
                public void set_root(Icc4 _v) { _dirty = true; _root = _v; }
                public KaitaiStruct.ReadWrite _parent() { return _parent; }
                public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
            }
            public static class UInt64ArrayType extends KaitaiStruct.ReadWrite {
                public static UInt64ArrayType fromFile(String fileName) throws IOException {
                    return new UInt64ArrayType(new ByteBufferKaitaiStream(fileName));
                }
                public UInt64ArrayType() {
                    this(null, null, null);
                }

                public UInt64ArrayType(KaitaiStream _io) {
                    this(_io, null, null);
                }

                public UInt64ArrayType(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
                    this(_io, _parent, null);
                }

                public UInt64ArrayType(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, Icc4 _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                }
                public void _read() {
                    this.reserved = this._io.readBytes(4);
                    if (!(Arrays.equals(this.reserved, new byte[] { 0, 0, 0, 0 }))) {
                        throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0, 0, 0, 0 }, this.reserved, this._io, "/types/tag_table/types/tag_definition/types/u_int_64_array_type/seq/0");
                    }
                    this.values = new ArrayList<Long>();
                    {
                        int i = 0;
                        while (!this._io.isEof()) {
                            this.values.add(this._io.readU8be());
                            i++;
                        }
                    }
                    _dirty = false;
                }

                public void _fetchInstances() {
                    for (int i = 0; i < this.values.size(); i++) {
                    }
                }

                public void _write_Seq() {
                    _assertNotDirty();
                    this._io.writeBytes(this.reserved);
                    for (int i = 0; i < this.values.size(); i++) {
                        if (this._io.isEof())
                            throw new ConsistencyError("values", 0, this._io.size() - this._io.pos());
                        this._io.writeU8be(this.values.get(((Number) (i)).intValue()));
                    }
                    if (!(this._io.isEof()))
                        throw new ConsistencyError("values", 0, this._io.size() - this._io.pos());
                }

                public void _check() {
                    if (this.reserved.length != 4)
                        throw new ConsistencyError("reserved", 4, this.reserved.length);
                    if (!(Arrays.equals(this.reserved, new byte[] { 0, 0, 0, 0 }))) {
                        throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0, 0, 0, 0 }, this.reserved, null, "/types/tag_table/types/tag_definition/types/u_int_64_array_type/seq/0");
                    }
                    for (int i = 0; i < this.values.size(); i++) {
                    }
                    _dirty = false;
                }
                private byte[] reserved;
                private List<Long> values;
                private Icc4 _root;
                private KaitaiStruct.ReadWrite _parent;
                public byte[] reserved() { return reserved; }
                public void setReserved(byte[] _v) { _dirty = true; reserved = _v; }
                public List<Long> values() { return values; }
                public void setValues(List<Long> _v) { _dirty = true; values = _v; }
                public Icc4 _root() { return _root; }
                public void set_root(Icc4 _v) { _dirty = true; _root = _v; }
                public KaitaiStruct.ReadWrite _parent() { return _parent; }
                public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
            }
            public static class UInt8ArrayType extends KaitaiStruct.ReadWrite {
                public static UInt8ArrayType fromFile(String fileName) throws IOException {
                    return new UInt8ArrayType(new ByteBufferKaitaiStream(fileName));
                }
                public UInt8ArrayType() {
                    this(null, null, null);
                }

                public UInt8ArrayType(KaitaiStream _io) {
                    this(_io, null, null);
                }

                public UInt8ArrayType(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
                    this(_io, _parent, null);
                }

                public UInt8ArrayType(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, Icc4 _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                }
                public void _read() {
                    this.reserved = this._io.readBytes(4);
                    if (!(Arrays.equals(this.reserved, new byte[] { 0, 0, 0, 0 }))) {
                        throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0, 0, 0, 0 }, this.reserved, this._io, "/types/tag_table/types/tag_definition/types/u_int_8_array_type/seq/0");
                    }
                    this.values = new ArrayList<Integer>();
                    {
                        int i = 0;
                        while (!this._io.isEof()) {
                            this.values.add(this._io.readU1());
                            i++;
                        }
                    }
                    _dirty = false;
                }

                public void _fetchInstances() {
                    for (int i = 0; i < this.values.size(); i++) {
                    }
                }

                public void _write_Seq() {
                    _assertNotDirty();
                    this._io.writeBytes(this.reserved);
                    for (int i = 0; i < this.values.size(); i++) {
                        if (this._io.isEof())
                            throw new ConsistencyError("values", 0, this._io.size() - this._io.pos());
                        this._io.writeU1(this.values.get(((Number) (i)).intValue()));
                    }
                    if (!(this._io.isEof()))
                        throw new ConsistencyError("values", 0, this._io.size() - this._io.pos());
                }

                public void _check() {
                    if (this.reserved.length != 4)
                        throw new ConsistencyError("reserved", 4, this.reserved.length);
                    if (!(Arrays.equals(this.reserved, new byte[] { 0, 0, 0, 0 }))) {
                        throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0, 0, 0, 0 }, this.reserved, null, "/types/tag_table/types/tag_definition/types/u_int_8_array_type/seq/0");
                    }
                    for (int i = 0; i < this.values.size(); i++) {
                    }
                    _dirty = false;
                }
                private byte[] reserved;
                private List<Integer> values;
                private Icc4 _root;
                private KaitaiStruct.ReadWrite _parent;
                public byte[] reserved() { return reserved; }
                public void setReserved(byte[] _v) { _dirty = true; reserved = _v; }
                public List<Integer> values() { return values; }
                public void setValues(List<Integer> _v) { _dirty = true; values = _v; }
                public Icc4 _root() { return _root; }
                public void set_root(Icc4 _v) { _dirty = true; _root = _v; }
                public KaitaiStruct.ReadWrite _parent() { return _parent; }
                public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
            }
            public static class ViewingCondDescTag extends KaitaiStruct.ReadWrite {
                public static ViewingCondDescTag fromFile(String fileName) throws IOException {
                    return new ViewingCondDescTag(new ByteBufferKaitaiStream(fileName));
                }
                public ViewingCondDescTag() {
                    this(null, null, null);
                }

                public ViewingCondDescTag(KaitaiStream _io) {
                    this(_io, null, null);
                }

                public ViewingCondDescTag(KaitaiStream _io, Icc4.TagTable.TagDefinition _parent) {
                    this(_io, _parent, null);
                }

                public ViewingCondDescTag(KaitaiStream _io, Icc4.TagTable.TagDefinition _parent, Icc4 _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                }
                public void _read() {
                    this.tagType = Icc4.TagTable.TagDefinition.TagTypeSignatures.byId(this._io.readU4be());
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case MULTI_LOCALIZED_UNICODE_TYPE: {
                                this.tagData = new MultiLocalizedUnicodeType(this._io, this, _root);
                                this.tagData._read();
                                break;
                            }
                            }
                        }
                    }
                    _dirty = false;
                }

                public void _fetchInstances() {
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case MULTI_LOCALIZED_UNICODE_TYPE: {
                                this.tagData._fetchInstances();
                                break;
                            }
                            }
                        }
                    }
                }

                public void _write_Seq() {
                    _assertNotDirty();
                    this._io.writeU4be(((Number) (this.tagType.id())).longValue());
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case MULTI_LOCALIZED_UNICODE_TYPE: {
                                this.tagData._write_Seq(this._io);
                                break;
                            }
                            }
                        }
                    }
                }

                public void _check() {
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case MULTI_LOCALIZED_UNICODE_TYPE: {
                                if (!Objects.equals(this.tagData._root(), _root()))
                                    throw new ConsistencyError("tag_data", _root(), this.tagData._root());
                                if (!Objects.equals(this.tagData._parent(), this))
                                    throw new ConsistencyError("tag_data", this, this.tagData._parent());
                                break;
                            }
                            }
                        }
                    }
                    _dirty = false;
                }
                private TagTypeSignatures tagType;
                private MultiLocalizedUnicodeType tagData;
                private Icc4 _root;
                private Icc4.TagTable.TagDefinition _parent;
                public TagTypeSignatures tagType() { return tagType; }
                public void setTagType(TagTypeSignatures _v) { _dirty = true; tagType = _v; }
                public MultiLocalizedUnicodeType tagData() { return tagData; }
                public void setTagData(MultiLocalizedUnicodeType _v) { _dirty = true; tagData = _v; }
                public Icc4 _root() { return _root; }
                public void set_root(Icc4 _v) { _dirty = true; _root = _v; }
                public Icc4.TagTable.TagDefinition _parent() { return _parent; }
                public void set_parent(Icc4.TagTable.TagDefinition _v) { _dirty = true; _parent = _v; }
            }
            public static class ViewingConditionsTag extends KaitaiStruct.ReadWrite {
                public static ViewingConditionsTag fromFile(String fileName) throws IOException {
                    return new ViewingConditionsTag(new ByteBufferKaitaiStream(fileName));
                }
                public ViewingConditionsTag() {
                    this(null, null, null);
                }

                public ViewingConditionsTag(KaitaiStream _io) {
                    this(_io, null, null);
                }

                public ViewingConditionsTag(KaitaiStream _io, Icc4.TagTable.TagDefinition _parent) {
                    this(_io, _parent, null);
                }

                public ViewingConditionsTag(KaitaiStream _io, Icc4.TagTable.TagDefinition _parent, Icc4 _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                }
                public void _read() {
                    this.tagType = Icc4.TagTable.TagDefinition.TagTypeSignatures.byId(this._io.readU4be());
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case VIEWING_CONDITIONS_TYPE: {
                                this.tagData = new ViewingConditionsType(this._io, this, _root);
                                this.tagData._read();
                                break;
                            }
                            }
                        }
                    }
                    _dirty = false;
                }

                public void _fetchInstances() {
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case VIEWING_CONDITIONS_TYPE: {
                                this.tagData._fetchInstances();
                                break;
                            }
                            }
                        }
                    }
                }

                public void _write_Seq() {
                    _assertNotDirty();
                    this._io.writeU4be(((Number) (this.tagType.id())).longValue());
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case VIEWING_CONDITIONS_TYPE: {
                                this.tagData._write_Seq(this._io);
                                break;
                            }
                            }
                        }
                    }
                }

                public void _check() {
                    {
                        TagTypeSignatures on = tagType();
                        if (on != null) {
                            switch (tagType()) {
                            case VIEWING_CONDITIONS_TYPE: {
                                if (!Objects.equals(this.tagData._root(), _root()))
                                    throw new ConsistencyError("tag_data", _root(), this.tagData._root());
                                if (!Objects.equals(this.tagData._parent(), this))
                                    throw new ConsistencyError("tag_data", this, this.tagData._parent());
                                break;
                            }
                            }
                        }
                    }
                    _dirty = false;
                }
                private TagTypeSignatures tagType;
                private ViewingConditionsType tagData;
                private Icc4 _root;
                private Icc4.TagTable.TagDefinition _parent;
                public TagTypeSignatures tagType() { return tagType; }
                public void setTagType(TagTypeSignatures _v) { _dirty = true; tagType = _v; }
                public ViewingConditionsType tagData() { return tagData; }
                public void setTagData(ViewingConditionsType _v) { _dirty = true; tagData = _v; }
                public Icc4 _root() { return _root; }
                public void set_root(Icc4 _v) { _dirty = true; _root = _v; }
                public Icc4.TagTable.TagDefinition _parent() { return _parent; }
                public void set_parent(Icc4.TagTable.TagDefinition _v) { _dirty = true; _parent = _v; }
            }
            public static class ViewingConditionsType extends KaitaiStruct.ReadWrite {
                public static ViewingConditionsType fromFile(String fileName) throws IOException {
                    return new ViewingConditionsType(new ByteBufferKaitaiStream(fileName));
                }
                public ViewingConditionsType() {
                    this(null, null, null);
                }

                public ViewingConditionsType(KaitaiStream _io) {
                    this(_io, null, null);
                }

                public ViewingConditionsType(KaitaiStream _io, Icc4.TagTable.TagDefinition.ViewingConditionsTag _parent) {
                    this(_io, _parent, null);
                }

                public ViewingConditionsType(KaitaiStream _io, Icc4.TagTable.TagDefinition.ViewingConditionsTag _parent, Icc4 _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                }
                public void _read() {
                    this.reserved = this._io.readBytes(4);
                    if (!(Arrays.equals(this.reserved, new byte[] { 0, 0, 0, 0 }))) {
                        throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0, 0, 0, 0 }, this.reserved, this._io, "/types/tag_table/types/tag_definition/types/viewing_conditions_type/seq/0");
                    }
                    this.unNormalizedCiexyzValuesForIlluminant = new XyzNumber(this._io, this, _root);
                    this.unNormalizedCiexyzValuesForIlluminant._read();
                    this.unNormalizedCiexyzValuesForSurround = new XyzNumber(this._io, this, _root);
                    this.unNormalizedCiexyzValuesForSurround._read();
                    this.illuminantType = new StandardIlluminantEncoding(this._io, this, _root);
                    this.illuminantType._read();
                    _dirty = false;
                }

                public void _fetchInstances() {
                    this.unNormalizedCiexyzValuesForIlluminant._fetchInstances();
                    this.unNormalizedCiexyzValuesForSurround._fetchInstances();
                    this.illuminantType._fetchInstances();
                }

                public void _write_Seq() {
                    _assertNotDirty();
                    this._io.writeBytes(this.reserved);
                    this.unNormalizedCiexyzValuesForIlluminant._write_Seq(this._io);
                    this.unNormalizedCiexyzValuesForSurround._write_Seq(this._io);
                    this.illuminantType._write_Seq(this._io);
                }

                public void _check() {
                    if (this.reserved.length != 4)
                        throw new ConsistencyError("reserved", 4, this.reserved.length);
                    if (!(Arrays.equals(this.reserved, new byte[] { 0, 0, 0, 0 }))) {
                        throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0, 0, 0, 0 }, this.reserved, null, "/types/tag_table/types/tag_definition/types/viewing_conditions_type/seq/0");
                    }
                    if (!Objects.equals(this.unNormalizedCiexyzValuesForIlluminant._root(), _root()))
                        throw new ConsistencyError("un_normalized_ciexyz_values_for_illuminant", _root(), this.unNormalizedCiexyzValuesForIlluminant._root());
                    if (!Objects.equals(this.unNormalizedCiexyzValuesForIlluminant._parent(), this))
                        throw new ConsistencyError("un_normalized_ciexyz_values_for_illuminant", this, this.unNormalizedCiexyzValuesForIlluminant._parent());
                    if (!Objects.equals(this.unNormalizedCiexyzValuesForSurround._root(), _root()))
                        throw new ConsistencyError("un_normalized_ciexyz_values_for_surround", _root(), this.unNormalizedCiexyzValuesForSurround._root());
                    if (!Objects.equals(this.unNormalizedCiexyzValuesForSurround._parent(), this))
                        throw new ConsistencyError("un_normalized_ciexyz_values_for_surround", this, this.unNormalizedCiexyzValuesForSurround._parent());
                    if (!Objects.equals(this.illuminantType._root(), _root()))
                        throw new ConsistencyError("illuminant_type", _root(), this.illuminantType._root());
                    if (!Objects.equals(this.illuminantType._parent(), this))
                        throw new ConsistencyError("illuminant_type", this, this.illuminantType._parent());
                    _dirty = false;
                }
                private byte[] reserved;
                private XyzNumber unNormalizedCiexyzValuesForIlluminant;
                private XyzNumber unNormalizedCiexyzValuesForSurround;
                private StandardIlluminantEncoding illuminantType;
                private Icc4 _root;
                private Icc4.TagTable.TagDefinition.ViewingConditionsTag _parent;
                public byte[] reserved() { return reserved; }
                public void setReserved(byte[] _v) { _dirty = true; reserved = _v; }
                public XyzNumber unNormalizedCiexyzValuesForIlluminant() { return unNormalizedCiexyzValuesForIlluminant; }
                public void setUnNormalizedCiexyzValuesForIlluminant(XyzNumber _v) { _dirty = true; unNormalizedCiexyzValuesForIlluminant = _v; }
                public XyzNumber unNormalizedCiexyzValuesForSurround() { return unNormalizedCiexyzValuesForSurround; }
                public void setUnNormalizedCiexyzValuesForSurround(XyzNumber _v) { _dirty = true; unNormalizedCiexyzValuesForSurround = _v; }
                public StandardIlluminantEncoding illuminantType() { return illuminantType; }
                public void setIlluminantType(StandardIlluminantEncoding _v) { _dirty = true; illuminantType = _v; }
                public Icc4 _root() { return _root; }
                public void set_root(Icc4 _v) { _dirty = true; _root = _v; }
                public Icc4.TagTable.TagDefinition.ViewingConditionsTag _parent() { return _parent; }
                public void set_parent(Icc4.TagTable.TagDefinition.ViewingConditionsTag _v) { _dirty = true; _parent = _v; }
            }
            public static class XyzType extends KaitaiStruct.ReadWrite {
                public static XyzType fromFile(String fileName) throws IOException {
                    return new XyzType(new ByteBufferKaitaiStream(fileName));
                }
                public XyzType() {
                    this(null, null, null);
                }

                public XyzType(KaitaiStream _io) {
                    this(_io, null, null);
                }

                public XyzType(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
                    this(_io, _parent, null);
                }

                public XyzType(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, Icc4 _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                }
                public void _read() {
                    this.reserved = this._io.readBytes(4);
                    if (!(Arrays.equals(this.reserved, new byte[] { 0, 0, 0, 0 }))) {
                        throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0, 0, 0, 0 }, this.reserved, this._io, "/types/tag_table/types/tag_definition/types/xyz_type/seq/0");
                    }
                    this.values = new ArrayList<XyzNumber>();
                    {
                        int i = 0;
                        while (!this._io.isEof()) {
                            XyzNumber _t_values = new XyzNumber(this._io, this, _root);
                            try {
                                _t_values._read();
                            } finally {
                                this.values.add(_t_values);
                            }
                            i++;
                        }
                    }
                    _dirty = false;
                }

                public void _fetchInstances() {
                    for (int i = 0; i < this.values.size(); i++) {
                        this.values.get(((Number) (i)).intValue())._fetchInstances();
                    }
                }

                public void _write_Seq() {
                    _assertNotDirty();
                    this._io.writeBytes(this.reserved);
                    for (int i = 0; i < this.values.size(); i++) {
                        if (this._io.isEof())
                            throw new ConsistencyError("values", 0, this._io.size() - this._io.pos());
                        this.values.get(((Number) (i)).intValue())._write_Seq(this._io);
                    }
                    if (!(this._io.isEof()))
                        throw new ConsistencyError("values", 0, this._io.size() - this._io.pos());
                }

                public void _check() {
                    if (this.reserved.length != 4)
                        throw new ConsistencyError("reserved", 4, this.reserved.length);
                    if (!(Arrays.equals(this.reserved, new byte[] { 0, 0, 0, 0 }))) {
                        throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0, 0, 0, 0 }, this.reserved, null, "/types/tag_table/types/tag_definition/types/xyz_type/seq/0");
                    }
                    for (int i = 0; i < this.values.size(); i++) {
                        if (!Objects.equals(this.values.get(((Number) (i)).intValue())._root(), _root()))
                            throw new ConsistencyError("values", _root(), this.values.get(((Number) (i)).intValue())._root());
                        if (!Objects.equals(this.values.get(((Number) (i)).intValue())._parent(), this))
                            throw new ConsistencyError("values", this, this.values.get(((Number) (i)).intValue())._parent());
                    }
                    _dirty = false;
                }
                private byte[] reserved;
                private List<XyzNumber> values;
                private Icc4 _root;
                private KaitaiStruct.ReadWrite _parent;
                public byte[] reserved() { return reserved; }
                public void setReserved(byte[] _v) { _dirty = true; reserved = _v; }
                public List<XyzNumber> values() { return values; }
                public void setValues(List<XyzNumber> _v) { _dirty = true; values = _v; }
                public Icc4 _root() { return _root; }
                public void set_root(Icc4 _v) { _dirty = true; _root = _v; }
                public KaitaiStruct.ReadWrite _parent() { return _parent; }
                public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
            }
            private Object tagDataElement;
            private boolean _shouldWriteTagDataElement = false;
            private boolean _enabledTagDataElement = true;
            public Object tagDataElement() {
                if (_shouldWriteTagDataElement)
                    _writeTagDataElement();
                if (this.tagDataElement != null)
                    return this.tagDataElement;
                if (!_enabledTagDataElement)
                    return null;
                long _pos = this._io.pos();
                this._io.seek(offsetToDataElement());
                {
                    TagSignatures on = tagSignature();
                    if (on != null) {
                        switch (tagSignature()) {
                        case A_TO_B_0: {
                            this._raw_tagDataElement = this._io.readBytes(sizeOfDataElement());
                            KaitaiStream _io__raw_tagDataElement = new ByteBufferKaitaiStream(this._raw_tagDataElement);
                            this.tagDataElement = new AToB0Tag(_io__raw_tagDataElement, this, _root);
                            ((AToB0Tag) (this.tagDataElement))._read();
                            break;
                        }
                        case A_TO_B_1: {
                            this._raw_tagDataElement = this._io.readBytes(sizeOfDataElement());
                            KaitaiStream _io__raw_tagDataElement = new ByteBufferKaitaiStream(this._raw_tagDataElement);
                            this.tagDataElement = new AToB1Tag(_io__raw_tagDataElement, this, _root);
                            ((AToB1Tag) (this.tagDataElement))._read();
                            break;
                        }
                        case A_TO_B_2: {
                            this._raw_tagDataElement = this._io.readBytes(sizeOfDataElement());
                            KaitaiStream _io__raw_tagDataElement = new ByteBufferKaitaiStream(this._raw_tagDataElement);
                            this.tagDataElement = new AToB2Tag(_io__raw_tagDataElement, this, _root);
                            ((AToB2Tag) (this.tagDataElement))._read();
                            break;
                        }
                        case B_TO_A_0: {
                            this._raw_tagDataElement = this._io.readBytes(sizeOfDataElement());
                            KaitaiStream _io__raw_tagDataElement = new ByteBufferKaitaiStream(this._raw_tagDataElement);
                            this.tagDataElement = new BToA0Tag(_io__raw_tagDataElement, this, _root);
                            ((BToA0Tag) (this.tagDataElement))._read();
                            break;
                        }
                        case B_TO_A_1: {
                            this._raw_tagDataElement = this._io.readBytes(sizeOfDataElement());
                            KaitaiStream _io__raw_tagDataElement = new ByteBufferKaitaiStream(this._raw_tagDataElement);
                            this.tagDataElement = new BToA1Tag(_io__raw_tagDataElement, this, _root);
                            ((BToA1Tag) (this.tagDataElement))._read();
                            break;
                        }
                        case B_TO_A_2: {
                            this._raw_tagDataElement = this._io.readBytes(sizeOfDataElement());
                            KaitaiStream _io__raw_tagDataElement = new ByteBufferKaitaiStream(this._raw_tagDataElement);
                            this.tagDataElement = new BToA2Tag(_io__raw_tagDataElement, this, _root);
                            ((BToA2Tag) (this.tagDataElement))._read();
                            break;
                        }
                        case B_TO_D_0: {
                            this._raw_tagDataElement = this._io.readBytes(sizeOfDataElement());
                            KaitaiStream _io__raw_tagDataElement = new ByteBufferKaitaiStream(this._raw_tagDataElement);
                            this.tagDataElement = new BToD0Tag(_io__raw_tagDataElement, this, _root);
                            ((BToD0Tag) (this.tagDataElement))._read();
                            break;
                        }
                        case B_TO_D_1: {
                            this._raw_tagDataElement = this._io.readBytes(sizeOfDataElement());
                            KaitaiStream _io__raw_tagDataElement = new ByteBufferKaitaiStream(this._raw_tagDataElement);
                            this.tagDataElement = new BToD1Tag(_io__raw_tagDataElement, this, _root);
                            ((BToD1Tag) (this.tagDataElement))._read();
                            break;
                        }
                        case B_TO_D_2: {
                            this._raw_tagDataElement = this._io.readBytes(sizeOfDataElement());
                            KaitaiStream _io__raw_tagDataElement = new ByteBufferKaitaiStream(this._raw_tagDataElement);
                            this.tagDataElement = new BToD2Tag(_io__raw_tagDataElement, this, _root);
                            ((BToD2Tag) (this.tagDataElement))._read();
                            break;
                        }
                        case B_TO_D_3: {
                            this._raw_tagDataElement = this._io.readBytes(sizeOfDataElement());
                            KaitaiStream _io__raw_tagDataElement = new ByteBufferKaitaiStream(this._raw_tagDataElement);
                            this.tagDataElement = new BToD3Tag(_io__raw_tagDataElement, this, _root);
                            ((BToD3Tag) (this.tagDataElement))._read();
                            break;
                        }
                        case BLUE_MATRIX_COLUMN: {
                            this._raw_tagDataElement = this._io.readBytes(sizeOfDataElement());
                            KaitaiStream _io__raw_tagDataElement = new ByteBufferKaitaiStream(this._raw_tagDataElement);
                            this.tagDataElement = new BlueMatrixColumnTag(_io__raw_tagDataElement, this, _root);
                            ((BlueMatrixColumnTag) (this.tagDataElement))._read();
                            break;
                        }
                        case BLUE_TRC: {
                            this._raw_tagDataElement = this._io.readBytes(sizeOfDataElement());
                            KaitaiStream _io__raw_tagDataElement = new ByteBufferKaitaiStream(this._raw_tagDataElement);
                            this.tagDataElement = new BlueTrcTag(_io__raw_tagDataElement, this, _root);
                            ((BlueTrcTag) (this.tagDataElement))._read();
                            break;
                        }
                        case CALIBRATION_DATE_TIME: {
                            this._raw_tagDataElement = this._io.readBytes(sizeOfDataElement());
                            KaitaiStream _io__raw_tagDataElement = new ByteBufferKaitaiStream(this._raw_tagDataElement);
                            this.tagDataElement = new CalibrationDateTimeTag(_io__raw_tagDataElement, this, _root);
                            ((CalibrationDateTimeTag) (this.tagDataElement))._read();
                            break;
                        }
                        case CHAR_TARGET: {
                            this._raw_tagDataElement = this._io.readBytes(sizeOfDataElement());
                            KaitaiStream _io__raw_tagDataElement = new ByteBufferKaitaiStream(this._raw_tagDataElement);
                            this.tagDataElement = new CharTargetTag(_io__raw_tagDataElement, this, _root);
                            ((CharTargetTag) (this.tagDataElement))._read();
                            break;
                        }
                        case CHROMATIC_ADAPTATION: {
                            this._raw_tagDataElement = this._io.readBytes(sizeOfDataElement());
                            KaitaiStream _io__raw_tagDataElement = new ByteBufferKaitaiStream(this._raw_tagDataElement);
                            this.tagDataElement = new ChromaticAdaptationTag(_io__raw_tagDataElement, this, _root);
                            ((ChromaticAdaptationTag) (this.tagDataElement))._read();
                            break;
                        }
                        case CHROMATICITY: {
                            this._raw_tagDataElement = this._io.readBytes(sizeOfDataElement());
                            KaitaiStream _io__raw_tagDataElement = new ByteBufferKaitaiStream(this._raw_tagDataElement);
                            this.tagDataElement = new ChromaticityTag(_io__raw_tagDataElement, this, _root);
                            ((ChromaticityTag) (this.tagDataElement))._read();
                            break;
                        }
                        case COLORANT_ORDER: {
                            this._raw_tagDataElement = this._io.readBytes(sizeOfDataElement());
                            KaitaiStream _io__raw_tagDataElement = new ByteBufferKaitaiStream(this._raw_tagDataElement);
                            this.tagDataElement = new ColorantOrderTag(_io__raw_tagDataElement, this, _root);
                            ((ColorantOrderTag) (this.tagDataElement))._read();
                            break;
                        }
                        case COLORANT_TABLE: {
                            this._raw_tagDataElement = this._io.readBytes(sizeOfDataElement());
                            KaitaiStream _io__raw_tagDataElement = new ByteBufferKaitaiStream(this._raw_tagDataElement);
                            this.tagDataElement = new ColorantTableTag(_io__raw_tagDataElement, this, _root);
                            ((ColorantTableTag) (this.tagDataElement))._read();
                            break;
                        }
                        case COLORANT_TABLE_OUT: {
                            this._raw_tagDataElement = this._io.readBytes(sizeOfDataElement());
                            KaitaiStream _io__raw_tagDataElement = new ByteBufferKaitaiStream(this._raw_tagDataElement);
                            this.tagDataElement = new ColorantTableOutTag(_io__raw_tagDataElement, this, _root);
                            ((ColorantTableOutTag) (this.tagDataElement))._read();
                            break;
                        }
                        case COLORIMETRIC_INTENT_IMAGE_STATE: {
                            this._raw_tagDataElement = this._io.readBytes(sizeOfDataElement());
                            KaitaiStream _io__raw_tagDataElement = new ByteBufferKaitaiStream(this._raw_tagDataElement);
                            this.tagDataElement = new ColorimetricIntentImageStateTag(_io__raw_tagDataElement, this, _root);
                            ((ColorimetricIntentImageStateTag) (this.tagDataElement))._read();
                            break;
                        }
                        case COPYRIGHT: {
                            this._raw_tagDataElement = this._io.readBytes(sizeOfDataElement());
                            KaitaiStream _io__raw_tagDataElement = new ByteBufferKaitaiStream(this._raw_tagDataElement);
                            this.tagDataElement = new CopyrightTag(_io__raw_tagDataElement, this, _root);
                            ((CopyrightTag) (this.tagDataElement))._read();
                            break;
                        }
                        case D_TO_B_0: {
                            this._raw_tagDataElement = this._io.readBytes(sizeOfDataElement());
                            KaitaiStream _io__raw_tagDataElement = new ByteBufferKaitaiStream(this._raw_tagDataElement);
                            this.tagDataElement = new DToB0Tag(_io__raw_tagDataElement, this, _root);
                            ((DToB0Tag) (this.tagDataElement))._read();
                            break;
                        }
                        case D_TO_B_1: {
                            this._raw_tagDataElement = this._io.readBytes(sizeOfDataElement());
                            KaitaiStream _io__raw_tagDataElement = new ByteBufferKaitaiStream(this._raw_tagDataElement);
                            this.tagDataElement = new DToB1Tag(_io__raw_tagDataElement, this, _root);
                            ((DToB1Tag) (this.tagDataElement))._read();
                            break;
                        }
                        case D_TO_B_2: {
                            this._raw_tagDataElement = this._io.readBytes(sizeOfDataElement());
                            KaitaiStream _io__raw_tagDataElement = new ByteBufferKaitaiStream(this._raw_tagDataElement);
                            this.tagDataElement = new DToB2Tag(_io__raw_tagDataElement, this, _root);
                            ((DToB2Tag) (this.tagDataElement))._read();
                            break;
                        }
                        case D_TO_B_3: {
                            this._raw_tagDataElement = this._io.readBytes(sizeOfDataElement());
                            KaitaiStream _io__raw_tagDataElement = new ByteBufferKaitaiStream(this._raw_tagDataElement);
                            this.tagDataElement = new DToB3Tag(_io__raw_tagDataElement, this, _root);
                            ((DToB3Tag) (this.tagDataElement))._read();
                            break;
                        }
                        case DEVICE_MFG_DESC: {
                            this._raw_tagDataElement = this._io.readBytes(sizeOfDataElement());
                            KaitaiStream _io__raw_tagDataElement = new ByteBufferKaitaiStream(this._raw_tagDataElement);
                            this.tagDataElement = new DeviceMfgDescTag(_io__raw_tagDataElement, this, _root);
                            ((DeviceMfgDescTag) (this.tagDataElement))._read();
                            break;
                        }
                        case DEVICE_MODEL_DESC: {
                            this._raw_tagDataElement = this._io.readBytes(sizeOfDataElement());
                            KaitaiStream _io__raw_tagDataElement = new ByteBufferKaitaiStream(this._raw_tagDataElement);
                            this.tagDataElement = new DeviceModelDescTag(_io__raw_tagDataElement, this, _root);
                            ((DeviceModelDescTag) (this.tagDataElement))._read();
                            break;
                        }
                        case GAMUT: {
                            this._raw_tagDataElement = this._io.readBytes(sizeOfDataElement());
                            KaitaiStream _io__raw_tagDataElement = new ByteBufferKaitaiStream(this._raw_tagDataElement);
                            this.tagDataElement = new GamutTag(_io__raw_tagDataElement, this, _root);
                            ((GamutTag) (this.tagDataElement))._read();
                            break;
                        }
                        case GRAY_TRC: {
                            this._raw_tagDataElement = this._io.readBytes(sizeOfDataElement());
                            KaitaiStream _io__raw_tagDataElement = new ByteBufferKaitaiStream(this._raw_tagDataElement);
                            this.tagDataElement = new GrayTrcTag(_io__raw_tagDataElement, this, _root);
                            ((GrayTrcTag) (this.tagDataElement))._read();
                            break;
                        }
                        case GREEN_MATRIX_COLUMN: {
                            this._raw_tagDataElement = this._io.readBytes(sizeOfDataElement());
                            KaitaiStream _io__raw_tagDataElement = new ByteBufferKaitaiStream(this._raw_tagDataElement);
                            this.tagDataElement = new GreenMatrixColumnTag(_io__raw_tagDataElement, this, _root);
                            ((GreenMatrixColumnTag) (this.tagDataElement))._read();
                            break;
                        }
                        case GREEN_TRC: {
                            this._raw_tagDataElement = this._io.readBytes(sizeOfDataElement());
                            KaitaiStream _io__raw_tagDataElement = new ByteBufferKaitaiStream(this._raw_tagDataElement);
                            this.tagDataElement = new GreenTrcTag(_io__raw_tagDataElement, this, _root);
                            ((GreenTrcTag) (this.tagDataElement))._read();
                            break;
                        }
                        case LUMINANCE: {
                            this._raw_tagDataElement = this._io.readBytes(sizeOfDataElement());
                            KaitaiStream _io__raw_tagDataElement = new ByteBufferKaitaiStream(this._raw_tagDataElement);
                            this.tagDataElement = new LuminanceTag(_io__raw_tagDataElement, this, _root);
                            ((LuminanceTag) (this.tagDataElement))._read();
                            break;
                        }
                        case MEASUREMENT: {
                            this._raw_tagDataElement = this._io.readBytes(sizeOfDataElement());
                            KaitaiStream _io__raw_tagDataElement = new ByteBufferKaitaiStream(this._raw_tagDataElement);
                            this.tagDataElement = new MeasurementTag(_io__raw_tagDataElement, this, _root);
                            ((MeasurementTag) (this.tagDataElement))._read();
                            break;
                        }
                        case MEDIA_WHITE_POINT: {
                            this._raw_tagDataElement = this._io.readBytes(sizeOfDataElement());
                            KaitaiStream _io__raw_tagDataElement = new ByteBufferKaitaiStream(this._raw_tagDataElement);
                            this.tagDataElement = new MediaWhitePointTag(_io__raw_tagDataElement, this, _root);
                            ((MediaWhitePointTag) (this.tagDataElement))._read();
                            break;
                        }
                        case NAMED_COLOR_2: {
                            this._raw_tagDataElement = this._io.readBytes(sizeOfDataElement());
                            KaitaiStream _io__raw_tagDataElement = new ByteBufferKaitaiStream(this._raw_tagDataElement);
                            this.tagDataElement = new NamedColor2Tag(_io__raw_tagDataElement, this, _root);
                            ((NamedColor2Tag) (this.tagDataElement))._read();
                            break;
                        }
                        case OUTPUT_RESPONSE: {
                            this._raw_tagDataElement = this._io.readBytes(sizeOfDataElement());
                            KaitaiStream _io__raw_tagDataElement = new ByteBufferKaitaiStream(this._raw_tagDataElement);
                            this.tagDataElement = new OutputResponseTag(_io__raw_tagDataElement, this, _root);
                            ((OutputResponseTag) (this.tagDataElement))._read();
                            break;
                        }
                        case PERCEPTUAL_RENDERING_INTENT_GAMUT: {
                            this._raw_tagDataElement = this._io.readBytes(sizeOfDataElement());
                            KaitaiStream _io__raw_tagDataElement = new ByteBufferKaitaiStream(this._raw_tagDataElement);
                            this.tagDataElement = new PerceptualRenderingIntentGamutTag(_io__raw_tagDataElement, this, _root);
                            ((PerceptualRenderingIntentGamutTag) (this.tagDataElement))._read();
                            break;
                        }
                        case PREVIEW_0: {
                            this._raw_tagDataElement = this._io.readBytes(sizeOfDataElement());
                            KaitaiStream _io__raw_tagDataElement = new ByteBufferKaitaiStream(this._raw_tagDataElement);
                            this.tagDataElement = new Preview0Tag(_io__raw_tagDataElement, this, _root);
                            ((Preview0Tag) (this.tagDataElement))._read();
                            break;
                        }
                        case PREVIEW_1: {
                            this._raw_tagDataElement = this._io.readBytes(sizeOfDataElement());
                            KaitaiStream _io__raw_tagDataElement = new ByteBufferKaitaiStream(this._raw_tagDataElement);
                            this.tagDataElement = new Preview1Tag(_io__raw_tagDataElement, this, _root);
                            ((Preview1Tag) (this.tagDataElement))._read();
                            break;
                        }
                        case PREVIEW_2: {
                            this._raw_tagDataElement = this._io.readBytes(sizeOfDataElement());
                            KaitaiStream _io__raw_tagDataElement = new ByteBufferKaitaiStream(this._raw_tagDataElement);
                            this.tagDataElement = new Preview2Tag(_io__raw_tagDataElement, this, _root);
                            ((Preview2Tag) (this.tagDataElement))._read();
                            break;
                        }
                        case PROFILE_DESCRIPTION: {
                            this._raw_tagDataElement = this._io.readBytes(sizeOfDataElement());
                            KaitaiStream _io__raw_tagDataElement = new ByteBufferKaitaiStream(this._raw_tagDataElement);
                            this.tagDataElement = new ProfileDescriptionTag(_io__raw_tagDataElement, this, _root);
                            ((ProfileDescriptionTag) (this.tagDataElement))._read();
                            break;
                        }
                        case PROFILE_SEQUENCE: {
                            this._raw_tagDataElement = this._io.readBytes(sizeOfDataElement());
                            KaitaiStream _io__raw_tagDataElement = new ByteBufferKaitaiStream(this._raw_tagDataElement);
                            this.tagDataElement = new ProfileSequenceTag(_io__raw_tagDataElement, this, _root);
                            ((ProfileSequenceTag) (this.tagDataElement))._read();
                            break;
                        }
                        case PROFILE_SEQUENCE_IDENTIFIER: {
                            this._raw_tagDataElement = this._io.readBytes(sizeOfDataElement());
                            KaitaiStream _io__raw_tagDataElement = new ByteBufferKaitaiStream(this._raw_tagDataElement);
                            this.tagDataElement = new ProfileSequenceIdentifierTag(_io__raw_tagDataElement, this, _root);
                            ((ProfileSequenceIdentifierTag) (this.tagDataElement))._read();
                            break;
                        }
                        case RED_MATRIX_COLUMN: {
                            this._raw_tagDataElement = this._io.readBytes(sizeOfDataElement());
                            KaitaiStream _io__raw_tagDataElement = new ByteBufferKaitaiStream(this._raw_tagDataElement);
                            this.tagDataElement = new RedMatrixColumnTag(_io__raw_tagDataElement, this, _root);
                            ((RedMatrixColumnTag) (this.tagDataElement))._read();
                            break;
                        }
                        case RED_TRC: {
                            this._raw_tagDataElement = this._io.readBytes(sizeOfDataElement());
                            KaitaiStream _io__raw_tagDataElement = new ByteBufferKaitaiStream(this._raw_tagDataElement);
                            this.tagDataElement = new RedTrcTag(_io__raw_tagDataElement, this, _root);
                            ((RedTrcTag) (this.tagDataElement))._read();
                            break;
                        }
                        case SATURATION_RENDERING_INTENT_GAMUT: {
                            this._raw_tagDataElement = this._io.readBytes(sizeOfDataElement());
                            KaitaiStream _io__raw_tagDataElement = new ByteBufferKaitaiStream(this._raw_tagDataElement);
                            this.tagDataElement = new SaturationRenderingIntentGamutTag(_io__raw_tagDataElement, this, _root);
                            ((SaturationRenderingIntentGamutTag) (this.tagDataElement))._read();
                            break;
                        }
                        case TECHNOLOGY: {
                            this._raw_tagDataElement = this._io.readBytes(sizeOfDataElement());
                            KaitaiStream _io__raw_tagDataElement = new ByteBufferKaitaiStream(this._raw_tagDataElement);
                            this.tagDataElement = new TechnologyTag(_io__raw_tagDataElement, this, _root);
                            ((TechnologyTag) (this.tagDataElement))._read();
                            break;
                        }
                        case VIEWING_COND_DESC: {
                            this._raw_tagDataElement = this._io.readBytes(sizeOfDataElement());
                            KaitaiStream _io__raw_tagDataElement = new ByteBufferKaitaiStream(this._raw_tagDataElement);
                            this.tagDataElement = new ViewingCondDescTag(_io__raw_tagDataElement, this, _root);
                            ((ViewingCondDescTag) (this.tagDataElement))._read();
                            break;
                        }
                        case VIEWING_CONDITIONS: {
                            this._raw_tagDataElement = this._io.readBytes(sizeOfDataElement());
                            KaitaiStream _io__raw_tagDataElement = new ByteBufferKaitaiStream(this._raw_tagDataElement);
                            this.tagDataElement = new ViewingConditionsTag(_io__raw_tagDataElement, this, _root);
                            ((ViewingConditionsTag) (this.tagDataElement))._read();
                            break;
                        }
                        default: {
                            this.tagDataElement = this._io.readBytes(sizeOfDataElement());
                            break;
                        }
                        }
                    } else {
                        this.tagDataElement = this._io.readBytes(sizeOfDataElement());
                    }
                }
                this._io.seek(_pos);
                return this.tagDataElement;
            }
            public void setTagDataElement(Object _v) { _dirty = true; tagDataElement = _v; }
            public void setTagDataElement_Enabled(boolean _v) { _dirty = true; _enabledTagDataElement = _v; }

            private void _writeTagDataElement() {
                _shouldWriteTagDataElement = false;
                long _pos = this._io.pos();
                this._io.seek(offsetToDataElement());
                {
                    TagSignatures on = tagSignature();
                    if (on != null) {
                        switch (tagSignature()) {
                        case A_TO_B_0: {
                            final KaitaiStream _io__raw_tagDataElement = new ByteBufferKaitaiStream(sizeOfDataElement());
                            this._io.addChildStream(_io__raw_tagDataElement);
                            {
                                long _pos2 = this._io.pos();
                                this._io.seek(this._io.pos() + (sizeOfDataElement()));
                                final TagDefinition _this = this;
                                _io__raw_tagDataElement.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                    @Override
                                    protected void write(KaitaiStream parent) {
                                        _this._raw_tagDataElement = _io__raw_tagDataElement.toByteArray();
                                        if (((byte[]) (_this._raw_tagDataElement)).length != sizeOfDataElement())
                                            throw new ConsistencyError("raw(tag_data_element)", sizeOfDataElement(), ((byte[]) (_this._raw_tagDataElement)).length);
                                        parent.writeBytes(((byte[]) (((byte[]) (_this._raw_tagDataElement)))));
                                    }
                                });
                            }
                            ((AToB0Tag) (this.tagDataElement))._write_Seq(_io__raw_tagDataElement);
                            break;
                        }
                        case A_TO_B_1: {
                            final KaitaiStream _io__raw_tagDataElement = new ByteBufferKaitaiStream(sizeOfDataElement());
                            this._io.addChildStream(_io__raw_tagDataElement);
                            {
                                long _pos2 = this._io.pos();
                                this._io.seek(this._io.pos() + (sizeOfDataElement()));
                                final TagDefinition _this = this;
                                _io__raw_tagDataElement.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                    @Override
                                    protected void write(KaitaiStream parent) {
                                        _this._raw_tagDataElement = _io__raw_tagDataElement.toByteArray();
                                        if (((byte[]) (_this._raw_tagDataElement)).length != sizeOfDataElement())
                                            throw new ConsistencyError("raw(tag_data_element)", sizeOfDataElement(), ((byte[]) (_this._raw_tagDataElement)).length);
                                        parent.writeBytes(((byte[]) (((byte[]) (_this._raw_tagDataElement)))));
                                    }
                                });
                            }
                            ((AToB1Tag) (this.tagDataElement))._write_Seq(_io__raw_tagDataElement);
                            break;
                        }
                        case A_TO_B_2: {
                            final KaitaiStream _io__raw_tagDataElement = new ByteBufferKaitaiStream(sizeOfDataElement());
                            this._io.addChildStream(_io__raw_tagDataElement);
                            {
                                long _pos2 = this._io.pos();
                                this._io.seek(this._io.pos() + (sizeOfDataElement()));
                                final TagDefinition _this = this;
                                _io__raw_tagDataElement.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                    @Override
                                    protected void write(KaitaiStream parent) {
                                        _this._raw_tagDataElement = _io__raw_tagDataElement.toByteArray();
                                        if (((byte[]) (_this._raw_tagDataElement)).length != sizeOfDataElement())
                                            throw new ConsistencyError("raw(tag_data_element)", sizeOfDataElement(), ((byte[]) (_this._raw_tagDataElement)).length);
                                        parent.writeBytes(((byte[]) (((byte[]) (_this._raw_tagDataElement)))));
                                    }
                                });
                            }
                            ((AToB2Tag) (this.tagDataElement))._write_Seq(_io__raw_tagDataElement);
                            break;
                        }
                        case B_TO_A_0: {
                            final KaitaiStream _io__raw_tagDataElement = new ByteBufferKaitaiStream(sizeOfDataElement());
                            this._io.addChildStream(_io__raw_tagDataElement);
                            {
                                long _pos2 = this._io.pos();
                                this._io.seek(this._io.pos() + (sizeOfDataElement()));
                                final TagDefinition _this = this;
                                _io__raw_tagDataElement.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                    @Override
                                    protected void write(KaitaiStream parent) {
                                        _this._raw_tagDataElement = _io__raw_tagDataElement.toByteArray();
                                        if (((byte[]) (_this._raw_tagDataElement)).length != sizeOfDataElement())
                                            throw new ConsistencyError("raw(tag_data_element)", sizeOfDataElement(), ((byte[]) (_this._raw_tagDataElement)).length);
                                        parent.writeBytes(((byte[]) (((byte[]) (_this._raw_tagDataElement)))));
                                    }
                                });
                            }
                            ((BToA0Tag) (this.tagDataElement))._write_Seq(_io__raw_tagDataElement);
                            break;
                        }
                        case B_TO_A_1: {
                            final KaitaiStream _io__raw_tagDataElement = new ByteBufferKaitaiStream(sizeOfDataElement());
                            this._io.addChildStream(_io__raw_tagDataElement);
                            {
                                long _pos2 = this._io.pos();
                                this._io.seek(this._io.pos() + (sizeOfDataElement()));
                                final TagDefinition _this = this;
                                _io__raw_tagDataElement.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                    @Override
                                    protected void write(KaitaiStream parent) {
                                        _this._raw_tagDataElement = _io__raw_tagDataElement.toByteArray();
                                        if (((byte[]) (_this._raw_tagDataElement)).length != sizeOfDataElement())
                                            throw new ConsistencyError("raw(tag_data_element)", sizeOfDataElement(), ((byte[]) (_this._raw_tagDataElement)).length);
                                        parent.writeBytes(((byte[]) (((byte[]) (_this._raw_tagDataElement)))));
                                    }
                                });
                            }
                            ((BToA1Tag) (this.tagDataElement))._write_Seq(_io__raw_tagDataElement);
                            break;
                        }
                        case B_TO_A_2: {
                            final KaitaiStream _io__raw_tagDataElement = new ByteBufferKaitaiStream(sizeOfDataElement());
                            this._io.addChildStream(_io__raw_tagDataElement);
                            {
                                long _pos2 = this._io.pos();
                                this._io.seek(this._io.pos() + (sizeOfDataElement()));
                                final TagDefinition _this = this;
                                _io__raw_tagDataElement.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                    @Override
                                    protected void write(KaitaiStream parent) {
                                        _this._raw_tagDataElement = _io__raw_tagDataElement.toByteArray();
                                        if (((byte[]) (_this._raw_tagDataElement)).length != sizeOfDataElement())
                                            throw new ConsistencyError("raw(tag_data_element)", sizeOfDataElement(), ((byte[]) (_this._raw_tagDataElement)).length);
                                        parent.writeBytes(((byte[]) (((byte[]) (_this._raw_tagDataElement)))));
                                    }
                                });
                            }
                            ((BToA2Tag) (this.tagDataElement))._write_Seq(_io__raw_tagDataElement);
                            break;
                        }
                        case B_TO_D_0: {
                            final KaitaiStream _io__raw_tagDataElement = new ByteBufferKaitaiStream(sizeOfDataElement());
                            this._io.addChildStream(_io__raw_tagDataElement);
                            {
                                long _pos2 = this._io.pos();
                                this._io.seek(this._io.pos() + (sizeOfDataElement()));
                                final TagDefinition _this = this;
                                _io__raw_tagDataElement.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                    @Override
                                    protected void write(KaitaiStream parent) {
                                        _this._raw_tagDataElement = _io__raw_tagDataElement.toByteArray();
                                        if (((byte[]) (_this._raw_tagDataElement)).length != sizeOfDataElement())
                                            throw new ConsistencyError("raw(tag_data_element)", sizeOfDataElement(), ((byte[]) (_this._raw_tagDataElement)).length);
                                        parent.writeBytes(((byte[]) (((byte[]) (_this._raw_tagDataElement)))));
                                    }
                                });
                            }
                            ((BToD0Tag) (this.tagDataElement))._write_Seq(_io__raw_tagDataElement);
                            break;
                        }
                        case B_TO_D_1: {
                            final KaitaiStream _io__raw_tagDataElement = new ByteBufferKaitaiStream(sizeOfDataElement());
                            this._io.addChildStream(_io__raw_tagDataElement);
                            {
                                long _pos2 = this._io.pos();
                                this._io.seek(this._io.pos() + (sizeOfDataElement()));
                                final TagDefinition _this = this;
                                _io__raw_tagDataElement.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                    @Override
                                    protected void write(KaitaiStream parent) {
                                        _this._raw_tagDataElement = _io__raw_tagDataElement.toByteArray();
                                        if (((byte[]) (_this._raw_tagDataElement)).length != sizeOfDataElement())
                                            throw new ConsistencyError("raw(tag_data_element)", sizeOfDataElement(), ((byte[]) (_this._raw_tagDataElement)).length);
                                        parent.writeBytes(((byte[]) (((byte[]) (_this._raw_tagDataElement)))));
                                    }
                                });
                            }
                            ((BToD1Tag) (this.tagDataElement))._write_Seq(_io__raw_tagDataElement);
                            break;
                        }
                        case B_TO_D_2: {
                            final KaitaiStream _io__raw_tagDataElement = new ByteBufferKaitaiStream(sizeOfDataElement());
                            this._io.addChildStream(_io__raw_tagDataElement);
                            {
                                long _pos2 = this._io.pos();
                                this._io.seek(this._io.pos() + (sizeOfDataElement()));
                                final TagDefinition _this = this;
                                _io__raw_tagDataElement.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                    @Override
                                    protected void write(KaitaiStream parent) {
                                        _this._raw_tagDataElement = _io__raw_tagDataElement.toByteArray();
                                        if (((byte[]) (_this._raw_tagDataElement)).length != sizeOfDataElement())
                                            throw new ConsistencyError("raw(tag_data_element)", sizeOfDataElement(), ((byte[]) (_this._raw_tagDataElement)).length);
                                        parent.writeBytes(((byte[]) (((byte[]) (_this._raw_tagDataElement)))));
                                    }
                                });
                            }
                            ((BToD2Tag) (this.tagDataElement))._write_Seq(_io__raw_tagDataElement);
                            break;
                        }
                        case B_TO_D_3: {
                            final KaitaiStream _io__raw_tagDataElement = new ByteBufferKaitaiStream(sizeOfDataElement());
                            this._io.addChildStream(_io__raw_tagDataElement);
                            {
                                long _pos2 = this._io.pos();
                                this._io.seek(this._io.pos() + (sizeOfDataElement()));
                                final TagDefinition _this = this;
                                _io__raw_tagDataElement.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                    @Override
                                    protected void write(KaitaiStream parent) {
                                        _this._raw_tagDataElement = _io__raw_tagDataElement.toByteArray();
                                        if (((byte[]) (_this._raw_tagDataElement)).length != sizeOfDataElement())
                                            throw new ConsistencyError("raw(tag_data_element)", sizeOfDataElement(), ((byte[]) (_this._raw_tagDataElement)).length);
                                        parent.writeBytes(((byte[]) (((byte[]) (_this._raw_tagDataElement)))));
                                    }
                                });
                            }
                            ((BToD3Tag) (this.tagDataElement))._write_Seq(_io__raw_tagDataElement);
                            break;
                        }
                        case BLUE_MATRIX_COLUMN: {
                            final KaitaiStream _io__raw_tagDataElement = new ByteBufferKaitaiStream(sizeOfDataElement());
                            this._io.addChildStream(_io__raw_tagDataElement);
                            {
                                long _pos2 = this._io.pos();
                                this._io.seek(this._io.pos() + (sizeOfDataElement()));
                                final TagDefinition _this = this;
                                _io__raw_tagDataElement.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                    @Override
                                    protected void write(KaitaiStream parent) {
                                        _this._raw_tagDataElement = _io__raw_tagDataElement.toByteArray();
                                        if (((byte[]) (_this._raw_tagDataElement)).length != sizeOfDataElement())
                                            throw new ConsistencyError("raw(tag_data_element)", sizeOfDataElement(), ((byte[]) (_this._raw_tagDataElement)).length);
                                        parent.writeBytes(((byte[]) (((byte[]) (_this._raw_tagDataElement)))));
                                    }
                                });
                            }
                            ((BlueMatrixColumnTag) (this.tagDataElement))._write_Seq(_io__raw_tagDataElement);
                            break;
                        }
                        case BLUE_TRC: {
                            final KaitaiStream _io__raw_tagDataElement = new ByteBufferKaitaiStream(sizeOfDataElement());
                            this._io.addChildStream(_io__raw_tagDataElement);
                            {
                                long _pos2 = this._io.pos();
                                this._io.seek(this._io.pos() + (sizeOfDataElement()));
                                final TagDefinition _this = this;
                                _io__raw_tagDataElement.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                    @Override
                                    protected void write(KaitaiStream parent) {
                                        _this._raw_tagDataElement = _io__raw_tagDataElement.toByteArray();
                                        if (((byte[]) (_this._raw_tagDataElement)).length != sizeOfDataElement())
                                            throw new ConsistencyError("raw(tag_data_element)", sizeOfDataElement(), ((byte[]) (_this._raw_tagDataElement)).length);
                                        parent.writeBytes(((byte[]) (((byte[]) (_this._raw_tagDataElement)))));
                                    }
                                });
                            }
                            ((BlueTrcTag) (this.tagDataElement))._write_Seq(_io__raw_tagDataElement);
                            break;
                        }
                        case CALIBRATION_DATE_TIME: {
                            final KaitaiStream _io__raw_tagDataElement = new ByteBufferKaitaiStream(sizeOfDataElement());
                            this._io.addChildStream(_io__raw_tagDataElement);
                            {
                                long _pos2 = this._io.pos();
                                this._io.seek(this._io.pos() + (sizeOfDataElement()));
                                final TagDefinition _this = this;
                                _io__raw_tagDataElement.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                    @Override
                                    protected void write(KaitaiStream parent) {
                                        _this._raw_tagDataElement = _io__raw_tagDataElement.toByteArray();
                                        if (((byte[]) (_this._raw_tagDataElement)).length != sizeOfDataElement())
                                            throw new ConsistencyError("raw(tag_data_element)", sizeOfDataElement(), ((byte[]) (_this._raw_tagDataElement)).length);
                                        parent.writeBytes(((byte[]) (((byte[]) (_this._raw_tagDataElement)))));
                                    }
                                });
                            }
                            ((CalibrationDateTimeTag) (this.tagDataElement))._write_Seq(_io__raw_tagDataElement);
                            break;
                        }
                        case CHAR_TARGET: {
                            final KaitaiStream _io__raw_tagDataElement = new ByteBufferKaitaiStream(sizeOfDataElement());
                            this._io.addChildStream(_io__raw_tagDataElement);
                            {
                                long _pos2 = this._io.pos();
                                this._io.seek(this._io.pos() + (sizeOfDataElement()));
                                final TagDefinition _this = this;
                                _io__raw_tagDataElement.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                    @Override
                                    protected void write(KaitaiStream parent) {
                                        _this._raw_tagDataElement = _io__raw_tagDataElement.toByteArray();
                                        if (((byte[]) (_this._raw_tagDataElement)).length != sizeOfDataElement())
                                            throw new ConsistencyError("raw(tag_data_element)", sizeOfDataElement(), ((byte[]) (_this._raw_tagDataElement)).length);
                                        parent.writeBytes(((byte[]) (((byte[]) (_this._raw_tagDataElement)))));
                                    }
                                });
                            }
                            ((CharTargetTag) (this.tagDataElement))._write_Seq(_io__raw_tagDataElement);
                            break;
                        }
                        case CHROMATIC_ADAPTATION: {
                            final KaitaiStream _io__raw_tagDataElement = new ByteBufferKaitaiStream(sizeOfDataElement());
                            this._io.addChildStream(_io__raw_tagDataElement);
                            {
                                long _pos2 = this._io.pos();
                                this._io.seek(this._io.pos() + (sizeOfDataElement()));
                                final TagDefinition _this = this;
                                _io__raw_tagDataElement.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                    @Override
                                    protected void write(KaitaiStream parent) {
                                        _this._raw_tagDataElement = _io__raw_tagDataElement.toByteArray();
                                        if (((byte[]) (_this._raw_tagDataElement)).length != sizeOfDataElement())
                                            throw new ConsistencyError("raw(tag_data_element)", sizeOfDataElement(), ((byte[]) (_this._raw_tagDataElement)).length);
                                        parent.writeBytes(((byte[]) (((byte[]) (_this._raw_tagDataElement)))));
                                    }
                                });
                            }
                            ((ChromaticAdaptationTag) (this.tagDataElement))._write_Seq(_io__raw_tagDataElement);
                            break;
                        }
                        case CHROMATICITY: {
                            final KaitaiStream _io__raw_tagDataElement = new ByteBufferKaitaiStream(sizeOfDataElement());
                            this._io.addChildStream(_io__raw_tagDataElement);
                            {
                                long _pos2 = this._io.pos();
                                this._io.seek(this._io.pos() + (sizeOfDataElement()));
                                final TagDefinition _this = this;
                                _io__raw_tagDataElement.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                    @Override
                                    protected void write(KaitaiStream parent) {
                                        _this._raw_tagDataElement = _io__raw_tagDataElement.toByteArray();
                                        if (((byte[]) (_this._raw_tagDataElement)).length != sizeOfDataElement())
                                            throw new ConsistencyError("raw(tag_data_element)", sizeOfDataElement(), ((byte[]) (_this._raw_tagDataElement)).length);
                                        parent.writeBytes(((byte[]) (((byte[]) (_this._raw_tagDataElement)))));
                                    }
                                });
                            }
                            ((ChromaticityTag) (this.tagDataElement))._write_Seq(_io__raw_tagDataElement);
                            break;
                        }
                        case COLORANT_ORDER: {
                            final KaitaiStream _io__raw_tagDataElement = new ByteBufferKaitaiStream(sizeOfDataElement());
                            this._io.addChildStream(_io__raw_tagDataElement);
                            {
                                long _pos2 = this._io.pos();
                                this._io.seek(this._io.pos() + (sizeOfDataElement()));
                                final TagDefinition _this = this;
                                _io__raw_tagDataElement.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                    @Override
                                    protected void write(KaitaiStream parent) {
                                        _this._raw_tagDataElement = _io__raw_tagDataElement.toByteArray();
                                        if (((byte[]) (_this._raw_tagDataElement)).length != sizeOfDataElement())
                                            throw new ConsistencyError("raw(tag_data_element)", sizeOfDataElement(), ((byte[]) (_this._raw_tagDataElement)).length);
                                        parent.writeBytes(((byte[]) (((byte[]) (_this._raw_tagDataElement)))));
                                    }
                                });
                            }
                            ((ColorantOrderTag) (this.tagDataElement))._write_Seq(_io__raw_tagDataElement);
                            break;
                        }
                        case COLORANT_TABLE: {
                            final KaitaiStream _io__raw_tagDataElement = new ByteBufferKaitaiStream(sizeOfDataElement());
                            this._io.addChildStream(_io__raw_tagDataElement);
                            {
                                long _pos2 = this._io.pos();
                                this._io.seek(this._io.pos() + (sizeOfDataElement()));
                                final TagDefinition _this = this;
                                _io__raw_tagDataElement.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                    @Override
                                    protected void write(KaitaiStream parent) {
                                        _this._raw_tagDataElement = _io__raw_tagDataElement.toByteArray();
                                        if (((byte[]) (_this._raw_tagDataElement)).length != sizeOfDataElement())
                                            throw new ConsistencyError("raw(tag_data_element)", sizeOfDataElement(), ((byte[]) (_this._raw_tagDataElement)).length);
                                        parent.writeBytes(((byte[]) (((byte[]) (_this._raw_tagDataElement)))));
                                    }
                                });
                            }
                            ((ColorantTableTag) (this.tagDataElement))._write_Seq(_io__raw_tagDataElement);
                            break;
                        }
                        case COLORANT_TABLE_OUT: {
                            final KaitaiStream _io__raw_tagDataElement = new ByteBufferKaitaiStream(sizeOfDataElement());
                            this._io.addChildStream(_io__raw_tagDataElement);
                            {
                                long _pos2 = this._io.pos();
                                this._io.seek(this._io.pos() + (sizeOfDataElement()));
                                final TagDefinition _this = this;
                                _io__raw_tagDataElement.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                    @Override
                                    protected void write(KaitaiStream parent) {
                                        _this._raw_tagDataElement = _io__raw_tagDataElement.toByteArray();
                                        if (((byte[]) (_this._raw_tagDataElement)).length != sizeOfDataElement())
                                            throw new ConsistencyError("raw(tag_data_element)", sizeOfDataElement(), ((byte[]) (_this._raw_tagDataElement)).length);
                                        parent.writeBytes(((byte[]) (((byte[]) (_this._raw_tagDataElement)))));
                                    }
                                });
                            }
                            ((ColorantTableOutTag) (this.tagDataElement))._write_Seq(_io__raw_tagDataElement);
                            break;
                        }
                        case COLORIMETRIC_INTENT_IMAGE_STATE: {
                            final KaitaiStream _io__raw_tagDataElement = new ByteBufferKaitaiStream(sizeOfDataElement());
                            this._io.addChildStream(_io__raw_tagDataElement);
                            {
                                long _pos2 = this._io.pos();
                                this._io.seek(this._io.pos() + (sizeOfDataElement()));
                                final TagDefinition _this = this;
                                _io__raw_tagDataElement.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                    @Override
                                    protected void write(KaitaiStream parent) {
                                        _this._raw_tagDataElement = _io__raw_tagDataElement.toByteArray();
                                        if (((byte[]) (_this._raw_tagDataElement)).length != sizeOfDataElement())
                                            throw new ConsistencyError("raw(tag_data_element)", sizeOfDataElement(), ((byte[]) (_this._raw_tagDataElement)).length);
                                        parent.writeBytes(((byte[]) (((byte[]) (_this._raw_tagDataElement)))));
                                    }
                                });
                            }
                            ((ColorimetricIntentImageStateTag) (this.tagDataElement))._write_Seq(_io__raw_tagDataElement);
                            break;
                        }
                        case COPYRIGHT: {
                            final KaitaiStream _io__raw_tagDataElement = new ByteBufferKaitaiStream(sizeOfDataElement());
                            this._io.addChildStream(_io__raw_tagDataElement);
                            {
                                long _pos2 = this._io.pos();
                                this._io.seek(this._io.pos() + (sizeOfDataElement()));
                                final TagDefinition _this = this;
                                _io__raw_tagDataElement.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                    @Override
                                    protected void write(KaitaiStream parent) {
                                        _this._raw_tagDataElement = _io__raw_tagDataElement.toByteArray();
                                        if (((byte[]) (_this._raw_tagDataElement)).length != sizeOfDataElement())
                                            throw new ConsistencyError("raw(tag_data_element)", sizeOfDataElement(), ((byte[]) (_this._raw_tagDataElement)).length);
                                        parent.writeBytes(((byte[]) (((byte[]) (_this._raw_tagDataElement)))));
                                    }
                                });
                            }
                            ((CopyrightTag) (this.tagDataElement))._write_Seq(_io__raw_tagDataElement);
                            break;
                        }
                        case D_TO_B_0: {
                            final KaitaiStream _io__raw_tagDataElement = new ByteBufferKaitaiStream(sizeOfDataElement());
                            this._io.addChildStream(_io__raw_tagDataElement);
                            {
                                long _pos2 = this._io.pos();
                                this._io.seek(this._io.pos() + (sizeOfDataElement()));
                                final TagDefinition _this = this;
                                _io__raw_tagDataElement.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                    @Override
                                    protected void write(KaitaiStream parent) {
                                        _this._raw_tagDataElement = _io__raw_tagDataElement.toByteArray();
                                        if (((byte[]) (_this._raw_tagDataElement)).length != sizeOfDataElement())
                                            throw new ConsistencyError("raw(tag_data_element)", sizeOfDataElement(), ((byte[]) (_this._raw_tagDataElement)).length);
                                        parent.writeBytes(((byte[]) (((byte[]) (_this._raw_tagDataElement)))));
                                    }
                                });
                            }
                            ((DToB0Tag) (this.tagDataElement))._write_Seq(_io__raw_tagDataElement);
                            break;
                        }
                        case D_TO_B_1: {
                            final KaitaiStream _io__raw_tagDataElement = new ByteBufferKaitaiStream(sizeOfDataElement());
                            this._io.addChildStream(_io__raw_tagDataElement);
                            {
                                long _pos2 = this._io.pos();
                                this._io.seek(this._io.pos() + (sizeOfDataElement()));
                                final TagDefinition _this = this;
                                _io__raw_tagDataElement.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                    @Override
                                    protected void write(KaitaiStream parent) {
                                        _this._raw_tagDataElement = _io__raw_tagDataElement.toByteArray();
                                        if (((byte[]) (_this._raw_tagDataElement)).length != sizeOfDataElement())
                                            throw new ConsistencyError("raw(tag_data_element)", sizeOfDataElement(), ((byte[]) (_this._raw_tagDataElement)).length);
                                        parent.writeBytes(((byte[]) (((byte[]) (_this._raw_tagDataElement)))));
                                    }
                                });
                            }
                            ((DToB1Tag) (this.tagDataElement))._write_Seq(_io__raw_tagDataElement);
                            break;
                        }
                        case D_TO_B_2: {
                            final KaitaiStream _io__raw_tagDataElement = new ByteBufferKaitaiStream(sizeOfDataElement());
                            this._io.addChildStream(_io__raw_tagDataElement);
                            {
                                long _pos2 = this._io.pos();
                                this._io.seek(this._io.pos() + (sizeOfDataElement()));
                                final TagDefinition _this = this;
                                _io__raw_tagDataElement.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                    @Override
                                    protected void write(KaitaiStream parent) {
                                        _this._raw_tagDataElement = _io__raw_tagDataElement.toByteArray();
                                        if (((byte[]) (_this._raw_tagDataElement)).length != sizeOfDataElement())
                                            throw new ConsistencyError("raw(tag_data_element)", sizeOfDataElement(), ((byte[]) (_this._raw_tagDataElement)).length);
                                        parent.writeBytes(((byte[]) (((byte[]) (_this._raw_tagDataElement)))));
                                    }
                                });
                            }
                            ((DToB2Tag) (this.tagDataElement))._write_Seq(_io__raw_tagDataElement);
                            break;
                        }
                        case D_TO_B_3: {
                            final KaitaiStream _io__raw_tagDataElement = new ByteBufferKaitaiStream(sizeOfDataElement());
                            this._io.addChildStream(_io__raw_tagDataElement);
                            {
                                long _pos2 = this._io.pos();
                                this._io.seek(this._io.pos() + (sizeOfDataElement()));
                                final TagDefinition _this = this;
                                _io__raw_tagDataElement.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                    @Override
                                    protected void write(KaitaiStream parent) {
                                        _this._raw_tagDataElement = _io__raw_tagDataElement.toByteArray();
                                        if (((byte[]) (_this._raw_tagDataElement)).length != sizeOfDataElement())
                                            throw new ConsistencyError("raw(tag_data_element)", sizeOfDataElement(), ((byte[]) (_this._raw_tagDataElement)).length);
                                        parent.writeBytes(((byte[]) (((byte[]) (_this._raw_tagDataElement)))));
                                    }
                                });
                            }
                            ((DToB3Tag) (this.tagDataElement))._write_Seq(_io__raw_tagDataElement);
                            break;
                        }
                        case DEVICE_MFG_DESC: {
                            final KaitaiStream _io__raw_tagDataElement = new ByteBufferKaitaiStream(sizeOfDataElement());
                            this._io.addChildStream(_io__raw_tagDataElement);
                            {
                                long _pos2 = this._io.pos();
                                this._io.seek(this._io.pos() + (sizeOfDataElement()));
                                final TagDefinition _this = this;
                                _io__raw_tagDataElement.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                    @Override
                                    protected void write(KaitaiStream parent) {
                                        _this._raw_tagDataElement = _io__raw_tagDataElement.toByteArray();
                                        if (((byte[]) (_this._raw_tagDataElement)).length != sizeOfDataElement())
                                            throw new ConsistencyError("raw(tag_data_element)", sizeOfDataElement(), ((byte[]) (_this._raw_tagDataElement)).length);
                                        parent.writeBytes(((byte[]) (((byte[]) (_this._raw_tagDataElement)))));
                                    }
                                });
                            }
                            ((DeviceMfgDescTag) (this.tagDataElement))._write_Seq(_io__raw_tagDataElement);
                            break;
                        }
                        case DEVICE_MODEL_DESC: {
                            final KaitaiStream _io__raw_tagDataElement = new ByteBufferKaitaiStream(sizeOfDataElement());
                            this._io.addChildStream(_io__raw_tagDataElement);
                            {
                                long _pos2 = this._io.pos();
                                this._io.seek(this._io.pos() + (sizeOfDataElement()));
                                final TagDefinition _this = this;
                                _io__raw_tagDataElement.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                    @Override
                                    protected void write(KaitaiStream parent) {
                                        _this._raw_tagDataElement = _io__raw_tagDataElement.toByteArray();
                                        if (((byte[]) (_this._raw_tagDataElement)).length != sizeOfDataElement())
                                            throw new ConsistencyError("raw(tag_data_element)", sizeOfDataElement(), ((byte[]) (_this._raw_tagDataElement)).length);
                                        parent.writeBytes(((byte[]) (((byte[]) (_this._raw_tagDataElement)))));
                                    }
                                });
                            }
                            ((DeviceModelDescTag) (this.tagDataElement))._write_Seq(_io__raw_tagDataElement);
                            break;
                        }
                        case GAMUT: {
                            final KaitaiStream _io__raw_tagDataElement = new ByteBufferKaitaiStream(sizeOfDataElement());
                            this._io.addChildStream(_io__raw_tagDataElement);
                            {
                                long _pos2 = this._io.pos();
                                this._io.seek(this._io.pos() + (sizeOfDataElement()));
                                final TagDefinition _this = this;
                                _io__raw_tagDataElement.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                    @Override
                                    protected void write(KaitaiStream parent) {
                                        _this._raw_tagDataElement = _io__raw_tagDataElement.toByteArray();
                                        if (((byte[]) (_this._raw_tagDataElement)).length != sizeOfDataElement())
                                            throw new ConsistencyError("raw(tag_data_element)", sizeOfDataElement(), ((byte[]) (_this._raw_tagDataElement)).length);
                                        parent.writeBytes(((byte[]) (((byte[]) (_this._raw_tagDataElement)))));
                                    }
                                });
                            }
                            ((GamutTag) (this.tagDataElement))._write_Seq(_io__raw_tagDataElement);
                            break;
                        }
                        case GRAY_TRC: {
                            final KaitaiStream _io__raw_tagDataElement = new ByteBufferKaitaiStream(sizeOfDataElement());
                            this._io.addChildStream(_io__raw_tagDataElement);
                            {
                                long _pos2 = this._io.pos();
                                this._io.seek(this._io.pos() + (sizeOfDataElement()));
                                final TagDefinition _this = this;
                                _io__raw_tagDataElement.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                    @Override
                                    protected void write(KaitaiStream parent) {
                                        _this._raw_tagDataElement = _io__raw_tagDataElement.toByteArray();
                                        if (((byte[]) (_this._raw_tagDataElement)).length != sizeOfDataElement())
                                            throw new ConsistencyError("raw(tag_data_element)", sizeOfDataElement(), ((byte[]) (_this._raw_tagDataElement)).length);
                                        parent.writeBytes(((byte[]) (((byte[]) (_this._raw_tagDataElement)))));
                                    }
                                });
                            }
                            ((GrayTrcTag) (this.tagDataElement))._write_Seq(_io__raw_tagDataElement);
                            break;
                        }
                        case GREEN_MATRIX_COLUMN: {
                            final KaitaiStream _io__raw_tagDataElement = new ByteBufferKaitaiStream(sizeOfDataElement());
                            this._io.addChildStream(_io__raw_tagDataElement);
                            {
                                long _pos2 = this._io.pos();
                                this._io.seek(this._io.pos() + (sizeOfDataElement()));
                                final TagDefinition _this = this;
                                _io__raw_tagDataElement.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                    @Override
                                    protected void write(KaitaiStream parent) {
                                        _this._raw_tagDataElement = _io__raw_tagDataElement.toByteArray();
                                        if (((byte[]) (_this._raw_tagDataElement)).length != sizeOfDataElement())
                                            throw new ConsistencyError("raw(tag_data_element)", sizeOfDataElement(), ((byte[]) (_this._raw_tagDataElement)).length);
                                        parent.writeBytes(((byte[]) (((byte[]) (_this._raw_tagDataElement)))));
                                    }
                                });
                            }
                            ((GreenMatrixColumnTag) (this.tagDataElement))._write_Seq(_io__raw_tagDataElement);
                            break;
                        }
                        case GREEN_TRC: {
                            final KaitaiStream _io__raw_tagDataElement = new ByteBufferKaitaiStream(sizeOfDataElement());
                            this._io.addChildStream(_io__raw_tagDataElement);
                            {
                                long _pos2 = this._io.pos();
                                this._io.seek(this._io.pos() + (sizeOfDataElement()));
                                final TagDefinition _this = this;
                                _io__raw_tagDataElement.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                    @Override
                                    protected void write(KaitaiStream parent) {
                                        _this._raw_tagDataElement = _io__raw_tagDataElement.toByteArray();
                                        if (((byte[]) (_this._raw_tagDataElement)).length != sizeOfDataElement())
                                            throw new ConsistencyError("raw(tag_data_element)", sizeOfDataElement(), ((byte[]) (_this._raw_tagDataElement)).length);
                                        parent.writeBytes(((byte[]) (((byte[]) (_this._raw_tagDataElement)))));
                                    }
                                });
                            }
                            ((GreenTrcTag) (this.tagDataElement))._write_Seq(_io__raw_tagDataElement);
                            break;
                        }
                        case LUMINANCE: {
                            final KaitaiStream _io__raw_tagDataElement = new ByteBufferKaitaiStream(sizeOfDataElement());
                            this._io.addChildStream(_io__raw_tagDataElement);
                            {
                                long _pos2 = this._io.pos();
                                this._io.seek(this._io.pos() + (sizeOfDataElement()));
                                final TagDefinition _this = this;
                                _io__raw_tagDataElement.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                    @Override
                                    protected void write(KaitaiStream parent) {
                                        _this._raw_tagDataElement = _io__raw_tagDataElement.toByteArray();
                                        if (((byte[]) (_this._raw_tagDataElement)).length != sizeOfDataElement())
                                            throw new ConsistencyError("raw(tag_data_element)", sizeOfDataElement(), ((byte[]) (_this._raw_tagDataElement)).length);
                                        parent.writeBytes(((byte[]) (((byte[]) (_this._raw_tagDataElement)))));
                                    }
                                });
                            }
                            ((LuminanceTag) (this.tagDataElement))._write_Seq(_io__raw_tagDataElement);
                            break;
                        }
                        case MEASUREMENT: {
                            final KaitaiStream _io__raw_tagDataElement = new ByteBufferKaitaiStream(sizeOfDataElement());
                            this._io.addChildStream(_io__raw_tagDataElement);
                            {
                                long _pos2 = this._io.pos();
                                this._io.seek(this._io.pos() + (sizeOfDataElement()));
                                final TagDefinition _this = this;
                                _io__raw_tagDataElement.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                    @Override
                                    protected void write(KaitaiStream parent) {
                                        _this._raw_tagDataElement = _io__raw_tagDataElement.toByteArray();
                                        if (((byte[]) (_this._raw_tagDataElement)).length != sizeOfDataElement())
                                            throw new ConsistencyError("raw(tag_data_element)", sizeOfDataElement(), ((byte[]) (_this._raw_tagDataElement)).length);
                                        parent.writeBytes(((byte[]) (((byte[]) (_this._raw_tagDataElement)))));
                                    }
                                });
                            }
                            ((MeasurementTag) (this.tagDataElement))._write_Seq(_io__raw_tagDataElement);
                            break;
                        }
                        case MEDIA_WHITE_POINT: {
                            final KaitaiStream _io__raw_tagDataElement = new ByteBufferKaitaiStream(sizeOfDataElement());
                            this._io.addChildStream(_io__raw_tagDataElement);
                            {
                                long _pos2 = this._io.pos();
                                this._io.seek(this._io.pos() + (sizeOfDataElement()));
                                final TagDefinition _this = this;
                                _io__raw_tagDataElement.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                    @Override
                                    protected void write(KaitaiStream parent) {
                                        _this._raw_tagDataElement = _io__raw_tagDataElement.toByteArray();
                                        if (((byte[]) (_this._raw_tagDataElement)).length != sizeOfDataElement())
                                            throw new ConsistencyError("raw(tag_data_element)", sizeOfDataElement(), ((byte[]) (_this._raw_tagDataElement)).length);
                                        parent.writeBytes(((byte[]) (((byte[]) (_this._raw_tagDataElement)))));
                                    }
                                });
                            }
                            ((MediaWhitePointTag) (this.tagDataElement))._write_Seq(_io__raw_tagDataElement);
                            break;
                        }
                        case NAMED_COLOR_2: {
                            final KaitaiStream _io__raw_tagDataElement = new ByteBufferKaitaiStream(sizeOfDataElement());
                            this._io.addChildStream(_io__raw_tagDataElement);
                            {
                                long _pos2 = this._io.pos();
                                this._io.seek(this._io.pos() + (sizeOfDataElement()));
                                final TagDefinition _this = this;
                                _io__raw_tagDataElement.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                    @Override
                                    protected void write(KaitaiStream parent) {
                                        _this._raw_tagDataElement = _io__raw_tagDataElement.toByteArray();
                                        if (((byte[]) (_this._raw_tagDataElement)).length != sizeOfDataElement())
                                            throw new ConsistencyError("raw(tag_data_element)", sizeOfDataElement(), ((byte[]) (_this._raw_tagDataElement)).length);
                                        parent.writeBytes(((byte[]) (((byte[]) (_this._raw_tagDataElement)))));
                                    }
                                });
                            }
                            ((NamedColor2Tag) (this.tagDataElement))._write_Seq(_io__raw_tagDataElement);
                            break;
                        }
                        case OUTPUT_RESPONSE: {
                            final KaitaiStream _io__raw_tagDataElement = new ByteBufferKaitaiStream(sizeOfDataElement());
                            this._io.addChildStream(_io__raw_tagDataElement);
                            {
                                long _pos2 = this._io.pos();
                                this._io.seek(this._io.pos() + (sizeOfDataElement()));
                                final TagDefinition _this = this;
                                _io__raw_tagDataElement.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                    @Override
                                    protected void write(KaitaiStream parent) {
                                        _this._raw_tagDataElement = _io__raw_tagDataElement.toByteArray();
                                        if (((byte[]) (_this._raw_tagDataElement)).length != sizeOfDataElement())
                                            throw new ConsistencyError("raw(tag_data_element)", sizeOfDataElement(), ((byte[]) (_this._raw_tagDataElement)).length);
                                        parent.writeBytes(((byte[]) (((byte[]) (_this._raw_tagDataElement)))));
                                    }
                                });
                            }
                            ((OutputResponseTag) (this.tagDataElement))._write_Seq(_io__raw_tagDataElement);
                            break;
                        }
                        case PERCEPTUAL_RENDERING_INTENT_GAMUT: {
                            final KaitaiStream _io__raw_tagDataElement = new ByteBufferKaitaiStream(sizeOfDataElement());
                            this._io.addChildStream(_io__raw_tagDataElement);
                            {
                                long _pos2 = this._io.pos();
                                this._io.seek(this._io.pos() + (sizeOfDataElement()));
                                final TagDefinition _this = this;
                                _io__raw_tagDataElement.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                    @Override
                                    protected void write(KaitaiStream parent) {
                                        _this._raw_tagDataElement = _io__raw_tagDataElement.toByteArray();
                                        if (((byte[]) (_this._raw_tagDataElement)).length != sizeOfDataElement())
                                            throw new ConsistencyError("raw(tag_data_element)", sizeOfDataElement(), ((byte[]) (_this._raw_tagDataElement)).length);
                                        parent.writeBytes(((byte[]) (((byte[]) (_this._raw_tagDataElement)))));
                                    }
                                });
                            }
                            ((PerceptualRenderingIntentGamutTag) (this.tagDataElement))._write_Seq(_io__raw_tagDataElement);
                            break;
                        }
                        case PREVIEW_0: {
                            final KaitaiStream _io__raw_tagDataElement = new ByteBufferKaitaiStream(sizeOfDataElement());
                            this._io.addChildStream(_io__raw_tagDataElement);
                            {
                                long _pos2 = this._io.pos();
                                this._io.seek(this._io.pos() + (sizeOfDataElement()));
                                final TagDefinition _this = this;
                                _io__raw_tagDataElement.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                    @Override
                                    protected void write(KaitaiStream parent) {
                                        _this._raw_tagDataElement = _io__raw_tagDataElement.toByteArray();
                                        if (((byte[]) (_this._raw_tagDataElement)).length != sizeOfDataElement())
                                            throw new ConsistencyError("raw(tag_data_element)", sizeOfDataElement(), ((byte[]) (_this._raw_tagDataElement)).length);
                                        parent.writeBytes(((byte[]) (((byte[]) (_this._raw_tagDataElement)))));
                                    }
                                });
                            }
                            ((Preview0Tag) (this.tagDataElement))._write_Seq(_io__raw_tagDataElement);
                            break;
                        }
                        case PREVIEW_1: {
                            final KaitaiStream _io__raw_tagDataElement = new ByteBufferKaitaiStream(sizeOfDataElement());
                            this._io.addChildStream(_io__raw_tagDataElement);
                            {
                                long _pos2 = this._io.pos();
                                this._io.seek(this._io.pos() + (sizeOfDataElement()));
                                final TagDefinition _this = this;
                                _io__raw_tagDataElement.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                    @Override
                                    protected void write(KaitaiStream parent) {
                                        _this._raw_tagDataElement = _io__raw_tagDataElement.toByteArray();
                                        if (((byte[]) (_this._raw_tagDataElement)).length != sizeOfDataElement())
                                            throw new ConsistencyError("raw(tag_data_element)", sizeOfDataElement(), ((byte[]) (_this._raw_tagDataElement)).length);
                                        parent.writeBytes(((byte[]) (((byte[]) (_this._raw_tagDataElement)))));
                                    }
                                });
                            }
                            ((Preview1Tag) (this.tagDataElement))._write_Seq(_io__raw_tagDataElement);
                            break;
                        }
                        case PREVIEW_2: {
                            final KaitaiStream _io__raw_tagDataElement = new ByteBufferKaitaiStream(sizeOfDataElement());
                            this._io.addChildStream(_io__raw_tagDataElement);
                            {
                                long _pos2 = this._io.pos();
                                this._io.seek(this._io.pos() + (sizeOfDataElement()));
                                final TagDefinition _this = this;
                                _io__raw_tagDataElement.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                    @Override
                                    protected void write(KaitaiStream parent) {
                                        _this._raw_tagDataElement = _io__raw_tagDataElement.toByteArray();
                                        if (((byte[]) (_this._raw_tagDataElement)).length != sizeOfDataElement())
                                            throw new ConsistencyError("raw(tag_data_element)", sizeOfDataElement(), ((byte[]) (_this._raw_tagDataElement)).length);
                                        parent.writeBytes(((byte[]) (((byte[]) (_this._raw_tagDataElement)))));
                                    }
                                });
                            }
                            ((Preview2Tag) (this.tagDataElement))._write_Seq(_io__raw_tagDataElement);
                            break;
                        }
                        case PROFILE_DESCRIPTION: {
                            final KaitaiStream _io__raw_tagDataElement = new ByteBufferKaitaiStream(sizeOfDataElement());
                            this._io.addChildStream(_io__raw_tagDataElement);
                            {
                                long _pos2 = this._io.pos();
                                this._io.seek(this._io.pos() + (sizeOfDataElement()));
                                final TagDefinition _this = this;
                                _io__raw_tagDataElement.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                    @Override
                                    protected void write(KaitaiStream parent) {
                                        _this._raw_tagDataElement = _io__raw_tagDataElement.toByteArray();
                                        if (((byte[]) (_this._raw_tagDataElement)).length != sizeOfDataElement())
                                            throw new ConsistencyError("raw(tag_data_element)", sizeOfDataElement(), ((byte[]) (_this._raw_tagDataElement)).length);
                                        parent.writeBytes(((byte[]) (((byte[]) (_this._raw_tagDataElement)))));
                                    }
                                });
                            }
                            ((ProfileDescriptionTag) (this.tagDataElement))._write_Seq(_io__raw_tagDataElement);
                            break;
                        }
                        case PROFILE_SEQUENCE: {
                            final KaitaiStream _io__raw_tagDataElement = new ByteBufferKaitaiStream(sizeOfDataElement());
                            this._io.addChildStream(_io__raw_tagDataElement);
                            {
                                long _pos2 = this._io.pos();
                                this._io.seek(this._io.pos() + (sizeOfDataElement()));
                                final TagDefinition _this = this;
                                _io__raw_tagDataElement.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                    @Override
                                    protected void write(KaitaiStream parent) {
                                        _this._raw_tagDataElement = _io__raw_tagDataElement.toByteArray();
                                        if (((byte[]) (_this._raw_tagDataElement)).length != sizeOfDataElement())
                                            throw new ConsistencyError("raw(tag_data_element)", sizeOfDataElement(), ((byte[]) (_this._raw_tagDataElement)).length);
                                        parent.writeBytes(((byte[]) (((byte[]) (_this._raw_tagDataElement)))));
                                    }
                                });
                            }
                            ((ProfileSequenceTag) (this.tagDataElement))._write_Seq(_io__raw_tagDataElement);
                            break;
                        }
                        case PROFILE_SEQUENCE_IDENTIFIER: {
                            final KaitaiStream _io__raw_tagDataElement = new ByteBufferKaitaiStream(sizeOfDataElement());
                            this._io.addChildStream(_io__raw_tagDataElement);
                            {
                                long _pos2 = this._io.pos();
                                this._io.seek(this._io.pos() + (sizeOfDataElement()));
                                final TagDefinition _this = this;
                                _io__raw_tagDataElement.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                    @Override
                                    protected void write(KaitaiStream parent) {
                                        _this._raw_tagDataElement = _io__raw_tagDataElement.toByteArray();
                                        if (((byte[]) (_this._raw_tagDataElement)).length != sizeOfDataElement())
                                            throw new ConsistencyError("raw(tag_data_element)", sizeOfDataElement(), ((byte[]) (_this._raw_tagDataElement)).length);
                                        parent.writeBytes(((byte[]) (((byte[]) (_this._raw_tagDataElement)))));
                                    }
                                });
                            }
                            ((ProfileSequenceIdentifierTag) (this.tagDataElement))._write_Seq(_io__raw_tagDataElement);
                            break;
                        }
                        case RED_MATRIX_COLUMN: {
                            final KaitaiStream _io__raw_tagDataElement = new ByteBufferKaitaiStream(sizeOfDataElement());
                            this._io.addChildStream(_io__raw_tagDataElement);
                            {
                                long _pos2 = this._io.pos();
                                this._io.seek(this._io.pos() + (sizeOfDataElement()));
                                final TagDefinition _this = this;
                                _io__raw_tagDataElement.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                    @Override
                                    protected void write(KaitaiStream parent) {
                                        _this._raw_tagDataElement = _io__raw_tagDataElement.toByteArray();
                                        if (((byte[]) (_this._raw_tagDataElement)).length != sizeOfDataElement())
                                            throw new ConsistencyError("raw(tag_data_element)", sizeOfDataElement(), ((byte[]) (_this._raw_tagDataElement)).length);
                                        parent.writeBytes(((byte[]) (((byte[]) (_this._raw_tagDataElement)))));
                                    }
                                });
                            }
                            ((RedMatrixColumnTag) (this.tagDataElement))._write_Seq(_io__raw_tagDataElement);
                            break;
                        }
                        case RED_TRC: {
                            final KaitaiStream _io__raw_tagDataElement = new ByteBufferKaitaiStream(sizeOfDataElement());
                            this._io.addChildStream(_io__raw_tagDataElement);
                            {
                                long _pos2 = this._io.pos();
                                this._io.seek(this._io.pos() + (sizeOfDataElement()));
                                final TagDefinition _this = this;
                                _io__raw_tagDataElement.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                    @Override
                                    protected void write(KaitaiStream parent) {
                                        _this._raw_tagDataElement = _io__raw_tagDataElement.toByteArray();
                                        if (((byte[]) (_this._raw_tagDataElement)).length != sizeOfDataElement())
                                            throw new ConsistencyError("raw(tag_data_element)", sizeOfDataElement(), ((byte[]) (_this._raw_tagDataElement)).length);
                                        parent.writeBytes(((byte[]) (((byte[]) (_this._raw_tagDataElement)))));
                                    }
                                });
                            }
                            ((RedTrcTag) (this.tagDataElement))._write_Seq(_io__raw_tagDataElement);
                            break;
                        }
                        case SATURATION_RENDERING_INTENT_GAMUT: {
                            final KaitaiStream _io__raw_tagDataElement = new ByteBufferKaitaiStream(sizeOfDataElement());
                            this._io.addChildStream(_io__raw_tagDataElement);
                            {
                                long _pos2 = this._io.pos();
                                this._io.seek(this._io.pos() + (sizeOfDataElement()));
                                final TagDefinition _this = this;
                                _io__raw_tagDataElement.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                    @Override
                                    protected void write(KaitaiStream parent) {
                                        _this._raw_tagDataElement = _io__raw_tagDataElement.toByteArray();
                                        if (((byte[]) (_this._raw_tagDataElement)).length != sizeOfDataElement())
                                            throw new ConsistencyError("raw(tag_data_element)", sizeOfDataElement(), ((byte[]) (_this._raw_tagDataElement)).length);
                                        parent.writeBytes(((byte[]) (((byte[]) (_this._raw_tagDataElement)))));
                                    }
                                });
                            }
                            ((SaturationRenderingIntentGamutTag) (this.tagDataElement))._write_Seq(_io__raw_tagDataElement);
                            break;
                        }
                        case TECHNOLOGY: {
                            final KaitaiStream _io__raw_tagDataElement = new ByteBufferKaitaiStream(sizeOfDataElement());
                            this._io.addChildStream(_io__raw_tagDataElement);
                            {
                                long _pos2 = this._io.pos();
                                this._io.seek(this._io.pos() + (sizeOfDataElement()));
                                final TagDefinition _this = this;
                                _io__raw_tagDataElement.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                    @Override
                                    protected void write(KaitaiStream parent) {
                                        _this._raw_tagDataElement = _io__raw_tagDataElement.toByteArray();
                                        if (((byte[]) (_this._raw_tagDataElement)).length != sizeOfDataElement())
                                            throw new ConsistencyError("raw(tag_data_element)", sizeOfDataElement(), ((byte[]) (_this._raw_tagDataElement)).length);
                                        parent.writeBytes(((byte[]) (((byte[]) (_this._raw_tagDataElement)))));
                                    }
                                });
                            }
                            ((TechnologyTag) (this.tagDataElement))._write_Seq(_io__raw_tagDataElement);
                            break;
                        }
                        case VIEWING_COND_DESC: {
                            final KaitaiStream _io__raw_tagDataElement = new ByteBufferKaitaiStream(sizeOfDataElement());
                            this._io.addChildStream(_io__raw_tagDataElement);
                            {
                                long _pos2 = this._io.pos();
                                this._io.seek(this._io.pos() + (sizeOfDataElement()));
                                final TagDefinition _this = this;
                                _io__raw_tagDataElement.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                    @Override
                                    protected void write(KaitaiStream parent) {
                                        _this._raw_tagDataElement = _io__raw_tagDataElement.toByteArray();
                                        if (((byte[]) (_this._raw_tagDataElement)).length != sizeOfDataElement())
                                            throw new ConsistencyError("raw(tag_data_element)", sizeOfDataElement(), ((byte[]) (_this._raw_tagDataElement)).length);
                                        parent.writeBytes(((byte[]) (((byte[]) (_this._raw_tagDataElement)))));
                                    }
                                });
                            }
                            ((ViewingCondDescTag) (this.tagDataElement))._write_Seq(_io__raw_tagDataElement);
                            break;
                        }
                        case VIEWING_CONDITIONS: {
                            final KaitaiStream _io__raw_tagDataElement = new ByteBufferKaitaiStream(sizeOfDataElement());
                            this._io.addChildStream(_io__raw_tagDataElement);
                            {
                                long _pos2 = this._io.pos();
                                this._io.seek(this._io.pos() + (sizeOfDataElement()));
                                final TagDefinition _this = this;
                                _io__raw_tagDataElement.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                    @Override
                                    protected void write(KaitaiStream parent) {
                                        _this._raw_tagDataElement = _io__raw_tagDataElement.toByteArray();
                                        if (((byte[]) (_this._raw_tagDataElement)).length != sizeOfDataElement())
                                            throw new ConsistencyError("raw(tag_data_element)", sizeOfDataElement(), ((byte[]) (_this._raw_tagDataElement)).length);
                                        parent.writeBytes(((byte[]) (((byte[]) (_this._raw_tagDataElement)))));
                                    }
                                });
                            }
                            ((ViewingConditionsTag) (this.tagDataElement))._write_Seq(_io__raw_tagDataElement);
                            break;
                        }
                        default: {
                            this._io.writeBytes(((byte[]) (((byte[]) (this.tagDataElement)))));
                            break;
                        }
                        }
                    } else {
                        this._io.writeBytes(((byte[]) (((byte[]) (this.tagDataElement)))));
                    }
                }
                this._io.seek(_pos);
            }
            private TagSignatures tagSignature;
            private long offsetToDataElement;
            private long sizeOfDataElement;
            private Icc4 _root;
            private Icc4.TagTable _parent;
            private byte[] _raw_tagDataElement;
            public TagSignatures tagSignature() { return tagSignature; }
            public void setTagSignature(TagSignatures _v) { _dirty = true; tagSignature = _v; }
            public long offsetToDataElement() { return offsetToDataElement; }
            public void setOffsetToDataElement(long _v) { _dirty = true; offsetToDataElement = _v; }
            public long sizeOfDataElement() { return sizeOfDataElement; }
            public void setSizeOfDataElement(long _v) { _dirty = true; sizeOfDataElement = _v; }
            public Icc4 _root() { return _root; }
            public void set_root(Icc4 _v) { _dirty = true; _root = _v; }
            public Icc4.TagTable _parent() { return _parent; }
            public void set_parent(Icc4.TagTable _v) { _dirty = true; _parent = _v; }
            public byte[] _raw_tagDataElement() { return _raw_tagDataElement; }
            public void set_raw_TagDataElement(byte[] _v) { _dirty = true; _raw_tagDataElement = _v; }
        }
        private long tagCount;
        private List<TagDefinition> tags;
        private Icc4 _root;
        private Icc4 _parent;
        public long tagCount() { return tagCount; }
        public void setTagCount(long _v) { _dirty = true; tagCount = _v; }
        public List<TagDefinition> tags() { return tags; }
        public void setTags(List<TagDefinition> _v) { _dirty = true; tags = _v; }
        public Icc4 _root() { return _root; }
        public void set_root(Icc4 _v) { _dirty = true; _root = _v; }
        public Icc4 _parent() { return _parent; }
        public void set_parent(Icc4 _v) { _dirty = true; _parent = _v; }
    }
    public static class U16Fixed16Number extends KaitaiStruct.ReadWrite {
        public static U16Fixed16Number fromFile(String fileName) throws IOException {
            return new U16Fixed16Number(new ByteBufferKaitaiStream(fileName));
        }
        public U16Fixed16Number() {
            this(null, null, null);
        }

        public U16Fixed16Number(KaitaiStream _io) {
            this(_io, null, null);
        }

        public U16Fixed16Number(KaitaiStream _io, Icc4.TagTable.TagDefinition.U16Fixed16ArrayType _parent) {
            this(_io, _parent, null);
        }

        public U16Fixed16Number(KaitaiStream _io, Icc4.TagTable.TagDefinition.U16Fixed16ArrayType _parent, Icc4 _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.number = this._io.readBytes(4);
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBytes(this.number);
        }

        public void _check() {
            if (this.number.length != 4)
                throw new ConsistencyError("number", 4, this.number.length);
            _dirty = false;
        }
        private byte[] number;
        private Icc4 _root;
        private Icc4.TagTable.TagDefinition.U16Fixed16ArrayType _parent;
        public byte[] number() { return number; }
        public void setNumber(byte[] _v) { _dirty = true; number = _v; }
        public Icc4 _root() { return _root; }
        public void set_root(Icc4 _v) { _dirty = true; _root = _v; }
        public Icc4.TagTable.TagDefinition.U16Fixed16ArrayType _parent() { return _parent; }
        public void set_parent(Icc4.TagTable.TagDefinition.U16Fixed16ArrayType _v) { _dirty = true; _parent = _v; }
    }
    public static class U1Fixed15Number extends KaitaiStruct.ReadWrite {
        public static U1Fixed15Number fromFile(String fileName) throws IOException {
            return new U1Fixed15Number(new ByteBufferKaitaiStream(fileName));
        }
        public U1Fixed15Number() {
            this(null, null, null);
        }

        public U1Fixed15Number(KaitaiStream _io) {
            this(_io, null, null);
        }

        public U1Fixed15Number(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
            this(_io, _parent, null);
        }

        public U1Fixed15Number(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, Icc4 _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.number = this._io.readBytes(2);
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBytes(this.number);
        }

        public void _check() {
            if (this.number.length != 2)
                throw new ConsistencyError("number", 2, this.number.length);
            _dirty = false;
        }
        private byte[] number;
        private Icc4 _root;
        private KaitaiStruct.ReadWrite _parent;
        public byte[] number() { return number; }
        public void setNumber(byte[] _v) { _dirty = true; number = _v; }
        public Icc4 _root() { return _root; }
        public void set_root(Icc4 _v) { _dirty = true; _root = _v; }
        public KaitaiStruct.ReadWrite _parent() { return _parent; }
        public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
    }
    public static class U8Fixed8Number extends KaitaiStruct.ReadWrite {
        public static U8Fixed8Number fromFile(String fileName) throws IOException {
            return new U8Fixed8Number(new ByteBufferKaitaiStream(fileName));
        }
        public U8Fixed8Number() {
            this(null, null, null);
        }

        public U8Fixed8Number(KaitaiStream _io) {
            this(_io, null, null);
        }

        public U8Fixed8Number(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
            this(_io, _parent, null);
        }

        public U8Fixed8Number(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, Icc4 _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.number = this._io.readBytes(2);
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBytes(this.number);
        }

        public void _check() {
            if (this.number.length != 2)
                throw new ConsistencyError("number", 2, this.number.length);
            _dirty = false;
        }
        private byte[] number;
        private Icc4 _root;
        private KaitaiStruct.ReadWrite _parent;
        public byte[] number() { return number; }
        public void setNumber(byte[] _v) { _dirty = true; number = _v; }
        public Icc4 _root() { return _root; }
        public void set_root(Icc4 _v) { _dirty = true; _root = _v; }
        public KaitaiStruct.ReadWrite _parent() { return _parent; }
        public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
    }
    public static class XyzNumber extends KaitaiStruct.ReadWrite {
        public static XyzNumber fromFile(String fileName) throws IOException {
            return new XyzNumber(new ByteBufferKaitaiStream(fileName));
        }
        public XyzNumber() {
            this(null, null, null);
        }

        public XyzNumber(KaitaiStream _io) {
            this(_io, null, null);
        }

        public XyzNumber(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
            this(_io, _parent, null);
        }

        public XyzNumber(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, Icc4 _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.x = this._io.readBytes(4);
            this.y = this._io.readBytes(4);
            this.z = this._io.readBytes(4);
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBytes(this.x);
            this._io.writeBytes(this.y);
            this._io.writeBytes(this.z);
        }

        public void _check() {
            if (this.x.length != 4)
                throw new ConsistencyError("x", 4, this.x.length);
            if (this.y.length != 4)
                throw new ConsistencyError("y", 4, this.y.length);
            if (this.z.length != 4)
                throw new ConsistencyError("z", 4, this.z.length);
            _dirty = false;
        }
        private byte[] x;
        private byte[] y;
        private byte[] z;
        private Icc4 _root;
        private KaitaiStruct.ReadWrite _parent;
        public byte[] x() { return x; }
        public void setX(byte[] _v) { _dirty = true; x = _v; }
        public byte[] y() { return y; }
        public void setY(byte[] _v) { _dirty = true; y = _v; }
        public byte[] z() { return z; }
        public void setZ(byte[] _v) { _dirty = true; z = _v; }
        public Icc4 _root() { return _root; }
        public void set_root(Icc4 _v) { _dirty = true; _root = _v; }
        public KaitaiStruct.ReadWrite _parent() { return _parent; }
        public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
    }
    private ProfileHeader header;
    private TagTable tagTable;
    private Icc4 _root;
    private KaitaiStruct.ReadWrite _parent;
    public ProfileHeader header() { return header; }
    public void setHeader(ProfileHeader _v) { _dirty = true; header = _v; }
    public TagTable tagTable() { return tagTable; }
    public void setTagTable(TagTable _v) { _dirty = true; tagTable = _v; }
    public Icc4 _root() { return _root; }
    public void set_root(Icc4 _v) { _dirty = true; _root = _v; }
    public KaitaiStruct.ReadWrite _parent() { return _parent; }
    public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
}
