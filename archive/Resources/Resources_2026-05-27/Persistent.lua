-------------------------------------------------------------------------------
-- Notes:  Lists all the resources that are loaded at program startup and
--         remain loaded until program termination.
--
-- Author: John Edwards
-- Date C: 5-25-2012
-------------------------------------------------------------------------------

if _G["SKY_ENABLE_RETAIL_DEMO"] == nil then
	SKY_ENABLE_RETAIL_DEMO = os.getenv("SKY_ENABLE_RETAIL_DEMO")
end

-------------------------------------------------------------------------------
-- SCRIPTS
-------------------------------------------------------------------------------

resource "Script" "Account"			{ source = "Scripts/Account.lua", stripDebug = false }

-------------------------------------------------------------------------------
-- FILES
-------------------------------------------------------------------------------
resource "AllLevelList" "AllLevels" {}

-- @HACK: For FluffyClouds
file "Data/Tex3D/CloudNoise.vol"
file "Data/Tex3D/CloudFluffy.vol"
file "Data/Tex3D/PerlinNoise.vol"

if _G["CONFIG"] ~= "Gold" then
file "Data/Vars/Vars.lua"
file "Data/Vars/Vars_Live.lua"
file "Data/Vars/Vars_Stabilization.lua"
file "Data/Vars/Vars_Test.lua"
file "Data/Vars/Vars_AppleRetailDemo.lua"
file "Data/Vars/Vars_SwitchRC2.lua"
end

-- @HACK: These are only here because precompiled lua doesnt work for 64-bit platforms
--        (which is all of our platforms). Once we fix the compile pipeline these should be removed
file "Data/Scripts/LoadLevel.lua"
file "Data/Scripts/DebugFunctions.lua"
file "Data/Scripts/Account.lua"
--file "Data/Scripts/AllocatorTest.lua"

file "Data/Resources/ARAnchorPropertyDefs.json"
file "Data/Resources/ARImageMarkerDefs.json"
file "Data/Resources/AudienceEventDefs.json"
file "Data/Resources/CameraQuestDefs.json"
file "Data/Resources/CollectibleDefs.json"
file "Data/Resources/Constellations.json"
file "Data/Resources/DailyQuestDefs.json"
file "Data/Resources/NpcDefs.json"
file "Data/Resources/OutfitDefs.json"
file "Data/Resources/PlaceableDefs.json"
file "Data/Resources/MapDefs.json"
file "Data/Resources/MessageTypes.json"
file "Data/Resources/SeasonTemplate.json"
file "Data/Resources/WorldQuestDefs.json"
file "Data/Resources/CreatureQuestDefs.json"
file "Data/Resources/CreatureQuestWaveDefs.json"
file "Data/Resources/RadianceSpawnDefs.json"
file "Data/Resources/StormSpawnerDefs.json"
file "Data/Resources/DarknessSpawnWaveDefs.json"
file "Data/Resources/DyeColorDefs.json"
file "Data/Resources/DynamicMenuGroupDefs.json"
file "Data/Resources/DynamicMenuIODefs.json"
file "Data/Resources/SocialFeedPrompts.json"

file "Data/Resources/BehaviorTrees/Behavior_IdleStand.json"
file "Data/Resources/BehaviorTrees/Behavior_IdleLook.json"
file "Data/Resources/BehaviorTrees/Behavior_Patrol.json"
file "Data/Resources/BehaviorTrees/Behavior_ReactToNearbyPlayer.json"
file "Data/Resources/BehaviorTrees/Behavior_GuardReact.json"
file "Data/Resources/BehaviorTrees/NPC_WaypointWander.json"
file "Data/Resources/BehaviorTrees/NPC_WaypointIdle.json"
file "Data/Resources/BehaviorTrees/NPC_HostileGuard.json"
file "Data/Resources/BehaviorTrees/NPC_GuardIdle.json"
file "Data/Resources/BehaviorTrees/NPC_GuardWander.json"
file "Data/Resources/BehaviorTrees/NPC_PersonalityWander.json"
file "Data/Resources/BehaviorTrees/NPC_PersonalityCarnivalGuest.json"
file "Data/Resources/BehaviorTrees/NPC_AnnoyingKid.json"
file "Data/Resources/BehaviorTrees/NPC_TGCEmployee.json"

if _G["CONFIG"] ~= "Gold" then
file "Data/Debug/sample_video_defs.json"
file "Data/Debug/sample_video_schedule.json"

-- For testing resource sync
file "Data/Debug/resource_sync_automated_test_file.dat"
end

remote_file "Data/Debug/build_number.txt"

-- Replays
-- file "Data/Replays/DayHub2Stitched.v2.replay"
if SKY_ENABLE_RETAIL_DEMO then
	file "Data/Replays/RetailDemoDawn.v2.replay"
	file "Data/Replays/RetailDemoSunset.v2.replay"
	file "Data/Replays/RetailDemoSunsetDownhill.v2.replay"
end

-- Machine Learning file, currently in use with ggml on Windows for Whisper speech recognition
if PLATFORM == "win" then
	file "Data/ML/ggml-base.bin"
end

-- AR Marker image
if PLATFORM == "iphoneos" or PLATFORM == "android" then
	file "Data/Images/AR/ARMarker.png"
	file "Data/Images/AR/ARMarker2.png"
	file "Data/Images/AR/ARMarker3.png"
end

-- Make animation list
resource "CompiledAnimationList" "AnimationList" { noPack = true }


-------------------------------------------------------------------------------
-- IMAGES
-------------------------------------------------------------------------------

resourceref "Image" "Arial32"
resourceref "Image" "Consolas32"

-- Intro resources
resourceref "Image" "UISpot"
resourceref "Image" "Noise3Ch"
resourceref "Image" "Noise3ChSoft"
resourceref "Image" "CharSkyRayBasicTex"
resourceref "Image" "RedL2"
resourceref "Image" "RedD3"
resourceref "Image" "Gray"
resourceref "Image" "YellowD2"
resourceref "Image" "StoneBaseSh"
resourceref "Image" "AncestorBlue"
resourceref "Image" "BlueL2"
resourceref "Image" "GrayD1"
resourceref "Image" "GrayL2"
resourceref "Image" "Orange"
resourceref "Image" "BasicGeoAtlas1"
resourceref "Image" "Black"
resourceref "Image" "White"
resourceref "Image" "Red"
resourceref "Image" "OrangeL1"
resourceref "Image" "OrangeL2"
resourceref "Image" "Rainbow"

resourceref "Image" "AttribSimpleGlow"
resourceref "Image" "AvatarMaskBasicChamTex"
resourceref "Image" "AvatarMaskBasicTex" -- replaced with CharRampCool
resourceref "Image" "CharRampS1"
resourceref "Image" "CharSkyRayBasicTexSh"
resourceref "Image" "Clear"
resourceref "Image" "CloudFarTex"
resourceref "Image" "CloudStripTex"
resourceref "Image" "DawnIntroGate"
resourceref "Image" "DawnIntroGateSh"
resourceref "Image" "StoneBase"
resourceref "Image" "StoneBaseMotif"
resourceref "Image" "StoneBlueL1"
resourceref "Image" "StoneBlueD3"
resourceref "Image" "StoneGrunge2"
resourceref "Image" "StoneRamp"
resourceref "Image" "StoneRamp2"
resourceref "Image" "SandNoiseGray04"
resourceref "Image" "Diamonds05"

-- Compositor textures
resourceref "Image" "NoiseBlue3Ch"
resourceref "Image" "HeatTex"

resourceref "Image" "UpNormal"

resourceref "Image" "CliffSh"
resourceref "Image" "SoilSh"
resourceref "Image" "RockHeightCliffSh"
resourceref "Image" "WallSh"
resourceref "Image" "GoldSh"
resourceref "Image" "TileCeilingSh"
resourceref "Image" "GlacierSh"
resourceref "Image" "TileFloorSh"
resourceref "Image" "CliffWetSh"
resourceref "Image" "BrickSh"
resourceref "Image" "WoodSh"
resourceref "Image" "WoodPlankSh"

resourceref "Image" "GrassNorTex0"
resourceref "Image" "GrassNorTex1"
resourceref "Image" "GrassMask"

resourceref "Image" "OceanNormal"
resourceref "Image" "Caustics"
resourceref "Image" "Caustics2"
resourceref "Image" "Caustics2Normal"
resourceref "Image" "SandMask"
resourceref "Image" "OceanFoam"

resourceref "Image" "FxFlameRayTex"
resourceref "Image" "FxRainbowTex1"
resourceref "Image" "WingAuraRainbow"

-- Video Texture
resourceref "Image" "Video0"
resourceref "Image" "Video1"

-- UI
resourceref "Image" "UILogo"
resourceref "Image" "UIRingBold"
resourceref "Image" "UISphere"
resourceref "Image" "TGCLogoFlat"

-- Particle
resourceref "Image" "ParticleAtlas"
resource "ImageRegion" "rubbleR"		{ image = "ParticleAtlas", uv = { 0,   0, 1/8, 1/8 } }
resource "ImageRegion" "rubble2R"		{ image = "ParticleAtlas", uv = { 1/8, 0, 2/8, 1/8 } }
resource "ImageRegion" "thunderR"		{ image = "ParticleAtlas", uv = { 2/8, 0, 3/8, 1/8 } }
resource "ImageRegion" "lightningR"		{ image = "ParticleAtlas", uv = { 3/8, 0, 4/8, 1/8 } }

resource "ImageRegion" "squareR"		{ image = "ParticleAtlas", uv = { 0,   1/8, 1/8, 2/8 } }
resource "ImageRegion" "dirtR"			{ image = "ParticleAtlas", uv = { 1/8, 1/8, 2/8, 2/8 } }
resource "ImageRegion" "auraR"			{ image = "ParticleAtlas", uv = { 2/8, 1/8, 3/8, 2/8 } }
resource "ImageRegion" "petalR"			{ image = "ParticleAtlas", uv = { 3/8, 1/8, 4/8, 2/8 } }

resource "ImageRegion" "crossR"			{ image = "ParticleAtlas", uv = { 0,   2/8, 1/8, 3/8 } }
resource "ImageRegion" "doodleR"		{ image = "ParticleAtlas", uv = { 1/8, 2/8, 2/8, 3/8 } }
resource "ImageRegion" "clothR"			{ image = "ParticleAtlas", uv = { 2/8, 2/8, 3/8, 3/8 } }
resource "ImageRegion" "wispyR"			{ image = "ParticleAtlas", uv = { 3/8, 2/8, 4/8, 3/8 } }

resource "ImageRegion" "rippleR"		{ image = "ParticleAtlas", uv = { 0, 3/8, 1/8, 4/8 } }
resource "ImageRegion" "circleR"		{ image = "ParticleAtlas", uv = { 0.125, 3/8, 0.25, 0.5 } }
resource "ImageRegion" "starR"			{ image = "ParticleAtlas", uv = { 0.25, 3/8, 3/8, 0.5 } }
resource "ImageRegion" "dotR"			{ image = "ParticleAtlas", uv = { 3/8, 3/8, 0.5, 0.5 } }

resource "ImageRegion" "snowR"			{ image = "ParticleAtlas", uv = { 0.5, 0, 0.625, 0.125 } }
resource "ImageRegion" "dustR"			{ image = "ParticleAtlas", uv = { 0.625, 0, 0.75, 0.125 } }

resource "ImageRegion" "sandR"			{ image = "ParticleAtlas", uv = { 0.5, 0.125, 0.625, 0.25 } }
resource "ImageRegion" "glowR"			{ image = "ParticleAtlas", uv = { 0.625, 0.125, 0.75, 0.25 } }

