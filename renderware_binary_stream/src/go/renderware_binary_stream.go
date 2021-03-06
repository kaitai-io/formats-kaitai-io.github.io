// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import (
	"github.com/kaitai-io/kaitai_struct_go_runtime/kaitai"
	"bytes"
)


/**
 * @see <a href="https://gtamods.com/wiki/RenderWare_binary_stream_file">Source</a>
 */

type RenderwareBinaryStream_Sections int
const (
	RenderwareBinaryStream_Sections__Struct RenderwareBinaryStream_Sections = 1
	RenderwareBinaryStream_Sections__String RenderwareBinaryStream_Sections = 2
	RenderwareBinaryStream_Sections__Extension RenderwareBinaryStream_Sections = 3
	RenderwareBinaryStream_Sections__Camera RenderwareBinaryStream_Sections = 5
	RenderwareBinaryStream_Sections__Texture RenderwareBinaryStream_Sections = 6
	RenderwareBinaryStream_Sections__Material RenderwareBinaryStream_Sections = 7
	RenderwareBinaryStream_Sections__MaterialList RenderwareBinaryStream_Sections = 8
	RenderwareBinaryStream_Sections__AtomicSection RenderwareBinaryStream_Sections = 9
	RenderwareBinaryStream_Sections__PlaneSection RenderwareBinaryStream_Sections = 10
	RenderwareBinaryStream_Sections__World RenderwareBinaryStream_Sections = 11
	RenderwareBinaryStream_Sections__Spline RenderwareBinaryStream_Sections = 12
	RenderwareBinaryStream_Sections__Matrix RenderwareBinaryStream_Sections = 13
	RenderwareBinaryStream_Sections__FrameList RenderwareBinaryStream_Sections = 14
	RenderwareBinaryStream_Sections__Geometry RenderwareBinaryStream_Sections = 15
	RenderwareBinaryStream_Sections__Clump RenderwareBinaryStream_Sections = 16
	RenderwareBinaryStream_Sections__Light RenderwareBinaryStream_Sections = 18
	RenderwareBinaryStream_Sections__UnicodeString RenderwareBinaryStream_Sections = 19
	RenderwareBinaryStream_Sections__Atomic RenderwareBinaryStream_Sections = 20
	RenderwareBinaryStream_Sections__TextureNative RenderwareBinaryStream_Sections = 21
	RenderwareBinaryStream_Sections__TextureDictionary RenderwareBinaryStream_Sections = 22
	RenderwareBinaryStream_Sections__AnimationDatabase RenderwareBinaryStream_Sections = 23
	RenderwareBinaryStream_Sections__Image RenderwareBinaryStream_Sections = 24
	RenderwareBinaryStream_Sections__SkinAnimation RenderwareBinaryStream_Sections = 25
	RenderwareBinaryStream_Sections__GeometryList RenderwareBinaryStream_Sections = 26
	RenderwareBinaryStream_Sections__AnimAnimation RenderwareBinaryStream_Sections = 27
	RenderwareBinaryStream_Sections__Team RenderwareBinaryStream_Sections = 28
	RenderwareBinaryStream_Sections__Crowd RenderwareBinaryStream_Sections = 29
	RenderwareBinaryStream_Sections__DeltaMorphAnimation RenderwareBinaryStream_Sections = 30
	RenderwareBinaryStream_Sections__RightToRender RenderwareBinaryStream_Sections = 31
	RenderwareBinaryStream_Sections__MultitextureEffectNative RenderwareBinaryStream_Sections = 32
	RenderwareBinaryStream_Sections__MultitextureEffectDictionary RenderwareBinaryStream_Sections = 33
	RenderwareBinaryStream_Sections__TeamDictionary RenderwareBinaryStream_Sections = 34
	RenderwareBinaryStream_Sections__PlatformIndependentTextureDictionary RenderwareBinaryStream_Sections = 35
	RenderwareBinaryStream_Sections__TableOfContents RenderwareBinaryStream_Sections = 36
	RenderwareBinaryStream_Sections__ParticleStandardGlobalData RenderwareBinaryStream_Sections = 37
	RenderwareBinaryStream_Sections__Altpipe RenderwareBinaryStream_Sections = 38
	RenderwareBinaryStream_Sections__PlatformIndependentPeds RenderwareBinaryStream_Sections = 39
	RenderwareBinaryStream_Sections__PatchMesh RenderwareBinaryStream_Sections = 40
	RenderwareBinaryStream_Sections__ChunkGroupStart RenderwareBinaryStream_Sections = 41
	RenderwareBinaryStream_Sections__ChunkGroupEnd RenderwareBinaryStream_Sections = 42
	RenderwareBinaryStream_Sections__UvAnimationDictionary RenderwareBinaryStream_Sections = 43
	RenderwareBinaryStream_Sections__CollTree RenderwareBinaryStream_Sections = 44
	RenderwareBinaryStream_Sections__MetricsPlg RenderwareBinaryStream_Sections = 257
	RenderwareBinaryStream_Sections__SplinePlg RenderwareBinaryStream_Sections = 258
	RenderwareBinaryStream_Sections__StereoPlg RenderwareBinaryStream_Sections = 259
	RenderwareBinaryStream_Sections__VrmlPlg RenderwareBinaryStream_Sections = 260
	RenderwareBinaryStream_Sections__MorphPlg RenderwareBinaryStream_Sections = 261
	RenderwareBinaryStream_Sections__PvsPlg RenderwareBinaryStream_Sections = 262
	RenderwareBinaryStream_Sections__MemoryLeakPlg RenderwareBinaryStream_Sections = 263
	RenderwareBinaryStream_Sections__AnimationPlg RenderwareBinaryStream_Sections = 264
	RenderwareBinaryStream_Sections__GlossPlg RenderwareBinaryStream_Sections = 265
	RenderwareBinaryStream_Sections__LogoPlg RenderwareBinaryStream_Sections = 266
	RenderwareBinaryStream_Sections__MemoryInfoPlg RenderwareBinaryStream_Sections = 267
	RenderwareBinaryStream_Sections__RandomPlg RenderwareBinaryStream_Sections = 268
	RenderwareBinaryStream_Sections__PngImagePlg RenderwareBinaryStream_Sections = 269
	RenderwareBinaryStream_Sections__BonePlg RenderwareBinaryStream_Sections = 270
	RenderwareBinaryStream_Sections__VrmlAnimPlg RenderwareBinaryStream_Sections = 271
	RenderwareBinaryStream_Sections__SkyMipmapVal RenderwareBinaryStream_Sections = 272
	RenderwareBinaryStream_Sections__MrmPlg RenderwareBinaryStream_Sections = 273
	RenderwareBinaryStream_Sections__LodAtomicPlg RenderwareBinaryStream_Sections = 274
	RenderwareBinaryStream_Sections__MePlg RenderwareBinaryStream_Sections = 275
	RenderwareBinaryStream_Sections__LightmapPlg RenderwareBinaryStream_Sections = 276
	RenderwareBinaryStream_Sections__RefinePlg RenderwareBinaryStream_Sections = 277
	RenderwareBinaryStream_Sections__SkinPlg RenderwareBinaryStream_Sections = 278
	RenderwareBinaryStream_Sections__LabelPlg RenderwareBinaryStream_Sections = 279
	RenderwareBinaryStream_Sections__ParticlesPlg RenderwareBinaryStream_Sections = 280
	RenderwareBinaryStream_Sections__GeomtxPlg RenderwareBinaryStream_Sections = 281
	RenderwareBinaryStream_Sections__SynthCorePlg RenderwareBinaryStream_Sections = 282
	RenderwareBinaryStream_Sections__StqppPlg RenderwareBinaryStream_Sections = 283
	RenderwareBinaryStream_Sections__PartPpPlg RenderwareBinaryStream_Sections = 284
	RenderwareBinaryStream_Sections__CollisionPlg RenderwareBinaryStream_Sections = 285
	RenderwareBinaryStream_Sections__HanimPlg RenderwareBinaryStream_Sections = 286
	RenderwareBinaryStream_Sections__UserDataPlg RenderwareBinaryStream_Sections = 287
	RenderwareBinaryStream_Sections__MaterialEffectsPlg RenderwareBinaryStream_Sections = 288
	RenderwareBinaryStream_Sections__ParticleSystemPlg RenderwareBinaryStream_Sections = 289
	RenderwareBinaryStream_Sections__DeltaMorphPlg RenderwareBinaryStream_Sections = 290
	RenderwareBinaryStream_Sections__PatchPlg RenderwareBinaryStream_Sections = 291
	RenderwareBinaryStream_Sections__TeamPlg RenderwareBinaryStream_Sections = 292
	RenderwareBinaryStream_Sections__CrowdPpPlg RenderwareBinaryStream_Sections = 293
	RenderwareBinaryStream_Sections__MipSplitPlg RenderwareBinaryStream_Sections = 294
	RenderwareBinaryStream_Sections__AnisotropyPlg RenderwareBinaryStream_Sections = 295
	RenderwareBinaryStream_Sections__GcnMaterialPlg RenderwareBinaryStream_Sections = 297
	RenderwareBinaryStream_Sections__GeometricPvsPlg RenderwareBinaryStream_Sections = 298
	RenderwareBinaryStream_Sections__XboxMaterialPlg RenderwareBinaryStream_Sections = 299
	RenderwareBinaryStream_Sections__MultiTexturePlg RenderwareBinaryStream_Sections = 300
	RenderwareBinaryStream_Sections__ChainPlg RenderwareBinaryStream_Sections = 301
	RenderwareBinaryStream_Sections__ToonPlg RenderwareBinaryStream_Sections = 302
	RenderwareBinaryStream_Sections__PtankPlg RenderwareBinaryStream_Sections = 303
	RenderwareBinaryStream_Sections__ParticleStandardPlg RenderwareBinaryStream_Sections = 304
	RenderwareBinaryStream_Sections__PdsPlg RenderwareBinaryStream_Sections = 305
	RenderwareBinaryStream_Sections__PrtadvPlg RenderwareBinaryStream_Sections = 306
	RenderwareBinaryStream_Sections__NormalMapPlg RenderwareBinaryStream_Sections = 307
	RenderwareBinaryStream_Sections__AdcPlg RenderwareBinaryStream_Sections = 308
	RenderwareBinaryStream_Sections__UvAnimationPlg RenderwareBinaryStream_Sections = 309
	RenderwareBinaryStream_Sections__CharacterSetPlg RenderwareBinaryStream_Sections = 384
	RenderwareBinaryStream_Sections__NohsWorldPlg RenderwareBinaryStream_Sections = 385
	RenderwareBinaryStream_Sections__ImportUtilPlg RenderwareBinaryStream_Sections = 386
	RenderwareBinaryStream_Sections__SlerpPlg RenderwareBinaryStream_Sections = 387
	RenderwareBinaryStream_Sections__OptimPlg RenderwareBinaryStream_Sections = 388
	RenderwareBinaryStream_Sections__TlWorldPlg RenderwareBinaryStream_Sections = 389
	RenderwareBinaryStream_Sections__DatabasePlg RenderwareBinaryStream_Sections = 390
	RenderwareBinaryStream_Sections__RaytracePlg RenderwareBinaryStream_Sections = 391
	RenderwareBinaryStream_Sections__RayPlg RenderwareBinaryStream_Sections = 392
	RenderwareBinaryStream_Sections__LibraryPlg RenderwareBinaryStream_Sections = 393
	RenderwareBinaryStream_Sections__Plg2d RenderwareBinaryStream_Sections = 400
	RenderwareBinaryStream_Sections__TileRenderPlg RenderwareBinaryStream_Sections = 401
	RenderwareBinaryStream_Sections__JpegImagePlg RenderwareBinaryStream_Sections = 402
	RenderwareBinaryStream_Sections__TgaImagePlg RenderwareBinaryStream_Sections = 403
	RenderwareBinaryStream_Sections__GifImagePlg RenderwareBinaryStream_Sections = 404
	RenderwareBinaryStream_Sections__QuatPlg RenderwareBinaryStream_Sections = 405
	RenderwareBinaryStream_Sections__SplinePvsPlg RenderwareBinaryStream_Sections = 406
	RenderwareBinaryStream_Sections__MipmapPlg RenderwareBinaryStream_Sections = 407
	RenderwareBinaryStream_Sections__MipmapkPlg RenderwareBinaryStream_Sections = 408
	RenderwareBinaryStream_Sections__Font2d RenderwareBinaryStream_Sections = 409
	RenderwareBinaryStream_Sections__IntersectionPlg RenderwareBinaryStream_Sections = 410
	RenderwareBinaryStream_Sections__TiffImagePlg RenderwareBinaryStream_Sections = 411
	RenderwareBinaryStream_Sections__PickPlg RenderwareBinaryStream_Sections = 412
	RenderwareBinaryStream_Sections__BmpImagePlg RenderwareBinaryStream_Sections = 413
	RenderwareBinaryStream_Sections__RasImagePlg RenderwareBinaryStream_Sections = 414
	RenderwareBinaryStream_Sections__SkinFxPlg RenderwareBinaryStream_Sections = 415
	RenderwareBinaryStream_Sections__VcatPlg RenderwareBinaryStream_Sections = 416
	RenderwareBinaryStream_Sections__Path2d RenderwareBinaryStream_Sections = 417
	RenderwareBinaryStream_Sections__Brush2d RenderwareBinaryStream_Sections = 418
	RenderwareBinaryStream_Sections__Object2d RenderwareBinaryStream_Sections = 419
	RenderwareBinaryStream_Sections__Shape2d RenderwareBinaryStream_Sections = 420
	RenderwareBinaryStream_Sections__Scene2d RenderwareBinaryStream_Sections = 421
	RenderwareBinaryStream_Sections__PickRegion2d RenderwareBinaryStream_Sections = 422
	RenderwareBinaryStream_Sections__ObjectString2d RenderwareBinaryStream_Sections = 423
	RenderwareBinaryStream_Sections__AnimationPlg2d RenderwareBinaryStream_Sections = 424
	RenderwareBinaryStream_Sections__Animation2d RenderwareBinaryStream_Sections = 425
	RenderwareBinaryStream_Sections__Keyframe2d RenderwareBinaryStream_Sections = 432
	RenderwareBinaryStream_Sections__Maestro2d RenderwareBinaryStream_Sections = 433
	RenderwareBinaryStream_Sections__Barycentric RenderwareBinaryStream_Sections = 434
	RenderwareBinaryStream_Sections__PlatformIndependentTextureDictionaryTk RenderwareBinaryStream_Sections = 435
	RenderwareBinaryStream_Sections__TocTk RenderwareBinaryStream_Sections = 436
	RenderwareBinaryStream_Sections__TplTk RenderwareBinaryStream_Sections = 437
	RenderwareBinaryStream_Sections__AltpipeTk RenderwareBinaryStream_Sections = 438
	RenderwareBinaryStream_Sections__AnimationTk RenderwareBinaryStream_Sections = 439
	RenderwareBinaryStream_Sections__SkinSplitTookit RenderwareBinaryStream_Sections = 440
	RenderwareBinaryStream_Sections__CompressedKeyTk RenderwareBinaryStream_Sections = 441
	RenderwareBinaryStream_Sections__GeometryConditioningPlg RenderwareBinaryStream_Sections = 442
	RenderwareBinaryStream_Sections__WingPlg RenderwareBinaryStream_Sections = 443
	RenderwareBinaryStream_Sections__GenericPipelineTk RenderwareBinaryStream_Sections = 444
	RenderwareBinaryStream_Sections__LightmapConversionTk RenderwareBinaryStream_Sections = 445
	RenderwareBinaryStream_Sections__FilesystemPlg RenderwareBinaryStream_Sections = 446
	RenderwareBinaryStream_Sections__DictionaryTk RenderwareBinaryStream_Sections = 447
	RenderwareBinaryStream_Sections__UvAnimationLinear RenderwareBinaryStream_Sections = 448
	RenderwareBinaryStream_Sections__UvAnimationParameter RenderwareBinaryStream_Sections = 449
	RenderwareBinaryStream_Sections__BinMeshPlg RenderwareBinaryStream_Sections = 1294
	RenderwareBinaryStream_Sections__NativeDataPlg RenderwareBinaryStream_Sections = 1296
	RenderwareBinaryStream_Sections__ZmodelerLock RenderwareBinaryStream_Sections = 61982
	RenderwareBinaryStream_Sections__AtomicVisibilityDistance RenderwareBinaryStream_Sections = 39055872
	RenderwareBinaryStream_Sections__ClumpVisibilityDistance RenderwareBinaryStream_Sections = 39055873
	RenderwareBinaryStream_Sections__FrameVisibilityDistance RenderwareBinaryStream_Sections = 39055874
	RenderwareBinaryStream_Sections__PipelineSet RenderwareBinaryStream_Sections = 39056115
	RenderwareBinaryStream_Sections__Unused5 RenderwareBinaryStream_Sections = 39056116
	RenderwareBinaryStream_Sections__TexdictionaryLink RenderwareBinaryStream_Sections = 39056117
	RenderwareBinaryStream_Sections__SpecularMaterial RenderwareBinaryStream_Sections = 39056118
	RenderwareBinaryStream_Sections__Unused8 RenderwareBinaryStream_Sections = 39056119
	RenderwareBinaryStream_Sections__Effect2d RenderwareBinaryStream_Sections = 39056120
	RenderwareBinaryStream_Sections__ExtraVertColour RenderwareBinaryStream_Sections = 39056121
	RenderwareBinaryStream_Sections__CollisionModel RenderwareBinaryStream_Sections = 39056122
	RenderwareBinaryStream_Sections__GtaHanim RenderwareBinaryStream_Sections = 39056123
	RenderwareBinaryStream_Sections__ReflectionMaterial RenderwareBinaryStream_Sections = 39056124
	RenderwareBinaryStream_Sections__Breakable RenderwareBinaryStream_Sections = 39056125
	RenderwareBinaryStream_Sections__Frame RenderwareBinaryStream_Sections = 39056126
	RenderwareBinaryStream_Sections__Unused16 RenderwareBinaryStream_Sections = 39056127
)
type RenderwareBinaryStream struct {
	Code RenderwareBinaryStream_Sections
	Size uint32
	LibraryIdStamp uint32
	Body interface{}
	_io *kaitai.Stream
	_root *RenderwareBinaryStream
	_parent interface{}
	_raw_Body []byte
	_f_version bool
	version int
}
func NewRenderwareBinaryStream() *RenderwareBinaryStream {
	return &RenderwareBinaryStream{
	}
}

