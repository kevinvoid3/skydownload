-------------------------------------------------------------------------------
-- Shader Resources
-------------------------------------------------------------------------------

-- Post processing shaders
resource "Shader" "Resample"					{ vs = "Resample.vert", fs = "Resample.frag" }

-- this doesn't need a frag shader, but Vulkan Mali can't handle
resource "Shader" "VisibilityMeshDraw"		    { vs = "VisibilityMeshDraw.vert", fs="VisibilityMeshDraw.frag", defines="" }

-- FragSBO can only use writeable SSBO in fragment shader for Android Mali
resource "Shader" "VisibilityQuery"		   	    { vs = "VisibilityQuery.vert", defines="NO_OUTPUTS_SSBO" }
resource "Shader" "VisibilityQueryFragSSBO"		{ vs = "VisibilityQuery.vert", fs = "VisibilityQuery.frag", defines="FRAG_SSBO" }

resource "Shader" "VisibilityQueryMin"		    { vs = "VisibilityQuery.vert", defines="NO_OUTPUTS_SSBO SAMPLER_MINMAX" }
resource "Shader" "VisibilityQueryMinFragSSBO"  { vs = "VisibilityQuery.vert", fs = "VisibilityQuery.frag", defines="FRAG_SSBO SAMPLER_MINMAX" }

resource "Shader" "VisibilityDownMin"			{ vs = "QuadFS.vert", fs = "DepthDownsample.frag", defines="TO_HALF SAMPLER_MINMAX" }
resource "Shader" "VisibilityDown"				{ vs = "QuadFS.vert", fs = "DepthDownsample.frag", defines="TO_HALF" }

resource "Shader" "CloudDepth"					{ vs = "QuadFS.vert", fs = "DepthDownsample.frag", cs = "DepthDownsample.comp", defines="TO_QUARTER" }

resource "Shader" "CloudFluffySuperCoarseUndulate"{ vs = "QuadFS.vert", fs = "CloudFluffy.frag", cs = "CloudFluffy.comp", defines="CLOUD_JITTER SUPER_COARSE UNDULATE SINE_TEXTURE" }
resource "Shader" "CloudFluffyCoarseUndulate"	{ vs = "QuadFS.vert", fs = "CloudFluffy.frag", cs = "CloudFluffy.comp", defines="CLOUD_JITTER COARSE UNDULATE SINE_TEXTURE" }
resource "Shader" "CloudFluffyUndulate"			{ vs = "QuadFS.vert", fs = "CloudFluffy.frag", cs = "CloudFluffy.comp", defines="CLOUD_JITTER UNDULATE SINE_TEXTURE" }
resource "Shader" "CloudFluffySuperCoarse"		{ vs = "QuadFS.vert", fs = "CloudFluffy.frag", cs = "CloudFluffy.comp", defines="CLOUD_JITTER SUPER_COARSE" }
resource "Shader" "CloudFluffyCoarse"			{ vs = "QuadFS.vert", fs = "CloudFluffy.frag", cs = "CloudFluffy.comp", defines="CLOUD_JITTER COARSE" }
resource "Shader" "CloudFluffy"					{ vs = "QuadFS.vert", fs = "CloudFluffy.frag", cs = "CloudFluffy.comp", defines="CLOUD_JITTER" }
resource "Shader" "CloudFluffyInfiniteScroll"	{ vs = "QuadFS.vert", fs = "CloudFluffy.frag", cs = "CloudFluffy.comp", defines="CLOUD_JITTER INFINITE_SCROLL" }
resource "Shader" "CloudComplexity"				{ vs = "QuadFS.vert", fs = "CloudFluffy.frag", cs = "CloudFluffy.comp", defines="CLOUD_JITTER COMPLEXITY" }
resource "Shader" "CloudBlur"					{ vs = "QuadFS.vert", fs = "CloudBlur.frag", defines="" }

resource "Shader" "BlendedDepth"				{ vs = "QuadFS.vert", fs = "BlendedDepth.frag", defines="" }
resource "Shader" "RainDrop"					{ group = "Blended", vs = "RainDrop.vert", fs = "RainDrop.frag", defines = "" }
resource "Shader" "FogVolume"					{ group = "FogVolume", vs = "FogVolume.vert", fs = "FogVolume.frag", toolExport = true, defines = "" }
resource "Shader" "FogUpsampleHalf"				{ vs = "QuadFS.vert", fs = "FogUpsample.frag", defines="HALF" }
resource "Shader" "FogUpsample"					{ vs = "QuadFS.vert", fs = "FogUpsample.frag", defines="" }
resource "Shader" "FogUpsampleArtbook"			{ vs = "QuadFS.vert", fs = "FogUpsample.frag", defines="ARTBOOK" }
resource "Shader" "FogUpsampleSaturationSpheres"{ vs = "QuadFS.vert", fs = "FogUpsample.frag", defines="SATURATION_SPHERES" }
resource "Shader" "FogUpsampleCausticSpheres"	{ vs = "QuadFS.vert", fs = "FogUpsample.frag", defines="CAUSTIC_SPHERES" }
resource "Shader" "FogUpsampleAR"				{ vs = "QuadFS.vert", fs = "FogUpsample.frag", defines="AR" }
resource "Shader" "FogUpsampleScreenRainDrop"	{ vs = "QuadFS.vert", fs = "FogUpsample.frag", defines="SCREEN_RAIN_DROP" }
--resource "Shader" "FogUpsampleAO"				{ vs = "QuadFS.vert", fs = "FogUpsample.frag", defines="AO" }
resource "Shader" "FogUpsampleCheapHalf"		{ vs = "QuadFS.vert", fs = "FogUpsample.frag", defines = "CHEAP_FOG HALF" }
resource "Shader" "FogUpsampleCheap"			{ vs = "QuadFS.vert", fs = "FogUpsample.frag", defines = "CHEAP_FOG" }
--resource "Shader" "FogUpsampleCheapAO"		{ vs = "QuadFS.vert", fs = "FogUpsample.frag", defines = "CHEAP_FOG AO" }
resource "Shader" "MotionGen"					{ vs = "QuadFS.vert", fs = "MotionGen.frag", defines = "" }
resource "Shader" "MotionGenDisabled"			{ vs = "QuadFS.vert", fs = "MotionGen.frag", defines = "DISABLED" }
resource "Shader" "MotionDilate"				{ vs = "QuadFS.vert", fs = "MotionDilate.frag" }
resource "Shader" "MotionDownsample"			{ vs = "QuadFS.vert", fs = "MotionDownsample.frag" }
resource "Shader" "MotionBlur"					{ vs = "QuadFS.vert", fs = "MotionBlur.frag" }
resource "Shader" "BloomDownOld"				{ vs = "Bloom.vert", fs = "Bloom.frag", defines = "DOWN OLD_BLOOM" }
resource "Shader" "BloomUpOld"					{ vs = "Bloom.vert", fs = "Bloom.frag", defines = "UP OLD_BLOOM" }
resource "Shader" "CompositeHDR"				{ vs = "QuadFS.vert", fs = "CompositeHDR.frag", defines = "" }
resource "Shader" "TemporalAa"					{ vs = "QuadFS.vert", fs = "TemporalAa.frag" }
resource "Shader" "DepthOfField"				{ vs = "QuadFS.vert", fs = "DepthOfField.frag" }
resource "Shader" "Fxaa"						{ vs = "QuadFS.vert", fs = "Fxaa.frag" }
resource "Shader" "FxaaDisabled"				{ vs = "QuadFS.vert", fs = "Fxaa.frag", defines = "DISABLE" }
resource "Shader" "PuddleDrop"					{ vs = "Sprite.vert", fs = "PuddleSim.frag", toolExport = false, defines = "INDENT" }
resource "Shader" "PuddleSim"					{ vs = "QuadFS.vert", fs = "PuddleSim.frag", toolExport = false }
resource "Shader" "WaterSim"					{ vs = "QuadFS.vert", fs = "WaterSim.frag", cs = "WaterSim.comp", toolExport = false }
resource "Shader" "WaterSimMultiIndent"         { vs = "QuadFS.vert", fs = "WaterSim.frag", cs = "WaterSim.comp", toolExport = false, defines = "MULTI_INDENT" }
resource "Shader" "WaterSimReset"				{ vs = "QuadFS.vert", fs = "WaterSim.frag", cs = "WaterSim.comp", toolExport = false, defines = "RESET" }
--resource "Shader" "AO"							{ vs = "QuadFS.vert", fs = "AO.frag", toolExport = false, defines = "AO" }

-- Tonemapping functionality (not for general purpose or use!)
resource "Shader" "Tonemap_p3_display"			{ vs = "QuadFS.vert", fs = "Tonemap.frag", defines = "BEND P3 sRGB HUD FRAMEBUFFER" }
resource "Shader" "Tonemap_p3_display_pq"		{ vs = "QuadFS.vert", fs = "Tonemap.frag", defines = "BEND P3 PQ HUD FRAMEBUFFER" }
resource "Shader" "Tonemap_p3_linear"			{ vs = "QuadFS.vert", fs = "Tonemap.frag", defines = "BEND P3 GAMMA_10 HUD FRAMEBUFFER" }
resource "Shader" "Tonemap_p3_dci"				{ vs = "QuadFS.vert", fs = "Tonemap.frag", defines = "BEND P3 GAMMA_26 HUD FRAMEBUFFER" }
resource "Shader" "Tonemap_rec2020_pq"			{ vs = "QuadFS.vert", fs = "Tonemap.frag", defines = "BEND REC_2020 PQ HUD FRAMEBUFFER" }
resource "Shader" "Tonemap_rec709_sRGB"			{ vs = "QuadFS.vert", fs = "Tonemap.frag", defines = "BEND REC_709 sRGB HUD DEBANDING FRAMEBUFFER" }

-- Added Hud on this
resource "Shader" "Tonemap_rec709"				{ vs = "QuadFS.vert", fs = "Tonemap.frag", defines = "BEND REC_709 GAMMA_10 HUD DEBANDING FRAMEBUFFER" }

-- These now all need to combine UI
resource "Shader" "Tonemap_movie"				{ vs = "QuadFS.vert", fs = "Tonemap.frag", defines = "BEND SCREENSHOT REC_709 sRGB HUD DEBANDING BGR" }
resource "Shader" "Tonemap_screenshot"			{ vs = "QuadFS.vert", fs = "Tonemap.frag", defines = "BEND SCREENSHOT REC_709 sRGB HUD DEBANDING" }

-- These are rendering to RGB10A2, but need BGR on video which is unclear
-- put the surfaces back to BGRA10A2 and render to that.  Then remove BGR.
resource "Shader" "Tonemap_movie_hdr"			{ vs = "QuadFS.vert", fs = "Tonemap.frag", defines = "BEND SCREENSHOT REC_2020 PQ HUD DEBANDING BGR" }
resource "Shader" "Tonemap_screenshot_hdr"		{ vs = "QuadFS.vert", fs = "Tonemap.frag", defines = "BEND SCREENSHOT REC_2020 PQ HUD DEBANDING BGR" }

