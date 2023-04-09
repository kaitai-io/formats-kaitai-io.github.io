# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.009_000;

########################################################################
package RenderwareBinaryStream;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

our $SECTIONS_STRUCT = 1;
our $SECTIONS_STRING = 2;
our $SECTIONS_EXTENSION = 3;
our $SECTIONS_CAMERA = 5;
our $SECTIONS_TEXTURE = 6;
our $SECTIONS_MATERIAL = 7;
our $SECTIONS_MATERIAL_LIST = 8;
our $SECTIONS_ATOMIC_SECTION = 9;
our $SECTIONS_PLANE_SECTION = 10;
our $SECTIONS_WORLD = 11;
our $SECTIONS_SPLINE = 12;
our $SECTIONS_MATRIX = 13;
our $SECTIONS_FRAME_LIST = 14;
our $SECTIONS_GEOMETRY = 15;
our $SECTIONS_CLUMP = 16;
our $SECTIONS_LIGHT = 18;
our $SECTIONS_UNICODE_STRING = 19;
our $SECTIONS_ATOMIC = 20;
our $SECTIONS_TEXTURE_NATIVE = 21;
our $SECTIONS_TEXTURE_DICTIONARY = 22;
our $SECTIONS_ANIMATION_DATABASE = 23;
our $SECTIONS_IMAGE = 24;
our $SECTIONS_SKIN_ANIMATION = 25;
our $SECTIONS_GEOMETRY_LIST = 26;
our $SECTIONS_ANIM_ANIMATION = 27;
our $SECTIONS_TEAM = 28;
our $SECTIONS_CROWD = 29;
our $SECTIONS_DELTA_MORPH_ANIMATION = 30;
our $SECTIONS_RIGHT_TO_RENDER = 31;
our $SECTIONS_MULTITEXTURE_EFFECT_NATIVE = 32;
our $SECTIONS_MULTITEXTURE_EFFECT_DICTIONARY = 33;
our $SECTIONS_TEAM_DICTIONARY = 34;
our $SECTIONS_PLATFORM_INDEPENDENT_TEXTURE_DICTIONARY = 35;
our $SECTIONS_TABLE_OF_CONTENTS = 36;
our $SECTIONS_PARTICLE_STANDARD_GLOBAL_DATA = 37;
our $SECTIONS_ALTPIPE = 38;
our $SECTIONS_PLATFORM_INDEPENDENT_PEDS = 39;
our $SECTIONS_PATCH_MESH = 40;
our $SECTIONS_CHUNK_GROUP_START = 41;
our $SECTIONS_CHUNK_GROUP_END = 42;
our $SECTIONS_UV_ANIMATION_DICTIONARY = 43;
our $SECTIONS_COLL_TREE = 44;
our $SECTIONS_METRICS_PLG = 257;
our $SECTIONS_SPLINE_PLG = 258;
our $SECTIONS_STEREO_PLG = 259;
our $SECTIONS_VRML_PLG = 260;
our $SECTIONS_MORPH_PLG = 261;
our $SECTIONS_PVS_PLG = 262;
our $SECTIONS_MEMORY_LEAK_PLG = 263;
our $SECTIONS_ANIMATION_PLG = 264;
our $SECTIONS_GLOSS_PLG = 265;
our $SECTIONS_LOGO_PLG = 266;
our $SECTIONS_MEMORY_INFO_PLG = 267;
our $SECTIONS_RANDOM_PLG = 268;
our $SECTIONS_PNG_IMAGE_PLG = 269;
our $SECTIONS_BONE_PLG = 270;
our $SECTIONS_VRML_ANIM_PLG = 271;
our $SECTIONS_SKY_MIPMAP_VAL = 272;
our $SECTIONS_MRM_PLG = 273;
our $SECTIONS_LOD_ATOMIC_PLG = 274;
our $SECTIONS_ME_PLG = 275;
our $SECTIONS_LIGHTMAP_PLG = 276;
our $SECTIONS_REFINE_PLG = 277;
our $SECTIONS_SKIN_PLG = 278;
our $SECTIONS_LABEL_PLG = 279;
our $SECTIONS_PARTICLES_PLG = 280;
our $SECTIONS_GEOMTX_PLG = 281;
our $SECTIONS_SYNTH_CORE_PLG = 282;
our $SECTIONS_STQPP_PLG = 283;
our $SECTIONS_PART_PP_PLG = 284;
our $SECTIONS_COLLISION_PLG = 285;
our $SECTIONS_HANIM_PLG = 286;
our $SECTIONS_USER_DATA_PLG = 287;
our $SECTIONS_MATERIAL_EFFECTS_PLG = 288;
our $SECTIONS_PARTICLE_SYSTEM_PLG = 289;
our $SECTIONS_DELTA_MORPH_PLG = 290;
our $SECTIONS_PATCH_PLG = 291;
our $SECTIONS_TEAM_PLG = 292;
our $SECTIONS_CROWD_PP_PLG = 293;
our $SECTIONS_MIP_SPLIT_PLG = 294;
our $SECTIONS_ANISOTROPY_PLG = 295;
our $SECTIONS_GCN_MATERIAL_PLG = 297;
our $SECTIONS_GEOMETRIC_PVS_PLG = 298;
our $SECTIONS_XBOX_MATERIAL_PLG = 299;
our $SECTIONS_MULTI_TEXTURE_PLG = 300;
our $SECTIONS_CHAIN_PLG = 301;
our $SECTIONS_TOON_PLG = 302;
our $SECTIONS_PTANK_PLG = 303;
our $SECTIONS_PARTICLE_STANDARD_PLG = 304;
our $SECTIONS_PDS_PLG = 305;
our $SECTIONS_PRTADV_PLG = 306;
our $SECTIONS_NORMAL_MAP_PLG = 307;
our $SECTIONS_ADC_PLG = 308;
our $SECTIONS_UV_ANIMATION_PLG = 309;
our $SECTIONS_CHARACTER_SET_PLG = 384;
our $SECTIONS_NOHS_WORLD_PLG = 385;
our $SECTIONS_IMPORT_UTIL_PLG = 386;
our $SECTIONS_SLERP_PLG = 387;
our $SECTIONS_OPTIM_PLG = 388;
our $SECTIONS_TL_WORLD_PLG = 389;
our $SECTIONS_DATABASE_PLG = 390;
our $SECTIONS_RAYTRACE_PLG = 391;
our $SECTIONS_RAY_PLG = 392;
our $SECTIONS_LIBRARY_PLG = 393;
our $SECTIONS_PLG_2D = 400;
our $SECTIONS_TILE_RENDER_PLG = 401;
our $SECTIONS_JPEG_IMAGE_PLG = 402;
our $SECTIONS_TGA_IMAGE_PLG = 403;
our $SECTIONS_GIF_IMAGE_PLG = 404;
our $SECTIONS_QUAT_PLG = 405;
our $SECTIONS_SPLINE_PVS_PLG = 406;
our $SECTIONS_MIPMAP_PLG = 407;
our $SECTIONS_MIPMAPK_PLG = 408;
our $SECTIONS_FONT_2D = 409;
our $SECTIONS_INTERSECTION_PLG = 410;
our $SECTIONS_TIFF_IMAGE_PLG = 411;
our $SECTIONS_PICK_PLG = 412;
our $SECTIONS_BMP_IMAGE_PLG = 413;
our $SECTIONS_RAS_IMAGE_PLG = 414;
our $SECTIONS_SKIN_FX_PLG = 415;
our $SECTIONS_VCAT_PLG = 416;
our $SECTIONS_PATH_2D = 417;
our $SECTIONS_BRUSH_2D = 418;
our $SECTIONS_OBJECT_2D = 419;
our $SECTIONS_SHAPE_2D = 420;
our $SECTIONS_SCENE_2D = 421;
our $SECTIONS_PICK_REGION_2D = 422;
our $SECTIONS_OBJECT_STRING_2D = 423;
our $SECTIONS_ANIMATION_PLG_2D = 424;
our $SECTIONS_ANIMATION_2D = 425;
our $SECTIONS_KEYFRAME_2D = 432;
our $SECTIONS_MAESTRO_2D = 433;
our $SECTIONS_BARYCENTRIC = 434;
our $SECTIONS_PLATFORM_INDEPENDENT_TEXTURE_DICTIONARY_TK = 435;
our $SECTIONS_TOC_TK = 436;
our $SECTIONS_TPL_TK = 437;
our $SECTIONS_ALTPIPE_TK = 438;
our $SECTIONS_ANIMATION_TK = 439;
our $SECTIONS_SKIN_SPLIT_TOOKIT = 440;
our $SECTIONS_COMPRESSED_KEY_TK = 441;
our $SECTIONS_GEOMETRY_CONDITIONING_PLG = 442;
our $SECTIONS_WING_PLG = 443;
our $SECTIONS_GENERIC_PIPELINE_TK = 444;
our $SECTIONS_LIGHTMAP_CONVERSION_TK = 445;
our $SECTIONS_FILESYSTEM_PLG = 446;
our $SECTIONS_DICTIONARY_TK = 447;
our $SECTIONS_UV_ANIMATION_LINEAR = 448;
our $SECTIONS_UV_ANIMATION_PARAMETER = 449;
our $SECTIONS_BIN_MESH_PLG = 1294;
our $SECTIONS_NATIVE_DATA_PLG = 1296;
our $SECTIONS_ZMODELER_LOCK = 61982;
our $SECTIONS_ATOMIC_VISIBILITY_DISTANCE = 39055872;
our $SECTIONS_CLUMP_VISIBILITY_DISTANCE = 39055873;
our $SECTIONS_FRAME_VISIBILITY_DISTANCE = 39055874;
our $SECTIONS_PIPELINE_SET = 39056115;
our $SECTIONS_UNUSED_5 = 39056116;
our $SECTIONS_TEXDICTIONARY_LINK = 39056117;
our $SECTIONS_SPECULAR_MATERIAL = 39056118;
our $SECTIONS_UNUSED_8 = 39056119;
our $SECTIONS_EFFECT_2D = 39056120;
our $SECTIONS_EXTRA_VERT_COLOUR = 39056121;
our $SECTIONS_COLLISION_MODEL = 39056122;
our $SECTIONS_GTA_HANIM = 39056123;
our $SECTIONS_REFLECTION_MATERIAL = 39056124;
our $SECTIONS_BREAKABLE = 39056125;
our $SECTIONS_FRAME = 39056126;
our $SECTIONS_UNUSED_16 = 39056127;

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{code} = $self->{_io}->read_u4le();
    $self->{size} = $self->{_io}->read_u4le();
    $self->{library_id_stamp} = $self->{_io}->read_u4le();
    my $_on = $self->code();
    if ($_on == $RenderwareBinaryStream::SECTIONS_ATOMIC) {
        $self->{_raw_body} = $self->{_io}->read_bytes($self->size());
        my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
        $self->{body} = RenderwareBinaryStream::ListWithHeader->new($io__raw_body, $self, $self->{_root});
    }
    elsif ($_on == $RenderwareBinaryStream::SECTIONS_GEOMETRY) {
        $self->{_raw_body} = $self->{_io}->read_bytes($self->size());
        my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
        $self->{body} = RenderwareBinaryStream::ListWithHeader->new($io__raw_body, $self, $self->{_root});
    }
    elsif ($_on == $RenderwareBinaryStream::SECTIONS_TEXTURE_DICTIONARY) {
        $self->{_raw_body} = $self->{_io}->read_bytes($self->size());
        my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
        $self->{body} = RenderwareBinaryStream::ListWithHeader->new($io__raw_body, $self, $self->{_root});
    }
    elsif ($_on == $RenderwareBinaryStream::SECTIONS_GEOMETRY_LIST) {
        $self->{_raw_body} = $self->{_io}->read_bytes($self->size());
        my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
        $self->{body} = RenderwareBinaryStream::ListWithHeader->new($io__raw_body, $self, $self->{_root});
    }
    elsif ($_on == $RenderwareBinaryStream::SECTIONS_TEXTURE_NATIVE) {
        $self->{_raw_body} = $self->{_io}->read_bytes($self->size());
        my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
        $self->{body} = RenderwareBinaryStream::ListWithHeader->new($io__raw_body, $self, $self->{_root});
    }
    elsif ($_on == $RenderwareBinaryStream::SECTIONS_CLUMP) {
        $self->{_raw_body} = $self->{_io}->read_bytes($self->size());
        my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
        $self->{body} = RenderwareBinaryStream::ListWithHeader->new($io__raw_body, $self, $self->{_root});
    }
    elsif ($_on == $RenderwareBinaryStream::SECTIONS_FRAME_LIST) {
        $self->{_raw_body} = $self->{_io}->read_bytes($self->size());
        my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
        $self->{body} = RenderwareBinaryStream::ListWithHeader->new($io__raw_body, $self, $self->{_root});
    }
    else {
        $self->{body} = $self->{_io}->read_bytes($self->size());
    }
}