resource "ImageRegion" "glitterR"		{ image = "ParticleAtlas", uv = { 0.75, 0, 1, 0.25 } }
resource "ImageRegion" "sandstormR"		{ image = "ParticleAtlas", uv = { 0.5, 0.25, 0.75, 0.5 } }
resource "ImageRegion" "ringR"			{ image = "ParticleAtlas", uv = { .75, .25, 1, .5 } }

resource "ImageRegion" "poofR"			{ image = "ParticleAtlas", uv = { 0, .5, .25, .75 } }
resource "ImageRegion" "boonR"			{ image = "ParticleAtlas", uv = { .25, .5, .5, .75 } }

resource "ImageRegion" "exclamationR"	{ image = "ParticleAtlas", uv = { 0/16, 12/16, 1/16, 13/16 } }
resource "ImageRegion" "questionR"		{ image = "ParticleAtlas", uv = { 1/16, 12/16, 2/16, 13/16 } }
resource "ImageRegion" "heartR"			{ image = "ParticleAtlas", uv = { 0/16, 13/16, 1/16, 14/16 } }
resource "ImageRegion" "sleepR"			{ image = "ParticleAtlas", uv = { 1/16, 13/16, 2/16, 14/16 } }
resource "ImageRegion" "lightR"			{ image = "ParticleAtlas", uv = { 1/8, 6/8, 2/8, 7/8 } }

resource "ImageRegion" "hahahaR"        { image = "ParticleAtlas", uv = { 0/16, 14/16, 1/16, 15/16 } }
resource "ImageRegion" "angryveinR"     { image = "ParticleAtlas", uv = { 1/16, 14/16, 2/16, 15/16 } }
resource "ImageRegion" "nothanksR"      { image = "ParticleAtlas", uv = { 0/16, 15/16, 1/16, 16/16 } }
resource "ImageRegion" "petal2R"        { image = "ParticleAtlas", uv = { 1/16, 15/16, 2/16, 16/16 } }
resource "ImageRegion" "bubbleR"        { image = "ParticleAtlas", uv = { 2/16, 14/16, 3/16, 15/16 } }
resource "ImageRegion" "CresentR"       { image = "ParticleAtlas", uv = { 2/16, 15/16, 3/16, 1 } }
resource "ImageRegion" "coinR"      	{ image = "ParticleAtlas", uv = { 3/16, 14/16, 4/16, 15/16 } }
resource "ImageRegion" "featherR"      	{ image = "ParticleAtlas", uv = { 3/16, 15/16, 4/16, 16/16 } }

resource "ImageRegion" "rayR"			{ image = "ParticleAtlas", uv = { .25, .75, .5, 1 } }
resource "ImageRegion" "CloudAnimR"		{ image = "ParticleAtlas", uv = { .5, .5, 1, 1 } }

-- Logos
resourceref "Image" "AWSLogoLight"
resourceref "Image" "FMODLogoLight"
resourceref "Image" "AMBERLogo"
resourceref "Image" "FacebookLogo"
resourceref "Image" "MirrativLogo"
resourceref "Image" "Funtap18plus"
resourceref "Image" "RolandTR909Logo"

-- Diffuse Textures
resourceref "Image" "CharRampAvatar"
resourceref "Image" "CharRampSpirit"

resourceref "Image" "CharRampMono"
resourceref "Image" "CharRampWarm"
resourceref "Image" "CharRampCool"

resourceref "Image" "CharRampS2"
resourceref "Image" "CharRampS3"
resourceref "Image" "CharRampS4"
resourceref "Image" "CharRampS6"
resourceref "Image" "CharRampS7"
resourceref "Image" "CharRampS8"
resourceref "Image" "CharRampS9"
resourceref "Image" "CharRampS10"
resourceref "Image" "CharRampS11"
resourceref "Image" "CharRampS12"
resourceref "Image" "CharRampS13"
resourceref "Image" "CharRampS14"
resourceref "Image" "CharRampS16"
resourceref "Image" "CharRampS16Aurora"
resourceref "Image" "CharRampAuroraNPC"
resourceref "Image" "CharRampAuroraNPC2"
resourceref "Image" "CharRampS16Misc"
resourceref "Image" "CharRampS17"
resourceref "Image" "CharRampS18"
resourceref "Image" "CharRampS19"
resourceref "Image" "CharRampS20"
resourceref "Image" "CharRampS21"
resourceref "Image" "CharRampS21Deer"
resourceref "Image" "CharRampS23"
resourceref "Image" "CharRampS24"
resourceref "Image" "CharRampS26"
resourceref "Image" "CharRampS27"
resourceref "Image" "CharRampS28"
resourceref "Image" "CharRampS29"
resourceref "Image" "CharRampS30"
resourceref "Image" "CharRampS31"
resourceref "Image" "CharRampS31Starry"
resourceref "Image" "S31StarryAlpha"
resourceref "Image" "Wing_AP27Darknesstexture"

resourceref "Image" "CharRampCustom01"
resourceref "Image" "CharRampCustom02"


resourceref "Image" "CharRampAlpha1"
resourceref "Image" "CharRampAlpha2"
resourceref "Image" "CharRampEvents"
resourceref "Image" "CharRampEvents2"
resourceref "Image" "CharRampEvents3"
resourceref "Image" "CharRampEvents4"
resourceref "Image" "CharRampRainbow"
resourceref "Image" "CharRampKizunaAi"
resourceref "Image" "TwinRibbonEmote"
resourceref "Image" "CharRampXmas_Tex"
resourceref "Image" "CharRampXmas_Att"
resourceref "Image" "CharRampLNY"
resourceref "Image" "CharRampLNY1"
resourceref "Image" "CharRampLNY2"
resourceref "Image" "CharRampMisc1"
resourceref "Image" "CharRampCrabLace"
resourceref "Image" "CharRampStarJar"
resourceref "Image" "CharRampGray"
resourceref "Image" "CharRampDB01"

resourceref "Image" "SkyRayCTex"


resourceref "Image" "PropRampStoneTint"
resourceref "Image" "PropRampStoneGrey"
resourceref "Image" "PropRampStoneBlue"
resourceref "Image" "PropRampStoneOrange"
resourceref "Image" "PropRampStonePurple"

resourceref "Image" "PropRampWoodOrange"

resourceref "Image" "PropRampAntiqueTint"

resourceref "Image" "PropRampS25"

resourceref "Image" "PropRampS27"
-- For procedural AutoForest buildings.
resourceref "Image" "Brick"

-- Attribute Textures
resourceref "Image" "Attrib_General"
resourceref "Image" "Attrib_GlowRamp"
resourceref "Image" "Attrib_GlossRamp"
resourceref "Image" "Attrib_Fabric"
resourceref "Image" "Attrib_Leather"
resourceref "Image" "Attrib_Scales"
resourceref "Image" "Attrib_CrabLace"
resourceref "Image" "Attrib_ScalesIridescent"
resourceref "Image" "Attrib_MetalBeaten"

resourceref "Image" "CharSkyKid_General_Att" -- replaced with AttribGeneral, remove when all assets have been updated

-- Masking Textures
resourceref "Image" "Mask_General"
resourceref "Image" "Mask_Wing"
resourceref "Image" "Mask_Ramp"
resourceref "Image" "Mask_RampEffects"
resourceref "Image" "Mask_Pastel"

-- Fabric Pattern Textures
resourceref "Image" "Pattern_Checker"
resourceref "Image" "Pattern_Plaid"
resourceref "Image" "Pattern_Aloha"

-- Creature ramps
resourceref "Image" "CreatureRamp"
resourceref "Image" "GhostCreatureRamp"



resourceref "Image" "Noise2Ch"
resourceref "Image" "DeerSpotSDF"
resourceref "Image" "FeatherAlpha"

-- ENVIRONMENT --

resourceref "Image" "CreatureMotif"
resourceref "Image" "CloudThinTex"
resourceref "Image" "ThreeDee"
resourceref "Image" "ThreeDeeCauliflower"

resourceref "Image" "CloudFinTex"
resourceref "Image" "MetalBeatenSh"
resourceref "Image" "FabricSh"
resourceref "Image" "FabricBase"
resourceref "Image" "FabricBaseSh"
resourceref "Image" "WoodBase"
resourceref "Image" "WoodBaseLight"
resourceref "Image" "WoodBaseSh"
resourceref "Image" "PaintStrokeSh_Terrain"
resourceref "Image" "PaintStrokeSh2_Terrain"
resourceref "Image" "PaintStroke_Round_Short"
resourceref "Image" "PaintStroke_Round_Long"
resourceref "Image" "PaintStroke_Round_Swirl"
resourceref "Image" "PaintStroke_Flat_Short"
resourceref "Image" "PaintStroke_Flat_Checker"
resourceref "Image" "PaintStrokeSh_Round_Short"
resourceref "Image" "PaintStrokeSh_Round_Long"
resourceref "Image" "PaintStrokeSh_Round_Swirl"
resourceref "Image" "PaintStrokeSh_Flat_Short"
resourceref "Image" "PaintStrokeSh_Flat_Checker"
-- duplicate resourceref "Image" "WoodPlankSh"
resourceref "Image" "Leaves"
resourceref "Image" "Petals"
resourceref "Image" "FoliageTintColor"