-- FragSBO can only use writeable SSBO in fragment shader for Android Mali
resource "Shader" "LumFeedback"					{ vs = "LumFeedback.vert", defines = "NO_OUTPUTS_SSBO" }
resource "Shader" "LumFeedbackFragSSBO"			{ vs = "LumFeedback.vert", fs = "LumFeedback.frag", defines = "FRAG_SSBO" }
resource "Shader" "DepthFeedback"				{ vs = "DepthFeedback.vert", defines = "NO_OUTPUTS_SSBO" }
resource "Shader" "DepthFeedbackFragSSBO"		{ vs = "DepthFeedback.vert", fs = "DepthFeedback.frag", defines = "FRAG_SSBO" }
resource "Shader" "VideoDownscaleFeedback"		{ vs = "VideoDownscaleFeedback.vert", defines = "NO_OUTPUTS_SSBO" }
resource "Shader" "VideoDownscaleFeedbackFragSSBO"	{ vs = "VideoDownscaleFeedback.vert", fs = "VideoDownscaleFeedback.frag", defines = "FRAG_SSBO" }

resource "Shader" "VideoProcess"				{ vs = "VideoProcess.vert", fs = "VideoProcess.frag", defines = "" }
resource "Shader" "VideoDownscale"				{ vs = "VideoProcess.vert", fs = "VideoProcess.frag", defines = "VIDEO_DOWNSCALE" }

resource "Shader" "CameraTextureProcess"		{ vs = "CameraTextureProcess.vert", fs = "CameraTextureProcess.frag", defines = "" }

-- Debug
resource "Shader" "DebugMesh"					{ vs = "DebugMesh.vert", fs = "DebugMesh.frag", defines = "" }
resource "Shader" "DebugMeshSolid"				{ vs = "DebugMeshSolid.vert", fs = "DebugMeshSolid.frag" }
resource "Shader" "DebugText"					{ vs = "DebugText.vert", fs = "DebugText.frag", defines = "FRAMEBUFFER" }
resource "Shader" "DebugLine"					{ vs = "DebugLine.vert", fs = "DebugLine.frag", defines = "" }
-- Hud lines are not drawing to framebuffer
resource "Shader" "DebugLineHud"				{ vs = "DebugLineHud.vert", fs = "DebugLineHud.frag", defines = "" }


resource "Shader" "SpiritProps"					{ group = "Opaque", vs = "Avatar.vert", fs = "Spirit.frag", toolExport = true, neverCastShadows = true, defines="SPIRIT ATTRIBUTES MUSICAL_INFLATE" }
resource "Shader" "PlushieDispenserPhantomMesh"	{ group = "Blended", vs = "Avatar.vert", fs = "Spirit.frag", toolExport = true, neverCastShadows = true, defines="SPIRIT ATTRIBUTES MUSICAL_INFLATE ALPHA ADD_DEPTH" }
resource "Shader" "SpiritMemoryMesh"			{ group = "Blended", vs = "Spirit.vert", fs = "Spirit.frag", toolExport = true, neverCastShadows = true, defines="MESH SPIRIT MEMORY_REVEAL ALPHA" }
resource "Shader" "SpiritMeshDepthPrepass"		{ group = "DepthPrepass", vs = "Spirit.vert", fs = "BlackDissolve.frag", toolExport = false, defines="BLACK" }
resource "Shader" "UnlitAlphaColor"				{ group = "Blended", vs = "DirectionalLighting.vert", fs = "DirectionalLighting.frag", toolExport = true, defines="ALPHA SELF_LIT COLOR_UNIFORM UVSCALE STAR_DEPTH" }
resource "Shader" "UnlitAlphaColorBackface"		{ group = "BlendedWithBackfaces", vs = "DirectionalLighting.vert", fs = "DirectionalLighting.frag", toolExport = true, defines="ALPHA SELF_LIT COLOR_UNIFORM UVSCALE" }
resource "Shader" "UnlitAlphaTest"				{ group = "Opaque", vs = "DirectionalLighting.vert", fs = "DirectionalLighting.frag", toolExport = true, defines="SELF_LIT ALPHA_TEST COLOR_UNIFORM" }

-- HUD
resource "Shader" "HudMask"						{ vs = "Fullscreen.vert", fs = "HudMask.frag", toolExport = false }
resource "Shader" "ColorSprite"					{ vs = "Sprite.vert", fs = "Sprite.frag", defines="COLOR_TEX EFFECT_SUPPORT" }
resource "Shader" "DebugDepth"					{ vs = "Sprite.vert", fs = "Sprite.frag", defines="DEPTH_TEX" }

resource "Shader" "ColorSpriteFramebuffer"		{ vs = "Sprite.vert", fs = "Sprite.frag", defines="COLOR_TEX FRAMEBUFFER EFFECT_SUPPORT" }
resource "Shader" "TguiBox"						{ vs = "TguiBox.vert", fs = "TguiBox.frag", defines="COLOR_TEX FRAMEBUFFER" }
resource "Shader" "TguiWorldMap"				{ vs = "TguiBox.vert", fs = "TguiBox.frag", defines="COLOR_TEX FRAMEBUFFER WORLDMAP_EFFECT" }
resource "Shader" "ColorSprite3d"				{ vs = "Sprite.vert", fs = "Sprite.frag", defines="COLOR_TEX VIEWPROJ EFFECT_SUPPORT" }
resource "Shader" "ColorSpriteHighRes3d"		{ vs = "Sprite.vert", fs = "Sprite.frag", defines="COLOR_TEX VIEWPROJ HIGHRES FRAMEBUFFER SCENE_TO_HUD_SCALE EFFECT_SUPPORT" }

resource "Shader" "ImGui"						{ vs = "ImGui.vert", fs = "ImGui.frag", defines="" }

resource "Shader" "RadialSprite"				{ group = "Hud", vs = "Sprite.vert", fs = "RadialSprite.frag", defines="FRAMEBUFFER RADIAL" }
resource "Shader" "GlowSprite"					{ group = "Hud", vs = "Sprite.vert", fs = "GlowSprite.frag", defines="FRAMEBUFFER GLOW_SPRITE" }
resource "Shader" "CircleMotionGraphics"		{ group = "Hud", vs = "Sprite.vert", fs = "CircleMotionGraphics.frag", defines="FRAMEBUFFER RADIAL" }

resource "Shader" "Sprite"						{ vs = "Sprite.vert", fs = "Sprite.frag" }
resource "Shader" "SpriteFramebuffer"			{ vs = "Sprite.vert", fs = "Sprite.frag", defines="FRAMEBUFFER" }

resource "Shader" "WorldSprite"					{ group = "Blended", vs = "WorldSprite.vert", fs = "WorldSprite.frag" }

-- Terrain materials
resource "Shader" "TerrainDepth"				{ group = "TerrainDepth", vs = "Terrain.vert", fs = "Terrain.frag", defines = "DEPTH", toolExport = false }
resource "Shader" "CloudShMesh"					{ group = "Opaque", vs = "Terrain.vert", fs = "Terrain.frag", defines="CLOUD UNDULATE MESH" }
resource "Shader" "CloudCard"					{ group = "Cloud", vs = "CloudCard.vert", fs = "CloudCard.frag", neverCastShadows = true }

resource "Shader" "GrassSh"						{ group = "TerrainMats", vs = "Terrain.vert", fs = "Terrain.frag", defines = "GRASS OVERLAY", toolExport = false }
resource "Shader" "GrassShMesh"					{ group = "Opaque", vs = "Terrain.vert", fs = "Terrain.frag", defines = "GRASS MESH", toolExport = false }
resource "Shader" "GrassShMeshDecal"			{ group = "ObjectDecal", vs = "Terrain.vert", fs = "Terrain.frag", defines = "GRASS MESH OVERLAY DECAL", toolExport = false }
resource "Shader" "GrassShSkirt"				{ group = "ObjectSkirt", vs = "Terrain.vert", fs = "Terrain.frag", defines = "GRASS SKIRT OVERLAY DECAL", toolExport = false }

resource "Shader" "RockFaceSh"					{ group = "TerrainMats", vs = "Terrain.vert", fs = "Terrain.frag", defines = "ROCKFACE OVERLAY", toolExport = false }
resource "Shader" "RockFaceShMesh"				{ group = "Opaque", vs = "Terrain.vert", fs = "Terrain.frag", defines = "ROCKFACE MESH", toolExport = false }
resource "Shader" "RockFaceShMeshDecal"			{ group = "ObjectDecal", vs = "Terrain.vert", fs = "Terrain.frag", defines = "ROCKFACE MESH OVERLAY DECAL", toolExport = false }
resource "Shader" "RockFaceShSkirt"				{ group = "ObjectSkirt", vs = "Terrain.vert", fs = "Terrain.frag", defines = "ROCKFACE SKIRT OVERLAY DECAL", toolExport = false }

resource "Shader" "RockFaceRainSh"				{ group = "TerrainMats", vs = "Terrain.vert", fs = "Terrain.frag", defines = "ROCKFACE RAIN OVERLAY", toolExport = false }
resource "Shader" "RockFaceRainShMesh"			{ group = "Opaque", vs = "Terrain.vert", fs = "Terrain.frag", defines = "ROCKFACE RAIN MESH", toolExport = false }
resource "Shader" "RockFaceRainShMeshDecal"		{ group = "ObjectDecal", vs = "Terrain.vert", fs = "Terrain.frag", defines = "ROCKFACE RAIN MESH OVERLAY DECAL", toolExport = false }
resource "Shader" "RockFaceRainShSkirt"			{ group = "ObjectSkirt", vs = "Terrain.vert", fs = "Terrain.frag", defines = "ROCKFACE RAIN SKIRT OVERLAY DECAL", toolExport = false }

resource "Shader" "SandSh"						{ group = "TerrainMats", vs = "Terrain.vert", fs = "Terrain.frag", defines = "SAND OVERLAY", toolExport = false }
resource "Shader" "SandShMesh"					{ group = "Opaque", vs = "Terrain.vert", fs = "Terrain.frag", defines = "SAND MESH", toolExport = false }
resource "Shader" "SandShMeshDecal"				{ group = "ObjectDecal", vs = "Terrain.vert", fs = "Terrain.frag", defines = "SAND MESH OVERLAY DECAL", toolExport = false }
resource "Shader" "SandShSkirt"					{ group = "ObjectSkirt", vs = "Terrain.vert", fs = "Terrain.frag", defines = "SAND SKIRT OVERLAY DECAL", toolExport = false }