func (this *RenderwareBinaryStream) Read(io *kaitai.Stream, parent interface{}, root *RenderwareBinaryStream) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp1, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Code = RenderwareBinaryStream_Sections(tmp1)
	tmp2, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Size = uint32(tmp2)
	tmp3, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.LibraryIdStamp = uint32(tmp3)
	switch (this.Code) {
	case RenderwareBinaryStream_Sections__Geometry:
		tmp4, err := this._io.ReadBytes(int(this.Size))
		if err != nil {
			return err
		}
		tmp4 = tmp4
		this._raw_Body = tmp4
		_io__raw_Body := kaitai.NewStream(bytes.NewReader(this._raw_Body))
		tmp5 := NewRenderwareBinaryStream_ListWithHeader()
		err = tmp5.Read(_io__raw_Body, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp5
	case RenderwareBinaryStream_Sections__TextureDictionary:
		tmp6, err := this._io.ReadBytes(int(this.Size))
		if err != nil {
			return err
		}
		tmp6 = tmp6
		this._raw_Body = tmp6
		_io__raw_Body := kaitai.NewStream(bytes.NewReader(this._raw_Body))
		tmp7 := NewRenderwareBinaryStream_ListWithHeader()
		err = tmp7.Read(_io__raw_Body, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp7
	case RenderwareBinaryStream_Sections__GeometryList:
		tmp8, err := this._io.ReadBytes(int(this.Size))
		if err != nil {
			return err
		}
		tmp8 = tmp8
		this._raw_Body = tmp8
		_io__raw_Body := kaitai.NewStream(bytes.NewReader(this._raw_Body))
		tmp9 := NewRenderwareBinaryStream_ListWithHeader()
		err = tmp9.Read(_io__raw_Body, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp9
	case RenderwareBinaryStream_Sections__TextureNative:
		tmp10, err := this._io.ReadBytes(int(this.Size))
		if err != nil {
			return err
		}
		tmp10 = tmp10
		this._raw_Body = tmp10
		_io__raw_Body := kaitai.NewStream(bytes.NewReader(this._raw_Body))
		tmp11 := NewRenderwareBinaryStream_ListWithHeader()
		err = tmp11.Read(_io__raw_Body, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp11
	case RenderwareBinaryStream_Sections__Clump:
		tmp12, err := this._io.ReadBytes(int(this.Size))
		if err != nil {
			return err
		}
		tmp12 = tmp12
		this._raw_Body = tmp12
		_io__raw_Body := kaitai.NewStream(bytes.NewReader(this._raw_Body))
		tmp13 := NewRenderwareBinaryStream_ListWithHeader()
		err = tmp13.Read(_io__raw_Body, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp13
	case RenderwareBinaryStream_Sections__FrameList:
		tmp14, err := this._io.ReadBytes(int(this.Size))
		if err != nil {
			return err
		}
		tmp14 = tmp14
		this._raw_Body = tmp14
		_io__raw_Body := kaitai.NewStream(bytes.NewReader(this._raw_Body))
		tmp15 := NewRenderwareBinaryStream_ListWithHeader()
		err = tmp15.Read(_io__raw_Body, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp15
	default:
		tmp16, err := this._io.ReadBytes(int(this.Size))
		if err != nil {
			return err
		}
		tmp16 = tmp16
		this._raw_Body = tmp16
	}
	return err
}
func (this *RenderwareBinaryStream) Version() (v int, err error) {
	if (this._f_version) {
		return this.version, nil
	}
	var tmp17 int;
	if ((this.LibraryIdStamp & uint32(4294901760)) != 0) {
		tmp17 = ((((this.LibraryIdStamp >> 14) & 261888) + 196608) | ((this.LibraryIdStamp >> 16) & 63))
	} else {
		tmp17 = (this.LibraryIdStamp << 8)
	}
	this.version = int(tmp17)
	this._f_version = true
	return this.version, nil
}

/**
 * @see <a href="https://gtamods.com/wiki/RpClump">Source</a>
 */
type RenderwareBinaryStream_StructClump struct {
	NumAtomics uint32
	NumLights uint32
	NumCameras uint32
	_io *kaitai.Stream
	_root *RenderwareBinaryStream
	_parent *RenderwareBinaryStream_ListWithHeader
}
func NewRenderwareBinaryStream_StructClump() *RenderwareBinaryStream_StructClump {
	return &RenderwareBinaryStream_StructClump{
	}
}

func (this *RenderwareBinaryStream_StructClump) Read(io *kaitai.Stream, parent *RenderwareBinaryStream_ListWithHeader, root *RenderwareBinaryStream) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp18, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.NumAtomics = uint32(tmp18)
	tmp19, err := this._parent.Version()
	if err != nil {
		return err
	}
	if (tmp19 >= 208896) {
		tmp20, err := this._io.ReadU4le()
		if err != nil {
			return err
		}
		this.NumLights = uint32(tmp20)
	}
	tmp21, err := this._parent.Version()
	if err != nil {
		return err
	}
	if (tmp21 >= 208896) {
		tmp22, err := this._io.ReadU4le()
		if err != nil {
			return err
		}
		this.NumCameras = uint32(tmp22)
	}
	return err
}

/**
 * @see <a href="https://gtamods.com/wiki/RpGeometry">Source</a>
 */
type RenderwareBinaryStream_StructGeometry struct {
	Format uint32
	NumTriangles uint32
	NumVertices uint32
	NumMorphTargets uint32
	SurfProp *RenderwareBinaryStream_SurfaceProperties
	Geometry *RenderwareBinaryStream_GeometryNonNative
	MorphTargets []*RenderwareBinaryStream_MorphTarget
	_io *kaitai.Stream
	_root *RenderwareBinaryStream
	_parent *RenderwareBinaryStream_ListWithHeader
	_f_isTextured bool
	isTextured bool
	_f_isPrelit bool
	isPrelit bool
	_f_isTextured2 bool
	isTextured2 bool
	_f_isNative bool
	isNative bool
}
func NewRenderwareBinaryStream_StructGeometry() *RenderwareBinaryStream_StructGeometry {
	return &RenderwareBinaryStream_StructGeometry{
	}
}

func (this *RenderwareBinaryStream_StructGeometry) Read(io *kaitai.Stream, parent *RenderwareBinaryStream_ListWithHeader, root *RenderwareBinaryStream) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp23, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Format = uint32(tmp23)
	tmp24, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.NumTriangles = uint32(tmp24)
	tmp25, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.NumVertices = uint32(tmp25)
	tmp26, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.NumMorphTargets = uint32(tmp26)
	tmp27, err := this._parent.Version()
	if err != nil {
		return err
	}
	if (tmp27 < 212992) {
		tmp28 := NewRenderwareBinaryStream_SurfaceProperties()
		err = tmp28.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.SurfProp = tmp28
	}
	tmp29, err := this.IsNative()
	if err != nil {
		return err
	}
	if (!(tmp29)) {
		tmp30 := NewRenderwareBinaryStream_GeometryNonNative()
		err = tmp30.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Geometry = tmp30
	}
	this.MorphTargets = make([]*RenderwareBinaryStream_MorphTarget, this.NumMorphTargets)
	for i := range this.MorphTargets {
		tmp31 := NewRenderwareBinaryStream_MorphTarget()
		err = tmp31.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.MorphTargets[i] = tmp31
	}
	return err
}
func (this *RenderwareBinaryStream_StructGeometry) IsTextured() (v bool, err error) {
	if (this._f_isTextured) {
		return this.isTextured, nil
	}
	this.isTextured = bool((this.Format & 4) != 0)
	this._f_isTextured = true
	return this.isTextured, nil
}
func (this *RenderwareBinaryStream_StructGeometry) IsPrelit() (v bool, err error) {
	if (this._f_isPrelit) {
		return this.isPrelit, nil
	}
	this.isPrelit = bool((this.Format & 8) != 0)
	this._f_isPrelit = true
	return this.isPrelit, nil
}
func (this *RenderwareBinaryStream_StructGeometry) IsTextured2() (v bool, err error) {
	if (this._f_isTextured2) {
		return this.isTextured2, nil
	}
	this.isTextured2 = bool((this.Format & 128) != 0)
	this._f_isTextured2 = true
	return this.isTextured2, nil
}
func (this *RenderwareBinaryStream_StructGeometry) IsNative() (v bool, err error) {
	if (this._f_isNative) {
		return this.isNative, nil
	}
	this.isNative = bool((this.Format & 16777216) != 0)
	this._f_isNative = true
	return this.isNative, nil
}
type RenderwareBinaryStream_GeometryNonNative struct {
	PrelitColors []*RenderwareBinaryStream_Rgba
	TexCoords []*RenderwareBinaryStream_TexCoord
	Triangles []*RenderwareBinaryStream_Triangle
	_io *kaitai.Stream
	_root *RenderwareBinaryStream
	_parent *RenderwareBinaryStream_StructGeometry
}
func NewRenderwareBinaryStream_GeometryNonNative() *RenderwareBinaryStream_GeometryNonNative {
	return &RenderwareBinaryStream_GeometryNonNative{
	}
}

func (this *RenderwareBinaryStream_GeometryNonNative) Read(io *kaitai.Stream, parent *RenderwareBinaryStream_StructGeometry, root *RenderwareBinaryStream) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp32, err := this._parent.IsPrelit()
	if err != nil {
		return err
	}
	if (tmp32) {
		this.PrelitColors = make([]*RenderwareBinaryStream_Rgba, this._parent.NumVertices)
		for i := range this.PrelitColors {
			tmp33 := NewRenderwareBinaryStream_Rgba()
			err = tmp33.Read(this._io, this, this._root)
			if err != nil {
				return err
			}
			this.PrelitColors[i] = tmp33
		}
	}
	tmp34, err := this._parent.IsTextured()
	if err != nil {
		return err
	}
	tmp35, err := this._parent.IsTextured2()
	if err != nil {
		return err
	}
	if ( ((tmp34) || (tmp35)) ) {
		this.TexCoords = make([]*RenderwareBinaryStream_TexCoord, this._parent.NumVertices)
		for i := range this.TexCoords {
			tmp36 := NewRenderwareBinaryStream_TexCoord()
			err = tmp36.Read(this._io, this, this._root)
			if err != nil {
				return err
			}
			this.TexCoords[i] = tmp36
		}
	}
	this.Triangles = make([]*RenderwareBinaryStream_Triangle, this._parent.NumTriangles)
	for i := range this.Triangles {
		tmp37 := NewRenderwareBinaryStream_Triangle()
		err = tmp37.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Triangles[i] = tmp37
	}
	return err
}

/**
 * @see <a href="https://gtamods.com/wiki/Geometry_List_(RW_Section)#Structure">Source</a>
 */
type RenderwareBinaryStream_StructGeometryList struct {
	NumGeometries uint32
	_io *kaitai.Stream
	_root *RenderwareBinaryStream
	_parent *RenderwareBinaryStream_ListWithHeader
}
func NewRenderwareBinaryStream_StructGeometryList() *RenderwareBinaryStream_StructGeometryList {
	return &RenderwareBinaryStream_StructGeometryList{
	}
}

func (this *RenderwareBinaryStream_StructGeometryList) Read(io *kaitai.Stream, parent *RenderwareBinaryStream_ListWithHeader, root *RenderwareBinaryStream) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp38, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.NumGeometries = uint32(tmp38)
	return err
}
type RenderwareBinaryStream_Rgba struct {
	R uint8
	G uint8
	B uint8
	A uint8
	_io *kaitai.Stream
	_root *RenderwareBinaryStream
	_parent *RenderwareBinaryStream_GeometryNonNative
}
func NewRenderwareBinaryStream_Rgba() *RenderwareBinaryStream_Rgba {
	return &RenderwareBinaryStream_Rgba{
	}
}

func (this *RenderwareBinaryStream_Rgba) Read(io *kaitai.Stream, parent *RenderwareBinaryStream_GeometryNonNative, root *RenderwareBinaryStream) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp39, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.R = tmp39
	tmp40, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.G = tmp40
	tmp41, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.B = tmp41
	tmp42, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.A = tmp42
	return err
}
type RenderwareBinaryStream_Sphere struct {
	X float32
	Y float32
	Z float32
	Radius float32
	_io *kaitai.Stream
	_root *RenderwareBinaryStream
	_parent *RenderwareBinaryStream_MorphTarget
}
func NewRenderwareBinaryStream_Sphere() *RenderwareBinaryStream_Sphere {
	return &RenderwareBinaryStream_Sphere{
	}
}