resourceref "Image" "ConstellationImageDawn"
resourceref "Image" "ConstellationImageDay"
resourceref "Image" "ConstellationImageRain"
resourceref "Image" "ConstellationImageSunset"
resourceref "Image" "ConstellationImageDusk"
resourceref "Image" "ConstellationImageNight"
resourceref "Image" "ConstellationImageStorm"
resourceref "Image" "ConstellationImageFriendButterflies"
resourceref "Image" "ConstellationImageFriendCrab"
resourceref "Image" "ConstellationImageFriendCrown"
resourceref "Image" "ConstellationImageFriendDrum"
resourceref "Image" "ConstellationImageFriendManta"
resourceref "Image" "ConstellationImageFriendUmbrella"
resourceref "Image" "ConstellationImageFriendKids"
resourceref "Image" "ConstellationImageFriendHarp"
resourceref "Image" "ConstellationImageFriendMonument"
resourceref "Image" "ConstellationImageFriendJellyfish"
resourceref "Image" "ConstellationImageAP"
resourceref "Image" "ConstellationImageAP02"
resourceref "Image" "ConstellationImageAP03"
resourceref "Image" "ConstellationImageAP04"
resourceref "Image" "ConstellationImageAP05"
resourceref "Image" "ConstellationImageAP06"
resourceref "Image" "ConstellationImageAP07"
resourceref "Image" "ConstellationImageAP08"
resourceref "Image" "ConstellationImageAP09"
resourceref "Image" "ConstellationImageAP10"
resourceref "Image" "ConstellationImageAP11"
resourceref "Image" "ConstellationImageAP12"
resourceref "Image" "ConstellationImageAP13"
resourceref "Image" "ConstellationImageAP14"
resourceref "Image" "ConstellationImageAP15"
resourceref "Image" "ConstellationImageAP16"
resourceref "Image" "ConstellationImageAP17"
resourceref "Image" "ConstellationImageAP18"
resourceref "Image" "ConstellationImageAP19"
resourceref "Image" "ConstellationImageAP21"
resourceref "Image" "ConstellationImageAP22"
resourceref "Image" "ConstellationImageAP23"
resourceref "Image" "ConstellationImageAP24"
resourceref "Image" "ConstellationImageAP25"
resourceref "Image" "ConstellationImageAP26"
resourceref "Image" "ConstellationImageAP27"
resourceref "Image" "ConstellationImageAP28"
resourceref "Image" "ConstellationImageAP29"
resourceref "Image" "ConstellationImageAP30"
resourceref "Image" "UIRing"
resourceref "Image" "UIRingBloom"
resourceref "Image" "UIRingBigThin"
resourceref "Image" "UIRingBigThinner"
resourceref "Image" "UIRingBigMedium"
resourceref "Image" "UIRingBigThick"
resourceref "Image" "UIBorderThin"
resourceref "Image" "UIBorderThinFill"
resourceref "Image" "UIStepHoop"
resourceref "Image" "ShoutRingBloom"
resourceref "Image" "UIArrowUp"
resourceref "Image" "UIEye"
resourceref "Image" "UIFingerSingle"
resourceref "Image" "UIFingerSingleShadow"
resourceref "Image" "UIFingerDouble"
resourceref "Image" "UIBar"
resourceref "Image" "UIFade"
resourceref "Image" "UIFadeLine"
resourceref "Image" "UISphereFade"
resourceref "Image" "UiButtonGlow"
resourceref "Image" "UiBorderGlowSoft"
resourceref "Image" "UiBorderGlowHard"
resourceref "Image" "UiBorderGlowThinSoft"
resourceref "Image" "UiBorderGlowThinHard"
resourceref "Image" "UiBorderGlowThickSoft"
resourceref "Image" "UiBorderGlowThickHard"
resourceref "Image" "UiRadialSliceGlowSoft"
resourceref "Image" "UiBubbleButtonBorder"
resourceref "Image" "UiButtonBorderThin"
resourceref "Image" "UiMenuTabHighlight"
resourceref "Image" "UiButtonToggledEdge"
resourceref "Image" "UiMenuGradientEdge"
resourceref "Image" "UiMenuGradientLinear"
resourceref "Image" "UiMenuGradientVertical"
resourceref "Image" "UiMenuGradientHorizontal"
resourceref "Image" "UiRadialCursorBg"
resourceref "Image" "UiMiscGradientNineSlice"
resourceref "Image" "UiMenuShadowLeft"
resourceref "Image" "UiMapTintOverlay"
resourceref "Image" "UiVignette"
resourceref "Image" "UiGradientShout_Quarter"
resourceref "Image" "UiMiscDropShadowCircle"
resourceref "Image" "UiMiscDropShadowCircleSmall"
resourceref "Image" "UiMaskCircleGlow"
resourceref "Image" "UiMiscHeartGlow"
resourceref "Image" "UiMiscTrustTierShadow"
resourceref "Image" "UiMapCloud_Tile"
resourceref "Image" "UiMapInkblot"
resourceref "Image" "UiAlbumAurora"
resourceref "Image" "DarkstoneNorTex"
resourceref "Image" "Wisteria"
resourceref "Image" "FlowerTex"
resourceref "Image" "UiMapSelectedHighlight"

resourceref "Image" "Portal"
resource "ImageRegion" "PortalDawn"			{ image = "Portal", uv = { 0/3, 0/3, 1/3, 1/3 } }
resource "ImageRegion" "PortalDay"			{ image = "Portal", uv = { 1/3, 0/3, 2/3, 1/3 } }
resource "ImageRegion" "PortalRain"			{ image = "Portal", uv = { 2/3, 0/3, 3/3, 1/3 } }
resource "ImageRegion" "PortalSunset"		{ image = "Portal", uv = { 0/3, 1/3, 1/3, 2/3 } }
resource "ImageRegion" "PortalDusk"			{ image = "Portal", uv = { 1/3, 1/3, 2/3, 2/3 } }
resource "ImageRegion" "PortalNight"		{ image = "Portal", uv = { 2/3, 1/3, 3/3, 2/3 } }
resource "ImageRegion" "PortalStorm"		{ image = "Portal", uv = { 0/3, 2/3, 1/3, 3/3 } }
resource "ImageRegion" "PortalAP"			{ image = "Portal", uv = { 1/3, 2/3, 2/3, 3/3 } }
resource "ImageRegion" "PortalPrairie"		{ image = "Portal", uv = { 2/3, 2/3, 3/3, 3/3 } }
resource "ImageRegion" "PortalCandleSpace"	{ image = "Portal", uv = { 2/3, 2/3, 3/3, 3/3 } }
resource "ImageRegion" "PortalWhite"		{ image = "Portal", uv = { 0.5, 0, 0.6, 0.1 } }

resourceref "Image" "StorySpacePortals"

-- COLOR TEX -- Note : Red and OrangeL1 are in boot.lua for Candlespace release loading

resourceref "Image" "GreenGray"
resourceref "Image" "AncestorBlueD1"
resourceref "Image" "AncestorBlueL1"
resourceref "Image" "Magenta"
resourceref "Image" "MagentaD3"
resourceref "Image" "MagentaD2"
resourceref "Image" "MagentaD1"
resourceref "Image" "MagentaL3"
resourceref "Image" "MagentaL2"
resourceref "Image" "MagentaL1"
resourceref "Image" "OrangeD3"
resourceref "Image" "OrangeD2"
resourceref "Image" "OrangeD1"
resourceref "Image" "OrangeL3"
resourceref "Image" "PurpleD3"
resourceref "Image" "Yellow"
resourceref "Image" "YellowD3"
resourceref "Image" "YellowD1"
resourceref "Image" "YellowL3"
resourceref "Image" "YellowL2"
resourceref "Image" "YellowL1"
resourceref "Image" "Cyan"
resourceref "Image" "CyanD3"
resourceref "Image" "CyanD2"
resourceref "Image" "CyanD1"
resourceref "Image" "CyanL3"
resourceref "Image" "CyanL2"
resourceref "Image" "CyanL1"
resourceref "Image" "Lime"
resourceref "Image" "LimeD3"
resourceref "Image" "LimeD2"
resourceref "Image" "LimeD1"
resourceref "Image" "LimeL3"
resourceref "Image" "LimeL2"
resourceref "Image" "LimeL1"
resourceref "Image" "Blue"
resourceref "Image" "BlueD3"
resourceref "Image" "BlueD2"
resourceref "Image" "BlueD1"
resourceref "Image" "BlueL3"
resourceref "Image" "BlueL1"
resourceref "Image" "Brown"
resourceref "Image" "Green"
resourceref "Image" "GreenD3"
resourceref "Image" "GreenD2"
resourceref "Image" "GreenD1"
resourceref "Image" "GreenL3"
resourceref "Image" "GreenL2"
resourceref "Image" "GreenL1"
resourceref "Image" "RedD5"
resourceref "Image" "RedD4"
resourceref "Image" "RedD2"
resourceref "Image" "RedD1"
resourceref "Image" "RedL3"
resourceref "Image" "RedL1"
resourceref "Image" "GrayD2"
resourceref "Image" "GrayL1"

resourceref "Image" "PaintBlue"
resourceref "Image" "PaintBlueL1"
resourceref "Image" "PaintBlueL2"
resourceref "Image" "PaintBlueL3"
resourceref "Image" "PaintBlueD1"
resourceref "Image" "PaintBlueD2"
resourceref "Image" "PaintBlueD3"
resourceref "Image" "StoneBlue"
resourceref "Image" "StoneBlueL2"
resourceref "Image" "StoneBlueL3"
resourceref "Image" "StoneBlueD1"
resourceref "Image" "StoneBlueD2"

resourceref "Image" "ColElementWater"
resourceref "Image" "ColElementEarth"
resourceref "Image" "ColElementAir"
resourceref "Image" "ColElementFire"

resourceref "Image" "ElementWater"
resourceref "Image" "ElementEarth"
resourceref "Image" "ElementAir"
resourceref "Image" "ElementFire"
resourceref "Image" "ElementVoid"
resourceref "Image" "ElementMind"
resourceref "Image" "ColorBlackSymbol"
resourceref "Image" "ColorWhiteSymbol"

resourceref "Image" "RainbowBelt"
resourceref "Image" "RainbowBeltStraight"

-- UI COLOR TEX --

resourceref "Image" "UiOrangeL3"
resourceref "Image" "UiGrayL1"

-- PARTICLES --

-- duplicate resourceref "Image" "ParticleAtlas"
resourceref "Image" "ParticleAtlas02"
resourceref "Image" "AudienceEmotesAtlas"
resourceref "Image" "PerlinNoise2D"

-- @TODO: Remove these once all existing levels depend on these as needed.
resourceref "Image" "BrushstrokeSh"
resourceref "Image" "BrushstrokeMask"

-- format is { lower left u, lower left v, upper right u, upper right v }
-- 1st row, left to right
resource "ImageRegion" "crl1"	{ image = "ParticleAtlas02", uv = { 0, 0, 2/8, 2/8 } }
resource "ImageRegion" "crl2"	{ image = "ParticleAtlas02", uv = { 2/8, 0, 4/8, 2/8 } }
resource "ImageRegion" "dot1"	{ image = "ParticleAtlas02", uv = { 4/8, 0, .75, 2/8 } }
resource "ImageRegion" "dot2"	{ image = "ParticleAtlas02", uv = { 6/8, 0, 1, 2/8 } }
-- 2nd row, left to right
resource "ImageRegion" "sqr1"	{ image = "ParticleAtlas02", uv = { 0, 2/8, 2/8, 4/8 } }
resource "ImageRegion" "sqr2"	{ image = "ParticleAtlas02", uv = { 2/8, 2/8, 4/8, 4/8 } }
resource "ImageRegion" "dmd1"	{ image = "ParticleAtlas02", uv = { 4/8, 2/8, .75, 4/8 } }
resource "ImageRegion" "tri1"	{ image = "ParticleAtlas02", uv = { 6/8, 2/8, 1, 4/8 } }
-- 3rd row, left to right
resource "ImageRegion" "dst1"	{ image = "ParticleAtlas02", uv = { 0, 4/8, 2/8, 6/8 } }
resource "ImageRegion" "dst2"	{ image = "ParticleAtlas02", uv = { 2/8, 4/8, 4/8, 6/8 } }
resource "ImageRegion" "cld1"	{ image = "ParticleAtlas02", uv = { 4/8, 4/8, .75, 6/8 } }
resource "ImageRegion" "cld2"	{ image = "ParticleAtlas02", uv = { 6/8, 4/8, 1, 6/8 } }
-- 4th row, left to right
resource "ImageRegion" "clrH"	{ image = "ParticleAtlas02", uv = { 0, 6/8, 2/8, 1 } }
resource "ImageRegion" "dmdH"	{ image = "ParticleAtlas02", uv = { 2/8, 6/8, 4/8, 1 } }
resource "ImageRegion" "sqrH"	{ image = "ParticleAtlas02", uv = { 4/8, 6/8, .75, 1 } }
resource "ImageRegion" "triH"	{ image = "ParticleAtlas02", uv = { 6/8, 6/8, 1, 1 } }

-- AVATAR --

resourceref "Image" "HandyTex"
resourceref "Image" "HairNormal"
resourceref "Image" "FeatherNoise"
resourceref "Image" "GlitterNoiseBlue"
resourceref "Image" "CoinNoise"
resourceref "Image" "HeartNoise"
resourceref "Image" "TGCWireframeNoise"
resourceref "Image" "CapeIntegrity"

resourceref "Image" "AvatarChamBodyTex"

-- Avatar body
resourceref "Image" "SpiritAtlas"

-- Avatar hair/mask/horn/neck
resourceref "Image" "CharSkyKid_All_Grad_Tex"

-- Avatar attribute textures
resourceref "Image" "CharSkyKid_Mask_Simple_Att"

-- UI ATLASES --