resource "Shader" "SnowSh"						{ group = "TerrainMats", vs = "Terrain.vert", fs = "Terrain.frag", defines = "SNOW OVERLAY", toolExport = false }
resource "Shader" "SnowShMesh"					{ group = "Opaque", vs = "Terrain.vert", fs = "Terrain.frag", defines = "SNOW MESH", toolExport = false }
resource "Shader" "SnowShMeshDecal"				{ group = "ObjectDecal", vs = "Terrain.vert", fs = "Terrain.frag", defines = "SNOW MESH OVERLAY DECAL", toolExport = false }
resource "Shader" "SnowShSkirt"					{ group = "ObjectSkirt", vs = "Terrain.vert", fs = "Terrain.frag", defines = "SNOW SKIRT OVERLAY DECAL", toolExport = false }

resource "Shader" "SandRainSh"					{ group = "TerrainMats", vs = "Terrain.vert", fs = "Terrain.frag", defines = "SAND RAIN OVERLAY", toolExport = false }
resource "Shader" "SandRainShMesh"				{ group = "Opaque", vs = "Terrain.vert", fs = "Terrain.frag", defines = "SAND RAIN MESH", toolExport = false }
resource "Shader" "SandRainShMeshDecal"			{ group = "ObjectDecal", vs = "Terrain.vert", fs = "Terrain.frag", defines = "SAND RAIN MESH OVERLAY DECAL", toolExport = false }
resource "Shader" "SandRainShSkirt"				{ group = "ObjectSkirt", vs = "Terrain.vert", fs = "Terrain.frag", defines = "SAND RAIN SKIRT OVERLAY DECAL", toolExport = false }

-- Flower.frag
resource "Shader" "Flower"						{ group = "Flowers", vs = "Flower.vert", fs = "Flower.frag", toolExport = false }
resource "Shader" "FlowerShadow"				{ group = "FlowerShadows", vs = "Flower.vert", fs = "Flower.frag", defines = "SHADOW", toolExport = false }
resource "Shader" "GrassBladeNew"				{ group = "OpaqueTwoFace", vs = "Flower.vert", fs = "Flower.frag", defines = "GRASS READ_SSBO", toolExport = false }
resource "Shader" "GrassBlade"					{ group = "OpaqueTwoFace", vs = "Flower.vert", fs = "Flower.frag", defines = "GRASS", toolExport = false }

-- Mesh.frag
resource "Shader" "Mesh"						{ group = "Opaque", vs = "Mesh.vert", fs = "Mesh.frag", toolExport = true, defines="" }
resource "Shader" "MeshSh"						{ group = "Opaque", vs = "Mesh.vert", fs = "Mesh.frag", toolExport = true, defines="BAKED" }
resource "Shader" "MeshSl"						{ group = "Opaque", vs = "Mesh.vert", fs = "Mesh.frag", toolExport = true, defines="SELF_LIT COLOR_UNIFORM" }
resource "Shader" "MeshSlNoShadows"             { group = "Opaque", vs = "Mesh.vert", fs = "Mesh.frag", toolExport = true, neverCastShadows = true, defines="SELF_LIT COLOR_UNIFORM NO_SHADOWS ETHEREAL" }
resource "Shader" "MeshSlNoShadowsDye"      	{ group = "Opaque", vs = "Mesh.vert", fs = "Mesh.frag", toolExport = true, neverCastShadows = true, defines="SELF_LIT COLOR_UNIFORM NO_SHADOWS ETHEREAL COLOR_VARIANT" }
resource "Shader" "MeshSlNoShadowsDyeSystem"	{ group = "Opaque", vs = "Mesh.vert", fs = "Mesh.frag", toolExport = true, neverCastShadows = true, defines="SELF_LIT COLOR_UNIFORM NO_SHADOWS ETHEREAL DYEABLE" }
resource "Shader" "MeshSlNoShadowsDyeSysWindC"	{ group = "Opaque", vs = "Mesh.vert", fs = "Mesh.frag", toolExport = true, neverCastShadows = true, defines="SELF_LIT COLOR_UNIFORM NO_SHADOWS ETHEREAL DYEABLE WIND_CLOTH" }
resource "Shader" "MeshSlNoShadowsFlag"         { group = "Opaque", vs = "Mesh.vert", fs = "Mesh.frag", toolExport = true, neverCastShadows = true, defines="SELF_LIT COLOR_UNIFORM NO_SHADOWS ETHEREAL FLAG" } --Swing without deformation
resource "Shader" "MeshSlNoShadowsWindCloth"    { group = "Opaque", vs = "Mesh.vert", fs = "Mesh.frag", toolExport = true, neverCastShadows = true, defines="SELF_LIT COLOR_UNIFORM NO_SHADOWS ETHEREAL WIND_CLOTH" }
resource "Shader" "MeshChamSh"					{ group = "Opaque", vs = "Mesh.vert", fs = "Mesh.frag", toolExport = true, defines = "CHAM SELF_LIT COLOR_UNIFORM BAKED" }
resource "Shader" "MeshShSdf"					{ group = "Opaque", vs = "Mesh.vert", fs = "Mesh.frag", toolExport = true, defines="BAKED SDF" }
resource "Shader" "MeshShAlphaSdf"				{ group = "Decal", vs = "Mesh.vert", fs = "Mesh.frag", toolExport = true, defines="BAKED DECAL SDF" }
resource "Shader" "MeshMotion"					{ group = "Motion", vs = "MeshMotion.vert", fs = "MotionGen.frag", defines="OLD_POS MESH" }
resource "Shader" "AvatarMeshMotion"			{ group = "Motion", vs = "MeshMotion.vert", fs = "MotionGen.frag", defines="AVATAR_WIND OLD_POS MESH" }
resource "Shader" "StaticMeshMotion"			{ group = "Motion", vs = "MeshMotion.vert", fs = "MotionGen.frag", defines="MESH" }
resource "Shader" "Creature"					{ group = "Opaque", vs = "Mesh.vert", fs = "Mesh.frag", toolExport = true, defines="SH_UNIFORM CREATURE" }

resource "Shader" "Cham"						{ group = "Opaque", vs = "Mesh.vert", fs = "Mesh.frag", toolExport = true, defines = "DAZZLECHAM SELF_LIT CHAMTIME" }
resource "Shader" "ChamAlpha"					{ group = "Blended", vs = "Mesh.vert", fs = "Mesh.frag", toolExport = true, defines = "DAZZLECHAM SELF_LIT CHAMTIME ALPHA VERTEX_ALPHA_SCALE NO_SHADOWS" }
resource "Shader" "ChamAlphaSdf"				{ group = "Opaque", vs = "Mesh.vert", fs = "Mesh.frag", toolExport = true, defines = "DAZZLECHAM SELF_LIT CHAMTIME SDF" }

resource "Shader" "MeshSlNoShadowsWobble"       { group = "Opaque", vs = "Mesh.vert", fs = "Mesh.frag", toolExport = true, neverCastShadows = true, defines="SELF_LIT COLOR_UNIFORM NO_SHADOWS ETHEREAL WOBBLE" }
resource "Shader" "MeshSlNoShadowsBubble"       { group = "Opaque", vs = "Mesh.vert", fs = "Mesh.frag", toolExport = true, neverCastShadows = true, defines="SELF_LIT COLOR_UNIFORM NO_SHADOWS WOBBLE BUBBLE" }
resource "Shader" "MeshSlNoShadowsBalloons"     { group = "Opaque", vs = "Mesh.vert", fs = "Mesh.frag", toolExport = true, neverCastShadows = true, defines="SELF_LIT COLOR_UNIFORM NO_SHADOWS ETHEREAL BALLOONS" }

resource "Shader" "MeshDither"					{ group = "Opaque", vs = "Mesh.vert", fs = "Mesh.frag", toolExport = true, defines="DITHER" }
resource "Shader" "MeshDitherWindSail"			{ group = "Opaque", vs = "Mesh.vert", fs = "Mesh.frag", toolExport = true, defines="DITHER WIND_SAIL" }

-- Ocean.frag
resource "Shader" "Ocean"						{ group = "Ocean", vs = "Ocean.vert", fs = "Ocean.frag", toolExport = false, defines="", neverCastShadows = true }
resource "Shader" "OceanMesh"					{ group = "OceanModel", vs = "Ocean.vert", fs = "Ocean.frag", toolExport = true, neverCastShadows = true, defines="MODEL" }
resource "Shader" "OceanNearSurfacePatch"       { group = "OceanModel", vs = "Ocean.vert", fs = "Ocean.frag", toolExport = false, defines="NEAR_SURFACE_PATCH", neverCastShadows = true }
resource "Shader" "OceanFoamLine"               { group = "Blended", vs = "OceanFoamLine.vert", fs = "OceanFoamLine.frag", toolExport = true, defines="SELF_LIT LIT ALPHA" }

-- Effects
resource "Shader" "CandleAura"					{ group = "BlendedBackground", vs = "CandleAura.vert", fs = "CandleAura.frag", toolExport = false, defines="CANDLE" }
resource "Shader" "HeartAura"					{ group = "BlendedBackground", vs = "CandleAura.vert", fs = "CandleAura.frag", toolExport = false, defines="HEART" }
resource "Shader" "StarAura"					{ group = "BlendedBackground", vs = "CandleAura.vert", fs = "CandleAura.frag", toolExport = false, defines="STAR" }
resource "Shader" "Flame"						{ group = "BlendedBackground", vs = "Flame.vert", fs = "Flame.frag", toolExport = false, defines="" }
resource "Shader" "DancingFlame"				{ group = "Flames", vs = "DancingFlame.vert", fs = "DancingFlame.frag", toolExport = false, defines="" }
resource "Shader" "Beacon"						{ group = "Blended", vs = "Beacon.vert", fs = "Beacon.frag", toolExport = false, defines="VIEWPROJ" }
resource "Shader" "Candle"						{ group = "Opaque", vs = "Candle.vert", fs = "Candle.frag", toolExport = false, defines="" }
resource "Shader" "Sun"							{ group = "Opaque", vs = "Sun.vert", fs = "Sun.frag", toolExport = false, defines="" }

resource "Shader" "Brushstroke"					{ group = "OpaqueDepthEqual", vs = "Brushstroke.vert", fs = "Brushstroke.frag", toolExport = false, defines="" }
resource "Shader" "BrushstrokeFlow"				{ group = "OpaqueDepthEqual", vs = "Brushstroke.vert", fs = "Brushstroke.frag", toolExport = false, defines="FLOW" }
resource "Shader" "BrushstrokeFoliage"			{ group = "OpaqueDepthEqual", vs = "Brushstroke.vert", fs = "Brushstroke.frag", toolExport = false, defines="FOLIAGE" }
resource "Shader" "BrushstrokeSkinned"			{ group = "OpaqueDepthEqual", vs = "Brushstroke.vert", fs = "Brushstroke.frag", toolExport = false, defines="SKINNED" }
resource "Shader" "BrushstrokeCanvas"			{ group = "OpaqueDepthEqual", vs = "Brushstroke.vert", fs = "Brushstroke.frag", toolExport = false, defines="CANVAS" }