sub version {
    my ($self) = @_;
    return $self->{version} if ($self->{version});
    $self->{version} = (($self->library_id_stamp() & 4294901760) != 0 ? (((($self->library_id_stamp() >> 14) & 261888) + 196608) | (($self->library_id_stamp() >> 16) & 63)) : ($self->library_id_stamp() << 8));
    return $self->{version};
}

sub code {
    my ($self) = @_;
    return $self->{code};
}

sub size {
    my ($self) = @_;
    return $self->{size};
}

sub library_id_stamp {
    my ($self) = @_;
    return $self->{library_id_stamp};
}

sub body {
    my ($self) = @_;
    return $self->{body};
}

sub _raw_body {
    my ($self) = @_;
    return $self->{_raw_body};
}

########################################################################
package RenderwareBinaryStream::StructClump;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{num_atomics} = $self->{_io}->read_u4le();
    if ($self->_parent()->version() >= 208896) {
        $self->{num_lights} = $self->{_io}->read_u4le();
    }
    if ($self->_parent()->version() >= 208896) {
        $self->{num_cameras} = $self->{_io}->read_u4le();
    }
}

sub num_atomics {
    my ($self) = @_;
    return $self->{num_atomics};
}

sub num_lights {
    my ($self) = @_;
    return $self->{num_lights};
}

