# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import ReadWriteKaitaiStruct, KaitaiStream, BytesIO
from enum import IntEnum


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class Icc4(ReadWriteKaitaiStruct):
    def __init__(self, _io=None, _parent=None, _root=None):
        super(Icc4, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self

    def _read(self):
        self.header = Icc4.ProfileHeader(self._io, self, self._root)
        self.header._read()
        self.tag_table = Icc4.TagTable(self._io, self, self._root)
        self.tag_table._read()
        self._dirty = False


    def _fetch_instances(self):
        pass
        self.header._fetch_instances()
        self.tag_table._fetch_instances()


    def _write__seq(self, io=None):
        super(Icc4, self)._write__seq(io)
        self.header._write__seq(self._io)
        self.tag_table._write__seq(self._io)


    def _check(self):
        if self.header._root != self._root:
            raise kaitaistruct.ConsistencyError(u"header", self._root, self.header._root)
        if self.header._parent != self:
            raise kaitaistruct.ConsistencyError(u"header", self, self.header._parent)
        if self.tag_table._root != self._root:
            raise kaitaistruct.ConsistencyError(u"tag_table", self._root, self.tag_table._root)
        if self.tag_table._parent != self:
            raise kaitaistruct.ConsistencyError(u"tag_table", self, self.tag_table._parent)
        self._dirty = False

    class DateTimeNumber(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Icc4.DateTimeNumber, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.year = self._io.read_u2be()
            self.month = self._io.read_u2be()
            self.day = self._io.read_u2be()
            self.hour = self._io.read_u2be()
            self.minute = self._io.read_u2be()
            self.second = self._io.read_u2be()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(Icc4.DateTimeNumber, self)._write__seq(io)
            self._io.write_u2be(self.year)
            self._io.write_u2be(self.month)
            self._io.write_u2be(self.day)
            self._io.write_u2be(self.hour)
            self._io.write_u2be(self.minute)
            self._io.write_u2be(self.second)


        def _check(self):
            self._dirty = False


    class DeviceAttributes(ReadWriteKaitaiStruct):

        class DeviceAttributesColourOrBlackAndWhiteMedia(IntEnum):
            colour_media = 0
            black_and_white_media = 1

        class DeviceAttributesGlossyOrMatte(IntEnum):
            glossy = 0
            matte = 1

        class DeviceAttributesPositiveOrNegativeMediaPolarity(IntEnum):
            positive_media_polarity = 0
            negative_media_polarity = 1

        class DeviceAttributesReflectiveOrTransparency(IntEnum):
            reflective = 0
            transparency = 1
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Icc4.DeviceAttributes, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.reflective_or_transparency = KaitaiStream.resolve_enum(Icc4.DeviceAttributes.DeviceAttributesReflectiveOrTransparency, self._io.read_bits_int_be(1))
            self.glossy_or_matte = KaitaiStream.resolve_enum(Icc4.DeviceAttributes.DeviceAttributesGlossyOrMatte, self._io.read_bits_int_be(1))
            self.positive_or_negative_media_polarity = KaitaiStream.resolve_enum(Icc4.DeviceAttributes.DeviceAttributesPositiveOrNegativeMediaPolarity, self._io.read_bits_int_be(1))
            self.colour_or_black_and_white_media = KaitaiStream.resolve_enum(Icc4.DeviceAttributes.DeviceAttributesColourOrBlackAndWhiteMedia, self._io.read_bits_int_be(1))
            self.reserved = self._io.read_bits_int_be(28)
            self.vendor_specific = self._io.read_bits_int_be(32)
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(Icc4.DeviceAttributes, self)._write__seq(io)
            self._io.write_bits_int_be(1, int(self.reflective_or_transparency))
            self._io.write_bits_int_be(1, int(self.glossy_or_matte))
            self._io.write_bits_int_be(1, int(self.positive_or_negative_media_polarity))
            self._io.write_bits_int_be(1, int(self.colour_or_black_and_white_media))
            self._io.write_bits_int_be(28, self.reserved)
            self._io.write_bits_int_be(32, self.vendor_specific)


        def _check(self):
            self._dirty = False


    class DeviceManufacturer(ReadWriteKaitaiStruct):

        class DeviceManufacturers(IntEnum):
            erdt_systems_gmbh_and_co_kg = 878981744
            aamazing_technologies_inc = 1094798657
            acer_peripherals = 1094927698
            acolyte_color_research = 1094929492
            actix_sytems_inc = 1094931529
            adara_technology_inc = 1094992210
            adobe_systems_incorporated = 1094992453
            adi_systems_inc = 1094994208
            agfa_graphics_nv = 1095190081
            alps_electric_usa_inc = 1095519556
            alps_electric_usa_inc_2 = 1095520339
            alwan_color_expertise = 1095522126
            amiable_technologies_inc = 1095586889
            aoc_international_usa_ltd = 1095713568
            apago = 1095778631
            apple_computer_inc = 1095782476
            ast = 1095980064
            atandt_computer_systems = 1096033876
            barbieri_electronic = 1111573836
            barco_nv = 1112687439
            breakpoint_pty_limited = 1112689488
            brother_industries_ltd = 1112690516
            bull = 1112886348
            bus_computer_systems = 1112888096
            c_itoh = 1127041364
            intel_corporation = 1128353106
            canon_inc_canon_development_americas_inc = 1128353359
            carroll_touch = 1128354386
            casio_computer_co_ltd = 1128354633
            colorbus_pl = 1128420691
            crossfield = 1128614944
            crossfield_2 = 1128615032
            cgs_publishing_technologies_international_gmbh = 1128747808
            rochester_robotics = 1128811808
            colour_imaging_group_london = 1128875852
            citizen = 1128879177
            candela_ltd = 1129066544
            color_iq = 1129072977
            chromaco_inc = 1129136975
            chromix = 1129146712
            colorgraphic_communications_corporation = 1129270351
            compaq_computer_corporation = 1129270608
            compeq_usa_focus_technology = 1129270640
            conrac_display_products = 1129270866
            cordata_technologies_inc = 1129271876
            compaq_computer_corporation_2 = 1129337120
            colorpro = 1129337423
            cornerstone = 1129467424
            ctx_international_inc = 1129601056
            colorvision = 1129728339
            fujitsu_laboratories_ltd = 1129792288
            darius_technology_ltd = 1145131593
            dataproducts = 1145132097
            dry_creek_photo = 1145262112
            digital_contents_resource_center_chung_ang_university = 1145262659
            dell_computer_corporation = 1145392204
            dainippon_ink_and_chemicals = 1145652000
            diconix = 1145652047
            digital = 1145653065
            digital_light_and_color = 1145841219
            doppelganger_llc = 1146113095
            dainippon_screen = 1146298400
            doosol = 1146310476
            dupont = 1146441806
            epson = 1162892111
            esko_graphics = 1163086671
            electronics_and_telecommunications_research_institute = 1163153993
            everex_systems_inc = 1163281746
            exactcode_gmbh = 1163411779
            eizo_nanao_corporation = 1164540527
            falco_data_products_inc = 1178684483
            fuji_photo_film_coltd = 1179000864
            fujifilm_electronic_imaging_ltd = 1179010377
            fnord_software = 1179537988
            fora_inc = 1179603521
            forefront_technology_corporation = 1179603525
            fujitsu = 1179658794
            waytech_development_inc = 1179664672
            fujitsu_2 = 1179994697
            fuji_xerox_co_ltd = 1180180512
            gcc_technologies_inc = 1195590432
            global_graphics_software_limited = 1195856716
            gretagmacbeth = 1196245536
            gmg_gmbh_and_co_kg = 1196246816
            goldstar_technology_inc = 1196379204
            giantprint_pty_ltd = 1196446292
            gretagmacbeth_2 = 1196707138
            waytech_development_inc_2 = 1196835616
            sony_corporation = 1196896843
            hci = 1212369184
            heidelberger_druckmaschinen_ag = 1212435744
            hermes = 1212502605
            hitachi_america_ltd = 1212765249
            hewlett_packard = 1213210656
            hitachi_ltd = 1213481760
            hiti_digital_inc = 1214862441
            ibm_corporation = 1229081888
            scitex_corporation_ltd = 1229213268
            hewlett_packard_2 = 1229275936
            iiyama_north_america_inc = 1229543745
            ikegami_electronics_inc = 1229669703
            image_systems_corporation = 1229799751
            ingram_micro_inc = 1229801760
            intel_corporation_2 = 1229870147
            intl = 1229870156
            intra_electronics_usa_inc = 1229870162
            iocomm_international_technology_corporation = 1229931343
            infoprint_solutions_company = 1230000928
            scitex_corporation_ltd_3 = 1230129491
            ichikawa_soft_laboratory = 1230195744
            itnl = 1230261836
            ivm = 1230392608
            iwatsu_electric_co_ltd = 1230455124
            scitex_corporation_ltd_2 = 1231318644
            inca_digital_printers_ltd = 1231971169
            scitex_corporation_ltd_4 = 1232234867
            jetsoft_development = 1246971476
            jvc_information_products_co = 1247167264
            scitex_corporation_ltd_6 = 1262572116
            kfc_computek_components_corporation = 1262895904
            klh_computers = 1263290400
            konica_minolta_holdings_inc = 1263355972
            konica_corporation = 1263420225
            kodak = 1263486017
            kyocera = 1264144195
            scitex_corporation_ltd_7 = 1264677492
            leica_camera_ag = 1279476039
            leeds_colour = 1279476548
            left_dakota = 1279541579
            leading_technology_inc = 1279607108
            lexmark_international_inc = 1279613005
            link_computer_inc = 1279872587
            linotronic = 1279872591
            lite_on_inc = 1279874117
            mag_computronic_usa_inc = 1296123715
            mag_innovision_inc = 1296123721
            mannesmann = 1296125518
            micron_technology_inc = 1296646990
            microtek = 1296646994
            microvitec_inc = 1296646998
            minolta = 1296649807
            mitsubishi_electronics_america_inc = 1296651347
            mitsuba_corporation = 1296651379
            minolta_2 = 1296976980
            modgraph_inc = 1297040455
            monitronix_inc = 1297043017
            monaco_systems_inc = 1297043027
            morse_technology_inc = 1297044051
            motive_systems = 1297044553
            microsoft_corporation = 1297303124
            mutoh_industries_ltd = 1297437775
            mitsubishi_electric_corporation_kyoto_works = 1298756723
            nanao_usa_corporation = 1312902721
            nec_corporation = 1313162016
            nexpress_solutions_llc = 1313167440
            nissei_sangyo_america_ltd = 1313428307
            nikon_corporation = 1313558350
            oce_technologies_bv = 1329808672
            ocecolor = 1329808707
            oki = 1330333984
            okidata = 1330334020
            okidata_2 = 1330334032
            olivetti = 1330399574
            olympus_optical_co_ltd = 1330403661
            onyx_graphics = 1330534744
            optiquest = 1330664521
            packard_bell = 1346454347
            matsushita_electric_industrial_co_ltd = 1346457153
            pantone_inc = 1346457172
            packard_bell_2 = 1346522656
            pfu_limited = 1346786592
            philips_consumer_electronics_co = 1346914636
            hoya_corporation_pentax_imaging_systems_division = 1347310680
            phase_one_a_s = 1347382885
            premier_computer_innovations = 1347568973
            princeton_graphic_systems = 1347569998
            princeton_publishing_labs = 1347570000
            qlux = 1363957080
            qms_inc = 1364022048
            qpcard_ab = 1364214596
            quadlaser = 1364541764
            qume_corporation = 1364544837
            radius_inc = 1380009033
            integrated_color_solutions_inc_2 = 1380205688
            roland_dg_corporation = 1380206368
            redms_group_inc = 1380271181
            relisys = 1380273225
            rolf_gierling_multitools = 1380404563
            ricoh_corporation = 1380533071
            edmund_ronald = 1380863044
            royal = 1380931905
            ricoh_printing_systemsltd = 1380991776
            royal_information_electronics_co_ltd = 1381256224
            sampo_corporation_of_america = 1396788560
            samsung_inc = 1396788563
            jaime_santana_pomares = 1396788820
            scitex_corporation_ltd_9 = 1396918612
            dainippon_screen_3 = 1396920910
            scitex_corporation_ltd_12 = 1396985888
            samsung_electronics_coltd = 1397048096
            seiko_instruments_usa_inc = 1397049675
            seikosha = 1397049707
            scanguycom = 1397183833
            sharp_laboratories = 1397244242
            international_color_consortium = 1397310275
            sony_corporation_2 = 1397706329
            spectracal = 1397769036
            star = 1398030674
            sampo_technology_corporation = 1398031136
            scitex_corporation_ltd_10 = 1399023988
            scitex_corporation_ltd_13 = 1399091232
            sony_corporation_3 = 1399811705
            talon_technology_corporation = 1413565519
            tandy = 1413566020
            tatung_co_of_america_inc = 1413567573
            taxan_america_inc = 1413568577
            tokyo_denshi_sekei_kk = 1413763872
            teco_information_systems_inc = 1413825359
            tegra = 1413826386
            tektronix_inc = 1413827412
            texas_instruments = 1414078496
            typemaker_ltd = 1414351698
            toshiba_corp = 1414484802
            toshiba_inc = 1414484808
            totoku_electric_co_ltd = 1414485067
            triumph = 1414678869
            toshiba_tec_corporation = 1414742612
            ttx_computer_products_inc = 1414813728
            tvm_professional_monitor_corporation = 1414941984
            tw_casper_corporation = 1414996000
            ulead_systems = 1431065432
            unisys = 1431193939
            utz_fehlau_and_sohn = 1431591494
            varityper = 1447121481
            viewsonic = 1447642455
            visual_communication = 1447646028
            wang = 1463897671
            wilbur_imaging = 1464615506
            ware_to_go = 1465141042
            wyse_technology = 1465471813
            xerox_corporation = 1480938072
            x_rite = 1481787732
            lavanyas_test_company = 1513173555
            zoran_corporation = 1515340110
            zebra_technologies_inc = 1516593778
            basiccolor_gmbh = 1648968515
            bergdesign_incorporated = 1650815591
            integrated_color_solutions_inc = 1667594596
            macdermid_colorspan_inc = 1668051824
            dainippon_screen_2 = 1685266464
            dupont_2 = 1685418094
            fujifilm_electronic_imaging_ltd_2 = 1717986665
            fluxdata_corporation = 1718383992
            scitex_corporation_ltd_5 = 1769105779
            scitex_corporation_ltd_8 = 1801548404
            erdt_systems_gmbh_and_co_kg_2 = 1868706916
            medigraph_gmbh = 1868720483
            qubyx_sarl = 1903518329
            scitex_corporation_ltd_11 = 1935894900
            dainippon_screen_4 = 1935897198
            scitex_corporation_ltd_14 = 1935962144
            siwi_grafika_corporation = 1936291689
            yxymaster_gmbh = 2037938541
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Icc4.DeviceManufacturer, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.device_manufacturer = KaitaiStream.resolve_enum(Icc4.DeviceManufacturer.DeviceManufacturers, self._io.read_u4be())
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(Icc4.DeviceManufacturer, self)._write__seq(io)
            self._io.write_u4be(int(self.device_manufacturer))


        def _check(self):
            self._dirty = False


    class PositionNumber(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Icc4.PositionNumber, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.offset_to_data_element = self._io.read_u4be()
            self.size_of_data_element = self._io.read_u4be()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(Icc4.PositionNumber, self)._write__seq(io)
            self._io.write_u4be(self.offset_to_data_element)
            self._io.write_u4be(self.size_of_data_element)


        def _check(self):
            self._dirty = False


    class ProfileHeader(ReadWriteKaitaiStruct):

        class CmmSignatures(IntEnum):
            the_imaging_factory_cmm = 858931796
            agfa_cmm = 1094929747
            adobe_cmm = 1094992453
            color_gear_cmm = 1128484179
            demoiccmax_cmm = 1145654616
            logosync_cmm = 1147629395
            efi_cmm = 1162234144
            exact_scan_cmm = 1163411779
            fuji_film_cmm = 1179000864
            harlequin_rip_cmm = 1212370253
            heidelberg_cmm = 1212435744
            kodak_cmm = 1262701907
            konica_minolta_cmm = 1296256324
            onyx_graphics_cmm = 1330534744
            device_link_cmm = 1380404563
            reficcmax_cmm = 1380535640
            sample_icc_cmm = 1397310275
            mutoh_cmm = 1397311310
            toshiba_cmm = 1413696845
            color_gear_cmm_lite = 1430471501
            color_gear_cmm_c = 1430474067
            windows_color_system_cmm = 1464029984
            ware_to_go_cmm = 1465141024
            apple_cmm = 1634758764
            argyll_cms_cmm = 1634887532
            little_cms_cmm = 1818455411
            vivo_cmm = 1986623087
            zoran_cmm = 2053320752

        class DataColourSpaces(IntEnum):
            two_colour = 843271250
            three_colour = 860048466
            four_colour = 876825682
            five_colour = 893602898
            six_colour = 910380114
            seven_colour = 927157330
            eight_colour = 943934546
            nine_colour = 960711762
            ten_colour = 1094929490
            eleven_colour = 1111706706
            twelve_colour = 1128483922
            cmy = 1129142560
            cmyk = 1129142603
            thirteen_colour = 1145261138
            fourteen_colour = 1162038354
            fifteen_colour = 1178815570
            gray = 1196573017
            hls = 1212961568
            hsv = 1213421088
            cielab_or_pcslab = 1281450528
            cieluv = 1282766368
            rgb = 1380401696
            nciexyz_or_pcsxyz = 1482250784
            ycbcr = 1497588338
            cieyxy = 1501067552

        class PrimaryPlatforms(IntEnum):
            apple_computer_inc = 1095782476
            microsoft_corporation = 1297303124
            silicon_graphics_inc = 1397180704
            sun_microsystems = 1398099543

        class ProfileClasses(IntEnum):
            abstract_profile = 1633842036
            device_link_profile = 1818848875
            display_device_profile = 1835955314
            named_color_profile = 1852662636
            output_device_profile = 1886549106
            input_device_profile = 1935896178
            color_space_profile = 1936744803

        class RenderingIntents(IntEnum):
            perceptual = 0
            media_relative_colorimetric = 1
            saturation = 2
            icc_absolute_colorimetric = 3
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Icc4.ProfileHeader, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.size = self._io.read_u4be()
            self.preferred_cmm_type = KaitaiStream.resolve_enum(Icc4.ProfileHeader.CmmSignatures, self._io.read_u4be())
            self.version = Icc4.ProfileHeader.VersionField(self._io, self, self._root)
            self.version._read()
            self.device_class = KaitaiStream.resolve_enum(Icc4.ProfileHeader.ProfileClasses, self._io.read_u4be())
            self.color_space = KaitaiStream.resolve_enum(Icc4.ProfileHeader.DataColourSpaces, self._io.read_u4be())
            self.pcs = (self._io.read_bytes(4)).decode(u"ASCII")
            self.creation_date_time = Icc4.DateTimeNumber(self._io, self, self._root)
            self.creation_date_time._read()
            self.file_signature = self._io.read_bytes(4)
            if not self.file_signature == b"\x61\x63\x73\x70":
                raise kaitaistruct.ValidationNotEqualError(b"\x61\x63\x73\x70", self.file_signature, self._io, u"/types/profile_header/seq/7")
            self.primary_platform = KaitaiStream.resolve_enum(Icc4.ProfileHeader.PrimaryPlatforms, self._io.read_u4be())
            self.profile_flags = Icc4.ProfileHeader.ProfileFlags(self._io, self, self._root)
            self.profile_flags._read()
            self.device_manufacturer = Icc4.DeviceManufacturer(self._io, self, self._root)
            self.device_manufacturer._read()
            self.device_model = (self._io.read_bytes(4)).decode(u"ASCII")
            self.device_attributes = Icc4.DeviceAttributes(self._io, self, self._root)
            self.device_attributes._read()
            self.rendering_intent = KaitaiStream.resolve_enum(Icc4.ProfileHeader.RenderingIntents, self._io.read_u4be())
            self.nciexyz_values_of_illuminant_of_pcs = Icc4.XyzNumber(self._io, self, self._root)
            self.nciexyz_values_of_illuminant_of_pcs._read()
            self.creator = Icc4.DeviceManufacturer(self._io, self, self._root)
            self.creator._read()
            self.identifier = self._io.read_bytes(16)
            self.reserved_data = self._io.read_bytes(28)
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.version._fetch_instances()
            self.creation_date_time._fetch_instances()
            self.profile_flags._fetch_instances()
            self.device_manufacturer._fetch_instances()
            self.device_attributes._fetch_instances()
            self.nciexyz_values_of_illuminant_of_pcs._fetch_instances()
            self.creator._fetch_instances()


        def _write__seq(self, io=None):
            super(Icc4.ProfileHeader, self)._write__seq(io)
            self._io.write_u4be(self.size)
            self._io.write_u4be(int(self.preferred_cmm_type))
            self.version._write__seq(self._io)
            self._io.write_u4be(int(self.device_class))
            self._io.write_u4be(int(self.color_space))
            self._io.write_bytes((self.pcs).encode(u"ASCII"))
            self.creation_date_time._write__seq(self._io)
            self._io.write_bytes(self.file_signature)
            self._io.write_u4be(int(self.primary_platform))
            self.profile_flags._write__seq(self._io)
            self.device_manufacturer._write__seq(self._io)
            self._io.write_bytes((self.device_model).encode(u"ASCII"))
            self.device_attributes._write__seq(self._io)
            self._io.write_u4be(int(self.rendering_intent))
            self.nciexyz_values_of_illuminant_of_pcs._write__seq(self._io)
            self.creator._write__seq(self._io)
            self._io.write_bytes(self.identifier)
            self._io.write_bytes(self.reserved_data)


        def _check(self):
            if self.version._root != self._root:
                raise kaitaistruct.ConsistencyError(u"version", self._root, self.version._root)
            if self.version._parent != self:
                raise kaitaistruct.ConsistencyError(u"version", self, self.version._parent)
            if len((self.pcs).encode(u"ASCII")) != 4:
                raise kaitaistruct.ConsistencyError(u"pcs", 4, len((self.pcs).encode(u"ASCII")))
            if self.creation_date_time._root != self._root:
                raise kaitaistruct.ConsistencyError(u"creation_date_time", self._root, self.creation_date_time._root)
            if self.creation_date_time._parent != self:
                raise kaitaistruct.ConsistencyError(u"creation_date_time", self, self.creation_date_time._parent)
            if len(self.file_signature) != 4:
                raise kaitaistruct.ConsistencyError(u"file_signature", 4, len(self.file_signature))
            if not self.file_signature == b"\x61\x63\x73\x70":
                raise kaitaistruct.ValidationNotEqualError(b"\x61\x63\x73\x70", self.file_signature, None, u"/types/profile_header/seq/7")
            if self.profile_flags._root != self._root:
                raise kaitaistruct.ConsistencyError(u"profile_flags", self._root, self.profile_flags._root)
            if self.profile_flags._parent != self:
                raise kaitaistruct.ConsistencyError(u"profile_flags", self, self.profile_flags._parent)
            if self.device_manufacturer._root != self._root:
                raise kaitaistruct.ConsistencyError(u"device_manufacturer", self._root, self.device_manufacturer._root)
            if self.device_manufacturer._parent != self:
                raise kaitaistruct.ConsistencyError(u"device_manufacturer", self, self.device_manufacturer._parent)
            if len((self.device_model).encode(u"ASCII")) != 4:
                raise kaitaistruct.ConsistencyError(u"device_model", 4, len((self.device_model).encode(u"ASCII")))
            if self.device_attributes._root != self._root:
                raise kaitaistruct.ConsistencyError(u"device_attributes", self._root, self.device_attributes._root)
            if self.device_attributes._parent != self:
                raise kaitaistruct.ConsistencyError(u"device_attributes", self, self.device_attributes._parent)
            if self.nciexyz_values_of_illuminant_of_pcs._root != self._root:
                raise kaitaistruct.ConsistencyError(u"nciexyz_values_of_illuminant_of_pcs", self._root, self.nciexyz_values_of_illuminant_of_pcs._root)
            if self.nciexyz_values_of_illuminant_of_pcs._parent != self:
                raise kaitaistruct.ConsistencyError(u"nciexyz_values_of_illuminant_of_pcs", self, self.nciexyz_values_of_illuminant_of_pcs._parent)
            if self.creator._root != self._root:
                raise kaitaistruct.ConsistencyError(u"creator", self._root, self.creator._root)
            if self.creator._parent != self:
                raise kaitaistruct.ConsistencyError(u"creator", self, self.creator._parent)
            if len(self.identifier) != 16:
                raise kaitaistruct.ConsistencyError(u"identifier", 16, len(self.identifier))
            if len(self.reserved_data) != 28:
                raise kaitaistruct.ConsistencyError(u"reserved_data", 28, len(self.reserved_data))
            self._dirty = False

        class ProfileFlags(ReadWriteKaitaiStruct):
            def __init__(self, _io=None, _parent=None, _root=None):
                super(Icc4.ProfileHeader.ProfileFlags, self).__init__(_io)
                self._parent = _parent
                self._root = _root

            def _read(self):
                self.embedded_profile = self._io.read_bits_int_be(1) != 0
                self.profile_can_be_used_independently_of_embedded_colour_data = self._io.read_bits_int_be(1) != 0
                self.other_flags = self._io.read_bits_int_be(30)
                self._dirty = False


            def _fetch_instances(self):
                pass


            def _write__seq(self, io=None):
                super(Icc4.ProfileHeader.ProfileFlags, self)._write__seq(io)
                self._io.write_bits_int_be(1, int(self.embedded_profile))
                self._io.write_bits_int_be(1, int(self.profile_can_be_used_independently_of_embedded_colour_data))
                self._io.write_bits_int_be(30, self.other_flags)


            def _check(self):
                self._dirty = False


        class VersionField(ReadWriteKaitaiStruct):
            def __init__(self, _io=None, _parent=None, _root=None):
                super(Icc4.ProfileHeader.VersionField, self).__init__(_io)
                self._parent = _parent
                self._root = _root

            def _read(self):
                self.major = self._io.read_bytes(1)
                if not self.major == b"\x04":
                    raise kaitaistruct.ValidationNotEqualError(b"\x04", self.major, self._io, u"/types/profile_header/types/version_field/seq/0")
                self.minor = self._io.read_bits_int_be(4)
                self.bug_fix_level = self._io.read_bits_int_be(4)
                self.reserved = self._io.read_bytes(2)
                if not self.reserved == b"\x00\x00":
                    raise kaitaistruct.ValidationNotEqualError(b"\x00\x00", self.reserved, self._io, u"/types/profile_header/types/version_field/seq/3")
                self._dirty = False


            def _fetch_instances(self):
                pass


            def _write__seq(self, io=None):
                super(Icc4.ProfileHeader.VersionField, self)._write__seq(io)
                self._io.write_bytes(self.major)
                self._io.write_bits_int_be(4, self.minor)
                self._io.write_bits_int_be(4, self.bug_fix_level)
                self._io.write_bytes(self.reserved)


            def _check(self):
                if len(self.major) != 1:
                    raise kaitaistruct.ConsistencyError(u"major", 1, len(self.major))
                if not self.major == b"\x04":
                    raise kaitaistruct.ValidationNotEqualError(b"\x04", self.major, None, u"/types/profile_header/types/version_field/seq/0")
                if len(self.reserved) != 2:
                    raise kaitaistruct.ConsistencyError(u"reserved", 2, len(self.reserved))
                if not self.reserved == b"\x00\x00":
                    raise kaitaistruct.ValidationNotEqualError(b"\x00\x00", self.reserved, None, u"/types/profile_header/types/version_field/seq/3")
                self._dirty = False



    class Response16Number(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Icc4.Response16Number, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.number = self._io.read_u4be()
            self.reserved = self._io.read_bytes(2)
            if not self.reserved == b"\x00\x00":
                raise kaitaistruct.ValidationNotEqualError(b"\x00\x00", self.reserved, self._io, u"/types/response_16_number/seq/1")
            self.measurement_value = Icc4.S15Fixed16Number(self._io, self, self._root)
            self.measurement_value._read()
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.measurement_value._fetch_instances()


        def _write__seq(self, io=None):
            super(Icc4.Response16Number, self)._write__seq(io)
            self._io.write_u4be(self.number)
            self._io.write_bytes(self.reserved)
            self.measurement_value._write__seq(self._io)


        def _check(self):
            if len(self.reserved) != 2:
                raise kaitaistruct.ConsistencyError(u"reserved", 2, len(self.reserved))
            if not self.reserved == b"\x00\x00":
                raise kaitaistruct.ValidationNotEqualError(b"\x00\x00", self.reserved, None, u"/types/response_16_number/seq/1")
            if self.measurement_value._root != self._root:
                raise kaitaistruct.ConsistencyError(u"measurement_value", self._root, self.measurement_value._root)
            if self.measurement_value._parent != self:
                raise kaitaistruct.ConsistencyError(u"measurement_value", self, self.measurement_value._parent)
            self._dirty = False


    class S15Fixed16Number(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Icc4.S15Fixed16Number, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.number = self._io.read_bytes(4)
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(Icc4.S15Fixed16Number, self)._write__seq(io)
            self._io.write_bytes(self.number)


        def _check(self):
            if len(self.number) != 4:
                raise kaitaistruct.ConsistencyError(u"number", 4, len(self.number))
            self._dirty = False


    class StandardIlluminantEncoding(ReadWriteKaitaiStruct):

        class StandardIlluminantEncodings(IntEnum):
            unknown = 0
            d50 = 1
            d65 = 2
            d93 = 3
            f2 = 4
            d55 = 5
            a = 6
            equi_power = 7
            f8 = 8
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Icc4.StandardIlluminantEncoding, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.standard_illuminant_encoding = KaitaiStream.resolve_enum(Icc4.StandardIlluminantEncoding.StandardIlluminantEncodings, self._io.read_u4be())
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(Icc4.StandardIlluminantEncoding, self)._write__seq(io)
            self._io.write_u4be(int(self.standard_illuminant_encoding))


        def _check(self):
            self._dirty = False


    class TagTable(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Icc4.TagTable, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.tag_count = self._io.read_u4be()
            self.tags = []
            for i in range(self.tag_count):
                _t_tags = Icc4.TagTable.TagDefinition(self._io, self, self._root)
                try:
                    _t_tags._read()
                finally:
                    self.tags.append(_t_tags)

            self._dirty = False


        def _fetch_instances(self):
            pass
            for i in range(len(self.tags)):
                pass
                self.tags[i]._fetch_instances()



        def _write__seq(self, io=None):
            super(Icc4.TagTable, self)._write__seq(io)
            self._io.write_u4be(self.tag_count)
            for i in range(len(self.tags)):
                pass
                self.tags[i]._write__seq(self._io)



        def _check(self):
            if len(self.tags) != self.tag_count:
                raise kaitaistruct.ConsistencyError(u"tags", self.tag_count, len(self.tags))
            for i in range(len(self.tags)):
                pass
                if self.tags[i]._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"tags", self._root, self.tags[i]._root)
                if self.tags[i]._parent != self:
                    raise kaitaistruct.ConsistencyError(u"tags", self, self.tags[i]._parent)

            self._dirty = False

        class TagDefinition(ReadWriteKaitaiStruct):

            class MultiProcessElementsTypes(IntEnum):
                bacs_element_type = 1648444243
                clut_element_type = 1668052340
                one_dimensional_curves_type = 1668641382
                eacs_element_type = 1698775891
                matrix_element_type = 1835103334
                curve_set_element_table_type = 1835428980
                formula_curve_segments_type = 1885434470
                sampled_curve_segment_type = 1935764838

            class TagSignatures(IntEnum):
                a_to_b_0 = 1093812784
                a_to_b_1 = 1093812785
                a_to_b_2 = 1093812786
                b_to_a_0 = 1110589744
                b_to_a_1 = 1110589745
                b_to_a_2 = 1110589746
                b_to_d_0 = 1110590512
                b_to_d_1 = 1110590513
                b_to_d_2 = 1110590514
                b_to_d_3 = 1110590515
                d_to_b_0 = 1144144432
                d_to_b_1 = 1144144433
                d_to_b_2 = 1144144434
                d_to_b_3 = 1144144435
                blue_trc = 1649693251
                blue_matrix_column = 1649957210
                calibration_date_time = 1667329140
                chromatic_adaptation = 1667785060
                chromaticity = 1667789421
                colorimetric_intent_image_state = 1667852659
                colorant_table_out = 1668050804
                colorant_order = 1668051567
                colorant_table = 1668051572
                copyright = 1668313716
                profile_description = 1684370275
                device_model_desc = 1684890724
                device_mfg_desc = 1684893284
                green_trc = 1733579331
                green_matrix_column = 1733843290
                gamut = 1734438260
                gray_trc = 1800688195
                luminance = 1819635049
                measurement = 1835360627
                named_color_2 = 1852009522
                preview_0 = 1886545200
                preview_1 = 1886545201
                preview_2 = 1886545202
                profile_sequence = 1886610801
                profile_sequence_identifier = 1886611812
                red_trc = 1918128707
                red_matrix_column = 1918392666
                output_response = 1919251312
                perceptual_rendering_intent_gamut = 1919510320
                saturation_rendering_intent_gamut = 1919510322
                char_target = 1952543335
                technology = 1952801640
                viewing_conditions = 1986618743
                viewing_cond_desc = 1987405156
                media_white_point = 2004119668

            class TagTypeSignatures(IntEnum):
                xyz_type = 1482250784
                chromaticity_type = 1667789421
                colorant_order_type = 1668051567
                colorant_table_type = 1668051572
                curve_type = 1668641398
                data_type = 1684108385
                date_time_type = 1685350765
                multi_function_a_to_b_table_type = 1832993312
                multi_function_b_to_a_table_type = 1833058592
                measurement_type = 1835360627
                multi_function_table_with_one_byte_precision_type = 1835430961
                multi_function_table_with_two_byte_precision_type = 1835430962
                multi_localized_unicode_type = 1835824483
                multi_process_elements_type = 1836082548
                named_color_2_type = 1852009522
                parametric_curve_type = 1885434465
                profile_sequence_desc_type = 1886610801
                profile_sequence_identifier_type = 1886611812
                response_curve_set_16_type = 1919120178
                s_15_fixed_16_array_type = 1936077618
                signature_type = 1936287520
                text_type = 1952807028
                u_16_fixed_16_array_type = 1969632050
                u_int_8_array_type = 1969827896
                u_int_16_array_type = 1969828150
                u_int_32_array_type = 1969828658
                u_int_64_array_type = 1969829428
                viewing_conditions_type = 1986618743
            def __init__(self, _io=None, _parent=None, _root=None):
                super(Icc4.TagTable.TagDefinition, self).__init__(_io)
                self._parent = _parent
                self._root = _root
                self._should_write_tag_data_element = False
                self.tag_data_element__enabled = True

            def _read(self):
                self.tag_signature = KaitaiStream.resolve_enum(Icc4.TagTable.TagDefinition.TagSignatures, self._io.read_u4be())
                self.offset_to_data_element = self._io.read_u4be()
                self.size_of_data_element = self._io.read_u4be()
                self._dirty = False


            def _fetch_instances(self):
                pass
                _ = self.tag_data_element
                if hasattr(self, '_m_tag_data_element'):
                    pass
                    _on = self.tag_signature
                    if _on == Icc4.TagTable.TagDefinition.TagSignatures.a_to_b_0:
                        pass
                        self._m_tag_data_element._fetch_instances()
                    elif _on == Icc4.TagTable.TagDefinition.TagSignatures.a_to_b_1:
                        pass
                        self._m_tag_data_element._fetch_instances()
                    elif _on == Icc4.TagTable.TagDefinition.TagSignatures.a_to_b_2:
                        pass
                        self._m_tag_data_element._fetch_instances()
                    elif _on == Icc4.TagTable.TagDefinition.TagSignatures.b_to_a_0:
                        pass
                        self._m_tag_data_element._fetch_instances()
                    elif _on == Icc4.TagTable.TagDefinition.TagSignatures.b_to_a_1:
                        pass
                        self._m_tag_data_element._fetch_instances()
                    elif _on == Icc4.TagTable.TagDefinition.TagSignatures.b_to_a_2:
                        pass
                        self._m_tag_data_element._fetch_instances()
                    elif _on == Icc4.TagTable.TagDefinition.TagSignatures.b_to_d_0:
                        pass
                        self._m_tag_data_element._fetch_instances()
                    elif _on == Icc4.TagTable.TagDefinition.TagSignatures.b_to_d_1:
                        pass
                        self._m_tag_data_element._fetch_instances()
                    elif _on == Icc4.TagTable.TagDefinition.TagSignatures.b_to_d_2:
                        pass
                        self._m_tag_data_element._fetch_instances()
                    elif _on == Icc4.TagTable.TagDefinition.TagSignatures.b_to_d_3:
                        pass
                        self._m_tag_data_element._fetch_instances()
                    elif _on == Icc4.TagTable.TagDefinition.TagSignatures.blue_matrix_column:
                        pass
                        self._m_tag_data_element._fetch_instances()
                    elif _on == Icc4.TagTable.TagDefinition.TagSignatures.blue_trc:
                        pass
                        self._m_tag_data_element._fetch_instances()
                    elif _on == Icc4.TagTable.TagDefinition.TagSignatures.calibration_date_time:
                        pass
                        self._m_tag_data_element._fetch_instances()
                    elif _on == Icc4.TagTable.TagDefinition.TagSignatures.char_target:
                        pass
                        self._m_tag_data_element._fetch_instances()
                    elif _on == Icc4.TagTable.TagDefinition.TagSignatures.chromatic_adaptation:
                        pass
                        self._m_tag_data_element._fetch_instances()
                    elif _on == Icc4.TagTable.TagDefinition.TagSignatures.chromaticity:
                        pass
                        self._m_tag_data_element._fetch_instances()
                    elif _on == Icc4.TagTable.TagDefinition.TagSignatures.colorant_order:
                        pass
                        self._m_tag_data_element._fetch_instances()
                    elif _on == Icc4.TagTable.TagDefinition.TagSignatures.colorant_table:
                        pass
                        self._m_tag_data_element._fetch_instances()
                    elif _on == Icc4.TagTable.TagDefinition.TagSignatures.colorant_table_out:
                        pass
                        self._m_tag_data_element._fetch_instances()
                    elif _on == Icc4.TagTable.TagDefinition.TagSignatures.colorimetric_intent_image_state:
                        pass
                        self._m_tag_data_element._fetch_instances()
                    elif _on == Icc4.TagTable.TagDefinition.TagSignatures.copyright:
                        pass
                        self._m_tag_data_element._fetch_instances()
                    elif _on == Icc4.TagTable.TagDefinition.TagSignatures.d_to_b_0:
                        pass
                        self._m_tag_data_element._fetch_instances()
                    elif _on == Icc4.TagTable.TagDefinition.TagSignatures.d_to_b_1:
                        pass
                        self._m_tag_data_element._fetch_instances()
                    elif _on == Icc4.TagTable.TagDefinition.TagSignatures.d_to_b_2:
                        pass
                        self._m_tag_data_element._fetch_instances()
                    elif _on == Icc4.TagTable.TagDefinition.TagSignatures.d_to_b_3:
                        pass
                        self._m_tag_data_element._fetch_instances()
                    elif _on == Icc4.TagTable.TagDefinition.TagSignatures.device_mfg_desc:
                        pass
                        self._m_tag_data_element._fetch_instances()
                    elif _on == Icc4.TagTable.TagDefinition.TagSignatures.device_model_desc:
                        pass
                        self._m_tag_data_element._fetch_instances()
                    elif _on == Icc4.TagTable.TagDefinition.TagSignatures.gamut:
                        pass
                        self._m_tag_data_element._fetch_instances()
                    elif _on == Icc4.TagTable.TagDefinition.TagSignatures.gray_trc:
                        pass
                        self._m_tag_data_element._fetch_instances()
                    elif _on == Icc4.TagTable.TagDefinition.TagSignatures.green_matrix_column:
                        pass
                        self._m_tag_data_element._fetch_instances()
                    elif _on == Icc4.TagTable.TagDefinition.TagSignatures.green_trc:
                        pass
                        self._m_tag_data_element._fetch_instances()
                    elif _on == Icc4.TagTable.TagDefinition.TagSignatures.luminance:
                        pass
                        self._m_tag_data_element._fetch_instances()
                    elif _on == Icc4.TagTable.TagDefinition.TagSignatures.measurement:
                        pass
                        self._m_tag_data_element._fetch_instances()
                    elif _on == Icc4.TagTable.TagDefinition.TagSignatures.media_white_point:
                        pass
                        self._m_tag_data_element._fetch_instances()
                    elif _on == Icc4.TagTable.TagDefinition.TagSignatures.named_color_2:
                        pass
                        self._m_tag_data_element._fetch_instances()
                    elif _on == Icc4.TagTable.TagDefinition.TagSignatures.output_response:
                        pass
                        self._m_tag_data_element._fetch_instances()
                    elif _on == Icc4.TagTable.TagDefinition.TagSignatures.perceptual_rendering_intent_gamut:
                        pass
                        self._m_tag_data_element._fetch_instances()
                    elif _on == Icc4.TagTable.TagDefinition.TagSignatures.preview_0:
                        pass
                        self._m_tag_data_element._fetch_instances()
                    elif _on == Icc4.TagTable.TagDefinition.TagSignatures.preview_1:
                        pass
                        self._m_tag_data_element._fetch_instances()
                    elif _on == Icc4.TagTable.TagDefinition.TagSignatures.preview_2:
                        pass
                        self._m_tag_data_element._fetch_instances()
                    elif _on == Icc4.TagTable.TagDefinition.TagSignatures.profile_description:
                        pass
                        self._m_tag_data_element._fetch_instances()
                    elif _on == Icc4.TagTable.TagDefinition.TagSignatures.profile_sequence:
                        pass
                        self._m_tag_data_element._fetch_instances()
                    elif _on == Icc4.TagTable.TagDefinition.TagSignatures.profile_sequence_identifier:
                        pass
                        self._m_tag_data_element._fetch_instances()
                    elif _on == Icc4.TagTable.TagDefinition.TagSignatures.red_matrix_column:
                        pass
                        self._m_tag_data_element._fetch_instances()
                    elif _on == Icc4.TagTable.TagDefinition.TagSignatures.red_trc:
                        pass
                        self._m_tag_data_element._fetch_instances()
                    elif _on == Icc4.TagTable.TagDefinition.TagSignatures.saturation_rendering_intent_gamut:
                        pass
                        self._m_tag_data_element._fetch_instances()
                    elif _on == Icc4.TagTable.TagDefinition.TagSignatures.technology:
                        pass
                        self._m_tag_data_element._fetch_instances()
                    elif _on == Icc4.TagTable.TagDefinition.TagSignatures.viewing_cond_desc:
                        pass
                        self._m_tag_data_element._fetch_instances()
                    elif _on == Icc4.TagTable.TagDefinition.TagSignatures.viewing_conditions:
                        pass
                        self._m_tag_data_element._fetch_instances()
                    else:
                        pass



            def _write__seq(self, io=None):
                super(Icc4.TagTable.TagDefinition, self)._write__seq(io)
                self._should_write_tag_data_element = self.tag_data_element__enabled
                self._io.write_u4be(int(self.tag_signature))
                self._io.write_u4be(self.offset_to_data_element)
                self._io.write_u4be(self.size_of_data_element)


            def _check(self):
                if self.tag_data_element__enabled:
                    pass
                    _on = self.tag_signature
                    if _on == Icc4.TagTable.TagDefinition.TagSignatures.a_to_b_0:
                        pass
                        if self._m_tag_data_element._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"tag_data_element", self._root, self._m_tag_data_element._root)
                        if self._m_tag_data_element._parent != self:
                            raise kaitaistruct.ConsistencyError(u"tag_data_element", self, self._m_tag_data_element._parent)
                    elif _on == Icc4.TagTable.TagDefinition.TagSignatures.a_to_b_1:
                        pass
                        if self._m_tag_data_element._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"tag_data_element", self._root, self._m_tag_data_element._root)
                        if self._m_tag_data_element._parent != self:
                            raise kaitaistruct.ConsistencyError(u"tag_data_element", self, self._m_tag_data_element._parent)
                    elif _on == Icc4.TagTable.TagDefinition.TagSignatures.a_to_b_2:
                        pass
                        if self._m_tag_data_element._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"tag_data_element", self._root, self._m_tag_data_element._root)
                        if self._m_tag_data_element._parent != self:
                            raise kaitaistruct.ConsistencyError(u"tag_data_element", self, self._m_tag_data_element._parent)
                    elif _on == Icc4.TagTable.TagDefinition.TagSignatures.b_to_a_0:
                        pass
                        if self._m_tag_data_element._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"tag_data_element", self._root, self._m_tag_data_element._root)
                        if self._m_tag_data_element._parent != self:
                            raise kaitaistruct.ConsistencyError(u"tag_data_element", self, self._m_tag_data_element._parent)
                    elif _on == Icc4.TagTable.TagDefinition.TagSignatures.b_to_a_1:
                        pass
                        if self._m_tag_data_element._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"tag_data_element", self._root, self._m_tag_data_element._root)
                        if self._m_tag_data_element._parent != self:
                            raise kaitaistruct.ConsistencyError(u"tag_data_element", self, self._m_tag_data_element._parent)
                    elif _on == Icc4.TagTable.TagDefinition.TagSignatures.b_to_a_2:
                        pass
                        if self._m_tag_data_element._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"tag_data_element", self._root, self._m_tag_data_element._root)
                        if self._m_tag_data_element._parent != self:
                            raise kaitaistruct.ConsistencyError(u"tag_data_element", self, self._m_tag_data_element._parent)
                    elif _on == Icc4.TagTable.TagDefinition.TagSignatures.b_to_d_0:
                        pass
                        if self._m_tag_data_element._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"tag_data_element", self._root, self._m_tag_data_element._root)
                        if self._m_tag_data_element._parent != self:
                            raise kaitaistruct.ConsistencyError(u"tag_data_element", self, self._m_tag_data_element._parent)
                    elif _on == Icc4.TagTable.TagDefinition.TagSignatures.b_to_d_1:
                        pass
                        if self._m_tag_data_element._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"tag_data_element", self._root, self._m_tag_data_element._root)
                        if self._m_tag_data_element._parent != self:
                            raise kaitaistruct.ConsistencyError(u"tag_data_element", self, self._m_tag_data_element._parent)
                    elif _on == Icc4.TagTable.TagDefinition.TagSignatures.b_to_d_2:
                        pass
                        if self._m_tag_data_element._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"tag_data_element", self._root, self._m_tag_data_element._root)
                        if self._m_tag_data_element._parent != self:
                            raise kaitaistruct.ConsistencyError(u"tag_data_element", self, self._m_tag_data_element._parent)
                    elif _on == Icc4.TagTable.TagDefinition.TagSignatures.b_to_d_3:
                        pass
                        if self._m_tag_data_element._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"tag_data_element", self._root, self._m_tag_data_element._root)
                        if self._m_tag_data_element._parent != self:
                            raise kaitaistruct.ConsistencyError(u"tag_data_element", self, self._m_tag_data_element._parent)
                    elif _on == Icc4.TagTable.TagDefinition.TagSignatures.blue_matrix_column:
                        pass
                        if self._m_tag_data_element._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"tag_data_element", self._root, self._m_tag_data_element._root)
                        if self._m_tag_data_element._parent != self:
                            raise kaitaistruct.ConsistencyError(u"tag_data_element", self, self._m_tag_data_element._parent)
                    elif _on == Icc4.TagTable.TagDefinition.TagSignatures.blue_trc:
                        pass
                        if self._m_tag_data_element._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"tag_data_element", self._root, self._m_tag_data_element._root)
                        if self._m_tag_data_element._parent != self:
                            raise kaitaistruct.ConsistencyError(u"tag_data_element", self, self._m_tag_data_element._parent)
                    elif _on == Icc4.TagTable.TagDefinition.TagSignatures.calibration_date_time:
                        pass
                        if self._m_tag_data_element._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"tag_data_element", self._root, self._m_tag_data_element._root)
                        if self._m_tag_data_element._parent != self:
                            raise kaitaistruct.ConsistencyError(u"tag_data_element", self, self._m_tag_data_element._parent)
                    elif _on == Icc4.TagTable.TagDefinition.TagSignatures.char_target:
                        pass
                        if self._m_tag_data_element._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"tag_data_element", self._root, self._m_tag_data_element._root)
                        if self._m_tag_data_element._parent != self:
                            raise kaitaistruct.ConsistencyError(u"tag_data_element", self, self._m_tag_data_element._parent)
                    elif _on == Icc4.TagTable.TagDefinition.TagSignatures.chromatic_adaptation:
                        pass
                        if self._m_tag_data_element._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"tag_data_element", self._root, self._m_tag_data_element._root)
                        if self._m_tag_data_element._parent != self:
                            raise kaitaistruct.ConsistencyError(u"tag_data_element", self, self._m_tag_data_element._parent)
                    elif _on == Icc4.TagTable.TagDefinition.TagSignatures.chromaticity:
                        pass
                        if self._m_tag_data_element._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"tag_data_element", self._root, self._m_tag_data_element._root)
                        if self._m_tag_data_element._parent != self:
                            raise kaitaistruct.ConsistencyError(u"tag_data_element", self, self._m_tag_data_element._parent)
                    elif _on == Icc4.TagTable.TagDefinition.TagSignatures.colorant_order:
                        pass
                        if self._m_tag_data_element._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"tag_data_element", self._root, self._m_tag_data_element._root)
                        if self._m_tag_data_element._parent != self:
                            raise kaitaistruct.ConsistencyError(u"tag_data_element", self, self._m_tag_data_element._parent)
                    elif _on == Icc4.TagTable.TagDefinition.TagSignatures.colorant_table:
                        pass
                        if self._m_tag_data_element._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"tag_data_element", self._root, self._m_tag_data_element._root)
                        if self._m_tag_data_element._parent != self:
                            raise kaitaistruct.ConsistencyError(u"tag_data_element", self, self._m_tag_data_element._parent)
                    elif _on == Icc4.TagTable.TagDefinition.TagSignatures.colorant_table_out:
                        pass
                        if self._m_tag_data_element._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"tag_data_element", self._root, self._m_tag_data_element._root)
                        if self._m_tag_data_element._parent != self:
                            raise kaitaistruct.ConsistencyError(u"tag_data_element", self, self._m_tag_data_element._parent)
                    elif _on == Icc4.TagTable.TagDefinition.TagSignatures.colorimetric_intent_image_state:
                        pass
                        if self._m_tag_data_element._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"tag_data_element", self._root, self._m_tag_data_element._root)
                        if self._m_tag_data_element._parent != self:
                            raise kaitaistruct.ConsistencyError(u"tag_data_element", self, self._m_tag_data_element._parent)
                    elif _on == Icc4.TagTable.TagDefinition.TagSignatures.copyright:
                        pass
                        if self._m_tag_data_element._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"tag_data_element", self._root, self._m_tag_data_element._root)
                        if self._m_tag_data_element._parent != self:
                            raise kaitaistruct.ConsistencyError(u"tag_data_element", self, self._m_tag_data_element._parent)
                    elif _on == Icc4.TagTable.TagDefinition.TagSignatures.d_to_b_0:
                        pass
                        if self._m_tag_data_element._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"tag_data_element", self._root, self._m_tag_data_element._root)
                        if self._m_tag_data_element._parent != self:
                            raise kaitaistruct.ConsistencyError(u"tag_data_element", self, self._m_tag_data_element._parent)
                    elif _on == Icc4.TagTable.TagDefinition.TagSignatures.d_to_b_1:
                        pass
                        if self._m_tag_data_element._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"tag_data_element", self._root, self._m_tag_data_element._root)
                        if self._m_tag_data_element._parent != self:
                            raise kaitaistruct.ConsistencyError(u"tag_data_element", self, self._m_tag_data_element._parent)
                    elif _on == Icc4.TagTable.TagDefinition.TagSignatures.d_to_b_2:
                        pass
                        if self._m_tag_data_element._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"tag_data_element", self._root, self._m_tag_data_element._root)
                        if self._m_tag_data_element._parent != self:
                            raise kaitaistruct.ConsistencyError(u"tag_data_element", self, self._m_tag_data_element._parent)
                    elif _on == Icc4.TagTable.TagDefinition.TagSignatures.d_to_b_3:
                        pass
                        if self._m_tag_data_element._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"tag_data_element", self._root, self._m_tag_data_element._root)
                        if self._m_tag_data_element._parent != self:
                            raise kaitaistruct.ConsistencyError(u"tag_data_element", self, self._m_tag_data_element._parent)
                    elif _on == Icc4.TagTable.TagDefinition.TagSignatures.device_mfg_desc:
                        pass
                        if self._m_tag_data_element._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"tag_data_element", self._root, self._m_tag_data_element._root)
                        if self._m_tag_data_element._parent != self:
                            raise kaitaistruct.ConsistencyError(u"tag_data_element", self, self._m_tag_data_element._parent)
                    elif _on == Icc4.TagTable.TagDefinition.TagSignatures.device_model_desc:
                        pass
                        if self._m_tag_data_element._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"tag_data_element", self._root, self._m_tag_data_element._root)
                        if self._m_tag_data_element._parent != self:
                            raise kaitaistruct.ConsistencyError(u"tag_data_element", self, self._m_tag_data_element._parent)
                    elif _on == Icc4.TagTable.TagDefinition.TagSignatures.gamut:
                        pass
                        if self._m_tag_data_element._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"tag_data_element", self._root, self._m_tag_data_element._root)
                        if self._m_tag_data_element._parent != self:
                            raise kaitaistruct.ConsistencyError(u"tag_data_element", self, self._m_tag_data_element._parent)
                    elif _on == Icc4.TagTable.TagDefinition.TagSignatures.gray_trc:
                        pass
                        if self._m_tag_data_element._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"tag_data_element", self._root, self._m_tag_data_element._root)
                        if self._m_tag_data_element._parent != self:
                            raise kaitaistruct.ConsistencyError(u"tag_data_element", self, self._m_tag_data_element._parent)
                    elif _on == Icc4.TagTable.TagDefinition.TagSignatures.green_matrix_column:
                        pass
                        if self._m_tag_data_element._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"tag_data_element", self._root, self._m_tag_data_element._root)
                        if self._m_tag_data_element._parent != self:
                            raise kaitaistruct.ConsistencyError(u"tag_data_element", self, self._m_tag_data_element._parent)
                    elif _on == Icc4.TagTable.TagDefinition.TagSignatures.green_trc:
                        pass
                        if self._m_tag_data_element._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"tag_data_element", self._root, self._m_tag_data_element._root)
                        if self._m_tag_data_element._parent != self:
                            raise kaitaistruct.ConsistencyError(u"tag_data_element", self, self._m_tag_data_element._parent)
                    elif _on == Icc4.TagTable.TagDefinition.TagSignatures.luminance:
                        pass
                        if self._m_tag_data_element._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"tag_data_element", self._root, self._m_tag_data_element._root)
                        if self._m_tag_data_element._parent != self:
                            raise kaitaistruct.ConsistencyError(u"tag_data_element", self, self._m_tag_data_element._parent)
                    elif _on == Icc4.TagTable.TagDefinition.TagSignatures.measurement:
                        pass
                        if self._m_tag_data_element._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"tag_data_element", self._root, self._m_tag_data_element._root)
                        if self._m_tag_data_element._parent != self:
                            raise kaitaistruct.ConsistencyError(u"tag_data_element", self, self._m_tag_data_element._parent)
                    elif _on == Icc4.TagTable.TagDefinition.TagSignatures.media_white_point:
                        pass
                        if self._m_tag_data_element._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"tag_data_element", self._root, self._m_tag_data_element._root)
                        if self._m_tag_data_element._parent != self:
                            raise kaitaistruct.ConsistencyError(u"tag_data_element", self, self._m_tag_data_element._parent)
                    elif _on == Icc4.TagTable.TagDefinition.TagSignatures.named_color_2:
                        pass
                        if self._m_tag_data_element._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"tag_data_element", self._root, self._m_tag_data_element._root)
                        if self._m_tag_data_element._parent != self:
                            raise kaitaistruct.ConsistencyError(u"tag_data_element", self, self._m_tag_data_element._parent)
                    elif _on == Icc4.TagTable.TagDefinition.TagSignatures.output_response:
                        pass
                        if self._m_tag_data_element._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"tag_data_element", self._root, self._m_tag_data_element._root)
                        if self._m_tag_data_element._parent != self:
                            raise kaitaistruct.ConsistencyError(u"tag_data_element", self, self._m_tag_data_element._parent)
                    elif _on == Icc4.TagTable.TagDefinition.TagSignatures.perceptual_rendering_intent_gamut:
                        pass
                        if self._m_tag_data_element._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"tag_data_element", self._root, self._m_tag_data_element._root)
                        if self._m_tag_data_element._parent != self:
                            raise kaitaistruct.ConsistencyError(u"tag_data_element", self, self._m_tag_data_element._parent)
                    elif _on == Icc4.TagTable.TagDefinition.TagSignatures.preview_0:
                        pass
                        if self._m_tag_data_element._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"tag_data_element", self._root, self._m_tag_data_element._root)
                        if self._m_tag_data_element._parent != self:
                            raise kaitaistruct.ConsistencyError(u"tag_data_element", self, self._m_tag_data_element._parent)
                    elif _on == Icc4.TagTable.TagDefinition.TagSignatures.preview_1:
                        pass
                        if self._m_tag_data_element._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"tag_data_element", self._root, self._m_tag_data_element._root)
                        if self._m_tag_data_element._parent != self:
                            raise kaitaistruct.ConsistencyError(u"tag_data_element", self, self._m_tag_data_element._parent)
                    elif _on == Icc4.TagTable.TagDefinition.TagSignatures.preview_2:
                        pass
                        if self._m_tag_data_element._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"tag_data_element", self._root, self._m_tag_data_element._root)
                        if self._m_tag_data_element._parent != self:
                            raise kaitaistruct.ConsistencyError(u"tag_data_element", self, self._m_tag_data_element._parent)
                    elif _on == Icc4.TagTable.TagDefinition.TagSignatures.profile_description:
                        pass
                        if self._m_tag_data_element._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"tag_data_element", self._root, self._m_tag_data_element._root)
                        if self._m_tag_data_element._parent != self:
                            raise kaitaistruct.ConsistencyError(u"tag_data_element", self, self._m_tag_data_element._parent)
                    elif _on == Icc4.TagTable.TagDefinition.TagSignatures.profile_sequence:
                        pass
                        if self._m_tag_data_element._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"tag_data_element", self._root, self._m_tag_data_element._root)
                        if self._m_tag_data_element._parent != self:
                            raise kaitaistruct.ConsistencyError(u"tag_data_element", self, self._m_tag_data_element._parent)
                    elif _on == Icc4.TagTable.TagDefinition.TagSignatures.profile_sequence_identifier:
                        pass
                        if self._m_tag_data_element._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"tag_data_element", self._root, self._m_tag_data_element._root)
                        if self._m_tag_data_element._parent != self:
                            raise kaitaistruct.ConsistencyError(u"tag_data_element", self, self._m_tag_data_element._parent)
                    elif _on == Icc4.TagTable.TagDefinition.TagSignatures.red_matrix_column:
                        pass
                        if self._m_tag_data_element._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"tag_data_element", self._root, self._m_tag_data_element._root)
                        if self._m_tag_data_element._parent != self:
                            raise kaitaistruct.ConsistencyError(u"tag_data_element", self, self._m_tag_data_element._parent)
                    elif _on == Icc4.TagTable.TagDefinition.TagSignatures.red_trc:
                        pass
                        if self._m_tag_data_element._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"tag_data_element", self._root, self._m_tag_data_element._root)
                        if self._m_tag_data_element._parent != self:
                            raise kaitaistruct.ConsistencyError(u"tag_data_element", self, self._m_tag_data_element._parent)
                    elif _on == Icc4.TagTable.TagDefinition.TagSignatures.saturation_rendering_intent_gamut:
                        pass
                        if self._m_tag_data_element._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"tag_data_element", self._root, self._m_tag_data_element._root)
                        if self._m_tag_data_element._parent != self:
                            raise kaitaistruct.ConsistencyError(u"tag_data_element", self, self._m_tag_data_element._parent)
                    elif _on == Icc4.TagTable.TagDefinition.TagSignatures.technology:
                        pass
                        if self._m_tag_data_element._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"tag_data_element", self._root, self._m_tag_data_element._root)
                        if self._m_tag_data_element._parent != self:
                            raise kaitaistruct.ConsistencyError(u"tag_data_element", self, self._m_tag_data_element._parent)
                    elif _on == Icc4.TagTable.TagDefinition.TagSignatures.viewing_cond_desc:
                        pass
                        if self._m_tag_data_element._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"tag_data_element", self._root, self._m_tag_data_element._root)
                        if self._m_tag_data_element._parent != self:
                            raise kaitaistruct.ConsistencyError(u"tag_data_element", self, self._m_tag_data_element._parent)
                    elif _on == Icc4.TagTable.TagDefinition.TagSignatures.viewing_conditions:
                        pass
                        if self._m_tag_data_element._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"tag_data_element", self._root, self._m_tag_data_element._root)
                        if self._m_tag_data_element._parent != self:
                            raise kaitaistruct.ConsistencyError(u"tag_data_element", self, self._m_tag_data_element._parent)
                    else:
                        pass
                        if len(self._m_tag_data_element) != self.size_of_data_element:
                            raise kaitaistruct.ConsistencyError(u"tag_data_element", self.size_of_data_element, len(self._m_tag_data_element))

                self._dirty = False

            class AToB0Tag(ReadWriteKaitaiStruct):
                def __init__(self, _io=None, _parent=None, _root=None):
                    super(Icc4.TagTable.TagDefinition.AToB0Tag, self).__init__(_io)
                    self._parent = _parent
                    self._root = _root

                def _read(self):
                    self.tag_type = KaitaiStream.resolve_enum(Icc4.TagTable.TagDefinition.TagTypeSignatures, self._io.read_u4be())
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.multi_function_a_to_b_table_type:
                        pass
                        self.tag_data = Icc4.TagTable.TagDefinition.LutAToBType(self._io, self, self._root)
                        self.tag_data._read()
                    elif _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.multi_function_table_with_one_byte_precision_type:
                        pass
                        self.tag_data = Icc4.TagTable.TagDefinition.Lut8Type(self._io, self, self._root)
                        self.tag_data._read()
                    elif _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.multi_function_table_with_two_byte_precision_type:
                        pass
                        self.tag_data = Icc4.TagTable.TagDefinition.Lut16Type(self._io, self, self._root)
                        self.tag_data._read()
                    self._dirty = False


                def _fetch_instances(self):
                    pass
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.multi_function_a_to_b_table_type:
                        pass
                        self.tag_data._fetch_instances()
                    elif _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.multi_function_table_with_one_byte_precision_type:
                        pass
                        self.tag_data._fetch_instances()
                    elif _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.multi_function_table_with_two_byte_precision_type:
                        pass
                        self.tag_data._fetch_instances()


                def _write__seq(self, io=None):
                    super(Icc4.TagTable.TagDefinition.AToB0Tag, self)._write__seq(io)
                    self._io.write_u4be(int(self.tag_type))
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.multi_function_a_to_b_table_type:
                        pass
                        self.tag_data._write__seq(self._io)
                    elif _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.multi_function_table_with_one_byte_precision_type:
                        pass
                        self.tag_data._write__seq(self._io)
                    elif _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.multi_function_table_with_two_byte_precision_type:
                        pass
                        self.tag_data._write__seq(self._io)


                def _check(self):
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.multi_function_a_to_b_table_type:
                        pass
                        if self.tag_data._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"tag_data", self._root, self.tag_data._root)
                        if self.tag_data._parent != self:
                            raise kaitaistruct.ConsistencyError(u"tag_data", self, self.tag_data._parent)
                    elif _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.multi_function_table_with_one_byte_precision_type:
                        pass
                        if self.tag_data._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"tag_data", self._root, self.tag_data._root)
                        if self.tag_data._parent != self:
                            raise kaitaistruct.ConsistencyError(u"tag_data", self, self.tag_data._parent)
                    elif _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.multi_function_table_with_two_byte_precision_type:
                        pass
                        if self.tag_data._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"tag_data", self._root, self.tag_data._root)
                        if self.tag_data._parent != self:
                            raise kaitaistruct.ConsistencyError(u"tag_data", self, self.tag_data._parent)
                    self._dirty = False


            class AToB1Tag(ReadWriteKaitaiStruct):
                def __init__(self, _io=None, _parent=None, _root=None):
                    super(Icc4.TagTable.TagDefinition.AToB1Tag, self).__init__(_io)
                    self._parent = _parent
                    self._root = _root

                def _read(self):
                    self.tag_type = KaitaiStream.resolve_enum(Icc4.TagTable.TagDefinition.TagTypeSignatures, self._io.read_u4be())
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.multi_function_a_to_b_table_type:
                        pass
                        self.tag_data = Icc4.TagTable.TagDefinition.LutAToBType(self._io, self, self._root)
                        self.tag_data._read()
                    elif _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.multi_function_table_with_one_byte_precision_type:
                        pass
                        self.tag_data = Icc4.TagTable.TagDefinition.Lut8Type(self._io, self, self._root)
                        self.tag_data._read()
                    elif _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.multi_function_table_with_two_byte_precision_type:
                        pass
                        self.tag_data = Icc4.TagTable.TagDefinition.Lut16Type(self._io, self, self._root)
                        self.tag_data._read()
                    self._dirty = False


                def _fetch_instances(self):
                    pass
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.multi_function_a_to_b_table_type:
                        pass
                        self.tag_data._fetch_instances()
                    elif _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.multi_function_table_with_one_byte_precision_type:
                        pass
                        self.tag_data._fetch_instances()
                    elif _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.multi_function_table_with_two_byte_precision_type:
                        pass
                        self.tag_data._fetch_instances()


                def _write__seq(self, io=None):
                    super(Icc4.TagTable.TagDefinition.AToB1Tag, self)._write__seq(io)
                    self._io.write_u4be(int(self.tag_type))
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.multi_function_a_to_b_table_type:
                        pass
                        self.tag_data._write__seq(self._io)
                    elif _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.multi_function_table_with_one_byte_precision_type:
                        pass
                        self.tag_data._write__seq(self._io)
                    elif _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.multi_function_table_with_two_byte_precision_type:
                        pass
                        self.tag_data._write__seq(self._io)


                def _check(self):
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.multi_function_a_to_b_table_type:
                        pass
                        if self.tag_data._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"tag_data", self._root, self.tag_data._root)
                        if self.tag_data._parent != self:
                            raise kaitaistruct.ConsistencyError(u"tag_data", self, self.tag_data._parent)
                    elif _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.multi_function_table_with_one_byte_precision_type:
                        pass
                        if self.tag_data._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"tag_data", self._root, self.tag_data._root)
                        if self.tag_data._parent != self:
                            raise kaitaistruct.ConsistencyError(u"tag_data", self, self.tag_data._parent)
                    elif _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.multi_function_table_with_two_byte_precision_type:
                        pass
                        if self.tag_data._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"tag_data", self._root, self.tag_data._root)
                        if self.tag_data._parent != self:
                            raise kaitaistruct.ConsistencyError(u"tag_data", self, self.tag_data._parent)
                    self._dirty = False


            class AToB2Tag(ReadWriteKaitaiStruct):
                def __init__(self, _io=None, _parent=None, _root=None):
                    super(Icc4.TagTable.TagDefinition.AToB2Tag, self).__init__(_io)
                    self._parent = _parent
                    self._root = _root

                def _read(self):
                    self.tag_type = KaitaiStream.resolve_enum(Icc4.TagTable.TagDefinition.TagTypeSignatures, self._io.read_u4be())
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.multi_function_a_to_b_table_type:
                        pass
                        self.tag_data = Icc4.TagTable.TagDefinition.LutAToBType(self._io, self, self._root)
                        self.tag_data._read()
                    elif _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.multi_function_table_with_one_byte_precision_type:
                        pass
                        self.tag_data = Icc4.TagTable.TagDefinition.Lut8Type(self._io, self, self._root)
                        self.tag_data._read()
                    elif _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.multi_function_table_with_two_byte_precision_type:
                        pass
                        self.tag_data = Icc4.TagTable.TagDefinition.Lut16Type(self._io, self, self._root)
                        self.tag_data._read()
                    self._dirty = False


                def _fetch_instances(self):
                    pass
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.multi_function_a_to_b_table_type:
                        pass
                        self.tag_data._fetch_instances()
                    elif _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.multi_function_table_with_one_byte_precision_type:
                        pass
                        self.tag_data._fetch_instances()
                    elif _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.multi_function_table_with_two_byte_precision_type:
                        pass
                        self.tag_data._fetch_instances()


                def _write__seq(self, io=None):
                    super(Icc4.TagTable.TagDefinition.AToB2Tag, self)._write__seq(io)
                    self._io.write_u4be(int(self.tag_type))
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.multi_function_a_to_b_table_type:
                        pass
                        self.tag_data._write__seq(self._io)
                    elif _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.multi_function_table_with_one_byte_precision_type:
                        pass
                        self.tag_data._write__seq(self._io)
                    elif _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.multi_function_table_with_two_byte_precision_type:
                        pass
                        self.tag_data._write__seq(self._io)


                def _check(self):
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.multi_function_a_to_b_table_type:
                        pass
                        if self.tag_data._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"tag_data", self._root, self.tag_data._root)
                        if self.tag_data._parent != self:
                            raise kaitaistruct.ConsistencyError(u"tag_data", self, self.tag_data._parent)
                    elif _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.multi_function_table_with_one_byte_precision_type:
                        pass
                        if self.tag_data._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"tag_data", self._root, self.tag_data._root)
                        if self.tag_data._parent != self:
                            raise kaitaistruct.ConsistencyError(u"tag_data", self, self.tag_data._parent)
                    elif _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.multi_function_table_with_two_byte_precision_type:
                        pass
                        if self.tag_data._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"tag_data", self._root, self.tag_data._root)
                        if self.tag_data._parent != self:
                            raise kaitaistruct.ConsistencyError(u"tag_data", self, self.tag_data._parent)
                    self._dirty = False


            class BToA0Tag(ReadWriteKaitaiStruct):
                def __init__(self, _io=None, _parent=None, _root=None):
                    super(Icc4.TagTable.TagDefinition.BToA0Tag, self).__init__(_io)
                    self._parent = _parent
                    self._root = _root

                def _read(self):
                    self.tag_type = KaitaiStream.resolve_enum(Icc4.TagTable.TagDefinition.TagTypeSignatures, self._io.read_u4be())
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.multi_function_b_to_a_table_type:
                        pass
                        self.tag_data = Icc4.TagTable.TagDefinition.LutBToAType(self._io, self, self._root)
                        self.tag_data._read()
                    elif _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.multi_function_table_with_one_byte_precision_type:
                        pass
                        self.tag_data = Icc4.TagTable.TagDefinition.Lut8Type(self._io, self, self._root)
                        self.tag_data._read()
                    elif _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.multi_function_table_with_two_byte_precision_type:
                        pass
                        self.tag_data = Icc4.TagTable.TagDefinition.Lut16Type(self._io, self, self._root)
                        self.tag_data._read()
                    self._dirty = False


                def _fetch_instances(self):
                    pass
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.multi_function_b_to_a_table_type:
                        pass
                        self.tag_data._fetch_instances()
                    elif _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.multi_function_table_with_one_byte_precision_type:
                        pass
                        self.tag_data._fetch_instances()
                    elif _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.multi_function_table_with_two_byte_precision_type:
                        pass
                        self.tag_data._fetch_instances()


                def _write__seq(self, io=None):
                    super(Icc4.TagTable.TagDefinition.BToA0Tag, self)._write__seq(io)
                    self._io.write_u4be(int(self.tag_type))
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.multi_function_b_to_a_table_type:
                        pass
                        self.tag_data._write__seq(self._io)
                    elif _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.multi_function_table_with_one_byte_precision_type:
                        pass
                        self.tag_data._write__seq(self._io)
                    elif _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.multi_function_table_with_two_byte_precision_type:
                        pass
                        self.tag_data._write__seq(self._io)


                def _check(self):
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.multi_function_b_to_a_table_type:
                        pass
                        if self.tag_data._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"tag_data", self._root, self.tag_data._root)
                        if self.tag_data._parent != self:
                            raise kaitaistruct.ConsistencyError(u"tag_data", self, self.tag_data._parent)
                    elif _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.multi_function_table_with_one_byte_precision_type:
                        pass
                        if self.tag_data._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"tag_data", self._root, self.tag_data._root)
                        if self.tag_data._parent != self:
                            raise kaitaistruct.ConsistencyError(u"tag_data", self, self.tag_data._parent)
                    elif _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.multi_function_table_with_two_byte_precision_type:
                        pass
                        if self.tag_data._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"tag_data", self._root, self.tag_data._root)
                        if self.tag_data._parent != self:
                            raise kaitaistruct.ConsistencyError(u"tag_data", self, self.tag_data._parent)
                    self._dirty = False


            class BToA1Tag(ReadWriteKaitaiStruct):
                def __init__(self, _io=None, _parent=None, _root=None):
                    super(Icc4.TagTable.TagDefinition.BToA1Tag, self).__init__(_io)
                    self._parent = _parent
                    self._root = _root

                def _read(self):
                    self.tag_type = KaitaiStream.resolve_enum(Icc4.TagTable.TagDefinition.TagTypeSignatures, self._io.read_u4be())
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.multi_function_b_to_a_table_type:
                        pass
                        self.tag_data = Icc4.TagTable.TagDefinition.LutBToAType(self._io, self, self._root)
                        self.tag_data._read()
                    elif _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.multi_function_table_with_one_byte_precision_type:
                        pass
                        self.tag_data = Icc4.TagTable.TagDefinition.Lut8Type(self._io, self, self._root)
                        self.tag_data._read()
                    elif _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.multi_function_table_with_two_byte_precision_type:
                        pass
                        self.tag_data = Icc4.TagTable.TagDefinition.Lut16Type(self._io, self, self._root)
                        self.tag_data._read()
                    self._dirty = False


                def _fetch_instances(self):
                    pass
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.multi_function_b_to_a_table_type:
                        pass
                        self.tag_data._fetch_instances()
                    elif _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.multi_function_table_with_one_byte_precision_type:
                        pass
                        self.tag_data._fetch_instances()
                    elif _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.multi_function_table_with_two_byte_precision_type:
                        pass
                        self.tag_data._fetch_instances()


                def _write__seq(self, io=None):
                    super(Icc4.TagTable.TagDefinition.BToA1Tag, self)._write__seq(io)
                    self._io.write_u4be(int(self.tag_type))
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.multi_function_b_to_a_table_type:
                        pass
                        self.tag_data._write__seq(self._io)
                    elif _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.multi_function_table_with_one_byte_precision_type:
                        pass
                        self.tag_data._write__seq(self._io)
                    elif _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.multi_function_table_with_two_byte_precision_type:
                        pass
                        self.tag_data._write__seq(self._io)


                def _check(self):
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.multi_function_b_to_a_table_type:
                        pass
                        if self.tag_data._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"tag_data", self._root, self.tag_data._root)
                        if self.tag_data._parent != self:
                            raise kaitaistruct.ConsistencyError(u"tag_data", self, self.tag_data._parent)
                    elif _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.multi_function_table_with_one_byte_precision_type:
                        pass
                        if self.tag_data._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"tag_data", self._root, self.tag_data._root)
                        if self.tag_data._parent != self:
                            raise kaitaistruct.ConsistencyError(u"tag_data", self, self.tag_data._parent)
                    elif _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.multi_function_table_with_two_byte_precision_type:
                        pass
                        if self.tag_data._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"tag_data", self._root, self.tag_data._root)
                        if self.tag_data._parent != self:
                            raise kaitaistruct.ConsistencyError(u"tag_data", self, self.tag_data._parent)
                    self._dirty = False


            class BToA2Tag(ReadWriteKaitaiStruct):
                def __init__(self, _io=None, _parent=None, _root=None):
                    super(Icc4.TagTable.TagDefinition.BToA2Tag, self).__init__(_io)
                    self._parent = _parent
                    self._root = _root

                def _read(self):
                    self.tag_type = KaitaiStream.resolve_enum(Icc4.TagTable.TagDefinition.TagTypeSignatures, self._io.read_u4be())
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.multi_function_b_to_a_table_type:
                        pass
                        self.tag_data = Icc4.TagTable.TagDefinition.LutBToAType(self._io, self, self._root)
                        self.tag_data._read()
                    elif _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.multi_function_table_with_one_byte_precision_type:
                        pass
                        self.tag_data = Icc4.TagTable.TagDefinition.Lut8Type(self._io, self, self._root)
                        self.tag_data._read()
                    elif _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.multi_function_table_with_two_byte_precision_type:
                        pass
                        self.tag_data = Icc4.TagTable.TagDefinition.Lut16Type(self._io, self, self._root)
                        self.tag_data._read()
                    self._dirty = False


                def _fetch_instances(self):
                    pass
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.multi_function_b_to_a_table_type:
                        pass
                        self.tag_data._fetch_instances()
                    elif _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.multi_function_table_with_one_byte_precision_type:
                        pass
                        self.tag_data._fetch_instances()
                    elif _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.multi_function_table_with_two_byte_precision_type:
                        pass
                        self.tag_data._fetch_instances()


                def _write__seq(self, io=None):
                    super(Icc4.TagTable.TagDefinition.BToA2Tag, self)._write__seq(io)
                    self._io.write_u4be(int(self.tag_type))
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.multi_function_b_to_a_table_type:
                        pass
                        self.tag_data._write__seq(self._io)
                    elif _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.multi_function_table_with_one_byte_precision_type:
                        pass
                        self.tag_data._write__seq(self._io)
                    elif _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.multi_function_table_with_two_byte_precision_type:
                        pass
                        self.tag_data._write__seq(self._io)


                def _check(self):
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.multi_function_b_to_a_table_type:
                        pass
                        if self.tag_data._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"tag_data", self._root, self.tag_data._root)
                        if self.tag_data._parent != self:
                            raise kaitaistruct.ConsistencyError(u"tag_data", self, self.tag_data._parent)
                    elif _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.multi_function_table_with_one_byte_precision_type:
                        pass
                        if self.tag_data._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"tag_data", self._root, self.tag_data._root)
                        if self.tag_data._parent != self:
                            raise kaitaistruct.ConsistencyError(u"tag_data", self, self.tag_data._parent)
                    elif _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.multi_function_table_with_two_byte_precision_type:
                        pass
                        if self.tag_data._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"tag_data", self._root, self.tag_data._root)
                        if self.tag_data._parent != self:
                            raise kaitaistruct.ConsistencyError(u"tag_data", self, self.tag_data._parent)
                    self._dirty = False


            class BToD0Tag(ReadWriteKaitaiStruct):
                def __init__(self, _io=None, _parent=None, _root=None):
                    super(Icc4.TagTable.TagDefinition.BToD0Tag, self).__init__(_io)
                    self._parent = _parent
                    self._root = _root

                def _read(self):
                    self.tag_type = KaitaiStream.resolve_enum(Icc4.TagTable.TagDefinition.TagTypeSignatures, self._io.read_u4be())
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.multi_process_elements_type:
                        pass
                        self.tag_data = Icc4.TagTable.TagDefinition.MultiProcessElementsType(self._io, self, self._root)
                        self.tag_data._read()
                    self._dirty = False


                def _fetch_instances(self):
                    pass
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.multi_process_elements_type:
                        pass
                        self.tag_data._fetch_instances()


                def _write__seq(self, io=None):
                    super(Icc4.TagTable.TagDefinition.BToD0Tag, self)._write__seq(io)
                    self._io.write_u4be(int(self.tag_type))
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.multi_process_elements_type:
                        pass
                        self.tag_data._write__seq(self._io)


                def _check(self):
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.multi_process_elements_type:
                        pass
                        if self.tag_data._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"tag_data", self._root, self.tag_data._root)
                        if self.tag_data._parent != self:
                            raise kaitaistruct.ConsistencyError(u"tag_data", self, self.tag_data._parent)
                    self._dirty = False


            class BToD1Tag(ReadWriteKaitaiStruct):
                def __init__(self, _io=None, _parent=None, _root=None):
                    super(Icc4.TagTable.TagDefinition.BToD1Tag, self).__init__(_io)
                    self._parent = _parent
                    self._root = _root

                def _read(self):
                    self.tag_type = KaitaiStream.resolve_enum(Icc4.TagTable.TagDefinition.TagTypeSignatures, self._io.read_u4be())
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.multi_process_elements_type:
                        pass
                        self.tag_data = Icc4.TagTable.TagDefinition.MultiProcessElementsType(self._io, self, self._root)
                        self.tag_data._read()
                    self._dirty = False


                def _fetch_instances(self):
                    pass
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.multi_process_elements_type:
                        pass
                        self.tag_data._fetch_instances()


                def _write__seq(self, io=None):
                    super(Icc4.TagTable.TagDefinition.BToD1Tag, self)._write__seq(io)
                    self._io.write_u4be(int(self.tag_type))
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.multi_process_elements_type:
                        pass
                        self.tag_data._write__seq(self._io)


                def _check(self):
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.multi_process_elements_type:
                        pass
                        if self.tag_data._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"tag_data", self._root, self.tag_data._root)
                        if self.tag_data._parent != self:
                            raise kaitaistruct.ConsistencyError(u"tag_data", self, self.tag_data._parent)
                    self._dirty = False


            class BToD2Tag(ReadWriteKaitaiStruct):
                def __init__(self, _io=None, _parent=None, _root=None):
                    super(Icc4.TagTable.TagDefinition.BToD2Tag, self).__init__(_io)
                    self._parent = _parent
                    self._root = _root

                def _read(self):
                    self.tag_type = KaitaiStream.resolve_enum(Icc4.TagTable.TagDefinition.TagTypeSignatures, self._io.read_u4be())
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.multi_process_elements_type:
                        pass
                        self.tag_data = Icc4.TagTable.TagDefinition.MultiProcessElementsType(self._io, self, self._root)
                        self.tag_data._read()
                    self._dirty = False


                def _fetch_instances(self):
                    pass
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.multi_process_elements_type:
                        pass
                        self.tag_data._fetch_instances()


                def _write__seq(self, io=None):
                    super(Icc4.TagTable.TagDefinition.BToD2Tag, self)._write__seq(io)
                    self._io.write_u4be(int(self.tag_type))
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.multi_process_elements_type:
                        pass
                        self.tag_data._write__seq(self._io)


                def _check(self):
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.multi_process_elements_type:
                        pass
                        if self.tag_data._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"tag_data", self._root, self.tag_data._root)
                        if self.tag_data._parent != self:
                            raise kaitaistruct.ConsistencyError(u"tag_data", self, self.tag_data._parent)
                    self._dirty = False


            class BToD3Tag(ReadWriteKaitaiStruct):
                def __init__(self, _io=None, _parent=None, _root=None):
                    super(Icc4.TagTable.TagDefinition.BToD3Tag, self).__init__(_io)
                    self._parent = _parent
                    self._root = _root

                def _read(self):
                    self.tag_type = KaitaiStream.resolve_enum(Icc4.TagTable.TagDefinition.TagTypeSignatures, self._io.read_u4be())
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.multi_process_elements_type:
                        pass
                        self.tag_data = Icc4.TagTable.TagDefinition.MultiProcessElementsType(self._io, self, self._root)
                        self.tag_data._read()
                    self._dirty = False


                def _fetch_instances(self):
                    pass
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.multi_process_elements_type:
                        pass
                        self.tag_data._fetch_instances()


                def _write__seq(self, io=None):
                    super(Icc4.TagTable.TagDefinition.BToD3Tag, self)._write__seq(io)
                    self._io.write_u4be(int(self.tag_type))
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.multi_process_elements_type:
                        pass
                        self.tag_data._write__seq(self._io)


                def _check(self):
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.multi_process_elements_type:
                        pass
                        if self.tag_data._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"tag_data", self._root, self.tag_data._root)
                        if self.tag_data._parent != self:
                            raise kaitaistruct.ConsistencyError(u"tag_data", self, self.tag_data._parent)
                    self._dirty = False


            class BlueMatrixColumnTag(ReadWriteKaitaiStruct):
                def __init__(self, _io=None, _parent=None, _root=None):
                    super(Icc4.TagTable.TagDefinition.BlueMatrixColumnTag, self).__init__(_io)
                    self._parent = _parent
                    self._root = _root

                def _read(self):
                    self.tag_type = KaitaiStream.resolve_enum(Icc4.TagTable.TagDefinition.TagTypeSignatures, self._io.read_u4be())
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.xyz_type:
                        pass
                        self.tag_data = Icc4.TagTable.TagDefinition.XyzType(self._io, self, self._root)
                        self.tag_data._read()
                    self._dirty = False


                def _fetch_instances(self):
                    pass
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.xyz_type:
                        pass
                        self.tag_data._fetch_instances()


                def _write__seq(self, io=None):
                    super(Icc4.TagTable.TagDefinition.BlueMatrixColumnTag, self)._write__seq(io)
                    self._io.write_u4be(int(self.tag_type))
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.xyz_type:
                        pass
                        self.tag_data._write__seq(self._io)


                def _check(self):
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.xyz_type:
                        pass
                        if self.tag_data._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"tag_data", self._root, self.tag_data._root)
                        if self.tag_data._parent != self:
                            raise kaitaistruct.ConsistencyError(u"tag_data", self, self.tag_data._parent)
                    self._dirty = False


            class BlueTrcTag(ReadWriteKaitaiStruct):
                def __init__(self, _io=None, _parent=None, _root=None):
                    super(Icc4.TagTable.TagDefinition.BlueTrcTag, self).__init__(_io)
                    self._parent = _parent
                    self._root = _root

                def _read(self):
                    self.tag_type = KaitaiStream.resolve_enum(Icc4.TagTable.TagDefinition.TagTypeSignatures, self._io.read_u4be())
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.curve_type:
                        pass
                        self.tag_data = Icc4.TagTable.TagDefinition.CurveType(self._io, self, self._root)
                        self.tag_data._read()
                    elif _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.parametric_curve_type:
                        pass
                        self.tag_data = Icc4.TagTable.TagDefinition.ParametricCurveType(self._io, self, self._root)
                        self.tag_data._read()
                    self._dirty = False


                def _fetch_instances(self):
                    pass
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.curve_type:
                        pass
                        self.tag_data._fetch_instances()
                    elif _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.parametric_curve_type:
                        pass
                        self.tag_data._fetch_instances()


                def _write__seq(self, io=None):
                    super(Icc4.TagTable.TagDefinition.BlueTrcTag, self)._write__seq(io)
                    self._io.write_u4be(int(self.tag_type))
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.curve_type:
                        pass
                        self.tag_data._write__seq(self._io)
                    elif _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.parametric_curve_type:
                        pass
                        self.tag_data._write__seq(self._io)


                def _check(self):
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.curve_type:
                        pass
                        if self.tag_data._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"tag_data", self._root, self.tag_data._root)
                        if self.tag_data._parent != self:
                            raise kaitaistruct.ConsistencyError(u"tag_data", self, self.tag_data._parent)
                    elif _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.parametric_curve_type:
                        pass
                        if self.tag_data._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"tag_data", self._root, self.tag_data._root)
                        if self.tag_data._parent != self:
                            raise kaitaistruct.ConsistencyError(u"tag_data", self, self.tag_data._parent)
                    self._dirty = False


            class CalibrationDateTimeTag(ReadWriteKaitaiStruct):
                def __init__(self, _io=None, _parent=None, _root=None):
                    super(Icc4.TagTable.TagDefinition.CalibrationDateTimeTag, self).__init__(_io)
                    self._parent = _parent
                    self._root = _root

                def _read(self):
                    self.tag_type = KaitaiStream.resolve_enum(Icc4.TagTable.TagDefinition.TagTypeSignatures, self._io.read_u4be())
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.date_time_type:
                        pass
                        self.tag_data = Icc4.TagTable.TagDefinition.DateTimeType(self._io, self, self._root)
                        self.tag_data._read()
                    self._dirty = False


                def _fetch_instances(self):
                    pass
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.date_time_type:
                        pass
                        self.tag_data._fetch_instances()


                def _write__seq(self, io=None):
                    super(Icc4.TagTable.TagDefinition.CalibrationDateTimeTag, self)._write__seq(io)
                    self._io.write_u4be(int(self.tag_type))
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.date_time_type:
                        pass
                        self.tag_data._write__seq(self._io)


                def _check(self):
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.date_time_type:
                        pass
                        if self.tag_data._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"tag_data", self._root, self.tag_data._root)
                        if self.tag_data._parent != self:
                            raise kaitaistruct.ConsistencyError(u"tag_data", self, self.tag_data._parent)
                    self._dirty = False


            class CharTargetTag(ReadWriteKaitaiStruct):
                def __init__(self, _io=None, _parent=None, _root=None):
                    super(Icc4.TagTable.TagDefinition.CharTargetTag, self).__init__(_io)
                    self._parent = _parent
                    self._root = _root

                def _read(self):
                    self.tag_type = KaitaiStream.resolve_enum(Icc4.TagTable.TagDefinition.TagTypeSignatures, self._io.read_u4be())
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.text_type:
                        pass
                        self.tag_data = Icc4.TagTable.TagDefinition.TextType(self._io, self, self._root)
                        self.tag_data._read()
                    self._dirty = False


                def _fetch_instances(self):
                    pass
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.text_type:
                        pass
                        self.tag_data._fetch_instances()


                def _write__seq(self, io=None):
                    super(Icc4.TagTable.TagDefinition.CharTargetTag, self)._write__seq(io)
                    self._io.write_u4be(int(self.tag_type))
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.text_type:
                        pass
                        self.tag_data._write__seq(self._io)


                def _check(self):
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.text_type:
                        pass
                        if self.tag_data._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"tag_data", self._root, self.tag_data._root)
                        if self.tag_data._parent != self:
                            raise kaitaistruct.ConsistencyError(u"tag_data", self, self.tag_data._parent)
                    self._dirty = False


            class ChromaticAdaptationTag(ReadWriteKaitaiStruct):
                def __init__(self, _io=None, _parent=None, _root=None):
                    super(Icc4.TagTable.TagDefinition.ChromaticAdaptationTag, self).__init__(_io)
                    self._parent = _parent
                    self._root = _root

                def _read(self):
                    self.tag_type = KaitaiStream.resolve_enum(Icc4.TagTable.TagDefinition.TagTypeSignatures, self._io.read_u4be())
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.s_15_fixed_16_array_type:
                        pass
                        self.tag_data = Icc4.TagTable.TagDefinition.S15Fixed16ArrayType(self._io, self, self._root)
                        self.tag_data._read()
                    self._dirty = False


                def _fetch_instances(self):
                    pass
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.s_15_fixed_16_array_type:
                        pass
                        self.tag_data._fetch_instances()


                def _write__seq(self, io=None):
                    super(Icc4.TagTable.TagDefinition.ChromaticAdaptationTag, self)._write__seq(io)
                    self._io.write_u4be(int(self.tag_type))
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.s_15_fixed_16_array_type:
                        pass
                        self.tag_data._write__seq(self._io)


                def _check(self):
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.s_15_fixed_16_array_type:
                        pass
                        if self.tag_data._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"tag_data", self._root, self.tag_data._root)
                        if self.tag_data._parent != self:
                            raise kaitaistruct.ConsistencyError(u"tag_data", self, self.tag_data._parent)
                    self._dirty = False


            class ChromaticityTag(ReadWriteKaitaiStruct):
                def __init__(self, _io=None, _parent=None, _root=None):
                    super(Icc4.TagTable.TagDefinition.ChromaticityTag, self).__init__(_io)
                    self._parent = _parent
                    self._root = _root

                def _read(self):
                    self.tag_type = KaitaiStream.resolve_enum(Icc4.TagTable.TagDefinition.TagTypeSignatures, self._io.read_u4be())
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.chromaticity_type:
                        pass
                        self.tag_data = Icc4.TagTable.TagDefinition.ChromaticityType(self._io, self, self._root)
                        self.tag_data._read()
                    self._dirty = False


                def _fetch_instances(self):
                    pass
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.chromaticity_type:
                        pass
                        self.tag_data._fetch_instances()


                def _write__seq(self, io=None):
                    super(Icc4.TagTable.TagDefinition.ChromaticityTag, self)._write__seq(io)
                    self._io.write_u4be(int(self.tag_type))
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.chromaticity_type:
                        pass
                        self.tag_data._write__seq(self._io)


                def _check(self):
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.chromaticity_type:
                        pass
                        if self.tag_data._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"tag_data", self._root, self.tag_data._root)
                        if self.tag_data._parent != self:
                            raise kaitaistruct.ConsistencyError(u"tag_data", self, self.tag_data._parent)
                    self._dirty = False


            class ChromaticityType(ReadWriteKaitaiStruct):

                class ColorantAndPhosphorEncodings(IntEnum):
                    unknown = 0
                    itu_r_bt_709_2 = 1
                    smpte_rp145 = 2
                    ebu_tech_3213_e = 3
                    p22 = 4
                def __init__(self, _io=None, _parent=None, _root=None):
                    super(Icc4.TagTable.TagDefinition.ChromaticityType, self).__init__(_io)
                    self._parent = _parent
                    self._root = _root

                def _read(self):
                    self.reserved = self._io.read_bytes(4)
                    if not self.reserved == b"\x00\x00\x00\x00":
                        raise kaitaistruct.ValidationNotEqualError(b"\x00\x00\x00\x00", self.reserved, self._io, u"/types/tag_table/types/tag_definition/types/chromaticity_type/seq/0")
                    self.number_of_device_channels = self._io.read_u2be()
                    self.colorant_and_phosphor_encoding = KaitaiStream.resolve_enum(Icc4.TagTable.TagDefinition.ChromaticityType.ColorantAndPhosphorEncodings, self._io.read_u2be())
                    self.ciexy_coordinates_per_channel = []
                    for i in range(self.number_of_device_channels):
                        _t_ciexy_coordinates_per_channel = Icc4.TagTable.TagDefinition.ChromaticityType.CiexyCoordinateValues(self._io, self, self._root)
                        try:
                            _t_ciexy_coordinates_per_channel._read()
                        finally:
                            self.ciexy_coordinates_per_channel.append(_t_ciexy_coordinates_per_channel)

                    self._dirty = False


                def _fetch_instances(self):
                    pass
                    for i in range(len(self.ciexy_coordinates_per_channel)):
                        pass
                        self.ciexy_coordinates_per_channel[i]._fetch_instances()



                def _write__seq(self, io=None):
                    super(Icc4.TagTable.TagDefinition.ChromaticityType, self)._write__seq(io)
                    self._io.write_bytes(self.reserved)
                    self._io.write_u2be(self.number_of_device_channels)
                    self._io.write_u2be(int(self.colorant_and_phosphor_encoding))
                    for i in range(len(self.ciexy_coordinates_per_channel)):
                        pass
                        self.ciexy_coordinates_per_channel[i]._write__seq(self._io)



                def _check(self):
                    if len(self.reserved) != 4:
                        raise kaitaistruct.ConsistencyError(u"reserved", 4, len(self.reserved))
                    if not self.reserved == b"\x00\x00\x00\x00":
                        raise kaitaistruct.ValidationNotEqualError(b"\x00\x00\x00\x00", self.reserved, None, u"/types/tag_table/types/tag_definition/types/chromaticity_type/seq/0")
                    if len(self.ciexy_coordinates_per_channel) != self.number_of_device_channels:
                        raise kaitaistruct.ConsistencyError(u"ciexy_coordinates_per_channel", self.number_of_device_channels, len(self.ciexy_coordinates_per_channel))
                    for i in range(len(self.ciexy_coordinates_per_channel)):
                        pass
                        if self.ciexy_coordinates_per_channel[i]._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"ciexy_coordinates_per_channel", self._root, self.ciexy_coordinates_per_channel[i]._root)
                        if self.ciexy_coordinates_per_channel[i]._parent != self:
                            raise kaitaistruct.ConsistencyError(u"ciexy_coordinates_per_channel", self, self.ciexy_coordinates_per_channel[i]._parent)

                    self._dirty = False

                class CiexyCoordinateValues(ReadWriteKaitaiStruct):
                    def __init__(self, _io=None, _parent=None, _root=None):
                        super(Icc4.TagTable.TagDefinition.ChromaticityType.CiexyCoordinateValues, self).__init__(_io)
                        self._parent = _parent
                        self._root = _root

                    def _read(self):
                        self.x_coordinate = self._io.read_u2be()
                        self.y_coordinate = self._io.read_u2be()
                        self._dirty = False


                    def _fetch_instances(self):
                        pass


                    def _write__seq(self, io=None):
                        super(Icc4.TagTable.TagDefinition.ChromaticityType.CiexyCoordinateValues, self)._write__seq(io)
                        self._io.write_u2be(self.x_coordinate)
                        self._io.write_u2be(self.y_coordinate)


                    def _check(self):
                        self._dirty = False



            class ColorantOrderTag(ReadWriteKaitaiStruct):
                def __init__(self, _io=None, _parent=None, _root=None):
                    super(Icc4.TagTable.TagDefinition.ColorantOrderTag, self).__init__(_io)
                    self._parent = _parent
                    self._root = _root

                def _read(self):
                    self.tag_type = KaitaiStream.resolve_enum(Icc4.TagTable.TagDefinition.TagTypeSignatures, self._io.read_u4be())
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.colorant_order_type:
                        pass
                        self.tag_data = Icc4.TagTable.TagDefinition.ColorantOrderType(self._io, self, self._root)
                        self.tag_data._read()
                    self._dirty = False


                def _fetch_instances(self):
                    pass
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.colorant_order_type:
                        pass
                        self.tag_data._fetch_instances()


                def _write__seq(self, io=None):
                    super(Icc4.TagTable.TagDefinition.ColorantOrderTag, self)._write__seq(io)
                    self._io.write_u4be(int(self.tag_type))
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.colorant_order_type:
                        pass
                        self.tag_data._write__seq(self._io)


                def _check(self):
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.colorant_order_type:
                        pass
                        if self.tag_data._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"tag_data", self._root, self.tag_data._root)
                        if self.tag_data._parent != self:
                            raise kaitaistruct.ConsistencyError(u"tag_data", self, self.tag_data._parent)
                    self._dirty = False


            class ColorantOrderType(ReadWriteKaitaiStruct):
                def __init__(self, _io=None, _parent=None, _root=None):
                    super(Icc4.TagTable.TagDefinition.ColorantOrderType, self).__init__(_io)
                    self._parent = _parent
                    self._root = _root

                def _read(self):
                    self.reserved = self._io.read_bytes(4)
                    if not self.reserved == b"\x00\x00\x00\x00":
                        raise kaitaistruct.ValidationNotEqualError(b"\x00\x00\x00\x00", self.reserved, self._io, u"/types/tag_table/types/tag_definition/types/colorant_order_type/seq/0")
                    self.count_of_colorants = self._io.read_u4be()
                    self.numbers_of_colorants_in_order_of_printing = []
                    for i in range(self.count_of_colorants):
                        self.numbers_of_colorants_in_order_of_printing.append(self._io.read_u1())

                    self._dirty = False


                def _fetch_instances(self):
                    pass
                    for i in range(len(self.numbers_of_colorants_in_order_of_printing)):
                        pass



                def _write__seq(self, io=None):
                    super(Icc4.TagTable.TagDefinition.ColorantOrderType, self)._write__seq(io)
                    self._io.write_bytes(self.reserved)
                    self._io.write_u4be(self.count_of_colorants)
                    for i in range(len(self.numbers_of_colorants_in_order_of_printing)):
                        pass
                        self._io.write_u1(self.numbers_of_colorants_in_order_of_printing[i])



                def _check(self):
                    if len(self.reserved) != 4:
                        raise kaitaistruct.ConsistencyError(u"reserved", 4, len(self.reserved))
                    if not self.reserved == b"\x00\x00\x00\x00":
                        raise kaitaistruct.ValidationNotEqualError(b"\x00\x00\x00\x00", self.reserved, None, u"/types/tag_table/types/tag_definition/types/colorant_order_type/seq/0")
                    if len(self.numbers_of_colorants_in_order_of_printing) != self.count_of_colorants:
                        raise kaitaistruct.ConsistencyError(u"numbers_of_colorants_in_order_of_printing", self.count_of_colorants, len(self.numbers_of_colorants_in_order_of_printing))
                    for i in range(len(self.numbers_of_colorants_in_order_of_printing)):
                        pass

                    self._dirty = False


            class ColorantTableOutTag(ReadWriteKaitaiStruct):
                def __init__(self, _io=None, _parent=None, _root=None):
                    super(Icc4.TagTable.TagDefinition.ColorantTableOutTag, self).__init__(_io)
                    self._parent = _parent
                    self._root = _root

                def _read(self):
                    self.tag_type = KaitaiStream.resolve_enum(Icc4.TagTable.TagDefinition.TagTypeSignatures, self._io.read_u4be())
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.colorant_table_type:
                        pass
                        self.tag_data = Icc4.TagTable.TagDefinition.ColorantTableType(self._io, self, self._root)
                        self.tag_data._read()
                    self._dirty = False


                def _fetch_instances(self):
                    pass
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.colorant_table_type:
                        pass
                        self.tag_data._fetch_instances()


                def _write__seq(self, io=None):
                    super(Icc4.TagTable.TagDefinition.ColorantTableOutTag, self)._write__seq(io)
                    self._io.write_u4be(int(self.tag_type))
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.colorant_table_type:
                        pass
                        self.tag_data._write__seq(self._io)


                def _check(self):
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.colorant_table_type:
                        pass
                        if self.tag_data._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"tag_data", self._root, self.tag_data._root)
                        if self.tag_data._parent != self:
                            raise kaitaistruct.ConsistencyError(u"tag_data", self, self.tag_data._parent)
                    self._dirty = False


            class ColorantTableTag(ReadWriteKaitaiStruct):
                def __init__(self, _io=None, _parent=None, _root=None):
                    super(Icc4.TagTable.TagDefinition.ColorantTableTag, self).__init__(_io)
                    self._parent = _parent
                    self._root = _root

                def _read(self):
                    self.tag_type = KaitaiStream.resolve_enum(Icc4.TagTable.TagDefinition.TagTypeSignatures, self._io.read_u4be())
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.colorant_table_type:
                        pass
                        self.tag_data = Icc4.TagTable.TagDefinition.ColorantTableType(self._io, self, self._root)
                        self.tag_data._read()
                    self._dirty = False


                def _fetch_instances(self):
                    pass
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.colorant_table_type:
                        pass
                        self.tag_data._fetch_instances()


                def _write__seq(self, io=None):
                    super(Icc4.TagTable.TagDefinition.ColorantTableTag, self)._write__seq(io)
                    self._io.write_u4be(int(self.tag_type))
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.colorant_table_type:
                        pass
                        self.tag_data._write__seq(self._io)


                def _check(self):
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.colorant_table_type:
                        pass
                        if self.tag_data._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"tag_data", self._root, self.tag_data._root)
                        if self.tag_data._parent != self:
                            raise kaitaistruct.ConsistencyError(u"tag_data", self, self.tag_data._parent)
                    self._dirty = False


            class ColorantTableType(ReadWriteKaitaiStruct):
                def __init__(self, _io=None, _parent=None, _root=None):
                    super(Icc4.TagTable.TagDefinition.ColorantTableType, self).__init__(_io)
                    self._parent = _parent
                    self._root = _root

                def _read(self):
                    self.reserved = self._io.read_bytes(4)
                    if not self.reserved == b"\x00\x00\x00\x00":
                        raise kaitaistruct.ValidationNotEqualError(b"\x00\x00\x00\x00", self.reserved, self._io, u"/types/tag_table/types/tag_definition/types/colorant_table_type/seq/0")
                    self.count_of_colorants = self._io.read_u4be()
                    self.colorants = []
                    for i in range(self.count_of_colorants):
                        _t_colorants = Icc4.TagTable.TagDefinition.ColorantTableType.Colorant(self._io, self, self._root)
                        try:
                            _t_colorants._read()
                        finally:
                            self.colorants.append(_t_colorants)

                    self._dirty = False


                def _fetch_instances(self):
                    pass
                    for i in range(len(self.colorants)):
                        pass
                        self.colorants[i]._fetch_instances()



                def _write__seq(self, io=None):
                    super(Icc4.TagTable.TagDefinition.ColorantTableType, self)._write__seq(io)
                    self._io.write_bytes(self.reserved)
                    self._io.write_u4be(self.count_of_colorants)
                    for i in range(len(self.colorants)):
                        pass
                        self.colorants[i]._write__seq(self._io)



                def _check(self):
                    if len(self.reserved) != 4:
                        raise kaitaistruct.ConsistencyError(u"reserved", 4, len(self.reserved))
                    if not self.reserved == b"\x00\x00\x00\x00":
                        raise kaitaistruct.ValidationNotEqualError(b"\x00\x00\x00\x00", self.reserved, None, u"/types/tag_table/types/tag_definition/types/colorant_table_type/seq/0")
                    if len(self.colorants) != self.count_of_colorants:
                        raise kaitaistruct.ConsistencyError(u"colorants", self.count_of_colorants, len(self.colorants))
                    for i in range(len(self.colorants)):
                        pass
                        if self.colorants[i]._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"colorants", self._root, self.colorants[i]._root)
                        if self.colorants[i]._parent != self:
                            raise kaitaistruct.ConsistencyError(u"colorants", self, self.colorants[i]._parent)

                    self._dirty = False

                class Colorant(ReadWriteKaitaiStruct):
                    def __init__(self, _io=None, _parent=None, _root=None):
                        super(Icc4.TagTable.TagDefinition.ColorantTableType.Colorant, self).__init__(_io)
                        self._parent = _parent
                        self._root = _root

                    def _read(self):
                        self.name = (self._io.read_bytes_term(0, False, True, True)).decode(u"ASCII")
                        self.padding = []
                        for i in range(32 - len(self.name)):
                            self.padding.append(self._io.read_bytes(1))
                            if not self.padding[i] == b"\x00":
                                raise kaitaistruct.ValidationNotEqualError(b"\x00", self.padding[i], self._io, u"/types/tag_table/types/tag_definition/types/colorant_table_type/types/colorant/seq/1")

                        self.pcs_values = self._io.read_bytes(6)
                        self._dirty = False


                    def _fetch_instances(self):
                        pass
                        for i in range(len(self.padding)):
                            pass



                    def _write__seq(self, io=None):
                        super(Icc4.TagTable.TagDefinition.ColorantTableType.Colorant, self)._write__seq(io)
                        self._io.write_bytes((self.name).encode(u"ASCII"))
                        self._io.write_u1(0)
                        for i in range(len(self.padding)):
                            pass
                            self._io.write_bytes(self.padding[i])

                        self._io.write_bytes(self.pcs_values)


                    def _check(self):
                        if KaitaiStream.byte_array_index_of((self.name).encode(u"ASCII"), 0) != -1:
                            raise kaitaistruct.ConsistencyError(u"name", -1, KaitaiStream.byte_array_index_of((self.name).encode(u"ASCII"), 0))
                        if len(self.padding) != 32 - len(self.name):
                            raise kaitaistruct.ConsistencyError(u"padding", 32 - len(self.name), len(self.padding))
                        for i in range(len(self.padding)):
                            pass
                            if len(self.padding[i]) != 1:
                                raise kaitaistruct.ConsistencyError(u"padding", 1, len(self.padding[i]))
                            if not self.padding[i] == b"\x00":
                                raise kaitaistruct.ValidationNotEqualError(b"\x00", self.padding[i], None, u"/types/tag_table/types/tag_definition/types/colorant_table_type/types/colorant/seq/1")

                        if len(self.pcs_values) != 6:
                            raise kaitaistruct.ConsistencyError(u"pcs_values", 6, len(self.pcs_values))
                        self._dirty = False



            class ColorimetricIntentImageStateTag(ReadWriteKaitaiStruct):
                def __init__(self, _io=None, _parent=None, _root=None):
                    super(Icc4.TagTable.TagDefinition.ColorimetricIntentImageStateTag, self).__init__(_io)
                    self._parent = _parent
                    self._root = _root

                def _read(self):
                    self.tag_type = KaitaiStream.resolve_enum(Icc4.TagTable.TagDefinition.TagTypeSignatures, self._io.read_u4be())
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.signature_type:
                        pass
                        self.tag_data = Icc4.TagTable.TagDefinition.SignatureType(self._io, self, self._root)
                        self.tag_data._read()
                    self._dirty = False


                def _fetch_instances(self):
                    pass
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.signature_type:
                        pass
                        self.tag_data._fetch_instances()


                def _write__seq(self, io=None):
                    super(Icc4.TagTable.TagDefinition.ColorimetricIntentImageStateTag, self)._write__seq(io)
                    self._io.write_u4be(int(self.tag_type))
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.signature_type:
                        pass
                        self.tag_data._write__seq(self._io)


                def _check(self):
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.signature_type:
                        pass
                        if self.tag_data._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"tag_data", self._root, self.tag_data._root)
                        if self.tag_data._parent != self:
                            raise kaitaistruct.ConsistencyError(u"tag_data", self, self.tag_data._parent)
                    self._dirty = False


            class CopyrightTag(ReadWriteKaitaiStruct):
                def __init__(self, _io=None, _parent=None, _root=None):
                    super(Icc4.TagTable.TagDefinition.CopyrightTag, self).__init__(_io)
                    self._parent = _parent
                    self._root = _root

                def _read(self):
                    self.tag_type = KaitaiStream.resolve_enum(Icc4.TagTable.TagDefinition.TagTypeSignatures, self._io.read_u4be())
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.multi_localized_unicode_type:
                        pass
                        self.tag_data = Icc4.TagTable.TagDefinition.MultiLocalizedUnicodeType(self._io, self, self._root)
                        self.tag_data._read()
                    self._dirty = False


                def _fetch_instances(self):
                    pass
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.multi_localized_unicode_type:
                        pass
                        self.tag_data._fetch_instances()


                def _write__seq(self, io=None):
                    super(Icc4.TagTable.TagDefinition.CopyrightTag, self)._write__seq(io)
                    self._io.write_u4be(int(self.tag_type))
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.multi_localized_unicode_type:
                        pass
                        self.tag_data._write__seq(self._io)


                def _check(self):
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.multi_localized_unicode_type:
                        pass
                        if self.tag_data._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"tag_data", self._root, self.tag_data._root)
                        if self.tag_data._parent != self:
                            raise kaitaistruct.ConsistencyError(u"tag_data", self, self.tag_data._parent)
                    self._dirty = False


            class CurveType(ReadWriteKaitaiStruct):
                def __init__(self, _io=None, _parent=None, _root=None):
                    super(Icc4.TagTable.TagDefinition.CurveType, self).__init__(_io)
                    self._parent = _parent
                    self._root = _root

                def _read(self):
                    self.reserved = self._io.read_bytes(4)
                    if not self.reserved == b"\x00\x00\x00\x00":
                        raise kaitaistruct.ValidationNotEqualError(b"\x00\x00\x00\x00", self.reserved, self._io, u"/types/tag_table/types/tag_definition/types/curve_type/seq/0")
                    self.number_of_entries = self._io.read_u4be()
                    if self.number_of_entries > 1:
                        pass
                        self.curve_values = []
                        for i in range(self.number_of_entries):
                            self.curve_values.append(self._io.read_u2be())


                    if self.number_of_entries == 1:
                        pass
                        self.curve_value = self._io.read_u1()

                    self._dirty = False


                def _fetch_instances(self):
                    pass
                    if self.number_of_entries > 1:
                        pass
                        for i in range(len(self.curve_values)):
                            pass


                    if self.number_of_entries == 1:
                        pass



                def _write__seq(self, io=None):
                    super(Icc4.TagTable.TagDefinition.CurveType, self)._write__seq(io)
                    self._io.write_bytes(self.reserved)
                    self._io.write_u4be(self.number_of_entries)
                    if self.number_of_entries > 1:
                        pass
                        for i in range(len(self.curve_values)):
                            pass
                            self._io.write_u2be(self.curve_values[i])


                    if self.number_of_entries == 1:
                        pass
                        self._io.write_u1(self.curve_value)



                def _check(self):
                    if len(self.reserved) != 4:
                        raise kaitaistruct.ConsistencyError(u"reserved", 4, len(self.reserved))
                    if not self.reserved == b"\x00\x00\x00\x00":
                        raise kaitaistruct.ValidationNotEqualError(b"\x00\x00\x00\x00", self.reserved, None, u"/types/tag_table/types/tag_definition/types/curve_type/seq/0")
                    if self.number_of_entries > 1:
                        pass
                        if len(self.curve_values) != self.number_of_entries:
                            raise kaitaistruct.ConsistencyError(u"curve_values", self.number_of_entries, len(self.curve_values))
                        for i in range(len(self.curve_values)):
                            pass


                    if self.number_of_entries == 1:
                        pass

                    self._dirty = False


            class DToB0Tag(ReadWriteKaitaiStruct):
                def __init__(self, _io=None, _parent=None, _root=None):
                    super(Icc4.TagTable.TagDefinition.DToB0Tag, self).__init__(_io)
                    self._parent = _parent
                    self._root = _root

                def _read(self):
                    self.tag_type = KaitaiStream.resolve_enum(Icc4.TagTable.TagDefinition.TagTypeSignatures, self._io.read_u4be())
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.multi_process_elements_type:
                        pass
                        self.tag_data = Icc4.TagTable.TagDefinition.MultiProcessElementsType(self._io, self, self._root)
                        self.tag_data._read()
                    self._dirty = False


                def _fetch_instances(self):
                    pass
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.multi_process_elements_type:
                        pass
                        self.tag_data._fetch_instances()


                def _write__seq(self, io=None):
                    super(Icc4.TagTable.TagDefinition.DToB0Tag, self)._write__seq(io)
                    self._io.write_u4be(int(self.tag_type))
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.multi_process_elements_type:
                        pass
                        self.tag_data._write__seq(self._io)


                def _check(self):
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.multi_process_elements_type:
                        pass
                        if self.tag_data._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"tag_data", self._root, self.tag_data._root)
                        if self.tag_data._parent != self:
                            raise kaitaistruct.ConsistencyError(u"tag_data", self, self.tag_data._parent)
                    self._dirty = False


            class DToB1Tag(ReadWriteKaitaiStruct):
                def __init__(self, _io=None, _parent=None, _root=None):
                    super(Icc4.TagTable.TagDefinition.DToB1Tag, self).__init__(_io)
                    self._parent = _parent
                    self._root = _root

                def _read(self):
                    self.tag_type = KaitaiStream.resolve_enum(Icc4.TagTable.TagDefinition.TagTypeSignatures, self._io.read_u4be())
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.multi_process_elements_type:
                        pass
                        self.tag_data = Icc4.TagTable.TagDefinition.MultiProcessElementsType(self._io, self, self._root)
                        self.tag_data._read()
                    self._dirty = False


                def _fetch_instances(self):
                    pass
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.multi_process_elements_type:
                        pass
                        self.tag_data._fetch_instances()


                def _write__seq(self, io=None):
                    super(Icc4.TagTable.TagDefinition.DToB1Tag, self)._write__seq(io)
                    self._io.write_u4be(int(self.tag_type))
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.multi_process_elements_type:
                        pass
                        self.tag_data._write__seq(self._io)


                def _check(self):
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.multi_process_elements_type:
                        pass
                        if self.tag_data._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"tag_data", self._root, self.tag_data._root)
                        if self.tag_data._parent != self:
                            raise kaitaistruct.ConsistencyError(u"tag_data", self, self.tag_data._parent)
                    self._dirty = False


            class DToB2Tag(ReadWriteKaitaiStruct):
                def __init__(self, _io=None, _parent=None, _root=None):
                    super(Icc4.TagTable.TagDefinition.DToB2Tag, self).__init__(_io)
                    self._parent = _parent
                    self._root = _root

                def _read(self):
                    self.tag_type = KaitaiStream.resolve_enum(Icc4.TagTable.TagDefinition.TagTypeSignatures, self._io.read_u4be())
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.multi_process_elements_type:
                        pass
                        self.tag_data = Icc4.TagTable.TagDefinition.MultiProcessElementsType(self._io, self, self._root)
                        self.tag_data._read()
                    self._dirty = False


                def _fetch_instances(self):
                    pass
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.multi_process_elements_type:
                        pass
                        self.tag_data._fetch_instances()


                def _write__seq(self, io=None):
                    super(Icc4.TagTable.TagDefinition.DToB2Tag, self)._write__seq(io)
                    self._io.write_u4be(int(self.tag_type))
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.multi_process_elements_type:
                        pass
                        self.tag_data._write__seq(self._io)


                def _check(self):
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.multi_process_elements_type:
                        pass
                        if self.tag_data._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"tag_data", self._root, self.tag_data._root)
                        if self.tag_data._parent != self:
                            raise kaitaistruct.ConsistencyError(u"tag_data", self, self.tag_data._parent)
                    self._dirty = False


            class DToB3Tag(ReadWriteKaitaiStruct):
                def __init__(self, _io=None, _parent=None, _root=None):
                    super(Icc4.TagTable.TagDefinition.DToB3Tag, self).__init__(_io)
                    self._parent = _parent
                    self._root = _root

                def _read(self):
                    self.tag_type = KaitaiStream.resolve_enum(Icc4.TagTable.TagDefinition.TagTypeSignatures, self._io.read_u4be())
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.multi_process_elements_type:
                        pass
                        self.tag_data = Icc4.TagTable.TagDefinition.MultiProcessElementsType(self._io, self, self._root)
                        self.tag_data._read()
                    self._dirty = False


                def _fetch_instances(self):
                    pass
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.multi_process_elements_type:
                        pass
                        self.tag_data._fetch_instances()


                def _write__seq(self, io=None):
                    super(Icc4.TagTable.TagDefinition.DToB3Tag, self)._write__seq(io)
                    self._io.write_u4be(int(self.tag_type))
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.multi_process_elements_type:
                        pass
                        self.tag_data._write__seq(self._io)


                def _check(self):
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.multi_process_elements_type:
                        pass
                        if self.tag_data._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"tag_data", self._root, self.tag_data._root)
                        if self.tag_data._parent != self:
                            raise kaitaistruct.ConsistencyError(u"tag_data", self, self.tag_data._parent)
                    self._dirty = False


            class DataType(ReadWriteKaitaiStruct):

                class DataTypes(IntEnum):
                    ascii_data = 0
                    binary_data = 1
                def __init__(self, _io=None, _parent=None, _root=None):
                    super(Icc4.TagTable.TagDefinition.DataType, self).__init__(_io)
                    self._parent = _parent
                    self._root = _root

                def _read(self):
                    self.data_flag = KaitaiStream.resolve_enum(Icc4.TagTable.TagDefinition.DataType.DataTypes, self._io.read_u4be())
                    self._dirty = False


                def _fetch_instances(self):
                    pass


                def _write__seq(self, io=None):
                    super(Icc4.TagTable.TagDefinition.DataType, self)._write__seq(io)
                    self._io.write_u4be(int(self.data_flag))


                def _check(self):
                    self._dirty = False


            class DateTimeType(ReadWriteKaitaiStruct):
                def __init__(self, _io=None, _parent=None, _root=None):
                    super(Icc4.TagTable.TagDefinition.DateTimeType, self).__init__(_io)
                    self._parent = _parent
                    self._root = _root

                def _read(self):
                    self.reserved = self._io.read_bytes(4)
                    if not self.reserved == b"\x00\x00\x00\x00":
                        raise kaitaistruct.ValidationNotEqualError(b"\x00\x00\x00\x00", self.reserved, self._io, u"/types/tag_table/types/tag_definition/types/date_time_type/seq/0")
                    self.date_and_time = Icc4.DateTimeNumber(self._io, self, self._root)
                    self.date_and_time._read()
                    self._dirty = False


                def _fetch_instances(self):
                    pass
                    self.date_and_time._fetch_instances()


                def _write__seq(self, io=None):
                    super(Icc4.TagTable.TagDefinition.DateTimeType, self)._write__seq(io)
                    self._io.write_bytes(self.reserved)
                    self.date_and_time._write__seq(self._io)


                def _check(self):
                    if len(self.reserved) != 4:
                        raise kaitaistruct.ConsistencyError(u"reserved", 4, len(self.reserved))
                    if not self.reserved == b"\x00\x00\x00\x00":
                        raise kaitaistruct.ValidationNotEqualError(b"\x00\x00\x00\x00", self.reserved, None, u"/types/tag_table/types/tag_definition/types/date_time_type/seq/0")
                    if self.date_and_time._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"date_and_time", self._root, self.date_and_time._root)
                    if self.date_and_time._parent != self:
                        raise kaitaistruct.ConsistencyError(u"date_and_time", self, self.date_and_time._parent)
                    self._dirty = False


            class DeviceMfgDescTag(ReadWriteKaitaiStruct):
                def __init__(self, _io=None, _parent=None, _root=None):
                    super(Icc4.TagTable.TagDefinition.DeviceMfgDescTag, self).__init__(_io)
                    self._parent = _parent
                    self._root = _root

                def _read(self):
                    self.tag_type = KaitaiStream.resolve_enum(Icc4.TagTable.TagDefinition.TagTypeSignatures, self._io.read_u4be())
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.multi_localized_unicode_type:
                        pass
                        self.tag_data = Icc4.TagTable.TagDefinition.MultiLocalizedUnicodeType(self._io, self, self._root)
                        self.tag_data._read()
                    self._dirty = False


                def _fetch_instances(self):
                    pass
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.multi_localized_unicode_type:
                        pass
                        self.tag_data._fetch_instances()


                def _write__seq(self, io=None):
                    super(Icc4.TagTable.TagDefinition.DeviceMfgDescTag, self)._write__seq(io)
                    self._io.write_u4be(int(self.tag_type))
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.multi_localized_unicode_type:
                        pass
                        self.tag_data._write__seq(self._io)


                def _check(self):
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.multi_localized_unicode_type:
                        pass
                        if self.tag_data._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"tag_data", self._root, self.tag_data._root)
                        if self.tag_data._parent != self:
                            raise kaitaistruct.ConsistencyError(u"tag_data", self, self.tag_data._parent)
                    self._dirty = False


            class DeviceModelDescTag(ReadWriteKaitaiStruct):
                def __init__(self, _io=None, _parent=None, _root=None):
                    super(Icc4.TagTable.TagDefinition.DeviceModelDescTag, self).__init__(_io)
                    self._parent = _parent
                    self._root = _root

                def _read(self):
                    self.tag_type = KaitaiStream.resolve_enum(Icc4.TagTable.TagDefinition.TagTypeSignatures, self._io.read_u4be())
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.multi_localized_unicode_type:
                        pass
                        self.tag_data = Icc4.TagTable.TagDefinition.MultiLocalizedUnicodeType(self._io, self, self._root)
                        self.tag_data._read()
                    self._dirty = False


                def _fetch_instances(self):
                    pass
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.multi_localized_unicode_type:
                        pass
                        self.tag_data._fetch_instances()


                def _write__seq(self, io=None):
                    super(Icc4.TagTable.TagDefinition.DeviceModelDescTag, self)._write__seq(io)
                    self._io.write_u4be(int(self.tag_type))
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.multi_localized_unicode_type:
                        pass
                        self.tag_data._write__seq(self._io)


                def _check(self):
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.multi_localized_unicode_type:
                        pass
                        if self.tag_data._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"tag_data", self._root, self.tag_data._root)
                        if self.tag_data._parent != self:
                            raise kaitaistruct.ConsistencyError(u"tag_data", self, self.tag_data._parent)
                    self._dirty = False


            class GamutTag(ReadWriteKaitaiStruct):
                def __init__(self, _io=None, _parent=None, _root=None):
                    super(Icc4.TagTable.TagDefinition.GamutTag, self).__init__(_io)
                    self._parent = _parent
                    self._root = _root

                def _read(self):
                    self.tag_type = KaitaiStream.resolve_enum(Icc4.TagTable.TagDefinition.TagTypeSignatures, self._io.read_u4be())
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.multi_function_b_to_a_table_type:
                        pass
                        self.tag_data = Icc4.TagTable.TagDefinition.LutBToAType(self._io, self, self._root)
                        self.tag_data._read()
                    elif _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.multi_function_table_with_one_byte_precision_type:
                        pass
                        self.tag_data = Icc4.TagTable.TagDefinition.Lut8Type(self._io, self, self._root)
                        self.tag_data._read()
                    elif _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.multi_function_table_with_two_byte_precision_type:
                        pass
                        self.tag_data = Icc4.TagTable.TagDefinition.Lut16Type(self._io, self, self._root)
                        self.tag_data._read()
                    self._dirty = False


                def _fetch_instances(self):
                    pass
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.multi_function_b_to_a_table_type:
                        pass
                        self.tag_data._fetch_instances()
                    elif _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.multi_function_table_with_one_byte_precision_type:
                        pass
                        self.tag_data._fetch_instances()
                    elif _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.multi_function_table_with_two_byte_precision_type:
                        pass
                        self.tag_data._fetch_instances()


                def _write__seq(self, io=None):
                    super(Icc4.TagTable.TagDefinition.GamutTag, self)._write__seq(io)
                    self._io.write_u4be(int(self.tag_type))
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.multi_function_b_to_a_table_type:
                        pass
                        self.tag_data._write__seq(self._io)
                    elif _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.multi_function_table_with_one_byte_precision_type:
                        pass
                        self.tag_data._write__seq(self._io)
                    elif _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.multi_function_table_with_two_byte_precision_type:
                        pass
                        self.tag_data._write__seq(self._io)


                def _check(self):
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.multi_function_b_to_a_table_type:
                        pass
                        if self.tag_data._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"tag_data", self._root, self.tag_data._root)
                        if self.tag_data._parent != self:
                            raise kaitaistruct.ConsistencyError(u"tag_data", self, self.tag_data._parent)
                    elif _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.multi_function_table_with_one_byte_precision_type:
                        pass
                        if self.tag_data._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"tag_data", self._root, self.tag_data._root)
                        if self.tag_data._parent != self:
                            raise kaitaistruct.ConsistencyError(u"tag_data", self, self.tag_data._parent)
                    elif _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.multi_function_table_with_two_byte_precision_type:
                        pass
                        if self.tag_data._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"tag_data", self._root, self.tag_data._root)
                        if self.tag_data._parent != self:
                            raise kaitaistruct.ConsistencyError(u"tag_data", self, self.tag_data._parent)
                    self._dirty = False


            class GrayTrcTag(ReadWriteKaitaiStruct):
                def __init__(self, _io=None, _parent=None, _root=None):
                    super(Icc4.TagTable.TagDefinition.GrayTrcTag, self).__init__(_io)
                    self._parent = _parent
                    self._root = _root

                def _read(self):
                    self.tag_type = KaitaiStream.resolve_enum(Icc4.TagTable.TagDefinition.TagTypeSignatures, self._io.read_u4be())
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.curve_type:
                        pass
                        self.tag_data = Icc4.TagTable.TagDefinition.CurveType(self._io, self, self._root)
                        self.tag_data._read()
                    elif _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.parametric_curve_type:
                        pass
                        self.tag_data = Icc4.TagTable.TagDefinition.ParametricCurveType(self._io, self, self._root)
                        self.tag_data._read()
                    self._dirty = False


                def _fetch_instances(self):
                    pass
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.curve_type:
                        pass
                        self.tag_data._fetch_instances()
                    elif _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.parametric_curve_type:
                        pass
                        self.tag_data._fetch_instances()


                def _write__seq(self, io=None):
                    super(Icc4.TagTable.TagDefinition.GrayTrcTag, self)._write__seq(io)
                    self._io.write_u4be(int(self.tag_type))
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.curve_type:
                        pass
                        self.tag_data._write__seq(self._io)
                    elif _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.parametric_curve_type:
                        pass
                        self.tag_data._write__seq(self._io)


                def _check(self):
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.curve_type:
                        pass
                        if self.tag_data._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"tag_data", self._root, self.tag_data._root)
                        if self.tag_data._parent != self:
                            raise kaitaistruct.ConsistencyError(u"tag_data", self, self.tag_data._parent)
                    elif _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.parametric_curve_type:
                        pass
                        if self.tag_data._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"tag_data", self._root, self.tag_data._root)
                        if self.tag_data._parent != self:
                            raise kaitaistruct.ConsistencyError(u"tag_data", self, self.tag_data._parent)
                    self._dirty = False


            class GreenMatrixColumnTag(ReadWriteKaitaiStruct):
                def __init__(self, _io=None, _parent=None, _root=None):
                    super(Icc4.TagTable.TagDefinition.GreenMatrixColumnTag, self).__init__(_io)
                    self._parent = _parent
                    self._root = _root

                def _read(self):
                    self.tag_type = KaitaiStream.resolve_enum(Icc4.TagTable.TagDefinition.TagTypeSignatures, self._io.read_u4be())
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.xyz_type:
                        pass
                        self.tag_data = Icc4.TagTable.TagDefinition.XyzType(self._io, self, self._root)
                        self.tag_data._read()
                    self._dirty = False


                def _fetch_instances(self):
                    pass
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.xyz_type:
                        pass
                        self.tag_data._fetch_instances()


                def _write__seq(self, io=None):
                    super(Icc4.TagTable.TagDefinition.GreenMatrixColumnTag, self)._write__seq(io)
                    self._io.write_u4be(int(self.tag_type))
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.xyz_type:
                        pass
                        self.tag_data._write__seq(self._io)


                def _check(self):
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.xyz_type:
                        pass
                        if self.tag_data._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"tag_data", self._root, self.tag_data._root)
                        if self.tag_data._parent != self:
                            raise kaitaistruct.ConsistencyError(u"tag_data", self, self.tag_data._parent)
                    self._dirty = False


            class GreenTrcTag(ReadWriteKaitaiStruct):
                def __init__(self, _io=None, _parent=None, _root=None):
                    super(Icc4.TagTable.TagDefinition.GreenTrcTag, self).__init__(_io)
                    self._parent = _parent
                    self._root = _root

                def _read(self):
                    self.tag_type = KaitaiStream.resolve_enum(Icc4.TagTable.TagDefinition.TagTypeSignatures, self._io.read_u4be())
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.curve_type:
                        pass
                        self.tag_data = Icc4.TagTable.TagDefinition.CurveType(self._io, self, self._root)
                        self.tag_data._read()
                    elif _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.parametric_curve_type:
                        pass
                        self.tag_data = Icc4.TagTable.TagDefinition.ParametricCurveType(self._io, self, self._root)
                        self.tag_data._read()
                    self._dirty = False


                def _fetch_instances(self):
                    pass
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.curve_type:
                        pass
                        self.tag_data._fetch_instances()
                    elif _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.parametric_curve_type:
                        pass
                        self.tag_data._fetch_instances()


                def _write__seq(self, io=None):
                    super(Icc4.TagTable.TagDefinition.GreenTrcTag, self)._write__seq(io)
                    self._io.write_u4be(int(self.tag_type))
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.curve_type:
                        pass
                        self.tag_data._write__seq(self._io)
                    elif _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.parametric_curve_type:
                        pass
                        self.tag_data._write__seq(self._io)


                def _check(self):
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.curve_type:
                        pass
                        if self.tag_data._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"tag_data", self._root, self.tag_data._root)
                        if self.tag_data._parent != self:
                            raise kaitaistruct.ConsistencyError(u"tag_data", self, self.tag_data._parent)
                    elif _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.parametric_curve_type:
                        pass
                        if self.tag_data._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"tag_data", self._root, self.tag_data._root)
                        if self.tag_data._parent != self:
                            raise kaitaistruct.ConsistencyError(u"tag_data", self, self.tag_data._parent)
                    self._dirty = False


            class LuminanceTag(ReadWriteKaitaiStruct):
                def __init__(self, _io=None, _parent=None, _root=None):
                    super(Icc4.TagTable.TagDefinition.LuminanceTag, self).__init__(_io)
                    self._parent = _parent
                    self._root = _root

                def _read(self):
                    self.tag_type = KaitaiStream.resolve_enum(Icc4.TagTable.TagDefinition.TagTypeSignatures, self._io.read_u4be())
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.xyz_type:
                        pass
                        self.tag_data = Icc4.TagTable.TagDefinition.XyzType(self._io, self, self._root)
                        self.tag_data._read()
                    self._dirty = False


                def _fetch_instances(self):
                    pass
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.xyz_type:
                        pass
                        self.tag_data._fetch_instances()


                def _write__seq(self, io=None):
                    super(Icc4.TagTable.TagDefinition.LuminanceTag, self)._write__seq(io)
                    self._io.write_u4be(int(self.tag_type))
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.xyz_type:
                        pass
                        self.tag_data._write__seq(self._io)


                def _check(self):
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.xyz_type:
                        pass
                        if self.tag_data._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"tag_data", self._root, self.tag_data._root)
                        if self.tag_data._parent != self:
                            raise kaitaistruct.ConsistencyError(u"tag_data", self, self.tag_data._parent)
                    self._dirty = False


            class Lut16Type(ReadWriteKaitaiStruct):
                def __init__(self, _io=None, _parent=None, _root=None):
                    super(Icc4.TagTable.TagDefinition.Lut16Type, self).__init__(_io)
                    self._parent = _parent
                    self._root = _root

                def _read(self):
                    self.reserved = self._io.read_bytes(4)
                    if not self.reserved == b"\x00\x00\x00\x00":
                        raise kaitaistruct.ValidationNotEqualError(b"\x00\x00\x00\x00", self.reserved, self._io, u"/types/tag_table/types/tag_definition/types/lut_16_type/seq/0")
                    self.number_of_input_channels = self._io.read_u1()
                    self.number_of_output_channels = self._io.read_u1()
                    self.number_of_clut_grid_points = self._io.read_u1()
                    self.padding = self._io.read_bytes(1)
                    if not self.padding == b"\x00":
                        raise kaitaistruct.ValidationNotEqualError(b"\x00", self.padding, self._io, u"/types/tag_table/types/tag_definition/types/lut_16_type/seq/4")
                    self.encoded_e_parameters = []
                    for i in range(9):
                        self.encoded_e_parameters.append(self._io.read_s4be())

                    self.number_of_input_table_entries = self._io.read_u2be()
                    self.number_of_output_table_entries = self._io.read_u2be()
                    self.input_tables = self._io.read_bytes((2 * self.number_of_input_channels) * self.number_of_input_table_entries)
                    self.clut_values = self._io.read_bytes((2 * (self.number_of_clut_grid_points ^ self.number_of_input_channels)) * self.number_of_output_channels)
                    self.output_tables = self._io.read_bytes((2 * self.number_of_output_channels) * self.number_of_output_table_entries)
                    self._dirty = False


                def _fetch_instances(self):
                    pass
                    for i in range(len(self.encoded_e_parameters)):
                        pass



                def _write__seq(self, io=None):
                    super(Icc4.TagTable.TagDefinition.Lut16Type, self)._write__seq(io)
                    self._io.write_bytes(self.reserved)
                    self._io.write_u1(self.number_of_input_channels)
                    self._io.write_u1(self.number_of_output_channels)
                    self._io.write_u1(self.number_of_clut_grid_points)
                    self._io.write_bytes(self.padding)
                    for i in range(len(self.encoded_e_parameters)):
                        pass
                        self._io.write_s4be(self.encoded_e_parameters[i])

                    self._io.write_u2be(self.number_of_input_table_entries)
                    self._io.write_u2be(self.number_of_output_table_entries)
                    self._io.write_bytes(self.input_tables)
                    self._io.write_bytes(self.clut_values)
                    self._io.write_bytes(self.output_tables)


                def _check(self):
                    if len(self.reserved) != 4:
                        raise kaitaistruct.ConsistencyError(u"reserved", 4, len(self.reserved))
                    if not self.reserved == b"\x00\x00\x00\x00":
                        raise kaitaistruct.ValidationNotEqualError(b"\x00\x00\x00\x00", self.reserved, None, u"/types/tag_table/types/tag_definition/types/lut_16_type/seq/0")
                    if len(self.padding) != 1:
                        raise kaitaistruct.ConsistencyError(u"padding", 1, len(self.padding))
                    if not self.padding == b"\x00":
                        raise kaitaistruct.ValidationNotEqualError(b"\x00", self.padding, None, u"/types/tag_table/types/tag_definition/types/lut_16_type/seq/4")
                    if len(self.encoded_e_parameters) != 9:
                        raise kaitaistruct.ConsistencyError(u"encoded_e_parameters", 9, len(self.encoded_e_parameters))
                    for i in range(len(self.encoded_e_parameters)):
                        pass

                    if len(self.input_tables) != (2 * self.number_of_input_channels) * self.number_of_input_table_entries:
                        raise kaitaistruct.ConsistencyError(u"input_tables", (2 * self.number_of_input_channels) * self.number_of_input_table_entries, len(self.input_tables))
                    if len(self.clut_values) != (2 * (self.number_of_clut_grid_points ^ self.number_of_input_channels)) * self.number_of_output_channels:
                        raise kaitaistruct.ConsistencyError(u"clut_values", (2 * (self.number_of_clut_grid_points ^ self.number_of_input_channels)) * self.number_of_output_channels, len(self.clut_values))
                    if len(self.output_tables) != (2 * self.number_of_output_channels) * self.number_of_output_table_entries:
                        raise kaitaistruct.ConsistencyError(u"output_tables", (2 * self.number_of_output_channels) * self.number_of_output_table_entries, len(self.output_tables))
                    self._dirty = False


            class Lut8Type(ReadWriteKaitaiStruct):
                def __init__(self, _io=None, _parent=None, _root=None):
                    super(Icc4.TagTable.TagDefinition.Lut8Type, self).__init__(_io)
                    self._parent = _parent
                    self._root = _root

                def _read(self):
                    self.reserved = self._io.read_bytes(4)
                    if not self.reserved == b"\x00\x00\x00\x00":
                        raise kaitaistruct.ValidationNotEqualError(b"\x00\x00\x00\x00", self.reserved, self._io, u"/types/tag_table/types/tag_definition/types/lut_8_type/seq/0")
                    self.number_of_input_channels = self._io.read_u1()
                    self.number_of_output_channels = self._io.read_u1()
                    self.number_of_clut_grid_points = self._io.read_u1()
                    self.padding = self._io.read_bytes(1)
                    if not self.padding == b"\x00":
                        raise kaitaistruct.ValidationNotEqualError(b"\x00", self.padding, self._io, u"/types/tag_table/types/tag_definition/types/lut_8_type/seq/4")
                    self.encoded_e_parameters = []
                    for i in range(9):
                        self.encoded_e_parameters.append(self._io.read_s4be())

                    self.number_of_input_table_entries = self._io.read_u4be()
                    self.number_of_output_table_entries = self._io.read_u4be()
                    self.input_tables = self._io.read_bytes(256 * self.number_of_input_channels)
                    self.clut_values = self._io.read_bytes((self.number_of_clut_grid_points ^ self.number_of_input_channels) * self.number_of_output_channels)
                    self.output_tables = self._io.read_bytes(256 * self.number_of_output_channels)
                    self._dirty = False


                def _fetch_instances(self):
                    pass
                    for i in range(len(self.encoded_e_parameters)):
                        pass



                def _write__seq(self, io=None):
                    super(Icc4.TagTable.TagDefinition.Lut8Type, self)._write__seq(io)
                    self._io.write_bytes(self.reserved)
                    self._io.write_u1(self.number_of_input_channels)
                    self._io.write_u1(self.number_of_output_channels)
                    self._io.write_u1(self.number_of_clut_grid_points)
                    self._io.write_bytes(self.padding)
                    for i in range(len(self.encoded_e_parameters)):
                        pass
                        self._io.write_s4be(self.encoded_e_parameters[i])

                    self._io.write_u4be(self.number_of_input_table_entries)
                    self._io.write_u4be(self.number_of_output_table_entries)
                    self._io.write_bytes(self.input_tables)
                    self._io.write_bytes(self.clut_values)
                    self._io.write_bytes(self.output_tables)


                def _check(self):
                    if len(self.reserved) != 4:
                        raise kaitaistruct.ConsistencyError(u"reserved", 4, len(self.reserved))
                    if not self.reserved == b"\x00\x00\x00\x00":
                        raise kaitaistruct.ValidationNotEqualError(b"\x00\x00\x00\x00", self.reserved, None, u"/types/tag_table/types/tag_definition/types/lut_8_type/seq/0")
                    if len(self.padding) != 1:
                        raise kaitaistruct.ConsistencyError(u"padding", 1, len(self.padding))
                    if not self.padding == b"\x00":
                        raise kaitaistruct.ValidationNotEqualError(b"\x00", self.padding, None, u"/types/tag_table/types/tag_definition/types/lut_8_type/seq/4")
                    if len(self.encoded_e_parameters) != 9:
                        raise kaitaistruct.ConsistencyError(u"encoded_e_parameters", 9, len(self.encoded_e_parameters))
                    for i in range(len(self.encoded_e_parameters)):
                        pass

                    if len(self.input_tables) != 256 * self.number_of_input_channels:
                        raise kaitaistruct.ConsistencyError(u"input_tables", 256 * self.number_of_input_channels, len(self.input_tables))
                    if len(self.clut_values) != (self.number_of_clut_grid_points ^ self.number_of_input_channels) * self.number_of_output_channels:
                        raise kaitaistruct.ConsistencyError(u"clut_values", (self.number_of_clut_grid_points ^ self.number_of_input_channels) * self.number_of_output_channels, len(self.clut_values))
                    if len(self.output_tables) != 256 * self.number_of_output_channels:
                        raise kaitaistruct.ConsistencyError(u"output_tables", 256 * self.number_of_output_channels, len(self.output_tables))
                    self._dirty = False


            class LutAToBType(ReadWriteKaitaiStruct):
                def __init__(self, _io=None, _parent=None, _root=None):
                    super(Icc4.TagTable.TagDefinition.LutAToBType, self).__init__(_io)
                    self._parent = _parent
                    self._root = _root

                def _read(self):
                    self.reserved = self._io.read_bytes(4)
                    if not self.reserved == b"\x00\x00\x00\x00":
                        raise kaitaistruct.ValidationNotEqualError(b"\x00\x00\x00\x00", self.reserved, self._io, u"/types/tag_table/types/tag_definition/types/lut_a_to_b_type/seq/0")
                    self.number_of_input_channels = self._io.read_u1()
                    self.number_of_output_channels = self._io.read_u1()
                    self.padding = self._io.read_bytes(2)
                    if not self.padding == b"\x00\x00":
                        raise kaitaistruct.ValidationNotEqualError(b"\x00\x00", self.padding, self._io, u"/types/tag_table/types/tag_definition/types/lut_a_to_b_type/seq/3")
                    self.offset_to_first_b_curve = self._io.read_u4be()
                    self.offset_to_matrix = self._io.read_u4be()
                    self.offset_to_first_m_curve = self._io.read_u4be()
                    self.offset_to_clut = self._io.read_u4be()
                    self.offset_to_first_a_curve = self._io.read_u4be()
                    self.data = self._io.read_bytes_full()
                    self._dirty = False


                def _fetch_instances(self):
                    pass


                def _write__seq(self, io=None):
                    super(Icc4.TagTable.TagDefinition.LutAToBType, self)._write__seq(io)
                    self._io.write_bytes(self.reserved)
                    self._io.write_u1(self.number_of_input_channels)
                    self._io.write_u1(self.number_of_output_channels)
                    self._io.write_bytes(self.padding)
                    self._io.write_u4be(self.offset_to_first_b_curve)
                    self._io.write_u4be(self.offset_to_matrix)
                    self._io.write_u4be(self.offset_to_first_m_curve)
                    self._io.write_u4be(self.offset_to_clut)
                    self._io.write_u4be(self.offset_to_first_a_curve)
                    self._io.write_bytes(self.data)
                    if not self._io.is_eof():
                        raise kaitaistruct.ConsistencyError(u"data", 0, self._io.size() - self._io.pos())


                def _check(self):
                    if len(self.reserved) != 4:
                        raise kaitaistruct.ConsistencyError(u"reserved", 4, len(self.reserved))
                    if not self.reserved == b"\x00\x00\x00\x00":
                        raise kaitaistruct.ValidationNotEqualError(b"\x00\x00\x00\x00", self.reserved, None, u"/types/tag_table/types/tag_definition/types/lut_a_to_b_type/seq/0")
                    if len(self.padding) != 2:
                        raise kaitaistruct.ConsistencyError(u"padding", 2, len(self.padding))
                    if not self.padding == b"\x00\x00":
                        raise kaitaistruct.ValidationNotEqualError(b"\x00\x00", self.padding, None, u"/types/tag_table/types/tag_definition/types/lut_a_to_b_type/seq/3")
                    self._dirty = False


            class LutBToAType(ReadWriteKaitaiStruct):
                def __init__(self, _io=None, _parent=None, _root=None):
                    super(Icc4.TagTable.TagDefinition.LutBToAType, self).__init__(_io)
                    self._parent = _parent
                    self._root = _root

                def _read(self):
                    self.reserved = self._io.read_bytes(4)
                    if not self.reserved == b"\x00\x00\x00\x00":
                        raise kaitaistruct.ValidationNotEqualError(b"\x00\x00\x00\x00", self.reserved, self._io, u"/types/tag_table/types/tag_definition/types/lut_b_to_a_type/seq/0")
                    self.number_of_input_channels = self._io.read_u1()
                    self.number_of_output_channels = self._io.read_u1()
                    self.padding = self._io.read_bytes(2)
                    if not self.padding == b"\x00\x00":
                        raise kaitaistruct.ValidationNotEqualError(b"\x00\x00", self.padding, self._io, u"/types/tag_table/types/tag_definition/types/lut_b_to_a_type/seq/3")
                    self.offset_to_first_b_curve = self._io.read_u4be()
                    self.offset_to_matrix = self._io.read_u4be()
                    self.offset_to_first_m_curve = self._io.read_u4be()
                    self.offset_to_clut = self._io.read_u4be()
                    self.offset_to_first_a_curve = self._io.read_u4be()
                    self.data = self._io.read_bytes_full()
                    self._dirty = False


                def _fetch_instances(self):
                    pass


                def _write__seq(self, io=None):
                    super(Icc4.TagTable.TagDefinition.LutBToAType, self)._write__seq(io)
                    self._io.write_bytes(self.reserved)
                    self._io.write_u1(self.number_of_input_channels)
                    self._io.write_u1(self.number_of_output_channels)
                    self._io.write_bytes(self.padding)
                    self._io.write_u4be(self.offset_to_first_b_curve)
                    self._io.write_u4be(self.offset_to_matrix)
                    self._io.write_u4be(self.offset_to_first_m_curve)
                    self._io.write_u4be(self.offset_to_clut)
                    self._io.write_u4be(self.offset_to_first_a_curve)
                    self._io.write_bytes(self.data)
                    if not self._io.is_eof():
                        raise kaitaistruct.ConsistencyError(u"data", 0, self._io.size() - self._io.pos())


                def _check(self):
                    if len(self.reserved) != 4:
                        raise kaitaistruct.ConsistencyError(u"reserved", 4, len(self.reserved))
                    if not self.reserved == b"\x00\x00\x00\x00":
                        raise kaitaistruct.ValidationNotEqualError(b"\x00\x00\x00\x00", self.reserved, None, u"/types/tag_table/types/tag_definition/types/lut_b_to_a_type/seq/0")
                    if len(self.padding) != 2:
                        raise kaitaistruct.ConsistencyError(u"padding", 2, len(self.padding))
                    if not self.padding == b"\x00\x00":
                        raise kaitaistruct.ValidationNotEqualError(b"\x00\x00", self.padding, None, u"/types/tag_table/types/tag_definition/types/lut_b_to_a_type/seq/3")
                    self._dirty = False


            class MeasurementTag(ReadWriteKaitaiStruct):
                def __init__(self, _io=None, _parent=None, _root=None):
                    super(Icc4.TagTable.TagDefinition.MeasurementTag, self).__init__(_io)
                    self._parent = _parent
                    self._root = _root

                def _read(self):
                    self.tag_type = KaitaiStream.resolve_enum(Icc4.TagTable.TagDefinition.TagTypeSignatures, self._io.read_u4be())
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.measurement_type:
                        pass
                        self.tag_data = Icc4.TagTable.TagDefinition.MeasurementType(self._io, self, self._root)
                        self.tag_data._read()
                    self._dirty = False


                def _fetch_instances(self):
                    pass
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.measurement_type:
                        pass
                        self.tag_data._fetch_instances()


                def _write__seq(self, io=None):
                    super(Icc4.TagTable.TagDefinition.MeasurementTag, self)._write__seq(io)
                    self._io.write_u4be(int(self.tag_type))
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.measurement_type:
                        pass
                        self.tag_data._write__seq(self._io)


                def _check(self):
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.measurement_type:
                        pass
                        if self.tag_data._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"tag_data", self._root, self.tag_data._root)
                        if self.tag_data._parent != self:
                            raise kaitaistruct.ConsistencyError(u"tag_data", self, self.tag_data._parent)
                    self._dirty = False


            class MeasurementType(ReadWriteKaitaiStruct):

                class MeasurementFlareEncodings(IntEnum):
                    zero_percent = 0
                    one_hundred_percent = 65536

                class MeasurementGeometryEncodings(IntEnum):
                    unknown = 0
                    zero_degrees_to_45_degrees_or_45_degrees_to_zero_degrees = 1
                    zero_degrees_to_d_degrees_or_d_degrees_to_zero_degrees = 2

                class StandardObserverEncodings(IntEnum):
                    unknown = 0
                    cie_1931_standard_colorimetric_observer = 1
                    cie_1964_standard_colorimetric_observer = 2
                def __init__(self, _io=None, _parent=None, _root=None):
                    super(Icc4.TagTable.TagDefinition.MeasurementType, self).__init__(_io)
                    self._parent = _parent
                    self._root = _root

                def _read(self):
                    self.reserved = self._io.read_bytes(4)
                    if not self.reserved == b"\x00\x00\x00\x00":
                        raise kaitaistruct.ValidationNotEqualError(b"\x00\x00\x00\x00", self.reserved, self._io, u"/types/tag_table/types/tag_definition/types/measurement_type/seq/0")
                    self.standard_observer_encoding = KaitaiStream.resolve_enum(Icc4.TagTable.TagDefinition.MeasurementType.StandardObserverEncodings, self._io.read_u4be())
                    self.nciexyz_tristimulus_values_for_measurement_backing = Icc4.XyzNumber(self._io, self, self._root)
                    self.nciexyz_tristimulus_values_for_measurement_backing._read()
                    self.measurement_geometry_encoding = KaitaiStream.resolve_enum(Icc4.TagTable.TagDefinition.MeasurementType.MeasurementGeometryEncodings, self._io.read_u4be())
                    self.measurement_flare_encoding = KaitaiStream.resolve_enum(Icc4.TagTable.TagDefinition.MeasurementType.MeasurementFlareEncodings, self._io.read_u4be())
                    self.standard_illuminant_encoding = Icc4.StandardIlluminantEncoding(self._io, self, self._root)
                    self.standard_illuminant_encoding._read()
                    self._dirty = False


                def _fetch_instances(self):
                    pass
                    self.nciexyz_tristimulus_values_for_measurement_backing._fetch_instances()
                    self.standard_illuminant_encoding._fetch_instances()


                def _write__seq(self, io=None):
                    super(Icc4.TagTable.TagDefinition.MeasurementType, self)._write__seq(io)
                    self._io.write_bytes(self.reserved)
                    self._io.write_u4be(int(self.standard_observer_encoding))
                    self.nciexyz_tristimulus_values_for_measurement_backing._write__seq(self._io)
                    self._io.write_u4be(int(self.measurement_geometry_encoding))
                    self._io.write_u4be(int(self.measurement_flare_encoding))
                    self.standard_illuminant_encoding._write__seq(self._io)


                def _check(self):
                    if len(self.reserved) != 4:
                        raise kaitaistruct.ConsistencyError(u"reserved", 4, len(self.reserved))
                    if not self.reserved == b"\x00\x00\x00\x00":
                        raise kaitaistruct.ValidationNotEqualError(b"\x00\x00\x00\x00", self.reserved, None, u"/types/tag_table/types/tag_definition/types/measurement_type/seq/0")
                    if self.nciexyz_tristimulus_values_for_measurement_backing._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"nciexyz_tristimulus_values_for_measurement_backing", self._root, self.nciexyz_tristimulus_values_for_measurement_backing._root)
                    if self.nciexyz_tristimulus_values_for_measurement_backing._parent != self:
                        raise kaitaistruct.ConsistencyError(u"nciexyz_tristimulus_values_for_measurement_backing", self, self.nciexyz_tristimulus_values_for_measurement_backing._parent)
                    if self.standard_illuminant_encoding._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"standard_illuminant_encoding", self._root, self.standard_illuminant_encoding._root)
                    if self.standard_illuminant_encoding._parent != self:
                        raise kaitaistruct.ConsistencyError(u"standard_illuminant_encoding", self, self.standard_illuminant_encoding._parent)
                    self._dirty = False


            class MediaWhitePointTag(ReadWriteKaitaiStruct):
                def __init__(self, _io=None, _parent=None, _root=None):
                    super(Icc4.TagTable.TagDefinition.MediaWhitePointTag, self).__init__(_io)
                    self._parent = _parent
                    self._root = _root

                def _read(self):
                    self.tag_type = KaitaiStream.resolve_enum(Icc4.TagTable.TagDefinition.TagTypeSignatures, self._io.read_u4be())
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.xyz_type:
                        pass
                        self.tag_data = Icc4.TagTable.TagDefinition.XyzType(self._io, self, self._root)
                        self.tag_data._read()
                    self._dirty = False


                def _fetch_instances(self):
                    pass
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.xyz_type:
                        pass
                        self.tag_data._fetch_instances()


                def _write__seq(self, io=None):
                    super(Icc4.TagTable.TagDefinition.MediaWhitePointTag, self)._write__seq(io)
                    self._io.write_u4be(int(self.tag_type))
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.xyz_type:
                        pass
                        self.tag_data._write__seq(self._io)


                def _check(self):
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.xyz_type:
                        pass
                        if self.tag_data._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"tag_data", self._root, self.tag_data._root)
                        if self.tag_data._parent != self:
                            raise kaitaistruct.ConsistencyError(u"tag_data", self, self.tag_data._parent)
                    self._dirty = False


            class MultiLocalizedUnicodeType(ReadWriteKaitaiStruct):
                def __init__(self, _io=None, _parent=None, _root=None):
                    super(Icc4.TagTable.TagDefinition.MultiLocalizedUnicodeType, self).__init__(_io)
                    self._parent = _parent
                    self._root = _root

                def _read(self):
                    self.reserved = self._io.read_bytes(4)
                    if not self.reserved == b"\x00\x00\x00\x00":
                        raise kaitaistruct.ValidationNotEqualError(b"\x00\x00\x00\x00", self.reserved, self._io, u"/types/tag_table/types/tag_definition/types/multi_localized_unicode_type/seq/0")
                    self.number_of_records = self._io.read_u4be()
                    self.record_size = self._io.read_u4be()
                    self.records = []
                    for i in range(self.number_of_records):
                        _t_records = Icc4.TagTable.TagDefinition.MultiLocalizedUnicodeType.Record(self._io, self, self._root)
                        try:
                            _t_records._read()
                        finally:
                            self.records.append(_t_records)

                    self._dirty = False


                def _fetch_instances(self):
                    pass
                    for i in range(len(self.records)):
                        pass
                        self.records[i]._fetch_instances()



                def _write__seq(self, io=None):
                    super(Icc4.TagTable.TagDefinition.MultiLocalizedUnicodeType, self)._write__seq(io)
                    self._io.write_bytes(self.reserved)
                    self._io.write_u4be(self.number_of_records)
                    self._io.write_u4be(self.record_size)
                    for i in range(len(self.records)):
                        pass
                        self.records[i]._write__seq(self._io)



                def _check(self):
                    if len(self.reserved) != 4:
                        raise kaitaistruct.ConsistencyError(u"reserved", 4, len(self.reserved))
                    if not self.reserved == b"\x00\x00\x00\x00":
                        raise kaitaistruct.ValidationNotEqualError(b"\x00\x00\x00\x00", self.reserved, None, u"/types/tag_table/types/tag_definition/types/multi_localized_unicode_type/seq/0")
                    if len(self.records) != self.number_of_records:
                        raise kaitaistruct.ConsistencyError(u"records", self.number_of_records, len(self.records))
                    for i in range(len(self.records)):
                        pass
                        if self.records[i]._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"records", self._root, self.records[i]._root)
                        if self.records[i]._parent != self:
                            raise kaitaistruct.ConsistencyError(u"records", self, self.records[i]._parent)

                    self._dirty = False

                class Record(ReadWriteKaitaiStruct):
                    def __init__(self, _io=None, _parent=None, _root=None):
                        super(Icc4.TagTable.TagDefinition.MultiLocalizedUnicodeType.Record, self).__init__(_io)
                        self._parent = _parent
                        self._root = _root
                        self._should_write_string_data = False
                        self.string_data__enabled = True

                    def _read(self):
                        self.language_code = self._io.read_u2be()
                        self.country_code = self._io.read_u2be()
                        self.string_length = self._io.read_u4be()
                        self.string_offset = self._io.read_u4be()
                        self._dirty = False


                    def _fetch_instances(self):
                        pass
                        _ = self.string_data
                        if hasattr(self, '_m_string_data'):
                            pass



                    def _write__seq(self, io=None):
                        super(Icc4.TagTable.TagDefinition.MultiLocalizedUnicodeType.Record, self)._write__seq(io)
                        self._should_write_string_data = self.string_data__enabled
                        self._io.write_u2be(self.language_code)
                        self._io.write_u2be(self.country_code)
                        self._io.write_u4be(self.string_length)
                        self._io.write_u4be(self.string_offset)


                    def _check(self):
                        if self.string_data__enabled:
                            pass
                            if len((self._m_string_data).encode(u"UTF-16BE")) != self.string_length:
                                raise kaitaistruct.ConsistencyError(u"string_data", self.string_length, len((self._m_string_data).encode(u"UTF-16BE")))

                        self._dirty = False

                    @property
                    def string_data(self):
                        if self._should_write_string_data:
                            self._write_string_data()
                        if hasattr(self, '_m_string_data'):
                            return self._m_string_data

                        if not self.string_data__enabled:
                            return None

                        _pos = self._io.pos()
                        self._io.seek(self.string_offset)
                        self._m_string_data = (self._io.read_bytes(self.string_length)).decode(u"UTF-16BE")
                        self._io.seek(_pos)
                        return getattr(self, '_m_string_data', None)

                    @string_data.setter
                    def string_data(self, v):
                        self._dirty = True
                        self._m_string_data = v

                    def _write_string_data(self):
                        self._should_write_string_data = False
                        _pos = self._io.pos()
                        self._io.seek(self.string_offset)
                        self._io.write_bytes((self._m_string_data).encode(u"UTF-16BE"))
                        self._io.seek(_pos)



            class MultiProcessElementsType(ReadWriteKaitaiStruct):
                def __init__(self, _io=None, _parent=None, _root=None):
                    super(Icc4.TagTable.TagDefinition.MultiProcessElementsType, self).__init__(_io)
                    self._parent = _parent
                    self._root = _root

                def _read(self):
                    self.reserved = self._io.read_bytes(4)
                    if not self.reserved == b"\x00\x00\x00\x00":
                        raise kaitaistruct.ValidationNotEqualError(b"\x00\x00\x00\x00", self.reserved, self._io, u"/types/tag_table/types/tag_definition/types/multi_process_elements_type/seq/0")
                    self.number_of_input_channels = self._io.read_u2be()
                    self.number_of_output_channels = self._io.read_u2be()
                    self.number_of_processing_elements = self._io.read_u4be()
                    self.process_element_positions_table = []
                    for i in range(self.number_of_processing_elements):
                        _t_process_element_positions_table = Icc4.PositionNumber(self._io, self, self._root)
                        try:
                            _t_process_element_positions_table._read()
                        finally:
                            self.process_element_positions_table.append(_t_process_element_positions_table)

                    self.data = self._io.read_bytes_full()
                    self._dirty = False


                def _fetch_instances(self):
                    pass
                    for i in range(len(self.process_element_positions_table)):
                        pass
                        self.process_element_positions_table[i]._fetch_instances()



                def _write__seq(self, io=None):
                    super(Icc4.TagTable.TagDefinition.MultiProcessElementsType, self)._write__seq(io)
                    self._io.write_bytes(self.reserved)
                    self._io.write_u2be(self.number_of_input_channels)
                    self._io.write_u2be(self.number_of_output_channels)
                    self._io.write_u4be(self.number_of_processing_elements)
                    for i in range(len(self.process_element_positions_table)):
                        pass
                        self.process_element_positions_table[i]._write__seq(self._io)

                    self._io.write_bytes(self.data)
                    if not self._io.is_eof():
                        raise kaitaistruct.ConsistencyError(u"data", 0, self._io.size() - self._io.pos())


                def _check(self):
                    if len(self.reserved) != 4:
                        raise kaitaistruct.ConsistencyError(u"reserved", 4, len(self.reserved))
                    if not self.reserved == b"\x00\x00\x00\x00":
                        raise kaitaistruct.ValidationNotEqualError(b"\x00\x00\x00\x00", self.reserved, None, u"/types/tag_table/types/tag_definition/types/multi_process_elements_type/seq/0")
                    if len(self.process_element_positions_table) != self.number_of_processing_elements:
                        raise kaitaistruct.ConsistencyError(u"process_element_positions_table", self.number_of_processing_elements, len(self.process_element_positions_table))
                    for i in range(len(self.process_element_positions_table)):
                        pass
                        if self.process_element_positions_table[i]._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"process_element_positions_table", self._root, self.process_element_positions_table[i]._root)
                        if self.process_element_positions_table[i]._parent != self:
                            raise kaitaistruct.ConsistencyError(u"process_element_positions_table", self, self.process_element_positions_table[i]._parent)

                    self._dirty = False


            class NamedColor2Tag(ReadWriteKaitaiStruct):
                def __init__(self, _io=None, _parent=None, _root=None):
                    super(Icc4.TagTable.TagDefinition.NamedColor2Tag, self).__init__(_io)
                    self._parent = _parent
                    self._root = _root

                def _read(self):
                    self.tag_type = KaitaiStream.resolve_enum(Icc4.TagTable.TagDefinition.TagTypeSignatures, self._io.read_u4be())
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.named_color_2_type:
                        pass
                        self.tag_data = Icc4.TagTable.TagDefinition.NamedColor2Type(self._io, self, self._root)
                        self.tag_data._read()
                    self._dirty = False


                def _fetch_instances(self):
                    pass
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.named_color_2_type:
                        pass
                        self.tag_data._fetch_instances()


                def _write__seq(self, io=None):
                    super(Icc4.TagTable.TagDefinition.NamedColor2Tag, self)._write__seq(io)
                    self._io.write_u4be(int(self.tag_type))
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.named_color_2_type:
                        pass
                        self.tag_data._write__seq(self._io)


                def _check(self):
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.named_color_2_type:
                        pass
                        if self.tag_data._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"tag_data", self._root, self.tag_data._root)
                        if self.tag_data._parent != self:
                            raise kaitaistruct.ConsistencyError(u"tag_data", self, self.tag_data._parent)
                    self._dirty = False


            class NamedColor2Type(ReadWriteKaitaiStruct):
                def __init__(self, _io=None, _parent=None, _root=None):
                    super(Icc4.TagTable.TagDefinition.NamedColor2Type, self).__init__(_io)
                    self._parent = _parent
                    self._root = _root

                def _read(self):
                    self.reserved = self._io.read_bytes(4)
                    if not self.reserved == b"\x00\x00\x00\x00":
                        raise kaitaistruct.ValidationNotEqualError(b"\x00\x00\x00\x00", self.reserved, self._io, u"/types/tag_table/types/tag_definition/types/named_color_2_type/seq/0")
                    self.vendor_specific_flag = self._io.read_u4be()
                    self.count_of_named_colours = self._io.read_u4be()
                    self.number_of_device_coordinates_for_each_named_colour = self._io.read_u4be()
                    self.prefix_for_each_colour_name = (self._io.read_bytes_term(0, False, True, True)).decode(u"ASCII")
                    self.prefix_for_each_colour_name_padding = []
                    for i in range(32 - len(self.prefix_for_each_colour_name)):
                        self.prefix_for_each_colour_name_padding.append(self._io.read_bytes(1))
                        if not self.prefix_for_each_colour_name_padding[i] == b"\x00":
                            raise kaitaistruct.ValidationNotEqualError(b"\x00", self.prefix_for_each_colour_name_padding[i], self._io, u"/types/tag_table/types/tag_definition/types/named_color_2_type/seq/5")

                    self.suffix_for_each_colour_name = (self._io.read_bytes_term(0, False, True, True)).decode(u"ASCII")
                    self.suffix_for_each_colour_name_padding = []
                    for i in range(32 - len(self.suffix_for_each_colour_name)):
                        self.suffix_for_each_colour_name_padding.append(self._io.read_bytes(1))
                        if not self.suffix_for_each_colour_name_padding[i] == b"\x00":
                            raise kaitaistruct.ValidationNotEqualError(b"\x00", self.suffix_for_each_colour_name_padding[i], self._io, u"/types/tag_table/types/tag_definition/types/named_color_2_type/seq/7")

                    self.named_colour_definitions = []
                    for i in range(self.count_of_named_colours):
                        _t_named_colour_definitions = Icc4.TagTable.TagDefinition.NamedColor2Type.NamedColourDefinition(self._io, self, self._root)
                        try:
                            _t_named_colour_definitions._read()
                        finally:
                            self.named_colour_definitions.append(_t_named_colour_definitions)

                    self._dirty = False


                def _fetch_instances(self):
                    pass
                    for i in range(len(self.prefix_for_each_colour_name_padding)):
                        pass

                    for i in range(len(self.suffix_for_each_colour_name_padding)):
                        pass

                    for i in range(len(self.named_colour_definitions)):
                        pass
                        self.named_colour_definitions[i]._fetch_instances()



                def _write__seq(self, io=None):
                    super(Icc4.TagTable.TagDefinition.NamedColor2Type, self)._write__seq(io)
                    self._io.write_bytes(self.reserved)
                    self._io.write_u4be(self.vendor_specific_flag)
                    self._io.write_u4be(self.count_of_named_colours)
                    self._io.write_u4be(self.number_of_device_coordinates_for_each_named_colour)
                    self._io.write_bytes((self.prefix_for_each_colour_name).encode(u"ASCII"))
                    self._io.write_u1(0)
                    for i in range(len(self.prefix_for_each_colour_name_padding)):
                        pass
                        self._io.write_bytes(self.prefix_for_each_colour_name_padding[i])

                    self._io.write_bytes((self.suffix_for_each_colour_name).encode(u"ASCII"))
                    self._io.write_u1(0)
                    for i in range(len(self.suffix_for_each_colour_name_padding)):
                        pass
                        self._io.write_bytes(self.suffix_for_each_colour_name_padding[i])

                    for i in range(len(self.named_colour_definitions)):
                        pass
                        self.named_colour_definitions[i]._write__seq(self._io)



                def _check(self):
                    if len(self.reserved) != 4:
                        raise kaitaistruct.ConsistencyError(u"reserved", 4, len(self.reserved))
                    if not self.reserved == b"\x00\x00\x00\x00":
                        raise kaitaistruct.ValidationNotEqualError(b"\x00\x00\x00\x00", self.reserved, None, u"/types/tag_table/types/tag_definition/types/named_color_2_type/seq/0")
                    if KaitaiStream.byte_array_index_of((self.prefix_for_each_colour_name).encode(u"ASCII"), 0) != -1:
                        raise kaitaistruct.ConsistencyError(u"prefix_for_each_colour_name", -1, KaitaiStream.byte_array_index_of((self.prefix_for_each_colour_name).encode(u"ASCII"), 0))
                    if len(self.prefix_for_each_colour_name_padding) != 32 - len(self.prefix_for_each_colour_name):
                        raise kaitaistruct.ConsistencyError(u"prefix_for_each_colour_name_padding", 32 - len(self.prefix_for_each_colour_name), len(self.prefix_for_each_colour_name_padding))
                    for i in range(len(self.prefix_for_each_colour_name_padding)):
                        pass
                        if len(self.prefix_for_each_colour_name_padding[i]) != 1:
                            raise kaitaistruct.ConsistencyError(u"prefix_for_each_colour_name_padding", 1, len(self.prefix_for_each_colour_name_padding[i]))
                        if not self.prefix_for_each_colour_name_padding[i] == b"\x00":
                            raise kaitaistruct.ValidationNotEqualError(b"\x00", self.prefix_for_each_colour_name_padding[i], None, u"/types/tag_table/types/tag_definition/types/named_color_2_type/seq/5")

                    if KaitaiStream.byte_array_index_of((self.suffix_for_each_colour_name).encode(u"ASCII"), 0) != -1:
                        raise kaitaistruct.ConsistencyError(u"suffix_for_each_colour_name", -1, KaitaiStream.byte_array_index_of((self.suffix_for_each_colour_name).encode(u"ASCII"), 0))
                    if len(self.suffix_for_each_colour_name_padding) != 32 - len(self.suffix_for_each_colour_name):
                        raise kaitaistruct.ConsistencyError(u"suffix_for_each_colour_name_padding", 32 - len(self.suffix_for_each_colour_name), len(self.suffix_for_each_colour_name_padding))
                    for i in range(len(self.suffix_for_each_colour_name_padding)):
                        pass
                        if len(self.suffix_for_each_colour_name_padding[i]) != 1:
                            raise kaitaistruct.ConsistencyError(u"suffix_for_each_colour_name_padding", 1, len(self.suffix_for_each_colour_name_padding[i]))
                        if not self.suffix_for_each_colour_name_padding[i] == b"\x00":
                            raise kaitaistruct.ValidationNotEqualError(b"\x00", self.suffix_for_each_colour_name_padding[i], None, u"/types/tag_table/types/tag_definition/types/named_color_2_type/seq/7")

                    if len(self.named_colour_definitions) != self.count_of_named_colours:
                        raise kaitaistruct.ConsistencyError(u"named_colour_definitions", self.count_of_named_colours, len(self.named_colour_definitions))
                    for i in range(len(self.named_colour_definitions)):
                        pass
                        if self.named_colour_definitions[i]._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"named_colour_definitions", self._root, self.named_colour_definitions[i]._root)
                        if self.named_colour_definitions[i]._parent != self:
                            raise kaitaistruct.ConsistencyError(u"named_colour_definitions", self, self.named_colour_definitions[i]._parent)

                    self._dirty = False

                class NamedColourDefinition(ReadWriteKaitaiStruct):
                    def __init__(self, _io=None, _parent=None, _root=None):
                        super(Icc4.TagTable.TagDefinition.NamedColor2Type.NamedColourDefinition, self).__init__(_io)
                        self._parent = _parent
                        self._root = _root

                    def _read(self):
                        self.root_name = (self._io.read_bytes_term(0, False, True, True)).decode(u"ASCII")
                        self.root_name_padding = []
                        for i in range(32 - len(self.root_name)):
                            self.root_name_padding.append(self._io.read_bytes(1))
                            if not self.root_name_padding[i] == b"\x00":
                                raise kaitaistruct.ValidationNotEqualError(b"\x00", self.root_name_padding[i], self._io, u"/types/tag_table/types/tag_definition/types/named_color_2_type/types/named_colour_definition/seq/1")

                        self.pcs_coordinates = self._io.read_bytes(6)
                        if self._parent.number_of_device_coordinates_for_each_named_colour > 0:
                            pass
                            self.device_coordinates = []
                            for i in range(self._parent.number_of_device_coordinates_for_each_named_colour):
                                self.device_coordinates.append(self._io.read_u2be())


                        self._dirty = False


                    def _fetch_instances(self):
                        pass
                        for i in range(len(self.root_name_padding)):
                            pass

                        if self._parent.number_of_device_coordinates_for_each_named_colour > 0:
                            pass
                            for i in range(len(self.device_coordinates)):
                                pass




                    def _write__seq(self, io=None):
                        super(Icc4.TagTable.TagDefinition.NamedColor2Type.NamedColourDefinition, self)._write__seq(io)
                        self._io.write_bytes((self.root_name).encode(u"ASCII"))
                        self._io.write_u1(0)
                        for i in range(len(self.root_name_padding)):
                            pass
                            self._io.write_bytes(self.root_name_padding[i])

                        self._io.write_bytes(self.pcs_coordinates)
                        if self._parent.number_of_device_coordinates_for_each_named_colour > 0:
                            pass
                            for i in range(len(self.device_coordinates)):
                                pass
                                self._io.write_u2be(self.device_coordinates[i])




                    def _check(self):
                        if KaitaiStream.byte_array_index_of((self.root_name).encode(u"ASCII"), 0) != -1:
                            raise kaitaistruct.ConsistencyError(u"root_name", -1, KaitaiStream.byte_array_index_of((self.root_name).encode(u"ASCII"), 0))
                        if len(self.root_name_padding) != 32 - len(self.root_name):
                            raise kaitaistruct.ConsistencyError(u"root_name_padding", 32 - len(self.root_name), len(self.root_name_padding))
                        for i in range(len(self.root_name_padding)):
                            pass
                            if len(self.root_name_padding[i]) != 1:
                                raise kaitaistruct.ConsistencyError(u"root_name_padding", 1, len(self.root_name_padding[i]))
                            if not self.root_name_padding[i] == b"\x00":
                                raise kaitaistruct.ValidationNotEqualError(b"\x00", self.root_name_padding[i], None, u"/types/tag_table/types/tag_definition/types/named_color_2_type/types/named_colour_definition/seq/1")

                        if len(self.pcs_coordinates) != 6:
                            raise kaitaistruct.ConsistencyError(u"pcs_coordinates", 6, len(self.pcs_coordinates))
                        if self._parent.number_of_device_coordinates_for_each_named_colour > 0:
                            pass
                            if len(self.device_coordinates) != self._parent.number_of_device_coordinates_for_each_named_colour:
                                raise kaitaistruct.ConsistencyError(u"device_coordinates", self._parent.number_of_device_coordinates_for_each_named_colour, len(self.device_coordinates))
                            for i in range(len(self.device_coordinates)):
                                pass


                        self._dirty = False



            class OutputResponseTag(ReadWriteKaitaiStruct):
                def __init__(self, _io=None, _parent=None, _root=None):
                    super(Icc4.TagTable.TagDefinition.OutputResponseTag, self).__init__(_io)
                    self._parent = _parent
                    self._root = _root

                def _read(self):
                    self.tag_type = KaitaiStream.resolve_enum(Icc4.TagTable.TagDefinition.TagTypeSignatures, self._io.read_u4be())
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.response_curve_set_16_type:
                        pass
                        self.tag_data = Icc4.TagTable.TagDefinition.ResponseCurveSet16Type(self._io, self, self._root)
                        self.tag_data._read()
                    self._dirty = False


                def _fetch_instances(self):
                    pass
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.response_curve_set_16_type:
                        pass
                        self.tag_data._fetch_instances()


                def _write__seq(self, io=None):
                    super(Icc4.TagTable.TagDefinition.OutputResponseTag, self)._write__seq(io)
                    self._io.write_u4be(int(self.tag_type))
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.response_curve_set_16_type:
                        pass
                        self.tag_data._write__seq(self._io)


                def _check(self):
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.response_curve_set_16_type:
                        pass
                        if self.tag_data._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"tag_data", self._root, self.tag_data._root)
                        if self.tag_data._parent != self:
                            raise kaitaistruct.ConsistencyError(u"tag_data", self, self.tag_data._parent)
                    self._dirty = False


            class ParametricCurveType(ReadWriteKaitaiStruct):

                class ParametricCurveTypeFunctions(IntEnum):
                    y_equals_x_to_power_of_g = 0
                    cie_122_1996 = 1
                    iec_61966_3 = 2
                    iec_61966_2_1 = 3
                    y_equals_ob_ax_plus_b_cb_to_power_of_g_plus_c = 4
                def __init__(self, _io=None, _parent=None, _root=None):
                    super(Icc4.TagTable.TagDefinition.ParametricCurveType, self).__init__(_io)
                    self._parent = _parent
                    self._root = _root

                def _read(self):
                    self.reserved = self._io.read_bytes(4)
                    if not self.reserved == b"\x00\x00\x00\x00":
                        raise kaitaistruct.ValidationNotEqualError(b"\x00\x00\x00\x00", self.reserved, self._io, u"/types/tag_table/types/tag_definition/types/parametric_curve_type/seq/0")
                    self.function_type = KaitaiStream.resolve_enum(Icc4.TagTable.TagDefinition.ParametricCurveType.ParametricCurveTypeFunctions, self._io.read_u2be())
                    self.reserved_2 = self._io.read_bytes(2)
                    if not self.reserved_2 == b"\x00\x00":
                        raise kaitaistruct.ValidationNotEqualError(b"\x00\x00", self.reserved_2, self._io, u"/types/tag_table/types/tag_definition/types/parametric_curve_type/seq/2")
                    _on = self.function_type
                    if _on == Icc4.TagTable.TagDefinition.ParametricCurveType.ParametricCurveTypeFunctions.cie_122_1996:
                        pass
                        self.parameters = Icc4.TagTable.TagDefinition.ParametricCurveType.ParamsCie1221996(self._io, self, self._root)
                        self.parameters._read()
                    elif _on == Icc4.TagTable.TagDefinition.ParametricCurveType.ParametricCurveTypeFunctions.iec_61966_2_1:
                        pass
                        self.parameters = Icc4.TagTable.TagDefinition.ParametricCurveType.ParamsIec6196621(self._io, self, self._root)
                        self.parameters._read()
                    elif _on == Icc4.TagTable.TagDefinition.ParametricCurveType.ParametricCurveTypeFunctions.iec_61966_3:
                        pass
                        self.parameters = Icc4.TagTable.TagDefinition.ParametricCurveType.ParamsIec619663(self._io, self, self._root)
                        self.parameters._read()
                    elif _on == Icc4.TagTable.TagDefinition.ParametricCurveType.ParametricCurveTypeFunctions.y_equals_ob_ax_plus_b_cb_to_power_of_g_plus_c:
                        pass
                        self.parameters = Icc4.TagTable.TagDefinition.ParametricCurveType.ParamsYEqualsObAxPlusBCbToPowerOfGPlusC(self._io, self, self._root)
                        self.parameters._read()
                    elif _on == Icc4.TagTable.TagDefinition.ParametricCurveType.ParametricCurveTypeFunctions.y_equals_x_to_power_of_g:
                        pass
                        self.parameters = Icc4.TagTable.TagDefinition.ParametricCurveType.ParamsYEqualsXToPowerOfG(self._io, self, self._root)
                        self.parameters._read()
                    self._dirty = False


                def _fetch_instances(self):
                    pass
                    _on = self.function_type
                    if _on == Icc4.TagTable.TagDefinition.ParametricCurveType.ParametricCurveTypeFunctions.cie_122_1996:
                        pass
                        self.parameters._fetch_instances()
                    elif _on == Icc4.TagTable.TagDefinition.ParametricCurveType.ParametricCurveTypeFunctions.iec_61966_2_1:
                        pass
                        self.parameters._fetch_instances()
                    elif _on == Icc4.TagTable.TagDefinition.ParametricCurveType.ParametricCurveTypeFunctions.iec_61966_3:
                        pass
                        self.parameters._fetch_instances()
                    elif _on == Icc4.TagTable.TagDefinition.ParametricCurveType.ParametricCurveTypeFunctions.y_equals_ob_ax_plus_b_cb_to_power_of_g_plus_c:
                        pass
                        self.parameters._fetch_instances()
                    elif _on == Icc4.TagTable.TagDefinition.ParametricCurveType.ParametricCurveTypeFunctions.y_equals_x_to_power_of_g:
                        pass
                        self.parameters._fetch_instances()


                def _write__seq(self, io=None):
                    super(Icc4.TagTable.TagDefinition.ParametricCurveType, self)._write__seq(io)
                    self._io.write_bytes(self.reserved)
                    self._io.write_u2be(int(self.function_type))
                    self._io.write_bytes(self.reserved_2)
                    _on = self.function_type
                    if _on == Icc4.TagTable.TagDefinition.ParametricCurveType.ParametricCurveTypeFunctions.cie_122_1996:
                        pass
                        self.parameters._write__seq(self._io)
                    elif _on == Icc4.TagTable.TagDefinition.ParametricCurveType.ParametricCurveTypeFunctions.iec_61966_2_1:
                        pass
                        self.parameters._write__seq(self._io)
                    elif _on == Icc4.TagTable.TagDefinition.ParametricCurveType.ParametricCurveTypeFunctions.iec_61966_3:
                        pass
                        self.parameters._write__seq(self._io)
                    elif _on == Icc4.TagTable.TagDefinition.ParametricCurveType.ParametricCurveTypeFunctions.y_equals_ob_ax_plus_b_cb_to_power_of_g_plus_c:
                        pass
                        self.parameters._write__seq(self._io)
                    elif _on == Icc4.TagTable.TagDefinition.ParametricCurveType.ParametricCurveTypeFunctions.y_equals_x_to_power_of_g:
                        pass
                        self.parameters._write__seq(self._io)


                def _check(self):
                    if len(self.reserved) != 4:
                        raise kaitaistruct.ConsistencyError(u"reserved", 4, len(self.reserved))
                    if not self.reserved == b"\x00\x00\x00\x00":
                        raise kaitaistruct.ValidationNotEqualError(b"\x00\x00\x00\x00", self.reserved, None, u"/types/tag_table/types/tag_definition/types/parametric_curve_type/seq/0")
                    if len(self.reserved_2) != 2:
                        raise kaitaistruct.ConsistencyError(u"reserved_2", 2, len(self.reserved_2))
                    if not self.reserved_2 == b"\x00\x00":
                        raise kaitaistruct.ValidationNotEqualError(b"\x00\x00", self.reserved_2, None, u"/types/tag_table/types/tag_definition/types/parametric_curve_type/seq/2")
                    _on = self.function_type
                    if _on == Icc4.TagTable.TagDefinition.ParametricCurveType.ParametricCurveTypeFunctions.cie_122_1996:
                        pass
                        if self.parameters._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"parameters", self._root, self.parameters._root)
                        if self.parameters._parent != self:
                            raise kaitaistruct.ConsistencyError(u"parameters", self, self.parameters._parent)
                    elif _on == Icc4.TagTable.TagDefinition.ParametricCurveType.ParametricCurveTypeFunctions.iec_61966_2_1:
                        pass
                        if self.parameters._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"parameters", self._root, self.parameters._root)
                        if self.parameters._parent != self:
                            raise kaitaistruct.ConsistencyError(u"parameters", self, self.parameters._parent)
                    elif _on == Icc4.TagTable.TagDefinition.ParametricCurveType.ParametricCurveTypeFunctions.iec_61966_3:
                        pass
                        if self.parameters._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"parameters", self._root, self.parameters._root)
                        if self.parameters._parent != self:
                            raise kaitaistruct.ConsistencyError(u"parameters", self, self.parameters._parent)
                    elif _on == Icc4.TagTable.TagDefinition.ParametricCurveType.ParametricCurveTypeFunctions.y_equals_ob_ax_plus_b_cb_to_power_of_g_plus_c:
                        pass
                        if self.parameters._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"parameters", self._root, self.parameters._root)
                        if self.parameters._parent != self:
                            raise kaitaistruct.ConsistencyError(u"parameters", self, self.parameters._parent)
                    elif _on == Icc4.TagTable.TagDefinition.ParametricCurveType.ParametricCurveTypeFunctions.y_equals_x_to_power_of_g:
                        pass
                        if self.parameters._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"parameters", self._root, self.parameters._root)
                        if self.parameters._parent != self:
                            raise kaitaistruct.ConsistencyError(u"parameters", self, self.parameters._parent)
                    self._dirty = False

                class ParamsCie1221996(ReadWriteKaitaiStruct):
                    def __init__(self, _io=None, _parent=None, _root=None):
                        super(Icc4.TagTable.TagDefinition.ParametricCurveType.ParamsCie1221996, self).__init__(_io)
                        self._parent = _parent
                        self._root = _root

                    def _read(self):
                        self.g = self._io.read_s4be()
                        self.a = self._io.read_s4be()
                        self.b = self._io.read_s4be()
                        self._dirty = False


                    def _fetch_instances(self):
                        pass


                    def _write__seq(self, io=None):
                        super(Icc4.TagTable.TagDefinition.ParametricCurveType.ParamsCie1221996, self)._write__seq(io)
                        self._io.write_s4be(self.g)
                        self._io.write_s4be(self.a)
                        self._io.write_s4be(self.b)


                    def _check(self):
                        self._dirty = False


                class ParamsIec6196621(ReadWriteKaitaiStruct):
                    def __init__(self, _io=None, _parent=None, _root=None):
                        super(Icc4.TagTable.TagDefinition.ParametricCurveType.ParamsIec6196621, self).__init__(_io)
                        self._parent = _parent
                        self._root = _root

                    def _read(self):
                        self.g = self._io.read_s4be()
                        self.a = self._io.read_s4be()
                        self.b = self._io.read_s4be()
                        self.c = self._io.read_s4be()
                        self.d = self._io.read_s4be()
                        self._dirty = False


                    def _fetch_instances(self):
                        pass


                    def _write__seq(self, io=None):
                        super(Icc4.TagTable.TagDefinition.ParametricCurveType.ParamsIec6196621, self)._write__seq(io)
                        self._io.write_s4be(self.g)
                        self._io.write_s4be(self.a)
                        self._io.write_s4be(self.b)
                        self._io.write_s4be(self.c)
                        self._io.write_s4be(self.d)


                    def _check(self):
                        self._dirty = False


                class ParamsIec619663(ReadWriteKaitaiStruct):
                    def __init__(self, _io=None, _parent=None, _root=None):
                        super(Icc4.TagTable.TagDefinition.ParametricCurveType.ParamsIec619663, self).__init__(_io)
                        self._parent = _parent
                        self._root = _root

                    def _read(self):
                        self.g = self._io.read_s4be()
                        self.a = self._io.read_s4be()
                        self.b = self._io.read_s4be()
                        self.c = self._io.read_s4be()
                        self._dirty = False


                    def _fetch_instances(self):
                        pass


                    def _write__seq(self, io=None):
                        super(Icc4.TagTable.TagDefinition.ParametricCurveType.ParamsIec619663, self)._write__seq(io)
                        self._io.write_s4be(self.g)
                        self._io.write_s4be(self.a)
                        self._io.write_s4be(self.b)
                        self._io.write_s4be(self.c)


                    def _check(self):
                        self._dirty = False


                class ParamsYEqualsObAxPlusBCbToPowerOfGPlusC(ReadWriteKaitaiStruct):
                    def __init__(self, _io=None, _parent=None, _root=None):
                        super(Icc4.TagTable.TagDefinition.ParametricCurveType.ParamsYEqualsObAxPlusBCbToPowerOfGPlusC, self).__init__(_io)
                        self._parent = _parent
                        self._root = _root

                    def _read(self):
                        self.g = self._io.read_s4be()
                        self.a = self._io.read_s4be()
                        self.b = self._io.read_s4be()
                        self.c = self._io.read_s4be()
                        self.d = self._io.read_s4be()
                        self.e = self._io.read_s4be()
                        self.f = self._io.read_s4be()
                        self._dirty = False


                    def _fetch_instances(self):
                        pass


                    def _write__seq(self, io=None):
                        super(Icc4.TagTable.TagDefinition.ParametricCurveType.ParamsYEqualsObAxPlusBCbToPowerOfGPlusC, self)._write__seq(io)
                        self._io.write_s4be(self.g)
                        self._io.write_s4be(self.a)
                        self._io.write_s4be(self.b)
                        self._io.write_s4be(self.c)
                        self._io.write_s4be(self.d)
                        self._io.write_s4be(self.e)
                        self._io.write_s4be(self.f)


                    def _check(self):
                        self._dirty = False


                class ParamsYEqualsXToPowerOfG(ReadWriteKaitaiStruct):
                    def __init__(self, _io=None, _parent=None, _root=None):
                        super(Icc4.TagTable.TagDefinition.ParametricCurveType.ParamsYEqualsXToPowerOfG, self).__init__(_io)
                        self._parent = _parent
                        self._root = _root

                    def _read(self):
                        self.g = self._io.read_s4be()
                        self._dirty = False


                    def _fetch_instances(self):
                        pass


                    def _write__seq(self, io=None):
                        super(Icc4.TagTable.TagDefinition.ParametricCurveType.ParamsYEqualsXToPowerOfG, self)._write__seq(io)
                        self._io.write_s4be(self.g)


                    def _check(self):
                        self._dirty = False



            class PerceptualRenderingIntentGamutTag(ReadWriteKaitaiStruct):
                def __init__(self, _io=None, _parent=None, _root=None):
                    super(Icc4.TagTable.TagDefinition.PerceptualRenderingIntentGamutTag, self).__init__(_io)
                    self._parent = _parent
                    self._root = _root

                def _read(self):
                    self.tag_type = KaitaiStream.resolve_enum(Icc4.TagTable.TagDefinition.TagTypeSignatures, self._io.read_u4be())
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.signature_type:
                        pass
                        self.tag_data = Icc4.TagTable.TagDefinition.SignatureType(self._io, self, self._root)
                        self.tag_data._read()
                    self._dirty = False


                def _fetch_instances(self):
                    pass
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.signature_type:
                        pass
                        self.tag_data._fetch_instances()


                def _write__seq(self, io=None):
                    super(Icc4.TagTable.TagDefinition.PerceptualRenderingIntentGamutTag, self)._write__seq(io)
                    self._io.write_u4be(int(self.tag_type))
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.signature_type:
                        pass
                        self.tag_data._write__seq(self._io)


                def _check(self):
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.signature_type:
                        pass
                        if self.tag_data._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"tag_data", self._root, self.tag_data._root)
                        if self.tag_data._parent != self:
                            raise kaitaistruct.ConsistencyError(u"tag_data", self, self.tag_data._parent)
                    self._dirty = False


            class Preview0Tag(ReadWriteKaitaiStruct):
                def __init__(self, _io=None, _parent=None, _root=None):
                    super(Icc4.TagTable.TagDefinition.Preview0Tag, self).__init__(_io)
                    self._parent = _parent
                    self._root = _root

                def _read(self):
                    self.tag_type = KaitaiStream.resolve_enum(Icc4.TagTable.TagDefinition.TagTypeSignatures, self._io.read_u4be())
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.multi_function_a_to_b_table_type:
                        pass
                        self.tag_data = Icc4.TagTable.TagDefinition.LutAToBType(self._io, self, self._root)
                        self.tag_data._read()
                    elif _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.multi_function_b_to_a_table_type:
                        pass
                        self.tag_data = Icc4.TagTable.TagDefinition.LutBToAType(self._io, self, self._root)
                        self.tag_data._read()
                    elif _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.multi_function_table_with_one_byte_precision_type:
                        pass
                        self.tag_data = Icc4.TagTable.TagDefinition.Lut8Type(self._io, self, self._root)
                        self.tag_data._read()
                    elif _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.multi_function_table_with_two_byte_precision_type:
                        pass
                        self.tag_data = Icc4.TagTable.TagDefinition.Lut16Type(self._io, self, self._root)
                        self.tag_data._read()
                    self._dirty = False


                def _fetch_instances(self):
                    pass
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.multi_function_a_to_b_table_type:
                        pass
                        self.tag_data._fetch_instances()
                    elif _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.multi_function_b_to_a_table_type:
                        pass
                        self.tag_data._fetch_instances()
                    elif _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.multi_function_table_with_one_byte_precision_type:
                        pass
                        self.tag_data._fetch_instances()
                    elif _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.multi_function_table_with_two_byte_precision_type:
                        pass
                        self.tag_data._fetch_instances()


                def _write__seq(self, io=None):
                    super(Icc4.TagTable.TagDefinition.Preview0Tag, self)._write__seq(io)
                    self._io.write_u4be(int(self.tag_type))
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.multi_function_a_to_b_table_type:
                        pass
                        self.tag_data._write__seq(self._io)
                    elif _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.multi_function_b_to_a_table_type:
                        pass
                        self.tag_data._write__seq(self._io)
                    elif _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.multi_function_table_with_one_byte_precision_type:
                        pass
                        self.tag_data._write__seq(self._io)
                    elif _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.multi_function_table_with_two_byte_precision_type:
                        pass
                        self.tag_data._write__seq(self._io)


                def _check(self):
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.multi_function_a_to_b_table_type:
                        pass
                        if self.tag_data._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"tag_data", self._root, self.tag_data._root)
                        if self.tag_data._parent != self:
                            raise kaitaistruct.ConsistencyError(u"tag_data", self, self.tag_data._parent)
                    elif _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.multi_function_b_to_a_table_type:
                        pass
                        if self.tag_data._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"tag_data", self._root, self.tag_data._root)
                        if self.tag_data._parent != self:
                            raise kaitaistruct.ConsistencyError(u"tag_data", self, self.tag_data._parent)
                    elif _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.multi_function_table_with_one_byte_precision_type:
                        pass
                        if self.tag_data._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"tag_data", self._root, self.tag_data._root)
                        if self.tag_data._parent != self:
                            raise kaitaistruct.ConsistencyError(u"tag_data", self, self.tag_data._parent)
                    elif _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.multi_function_table_with_two_byte_precision_type:
                        pass
                        if self.tag_data._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"tag_data", self._root, self.tag_data._root)
                        if self.tag_data._parent != self:
                            raise kaitaistruct.ConsistencyError(u"tag_data", self, self.tag_data._parent)
                    self._dirty = False


            class Preview1Tag(ReadWriteKaitaiStruct):
                def __init__(self, _io=None, _parent=None, _root=None):
                    super(Icc4.TagTable.TagDefinition.Preview1Tag, self).__init__(_io)
                    self._parent = _parent
                    self._root = _root

                def _read(self):
                    self.tag_type = KaitaiStream.resolve_enum(Icc4.TagTable.TagDefinition.TagTypeSignatures, self._io.read_u4be())
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.multi_function_b_to_a_table_type:
                        pass
                        self.tag_data = Icc4.TagTable.TagDefinition.LutBToAType(self._io, self, self._root)
                        self.tag_data._read()
                    elif _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.multi_function_table_with_one_byte_precision_type:
                        pass
                        self.tag_data = Icc4.TagTable.TagDefinition.Lut8Type(self._io, self, self._root)
                        self.tag_data._read()
                    elif _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.multi_function_table_with_two_byte_precision_type:
                        pass
                        self.tag_data = Icc4.TagTable.TagDefinition.Lut16Type(self._io, self, self._root)
                        self.tag_data._read()
                    self._dirty = False


                def _fetch_instances(self):
                    pass
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.multi_function_b_to_a_table_type:
                        pass
                        self.tag_data._fetch_instances()
                    elif _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.multi_function_table_with_one_byte_precision_type:
                        pass
                        self.tag_data._fetch_instances()
                    elif _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.multi_function_table_with_two_byte_precision_type:
                        pass
                        self.tag_data._fetch_instances()


                def _write__seq(self, io=None):
                    super(Icc4.TagTable.TagDefinition.Preview1Tag, self)._write__seq(io)
                    self._io.write_u4be(int(self.tag_type))
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.multi_function_b_to_a_table_type:
                        pass
                        self.tag_data._write__seq(self._io)
                    elif _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.multi_function_table_with_one_byte_precision_type:
                        pass
                        self.tag_data._write__seq(self._io)
                    elif _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.multi_function_table_with_two_byte_precision_type:
                        pass
                        self.tag_data._write__seq(self._io)


                def _check(self):
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.multi_function_b_to_a_table_type:
                        pass
                        if self.tag_data._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"tag_data", self._root, self.tag_data._root)
                        if self.tag_data._parent != self:
                            raise kaitaistruct.ConsistencyError(u"tag_data", self, self.tag_data._parent)
                    elif _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.multi_function_table_with_one_byte_precision_type:
                        pass
                        if self.tag_data._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"tag_data", self._root, self.tag_data._root)
                        if self.tag_data._parent != self:
                            raise kaitaistruct.ConsistencyError(u"tag_data", self, self.tag_data._parent)
                    elif _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.multi_function_table_with_two_byte_precision_type:
                        pass
                        if self.tag_data._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"tag_data", self._root, self.tag_data._root)
                        if self.tag_data._parent != self:
                            raise kaitaistruct.ConsistencyError(u"tag_data", self, self.tag_data._parent)
                    self._dirty = False


            class Preview2Tag(ReadWriteKaitaiStruct):
                def __init__(self, _io=None, _parent=None, _root=None):
                    super(Icc4.TagTable.TagDefinition.Preview2Tag, self).__init__(_io)
                    self._parent = _parent
                    self._root = _root

                def _read(self):
                    self.tag_type = KaitaiStream.resolve_enum(Icc4.TagTable.TagDefinition.TagTypeSignatures, self._io.read_u4be())
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.multi_function_b_to_a_table_type:
                        pass
                        self.tag_data = Icc4.TagTable.TagDefinition.LutBToAType(self._io, self, self._root)
                        self.tag_data._read()
                    elif _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.multi_function_table_with_one_byte_precision_type:
                        pass
                        self.tag_data = Icc4.TagTable.TagDefinition.Lut8Type(self._io, self, self._root)
                        self.tag_data._read()
                    elif _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.multi_function_table_with_two_byte_precision_type:
                        pass
                        self.tag_data = Icc4.TagTable.TagDefinition.Lut16Type(self._io, self, self._root)
                        self.tag_data._read()
                    self._dirty = False


                def _fetch_instances(self):
                    pass
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.multi_function_b_to_a_table_type:
                        pass
                        self.tag_data._fetch_instances()
                    elif _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.multi_function_table_with_one_byte_precision_type:
                        pass
                        self.tag_data._fetch_instances()
                    elif _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.multi_function_table_with_two_byte_precision_type:
                        pass
                        self.tag_data._fetch_instances()


                def _write__seq(self, io=None):
                    super(Icc4.TagTable.TagDefinition.Preview2Tag, self)._write__seq(io)
                    self._io.write_u4be(int(self.tag_type))
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.multi_function_b_to_a_table_type:
                        pass
                        self.tag_data._write__seq(self._io)
                    elif _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.multi_function_table_with_one_byte_precision_type:
                        pass
                        self.tag_data._write__seq(self._io)
                    elif _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.multi_function_table_with_two_byte_precision_type:
                        pass
                        self.tag_data._write__seq(self._io)


                def _check(self):
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.multi_function_b_to_a_table_type:
                        pass
                        if self.tag_data._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"tag_data", self._root, self.tag_data._root)
                        if self.tag_data._parent != self:
                            raise kaitaistruct.ConsistencyError(u"tag_data", self, self.tag_data._parent)
                    elif _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.multi_function_table_with_one_byte_precision_type:
                        pass
                        if self.tag_data._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"tag_data", self._root, self.tag_data._root)
                        if self.tag_data._parent != self:
                            raise kaitaistruct.ConsistencyError(u"tag_data", self, self.tag_data._parent)
                    elif _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.multi_function_table_with_two_byte_precision_type:
                        pass
                        if self.tag_data._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"tag_data", self._root, self.tag_data._root)
                        if self.tag_data._parent != self:
                            raise kaitaistruct.ConsistencyError(u"tag_data", self, self.tag_data._parent)
                    self._dirty = False


            class ProfileDescriptionTag(ReadWriteKaitaiStruct):
                def __init__(self, _io=None, _parent=None, _root=None):
                    super(Icc4.TagTable.TagDefinition.ProfileDescriptionTag, self).__init__(_io)
                    self._parent = _parent
                    self._root = _root

                def _read(self):
                    self.tag_type = KaitaiStream.resolve_enum(Icc4.TagTable.TagDefinition.TagTypeSignatures, self._io.read_u4be())
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.multi_localized_unicode_type:
                        pass
                        self.tag_data = Icc4.TagTable.TagDefinition.MultiLocalizedUnicodeType(self._io, self, self._root)
                        self.tag_data._read()
                    self._dirty = False


                def _fetch_instances(self):
                    pass
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.multi_localized_unicode_type:
                        pass
                        self.tag_data._fetch_instances()


                def _write__seq(self, io=None):
                    super(Icc4.TagTable.TagDefinition.ProfileDescriptionTag, self)._write__seq(io)
                    self._io.write_u4be(int(self.tag_type))
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.multi_localized_unicode_type:
                        pass
                        self.tag_data._write__seq(self._io)


                def _check(self):
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.multi_localized_unicode_type:
                        pass
                        if self.tag_data._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"tag_data", self._root, self.tag_data._root)
                        if self.tag_data._parent != self:
                            raise kaitaistruct.ConsistencyError(u"tag_data", self, self.tag_data._parent)
                    self._dirty = False


            class ProfileSequenceDescType(ReadWriteKaitaiStruct):
                def __init__(self, _io=None, _parent=None, _root=None):
                    super(Icc4.TagTable.TagDefinition.ProfileSequenceDescType, self).__init__(_io)
                    self._parent = _parent
                    self._root = _root

                def _read(self):
                    self.reserved = self._io.read_bytes(4)
                    if not self.reserved == b"\x00\x00\x00\x00":
                        raise kaitaistruct.ValidationNotEqualError(b"\x00\x00\x00\x00", self.reserved, self._io, u"/types/tag_table/types/tag_definition/types/profile_sequence_desc_type/seq/0")
                    self.number_of_description_structures = self._io.read_u4be()
                    self.profile_descriptions = []
                    for i in range(self.number_of_description_structures):
                        _t_profile_descriptions = Icc4.TagTable.TagDefinition.ProfileSequenceDescType.ProfileDescription(self._io, self, self._root)
                        try:
                            _t_profile_descriptions._read()
                        finally:
                            self.profile_descriptions.append(_t_profile_descriptions)

                    self._dirty = False


                def _fetch_instances(self):
                    pass
                    for i in range(len(self.profile_descriptions)):
                        pass
                        self.profile_descriptions[i]._fetch_instances()



                def _write__seq(self, io=None):
                    super(Icc4.TagTable.TagDefinition.ProfileSequenceDescType, self)._write__seq(io)
                    self._io.write_bytes(self.reserved)
                    self._io.write_u4be(self.number_of_description_structures)
                    for i in range(len(self.profile_descriptions)):
                        pass
                        self.profile_descriptions[i]._write__seq(self._io)



                def _check(self):
                    if len(self.reserved) != 4:
                        raise kaitaistruct.ConsistencyError(u"reserved", 4, len(self.reserved))
                    if not self.reserved == b"\x00\x00\x00\x00":
                        raise kaitaistruct.ValidationNotEqualError(b"\x00\x00\x00\x00", self.reserved, None, u"/types/tag_table/types/tag_definition/types/profile_sequence_desc_type/seq/0")
                    if len(self.profile_descriptions) != self.number_of_description_structures:
                        raise kaitaistruct.ConsistencyError(u"profile_descriptions", self.number_of_description_structures, len(self.profile_descriptions))
                    for i in range(len(self.profile_descriptions)):
                        pass
                        if self.profile_descriptions[i]._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"profile_descriptions", self._root, self.profile_descriptions[i]._root)
                        if self.profile_descriptions[i]._parent != self:
                            raise kaitaistruct.ConsistencyError(u"profile_descriptions", self, self.profile_descriptions[i]._parent)

                    self._dirty = False

                class ProfileDescription(ReadWriteKaitaiStruct):
                    def __init__(self, _io=None, _parent=None, _root=None):
                        super(Icc4.TagTable.TagDefinition.ProfileSequenceDescType.ProfileDescription, self).__init__(_io)
                        self._parent = _parent
                        self._root = _root

                    def _read(self):
                        self.device_manufacturer = Icc4.DeviceManufacturer(self._io, self, self._root)
                        self.device_manufacturer._read()
                        self.device_model = (self._io.read_bytes(4)).decode(u"ASCII")
                        self.device_attributes = Icc4.DeviceAttributes(self._io, self, self._root)
                        self.device_attributes._read()
                        self.device_technology = Icc4.TagTable.TagDefinition.TechnologyTag(self._io, self, self._root)
                        self.device_technology._read()
                        self.description_of_device_manufacturer = Icc4.TagTable.TagDefinition.DeviceMfgDescTag(self._io, self, self._root)
                        self.description_of_device_manufacturer._read()
                        self.description_of_device_model = Icc4.TagTable.TagDefinition.DeviceModelDescTag(self._io, self, self._root)
                        self.description_of_device_model._read()
                        self._dirty = False


                    def _fetch_instances(self):
                        pass
                        self.device_manufacturer._fetch_instances()
                        self.device_attributes._fetch_instances()
                        self.device_technology._fetch_instances()
                        self.description_of_device_manufacturer._fetch_instances()
                        self.description_of_device_model._fetch_instances()


                    def _write__seq(self, io=None):
                        super(Icc4.TagTable.TagDefinition.ProfileSequenceDescType.ProfileDescription, self)._write__seq(io)
                        self.device_manufacturer._write__seq(self._io)
                        self._io.write_bytes((self.device_model).encode(u"ASCII"))
                        self.device_attributes._write__seq(self._io)
                        self.device_technology._write__seq(self._io)
                        self.description_of_device_manufacturer._write__seq(self._io)
                        self.description_of_device_model._write__seq(self._io)


                    def _check(self):
                        if self.device_manufacturer._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"device_manufacturer", self._root, self.device_manufacturer._root)
                        if self.device_manufacturer._parent != self:
                            raise kaitaistruct.ConsistencyError(u"device_manufacturer", self, self.device_manufacturer._parent)
                        if len((self.device_model).encode(u"ASCII")) != 4:
                            raise kaitaistruct.ConsistencyError(u"device_model", 4, len((self.device_model).encode(u"ASCII")))
                        if self.device_attributes._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"device_attributes", self._root, self.device_attributes._root)
                        if self.device_attributes._parent != self:
                            raise kaitaistruct.ConsistencyError(u"device_attributes", self, self.device_attributes._parent)
                        if self.device_technology._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"device_technology", self._root, self.device_technology._root)
                        if self.device_technology._parent != self:
                            raise kaitaistruct.ConsistencyError(u"device_technology", self, self.device_technology._parent)
                        if self.description_of_device_manufacturer._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"description_of_device_manufacturer", self._root, self.description_of_device_manufacturer._root)
                        if self.description_of_device_manufacturer._parent != self:
                            raise kaitaistruct.ConsistencyError(u"description_of_device_manufacturer", self, self.description_of_device_manufacturer._parent)
                        if self.description_of_device_model._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"description_of_device_model", self._root, self.description_of_device_model._root)
                        if self.description_of_device_model._parent != self:
                            raise kaitaistruct.ConsistencyError(u"description_of_device_model", self, self.description_of_device_model._parent)
                        self._dirty = False



            class ProfileSequenceIdentifierTag(ReadWriteKaitaiStruct):
                def __init__(self, _io=None, _parent=None, _root=None):
                    super(Icc4.TagTable.TagDefinition.ProfileSequenceIdentifierTag, self).__init__(_io)
                    self._parent = _parent
                    self._root = _root

                def _read(self):
                    self.tag_type = KaitaiStream.resolve_enum(Icc4.TagTable.TagDefinition.TagTypeSignatures, self._io.read_u4be())
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.profile_sequence_identifier_type:
                        pass
                        self.tag_data = Icc4.TagTable.TagDefinition.ProfileSequenceIdentifierType(self._io, self, self._root)
                        self.tag_data._read()
                    self._dirty = False


                def _fetch_instances(self):
                    pass
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.profile_sequence_identifier_type:
                        pass
                        self.tag_data._fetch_instances()


                def _write__seq(self, io=None):
                    super(Icc4.TagTable.TagDefinition.ProfileSequenceIdentifierTag, self)._write__seq(io)
                    self._io.write_u4be(int(self.tag_type))
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.profile_sequence_identifier_type:
                        pass
                        self.tag_data._write__seq(self._io)


                def _check(self):
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.profile_sequence_identifier_type:
                        pass
                        if self.tag_data._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"tag_data", self._root, self.tag_data._root)
                        if self.tag_data._parent != self:
                            raise kaitaistruct.ConsistencyError(u"tag_data", self, self.tag_data._parent)
                    self._dirty = False


            class ProfileSequenceIdentifierType(ReadWriteKaitaiStruct):
                def __init__(self, _io=None, _parent=None, _root=None):
                    super(Icc4.TagTable.TagDefinition.ProfileSequenceIdentifierType, self).__init__(_io)
                    self._parent = _parent
                    self._root = _root

                def _read(self):
                    self.reserved = self._io.read_bytes(4)
                    if not self.reserved == b"\x00\x00\x00\x00":
                        raise kaitaistruct.ValidationNotEqualError(b"\x00\x00\x00\x00", self.reserved, self._io, u"/types/tag_table/types/tag_definition/types/profile_sequence_identifier_type/seq/0")
                    self.number_of_structures = self._io.read_u4be()
                    self.positions_table = []
                    for i in range(self.number_of_structures):
                        _t_positions_table = Icc4.PositionNumber(self._io, self, self._root)
                        try:
                            _t_positions_table._read()
                        finally:
                            self.positions_table.append(_t_positions_table)

                    self.profile_identifiers = []
                    for i in range(self.number_of_structures):
                        _t_profile_identifiers = Icc4.TagTable.TagDefinition.ProfileSequenceIdentifierType.ProfileIdentifier(self._io, self, self._root)
                        try:
                            _t_profile_identifiers._read()
                        finally:
                            self.profile_identifiers.append(_t_profile_identifiers)

                    self._dirty = False


                def _fetch_instances(self):
                    pass
                    for i in range(len(self.positions_table)):
                        pass
                        self.positions_table[i]._fetch_instances()

                    for i in range(len(self.profile_identifiers)):
                        pass
                        self.profile_identifiers[i]._fetch_instances()



                def _write__seq(self, io=None):
                    super(Icc4.TagTable.TagDefinition.ProfileSequenceIdentifierType, self)._write__seq(io)
                    self._io.write_bytes(self.reserved)
                    self._io.write_u4be(self.number_of_structures)
                    for i in range(len(self.positions_table)):
                        pass
                        self.positions_table[i]._write__seq(self._io)

                    for i in range(len(self.profile_identifiers)):
                        pass
                        self.profile_identifiers[i]._write__seq(self._io)



                def _check(self):
                    if len(self.reserved) != 4:
                        raise kaitaistruct.ConsistencyError(u"reserved", 4, len(self.reserved))
                    if not self.reserved == b"\x00\x00\x00\x00":
                        raise kaitaistruct.ValidationNotEqualError(b"\x00\x00\x00\x00", self.reserved, None, u"/types/tag_table/types/tag_definition/types/profile_sequence_identifier_type/seq/0")
                    if len(self.positions_table) != self.number_of_structures:
                        raise kaitaistruct.ConsistencyError(u"positions_table", self.number_of_structures, len(self.positions_table))
                    for i in range(len(self.positions_table)):
                        pass
                        if self.positions_table[i]._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"positions_table", self._root, self.positions_table[i]._root)
                        if self.positions_table[i]._parent != self:
                            raise kaitaistruct.ConsistencyError(u"positions_table", self, self.positions_table[i]._parent)

                    if len(self.profile_identifiers) != self.number_of_structures:
                        raise kaitaistruct.ConsistencyError(u"profile_identifiers", self.number_of_structures, len(self.profile_identifiers))
                    for i in range(len(self.profile_identifiers)):
                        pass
                        if self.profile_identifiers[i]._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"profile_identifiers", self._root, self.profile_identifiers[i]._root)
                        if self.profile_identifiers[i]._parent != self:
                            raise kaitaistruct.ConsistencyError(u"profile_identifiers", self, self.profile_identifiers[i]._parent)

                    self._dirty = False

                class ProfileIdentifier(ReadWriteKaitaiStruct):
                    def __init__(self, _io=None, _parent=None, _root=None):
                        super(Icc4.TagTable.TagDefinition.ProfileSequenceIdentifierType.ProfileIdentifier, self).__init__(_io)
                        self._parent = _parent
                        self._root = _root

                    def _read(self):
                        self.profile_id = self._io.read_bytes(16)
                        self.profile_description = Icc4.TagTable.TagDefinition.MultiLocalizedUnicodeType(self._io, self, self._root)
                        self.profile_description._read()
                        self._dirty = False


                    def _fetch_instances(self):
                        pass
                        self.profile_description._fetch_instances()


                    def _write__seq(self, io=None):
                        super(Icc4.TagTable.TagDefinition.ProfileSequenceIdentifierType.ProfileIdentifier, self)._write__seq(io)
                        self._io.write_bytes(self.profile_id)
                        self.profile_description._write__seq(self._io)


                    def _check(self):
                        if len(self.profile_id) != 16:
                            raise kaitaistruct.ConsistencyError(u"profile_id", 16, len(self.profile_id))
                        if self.profile_description._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"profile_description", self._root, self.profile_description._root)
                        if self.profile_description._parent != self:
                            raise kaitaistruct.ConsistencyError(u"profile_description", self, self.profile_description._parent)
                        self._dirty = False



            class ProfileSequenceTag(ReadWriteKaitaiStruct):
                def __init__(self, _io=None, _parent=None, _root=None):
                    super(Icc4.TagTable.TagDefinition.ProfileSequenceTag, self).__init__(_io)
                    self._parent = _parent
                    self._root = _root

                def _read(self):
                    self.tag_type = KaitaiStream.resolve_enum(Icc4.TagTable.TagDefinition.TagTypeSignatures, self._io.read_u4be())
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.profile_sequence_desc_type:
                        pass
                        self.tag_data = Icc4.TagTable.TagDefinition.ProfileSequenceDescType(self._io, self, self._root)
                        self.tag_data._read()
                    self._dirty = False


                def _fetch_instances(self):
                    pass
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.profile_sequence_desc_type:
                        pass
                        self.tag_data._fetch_instances()


                def _write__seq(self, io=None):
                    super(Icc4.TagTable.TagDefinition.ProfileSequenceTag, self)._write__seq(io)
                    self._io.write_u4be(int(self.tag_type))
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.profile_sequence_desc_type:
                        pass
                        self.tag_data._write__seq(self._io)


                def _check(self):
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.profile_sequence_desc_type:
                        pass
                        if self.tag_data._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"tag_data", self._root, self.tag_data._root)
                        if self.tag_data._parent != self:
                            raise kaitaistruct.ConsistencyError(u"tag_data", self, self.tag_data._parent)
                    self._dirty = False


            class RedMatrixColumnTag(ReadWriteKaitaiStruct):
                def __init__(self, _io=None, _parent=None, _root=None):
                    super(Icc4.TagTable.TagDefinition.RedMatrixColumnTag, self).__init__(_io)
                    self._parent = _parent
                    self._root = _root

                def _read(self):
                    self.tag_type = KaitaiStream.resolve_enum(Icc4.TagTable.TagDefinition.TagTypeSignatures, self._io.read_u4be())
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.xyz_type:
                        pass
                        self.tag_data = Icc4.TagTable.TagDefinition.XyzType(self._io, self, self._root)
                        self.tag_data._read()
                    self._dirty = False


                def _fetch_instances(self):
                    pass
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.xyz_type:
                        pass
                        self.tag_data._fetch_instances()


                def _write__seq(self, io=None):
                    super(Icc4.TagTable.TagDefinition.RedMatrixColumnTag, self)._write__seq(io)
                    self._io.write_u4be(int(self.tag_type))
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.xyz_type:
                        pass
                        self.tag_data._write__seq(self._io)


                def _check(self):
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.xyz_type:
                        pass
                        if self.tag_data._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"tag_data", self._root, self.tag_data._root)
                        if self.tag_data._parent != self:
                            raise kaitaistruct.ConsistencyError(u"tag_data", self, self.tag_data._parent)
                    self._dirty = False


            class RedTrcTag(ReadWriteKaitaiStruct):
                def __init__(self, _io=None, _parent=None, _root=None):
                    super(Icc4.TagTable.TagDefinition.RedTrcTag, self).__init__(_io)
                    self._parent = _parent
                    self._root = _root

                def _read(self):
                    self.tag_type = KaitaiStream.resolve_enum(Icc4.TagTable.TagDefinition.TagTypeSignatures, self._io.read_u4be())
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.curve_type:
                        pass
                        self.tag_data = Icc4.TagTable.TagDefinition.CurveType(self._io, self, self._root)
                        self.tag_data._read()
                    elif _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.parametric_curve_type:
                        pass
                        self.tag_data = Icc4.TagTable.TagDefinition.ParametricCurveType(self._io, self, self._root)
                        self.tag_data._read()
                    self._dirty = False


                def _fetch_instances(self):
                    pass
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.curve_type:
                        pass
                        self.tag_data._fetch_instances()
                    elif _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.parametric_curve_type:
                        pass
                        self.tag_data._fetch_instances()


                def _write__seq(self, io=None):
                    super(Icc4.TagTable.TagDefinition.RedTrcTag, self)._write__seq(io)
                    self._io.write_u4be(int(self.tag_type))
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.curve_type:
                        pass
                        self.tag_data._write__seq(self._io)
                    elif _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.parametric_curve_type:
                        pass
                        self.tag_data._write__seq(self._io)


                def _check(self):
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.curve_type:
                        pass
                        if self.tag_data._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"tag_data", self._root, self.tag_data._root)
                        if self.tag_data._parent != self:
                            raise kaitaistruct.ConsistencyError(u"tag_data", self, self.tag_data._parent)
                    elif _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.parametric_curve_type:
                        pass
                        if self.tag_data._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"tag_data", self._root, self.tag_data._root)
                        if self.tag_data._parent != self:
                            raise kaitaistruct.ConsistencyError(u"tag_data", self, self.tag_data._parent)
                    self._dirty = False


            class ResponseCurveSet16Type(ReadWriteKaitaiStruct):
                def __init__(self, _io=None, _parent=None, _root=None):
                    super(Icc4.TagTable.TagDefinition.ResponseCurveSet16Type, self).__init__(_io)
                    self._parent = _parent
                    self._root = _root

                def _read(self):
                    self.reserved = self._io.read_bytes(4)
                    if not self.reserved == b"\x00\x00\x00\x00":
                        raise kaitaistruct.ValidationNotEqualError(b"\x00\x00\x00\x00", self.reserved, self._io, u"/types/tag_table/types/tag_definition/types/response_curve_set_16_type/seq/0")
                    self.number_of_channels = self._io.read_u2be()
                    self.count_of_measurement_types = self._io.read_u2be()
                    self.response_curve_structure_offsets = []
                    for i in range(self.count_of_measurement_types):
                        self.response_curve_structure_offsets.append(self._io.read_u4be())

                    self.response_curve_structures = self._io.read_bytes_full()
                    self._dirty = False


                def _fetch_instances(self):
                    pass
                    for i in range(len(self.response_curve_structure_offsets)):
                        pass



                def _write__seq(self, io=None):
                    super(Icc4.TagTable.TagDefinition.ResponseCurveSet16Type, self)._write__seq(io)
                    self._io.write_bytes(self.reserved)
                    self._io.write_u2be(self.number_of_channels)
                    self._io.write_u2be(self.count_of_measurement_types)
                    for i in range(len(self.response_curve_structure_offsets)):
                        pass
                        self._io.write_u4be(self.response_curve_structure_offsets[i])

                    self._io.write_bytes(self.response_curve_structures)
                    if not self._io.is_eof():
                        raise kaitaistruct.ConsistencyError(u"response_curve_structures", 0, self._io.size() - self._io.pos())


                def _check(self):
                    if len(self.reserved) != 4:
                        raise kaitaistruct.ConsistencyError(u"reserved", 4, len(self.reserved))
                    if not self.reserved == b"\x00\x00\x00\x00":
                        raise kaitaistruct.ValidationNotEqualError(b"\x00\x00\x00\x00", self.reserved, None, u"/types/tag_table/types/tag_definition/types/response_curve_set_16_type/seq/0")
                    if len(self.response_curve_structure_offsets) != self.count_of_measurement_types:
                        raise kaitaistruct.ConsistencyError(u"response_curve_structure_offsets", self.count_of_measurement_types, len(self.response_curve_structure_offsets))
                    for i in range(len(self.response_curve_structure_offsets)):
                        pass

                    self._dirty = False


            class S15Fixed16ArrayType(ReadWriteKaitaiStruct):
                def __init__(self, _io=None, _parent=None, _root=None):
                    super(Icc4.TagTable.TagDefinition.S15Fixed16ArrayType, self).__init__(_io)
                    self._parent = _parent
                    self._root = _root

                def _read(self):
                    self.reserved = self._io.read_bytes(4)
                    if not self.reserved == b"\x00\x00\x00\x00":
                        raise kaitaistruct.ValidationNotEqualError(b"\x00\x00\x00\x00", self.reserved, self._io, u"/types/tag_table/types/tag_definition/types/s_15_fixed_16_array_type/seq/0")
                    self.values = []
                    i = 0
                    while not self._io.is_eof():
                        _t_values = Icc4.S15Fixed16Number(self._io, self, self._root)
                        try:
                            _t_values._read()
                        finally:
                            self.values.append(_t_values)
                        i += 1

                    self._dirty = False


                def _fetch_instances(self):
                    pass
                    for i in range(len(self.values)):
                        pass
                        self.values[i]._fetch_instances()



                def _write__seq(self, io=None):
                    super(Icc4.TagTable.TagDefinition.S15Fixed16ArrayType, self)._write__seq(io)
                    self._io.write_bytes(self.reserved)
                    for i in range(len(self.values)):
                        pass
                        if self._io.is_eof():
                            raise kaitaistruct.ConsistencyError(u"values", 0, self._io.size() - self._io.pos())
                        self.values[i]._write__seq(self._io)

                    if not self._io.is_eof():
                        raise kaitaistruct.ConsistencyError(u"values", 0, self._io.size() - self._io.pos())


                def _check(self):
                    if len(self.reserved) != 4:
                        raise kaitaistruct.ConsistencyError(u"reserved", 4, len(self.reserved))
                    if not self.reserved == b"\x00\x00\x00\x00":
                        raise kaitaistruct.ValidationNotEqualError(b"\x00\x00\x00\x00", self.reserved, None, u"/types/tag_table/types/tag_definition/types/s_15_fixed_16_array_type/seq/0")
                    for i in range(len(self.values)):
                        pass
                        if self.values[i]._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"values", self._root, self.values[i]._root)
                        if self.values[i]._parent != self:
                            raise kaitaistruct.ConsistencyError(u"values", self, self.values[i]._parent)

                    self._dirty = False


            class SaturationRenderingIntentGamutTag(ReadWriteKaitaiStruct):
                def __init__(self, _io=None, _parent=None, _root=None):
                    super(Icc4.TagTable.TagDefinition.SaturationRenderingIntentGamutTag, self).__init__(_io)
                    self._parent = _parent
                    self._root = _root

                def _read(self):
                    self.tag_type = KaitaiStream.resolve_enum(Icc4.TagTable.TagDefinition.TagTypeSignatures, self._io.read_u4be())
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.signature_type:
                        pass
                        self.tag_data = Icc4.TagTable.TagDefinition.SignatureType(self._io, self, self._root)
                        self.tag_data._read()
                    self._dirty = False


                def _fetch_instances(self):
                    pass
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.signature_type:
                        pass
                        self.tag_data._fetch_instances()


                def _write__seq(self, io=None):
                    super(Icc4.TagTable.TagDefinition.SaturationRenderingIntentGamutTag, self)._write__seq(io)
                    self._io.write_u4be(int(self.tag_type))
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.signature_type:
                        pass
                        self.tag_data._write__seq(self._io)


                def _check(self):
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.signature_type:
                        pass
                        if self.tag_data._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"tag_data", self._root, self.tag_data._root)
                        if self.tag_data._parent != self:
                            raise kaitaistruct.ConsistencyError(u"tag_data", self, self.tag_data._parent)
                    self._dirty = False


            class SignatureType(ReadWriteKaitaiStruct):
                def __init__(self, _io=None, _parent=None, _root=None):
                    super(Icc4.TagTable.TagDefinition.SignatureType, self).__init__(_io)
                    self._parent = _parent
                    self._root = _root

                def _read(self):
                    self.reserved = self._io.read_bytes(4)
                    if not self.reserved == b"\x00\x00\x00\x00":
                        raise kaitaistruct.ValidationNotEqualError(b"\x00\x00\x00\x00", self.reserved, self._io, u"/types/tag_table/types/tag_definition/types/signature_type/seq/0")
                    self.signature = (self._io.read_bytes(4)).decode(u"ASCII")
                    self._dirty = False


                def _fetch_instances(self):
                    pass


                def _write__seq(self, io=None):
                    super(Icc4.TagTable.TagDefinition.SignatureType, self)._write__seq(io)
                    self._io.write_bytes(self.reserved)
                    self._io.write_bytes((self.signature).encode(u"ASCII"))


                def _check(self):
                    if len(self.reserved) != 4:
                        raise kaitaistruct.ConsistencyError(u"reserved", 4, len(self.reserved))
                    if not self.reserved == b"\x00\x00\x00\x00":
                        raise kaitaistruct.ValidationNotEqualError(b"\x00\x00\x00\x00", self.reserved, None, u"/types/tag_table/types/tag_definition/types/signature_type/seq/0")
                    if len((self.signature).encode(u"ASCII")) != 4:
                        raise kaitaistruct.ConsistencyError(u"signature", 4, len((self.signature).encode(u"ASCII")))
                    self._dirty = False


            class TechnologyTag(ReadWriteKaitaiStruct):
                def __init__(self, _io=None, _parent=None, _root=None):
                    super(Icc4.TagTable.TagDefinition.TechnologyTag, self).__init__(_io)
                    self._parent = _parent
                    self._root = _root

                def _read(self):
                    self.tag_type = KaitaiStream.resolve_enum(Icc4.TagTable.TagDefinition.TagTypeSignatures, self._io.read_u4be())
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.signature_type:
                        pass
                        self.tag_data = Icc4.TagTable.TagDefinition.SignatureType(self._io, self, self._root)
                        self.tag_data._read()
                    self._dirty = False


                def _fetch_instances(self):
                    pass
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.signature_type:
                        pass
                        self.tag_data._fetch_instances()


                def _write__seq(self, io=None):
                    super(Icc4.TagTable.TagDefinition.TechnologyTag, self)._write__seq(io)
                    self._io.write_u4be(int(self.tag_type))
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.signature_type:
                        pass
                        self.tag_data._write__seq(self._io)


                def _check(self):
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.signature_type:
                        pass
                        if self.tag_data._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"tag_data", self._root, self.tag_data._root)
                        if self.tag_data._parent != self:
                            raise kaitaistruct.ConsistencyError(u"tag_data", self, self.tag_data._parent)
                    self._dirty = False


            class TextType(ReadWriteKaitaiStruct):
                def __init__(self, _io=None, _parent=None, _root=None):
                    super(Icc4.TagTable.TagDefinition.TextType, self).__init__(_io)
                    self._parent = _parent
                    self._root = _root

                def _read(self):
                    self.reserved = self._io.read_bytes(4)
                    if not self.reserved == b"\x00\x00\x00\x00":
                        raise kaitaistruct.ValidationNotEqualError(b"\x00\x00\x00\x00", self.reserved, self._io, u"/types/tag_table/types/tag_definition/types/text_type/seq/0")
                    self.value = (KaitaiStream.bytes_terminate(self._io.read_bytes_full(), 0, False)).decode(u"ASCII")
                    self._dirty = False


                def _fetch_instances(self):
                    pass


                def _write__seq(self, io=None):
                    super(Icc4.TagTable.TagDefinition.TextType, self)._write__seq(io)
                    self._io.write_bytes(self.reserved)
                    self._io.write_bytes_limit((self.value).encode(u"ASCII"), self._io.size() - self._io.pos(), 0, 0)
                    if not self._io.is_eof():
                        raise kaitaistruct.ConsistencyError(u"value", 0, self._io.size() - self._io.pos())


                def _check(self):
                    if len(self.reserved) != 4:
                        raise kaitaistruct.ConsistencyError(u"reserved", 4, len(self.reserved))
                    if not self.reserved == b"\x00\x00\x00\x00":
                        raise kaitaistruct.ValidationNotEqualError(b"\x00\x00\x00\x00", self.reserved, None, u"/types/tag_table/types/tag_definition/types/text_type/seq/0")
                    self._dirty = False


            class U16Fixed16ArrayType(ReadWriteKaitaiStruct):
                def __init__(self, _io=None, _parent=None, _root=None):
                    super(Icc4.TagTable.TagDefinition.U16Fixed16ArrayType, self).__init__(_io)
                    self._parent = _parent
                    self._root = _root

                def _read(self):
                    self.reserved = self._io.read_bytes(4)
                    if not self.reserved == b"\x00\x00\x00\x00":
                        raise kaitaistruct.ValidationNotEqualError(b"\x00\x00\x00\x00", self.reserved, self._io, u"/types/tag_table/types/tag_definition/types/u_16_fixed_16_array_type/seq/0")
                    self.values = []
                    i = 0
                    while not self._io.is_eof():
                        _t_values = Icc4.U16Fixed16Number(self._io, self, self._root)
                        try:
                            _t_values._read()
                        finally:
                            self.values.append(_t_values)
                        i += 1

                    self._dirty = False


                def _fetch_instances(self):
                    pass
                    for i in range(len(self.values)):
                        pass
                        self.values[i]._fetch_instances()



                def _write__seq(self, io=None):
                    super(Icc4.TagTable.TagDefinition.U16Fixed16ArrayType, self)._write__seq(io)
                    self._io.write_bytes(self.reserved)
                    for i in range(len(self.values)):
                        pass
                        if self._io.is_eof():
                            raise kaitaistruct.ConsistencyError(u"values", 0, self._io.size() - self._io.pos())
                        self.values[i]._write__seq(self._io)

                    if not self._io.is_eof():
                        raise kaitaistruct.ConsistencyError(u"values", 0, self._io.size() - self._io.pos())


                def _check(self):
                    if len(self.reserved) != 4:
                        raise kaitaistruct.ConsistencyError(u"reserved", 4, len(self.reserved))
                    if not self.reserved == b"\x00\x00\x00\x00":
                        raise kaitaistruct.ValidationNotEqualError(b"\x00\x00\x00\x00", self.reserved, None, u"/types/tag_table/types/tag_definition/types/u_16_fixed_16_array_type/seq/0")
                    for i in range(len(self.values)):
                        pass
                        if self.values[i]._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"values", self._root, self.values[i]._root)
                        if self.values[i]._parent != self:
                            raise kaitaistruct.ConsistencyError(u"values", self, self.values[i]._parent)

                    self._dirty = False


            class UInt16ArrayType(ReadWriteKaitaiStruct):
                def __init__(self, _io=None, _parent=None, _root=None):
                    super(Icc4.TagTable.TagDefinition.UInt16ArrayType, self).__init__(_io)
                    self._parent = _parent
                    self._root = _root

                def _read(self):
                    self.reserved = self._io.read_bytes(4)
                    if not self.reserved == b"\x00\x00\x00\x00":
                        raise kaitaistruct.ValidationNotEqualError(b"\x00\x00\x00\x00", self.reserved, self._io, u"/types/tag_table/types/tag_definition/types/u_int_16_array_type/seq/0")
                    self.values = []
                    i = 0
                    while not self._io.is_eof():
                        self.values.append(self._io.read_u2be())
                        i += 1

                    self._dirty = False


                def _fetch_instances(self):
                    pass
                    for i in range(len(self.values)):
                        pass



                def _write__seq(self, io=None):
                    super(Icc4.TagTable.TagDefinition.UInt16ArrayType, self)._write__seq(io)
                    self._io.write_bytes(self.reserved)
                    for i in range(len(self.values)):
                        pass
                        if self._io.is_eof():
                            raise kaitaistruct.ConsistencyError(u"values", 0, self._io.size() - self._io.pos())
                        self._io.write_u2be(self.values[i])

                    if not self._io.is_eof():
                        raise kaitaistruct.ConsistencyError(u"values", 0, self._io.size() - self._io.pos())


                def _check(self):
                    if len(self.reserved) != 4:
                        raise kaitaistruct.ConsistencyError(u"reserved", 4, len(self.reserved))
                    if not self.reserved == b"\x00\x00\x00\x00":
                        raise kaitaistruct.ValidationNotEqualError(b"\x00\x00\x00\x00", self.reserved, None, u"/types/tag_table/types/tag_definition/types/u_int_16_array_type/seq/0")
                    for i in range(len(self.values)):
                        pass

                    self._dirty = False


            class UInt32ArrayType(ReadWriteKaitaiStruct):
                def __init__(self, _io=None, _parent=None, _root=None):
                    super(Icc4.TagTable.TagDefinition.UInt32ArrayType, self).__init__(_io)
                    self._parent = _parent
                    self._root = _root

                def _read(self):
                    self.reserved = self._io.read_bytes(4)
                    if not self.reserved == b"\x00\x00\x00\x00":
                        raise kaitaistruct.ValidationNotEqualError(b"\x00\x00\x00\x00", self.reserved, self._io, u"/types/tag_table/types/tag_definition/types/u_int_32_array_type/seq/0")
                    self.values = []
                    i = 0
                    while not self._io.is_eof():
                        self.values.append(self._io.read_u4be())
                        i += 1

                    self._dirty = False


                def _fetch_instances(self):
                    pass
                    for i in range(len(self.values)):
                        pass



                def _write__seq(self, io=None):
                    super(Icc4.TagTable.TagDefinition.UInt32ArrayType, self)._write__seq(io)
                    self._io.write_bytes(self.reserved)
                    for i in range(len(self.values)):
                        pass
                        if self._io.is_eof():
                            raise kaitaistruct.ConsistencyError(u"values", 0, self._io.size() - self._io.pos())
                        self._io.write_u4be(self.values[i])

                    if not self._io.is_eof():
                        raise kaitaistruct.ConsistencyError(u"values", 0, self._io.size() - self._io.pos())


                def _check(self):
                    if len(self.reserved) != 4:
                        raise kaitaistruct.ConsistencyError(u"reserved", 4, len(self.reserved))
                    if not self.reserved == b"\x00\x00\x00\x00":
                        raise kaitaistruct.ValidationNotEqualError(b"\x00\x00\x00\x00", self.reserved, None, u"/types/tag_table/types/tag_definition/types/u_int_32_array_type/seq/0")
                    for i in range(len(self.values)):
                        pass

                    self._dirty = False


            class UInt64ArrayType(ReadWriteKaitaiStruct):
                def __init__(self, _io=None, _parent=None, _root=None):
                    super(Icc4.TagTable.TagDefinition.UInt64ArrayType, self).__init__(_io)
                    self._parent = _parent
                    self._root = _root

                def _read(self):
                    self.reserved = self._io.read_bytes(4)
                    if not self.reserved == b"\x00\x00\x00\x00":
                        raise kaitaistruct.ValidationNotEqualError(b"\x00\x00\x00\x00", self.reserved, self._io, u"/types/tag_table/types/tag_definition/types/u_int_64_array_type/seq/0")
                    self.values = []
                    i = 0
                    while not self._io.is_eof():
                        self.values.append(self._io.read_u8be())
                        i += 1

                    self._dirty = False


                def _fetch_instances(self):
                    pass
                    for i in range(len(self.values)):
                        pass



                def _write__seq(self, io=None):
                    super(Icc4.TagTable.TagDefinition.UInt64ArrayType, self)._write__seq(io)
                    self._io.write_bytes(self.reserved)
                    for i in range(len(self.values)):
                        pass
                        if self._io.is_eof():
                            raise kaitaistruct.ConsistencyError(u"values", 0, self._io.size() - self._io.pos())
                        self._io.write_u8be(self.values[i])

                    if not self._io.is_eof():
                        raise kaitaistruct.ConsistencyError(u"values", 0, self._io.size() - self._io.pos())


                def _check(self):
                    if len(self.reserved) != 4:
                        raise kaitaistruct.ConsistencyError(u"reserved", 4, len(self.reserved))
                    if not self.reserved == b"\x00\x00\x00\x00":
                        raise kaitaistruct.ValidationNotEqualError(b"\x00\x00\x00\x00", self.reserved, None, u"/types/tag_table/types/tag_definition/types/u_int_64_array_type/seq/0")
                    for i in range(len(self.values)):
                        pass

                    self._dirty = False


            class UInt8ArrayType(ReadWriteKaitaiStruct):
                def __init__(self, _io=None, _parent=None, _root=None):
                    super(Icc4.TagTable.TagDefinition.UInt8ArrayType, self).__init__(_io)
                    self._parent = _parent
                    self._root = _root

                def _read(self):
                    self.reserved = self._io.read_bytes(4)
                    if not self.reserved == b"\x00\x00\x00\x00":
                        raise kaitaistruct.ValidationNotEqualError(b"\x00\x00\x00\x00", self.reserved, self._io, u"/types/tag_table/types/tag_definition/types/u_int_8_array_type/seq/0")
                    self.values = []
                    i = 0
                    while not self._io.is_eof():
                        self.values.append(self._io.read_u1())
                        i += 1

                    self._dirty = False


                def _fetch_instances(self):
                    pass
                    for i in range(len(self.values)):
                        pass



                def _write__seq(self, io=None):
                    super(Icc4.TagTable.TagDefinition.UInt8ArrayType, self)._write__seq(io)
                    self._io.write_bytes(self.reserved)
                    for i in range(len(self.values)):
                        pass
                        if self._io.is_eof():
                            raise kaitaistruct.ConsistencyError(u"values", 0, self._io.size() - self._io.pos())
                        self._io.write_u1(self.values[i])

                    if not self._io.is_eof():
                        raise kaitaistruct.ConsistencyError(u"values", 0, self._io.size() - self._io.pos())


                def _check(self):
                    if len(self.reserved) != 4:
                        raise kaitaistruct.ConsistencyError(u"reserved", 4, len(self.reserved))
                    if not self.reserved == b"\x00\x00\x00\x00":
                        raise kaitaistruct.ValidationNotEqualError(b"\x00\x00\x00\x00", self.reserved, None, u"/types/tag_table/types/tag_definition/types/u_int_8_array_type/seq/0")
                    for i in range(len(self.values)):
                        pass

                    self._dirty = False


            class ViewingCondDescTag(ReadWriteKaitaiStruct):
                def __init__(self, _io=None, _parent=None, _root=None):
                    super(Icc4.TagTable.TagDefinition.ViewingCondDescTag, self).__init__(_io)
                    self._parent = _parent
                    self._root = _root

                def _read(self):
                    self.tag_type = KaitaiStream.resolve_enum(Icc4.TagTable.TagDefinition.TagTypeSignatures, self._io.read_u4be())
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.multi_localized_unicode_type:
                        pass
                        self.tag_data = Icc4.TagTable.TagDefinition.MultiLocalizedUnicodeType(self._io, self, self._root)
                        self.tag_data._read()
                    self._dirty = False


                def _fetch_instances(self):
                    pass
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.multi_localized_unicode_type:
                        pass
                        self.tag_data._fetch_instances()


                def _write__seq(self, io=None):
                    super(Icc4.TagTable.TagDefinition.ViewingCondDescTag, self)._write__seq(io)
                    self._io.write_u4be(int(self.tag_type))
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.multi_localized_unicode_type:
                        pass
                        self.tag_data._write__seq(self._io)


                def _check(self):
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.multi_localized_unicode_type:
                        pass
                        if self.tag_data._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"tag_data", self._root, self.tag_data._root)
                        if self.tag_data._parent != self:
                            raise kaitaistruct.ConsistencyError(u"tag_data", self, self.tag_data._parent)
                    self._dirty = False


            class ViewingConditionsTag(ReadWriteKaitaiStruct):
                def __init__(self, _io=None, _parent=None, _root=None):
                    super(Icc4.TagTable.TagDefinition.ViewingConditionsTag, self).__init__(_io)
                    self._parent = _parent
                    self._root = _root

                def _read(self):
                    self.tag_type = KaitaiStream.resolve_enum(Icc4.TagTable.TagDefinition.TagTypeSignatures, self._io.read_u4be())
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.viewing_conditions_type:
                        pass
                        self.tag_data = Icc4.TagTable.TagDefinition.ViewingConditionsType(self._io, self, self._root)
                        self.tag_data._read()
                    self._dirty = False


                def _fetch_instances(self):
                    pass
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.viewing_conditions_type:
                        pass
                        self.tag_data._fetch_instances()


                def _write__seq(self, io=None):
                    super(Icc4.TagTable.TagDefinition.ViewingConditionsTag, self)._write__seq(io)
                    self._io.write_u4be(int(self.tag_type))
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.viewing_conditions_type:
                        pass
                        self.tag_data._write__seq(self._io)


                def _check(self):
                    _on = self.tag_type
                    if _on == Icc4.TagTable.TagDefinition.TagTypeSignatures.viewing_conditions_type:
                        pass
                        if self.tag_data._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"tag_data", self._root, self.tag_data._root)
                        if self.tag_data._parent != self:
                            raise kaitaistruct.ConsistencyError(u"tag_data", self, self.tag_data._parent)
                    self._dirty = False


            class ViewingConditionsType(ReadWriteKaitaiStruct):
                def __init__(self, _io=None, _parent=None, _root=None):
                    super(Icc4.TagTable.TagDefinition.ViewingConditionsType, self).__init__(_io)
                    self._parent = _parent
                    self._root = _root

                def _read(self):
                    self.reserved = self._io.read_bytes(4)
                    if not self.reserved == b"\x00\x00\x00\x00":
                        raise kaitaistruct.ValidationNotEqualError(b"\x00\x00\x00\x00", self.reserved, self._io, u"/types/tag_table/types/tag_definition/types/viewing_conditions_type/seq/0")
                    self.un_normalized_ciexyz_values_for_illuminant = Icc4.XyzNumber(self._io, self, self._root)
                    self.un_normalized_ciexyz_values_for_illuminant._read()
                    self.un_normalized_ciexyz_values_for_surround = Icc4.XyzNumber(self._io, self, self._root)
                    self.un_normalized_ciexyz_values_for_surround._read()
                    self.illuminant_type = Icc4.StandardIlluminantEncoding(self._io, self, self._root)
                    self.illuminant_type._read()
                    self._dirty = False


                def _fetch_instances(self):
                    pass
                    self.un_normalized_ciexyz_values_for_illuminant._fetch_instances()
                    self.un_normalized_ciexyz_values_for_surround._fetch_instances()
                    self.illuminant_type._fetch_instances()


                def _write__seq(self, io=None):
                    super(Icc4.TagTable.TagDefinition.ViewingConditionsType, self)._write__seq(io)
                    self._io.write_bytes(self.reserved)
                    self.un_normalized_ciexyz_values_for_illuminant._write__seq(self._io)
                    self.un_normalized_ciexyz_values_for_surround._write__seq(self._io)
                    self.illuminant_type._write__seq(self._io)


                def _check(self):
                    if len(self.reserved) != 4:
                        raise kaitaistruct.ConsistencyError(u"reserved", 4, len(self.reserved))
                    if not self.reserved == b"\x00\x00\x00\x00":
                        raise kaitaistruct.ValidationNotEqualError(b"\x00\x00\x00\x00", self.reserved, None, u"/types/tag_table/types/tag_definition/types/viewing_conditions_type/seq/0")
                    if self.un_normalized_ciexyz_values_for_illuminant._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"un_normalized_ciexyz_values_for_illuminant", self._root, self.un_normalized_ciexyz_values_for_illuminant._root)
                    if self.un_normalized_ciexyz_values_for_illuminant._parent != self:
                        raise kaitaistruct.ConsistencyError(u"un_normalized_ciexyz_values_for_illuminant", self, self.un_normalized_ciexyz_values_for_illuminant._parent)
                    if self.un_normalized_ciexyz_values_for_surround._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"un_normalized_ciexyz_values_for_surround", self._root, self.un_normalized_ciexyz_values_for_surround._root)
                    if self.un_normalized_ciexyz_values_for_surround._parent != self:
                        raise kaitaistruct.ConsistencyError(u"un_normalized_ciexyz_values_for_surround", self, self.un_normalized_ciexyz_values_for_surround._parent)
                    if self.illuminant_type._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"illuminant_type", self._root, self.illuminant_type._root)
                    if self.illuminant_type._parent != self:
                        raise kaitaistruct.ConsistencyError(u"illuminant_type", self, self.illuminant_type._parent)
                    self._dirty = False


            class XyzType(ReadWriteKaitaiStruct):
                def __init__(self, _io=None, _parent=None, _root=None):
                    super(Icc4.TagTable.TagDefinition.XyzType, self).__init__(_io)
                    self._parent = _parent
                    self._root = _root

                def _read(self):
                    self.reserved = self._io.read_bytes(4)
                    if not self.reserved == b"\x00\x00\x00\x00":
                        raise kaitaistruct.ValidationNotEqualError(b"\x00\x00\x00\x00", self.reserved, self._io, u"/types/tag_table/types/tag_definition/types/xyz_type/seq/0")
                    self.values = []
                    i = 0
                    while not self._io.is_eof():
                        _t_values = Icc4.XyzNumber(self._io, self, self._root)
                        try:
                            _t_values._read()
                        finally:
                            self.values.append(_t_values)
                        i += 1

                    self._dirty = False


                def _fetch_instances(self):
                    pass
                    for i in range(len(self.values)):
                        pass
                        self.values[i]._fetch_instances()



                def _write__seq(self, io=None):
                    super(Icc4.TagTable.TagDefinition.XyzType, self)._write__seq(io)
                    self._io.write_bytes(self.reserved)
                    for i in range(len(self.values)):
                        pass
                        if self._io.is_eof():
                            raise kaitaistruct.ConsistencyError(u"values", 0, self._io.size() - self._io.pos())
                        self.values[i]._write__seq(self._io)

                    if not self._io.is_eof():
                        raise kaitaistruct.ConsistencyError(u"values", 0, self._io.size() - self._io.pos())


                def _check(self):
                    if len(self.reserved) != 4:
                        raise kaitaistruct.ConsistencyError(u"reserved", 4, len(self.reserved))
                    if not self.reserved == b"\x00\x00\x00\x00":
                        raise kaitaistruct.ValidationNotEqualError(b"\x00\x00\x00\x00", self.reserved, None, u"/types/tag_table/types/tag_definition/types/xyz_type/seq/0")
                    for i in range(len(self.values)):
                        pass
                        if self.values[i]._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"values", self._root, self.values[i]._root)
                        if self.values[i]._parent != self:
                            raise kaitaistruct.ConsistencyError(u"values", self, self.values[i]._parent)

                    self._dirty = False


            @property
            def tag_data_element(self):
                if self._should_write_tag_data_element:
                    self._write_tag_data_element()
                if hasattr(self, '_m_tag_data_element'):
                    return self._m_tag_data_element

                if not self.tag_data_element__enabled:
                    return None

                _pos = self._io.pos()
                self._io.seek(self.offset_to_data_element)
                _on = self.tag_signature
                if _on == Icc4.TagTable.TagDefinition.TagSignatures.a_to_b_0:
                    pass
                    self._raw__m_tag_data_element = self._io.read_bytes(self.size_of_data_element)
                    _io__raw__m_tag_data_element = KaitaiStream(BytesIO(self._raw__m_tag_data_element))
                    self._m_tag_data_element = Icc4.TagTable.TagDefinition.AToB0Tag(_io__raw__m_tag_data_element, self, self._root)
                    self._m_tag_data_element._read()
                elif _on == Icc4.TagTable.TagDefinition.TagSignatures.a_to_b_1:
                    pass
                    self._raw__m_tag_data_element = self._io.read_bytes(self.size_of_data_element)
                    _io__raw__m_tag_data_element = KaitaiStream(BytesIO(self._raw__m_tag_data_element))
                    self._m_tag_data_element = Icc4.TagTable.TagDefinition.AToB1Tag(_io__raw__m_tag_data_element, self, self._root)
                    self._m_tag_data_element._read()
                elif _on == Icc4.TagTable.TagDefinition.TagSignatures.a_to_b_2:
                    pass
                    self._raw__m_tag_data_element = self._io.read_bytes(self.size_of_data_element)
                    _io__raw__m_tag_data_element = KaitaiStream(BytesIO(self._raw__m_tag_data_element))
                    self._m_tag_data_element = Icc4.TagTable.TagDefinition.AToB2Tag(_io__raw__m_tag_data_element, self, self._root)
                    self._m_tag_data_element._read()
                elif _on == Icc4.TagTable.TagDefinition.TagSignatures.b_to_a_0:
                    pass
                    self._raw__m_tag_data_element = self._io.read_bytes(self.size_of_data_element)
                    _io__raw__m_tag_data_element = KaitaiStream(BytesIO(self._raw__m_tag_data_element))
                    self._m_tag_data_element = Icc4.TagTable.TagDefinition.BToA0Tag(_io__raw__m_tag_data_element, self, self._root)
                    self._m_tag_data_element._read()
                elif _on == Icc4.TagTable.TagDefinition.TagSignatures.b_to_a_1:
                    pass
                    self._raw__m_tag_data_element = self._io.read_bytes(self.size_of_data_element)
                    _io__raw__m_tag_data_element = KaitaiStream(BytesIO(self._raw__m_tag_data_element))
                    self._m_tag_data_element = Icc4.TagTable.TagDefinition.BToA1Tag(_io__raw__m_tag_data_element, self, self._root)
                    self._m_tag_data_element._read()
                elif _on == Icc4.TagTable.TagDefinition.TagSignatures.b_to_a_2:
                    pass
                    self._raw__m_tag_data_element = self._io.read_bytes(self.size_of_data_element)
                    _io__raw__m_tag_data_element = KaitaiStream(BytesIO(self._raw__m_tag_data_element))
                    self._m_tag_data_element = Icc4.TagTable.TagDefinition.BToA2Tag(_io__raw__m_tag_data_element, self, self._root)
                    self._m_tag_data_element._read()
                elif _on == Icc4.TagTable.TagDefinition.TagSignatures.b_to_d_0:
                    pass
                    self._raw__m_tag_data_element = self._io.read_bytes(self.size_of_data_element)
                    _io__raw__m_tag_data_element = KaitaiStream(BytesIO(self._raw__m_tag_data_element))
                    self._m_tag_data_element = Icc4.TagTable.TagDefinition.BToD0Tag(_io__raw__m_tag_data_element, self, self._root)
                    self._m_tag_data_element._read()
                elif _on == Icc4.TagTable.TagDefinition.TagSignatures.b_to_d_1:
                    pass
                    self._raw__m_tag_data_element = self._io.read_bytes(self.size_of_data_element)
                    _io__raw__m_tag_data_element = KaitaiStream(BytesIO(self._raw__m_tag_data_element))
                    self._m_tag_data_element = Icc4.TagTable.TagDefinition.BToD1Tag(_io__raw__m_tag_data_element, self, self._root)
                    self._m_tag_data_element._read()
                elif _on == Icc4.TagTable.TagDefinition.TagSignatures.b_to_d_2:
                    pass
                    self._raw__m_tag_data_element = self._io.read_bytes(self.size_of_data_element)
                    _io__raw__m_tag_data_element = KaitaiStream(BytesIO(self._raw__m_tag_data_element))
                    self._m_tag_data_element = Icc4.TagTable.TagDefinition.BToD2Tag(_io__raw__m_tag_data_element, self, self._root)
                    self._m_tag_data_element._read()
                elif _on == Icc4.TagTable.TagDefinition.TagSignatures.b_to_d_3:
                    pass
                    self._raw__m_tag_data_element = self._io.read_bytes(self.size_of_data_element)
                    _io__raw__m_tag_data_element = KaitaiStream(BytesIO(self._raw__m_tag_data_element))
                    self._m_tag_data_element = Icc4.TagTable.TagDefinition.BToD3Tag(_io__raw__m_tag_data_element, self, self._root)
                    self._m_tag_data_element._read()
                elif _on == Icc4.TagTable.TagDefinition.TagSignatures.blue_matrix_column:
                    pass
                    self._raw__m_tag_data_element = self._io.read_bytes(self.size_of_data_element)
                    _io__raw__m_tag_data_element = KaitaiStream(BytesIO(self._raw__m_tag_data_element))
                    self._m_tag_data_element = Icc4.TagTable.TagDefinition.BlueMatrixColumnTag(_io__raw__m_tag_data_element, self, self._root)
                    self._m_tag_data_element._read()
                elif _on == Icc4.TagTable.TagDefinition.TagSignatures.blue_trc:
                    pass
                    self._raw__m_tag_data_element = self._io.read_bytes(self.size_of_data_element)
                    _io__raw__m_tag_data_element = KaitaiStream(BytesIO(self._raw__m_tag_data_element))
                    self._m_tag_data_element = Icc4.TagTable.TagDefinition.BlueTrcTag(_io__raw__m_tag_data_element, self, self._root)
                    self._m_tag_data_element._read()
                elif _on == Icc4.TagTable.TagDefinition.TagSignatures.calibration_date_time:
                    pass
                    self._raw__m_tag_data_element = self._io.read_bytes(self.size_of_data_element)
                    _io__raw__m_tag_data_element = KaitaiStream(BytesIO(self._raw__m_tag_data_element))
                    self._m_tag_data_element = Icc4.TagTable.TagDefinition.CalibrationDateTimeTag(_io__raw__m_tag_data_element, self, self._root)
                    self._m_tag_data_element._read()
                elif _on == Icc4.TagTable.TagDefinition.TagSignatures.char_target:
                    pass
                    self._raw__m_tag_data_element = self._io.read_bytes(self.size_of_data_element)
                    _io__raw__m_tag_data_element = KaitaiStream(BytesIO(self._raw__m_tag_data_element))
                    self._m_tag_data_element = Icc4.TagTable.TagDefinition.CharTargetTag(_io__raw__m_tag_data_element, self, self._root)
                    self._m_tag_data_element._read()
                elif _on == Icc4.TagTable.TagDefinition.TagSignatures.chromatic_adaptation:
                    pass
                    self._raw__m_tag_data_element = self._io.read_bytes(self.size_of_data_element)
                    _io__raw__m_tag_data_element = KaitaiStream(BytesIO(self._raw__m_tag_data_element))
                    self._m_tag_data_element = Icc4.TagTable.TagDefinition.ChromaticAdaptationTag(_io__raw__m_tag_data_element, self, self._root)
                    self._m_tag_data_element._read()
                elif _on == Icc4.TagTable.TagDefinition.TagSignatures.chromaticity:
                    pass
                    self._raw__m_tag_data_element = self._io.read_bytes(self.size_of_data_element)
                    _io__raw__m_tag_data_element = KaitaiStream(BytesIO(self._raw__m_tag_data_element))
                    self._m_tag_data_element = Icc4.TagTable.TagDefinition.ChromaticityTag(_io__raw__m_tag_data_element, self, self._root)
                    self._m_tag_data_element._read()
                elif _on == Icc4.TagTable.TagDefinition.TagSignatures.colorant_order:
                    pass
                    self._raw__m_tag_data_element = self._io.read_bytes(self.size_of_data_element)
                    _io__raw__m_tag_data_element = KaitaiStream(BytesIO(self._raw__m_tag_data_element))
                    self._m_tag_data_element = Icc4.TagTable.TagDefinition.ColorantOrderTag(_io__raw__m_tag_data_element, self, self._root)
                    self._m_tag_data_element._read()
                elif _on == Icc4.TagTable.TagDefinition.TagSignatures.colorant_table:
                    pass
                    self._raw__m_tag_data_element = self._io.read_bytes(self.size_of_data_element)
                    _io__raw__m_tag_data_element = KaitaiStream(BytesIO(self._raw__m_tag_data_element))
                    self._m_tag_data_element = Icc4.TagTable.TagDefinition.ColorantTableTag(_io__raw__m_tag_data_element, self, self._root)
                    self._m_tag_data_element._read()
                elif _on == Icc4.TagTable.TagDefinition.TagSignatures.colorant_table_out:
                    pass
                    self._raw__m_tag_data_element = self._io.read_bytes(self.size_of_data_element)
                    _io__raw__m_tag_data_element = KaitaiStream(BytesIO(self._raw__m_tag_data_element))
                    self._m_tag_data_element = Icc4.TagTable.TagDefinition.ColorantTableOutTag(_io__raw__m_tag_data_element, self, self._root)
                    self._m_tag_data_element._read()
                elif _on == Icc4.TagTable.TagDefinition.TagSignatures.colorimetric_intent_image_state:
                    pass
                    self._raw__m_tag_data_element = self._io.read_bytes(self.size_of_data_element)
                    _io__raw__m_tag_data_element = KaitaiStream(BytesIO(self._raw__m_tag_data_element))
                    self._m_tag_data_element = Icc4.TagTable.TagDefinition.ColorimetricIntentImageStateTag(_io__raw__m_tag_data_element, self, self._root)
                    self._m_tag_data_element._read()
                elif _on == Icc4.TagTable.TagDefinition.TagSignatures.copyright:
                    pass
                    self._raw__m_tag_data_element = self._io.read_bytes(self.size_of_data_element)
                    _io__raw__m_tag_data_element = KaitaiStream(BytesIO(self._raw__m_tag_data_element))
                    self._m_tag_data_element = Icc4.TagTable.TagDefinition.CopyrightTag(_io__raw__m_tag_data_element, self, self._root)
                    self._m_tag_data_element._read()
                elif _on == Icc4.TagTable.TagDefinition.TagSignatures.d_to_b_0:
                    pass
                    self._raw__m_tag_data_element = self._io.read_bytes(self.size_of_data_element)
                    _io__raw__m_tag_data_element = KaitaiStream(BytesIO(self._raw__m_tag_data_element))
                    self._m_tag_data_element = Icc4.TagTable.TagDefinition.DToB0Tag(_io__raw__m_tag_data_element, self, self._root)
                    self._m_tag_data_element._read()
                elif _on == Icc4.TagTable.TagDefinition.TagSignatures.d_to_b_1:
                    pass
                    self._raw__m_tag_data_element = self._io.read_bytes(self.size_of_data_element)
                    _io__raw__m_tag_data_element = KaitaiStream(BytesIO(self._raw__m_tag_data_element))
                    self._m_tag_data_element = Icc4.TagTable.TagDefinition.DToB1Tag(_io__raw__m_tag_data_element, self, self._root)
                    self._m_tag_data_element._read()
                elif _on == Icc4.TagTable.TagDefinition.TagSignatures.d_to_b_2:
                    pass
                    self._raw__m_tag_data_element = self._io.read_bytes(self.size_of_data_element)
                    _io__raw__m_tag_data_element = KaitaiStream(BytesIO(self._raw__m_tag_data_element))
                    self._m_tag_data_element = Icc4.TagTable.TagDefinition.DToB2Tag(_io__raw__m_tag_data_element, self, self._root)
                    self._m_tag_data_element._read()
                elif _on == Icc4.TagTable.TagDefinition.TagSignatures.d_to_b_3:
                    pass
                    self._raw__m_tag_data_element = self._io.read_bytes(self.size_of_data_element)
                    _io__raw__m_tag_data_element = KaitaiStream(BytesIO(self._raw__m_tag_data_element))
                    self._m_tag_data_element = Icc4.TagTable.TagDefinition.DToB3Tag(_io__raw__m_tag_data_element, self, self._root)
                    self._m_tag_data_element._read()
                elif _on == Icc4.TagTable.TagDefinition.TagSignatures.device_mfg_desc:
                    pass
                    self._raw__m_tag_data_element = self._io.read_bytes(self.size_of_data_element)
                    _io__raw__m_tag_data_element = KaitaiStream(BytesIO(self._raw__m_tag_data_element))
                    self._m_tag_data_element = Icc4.TagTable.TagDefinition.DeviceMfgDescTag(_io__raw__m_tag_data_element, self, self._root)
                    self._m_tag_data_element._read()
                elif _on == Icc4.TagTable.TagDefinition.TagSignatures.device_model_desc:
                    pass
                    self._raw__m_tag_data_element = self._io.read_bytes(self.size_of_data_element)
                    _io__raw__m_tag_data_element = KaitaiStream(BytesIO(self._raw__m_tag_data_element))
                    self._m_tag_data_element = Icc4.TagTable.TagDefinition.DeviceModelDescTag(_io__raw__m_tag_data_element, self, self._root)
                    self._m_tag_data_element._read()
                elif _on == Icc4.TagTable.TagDefinition.TagSignatures.gamut:
                    pass
                    self._raw__m_tag_data_element = self._io.read_bytes(self.size_of_data_element)
                    _io__raw__m_tag_data_element = KaitaiStream(BytesIO(self._raw__m_tag_data_element))
                    self._m_tag_data_element = Icc4.TagTable.TagDefinition.GamutTag(_io__raw__m_tag_data_element, self, self._root)
                    self._m_tag_data_element._read()
                elif _on == Icc4.TagTable.TagDefinition.TagSignatures.gray_trc:
                    pass
                    self._raw__m_tag_data_element = self._io.read_bytes(self.size_of_data_element)
                    _io__raw__m_tag_data_element = KaitaiStream(BytesIO(self._raw__m_tag_data_element))
                    self._m_tag_data_element = Icc4.TagTable.TagDefinition.GrayTrcTag(_io__raw__m_tag_data_element, self, self._root)
                    self._m_tag_data_element._read()
                elif _on == Icc4.TagTable.TagDefinition.TagSignatures.green_matrix_column:
                    pass
                    self._raw__m_tag_data_element = self._io.read_bytes(self.size_of_data_element)
                    _io__raw__m_tag_data_element = KaitaiStream(BytesIO(self._raw__m_tag_data_element))
                    self._m_tag_data_element = Icc4.TagTable.TagDefinition.GreenMatrixColumnTag(_io__raw__m_tag_data_element, self, self._root)
                    self._m_tag_data_element._read()
                elif _on == Icc4.TagTable.TagDefinition.TagSignatures.green_trc:
                    pass
                    self._raw__m_tag_data_element = self._io.read_bytes(self.size_of_data_element)
                    _io__raw__m_tag_data_element = KaitaiStream(BytesIO(self._raw__m_tag_data_element))
                    self._m_tag_data_element = Icc4.TagTable.TagDefinition.GreenTrcTag(_io__raw__m_tag_data_element, self, self._root)
                    self._m_tag_data_element._read()
                elif _on == Icc4.TagTable.TagDefinition.TagSignatures.luminance:
                    pass
                    self._raw__m_tag_data_element = self._io.read_bytes(self.size_of_data_element)
                    _io__raw__m_tag_data_element = KaitaiStream(BytesIO(self._raw__m_tag_data_element))
                    self._m_tag_data_element = Icc4.TagTable.TagDefinition.LuminanceTag(_io__raw__m_tag_data_element, self, self._root)
                    self._m_tag_data_element._read()
                elif _on == Icc4.TagTable.TagDefinition.TagSignatures.measurement:
                    pass
                    self._raw__m_tag_data_element = self._io.read_bytes(self.size_of_data_element)
                    _io__raw__m_tag_data_element = KaitaiStream(BytesIO(self._raw__m_tag_data_element))
                    self._m_tag_data_element = Icc4.TagTable.TagDefinition.MeasurementTag(_io__raw__m_tag_data_element, self, self._root)
                    self._m_tag_data_element._read()
                elif _on == Icc4.TagTable.TagDefinition.TagSignatures.media_white_point:
                    pass
                    self._raw__m_tag_data_element = self._io.read_bytes(self.size_of_data_element)
                    _io__raw__m_tag_data_element = KaitaiStream(BytesIO(self._raw__m_tag_data_element))
                    self._m_tag_data_element = Icc4.TagTable.TagDefinition.MediaWhitePointTag(_io__raw__m_tag_data_element, self, self._root)
                    self._m_tag_data_element._read()
                elif _on == Icc4.TagTable.TagDefinition.TagSignatures.named_color_2:
                    pass
                    self._raw__m_tag_data_element = self._io.read_bytes(self.size_of_data_element)
                    _io__raw__m_tag_data_element = KaitaiStream(BytesIO(self._raw__m_tag_data_element))
                    self._m_tag_data_element = Icc4.TagTable.TagDefinition.NamedColor2Tag(_io__raw__m_tag_data_element, self, self._root)
                    self._m_tag_data_element._read()
                elif _on == Icc4.TagTable.TagDefinition.TagSignatures.output_response:
                    pass
                    self._raw__m_tag_data_element = self._io.read_bytes(self.size_of_data_element)
                    _io__raw__m_tag_data_element = KaitaiStream(BytesIO(self._raw__m_tag_data_element))
                    self._m_tag_data_element = Icc4.TagTable.TagDefinition.OutputResponseTag(_io__raw__m_tag_data_element, self, self._root)
                    self._m_tag_data_element._read()
                elif _on == Icc4.TagTable.TagDefinition.TagSignatures.perceptual_rendering_intent_gamut:
                    pass
                    self._raw__m_tag_data_element = self._io.read_bytes(self.size_of_data_element)
                    _io__raw__m_tag_data_element = KaitaiStream(BytesIO(self._raw__m_tag_data_element))
                    self._m_tag_data_element = Icc4.TagTable.TagDefinition.PerceptualRenderingIntentGamutTag(_io__raw__m_tag_data_element, self, self._root)
                    self._m_tag_data_element._read()
                elif _on == Icc4.TagTable.TagDefinition.TagSignatures.preview_0:
                    pass
                    self._raw__m_tag_data_element = self._io.read_bytes(self.size_of_data_element)
                    _io__raw__m_tag_data_element = KaitaiStream(BytesIO(self._raw__m_tag_data_element))
                    self._m_tag_data_element = Icc4.TagTable.TagDefinition.Preview0Tag(_io__raw__m_tag_data_element, self, self._root)
                    self._m_tag_data_element._read()
                elif _on == Icc4.TagTable.TagDefinition.TagSignatures.preview_1:
                    pass
                    self._raw__m_tag_data_element = self._io.read_bytes(self.size_of_data_element)
                    _io__raw__m_tag_data_element = KaitaiStream(BytesIO(self._raw__m_tag_data_element))
                    self._m_tag_data_element = Icc4.TagTable.TagDefinition.Preview1Tag(_io__raw__m_tag_data_element, self, self._root)
                    self._m_tag_data_element._read()
                elif _on == Icc4.TagTable.TagDefinition.TagSignatures.preview_2:
                    pass
                    self._raw__m_tag_data_element = self._io.read_bytes(self.size_of_data_element)
                    _io__raw__m_tag_data_element = KaitaiStream(BytesIO(self._raw__m_tag_data_element))
                    self._m_tag_data_element = Icc4.TagTable.TagDefinition.Preview2Tag(_io__raw__m_tag_data_element, self, self._root)
                    self._m_tag_data_element._read()
                elif _on == Icc4.TagTable.TagDefinition.TagSignatures.profile_description:
                    pass
                    self._raw__m_tag_data_element = self._io.read_bytes(self.size_of_data_element)
                    _io__raw__m_tag_data_element = KaitaiStream(BytesIO(self._raw__m_tag_data_element))
                    self._m_tag_data_element = Icc4.TagTable.TagDefinition.ProfileDescriptionTag(_io__raw__m_tag_data_element, self, self._root)
                    self._m_tag_data_element._read()
                elif _on == Icc4.TagTable.TagDefinition.TagSignatures.profile_sequence:
                    pass
                    self._raw__m_tag_data_element = self._io.read_bytes(self.size_of_data_element)
                    _io__raw__m_tag_data_element = KaitaiStream(BytesIO(self._raw__m_tag_data_element))
                    self._m_tag_data_element = Icc4.TagTable.TagDefinition.ProfileSequenceTag(_io__raw__m_tag_data_element, self, self._root)
                    self._m_tag_data_element._read()
                elif _on == Icc4.TagTable.TagDefinition.TagSignatures.profile_sequence_identifier:
                    pass
                    self._raw__m_tag_data_element = self._io.read_bytes(self.size_of_data_element)
                    _io__raw__m_tag_data_element = KaitaiStream(BytesIO(self._raw__m_tag_data_element))
                    self._m_tag_data_element = Icc4.TagTable.TagDefinition.ProfileSequenceIdentifierTag(_io__raw__m_tag_data_element, self, self._root)
                    self._m_tag_data_element._read()
                elif _on == Icc4.TagTable.TagDefinition.TagSignatures.red_matrix_column:
                    pass
                    self._raw__m_tag_data_element = self._io.read_bytes(self.size_of_data_element)
                    _io__raw__m_tag_data_element = KaitaiStream(BytesIO(self._raw__m_tag_data_element))
                    self._m_tag_data_element = Icc4.TagTable.TagDefinition.RedMatrixColumnTag(_io__raw__m_tag_data_element, self, self._root)
                    self._m_tag_data_element._read()
                elif _on == Icc4.TagTable.TagDefinition.TagSignatures.red_trc:
                    pass
                    self._raw__m_tag_data_element = self._io.read_bytes(self.size_of_data_element)
                    _io__raw__m_tag_data_element = KaitaiStream(BytesIO(self._raw__m_tag_data_element))
                    self._m_tag_data_element = Icc4.TagTable.TagDefinition.RedTrcTag(_io__raw__m_tag_data_element, self, self._root)
                    self._m_tag_data_element._read()
                elif _on == Icc4.TagTable.TagDefinition.TagSignatures.saturation_rendering_intent_gamut:
                    pass
                    self._raw__m_tag_data_element = self._io.read_bytes(self.size_of_data_element)
                    _io__raw__m_tag_data_element = KaitaiStream(BytesIO(self._raw__m_tag_data_element))
                    self._m_tag_data_element = Icc4.TagTable.TagDefinition.SaturationRenderingIntentGamutTag(_io__raw__m_tag_data_element, self, self._root)
                    self._m_tag_data_element._read()
                elif _on == Icc4.TagTable.TagDefinition.TagSignatures.technology:
                    pass
                    self._raw__m_tag_data_element = self._io.read_bytes(self.size_of_data_element)
                    _io__raw__m_tag_data_element = KaitaiStream(BytesIO(self._raw__m_tag_data_element))
                    self._m_tag_data_element = Icc4.TagTable.TagDefinition.TechnologyTag(_io__raw__m_tag_data_element, self, self._root)
                    self._m_tag_data_element._read()
                elif _on == Icc4.TagTable.TagDefinition.TagSignatures.viewing_cond_desc:
                    pass
                    self._raw__m_tag_data_element = self._io.read_bytes(self.size_of_data_element)
                    _io__raw__m_tag_data_element = KaitaiStream(BytesIO(self._raw__m_tag_data_element))
                    self._m_tag_data_element = Icc4.TagTable.TagDefinition.ViewingCondDescTag(_io__raw__m_tag_data_element, self, self._root)
                    self._m_tag_data_element._read()
                elif _on == Icc4.TagTable.TagDefinition.TagSignatures.viewing_conditions:
                    pass
                    self._raw__m_tag_data_element = self._io.read_bytes(self.size_of_data_element)
                    _io__raw__m_tag_data_element = KaitaiStream(BytesIO(self._raw__m_tag_data_element))
                    self._m_tag_data_element = Icc4.TagTable.TagDefinition.ViewingConditionsTag(_io__raw__m_tag_data_element, self, self._root)
                    self._m_tag_data_element._read()
                else:
                    pass
                    self._m_tag_data_element = self._io.read_bytes(self.size_of_data_element)
                self._io.seek(_pos)
                return getattr(self, '_m_tag_data_element', None)

            @tag_data_element.setter
            def tag_data_element(self, v):
                self._dirty = True
                self._m_tag_data_element = v

            def _write_tag_data_element(self):
                self._should_write_tag_data_element = False
                _pos = self._io.pos()
                self._io.seek(self.offset_to_data_element)
                _on = self.tag_signature
                if _on == Icc4.TagTable.TagDefinition.TagSignatures.a_to_b_0:
                    pass
                    _io__raw__m_tag_data_element = KaitaiStream(BytesIO(bytearray(self.size_of_data_element)))
                    self._io.add_child_stream(_io__raw__m_tag_data_element)
                    _pos2 = self._io.pos()
                    self._io.seek(self._io.pos() + (self.size_of_data_element))
                    def handler(parent, _io__raw__m_tag_data_element=_io__raw__m_tag_data_element):
                        self._raw__m_tag_data_element = _io__raw__m_tag_data_element.to_byte_array()
                        if len(self._raw__m_tag_data_element) != self.size_of_data_element:
                            raise kaitaistruct.ConsistencyError(u"raw(tag_data_element)", self.size_of_data_element, len(self._raw__m_tag_data_element))
                        parent.write_bytes(self._raw__m_tag_data_element)
                    _io__raw__m_tag_data_element.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                    self._m_tag_data_element._write__seq(_io__raw__m_tag_data_element)
                elif _on == Icc4.TagTable.TagDefinition.TagSignatures.a_to_b_1:
                    pass
                    _io__raw__m_tag_data_element = KaitaiStream(BytesIO(bytearray(self.size_of_data_element)))
                    self._io.add_child_stream(_io__raw__m_tag_data_element)
                    _pos2 = self._io.pos()
                    self._io.seek(self._io.pos() + (self.size_of_data_element))
                    def handler(parent, _io__raw__m_tag_data_element=_io__raw__m_tag_data_element):
                        self._raw__m_tag_data_element = _io__raw__m_tag_data_element.to_byte_array()
                        if len(self._raw__m_tag_data_element) != self.size_of_data_element:
                            raise kaitaistruct.ConsistencyError(u"raw(tag_data_element)", self.size_of_data_element, len(self._raw__m_tag_data_element))
                        parent.write_bytes(self._raw__m_tag_data_element)
                    _io__raw__m_tag_data_element.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                    self._m_tag_data_element._write__seq(_io__raw__m_tag_data_element)
                elif _on == Icc4.TagTable.TagDefinition.TagSignatures.a_to_b_2:
                    pass
                    _io__raw__m_tag_data_element = KaitaiStream(BytesIO(bytearray(self.size_of_data_element)))
                    self._io.add_child_stream(_io__raw__m_tag_data_element)
                    _pos2 = self._io.pos()
                    self._io.seek(self._io.pos() + (self.size_of_data_element))
                    def handler(parent, _io__raw__m_tag_data_element=_io__raw__m_tag_data_element):
                        self._raw__m_tag_data_element = _io__raw__m_tag_data_element.to_byte_array()
                        if len(self._raw__m_tag_data_element) != self.size_of_data_element:
                            raise kaitaistruct.ConsistencyError(u"raw(tag_data_element)", self.size_of_data_element, len(self._raw__m_tag_data_element))
                        parent.write_bytes(self._raw__m_tag_data_element)
                    _io__raw__m_tag_data_element.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                    self._m_tag_data_element._write__seq(_io__raw__m_tag_data_element)
                elif _on == Icc4.TagTable.TagDefinition.TagSignatures.b_to_a_0:
                    pass
                    _io__raw__m_tag_data_element = KaitaiStream(BytesIO(bytearray(self.size_of_data_element)))
                    self._io.add_child_stream(_io__raw__m_tag_data_element)
                    _pos2 = self._io.pos()
                    self._io.seek(self._io.pos() + (self.size_of_data_element))
                    def handler(parent, _io__raw__m_tag_data_element=_io__raw__m_tag_data_element):
                        self._raw__m_tag_data_element = _io__raw__m_tag_data_element.to_byte_array()
                        if len(self._raw__m_tag_data_element) != self.size_of_data_element:
                            raise kaitaistruct.ConsistencyError(u"raw(tag_data_element)", self.size_of_data_element, len(self._raw__m_tag_data_element))
                        parent.write_bytes(self._raw__m_tag_data_element)
                    _io__raw__m_tag_data_element.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                    self._m_tag_data_element._write__seq(_io__raw__m_tag_data_element)
                elif _on == Icc4.TagTable.TagDefinition.TagSignatures.b_to_a_1:
                    pass
                    _io__raw__m_tag_data_element = KaitaiStream(BytesIO(bytearray(self.size_of_data_element)))
                    self._io.add_child_stream(_io__raw__m_tag_data_element)
                    _pos2 = self._io.pos()
                    self._io.seek(self._io.pos() + (self.size_of_data_element))
                    def handler(parent, _io__raw__m_tag_data_element=_io__raw__m_tag_data_element):
                        self._raw__m_tag_data_element = _io__raw__m_tag_data_element.to_byte_array()
                        if len(self._raw__m_tag_data_element) != self.size_of_data_element:
                            raise kaitaistruct.ConsistencyError(u"raw(tag_data_element)", self.size_of_data_element, len(self._raw__m_tag_data_element))
                        parent.write_bytes(self._raw__m_tag_data_element)
                    _io__raw__m_tag_data_element.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                    self._m_tag_data_element._write__seq(_io__raw__m_tag_data_element)
                elif _on == Icc4.TagTable.TagDefinition.TagSignatures.b_to_a_2:
                    pass
                    _io__raw__m_tag_data_element = KaitaiStream(BytesIO(bytearray(self.size_of_data_element)))
                    self._io.add_child_stream(_io__raw__m_tag_data_element)
                    _pos2 = self._io.pos()
                    self._io.seek(self._io.pos() + (self.size_of_data_element))
                    def handler(parent, _io__raw__m_tag_data_element=_io__raw__m_tag_data_element):
                        self._raw__m_tag_data_element = _io__raw__m_tag_data_element.to_byte_array()
                        if len(self._raw__m_tag_data_element) != self.size_of_data_element:
                            raise kaitaistruct.ConsistencyError(u"raw(tag_data_element)", self.size_of_data_element, len(self._raw__m_tag_data_element))
                        parent.write_bytes(self._raw__m_tag_data_element)
                    _io__raw__m_tag_data_element.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                    self._m_tag_data_element._write__seq(_io__raw__m_tag_data_element)
                elif _on == Icc4.TagTable.TagDefinition.TagSignatures.b_to_d_0:
                    pass
                    _io__raw__m_tag_data_element = KaitaiStream(BytesIO(bytearray(self.size_of_data_element)))
                    self._io.add_child_stream(_io__raw__m_tag_data_element)
                    _pos2 = self._io.pos()
                    self._io.seek(self._io.pos() + (self.size_of_data_element))
                    def handler(parent, _io__raw__m_tag_data_element=_io__raw__m_tag_data_element):
                        self._raw__m_tag_data_element = _io__raw__m_tag_data_element.to_byte_array()
                        if len(self._raw__m_tag_data_element) != self.size_of_data_element:
                            raise kaitaistruct.ConsistencyError(u"raw(tag_data_element)", self.size_of_data_element, len(self._raw__m_tag_data_element))
                        parent.write_bytes(self._raw__m_tag_data_element)
                    _io__raw__m_tag_data_element.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                    self._m_tag_data_element._write__seq(_io__raw__m_tag_data_element)
                elif _on == Icc4.TagTable.TagDefinition.TagSignatures.b_to_d_1:
                    pass
                    _io__raw__m_tag_data_element = KaitaiStream(BytesIO(bytearray(self.size_of_data_element)))
                    self._io.add_child_stream(_io__raw__m_tag_data_element)
                    _pos2 = self._io.pos()
                    self._io.seek(self._io.pos() + (self.size_of_data_element))
                    def handler(parent, _io__raw__m_tag_data_element=_io__raw__m_tag_data_element):
                        self._raw__m_tag_data_element = _io__raw__m_tag_data_element.to_byte_array()
                        if len(self._raw__m_tag_data_element) != self.size_of_data_element:
                            raise kaitaistruct.ConsistencyError(u"raw(tag_data_element)", self.size_of_data_element, len(self._raw__m_tag_data_element))
                        parent.write_bytes(self._raw__m_tag_data_element)
                    _io__raw__m_tag_data_element.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                    self._m_tag_data_element._write__seq(_io__raw__m_tag_data_element)
                elif _on == Icc4.TagTable.TagDefinition.TagSignatures.b_to_d_2:
                    pass
                    _io__raw__m_tag_data_element = KaitaiStream(BytesIO(bytearray(self.size_of_data_element)))
                    self._io.add_child_stream(_io__raw__m_tag_data_element)
                    _pos2 = self._io.pos()
                    self._io.seek(self._io.pos() + (self.size_of_data_element))
                    def handler(parent, _io__raw__m_tag_data_element=_io__raw__m_tag_data_element):
                        self._raw__m_tag_data_element = _io__raw__m_tag_data_element.to_byte_array()
                        if len(self._raw__m_tag_data_element) != self.size_of_data_element:
                            raise kaitaistruct.ConsistencyError(u"raw(tag_data_element)", self.size_of_data_element, len(self._raw__m_tag_data_element))
                        parent.write_bytes(self._raw__m_tag_data_element)
                    _io__raw__m_tag_data_element.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                    self._m_tag_data_element._write__seq(_io__raw__m_tag_data_element)
                elif _on == Icc4.TagTable.TagDefinition.TagSignatures.b_to_d_3:
                    pass
                    _io__raw__m_tag_data_element = KaitaiStream(BytesIO(bytearray(self.size_of_data_element)))
                    self._io.add_child_stream(_io__raw__m_tag_data_element)
                    _pos2 = self._io.pos()
                    self._io.seek(self._io.pos() + (self.size_of_data_element))
                    def handler(parent, _io__raw__m_tag_data_element=_io__raw__m_tag_data_element):
                        self._raw__m_tag_data_element = _io__raw__m_tag_data_element.to_byte_array()
                        if len(self._raw__m_tag_data_element) != self.size_of_data_element:
                            raise kaitaistruct.ConsistencyError(u"raw(tag_data_element)", self.size_of_data_element, len(self._raw__m_tag_data_element))
                        parent.write_bytes(self._raw__m_tag_data_element)
                    _io__raw__m_tag_data_element.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                    self._m_tag_data_element._write__seq(_io__raw__m_tag_data_element)
                elif _on == Icc4.TagTable.TagDefinition.TagSignatures.blue_matrix_column:
                    pass
                    _io__raw__m_tag_data_element = KaitaiStream(BytesIO(bytearray(self.size_of_data_element)))
                    self._io.add_child_stream(_io__raw__m_tag_data_element)
                    _pos2 = self._io.pos()
                    self._io.seek(self._io.pos() + (self.size_of_data_element))
                    def handler(parent, _io__raw__m_tag_data_element=_io__raw__m_tag_data_element):
                        self._raw__m_tag_data_element = _io__raw__m_tag_data_element.to_byte_array()
                        if len(self._raw__m_tag_data_element) != self.size_of_data_element:
                            raise kaitaistruct.ConsistencyError(u"raw(tag_data_element)", self.size_of_data_element, len(self._raw__m_tag_data_element))
                        parent.write_bytes(self._raw__m_tag_data_element)
                    _io__raw__m_tag_data_element.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                    self._m_tag_data_element._write__seq(_io__raw__m_tag_data_element)
                elif _on == Icc4.TagTable.TagDefinition.TagSignatures.blue_trc:
                    pass
                    _io__raw__m_tag_data_element = KaitaiStream(BytesIO(bytearray(self.size_of_data_element)))
                    self._io.add_child_stream(_io__raw__m_tag_data_element)
                    _pos2 = self._io.pos()
                    self._io.seek(self._io.pos() + (self.size_of_data_element))
                    def handler(parent, _io__raw__m_tag_data_element=_io__raw__m_tag_data_element):
                        self._raw__m_tag_data_element = _io__raw__m_tag_data_element.to_byte_array()
                        if len(self._raw__m_tag_data_element) != self.size_of_data_element:
                            raise kaitaistruct.ConsistencyError(u"raw(tag_data_element)", self.size_of_data_element, len(self._raw__m_tag_data_element))
                        parent.write_bytes(self._raw__m_tag_data_element)
                    _io__raw__m_tag_data_element.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                    self._m_tag_data_element._write__seq(_io__raw__m_tag_data_element)
                elif _on == Icc4.TagTable.TagDefinition.TagSignatures.calibration_date_time:
                    pass
                    _io__raw__m_tag_data_element = KaitaiStream(BytesIO(bytearray(self.size_of_data_element)))
                    self._io.add_child_stream(_io__raw__m_tag_data_element)
                    _pos2 = self._io.pos()
                    self._io.seek(self._io.pos() + (self.size_of_data_element))
                    def handler(parent, _io__raw__m_tag_data_element=_io__raw__m_tag_data_element):
                        self._raw__m_tag_data_element = _io__raw__m_tag_data_element.to_byte_array()
                        if len(self._raw__m_tag_data_element) != self.size_of_data_element:
                            raise kaitaistruct.ConsistencyError(u"raw(tag_data_element)", self.size_of_data_element, len(self._raw__m_tag_data_element))
                        parent.write_bytes(self._raw__m_tag_data_element)
                    _io__raw__m_tag_data_element.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                    self._m_tag_data_element._write__seq(_io__raw__m_tag_data_element)
                elif _on == Icc4.TagTable.TagDefinition.TagSignatures.char_target:
                    pass
                    _io__raw__m_tag_data_element = KaitaiStream(BytesIO(bytearray(self.size_of_data_element)))
                    self._io.add_child_stream(_io__raw__m_tag_data_element)
                    _pos2 = self._io.pos()
                    self._io.seek(self._io.pos() + (self.size_of_data_element))
                    def handler(parent, _io__raw__m_tag_data_element=_io__raw__m_tag_data_element):
                        self._raw__m_tag_data_element = _io__raw__m_tag_data_element.to_byte_array()
                        if len(self._raw__m_tag_data_element) != self.size_of_data_element:
                            raise kaitaistruct.ConsistencyError(u"raw(tag_data_element)", self.size_of_data_element, len(self._raw__m_tag_data_element))
                        parent.write_bytes(self._raw__m_tag_data_element)
                    _io__raw__m_tag_data_element.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                    self._m_tag_data_element._write__seq(_io__raw__m_tag_data_element)
                elif _on == Icc4.TagTable.TagDefinition.TagSignatures.chromatic_adaptation:
                    pass
                    _io__raw__m_tag_data_element = KaitaiStream(BytesIO(bytearray(self.size_of_data_element)))
                    self._io.add_child_stream(_io__raw__m_tag_data_element)
                    _pos2 = self._io.pos()
                    self._io.seek(self._io.pos() + (self.size_of_data_element))
                    def handler(parent, _io__raw__m_tag_data_element=_io__raw__m_tag_data_element):
                        self._raw__m_tag_data_element = _io__raw__m_tag_data_element.to_byte_array()
                        if len(self._raw__m_tag_data_element) != self.size_of_data_element:
                            raise kaitaistruct.ConsistencyError(u"raw(tag_data_element)", self.size_of_data_element, len(self._raw__m_tag_data_element))
                        parent.write_bytes(self._raw__m_tag_data_element)
                    _io__raw__m_tag_data_element.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                    self._m_tag_data_element._write__seq(_io__raw__m_tag_data_element)
                elif _on == Icc4.TagTable.TagDefinition.TagSignatures.chromaticity:
                    pass
                    _io__raw__m_tag_data_element = KaitaiStream(BytesIO(bytearray(self.size_of_data_element)))
                    self._io.add_child_stream(_io__raw__m_tag_data_element)
                    _pos2 = self._io.pos()
                    self._io.seek(self._io.pos() + (self.size_of_data_element))
                    def handler(parent, _io__raw__m_tag_data_element=_io__raw__m_tag_data_element):
                        self._raw__m_tag_data_element = _io__raw__m_tag_data_element.to_byte_array()
                        if len(self._raw__m_tag_data_element) != self.size_of_data_element:
                            raise kaitaistruct.ConsistencyError(u"raw(tag_data_element)", self.size_of_data_element, len(self._raw__m_tag_data_element))
                        parent.write_bytes(self._raw__m_tag_data_element)
                    _io__raw__m_tag_data_element.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                    self._m_tag_data_element._write__seq(_io__raw__m_tag_data_element)
                elif _on == Icc4.TagTable.TagDefinition.TagSignatures.colorant_order:
                    pass
                    _io__raw__m_tag_data_element = KaitaiStream(BytesIO(bytearray(self.size_of_data_element)))
                    self._io.add_child_stream(_io__raw__m_tag_data_element)
                    _pos2 = self._io.pos()
                    self._io.seek(self._io.pos() + (self.size_of_data_element))
                    def handler(parent, _io__raw__m_tag_data_element=_io__raw__m_tag_data_element):
                        self._raw__m_tag_data_element = _io__raw__m_tag_data_element.to_byte_array()
                        if len(self._raw__m_tag_data_element) != self.size_of_data_element:
                            raise kaitaistruct.ConsistencyError(u"raw(tag_data_element)", self.size_of_data_element, len(self._raw__m_tag_data_element))
                        parent.write_bytes(self._raw__m_tag_data_element)
                    _io__raw__m_tag_data_element.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                    self._m_tag_data_element._write__seq(_io__raw__m_tag_data_element)
                elif _on == Icc4.TagTable.TagDefinition.TagSignatures.colorant_table:
                    pass
                    _io__raw__m_tag_data_element = KaitaiStream(BytesIO(bytearray(self.size_of_data_element)))
                    self._io.add_child_stream(_io__raw__m_tag_data_element)
                    _pos2 = self._io.pos()
                    self._io.seek(self._io.pos() + (self.size_of_data_element))
                    def handler(parent, _io__raw__m_tag_data_element=_io__raw__m_tag_data_element):
                        self._raw__m_tag_data_element = _io__raw__m_tag_data_element.to_byte_array()
                        if len(self._raw__m_tag_data_element) != self.size_of_data_element:
                            raise kaitaistruct.ConsistencyError(u"raw(tag_data_element)", self.size_of_data_element, len(self._raw__m_tag_data_element))
                        parent.write_bytes(self._raw__m_tag_data_element)
                    _io__raw__m_tag_data_element.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                    self._m_tag_data_element._write__seq(_io__raw__m_tag_data_element)
                elif _on == Icc4.TagTable.TagDefinition.TagSignatures.colorant_table_out:
                    pass
                    _io__raw__m_tag_data_element = KaitaiStream(BytesIO(bytearray(self.size_of_data_element)))
                    self._io.add_child_stream(_io__raw__m_tag_data_element)
                    _pos2 = self._io.pos()
                    self._io.seek(self._io.pos() + (self.size_of_data_element))
                    def handler(parent, _io__raw__m_tag_data_element=_io__raw__m_tag_data_element):
                        self._raw__m_tag_data_element = _io__raw__m_tag_data_element.to_byte_array()
                        if len(self._raw__m_tag_data_element) != self.size_of_data_element:
                            raise kaitaistruct.ConsistencyError(u"raw(tag_data_element)", self.size_of_data_element, len(self._raw__m_tag_data_element))
                        parent.write_bytes(self._raw__m_tag_data_element)
                    _io__raw__m_tag_data_element.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                    self._m_tag_data_element._write__seq(_io__raw__m_tag_data_element)
                elif _on == Icc4.TagTable.TagDefinition.TagSignatures.colorimetric_intent_image_state:
                    pass
                    _io__raw__m_tag_data_element = KaitaiStream(BytesIO(bytearray(self.size_of_data_element)))
                    self._io.add_child_stream(_io__raw__m_tag_data_element)
                    _pos2 = self._io.pos()
                    self._io.seek(self._io.pos() + (self.size_of_data_element))
                    def handler(parent, _io__raw__m_tag_data_element=_io__raw__m_tag_data_element):
                        self._raw__m_tag_data_element = _io__raw__m_tag_data_element.to_byte_array()
                        if len(self._raw__m_tag_data_element) != self.size_of_data_element:
                            raise kaitaistruct.ConsistencyError(u"raw(tag_data_element)", self.size_of_data_element, len(self._raw__m_tag_data_element))
                        parent.write_bytes(self._raw__m_tag_data_element)
                    _io__raw__m_tag_data_element.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                    self._m_tag_data_element._write__seq(_io__raw__m_tag_data_element)
                elif _on == Icc4.TagTable.TagDefinition.TagSignatures.copyright:
                    pass
                    _io__raw__m_tag_data_element = KaitaiStream(BytesIO(bytearray(self.size_of_data_element)))
                    self._io.add_child_stream(_io__raw__m_tag_data_element)
                    _pos2 = self._io.pos()
                    self._io.seek(self._io.pos() + (self.size_of_data_element))
                    def handler(parent, _io__raw__m_tag_data_element=_io__raw__m_tag_data_element):
                        self._raw__m_tag_data_element = _io__raw__m_tag_data_element.to_byte_array()
                        if len(self._raw__m_tag_data_element) != self.size_of_data_element:
                            raise kaitaistruct.ConsistencyError(u"raw(tag_data_element)", self.size_of_data_element, len(self._raw__m_tag_data_element))
                        parent.write_bytes(self._raw__m_tag_data_element)
                    _io__raw__m_tag_data_element.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                    self._m_tag_data_element._write__seq(_io__raw__m_tag_data_element)
                elif _on == Icc4.TagTable.TagDefinition.TagSignatures.d_to_b_0:
                    pass
                    _io__raw__m_tag_data_element = KaitaiStream(BytesIO(bytearray(self.size_of_data_element)))
                    self._io.add_child_stream(_io__raw__m_tag_data_element)
                    _pos2 = self._io.pos()
                    self._io.seek(self._io.pos() + (self.size_of_data_element))
                    def handler(parent, _io__raw__m_tag_data_element=_io__raw__m_tag_data_element):
                        self._raw__m_tag_data_element = _io__raw__m_tag_data_element.to_byte_array()
                        if len(self._raw__m_tag_data_element) != self.size_of_data_element:
                            raise kaitaistruct.ConsistencyError(u"raw(tag_data_element)", self.size_of_data_element, len(self._raw__m_tag_data_element))
                        parent.write_bytes(self._raw__m_tag_data_element)
                    _io__raw__m_tag_data_element.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                    self._m_tag_data_element._write__seq(_io__raw__m_tag_data_element)
                elif _on == Icc4.TagTable.TagDefinition.TagSignatures.d_to_b_1:
                    pass
                    _io__raw__m_tag_data_element = KaitaiStream(BytesIO(bytearray(self.size_of_data_element)))
                    self._io.add_child_stream(_io__raw__m_tag_data_element)
                    _pos2 = self._io.pos()
                    self._io.seek(self._io.pos() + (self.size_of_data_element))
                    def handler(parent, _io__raw__m_tag_data_element=_io__raw__m_tag_data_element):
                        self._raw__m_tag_data_element = _io__raw__m_tag_data_element.to_byte_array()
                        if len(self._raw__m_tag_data_element) != self.size_of_data_element:
                            raise kaitaistruct.ConsistencyError(u"raw(tag_data_element)", self.size_of_data_element, len(self._raw__m_tag_data_element))
                        parent.write_bytes(self._raw__m_tag_data_element)
                    _io__raw__m_tag_data_element.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                    self._m_tag_data_element._write__seq(_io__raw__m_tag_data_element)
                elif _on == Icc4.TagTable.TagDefinition.TagSignatures.d_to_b_2:
                    pass
                    _io__raw__m_tag_data_element = KaitaiStream(BytesIO(bytearray(self.size_of_data_element)))
                    self._io.add_child_stream(_io__raw__m_tag_data_element)
                    _pos2 = self._io.pos()
                    self._io.seek(self._io.pos() + (self.size_of_data_element))
                    def handler(parent, _io__raw__m_tag_data_element=_io__raw__m_tag_data_element):
                        self._raw__m_tag_data_element = _io__raw__m_tag_data_element.to_byte_array()
                        if len(self._raw__m_tag_data_element) != self.size_of_data_element:
                            raise kaitaistruct.ConsistencyError(u"raw(tag_data_element)", self.size_of_data_element, len(self._raw__m_tag_data_element))
                        parent.write_bytes(self._raw__m_tag_data_element)
                    _io__raw__m_tag_data_element.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                    self._m_tag_data_element._write__seq(_io__raw__m_tag_data_element)
                elif _on == Icc4.TagTable.TagDefinition.TagSignatures.d_to_b_3:
                    pass
                    _io__raw__m_tag_data_element = KaitaiStream(BytesIO(bytearray(self.size_of_data_element)))
                    self._io.add_child_stream(_io__raw__m_tag_data_element)
                    _pos2 = self._io.pos()
                    self._io.seek(self._io.pos() + (self.size_of_data_element))
                    def handler(parent, _io__raw__m_tag_data_element=_io__raw__m_tag_data_element):
                        self._raw__m_tag_data_element = _io__raw__m_tag_data_element.to_byte_array()
                        if len(self._raw__m_tag_data_element) != self.size_of_data_element:
                            raise kaitaistruct.ConsistencyError(u"raw(tag_data_element)", self.size_of_data_element, len(self._raw__m_tag_data_element))
                        parent.write_bytes(self._raw__m_tag_data_element)
                    _io__raw__m_tag_data_element.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                    self._m_tag_data_element._write__seq(_io__raw__m_tag_data_element)
                elif _on == Icc4.TagTable.TagDefinition.TagSignatures.device_mfg_desc:
                    pass
                    _io__raw__m_tag_data_element = KaitaiStream(BytesIO(bytearray(self.size_of_data_element)))
                    self._io.add_child_stream(_io__raw__m_tag_data_element)
                    _pos2 = self._io.pos()
                    self._io.seek(self._io.pos() + (self.size_of_data_element))
                    def handler(parent, _io__raw__m_tag_data_element=_io__raw__m_tag_data_element):
                        self._raw__m_tag_data_element = _io__raw__m_tag_data_element.to_byte_array()
                        if len(self._raw__m_tag_data_element) != self.size_of_data_element:
                            raise kaitaistruct.ConsistencyError(u"raw(tag_data_element)", self.size_of_data_element, len(self._raw__m_tag_data_element))
                        parent.write_bytes(self._raw__m_tag_data_element)
                    _io__raw__m_tag_data_element.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                    self._m_tag_data_element._write__seq(_io__raw__m_tag_data_element)
                elif _on == Icc4.TagTable.TagDefinition.TagSignatures.device_model_desc:
                    pass
                    _io__raw__m_tag_data_element = KaitaiStream(BytesIO(bytearray(self.size_of_data_element)))
                    self._io.add_child_stream(_io__raw__m_tag_data_element)
                    _pos2 = self._io.pos()
                    self._io.seek(self._io.pos() + (self.size_of_data_element))
                    def handler(parent, _io__raw__m_tag_data_element=_io__raw__m_tag_data_element):
                        self._raw__m_tag_data_element = _io__raw__m_tag_data_element.to_byte_array()
                        if len(self._raw__m_tag_data_element) != self.size_of_data_element:
                            raise kaitaistruct.ConsistencyError(u"raw(tag_data_element)", self.size_of_data_element, len(self._raw__m_tag_data_element))
                        parent.write_bytes(self._raw__m_tag_data_element)
                    _io__raw__m_tag_data_element.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                    self._m_tag_data_element._write__seq(_io__raw__m_tag_data_element)
                elif _on == Icc4.TagTable.TagDefinition.TagSignatures.gamut:
                    pass
                    _io__raw__m_tag_data_element = KaitaiStream(BytesIO(bytearray(self.size_of_data_element)))
                    self._io.add_child_stream(_io__raw__m_tag_data_element)
                    _pos2 = self._io.pos()
                    self._io.seek(self._io.pos() + (self.size_of_data_element))
                    def handler(parent, _io__raw__m_tag_data_element=_io__raw__m_tag_data_element):
                        self._raw__m_tag_data_element = _io__raw__m_tag_data_element.to_byte_array()
                        if len(self._raw__m_tag_data_element) != self.size_of_data_element:
                            raise kaitaistruct.ConsistencyError(u"raw(tag_data_element)", self.size_of_data_element, len(self._raw__m_tag_data_element))
                        parent.write_bytes(self._raw__m_tag_data_element)
                    _io__raw__m_tag_data_element.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                    self._m_tag_data_element._write__seq(_io__raw__m_tag_data_element)
                elif _on == Icc4.TagTable.TagDefinition.TagSignatures.gray_trc:
                    pass
                    _io__raw__m_tag_data_element = KaitaiStream(BytesIO(bytearray(self.size_of_data_element)))
                    self._io.add_child_stream(_io__raw__m_tag_data_element)
                    _pos2 = self._io.pos()
                    self._io.seek(self._io.pos() + (self.size_of_data_element))
                    def handler(parent, _io__raw__m_tag_data_element=_io__raw__m_tag_data_element):
                        self._raw__m_tag_data_element = _io__raw__m_tag_data_element.to_byte_array()
                        if len(self._raw__m_tag_data_element) != self.size_of_data_element:
                            raise kaitaistruct.ConsistencyError(u"raw(tag_data_element)", self.size_of_data_element, len(self._raw__m_tag_data_element))
                        parent.write_bytes(self._raw__m_tag_data_element)
                    _io__raw__m_tag_data_element.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                    self._m_tag_data_element._write__seq(_io__raw__m_tag_data_element)
                elif _on == Icc4.TagTable.TagDefinition.TagSignatures.green_matrix_column:
                    pass
                    _io__raw__m_tag_data_element = KaitaiStream(BytesIO(bytearray(self.size_of_data_element)))
                    self._io.add_child_stream(_io__raw__m_tag_data_element)
                    _pos2 = self._io.pos()
                    self._io.seek(self._io.pos() + (self.size_of_data_element))
                    def handler(parent, _io__raw__m_tag_data_element=_io__raw__m_tag_data_element):
                        self._raw__m_tag_data_element = _io__raw__m_tag_data_element.to_byte_array()
                        if len(self._raw__m_tag_data_element) != self.size_of_data_element:
                            raise kaitaistruct.ConsistencyError(u"raw(tag_data_element)", self.size_of_data_element, len(self._raw__m_tag_data_element))
                        parent.write_bytes(self._raw__m_tag_data_element)
                    _io__raw__m_tag_data_element.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                    self._m_tag_data_element._write__seq(_io__raw__m_tag_data_element)
                elif _on == Icc4.TagTable.TagDefinition.TagSignatures.green_trc:
                    pass
                    _io__raw__m_tag_data_element = KaitaiStream(BytesIO(bytearray(self.size_of_data_element)))
                    self._io.add_child_stream(_io__raw__m_tag_data_element)
                    _pos2 = self._io.pos()
                    self._io.seek(self._io.pos() + (self.size_of_data_element))
                    def handler(parent, _io__raw__m_tag_data_element=_io__raw__m_tag_data_element):
                        self._raw__m_tag_data_element = _io__raw__m_tag_data_element.to_byte_array()
                        if len(self._raw__m_tag_data_element) != self.size_of_data_element:
                            raise kaitaistruct.ConsistencyError(u"raw(tag_data_element)", self.size_of_data_element, len(self._raw__m_tag_data_element))
                        parent.write_bytes(self._raw__m_tag_data_element)
                    _io__raw__m_tag_data_element.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                    self._m_tag_data_element._write__seq(_io__raw__m_tag_data_element)
                elif _on == Icc4.TagTable.TagDefinition.TagSignatures.luminance:
                    pass
                    _io__raw__m_tag_data_element = KaitaiStream(BytesIO(bytearray(self.size_of_data_element)))
                    self._io.add_child_stream(_io__raw__m_tag_data_element)
                    _pos2 = self._io.pos()
                    self._io.seek(self._io.pos() + (self.size_of_data_element))
                    def handler(parent, _io__raw__m_tag_data_element=_io__raw__m_tag_data_element):
                        self._raw__m_tag_data_element = _io__raw__m_tag_data_element.to_byte_array()
                        if len(self._raw__m_tag_data_element) != self.size_of_data_element:
                            raise kaitaistruct.ConsistencyError(u"raw(tag_data_element)", self.size_of_data_element, len(self._raw__m_tag_data_element))
                        parent.write_bytes(self._raw__m_tag_data_element)
                    _io__raw__m_tag_data_element.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                    self._m_tag_data_element._write__seq(_io__raw__m_tag_data_element)
                elif _on == Icc4.TagTable.TagDefinition.TagSignatures.measurement:
                    pass
                    _io__raw__m_tag_data_element = KaitaiStream(BytesIO(bytearray(self.size_of_data_element)))
                    self._io.add_child_stream(_io__raw__m_tag_data_element)
                    _pos2 = self._io.pos()
                    self._io.seek(self._io.pos() + (self.size_of_data_element))
                    def handler(parent, _io__raw__m_tag_data_element=_io__raw__m_tag_data_element):
                        self._raw__m_tag_data_element = _io__raw__m_tag_data_element.to_byte_array()
                        if len(self._raw__m_tag_data_element) != self.size_of_data_element:
                            raise kaitaistruct.ConsistencyError(u"raw(tag_data_element)", self.size_of_data_element, len(self._raw__m_tag_data_element))
                        parent.write_bytes(self._raw__m_tag_data_element)
                    _io__raw__m_tag_data_element.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                    self._m_tag_data_element._write__seq(_io__raw__m_tag_data_element)
                elif _on == Icc4.TagTable.TagDefinition.TagSignatures.media_white_point:
                    pass
                    _io__raw__m_tag_data_element = KaitaiStream(BytesIO(bytearray(self.size_of_data_element)))
                    self._io.add_child_stream(_io__raw__m_tag_data_element)
                    _pos2 = self._io.pos()
                    self._io.seek(self._io.pos() + (self.size_of_data_element))
                    def handler(parent, _io__raw__m_tag_data_element=_io__raw__m_tag_data_element):
                        self._raw__m_tag_data_element = _io__raw__m_tag_data_element.to_byte_array()
                        if len(self._raw__m_tag_data_element) != self.size_of_data_element:
                            raise kaitaistruct.ConsistencyError(u"raw(tag_data_element)", self.size_of_data_element, len(self._raw__m_tag_data_element))
                        parent.write_bytes(self._raw__m_tag_data_element)
                    _io__raw__m_tag_data_element.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                    self._m_tag_data_element._write__seq(_io__raw__m_tag_data_element)
                elif _on == Icc4.TagTable.TagDefinition.TagSignatures.named_color_2:
                    pass
                    _io__raw__m_tag_data_element = KaitaiStream(BytesIO(bytearray(self.size_of_data_element)))
                    self._io.add_child_stream(_io__raw__m_tag_data_element)
                    _pos2 = self._io.pos()
                    self._io.seek(self._io.pos() + (self.size_of_data_element))
                    def handler(parent, _io__raw__m_tag_data_element=_io__raw__m_tag_data_element):
                        self._raw__m_tag_data_element = _io__raw__m_tag_data_element.to_byte_array()
                        if len(self._raw__m_tag_data_element) != self.size_of_data_element:
                            raise kaitaistruct.ConsistencyError(u"raw(tag_data_element)", self.size_of_data_element, len(self._raw__m_tag_data_element))
                        parent.write_bytes(self._raw__m_tag_data_element)
                    _io__raw__m_tag_data_element.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                    self._m_tag_data_element._write__seq(_io__raw__m_tag_data_element)
                elif _on == Icc4.TagTable.TagDefinition.TagSignatures.output_response:
                    pass
                    _io__raw__m_tag_data_element = KaitaiStream(BytesIO(bytearray(self.size_of_data_element)))
                    self._io.add_child_stream(_io__raw__m_tag_data_element)
                    _pos2 = self._io.pos()
                    self._io.seek(self._io.pos() + (self.size_of_data_element))
                    def handler(parent, _io__raw__m_tag_data_element=_io__raw__m_tag_data_element):
                        self._raw__m_tag_data_element = _io__raw__m_tag_data_element.to_byte_array()
                        if len(self._raw__m_tag_data_element) != self.size_of_data_element:
                            raise kaitaistruct.ConsistencyError(u"raw(tag_data_element)", self.size_of_data_element, len(self._raw__m_tag_data_element))
                        parent.write_bytes(self._raw__m_tag_data_element)
                    _io__raw__m_tag_data_element.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                    self._m_tag_data_element._write__seq(_io__raw__m_tag_data_element)
                elif _on == Icc4.TagTable.TagDefinition.TagSignatures.perceptual_rendering_intent_gamut:
                    pass
                    _io__raw__m_tag_data_element = KaitaiStream(BytesIO(bytearray(self.size_of_data_element)))
                    self._io.add_child_stream(_io__raw__m_tag_data_element)
                    _pos2 = self._io.pos()
                    self._io.seek(self._io.pos() + (self.size_of_data_element))
                    def handler(parent, _io__raw__m_tag_data_element=_io__raw__m_tag_data_element):
                        self._raw__m_tag_data_element = _io__raw__m_tag_data_element.to_byte_array()
                        if len(self._raw__m_tag_data_element) != self.size_of_data_element:
                            raise kaitaistruct.ConsistencyError(u"raw(tag_data_element)", self.size_of_data_element, len(self._raw__m_tag_data_element))
                        parent.write_bytes(self._raw__m_tag_data_element)
                    _io__raw__m_tag_data_element.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                    self._m_tag_data_element._write__seq(_io__raw__m_tag_data_element)
                elif _on == Icc4.TagTable.TagDefinition.TagSignatures.preview_0:
                    pass
                    _io__raw__m_tag_data_element = KaitaiStream(BytesIO(bytearray(self.size_of_data_element)))
                    self._io.add_child_stream(_io__raw__m_tag_data_element)
                    _pos2 = self._io.pos()
                    self._io.seek(self._io.pos() + (self.size_of_data_element))
                    def handler(parent, _io__raw__m_tag_data_element=_io__raw__m_tag_data_element):
                        self._raw__m_tag_data_element = _io__raw__m_tag_data_element.to_byte_array()
                        if len(self._raw__m_tag_data_element) != self.size_of_data_element:
                            raise kaitaistruct.ConsistencyError(u"raw(tag_data_element)", self.size_of_data_element, len(self._raw__m_tag_data_element))
                        parent.write_bytes(self._raw__m_tag_data_element)
                    _io__raw__m_tag_data_element.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                    self._m_tag_data_element._write__seq(_io__raw__m_tag_data_element)
                elif _on == Icc4.TagTable.TagDefinition.TagSignatures.preview_1:
                    pass
                    _io__raw__m_tag_data_element = KaitaiStream(BytesIO(bytearray(self.size_of_data_element)))
                    self._io.add_child_stream(_io__raw__m_tag_data_element)
                    _pos2 = self._io.pos()
                    self._io.seek(self._io.pos() + (self.size_of_data_element))
                    def handler(parent, _io__raw__m_tag_data_element=_io__raw__m_tag_data_element):
                        self._raw__m_tag_data_element = _io__raw__m_tag_data_element.to_byte_array()
                        if len(self._raw__m_tag_data_element) != self.size_of_data_element:
                            raise kaitaistruct.ConsistencyError(u"raw(tag_data_element)", self.size_of_data_element, len(self._raw__m_tag_data_element))
                        parent.write_bytes(self._raw__m_tag_data_element)
                    _io__raw__m_tag_data_element.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                    self._m_tag_data_element._write__seq(_io__raw__m_tag_data_element)
                elif _on == Icc4.TagTable.TagDefinition.TagSignatures.preview_2:
                    pass
                    _io__raw__m_tag_data_element = KaitaiStream(BytesIO(bytearray(self.size_of_data_element)))
                    self._io.add_child_stream(_io__raw__m_tag_data_element)
                    _pos2 = self._io.pos()
                    self._io.seek(self._io.pos() + (self.size_of_data_element))
                    def handler(parent, _io__raw__m_tag_data_element=_io__raw__m_tag_data_element):
                        self._raw__m_tag_data_element = _io__raw__m_tag_data_element.to_byte_array()
                        if len(self._raw__m_tag_data_element) != self.size_of_data_element:
                            raise kaitaistruct.ConsistencyError(u"raw(tag_data_element)", self.size_of_data_element, len(self._raw__m_tag_data_element))
                        parent.write_bytes(self._raw__m_tag_data_element)
                    _io__raw__m_tag_data_element.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                    self._m_tag_data_element._write__seq(_io__raw__m_tag_data_element)
                elif _on == Icc4.TagTable.TagDefinition.TagSignatures.profile_description:
                    pass
                    _io__raw__m_tag_data_element = KaitaiStream(BytesIO(bytearray(self.size_of_data_element)))
                    self._io.add_child_stream(_io__raw__m_tag_data_element)
                    _pos2 = self._io.pos()
                    self._io.seek(self._io.pos() + (self.size_of_data_element))
                    def handler(parent, _io__raw__m_tag_data_element=_io__raw__m_tag_data_element):
                        self._raw__m_tag_data_element = _io__raw__m_tag_data_element.to_byte_array()
                        if len(self._raw__m_tag_data_element) != self.size_of_data_element:
                            raise kaitaistruct.ConsistencyError(u"raw(tag_data_element)", self.size_of_data_element, len(self._raw__m_tag_data_element))
                        parent.write_bytes(self._raw__m_tag_data_element)
                    _io__raw__m_tag_data_element.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                    self._m_tag_data_element._write__seq(_io__raw__m_tag_data_element)
                elif _on == Icc4.TagTable.TagDefinition.TagSignatures.profile_sequence:
                    pass
                    _io__raw__m_tag_data_element = KaitaiStream(BytesIO(bytearray(self.size_of_data_element)))
                    self._io.add_child_stream(_io__raw__m_tag_data_element)
                    _pos2 = self._io.pos()
                    self._io.seek(self._io.pos() + (self.size_of_data_element))
                    def handler(parent, _io__raw__m_tag_data_element=_io__raw__m_tag_data_element):
                        self._raw__m_tag_data_element = _io__raw__m_tag_data_element.to_byte_array()
                        if len(self._raw__m_tag_data_element) != self.size_of_data_element:
                            raise kaitaistruct.ConsistencyError(u"raw(tag_data_element)", self.size_of_data_element, len(self._raw__m_tag_data_element))
                        parent.write_bytes(self._raw__m_tag_data_element)
                    _io__raw__m_tag_data_element.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                    self._m_tag_data_element._write__seq(_io__raw__m_tag_data_element)
                elif _on == Icc4.TagTable.TagDefinition.TagSignatures.profile_sequence_identifier:
                    pass
                    _io__raw__m_tag_data_element = KaitaiStream(BytesIO(bytearray(self.size_of_data_element)))
                    self._io.add_child_stream(_io__raw__m_tag_data_element)
                    _pos2 = self._io.pos()
                    self._io.seek(self._io.pos() + (self.size_of_data_element))
                    def handler(parent, _io__raw__m_tag_data_element=_io__raw__m_tag_data_element):
                        self._raw__m_tag_data_element = _io__raw__m_tag_data_element.to_byte_array()
                        if len(self._raw__m_tag_data_element) != self.size_of_data_element:
                            raise kaitaistruct.ConsistencyError(u"raw(tag_data_element)", self.size_of_data_element, len(self._raw__m_tag_data_element))
                        parent.write_bytes(self._raw__m_tag_data_element)
                    _io__raw__m_tag_data_element.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                    self._m_tag_data_element._write__seq(_io__raw__m_tag_data_element)
                elif _on == Icc4.TagTable.TagDefinition.TagSignatures.red_matrix_column:
                    pass
                    _io__raw__m_tag_data_element = KaitaiStream(BytesIO(bytearray(self.size_of_data_element)))
                    self._io.add_child_stream(_io__raw__m_tag_data_element)
                    _pos2 = self._io.pos()
                    self._io.seek(self._io.pos() + (self.size_of_data_element))
                    def handler(parent, _io__raw__m_tag_data_element=_io__raw__m_tag_data_element):
                        self._raw__m_tag_data_element = _io__raw__m_tag_data_element.to_byte_array()
                        if len(self._raw__m_tag_data_element) != self.size_of_data_element:
                            raise kaitaistruct.ConsistencyError(u"raw(tag_data_element)", self.size_of_data_element, len(self._raw__m_tag_data_element))
                        parent.write_bytes(self._raw__m_tag_data_element)
                    _io__raw__m_tag_data_element.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                    self._m_tag_data_element._write__seq(_io__raw__m_tag_data_element)
                elif _on == Icc4.TagTable.TagDefinition.TagSignatures.red_trc:
                    pass
                    _io__raw__m_tag_data_element = KaitaiStream(BytesIO(bytearray(self.size_of_data_element)))
                    self._io.add_child_stream(_io__raw__m_tag_data_element)
                    _pos2 = self._io.pos()
                    self._io.seek(self._io.pos() + (self.size_of_data_element))
                    def handler(parent, _io__raw__m_tag_data_element=_io__raw__m_tag_data_element):
                        self._raw__m_tag_data_element = _io__raw__m_tag_data_element.to_byte_array()
                        if len(self._raw__m_tag_data_element) != self.size_of_data_element:
                            raise kaitaistruct.ConsistencyError(u"raw(tag_data_element)", self.size_of_data_element, len(self._raw__m_tag_data_element))
                        parent.write_bytes(self._raw__m_tag_data_element)
                    _io__raw__m_tag_data_element.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                    self._m_tag_data_element._write__seq(_io__raw__m_tag_data_element)
                elif _on == Icc4.TagTable.TagDefinition.TagSignatures.saturation_rendering_intent_gamut:
                    pass
                    _io__raw__m_tag_data_element = KaitaiStream(BytesIO(bytearray(self.size_of_data_element)))
                    self._io.add_child_stream(_io__raw__m_tag_data_element)
                    _pos2 = self._io.pos()
                    self._io.seek(self._io.pos() + (self.size_of_data_element))
                    def handler(parent, _io__raw__m_tag_data_element=_io__raw__m_tag_data_element):
                        self._raw__m_tag_data_element = _io__raw__m_tag_data_element.to_byte_array()
                        if len(self._raw__m_tag_data_element) != self.size_of_data_element:
                            raise kaitaistruct.ConsistencyError(u"raw(tag_data_element)", self.size_of_data_element, len(self._raw__m_tag_data_element))
                        parent.write_bytes(self._raw__m_tag_data_element)
                    _io__raw__m_tag_data_element.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                    self._m_tag_data_element._write__seq(_io__raw__m_tag_data_element)
                elif _on == Icc4.TagTable.TagDefinition.TagSignatures.technology:
                    pass
                    _io__raw__m_tag_data_element = KaitaiStream(BytesIO(bytearray(self.size_of_data_element)))
                    self._io.add_child_stream(_io__raw__m_tag_data_element)
                    _pos2 = self._io.pos()
                    self._io.seek(self._io.pos() + (self.size_of_data_element))
                    def handler(parent, _io__raw__m_tag_data_element=_io__raw__m_tag_data_element):
                        self._raw__m_tag_data_element = _io__raw__m_tag_data_element.to_byte_array()
                        if len(self._raw__m_tag_data_element) != self.size_of_data_element:
                            raise kaitaistruct.ConsistencyError(u"raw(tag_data_element)", self.size_of_data_element, len(self._raw__m_tag_data_element))
                        parent.write_bytes(self._raw__m_tag_data_element)
                    _io__raw__m_tag_data_element.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                    self._m_tag_data_element._write__seq(_io__raw__m_tag_data_element)
                elif _on == Icc4.TagTable.TagDefinition.TagSignatures.viewing_cond_desc:
                    pass
                    _io__raw__m_tag_data_element = KaitaiStream(BytesIO(bytearray(self.size_of_data_element)))
                    self._io.add_child_stream(_io__raw__m_tag_data_element)
                    _pos2 = self._io.pos()
                    self._io.seek(self._io.pos() + (self.size_of_data_element))
                    def handler(parent, _io__raw__m_tag_data_element=_io__raw__m_tag_data_element):
                        self._raw__m_tag_data_element = _io__raw__m_tag_data_element.to_byte_array()
                        if len(self._raw__m_tag_data_element) != self.size_of_data_element:
                            raise kaitaistruct.ConsistencyError(u"raw(tag_data_element)", self.size_of_data_element, len(self._raw__m_tag_data_element))
                        parent.write_bytes(self._raw__m_tag_data_element)
                    _io__raw__m_tag_data_element.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                    self._m_tag_data_element._write__seq(_io__raw__m_tag_data_element)
                elif _on == Icc4.TagTable.TagDefinition.TagSignatures.viewing_conditions:
                    pass
                    _io__raw__m_tag_data_element = KaitaiStream(BytesIO(bytearray(self.size_of_data_element)))
                    self._io.add_child_stream(_io__raw__m_tag_data_element)
                    _pos2 = self._io.pos()
                    self._io.seek(self._io.pos() + (self.size_of_data_element))
                    def handler(parent, _io__raw__m_tag_data_element=_io__raw__m_tag_data_element):
                        self._raw__m_tag_data_element = _io__raw__m_tag_data_element.to_byte_array()
                        if len(self._raw__m_tag_data_element) != self.size_of_data_element:
                            raise kaitaistruct.ConsistencyError(u"raw(tag_data_element)", self.size_of_data_element, len(self._raw__m_tag_data_element))
                        parent.write_bytes(self._raw__m_tag_data_element)
                    _io__raw__m_tag_data_element.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                    self._m_tag_data_element._write__seq(_io__raw__m_tag_data_element)
                else:
                    pass
                    self._io.write_bytes(self._m_tag_data_element)
                self._io.seek(_pos)



    class U16Fixed16Number(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Icc4.U16Fixed16Number, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.number = self._io.read_bytes(4)
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(Icc4.U16Fixed16Number, self)._write__seq(io)
            self._io.write_bytes(self.number)


        def _check(self):
            if len(self.number) != 4:
                raise kaitaistruct.ConsistencyError(u"number", 4, len(self.number))
            self._dirty = False


    class U1Fixed15Number(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Icc4.U1Fixed15Number, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.number = self._io.read_bytes(2)
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(Icc4.U1Fixed15Number, self)._write__seq(io)
            self._io.write_bytes(self.number)


        def _check(self):
            if len(self.number) != 2:
                raise kaitaistruct.ConsistencyError(u"number", 2, len(self.number))
            self._dirty = False


    class U8Fixed8Number(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Icc4.U8Fixed8Number, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.number = self._io.read_bytes(2)
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(Icc4.U8Fixed8Number, self)._write__seq(io)
            self._io.write_bytes(self.number)


        def _check(self):
            if len(self.number) != 2:
                raise kaitaistruct.ConsistencyError(u"number", 2, len(self.number))
            self._dirty = False


    class XyzNumber(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Icc4.XyzNumber, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.x = self._io.read_bytes(4)
            self.y = self._io.read_bytes(4)
            self.z = self._io.read_bytes(4)
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(Icc4.XyzNumber, self)._write__seq(io)
            self._io.write_bytes(self.x)
            self._io.write_bytes(self.y)
            self._io.write_bytes(self.z)


        def _check(self):
            if len(self.x) != 4:
                raise kaitaistruct.ConsistencyError(u"x", 4, len(self.x))
            if len(self.y) != 4:
                raise kaitaistruct.ConsistencyError(u"y", 4, len(self.y))
            if len(self.z) != 4:
                raise kaitaistruct.ConsistencyError(u"z", 4, len(self.z))
            self._dirty = False