resource "Shader" "BrushstrokeDepth"			{ group = "AlphaTestDepth", vs = "Brushstroke.vert", fs = "Brushstroke.frag", toolExport = false, defines="DEPTH_ONLY" }
resource "Shader" "BrushstrokeFlowDepth"		{ group = "AlphaTestDepth", vs = "Brushstroke.vert", fs = "Brushstroke.frag", toolExport = false, defines="FLOW DEPTH_ONLY" }
resource "Shader" "BrushstrokeFoliageDepth"		{ group = "AlphaTestDepth", vs = "Brushstroke.vert", fs = "Brushstroke.frag", toolExport = false, defines="FOLIAGE DEPTH_ONLY" }
resource "Shader" "BrushstrokeSkinnedDepth"		{ group = "AlphaTestDepth", vs = "Brushstroke.vert", fs = "Brushstroke.frag", toolExport = false, defines="SKINNED DEPTH_ONLY" }
resource "Shader" "BrushstrokeCanvasDepth"		{ group = "AlphaTestDepth", vs = "Brushstroke.vert", fs = "Brushstroke.frag", toolExport = false, defines="CANVAS DEPTH_ONLY" }

resource "Shader" "BrushstrokeDebug"			{ group = "AlphaTestOpaque", vs = "Brushstroke.vert", fs = "Brushstroke.frag", toolExport = false, defines="DEBUG" }
resource "Shader" "BrushstrokeColorSample"		{ group = "PreCompute", vs = "BrushstrokeColorSample.vert", defines="NO_OUTPUTS_SSBO" }
resource "Shader" "BrushstrokeColorSampleFragSSBO" { group = "PreCompute", vs = "BrushstrokeColorSample.vert", fs = "BrushstrokeColorSample.frag", defines="FRAG_SSBO" }
resource "Shader" "BrushstrokeTrigger"			{ group = "PreCompute", vs = "BrushstrokeTrigger.vert", defines="NO_OUTPUTS_SSBO" }
resource "Shader" "BrushstrokeTriggerFragSSBO"	{ group = "PreCompute", vs = "BrushstrokeTrigger.vert", fs = "BrushstrokeTrigger.frag", defines="FRAG_SSBO" }

-- DirectionalLighting.frag
resource "Shader" "LitAlpha"					{ group = "Blended", vs = "DirectionalLighting.vert", fs = "DirectionalLighting.frag", toolExport = true, defines="SELF_LIT LIT ALPHA" }
resource "Shader" "LitAlphaTest"				{ group = "Opaque", vs = "DirectionalLighting.vert", fs = "DirectionalLighting.frag", toolExport = true, defines="SELF_LIT LIT ALPHA_TEST COLOR_UNIFORM" }
resource "Shader" "UnlitAlpha"					{ group = "Blended", vs = "DirectionalLighting.vert", fs = "DirectionalLighting.frag", toolExport = true, defines="ALPHA SELF_LIT" }
resource "Shader" "LitAlphaColor"				{ group = "Blended", vs = "DirectionalLighting.vert", fs = "DirectionalLighting.frag", toolExport = true, defines="SELF_LIT LIT ALPHA COLOR_UNIFORM" }
resource "Shader" "LitAlphaColorBackground"		{ group = "BlendedBackground", vs = "DirectionalLighting.vert", fs = "DirectionalLighting.frag", toolExport = true, defines="SELF_LIT LIT ALPHA COLOR_UNIFORM" }
resource "Shader" "LitAlphaColorPano"			{ group = "Pano", vs = "DirectionalLighting.vert", fs = "DirectionalLighting.frag", toolExport = true, defines="SELF_LIT LIT ALPHA COLOR_UNIFORM PANO" }
resource "Shader" "DirectionalLightingNoUv"		{ group = "Opaque", vs = "DirectionalLighting.vert", fs = "DirectionalLighting.frag", toolExport = true, defines="COLOR_UNIFORM SELF_LIT LIT NO_UV" }
resource "Shader" "Unlit"						{ group = "Opaque", vs = "DirectionalLighting.vert", fs = "DirectionalLighting.frag", toolExport = true, defines="" }
resource "Shader" "UnlitAlphaFading"			{ group = "Blended", vs = "DirectionalLighting.vert", fs = "DirectionalLighting.frag", toolExport = true, defines="ALPHA SOFT_ALPHA SELF_LIT FADING COLOR_UNIFORM UVSCALE" }
resource "Shader" "RailRibbonDefault"			{ group = "Blended", vs = "DirectionalLighting.vert", fs = "DirectionalLighting.frag", toolExport = true, defines="SELF_LIT LIT ALPHA RAIL_RIBBON" }

-- Text rendering
resource "Shader" "SlugFramebuffer"				{ vs = "Slug.vert", fs = "Slug.frag", toolExport = false, defines="FRAMEBUFFER SCREENSPACE SCREEN_CLIP" }

-- Utils
-- This is used by PS4 build only right now
if PLATFORM == "ps4" then
	resource "Shader" "UtilsClearBuffer"			{ cs = "UtilsClearBuffer.comp", toolExport = false, defines="" }
	resource "Shader" "UtilsCopyBufferToTexture2d"			{ cs = "UtilsCopyBufferToTexture2d.comp", toolExport = false, defines="" }
	resource "Shader" "UtilsCopyBufferToTexture3d"			{ cs = "UtilsCopyBufferToTexture3d.comp", toolExport = false, defines="" }
end


resource "Shader" "SkyboxCloud"						{ group = "Skybox", vs = "Skybox.vert", fs = "Skybox.frag", toolExport = true, neverCastShadows = true, defines="CLOUD" }