sub num_cameras {
    my ($self) = @_;
    return $self->{num_cameras};
}

########################################################################
package RenderwareBinaryStream::StructGeometry;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{format} = $self->{_io}->read_u4le();
    $self->{num_triangles} = $self->{_io}->read_u4le();
    $self->{num_vertices} = $self->{_io}->read_u4le();
    $self->{num_morph_targets} = $self->{_io}->read_u4le();
    if ($self->_parent()->version() < 212992) {
        $self->{surf_prop} = RenderwareBinaryStream::SurfaceProperties->new($self->{_io}, $self, $self->{_root});
    }
    if (!($self->is_native())) {
        $self->{geometry} = RenderwareBinaryStream::GeometryNonNative->new($self->{_io}, $self, $self->{_root});
    }
    $self->{morph_targets} = ();
    my $n_morph_targets = $self->num_morph_targets();
    for (my $i = 0; $i < $n_morph_targets; $i++) {
        push @{$self->{morph_targets}}, RenderwareBinaryStream::MorphTarget->new($self->{_io}, $self, $self->{_root});
    }
}

sub num_uv_layers_raw {
    my ($self) = @_;
    return $self->{num_uv_layers_raw} if ($self->{num_uv_layers_raw});
    $self->{num_uv_layers_raw} = (($self->format() & 16711680) >> 16);
    return $self->{num_uv_layers_raw};
}