-- UIAtlas3
resourceref "Image" "UIAtlas3"
resource "ImageRegion" "UIShopButtonCircle1"			{ image = "UIAtlas3", uv = { 0/3, 0/3, 1/3, 1/3 } }
resource "ImageRegion" "UIShopButtonCircle2"			{ image = "UIAtlas3", uv = { 1/3, 0/3, 2/3, 1/3 } }
resource "ImageRegion" "UIShopButtonCircle3"			{ image = "UIAtlas3", uv = { 2/3, 0/3, 3/3, 1/3 } }
--resource "ImageRegion" "UIShopButtonCircle4"			{ image = "UIAtlas3", uv = { 0/3, 1/3, 1/3, 2/3 } }
--resource "ImageRegion" "UIShopButtonCircle5"			{ image = "UIAtlas3", uv = { 1/3, 1/3, 2/3, 2/3 } }

-- UIAtlas4
resourceref "Image" "UIAtlas4"
resource "ImageRegion" "UIRainbowHeart"					{ image = "UIAtlas4", uv = { 0/2, 0/2, 1/2, 1/2 } }
resource "ImageRegion" "UIRainbowGift"					{ image = "UIAtlas4", uv = { 1/2, 0/2, 2/2, 1/2 } }

-- UITutorialAtlases
resourceref "Image" "UITutorialAtlasAP"
resource "ImageRegion" "UISeasonPassPromoAP"			{ image = "UITutorialAtlasAP", uv = { 0/3, 1/3, 1/3, 2/3 } }
resource "ImageRegion" "UISeasonPassPromo2AP"			{ image = "UITutorialAtlasAP", uv = { 2/3, 0/3, 3/3, 1/3 } }
resource "ImageRegion" "UISeasonPassPromo3AP"			{ image = "UITutorialAtlasAP", uv = { 1/3, 1/3, 2/3, 2/3 } }
resource "ImageRegion" "UISeasonPassPromo4AP"			{ image = "UITutorialAtlasAP", uv = { 1/3, 0/3, 2/3, 1/3 } }
resource "ImageRegion" "UISeasonPassPromo5AP"			{ image = "UITutorialAtlasAP", uv = { 0/3, 0/3, 1/3, 1/3 } }
resource "ImageRegion" "UITutorialUnravelMystery"		{ image = "UITutorialAtlasAP", uv = { 2/3, 1/3, 3/3, 2/3 } }
resource "ImageRegion" "UITutorialSaveSpirits"			{ image = "UITutorialAtlasAP", uv = { 0/3, 2/3, 1/3, 3/3 } }
resource "ImageRegion" "UITutorialFlyHigher"			{ image = "UITutorialAtlasAP", uv = { 1/3, 2/3, 2/3, 3/3 } }
resource "ImageRegion" "UITutorialAscendToStorm"		{ image = "UITutorialAtlasAP", uv = { 2/3, 2/3, 3/3, 3/3 } }

resourceref "Image" "UISeasonPassPromoAP15"
resourceref "Image" "UISeasonPassPromoAP16"
resourceref "Image" "UISeasonPassPromoAP17"
resourceref "Image" "UISeasonPassPromoAP18"
resourceref "Image" "UISeasonPassPromoAP19"
resourceref "Image" "UISeasonPassPromoAP20"
resourceref "Image" "UISeasonPassPromoAP21"
resourceref "Image" "UISeasonPassPromoAP22"
resourceref "Image" "UISeasonPassPromoAP23"
resourceref "Image" "UISeasonPassPromoAP24"
resourceref "Image" "UISeasonPassPromoAP25"
resourceref "Image" "UISeasonPassPromoAP26"
resourceref "Image" "UISeasonPassPromoAP27"
resourceref "Image" "UISeasonPassPromoAP28"
resourceref "Image" "UISeasonPassPromoAP29"
resourceref "Image" "UISeasonPassPromoAP30"

--temporal fix for spellshop tutorial
resourceref "Image" "UISeasonPassPreoderPromoAP06"

-- UITutorialAtlases - SharedSpace
resourceref "Image" "UITutorialAtlasSharedSpaces"
resource "ImageRegion" "UISharedSpacesShareMagic"		{ image = "UITutorialAtlasSharedSpaces", uv = { 0/3, 0/3, 1/3, 1/3 } }
resource "ImageRegion" "UISharedSpacesExploreWorld"		{ image = "UITutorialAtlasSharedSpaces", uv = { 1/3, 0/3, 2/3, 1/3 } }
resource "ImageRegion" "UISharedSpacesUniqueItems"		{ image = "UITutorialAtlasSharedSpaces", uv = { 2/3, 0/3, 3/3, 1/3 } }
resource "ImageRegion" "UISharedSpacesBeCreative"		{ image = "UITutorialAtlasSharedSpaces", uv = { 0/3, 1/3, 1/3, 2/3 } }
resource "ImageRegion" "UISharedSpacesShareTutorial1"	{ image = "UITutorialAtlasSharedSpaces", uv = { 1/3, 1/3, 2/3, 2/3 } }
resource "ImageRegion" "UISharedSpacesShareTutorial2"	{ image = "UITutorialAtlasSharedSpaces", uv = { 2/3, 1/3, 3/3, 2/3 } }
resource "ImageRegion" "UISharedSpacesShareTutorial3"	{ image = "UITutorialAtlasSharedSpaces", uv = { 0/3, 2/3, 1/3, 3/3 } }
resource "ImageRegion" "UISharedSpacesShareTutorial4"	{ image = "UITutorialAtlasSharedSpaces", uv = { 1/3, 2/3, 2/3, 3/3 } }
-- UITutorialAtlases - Penpal
resource "ImageRegion" "UITutorialPenpal"				{ image = "UITutorialAtlasSharedSpaces", uv = { 2/3, 2/3, 3/3, 3/3 } }

resourceref "Image" "UITutorialAtlas02"
resource "ImageRegion" "UITutorialHeal"					{ image = "UITutorialAtlas02", uv = { 0/3, 0/3, 1/3, 1/3 } }
resource "ImageRegion" "UITutorialBetterTogether"		{ image = "UITutorialAtlas02", uv = { 1/3, 0/3, 2/3, 1/3 } }
resource "ImageRegion" "UITutorialGrowCloser"			{ image = "UITutorialAtlas02", uv = { 2/3, 0/3, 3/3, 1/3 } }
resource "ImageRegion" "UITutorialStayInTouch"			{ image = "UITutorialAtlas02", uv = { 0/3, 1/3, 1/3, 2/3 } }
resource "ImageRegion" "UITutorialShowAppreciation"		{ image = "UITutorialAtlas02", uv = { 1/3, 1/3, 2/3, 2/3 } }
resource "ImageRegion" "UITutorialExpressYourself"		{ image = "UITutorialAtlas02", uv = { 2/3, 1/3, 3/3, 2/3 } }
resource "ImageRegion" "UITutorialUnlockGates"			{ image = "UITutorialAtlas02", uv = { 0/3, 2/3, 1/3, 3/3 } }
resource "ImageRegion" "UITutorialFindAll"				{ image = "UITutorialAtlas02", uv = { 1/3, 2/3, 2/3, 3/3 } }
resource "ImageRegion" "UITutorialAscendFriendship"		{ image = "UITutorialAtlas02", uv = { 2/3, 2/3, 3/3, 3/3 } }

resourceref "Image" "UITutorialAtlas03"
resource "ImageRegion" "UITutorialEnhanceExpressions"	{ image = "UITutorialAtlas03", uv = { 0/3, 0/3, 1/3, 1/3 } }
resource "ImageRegion" "UITutorialReceiveBlessing"		{ image = "UITutorialAtlas03", uv = { 1/3, 0/3, 2/3, 1/3 } }
resource "ImageRegion" "UITutorialCompleteConstellation"{ image = "UITutorialAtlas03", uv = { 2/3, 0/3, 3/3, 1/3 } }
resource "ImageRegion" "UITutorialDressUp"				{ image = "UITutorialAtlas03", uv = { 0/3, 1/3, 1/3, 2/3 } }
resource "ImageRegion" "UITutorialAdventureAwaits"		{ image = "UITutorialAtlas03", uv = { 1/3, 1/3, 2/3, 2/3 } }
resource "ImageRegion" "UITutorialEachKingdom"			{ image = "UITutorialAtlas03", uv = { 2/3, 1/3, 3/3, 2/3 } }
resource "ImageRegion" "UITutorialFindSpirits"			{ image = "UITutorialAtlas03", uv = { 0/3, 2/3, 1/3, 3/3 } }
resource "ImageRegion" "UITutorialOfferHearts"			{ image = "UITutorialAtlas03", uv = { 1/3, 2/3, 2/3, 3/3 } }
resource "ImageRegion" "UITutorialDressUp2"				{ image = "UITutorialAtlas03", uv = { 2/3, 2/3, 3/3, 3/3 } }


resourceref "Image" "UITutorialAtlas04"
resource "ImageRegion" "UITutorialVisitingSpirits"      { image = "UITutorialAtlas04", uv = { 0/3, 0/3, 1/3, 1/3 } }
resource "ImageRegion" "UITutorialPerformTogether"      { image = "UITutorialAtlas04", uv = { 1/3, 0/3, 2/3, 1/3 } }
resource "ImageRegion" "UITutorialUnlockRewards"        { image = "UITutorialAtlas04", uv = { 2/3, 0/3, 3/3, 1/3 } }
resource "ImageRegion" "UITutorialFindSpirits2"         { image = "UITutorialAtlas04", uv = { 0/3, 1/3, 1/3, 2/3 } }
resource "ImageRegion" "UITutorialRequirePass"          { image = "UITutorialAtlas04", uv = { 1/3, 1/3, 2/3, 2/3 } }
resource "ImageRegion" "UITutorialPreview"              { image = "UITutorialAtlas04", uv = { 2/3, 1/3, 3/3, 2/3 } }
resource "ImageRegion" "UITutorialVariousForms"         { image = "UITutorialAtlas04", uv = { 0/3, 2/3, 1/3, 3/3 } }
resource "ImageRegion" "UITutorialEventCurrency"        { image = "UITutorialAtlas04", uv = { 1/3, 2/3, 2/3, 3/3 } }
--resource "ImageRegion" ""                             { image = "UITutorialAtlas04", uv = { 2/3, 2/3, 3/3, 3/3 } }

--resourceref "Image" "UITutorialAtlasTrust"
--resource "ImageRegion" "UITutorialAtlasTrust01"      { image = "UITutorialAtlasTrust", uv = { 0/3, 0/3, 1/3, 1/3 } }
--resource "ImageRegion" "UITutorialAtlasTrust02"      { image = "UITutorialAtlasTrust", uv = { 1/3, 0/3, 2/3, 1/3 } }
--resource "ImageRegion" "UITutorialAtlasTrust03"        { image = "UITutorialAtlasTrust", uv = { 2/3, 0/3, 3/3, 1/3 } }
--resource "ImageRegion" "UITutorialAtlasTrust04"         { image = "UITutorialAtlasTrust", uv = { 0/3, 1/3, 1/3, 2/3 } }
--resource "ImageRegion" ""        { image = "UITutorialAtlasFriendship", uv = { 1/3, 1/3, 2/3, 2/3 } }
--resource "ImageRegion" ""        { image = "UITutorialAtlasFriendship", uv = { 2/3, 1/3, 3/3, 2/3 } }
--resource "ImageRegion" ""        { image = "UITutorialAtlasFriendship", uv = { 0/3, 2/3, 1/3, 3/3 } }
--resource "ImageRegion" ""        { image = "UITutorialAtlasFriendship", uv = { 1/3, 2/3, 2/3, 3/3 } }
--resource "ImageRegion" ""        { image = "UITutorialAtlasFriendship", uv = { 2/3, 2/3, 3/3, 3/3 } }