-- Avatar.frag (and a Ref variant if reflected in the final scene)
resource "Shader" "Avatar"							{ group = "Opaque", vs = "Avatar.vert", fs = "Avatar.frag", toolExport = false, defines="" }
resource "Shader" "AvatarTranslucent"				{ group = "Opaque", vs = "Avatar.vert", fs = "Avatar.frag", toolExport = false, defines="TRANSLUCENT" }
resource "Shader" "AvatarGem"                       { group = "Opaque", vs = "Avatar.vert", fs = "Avatar.frag", toolExport = false, defines="GEM TRANSLUCENT" }
resource "Shader" "AvatarScrollAlpha"				{ group = "Blended", vs = "Avatar.vert", fs = "Avatar.frag", toolExport = false, defines="SCROLL ALPHA ALPHA_MASK" }
resource "Shader" "AvatarScrollAlphaTest"			{ group = "AlphaTestOpaque", vs = "Avatar.vert", fs = "Avatar.frag", toolExport = false, defines="SCROLL ALPHA_TEST" }
resource "Shader" "AvatarAlpha"						{ group = "Blended", vs = "Avatar.vert", fs = "Avatar.frag", toolExport = false, defines="ALPHA" }
resource "Shader" "AvatarAlphaTest"					{ group = "AlphaTestOpaque", vs = "Avatar.vert", fs = "Avatar.frag", toolExport = false, defines=" ALPHA_TEST" }
resource "Shader" "AvatarGlitter"                   { group = "Opaque", vs = "Avatar.vert", fs = "Avatar.frag", toolExport = false, defines="CAPE_INTEGRITY GLITTER_MASK" }
resource "Shader" "AvatarGlass"						{ group = "BlendedDepth", vs = "Avatar.vert", fs = "Avatar.frag", toolExport = false, defines="ALPHA GLASS" }
resource "Shader" "AvatarCham"						{ group = "Opaque", vs = "Avatar.vert", fs = "Avatar.frag", toolExport = false, defines="CHAM CAPE_INTEGRITY" }
resource "Shader" "AvatarChamGlitter"				{ group = "Opaque", vs = "Avatar.vert", fs = "Avatar.frag", toolExport = false, defines="CHAM CAPE_INTEGRITY GLITTER_MASK" }
resource "Shader" "AvatarChamStarfield"				{ group = "Opaque", vs = "Avatar.vert", fs = "Avatar.frag", toolExport = false, defines="CHAM CAPE_INTEGRITY GLITTER_MASK STARFIELD" }
resource "Shader" "AvatarChamAlpha"					{ group = "Blended", vs = "Avatar.vert", fs = "Avatar.frag", toolExport = false, defines="CHAM CAPE_INTEGRITY ALPHA" }
resource "Shader" "AvatarChamAlphaTest"				{ group = "AlphaTestOpaque", vs = "Avatar.vert", fs = "Avatar.frag", toolExport = false, defines="CHAM CAPE_INTEGRITY ALPHA_TEST" }
resource "Shader" "AvatarChamElderMask"			    { group = "Blended", vs = "Avatar.vert", fs = "Avatar.frag", toolExport = false, defines="CHAM ELDER_MASK ALPHA" }
resource "Shader" "AvatarChamGlitterAlpha"			{ group = "Blended", vs = "Avatar.vert", fs = "Avatar.frag", toolExport = false, defines="CHAM CAPE_INTEGRITY ALPHA GLITTER" }
resource "Shader" "AvatarChamAlphaFullGlitter"      { group = "Blended", vs = "Avatar.vert", fs = "Avatar.frag", toolExport = false,  defines="CHAM CAPE_INTEGRITY ALPHA GLITTER_MASK" }
resource "Shader" "AvatarChamButterfly"				{ group = "Blended", vs = "Avatar.vert", fs = "Avatar.frag", toolExport = false, defines="CHAM CAPE_INTEGRITY ALPHA GLITTER BUTTERFLY" }
resource "Shader" "AvatarChamDyeHotwire"			{ group = "Opaque", vs = "Avatar.vert", fs = "Avatar.frag", toolExport = false, defines="CHAM CAPE_INTEGRITY DYE_HOTWIRE" }
resource "Shader" "AvatarChamOceanCaustics"			{ group = "BlendedDepth", vs = "Avatar.vert", fs = "Avatar.frag", toolExport = false, defines="CHAM CAPE_INTEGRITY ALPHA OCEAN_CAUSTICS" }
resource "Shader" "AvatarOceanCaustics"				{ group = "BlendedDepth", vs = "Avatar.vert", fs = "Avatar.frag", toolExport = false, defines="ALPHA OCEAN_CAUSTICS" }
resource "Shader" "AvatarOceanCausticsClipped"		{ group = "BlendedDepth", vs = "Avatar.vert", fs = "Avatar.frag", toolExport = false, defines="ALPHA OCEAN_CAUSTICS CLIPPED" }
resource "Shader" "AvatarChamGlass"					{ group = "BlendedDepth", vs = "Avatar.vert", fs = "Avatar.frag", toolExport = false, defines="CHAM CAPE_INTEGRITY ALPHA GLASS" }
resource "Shader" "AvatarChamBlueTear"              { group = "BlendedDepth", vs = "Avatar.vert", fs = "Avatar.frag", toolExport = false, defines="CHAM CAPE_INTEGRITY ALPHA BLUETEAR" }
resource "Shader" "AvatarHair"						{ group = "Opaque", vs = "Avatar.vert", fs = "Avatar.frag", toolExport = false, defines="HAIR" }
resource "Shader" "AvatarClipped"					{ group = "AlphaTestOpaque", vs = "Avatar.vert", fs = "Avatar.frag", toolExport = false, defines="CLIPPED" }
resource "Shader" "AvatarHairClipped"				{ group = "AlphaTestOpaque", vs = "Avatar.vert", fs = "Avatar.frag", toolExport = false, defines="HAIR CLIPPED" }
resource "Shader" "SpiritBody"						{ group = "Opaque", vs = "Avatar.vert", fs = "Spirit.frag", toolExport = false, defines="SPIRIT COLOR_UNIFORM" }
resource "Shader" "SpiritBodyClipped"				{ group = "AlphaTestOpaque", vs = "Avatar.vert", fs = "Spirit.frag", toolExport = false, defines="SPIRIT COLOR_UNIFORM CLIPPED" }
resource "Shader" "SpiritBodyAlphaTest"				{ group = "AlphaTestOpaque", vs = "Avatar.vert", fs = "Spirit.frag", toolExport = false, defines="SPIRIT COLOR_UNIFORM ALPHA_TEST" }
resource "Shader" "SpiritBodyAlpha"					{ group = "Blended", vs = "Avatar.vert", fs = "Spirit.frag", toolExport = false, defines="SPIRIT MEMORY_REVEAL ALPHA COLOR_UNIFORM MUSICAL_STARS MUSICAL_INFLATE" }
resource "Shader" "SpiritBodyMemoryOpaque"			{ group = "Opaque", vs = "Avatar.vert", fs = "Spirit.frag", toolExport = false, defines="SPIRIT MEMORY_REVEAL COLOR_UNIFORM MEMORY_OPAQUE" }
resource "Shader" "SpiritBodyMemoryAlphaTest"		{ group = "AlphaTestOpaque", vs = "Avatar.vert", fs = "Spirit.frag", toolExport = false, defines="SPIRIT MEMORY_REVEAL COLOR_UNIFORM MEMORY_OPAQUE ALPHA_TEST" }
resource "Shader" "SpiritFrozen"					{ group = "Opaque", vs = "Avatar.vert", fs = "SpiritFrozen.frag", toolExport = false, defines="SPIRIT FROZEN COLOR_UNIFORM" }
resource "Shader" "SpiritCore"						{ group = "Ghostly", vs = "SpiritCore.vert", fs = "SpiritCore.frag", toolExport = false, defines="" }
resource "Shader" "SpiritParticle"					{ group = "Blended", vs = "SpiritParticle.vert", fs = "SpiritParticle.frag", toolExport = false, defines="" }
resource "Shader" "SpiritBodyDepthPrepass"			{ group = "DepthPrepass", vs = "Avatar.vert", fs = "Black.frag", toolExport = false, defines="SPIRIT MEMORY_REVEAL BLACK" }
resource "Shader" "AvatarDepthPrepass"				{ group = "DepthPrepass", vs = "Avatar.vert", fs = "Black.frag", toolExport = false, defines="BLACK" }
resource "Shader" "AvatarDiamond"					{ group = "Sprites", vs = "AvatarDiamond.vert", fs = "AvatarDiamond.frag", toolExport = false, defines="" }
resource "Shader" "AvatarDiamondReflect"			{ group = "AlphaTestOpaque", vs = "AvatarDiamond.vert", fs = "AvatarDiamond.frag", toolExport = false, defines="REFLECTED" }
resource "Shader" "AvatarDiamondMotion"				{ group = "Motion", vs = "AvatarDiamond.vert", fs = "MotionGen.frag", toolExport = false, defines = "MOTION_VEC MESH" }
resource "Shader" "AvatarFur" 						{ group = "OpaqueTwoFace", vs = "AvatarFur.vert", fs = "Avatar.frag", toolExport = false, defines="FUR FUR_STRAND" }
resource "Shader" "AvatarChamFur" 					{ group = "OpaqueTwoFace", vs = "AvatarFur.vert", fs = "Avatar.frag", toolExport = false, defines="CHAM CAPE_INTEGRITY FUR FUR_STRAND" }
resource "Shader" "AvatarFurRaven"					{ group = "OpaqueTwoFace", vs = "AvatarFur.vert", fs = "Avatar.frag", toolExport = false, defines="CHAM CAPE_INTEGRITY FUR FUR_STRAND ALPHA_TEST RAVEN" }
resource "Shader" "AvatarFurBase" 					{ group = "Opaque", vs = "Avatar.vert", fs = "Avatar.frag", toolExport = false, defines="FUR" }
resource "Shader" "AvatarChamFurBase" 				{ group = "Opaque", vs = "Avatar.vert", fs = "Avatar.frag", toolExport = false, defines="CHAM CAPE_INTEGRITY FUR" }
resource "Shader" "AvatarFurMotion" 				{ group = "MotionTwoFace", vs = "AvatarFur.vert", fs = "MotionGen.frag", toolExport = false, defines="CHAM CAPE_INTEGRITY MOTION_VEC MESH FUR" }

-- Shader simplification REVAMP_A (in-progress by @Wes.)
--   - Cham texture moved to UV3, because it's extremely unwieldy to have it in the same UV as the mask.
--   - Effects driven by Mask.b; we should only ever have one 'effect', because they're expensive (glitter, caustics, etc.)
resource "Shader" "AvatarChamGlitterAlphaRevamp"	{ group = "Blended", vs = "Avatar.vert", fs = "Avatar.frag", toolExport = false, defines="CHAM CAPE_INTEGRITY ALPHA GLITTER_MASK REVAMP_A" }

-- Video textures
resource "Shader" "VideoTextureArtGallery"	 		{ group = "Blended", vs = "VideoTextureRender.vert", fs = "VideoTextureRender.frag", toolExport = true, defines="VIDEO_BLENDED VIDEO_CHROMA_CUTOUT" }
resource "Shader" "VideoTextureChromaCutout"		{ group = "OpaqueTwoFace", vs = "VideoTextureRender.vert", fs = "VideoTextureRender.frag", toolExport = true, defines="VIDEO_CHROMA_CUTOUT" }
resource "Shader" "VideoTextureRender"				{ group = "OpaqueTwoFace", vs = "VideoTextureRender.vert", fs = "VideoTextureRender.frag", toolExport = true, defines="" }

if PLATFORM == "macosx" or PLATFORM == "win"  then
	resource "Shader" "AvatarWireframe" 				{ group = "Opaque", vs = "AvatarWireframe.vert", fs = "AvatarWireframe.frag", toolExport = false, defines="" }
end