sub is_textured {
    my ($self) = @_;
    return $self->{is_textured} if ($self->{is_textured});
    $self->{is_textured} = ($self->format() & 4) != 0;
    return $self->{is_textured};
}

sub is_native {
    my ($self) = @_;
    return $self->{is_native} if ($self->{is_native});
    $self->{is_native} = ($self->format() & 16777216) != 0;
    return $self->{is_native};
}

sub num_uv_layers {
    my ($self) = @_;
    return $self->{num_uv_layers} if ($self->{num_uv_layers});
    $self->{num_uv_layers} = ($self->num_uv_layers_raw() == 0 ? ($self->is_textured2() ? 2 : ($self->is_textured() ? 1 : 0)) : $self->num_uv_layers_raw());
    return $self->{num_uv_layers};
}

sub is_textured2 {
    my ($self) = @_;
    return $self->{is_textured2} if ($self->{is_textured2});
    $self->{is_textured2} = ($self->format() & 128) != 0;
    return $self->{is_textured2};
}

sub is_prelit {
    my ($self) = @_;
    return $self->{is_prelit} if ($self->{is_prelit});
    $self->{is_prelit} = ($self->format() & 8) != 0;
    return $self->{is_prelit};
}

sub format {
    my ($self) = @_;
    return $self->{format};
}