func (this *RenderwareBinaryStream_Sphere) Read(io *kaitai.Stream, parent *RenderwareBinaryStream_MorphTarget, root *RenderwareBinaryStream) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp43, err := this._io.ReadF4le()
	if err != nil {
		return err
	}
	this.X = float32(tmp43)
	tmp44, err := this._io.ReadF4le()
	if err != nil {
		return err
	}
	this.Y = float32(tmp44)
	tmp45, err := this._io.ReadF4le()
	if err != nil {
		return err
	}
	this.Z = float32(tmp45)
	tmp46, err := this._io.ReadF4le()
	if err != nil {
		return err
	}
	this.Radius = float32(tmp46)
	return err
}
type RenderwareBinaryStream_MorphTarget struct {
	BoundingSphere *RenderwareBinaryStream_Sphere
	HasVertices uint32
	HasNormals uint32
	Vertices []*RenderwareBinaryStream_Vector3d
	Normals []*RenderwareBinaryStream_Vector3d
	_io *kaitai.Stream
	_root *RenderwareBinaryStream
	_parent *RenderwareBinaryStream_StructGeometry
}
func NewRenderwareBinaryStream_MorphTarget() *RenderwareBinaryStream_MorphTarget {
	return &RenderwareBinaryStream_MorphTarget{
	}
}