-- Mesh.frag - @NOTE: All meshes in the game currently use the "Mesh" shader when baking, so we need the instance limit to be fairly high
resource "Shader" "MeshAlpha"						{ group = "Decal", vs = "Mesh.vert", fs = "Mesh.frag", toolExport = true, defines="DECAL" }
resource "Shader" "MeshAlphaOpaqueShadows"			{ group = "Blended", vs = "Mesh.vert", fs = "Mesh.frag", toolExport = true, defines="ALPHA OPAQUE_SHADOWS" }
resource "Shader" "MeshShAlpha"						{ group = "Decal", vs = "Mesh.vert", fs = "Mesh.frag", toolExport = true, defines="BAKED DECAL" }
resource "Shader" "MeshShDecal"						{ group = "Decal", vs = "Mesh.vert", fs = "Mesh.frag", toolExport = false, defines="BAKED DECAL" }
resource "Shader" "MeshShSl"						{ group = "Opaque", vs = "Mesh.vert", fs = "Mesh.frag", toolExport = true, defines="BAKED SELF_LIT COLOR_UNIFORM" }
resource "Shader" "MeshShSlSpec"					{ group = "Opaque", vs = "Mesh.vert", fs = "Mesh.frag", toolExport = true, defines="BAKED SELF_LIT COLOR_UNIFORM SPECULAR_TEX" }
resource "Shader" "MeshGem"             			{ group = "Opaque", vs = "Mesh.vert", fs = "Mesh.frag", toolExport = true, neverCastShadows = true, defines="COLOR_UNIFORM NO_SHADOWS ETHEREAL GEM" }
resource "Shader" "MeshRainSh"						{ group = "Opaque", vs = "Mesh.vert", fs = "Mesh.frag", toolExport = true, defines="BAKED RAIN" }
resource "Shader" "MeshRainShAlpha"					{ group = "Decal", vs = "Mesh.vert", fs = "Mesh.frag", toolExport = true, defines="BAKED RAIN DECAL" }
resource "Shader" "MeshCham"						{ group = "Opaque", vs = "Mesh.vert", fs = "Mesh.frag", toolExport = true, defines = "CHAM SELF_LIT COLOR_UNIFORM" }
resource "Shader" "MeshDualCham"					{ group = "Opaque", vs = "Mesh.vert", fs = "Mesh.frag", toolExport = true, defines = "CHAM DUAL_CHAM SELF_LIT COLOR_UNIFORM" }
resource "Shader" "MeshHeightChamSh"				{ group = "Opaque", vs = "Mesh.vert", fs = "Mesh.frag", toolExport = true, defines = "CHAM HEIGHT_CHAM SELF_LIT COLOR_UNIFORM BAKED" }
resource "Shader" "MeshHeightChamSl"				{ group = "Opaque", vs = "Mesh.vert", fs = "Mesh.frag", toolExport = true, defines = "CHAM HEIGHT_CHAM SELF_LIT COLOR_UNIFORM" }
resource "Shader" "CreatureSl"						{ group = "Opaque", vs = "Mesh.vert", fs = "Mesh.frag", toolExport = true, defines="SH_UNIFORM CREATURE SELF_LIT" }
resource "Shader" "AncestorEngine"					{ group = "Decal", vs = "Mesh.vert", fs = "Mesh.frag", toolExport = true, defines="BAKED SELF_LIT DECAL COLOR_UNIFORM" }
resource "Shader" "DarkStone"						{ group = "Opaque", vs = "DarkStone.vert", fs = "DarkStone.frag", toolExport = true, neverCastShadows = true, defines="BAKED" }
resource "Shader" "DarkStoneNoBake"					{ group = "Opaque", vs = "DarkStone.vert", fs = "DarkStone.frag", toolExport = true, neverCastShadows = true, defines="" }
resource "Shader" "InstancedDarkStone"				{ group = "Opaque", vs = "DarkStone.vert", fs = "DarkStone.frag", toolExport = true, neverCastShadows = true, defines="INSTANCED" }
resource "Shader" "MeshSlDarkvine"					{ group = "Opaque", vs = "Mesh.vert", fs = "Mesh.frag", toolExport = true, defines="SELF_LIT COLOR_UNIFORM DARKVINE" }
resource "Shader" "MeteorDarkStoneNoBake"			{ group = "Opaque", vs = "DarkStone.vert", fs = "DarkStone.frag", toolExport = true, neverCastShadows = true, defines="METEOR" }
resource "Shader" "LightShroom"						{ group = "Opaque", vs = "LightShroom.vert", fs = "LightShroom.frag", toolExport = true, neverCastShadows = true, defines="" }
resource "Shader" "Spirit"							{ group = "Opaque", vs = "Spirit.vert", fs = "Spirit.frag", toolExport = true, neverCastShadows = true, defines="MESH SPIRIT" }
-- This shader is designed for compatibility with older outfit props that are now using the placeable system
resource "Shader" "MeshPlaceableProp"       		{ group = "Opaque", vs = "Mesh.vert", fs = "Mesh.frag", toolExport = true, defines="SELF_LIT COLOR_UNIFORM PLACEABLE_PROP NO_SHADOWS ETHEREAL" }
resource "Shader" "MeshPlaceablePropAlpha"       	{ group = "Blended", vs = "Mesh.vert", fs = "Mesh.frag", toolExport = true, defines="SELF_LIT COLOR_UNIFORM PLACEABLE_PROP ALPHA NO_SHADOWS ETHEREAL" }
resource "Shader" "MeshPlaceablePropWind"           { group = "Opaque", vs = "Mesh.vert", fs = "Mesh.frag", toolExport = true, defines="SELF_LIT COLOR_UNIFORM PLACEABLE_PROP NO_SHADOWS ETHEREAL NORMAL_WIND" }
resource "Shader" "MeshPlaceablePropSpec"       	{ group = "Opaque", vs = "Mesh.vert", fs = "Mesh.frag", toolExport = true, defines="SELF_LIT COLOR_UNIFORM PLACEABLE_PROP NO_SHADOWS ETHEREAL SPECULAR_TEX" }
resource "Shader" "MeshFoliageAlphaTest"       		{ group = "OpaqueTwoFace", vs = "Mesh.vert", fs = "Mesh.frag", toolExport = true, defines="COLOR_UNIFORM PLACEABLE_PROP ALPHA_TEST FOLIAGE NO_SHADOWS" }
resource "Shader" "MeshFoliageAlphaTestSl"       	{ group = "OpaqueTwoFace", vs = "Mesh.vert", fs = "Mesh.frag", toolExport = true, defines="COLOR_UNIFORM ALPHA_TEST FOLIAGE NO_SHADOWS SELF_LIT" }
resource "Shader" "MeshFoliageAlphaTestGlow"       	{ group = "OpaqueTwoFace", vs = "Mesh.vert", fs = "Mesh.frag", toolExport = true, defines="COLOR_UNIFORM PLACEABLE_PROP ALPHA_TEST FOLIAGE NO_SHADOWS LIGHT_NOISE" }
resource "Shader" "MeshFoliageAlphaTestCham"       	{ group = "OpaqueTwoFace", vs = "Mesh.vert", fs = "Mesh.frag", toolExport = true, defines="COLOR_UNIFORM PLACEABLE_PROP ALPHA_TEST FOLIAGE NO_SHADOWS DAZZLECHAM CHAMTIME SDF SELF_LIT" }
resource "Shader" "MeshWindCloth"					{ group = "Opaque", vs = "Mesh.vert", fs = "Mesh.frag", toolExport = true, defines="COLOR_UNIFORM WIND_CLOTH" }
resource "Shader" "MeshShSlWindCloth"			    { group = "Opaque", vs = "Mesh.vert", fs = "Mesh.frag", toolExport = true, defines="BAKED SELF_LIT COLOR_UNIFORM WIND_CLOTH" }

-- Shader for MeshFlag
resource "Shader" "MeshFlag"                        { group = "Opaque", vs = "Mesh.vert", fs = "Mesh.frag", toolExport = true, defines="FLAG"}

resource "Shader" "DazzleCham"						{ group = "Opaque", vs = "Mesh.vert", fs = "Mesh.frag", toolExport = true, defines = "DAZZLECHAM SELF_LIT" }
resource "Shader" "DazzleChamAlpha"					{ group = "Decal", vs = "Mesh.vert", fs = "Mesh.frag", toolExport = true, defines = "DAZZLECHAM DECAL SELF_LIT" }
resource "Shader" "ChamShAlpha"						{ group = "Decal", vs = "Mesh.vert", fs = "Mesh.frag", toolExport = true, defines = "DAZZLECHAM SELF_LIT CHAMTIME DECAL BAKED" }
resource "Shader" "ChamAlphaDepth"					{ group = "BlendedWithBackfaces", vs = "Mesh.vert", fs = "Mesh.frag", toolExport = true, defines = "DAZZLECHAM SELF_LIT CHAMTIME ALPHA" }
resource "Shader" "ChamAlphaDepthColor"				{ group = "BlendedWithBackfaces", vs = "Mesh.vert", fs = "Mesh.frag", toolExport = true, defines = "DAZZLECHAM SELF_LIT CHAMTIME ALPHA COLOR_UNIFORM" }
resource "Shader" "MeshMagicGlow"					{ group = "Opaque", vs = "Mesh.vert", fs = "Mesh.frag", toolExport = true, defines="COLOR_UNIFORM MAGIC_GLOW" }
resource "Shader" "Constellation"					{ group = "Decal", vs = "Mesh.vert", fs = "Mesh.frag", toolExport = true, defines = "DAZZLECHAM PULSE CONSTELLATION SELF_LIT CHAMTIME DECAL" }

-- Shader for LevelInstanceModel
resource "Shader" "LevelInstanceModel"				{ group = "Opaque", vs = "LevelInstanceModel.vert", fs = "LevelInstanceModel.frag", toolExport = true, defines="" }
-- Shader for Anni4TGCOffice DanceFloor
resource "Shader" "AnniversaryDanceLamp"			{ group = "Opaque", vs = "AnniversaryDanceLamp.vert", fs = "AnniversaryDanceLamp.frag", toolExport = true, defines="" }
-- Shader for Anni4TGCOffice DanceTriangle
resource "Shader" "AnniversaryTriangle"				{ group = "Opaque", vs = "AnniversaryTriangle.vert", fs = "AnniversaryTriangle.frag", toolExport = true, defines="" }
-- Shader for Anni4 Light
resource "Shader" "Anni4Light"						{ group = "Blended", vs = "DirectionalLighting.vert", fs = "DirectionalLighting.frag", toolExport = true, defines="ALPHA SOFT_ALPHA SELF_LIT COLOR_UNIFORM UVSCALE UVSOFT" }

-- Ocean
resource "Shader" "OceanCinema"						{ group = "Ocean", vs = "Ocean.vert", fs = "Ocean.frag", toolExport = true, neverCastShadows = true, defines="CINEMA" }
resource "Shader" "OceanOrbit"						{ group = "Ocean", vs = "Ocean.vert", fs = "Ocean.frag", defines="ORBIT" }
resource "Shader" "OceanDark"						{ group = "Ocean", vs = "Ocean.vert", fs = "Ocean.frag", defines="DARK" }
resource "Shader" "OceanMeshCinema"					{ group = "OceanModel", vs = "Ocean.vert", fs = "Ocean.frag", toolExport = true, neverCastShadows = true, defines="MODEL CINEMA" }
resource "Shader" "OceanMeshWet"					{ group = "OceanModel", vs = "Ocean.vert", fs = "Ocean.frag", toolExport = true, neverCastShadows = true, defines="MODEL RAIN" }
resource "Shader" "OceanDarkMesh"					{ group = "OceanModel", vs = "Ocean.vert", fs = "Ocean.frag", toolExport = true, neverCastShadows = true, defines="MODEL DARK" }
resource "Shader" "OceanDarkMeshWet"				{ group = "OceanModel", vs = "Ocean.vert", fs = "Ocean.frag", toolExport = true, neverCastShadows = true, defines="MODEL DARK RAIN" }

-- Mote
resource "Shader" "MoteAnim"						{ group = "Opaque", vs = "Mote.vert", fs = "Mote.frag", toolExport = false }
resource "Shader" "MoteMotion"						{ group = "Motion", vs = "Mote.vert", fs = "MotionGen.frag", toolExport = false, defines="MOTION_VEC MESH" }

-- DarkstoneRain
resource "Shader" "DarkstoneRain"					{ group = "Opaque", vs = "DarkstoneRain.vert", fs = "DarkstoneRain.frag", toolExport = false }
resource "Shader" "DarkstoneRainMotion"				{ group = "Motion", vs = "DarkstoneRain.vert", fs = "MotionGen.frag", toolExport = false, defines="MOTION_VEC MESH" }