resourceref "Image" "UICollectible_Day01_"
resource "ImageRegion" "UICollectible_Day02"			{ image = "UICollectible_Day01_", uv = { 0, 0, 1, 1/2 } }
resource "ImageRegion" "UICollectibleLine"				{ image = "UICollectible_Day01_", uv = { 0, 1/2, 1, 5/8 } }
resource "ImageRegion" "UICollectibleStarFx"			{ image = "UICollectible_Day01_", uv = { 0, 5/8, 3/8, 1 } }
resource "ImageRegion" "UICollectibleStar"				{ image = "UICollectible_Day01_", uv = { 3/8, 5/8, 4/8, 6/8 } }
resource "ImageRegion" "UICollectibleStarGlow"			{ image = "UICollectible_Day01_", uv = { 3/8, 6/8, 5/8, 8/8 } }

-- UiMiscCircle being used here is temporary, we will add an actual atlas soon!
resourceref "Image" "UiMiscCircle"
resource "ImageRegion" "TguiMaskWhite"					{ image = "UiMiscCircle", uv = { 1/3, 1/3, 2/3, 2/3 } }
resource "ImageRegion" "TguiMaskCircle"					{ image = "UiMiscCircle", uv = { 0, 0, 1, 1 } }

-- UiMiscCircle being used here is temporary, we will add an actual atlas soon!
resourceref "Image" "UIPremulAtlas1"
resourceref "Image" "UIPremulAtlas2"
resourceref "Image" "UIPremulAtlas3"
resourceref "Image" "UIPremulAtlas4"
resource "ImageRegion" "S26SilenceCardRibbon" { image = "UIPremulAtlas4", uv = { 0, 3/4, 3/4, 1 } }
resource "ImageRegion" "S26SilenceCardStar"	{ image = "UIPremulAtlas4", uv = { 3/4, 3/4, 1, 1 } }
resource "ImageRegion" "UiMenuDialGradient" { image = "UIPremulAtlas4", uv = { 0/512, 78/512, (0+422)/512, (78+78)/512 } }
resource "ImageRegion" "UiMenuDialLine" { image = "UIPremulAtlas4", uv = { 0/512, 0/512, (0+422)/512, (0+78)/512 } }
resource "ImageRegion" "UiMenuSpeechBg" { image = "UIPremulAtlas1", uv = { 193/512, 303/512, (193+82)/512, (303+82)/512 } }
resource "ImageRegion" "UiMenuSpeechOutline" { image = "UIPremulAtlas1", uv = { 193/512, 221/512, (193+82)/512, (221+82)/512 } }
resource "ImageRegion" "UiMenuSpeechShadow" { image = "UIPremulAtlas1", uv = { 275/512, 221/512, (275+86)/512, (221+82)/512 } }
resource "ImageRegion" "UiMenuSpinner" { image = "UIPremulAtlas1", uv = { 254/512, 85/512, (254+64)/512, (85+64)/512 } }
resource "ImageRegion" "UiMenuSpinnerThin" { image = "UIPremulAtlas1", uv = { 190/512, 85/512, (190+64)/512, (85+64)/512 } }
resource "ImageRegion" "UiMenuSpinner_Small" { image = "UIPremulAtlas1", uv = { 0/512, 16/512, (0+32)/512, (16+32)/512 } }
resource "ImageRegion" "UiMenuStar" { image = "UIPremulAtlas1", uv = { 126/512, 149/512, (126+67)/512, (149+67)/512 } }
resource "ImageRegion" "UiMenuStarHeartBg" { image = "UIPremulAtlas1", uv = { 193/512, 149/512, (193+78)/512, (149+72)/512 } }
resource "ImageRegion" "UiMenuStarHeartFg" { image = "UIPremulAtlas1", uv = { 126/512, 85/512, (126+64)/512, (85+64)/512 } }
resource "ImageRegion" "UiMenuStarOutlineSmall" { image = "UIPremulAtlas1", uv = { 66/512, 85/512, (66+60)/512, (85+60)/512 } }
resource "ImageRegion" "UiMiscCircleShadow" { image = "UIPremulAtlas1", uv = { 66/512, 49/512, (66+36)/512, (49+36)/512 } }
resource "ImageRegion" "UiMiscCircleShadowSmall" { image = "UIPremulAtlas1", uv = { 32/512, 49/512, (32+34)/512, (49+34)/512 } }
resource "ImageRegion" "UiMiscCircleShadowSmallFaint" { image = "UIPremulAtlas1", uv = { 32/512, 16/512, (32+33)/512, (16+33)/512 } }
resource "ImageRegion" "UiMiscCircleShadowVerySmall" { image = "UIPremulAtlas1", uv = { 0/512, 0/512, (0+16)/512, (0+16)/512 } }
resource "ImageRegion" "UiMiscParticleFuzzy" { image = "UIPremulAtlas1", uv = { 16/512, 0/512, (16+17)/512, (0+16)/512 } }
resource "ImageRegion" "UiMiscR2Shadow" { image = "UIPremulAtlas1", uv = { 0/512, 48/512, (0+32)/512, (48+32)/512 } }
resource "ImageRegion" "UiMiscRTShadow" { image = "UIPremulAtlas1", uv = { 0/512, 80/512, (0+32)/512, (80+32)/512 } }
resource "ImageRegion" "UiStarBg" { image = "UIPremulAtlas1", uv = { 275/512, 303/512, (275+174)/512, (303+174)/512 } }
resource "ImageRegion" "UiStarBgLarge" { image = "UIPremulAtlas3", uv = { 256/512, 0/512, (256+256)/512, (0+256)/512 } }
resource "ImageRegion" "UiStarFg" { image = "UIPremulAtlas2", uv = { 0/512, 0/512, (0+174)/512, (0+174)/512 } }
resource "ImageRegion" "UiStarFgLarge" { image = "UIPremulAtlas2", uv = { 174/512, 174/512, (174+256)/512, (174+256)/512 } }
resource "ImageRegion" "UiStarLitBg" { image = "UIPremulAtlas2", uv = { 0/512, 174/512, (0+174)/512, (174+175)/512 } }
resource "ImageRegion" "UiStarLitBgLarge" { image = "UIPremulAtlas3", uv = { 0/512, 0/512, (0+256)/512, (0+256)/512 } }
resource "ImageRegion" "UiStarLitFg" { image = "UIPremulAtlas2", uv = { 174/512, 0/512, (174+174)/512, (0+174)/512 } }
resource "ImageRegion" "UiStarLitFgLarge" { image = "UIPremulAtlas3", uv = { 0/512, 256/512, (0+256)/512, (256+256)/512 } }