func (this *RenderwareBinaryStream_MorphTarget) Read(io *kaitai.Stream, parent *RenderwareBinaryStream_StructGeometry, root *RenderwareBinaryStream) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp47 := NewRenderwareBinaryStream_Sphere()
	err = tmp47.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.BoundingSphere = tmp47
	tmp48, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.HasVertices = uint32(tmp48)
	tmp49, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.HasNormals = uint32(tmp49)
	if (this.HasVertices != 0) {
		this.Vertices = make([]*RenderwareBinaryStream_Vector3d, this._parent.NumVertices)
		for i := range this.Vertices {
			tmp50 := NewRenderwareBinaryStream_Vector3d()
			err = tmp50.Read(this._io, this, this._root)
			if err != nil {
				return err
			}
			this.Vertices[i] = tmp50
		}
	}
	if (this.HasNormals != 0) {
		this.Normals = make([]*RenderwareBinaryStream_Vector3d, this._parent.NumVertices)
		for i := range this.Normals {
			tmp51 := NewRenderwareBinaryStream_Vector3d()
			err = tmp51.Read(this._io, this, this._root)
			if err != nil {
				return err
			}
			this.Normals[i] = tmp51
		}
	}
	return err
}

/**
 * @see <a href="https://gtamods.com/wiki/RpGeometry">Source</a>
 */
