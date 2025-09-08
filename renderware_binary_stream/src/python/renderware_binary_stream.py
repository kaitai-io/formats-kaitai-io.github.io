# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import KaitaiStruct, KaitaiStream, BytesIO
from enum import IntEnum


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class RenderwareBinaryStream(KaitaiStruct):
    """
    .. seealso::
       Source - https://gtamods.com/wiki/RenderWare_binary_stream_file
    """

    class Sections(IntEnum):
        struct = 1
        string = 2
        extension = 3
        camera = 5
        texture = 6
        material = 7
        material_list = 8
        atomic_section = 9
        plane_section = 10
        world = 11
        spline = 12
        matrix = 13
        frame_list = 14
        geometry = 15
        clump = 16
        light = 18
        unicode_string = 19
        atomic = 20
        texture_native = 21
        texture_dictionary = 22
        animation_database = 23
        image = 24
        skin_animation = 25
        geometry_list = 26
        anim_animation = 27
        team = 28
        crowd = 29
        delta_morph_animation = 30
        right_to_render = 31
        multitexture_effect_native = 32
        multitexture_effect_dictionary = 33
        team_dictionary = 34
        platform_independent_texture_dictionary = 35
        table_of_contents = 36
        particle_standard_global_data = 37
        altpipe = 38
        platform_independent_peds = 39
        patch_mesh = 40
        chunk_group_start = 41
        chunk_group_end = 42
        uv_animation_dictionary = 43
        coll_tree = 44
        metrics_plg = 257
        spline_plg = 258
        stereo_plg = 259
        vrml_plg = 260
        morph_plg = 261
        pvs_plg = 262
        memory_leak_plg = 263
        animation_plg = 264
        gloss_plg = 265
        logo_plg = 266
        memory_info_plg = 267
        random_plg = 268
        png_image_plg = 269
        bone_plg = 270
        vrml_anim_plg = 271
        sky_mipmap_val = 272
        mrm_plg = 273
        lod_atomic_plg = 274
        me_plg = 275
        lightmap_plg = 276
        refine_plg = 277
        skin_plg = 278
        label_plg = 279
        particles_plg = 280
        geomtx_plg = 281
        synth_core_plg = 282
        stqpp_plg = 283
        part_pp_plg = 284
        collision_plg = 285
        hanim_plg = 286
        user_data_plg = 287
        material_effects_plg = 288
        particle_system_plg = 289
        delta_morph_plg = 290
        patch_plg = 291
        team_plg = 292
        crowd_pp_plg = 293
        mip_split_plg = 294
        anisotropy_plg = 295
        gcn_material_plg = 297
        geometric_pvs_plg = 298
        xbox_material_plg = 299
        multi_texture_plg = 300
        chain_plg = 301
        toon_plg = 302
        ptank_plg = 303
        particle_standard_plg = 304
        pds_plg = 305
        prtadv_plg = 306
        normal_map_plg = 307
        adc_plg = 308
        uv_animation_plg = 309
        character_set_plg = 384
        nohs_world_plg = 385
        import_util_plg = 386
        slerp_plg = 387
        optim_plg = 388
        tl_world_plg = 389
        database_plg = 390
        raytrace_plg = 391
        ray_plg = 392
        library_plg = 393
        plg_2d = 400
        tile_render_plg = 401
        jpeg_image_plg = 402
        tga_image_plg = 403
        gif_image_plg = 404
        quat_plg = 405
        spline_pvs_plg = 406
        mipmap_plg = 407
        mipmapk_plg = 408
        font_2d = 409
        intersection_plg = 410
        tiff_image_plg = 411
        pick_plg = 412
        bmp_image_plg = 413
        ras_image_plg = 414
        skin_fx_plg = 415
        vcat_plg = 416
        path_2d = 417
        brush_2d = 418
        object_2d = 419
        shape_2d = 420
        scene_2d = 421
        pick_region_2d = 422
        object_string_2d = 423
        animation_plg_2d = 424
        animation_2d = 425
        keyframe_2d = 432
        maestro_2d = 433
        barycentric = 434
        platform_independent_texture_dictionary_tk = 435
        toc_tk = 436
        tpl_tk = 437
        altpipe_tk = 438
        animation_tk = 439
        skin_split_tookit = 440
        compressed_key_tk = 441
        geometry_conditioning_plg = 442
        wing_plg = 443
        generic_pipeline_tk = 444
        lightmap_conversion_tk = 445
        filesystem_plg = 446
        dictionary_tk = 447
        uv_animation_linear = 448
        uv_animation_parameter = 449
        bin_mesh_plg = 1294
        native_data_plg = 1296
        zmodeler_lock = 61982
        atomic_visibility_distance = 39055872
        clump_visibility_distance = 39055873
        frame_visibility_distance = 39055874
        pipeline_set = 39056115
        unused_5 = 39056116
        texdictionary_link = 39056117
        specular_material = 39056118
        unused_8 = 39056119
        effect_2d = 39056120
        extra_vert_colour = 39056121
        collision_model = 39056122
        gta_hanim = 39056123
        reflection_material = 39056124
        breakable = 39056125
        frame = 39056126
        unused_16 = 39056127
    def __init__(self, _io, _parent=None, _root=None):
        super(RenderwareBinaryStream, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self
        self._read()

    def _read(self):
        self.code = KaitaiStream.resolve_enum(RenderwareBinaryStream.Sections, self._io.read_u4le())
        self.size = self._io.read_u4le()
        self.library_id_stamp = self._io.read_u4le()
        _on = self.code
        if _on == RenderwareBinaryStream.Sections.atomic:
            pass
            self._raw_body = self._io.read_bytes(self.size)
            _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
            self.body = RenderwareBinaryStream.ListWithHeader(_io__raw_body, self, self._root)
        elif _on == RenderwareBinaryStream.Sections.clump:
            pass
            self._raw_body = self._io.read_bytes(self.size)
            _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
            self.body = RenderwareBinaryStream.ListWithHeader(_io__raw_body, self, self._root)
        elif _on == RenderwareBinaryStream.Sections.frame_list:
            pass
            self._raw_body = self._io.read_bytes(self.size)
            _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
            self.body = RenderwareBinaryStream.ListWithHeader(_io__raw_body, self, self._root)
        elif _on == RenderwareBinaryStream.Sections.geometry:
            pass
            self._raw_body = self._io.read_bytes(self.size)
            _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
            self.body = RenderwareBinaryStream.ListWithHeader(_io__raw_body, self, self._root)
        elif _on == RenderwareBinaryStream.Sections.geometry_list:
            pass
            self._raw_body = self._io.read_bytes(self.size)
            _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
            self.body = RenderwareBinaryStream.ListWithHeader(_io__raw_body, self, self._root)
        elif _on == RenderwareBinaryStream.Sections.texture_dictionary:
            pass
            self._raw_body = self._io.read_bytes(self.size)
            _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
            self.body = RenderwareBinaryStream.ListWithHeader(_io__raw_body, self, self._root)
        elif _on == RenderwareBinaryStream.Sections.texture_native:
            pass
            self._raw_body = self._io.read_bytes(self.size)
            _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
            self.body = RenderwareBinaryStream.ListWithHeader(_io__raw_body, self, self._root)
        else:
            pass
            self.body = self._io.read_bytes(self.size)


    def _fetch_instances(self):
        pass
        _on = self.code
        if _on == RenderwareBinaryStream.Sections.atomic:
            pass
            self.body._fetch_instances()
        elif _on == RenderwareBinaryStream.Sections.clump:
            pass
            self.body._fetch_instances()
        elif _on == RenderwareBinaryStream.Sections.frame_list:
            pass
            self.body._fetch_instances()
        elif _on == RenderwareBinaryStream.Sections.geometry:
            pass
            self.body._fetch_instances()
        elif _on == RenderwareBinaryStream.Sections.geometry_list:
            pass
            self.body._fetch_instances()
        elif _on == RenderwareBinaryStream.Sections.texture_dictionary:
            pass
            self.body._fetch_instances()
        elif _on == RenderwareBinaryStream.Sections.texture_native:
            pass
            self.body._fetch_instances()
        else:
            pass

    class Frame(KaitaiStruct):
        """
        .. seealso::
           Source - https://gtamods.com/wiki/Frame_List_(RW_Section)#Structure
        """
        def __init__(self, _io, _parent=None, _root=None):
            super(RenderwareBinaryStream.Frame, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.rotation_matrix = RenderwareBinaryStream.Matrix(self._io, self, self._root)
            self.position = RenderwareBinaryStream.Vector3d(self._io, self, self._root)
            self.cur_frame_idx = self._io.read_s4le()
            self.matrix_creation_flags = self._io.read_u4le()


        def _fetch_instances(self):
            pass
            self.rotation_matrix._fetch_instances()
            self.position._fetch_instances()


    class GeometryNonNative(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(RenderwareBinaryStream.GeometryNonNative, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            if self._parent.is_prelit:
                pass
                self.prelit_colors = []
                for i in range(self._parent.num_vertices):
                    self.prelit_colors.append(RenderwareBinaryStream.Rgba(self._io, self, self._root))


            self.uv_layers = []
            for i in range(self._parent.num_uv_layers):
                self.uv_layers.append(RenderwareBinaryStream.UvLayer(self._parent.num_vertices, self._io, self, self._root))

            self.triangles = []
            for i in range(self._parent.num_triangles):
                self.triangles.append(RenderwareBinaryStream.Triangle(self._io, self, self._root))



        def _fetch_instances(self):
            pass
            if self._parent.is_prelit:
                pass
                for i in range(len(self.prelit_colors)):
                    pass
                    self.prelit_colors[i]._fetch_instances()


            for i in range(len(self.uv_layers)):
                pass
                self.uv_layers[i]._fetch_instances()

            for i in range(len(self.triangles)):
                pass
                self.triangles[i]._fetch_instances()



    class ListWithHeader(KaitaiStruct):
        """Typical structure used by many data types in RenderWare binary
        stream. Substream contains a list of binary stream entries,
        first entry always has type "struct" and carries some specific
        binary data it in, determined by the type of parent. All other
        entries, beside the first one, are normal, self-describing
        records.
        """
        def __init__(self, _io, _parent=None, _root=None):
            super(RenderwareBinaryStream.ListWithHeader, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.code = self._io.read_bytes(4)
            if not self.code == b"\x01\x00\x00\x00":
                raise kaitaistruct.ValidationNotEqualError(b"\x01\x00\x00\x00", self.code, self._io, u"/types/list_with_header/seq/0")
            self.header_size = self._io.read_u4le()
            self.library_id_stamp = self._io.read_u4le()
            _on = self._parent.code
            if _on == RenderwareBinaryStream.Sections.atomic:
                pass
                self._raw_header = self._io.read_bytes(self.header_size)
                _io__raw_header = KaitaiStream(BytesIO(self._raw_header))
                self.header = RenderwareBinaryStream.StructAtomic(_io__raw_header, self, self._root)
            elif _on == RenderwareBinaryStream.Sections.clump:
                pass
                self._raw_header = self._io.read_bytes(self.header_size)
                _io__raw_header = KaitaiStream(BytesIO(self._raw_header))
                self.header = RenderwareBinaryStream.StructClump(_io__raw_header, self, self._root)
            elif _on == RenderwareBinaryStream.Sections.frame_list:
                pass
                self._raw_header = self._io.read_bytes(self.header_size)
                _io__raw_header = KaitaiStream(BytesIO(self._raw_header))
                self.header = RenderwareBinaryStream.StructFrameList(_io__raw_header, self, self._root)
            elif _on == RenderwareBinaryStream.Sections.geometry:
                pass
                self._raw_header = self._io.read_bytes(self.header_size)
                _io__raw_header = KaitaiStream(BytesIO(self._raw_header))
                self.header = RenderwareBinaryStream.StructGeometry(_io__raw_header, self, self._root)
            elif _on == RenderwareBinaryStream.Sections.geometry_list:
                pass
                self._raw_header = self._io.read_bytes(self.header_size)
                _io__raw_header = KaitaiStream(BytesIO(self._raw_header))
                self.header = RenderwareBinaryStream.StructGeometryList(_io__raw_header, self, self._root)
            elif _on == RenderwareBinaryStream.Sections.texture_dictionary:
                pass
                self._raw_header = self._io.read_bytes(self.header_size)
                _io__raw_header = KaitaiStream(BytesIO(self._raw_header))
                self.header = RenderwareBinaryStream.StructTextureDictionary(_io__raw_header, self, self._root)
            else:
                pass
                self.header = self._io.read_bytes(self.header_size)
            self.entries = []
            i = 0
            while not self._io.is_eof():
                self.entries.append(RenderwareBinaryStream(self._io, self, self._root))
                i += 1



        def _fetch_instances(self):
            pass
            _on = self._parent.code
            if _on == RenderwareBinaryStream.Sections.atomic:
                pass
                self.header._fetch_instances()
            elif _on == RenderwareBinaryStream.Sections.clump:
                pass
                self.header._fetch_instances()
            elif _on == RenderwareBinaryStream.Sections.frame_list:
                pass
                self.header._fetch_instances()
            elif _on == RenderwareBinaryStream.Sections.geometry:
                pass
                self.header._fetch_instances()
            elif _on == RenderwareBinaryStream.Sections.geometry_list:
                pass
                self.header._fetch_instances()
            elif _on == RenderwareBinaryStream.Sections.texture_dictionary:
                pass
                self.header._fetch_instances()
            else:
                pass
            for i in range(len(self.entries)):
                pass
                self.entries[i]._fetch_instances()


        @property
        def version(self):
            if hasattr(self, '_m_version'):
                return self._m_version

            self._m_version = ((self.library_id_stamp >> 14 & 261888) + 196608 | self.library_id_stamp >> 16 & 63 if self.library_id_stamp & 4294901760 != 0 else self.library_id_stamp << 8)
            return getattr(self, '_m_version', None)


    class Matrix(KaitaiStruct):
        """
        .. seealso::
           Source - https://gtamods.com/wiki/Frame_List_(RW_Section)#Structure
        """
        def __init__(self, _io, _parent=None, _root=None):
            super(RenderwareBinaryStream.Matrix, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.entries = []
            for i in range(3):
                self.entries.append(RenderwareBinaryStream.Vector3d(self._io, self, self._root))



        def _fetch_instances(self):
            pass
            for i in range(len(self.entries)):
                pass
                self.entries[i]._fetch_instances()



    class MorphTarget(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(RenderwareBinaryStream.MorphTarget, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.bounding_sphere = RenderwareBinaryStream.Sphere(self._io, self, self._root)
            self.has_vertices = self._io.read_u4le()
            self.has_normals = self._io.read_u4le()
            if self.has_vertices != 0:
                pass
                self.vertices = []
                for i in range(self._parent.num_vertices):
                    self.vertices.append(RenderwareBinaryStream.Vector3d(self._io, self, self._root))


            if self.has_normals != 0:
                pass
                self.normals = []
                for i in range(self._parent.num_vertices):
                    self.normals.append(RenderwareBinaryStream.Vector3d(self._io, self, self._root))




        def _fetch_instances(self):
            pass
            self.bounding_sphere._fetch_instances()
            if self.has_vertices != 0:
                pass
                for i in range(len(self.vertices)):
                    pass
                    self.vertices[i]._fetch_instances()


            if self.has_normals != 0:
                pass
                for i in range(len(self.normals)):
                    pass
                    self.normals[i]._fetch_instances()




    class Rgba(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(RenderwareBinaryStream.Rgba, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.r = self._io.read_u1()
            self.g = self._io.read_u1()
            self.b = self._io.read_u1()
            self.a = self._io.read_u1()


        def _fetch_instances(self):
            pass


    class Sphere(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(RenderwareBinaryStream.Sphere, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.x = self._io.read_f4le()
            self.y = self._io.read_f4le()
            self.z = self._io.read_f4le()
            self.radius = self._io.read_f4le()


        def _fetch_instances(self):
            pass


    class StructAtomic(KaitaiStruct):
        """
        .. seealso::
           Source - https://gtamods.com/wiki/Atomic_(RW_Section)#Structure
        """
        def __init__(self, _io, _parent=None, _root=None):
            super(RenderwareBinaryStream.StructAtomic, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.frame_index = self._io.read_u4le()
            self.geometry_index = self._io.read_u4le()
            self.flag_render = self._io.read_bits_int_le(1) != 0
            self._unnamed3 = self._io.read_bits_int_le(1) != 0
            self.flag_collision_test = self._io.read_bits_int_le(1) != 0
            self._unnamed5 = self._io.read_bits_int_le(29)
            self.unused = self._io.read_u4le()


        def _fetch_instances(self):
            pass


    class StructClump(KaitaiStruct):
        """
        .. seealso::
           Source - https://gtamods.com/wiki/RpClump
        """
        def __init__(self, _io, _parent=None, _root=None):
            super(RenderwareBinaryStream.StructClump, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.num_atomics = self._io.read_u4le()
            if self._parent.version >= 208896:
                pass
                self.num_lights = self._io.read_u4le()

            if self._parent.version >= 208896:
                pass
                self.num_cameras = self._io.read_u4le()



        def _fetch_instances(self):
            pass
            if self._parent.version >= 208896:
                pass

            if self._parent.version >= 208896:
                pass



    class StructFrameList(KaitaiStruct):
        """
        .. seealso::
           Source - https://gtamods.com/wiki/Frame_List_(RW_Section)#Structure
        """
        def __init__(self, _io, _parent=None, _root=None):
            super(RenderwareBinaryStream.StructFrameList, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.num_frames = self._io.read_u4le()
            self.frames = []
            for i in range(self.num_frames):
                self.frames.append(RenderwareBinaryStream.Frame(self._io, self, self._root))



        def _fetch_instances(self):
            pass
            for i in range(len(self.frames)):
                pass
                self.frames[i]._fetch_instances()



    class StructGeometry(KaitaiStruct):
        """
        .. seealso::
           Source - https://gtamods.com/wiki/RpGeometry
        """
        def __init__(self, _io, _parent=None, _root=None):
            super(RenderwareBinaryStream.StructGeometry, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.format = self._io.read_u4le()
            self.num_triangles = self._io.read_u4le()
            self.num_vertices = self._io.read_u4le()
            self.num_morph_targets = self._io.read_u4le()
            if self._parent.version < 212992:
                pass
                self.surf_prop = RenderwareBinaryStream.SurfaceProperties(self._io, self, self._root)

            if (not (self.is_native)):
                pass
                self.geometry = RenderwareBinaryStream.GeometryNonNative(self._io, self, self._root)

            self.morph_targets = []
            for i in range(self.num_morph_targets):
                self.morph_targets.append(RenderwareBinaryStream.MorphTarget(self._io, self, self._root))



        def _fetch_instances(self):
            pass
            if self._parent.version < 212992:
                pass
                self.surf_prop._fetch_instances()

            if (not (self.is_native)):
                pass
                self.geometry._fetch_instances()

            for i in range(len(self.morph_targets)):
                pass
                self.morph_targets[i]._fetch_instances()


        @property
        def is_native(self):
            if hasattr(self, '_m_is_native'):
                return self._m_is_native

            self._m_is_native = self.format & 16777216 != 0
            return getattr(self, '_m_is_native', None)

        @property
        def is_prelit(self):
            if hasattr(self, '_m_is_prelit'):
                return self._m_is_prelit

            self._m_is_prelit = self.format & 8 != 0
            return getattr(self, '_m_is_prelit', None)

        @property
        def is_textured(self):
            if hasattr(self, '_m_is_textured'):
                return self._m_is_textured

            self._m_is_textured = self.format & 4 != 0
            return getattr(self, '_m_is_textured', None)

        @property
        def is_textured2(self):
            if hasattr(self, '_m_is_textured2'):
                return self._m_is_textured2

            self._m_is_textured2 = self.format & 128 != 0
            return getattr(self, '_m_is_textured2', None)

        @property
        def num_uv_layers(self):
            if hasattr(self, '_m_num_uv_layers'):
                return self._m_num_uv_layers

            self._m_num_uv_layers = ((2 if self.is_textured2 else (1 if self.is_textured else 0)) if self.num_uv_layers_raw == 0 else self.num_uv_layers_raw)
            return getattr(self, '_m_num_uv_layers', None)

        @property
        def num_uv_layers_raw(self):
            if hasattr(self, '_m_num_uv_layers_raw'):
                return self._m_num_uv_layers_raw

            self._m_num_uv_layers_raw = (self.format & 16711680) >> 16
            return getattr(self, '_m_num_uv_layers_raw', None)


    class StructGeometryList(KaitaiStruct):
        """
        .. seealso::
           Source - https://gtamods.com/wiki/Geometry_List_(RW_Section)#Structure
        """
        def __init__(self, _io, _parent=None, _root=None):
            super(RenderwareBinaryStream.StructGeometryList, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.num_geometries = self._io.read_u4le()


        def _fetch_instances(self):
            pass


    class StructTextureDictionary(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(RenderwareBinaryStream.StructTextureDictionary, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.num_textures = self._io.read_u4le()


        def _fetch_instances(self):
            pass


    class SurfaceProperties(KaitaiStruct):
        """
        .. seealso::
           Source - https://gtamods.com/wiki/RpGeometry
        """
        def __init__(self, _io, _parent=None, _root=None):
            super(RenderwareBinaryStream.SurfaceProperties, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.ambient = self._io.read_f4le()
            self.specular = self._io.read_f4le()
            self.diffuse = self._io.read_f4le()


        def _fetch_instances(self):
            pass


    class TexCoord(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(RenderwareBinaryStream.TexCoord, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.u = self._io.read_f4le()
            self.v = self._io.read_f4le()


        def _fetch_instances(self):
            pass


    class Triangle(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(RenderwareBinaryStream.Triangle, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.vertex2 = self._io.read_u2le()
            self.vertex1 = self._io.read_u2le()
            self.material_id = self._io.read_u2le()
            self.vertex3 = self._io.read_u2le()


        def _fetch_instances(self):
            pass


    class UvLayer(KaitaiStruct):
        def __init__(self, num_vertices, _io, _parent=None, _root=None):
            super(RenderwareBinaryStream.UvLayer, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self.num_vertices = num_vertices
            self._read()

        def _read(self):
            self.tex_coords = []
            for i in range(self.num_vertices):
                self.tex_coords.append(RenderwareBinaryStream.TexCoord(self._io, self, self._root))



        def _fetch_instances(self):
            pass
            for i in range(len(self.tex_coords)):
                pass
                self.tex_coords[i]._fetch_instances()



    class Vector3d(KaitaiStruct):
        """
        .. seealso::
           Source - https://gtamods.com/wiki/Frame_List_(RW_Section)#Structure
        """
        def __init__(self, _io, _parent=None, _root=None):
            super(RenderwareBinaryStream.Vector3d, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.x = self._io.read_f4le()
            self.y = self._io.read_f4le()
            self.z = self._io.read_f4le()


        def _fetch_instances(self):
            pass


    @property
    def version(self):
        if hasattr(self, '_m_version'):
            return self._m_version

        self._m_version = ((self.library_id_stamp >> 14 & 261888) + 196608 | self.library_id_stamp >> 16 & 63 if self.library_id_stamp & 4294901760 != 0 else self.library_id_stamp << 8)
        return getattr(self, '_m_version', None)