sub num_triangles {
    my ($self) = @_;
    return $self->{num_triangles};
}

sub num_vertices {
    my ($self) = @_;
    return $self->{num_vertices};
}

sub num_morph_targets {
    my ($self) = @_;
    return $self->{num_morph_targets};
}

sub surf_prop {
    my ($self) = @_;
    return $self->{surf_prop};
}

sub geometry {
    my ($self) = @_;
    return $self->{geometry};
}

sub morph_targets {
    my ($self) = @_;
    return $self->{morph_targets};
}

########################################################################
package RenderwareBinaryStream::GeometryNonNative;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    if ($self->_parent()->is_prelit()) {
        $self->{prelit_colors} = ();
        my $n_prelit_colors = $self->_parent()->num_vertices();
        for (my $i = 0; $i < $n_prelit_colors; $i++) {
            push @{$self->{prelit_colors}}, RenderwareBinaryStream::Rgba->new($self->{_io}, $self, $self->{_root});
        }
    }
    $self->{uv_layers} = ();
    my $n_uv_layers = $self->_parent()->num_uv_layers();
    for (my $i = 0; $i < $n_uv_layers; $i++) {
        push @{$self->{uv_layers}}, RenderwareBinaryStream::UvLayer->new($self->{_io}, $self, $self->{_root});
    }
    $self->{triangles} = ();
    my $n_triangles = $self->_parent()->num_triangles();
    for (my $i = 0; $i < $n_triangles; $i++) {
        push @{$self->{triangles}}, RenderwareBinaryStream::Triangle->new($self->{_io}, $self, $self->{_root});
    }
}

sub prelit_colors {
    my ($self) = @_;
    return $self->{prelit_colors};
}

sub uv_layers {
    my ($self) = @_;
    return $self->{uv_layers};
}

sub triangles {
    my ($self) = @_;
    return $self->{triangles};
}

########################################################################
package RenderwareBinaryStream::StructGeometryList;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{num_geometries} = $self->{_io}->read_u4le();
}

sub num_geometries {
    my ($self) = @_;
    return $self->{num_geometries};
}

########################################################################
package RenderwareBinaryStream::Rgba;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{r} = $self->{_io}->read_u1();
    $self->{g} = $self->{_io}->read_u1();
    $self->{b} = $self->{_io}->read_u1();
    $self->{a} = $self->{_io}->read_u1();
}

sub r {
    my ($self) = @_;
    return $self->{r};
}