type RenderwareBinaryStream_SurfaceProperties struct {
	Ambient float32
	Specular float32
	Diffuse float32
	_io *kaitai.Stream
	_root *RenderwareBinaryStream
	_parent *RenderwareBinaryStream_StructGeometry
}
func NewRenderwareBinaryStream_SurfaceProperties() *RenderwareBinaryStream_SurfaceProperties {
	return &RenderwareBinaryStream_SurfaceProperties{
	}
}

func (this *RenderwareBinaryStream_SurfaceProperties) Read(io *kaitai.Stream, parent *RenderwareBinaryStream_StructGeometry, root *RenderwareBinaryStream) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp52, err := this._io.ReadF4le()
	if err != nil {
		return err
	}
	this.Ambient = float32(tmp52)
	tmp53, err := this._io.ReadF4le()
	if err != nil {
		return err
	}
	this.Specular = float32(tmp53)
	tmp54, err := this._io.ReadF4le()
	if err != nil {
		return err
	}
	this.Diffuse = float32(tmp54)
	return err
}

/**
 * @see <a href="https://gtamods.com/wiki/Frame_List_(RW_Section)#Structure">Source</a>
 */
type RenderwareBinaryStream_StructFrameList struct {
	NumFrames uint32
	Frames []*RenderwareBinaryStream_Frame
	_io *kaitai.Stream
	_root *RenderwareBinaryStream
	_parent *RenderwareBinaryStream_ListWithHeader
}
func NewRenderwareBinaryStream_StructFrameList() *RenderwareBinaryStream_StructFrameList {
	return &RenderwareBinaryStream_StructFrameList{
	}
}

