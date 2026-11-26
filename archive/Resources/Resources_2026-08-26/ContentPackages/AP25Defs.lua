------------------------------------------------------------------------------------------
-- AP25 Resources -----------------------------------------------------------------------
------------------------------------------------------------------------------------------
-- Notes: 
------------------------------------------------------------------------------------------

-- Icons can't be moved from icons.lua because of UIAtlas
-- Icons
--resource "Icons" "SystemUI_SeasonCandle25"          {type="SystemUI", size=128, source="Data/Images/UI/UiMenuSeasonCandleAP25.png"}
--resource "Icons" "SystemUI_SeasonHeart25"           {type="SystemUI", size=128, source="Data/Images/UI/UiMenuSeasonHeartAP25.png"}
--resource "Icons" "SystemUI_SeasonPendant25"         {type="SystemUI", size=128, source="Data/Images/UiOutfitPendantAP25.png"}

-- Images and resourcerefs can't be moved from ImageDefs.lua and Persistent.lua
-- Images
--resourcedef "Image" "ConstellationImageAP25"        { source = "ConstellationImageAP25.png", compression = 4, isPremul = true }
--resourcedef "Image" "UISeasonPassPromoAP25"         { source = "UISeasonPassPromoAP25.png", disableMips = true, compression = 4, isPremul = true }
--resourcedef "Image"	"UiOutfitPendantAP25"           { source = "UiOutfitPendantAP25.png", compression = 4, disableMips = true, address = "zero", isPremul = true }

-- resourcerefs
--resourceref "Image" "ConstellationImageAP25"
--resourceref "Image" "UISeasonPassPromoAP25"
--resourceref "Image" "UiOutfitPendantAP25"

-- Meshes
-- Season Candle
resource "Mesh" "SeasonCandle25"                    { source = "AP25CandleA.fbx", loadAsync = false, registerCollision = false, computeOcclusions = true }

-- AP25 Meshes
resource "Mesh" "NPC_AP25BigPants"                  { source = "NPC_AP25BigPants.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = false, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "NPC_AP25Tunic"					    { source = "NPC_AP25Tunic.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = false, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "NPC_AP25Wrap"					    { source = "NPC_AP25Wrap.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = false, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "NPC_AP25DyeCloth"				    { source = "NPC_AP25DyeCloth.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Body_AP25BigPants"					{ source = "Body_AP25BigPants.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Body_AP25RolledSleeve"			    { source = "Body_AP25RolledSleeve.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Body_AP25Wrap"						{ source = "Body_AP25Wrap.fbx",	 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Body_AP25Tunic"					{ source = "Body_AP25Tunic.fbx",	 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Feet_AP25BootTall"					{ source = "Feet_AP25BootTall.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Feet_AP25BootShort"				{ source = "Feet_AP25BootShort.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hat_AP25BlueRibbon"				{ source = "Hat_AP25BlueRibbon.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_AP25Bob"						{ source = "Hair_AP25Bob.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_AP25BluePaint"				{ source = "Hair_AP25BluePaint.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Horn_AP25YellowPaint"				{ source = "Horn_AP25YellowPaint.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Mask_AP25Gazelle"					{ source = "Mask_AP25Gazelle.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_AP25Detached"					{ source = "Wing_AP25Detached.fbx", 	    sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_AP25Ribbons"					{ source = "Wing_AP25Ribbons.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_AP25DyeCloth"					{ source = "Wing_AP25DyeCloth.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Prop_AP25Cymbals"			        { source = "Prop_AP25Cymbals.fbx", computeOcclusions = true, computeEdges = false, compressPositions = false, compressUvs = false, stripNormals = false, loadLazy = true, stripUv13 = false, copyFrameDelay = true }
resource "Mesh" "Prop_AP25ClothDivider"		    	{ source = "Prop_AP25ClothDivider.fbx", computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = false, copyFrameDelay = true }
resource "Mesh" "Neck_AP25Pendant"					{ source = "Neck_AP25Pendant.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }

-- AP25
resource "Mesh" "P_AP25ClothDivider"				{ source = "P_AP25ClothDivider.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }

-- sound
remote_resource "FmodStudioFile" "FmodStudioMusicAP25" { source = "Music_AP25.bank", bundle = "AudioExtra" }
remote_resource "FmodStudioFile" "FmodStudioMusicAP25Assets" { source = "Music_AP25.assets.bank", bundle = "AudioExtra" }
remote_resource "FmodStudioFile" "FmodStudioMusicAP25Streams" { source = "Music_AP25.streams.bank", bundle = "AudioExtra" }