-- UIFullLumAtlas (doesnt stomp our luminance) ( coord order goes left, top, right, bottom )
resourceref "Image" "UIFullLumAtlas1"
resourceref "Image" "UIFullLumAtlas2"
resource "ImageRegion" "UIBorderFilledSmall" { image = "UIFullLumAtlas1", uv = { 0/1024, 0/1024, (0+10)/1024, (0+10)/1024 } }
resource "ImageRegion" "UIRingThick" { image = "UIFullLumAtlas2", uv = { 0/1024, 256/1024, (0+128)/1024, (256+128)/1024 } }
resource "ImageRegion" "UiAnalogLeftPushDownNx" { image = "UIFullLumAtlas1", uv = { 826/1024, 652/1024, (826+128)/1024, (652+128)/1024 } }
resource "ImageRegion" "UiAnalogLeftPushLeftNx" { image = "UIFullLumAtlas1", uv = { 570/1024, 652/1024, (570+128)/1024, (652+128)/1024 } }
resource "ImageRegion" "UiAnalogLeftPushRightNx" { image = "UIFullLumAtlas1", uv = { 570/1024, 268/1024, (570+128)/1024, (268+128)/1024 } }
resource "ImageRegion" "UiAnalogLeftPushUpNx" { image = "UIFullLumAtlas1", uv = { 698/1024, 268/1024, (698+128)/1024, (268+128)/1024 } }
resource "ImageRegion" "UiAnalogRightPushDownNx" { image = "UIFullLumAtlas1", uv = { 314/1024, 396/1024, (314+128)/1024, (396+128)/1024 } }
resource "ImageRegion" "UiAnalogRightPushLeftNx" { image = "UIFullLumAtlas1", uv = { 314/1024, 652/1024, (314+128)/1024, (652+128)/1024 } }
resource "ImageRegion" "UiAnalogRightPushRightNx" { image = "UIFullLumAtlas1", uv = { 442/1024, 396/1024, (442+128)/1024, (396+128)/1024 } }
resource "ImageRegion" "UiAnalogRightPushUpNx" { image = "UIFullLumAtlas1", uv = { 570/1024, 396/1024, (570+128)/1024, (396+128)/1024 } }
resource "ImageRegion" "UiBorderFlatBottom" { image = "UIFullLumAtlas2", uv = { 128/1024, 0/1024, (128+128)/1024, (0+128)/1024 } }
resource "ImageRegion" "UiBorderThickSmall" { image = "UIFullLumAtlas1", uv = { 16/1024, 226/1024, (16+32)/1024, (226+32)/1024 } }
resource "ImageRegion" "UiBorderThinLarge" { image = "UIFullLumAtlas2", uv = { 256/1024, 0/1024, (256+128)/1024, (0+128)/1024 } }
resource "ImageRegion" "UiBorderThinMedium" { image = "UIFullLumAtlas2", uv = { 512/1024, 0/1024, (512+128)/1024, (0+128)/1024 } }
resource "ImageRegion" "UiBorderThinSmall" { image = "UIFullLumAtlas2", uv = { 640/1024, 0/1024, (640+128)/1024, (0+128)/1024 } }
resource "ImageRegion" "UiButtonANx" { image = "UIFullLumAtlas1", uv = { 16/1024, 66/1024, (16+32)/1024, (66+32)/1024 } }
resource "ImageRegion" "UiButtonANxSmall" { image = "UIFullLumAtlas1", uv = { 0/1024, 10/1024, (0+16)/1024, (10+16)/1024 } }
resource "ImageRegion" "UiButtonBNx" { image = "UIFullLumAtlas1", uv = { 16/1024, 290/1024, (16+32)/1024, (290+32)/1024 } }
resource "ImageRegion" "UiButtonBNxSmall" { image = "UIFullLumAtlas1", uv = { 0/1024, 42/1024, (0+16)/1024, (42+16)/1024 } }
resource "ImageRegion" "UiButtonDownNx" { image = "UIFullLumAtlas1", uv = { 352/1024, 204/1024, (352+64)/1024, (204+64)/1024 } }
resource "ImageRegion" "UiButtonL3Nx" { image = "UIFullLumAtlas1", uv = { 96/1024, 140/1024, (96+64)/1024, (140+64)/1024 } }
resource "ImageRegion" "UiButtonLeftNx" { image = "UIFullLumAtlas1", uv = { 96/1024, 204/1024, (96+64)/1024, (204+64)/1024 } }
resource "ImageRegion" "UiButtonMinusNx" { image = "UIFullLumAtlas1", uv = { 96/1024, 268/1024, (96+64)/1024, (268+64)/1024 } }
resource "ImageRegion" "UiButtonPlusNx" { image = "UIFullLumAtlas1", uv = { 96/1024, 332/1024, (96+64)/1024, (332+64)/1024 } }
resource "ImageRegion" "UiButtonR3Nx" { image = "UIFullLumAtlas1", uv = { 96/1024, 396/1024, (96+64)/1024, (396+64)/1024 } }
resource "ImageRegion" "UiButtonRightNx" { image = "UIFullLumAtlas1", uv = { 96/1024, 460/1024, (96+64)/1024, (460+64)/1024 } }
resource "ImageRegion" "UiButtonUpNx" { image = "UIFullLumAtlas1", uv = { 96/1024, 524/1024, (96+64)/1024, (524+64)/1024 } }
resource "ImageRegion" "UiButtonXNx" { image = "UIFullLumAtlas1", uv = { 16/1024, 130/1024, (16+32)/1024, (130+32)/1024 } }
resource "ImageRegion" "UiButtonXNxSmall" { image = "UIFullLumAtlas1", uv = { 0/1024, 58/1024, (0+16)/1024, (58+16)/1024 } }
resource "ImageRegion" "UiButtonYNx" { image = "UIFullLumAtlas1", uv = { 16/1024, 194/1024, (16+32)/1024, (194+32)/1024 } }
resource "ImageRegion" "UiButtonYNxSmall" { image = "UIFullLumAtlas1", uv = { 16/1024, 162/1024, (16+32)/1024, (162+32)/1024 } }
resource "ImageRegion" "UiCandleGlow" { image = "UIFullLumAtlas1", uv = { 698/1024, 652/1024, (698+128)/1024, (652+128)/1024 } }
resource "ImageRegion" "UiCandleGlowMasked" { image = "UIFullLumAtlas1", uv = { 570/1024, 780/1024, (570+128)/1024, (780+128)/1024 } }
resource "ImageRegion" "UiCandleLensFlare" { image = "UIFullLumAtlas1", uv = { 442/1024, 652/1024, (442+128)/1024, (652+128)/1024 } }
resource "ImageRegion" "UiGradientShout" { image = "UIFullLumAtlas1", uv = { 224/1024, 268/1024, (224+90)/1024, (268+90)/1024 } }
resource "ImageRegion" "UiGradientShout_Large" { image = "UIFullLumAtlas2", uv = { 128/1024, 128/1024, (128+256)/1024, (128+256)/1024 } }
resource "ImageRegion" "UiHudChevronBroken" { image = "UIFullLumAtlas1", uv = { 288/1024, 140/1024, (288+64)/1024, (140+64)/1024 } }
resource "ImageRegion" "UiHudChevronBrokenPartial" { image = "UIFullLumAtlas1", uv = { 352/1024, 140/1024, (352+64)/1024, (140+64)/1024 } }
resource "ImageRegion" "UiHudChevronGlow" { image = "UIFullLumAtlas1", uv = { 698/1024, 396/1024, (698+128)/1024, (396+128)/1024 } }
resource "ImageRegion" "UiHudChevronGlowLvl1" { image = "UIFullLumAtlas1", uv = { 140/1024, 34/1024, (140+46)/1024, (34+46)/1024 } }
resource "ImageRegion" "UiHudChevronGlowLvl2" { image = "UIFullLumAtlas1", uv = { 48/1024, 34/1024, (48+46)/1024, (34+46)/1024 } }
resource "ImageRegion" "UiHudChevronGlowLvl3" { image = "UIFullLumAtlas1", uv = { 94/1024, 34/1024, (94+46)/1024, (34+46)/1024 } }
resource "ImageRegion" "UiHudChevronMed" { image = "UIFullLumAtlas1", uv = { 672/1024, 140/1024, (672+64)/1024, (140+64)/1024 } }
resource "ImageRegion" "UiHudChevronPulse" { image = "UIFullLumAtlas1", uv = { 314/1024, 524/1024, (314+128)/1024, (524+128)/1024 } }
resource "ImageRegion" "UiHudChevronSmall" { image = "UIFullLumAtlas1", uv = { 16/1024, 10/1024, (16+24)/1024, (10+24)/1024 } }
resource "ImageRegion" "UiHudDiamondFill" { image = "UIFullLumAtlas1", uv = { 864/1024, 140/1024, (864+64)/1024, (140+64)/1024 } }
resource "ImageRegion" "UiHudDiamondOutline" { image = "UIFullLumAtlas1", uv = { 928/1024, 140/1024, (928+64)/1024, (140+64)/1024 } }
resource "ImageRegion" "UiHudShatterTri" { image = "UIFullLumAtlas1", uv = { 16/1024, 34/1024, (16+32)/1024, (34+32)/1024 } }
resource "ImageRegion" "UiLeftButtonNx" { image = "UIFullLumAtlas1", uv = { 160/1024, 268/1024, (160+64)/1024, (268+64)/1024 } }
resource "ImageRegion" "UiLeftTriggerNx" { image = "UIFullLumAtlas1", uv = { 160/1024, 332/1024, (160+64)/1024, (332+64)/1024 } }
resource "ImageRegion" "UiMenuAccountBadge" { image = "UIFullLumAtlas1", uv = { 160/1024, 396/1024, (160+64)/1024, (396+64)/1024 } }
resource "ImageRegion" "UiMenuBadgePen" { image = "UIFullLumAtlas1", uv = { 160/1024, 460/1024, (160+64)/1024, (460+64)/1024 } }
resource "ImageRegion" "UiMenuCandleInnerGlow1" { image = "UIFullLumAtlas1", uv = { 160/1024, 524/1024, (160+64)/1024, (524+64)/1024 } }
resource "ImageRegion" "UiMenuCandleInnerGlow2" { image = "UIFullLumAtlas1", uv = { 160/1024, 588/1024, (160+64)/1024, (588+64)/1024 } }
resource "ImageRegion" "UiMenuCandleInnerGlow3" { image = "UIFullLumAtlas1", uv = { 160/1024, 652/1024, (160+64)/1024, (652+64)/1024 } }
resource "ImageRegion" "UiMenuConstellationArrowRight" { image = "UIFullLumAtlas1", uv = { 48/1024, 80/1024, (48+48)/1024, (80+48)/1024 } }
resource "ImageRegion" "UiMenuDiamondSmall" { image = "UIFullLumAtlas1", uv = { 0/1024, 26/1024, (0+16)/1024, (26+16)/1024 } }
resource "ImageRegion" "UiMenuDivingShadow" { image = "UIFullLumAtlas1", uv = { 442/1024, 268/1024, (442+128)/1024, (268+128)/1024 } }
resource "ImageRegion" "UiMenuFly" { image = "UIFullLumAtlas1", uv = { 314/1024, 268/1024, (314+128)/1024, (268+128)/1024 } }
resource "ImageRegion" "UiMenuFlyShadow" { image = "UIFullLumAtlas2", uv = { 0/1024, 0/1024, (0+128)/1024, (0+128)/1024 } }
resource "ImageRegion" "UiMenuFriendsTab" { image = "UIFullLumAtlas1", uv = { 224/1024, 204/1024, (224+64)/1024, (204+64)/1024 } }
resource "ImageRegion" "UiMenuHover" { image = "UIFullLumAtlas2", uv = { 896/1024, 0/1024, (896+128)/1024, (0+128)/1024 } }
resource "ImageRegion" "UiMenuHoverShadow" { image = "UIFullLumAtlas1", uv = { 442/1024, 524/1024, (442+128)/1024, (524+128)/1024 } }
resource "ImageRegion" "UiMenuInfo" { image = "UIFullLumAtlas1", uv = { 160/1024, 908/1024, (160+64)/1024, (908+64)/1024 } }
resource "ImageRegion" "UiMenuLinkAccount" { image = "UIFullLumAtlas1", uv = { 160/1024, 844/1024, (160+64)/1024, (844+64)/1024 } }
resource "ImageRegion" "UiMenuNewWindow" { image = "UIFullLumAtlas1", uv = { 160/1024, 780/1024, (160+64)/1024, (780+64)/1024 } }
resource "ImageRegion" "UiMenuNextArrow" { image = "UIFullLumAtlas1", uv = { 160/1024, 716/1024, (160+64)/1024, (716+64)/1024 } }
resource "ImageRegion" "UiMenuNx" { image = "UIFullLumAtlas1", uv = { 160/1024, 204/1024, (160+64)/1024, (204+64)/1024 } }
resource "ImageRegion" "UiMenuPerson" { image = "UIFullLumAtlas1", uv = { 800/1024, 140/1024, (800+64)/1024, (140+64)/1024 } }
resource "ImageRegion" "UiMenuPlus" { image = "UIFullLumAtlas1", uv = { 736/1024, 140/1024, (736+64)/1024, (140+64)/1024 } }
resource "ImageRegion" "UiMenuQRWhite" { image = "UIFullLumAtlas1", uv = { 608/1024, 140/1024, (608+64)/1024, (140+64)/1024 } }
resource "ImageRegion" "UiMenuRandomize" { image = "UIFullLumAtlas1", uv = { 544/1024, 140/1024, (544+64)/1024, (140+64)/1024 } }
resource "ImageRegion" "UiMenuSwimmingShadow" { image = "UIFullLumAtlas1", uv = { 314/1024, 780/1024, (314+128)/1024, (780+128)/1024 } }
resource "ImageRegion" "UiMenuTabArrow" { image = "UIFullLumAtlas1", uv = { 480/1024, 140/1024, (480+64)/1024, (140+64)/1024 } }
resource "ImageRegion" "UiMenuTabCreateInvite" { image = "UIFullLumAtlas1", uv = { 416/1024, 140/1024, (416+64)/1024, (140+64)/1024 } }
resource "ImageRegion" "UiMenuTabOnlineFriends" { image = "UIFullLumAtlas1", uv = { 224/1024, 140/1024, (224+64)/1024, (140+64)/1024 } }
resource "ImageRegion" "UiMenuTabReceivedInvite" { image = "UIFullLumAtlas1", uv = { 160/1024, 140/1024, (160+64)/1024, (140+64)/1024 } }
resource "ImageRegion" "UiMenuTabSentInvite" { image = "UIFullLumAtlas1", uv = { 96/1024, 908/1024, (96+64)/1024, (908+64)/1024 } }
resource "ImageRegion" "UiMenuUnlinkAccount" { image = "UIFullLumAtlas1", uv = { 96/1024, 844/1024, (96+64)/1024, (844+64)/1024 } }
resource "ImageRegion" "UiMessageTypeContent" { image = "UIFullLumAtlas1", uv = { 442/1024, 780/1024, (442+128)/1024, (780+128)/1024 } }
resource "ImageRegion" "UiMessageTypeEvent" { image = "UIFullLumAtlas1", uv = { 570/1024, 524/1024, (570+128)/1024, (524+128)/1024 } }
resource "ImageRegion" "UiMessageTypeMisc" { image = "UIFullLumAtlas1", uv = { 698/1024, 524/1024, (698+128)/1024, (524+128)/1024 } }
resource "ImageRegion" "UiMessageTypeUrgent" { image = "UIFullLumAtlas1", uv = { 826/1024, 524/1024, (826+128)/1024, (524+128)/1024 } }
resource "ImageRegion" "UiMiscCheckSmall" { image = "UIFullLumAtlas1", uv = { 16/1024, 258/1024, (16+32)/1024, (258+32)/1024 } }
resource "ImageRegion" "UiMiscCheckWhite" { image = "UIFullLumAtlas1", uv = { 96/1024, 780/1024, (96+64)/1024, (780+64)/1024 } }
resource "ImageRegion" "UiMiscGradientSlice" { image = "UIFullLumAtlas1", uv = { 40/1024, 10/1024, (40+64)/1024, (10+16)/1024 } }
resource "ImageRegion" "UiMiscInteractOuter" { image = "UIFullLumAtlas1", uv = { 16/1024, 322/1024, (16+32)/1024, (322+32)/1024 } }
resource "ImageRegion" "UiMiscLensFlare" { image = "UIFullLumAtlas1", uv = { 826/1024, 780/1024, (826+128)/1024, (780+128)/1024 } }
resource "ImageRegion" "UiMiscParticle" { image = "UIFullLumAtlas1", uv = { 224/1024, 358/1024, (224+90)/1024, (358+90)/1024 } }
resource "ImageRegion" "UiMiscPhone" { image = "UIFullLumAtlas1", uv = { 96/1024, 716/1024, (96+64)/1024, (716+64)/1024 } }
resource "ImageRegion" "UiMiscXWhite" { image = "UIFullLumAtlas1", uv = { 96/1024, 652/1024, (96+64)/1024, (652+64)/1024 } }
resource "ImageRegion" "UiPulse" { image = "UIFullLumAtlas2", uv = { 384/1024, 0/1024, (384+128)/1024, (0+128)/1024 } }
resource "ImageRegion" "UiRightButtonNx" { image = "UIFullLumAtlas1", uv = { 96/1024, 588/1024, (96+64)/1024, (588+64)/1024 } }
resource "ImageRegion" "UiRightTriggerNx" { image = "UIFullLumAtlas1", uv = { 288/1024, 204/1024, (288+64)/1024, (204+64)/1024 } }
resource "ImageRegion" "UiRingGradientOuter" { image = "UIFullLumAtlas2", uv = { 768/1024, 0/1024, (768+128)/1024, (0+128)/1024 } }
resource "ImageRegion" "UiTagBg" { image = "UIFullLumAtlas1", uv = { 96/1024, 80/1024, (96+60)/1024, (80+60)/1024 } }
resource "ImageRegion" "UiToggleBgShadow" { image = "UIFullLumAtlas1", uv = { 826/1024, 396/1024, (826+128)/1024, (396+128)/1024 } }
resource "ImageRegion" "UiToggleButtonShadow" { image = "UIFullLumAtlas2", uv = { 0/1024, 128/1024, (0+128)/1024, (128+128)/1024 } }