func (this *RenderwareBinaryStream_StructFrameList) Read(io *kaitai.Stream, parent *RenderwareBinaryStream_ListWithHeader, root *RenderwareBinaryStream) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp55, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.NumFrames = uint32(tmp55)
	this.Frames = make([]*RenderwareBinaryStream_Frame, this.NumFrames)
	for i := range this.Frames {
		tmp56 := NewRenderwareBinaryStream_Frame()
		err = tmp56.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Frames[i] = tmp56
	}
	return err
}

/**
 * @see <a href="https://gtamods.com/wiki/Frame_List_(RW_Section)#Structure">Source</a>
 */
type RenderwareBinaryStream_Matrix struct {
	Entries []*RenderwareBinaryStream_Vector3d
	_io *kaitai.Stream
	_root *RenderwareBinaryStream
	_parent *RenderwareBinaryStream_Frame
}
func NewRenderwareBinaryStream_Matrix() *RenderwareBinaryStream_Matrix {
	return &RenderwareBinaryStream_Matrix{
	}
}

func (this *RenderwareBinaryStream_Matrix) Read(io *kaitai.Stream, parent *RenderwareBinaryStream_Frame, root *RenderwareBinaryStream) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	this.Entries = make([]*RenderwareBinaryStream_Vector3d, 3)
	for i := range this.Entries {
		tmp57 := NewRenderwareBinaryStream_Vector3d()
		err = tmp57.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Entries[i] = tmp57
	}
	return err
}

