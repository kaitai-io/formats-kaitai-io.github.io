# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import ReadWriteKaitaiStruct, KaitaiStream, BytesIO
from enum import IntEnum


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class RenderwareBinaryStream(ReadWriteKaitaiStruct):
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
    def __init__(self, _io=None, _parent=None, _root=None):
        super(RenderwareBinaryStream, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self

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
            self.body._read()
        elif _on == RenderwareBinaryStream.Sections.clump:
            pass
            self._raw_body = self._io.read_bytes(self.size)
            _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
            self.body = RenderwareBinaryStream.ListWithHeader(_io__raw_body, self, self._root)
            self.body._read()
        elif _on == RenderwareBinaryStream.Sections.frame_list:
            pass
            self._raw_body = self._io.read_bytes(self.size)
            _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
            self.body = RenderwareBinaryStream.ListWithHeader(_io__raw_body, self, self._root)
            self.body._read()
        elif _on == RenderwareBinaryStream.Sections.geometry:
            pass
            self._raw_body = self._io.read_bytes(self.size)
            _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
            self.body = RenderwareBinaryStream.ListWithHeader(_io__raw_body, self, self._root)
            self.body._read()
        elif _on == RenderwareBinaryStream.Sections.geometry_list:
            pass
            self._raw_body = self._io.read_bytes(self.size)
            _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
            self.body = RenderwareBinaryStream.ListWithHeader(_io__raw_body, self, self._root)
            self.body._read()
        elif _on == RenderwareBinaryStream.Sections.texture_dictionary:
            pass
            self._raw_body = self._io.read_bytes(self.size)
            _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
            self.body = RenderwareBinaryStream.ListWithHeader(_io__raw_body, self, self._root)
            self.body._read()
        elif _on == RenderwareBinaryStream.Sections.texture_native:
            pass
            self._raw_body = self._io.read_bytes(self.size)
            _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
            self.body = RenderwareBinaryStream.ListWithHeader(_io__raw_body, self, self._root)
            self.body._read()
        else:
            pass
            self.body = self._io.read_bytes(self.size)
        self._dirty = False


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


    def _write__seq(self, io=None):
        super(RenderwareBinaryStream, self)._write__seq(io)
        self._io.write_u4le(int(self.code))
        self._io.write_u4le(self.size)
        self._io.write_u4le(self.library_id_stamp)
        _on = self.code
        if _on == RenderwareBinaryStream.Sections.atomic:
            pass
            _io__raw_body = KaitaiStream(BytesIO(bytearray(self.size)))
            self._io.add_child_stream(_io__raw_body)
            _pos2 = self._io.pos()
            self._io.seek(self._io.pos() + (self.size))
            def handler(parent, _io__raw_body=_io__raw_body):
                self._raw_body = _io__raw_body.to_byte_array()
                if len(self._raw_body) != self.size:
                    raise kaitaistruct.ConsistencyError(u"raw(body)", self.size, len(self._raw_body))
                parent.write_bytes(self._raw_body)
            _io__raw_body.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
            self.body._write__seq(_io__raw_body)
        elif _on == RenderwareBinaryStream.Sections.clump:
            pass
            _io__raw_body = KaitaiStream(BytesIO(bytearray(self.size)))
            self._io.add_child_stream(_io__raw_body)
            _pos2 = self._io.pos()
            self._io.seek(self._io.pos() + (self.size))
            def handler(parent, _io__raw_body=_io__raw_body):
                self._raw_body = _io__raw_body.to_byte_array()
                if len(self._raw_body) != self.size:
                    raise kaitaistruct.ConsistencyError(u"raw(body)", self.size, len(self._raw_body))
                parent.write_bytes(self._raw_body)
            _io__raw_body.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
            self.body._write__seq(_io__raw_body)
        elif _on == RenderwareBinaryStream.Sections.frame_list:
            pass
            _io__raw_body = KaitaiStream(BytesIO(bytearray(self.size)))
            self._io.add_child_stream(_io__raw_body)
            _pos2 = self._io.pos()
            self._io.seek(self._io.pos() + (self.size))
            def handler(parent, _io__raw_body=_io__raw_body):
                self._raw_body = _io__raw_body.to_byte_array()
                if len(self._raw_body) != self.size:
                    raise kaitaistruct.ConsistencyError(u"raw(body)", self.size, len(self._raw_body))
                parent.write_bytes(self._raw_body)
            _io__raw_body.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
            self.body._write__seq(_io__raw_body)
        elif _on == RenderwareBinaryStream.Sections.geometry:
            pass
            _io__raw_body = KaitaiStream(BytesIO(bytearray(self.size)))
            self._io.add_child_stream(_io__raw_body)
            _pos2 = self._io.pos()
            self._io.seek(self._io.pos() + (self.size))
            def handler(parent, _io__raw_body=_io__raw_body):
                self._raw_body = _io__raw_body.to_byte_array()
                if len(self._raw_body) != self.size:
                    raise kaitaistruct.ConsistencyError(u"raw(body)", self.size, len(self._raw_body))
                parent.write_bytes(self._raw_body)
            _io__raw_body.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
            self.body._write__seq(_io__raw_body)
        elif _on == RenderwareBinaryStream.Sections.geometry_list:
            pass
            _io__raw_body = KaitaiStream(BytesIO(bytearray(self.size)))
            self._io.add_child_stream(_io__raw_body)
            _pos2 = self._io.pos()
            self._io.seek(self._io.pos() + (self.size))
            def handler(parent, _io__raw_body=_io__raw_body):
                self._raw_body = _io__raw_body.to_byte_array()
                if len(self._raw_body) != self.size:
                    raise kaitaistruct.ConsistencyError(u"raw(body)", self.size, len(self._raw_body))
                parent.write_bytes(self._raw_body)
            _io__raw_body.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
            self.body._write__seq(_io__raw_body)
        elif _on == RenderwareBinaryStream.Sections.texture_dictionary:
            pass
            _io__raw_body = KaitaiStream(BytesIO(bytearray(self.size)))
            self._io.add_child_stream(_io__raw_body)
            _pos2 = self._io.pos()
            self._io.seek(self._io.pos() + (self.size))
            def handler(parent, _io__raw_body=_io__raw_body):
                self._raw_body = _io__raw_body.to_byte_array()
                if len(self._raw_body) != self.size:
                    raise kaitaistruct.ConsistencyError(u"raw(body)", self.size, len(self._raw_body))
                parent.write_bytes(self._raw_body)
            _io__raw_body.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
            self.body._write__seq(_io__raw_body)
        elif _on == RenderwareBinaryStream.Sections.texture_native:
            pass
            _io__raw_body = KaitaiStream(BytesIO(bytearray(self.size)))
            self._io.add_child_stream(_io__raw_body)
            _pos2 = self._io.pos()
            self._io.seek(self._io.pos() + (self.size))
            def handler(parent, _io__raw_body=_io__raw_body):
                self._raw_body = _io__raw_body.to_byte_array()
                if len(self._raw_body) != self.size:
                    raise kaitaistruct.ConsistencyError(u"raw(body)", self.size, len(self._raw_body))
                parent.write_bytes(self._raw_body)
            _io__raw_body.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
            self.body._write__seq(_io__raw_body)
        else:
            pass
            self._io.write_bytes(self.body)


    def _check(self):
        _on = self.code
        if _on == RenderwareBinaryStream.Sections.atomic:
            pass
            if self.body._root != self._root:
                raise kaitaistruct.ConsistencyError(u"body", self._root, self.body._root)
            if self.body._parent != self:
                raise kaitaistruct.ConsistencyError(u"body", self, self.body._parent)
        elif _on == RenderwareBinaryStream.Sections.clump:
            pass
            if self.body._root != self._root:
                raise kaitaistruct.ConsistencyError(u"body", self._root, self.body._root)
            if self.body._parent != self:
                raise kaitaistruct.ConsistencyError(u"body", self, self.body._parent)
        elif _on == RenderwareBinaryStream.Sections.frame_list:
            pass
            if self.body._root != self._root:
                raise kaitaistruct.ConsistencyError(u"body", self._root, self.body._root)
            if self.body._parent != self:
                raise kaitaistruct.ConsistencyError(u"body", self, self.body._parent)
        elif _on == RenderwareBinaryStream.Sections.geometry:
            pass
            if self.body._root != self._root:
                raise kaitaistruct.ConsistencyError(u"body", self._root, self.body._root)
            if self.body._parent != self:
                raise kaitaistruct.ConsistencyError(u"body", self, self.body._parent)
        elif _on == RenderwareBinaryStream.Sections.geometry_list:
            pass
            if self.body._root != self._root:
                raise kaitaistruct.ConsistencyError(u"body", self._root, self.body._root)
            if self.body._parent != self:
                raise kaitaistruct.ConsistencyError(u"body", self, self.body._parent)
        elif _on == RenderwareBinaryStream.Sections.texture_dictionary:
            pass
            if self.body._root != self._root:
                raise kaitaistruct.ConsistencyError(u"body", self._root, self.body._root)
            if self.body._parent != self:
                raise kaitaistruct.ConsistencyError(u"body", self, self.body._parent)
        elif _on == RenderwareBinaryStream.Sections.texture_native:
            pass
            if self.body._root != self._root:
                raise kaitaistruct.ConsistencyError(u"body", self._root, self.body._root)
            if self.body._parent != self:
                raise kaitaistruct.ConsistencyError(u"body", self, self.body._parent)
        else:
            pass
            if len(self.body) != self.size:
                raise kaitaistruct.ConsistencyError(u"body", self.size, len(self.body))
        self._dirty = False

    class Frame(ReadWriteKaitaiStruct):
        """
        .. seealso::
           Source - https://gtamods.com/wiki/Frame_List_(RW_Section)#Structure
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(RenderwareBinaryStream.Frame, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.rotation_matrix = RenderwareBinaryStream.Matrix(self._io, self, self._root)
            self.rotation_matrix._read()
            self.position = RenderwareBinaryStream.Vector3d(self._io, self, self._root)
            self.position._read()
            self.cur_frame_idx = self._io.read_s4le()
            self.matrix_creation_flags = self._io.read_u4le()
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.rotation_matrix._fetch_instances()
            self.position._fetch_instances()


        def _write__seq(self, io=None):
            super(RenderwareBinaryStream.Frame, self)._write__seq(io)
            self.rotation_matrix._write__seq(self._io)
            self.position._write__seq(self._io)
            self._io.write_s4le(self.cur_frame_idx)
            self._io.write_u4le(self.matrix_creation_flags)


        def _check(self):
            if self.rotation_matrix._root != self._root:
                raise kaitaistruct.ConsistencyError(u"rotation_matrix", self._root, self.rotation_matrix._root)
            if self.rotation_matrix._parent != self:
                raise kaitaistruct.ConsistencyError(u"rotation_matrix", self, self.rotation_matrix._parent)
            if self.position._root != self._root:
                raise kaitaistruct.ConsistencyError(u"position", self._root, self.position._root)
            if self.position._parent != self:
                raise kaitaistruct.ConsistencyError(u"position", self, self.position._parent)
            self._dirty = False


    class GeometryNonNative(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(RenderwareBinaryStream.GeometryNonNative, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            if self._parent.is_prelit:
                pass
                self.prelit_colors = []
                for i in range(self._parent.num_vertices):
                    _t_prelit_colors = RenderwareBinaryStream.Rgba(self._io, self, self._root)
                    try:
                        _t_prelit_colors._read()
                    finally:
                        self.prelit_colors.append(_t_prelit_colors)


            self.uv_layers = []
            for i in range(self._parent.num_uv_layers):
                _t_uv_layers = RenderwareBinaryStream.UvLayer(self._parent.num_vertices, self._io, self, self._root)
                try:
                    _t_uv_layers._read()
                finally:
                    self.uv_layers.append(_t_uv_layers)

            self.triangles = []
            for i in range(self._parent.num_triangles):
                _t_triangles = RenderwareBinaryStream.Triangle(self._io, self, self._root)
                try:
                    _t_triangles._read()
                finally:
                    self.triangles.append(_t_triangles)

            self._dirty = False


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



        def _write__seq(self, io=None):
            super(RenderwareBinaryStream.GeometryNonNative, self)._write__seq(io)
            if self._parent.is_prelit:
                pass
                for i in range(len(self.prelit_colors)):
                    pass
                    self.prelit_colors[i]._write__seq(self._io)


            for i in range(len(self.uv_layers)):
                pass
                self.uv_layers[i]._write__seq(self._io)

            for i in range(len(self.triangles)):
                pass
                self.triangles[i]._write__seq(self._io)



        def _check(self):
            if self._parent.is_prelit:
                pass
                if len(self.prelit_colors) != self._parent.num_vertices:
                    raise kaitaistruct.ConsistencyError(u"prelit_colors", self._parent.num_vertices, len(self.prelit_colors))
                for i in range(len(self.prelit_colors)):
                    pass
                    if self.prelit_colors[i]._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"prelit_colors", self._root, self.prelit_colors[i]._root)
                    if self.prelit_colors[i]._parent != self:
                        raise kaitaistruct.ConsistencyError(u"prelit_colors", self, self.prelit_colors[i]._parent)


            if len(self.uv_layers) != self._parent.num_uv_layers:
                raise kaitaistruct.ConsistencyError(u"uv_layers", self._parent.num_uv_layers, len(self.uv_layers))
            for i in range(len(self.uv_layers)):
                pass
                if self.uv_layers[i]._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"uv_layers", self._root, self.uv_layers[i]._root)
                if self.uv_layers[i]._parent != self:
                    raise kaitaistruct.ConsistencyError(u"uv_layers", self, self.uv_layers[i]._parent)
                if self.uv_layers[i].num_vertices != self._parent.num_vertices:
                    raise kaitaistruct.ConsistencyError(u"uv_layers", self._parent.num_vertices, self.uv_layers[i].num_vertices)

            if len(self.triangles) != self._parent.num_triangles:
                raise kaitaistruct.ConsistencyError(u"triangles", self._parent.num_triangles, len(self.triangles))
            for i in range(len(self.triangles)):
                pass
                if self.triangles[i]._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"triangles", self._root, self.triangles[i]._root)
                if self.triangles[i]._parent != self:
                    raise kaitaistruct.ConsistencyError(u"triangles", self, self.triangles[i]._parent)

            self._dirty = False


    class ListWithHeader(ReadWriteKaitaiStruct):
        """Typical structure used by many data types in RenderWare binary
        stream. Substream contains a list of binary stream entries,
        first entry always has type "struct" and carries some specific
        binary data it in, determined by the type of parent. All other
        entries, beside the first one, are normal, self-describing
        records.
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(RenderwareBinaryStream.ListWithHeader, self).__init__(_io)
            self._parent = _parent
            self._root = _root

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
                self.header._read()
            elif _on == RenderwareBinaryStream.Sections.clump:
                pass
                self._raw_header = self._io.read_bytes(self.header_size)
                _io__raw_header = KaitaiStream(BytesIO(self._raw_header))
                self.header = RenderwareBinaryStream.StructClump(_io__raw_header, self, self._root)
                self.header._read()
            elif _on == RenderwareBinaryStream.Sections.frame_list:
                pass
                self._raw_header = self._io.read_bytes(self.header_size)
                _io__raw_header = KaitaiStream(BytesIO(self._raw_header))
                self.header = RenderwareBinaryStream.StructFrameList(_io__raw_header, self, self._root)
                self.header._read()
            elif _on == RenderwareBinaryStream.Sections.geometry:
                pass
                self._raw_header = self._io.read_bytes(self.header_size)
                _io__raw_header = KaitaiStream(BytesIO(self._raw_header))
                self.header = RenderwareBinaryStream.StructGeometry(_io__raw_header, self, self._root)
                self.header._read()
            elif _on == RenderwareBinaryStream.Sections.geometry_list:
                pass
                self._raw_header = self._io.read_bytes(self.header_size)
                _io__raw_header = KaitaiStream(BytesIO(self._raw_header))
                self.header = RenderwareBinaryStream.StructGeometryList(_io__raw_header, self, self._root)
                self.header._read()
            elif _on == RenderwareBinaryStream.Sections.texture_dictionary:
                pass
                self._raw_header = self._io.read_bytes(self.header_size)
                _io__raw_header = KaitaiStream(BytesIO(self._raw_header))
                self.header = RenderwareBinaryStream.StructTextureDictionary(_io__raw_header, self, self._root)
                self.header._read()
            else:
                pass
                self.header = self._io.read_bytes(self.header_size)
            self.entries = []
            i = 0
            while not self._io.is_eof():
                _t_entries = RenderwareBinaryStream(self._io, self, self._root)
                try:
                    _t_entries._read()
                finally:
                    self.entries.append(_t_entries)
                i += 1

            self._dirty = False


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



        def _write__seq(self, io=None):
            super(RenderwareBinaryStream.ListWithHeader, self)._write__seq(io)
            self._io.write_bytes(self.code)
            self._io.write_u4le(self.header_size)
            self._io.write_u4le(self.library_id_stamp)
            _on = self._parent.code
            if _on == RenderwareBinaryStream.Sections.atomic:
                pass
                _io__raw_header = KaitaiStream(BytesIO(bytearray(self.header_size)))
                self._io.add_child_stream(_io__raw_header)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.header_size))
                def handler(parent, _io__raw_header=_io__raw_header):
                    self._raw_header = _io__raw_header.to_byte_array()
                    if len(self._raw_header) != self.header_size:
                        raise kaitaistruct.ConsistencyError(u"raw(header)", self.header_size, len(self._raw_header))
                    parent.write_bytes(self._raw_header)
                _io__raw_header.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.header._write__seq(_io__raw_header)
            elif _on == RenderwareBinaryStream.Sections.clump:
                pass
                _io__raw_header = KaitaiStream(BytesIO(bytearray(self.header_size)))
                self._io.add_child_stream(_io__raw_header)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.header_size))
                def handler(parent, _io__raw_header=_io__raw_header):
                    self._raw_header = _io__raw_header.to_byte_array()
                    if len(self._raw_header) != self.header_size:
                        raise kaitaistruct.ConsistencyError(u"raw(header)", self.header_size, len(self._raw_header))
                    parent.write_bytes(self._raw_header)
                _io__raw_header.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.header._write__seq(_io__raw_header)
            elif _on == RenderwareBinaryStream.Sections.frame_list:
                pass
                _io__raw_header = KaitaiStream(BytesIO(bytearray(self.header_size)))
                self._io.add_child_stream(_io__raw_header)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.header_size))
                def handler(parent, _io__raw_header=_io__raw_header):
                    self._raw_header = _io__raw_header.to_byte_array()
                    if len(self._raw_header) != self.header_size:
                        raise kaitaistruct.ConsistencyError(u"raw(header)", self.header_size, len(self._raw_header))
                    parent.write_bytes(self._raw_header)
                _io__raw_header.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.header._write__seq(_io__raw_header)
            elif _on == RenderwareBinaryStream.Sections.geometry:
                pass
                _io__raw_header = KaitaiStream(BytesIO(bytearray(self.header_size)))
                self._io.add_child_stream(_io__raw_header)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.header_size))
                def handler(parent, _io__raw_header=_io__raw_header):
                    self._raw_header = _io__raw_header.to_byte_array()
                    if len(self._raw_header) != self.header_size:
                        raise kaitaistruct.ConsistencyError(u"raw(header)", self.header_size, len(self._raw_header))
                    parent.write_bytes(self._raw_header)
                _io__raw_header.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.header._write__seq(_io__raw_header)
            elif _on == RenderwareBinaryStream.Sections.geometry_list:
                pass
                _io__raw_header = KaitaiStream(BytesIO(bytearray(self.header_size)))
                self._io.add_child_stream(_io__raw_header)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.header_size))
                def handler(parent, _io__raw_header=_io__raw_header):
                    self._raw_header = _io__raw_header.to_byte_array()
                    if len(self._raw_header) != self.header_size:
                        raise kaitaistruct.ConsistencyError(u"raw(header)", self.header_size, len(self._raw_header))
                    parent.write_bytes(self._raw_header)
                _io__raw_header.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.header._write__seq(_io__raw_header)
            elif _on == RenderwareBinaryStream.Sections.texture_dictionary:
                pass
                _io__raw_header = KaitaiStream(BytesIO(bytearray(self.header_size)))
                self._io.add_child_stream(_io__raw_header)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.header_size))
                def handler(parent, _io__raw_header=_io__raw_header):
                    self._raw_header = _io__raw_header.to_byte_array()
                    if len(self._raw_header) != self.header_size:
                        raise kaitaistruct.ConsistencyError(u"raw(header)", self.header_size, len(self._raw_header))
                    parent.write_bytes(self._raw_header)
                _io__raw_header.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.header._write__seq(_io__raw_header)
            else:
                pass
                self._io.write_bytes(self.header)
            for i in range(len(self.entries)):
                pass
                if self._io.is_eof():
                    raise kaitaistruct.ConsistencyError(u"entries", 0, self._io.size() - self._io.pos())
                self.entries[i]._write__seq(self._io)

            if not self._io.is_eof():
                raise kaitaistruct.ConsistencyError(u"entries", 0, self._io.size() - self._io.pos())


        def _check(self):
            if len(self.code) != 4:
                raise kaitaistruct.ConsistencyError(u"code", 4, len(self.code))
            if not self.code == b"\x01\x00\x00\x00":
                raise kaitaistruct.ValidationNotEqualError(b"\x01\x00\x00\x00", self.code, None, u"/types/list_with_header/seq/0")
            _on = self._parent.code
            if _on == RenderwareBinaryStream.Sections.atomic:
                pass
                if self.header._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"header", self._root, self.header._root)
                if self.header._parent != self:
                    raise kaitaistruct.ConsistencyError(u"header", self, self.header._parent)
            elif _on == RenderwareBinaryStream.Sections.clump:
                pass
                if self.header._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"header", self._root, self.header._root)
                if self.header._parent != self:
                    raise kaitaistruct.ConsistencyError(u"header", self, self.header._parent)
            elif _on == RenderwareBinaryStream.Sections.frame_list:
                pass
                if self.header._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"header", self._root, self.header._root)
                if self.header._parent != self:
                    raise kaitaistruct.ConsistencyError(u"header", self, self.header._parent)
            elif _on == RenderwareBinaryStream.Sections.geometry:
                pass
                if self.header._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"header", self._root, self.header._root)
                if self.header._parent != self:
                    raise kaitaistruct.ConsistencyError(u"header", self, self.header._parent)
            elif _on == RenderwareBinaryStream.Sections.geometry_list:
                pass
                if self.header._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"header", self._root, self.header._root)
                if self.header._parent != self:
                    raise kaitaistruct.ConsistencyError(u"header", self, self.header._parent)
            elif _on == RenderwareBinaryStream.Sections.texture_dictionary:
                pass
                if self.header._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"header", self._root, self.header._root)
                if self.header._parent != self:
                    raise kaitaistruct.ConsistencyError(u"header", self, self.header._parent)
            else:
                pass
                if len(self.header) != self.header_size:
                    raise kaitaistruct.ConsistencyError(u"header", self.header_size, len(self.header))
            for i in range(len(self.entries)):
                pass
                if self.entries[i]._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"entries", self._root, self.entries[i]._root)
                if self.entries[i]._parent != self:
                    raise kaitaistruct.ConsistencyError(u"entries", self, self.entries[i]._parent)

            self._dirty = False

        @property
        def version(self):
            if hasattr(self, '_m_version'):
                return self._m_version

            self._m_version = ((self.library_id_stamp >> 14 & 261888) + 196608 | self.library_id_stamp >> 16 & 63 if self.library_id_stamp & 4294901760 != 0 else self.library_id_stamp << 8)
            return getattr(self, '_m_version', None)

        def _invalidate_version(self):
            del self._m_version

    class Matrix(ReadWriteKaitaiStruct):
        """
        .. seealso::
           Source - https://gtamods.com/wiki/Frame_List_(RW_Section)#Structure
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(RenderwareBinaryStream.Matrix, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.entries = []
            for i in range(3):
                _t_entries = RenderwareBinaryStream.Vector3d(self._io, self, self._root)
                try:
                    _t_entries._read()
                finally:
                    self.entries.append(_t_entries)

            self._dirty = False


        def _fetch_instances(self):
            pass
            for i in range(len(self.entries)):
                pass
                self.entries[i]._fetch_instances()



        def _write__seq(self, io=None):
            super(RenderwareBinaryStream.Matrix, self)._write__seq(io)
            for i in range(len(self.entries)):
                pass
                self.entries[i]._write__seq(self._io)



        def _check(self):
            if len(self.entries) != 3:
                raise kaitaistruct.ConsistencyError(u"entries", 3, len(self.entries))
            for i in range(len(self.entries)):
                pass
                if self.entries[i]._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"entries", self._root, self.entries[i]._root)
                if self.entries[i]._parent != self:
                    raise kaitaistruct.ConsistencyError(u"entries", self, self.entries[i]._parent)

            self._dirty = False


    class MorphTarget(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(RenderwareBinaryStream.MorphTarget, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.bounding_sphere = RenderwareBinaryStream.Sphere(self._io, self, self._root)
            self.bounding_sphere._read()
            self.has_vertices = self._io.read_u4le()
            self.has_normals = self._io.read_u4le()
            if self.has_vertices != 0:
                pass
                self.vertices = []
                for i in range(self._parent.num_vertices):
                    _t_vertices = RenderwareBinaryStream.Vector3d(self._io, self, self._root)
                    try:
                        _t_vertices._read()
                    finally:
                        self.vertices.append(_t_vertices)


            if self.has_normals != 0:
                pass
                self.normals = []
                for i in range(self._parent.num_vertices):
                    _t_normals = RenderwareBinaryStream.Vector3d(self._io, self, self._root)
                    try:
                        _t_normals._read()
                    finally:
                        self.normals.append(_t_normals)


            self._dirty = False


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




        def _write__seq(self, io=None):
            super(RenderwareBinaryStream.MorphTarget, self)._write__seq(io)
            self.bounding_sphere._write__seq(self._io)
            self._io.write_u4le(self.has_vertices)
            self._io.write_u4le(self.has_normals)
            if self.has_vertices != 0:
                pass
                for i in range(len(self.vertices)):
                    pass
                    self.vertices[i]._write__seq(self._io)


            if self.has_normals != 0:
                pass
                for i in range(len(self.normals)):
                    pass
                    self.normals[i]._write__seq(self._io)




        def _check(self):
            if self.bounding_sphere._root != self._root:
                raise kaitaistruct.ConsistencyError(u"bounding_sphere", self._root, self.bounding_sphere._root)
            if self.bounding_sphere._parent != self:
                raise kaitaistruct.ConsistencyError(u"bounding_sphere", self, self.bounding_sphere._parent)
            if self.has_vertices != 0:
                pass
                if len(self.vertices) != self._parent.num_vertices:
                    raise kaitaistruct.ConsistencyError(u"vertices", self._parent.num_vertices, len(self.vertices))
                for i in range(len(self.vertices)):
                    pass
                    if self.vertices[i]._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"vertices", self._root, self.vertices[i]._root)
                    if self.vertices[i]._parent != self:
                        raise kaitaistruct.ConsistencyError(u"vertices", self, self.vertices[i]._parent)


            if self.has_normals != 0:
                pass
                if len(self.normals) != self._parent.num_vertices:
                    raise kaitaistruct.ConsistencyError(u"normals", self._parent.num_vertices, len(self.normals))
                for i in range(len(self.normals)):
                    pass
                    if self.normals[i]._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"normals", self._root, self.normals[i]._root)
                    if self.normals[i]._parent != self:
                        raise kaitaistruct.ConsistencyError(u"normals", self, self.normals[i]._parent)


            self._dirty = False


    class Rgba(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(RenderwareBinaryStream.Rgba, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.r = self._io.read_u1()
            self.g = self._io.read_u1()
            self.b = self._io.read_u1()
            self.a = self._io.read_u1()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(RenderwareBinaryStream.Rgba, self)._write__seq(io)
            self._io.write_u1(self.r)
            self._io.write_u1(self.g)
            self._io.write_u1(self.b)
            self._io.write_u1(self.a)


        def _check(self):
            self._dirty = False


    class Sphere(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(RenderwareBinaryStream.Sphere, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.x = self._io.read_f4le()
            self.y = self._io.read_f4le()
            self.z = self._io.read_f4le()
            self.radius = self._io.read_f4le()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(RenderwareBinaryStream.Sphere, self)._write__seq(io)
            self._io.write_f4le(self.x)
            self._io.write_f4le(self.y)
            self._io.write_f4le(self.z)
            self._io.write_f4le(self.radius)


        def _check(self):
            self._dirty = False


    class StructAtomic(ReadWriteKaitaiStruct):
        """
        .. seealso::
           Source - https://gtamods.com/wiki/Atomic_(RW_Section)#Structure
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(RenderwareBinaryStream.StructAtomic, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.frame_index = self._io.read_u4le()
            self.geometry_index = self._io.read_u4le()
            self.flag_render = self._io.read_bits_int_le(1) != 0
            self._unnamed3 = self._io.read_bits_int_le(1) != 0
            self.flag_collision_test = self._io.read_bits_int_le(1) != 0
            self._unnamed5 = self._io.read_bits_int_le(29)
            self.unused = self._io.read_u4le()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(RenderwareBinaryStream.StructAtomic, self)._write__seq(io)
            self._io.write_u4le(self.frame_index)
            self._io.write_u4le(self.geometry_index)
            self._io.write_bits_int_le(1, int(self.flag_render))
            self._io.write_bits_int_le(1, int(self._unnamed3))
            self._io.write_bits_int_le(1, int(self.flag_collision_test))
            self._io.write_bits_int_le(29, self._unnamed5)
            self._io.write_u4le(self.unused)


        def _check(self):
            self._dirty = False


    class StructClump(ReadWriteKaitaiStruct):
        """
        .. seealso::
           Source - https://gtamods.com/wiki/RpClump
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(RenderwareBinaryStream.StructClump, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.num_atomics = self._io.read_u4le()
            if self._parent.version >= 208896:
                pass
                self.num_lights = self._io.read_u4le()

            if self._parent.version >= 208896:
                pass
                self.num_cameras = self._io.read_u4le()

            self._dirty = False


        def _fetch_instances(self):
            pass
            if self._parent.version >= 208896:
                pass

            if self._parent.version >= 208896:
                pass



        def _write__seq(self, io=None):
            super(RenderwareBinaryStream.StructClump, self)._write__seq(io)
            self._io.write_u4le(self.num_atomics)
            if self._parent.version >= 208896:
                pass
                self._io.write_u4le(self.num_lights)

            if self._parent.version >= 208896:
                pass
                self._io.write_u4le(self.num_cameras)



        def _check(self):
            if self._parent.version >= 208896:
                pass

            if self._parent.version >= 208896:
                pass

            self._dirty = False


    class StructFrameList(ReadWriteKaitaiStruct):
        """
        .. seealso::
           Source - https://gtamods.com/wiki/Frame_List_(RW_Section)#Structure
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(RenderwareBinaryStream.StructFrameList, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.num_frames = self._io.read_u4le()
            self.frames = []
            for i in range(self.num_frames):
                _t_frames = RenderwareBinaryStream.Frame(self._io, self, self._root)
                try:
                    _t_frames._read()
                finally:
                    self.frames.append(_t_frames)

            self._dirty = False


        def _fetch_instances(self):
            pass
            for i in range(len(self.frames)):
                pass
                self.frames[i]._fetch_instances()



        def _write__seq(self, io=None):
            super(RenderwareBinaryStream.StructFrameList, self)._write__seq(io)
            self._io.write_u4le(self.num_frames)
            for i in range(len(self.frames)):
                pass
                self.frames[i]._write__seq(self._io)



        def _check(self):
            if len(self.frames) != self.num_frames:
                raise kaitaistruct.ConsistencyError(u"frames", self.num_frames, len(self.frames))
            for i in range(len(self.frames)):
                pass
                if self.frames[i]._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"frames", self._root, self.frames[i]._root)
                if self.frames[i]._parent != self:
                    raise kaitaistruct.ConsistencyError(u"frames", self, self.frames[i]._parent)

            self._dirty = False


    class StructGeometry(ReadWriteKaitaiStruct):
        """
        .. seealso::
           Source - https://gtamods.com/wiki/RpGeometry
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(RenderwareBinaryStream.StructGeometry, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.format = self._io.read_u4le()
            self.num_triangles = self._io.read_u4le()
            self.num_vertices = self._io.read_u4le()
            self.num_morph_targets = self._io.read_u4le()
            if self._parent.version < 212992:
                pass
                self.surf_prop = RenderwareBinaryStream.SurfaceProperties(self._io, self, self._root)
                self.surf_prop._read()

            if (not (self.is_native)):
                pass
                self.geometry = RenderwareBinaryStream.GeometryNonNative(self._io, self, self._root)
                self.geometry._read()

            self.morph_targets = []
            for i in range(self.num_morph_targets):
                _t_morph_targets = RenderwareBinaryStream.MorphTarget(self._io, self, self._root)
                try:
                    _t_morph_targets._read()
                finally:
                    self.morph_targets.append(_t_morph_targets)

            self._dirty = False


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



        def _write__seq(self, io=None):
            super(RenderwareBinaryStream.StructGeometry, self)._write__seq(io)
            self._io.write_u4le(self.format)
            self._io.write_u4le(self.num_triangles)
            self._io.write_u4le(self.num_vertices)
            self._io.write_u4le(self.num_morph_targets)
            if self._parent.version < 212992:
                pass
                self.surf_prop._write__seq(self._io)

            if (not (self.is_native)):
                pass
                self.geometry._write__seq(self._io)

            for i in range(len(self.morph_targets)):
                pass
                self.morph_targets[i]._write__seq(self._io)



        def _check(self):
            if self._parent.version < 212992:
                pass
                if self.surf_prop._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"surf_prop", self._root, self.surf_prop._root)
                if self.surf_prop._parent != self:
                    raise kaitaistruct.ConsistencyError(u"surf_prop", self, self.surf_prop._parent)

            if (not (self.is_native)):
                pass
                if self.geometry._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"geometry", self._root, self.geometry._root)
                if self.geometry._parent != self:
                    raise kaitaistruct.ConsistencyError(u"geometry", self, self.geometry._parent)

            if len(self.morph_targets) != self.num_morph_targets:
                raise kaitaistruct.ConsistencyError(u"morph_targets", self.num_morph_targets, len(self.morph_targets))
            for i in range(len(self.morph_targets)):
                pass
                if self.morph_targets[i]._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"morph_targets", self._root, self.morph_targets[i]._root)
                if self.morph_targets[i]._parent != self:
                    raise kaitaistruct.ConsistencyError(u"morph_targets", self, self.morph_targets[i]._parent)

            self._dirty = False

        @property
        def is_native(self):
            if hasattr(self, '_m_is_native'):
                return self._m_is_native

            self._m_is_native = self.format & 16777216 != 0
            return getattr(self, '_m_is_native', None)

        def _invalidate_is_native(self):
            del self._m_is_native
        @property
        def is_prelit(self):
            if hasattr(self, '_m_is_prelit'):
                return self._m_is_prelit

            self._m_is_prelit = self.format & 8 != 0
            return getattr(self, '_m_is_prelit', None)

        def _invalidate_is_prelit(self):
            del self._m_is_prelit
        @property
        def is_textured(self):
            if hasattr(self, '_m_is_textured'):
                return self._m_is_textured

            self._m_is_textured = self.format & 4 != 0
            return getattr(self, '_m_is_textured', None)

        def _invalidate_is_textured(self):
            del self._m_is_textured
        @property
        def is_textured2(self):
            if hasattr(self, '_m_is_textured2'):
                return self._m_is_textured2

            self._m_is_textured2 = self.format & 128 != 0
            return getattr(self, '_m_is_textured2', None)

        def _invalidate_is_textured2(self):
            del self._m_is_textured2
        @property
        def num_uv_layers(self):
            if hasattr(self, '_m_num_uv_layers'):
                return self._m_num_uv_layers

            self._m_num_uv_layers = ((2 if self.is_textured2 else (1 if self.is_textured else 0)) if self.num_uv_layers_raw == 0 else self.num_uv_layers_raw)
            return getattr(self, '_m_num_uv_layers', None)

        def _invalidate_num_uv_layers(self):
            del self._m_num_uv_layers
        @property
        def num_uv_layers_raw(self):
            if hasattr(self, '_m_num_uv_layers_raw'):
                return self._m_num_uv_layers_raw

            self._m_num_uv_layers_raw = (self.format & 16711680) >> 16
            return getattr(self, '_m_num_uv_layers_raw', None)

        def _invalidate_num_uv_layers_raw(self):
            del self._m_num_uv_layers_raw

    class StructGeometryList(ReadWriteKaitaiStruct):
        """
        .. seealso::
           Source - https://gtamods.com/wiki/Geometry_List_(RW_Section)#Structure
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(RenderwareBinaryStream.StructGeometryList, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.num_geometries = self._io.read_u4le()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(RenderwareBinaryStream.StructGeometryList, self)._write__seq(io)
            self._io.write_u4le(self.num_geometries)


        def _check(self):
            self._dirty = False


    class StructTextureDictionary(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(RenderwareBinaryStream.StructTextureDictionary, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.num_textures = self._io.read_u4le()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(RenderwareBinaryStream.StructTextureDictionary, self)._write__seq(io)
            self._io.write_u4le(self.num_textures)


        def _check(self):
            self._dirty = False


    class SurfaceProperties(ReadWriteKaitaiStruct):
        """
        .. seealso::
           Source - https://gtamods.com/wiki/RpGeometry
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(RenderwareBinaryStream.SurfaceProperties, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.ambient = self._io.read_f4le()
            self.specular = self._io.read_f4le()
            self.diffuse = self._io.read_f4le()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(RenderwareBinaryStream.SurfaceProperties, self)._write__seq(io)
            self._io.write_f4le(self.ambient)
            self._io.write_f4le(self.specular)
            self._io.write_f4le(self.diffuse)


        def _check(self):
            self._dirty = False


    class TexCoord(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(RenderwareBinaryStream.TexCoord, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.u = self._io.read_f4le()
            self.v = self._io.read_f4le()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(RenderwareBinaryStream.TexCoord, self)._write__seq(io)
            self._io.write_f4le(self.u)
            self._io.write_f4le(self.v)


        def _check(self):
            self._dirty = False


    class Triangle(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(RenderwareBinaryStream.Triangle, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.vertex2 = self._io.read_u2le()
            self.vertex1 = self._io.read_u2le()
            self.material_id = self._io.read_u2le()
            self.vertex3 = self._io.read_u2le()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(RenderwareBinaryStream.Triangle, self)._write__seq(io)
            self._io.write_u2le(self.vertex2)
            self._io.write_u2le(self.vertex1)
            self._io.write_u2le(self.material_id)
            self._io.write_u2le(self.vertex3)


        def _check(self):
            self._dirty = False


    class UvLayer(ReadWriteKaitaiStruct):
        def __init__(self, num_vertices, _io=None, _parent=None, _root=None):
            super(RenderwareBinaryStream.UvLayer, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self.num_vertices = num_vertices

        def _read(self):
            self.tex_coords = []
            for i in range(self.num_vertices):
                _t_tex_coords = RenderwareBinaryStream.TexCoord(self._io, self, self._root)
                try:
                    _t_tex_coords._read()
                finally:
                    self.tex_coords.append(_t_tex_coords)

            self._dirty = False


        def _fetch_instances(self):
            pass
            for i in range(len(self.tex_coords)):
                pass
                self.tex_coords[i]._fetch_instances()



        def _write__seq(self, io=None):
            super(RenderwareBinaryStream.UvLayer, self)._write__seq(io)
            for i in range(len(self.tex_coords)):
                pass
                self.tex_coords[i]._write__seq(self._io)



        def _check(self):
            if len(self.tex_coords) != self.num_vertices:
                raise kaitaistruct.ConsistencyError(u"tex_coords", self.num_vertices, len(self.tex_coords))
            for i in range(len(self.tex_coords)):
                pass
                if self.tex_coords[i]._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"tex_coords", self._root, self.tex_coords[i]._root)
                if self.tex_coords[i]._parent != self:
                    raise kaitaistruct.ConsistencyError(u"tex_coords", self, self.tex_coords[i]._parent)

            self._dirty = False


    class Vector3d(ReadWriteKaitaiStruct):
        """
        .. seealso::
           Source - https://gtamods.com/wiki/Frame_List_(RW_Section)#Structure
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(RenderwareBinaryStream.Vector3d, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.x = self._io.read_f4le()
            self.y = self._io.read_f4le()
            self.z = self._io.read_f4le()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(RenderwareBinaryStream.Vector3d, self)._write__seq(io)
            self._io.write_f4le(self.x)
            self._io.write_f4le(self.y)
            self._io.write_f4le(self.z)


        def _check(self):
            self._dirty = False


    @property
    def version(self):
        if hasattr(self, '_m_version'):
            return self._m_version

        self._m_version = ((self.library_id_stamp >> 14 & 261888) + 196608 | self.library_id_stamp >> 16 & 63 if self.library_id_stamp & 4294901760 != 0 else self.library_id_stamp << 8)
        return getattr(self, '_m_version', None)

    def _invalidate_version(self):
        del self._m_version