resourceref "Image" "UiMapBgAtlas"
resource "ImageRegion" "UiMap_Pattern_Hills04" { image = "UiMapBgAtlas", uv = {0, 0.749, 0.1787, 1} }
resource "ImageRegion" "UiMapOreo01" { image = "UiMapBgAtlas", uv = {0.7915, 0.8604, 0.9997, 0.9998} }
resource "ImageRegion" "UiMap_Pattern_Mountain03" { image = "UiMapBgAtlas", uv = {0.1914, 0.8765, 0.4424, 1} }
resource "ImageRegion" "UiMapBirdSingle4" { image = "UiMapBgAtlas", uv = {0.3887, 0.7603, 0.409, 0.7723} }
resource "ImageRegion" "UiMapWhale02" { image = "UiMapBgAtlas", uv = {0.8262, 0.6982, 0.9995, 0.8535} }
resource "ImageRegion" "UiMap_Pattern_Waves02" { image = "UiMapBgAtlas", uv = {0.709, 0.7021, 0.8193, 0.8413} }
resource "ImageRegion" "UiMap_Environment_Sunset_Town1" { image = "UiMapBgAtlas", uv = {0.6245, 0.6514, 0.7002, 0.7695} }
resource "ImageRegion" "UiMap_Pattern_PointyMountain05" { image = "UiMapBgAtlas", uv = {0.4502, 0.7827, 0.7012, 1} }
resource "ImageRegion" "UiMap_Pattern_Desert04" { image = "UiMapBgAtlas", uv = {0.1914, 0.7861, 0.4424, 0.8682} }
resource "ImageRegion" "UiMap_Environment_Sunset_FlyRace_City1" { image = "UiMapBgAtlas", uv = {0.1914, 0.749, 0.2144, 0.7778} }
resource "ImageRegion" "UiMap_Environment_Sunset_Town3" { image = "UiMapBgAtlas", uv = {0.3843, 0.7236, 0.4031, 0.75} }
resource "ImageRegion" "UiMapEnvironment_Sunset_Citadel" { image = "UiMapBgAtlas", uv = {0.5269, 0.6528, 0.6157, 0.769} }
resource "ImageRegion" "UiMap_Environment_Sunset_FlyRace_City2" { image = "UiMapBgAtlas", uv = {0.3379, 0.605, 0.4526, 0.687} }
resource "ImageRegion" "UiMap_Environment_Sunset_Race" { image = "UiMapBgAtlas", uv = {0.2271, 0.6992, 0.3748, 0.7712} }
resource "ImageRegion" "UiMapManta07" { image = "UiMapBgAtlas", uv = {0.8745, 0.5693, 0.9998, 0.6415} }
resource "ImageRegion" "UiMapBirdSingle2" { image = "UiMapBgAtlas", uv = {0.8428, 0.6025, 0.8612, 0.6248} }
resource "ImageRegion" "UiMapDuskTriangleCreature" { image = "UiMapBgAtlas", uv = {0.7139, 0.5718, 0.8359, 0.6938} }
resource "ImageRegion" "UiMap_Environment_Night_Desert" { image = "UiMapBgAtlas", uv = {0.5312, 0.5459, 0.6992, 0.6436} }
resource "ImageRegion" "UiMapKrill02" { image = "UiMapBgAtlas", uv = {0.1841, 0.5176, 0.5003, 0.5926} }
resource "ImageRegion" "UiMap_Pattern_Trees01" { image = "UiMapBgAtlas", uv = {0, 0.6006, 0.2134, 0.7373} }
resource "ImageRegion" "UiMapBirdSingle1" { image = "UiMapBgAtlas", uv = {0.8433, 0.5718, 0.8644, 0.5958} }
resource "ImageRegion" "UiMapRainCreature02" { image = "UiMapBgAtlas", uv = {0.186, 0.4507, 0.2671, 0.5112} }
resource "ImageRegion" "UiMapJellyfish05" { image = "UiMapBgAtlas", uv = {0.71, 0.4434, 0.7603, 0.4937} }
resource "ImageRegion" "UiMapManta01" { image = "UiMapBgAtlas", uv = {0.7192, 0.5103, 0.7998, 0.5624} }
resource "ImageRegion" "UiMap_Environment_Sunset_Town2" { image = "UiMapBgAtlas", uv = {0.7681, 0.4438, 0.7938, 0.4873} }
resource "ImageRegion" "UiMapRainCreature01" { image = "UiMapBgAtlas", uv = {0.8076, 0.4414, 0.9997, 0.5621} }
resource "ImageRegion" "UiMapCloud23" { image = "UiMapBgAtlas", uv = {0.4526, 0.1756, 0.6284, 0.4932} }
resource "ImageRegion" "UiMapCloud14" { image = "UiMapBgAtlas", uv = {0.3081, 0.1756, 0.4461, 0.4727} }
resource "ImageRegion" "UiMapKrill04" { image = "UiMapBgAtlas", uv = {0.248, 0.2255, 0.3021, 0.4326} }
resource "ImageRegion" "UiMapManta02" { image = "UiMapBgAtlas", uv = {0.2271, 0.6035, 0.3296, 0.687} }
resource "ImageRegion" "UiMapCloud05" { image = "UiMapBgAtlas", uv = {0, 0.2251, 0.2425, 0.4429} }
resource "ImageRegion" "UiMapCloud20" { image = "UiMapBgAtlas", uv = {0, 0.4507, 0.1752, 0.5878} }
resource "ImageRegion" "UiMapManta04" { image = "UiMapBgAtlas", uv = {0.9116, 0.3442, 0.9995, 0.4321} }
resource "ImageRegion" "UiMapBirdSingle3" { image = "UiMapBgAtlas", uv = {0.4868, 0.7598, 0.4994, 0.7709} }
resource "ImageRegion" "UiMapCrab03" { image = "UiMapBgAtlas", uv = {0.4282, 0.7373, 0.4682, 0.7711} }
resource "ImageRegion" "UiMapCrab02" { image = "UiMapBgAtlas", uv = {0.4238, 0.7021, 0.4735, 0.7289} }
resource "ImageRegion" "UiMap_Environment_Sunset_YetiPark" { image = "UiMapBgAtlas", uv = {0.481, 0.7017, 0.5063, 0.751} }
resource "ImageRegion" "UiMapCloud15" { image = "UiMapBgAtlas", uv = {0.9263, 0.0002, 0.9993, 0.2715} }
resource "ImageRegion" "UiMapManta06" { image = "UiMapBgAtlas", uv = {0.8638, 0.1676, 0.9221, 0.2598} }
resource "ImageRegion" "UiMapCloud17" { image = "UiMapBgAtlas", uv = {0.6367, 0.2637, 0.8999, 0.4375} }
resource "ImageRegion" "UiMapBirdSingle6" { image = "UiMapBgAtlas", uv = {0.6382, 0.1792, 0.6502, 0.209} }
resource "ImageRegion" "UiMapCloud_Small6_Trimmed" { image = "UiMapBgAtlas", uv = {0.8447, 0, 0.9214, 0.1631} }
resource "ImageRegion" "UiMapCloud_Tiny2" { image = "UiMapBgAtlas", uv = {0.8066, 0.0003, 0.8394, 0.126} }
resource "ImageRegion" "UiMapCloud_Tiny1" { image = "UiMapBgAtlas", uv = {0.7656, 0.0007, 0.8012, 0.1245} }
resource "ImageRegion" "UiMapCloud12" { image = "UiMapBgAtlas", uv = {0.686, 0.1318, 0.8407, 0.2406} }
resource "ImageRegion" "UiMapCloud_Tiny4" { image = "UiMapBgAtlas", uv = {0.5508, 0.1172, 0.6504, 0.163} }
resource "ImageRegion" "UiMap_Pattern_Star06" { image = "UiMapBgAtlas", uv = {0.6729, 0.0938, 0.7007, 0.1216} }
resource "ImageRegion" "UiMapJellyfish02" { image = "UiMapBgAtlas", uv = {0.7051, 0.0693, 0.7604, 0.1247} }
resource "ImageRegion" "UiMap_Pattern_Star04" { image = "UiMapBgAtlas", uv = {0.6782, 0.0698, 0.6963, 0.0879} }
resource "ImageRegion" "UiMapCloud_Tiny3" { image = "UiMapBgAtlas", uv = {0.5493, 0.0684, 0.6687, 0.1134} }
resource "ImageRegion" "UiMapCloud_Small5_Trimmed" { image = "UiMapBgAtlas", uv = {0.5498, 0, 0.761, 0.0635} }
resource "ImageRegion" "UiMapCloud09" { image = "UiMapBgAtlas", uv = {0.3062, 0, 0.5444, 0.1699} }
resource "ImageRegion" "UiMapCloud02" { image = "UiMapBgAtlas", uv = {0, 0, 0.3018, 0.2192} }

-- ICONS WITH NO GLOWING OUTLINE --

resourceref "Image" "UiTutorialFootprints"
resourceref "Image" "UiTutorialFogBackdrop"

resourceref "Image" "Icon_discord"
resourceref "Image" "Icon_facebook"
resourceref "Image" "Icon_instagram"
resourceref "Image" "Icon_tiktok"
resourceref "Image" "Icon_twitch"
resourceref "Image" "Icon_twitter"
resourceref "Image" "Icon_youtube"

resourceref "Image" "UiAccountLocal"
resourceref "Image" "UiAccountGameCenter"
resourceref "Image" "UiAccountGoogle"
resourceref "Image" "UiAccountApple"
resourceref "Image" "UiAccountNintendo"
resourceref "Image" "UiAccountHuawei"
resourceref "Image" "UiAccountSony"

resourceref "Image" "UiAccountGameCenterBadge"
resourceref "Image" "UiAccountLocalBadge"
resourceref "Image" "UiAccountGoogleBadge"
resourceref "Image" "UiAccountAppleBadge"
resourceref "Image" "UiAccountNintendoBadge"
resourceref "Image" "UiAccountFacebookBadge"
resourceref "Image" "UiAccountHuaweiBadge"
resourceref "Image" "UiAccountSonyBadge"
resourceref "Image" "UiAccountSteamBadge"
resourceref "Image" "UiAccountTwitchBadge"