-- Fish School / Audience
resource "Shader" "InstancedFish"					{ group = "Opaque", vs = "Mesh.vert", fs = "Mesh.frag", toolExport = false, defines = "INSTANCED FISH" }
resource "Shader" "InstancedFishNoShadows"			{ group = "Opaque", vs = "Mesh.vert", fs = "Mesh.frag", toolExport = false, defines = "INSTANCED FISH NO_SHADOWS" }
resource "Shader" "InstancedFishSh"					{ group = "Opaque", vs = "Mesh.vert", fs = "Mesh.frag", toolExport = false, defines = "INSTANCED FISH BAKED" }
resource "Shader" "InstancedFishSl"					{ group = "Opaque", vs = "Mesh.vert", fs = "Mesh.frag", toolExport = false, defines = "INSTANCED FISH SELF_LIT COLOR_UNIFORM" }
resource "Shader" "InstancedBirds"					{ group = "Opaque", vs = "Mesh.vert", fs = "Mesh.frag", toolExport = false, defines = "INSTANCED BIRD" }
resource "Shader" "InstancedBirdsSh"				{ group = "Opaque", vs = "Mesh.vert", fs = "Mesh.frag", toolExport = false, defines = "INSTANCED BIRD BAKED" }
resource "Shader" "InstancedMantas"					{ group = "Opaque", vs = "Mesh.vert", fs = "Mesh.frag", toolExport = false, defines = "INSTANCED MANTA" }
resource "Shader" "InstancedGhostMantas"			{ group = "Blended", vs = "Mesh.vert", fs = "Mesh.frag", toolExport = false, defines = "INSTANCED MANTA ALPHA SELF_LIT" }
resource "Shader" "InstancedButterflies"			{ group = "Opaque", vs = "Mesh.vert", fs = "Mesh.frag", toolExport = false, defines = "INSTANCED BUTTERFLY" }
resource "Shader" "InstancedJellyfish"				{ group = "Blended", vs = "Mesh.vert", fs = "Mesh.frag", toolExport = false, defines = "INSTANCED JELLYFISH ALPHA SELF_LIT" }
resource "Shader" "InstancedSkyKidFlying"			{ group = "Opaque", vs = "Mesh.vert", fs = "Mesh.frag", toolExport = false, defines = "INSTANCED SKY_KID_FLYING" }
resource "Shader" "InstancedSkyKidAbstract"			{ group = "Opaque", vs = "Mesh.vert", fs = "PaperLantern.frag", toolExport = false, defines = "INSTANCED SKY_KID_ABSTRACT" }
resource "Shader" "InstancedSkyKidPresence"			{ group = "Opaque", vs = "Mesh.vert", fs = "PaperLantern.frag", toolExport = false, defines = "INSTANCED SKY_KID_PRESENCE" }
resource "Shader" "InstancedSkyKidPresence_Low"		{ group = "Opaque", vs = "Mesh.vert", fs = "PaperLantern.frag", toolExport = false, defines = "INSTANCED SKY_KID_PRESENCE SKY_KID_PRESENCE_LOW" }
resource "Shader" "InstancedSkyKidPresence_Lowest"	{ group = "Opaque", vs = "Mesh.vert", fs = "PaperLantern.frag", toolExport = false, defines = "INSTANCED SKY_KID_PRESENCE SKY_KID_PRESENCE_LOWEST" }
resource "Shader" "SnakeGameBody"                   { group = "Opaque", vs = "Mesh.vert", fs = "PaperLantern.frag", toolExport = false, defines = "SNAKE_GAME_BODY" }
resource "Shader" "InstancedSkyKidAP18Masked" 		{ group = "Opaque", vs = "Mesh.vert", fs = "PaperLantern.frag", toolExport = false, defines = "INSTANCED SKY_KID_ABSTRACT AP18_MASKED" }
resource "Shader" "InstancedCrabs" 					{ group = "Opaque", vs = "Mesh.vert", fs = "Mesh.frag", toolExport = false, defines = "INSTANCED CRAB" }
resource "Shader" "InstancedDragonDance" 			{ group = "Opaque", vs = "Mesh.vert", fs = "Mesh.frag", toolExport = false, defines = "INSTANCED DRAGON_DANCE" }
resource "Shader" "InstancedGlowkelp"				{ group = "Blended", vs = "Mesh.vert", fs = "Mesh.frag", toolExport = false, defines = "INSTANCED NO_CAM_SCALE ALPHA SELF_LIT" }
resource "Shader" "InstancedFoliage"				{ group = "OpaqueTwoFace", vs = "Mesh.vert", fs = "Mesh.frag", toolExport = false, defines = "INSTANCED COLOR_UNIFORM PLACEABLE_PROP ALPHA_TEST FOLIAGE NO_CAM_SCALE NO_SHADOWS" }
resource "Shader" "InstancedFoliageSl"				{ group = "OpaqueTwoFace", vs = "Mesh.vert", fs = "Mesh.frag", toolExport = false, defines = "INSTANCED COLOR_UNIFORM ALPHA_TEST FOLIAGE NO_CAM_SCALE NO_SHADOWS SELF_LIT" }
resource "Shader" "InstancedFoliageGlow"			{ group = "OpaqueTwoFace", vs = "Mesh.vert", fs = "Mesh.frag", toolExport = false, defines = "INSTANCED COLOR_UNIFORM PLACEABLE_PROP ALPHA_TEST FOLIAGE NO_CAM_SCALE NO_SHADOWS LIGHT_NOISE" }
resource "Shader" "InstancedFoliageBend"			{ group = "OpaqueTwoFace", vs = "Mesh.vert", fs = "Mesh.frag", toolExport = false, defines = "INSTANCED COLOR_UNIFORM PLACEABLE_PROP ALPHA_TEST FOLIAGE NO_CAM_SCALE NO_SHADOWS BEND" }
resource "Shader" "InstancedFoliageBendSl"			{ group = "OpaqueTwoFace", vs = "Mesh.vert", fs = "Mesh.frag", toolExport = false, defines = "INSTANCED COLOR_UNIFORM ALPHA_TEST FOLIAGE NO_CAM_SCALE NO_SHADOWS SELF_LIT BEND" }
resource "Shader" "InstancedFoliageGlowBend"		{ group = "OpaqueTwoFace", vs = "Mesh.vert", fs = "Mesh.frag", toolExport = false, defines = "INSTANCED COLOR_UNIFORM PLACEABLE_PROP ALPHA_TEST FOLIAGE NO_CAM_SCALE NO_SHADOWS LIGHT_NOISE BEND" }
resource "Shader" "InstancedPushSl"					{ group = "Opaque", vs = "Mesh.vert", fs = "Mesh.frag", toolExport = false, defines = "INSTANCED COLOR_UNIFORM NO_CAM_SCALE NO_SHADOWS SELF_LIT PUSH" }
resource "Shader" "InstancedAP24Arms"				{ group = "Opaque", vs = "Mesh.vert", fs = "Mesh.frag", toolExport = false, defines = "INSTANCED NO_CAM_SCALE NO_SHADOWS AP24ARMS SELF_LIT" }
resource "Shader" "InstancedBroomsticks"			{ group = "Opaque", vs = "Mesh.vert", fs = "PaperLantern.frag", toolExport = false, defines = "INSTANCED SKY_KID_ABSTRACT BROOMSTICK" }
resource "Shader" "InstancedBasic"					{ group = "Opaque", vs = "Mesh.vert", fs = "Mesh.frag", toolExport = false, defines = "INSTANCED NO_CAM_SCALE NO_SHADOWS" }
resource "Shader" "InstancedEelSwim"				{ group = "Opaque", vs = "Mesh.vert", fs = "Mesh.frag", toolExport = false, defines = "INSTANCED NO_CAM_SCALE NO_SHADOWS SELF_LIT EEL_SWIM" }

resource "Shader" "InstancedJellyfishMotion"		{ group = "Motion", vs = "Mesh.vert", fs = "MotionGen.frag", toolExport = false, defines = "INSTANCED JELLYFISH MESH MOTION_VEC" }
resource "Shader" "InstancedSkyKidAbstractMotion"	{ group = "Motion", vs = "Mesh.vert", fs = "MotionGen.frag", toolExport = false, defines = "INSTANCED SKY_KID_ABSTRACT MESH MOTION_VEC" }
resource "Shader" "InstancedSkyKidPresenceMotion"	{ group = "Motion", vs = "Mesh.vert", fs = "MotionGen.frag", toolExport = false, defines = "INSTANCED SKY_KID_PRESENCE MESH MOTION_VEC" }
resource "Shader" "InstancedSkyKidAP18MaskedMotion"	{ group = "Motion", vs = "Mesh.vert", fs = "MotionGen.frag", toolExport = false, defines = "INSTANCED SKY_KID_ABSTRACT AP18_MASKED MESH MOTION_VEC" }
resource "Shader" "InstancedSkyKidFlyingMotion"		{ group = "Motion", vs = "Mesh.vert", fs = "MotionGen.frag", toolExport = false, defines = "INSTANCED SKY_KID_FLYING MESH MOTION_VEC" }
resource "Shader" "InstancedBirdsMotion"			{ group = "Motion", vs = "Mesh.vert", fs = "MotionGen.frag", toolExport = false, defines = "INSTANCED BIRD MESH MOTION_VEC" }
resource "Shader" "InstancedMantasMotion"			{ group = "Motion", vs = "Mesh.vert", fs = "MotionGen.frag", toolExport = false, defines = "INSTANCED MANTA MESH MOTION_VEC" }
resource "Shader" "InstancedButterfliesMotion"		{ group = "Motion", vs = "Mesh.vert", fs = "MotionGen.frag", toolExport = false, defines = "INSTANCED BUTTERFLY MESH MOTION_VEC" }
resource "Shader" "InstancedCrabsMotion"			{ group = "Motion", vs = "Mesh.vert", fs = "MotionGen.frag", toolExport = false, defines = "INSTANCED CRAB MESH MOTION_VEC" }
resource "Shader" "InstancedDragonDanceMotion"		{ group = "Motion", vs = "Mesh.vert", fs = "MotionGen.frag", toolExport = false, defines = "INSTANCED DRAGON_DANCE MESH MOTION_VEC" }

resource "Shader" "InstancedSprites" 				{ group = "Opaque", vs = "InstancedSprites.vert", fs = "InstancedSprites.frag", toolExport = false }
resource "Shader" "InstancedSpritesMotion" 			{ group = "Motion", vs = "InstancedSprites.vert", fs = "InstancedSprites.frag", toolExport = false, defines = "MOTION_VEC" }
resource "Shader" "InstancedSpritesShout" 			{ group = "LensFlare", vs = "InstancedSprites.vert", fs = "InstancedSprites.frag", toolExport = false, defines = "SHOUT" }
resource "Shader" "InstancedSpritesEmber" 			{ group = "LensFlare", vs = "InstancedSprites.vert", fs = "InstancedSprites.frag", toolExport = false, defines = "SHOUT EMBER" }

resource "Shader" "AuroraEthereal"					{ group = "Blended", vs = "Mesh.vert", fs = "AuroraEthereal.frag", toolExport = true, defines = "AURORA ALPHA" }

resource "Shader" "BirdFlock"						{ group = "OpaqueTwoFace", vs = "Bird.vert", fs = "Bird.frag", toolExport = false }
resource "Shader" "Trail"							{ group = "Trails", vs = "Trail.vert", fs = "Trail.frag" }
resource "Shader" "Bub"								{ group = "Blended", vs = "Bub.vert", fs = "Bub.frag" }
resource "Shader" "Shout"							{ group = "BlendedWithBackfacesForeground", vs = "Shout.vert", fs = "Shout.frag" , toolExport = true }
resource "Shader" "ProjectedCircleZone"				{ group = "BlendedBackfacesNoDepth", vs = "Shout.vert", fs = "ProjectedCircleZone.frag", toolExport = true, defines="PROJECTED" }
resource "Shader" "PresenceReveal"					{ group = "BlendedBackfacesNoDepth", vs = "Shout.vert", fs = "ProjectedCircleZone.frag", defines="PROJECTED PRESENCE_REVEAL" }
resource "Shader" "DiscoLightGround"        		{ group = "BlendedBackfacesNoDepth", vs = "Shout.vert", fs = "DiscoLightGround.frag", defines="PROJECTED" }
resource "Shader" "LensFlareStar"					{ group = "LensFlare", vs = "LensFlare.vert", fs = "LensFlare.frag" }
resource "Shader" "LensFlareSunDog"					{ group = "LensFlare", vs = "LensFlareSunDog.vert", fs = "LensFlareSunDog.frag" }
resource "Shader" "LensFlareDot"					{ group = "LensFlare", vs = "LensFlareDot.vert", fs = "LensFlareDot.frag" }
resource "Shader" "Portal"							{ group = "BlendedWithBackfaces", vs = "Portal.vert", fs = "Portal.frag", toolExport = false, defines="" }
resource "Shader" "PortalGeo"						{ group = "BlendedWithBackfaces", vs = "Portal.vert", fs = "Portal.frag", toolExport = true, neverCastShadows = true, defines="MODEL FROM_PORTAL_INDEX" }
resource "Shader" "RepulsionField"					{ group = "BlendedWithBackfaces", vs = "RepulsionField.vert", fs = "RepulsionField.frag", toolExport = true, neverCastShadows = true, defines="" }
resource "Shader" "RepulsionFieldSphere"			{ group = "BlendedWithBackfaces", vs = "RepulsionField.vert", fs = "RepulsionField.frag", toolExport = true, neverCastShadows = true, defines="SPHERE" }
resource "Shader" "ShrineFence"						{ group = "BlendedWithBackfaces", vs = "ShrineFence.vert", fs = "ShrineFence.frag", toolExport = false }