sub g {
    my ($self) = @_;
    return $self->{g};
}

sub b {
    my ($self) = @_;
    return $self->{b};
}

sub a {
    my ($self) = @_;
    return $self->{a};
}

########################################################################
package RenderwareBinaryStream::Sphere;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{x} = $self->{_io}->read_f4le();
    $self->{y} = $self->{_io}->read_f4le();
    $self->{z} = $self->{_io}->read_f4le();
    $self->{radius} = $self->{_io}->read_f4le();
}

sub x {
    my ($self) = @_;
    return $self->{x};
}

sub y {
    my ($self) = @_;
    return $self->{y};
}

sub z {
    my ($self) = @_;
    return $self->{z};
}

sub radius {
    my ($self) = @_;
    return $self->{radius};
}

########################################################################
package RenderwareBinaryStream::MorphTarget;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{bounding_sphere} = RenderwareBinaryStream::Sphere->new($self->{_io}, $self, $self->{_root});
    $self->{has_vertices} = $self->{_io}->read_u4le();
    $self->{has_normals} = $self->{_io}->read_u4le();
    if ($self->has_vertices() != 0) {
        $self->{vertices} = ();
        my $n_vertices = $self->_parent()->num_vertices();
        for (my $i = 0; $i < $n_vertices; $i++) {
            push @{$self->{vertices}}, RenderwareBinaryStream::Vector3d->new($self->{_io}, $self, $self->{_root});
        }
    }
    if ($self->has_normals() != 0) {
        $self->{normals} = ();
        my $n_normals = $self->_parent()->num_vertices();
        for (my $i = 0; $i < $n_normals; $i++) {
            push @{$self->{normals}}, RenderwareBinaryStream::Vector3d->new($self->{_io}, $self, $self->{_root});
        }
    }
}

sub bounding_sphere {
    my ($self) = @_;
    return $self->{bounding_sphere};
}

sub has_vertices {
    my ($self) = @_;
    return $self->{has_vertices};
}

sub has_normals {
    my ($self) = @_;
    return $self->{has_normals};
}

sub vertices {
    my ($self) = @_;
    return $self->{vertices};
}

sub normals {
    my ($self) = @_;
    return $self->{normals};
}

########################################################################
package RenderwareBinaryStream::StructAtomic;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{frame_index} = $self->{_io}->read_u4le();
    $self->{geometry_index} = $self->{_io}->read_u4le();
    $self->{flag_render} = $self->{_io}->read_bits_int_le(1);
    $self->{_unnamed3} = $self->{_io}->read_bits_int_le(1);
    $self->{flag_collision_test} = $self->{_io}->read_bits_int_le(1);
    $self->{_unnamed5} = $self->{_io}->read_bits_int_le(29);
    $self->{_io}->align_to_byte();
    $self->{unused} = $self->{_io}->read_u4le();
}

sub frame_index {
    my ($self) = @_;
    return $self->{frame_index};
}

sub geometry_index {
    my ($self) = @_;
    return $self->{geometry_index};
}

sub flag_render {
    my ($self) = @_;
    return $self->{flag_render};
}

sub _unnamed3 {
    my ($self) = @_;
    return $self->{_unnamed3};
}

sub flag_collision_test {
    my ($self) = @_;
    return $self->{flag_collision_test};
}

sub _unnamed5 {
    my ($self) = @_;
    return $self->{_unnamed5};
}

sub unused {
    my ($self) = @_;
    return $self->{unused};
}

########################################################################
package RenderwareBinaryStream::SurfaceProperties;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{ambient} = $self->{_io}->read_f4le();
    $self->{specular} = $self->{_io}->read_f4le();
    $self->{diffuse} = $self->{_io}->read_f4le();
}

sub ambient {
    my ($self) = @_;
    return $self->{ambient};
}

sub specular {
    my ($self) = @_;
    return $self->{specular};
}