/**
 * @see <a href="https://gtamods.com/wiki/Frame_List_(RW_Section)#Structure">Source</a>
 */
type RenderwareBinaryStream_Vector3d struct {
	X float32
	Y float32
	Z float32
	_io *kaitai.Stream
	_root *RenderwareBinaryStream
	_parent interface{}
}
func NewRenderwareBinaryStream_Vector3d() *RenderwareBinaryStream_Vector3d {
	return &RenderwareBinaryStream_Vector3d{
	}
}

func (this *RenderwareBinaryStream_Vector3d) Read(io *kaitai.Stream, parent interface{}, root *RenderwareBinaryStream) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp58, err := this._io.ReadF4le()
	if err != nil {
		return err
	}
	this.X = float32(tmp58)
	tmp59, err := this._io.ReadF4le()
	if err != nil {
		return err
	}
	this.Y = float32(tmp59)
	tmp60, err := this._io.ReadF4le()
	if err != nil {
		return err
	}
	this.Z = float32(tmp60)
	return err
}

/**
 * Typical structure used by many data types in RenderWare binary
 * stream. Substream contains a list of binary stream entries,
 * first entry always has type "struct" and carries some specific
 * binary data it in, determined by the type of parent. All other
 * entries, beside the first one, are normal, self-describing
 * records.
 */
type RenderwareBinaryStream_ListWithHeader struct {
	Code []byte
	HeaderSize uint32
	LibraryIdStamp uint32
	Header interface{}
	Entries []*RenderwareBinaryStream
	_io *kaitai.Stream
	_root *RenderwareBinaryStream
	_parent *RenderwareBinaryStream
	_raw_Header []byte
	_f_version bool
	version int
}
func NewRenderwareBinaryStream_ListWithHeader() *RenderwareBinaryStream_ListWithHeader {
	return &RenderwareBinaryStream_ListWithHeader{
	}
}