-- DirectionalLighting.frag
resource "Shader" "LitAlphaFading"					{ group = "Blended", vs = "DirectionalLighting.vert", fs = "DirectionalLighting.frag", toolExport = true, neverCastShadows = true, defines="ALPHA SOFT_ALPHA FADING SELF_LIT LIT COLOR_UNIFORM UVSCALE" }
resource "Shader" "LitAlphaDual"					{ group = "Blended", vs = "DirectionalLighting.vert", fs = "DirectionalLighting.frag", toolExport = true, neverCastShadows = true, defines="ALPHA SELF_LIT LIT DUAL" }
resource "Shader" "LitAlphaColorSoft"				{ group = "Blended", vs = "DirectionalLighting.vert", fs = "DirectionalLighting.frag", toolExport = true, neverCastShadows = true, defines="ALPHA SOFT_ALPHA SELF_LIT LIT COLOR_UNIFORM UVSCALE" }
resource "Shader" "LitAlphaProjected"				{ group = "BlendedBackfacesNoDepth", vs = "DirectionalLighting.vert", fs = "DirectionalLighting.frag", toolExport = true, defines="ALPHA SELF_LIT LIT PROJECTED" }

resource "Shader" "UnlitAlphaProjected"				{ group = "BlendedBackfacesNoDepth", vs = "DirectionalLighting.vert", fs = "DirectionalLighting.frag", toolExport = true, defines="ALPHA SELF_LIT PROJECTED" }
resource "Shader" "UnlitAlphaProjectedTint"			{ group = "BlendedBackfacesNoDepth", vs = "DirectionalLighting.vert", fs = "DirectionalLighting.frag", toolExport = true, defines="ALPHA COLOR_UNIFORM SELF_LIT PROJECTED" }
resource "Shader" "UnlitColor"						{ group = "Opaque", vs = "DirectionalLighting.vert", fs = "DirectionalLighting.frag", toolExport = true, defines="COLOR_UNIFORM" }
resource "Shader" "UnlitColorFresnel"				{ group = "Opaque", vs = "DirectionalLighting.vert", fs = "DirectionalLighting.frag", toolExport = true, defines="COLOR_UNIFORM FRESNEL_EDGE" }
resource "Shader" "UnlitPoint"						{ group = "Blended", vs = "DirectionalLighting.vert", fs = "DirectionalLighting.frag", defines="POINT" }
resource "Shader" "UnlitCloudPoint"					{ group = "Blended", vs = "DirectionalLighting.vert", fs = "DirectionalLighting.frag", defines="POINT CLOUD_POINT" }
resource "Shader" "UnlitAlphaDual"					{ group = "Blended", vs = "DirectionalLighting.vert", fs = "DirectionalLighting.frag", toolExport = true, defines="ALPHA SELF_LIT DUAL" }
resource "Shader" "UnlitAlphaPoint"					{ group = "Blended", vs = "DirectionalLighting.vert", fs = "DirectionalLighting.frag", defines="ALPHA SELF_LIT POINT" }
resource "Shader" "UnlitAlphaSolid"					{ group = "Blended", vs = "DirectionalLighting.vert", fs = "DirectionalLighting.frag", defines="ALPHA SELF_LIT SOLID" }
resource "Shader" "UnlitAlphaColorSoftFresnel"		{ group = "Blended", vs = "DirectionalLighting.vert", fs = "DirectionalLighting.frag", toolExport = true, defines="ALPHA SOFT_ALPHA SELF_LIT COLOR_UNIFORM FRESNEL_EDGE" }
resource "Shader" "UnlitAlphaColorSoft"				{ group = "Blended", vs = "DirectionalLighting.vert", fs = "DirectionalLighting.frag", toolExport = true, defines="ALPHA SOFT_ALPHA SELF_LIT COLOR_UNIFORM UVSCALE" }
resource "Shader" "UnlitAlphaColorSoftMult"			{ group = "Blended", vs = "DirectionalLighting.vert", fs = "DirectionalLighting.frag", toolExport = true, defines="ALPHA SOFT_ALPHA SELF_LIT COLOR_UNIFORM UVSCALE ALPHA_MULT" }
resource "Shader" "UnlitAlphaCloudPoint"			{ group = "Blended", vs = "DirectionalLighting.vert", fs = "DirectionalLighting.frag", defines="ALPHA SELF_LIT POINT CLOUD_POINT" }
resource "Shader" "UnlitAlphaTestDual"				{ group = "Opaque", vs = "DirectionalLighting.vert", fs = "DirectionalLighting.frag", toolExport = true, defines="SELF_LIT ALPHA_TEST COLOR_UNIFORM DUAL DUAL_ADD" }
resource "Shader" "DirectionalLighting"				{ group = "Opaque", vs = "DirectionalLighting.vert", fs = "DirectionalLighting.frag", toolExport = true, defines="COLOR_UNIFORM SELF_LIT LIT" }
resource "Shader" "DirectionalLightingRail"			{ group = "Opaque", vs = "DirectionalLighting.vert", fs = "DirectionalLighting.frag", toolExport = true, defines="LIT RAIL_SKIN" }
resource "Shader" "DepthPrepass"					{ group = "DepthPrepass", vs = "DepthPrepass.vert", fs = "Black.frag", toolExport = true }
resource "Shader" "CloudQuadFast"					{ group = "Blended", vs = "FlatCloud.vert", fs = "FlatCloud.frag" }
resource "Shader" "CloudQuadDiamond"				{ group = "Opaque", vs = "FlatCloud.vert", fs = "FlatCloud.frag", defines="DIAMOND" }
resource "Shader" "CloudQuadDiamondMotion"			{ group = "Motion", vs = "FlatCloud.vert", fs = "MotionGen.frag", defines="DIAMOND MESH MOTION" }
resource "Shader" "CloudQuadSoftFast"				{ group = "Blended", vs = "FlatCloud.vert", fs = "FlatCloud.frag", defines="SOFT_PARTICLES" }
resource "Shader" "CloudQuadFluffy"					{ group = "Blended", vs = "FlatCloud.vert", fs = "FlatCloud.frag", defines="SOFT_PARTICLES FLUFFY MINIMAL" }
resource "Shader" "CloudQuadParticleFluffy"			{ group = "Cloud", vs = "FlatCloud.vert", fs = "FlatCloud.frag", defines="SOFT_PARTICLES FLUFFY" }

resource "Shader" "Tail"							{ group = "BlendedWithBackfaces", vs = "Trail.vert", fs = "Trail.frag", defines="TAIL" }
resource "Shader" "TailMotion"						{ group = "Motion", vs = "Trail.vert", fs = "Trail.frag", defines="TAIL MOTION" }

-- TrajectoryLine
resource "Shader" "TrajectoryLine"					{ group = "Blended", vs = "TrajectoryLine.vert", fs = "TrajectoryLine.frag", toolExport = true, defines="" }
resource "Shader" "Catenary"						{ group = "BlendedWithBackfacesForeground", vs = "Catenary.vert", fs = "Catenary.frag", defines="" }

-- NoOp
resource "Shader" "NoOp"							{ group = "Opaque", vs = "NoOp.vert", fs = "NoOp.frag", toolExport = true, defines = "" }

-- NETEASE MERGE

resource "Shader" "AP21NineColor"					{ group = "Opaque", vs = "AP21NineColor.vert", fs = "AP21NineColor.frag", toolExport = true, defines="" }
resource "Shader" "NineColorPearlCoach"				{ group = "Opaque", vs = "AP21NineColor.vert", fs = "AP21NineColor.frag", toolExport = true, defines="PEARLCOACH" }
resource "Shader" "AP21DeerShout"					{ group = "BlendedWithBackfaces", vs = "AP21DeerShout.vert", fs = "AP21DeerShout.frag", toolExport = true, defines="" }
resource "Shader" "AvatarChamNineColor"				{ group = "Opaque", vs = "Avatar.vert", fs = "Avatar.frag", toolExport = false, defines="CHAM CAPE_INTEGRITY NINECOLOR GLITTER BUTTERFLY" }
resource "Shader" "AP30NineColor"					{ group = "Opaque", vs = "AP21NineColor.vert", fs = "AP21NineColor.frag", toolExport = true, defines="CRACK" }

resource "Shader" "AvatarChamGlitterAlphaAttrib"  	{ group = "Blended", vs = "Avatar.vert", fs = "Avatar.frag", toolExport = false, defines="CHAM CAPE_INTEGRITY ALPHA GLITTER BUTTERFLY ATTRIB" }
resource "Shader" "MeshIceRefraction"  				{ group = "BlendedDepth", vs = "Ice.vert", fs = "Ice.frag", toolExport = true, defines="" }
resource "Shader" "SnowMesh"  						{ group = "Opaque", vs = "Snow.vert", fs = "Snow.frag", toolExport = true, defines="" }
resource "Shader" "SnowMeshSh"  					{ group = "Opaque", vs = "Snow.vert", fs = "Snow.frag", toolExport = true, defines="BAKED" }

resource "Shader" "FlipBook"						{ group = "Opaque", vs = "FlipBook.vert", fs = "FlipBook.frag" }

resource "Shader" "EelSwim"							{ group = "Opaque", vs = "Mesh.vert", fs = "Mesh.frag", toolExport = true, defines = "SELF_LIT COLOR_UNIFORM EEL_SWIM" }
resource "Shader" "AP30Squid"						{ group = "Blended", vs = "Mesh.vert", fs = "Mesh.frag", toolExport = true, defines = "ALPHA SELF_LIT COLOR_UNIFORM SQUID" }