sub diffuse {
    my ($self) = @_;
    return $self->{diffuse};
}

########################################################################
package RenderwareBinaryStream::StructFrameList;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{num_frames} = $self->{_io}->read_u4le();
    $self->{frames} = ();
    my $n_frames = $self->num_frames();
    for (my $i = 0; $i < $n_frames; $i++) {
        push @{$self->{frames}}, RenderwareBinaryStream::Frame->new($self->{_io}, $self, $self->{_root});
    }
}

sub num_frames {
    my ($self) = @_;
    return $self->{num_frames};
}

sub frames {
    my ($self) = @_;
    return $self->{frames};
}

########################################################################
package RenderwareBinaryStream::Matrix;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{entries} = ();
    my $n_entries = 3;
    for (my $i = 0; $i < $n_entries; $i++) {
        push @{$self->{entries}}, RenderwareBinaryStream::Vector3d->new($self->{_io}, $self, $self->{_root});
    }
}

sub entries {
    my ($self) = @_;
    return $self->{entries};
}

########################################################################
package RenderwareBinaryStream::Vector3d;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{x} = $self->{_io}->read_f4le();
    $self->{y} = $self->{_io}->read_f4le();
    $self->{z} = $self->{_io}->read_f4le();
}

sub x {
    my ($self) = @_;
    return $self->{x};
}

sub y {
    my ($self) = @_;
    return $self->{y};
}

sub z {
    my ($self) = @_;
    return $self->{z};
}

########################################################################
package RenderwareBinaryStream::ListWithHeader;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{code} = $self->{_io}->read_bytes(4);
    $self->{header_size} = $self->{_io}->read_u4le();
    $self->{library_id_stamp} = $self->{_io}->read_u4le();
    my $_on = $self->_parent()->code();
    if ($_on == $RenderwareBinaryStream::SECTIONS_ATOMIC) {
        $self->{_raw_header} = $self->{_io}->read_bytes($self->header_size());
        my $io__raw_header = IO::KaitaiStruct::Stream->new($self->{_raw_header});
        $self->{header} = RenderwareBinaryStream::StructAtomic->new($io__raw_header, $self, $self->{_root});
    }
    elsif ($_on == $RenderwareBinaryStream::SECTIONS_GEOMETRY) {
        $self->{_raw_header} = $self->{_io}->read_bytes($self->header_size());
        my $io__raw_header = IO::KaitaiStruct::Stream->new($self->{_raw_header});
        $self->{header} = RenderwareBinaryStream::StructGeometry->new($io__raw_header, $self, $self->{_root});
    }
    elsif ($_on == $RenderwareBinaryStream::SECTIONS_TEXTURE_DICTIONARY) {
        $self->{_raw_header} = $self->{_io}->read_bytes($self->header_size());
        my $io__raw_header = IO::KaitaiStruct::Stream->new($self->{_raw_header});
        $self->{header} = RenderwareBinaryStream::StructTextureDictionary->new($io__raw_header, $self, $self->{_root});
    }
    elsif ($_on == $RenderwareBinaryStream::SECTIONS_GEOMETRY_LIST) {
        $self->{_raw_header} = $self->{_io}->read_bytes($self->header_size());
        my $io__raw_header = IO::KaitaiStruct::Stream->new($self->{_raw_header});
        $self->{header} = RenderwareBinaryStream::StructGeometryList->new($io__raw_header, $self, $self->{_root});
    }
    elsif ($_on == $RenderwareBinaryStream::SECTIONS_CLUMP) {
        $self->{_raw_header} = $self->{_io}->read_bytes($self->header_size());
        my $io__raw_header = IO::KaitaiStruct::Stream->new($self->{_raw_header});
        $self->{header} = RenderwareBinaryStream::StructClump->new($io__raw_header, $self, $self->{_root});
    }
    elsif ($_on == $RenderwareBinaryStream::SECTIONS_FRAME_LIST) {
        $self->{_raw_header} = $self->{_io}->read_bytes($self->header_size());
        my $io__raw_header = IO::KaitaiStruct::Stream->new($self->{_raw_header});
        $self->{header} = RenderwareBinaryStream::StructFrameList->new($io__raw_header, $self, $self->{_root});
    }
    else {
        $self->{header} = $self->{_io}->read_bytes($self->header_size());
    }
    $self->{entries} = ();
    while (!$self->{_io}->is_eof()) {
        push @{$self->{entries}}, RenderwareBinaryStream->new($self->{_io});
    }
}