func (this *RenderwareBinaryStream_ListWithHeader) Read(io *kaitai.Stream, parent *RenderwareBinaryStream, root *RenderwareBinaryStream) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp61, err := this._io.ReadBytes(int(4))
	if err != nil {
		return err
	}
	tmp61 = tmp61
	this.Code = tmp61
	if !(bytes.Equal(this.Code, []uint8{1, 0, 0, 0})) {
		return kaitai.NewValidationNotEqualError([]uint8{1, 0, 0, 0}, this.Code, this._io, "/types/list_with_header/seq/0")
	}
	tmp62, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.HeaderSize = uint32(tmp62)
	tmp63, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.LibraryIdStamp = uint32(tmp63)
	switch (this._parent.Code) {
	case RenderwareBinaryStream_Sections__Geometry:
		tmp64, err := this._io.ReadBytes(int(this.HeaderSize))
		if err != nil {
			return err
		}
		tmp64 = tmp64
		this._raw_Header = tmp64
		_io__raw_Header := kaitai.NewStream(bytes.NewReader(this._raw_Header))
		tmp65 := NewRenderwareBinaryStream_StructGeometry()
		err = tmp65.Read(_io__raw_Header, this, this._root)
		if err != nil {
			return err
		}
		this.Header = tmp65
	case RenderwareBinaryStream_Sections__TextureDictionary:
		tmp66, err := this._io.ReadBytes(int(this.HeaderSize))
		if err != nil {
			return err
		}
		tmp66 = tmp66
		this._raw_Header = tmp66
		_io__raw_Header := kaitai.NewStream(bytes.NewReader(this._raw_Header))
		tmp67 := NewRenderwareBinaryStream_StructTextureDictionary()
		err = tmp67.Read(_io__raw_Header, this, this._root)
		if err != nil {
			return err
		}
		this.Header = tmp67
	case RenderwareBinaryStream_Sections__GeometryList:
		tmp68, err := this._io.ReadBytes(int(this.HeaderSize))
		if err != nil {
			return err
		}
		tmp68 = tmp68
		this._raw_Header = tmp68
		_io__raw_Header := kaitai.NewStream(bytes.NewReader(this._raw_Header))
		tmp69 := NewRenderwareBinaryStream_StructGeometryList()
		err = tmp69.Read(_io__raw_Header, this, this._root)
		if err != nil {
			return err
		}
		this.Header = tmp69
	case RenderwareBinaryStream_Sections__Clump:
		tmp70, err := this._io.ReadBytes(int(this.HeaderSize))
		if err != nil {
			return err
		}
		tmp70 = tmp70
		this._raw_Header = tmp70
		_io__raw_Header := kaitai.NewStream(bytes.NewReader(this._raw_Header))
		tmp71 := NewRenderwareBinaryStream_StructClump()
		err = tmp71.Read(_io__raw_Header, this, this._root)
		if err != nil {
			return err
		}
		this.Header = tmp71
	case RenderwareBinaryStream_Sections__FrameList:
		tmp72, err := this._io.ReadBytes(int(this.HeaderSize))
		if err != nil {
			return err
		}
		tmp72 = tmp72
		this._raw_Header = tmp72
		_io__raw_Header := kaitai.NewStream(bytes.NewReader(this._raw_Header))
		tmp73 := NewRenderwareBinaryStream_StructFrameList()
		err = tmp73.Read(_io__raw_Header, this, this._root)
		if err != nil {
			return err
		}
		this.Header = tmp73
	default:
		tmp74, err := this._io.ReadBytes(int(this.HeaderSize))
		if err != nil {
			return err
		}
		tmp74 = tmp74
		this._raw_Header = tmp74
	}
	for i := 1;; i++ {
		tmp75, err := this._io.EOF()
		if err != nil {
			return err
		}
		if tmp75 {
			break
		}
		tmp76 := NewRenderwareBinaryStream()
		err = tmp76.Read(this._io, this, nil)
		if err != nil {
			return err
		}
		this.Entries = append(this.Entries, tmp76)
	}
	return err
}
func (this *RenderwareBinaryStream_ListWithHeader) Version() (v int, err error) {
	if (this._f_version) {
		return this.version, nil
	}
	var tmp77 int;
	if ((this.LibraryIdStamp & uint32(4294901760)) != 0) {
		tmp77 = ((((this.LibraryIdStamp >> 14) & 261888) + 196608) | ((this.LibraryIdStamp >> 16) & 63))
	} else {
		tmp77 = (this.LibraryIdStamp << 8)
	}
	this.version = int(tmp77)
	this._f_version = true
	return this.version, nil
}
type RenderwareBinaryStream_Triangle struct {
	Vertex2 uint16
	Vertex1 uint16
	MaterialId uint16
	Vertex3 uint16
	_io *kaitai.Stream
	_root *RenderwareBinaryStream
	_parent *RenderwareBinaryStream_GeometryNonNative
}
func NewRenderwareBinaryStream_Triangle() *RenderwareBinaryStream_Triangle {
	return &RenderwareBinaryStream_Triangle{
	}
}

func (this *RenderwareBinaryStream_Triangle) Read(io *kaitai.Stream, parent *RenderwareBinaryStream_GeometryNonNative, root *RenderwareBinaryStream) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp78, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.Vertex2 = uint16(tmp78)
	tmp79, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.Vertex1 = uint16(tmp79)
	tmp80, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.MaterialId = uint16(tmp80)
	tmp81, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.Vertex3 = uint16(tmp81)
	return err
}

/**
 * @see <a href="https://gtamods.com/wiki/Frame_List_(RW_Section)#Structure">Source</a>
 */
type RenderwareBinaryStream_Frame struct {
	RotationMatrix *RenderwareBinaryStream_Matrix
	Position *RenderwareBinaryStream_Vector3d
	CurFrameIdx int32
	MatrixCreationFlags uint32
	_io *kaitai.Stream
	_root *RenderwareBinaryStream
	_parent *RenderwareBinaryStream_StructFrameList
}
func NewRenderwareBinaryStream_Frame() *RenderwareBinaryStream_Frame {
	return &RenderwareBinaryStream_Frame{
	}
}

func (this *RenderwareBinaryStream_Frame) Read(io *kaitai.Stream, parent *RenderwareBinaryStream_StructFrameList, root *RenderwareBinaryStream) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp82 := NewRenderwareBinaryStream_Matrix()
	err = tmp82.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.RotationMatrix = tmp82
	tmp83 := NewRenderwareBinaryStream_Vector3d()
	err = tmp83.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Position = tmp83
	tmp84, err := this._io.ReadS4le()
	if err != nil {
		return err
	}
	this.CurFrameIdx = int32(tmp84)
	tmp85, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.MatrixCreationFlags = uint32(tmp85)
	return err
}
type RenderwareBinaryStream_TexCoord struct {
	U float32
	V float32
	_io *kaitai.Stream
	_root *RenderwareBinaryStream
	_parent *RenderwareBinaryStream_GeometryNonNative
}
func NewRenderwareBinaryStream_TexCoord() *RenderwareBinaryStream_TexCoord {
	return &RenderwareBinaryStream_TexCoord{
	}
}

func (this *RenderwareBinaryStream_TexCoord) Read(io *kaitai.Stream, parent *RenderwareBinaryStream_GeometryNonNative, root *RenderwareBinaryStream) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp86, err := this._io.ReadF4le()
	if err != nil {
		return err
	}
	this.U = float32(tmp86)
	tmp87, err := this._io.ReadF4le()
	if err != nil {
		return err
	}
	this.V = float32(tmp87)
	return err
}
type RenderwareBinaryStream_StructTextureDictionary struct {
	NumTextures uint32
	_io *kaitai.Stream
	_root *RenderwareBinaryStream
	_parent *RenderwareBinaryStream_ListWithHeader
}
func NewRenderwareBinaryStream_StructTextureDictionary() *RenderwareBinaryStream_StructTextureDictionary {
	return &RenderwareBinaryStream_StructTextureDictionary{
	}
}

func (this *RenderwareBinaryStream_StructTextureDictionary) Read(io *kaitai.Stream, parent *RenderwareBinaryStream_ListWithHeader, root *RenderwareBinaryStream) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp88, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.NumTextures = uint32(tmp88)
	return err
}