resourceref "Image" "UiBrandPlayStationBadge"
resourceref "Image" "UiBrandPlayStationBadge_Small"
resourceref "Image" "UiBrandPlayStationBadgeColor"
resourceref "Image" "UiBrandAppleColor"

resourceref "Image" "UiShopFog"
resourceref "Image" "UiMiscBubbleA"
resourceref "Image" "UiMiscBubbleB"
resourceref "Image" "UiMiscRoundBox"
resourceref "Image" "UiMiscBoxButton"
resourceref "Image" "UiMiscBoxButtonGlow"
resourceref "Image" "UiMiscStarCluster"
resourceref "Image" "UiMiscOneSixth"
--resourceref "Image" "UiMiscCircle"
resourceref "Image" "UiMiscCircleFade"
resourceref "Image" "UiMiscStarFull"
resourceref "Image" "UiMiscTempleDawn"
resourceref "Image" "UiMiscTempleDay"
resourceref "Image" "UiMiscTempleRain"
resourceref "Image" "UiMiscTempleSunset"
resourceref "Image" "UiMiscTempleDusk"
resourceref "Image" "UiMiscTempleNight"
resourceref "Image" "UiMiscTempleStorm"

resourceref "Image" "UiBuddyAsk"
resourceref "Image" "UiBuddyCancel"

resourceref "Image" "UiMaskEdit"

-- ICONS NOT RUN THROUGH UI ATLAS TOOL GOES HERE --

-- AP pendant icons
resourceref "Image" "UiOutfitPendant"
resourceref "Image" "UiOutfitPendantAP02"
resourceref "Image" "UiOutfitPendantAP03"
resourceref "Image" "UiOutfitPendantAP04"
resourceref "Image" "UiOutfitPendantAP05"
resourceref "Image" "UiOutfitPendantAP06"
resourceref "Image" "UiOutfitPendantAP07"
resourceref "Image" "UiOutfitPendantAP08"
resourceref "Image" "UiOutfitPendantAP09"
resourceref "Image" "UiOutfitPendantAP10"
resourceref "Image" "UiOutfitPendantAP11"
resourceref "Image" "UiOutfitPendantAP12"
resourceref "Image" "UiOutfitPendantAP13"
resourceref "Image" "UiOutfitPendantAP14"
resourceref "Image" "UiOutfitPendantAP15"
resourceref "Image" "UiOutfitPendantAP16"
resourceref "Image" "UiOutfitPendantAP17"
resourceref "Image" "UiOutfitPendantAP18"
resourceref "Image" "UiOutfitPendantAP19"
resourceref "Image" "UiOutfitPendantAP20"
resourceref "Image" "UiOutfitPendantAP21"
resourceref "Image" "UiOutfitPendantAP22"
resourceref "Image" "UiOutfitPendantAP23"
resourceref "Image" "UiOutfitPendantAP24"
resourceref "Image" "UiOutfitPendantAP25"
resourceref "Image" "UiOutfitPendantAP26"
resourceref "Image" "UiOutfitPendantAP27"
resourceref "Image" "UiOutfitPendantAP28"
resourceref "Image" "UiOutfitPendantAP29"
resourceref "Image" "UiOutfitPendantAP30"
-- AP mask icons
resourceref "Image" "UiSeasonMaskAP02"
resourceref "Image" "UiSeasonMaskAP03"
resourceref "Image" "UiSeasonMaskAP04"
resourceref "Image" "UiSeasonMaskAP05"
resourceref "Image" "UiSeasonMaskAP06"
resourceref "Image" "UiSeasonMaskAP07"
resourceref "Image" "UiSeasonMaskAP09"
resourceref "Image" "UiSeasonMaskAP10"
resourceref "Image" "UiSeasonMaskAP11"
resourceref "Image" "UiSeasonMaskAP12"
resourceref "Image" "UiSeasonMaskAP13"
resourceref "Image" "UiSeasonMaskAP14"
-- Snowball prop
resourceref "Image" "GlitterSh"

resourceref "Image" "UIConstellationButtonGlow"
resourceref "Image" "UIStarGlow"
resourceref "Image" "UIBGGalaxy"
resourceref "Image" "UICircleTrailGlow"

resourceref "Image" "UiMiscInteractOutline"
resourceref "Image" "UiMenuCircleShadowHeavy"

-- Markup images
resourceref "Image" "UiAnalogStickLit"
resourceref "Image" "UiButtonLeft"
resourceref "Image" "UiButtonTop"
resourceref "Image" "UiButtonBottom"
resourceref "Image" "UiButtonRight"
resourceref "Image" "UiLeftButton"
resourceref "Image" "UiLeftTrigger"
resourceref "Image" "UiRightButton"
resourceref "Image" "UiSeasonQuest"

-- STILL USED IN GAME/SERVR DATA, TO BE DELETED EVENTUALLY --

resourceref "Image" "UISit" -- to be deleted (UISit still used in levels)
resourceref "Image" "UIGift" -- to be deleted (UIGift in Server Data)
resourceref "Image" "UIHand" -- to be deleted (UIHand still used in levels)
resourceref "Image" "UIHint" -- to be deleted (UIHint in Server Data)
resourceref "Image" "UIChair" -- to be deleted (UIChair in Server Data)

-- ANIMATED ICONS - MUST COME AFTER ICONS --

resource "ImageAnim" "UiEmoteSitAnim"				{ prefix = "UiEmoteSit", frames = "0, 0, 1, 2, 2, 2, 2, 2, 2", frameTime = 0.16 }
resource "ImageAnim" "UiEmoteFlameAnim"				{ prefix = "UiEmoteFlame", frames = "0, 1, 2, 3, 4, 5, 3, 4, 5, 3, 4, 5, 3, 4, 5", frameTime = 0.13 }
resource "ImageAnim" "UiEmoteFlameSmallAnim"		{ prefix = "UiEmoteFlame", frames = "1, 2, 3, 2, 1, 2, 3, 2, 3, 2", frameTime = 0.13 }
resource "ImageAnim" "UiEmoteWaveAnim"				{ prefix = "UiEmoteWave", frames = "0, 1", frameTime = 0.35 }
resource "ImageAnim" "UiMenuPlaceCandleAnim"		{ prefix = "UiMenuPlaceCandle", frames = "2, 2, 2, 2, 0, 0, 1", frameTime = 0.16 }
resource "ImageAnim" "UiSocialReceiveHeartAnim"		{ prefix = "UiSocialReceiveHeart", frames = "0, 0, 1, 2, 2, 2, 2, 2, 2", frameTime = 0.16 }
resource "ImageAnim" "UiSocialOfferCandleAnim"		{ prefix = "UiSocialOfferCandle", frames = "0, 0, 1, 2, 2, 2, 2, 2, 2", frameTime = 0.16 }
resource "ImageAnim" "UIAcceptGiftAnim"				{ prefix = "UiSocialReceiveHeart", frames = "0, 0, 1, 2, 2, 2, 2, 2, 2", frameTime = 0.16 } -- in server data
resource "ImageAnim" "UIOfferGiftAnim"				{ prefix = "UiSocialOfferCandle", frames = "0, 0, 1, 2, 2, 2, 2, 2, 2", frameTime = 0.16 } -- in server data
resource "ImageAnim" "UiEmoteAP06NodAnim"			{ prefix = "UiEmoteAP06Nod", frames = "0, 2, 0, 1, 1", frameTime = 0.16 }
resource "ImageAnim" "UiEmoteAP09ShowDanceAnim"		{ prefix = "UiEmoteAP09ShowDance", frames = "0, 1, 2, 1", frameTime = 0.35 }
resource "ImageAnim" "UiEmoteAP11BeckonAnim"		{ prefix = "UiEmoteAP11Beckon", frames = "1, 0, 1, 0, 0", frameTime = 0.35 }
resource "ImageAnim" "UiEmoteAP13WaitAnim"			{ prefix = "UiEmoteAP13Wait", frames = "1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0", frameTime = 0.16 }
resource "ImageAnim" "UiEmoteAP13EvilLaughAnim"		{ prefix = "UiEmoteAP13EvilLaugh", frames = "1, 0, 1, 0, 1, 0, 0, 0", frameTime = 0.25 }
resource "ImageAnim" "UiEmoteAP14HeadBobAnim"		{ prefix = "UiEmoteAP14HeadBob", frames = "0, 1, 1, 2, 3, 3, 2, 1, 1", frameTime = 0.16 }
resource "ImageAnim" "UiMenuStageCurtainOpenAnim"	{ prefix = "UiMenuStageCurtain", frames = "0, 0, 1, 2, 2, 2, 2, 2, 2", frameTime = 0.16 }
resource "ImageAnim" "UiMenuStageCurtainCloseAnim"	{ prefix = "UiMenuStageCurtain", frames = "2, 2, 1, 0, 0, 0, 0, 0, 0", frameTime = 0.16 }
resource "ImageAnim" "UiOfferHealAnim"				{ prefix = "UiSocialOfferHeal", frames = "0, 1, 2, 3, 4, 5, 3, 4, 5, 3, 4, 5, 3, 4, 5", frameTime = 0.13 }
resource "ImageAnim" "UiHudStarSplitAnim"			{ prefix = "UiHudStarSplit", frames = "0, 1, 1, 2, 3, 4, 5, 6, 7", frameTime = 0.13 }
resource "ImageAnim" "UiHudShieldSplitAnim"			{ prefix = "UiHudShieldSplit", frames = "0, 1, 1, 2, 3, 4, 5, 6, 7", frameTime = 0.13 }
resource "ImageAnim" "UiEmoteAP16ArmWaveAnim"			{ prefix = "UiEmoteAP16ArmWave", frames = "0, 1, 2, 3, 4, 5", frameTime = 0.35 }
resource "ImageAnim" "UiEmoteAP16ConductAnim"			{ prefix = "UiEmoteAP16Conduct", frames = "0, 0, 0, 1, 2, 3, 3, 3, 2, 1", frameTime = 0.16 }
resource "ImageAnim" "UiEmoteAP16RhythmicClapAnim"			{ prefix = "UiEmoteAP16RhythmicClap", frames = "0, 1, 2, 2, 3, 4, 5, 5", frameTime = 0.16 }
resource "ImageAnim" "UiEmoteAP16RaiseTheRoofAnim"			{ prefix = "UiEmoteAP16RaiseTheRoof", frames = "0, 1", frameTime = 0.25 }
resource "ImageAnim" "UiEmoteAP16SilentClapAnim"			{ prefix = "UiEmoteAP16SilentClap", frames = "0, 1, 0, 1, 0, 2, 3, 4, 3, 4, 3, 5", frameTime = 0.16 }
resource "ImageAnim" "UiEmoteAuroraPenguinDanceAnim"			{ prefix = "UiEmoteAuroraPenguinDance", frames = "0, 1, 2, 3, 4, 5, 6, 7", frameTime = 0.25 }
resource "ImageAnim" "UiMenuSnakeGameAnim"            { prefix = "UiMenuSnakeGame", frames = "2,1,0,2,2,2,2,1,0,1,2,2,1,0,1,2", frameTime = 0.20 }
resource "ImageAnim" "UiEmoteAP26CoughAnim"            { prefix = "UiEmoteAP26Cough", frames = "0, 1, 0, 2, 2, 2", frameTime = 0.25 }
resource "ImageAnim" "UiMenuManateeSitAnim"				{ prefix = "UiMenuManateeSit", frames = "0, 0, 1, 2, 2, 2, 2, 2, 2", frameTime = 0.16 }
resource "ImageAnim" "UiEmoteAP29CuteClapAnim"				{ prefix = "UiEmoteAP29CuteClap", frames = "0, 1", frameTime = 0.16 }