sub version {
    my ($self) = @_;
    return $self->{version} if ($self->{version});
    $self->{version} = (($self->library_id_stamp() & 4294901760) != 0 ? (((($self->library_id_stamp() >> 14) & 261888) + 196608) | (($self->library_id_stamp() >> 16) & 63)) : ($self->library_id_stamp() << 8));
    return $self->{version};
}

sub code {
    my ($self) = @_;
    return $self->{code};
}

sub header_size {
    my ($self) = @_;
    return $self->{header_size};
}

sub library_id_stamp {
    my ($self) = @_;
    return $self->{library_id_stamp};
}

sub header {
    my ($self) = @_;
    return $self->{header};
}

sub entries {
    my ($self) = @_;
    return $self->{entries};
}

sub _raw_header {
    my ($self) = @_;
    return $self->{_raw_header};
}

########################################################################
package RenderwareBinaryStream::Triangle;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{vertex2} = $self->{_io}->read_u2le();
    $self->{vertex1} = $self->{_io}->read_u2le();
    $self->{material_id} = $self->{_io}->read_u2le();
    $self->{vertex3} = $self->{_io}->read_u2le();
}

sub vertex2 {
    my ($self) = @_;
    return $self->{vertex2};
}

sub vertex1 {
    my ($self) = @_;
    return $self->{vertex1};
}

sub material_id {
    my ($self) = @_;
    return $self->{material_id};
}

sub vertex3 {
    my ($self) = @_;
    return $self->{vertex3};
}

########################################################################
package RenderwareBinaryStream::Frame;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{rotation_matrix} = RenderwareBinaryStream::Matrix->new($self->{_io}, $self, $self->{_root});
    $self->{position} = RenderwareBinaryStream::Vector3d->new($self->{_io}, $self, $self->{_root});
    $self->{cur_frame_idx} = $self->{_io}->read_s4le();
    $self->{matrix_creation_flags} = $self->{_io}->read_u4le();
}

sub rotation_matrix {
    my ($self) = @_;
    return $self->{rotation_matrix};
}

sub position {
    my ($self) = @_;
    return $self->{position};
}

sub cur_frame_idx {
    my ($self) = @_;
    return $self->{cur_frame_idx};
}

sub matrix_creation_flags {
    my ($self) = @_;
    return $self->{matrix_creation_flags};
}

########################################################################
package RenderwareBinaryStream::TexCoord;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{u} = $self->{_io}->read_f4le();
    $self->{v} = $self->{_io}->read_f4le();
}

sub u {
    my ($self) = @_;
    return $self->{u};
}

sub v {
    my ($self) = @_;
    return $self->{v};
}

########################################################################
package RenderwareBinaryStream::UvLayer;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{tex_coords} = ();
    my $n_tex_coords = $self->num_vertices();
    for (my $i = 0; $i < $n_tex_coords; $i++) {
        push @{$self->{tex_coords}}, RenderwareBinaryStream::TexCoord->new($self->{_io}, $self, $self->{_root});
    }
}

sub tex_coords {
    my ($self) = @_;
    return $self->{tex_coords};
}

sub num_vertices {
    my ($self) = @_;
    return $self->{num_vertices};
}

########################################################################
package RenderwareBinaryStream::StructTextureDictionary;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{num_textures} = $self->{_io}->read_u4le();
}

sub num_textures {
    my ($self) = @_;
    return $self->{num_textures};
}

1;
