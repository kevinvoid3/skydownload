-------------------------------------------------------------------------------
-- Mesh Resources
-------------------------------------------------------------------------------

resource "Mesh" "Plane"				{ source = "Plane.fbx", registerCollision = true }
resource "Mesh" "Plane10x10"		{ source = "Plane10x10.fbx", registerCollision = true }

resource "Mesh" "LightShaft_02"		{ source = "LightShaft_02.fbx", loadAsync = false, registerCollision = false } -- Blaze Light Shaft

-- Candles
resource "Mesh" "CandleDefault"		{ source = "CandleDefault.fbx", loadAsync = false, registerCollision = false, computeOcclusions = true }
resource "Mesh" "Candles_02"		{ source = "Candles_02.fbx", loadAsync = false, registerCollision = true }
resource "Mesh" "CandleAncestor"	{ source = "CandleAncestor.fbx", loadAsync = false, registerCollision = false, computeOcclusions = true }
resource "Mesh" "CandlePlayer"		{ source = "CandlePlayer.fbx", loadAsync = false, registerCollision = false, computeOcclusions = true }
resource "Mesh" "CandleHeart"		{ source = "CandleHeart.fbx", loadAsync = false, registerCollision = false, computeOcclusions = true }
resource "Mesh" "CandleTreasure_01"	{ source = "CandleTreasure_01.fbx", loadAsync = false, registerCollision = false, computeOcclusions = true }
resource "Mesh" "CandleTreasure_02"	{ source = "CandleTreasure_02.fbx", loadAsync = false, registerCollision = false, computeOcclusions = true }

-- Season Candles
resource "Mesh" "SeasonCandle"		{ source = "AP07CandleA.fbx", loadAsync = false, registerCollision = false, computeOcclusions = true }
resource "Mesh" "SeasonCandle02"	{ source = "AP02CandleA.fbx", loadAsync = false, registerCollision = false, computeOcclusions = true }
resource "Mesh" "SeasonCandle03"	{ source = "AP03CandleA.fbx", loadAsync = false, registerCollision = false, computeOcclusions = true }
resource "Mesh" "SeasonCandle04"	{ source = "AP04CandleA.fbx", loadAsync = false, registerCollision = false, computeOcclusions = true }
resource "Mesh" "SeasonCandle05"	{ source = "AP01CandleA.fbx", loadAsync = false, registerCollision = false, computeOcclusions = true }
resource "Mesh" "SeasonCandle06"	{ source = "AP06CandleA.fbx", loadAsync = false, registerCollision = false, computeOcclusions = true }
resource "Mesh" "SeasonCandle07"	{ source = "AP07CandleA.fbx", loadAsync = false, registerCollision = false, computeOcclusions = true }
resource "Mesh" "SeasonCandle08"    { source = "AP08CandleA.fbx", loadAsync = false, registerCollision = false, computeOcclusions = true }
resource "Mesh" "SeasonCandle09"    { source = "AP09CandleA.fbx", loadAsync = false, registerCollision = false, computeOcclusions = true }
resource "Mesh" "SeasonCandle10"    { source = "AP10CandleA.fbx", loadAsync = false, registerCollision = false, computeOcclusions = true }
resource "Mesh" "SeasonCandle11"    { source = "AP11CandleA.fbx", loadAsync = false, registerCollision = false, computeOcclusions = true }
resource "Mesh" "SeasonCandle12"    { source = "AP12CandleA.fbx", loadAsync = false, registerCollision = false, computeOcclusions = true }
resource "Mesh" "SeasonCandle13"    { source = "AP13CandleA.fbx", loadAsync = false, registerCollision = false, computeOcclusions = true }
resource "Mesh" "SeasonCandle14"    { source = "AP14CandleA.fbx", loadAsync = false, registerCollision = false, computeOcclusions = true }
resource "Mesh" "SeasonCandle15"    { source = "AP15CandleA.fbx", loadAsync = false, registerCollision = false, computeOcclusions = true }
resource "Mesh" "SeasonCandle16"    { source = "AP16CandleA.fbx", loadAsync = false, registerCollision = false, computeOcclusions = true }
resource "Mesh" "SeasonCandle17"    { source = "AP17CandleA.fbx", loadAsync = false, registerCollision = false, computeOcclusions = true }
resource "Mesh" "SeasonCandle18"    { source = "AP18CandleA.fbx", loadAsync = false, registerCollision = false, computeOcclusions = true }
resource "Mesh" "SeasonCandle19"    { source = "AP19CandleA.fbx", loadAsync = false, registerCollision = false, computeOcclusions = true }
resource "Mesh" "SeasonCandle20"    { source = "AP20CandleA.fbx", loadAsync = false, registerCollision = false, computeOcclusions = true }
resource "Mesh" "SeasonCandle21"    { source = "AP21CandleA.fbx", loadAsync = false, registerCollision = false, computeOcclusions = true }
resource "Mesh" "SeasonCandle22"    { source = "AP22CandleA.fbx", loadAsync = false, registerCollision = false, computeOcclusions = true }
resource "Mesh" "SeasonCandle23"    { source = "AP23CandleA.fbx", loadAsync = false, registerCollision = false, computeOcclusions = true }
resource "Mesh" "SeasonCandle24"    { source = "AP24CandleA.fbx", loadAsync = false, registerCollision = false, computeOcclusions = true }
resource "Mesh" "SeasonCandle25"    { source = "AP25CandleA.fbx", loadAsync = false, registerCollision = false, computeOcclusions = true }
resource "Mesh" "SeasonCandle26"    { source = "AP26CandleA.fbx", loadAsync = false, registerCollision = false, computeOcclusions = true }
resource "Mesh" "SeasonCandle27"    { source = "AP27CandleA.fbx", loadAsync = false, registerCollision = false, computeOcclusions = true }
resource "Mesh" "SeasonCandle28"    { source = "AP28CandleA.fbx", loadAsync = false, registerCollision = false, computeOcclusions = true }
resource "Mesh" "SeasonCandle29"    { source = "AP29CandleA.fbx", loadAsync = false, registerCollision = false, computeOcclusions = true }
resource "Mesh" "SeasonCandle30"    { source = "AP30CandleA.fbx", loadAsync = false, registerCollision = false, computeOcclusions = true }

-- Event Currency
-- DoSunlight
resource "Mesh" "CurrencyPopsicle"    { source = "CurrencyPopsicle.fbx", loadAsync = false, registerCollision = false, computeOcclusions = true }


-- Notes
-- loadLazy will load into memory when worn
-- stripNormals will remove normals???
-- compueteOcclusions will calculate shadows
-- stripUv13 will remove tgc_uv1 and tgc_uv3

-- Dark Creature meshes
-- CharDarkCreatureAnim has to stay a resourcedef, since DuskGraveyard refs it.
-- Might be able to switch to resource and loadLazy.
resourcedef "Mesh" "CharDarkCreatureAnim" { source = "CharDarkCreatureAnim.fbx", loadAsync = false, computeOcclusions = true, computeEdges = false } -- Dark Creature Head

resource "Mesh" "ChestCore"								{ source = "Sphere_01.fbx", stripAnimation = false, computeOcclusions = true, computeEdges = false } -- Heart

-- Wing / Cape Diamonds
resource "Mesh" "AvatarStarDiamondInner"				{ source = "CapeStar.fbx" } -- Cape star (lower level version)
resource "Mesh" "AvatarStarDiamondOuter"				{ source = "CapeStarFrame.fbx" } -- Cape star (higher level outer frame)
resource "Mesh" "AvatarStarDiamondExtra"				{ source = "CapeStarExtra.fbx" } -- Cape star (higher level extra frame)
resource "Mesh" "AvatarBatDiamondInner"					{ source = "CapeBat.fbx" }
resource "Mesh" "AvatarBatDiamondOuter"					{ source = "CapeBatFrame.fbx" }
resource "Mesh" "AvatarBatDiamondExtra"					{ source = "CapeBatExtra.fbx" }
resource "Mesh" "AvatarBloomDiamondInner"				{ source = "CapeBloom.fbx" }
resource "Mesh" "AvatarBloomDiamondOuter"				{ source = "CapeBloomFrame.fbx" }
resource "Mesh" "AvatarBloomDiamondExtra"				{ source = "CapeBloomExtra.fbx" }
resource "Mesh" "AvatarClothDiamondInner"				{ source = "CapeCloth.fbx" }
resource "Mesh" "AvatarClothDiamondOuter"				{ source = "CapeClothFrame.fbx" }
resource "Mesh" "AvatarClothDiamondExtra"				{ source = "CapeClothExtra.fbx" }
resource "Mesh" "AvatarDiamondDiamondInner"				{ source = "CapeDiamond.fbx" }
resource "Mesh" "AvatarDiamondDiamondOuter"				{ source = "CapeDiamondFrame.fbx" }
resource "Mesh" "AvatarDiamondDiamondExtra"				{ source = "CapeDiamondExtra.fbx" }
resource "Mesh" "AvatarDuetDiamondInner"				{ source = "CapeDuet.fbx" }
resource "Mesh" "AvatarDuetDiamondOuter"				{ source = "CapeDuetFrame.fbx" }
resource "Mesh" "AvatarDuetDiamondExtra"				{ source = "CapeDuetExtra.fbx" }
resource "Mesh" "AvatarSproutDiamondInner"				{ source = "CapeSprout.fbx" }
resource "Mesh" "AvatarSproutDiamondOuter"				{ source = "CapeSproutFrame.fbx" }
resource "Mesh" "AvatarSproutDiamondExtra"				{ source = "CapeSproutExtra.fbx" }
resource "Mesh" "AvatarSpiderDiamondInner"				{ source = "CapeSpider.fbx" }
resource "Mesh" "AvatarSpiderDiamondOuter"				{ source = "CapeSpiderFrame.fbx" }
resource "Mesh" "AvatarSpiderDiamondExtra"				{ source = "CapeSpiderExtra.fbx" }
resource "Mesh" "AvatarOceanDiamondInner"				{ source = "CapeOcean.fbx" }
resource "Mesh" "AvatarOceanDiamondOuter"				{ source = "CapeOceanFrame.fbx" }
resource "Mesh" "AvatarOceanDiamondExtra"				{ source = "CapeOceanExtra.fbx" }
resource "Mesh" "AvatarFlowDiamondInner"				{ source = "CapeFlow.fbx" }
resource "Mesh" "AvatarFlowDiamondOuter"				{ source = "CapeFlowFrame.fbx" }
resource "Mesh" "AvatarFlowDiamondExtra"				{ source = "CapeFlowExtra.fbx" }
resource "Mesh" "AvatarWitheredDiamondInner"			{ source = "CapeWithered.fbx" }
resource "Mesh" "AvatarWitheredDiamondOuter"			{ source = "CapeWitheredFrame.fbx" }
resource "Mesh" "AvatarWitheredDiamondExtra"			{ source = "CapeWitheredExtra.fbx" }
resource "Mesh" "AvatarRoseDiamondInner"				{ source = "CapeRose.fbx" }
resource "Mesh" "AvatarRoseDiamondOuter"				{ source = "CapeRoseFrame.fbx" }
resource "Mesh" "AvatarRoseDiamondExtra"				{ source = "CapeRoseExtra.fbx" }
resource "Mesh" "AvatarFiveStarDiamondInner"			{ source = "CapeFiveStar.fbx" }
resource "Mesh" "AvatarFiveStarDiamondOuter"			{ source = "CapeFiveStarFrame.fbx" }
resource "Mesh" "AvatarFiveStarDiamondExtra"			{ source = "CapeFiveStarExtra.fbx" }
resource "Mesh" "AvatarSnowDiamondInner"				{ source = "CapeSnow.fbx" }
resource "Mesh" "AvatarSnowDiamondOuter"				{ source = "CapeSnowFrame.fbx" }
resource "Mesh" "AvatarSnowDiamondExtra"				{ source = "CapeSnowExtra.fbx" }
resource "Mesh" "AvatarSnowSmallDiamondInner"				{ source = "CapeSnowSmall.fbx" }
resource "Mesh" "AvatarSnowSmallDiamondOuter"				{ source = "CapeSnowSmallFrame.fbx" }
resource "Mesh" "AvatarSnowSmallDiamondExtra"				{ source = "CapeSnowSmallExtra.fbx" }
resource "Mesh" "AvatarHexagonDiamondInner"				{ source = "CapeHexagon.fbx" }
resource "Mesh" "AvatarHexagonDiamondOuter"				{ source = "CapeHexagonFrame.fbx" }
resource "Mesh" "AvatarHexagonDiamondExtra"				{ source = "CapeHexagonExtra.fbx" }
resource "Mesh" "AvatarSphereDiamondInner"				{ source = "CapeSphere.fbx" }
resource "Mesh" "AvatarSphereDiamondOuter"				{ source = "CapeSphereFrame.fbx" }
resource "Mesh" "AvatarSphereDiamondExtra"				{ source = "CapeSphereExtra.fbx" }
resource "Mesh" "AvatarCoinDiamondInner"				{ source = "CapeCoin.fbx" }
resource "Mesh" "AvatarCoinDiamondOuter"				{ source = "CapeCoinFrame.fbx" }
resource "Mesh" "AvatarCoinDiamondExtra"				{ source = "CapeCoinExtra.fbx" }
resource "Mesh" "AvatarPlusDiamondInner"				{ source = "CapePlus.fbx" }
resource "Mesh" "AvatarPlusDiamondOuter"				{ source = "CapePlusFrame.fbx" }
resource "Mesh" "AvatarPlusDiamondExtra"				{ source = "CapePlusExtra.fbx" }
resource "Mesh" "AvatarMinusDiamondInner"				{ source = "CapeMinus.fbx" }
resource "Mesh" "AvatarMinusDiamondOuter"				{ source = "CapeMinusFrame.fbx" }
resource "Mesh" "AvatarMinusDiamondExtra"				{ source = "CapeMinusExtra.fbx" }
resource "Mesh" "AvatarRainbowDiamondInner"				{ source = "CapeRainbow.fbx" }
resource "Mesh" "AvatarRainbowDiamondOuter"				{ source = "CapeRainbowFrame.fbx" }
resource "Mesh" "AvatarRainbowDiamondExtra"				{ source = "CapeRainbowExtra.fbx" }
resource "Mesh" "AvatarTravelerDiamondInner"			{ source = "CapeTraveler.fbx" }
resource "Mesh" "AvatarTravelerDiamondOuter"			{ source = "CapeTravelerFrame.fbx" }
resource "Mesh" "AvatarTravelerDiamondExtra"			{ source = "CapeTravelerExtra.fbx" }
resource "Mesh" "AvatarAbyssDiamondInner"				{ source = "CapeAbyss.fbx" }
resource "Mesh" "AvatarAbyssDiamondOuter"				{ source = "CapeAbyssFrame.fbx" }
resource "Mesh" "AvatarAbyssDiamondExtra"				{ source = "CapeAbyssExtra.fbx" }
resource "Mesh" "AvatarHeartDiamondInner"				{ source = "CapeHeart.fbx" }
resource "Mesh" "AvatarHeartDiamondOuter"				{ source = "CapeHeartFrame.fbx" }
resource "Mesh" "AvatarHeartDiamondExtra"				{ source = "CapeHeartExtra.fbx" }
resource "Mesh" "AvatarCatDiamondInner"					{ source = "CapeCat.fbx" }
resource "Mesh" "AvatarCatDiamondOuter"					{ source = "CapeCatFrame.fbx" }
resource "Mesh" "AvatarCatDiamondExtra"					{ source = "CapeCatExtra.fbx" }
resource "Mesh" "AvatarCrabDiamondInner"				{ source = "CapeCrab.fbx" }
resource "Mesh" "AvatarCrabDiamondOuter"				{ source = "CapeCrabFrame.fbx" }
resource "Mesh" "AvatarCrabDiamondExtra"				{ source = "CapeCrabExtra.fbx" }
resource "Mesh" "AvatarDraculaDiamondInner"				{ source = "CapeDracula.fbx" }
resource "Mesh" "AvatarDraculaDiamondOuter"				{ source = "CapeDraculaFrame.fbx" }
resource "Mesh" "AvatarDraculaDiamondExtra"				{ source = "CapeDraculaExtra.fbx" }
resource "Mesh" "AvatarFireworksDiamondInner"		    { source = "CapeFireworks.fbx" }
resource "Mesh" "AvatarFireworksDiamondOuter"			{ source = "CapeFireworksFrame.fbx" }
resource "Mesh" "AvatarFireworksDiamondExtra"			{ source = "CapeFireworksExtra.fbx" }
resource "Mesh" "AvatarCrescentDiamondInner"            { source = "CapeCrescent.fbx" }
resource "Mesh" "AvatarCrescentDiamondOuter"            { source = "CapeCrescentFrame.fbx" }
resource "Mesh" "AvatarCrescentDiamondExtra"            { source = "CapeCrescentExtra.fbx" }
resource "Mesh" "AvatarFortuneDragonDiamondInner"		{ source = "CapeFortuneDragon.fbx" }
resource "Mesh" "AvatarFortuneDragonDiamondOuter"		{ source = "CapeFortuneDragonFrame.fbx" }
resource "Mesh" "AvatarFortuneDragonDiamondExtra"		{ source = "CapeFortuneDragonExtra.fbx" }
resource "Mesh" "AvatarTGCWireframeDiamondInner"        { source = "CapeStar.fbx" }
resource "Mesh" "AvatarTGCWireframeDiamondOuter"        { source = "CapeStarFrame.fbx" }
resource "Mesh" "AvatarTGCWireframeDiamondExtra"        { source = "CapeStarExtra.fbx" }
resource "Mesh" "AvatarRavenDiamondInner"        		{ source = "CapeRaven.fbx" }
resource "Mesh" "AvatarRavenDiamondOuter"        		{ source = "CapeRavenFrame.fbx" }
resource "Mesh" "AvatarRavenDiamondExtra"        		{ source = "CapeRavenExtra.fbx" }
resource "Mesh" "AvatarBellDiamondInner"        		{ source = "CapeBell.fbx" }
resource "Mesh" "AvatarBellDiamondOuter"        		{ source = "CapeBellFrame.fbx" }
resource "Mesh" "AvatarBellDiamondExtra"        		{ source = "CapeBellExtra.fbx" }
resource "Mesh" "AvatarDetachedDiamondInner"			{ source = "CapeDetached.fbx" }
resource "Mesh" "AvatarDetachedDiamondOuter"			{ source = "CapeDetachedFrame.fbx" }
resource "Mesh" "AvatarDetachedDiamondExtra"			{ source = "CapeDetachedExtra.fbx" }
resource "Mesh" "AvatarKrillDiamondInner"				{ source = "CapeKrill.fbx" }
resource "Mesh" "AvatarKrillDiamondOuter"				{ source = "CapeKrillFrame.fbx" }
resource "Mesh" "AvatarKrillDiamondExtra"				{ source = "CapeKrillExtra.fbx" }
resource "Mesh" "AvatarElderDiamondInner"				{ source = "CapeElder.fbx" }
resource "Mesh" "AvatarElderDiamondOuter"				{ source = "CapeElderFrame.fbx" }
resource "Mesh" "AvatarElderDiamondExtra"				{ source = "CapeElderExtra.fbx" }
resource "Mesh" "AvatarTreasureDiamondInner"			{ source = "CapeTreasure.fbx" }
resource "Mesh" "AvatarTreasureDiamondOuter"			{ source = "CapeTreasureFrame.fbx" }
resource "Mesh" "AvatarTreasureDiamondExtra"			{ source = "CapeTreasureExtra.fbx" }

------------------
--     BODY     --
------------------
resource "Mesh" "Outfit_None"					{ source = "Outfit_None.fbx", 				sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "Body_Ghost"					{ source = "Body_Ghost.fbx", 				sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "Body_ClassicPants"				{ source = "Body_ClassicPants.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "Body_ClassicDress"				{ source = "Body_ClassicDress.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "Body_ClassicCivilian"			{ source = "Body_ClassicCivilian.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "Body_ShortPants"				{ source = "Body_ShortPants.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "Body_LongPants"				{ source = "Body_LongPants.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "Body_SkinnyPants"				{ source = "Body_SkinnyPants.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "Body_FlarePants"				{ source = "Body_FlarePants.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "Body_PuffyShorts"				{ source = "Body_PuffyShorts.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "Body_PuffyPants"				{ source = "Body_PuffyPants.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "Body_WarriorPants"				{ source = "Body_WarriorPants.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "Body_EvergreenRobe"            { source = "Body_EvergreenRobe.fbx",        sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }

-- Days of Fortune
resource "Mesh" "Body_FortuneMuralist"			{ source = "Body_FortuneMuralist.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Body_FortuneDragonRobe"		{ source = "Body_FortuneDragonRobe.fbx",	sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
-- Days of Bloom
resource "Mesh" "Body_Gardener"					{ source = "Body_Gardener.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Body_BloomGreenTunic"					{ source = "Body_BloomGreenTunic.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Body_BloomSunflowerDress"					{ source = "Body_BloomSunflowerDress.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Prop_SunflowerLadderBackpack"		{ source = "Prop_SunflowerLadderBackpack.fbx", 		loadAsync = false, registerCollision = true, computeOcclusions = true }

-- Days of Nature
resource "Mesh" "Body_OceanWaves"				{ source = "Body_OceanWaves.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Body_NatureFlowyDress"			{ source = "Body_NatureFlowyDress.fbx", 	sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
-- Days of Music
resource "Mesh" "Body_BandUniform"				{ source = "Body_BandUniform.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
-- Days of Color
resource "Mesh" "Body_RainbowLight"				{ source = "Body_RainbowLight.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Body_RainbowDark"            	{ source = "Body_RainbowDark.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
-- Sky Anniversary
resource "Mesh" "Body_BirthdayShirt_05" 		{ source = "Body_BirthdayShirt_05.fbx", 	sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
-- Tournament of Triumph
resource "Mesh" "Body_GreekRobe"        		{ source = "Body_GreekRobe.fbx",     		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Body_TriumphSkateOutfit"       { source = "Body_TriumphSkateOutfit.fbx",   sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
-- Days of Sunlight
resource "Mesh" "Body_SwimTrunks"      	 	 	{ source = "Body_SwimTrunks.fbx",     		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Body_SunlightDress"			{ source = "Body_SunlightDress.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
-- Days of Moonlight
resource "Mesh" "Body_MoonlightDress"        	{ source = "Body_MoonlightDress.fbx",     	sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
-- Days of Style
resource "Mesh" "Body_FashionJeans"			    { source = "Body_FashionJeans.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true } --uv1 used for normals
resource "Mesh" "Body_CrystalDress"            	{ source = "Body_CrystalDress.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Body_CrystalSuit"            	{ source = "Body_CrystalSuit.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
-- Days of Mischief
resource "Mesh" "Body_Witch"					{ source = "Body_Witch.fbx", 				sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, }
resource "Mesh" "Body_Goth"					    { source = "Body_Goth.fbx", 				sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }

-- Days of Feast
resource "Mesh" "Body_Snowman"            		{ source = "Body_Snowman.fbx", 				sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "Body_YellowPinafore"           { source = "Body_YellowPinafore.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "Body_FeastCoat"    { source = "Body_FeastCoat.fbx",  sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }

-- Days of Fortune 2025
resource "Mesh" "SnakeSkeleton2"                { source = "SnakeSkeleton2.fbx", loadAsync = false, registerCollision = false, computeOcclusions = true }


-- Days of Treasure
resource "Mesh" "Body_TreasurePants"			{ source = "Body_TreasurePants.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv3 = true }
resource "Mesh" "Body_TreasureDress"			{ source = "Body_TreasureDress.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv3 = true }

-- Special
resource "Mesh" "Body_RibbonTieredDress"		{ source = "Body_RibbonTieredDress.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv3 = true }
resource "Mesh" "Body_RibbonSkirt"				{ source = "Body_RibbonSkirt.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv3 = true }

------------------
--     FEET     --
------------------
resource "Mesh" "Feet_ClassicSocks"            	{ source = "Feet_ClassicSocks.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
-- Days of Fortune
-- Days of Bloom
-- Days of Nature
resource "Mesh" "Feet_SeaFoam"            	{ source = "Feet_SeaFoam.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv3 = true }
-- Days of Color
resource "Mesh" "Feet_RainbowDarkLoafers"       { source = "Feet_RainbowDarkLoafers.fbx", 	sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
-- Days of Sunlight
resource "Mesh" "Feet_SunlightSandals"          { source = "Feet_SunlightSandals.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
-- Days of Moonlight
-- Days of Style
resource "Mesh" "Feet_BalletFlats"              { source = "Feet_BalletFlats.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "Feet_BunnySlippers"			{ source = "Feet_BunnySlippers.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
-- Days of Mischief
resource "Mesh" "Feet_Witch"            		{ source = "Feet_Witch.fbx", 				sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "Feet_GothBoots"            	{ source = "Feet_GothBoots.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
-- Days of Feast
resource "Mesh" "Feet_SnowBoots"            	{ source = "Feet_SnowBoots.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "Feet_YetiBoots"            	{ source = "Feet_YetiBoots.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "Feet_FeastLegWarmers"          { source = "Feet_FeastLegWarmers.fbx",      sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv3 = true }

-- Days of Treasure
resource "Mesh" "Feet_TreasureBoots"            	{ source = "Feet_TreasureBoots.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv3 = true }

-- Tournament of Triumph
resource "Mesh" "Feet_TriumphIceSkates"         { source = "Feet_TriumphIceSkates.fbx",     sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }

-- Special
resource "Mesh" "Feet_AuroraSneakers"        	{ source = "Feet_AuroraSneakers.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "Feet_FluffyMoth"        		{ source = "Feet_FluffyMoth.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }


------------------
--     WING     --
------------------
resource "Mesh" "Wing_Classic"					{ source = "Wing_Classic.fbx", 				sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_ClassicTrim"				{ source = "Wing_ClassicTrim.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_ClassicDiamonds"			{ source = "Wing_ClassicDiamonds.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_ClassicRey"				{ source = "Wing_ClassicRey.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
-- Days of Fortune
resource "Mesh" "Wing_Fortune"					{ source = "Wing_Fortune.fbx", 				sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_FortuneFish"				{ source = "Wing_FortuneFish.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_FortuneDragon"            { source = "Wing_FortuneDragon.fbx",        sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
-- Days of Love
resource "Mesh" "Wing_Meteor"            		{ source = "Wing_Meteor.fbx",        		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
-- Days of Bloom
resource "Mesh" "Wing_CherryBlossom"			{ source = "Wing_CherryBlossom.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_Wisteria"					{ source = "Wing_Wisteria.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_Tulip"					{ source = "Wing_Tulip.fbx", 				sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_CallaLily"				{ source = "Wing_CallaLily.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_RosePattern"				{ source = "Wing_RosePattern.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_BloomSunflower"				{ source = "Wing_BloomSunflower.fbx", 	sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_BloomSunflowerLong"				{ source = "Wing_BloomSunflowerLong.fbx", 	sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
-- Days of Music
resource "Mesh" "Wing_BandJacket"				{ source = "Wing_BandJacket.fbx", 				sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
-- Days of Nature
resource "Mesh" "Wing_OceanWaves"				{ source = "Wing_OceanWaves.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_SeaTurtle"				{ source = "Wing_SeaTurtle.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_FishPattern"				{ source = "Wing_FishPattern.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_WaterWave"				{ source = "Wing_WaterWave.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_SeaFoam"					{ source = "Wing_SeaFoam.fbx", 				sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_NatureWaterfall"			{ source = "Wing_NatureWaterfall.fbx", 				sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
-- Days of Color
resource "Mesh" "Wing_RainbowLight"				{ source = "Wing_RainbowLight.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_RainbowDark"				{ source = "Wing_RainbowDark.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_ColorShawl"				{ source = "Wing_ColorShawl.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_ColorBrushShawl"			{ source = "Wing_ColorBrushShawl.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
-- Sky Anniversary
resource "Mesh" "Wing_TGCHoodie"         		{ source = "Wing_TGCHoodie.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
-- Days of Treasure
resource "Mesh" "Wing_TreasureCoin"				{ source = "Wing_TreasureCoin.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = false, stripNormals = true, loadLazy = true }
-- Tournament of Triumph
resource "Mesh" "Wing_TeamDusk"           		{ source = "Wing_TeamDusk.fbx",         	sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_TeamPrairie"            	{ source = "Wing_TeamPrairie.fbx",         	sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_TeamRain"            		{ source = "Wing_TeamRain.fbx",         	sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_TeamSunset"            	{ source = "Wing_TeamSunset.fbx",        	sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_TriumphIce"               { source = "Wing_TriumphIce.fbx",           sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
-- Days of Sunlight
resource "Mesh" "Wing_SunlightTowelBlue"		{ source = "Wing_SunlightTowelBlue.fbx", 	sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_SunlightTowelYellow"		{ source = "Wing_SunlightTowelYellow.fbx", 	sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_SunlightTowelPink"		{ source = "Wing_SunlightTowelPink.fbx", 	sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_LinenCover"				{ source = "Wing_LinenCover.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_SunlightShawl"			{ source = "Wing_SunlightShawl.fbx",		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
-- Days of Moonlight
-- Days of Style
-- Days of Mischief
resource "Mesh" "Wing_MischiefBat"				{ source = "Wing_MischiefBat.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_SpiderWeb"				{ source = "Wing_SpiderWeb.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_Withered"					{ source = "Wing_Withered.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_MischiefCat"				{ source = "Wing_MischiefCat.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_Crabula"				    { source = "Wing_Crabula.fbx", 			    sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_Cobweb"					{ source = "Wing_Cobweb.fbx", 				sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_MischiefGoth"				{ source = "Wing_MischiefGoth.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
-- Days of Feast
resource "Mesh" "Wing_Santa"					{ source = "Wing_Santa.fbx", 				sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_Snowflake"				{ source = "Wing_Snowflake.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_FeastScarf"				{ source = "Wing_FeastScarf.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_WinterElder"				{ source = "Wing_WinterElder.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_WinterPuffer"				{ source = "Wing_WinterPuffer.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_YetiFur"					{ source = "Wing_YetiFur.fbx", 				sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_FeastFluffyShawl"			{ source = "Wing_FeastFluffyShawl.fbx", 				sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }

-- Special
resource "Mesh" "Wing_Switch"					{ source = "Wing_Switch.fbx", 				sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_TravelerRed"				{ source = "Wing_TravelerRed.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_TGCWireframe"             { source = "Wing_TGCWireframe.fbx",         sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_TGCWireframeEvergreen"    { source = "Wing_TGCWireframeEvergreen.fbx",         	sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_TravelerWhite"			{ source = "Wing_TravelerWhite.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = false, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_Flow"						{ source = "Wing_Flow.fbx", 				sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_Moth"			    		{ source = "Wing_Moth.fbx", 				sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_Sparrow"			    	{ source = "Wing_Sparrow.fbx", 				sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_Raven"			    	{ source = "Wing_Raven.fbx", 				sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_RibbonDressCape"			{ source = "Wing_RibbonDressCape.fbx", 				sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_RibbonBow"				{ source = "Wing_RibbonBow.fbx", 				sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }


------------------
--     HAIR     --
------------------
resource "Mesh" "Hair_SideBraid"				{ source = "Hair_SideBraid.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_Afro"						{ source = "Hair_Afro.fbx",					sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_BackLong"					{ source = "Hair_BackLong.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_Beard"					{ source = "Hair_Beard.fbx", 				sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_Bun"						{ source = "Hair_Bun.fbx", 					sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_Buzz"						{ source = "Hair_Buzz.fbx", 				sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_CurlyBun"					{ source = "Hair_CurlyBun.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_CurlyBunTwo"				{ source = "Hair_CurlyBunTwo.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_TightCurls"				{ source = "Hair_TightCurls.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_Dreads"					{ source = "Hair_Dreads.fbx", 				sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_ElderDawn"				{ source = "Hair_ElderDawn.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_ElderDay"					{ source = "Hair_ElderDay.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_ElderRain"				{ source = "Hair_ElderRain.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_ElderBro"					{ source = "Hair_ElderBro.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_ElderSis"					{ source = "Hair_ElderSis.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_ElderDusk"				{ source = "Hair_ElderDusk.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_ElderNight"				{ source = "Hair_ElderNight.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_Lion"						{ source = "Hair_Lion.fbx", 				sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_LongBob"					{ source = "Hair_LongBob.fbx", 				sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_Mohawk"					{ source = "Hair_Mohawk.fbx", 				sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_Ponytail"					{ source = "Hair_Ponytail.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_PonytailSide"				{ source = "Hair_PonytailSide.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_PonytailShort"			{ source = "Hair_PonytailShort.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_PonytailShaggy"			{ source = "Hair_PonytailShaggy.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_ShaggyShort"				{ source = "Hair_ShaggyShort.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_Puff"						{ source = "Hair_Puff.fbx", 				sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_Punk"						{ source = "Hair_Punk.fbx", 				sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_OneSideS"					{ source = "Hair_OneSideS.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_OneSideM"					{ source = "Hair_OneSideM.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_OneSideL"					{ source = "Hair_OneSideL.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_ShortBob"					{ source = "Hair_ShortBob.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_ShortBobRound"			{ source = "Hair_ShortBobRound.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_ShoulderLong"				{ source = "Hair_ShoulderLong.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_SideBraidLong"			{ source = "Hair_SideBraidLong.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_TopSharp"					{ source = "Hair_TopSharp.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_Pigtail"					{ source = "Hair_Pigtail.fbx", 				sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_BraidedPigtail"			{ source = "Hair_BraidedPigtail.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_PigtailSmall"				{ source = "Hair_PigtailSmall.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_PigtailPuffy"				{ source = "Hair_PigtailPuffy.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_PigtailLow"				{ source = "Hair_PigtailLow.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }

-- Days of Fortune
resource "Mesh" "Hair_DoubleBun"				{ source = "Hair_DoubleBun.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_WoolHat"					{ source = "Hair_WoolHat.fbx", 				sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_LionDance"				{ source = "Hair_LionDance.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_Fish"						{ source = "Hair_Fish.fbx", 				sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
-- Days of Love
resource "Mesh" "Hair_MeteorPigtails"			{ source = "Hair_MeteorPigtails.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_PurpleBraids"			{ source = "Hair_PurpleBraids.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
-- Days of Bloom
resource "Mesh" "Hair_BlossomPigtail"			{ source = "Hair_BlossomPigtail.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_CallaLily"				{ source = "Hair_CallaLily.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_BloomSpiky"				{ source = "Hair_BloomSpiky.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_RoseBraid"				{ source = "Hair_RoseBraid.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_BloomSunflowerBandana"				{ source = "Hair_BloomSunflowerBandana.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
-- Days of Nature
resource "Mesh" "Hair_NatureWater"				{ source = "Hair_NatureWater.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_NatureFloating"			{ source = "Hair_NatureFloating.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_ElderManta"				{ source = "Hair_ElderManta.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
-- Days of Color
resource "Mesh" "Hair_RainbowBeanie"			{ source = "Hair_RainbowBeanie.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_RockStar"					{ source = "Hair_RockStar.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_ColorHeadBand"			{ source = "Hair_ColorHeadband.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_ColorTufts"		    	{ source = "Hair_ColorTufts.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
-- Days of Music
resource "Mesh" "Hair_MarchingBand"				{ source = "Hair_MarchingBand.fbx",			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
-- Sky Anniversary
-- Tournament of Triumph
resource "Mesh" "Hair_Greek"                    { source = "Hair_Greek.fbx",             	sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_TriumphSwept"             { source = "Hair_TriumphSwept.fbx",         sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
-- Days of Sunlight
-- Days of Moonlight
resource "Mesh" "Hair_MoonlightUpdo"            { source = "Hair_MoonlightUpdo.fbx",        sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
-- Days of Style
-- Days of Mischief
resource "Mesh" "Hair_Pumpkin"					{ source = "Hair_Pumpkin.fbx", 				sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_WitchHat"					{ source = "Hair_WitchHat.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_Spider"					{ source = "Hair_Spider.fbx", 				sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_MessyWitch"				{ source = "Hair_MessyWitch.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_MischiefCat"				{ source = "Hair_MischiefCat.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_MischiefSmoked"			{ source = "Hair_MischiefSmoked.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_SpiderBun"				{ source = "Hair_SpiderBun.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_MischiefFeatherHat"		{ source = "Hair_MischiefFeatherHat.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = false, stripNormals = true, loadLazy = true }
-- Days of Feast
resource "Mesh" "Hair_SantaHat"					{ source = "Hair_SantaHat.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_WinterBeanie"				{ source = "Hair_WinterBeanie.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_SnowmanHead"				{ source = "Hair_SnowmanHead.fbx",			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_BlueHare"					{ source = "Hair_BlueHare.fbx",			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_Frantic"					{ source = "Hair_Frantic.fbx",			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
-- Days of Treasure
resource "Mesh" "Hair_TreasureBandanaLong"	    { source = "Hair_TreasureBandanaLong.fbx",	sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }


-- Special
resource "Mesh" "Hair_KizunaAiRed"				{ source = "Hair_KizunaAiRed.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_KizunaAiPink"				{ source = "Hair_KizunaAiPink.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_Elf"						{ source = "Hair_Elf.fbx", 					sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_TravelerRed"				{ source = "Hair_TravelerRed.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_TravelerWhite"			{ source = "Hair_TravelerWhite.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = false, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_PastryShort"				{ source = "Hair_PastryShort.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }

------------------
--     HAT      --
------------------

-- Days of Fortune
resource "Mesh" "Hat_FortuneOrange"				{ source = "Hat_FortuneOrange.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "Hat_FortuneFish"				{ source = "Hat_FortuneFish.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
-- Days of Love
resource "Mesh" "Hat_FlowerCrownPink"			{ source = "Hat_FlowerCrownPink.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hat_HeartBeret"				{ source = "Hat_HeartBeret.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
-- Days of Bloom
resource "Mesh" "Hat_Sprout"        	{ source = "Hat_Sprout.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
-- Days of Nature
resource "Mesh" "Hat_Coral"						{ source = "Hat_Coral.fbx", 				sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = false }
-- Days of Color
resource "Mesh" "Hat_PoppyRainbow"				{ source = "Hat_PoppyRainbow.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "Hat_PoppyRainbowSmall"			{ source = "Hat_PoppyRainbowSmall.fbx", 	sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
-- Sky Anniversary
resource "Mesh" "Hat_BirthdayHat_01"			{ source = "Hat_BirthdayHat_01.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "Hat_BirthdayHat_02"			{ source = "Hat_BirthdayHat_02.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "Hat_BirthdayHat_03"			{ source = "Hat_BirthdayHat_03.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "Hat_BirthdayHat_04"			{ source = "Hat_BirthdayHat_04.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "Hat_BirthdayHat_05"  			{ source = "Hat_BirthdayHat_05.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "Hat_BirthdayHat_06"  			{ source = "Hat_BirthdayHat_06.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "Hat_BalloonCrown" 				{ source = "Hat_BalloonCrown.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "Hat_BalloonCrab"				{ source = "Hat_BalloonCrab.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "Hat_BalloonJellyfish"			{ source = "Hat_BalloonJellyfish.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "Hat_BalloonKrill"				{ source = "Hat_BalloonKrill.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "Hat_BalloonManta"				{ source = "Hat_BalloonManta.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "Hat_OreoHeadband"         		{ source = "Hat_OreoHeadband.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
-- Days of Sunlight
resource "Mesh" "Hat_SunlightJelly"				{ source = "Hat_SunlightJelly.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }

-- Days of Love
resource "Mesh" "Hat_CrystalHearts"				{ source = "Hat_CrystalHearts.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
-- Tournament of Triumph
resource "Mesh" "Hat_Laurel"    			    { source = "Hat_Laurel.fbx", 				sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
-- Days of Moonlight
resource "Mesh" "Hat_MoonlightFlower"			{ source = "Hat_MoonlightFlower.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
-- Days of Style
resource "Mesh" "Hat_TopHat"					{ source = "Hat_TopHat.fbx", 				sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hat_Fascinator"				{ source = "Hat_Fascinator.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
-- Days of Mischief
resource "Mesh" "Hat_WitchHat"					{ source = "Hat_WitchHat.fbx", 				sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hat_PumpkinCrab"				{ source = "Hat_PumpkinCrab.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "Hat_MischiefCatEars"			{ source = "Hat_MischiefCatEars.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hat_MischiefLeaf"      { source = "Hat_MischiefLeaf.fbx",       sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }

-- Days of Feast
resource "Mesh" "Hat_SnowflakeGold"				{ source = "Hat_SnowflakeGold.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "Hat_Pinecone"			    	{ source = "Hat_Pinecone.fbx", 				sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "Hat_StackedHat"			    { source = "Hat_StackedHat.fbx", 				sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "Hat_BlueBow"			    	{ source = "Hat_BlueBow.fbx", 				sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "Hat_FeastFurHat"			 { source = "Hat_FeastFurHat.fbx", 				sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hat_FeastSnowman"              { source = "Hat_FeastSnowman.fbx",          sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
-- Special
resource "Mesh" "Hat_PoppyWhite"				{ source = "Hat_PoppyWhite.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "Hat_PoppyRed"					{ source = "Hat_PoppyRed.fbx", 				sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "Hat_KizunaAi"					{ source = "Hat_KizunaAi.fbx", 				sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "Hat_MusicNoteGold"				{ source = "Hat_MusicNoteGold.fbx",			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "Hat_MusicNoteBlue"				{ source = "Hat_MusicNoteBlue.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "Hat_Qixi"						{ source = "Hat_Qixi.fbx", 					sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "Hat_FlowerPS"					{ source = "Hat_FlowerPS.fbx", 				sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "Hat_MothAntenna"			    { source = "Hat_MothAntenna.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "Hat_PastryEars"				{ source = "Hat_PastryEars.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true, copyFrameDelay = true }
resource "Mesh" "Hat_PastryTea"					{ source = "Hat_PastryTea.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "Hat_PastryMini"				{ source = "Hat_PastryMini.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "Hat_Bunny"						{ source = "Hat_Bunny.fbx", 				sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "Hat_Shell"						{ source = "Hat_Shell.fbx", 				sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hat_SummerHat"					{ source = "Hat_SummerHat.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
-- Days of Treasure
resource "Mesh" "Hat_TreasurePirate"			{ source = "Hat_TreasurePirate.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }

------------------
--     MASK     --
------------------
resource "Mesh" "Mask_BasicA"					{ source = "Mask_BasicA.fbx", 				sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Mask_BasicQ"					{ source = "Mask_BasicQ.fbx", 				sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Mask_BasicSleepy"				{ source = "Mask_BasicSleepy.fbx", 				sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Mask_Bandana"					{ source = "Mask_Bandana.fbx", 				sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Mask_Smoke"					{ source = "Mask_Smoke.fbx", 				sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }

-- Days of Fortune
resource "Mesh" "Mask_RedCheeks"				{ source = "Mask_RedCheeks.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Mask_FortuneOx"				{ source = "Mask_FortuneOx.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Mask_FortuneTiger"				{ source = "Mask_FortuneTiger.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Mask_FortuneRabbit"			{ source = "Mask_FortuneRabbit.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Mask_FortuneDragon"			{ source = "Mask_FortuneDragon.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
-- Days of Love
resource "Mesh" "Mask_Rose"						{ source = "Mask_Rose.fbx", 				sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
-- Days of Bloom
resource "Mesh" "Mask_RosePetals"				{ source = "Mask_RosePetals.fbx", 				sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
-- Days of Nature
resource "Mesh" "Mask_Ocean"					{ source = "Mask_Ocean.fbx",				sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Mask_OceanWaves"            	{ source = "Mask_OceanWaves.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv3 = true }

-- Days of Color
resource "Mesh" "Mask_RainbowDark"				{ source = "Mask_RainbowDark.fbx",			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Mask_ColorFacepaint"				{ source = "Mask_ColorFacepaint.fbx",			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Mask_ColorSleek"			    { source = "Mask_ColorSleek.fbx",			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
-- Sky Anniversary
-- Tournament of Triumph
-- Days of Sunlight
-- Days of Moonlight
-- Days of Mischief
resource "Mesh" "Mask_MischiefCat"				{ source = "Mask_MischiefCat.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Mask_Crabula"					{ source = "Mask_Crabula.fbx",				sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Mask_MischiefBeak"					{ source = "Mask_MischiefBeak.fbx",				sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
-- Days of Feast
-- Days of Style
resource "Mesh" "Mask_RunwayMakeup"				{ source = "Mask_RunwayMakeup.fbx",			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
-- Special
resource "Mesh" "Mask_TravelerRed"				{ source = "Mask_TravelerRed.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Mask_TravelerWhite"			{ source = "Mask_TravelerWhite.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Mask_SparrowCheeks"			{ source = "Mask_SparrowCheeks.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Mask_RibbonMask"				{ source = "Mask_RibbonMask.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }

-- Days of Treasure
resource "Mesh" "Mask_TreasureEyePatch"			{ source = "Mask_TreasureEyePatch.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv3 = true }

------------------
--     FACE     --
------------------

resource "Mesh" "Face_ElderDawn"				{ source = "Face_ElderDawn.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Face_ElderDay"					{ source = "Face_ElderDay.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Face_ElderRain"				{ source = "Face_ElderRain.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Face_ElderSunsetA"				{ source = "Face_ElderSunsetA.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Face_ElderSunsetB"				{ source = "Face_ElderSunsetB.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Face_ElderDusk"				{ source = "Face_ElderDusk.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Face_ElderNight"				{ source = "Face_ElderNight.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Face_ElderDawn_02"				{ source = "Face_ElderDawn_02.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Face_ElderDay_02"				{ source = "Face_ElderDay_02.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Face_ElderRain_02"				{ source = "Face_ElderRain_02.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Face_ElderSunsetA_02"			{ source = "Face_ElderSunsetA_02.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Face_ElderSunsetB_02"			{ source = "Face_ElderSunsetB_02.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
-- Sky Anniversary
resource "Mesh" "Face_Anniversary3DGlasses"		{ source = "Face_Anniversary3DGlasses.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }-- Days of Fortune
-- Days of Love
-- Days of Bloom
-- Days of Nature
-- Days of Color
-- Days of Sunlight
-- Days of Moonlight
-- Days of Style
resource "Mesh" "Face_StarSunglasses"			{ source = "Face_StarSunglasses.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Face_FlameSunglasses"			{ source = "Face_FlameSunglasses.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Face_HeartSunglasses"			{ source = "Face_HeartSunglasses.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Face_Monocle"					{ source = "Face_Monocle.fbx", 				sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
-- Days of Mischief
resource "Mesh" "Face_HeadCrab"					{ source = "Face_HeadCrab.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Face_CurseSticker"				{ source = "Face_CurseSticker.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
-- Days of Feast
resource "Mesh" "Face_YetiGoggles"				{ source = "Face_YetiGoggles.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
-- Special
resource "Mesh" "Face_BlueSunglasses"			{ source = "Face_BlueSunglasses.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Face_AviatorMoth"			{ source = "Face_AviatorMoth.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }

------------------
--     HORN     --
------------------
resource "Mesh" "Horn_TuneBand"					{ source = "Horn_TuneBand.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }

-- Days of Fortune
resource "Mesh" "Horn_DragonEarring"        	{ source = "Horn_DragonEarring.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
-- Days of Love
-- Days of Bloom
resource "Mesh" "Horn_BloomSunflowerEarring"        	{ source = "Horn_BloomSunflowerEarring.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
-- Days of Nature
resource "Mesh" "Horn_NatureFins"			    { source = "Horn_NatureFins.fbx", 		    sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hat_NatureWaterVeil"			{ source = "Hat_NatureWaterVeil.fbx", 		    sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }

resource "Mesh" "Horn_RainbowTassel"			{ source = "Horn_RainbowTassel.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
-- Days of Color
resource "Mesh" "Horn_RainbowEarring"			{ source = "Horn_RainbowEarring.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Horn_RainbowHeadphones"		{ source = "Horn_RainbowHeadphones.fbx", 	sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Horn_DarkRainbowEarring"		{ source = "Horn_DarkRainbowEarring.fbx", 	sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
-- Sky Anniversary
-- Tournament of Triumph
-- Days of Sunlight
resource "Mesh" "Horn_SunnyEarring"     	   	{ source = "Horn_SunnyEarring.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
-- Days of Moonlight
resource "Mesh" "Horn_MoonEarring"     	  	 	{ source = "Horn_MoonEarring.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
-- Days of Style
-- Days of Mischief
resource "Mesh" "Horn_Withered"					{ source = "Horn_Withered.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
-- Days of Feast
resource "Mesh" "Horn_Elk"						{ source = "Horn_Elk.fbx", 					sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
-- Special
resource "Mesh" "Horn_FireworkEarring"			{ source = "Horn_FireworkEarring.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }

------------------
--     NECK     --
------------------
resource "Mesh" "Neck_Bow"						{ source = "Neck_Bow.fbx", 					sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Neck_SeaTurtle"				{ source = "Neck_SeaTurtle.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "Neck_BlueConch"				{ source = "Neck_BlueConch.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Neck_RibbonBib"				{ source = "Neck_RibbonBib.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "Neck_Jellyfish"				{ source = "Neck_Jellyfish.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "Neck_Holly"					{ source = "Neck_Holly.fbx", 				sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "Neck_WinterScarf"				{ source = "Neck_WinterScarf.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Neck_WinterScarfBlue"			{ source = "Neck_WinterScarfBlue.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Neck_Crab"						{ source = "Neck_Crab.fbx", 				sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "Neck_CrabBow"					{ source = "Neck_CrabBow.fbx", 				sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "Neck_MedalGold"				{ source = "Neck_MedalGold.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "Neck_MedalSilver"				{ source = "Neck_MedalSilver.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "Neck_MedalBronze"				{ source = "Neck_MedalBronze.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "Neck_ShoulderButterfly"		{ source = "Neck_ShoulderButterfly.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
-- Days of Fortune
resource "Mesh" "Neck_DragonBodyBlack"			{ source = "Neck_DragonBodyBlack.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "Neck_DragonHeadBlack"			{ source = "Neck_DragonHeadBlack.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "Neck_DragonTailBlack"			{ source = "Neck_DragonTailBlack.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "Neck_DragonBodyWhite"			{ source = "Neck_DragonBodyWhite.fbx",  	sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "Neck_DragonHeadWhite"			{ source = "Neck_DragonHeadWhite.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "Neck_DragonTailWhite"			{ source = "Neck_DragonTailWhite.fbx",  	sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
-- Days of Bloom
-- Days of Nature
resource "Mesh" "Neck_OceanScarf"				{ source = "Neck_OceanScarf.fbx",  			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
-- Days of Color
-- Sky Anniversary

-- Days of Sunlight
-- Days of Moonlight
-- Days of Style
resource "Mesh" "Neck_KrillTie"					{ source = "Neck_KrillTie.fbx",  			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
-- Days of Mischief
resource "Mesh" "Tail_MischiefCat"				{ source = "Tail_MischiefCat.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
-- Days of Feast
--Days of Treasure
resource "Mesh" "Neck_CrabBandana"				{ source = "Neck_CrabBandana.fbx",  		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }

-- Special
resource "Mesh" "Neck_PastryBow"				{ source = "Neck_PastryBow.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }

------------------
--     PROPS    --
------------------

-- Backpacks
resource "Mesh" "Prop_Backpack"					{ source = "Prop_Backpack.fbx", 			computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, copyFrameDelay = true }
resource "Mesh" "Prop_BackpackDefault"			{ source = "Prop_BackpackDefault.fbx", 		computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, copyFrameDelay = true }
resource "Mesh" "Prop_BackpackFabric"			{ source = "Prop_BackpackFabric.fbx", 		computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, copyFrameDelay = true }

------------------
-- Utility Props
resource "Mesh" "Prop_FireworkStaff"			{ source = "Prop_FireworkStaff.fbx", 		computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Prop_Umbrella"					{ source = "Prop_Umbrella.fbx", 			computeOcclusions = true, computeEdges = false, compressPositions = false, compressUvs = true, stripNormals = true, loadLazy = true } -- Note: compressPositions turned off due to overlapping positions in bind pose
resource "Mesh" "Prop_Broom"					{ source = "Prop_Broom.fbx", 				computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Prop_Wrench"         			{ source = "Prop_Wrench.fbx", 				computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }


-- resource "Mesh" "CharSkyKid_Prop_ScepterStaff"			{ source = "CharSkyKid_Prop_ScepterStaff.fbx", computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }

-- Days of Fortune
resource "Mesh" "Prop_FortuneUmbrella"			{ source = "Prop_FortuneUmbrella.fbx",		computeOcclusions = true, computeEdges = false, compressPositions = false, compressUvs = true, stripNormals = true, loadLazy = true } -- Note: compressPositions turned off due to overlapping positions in bind pose
-- Days of Love
resource "Mesh" "Prop_HeartStaff"				{ source = "Prop_HeartStaff.fbx", 			computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }

-- Days of Treasure
resource "Mesh" "Prop_TreasureShovel"			{ source = "Prop_TreasureShovel.fbx", 		computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "P_TreasurePirateBed"		    { source = "P_TreasurePirateBed.fbx", 		loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "Prop_TreasurePirateBed_Backpack"		    { source = "Prop_TreasurePirateBed_Backpack.fbx", 		loadAsync = false, registerCollision = true, computeOcclusions = true, copyFrameDelay = true }

resource "Mesh" "Prop_MeteorHeartDown"						{ source = "Prop_MeteorHeartDown.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true, loadLazy = true }
-- Days of Bloom
resource "Mesh" "Prop_LilyUmbrella"				    { source = "Prop_LilyUmbrella.fbx", 		computeOcclusions = true, computeEdges = false, compressPositions = false, compressUvs = true, stripNormals = true, loadLazy = true } -- Note: compressPositions turned off due to overlapping positions in bind pose
resource "Mesh" "Prop_WaterBucket"				    { source = "Prop_WaterBucket.fbx", 		computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true } -- Note: compressPositions turned off due to overlapping positions in bind pose
resource "Mesh" "P_WaterBucket_Water"			    { source = "P_WaterBucket_Water.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "Prop_BloomSunflowerUmbrella"				{ source = "Prop_BloomSunflowerUmbrella.fbx", 		computeOcclusions = true, computeEdges = false, compressPositions = false, compressUvs = true, stripNormals = true, loadLazy = true } -- Note: compressPositions turned off due to overlapping positions in bind pose
-- Days of Nature
-- Days of Color
-- Sky Anniversary
resource "Mesh" "Prop_JenovaFan"				{ source = "Prop_JenovaFan.fbx", 			computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Prop_AnniversaryClapboard"		{ source = "Prop_AnniversaryClapboard.fbx", 			computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
-- Days of Sunlight
resource "Mesh" "Prop_SunlightProjector"		{ source = "Prop_SunlightProjector.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "Prop_SunlightSandcastleA"		{ source = "Prop_SunlightSandcastleA.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "Prop_SunlightSandcastleB"		{ source = "Prop_SunlightSandcastleB.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "Prop_SunlightSandcastleC"		{ source = "Prop_SunlightSandcastleC.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "Prop_SunlightSandcastleD"		{ source = "Prop_SunlightSandcastleD.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "Prop_SunlightSandcastleE"		{ source = "Prop_SunlightSandcastleE.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "Prop_SunlightSandcastleF"		{ source = "Prop_SunlightSandcastleF.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "Prop_SunlightSandcastleG"		{ source = "Prop_SunlightSandcastleG.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "Prop_Lantern"      	      	{ source = "Prop_Lantern.fbx", 				computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
-- Days of Moonlight
-- Days of Style
-- Days of Mischief
-- Days of Feast
resource "Mesh" "Prop_SnowmanArm_01"      		{ source = "Prop_SnowmanArm_01.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "Prop_SnowmanArm_02"      		{ source = "Prop_SnowmanArm_02.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "Prop_SnowmanEye"      			{ source = "Prop_SnowmanEye.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "Prop_SnowmanMouth"      		{ source = "Prop_SnowmanMouth.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "Prop_SnowmanButton"      		{ source = "Prop_SnowmanButton.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "Prop_SnowmanNose"      		{ source = "Prop_SnowmanNose.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "Prop_SnowmanHead"      		{ source = "Prop_SnowmanHead.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "Prop_SnowmanBodySmall"      	{ source = "Prop_SnowmanBodySmall.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "Prop_SnowmanBodyMedium"      	{ source = "Prop_SnowmanBodyMedium.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "Prop_SnowmanBodyLarge"      	{ source = "Prop_SnowmanBodyLarge.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "Prop_SnowmanElk"      			{ source = "Prop_SnowmanElk.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "Prop_SnowmanHolly"      		{ source = "Prop_SnowmanHolly.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "Prop_SnowmanSantaHat"      	{ source = "Prop_SnowmanSantaHat.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "Prop_SnowmanYeti"      		{ source = "Prop_SnowmanYeti.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "Prop_SnowmanScarf"      		{ source = "Prop_SnowmanScarf.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "Prop_SnowmanBeard"      		{ source = "Prop_SnowmanBeard.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
-- Special
resource "Mesh" "Prop_ScepterWand"				{ source = "Prop_ScepterWand.fbx", 			computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Prop_FeastGloves"             	{ source = "Prop_FeastGloves.fbx", loadAsync = false, registerCollision = false, computeOcclusions = true }
resource "Mesh" "Prop_FeastGlove_Left"			{ source = "Prop_FeastGlove_Left.fbx", loadAsync = false, computeOcclusions = true, computeEdges = false, registerCollision = false }
resource "Mesh" "Prop_FeastGlove_Right"			{ source = "Prop_FeastGlove_Right.fbx", loadAsync = false, computeOcclusions = true, computeEdges = false, registerCollision = false }
resource "Mesh" "Prop_FeastGlove_Back"			{ source = "Prop_FeastGlove_Back.fbx", loadAsync = false, computeOcclusions = true, computeEdges = false, registerCollision = false }
resource "Mesh" "Prop_RibbonVelvetBag"     		{ source = "Prop_RibbonVelvetBag.fbx", loadAsync = false, registerCollision = false, computeOcclusions = true }
resource "Mesh" "Prop_RibbonHourglassBack"    { source = "Prop_RibbonHourglassBack.fbx", loadAsync = false, registerCollision = false, computeOcclusions = true }
resource "Mesh" "Prop_twinRibbon_Hourglass"     { source = "Prop_twinRibbon_Hourglass.fbx", loadAsync = false, registerCollision = false, computeOcclusions = true }
resource "Mesh" "Prop_twinRibbon_Hourglass01"   { source = "Prop_twinRibbon_Hourglass01.fbx", loadAsync = false, registerCollision = false, computeOcclusions = true }
resource "Mesh" "Prop_twinRibbon_Hourglass02"   { source = "Prop_twinRibbon_Hourglass02.fbx", loadAsync = false, registerCollision = false, computeOcclusions = true }
resource "Mesh" "Prop_twinRibbon_Hourglass03"   { source = "Prop_twinRibbon_Hourglass03.fbx", loadAsync = false, registerCollision = false, computeOcclusions = true }
resource "Mesh" "Prop_twinRibbon_Hourglass04"   { source = "Prop_twinRibbon_Hourglass04.fbx", loadAsync = false, registerCollision = false, computeOcclusions = true }
resource "Mesh" "Prop_twinRibbon_Hourglass05"	{ source = "Prop_twinRibbon_Hourglass05.fbx", loadAsync = false, registerCollision = true }
resource "Mesh" "Prop_TwinRibbon_Poster"        { source = "Prop_TwinRibbon_Poster.fbx", loadAsync = false, registerCollision = false, computeOcclusions = true }

------------------
-- Placeables

resource "Mesh" "Prop_InstrumentRackBack"		{ source = "Prop_InstrumentRackBack.fbx", 	loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "Prop_StoneMannequin"			{ source = "CharSkyKid_Prop_StoneMannequin.fbx", 		loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "Prop_StupaBell"				{ source = "Prop_StupaBell.fbx", 		loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "Prop_AP27LightMotesDown"		{ source = "Prop_AP27LightMotesDown.fbx", 		loadAsync = false, registerCollision = true, computeOcclusions = true }

-- Days of Fortune
-- Days of Love
resource "Mesh" "Prop_HeartPlush"				{ source = "Prop_HeartPlush.fbx", 			loadAsync = false, registerCollision = false, computeOcclusions = true }
-- Days of Bloom
resource "Mesh" "P_SunflowerBarTable"	{ source = "P_SunflowerBarTable.fbx", 		loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "P_SunflowerLadder"		{ source = "P_SunflowerLadder.fbx", 		loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "P_SunflowerPillow"		{ source = "P_SunflowerPillow.fbx", 		loadAsync = false, registerCollision = true, computeOcclusions = true}
resource "Mesh" "P_SunflowerRugHalfCircle"		{ source = "P_SunflowerRugHalfCircle.fbx", 		loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "P_SunflowerWallShelf"		{ source = "P_SunflowerWallShelf.fbx", 		loadAsync = false, registerCollision = true, computeOcclusions = true }
-- Days of Nature
-- Days of Music
resource "Mesh" "Prop_SequencerBack"			{ source = "Prop_SequencerBack.fbx", 		computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Prop_PianoUpright"				{ source = "Prop_PianoUpright.fbx", 	loadAsync = false, registerCollision = true, computeOcclusions = true, loadLazy = true }
resource "Mesh" "Prop_PianoUprightBack"			{ source = "Prop_PianoUprightBack.fbx", computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
-- Days of Color
-- Sky Anniversary
resource "Mesh" "Prop_AnniversaryMovieSeats"				{ source = "Prop_AnniversaryMovieSeats.fbx", 		loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "Prop_AnniversaryMovieSeats_Backpack"				{ source = "Prop_AnniversaryMovieSeats_Backpack.fbx", 		loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "Prop_AnniversaryCarpet"				{ source = "Prop_AnniversaryCarpet.fbx", 		loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "Prop_SkyBalloon"				{ source = "Prop_SkyBalloon.fbx", 		loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "Prop_BalloonArch"				{ source = "Prop_BalloonArch.fbx", 		loadAsync = false, registerCollision = true, computeOcclusions = true }
-- Days of Sunlight
resource "Mesh" "Prop_MantaFloat"				{ source = "Prop_MantaFloat.fbx", 			loadAsync = false, registerCollision = true, computeOcclusions = true }
-- Days of Moonlight
resource "Mesh" "Prop_MoonlightLantern"			{ source = "Prop_MoonlightLantern.fbx", 	loadAsync = false, registerCollision = true, computeOcclusions = true }
-- Days of Style
-- Days of Mischief
resource "Mesh" "Prop_MischiefBroom"				{ source = "Prop_MischiefBroom.fbx", 		loadAsync = false, registerCollision = true, computeOcclusions = true, copyFrameDelay = true }
resource "Mesh" "Prop_MischiefCauldron"				{ source = "Prop_MischiefCauldron.fbx", 	loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "Prop_MischiefCauldronCup"			{ source = "Prop_MischiefCauldronCup.fbx", 	loadAsync = false, registerCollision = false }
resource "Mesh" "Prop_ChestBox"                     { source = "Prop_ChestBox.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "Prop_ChestLid"                    { source = "Prop_ChestLid.fbx",             loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "Prop_Lockbox"                     { source = "Prop_Lockbox.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "Prop_LockboxLid"                    { source = "Prop_LockboxLid.fbx",             loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "Prop_PuzzleCage"                     { source = "Prop_PuzzleCage.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "Prop_PuzzleCageDoor"                    { source = "Prop_PuzzleCageDoor.fbx", loadAsync = false, registerCollision = false, computeOcclusions = true }
resource "Mesh" "Prop_PuzzleCage_Collision"                    { source = "Prop_PuzzleCage_Collision.fbx", loadAsync = false, registerCollision = false, computeOcclusions = true }
resource "Mesh" "PressurePlate"                 { source = "PressurePlate.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "PressureReceiver"                 { source = "PressureReceiver.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "PressureReceiverDiamond"                 { source = "PressureReceiverDiamond.fbx", loadAsync = false, registerCollision = false, computeOcclusions = true }
resource "Mesh" "PressurePlateGlow"                 { source = "PressurePlateGlow.fbx", loadAsync = false, registerCollision = false, computeOcclusions = true }
resource "Mesh" "PressurePlateBase"                 { source = "PressurePlateBase.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "PressurePlateDiamond"                 { source = "PressurePlateDiamond.fbx", loadAsync = false, registerCollision = false, computeOcclusions = true }
resource "Mesh" "FireLockPlate"                 { source = "FireLockPlate.fbx", loadAsync = false, registerCollision = false, computeOcclusions = true }
resource "Mesh" "FireLockPlateDiamond"                 { source = "FireLockPlateDiamond.fbx", loadAsync = false, registerCollision = false, computeOcclusions = true }
resource "Mesh" "KeyholeLock"                 { source = "KeyholeLock.fbx", loadAsync = false, registerCollision = false, computeOcclusions = true }
resource "Mesh" "ComboLockPlate"                 { source = "ComboLockPlate.fbx", loadAsync = false, registerCollision = false, computeOcclusions = true }
resource "Mesh" "ComboLockBarrel"                 { source = "ComboLockBarrel.fbx", loadAsync = false, registerCollision = false, computeOcclusions = true }
resource "Mesh" "Prop_PuzzleKey"                    { source = "Prop_PuzzleKey.fbx",             loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "Prop_SkeletonKey"                    { source = "Prop_SkeletonKey.fbx",             loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "DoTreasure_Chest"                { source = "DoTreasure_Chest.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "DoTreasure_ChestLid"                { source = "DoTreasure_ChestLid.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "Prop_MessageStone"                    { source = "Prop_MessageStone.fbx",             loadAsync = false, registerCollision = true, computeOcclusions = true }

-- Days of Feast
resource "Mesh" "Prop_TeaBath"					{ source = "Prop_TeaBath.fbx", 	loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "P_TeaBathSmallWater"			{ source = "P_TeaBathSmallWater.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "Prop_CrabbitPortal"                    { source = "Prop_CrabbitPortal.fbx",     loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "Prop_CrabbitPortalDoor"                { source = "Prop_CrabbitPortalDoor.fbx",     loadAsync = false, registerCollision = false, computeOcclusions = true }
resource "Mesh" "Prop_CrabbitPortalFrame"               { source = "Prop_CrabbitPortalFrame.fbx",     loadAsync = false, registerCollision = true, computeOcclusions = true }
-- Days of Style
-- Special

resource "Mesh" "CharSkyKid_Prop_Chair"					{ source = "CharSkyKid_Prop_Chair.fbx", computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "CharSkyKid_Prop_StarJar"               { source = "CharSkyKid_Prop_StarJar_A.fbx", computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "CharSkyKid_Prop_ChairXmas"				{ source = "CharSkyKid_Prop_ChairXmas.fbx", computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "CharSkyKid_Prop_Swing"					{ source = "CharSkyKid_Prop_Swing.fbx", computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "CharSkyKid_Prop_Seesaw"				{ source = "CharSkyKid_Prop_Seesaw.fbx", computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "CharSkyKid_Prop_Cannon_01"       		{ source = "CharSkyKid_Prop_Cannon_01.fbx", computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "Prop_Bookshelf"						{ source = "CharSkyKid_Prop_AP10Bookshelf_02.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "Prop_Hammock"							{ source = "CharSkyKid_Prop_AP10Hammock_02.fbx", loadAsync = false, registerCollision = true }
resource "Mesh" "Torch"									{ source = "CharSkyKid_Prop_AP10Torch_01.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "Prop_Tent"								{ source = "CharSkyKid_Prop_AP10Tent_02.fbx", loadAsync = false, registerCollision = true }
resource "Mesh" "Spotlight"								{ source = "CharSkyKid_Prop_AP10Spotlight_01.fbx", loadAsync = false, registerCollision = false, computeOcclusions = true }
resource "Mesh" "Prop_Hoop"								{ source = "CharSkyKid_Prop_AP10Hoop_02.fbx", loadAsync = false, registerCollision = true }
resource "Mesh" "Prop_Brazier"							{ source = "CharSkyKid_Prop_AP10Brazier_01.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "Prop_Jar"								{ source = "CharSkyKid_Prop_AP10Jar_01.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "Prop_Pillow"							{ source = "CharSkyKid_Prop_AP10Pillow_01.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "Prop_PillowXmas_Persistent"			{ source = "Prop_WinterPillow_01.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }

resource "Mesh" "CharSkyKid_Prop_MarshmallowBundle"     { source = "CharSkyKid_Prop_MarshmallowBundle.fbx", computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true, copyFrameDelay = true}
resource "Mesh" "CharSkyKid_Prop_MarshmallowStick"      { source = "CharSkyKid_Prop_MarshmallowStick.fbx", computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "CharSkyKid_Prop_TeaTable_01"			{ source = "CharSkyKid_Prop_TeaTable_01.fbx", computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "CharSkyKid_Prop_PicnicBlanket_01"		{ source = "CharSkyKid_Prop_PicnicBlanket.fbx", computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "CharSkyKid_Prop_FlowerArch"			{ source = "CharSkyKid_Prop_FlowerArch.fbx", computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "CharSkyKid_Prop_WisteriaTea_01"		{ source = "CharSkyKid_Prop_WisteriaTea_01.fbx", computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "CharSkyKid_Prop_SummerUmbrella_01"		{ source = "CharSkyKid_Prop_SummerUmbrella_01.fbx", computeOcclusions = true, computeEdges = false, compressPositions = false, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true } -- Note: compressPositions turned off due to overlapping positions in bind pose
resource "Mesh" "CharSkyKid_Prop_SummerUmbrella_02"		{ source = "CharSkyKid_Prop_SummerUmbrella_02.fbx", computeOcclusions = true, computeEdges = false, compressPositions = false, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true } -- Note: compressPositions turned off due to overlapping positions in bind pose
resource "Mesh" "CharSkyKid_Prop_MischiefChair"			{ source = "CharSkyKid_Prop_MischiefChair.fbx", computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "CharSkyKid_Prop_VelvetBag_01"			{ source = "CharSkyKid_Prop_VelvetBag_01.fbx", computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "CharSkyKid_Prop_FeastBall"				{ source = "CharSkyKid_Prop_FeastBall.fbx", computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "CharSkyKid_Prop_Gondola_01"			{ source = "CharSkyKid_Prop_Gondola_01.fbx", computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "CharSkyKid_Prop_Shield_01"				{ source = "CharSkyKid_Prop_Shield_01.fbx", computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "CharSkyKid_Prop_Snowman"               { source = "CharSkyKid_Prop_Snowman.fbx", computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, stripUv13 = true }
resource "Mesh" "CharSkyKid_Prop_AP19Camera"            { source = "CharSkyKid_Prop_Camera.fbx", computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, stripUv13 = true }
resource "Mesh" "CharSkyKid_Prop_AP19UltimateCamera"    { source = "CharSkyKid_Prop_AP19Camera.fbx", computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, stripUv13 = true }
resource "Mesh" "CharSkyKid_Prop_CompetitionTorch"      { source = "CharSkyKid_Prop_CompetitionTorch.fbx", computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "Prop_IceSlideConcaveNe"              	{ source = "Prop_IceSlideConcaveNe.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "Prop_IceSlideConvexNe"              	{ source = "Prop_IceSlideConvexNe.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "Prop_IceBlockVerticalNe"           	{ source = "Prop_IceBlockVerticalNe.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "Prop_IceBlockHorizontalNe"             { source = "Prop_IceBlockHorizontalNe.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }


------------------
-- Instruments
resource "Mesh" "CharSkyKid_Prop_Harp"					{ source = "CharSkyKid_Prop_Harp.fbx", computeOcclusions = true, computeEdges = false, compressPositions = false, compressUvs = false, stripNormals = false, loadLazy = true, stripUv13 = false }
resource "Mesh" "CharSkyKid_Prop_Harp_02"				{ source = "CharSkyKid_Prop_Harp_02.fbx", computeOcclusions = true, computeEdges = false, compressPositions = false, compressUvs = false, stripNormals = false, loadLazy = true, stripUv13 = false }
resource "Mesh" "CharSkyKid_Prop_Bass"					{ source = "CharSkyKid_Prop_Bass.fbx", computeOcclusions = true, computeEdges = false, compressPositions = false, compressUvs = false, stripNormals = false, loadLazy = true, stripUv13 = false }
resource "Mesh" "CharSkyKid_Prop_AP04Guitar_01"			{ source = "CharSkyKid_Prop_AP04Guitar_01.fbx", computeOcclusions = true, computeEdges = false, compressPositions = false, compressUvs = false, stripNormals = false, loadLazy = true, stripUv13 = false }
resource "Mesh" "CharSkyKid_Prop_AP04Guitar_02"			{ source = "CharSkyKid_Prop_AP04Guitar_02.fbx", computeOcclusions = true, computeEdges = false, compressPositions = false, compressUvs = false, stripNormals = false, loadLazy = true, stripUv13 = false, copyFrameDelay = true }
resource "Mesh" "CharSkyKid_Prop_AP04Ukulele_01"		{ source = "CharSkyKid_Prop_AP04Ukulele_01.fbx", computeOcclusions = true, computeEdges = false, compressPositions = false, compressUvs = false, stripNormals = false, loadLazy = true, stripUv13 = false }
resource "Mesh" "CharSkyKid_Prop_AP09Lute_01"			{ source = "CharSkyKid_Prop_AP09Lute_01.fbx", computeOcclusions = true, computeEdges = false, compressPositions = false, compressUvs = false, stripNormals = false, loadLazy = true, stripUv13 = false }
resource "Mesh" "CharSkyKid_Prop_AP14Guitar_01"			{ source = "CharSkyKid_Prop_AP14Guitar_01.fbx", computeOcclusions = true, computeEdges = false, compressPositions = false, compressUvs = false, stripNormals = false, loadLazy = true, stripUv13 = false, copyFrameDelay = true }
resource "Mesh" "CharSkyKid_Prop_AP14Guitar_02"			{ source = "CharSkyKid_Prop_AP14Guitar_02.fbx", computeOcclusions = true, computeEdges = false, compressPositions = false, compressUvs = false, stripNormals = false, loadLazy = true, stripUv13 = false, copyFrameDelay = true }
resource "Mesh" "CharSkyKid_Prop_Piano"					{ source = "CharSkyKid_Prop_Piano.fbx", computeOcclusions = true, computeEdges = false, compressPositions = false, compressUvs = false, stripNormals = false, loadLazy = true, stripUv13 = false }
resource "Mesh" "CharSkyKid_Prop_APPiano_01"			{ source = "CharSkyKid_Prop_APPiano_01.fbx", computeOcclusions = true, computeEdges = false, compressPositions = false, compressUvs = false, stripNormals = false, loadLazy = true, stripUv13 = false }
resource "Mesh" "CharSkyKid_Prop_APPiano_02"			{ source = "CharSkyKid_Prop_APPiano_02.fbx", computeOcclusions = true, computeEdges = false, compressPositions = false, compressUvs = false, stripNormals = false, loadLazy = true, stripUv13 = false, copyFrameDelay = true }
resource "Mesh" "CharSkyKid_Prop_AP05Xylophone_01"		{ source = "CharSkyKid_Prop_AP05Xylophone_01.fbx", computeOcclusions = true, computeEdges = false, compressPositions = false, compressUvs = false, stripNormals = false, loadLazy = true, stripUv13 = false }
resource "Mesh" "CharSkyKid_Prop_AP12Kalimba_01"		{ source = "CharSkyKid_Prop_AP12Kalimba_01.fbx", computeOcclusions = true, computeEdges = false, compressPositions = false, compressUvs = false, stripNormals = false, loadLazy = true, stripUv13 = false }
resource "Mesh" "CharSkyKid_Prop_Horn"					{ source = "CharSkyKid_Prop_Horn.fbx", computeOcclusions = true, computeEdges = false, compressPositions = false, compressUvs = false, stripNormals = false, loadLazy = true, stripUv13 = false }
resource "Mesh" "CharSkyKid_Prop_AP03Flute_01"			{ source = "CharSkyKid_Prop_AP03Flute_01.fbx", computeOcclusions = true, computeEdges = false, compressPositions = false, compressUvs = false, stripNormals = false, loadLazy = true, stripUv13 = false }
resource "Mesh" "CharSkyKid_Prop_AP03PanFlute_01"		{ source = "CharSkyKid_Prop_AP03PanFlute_01.fbx", computeOcclusions = true, computeEdges = false, compressPositions = false, compressUvs = false, stripNormals = false, loadLazy = true, stripUv13 = false }
resource "Mesh" "CharSkyKid_Prop_AP10Bugle_01"			{ source = "CharSkyKid_Prop_AP10Bugle_01.fbx", computeOcclusions = true, computeEdges = false, compressPositions = false, compressUvs = false, stripNormals = false, loadLazy = true, stripUv13 = false }
resource "Mesh" "CharSkyKid_Prop_AP10Bugle_02"			{ source = "CharSkyKid_Prop_AP10Bugle_02.fbx", computeOcclusions = true, computeEdges = false, compressPositions = false, compressUvs = false, stripNormals = false, loadLazy = true, stripUv13 = false, copyFrameDelay = true }
resource "Mesh" "CharSkyKid_Prop_Ocarina_01"            { source = "CharSkyKid_Prop_Ocarina_01.fbx", computeOcclusions = true, computeEdges = false, compressPositions = false, compressUvs = false, stripNormals = false, loadLazy = true, stripUv13 = false }
resource "Mesh" "CharSkyKid_Prop_Drums"					{ source = "CharSkyKid_Prop_Drums.fbx", computeOcclusions = true, computeEdges = false, compressPositions = false, compressUvs = false, stripNormals = false, loadLazy = true, stripUv13 = false }
resource "Mesh" "CharSkyKid_Prop_AP02Bell_01"			{ source = "CharSkyKid_Prop_AP02Bell_01.fbx", computeOcclusions = true, computeEdges = false, compressPositions = false, compressUvs = false, stripNormals = false, loadLazy = true, stripUv13 = false }
resource "Mesh" "CharSkyKid_Prop_AP02Bell_02"			{ source = "CharSkyKid_Prop_AP02Bell_02.fbx", computeOcclusions = true, computeEdges = false, compressPositions = false, compressUvs = false, stripNormals = false, loadLazy = true, stripUv13 = false }
resource "Mesh" "CharSkyKid_Prop_AP07HandPan"			{ source = "CharSkyKid_Prop_AP07HandPan_01.fbx", computeOcclusions = true, computeEdges = false, compressPositions = false, compressUvs = false, stripNormals = false, loadLazy = true, stripUv13 = false }
resource "Mesh" "CharSkyKid_Prop_AP07HandPan_02"		{ source = "CharSkyKid_Prop_AP07HandPan_02.fbx", computeOcclusions = true, computeEdges = false, compressPositions = false, compressUvs = false, stripNormals = false, loadLazy = true, stripUv13 = false, copyFrameDelay = true }
resource "Mesh" "CharSkyKid_Prop_AP08Dundun"            { source = "CharSkyKid_Prop_AP08Dundun.fbx", computeOcclusions = true, computeEdges = false, compressPositions = false, compressUvs = false, stripNormals = false, loadLazy = true, stripUv13 = false }
resource "Mesh" "CharSkyKid_Prop_AP08Dundun_02"         { source = "CharSkyKid_Prop_AP08Dundun_02.fbx", computeOcclusions = true, computeEdges = false, compressPositions = false, compressUvs = false, stripNormals = false, loadLazy = true, stripUv13 = false, copyFrameDelay = true }
resource "Mesh" "CharSkyKid_Prop_AP16Microphone"		{ source = "CharSkyKid_Prop_AP16Microphone.fbx", computeOcclusions = true, computeEdges = false, compressPositions = false, compressUvs = false, stripNormals = false, loadLazy = true, stripUv13 = false, copyFrameDelay = true }
resource "Mesh" "CharSkyKid_Prop_Microphone"		    { source = "CharSkyKid_Prop_Microphone.fbx", computeOcclusions = true, computeEdges = false, compressPositions = false, compressUvs = false, stripNormals = false, loadLazy = true, stripUv13 = false, copyFrameDelay = true }
resource "Mesh" "CharSkyKid_Prop_AP18Ocarina"			{ source = "CharSkyKid_Prop_AP18Ocarina.fbx", computeOcclusions = true, computeEdges = false, compressPositions = false, compressUvs = false, stripNormals = false, loadLazy = true, stripUv13 = false }
resource "Mesh" "CharSkyKid_Prop_Violin"				{ source = "CharSkyKid_Prop_Violin.fbx", computeOcclusions = true, computeEdges = false, compressPositions = false, compressUvs = false, stripNormals = false, loadLazy = true, stripUv13 = false }
resource "Mesh" "CharSkyKid_Prop_Saxophone"				{ source = "CharSkyKid_Prop_Saxophone.fbx", computeOcclusions = true, computeEdges = false, compressPositions = false, compressUvs = false, stripNormals = false, loadLazy = true, stripUv13 = false }
resource "Mesh" "CharSkyKid_Prop_FortuneDrumSticks"     { source = "CharSkyKid_Prop_FortuneDrumSticks.fbx", loadAsync = false, registerCollision = false, computeOcclusions = true }


-- Days of Fortune
resource "Mesh" "CharSkyKid_Prop_FortuneDrumStick"      { source = "Prop_FortuneDrumStick.fbx", loadAsync = false, registerCollision = false, computeOcclusions = true }
resource "Mesh" "CharSkyKid_Prop_FortuneDrum"         	{ source = "CharSkyKid_Prop_FortuneDrum.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
-- Days of Love
-- Days of Bloom
-- Days of Nature
-- Days of Color
resource "Mesh" "CharSkyKid_Prop_JarBubbleMachine"		{ source = "CharSkyKid_Prop_JarBubbleMachine.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
-- Sky Anniversary
-- Days of Sunlight
-- Days of Moonlight
-- Days of Style
-- Days of Mischief
-- Days of Feast
-- Special

-- AP02 Gratitude Meshes
resource "Mesh" "Neck_AP02Pendant"					{ source = "Neck_AP02Pendant.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_AP02Fur"						{ source = "Wing_AP02Fur.fbx", 				sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_AP02Tail"						{ source = "Wing_AP02Tail.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_AP02Stupa"					{ source = "Hair_AP02Stupa.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_AP02Bhutan"					{ source = "Hair_AP02Bhutan.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_AP02Cone"						{ source = "Hair_AP02Cone.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Mask_AP02Bird"						{ source = "Mask_AP02Bird.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Mask_AP02Bull"						{ source = "Mask_AP02Bull.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Mask_AP02Crab"						{ source = "Mask_AP02Crab.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Mask_AP02Deer"						{ source = "Mask_AP02Deer.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Mask_AP02Fox"						{ source = "Mask_AP02Fox.fbx", 				sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Mask_AP02Weasel"					{ source = "Mask_AP02Weasel.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }

-- AP03 Lightseeker Meshes
resource "Mesh" "Neck_AP03Pendant"					{ source = "Neck_AP03Pendant.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_AP03BiolumBlue"				{ source = "Wing_AP03BiolumBlue.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_AP03BiolumGlow"				{ source = "Wing_AP03BiolumGlow.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_AP03Petal"					{ source = "Wing_AP03Petal.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_AP03Victorian"				{ source = "Hair_AP03Victorian.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_AP03Samurai"					{ source = "Hair_AP03Samurai.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_AP03Barrette"					{ source = "Hair_AP03Barrette.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_AP03Upstyle"					{ source = "Hair_AP03Upstyle.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_AP03Umbrella"					{ source = "Hair_AP03Umbrella.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Mask_AP03MaskA"					{ source = "Mask_AP03MaskA.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Mask_AP03MaskB"					{ source = "Mask_AP03MaskB.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Mask_AP03MaskC"					{ source = "Mask_AP03MaskC.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Mask_AP03MaskD"					{ source = "Mask_AP03MaskD.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Mask_AP03MaskE"					{ source = "Mask_AP03MaskE.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Mask_AP03MaskF"					{ source = "Mask_AP03MaskF.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Mask_AP03MaskG"					{ source = "Mask_AP03MaskG.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
-- Umbrella note: compressPositions turned off due to overlapping positions in bind pose
resource "Mesh" "Prop_AP03UmbrellaPurple"			{ source = "Prop_AP03UmbrellaPurple.fbx", 	computeOcclusions = true, computeEdges = false, compressPositions = false, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Prop_AP03UmbrellaTeal" 			{ source = "Prop_AP03UmbrellaTeal.fbx", 	computeOcclusions = true, computeEdges = false, compressPositions = false, compressUvs = true, stripNormals = true, loadLazy = true }

-- AP04 Belonging Meshes
resource "Mesh" "Neck_AP04Pendant"					{ source = "Neck_AP04Pendant.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_AP04Child"					{ source = "Wing_AP04Child.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_AP04Adult"					{ source = "Wing_AP04Adult.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_AP04Elder"					{ source = "Wing_AP04Elder.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Body_AP04CozyPants"				{ source = "Body_AP04CozyPants.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_AP04Ribbon"					{ source = "Hair_AP04Ribbon.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_AP04WavyBob"					{ source = "Hair_AP04WavyBob.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Mask_AP04Child"					{ source = "Mask_AP04Child.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Mask_AP04Adult"					{ source = "Mask_AP04Adult.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Mask_AP04Mustache"					{ source = "Mask_AP04Mustache.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Mask_AP04Beard"					{ source = "Mask_AP04Beard.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Horn_AP04EarMuffs"					{ source = "Horn_AP04EarMuffs.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Prop_AP04BonfireBack"				{ source = "Prop_AP04BonfireBack.fbx", 		computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }

-- AP05 Rhythm Meshes
resource "Mesh" "Neck_AP05Pendant"					{ source = "Neck_AP05Pendant.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_AP05Juggler"					{ source = "Wing_AP05Juggler.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_AP05Director"					{ source = "Wing_AP05Director.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Body_AP05MerchantPants"			{ source = "Body_AP05MerchantPants.fbx", 	sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Body_AP05DancerPants"				{ source = "Body_AP05DancerPants.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Body_AP05ActorPants"				{ source = "Body_AP05ActorPants.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Body_AP05JugglerPants"				{ source = "Body_AP05JugglerPants.fbx", 	sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_AP05Director"					{ source = "Hair_AP05Director.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_AP05Dancer"					{ source = "Hair_AP05Dancer.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_AP05Juggler"					{ source = "Hair_AP05Juggler.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_AP05Musician"					{ source = "Hair_AP05Musician.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Mask_AP05Default"					{ source = "Mask_AP05Default.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Mask_AP05Musician"					{ source = "Mask_AP05Musician.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Mask_AP05Merchant"					{ source = "Mask_AP05Merchant.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Mask_AP05Actor"					{ source = "Mask_AP05Actor.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Mask_AP05Director"					{ source = "Mask_AP05Director.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }

-- AP06 Enchantment Meshes
resource "Mesh" "Neck_AP06Pendant"					{ source = "Neck_AP06Pendant.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_AP06Trim"						{ source = "Wing_AP06Trim.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_AP06Tassel"					{ source = "Wing_AP06Tassel.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_AP06LayeredPurple"			{ source = "Wing_AP06LayeredPurple.fbx", 	sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_AP06LayeredYellow"			{ source = "Wing_AP06LayeredYellow.fbx", 	sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_AP06Turban"					{ source = "Hair_AP06Turban.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_AP06Pigtails"					{ source = "Hair_AP06Pigtails.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_AP06WizardHat"				{ source = "Hair_AP06WizardHat.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_AP06ScoutHat"					{ source = "Hair_AP06ScoutHat.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_AP06WizardHair"				{ source = "Hair_AP06WizardHair.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_AP06BunRound"					{ source = "Hair_AP06BunRound.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_AP06ConeHat"					{ source = "Hair_AP06ConeHat.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Mask_AP06VeilPurple"				{ source = "Mask_AP06VeilPurple.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Mask_AP06VeilGold"					{ source = "Mask_AP06VeilGold.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Mask_AP06WizardBeard"				{ source = "Mask_AP06WizardBeard.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Mask_AP06Scarf"					{ source = "Mask_AP06Scarf.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Horn_AP06Tassel"					{ source = "Horn_AP06Tassel.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }

-- AP07 Sanctuary Meshes
resource "Mesh" "Neck_AP07Pendant"					{ source = "Neck_AP07Pendant.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_AP07Aloha"					{ source = "Wing_AP07Aloha.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_AP07Shell"					{ source = "Wing_AP07Shell.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_AP07Butterfly"				{ source = "Wing_AP07Butterfly.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_AP07Manta"					{ source = "Wing_AP07Manta.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Body_AP07Jumpsuits"				{ source = "Body_AP07Jumpsuit.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Body_AP07CargoPants"				{ source = "Body_AP07CargoPants.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Neck_AP07BowTie"					{ source = "Neck_AP07BowTie.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_AP07Jellyfish"				{ source = "Hair_AP07Jellyfish.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_AP07Braid"					{ source = "Hair_AP07Braid.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_AP07BowlCut"					{ source = "Hair_AP07BowlCut.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_AP07Balding"					{ source = "Hair_AP07Balding.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_AP07Undercut"					{ source = "Hair_AP07Undercut.fbx",			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hat_AP07StrawHat"  		    	{ source = "Hat_AP07StrawHat.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Mask_AP07ThickBrows"				{ source = "Mask_AP07ThickBrows.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Face_AP07Sunglasses"				{ source = "Face_AP07Sunglasses.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }

-- AP08 Prophecy Meshes
resource "Mesh" "Neck_AP08Pendant"					{ source = "Neck_AP08Pendant.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_AP08Bat"						{ source = "Wing_AP08Bat.fbx", 				sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_AP08Turtle"					{ source = "Wing_AP08Turtle.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_AP08Spider"					{ source = "Wing_AP08Spider.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Body_AP08BaggyPants"				{ source = "Body_AP08BaggyPants.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_AP08ShortDreads"				{ source = "Hair_AP08ShortDreads.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_AP08Ponytail"					{ source = "Hair_AP08Ponytail.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_AP08Braid"					{ source = "Hair_AP08Braid.fbx",			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_AP08DoubleBun"				{ source = "Hair_AP08DoubleBun.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Mask_AP08Turtle"					{ source = "Mask_AP08Turtle.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Mask_AP08Wolf"						{ source = "Mask_AP08Wolf.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Mask_AP08Bat"						{ source = "Mask_AP08Bat.fbx", 				sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Mask_AP08Spider"					{ source = "Mask_AP08Spider.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Mask_AP08Lion"						{ source = "Mask_AP08Lion.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }

-- AP09 Dreams Meshes
resource "Mesh" "Neck_AP09Pendant"					{ source = "Neck_AP09Pendant.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_AP09Waves"					{ source = "Wing_AP09Waves.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_AP09Robe"						{ source = "Wing_AP09Robe.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_AP09Fur"						{ source = "Wing_AP09Fur.fbx", 				sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_AP09Phoenix"					{ source = "Wing_AP09Phoenix.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Body_AP09Yeti"						{ source = "Body_AP09Yeti.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Body_AP09Uniform"					{ source = "Body_AP09Uniform.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Feet_AP09UniformBoots"				{ source = "Feet_AP09UniformBoots.fbx",		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_AP09Hat"						{ source = "Hair_AP09Hat.fbx", 				sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_AP09Yeti"						{ source = "Hair_AP09Yeti.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_AP09MultiBuns"				{ source = "Hair_AP09MultiBuns.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_AP09BambooHat"				{ source = "Hair_AP09BambooHat.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Mask_AP09Rabbit"					{ source = "Mask_AP09Rabbit.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Mask_AP09Phoenix"					{ source = "Mask_AP09Phoenix.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Mask_AP09Pigeon"					{ source = "Mask_AP09Pigeon.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Mask_AP09Quail"					{ source = "Mask_AP09Quail.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Horn_AP09Yeti"						{ source = "Horn_AP09Yeti.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }

-- AP10 Assembly Meshes
resource "Mesh" "Neck_AP10Pendant"					{ source = "Neck_AP10Pendant.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_AP10YellowCape"				{ source = "Wing_AP10YellowCape.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_AP10GreenCape"				{ source = "Wing_AP10GreenCape.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Body_AP10Overalls"					{ source = "Body_AP10Overalls.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Feet_AP10Overalls"            		{ source = "Feet_AP10Overalls.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_AP10PotHat"					{ source = "Hair_AP10PotHat.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_AP10StrawCrown"				{ source = "Hair_AP10StrawCrown.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_AP10Bandana"					{ source = "Hair_AP10Bandana.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_AP10PonytailDreads"			{ source = "Hair_AP10PonytailDreads.fbx", 	sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_AP10LongBangs"				{ source = "Hair_AP10LongBangs.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_AP10FrontBraids"				{ source = "Hair_AP10FrontBraids.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Mask_AP10MaskA"					{ source = "Mask_AP10MaskA.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Mask_AP10MaskB"					{ source = "Mask_AP10MaskB.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Mask_AP10MaskC"					{ source = "Mask_AP10MaskC.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Mask_AP10MaskD"					{ source = "Mask_AP10MaskD.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Mask_AP10QuestGiver"				{ source = "Mask_AP10QuestGiver.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Mask_AP10Eyepatch"					{ source = "Mask_AP10Eyepatch.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Mask_AP10Sticks"					{ source = "Mask_AP10Sticks.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }

resource "Mesh" "CharSkyKid_Prop_AP10Hammock_01" 		{ source = "CharSkyKid_Prop_AP10Hammock_01.fbx", computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "CharSkyKid_Prop_AP10Tent_01"			{ source = "CharSkyKid_Prop_AP10Tent_01.fbx", computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "CharSkyKid_Prop_AP10Tent_03"			{ source = "CharSkyKid_Prop_AP10Tent_03.fbx", computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "CharSkyKid_Prop_AP10Hoop_01"			{ source = "CharSkyKid_Prop_AP10Hoop_01.fbx", computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }

-- AP11 The Little Prince Meshes
resource "Mesh" "Neck_AP11Pendant"					{ source = "Neck_AP11Pendant.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_AP11Tattered"					{ source = "Wing_AP11Tattered.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_AP11HeavyFur"					{ source = "Wing_AP11HeavyFur.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_AP11Wrinkled"					{ source = "Wing_AP11Wrinkled.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_AP11Uniform"					{ source = "Wing_AP11Uniform.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_AP11GreenCoat"				{ source = "Wing_AP11GreenCoat.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_AP11Scarf"					{ source = "Wing_AP11Scarf.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Body_AP11Ancestor"					{ source = "Body_AP11Ancestor.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Body_AP11Sword"					{ source = "Body_AP11Sword.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Body_AP11GreenPajama"				{ source = "Body_AP11GreenPajama.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Neck_AP11Ascot"					{ source = "Neck_AP11Ascot.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_AP11ConeHat"					{ source = "Hair_AP11ConeHat.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_AP11Messy"					{ source = "Hair_AP11Messy.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_AP11LongWavy"					{ source = "Hair_AP11LongWavy.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_AP11Crown"					{ source = "Hair_AP11Crown.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_AP11UniformHat"				{ source = "Hair_AP11UniformHat.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_AP11Prince"					{ source = "Hair_AP11Prince.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Mask_AP11Frog"						{ source = "Mask_AP11Frog.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Prop_AP11Fox"						{ source = "Prop_AP11Fox.fbx", 				loadAsync = false, registerCollision = false, computeOcclusions = true }
resource "Mesh" "Prop_AP11FoxBack"					{ source = "Prop_AP11FoxBack.fbx", 			computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, copyFrameDelay = true }

-- AP12 Flight Meshes
resource "Mesh" "Neck_AP12Pendant"					{ source = "Neck_AP12Pendant.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Neck_AP12Scales"					{ source = "Neck_AP12Scales.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_AP12BlueWing"					{ source = "Wing_AP12BlueWing.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_AP12TwoTone"					{ source = "Wing_AP12TwoTone.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Body_AP12GradientTunic"			{ source = "Body_AP12GradientTunic.fbx", 	sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Body_AP12DarkTunic"				{ source = "Body_AP12DarkTunic.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Body_AP12YellowTunic"				{ source = "Body_AP12YellowTunic.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Body_AP12BlueTunic"				{ source = "Body_AP12BlueTunic.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_AP12FeatherHat"				{ source = "Hair_AP12FeatherHat.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_AP12RuffledLong"				{ source = "Hair_AP12RuffledLong.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_AP12RuffledShort"				{ source = "Hair_AP12RuffledShort.fbx", 	sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_AP12Goggles"					{ source = "Hair_AP12Goggles.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hat_AP12Dove"						{ source = "Hat_AP12Dove.fbx", 				sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hat_AP12SideFeather"				{ source = "Hat_AP12SideFeather.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hat_AP12DoubleFeather"				{ source = "Hat_AP12DoubleFeather.fbx", 	sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hat_AP12DeluxeFeather"				{ source = "Hat_AP12DeluxeFeather.fbx", 	sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }

-- AP13 Abyss Meshes
resource "Mesh" "Neck_AP13Pendant"					{ source = "Neck_AP13Pendant.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_AP13Coat"						{ source = "Wing_AP13Coat.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_AP13Shawl"					{ source = "Wing_AP13Shawl.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_AP13Shoulder"					{ source = "Wing_AP13Shoulder.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_AP13NobleCloak"				{ source = "Wing_AP13NobleCloak.fbx",		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_AP13LeatherScales"			{ source = "Wing_AP13LeatherScales.fbx", 	sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Body_AP13Tunic_01"					{ source = "Body_AP13Tunic.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_AP13BucketHat"				{ source = "Hair_AP13BucketHat.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_AP13LongBraids" 		    	{ source = "Hair_AP13LongBraids.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_AP13TattooBraids"  			{ source = "Hair_AP13TattooBraids.fbx", 	sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hat_AP13AcornHat"    		 		{ source = "Hat_AP13AcornHat.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Mask_AP13FullBeard"				{ source = "Mask_AP13FullBeard.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Mask_AP13Cracked"     				{ source = "Mask_AP13Cracked.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Mask_AP13BraidedBeard"  			{ source = "Mask_AP13BraidedBeard.fbx", 	sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Mask_AP13Scar"     				{ source = "Mask_AP13Scar.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Mask_AP13SnorkelLite"    			{ source = "Mask_AP13SnorkelLite.fbx",		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Mask_AP13Snorkel"     				{ source = "Mask_AP13Snorkel.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Horn_AP13Braids"					{ source = "Horn_AP13Braids.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }

-- AP14 Performance Meshes
resource "Mesh" "Neck_AP14Pendant"					{ source = "Neck_AP14Pendant.fbx",			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_AP14Jester"					{ source = "Wing_AP14Jester.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_AP14Tuxedo"					{ source = "Wing_AP14Tuxedo.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_AP14TatteredScarf"			{ source = "Wing_AP14TatteredScarf.fbx", 	sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Body_AP14ShadowPants"				{ source = "Body_AP14ShadowPants.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Body_AP14DancerSkirt"				{ source = "Body_AP14DancerSkirt.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Body_AP14JesterPants"				{ source = "Body_AP14JesterPants.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_AP14JesterHood"				{ source = "Hair_AP14JesterHood.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_AP14ShadowHood"				{ source = "Hair_AP14ShadowHood.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_AP14HeadWrap"					{ source = "Hair_AP14HeadWrap.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_AP14CurlyLong"				{ source = "Hair_AP14CurlyLong.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_AP14TuftedDirector"			{ source = "Hair_AP14TuftedDirector.fbx", 	sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Mask_AP14LongTufts"    		 	{ source = "Mask_AP14LongTufts.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Mask_AP14Determined"				{ source = "Mask_AP14Determined.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Mask_AP14Surprised"				{ source = "Mask_AP14Surprised.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Mask_AP14Focused"					{ source = "Mask_AP14Focused.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Mask_AP14Happy"					{ source = "Mask_AP14Happy.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Mask_AP14Sad"						{ source = "Mask_AP14Sad.fbx", 				sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Prop_AP14VaseBouquet"				{ source = "Prop_AP14VaseBouquet.fbx", 		loadAsync = false, registerCollision = true, computeOcclusions = true }

-- AP15 Shattering Meshes
resource "Mesh" "Neck_AP15Pendant"					{ source = "Neck_AP15Pendant.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Neck_AP15Crab"						{ source = "Neck_AP15Crab.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_AP15Krill"					{ source = "Wing_AP15Krill.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_AP15BigManta"					{ source = "Wing_AP15BigManta.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_AP15BabyManta"				{ source = "Wing_AP15BabyManta.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_AP15DarkPlant"				{ source = "Wing_AP15DarkPlant.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_AP15Jellyfish"				{ source = "Wing_AP15Jellyfish.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Body_AP15LightCreature"			{ source = "Body_AP15LightCreature.fbx", 	sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_AP15Krill"					{ source = "Hair_AP15Krill.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_AP15Manta"					{ source = "Hair_AP15Manta.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_AP15Jellyfish"				{ source = "Hair_AP15Jellyfish.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hat_AP15DarkPlant"					{ source = "Hat_AP15DarkPlant.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hat_AP15Butterfly"					{ source = "Hat_AP15Butterfly.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Mask_AP15DarkPlant"				{ source = "Mask_AP15DarkPlant.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Prop_AP15DarkHorn"					{ source = "Prop_AP15DarkHorn.fbx", 		computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }

-- AP16 Aurora Meshes
resource "Mesh" "Neck_AP16Pendant"					{ source = "Neck_AP16Pendant.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_AP16Fire"						{ source = "Wing_AP16Fire.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_AP16Wind"						{ source = "Wing_AP16Wind.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_AP16Water"					{ source = "Wing_AP16Water.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_AP16Earth"					{ source = "Wing_AP16Earth.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_AP16OrangeLove"				{ source = "Wing_AP16OrangeLove.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_AP16ButterflyBlue"			{ source = "Wing_AP16ButterflyBlue.fbx", 	sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_AP16ButterflyYellow"			{ source = "Wing_AP16ButterflyYellow.fbx", 	sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Body_AP16WhiteCropTop"				{ source = "Body_AP16WhiteCropTop.fbx", 	sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Body_AP16SlateRunaway"				{ source = "Body_AP16SlateRunaway.fbx", 	sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Body_AP16OrangeLove"				{ source = "Body_AP16OrangeLove.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Body_AP16BlueSeed"					{ source = "Body_AP16BlueSeed.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Body_AP16GreenCure"				{ source = "Body_AP16GreenCure.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_AP16Fire"						{ source = "Hair_AP16Fire.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_AP16Water"					{ source = "Hair_AP16Water.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_AP16Wind"						{ source = "Hair_AP16Wind.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_AP16Earth"					{ source = "Hair_AP16Earth.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_AP16RunawayBob"				{ source = "Hair_AP16RunawayBob.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_AP16ClassicAurora"			{ source = "Hair_AP16ClassicAurora.fbx", 	sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Mask_AP16Fire"						{ source = "Mask_AP16Fire.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Mask_AP16Water"					{ source = "Mask_AP16Water.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Mask_AP16Wind"						{ source = "Mask_AP16Wind.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Mask_AP16Earth"					{ source = "Mask_AP16Earth.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Mask_AP16CureForMe"				{ source = "Mask_AP16CureForMe.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Horn_AP16MoonStar"   		 		{ source = "Horn_AP16MoonStar.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }

-- AP17 Remembrance Meshes
resource "Mesh" "Neck_AP17Pendant"					{ source = "Neck_AP17Pendant.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_AP17TiedShawl"				{ source = "Wing_AP17TiedShawl.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_AP17UniformCloak"				{ source = "Wing_AP17UniformCloak.fbx", 	sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_AP17InjuredSoldier"			{ source = "Wing_AP17InjuredSoldier.fbx", 	sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Body_AP17Injured"					{ source = "Body_AP17Injured.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Body_AP17Apron"					{ source = "Body_AP17Apron.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Body_AP17RaggedTunic"				{ source = "Body_AP17RaggedTunic.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Feet_AP17RaggedTunic"				{ source = "Feet_AP17RaggedTunic.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Neck_AP17Scarf"					{ source = "Neck_AP17Scarf.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Neck_AP17Sash"						{ source = "Neck_AP17Sash.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_AP17PaperboyCap"				{ source = "Hair_AP17PaperboyCap.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_AP17Genius"					{ source = "Hair_AP17Genius.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_AP17BandanaBraid"				{ source = "Hair_AP17BandanaBraid.fbx", 	sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Mask_AP17PuffyBeard"				{ source = "Mask_AP17PuffyBeard.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Mask_AP17Injured"					{ source = "Mask_AP17Injured.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }

resource "Mesh" "Prop_AP17Chimes"						{ source = "CharSkyKid_Prop_AP17Chimes.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "Prop_AP17Plants"						{ source = "CharSkyKid_Prop_AP17Plants.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "Prop_AP17Kettle"						{ source = "CharSkyKid_Prop_AP17Kettle.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "CharSkyKid_Prop_AP17Chimes_01" 	    { source = "WindChime_01.fbx", loadAsync = false, registerCollision = false, computeOcclusions = true }
resource "Mesh" "Prop_AP17Crab"							{ source = "CharSkyKid_Prop_AP17Crab.fbx", loadAsync = false, registerCollision = false, computeOcclusions = true }
resource "Mesh" "Prop_AP17Manta"						{ source = "CharSkyKid_Prop_AP17Manta.fbx", loadAsync = false, registerCollision = false, computeOcclusions = true }

-- AP18 Passage Meshes
resource "Mesh" "Neck_AP18Pendant"					{ source = "Neck_AP18Pendant.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_AP18FauxPelt"					{ source = "Wing_AP18FauxPelt.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_AP18FurryGuard"				{ source = "Wing_AP18FurryGuard.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_AP18RaccoonTail"				{ source = "Wing_AP18RaccoonTail.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Body_AP18LightRobe"				{ source = "Body_AP18LightRobe.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Body_AP18DarkRobe"					{ source = "Body_AP18DarkRobe.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Neck_AP18FluffyRuff"				{ source = "Neck_AP18FluffyRuff.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_AP18Spiky"					{ source = "Hair_AP18Spiky.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_AP18MediumBob"				{ source = "Hair_AP18MediumBob.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_AP18AtlasPony"				{ source = "Hair_AP18AtlasPony.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_AP18SideFade"					{ source = "Hair_AP18SideFade.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Mask_AP18Bear"						{ source = "Mask_AP18Bear.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Mask_AP18Serow"					{ source = "Mask_AP18Serow.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Mask_AP18Boar"						{ source = "Mask_AP18Boar.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Mask_AP18Raccoon"					{ source = "Mask_AP18Raccoon.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Mask_AP18Monkey"					{ source = "Mask_AP18Monkey.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Horn_AP18Tusk"						{ source = "Horn_AP18Tusk.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Horn_AP18FabricStrip"				{ source = "Horn_AP18FabricStrip.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Prop_AP18Ball"						{ source = "Prop_AP18Ball.fbx", 			loadAsync = false, registerCollision = false, computeOcclusions = true }

-- AP19 Moments Meshes
resource "Mesh" "Neck_AP19Pendant"					{ source = "Neck_AP19Pendant.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_AP19Poncho"					{ source = "Wing_AP19Poncho.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Body_AP19MonkRobe"					{ source = "Body_AP19MonkRobe.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Body_AP19CargoShorts"				{ source = "Body_AP19CargoShorts.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Feet_AP19CargoShorts"				{ source = "Feet_AP19CargoShorts.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_AP19Skull"					{ source = "Hair_AP19Skull.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_AP19HeadTattoo"				{ source = "Hair_AP19HeadTattoo.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_AP19DoubleBraidBack"			{ source = "Hair_AP19DoubleBraidBack.fbx", 	sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hat_AP19Dew"						{ source = "Hat_AP19Dew.fbx", 				sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, copyFrameDelay = true }
resource "Mesh" "Hat_AP19TriangleHat"				{ source = "Hat_AP19TriangleHat.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hat_AP19WesternHat"				{ source = "Hat_AP19WesternHat.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Mask_AP19Scruffy"					{ source = "Mask_AP19Scruffy.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Mask_AP19Blindfold"				{ source = "Mask_AP19Blindfold.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Face_AP19Glasses"					{ source = "Face_AP19Glasses.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Face_AP19Straw"					{ source = "Face_AP19Straw.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, copyFrameDelay = true }
resource "Mesh" "Face_AP19SkullJaw"					{ source = "Face_AP19SkullJaw.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }

resource "Mesh" "Prop_AP19CrystalJar"				{ source = "Prop_AP19CrystalJar.fbx", 		loadAsync = false, registerCollision = true, computeOcclusions = true }

-- AP20 Revival Meshes
resource "Mesh" "Neck_AP20Pendant"					{ source = "Neck_AP20Pendant.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_AP20SlickBowlCut"				{ source = "Hair_AP20SlickBowlCut.fbx", 	sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_AP20Beads"					{ source = "Hair_AP20Beads.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_AP20Maypole"					{ source = "Hair_AP20Maypole.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_AP20MaypoleNoRibbons"			{ source = "Hair_AP20MaypoleNoRibbons.fbx", sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Neck_AP20MaypoleScarf"				{ source = "Neck_AP20MaypoleScarf.fbx", 	sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Feet_AP20RobeSandals"				{ source = "Feet_AP20RobeSandals.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Feet_AP20ShortStraps"				{ source = "Feet_AP20ShortStraps.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Feet_AP20LongStraps"				{ source = "Feet_AP20LongStraps.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Body_AP20Robe"						{ source = "Body_AP20Robe.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hat_AP20MessageBoat"				{ source = "Hat_AP20MessageBoat.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hat_AP20Ribbon"					{ source = "Hat_AP20Ribbon.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_AP20Rhythm"					{ source = "Wing_AP20Rhythm.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_AP20Gratitude"				{ source = "Wing_AP20Gratitude.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_AP20Enchantment"				{ source = "Wing_AP20Enchantment.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_AP20Abyss"					{ source = "Wing_AP20Abyss.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_AP20MaypoleScarf"				{ source = "Wing_AP20MaypoleScarf.fbx", 	sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }

-- AP21 Deer Meshes
resource "Mesh" "NPC_AP21SilkRaiment"				{ source = "NPC_AP21SilkRaiment.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = false, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "NPC_AP21RoyalDress"				{ source = "NPC_AP21RoyalDress.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = false, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "NPC_AP21Coat"						{ source = "NPC_AP21Coat.fbx", 				sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = false, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "NPC_AP21LinenPants"				{ source = "NPC_AP21LinenPants.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = false, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }

resource "Mesh" "Neck_AP21Pendant"					{ source = "Neck_AP21Pendant.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_AP21FancyUpdo"				{ source = "Hair_AP21FancyUpdo.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_AP21Turban"					{ source = "Hair_AP21Turban.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_AP21RoyalBun"					{ source = "Hair_AP21RoyalBun.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_AP21HunterBun"				{ source = "Hair_AP21HunterBun.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Body_AP21SilkRaiment"				{ source = "Body_AP21SilkRaiment.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Body_AP21LinenPants"				{ source = "Body_AP21LinenPants.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Body_AP21RoyalDress"				{ source = "Body_AP21RoyalDress.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Body_AP21Coat"						{ source = "Body_AP21Coat.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Horn_AP21Deer"						{ source = "Horn_AP21Deer.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "Hat_AP21Lotus"						{ source = "Hat_AP21Lotus.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hat_AP21Crown"						{ source = "Hat_AP21Crown.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Mask_AP21Deer"						{ source = "Mask_AP21Deer.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Mask_AP21Crescent"					{ source = "Mask_AP21Crescent.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Mask_AP21PaintMakeup"				{ source = "Mask_AP21PaintMakeup.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Mask_AP21Eyebrows"					{ source = "Mask_AP21Eyebrows.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_AP21SilkSash"					{ source = "Wing_AP21SilkSash.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_AP21Deer"						{ source = "Wing_AP21Deer.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_AP21SilkShawl"				{ source = "Wing_AP21SilkShawl.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_AP21LinenScarf"				{ source = "Wing_AP21LinenScarf.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_AP21KingCloak"				{ source = "Wing_AP21KingCloak.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Prop_AP21Basket"					{ source = "Prop_AP21Basket.fbx", 			loadAsync = false, registerCollision = true, computeOcclusions = true }

-- AP22 Nesting Meshes
resource "Mesh" "NPC_AP22Designer"					{ source = "NPC_AP22Designer.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = false, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }

resource "Mesh" "Body_AP22Designer"					{ source = "Body_AP22Designer.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Neck_AP22Pendant"					{ source = "Neck_AP22Pendant.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_AP22Pigtail"					{ source = "Hair_AP22Pigtail.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hat_AP22Pencil"					{ source = "Hat_AP22Pencil.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_AP22Designer"					{ source = "Wing_AP22Designer.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }

resource "Mesh" "Prop_AP22HangingLightBack"			{ source = "Prop_AP22HangingLightBack.fbx", computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Prop_AP22FigurineBack"				{ source = "Prop_AP22FigurineBack.fbx", 	computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }

-- AP23 Duet Meshes
resource "Mesh" "NPC_AP23CellistDress"				{ source = "NPC_AP23CellistDress.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = false, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "NPC_AP23CellistBasic"				{ source = "NPC_AP23CellistBasic.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "NPC_AP23PianistBasic"				{ source = "NPC_AP23PianistBasic.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "NPC_AP23PianistSuit"				{ source = "NPC_AP23PianistSuit.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = false, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }

resource "Mesh" "Neck_AP23Pendant"					{ source = "Neck_AP23Pendant.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_AP23CellistBun"				{ source = "Hair_AP23CellistBun.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_AP23PianistKnot"				{ source = "Hair_AP23PianistKnot.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Mask_AP23Seahorse"					{ source = "Mask_AP23Seahorse.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Face_AP23Filigree"					{ source = "Face_AP23Filigree.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Body_AP23PianistBasic"				{ source = "Body_AP23PianistBasic.fbx", 	sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Body_AP23PianistSuit"				{ source = "Body_AP23PianistSuit.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Body_AP23CellistBasic"				{ source = "Body_AP23CellistBasic.fbx", 	sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Body_AP23CellistDress"				{ source = "Body_AP23CellistDress.fbx", 	sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Feet_AP23WrapSandals"				{ source = "Feet_AP23WrapSandals.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_AP23PianistShawl"				{ source = "Wing_AP23PianistShawl.fbx", 	sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_AP23PianistCloak"				{ source = "Wing_AP23PianistCloak.fbx",		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_AP23CellistShawl"				{ source = "Wing_AP23CellistShawl.fbx", 	sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_AP23CellistCloak"				{ source = "Wing_AP23CellistCloak.fbx", 	sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }

resource "Mesh" "Prop_AP23PianoBasicBack"			{ source = "Prop_AP23PianoBasicBack.fbx", 	computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Prop_AP23PianoUprightBack"			{ source = "Prop_AP23PianoUprightBack.fbx", computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Prop_AP23PianoFancyBack"			{ source = "Prop_AP23PianoFancyBack.fbx", 	computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }

resource "Mesh" "Prop_AP23CelloBasic"				{ source = "Prop_AP23CelloBasic.fbx", 		computeOcclusions = true, computeEdges = false, loadLazy = true }
resource "Mesh" "Prop_AP23CelloFancy"				{ source = "Prop_AP23CelloFancy.fbx", 		computeOcclusions = true, computeEdges = false, loadLazy = true }
resource "Mesh" "Prop_AP23CelloBowBasic"			{ source = "Prop_AP23CelloBowBasic.fbx", 	loadAsync = false, registerCollision = false, loadLazy = true }
resource "Mesh" "Prop_AP23CelloBowFancy"			{ source = "Prop_AP23CelloBowFancy.fbx", 	loadAsync = false, registerCollision = false, loadLazy = true }

resource "Mesh" "Prop_AP23PianoBasic"				{ source = "Prop_AP23PianoBasic.fbx", 		loadAsync = false, registerCollision = true, computeOcclusions = true, loadLazy = true }
resource "Mesh" "Prop_AP23PianoUpright"				{ source = "Prop_AP23PianoUpright.fbx", 	loadAsync = false, registerCollision = true, computeOcclusions = true, loadLazy = true }
resource "Mesh" "Prop_AP23PianoBasicSeat"			{ source = "Prop_AP23PianoBasicSeat.fbx", 	loadAsync = false, registerCollision = true, loadLazy = true }
resource "Mesh" "Prop_AP23PianoFancy"				{ source = "Prop_AP23PianoFancy.fbx", 		loadAsync = false, registerCollision = true, computeOcclusions = true, loadLazy = true }
resource "Mesh" "Prop_AP23PianoFancySeat"			{ source = "Prop_AP23PianoFancySeat.fbx", 	loadAsync = false, registerCollision = true, loadLazy = true}
resource "Mesh" "Prop_RugSmallSolid_AP23Pianist"	{ source = "P_AP23RugPianist.fbx", 			loadAsync = false, registerCollision = false, loadLazy = false }
resource "Mesh" "Prop_RugSmallSolid_AP23Cellist"	{ source = "P_AP23RugCellist.fbx", 			loadAsync = false, registerCollision = false, loadLazy = false }



-- AP24 Moomin Meshes
resource "Mesh" "NPC_AP24Classic"					{ source = "NPC_AP24Classic.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = false, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "NPC_AP24Stripes"					{ source = "NPC_AP24Stripes.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = false, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "NPC_AP24Apron"						{ source = "NPC_AP24Apron.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = false, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "NPC_AP24TopHat"					{ source = "NPC_AP24TopHat.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = false, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "NPC_AP24Triangle"					{ source = "NPC_AP24Triangle.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = false, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "NPC_AP24Ears"						{ source = "NPC_AP24Ears.fbx", 				sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = false, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "NPC_AP24Onion"						{ source = "NPC_AP24Onion.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = false, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "NPC_AP24BellOnly"					{ source = "NPC_AP24BellOnly.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = false, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "NPC_AP24BellShoes"					{ source = "NPC_AP24BellShoes.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = false, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "NPC_AP24BellShoesCham"					{ source = "NPC_AP24BellShoesCham.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = false, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "NPC_AP24BellDress"					{ source = "NPC_AP24BellDress.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = false, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "NPC_AP24BellFull"					{ source = "NPC_AP24BellFull.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = false, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }

resource "Mesh" "Neck_AP24Pendant"					{ source = "Neck_AP24Pendant.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Neck_AP24OnionRibbon"				{ source = "Neck_AP24OnionRibbon.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Neck_AP24Bell"						{ source = "Neck_AP24Bell.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Neck_AP24TriangleScarf"			{ source = "Neck_AP24TriangleScarf.fbx", 	sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Neck_AP24StripesScarf"				{ source = "Neck_AP24StripesScarf.fbx", 	sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Neck_AP24Arms"						{ source = "Neck_AP24Arms.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_AP24Onion"					{ source = "Hair_AP24Onion.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_AP24Triangle"					{ source = "Hair_AP24Triangle.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Body_AP24Classic"					{ source = "Body_AP24Classic.fbx",	 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Body_AP24Triangle"					{ source = "Body_AP24Triangle.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Body_AP24Invisible"				{ source = "Body_AP24Invisible.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Body_AP24Bell"						{ source = "Body_AP24Bell.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Feet_AP24BellShoes"				{ source = "Feet_AP24BellShoes.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Tail_AP24Classic"					{ source = "Tail_AP24Classic.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hat_AP24ClassicEars"				{ source = "Hat_AP24ClassicEars.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hat_AP24BellRibbon"				{ source = "Hat_AP24BellRibbon.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hat_AP24TriangleHat"				{ source = "Hat_AP24TriangleHat.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hat_AP24Wreath"					{ source = "Hat_AP24Wreath.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_AP24Bell"						{ source = "Wing_AP24Bell.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_AP24Triangle"					{ source = "Wing_AP24Triangle.fbx", 	    sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_AP24Arms"						{ source = "Wing_AP24Arms.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }

resource "Mesh" "Prop_AP24ClassicPlush"				{ source = "Prop_AP24ClassicPlush.fbx", 	loadAsync = false, registerCollision = true }
resource "Mesh" "Prop_AP24ClassicPlushBack"			{ source = "Prop_AP24ClassicPlushBack.fbx", computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "Prop_AP24Tent"						{ source = "Prop_AP24Tent.fbx", 			loadAsync = false, registerCollision = true }
resource "Mesh" "Prop_AP24TentCollision"			{ source = "Prop_AP24TentCollision.fbx", 	loadAsync = false, registerCollision = true }
resource "Mesh" "Prop_AP24TentBack"					{ source = "Prop_AP24TentBack.fbx", 		computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "Prop_AP24Harmonica"				{ source = "Prop_AP24Harmonica.fbx", 		computeOcclusions = true, computeEdges = false, compressPositions = false, compressUvs = false, stripNormals = false, loadLazy = true, stripUv13 = false }
resource "Mesh" "Prop_AP24Umbrella"					{ source = "Prop_AP24Umbrella.fbx", 		computeOcclusions = true, computeEdges = false, compressPositions = false, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true } -- Note: compressPositions turned off due to overlapping positions in bind pose


-- AP25 Meshes
resource "Mesh" "NPC_AP25BigPants"				{ source = "NPC_AP25BigPants.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = false, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "NPC_AP25Tunic"					{ source = "NPC_AP25Tunic.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = false, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "NPC_AP25Wrap"					{ source = "NPC_AP25Wrap.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = false, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "NPC_AP25DyeCloth"				{ source = "NPC_AP25DyeCloth.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Body_AP25BigPants"					{ source = "Body_AP25BigPants.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Body_AP25RolledSleeve"			{ source = "Body_AP25RolledSleeve.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
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
resource "Mesh" "Prop_AP25Cymbals"			{ source = "Prop_AP25Cymbals.fbx", computeOcclusions = true, computeEdges = false, compressPositions = false, compressUvs = false, stripNormals = false, loadLazy = true, stripUv13 = false, copyFrameDelay = true }
resource "Mesh" "Prop_AP25ClothDivider"			{ source = "Prop_AP25ClothDivider.fbx", computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = false, copyFrameDelay = true }
resource "Mesh" "Neck_AP25Pendant"					{ source = "Neck_AP25Pendant.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }

-- AP26 Meshes
resource "Mesh" "NPC_AP26Lumberjack"			{ source = "NPC_AP26Lumberjack.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true  }
resource "Mesh" "NPC_AP26Royal"					{ source = "NPC_AP26Royal.fbx", 				sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true  }
resource "Mesh" "NPC_AP26Gown"					{ source = "NPC_AP26Gown.fbx", 				sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true  }
resource "Mesh" "Body_AP26Royal"				{ source = "Body_AP26Royal.fbx", 				sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Body_AP26Lumberjack"			{ source = "Body_AP26Lumberjack.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Horn_AP26EarMuff"				{ source = "Horn_AP26EarMuff.fbx", 				sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_AP26Heuke"				{ source = "Wing_AP26Heuke.fbx", 				sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_AP26Hourglass"			{ source = "Wing_AP26Hourglass.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_AP26MoonCloak"			{ source = "Wing_AP26MoonCloak.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_AP26BlueBird"				{ source = "Wing_AP26BlueBird.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Feet_AP26LumberjackBoots"		{ source = "Feet_AP26LumberjackBoots.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Neck_AP26Pendant"				{ source = "Neck_AP26Pendant.fbx", 				sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hat_AP26RedBow"				{ source = "Hat_AP26RedBow.fbx", 				sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_AP26LowHat"				{ source = "Hair_AP26LowHat.fbx", 				sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hat_AP26FeatherClip"			{ source = "Hat_AP26FeatherClip.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Face_AP26Plume"				{ source = "Face_AP26Plume.fbx", 				sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Body_AP26Gown"					{ source = "Body_AP26Gown.fbx",	 				sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Face_AP26BlueWings"			{ source = "Face_AP26BlueWings.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Mask_AP26Peacock"					{ source = "Mask_AP26Peacock.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Prop_AP26TreePerch"			{ source = "Prop_AP26TreePerch.fbx", computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = false, copyFrameDelay = true }

-- AP27 Meshes
resource "Mesh" "NPC_AP27Herder"				{ source = "NPC_AP27Herder.fbx", 					sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "NPC_AP27Caretaker"				{ source = "NPC_AP27Caretaker.fbx", 				sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "NPC_AP27OldMan"				{ source = "NPC_AP27OldMan.fbx", 					sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true  }
resource "Mesh" "NPC_AP27Guard"					{ source = "NPC_AP27Guard.fbx", 					sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true  }
resource "Mesh" "NPC_AP27GuardNoSword"			{ source = "NPC_AP27GuardNoSword.fbx", 				sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true  }
resource "Mesh" "Mask_AP27ManateeMask"			{ source = "Mask_AP27ManateeMask.fbx", 				sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = false, stripNormals = true, loadLazy = true }
resource "Mesh" "Mask_AP27RulerMask"			{ source = "Mask_AP27RulerMask.fbx", 				sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = false, stripNormals = true, loadLazy = true }
resource "Mesh" "Prop_AP27ManateePlush"			{ source = "Prop_AP27ManateePlush.fbx", 			loadAsync = false, registerCollision = false, computeOcclusions = true, copyFrameDelay = true }
resource "Mesh" "Tail_AP27KrillTail"			{ source = "Tail_AP27KrillTail.fbx", 				sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Tail_AP27ManateeTail"			{ source = "Tail_AP27ManateeTail.fbx", 				sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Horn_AP27KrillHorns"			{ source = "Horn_AP27KrillHorns.fbx", 				sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Horn_AP27ManateeFins"		{ source = "Horn_AP27ManateeFins.fbx", 				sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_AP27CaretakerHood"		{ source = "Hair_AP27CaretakerHood.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_AP27HelmetScarred"		{ source = "Hair_AP27HelmetScarred.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_AP27HelmetPlumed"			{ source = "Hair_AP27HelmetPlumed.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_AP27FluffyManatee"		{ source = "Hair_AP27FluffyManatee.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Body_AP27Caretaker"			{ source = "Body_AP27Caretaker.fbx", 				sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Body_AP27Guard"				{ source = "Body_AP27Guard.fbx", 					sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Body_AP27Herder"				{ source = "Body_AP27Herder.fbx", 					sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Prop_AP27Spear"   				{ source = "Prop_AP27Spear.fbx", 					loadAsync = false, registerCollision = false, computeOcclusions = true, copyFrameDelay = true }
resource "Mesh" "Prop_AP27Shield"   			{ source = "Prop_AP27Shield.fbx", 					loadAsync = false, registerCollision = false, computeOcclusions = true, copyFrameDelay = true }
resource "Mesh" "NPC_AP27NightEder"				{ source = "NPC_AP27NightElder.fbx", 				sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true  }
resource "Mesh" "Hat_AP27MemoryFlowers"			{ source = "Hat_AP27MemoryFlowers.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Body_AP27OldMan"				{ source = "Body_AP27OldMan.fbx", 					sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Feet_AP27GuardBoots"			{ source = "Feet_AP27GuardBoots.fbx", 				sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Mask_AP27FluffyBeard"			{ source = "Mask_AP27FluffyBeard.fbx", 				sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Mask_AP27NightElder"			{ source = "Mask_AP27NightElder.fbx", 				sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Face_AP27NightElder"			{ source = "Face_AP27NightElder.fbx", 				sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hat_AP27Constellation"			{ source = "Hat_AP27Constellation.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_AP27NightElder"			{ source = "Wing_AP27NightElder.fbx", 				sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_AP27Darkness"				{ source = "Wing_AP27Darkness.fbx", 				sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_AP27GuardCape"			{ source = "Wing_AP27GuardCape.fbx", 				sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = false, stripNormals = true, loadLazy = true }
resource "Mesh" "Prop_AP27CrabFigurine"			{ source = "Prop_AP27CrabFigurine.fbx", 			loadAsync = false, registerCollision = false, computeOcclusions = true }
resource "Mesh" "Prop_AP27ManateeFigurine"		{ source = "Prop_AP27ManateeFigurine.fbx", 			loadAsync = false, registerCollision = false, computeOcclusions = true, copyFrameDelay = true}
resource "Mesh" "Prop_AP27Poster"		{ source = "P_AP27Poster.fbx", 			loadAsync = false, registerCollision = false, computeOcclusions = true, copyFrameDelay = true}
resource "Mesh" "Neck_AP27Pendant"				{ source = "Neck_AP27Pendant.fbx", 					sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hat_AP27ManateeChibi"			{ source = "Hat_AP27ManateeChibi.fbx", 				sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "S27_DuskMidPastCoin"		{ source = "S27_DuskMidPastCoin.fbx", 			loadAsync = false, registerCollision = false, computeOcclusions = true }
resource "Mesh" "Prop_AP27Rock"							{ source = "Prop_Rock.fbx", loadAsync = false, registerCollision = false, computeOcclusions = true }

-- AP28 Meshes
resource "Mesh" "Neck_AP28Pendant"				{ source = "Neck_AP28Pendant.fbx", 					sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "NPC_AP28JellyShorts"     		{ source = "NPC_AP28JellyShorts.fbx",   			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "NPC_AP28BirdTunic"     		{ source = "NPC_AP28BirdTunic.fbx",   			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "NPC_AP28MantaWhisperer"		{ source = "NPC_AP28MantaWhisperer.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true  }
resource "Mesh" "Prop_AP28EmoteFlag"			{ source = "Prop_AP28EmoteFlag.fbx", 				loadAsync = false, registerCollision = false, copyFrameDelay = true }
resource "Mesh" "Body_AP28BirdTunic"			{ source = "Body_AP28BirdTunic.fbx", 				sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Body_AP28FurTrim"				{ source = "Body_AP28FurTrim.fbx", 					sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Feet_AP28FluffyBoots"			{ source = "Feet_AP28FluffyBoots.fbx", 				sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Body_AP28JellyShorts"     		{ source = "Body_AP28JellyShorts.fbx",   			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Body_AP28MantaWhisperer"		{ source = "Body_AP28MantaWhisperer.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Face_AP28RoundGlasses"         { source = "Face_AP28RoundGlasses.fbx",         	sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Face_AP28AntlerHelm"        	{ source = "Face_AP28AntlerHelm.fbx",        		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_AP28Father"				{ source = "Hair_AP28Father.fbx", 					sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_AP28MantaWhisperer"		{ source = "Hair_AP28MantaWhisperer.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hat_AP28HairBells"        		{ source = "Hat_AP28HairBells.fbx",         		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Horn_AP28ButterflyAntennae"	{ source = "Horn_AP28ButterflyAntennae.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_AP28MantaWhisperer"		{ source = "Wing_AP28MantaWhisperer.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_AP28CharmerCape"			{ source = "Wing_AP28CharmerCape.fbx", 				sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = false, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_AP28BirdWhisperer"		{ source = "Wing_AP28BirdWhisperer.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = false, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_AP28GuardianCape"			{ source = "Wing_AP28GuardianCape.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Prop_AP28MigrationBellBackpack"			{ source = "Prop_MigrationBellBackpack.fbx", computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = false, copyFrameDelay = true }

-- AP29 Meshes
resource "Mesh" "NPC_AP29PleatedCivilian"		{ source = "NPC_AP29PleatedCivilian.fbx", 					sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "NPC_AP29ShortJacket"		{ source = "NPC_AP29ShortJacket.fbx", 					sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "NPC_AP29PleatedLaborer"		{ source = "NPC_AP29PleatedLaborer.fbx", 					sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "NPC_AP29Layered"		{ source = "NPC_AP29Layered.fbx", 					sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_AP29Shush"			{ source = "Wing_AP29Shush.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "NPC_AP29HighlightsHair"			{ source = "NPC_AP29HighlightsHair.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = false, stripNormals = true, loadLazy = true }
resource "Mesh" "NPC_AP29LightStrandsWing"			{ source = "NPC_AP29LightStrandsWing.fbx", 				sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_AP29LightStrands"			{ source = "Wing_AP29LightStrands.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = false, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_AP29DoubleFive"			{ source = "Wing_AP29DoubleFive.fbx", 				sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_AP29Highlights"			{ source = "Hair_AP29Highlights.fbx", 				sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Body_AP29Pleated"				{ source = "Body_AP29Pleated.fbx", 					sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Horn_AP29OrbEarring"			{ source = "Horn_AP29OrbEarring.fbx", 				sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Body_AP29ShortJacket"			{ source = "Body_AP29ShortJacket.fbx", 				sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Body_AP29Layered"				{ source = "Body_AP29Layered.fbx", 					sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Mask_AP29RepairedA"			{ source = "Mask_AP29RepairedA.fbx", 				sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Mask_AP29RepairedB"			{ source = "Mask_AP29RepairedB.fbx", 				sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Mask_AP29RepairedC"			{ source = "Mask_AP29RepairedC.fbx", 				sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Mask_AP29RepairedD"			{ source = "Mask_AP29RepairedD.fbx", 				sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Mask_AP29RepairedE"			{ source = "Mask_AP29RepairedE.fbx", 				sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Prop_AP29Piccolo"				{ source = "Prop_AP29Piccolo.fbx", 					loadAsync = false, registerCollision = false, copyFrameDelay = true }
resource "Mesh" "Hair_AP29LongHood"				{ source = "Hair_AP29LongHood.fbx", 				sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hat_AP29SunHat"				{ source = "Hat_AP29SunHat.fbx", 				sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_AP29KnotBun"				{ source = "Hair_AP29KnotBun.fbx", 					sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Neck_AP29Pendant"				{ source = "Neck_AP29Pendant.fbx", 					sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }

-- AP30 Meshes
resource "Mesh" "Neck_AP30Pendant"				{ source = "Neck_AP30Pendant.fbx", 					sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Body_AP30RuffledShirt"				{ source = "Body_AP30RuffledShirt.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Body_AP30Romper"					{ source = "Body_AP30Romper.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Neck_AP30RuffledCollar"			{ source = "Neck_AP30RuffledCollar.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Mask_AP30Puffin"					{ source = "Mask_AP30Puffin.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Mask_AP30Dodo"					{ source = "Mask_AP30Dodo.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Mask_AP30Dodo02"					{ source = "Mask_AP30Dodo02.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Body_AP30WaistCoat"				{ source = "Body_AP30WaistCoat.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_AP30TaperDirector"			{ source = "Hair_AP30TaperDirector.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_AP30AviatorHat"			{ source = "Hair_AP30AviatorHat.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hat_AP30SmallHat"			{ source = "Hat_AP30SmallHat.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hat_AP30Goggles"			{ source = "Hat_AP30Goggles.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hair_AP30HighPonytail"				{ source = "Hair_AP30HighPonytail.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_AP30Curly"					{ source = "Wing_AP30Curly.fbx", 				sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_AP30LongCoat"					{ source = "Wing_AP30Longcoat.fbx", 				sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Prop_AP30BirdRideablePlush"    { source = "Prop_AP30BirdRideablePlush.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "Prop_AP30BirdPlush"    		{ source = "Prop_AP30BirdPlush.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "Body_AP30PuffyDress"				{ source = "Body_AP30PuffyDress.fbx", 				sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "NPC_AP30PuffyDress"				{ source = "NPC_AP30PuffyDress.fbx", 				sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "NPC_AP30RuffledShirt"				{ source = "NPC_AP30RuffledShirt.fbx", 				sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "NPC_AP30Romper"		{ source = "NPC_AP30Romper.fbx", 					sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "NPC_AP30WaistCoat"		{ source = "NPC_AP30WaistCoat.fbx", 					sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_AP30SpiritBird"				{ source = "Wing_AP30SpiritBird.fbx", 				sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = false, stripNormals = true, loadLazy = true }
resource "Mesh" "P_AP30BirdPlushBig"    { source = "P_AP30BirdPlushBig.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }


-- Anniv07 Meshes
resource "Mesh" "Hat_BirthdayHat_07"				{ source = "Hat_BirthdayHat_07.fbx", 					sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hat_AwardShowHat_07"				{ source = "Hat_AwardShowHat_07.fbx", 					sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Feet_OreoSlipper"					{ source = "Feet_OreoSlipper.fbx", 					sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_TGCBlackHoodie"				{ source = "Wing_TGCBlackHoodie.fbx", 					sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Prop_ClosedAnnivLaptop"			{ source = "Prop_ClosedAnnivLaptop.fbx", 			loadAsync = false, registerCollision = false, computeOcclusions = true }
resource "Mesh" "Prop_AnnivLaptop"					{ source = "Prop_AnnivLaptop.fbx", 					loadAsync = false, registerCollision = false, computeOcclusions = true }
resource "Mesh" "Prop_SkykidPlushie"				{ source = "Prop_SkykidPlushie.fbx",				loadAsync = false, registerCollision = true,  computeOcclusions = true }
resource "Mesh" "Prop_HandheldController"			{ source = "Prop_HandheldController.fbx", 			loadAsync = false, registerCollision = true,  computeOcclusions = true }
resource "Mesh" "Prop_DroneCamera"					{ source = "Prop_DroneCamera.fbx", 					loadAsync = false, registerCollision = false, computeOcclusions = true }
resource "Mesh" "Prop_WhiteDroneCamera"				{ source = "Prop_WhiteDroneCamera.fbx", 			loadAsync = false, registerCollision = false, computeOcclusions = true }

-- Bugs Season Meshes
resource "Mesh" "Sunflower_01"					{ source = "BUGS_Sunflower_01.fbx", registerCollision = false, loadLazy = true }
resource "Mesh" "Sunflower_02"					{ source = "BUGS_Sunflower_02.fbx", registerCollision = false, loadLazy = true }

-- Mischief 2.0 Meshes
resource "Mesh" "CharSkyKid_Prop_MischiefCat"   { source = "CharSkyKid_Prop_MischiefCat.fbx", computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "Prop_MischiefCat"              { source = "Prop_MischiefCat.fbx", loadAsync = false, registerCollision = false, computeOcclusions = true }

resource "Mesh" "CurrencyCandy"                	{ source = "CurrencyCandy.fbx", loadAsync = false, registerCollision = false, computeOcclusions = true }

-- Cafe Meshes

resource "Mesh" "CharSkyKid_Prop_PastryBackpack"    { source = "CharSkyKid_Prop_PastryBackpack.fbx", computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true, copyFrameDelay = true }
resource "Mesh" "Prop_PastryPlush"                  { source = "Prop_PastryPlush.fbx", loadAsync = false, registerCollision = false, computeOcclusions = true, copyFrameDelay = true }

resource "Mesh" "Wing_PastryCloud"				    { source = "Wing_PastryCloud.fbx", 			    sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyKid_Prop_PastryTeaTable"	{ source = "CharSkyKid_Prop_PastryTeaTable.fbx", computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "Prop_PastryTeaTable"				{ source = "Prop_PastryTeaTable.fbx", loadAsync = false, registerCollision = true }
resource "Mesh" "Prop_PastryTeaTable_Cup"			{ source = "Prop_PastryTeaTable_Cup.fbx", loadAsync = false, registerCollision = false }
resource "Mesh" "Prop_PastryTeaTable_Saucer"		{ source = "Prop_PastryTeaTable_Saucer.fbx", loadAsync = false, registerCollision = false }
resource "Mesh" "Prop_PastryTeaTable_Food_Blue"		{ source = "Prop_PastryTeaTable_Food_Blue.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "Prop_PastryTeaTable_Food_Yellow"	{ source = "Prop_PastryTeaTable_Food_Yellow.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "Prop_PastryTeaTable_Food_Red"		{ source = "Prop_PastryTeaTable_Food_Red.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "Prop_PastryTeaTable_Tea"			{ source = "Prop_PastryTeaTable_Tea.fbx", loadAsync = false, registerCollision = false }
resource "Mesh" "Horn_PastryRoll"             		{ source = "Hat_PastryRoll.fbx", loadAsync = false, registerCollision = false, computeOcclusions = true }



-- Anniversary4 Meshes
resource "Mesh" "Prop_BirthdayOreo"         		{ source = "Prop_BirthdayOreo.fbx", loadAsync = false, registerCollision = false, computeOcclusions = true }
resource "Mesh" "Prop_OreoPlush"            		{ source = "Prop_OreoPlush.fbx", loadAsync = false, registerCollision = false, computeOcclusions = true }
resource "Mesh" "Prop_StarJar"              		{ source = "CharSkyKid_Prop_StarJar_B.fbx", loadAsync = false, registerCollision = false, computeOcclusions = true }
resource "Mesh" "Prop_StarJarC"             		{ source = "CharSkyKid_Prop_StarJar_C.fbx", loadAsync = false, registerCollision = false, computeOcclusions = true }
resource "Mesh" "Prop_CupGlass"            			{ source = "Prop_CupGlass.fbx", loadAsync = false, registerCollision = false, computeOcclusions = true }
resource "Mesh" "Prop_CupUmbrella"          		{ source = "UmbrellaPick_01.fbx", loadAsync = false, registerCollision = false, computeOcclusions = true }
resource "Mesh" "Prop_CupDrink"            			{ source = "Prop_CupDrink.fbx", loadAsync = false, registerCollision = false, computeOcclusions = true }
resource "Mesh" "Prop_CocoaCup"            			{ source = "Prop_CocoaCup.fbx", loadAsync = false, registerCollision = false, computeOcclusions = true }
resource "Mesh" "Prop_DiscoLight"           		{ source = "Prop_DiscoLight.fbx", loadAsync = false, registerCollision = false, computeOcclusions = true }
resource "Mesh" "Prop_Anni4BirthdayCakeS"			{ source = "Prop_Anni4BirthdayCakeS.fbx", loadAsync = false, registerCollision = false, computeOcclusions = true }
resource "Mesh" "Prop_AnniversaryPopcorn"   		{ source = "Prop_AnniversaryPopcorn.fbx", loadAsync = false, registerCollision = false, computeOcclusions = true, copyFrameDelay = true }
resource "Mesh" "Prop_AnniversaryPopcornKernel"   	{ source = "Prop_AnniversaryPopcornKernel.fbx", loadAsync = false, registerCollision = false, computeOcclusions = true, copyFrameDelay = true }
resource "Mesh" "Prop_AnniversaryTrophy"			{ source = "Prop_AnniversaryTrophy.fbx", loadAsync = false, registerCollision = false, computeOcclusions = true }
resource "Mesh" "Prop_AnniversaryTrophyIndie"		{ source = "Prop_AnniversaryTrophyIndie.fbx", loadAsync = false, registerCollision = false, computeOcclusions = true }

-- Anniversary25 Meshes
resource "Mesh" "Body_AnnivBeigeSuit"               { source = "Body_AnnivBeigeSuit.fbx",           sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Body_AnnivYellowGown"              { source = "Body_AnnivYellowGown.fbx",          sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Feet_AnnivButterfly"               { source = "Feet_AnnivButterfly.fbx",           sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "Wing_AnnivTuxedo"                  { source = "Wing_AnnivTuxedo.fbx",              sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }

-- NPC MESHES --
resource "Mesh" "NPC_KidLongPantsBody"				{ source = "NPC_KidLongPantsBody.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = false, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "NPC_CivilianMaleBody"				{ source = "NPC_CivilianMaleBody.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "NPC_YoungFemaleBody"				{ source = "NPC_YoungFemaleBody.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = false, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "NPC_CivilianMaleShoulder"			{ source = "NPC_CivilianMaleShoulder.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = false, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "NPC_CivilianFemaleBody"			{ source = "NPC_CivilianFemaleBody.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "NPC_CivilianFemaleShoulder"		{ source = "NPC_CivilianFemaleShoulder.fbx", 	sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "NPC_CivilianShoes"					{ source = "NPC_CivilianShoes.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "NPC_LaborerMaleBody"				{ source = "NPC_LaborerMaleBody.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "NPC_LaborerMaleShoulder"			{ source = "NPC_LaborerMaleShoulder.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "NPC_LaborerMaleHeadwrap"			{ source = "NPC_LaborerMaleHeadwrap.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "NPC_AP27GuardMask"			{ source = "NPC_AP27GuardMask.fbx", 		sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "NPC_LaborerShoes"					{ source = "NPC_LaborerShoes.fbx", 				sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "CharSkyNPC_Body_FatLabor"				{ source = "CharSkyNPC_Body_FatLabor.fbx", sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = false, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "NPC_SkinnyIntellectualBody"			{ source = "NPC_SkinnyIntellectualBody.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "NPC_SkinnyIntellectualShawlDn"			{ source = "NPC_SkinnyIntellectualShawlDn.fbx", 			sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "NPC_MerchantBody"						{ source = "NPC_MerchantBody.fbx", 						sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }

resource "Mesh" "CharSkyNPC_Body_FatLaborWave"			{ source = "CharSkyNPC_Body_FatLaborWave.fbx", sharedSkeleton = "CharSkyNPC_Body_FatLaborWave.fbx", stripAnimation = true, computeOcclusions = false, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyNPC_Body_StrongLabor"			{ source = "CharSkyNPC_Body_StrongLabor.fbx", sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = false, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyNPC_Body_StrongLaborHammer"		{ source = "CharSkyNPC_Body_StrongLaborHammer.fbx", sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = false, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyNPC_Body_FatLaborChild"			{ source = "CharSkyNPC_Body_FatLaborChild.fbx", sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = false, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyNPC_Body_FatLaborStaff"			{ source = "CharSkyNPC_Body_FatLaborStaff.fbx", sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = false, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyNPC_Body_FemaleCivilian"		{ source = "CharSkyNPC_Body_FemaleCivilian.fbx", sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = false, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyNPC_Body_MaleCivilian"			{ source = "CharSkyNPC_Body_MaleCivilian.fbx", sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = false, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyNPC_Body_ShadowChildren"		{ source = "CharSkyNPC_Body_ShadowChildren.fbx", sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = false, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyNPC_Body_SkinnyIntellectual"	{ source = "CharSkyNPC_Body_SkinnyIntellectual.fbx", sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyNPC_Body_StrongKnight"			{ source = "CharSkyNPC_Body_StrongKnight.fbx", sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyNPC_Body_MerchantRig"			{ source = "CharSkyNPC_Body_MerchantRig.fbx", sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = false, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyNPC_Body_ActorRig"				{ source = "CharSkyNPC_Body_ActorRig.fbx", sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = false, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyNPC_Body_DirectorRig"			{ source = "CharSkyNPC_Body_DirectorRig.fbx", sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = false, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyNPC_Body_DancerRig"				{ source = "CharSkyNPC_Body_DancerRig.fbx", sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = false, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyNPC_Body_JugglerRig"			{ source = "CharSkyNPC_Body_JugglerRig.fbx", sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = false, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyNPC_Body_MusicianRig"			{ source = "CharSkyNPC_Body_MusicianRig.fbx", sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = false, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyNPC_Body_AP07CargoPants_01"		{ source = "CharSkyNPC_Body_AP07CargoPants_01.fbx", sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyNPC_Body_AP07Jumpsuits_01"		{ source = "CharSkyNPC_Body_AP07Jumpsuits_01.fbx", sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = false, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyNPC_Body_AP08BaggyPants_01"		{ source = "CharSkyNPC_Body_AP08BaggyPants_01.fbx", sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = false, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyNPC_Body_YoungFemaleRig"		{ source = "CharSkyNPC_Body_YoungFemaleRig.fbx", sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = false, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyNPC_Body_AP09Yeti_01"        	{ source = "CharSkyNPC_Body_AP09Yeti_01.fbx", sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = false, computeEdges = false, compressPositions = true, compresfsUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyNPC_Body_RobedLadyRig"			{ source = "CharSkyNPC_Body_RobedLadyRig.fbx", sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = false, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyNPC_Body_YoungChubbyRig"		{ source = "CharSkyNPC_Body_YoungChubbyRig.fbx", sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = false, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyNPC_Body_AP11Kid_01"			{ source = "CharSkyNPC_Body_AP11Kid_01.fbx", sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyNPC_Body_AP11KidSpirit_01"		{ source = "CharSkyNPC_Body_AP11KidSpirit_01.fbx", sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyNPC_Body_AP11Narcissist"		{ source = "CharSkyNPC_Body_AP11Narcissist.fbx", sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyNPC_Body_FatLaborDress"			{ source = "CharSkyNPC_Body_FatLaborDress.fbx", sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyNPC_Body_AP12YellowTunic_01"    { source = "CharSkyNPC_Body_AP12YellowTunic_01.fbx", sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = false, computeEdges = false, compressPositions = true, compresfsUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyNPC_Body_AP12BlueTunic_01"      { source = "CharSkyNPC_Body_AP12BlueTunic_01.fbx", sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = false, computeEdges = false, compressPositions = true, compresfsUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyNPC_Body_AP12GradientTunic_01"  { source = "CharSkyNPC_Body_AP12GradientTunic_01.fbx", sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = false, computeEdges = false, compressPositions = true, compresfsUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyNPC_Body_AP12DarkTunic_01"      { source = "CharSkyNPC_Body_AP12DarkTunic_01.fbx", sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = false, computeEdges = false, compressPositions = true, compresfsUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyNPC_Body_AP13Tunic_01"        	{ source = "CharSkyNPC_Body_AP13Tunic_01.fbx", sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compresfsUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyNPC_Body_AP14ShadowPants_01"    { source = "CharSkyNPC_Body_AP14ShadowPants_01.fbx", sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = false, computeEdges = false, compressPositions = true, compresfsUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyNPC_Body_AP14DancerSkirt_01"    { source = "CharSkyNPC_Body_AP14DancerSkirt_01.fbx", sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = false, computeEdges = false, compressPositions = true, compresfsUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyNPC_Body_AP14JesterPants_01"    { source = "CharSkyNPC_Body_AP14JesterPants_01.fbx", sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = false, computeEdges = false, compressPositions = true, compresfsUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyNPC_Body_AP16WhiteCropTop"		{ source = "CharSkyNPC_Body_AP16WhiteCropTop.fbx", sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = false, computeEdges = false, compressPositions = true, compresfsUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyNPC_Body_AP16BlueSeed"			{ source = "CharSkyNPC_Body_AP16BlueSeed.fbx", sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = false, compresfsUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyNPC_Body_AP16SlateRunaway"		{ source = "CharSkyNPC_Body_AP16SlateRunaway.fbx", sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = false, compresfsUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyNPC_Body_AP16GreenCure"			{ source = "CharSkyNPC_Body_AP16GreenCure.fbx", sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = false, compresfsUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyNPC_Body_AP16OrangeLove"		{ source = "CharSkyNPC_Body_AP16OrangeLove.fbx", sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = false, compresfsUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyNPC_Body_AP17Apron"				{ source = "CharSkyNPC_Body_AP17Apron.fbx", sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = false, compresfsUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyNPC_Body_AP17Injured"			{ source = "CharSkyNPC_Body_AP17Injured.fbx", sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = false, compresfsUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyNPC_Body_AP18LightRobe"			{ source = "CharSkyNPC_Body_AP18LightRobe.fbx", sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = false, compresfsUvs = true, stripNormals = true, loadLazy = true }
--resource "Mesh" "CharSkyNPC_Body_AP18DarkRobe"		{ source = "CharSkyNPC_Body_AP18LDarkRobe.fbx", sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = false, compresfsUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyNPC_Body_AP19MonkRobe"			{ source = "CharSkyNPC_Body_AP19MonkRobe.fbx", sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = false, compresfsUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyNPC_Wing_Director"				{ source = "CharSkyNPC_Wing_Director.fbx", sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "NPC_AP21KingCloak"						{ source = "NPC_AP21KingCloak.fbx", sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyNPC_Body_Moonlight"				{ source = "CharSkyNPC_Body_Moonlight.fbx", sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = false, compresfsUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "NPC_MusicianBody"			{ source = "NPC_MusicianBody.fbx", sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = false, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }

-- Hair
resource "Mesh" "CharSkyNPC_Hair_FatLaborBun"				{ source = "CharSkyNPC_Hair_FatLaborBun.fbx", sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = false, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "CharSkyNPC_Hair_SkinnyIntellectualCrown"	{ source = "CharSkyNPC_Hair_SkinnyIntellectualCrown.fbx", sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = false, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "CharSkyNPC_Horn_SkinnyIntellectualCrown"	{ source = "CharSkyNPC_Horn_SkinnyIntellectualCrown.fbx", sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = false, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "CharSkyNPC_Horn_FatLaborChains"			{ source = "CharSkyNPC_Horn_FatLaborChains.fbx", sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyNPC_Horn_MCivilianChains"			{ source = "CharSkyNPC_Horn_MCivilianChains.fbx", sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyNPC_Horn_FatLaborChains_02"			{ source = "CharSkyNPC_Horn_FatLaborChains_02.fbx", sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyNPC_Horn_SkinnyIntellectualChains"	{ source = "CharSkyNPC_Horn_SkinnyIntellectualChains.fbx", sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyNPC_Horn_StrongLaborChains"			{ source = "CharSkyNPC_Horn_StrongLaborChains.fbx", sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }

-- Wing
resource "Mesh" "CharSkyNPC_Wing_AP28CharmerCape"			{ source = "CharSkyNPC_Wing_AP28CharmerCape.fbx", sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = false, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }

-- Mask
resource "Mesh" "CharSkyKid_Mask_NPC"					{ source = "CharSkyKid_Mask_NPC.fbx", sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = false, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "CharSkyNPC_Mask_KnightHelmet"			{ source = "CharSkyNPC_Mask_KnightHelmet.fbx", sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = false, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "CharSkyNPC_Mask_FatLaborMask"			{ source = "CharSkyNPC_Mask_FatLaborMask.fbx", sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = false, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }

-- Prop
resource "Mesh" "CharSkyNPC_Prop_Book"					{ source = "CharSkyNPC_Prop_Book.fbx", sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = false, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyNPC_Prop_Booze"					{ source = "CharSkyNPC_Prop_Booze.fbx", sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = false, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyNPC_Prop_ButterflyNet"			{ source = "CharSkyNPC_Prop_ButterflyNet.fbx", sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = false, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyNPC_Prop_Clipboard"				{ source = "CharSkyNPC_Prop_Clipboard.fbx", sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = false, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyNPC_Prop_FireStick"				{ source = "CharSkyNPC_Prop_FireStick.fbx", sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = false, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyNPC_Prop_Flag"					{ source = "CharSkyNPC_Prop_Flag.fbx", sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = false, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyNPC_Prop_Horn"					{ source = "CharSkyNPC_Prop_Horn.fbx", stripAnimation = true, computeOcclusions = false, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyNPC_Prop_Jar"					{ source = "CharSkyNPC_Prop_Jar.fbx", sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = false, computeEdges = false, registerCollision = true }
resource "Mesh" "CharSkyNPC_Prop_Oar"					{ source = "CharSkyNPC_Prop_Oar.fbx", sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = false, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyNPC_Prop_PickAxe"				{ source = "CharSkyNPC_Prop_PickAxe.fbx", sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = false, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyNPC_Prop_PowerGlove"			{ source = "CharSkyNPC_Prop_PowerGlove.fbx", sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = false, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyNPC_Prop_Shield"				{ source = "CharSkyNPC_Prop_Shield.fbx", sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = false, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyNPC_Prop_Spear"					{ source = "CharSkyNPC_Prop_Spear.fbx", sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = false, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "CharSkyNPC_Prop_Sword"					{ source = "CharSkyNPC_Prop_Sword.fbx", sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = false, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }

-- Event Meshes
resource "Mesh" "UnitDisc"							{ source = "UnitDisc.fbx", registerCollision = true }
resource "Mesh" "UnitCube"							{ source = "UnitCube.fbx", registerCollision = true, computeOcclusions = true }
resource "Mesh" "UnitCylinder"						{ source = "UnitCylinder.fbx", computeOcclusions = true }
resource "Mesh" "UnitPlane"							{ source = "UnitPlane.fbx", computeOcclusions = true }
resource "Mesh" "SpUnitBall"						{ source = "SpUnitBall.fbx", computeOcclusions = true }
resource "Mesh" "UnitSphereFlipped"					{ source = "UnitSphereFlipped.fbx", loadAsync = false, registerCollision = false, computeOcclusions = false }

resource "Mesh" "FxFlameRingBase"					{ source = "FxFlameRingBase.fbx", loadAsync = false, registerCollision = false } -- Gift Aura
resource "Mesh" "SecretObject_Persistent"			{ source = "SecretObject_01.fbx" } -- Mario Star
resource "Mesh" "CharFlyBeingMiniAAnim"				{ source = "CharFlyBeingMiniAAnim.fbx" } -- Butterfly

resource "Mesh" "SpTableA"							{ source = "SpTableA.fbx", loadAsync = false, registerCollision = true } -- Picnic Table
resource "Mesh" "SpChairA"							{ source = "SpChairA.fbx", loadAsync = false, registerCollision = true } -- Picnic Chair

resource "Mesh" "SpTableXmas"						{ source = "SpTableXmas.fbx", loadAsync = false, registerCollision = true } -- Picnic Table
resource "Mesh" "SpChairXmas"						{ source = "SpChairXmas.fbx", loadAsync = false, registerCollision = true } -- Picnic Chair

resource "Mesh" "Prop_SequencerLight_01"			{ source = "Prop_SequencerLight_01.fbx", loadAsync = false, registerCollision = false } -- Sequencer Seats
resource "Mesh" "Prop_SequencerLight_02"			{ source = "Prop_SequencerLight_02.fbx", loadAsync = false, registerCollision = false } -- Sequencer Seats
resource "Mesh" "Prop_SequencerLight_03"			{ source = "Prop_SequencerLight_03.fbx", loadAsync = false, registerCollision = false } -- Sequencer Seats
resource "Mesh" "Prop_SequencerLight_04"			{ source = "Prop_SequencerLight_04.fbx", loadAsync = false, registerCollision = false } -- Sequencer Seats

resource "Mesh" "Prop_SequencerLightAnni_01"		{ source = "Prop_SequencerLightAnni_01.fbx", loadAsync = false, registerCollision = false } -- Sequencer Seats
resource "Mesh" "Prop_SequencerLightAnni_02"		{ source = "Prop_SequencerLightAnni_02.fbx", loadAsync = false, registerCollision = false } -- Sequencer Seats
resource "Mesh" "Prop_SequencerLightAnni_03"		{ source = "Prop_SequencerLightAnni_03.fbx", loadAsync = false, registerCollision = false } -- Sequencer Seats
resource "Mesh" "Prop_SequencerLightAnni_04"		{ source = "Prop_SequencerLightAnni_04.fbx", loadAsync = false, registerCollision = false } -- Sequencer Seats

resource "Mesh" "Prop_SequencerStation"				{ source = "CharSkyKid_Prop_SequencerStation.fbx", loadAsync = false, registerCollision = true } -- Sequencer Table Harmony
resource "Mesh" "Prop_SequencerAnni"				{ source = "CharSkyKid_Prop_SequencerAnni.fbx", loadAsync = false, registerCollision = true } -- Sequencer Table Anniversary

resource "Mesh" "Prop_BigMantaPlush"				{ source = "Prop_BigMantaPlush.fbx", loadAsync = false, registerCollision = false, computeOcclusions = true, copyFrameDelay = true }

resource "Mesh" "Bonfire"							{ source = "CharSkyKid_Prop_AP04Bonfire_01.fbx", loadAsync = false, registerCollision = true }
resource "Mesh" "BonfireSeat"						{ source = "CharSkyKid_Prop_AP04BonfireSeat_01.fbx", loadAsync = false, registerCollision = true }

resource "Mesh" "Swing"								{ source = "SpSwingSetFrame.fbx", loadAsync = false, registerCollision = true }
resource "Mesh" "SpSwingSetSeatAnim"				{ source = "SpSwingSetSeatAnim.fbx", loadAsync = false, registerCollision = true }
resource "Mesh" "SeesawAnim"						{ source = "SeesawAnim.fbx", loadAsync = false, registerCollision = true }


resource "Mesh" "RainbowSpell"						{ source = "RainbowSpell.fbx", loadAsync = false, registerCollision = true }

resource "Mesh" "DOSLightBoat_01"            		{ source = "DOSLightBoat_01.fbx", loadAsync = false, registerCollision = false }
resource "Mesh" "MessageLantern"            		{ source = "MessageLantern.fbx", loadAsync = false, registerCollision = false }
resource "Mesh" "AnniversaryBoat"                   { source = "AnniversaryBoat.fbx", loadAsync = false, registerCollision = false }
resource "Mesh" "MessageLotus"            			{ source = "MessageLotus.fbx", loadAsync = false, registerCollision = false }
resource "Mesh" "MessageGondola"            		{ source = "MessageGondola.fbx", loadAsync = false, registerCollision = false }
resource "Mesh" "MessageCranePersistent"            { source = "MessageCrane.fbx", loadAsync = false, registerCollision = false }
resource "Mesh" "FortuneLanternPersistent"          { source = "FortuneLantern.fbx", loadAsync = false, registerCollision = false }
resource "Mesh" "SpringFestivalDragon_Decoration"   { source = "SpringFestivalDragon_Decoration.fbx",  loadAsync = false, registerCollision = false, computeOcclusions = true }
resource "Mesh" "MessageCairn"            			{ source = "MessageStoneCairn01.fbx", loadAsync = false, registerCollision = false }

resource "Mesh" "Firecracker"            			{ source = "Firecracker.fbx", loadAsync = false, registerCollision = false }
resource "Mesh" "Firecracker_big"            		{ source = "Firecracker_big.fbx", loadAsync = false, registerCollision = false }

resource "Mesh" "WingBuffChild_05"					{ source = "WingBuffChild_05.fbx", loadAsync = false, registerCollision = false }
resource "Mesh" "CShrineCivilian_01"				{ source = "CShrineCivilian_01.fbx", loadAsync = false, registerCollision = false }
resource "Mesh" "MiniAncestorStatue_01_Persistent"	{ source = "MiniAncestorStatue_01.fbx", loadAsync = false, registerCollision = true }
resource "Mesh" "FriendshipStatue_01_Persistent"	{ source = "FriendshipStatue_01.fbx", loadAsync = false, registerCollision = true }
resource "Mesh" "FarmersMarketPlatform_Persistent"	{ source = "OutfitShopPlatform_01.fbx", loadAsync = false, registerCollision = true }

resource "Mesh" "Prop_TeaSet"						{ source = "Prop_TeaSet.fbx", loadAsync = false, registerCollision = true }
resource "Mesh" "Prop_TeaSet_Cup"					{ source = "Prop_TeaSet_Cup.fbx", loadAsync = false, registerCollision = false }
resource "Mesh" "Prop_TeaSet_Tea"					{ source = "Prop_TeaSet_Tea.fbx", loadAsync = false, registerCollision = false }

resource "Mesh" "Prop_MusicShell"					{ source = "Prop_MusicShell.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "Prop_ShellMusicBox"				{ source = "Prop_ShellMusicBox.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "Prop_MusicShellOffice"				{ source = "Prop_MusicShellOffice.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "Prop_PicnicBlanket"				{ source = "Prop_PicnicBlanket.fbx", loadAsync = false, registerCollision = true }
resource "Mesh" "Prop_PicnicBlanketFood"			{ source = "Prop_PicnicBlanketFood.fbx", loadAsync = false, registerCollision = true }

resource "Mesh" "Archway_DoL_01"					{ source = "Archway_DoL_01.fbx", loadAsync = false, computeOcclusions = true, registerCollision = false }

resource "Mesh" "Prop_ButterflyFountain"			{ source = "Prop_ButterflyFountain.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "Prop_ButterflyFountain_Lights"		{ source = "Prop_ButterflyFountain_Lights.fbx", loadAsync = false, registerCollision = false, computeOcclusions = true }
resource "Mesh" "Prop_ButterflyFountain_Petals"		{ source = "Prop_ButterflyFountain_Petals.fbx", loadAsync = false, registerCollision = false, computeOcclusions = true }

resource "Mesh" "CharSkyKid_Prop_ButterflyFountain"	{ source = "CharSkyKid_Prop_ButterflyFountain.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }

resource "Mesh" "Prop_WisteriaTea_01"				{ source = "Prop_WisteriaTea_01.fbx", loadAsync = false, registerCollision = true }
resource "Mesh" "Prop_WisteriaTea_Cup_01"			{ source = "Prop_WisteriaTea_Cup_01.fbx", loadAsync = false, registerCollision = false }
resource "Mesh" "Prop_WisteriaTea_Saucer_01"		{ source = "Prop_WisteriaTea_Saucer_01.fbx", loadAsync = false, registerCollision = false }
resource "Mesh" "Prop_WisteriaTea_Food_01"			{ source = "Prop_WisteriaTea_Food_01.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "Prop_WisteriaTea_Tea_01"			{ source = "Prop_WisteriaTea_Tea_01.fbx", loadAsync = false, registerCollision = false }

resource "Mesh" "Prop_Pinwheel"						{ source = "Prop_Pinwheel.fbx", loadAsync = false, registerCollision = false, computeOcclusions = true }
resource "Mesh" "Prop_Pinwheel_Handle"				{ source = "Prop_Pinwheel_Handle.fbx", loadAsync = false, registerCollision = false }

resource "Mesh" "Prop_BirthdayHat"					{ source = "Hat_BirthdayHat_01.fbx", loadAsync = false, registerCollision = false  }
resource "Mesh" "Prop_Rose"							{ source = "Prop_Rose.fbx", loadAsync = false, registerCollision = false, computeOcclusions = true }
resource "Mesh" "MessageRose"						{ source = "MessageRose.fbx", loadAsync = false, registerCollision = false, computeOcclusions = true }
resource "Mesh" "MessageSunflower"					{ source = "MessageSunflower.fbx", loadAsync = false, registerCollision = false, computeOcclusions = true }
resource "Mesh" "Prop_RoseGlass"					{ source = "Prop_RoseGlass.fbx", loadAsync = false, registerCollision = false }
resource "Mesh" "Prop_RoseJar"						{ source = "Prop_RoseJar.fbx", loadAsync = false, registerCollision = false, computeOcclusions = true }
resource "Mesh" "Prop_StarLamp"						{ source = "CharSkyKid_Prop_AP11Star_01.fbx", loadAsync = false, registerCollision = false, computeOcclusions = true }
resource "Mesh" "Prop_SnowGlobe"					{ source = "Prop_SnowGlobe_01.fbx", loadAsync = false, registerCollision = false }
resource "Mesh" "Prop_SnowGlobeFlake"				{ source = "Prop_SnowGlobeFlake_01.fbx", loadAsync = false, registerCollision = false }
resource "Mesh" "Prop_SnowGlobeGlass"				{ source = "Prop_SnowGlobeGlass_01.fbx", loadAsync = false, registerCollision = false }
resource "Mesh" "Prop_MuralElement"					{ source = "DecalStar_02.fbx", loadAsync = false, registerCollision = false, computeOcclusions = true }

resource "Mesh" "Prop_BirthdayCakeS"				{ source = "PropBirthdayCakeS.fbx", loadAsync = false, registerCollision = false }
resource "Mesh" "Prop_BirthdayCakeM"				{ source = "PropBirthdayCakeM.fbx", loadAsync = false, registerCollision = false }
resource "Mesh" "Prop_BirthdayCakeL"				{ source = "PropBirthdayCakeL.fbx", loadAsync = false, registerCollision = false }
resource "Mesh" "Prop_BirthdayCakeGiant"			{ source = "PropBirthdayCakeGiant.fbx", loadAsync = false, registerCollision = false }

resource "Mesh" "Prop_BirthdayFlags"				{ source = "PropBirthdayFlags.fbx", loadAsync = false, registerCollision = false, computeOcclusions = true }
resource "Mesh" "Prop_BirthdayFlagPoles"			{ source = "PropBirthdayFlagPoles.fbx", loadAsync = false, registerCollision = false }
resource "Mesh" "Prop_BeachBall"					{ source = "SummerBeachBall.fbx", loadAsync = false, registerCollision = false, computeOcclusions = true }
resource "Mesh" "Prop_SnowBall"						{ source = "Snowball_02.fbx", loadAsync = false, registerCollision = false, computeOcclusions = true }
resource "Mesh" "Prop_SnowBall_Crab"				{ source = "DoFeast_Snowball_Crab.fbx", loadAsync = false, registerCollision = false, computeOcclusions = true }
resource "Mesh" "Prop_SnowBall_Cube"				{ source = "DoFeast_Snowball_Cube.fbx", loadAsync = false, registerCollision = false, computeOcclusions = true }
resource "Mesh" "Prop_SnowBall_Diamond"				{ source = "DoFeast_Snowball_Diamond.fbx", loadAsync = false, registerCollision = false, computeOcclusions = true }
resource "Mesh" "Prop_SnowBall_Snowman"				{ source = "DoFeast_Snowball_Snowman.fbx", loadAsync = false, registerCollision = false, computeOcclusions = true }
resource "Mesh" "Prop_BeachRecliner"				{ source = "Prop_BeachRecliner.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "Prop_BeachChairWood"				{ source = "Prop_BeachChairWood.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "Prop_BeachChairCloth"				{ source = "Prop_BeachChairCloth.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "Prop_Brazier2"						{ source = "Prop_Brazier2.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "Prop_Brazier3"						{ source = "StoneBrazier_01.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "Prop_Spell"						{ source = "SphereCheap_01.fbx", loadAsync = false, registerCollision = false, computeOcclusions = true }
resource "Mesh" "Prop_Pipe"							{ source = "Prop_Pipe.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "Prop_PipeMotif"					{ source = "Prop_PipeMotif.fbx", loadAsync = false, registerCollision = false }
resource "Mesh" "Prop_MischiefChair"				{ source = "Prop_MischiefChair.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "Prop_MischiefTable"				{ source = "Prop_MischiefTable.fbx", loadAsync = false, registerCollision = true }
resource "Mesh" "Prop_MischiefPumpkin"				{ source = "Prop_MischiefPumpkin.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "Prop_KrillCarpet"					{ source = "Prop_KrillCarpet.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "Prop_MischiefTreeMini"				{ source = "Prop_MischiefTreeMini.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "Prop_MischiefPumpkinLamp"			{ source = "Prop_MischiefPumpkinLamp.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "Prop_MischiefWeb"					{ source = "Prop_MischiefWeb.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "Prop_MischiefTree"					{ source = "Prop_MischiefTree.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "Prop_Gondola_01"					{ source = "Prop_Gondola_01.fbx", loadAsync = false, registerCollision = true }
resource "Mesh" "Prop_Marshmallow_01"      			{ source = "Prop_Marshmallow_01.fbx", loadAsync = false, registerCollision = false }
resource "Mesh" "Prop_Tent_01"      			    { source = "Prop_Tent_01.fbx", loadAsync = false, registerCollision = false }
resource "Mesh" "FeastBall"      					{ source = "FeastBall.fbx", loadAsync = false, registerCollision = false }
resource "Mesh" "FeastBallGateBlue"      			{ source = "FeastBallGateBlue.fbx", loadAsync = false, registerCollision = false, computeOcclusions = true }
resource "Mesh" "FeastBallWoodRed"      			{ source = "FeastBallWoodRed.fbx", loadAsync = false, registerCollision = false, computeOcclusions = true }
resource "Mesh" "FeastBallWoodBlue"      			{ source = "FeastBallWoodBlue.fbx", loadAsync = false, registerCollision = false, computeOcclusions = true }
resource "Mesh" "FeastBallLaundry"      			{ source = "FeastBallLaundry.fbx", loadAsync = false, registerCollision = false, computeOcclusions = true }
resource "Mesh" "FeastBallScore_01"      			{ source = "FeastBallScore_01.fbx", loadAsync = false, registerCollision = false }
resource "Mesh" "FeastBallScore_02"      			{ source = "FeastBallScore_02.fbx", loadAsync = false, registerCollision = false }
resource "Mesh" "FeastBallScore_03"      			{ source = "FeastBallScore_03.fbx", loadAsync = false, registerCollision = false }
resource "Mesh" "FeastBallScore_04"      			{ source = "FeastBallScore_04.fbx", loadAsync = false, registerCollision = false }
resource "Mesh" "FeastBallScore_05"      			{ source = "FeastBallScore_05.fbx", loadAsync = false, registerCollision = false }
resource "Mesh" "Feast_RacingArch"      			{ source = "Feast_RacingArch.fbx", loadAsync = false, registerCollision = false, computeOcclusions = true }
resource "Mesh" "Feast_RacingStart"      			{ source = "Feast_RacingStart.fbx", loadAsync = false, registerCollision = false, computeOcclusions = true }
resource "Mesh" "Feast_RacingFinish"      			{ source = "Feast_RacingFinish.fbx", loadAsync = false, registerCollision = false, computeOcclusions = true }
resource "Mesh" "Feast_RacingFinishFlag"      		{ source = "Feast_RacingFinishFlag.fbx", loadAsync = false, registerCollision = false, computeOcclusions = true }
resource "Mesh" "Feast_RacingRibbon"      			{ source = "Feast_RacingRibbon.fbx", loadAsync = false, registerCollision = false, computeOcclusions = true }
resource "Mesh" "Prop_SunlightBoard"                { source = "Prop_SunlightBoard.fbx", loadAsync = false, registerCollision = false, computeOcclusions = true }
resource "Mesh" "Prop_Snowboard"             		{ source = "Prop_Snowboard.fbx", loadAsync = false, registerCollision = false, computeOcclusions = true }
resource "Mesh" "Prop_CompanionCube"				{ source = "Prop_CompanionCube.fbx", loadAsync = false, registerCollision = false, computeOcclusions = true }
resource "Mesh" "DOCBoostArrow"                     { source = "DOCBoostArrow.fbx", loadAsync = false, registerCollision = false, computeOcclusions = true }

resource "Mesh" "ConstellationAchievementFriendsMadeCenter"     { source = "ConstellationAchievementFriendsMadeCenter.fbx", loadAsync = false, registerCollision = false, loadLazy = true }
resource "Mesh" "ConstellationAchievementBoatCenter"      		{ source = "ConstellationAchievementBoatCenter.fbx", loadAsync = false, registerCollision = false, loadLazy = true }
resource "Mesh" "ConstellationAchievementFlameTouchedCenter"    { source = "ConstellationAchievementFlameTouchedCenter.fbx", loadAsync = false, registerCollision = false, loadLazy = true }
resource "Mesh" "ConstellationAchievementHeartCenter"      		{ source = "ConstellationAchievementHeartCenter.fbx", loadAsync = false, registerCollision = false, loadLazy = true }
resource "Mesh" "ConstellationAchievementHugsCenter"      		{ source = "ConstellationAchievementHugsCenter.fbx", loadAsync = false, registerCollision = false, loadLazy = true }
resource "Mesh" "ConstellationAchievementCrabCenter"      		{ source = "ConstellationAchievementCrabCenter.fbx", loadAsync = false, registerCollision = false, loadLazy = true }
resource "Mesh" "ConstellationAchievementJellyfishCenter"      	{ source = "ConstellationAchievementJellyfishCenter.fbx", loadAsync = false, registerCollision = false, loadLazy = true }
resource "Mesh" "JellyFishPose_03"      						{ source = "JellyFishPose_03.fbx", loadAsync = false, registerCollision = false }
resource "Mesh" "Crab_03"      									{ source = "Crab_03.fbx", loadAsync = false, registerCollision = false }
resource "Mesh" "CrabCenter_03"      							{ source = "CrabCenter_03.fbx", loadAsync = false, registerCollision = false, loadLazy = true }
resource "Mesh" "MantaA_Rotated"      							{ source = "MantaA_Rotated.fbx", loadAsync = false, registerCollision = false, loadLazy = true }
resource "Mesh" "Prop_AP16Symbol"      							{ source = "Prop_AP16Symbol.fbx", loadAsync = false, registerCollision = false, loadLazy = true }
resource "Mesh" "DarkDragonSideMesh"      						{ source = "Krill_Firework_01.fbx", loadAsync = false, registerCollision = false, loadLazy = true }

-- Camping Event Meshes
resource "Mesh" "PropScreenRed"						{ source = "PropScreenRed.fbx", loadAsync = false, registerCollision = true, loadLazy = true }
resource "Mesh" "PropScreenYellow"					{ source = "PropScreenYellow.fbx", loadAsync = false, registerCollision = true, loadLazy = true }
resource "Mesh" "PropScreenBlue"					{ source = "PropScreenBlue.fbx", loadAsync = false, registerCollision = true, loadLazy = true }
resource "Mesh" "PropScreenGreen"					{ source = "PropScreenGreen.fbx", loadAsync = false, registerCollision = true, loadLazy = true }
resource "Mesh" "PropCeilingYellow"                 { source = "PropCeilingYellow.fbx", loadAsync = false, registerCollision = false, computeOcclusions = true}
resource "Mesh" "PropCurtainDoorYellow"             { source = "PropCurtainDoorYellow.fbx", loadAsync = false, registerCollision = false, computeOcclusions = true}
resource "Mesh" "PropWindowYellow"                  { source = "PropWindowYellow.fbx", loadAsync = false, registerCollision = false, computeOcclusions = true}
resource "Mesh" "SummerLemonadeStand02"				{ source = "SummerLemonadeStand02.fbx", loadAsync = false, registerCollision = true, loadLazy = true }
resource "Mesh" "SummerLemonadeGlass02"				{ source = "SummerLemonadeGlass02.fbx", loadAsync = false, registerCollision = true, loadLazy = true }
resource "Mesh" "LargeBonfireStone"					{ source = "LargeBonfireStones.fbx", loadAsync = false, registerCollision = true, loadLazy = true }
resource "Mesh" "LargeBonfireWood"					{ source = "LargeBonfireWood.fbx", loadAsync = false, registerCollision = true, loadLazy = true }
resource "Mesh" "Bloom_Sapling"						{ source = "Bloom_Sapling.fbx", loadAsync = false, registerCollision = false, loadLazy = true }
-- resource "Mesh" "Bloom_Tree"						{ source = "Bloom_Tree.fbx", loadAsync = false, registerCollision = false, loadLazy = true }
resource "Mesh" "P_SculpturePiece_01"				{ source = "P_SculpturePiece_01.fbx", loadAsync = false, registerCollision = true, loadLazy = true, computeOcclusions = true }
resource "Mesh" "P_SculpturePiece_02"				{ source = "P_SculpturePiece_02.fbx", loadAsync = false, registerCollision = true, loadLazy = true, computeOcclusions = true }
resource "Mesh" "P_SculpturePiece_03"				{ source = "P_SculpturePiece_03.fbx", loadAsync = false, registerCollision = true, loadLazy = true, computeOcclusions = true }
resource "Mesh" "P_NatureFlag"						{ source = "P_NatureFlag.fbx", loadAsync = false, registerCollision = true, loadLazy = true, computeOcclusions = true }
resource "Mesh" "P_NatureClamShell"					{ source = "P_NatureClamShell.fbx", loadAsync = false, registerCollision = true, loadLazy = true, computeOcclusions = true }

-- Constellation Progress Mesh (Constellation Gate)
resource "Mesh" "ConstellationDawn_01"				{ source = "ConstellationDawn_01.fbx", loadAsync = false, registerCollision = false }
resource "Mesh" "ConstellationDay_01"				{ source = "ConstellationDay_01.fbx", loadAsync = false, registerCollision = false }
resource "Mesh" "ConstellationRain_01"				{ source = "ConstellationRain_01.fbx", loadAsync = false, registerCollision = false }
resource "Mesh" "ConstellationSunset_01"			{ source = "ConstellationSunset_01.fbx", loadAsync = false, registerCollision = false }
resource "Mesh" "ConstellationDusk_01"				{ source = "ConstellationDusk_01.fbx", loadAsync = false, registerCollision = false }
resource "Mesh" "ConstellationNight_01"				{ source = "ConstellationNight_01.fbx", loadAsync = false, registerCollision = false }
resource "Mesh" "ConstellationStorm_01"				{ source = "ConstellationStorm_01.fbx", loadAsync = false, registerCollision = false }
resource "Mesh" "ConstellationWingBuff_01"			{ source = "ConstellationWingBuff_01.fbx", loadAsync = false, registerCollision = false }

-- AP Constellation Progress Mesh (Constellation Gate)
resource "Mesh" "ConstellationAP"					{ source = "ConstellationAP_06.fbx", loadAsync = false, registerCollision = false }
resource "Mesh" "ConstellationAP02"					{ source = "ConstellationAP_02.fbx", loadAsync = false, registerCollision = false }
resource "Mesh" "ConstellationAP03"					{ source = "ConstellationAP_03.fbx", loadAsync = false, registerCollision = false }
resource "Mesh" "ConstellationAP04"					{ source = "ConstellationAP_04.fbx", loadAsync = false, registerCollision = false }
resource "Mesh" "ConstellationAP06"					{ source = "ConstellationAP_06.fbx", loadAsync = false, registerCollision = false }

resource "Mesh" "ConstellationGateMesh"				{ source = "ForceFieldUnit.fbx", loadAsync = false, registerCollision = true }

resource "Mesh" "DarkstoneGib"						{ source = "DarkstoneGib.fbx", loadAsync = false, registerCollision = false }

-- Procedurally-generated darkstone crystals
resource "Mesh" "DarkstoneMeteorSpiked01"			{ source = "DarkStoneMeteorSpiked_01Persistent.fbx", loadAsync = false, registerCollision = true }
resource "Mesh" "DarkStoneGroundRubble01"			{ source = "DarkStoneGroundRubble_01Persistent.fbx", loadAsync = false, registerCollision = true }
resource "Mesh" "DarkStoneCrystal03"				{ source = "DarkStoneCrystal_03.fbx", loadAsync = false, registerCollision = true }

resource "Mesh" "DarkStoneMeteor04"					{ source = "DarkStoneMeteor_04Persistent.fbx", loadAsync = false, registerCollision = true }
resource "Mesh" "DarkStoneMeteorDestroyed01"		{ source = "DarkStoneMeteorDestroyed_01Persistent.fbx", loadAsync = false, registerCollision = true }
resource "Mesh" "DarkStoneMeteorInner01"			{ source = "DarkStoneMeteorInner_01Persistent.fbx", loadAsync = false, registerCollision = true }
resource "Mesh" "DarkStoneMeteor05"					{ source = "DarkStoneMeteor_05Persistent.fbx", loadAsync = false, registerCollision = true }

resource "Mesh" "FlyingRockA"						{ source = "SpRockA_Persistent.fbx", loadAsync = false, registerCollision = false }
resource "Mesh" "FlyingRockB"						{ source = "SpRockB_Persistent.fbx", loadAsync = false, registerCollision = false }
resource "Mesh" "FlyingRockC"						{ source = "SpRockC_Persistent.fbx", loadAsync = false, registerCollision = false }

-- Procedurally-generated darkstone plants
resource "Mesh" "DarkshroomPlantA01"				{ source = "Darkshroom_PlantA_01.fbx", loadAsync = false, registerCollision = true }
resource "Mesh" "DarkshroomSporeA01lo"				{ source = "Darkshroom_SporeA_01_lo.fbx", loadAsync = false, registerCollision = true }
resource "Mesh" "DarkshroomPlantASpore01"			{ source = "Darkshroom_PlantA_Spore_01.fbx", loadAsync = false, registerCollision = true }
resource "Mesh" "Darkseed"							{ source = "Darkseed_01.fbx", loadAsync = false, registerCollision = true }
resource "Mesh" "DarkshroomLilyPad02"				{ source = "Darkshroom_LilyPad_02.fbx", registerCollision = true }
resource "Mesh" "DarkshroomRadiantSpore01"			{ source = "Darkshroom_SporeA_01_lo_Radiance.fbx", registerCollision = true }
resource "Mesh" "DarkshroomRadiantSporeLarge"		{ source = "Darkshroom_SporeA_01_Large_Radiance.fbx", registerCollision = true }

resource "Mesh" "DarkStoneRainDrop"					{ source = "DarkStoneRainDrop.fbx", loadAsync = false, registerCollision = false }
resource "Mesh" "StupaBellCham"						{ source = "StupaBellCham.fbx", loadAsync = false, registerCollision = false }

resource "Mesh" "PropChestAnim"						{ source = "PropChestAnim.fbx", loadAsync = false, registerCollision = true }
resource "Mesh" "PropLoot"							{ source = "Prop_APLootBox_01.fbx", loadAsync = false }

resource "Mesh" "PremiumCandleShaft"				{ source = "PremiumCandleShaft.fbx", loadAsync = false, registerCollision = false } -- Gift Light Shaft
resource "Mesh" "GodLightItem"						{ source = "GodLightItem.fbx", loadAsync = false, computeOcclusions = true, computeEdges = false } -- Collectible drop beam
resource "Mesh" "GodLight3b"						{ source = "GodLight3b.fbx", loadAsync = false, computeOcclusions = true, computeEdges = false } -- Collectible drop beam
resource "Mesh" "GodLightNetease"               	{ source = "GodLightNetease.fbx", loadAsync = false, computeOcclusions = true, computeEdges = false }

-- Crab
resource "Mesh" "CharCrabBAnimPersistent"			{ source = "CharCrabBAnim.fbx", loadAsync = false, computeOcclusions = true, computeEdges = false, registerCollision = false }
resource "Mesh" "CrabRock_01Persistent"				{ source = "CrabRock_01.fbx", loadAsync = false, computeOcclusions = true, computeEdges = false, registerCollision = false }

-- Lurker
resource "Mesh" "LurkerHeadPersistent"				{ source = "Lurker_Head.fbx", loadAsync = false, computeOcclusions = true, computeEdges = false, registerCollision = false }
resource "Mesh" "LurkerWhiskerPersistent"			{ source = "Lurker_Antennae.fbx", loadAsync = false, computeOcclusions = true, computeEdges = false, registerCollision = false }
resource "Mesh" "LurkerMandiblePersistent"			{ source = "Lurker_Grasper.fbx", loadAsync = false, computeOcclusions = true, computeEdges = false, registerCollision = false }
resource "Mesh" "LurkerMandibleBPersistent"			{ source = "Lurker_GrasperReversed.fbx", loadAsync = false, computeOcclusions = true, computeEdges = false, registerCollision = false }
resource "Mesh" "LurkerBodyPersistent"				{ source = "Lurker_Body01.fbx", loadAsync = false, computeOcclusions = true, computeEdges = false, registerCollision = false }
resource "Mesh" "LurkerBody2Persistent"				{ source = "Lurker_Body02.fbx", loadAsync = false, computeOcclusions = true, computeEdges = false, registerCollision = false }
resource "Mesh" "LurkerSpikePersistent"				{ source = "Lurker_Spike.fbx", loadAsync = false, computeOcclusions = true, computeEdges = false, registerCollision = false }
resource "Mesh" "LurkerTailPersistent"				{ source = "Lurker_Tail.fbx", loadAsync = false, computeOcclusions = true, computeEdges = false, registerCollision = false }

-- Light shroom
resource "Mesh" "CharEnvMushroomPersistent"			{ source = "CharEnvMushroom.fbx", loadAsync = false, computeOcclusions = true, computeEdges = false, registerCollision = true }

-- Season Meditation Shrine
resource "Mesh" "PropSpiritBackpackPersistent"		{ source = "PropSpiritBackpack.fbx", loadAsync = false, computeOcclusions = true, computeEdges = false, registerCollision = true }
resource "Mesh" "PropAPShrineTop"					{ source = "PropAP02ShrineTop.fbx", loadAsync = false, computeOcclusions = true, computeEdges = false, registerCollision = true }
resource "Mesh" "PropAP10ShrineTop"					{ source = "PropAP10ShrineTop.fbx", loadAsync = false, computeOcclusions = true, computeEdges = false, registerCollision = true }
resource "Mesh" "MemoryShrine"						{ source = "MemoryShrine.fbx", loadAsync = false, computeOcclusions = true, computeEdges = false, registerCollision = true }
resource "Mesh" "MapShrine_01"						{ source = "MapShrine_01.fbx", loadAsync = false, computeOcclusions = true, computeEdges = false, registerCollision = true }
resource "Mesh" "MapShrine_02"						{ source = "MapShrine_02.fbx", loadAsync = false, computeOcclusions = true, computeEdges = false, registerCollision = true }
resource "Mesh" "MapShrineSymbol"					{ source = "MapShrineSymbol.fbx", loadAsync = false, computeOcclusions = true, computeEdges = false, registerCollision = false }
resource "Mesh" "SharedShrine"						{ source = "DiamondStone.fbx", loadAsync = false, computeOcclusions = true, computeEdges = false, registerCollision = true }
resource "Mesh" "SharedLantern"						{ source = "SharedLantern.fbx", loadAsync = false, computeOcclusions = true, computeEdges = false, registerCollision = true }
resource "Mesh" "MemoryLantern"						{ source = "MemoryLantern.fbx", loadAsync = false, computeOcclusions = true, computeEdges = false, registerCollision = true }

-- Creature quest husk
resource "Mesh" "CShrineManta_01_Persistent"		{ source = "CShrineManta_01.fbx", loadAsync = false, computeOcclusions = true, computeEdges = false, registerCollision = false }
resource "Mesh" "CharSkyRayCAnim_Persistent" 		{ source = "CharSkyRayCAnim.fbx", loadAsync = false, computeOcclusions = true, computeEdges = false, registerCollision = false }
resource "Mesh" "CharEnvJellyfishAnim_Persistent" 	{ source = "CharEnvJellyfishAnim.fbx", loadAsync = false, computeOcclusions = true, computeEdges = false, registerCollision = false }

-- Core meshes
resource "Mesh" "ElderMaskB"						{ source = "ElderMaskB.fbx", registerCollision = false }

-- Storm void mesh
resource "Mesh" "StormEndStarBroken_02Anim"			{ source = "StormEndStarBroken_02Anim.fbx", loadAsync = false, computeOcclusions = true, computeEdges = false, registerCollision = false }

-- UI Tutorial Hand
resource "Mesh" "HandyAnim"							{ source = "HandyAnim.fbx", loadAsync = false, registerCollision = false }

-- Spirit ball mesh
resource "Mesh" "SpiritBall"						{ source = "Geosphere.fbx", registerCollision = false }

-- UI Constellation
resource "Mesh" "GUICylinder"						{ source = "UICylinder.fbx", registerCollision = false }

-- UI Social Feed
resource "Mesh" "UiMiscStarLarge_Mesh"				{ source = "UiMiscStarLarge_Mesh.fbx", registerCollision = false }
resource "Mesh" "UiMenuFriends_Mesh"				{ source = "UiMenuFriends_Mesh.fbx", registerCollision = false }
resource "Mesh" "UiSocialFeedSubscribe_Mesh"		{ source = "UiSocialFeedSubscribe_Mesh.fbx", registerCollision = false }

-- Placeable Props
resource "Mesh" "Prop_APFlagAnim_Persistent" 		{ source = "Prop_APFlagAnim_Persistent.fbx", loadAsync = false, registerCollision = false, computeOcclusions = true }
resource "Mesh" "NightBook_01_Persistent" 			{ source = "NightBook_01_Persistent.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "IslandUmbrella_01_Persistent" 		{ source = "IslandUmbrella_01.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "Prop_Balloon_01_Persistent"        { source = "Prop_Balloon_01_Persistent.fbx", loadAsync = false, registerCollision = false, computeOcclusions = true }
resource "Mesh" "Prop_LightFence_Persistent"        { source = "Prop_LightFence_Persistent.fbx", loadAsync = false, registerCollision = false, computeOcclusions = true }
resource "Mesh" "Prop_Cannon_01_Persistent"         { source = "Prop_Cannon_01_Persistent.fbx", loadAsync = false, registerCollision = true }
resource "Mesh" "Prop_JarBubbleMachine"				{ source = "Prop_JarBubbleMachine.fbx", loadAsync = false, registerCollision = true }
resource "Mesh" "Prop_MarshmallowSet_01" 			{ source = "Prop_MarshmallowSet_01.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "Prop_Snowman"						{ source = "Prop_Snowman.fbx", loadAsync = false, registerCollision = false, computeOcclusions = true }
resource "Mesh" "Prop_SnowCrab"						{ source = "Prop_SnowCrab.fbx", loadAsync = false, registerCollision = false, computeOcclusions = true }
resource "Mesh" "Prop_SnowHermit"					{ source = "Prop_SnowHermit.fbx", loadAsync = false, registerCollision = false, computeOcclusions = true }
resource "Mesh" "Prop_BreakedSnowman"				{ source = "Prop_BreakedSnowman.fbx", loadAsync = false, registerCollision = false, computeOcclusions = true }
resource "Mesh" "Prop_JarRound"						{ source = "CharSkyKid_Prop_JarRound.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "Prop_Ladder"						{ source = "CharSkyKid_Prop_Ladder.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "Prop_LanternPost"					{ source = "CharSkyKid_Prop_LanternPost.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "Prop_Brick"						{ source = "CharSkyKid_Prop_Brick.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "Prop_JarTall"						{ source = "CharSkyKid_Prop_JarTall.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "Prop_Stool"						{ source = "CharSkyKid_Prop_Stool.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "Prop_MemoryBook"					{ source = "CharSkyKid_Prop_AP17UltimateMemoryBook.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "Prop_AP19Camera"					{ source = "Prop_Camera.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "Prop_AP19UltimateCamera"			{ source = "Prop_AP19Camera.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "Prop_HangingLights"				{ source = "Prop_HangingLights.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "Prop_Bucket"						{ source = "Prop_Bucket.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }

-- Stone Sets
resource "Mesh" "P_StoneStool"						{ source = "P_StoneStool.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "P_StoneBenchSingle"				{ source = "P_StoneBenchSingle.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "P_StoneBoxEmpty"					{ source = "P_StoneBoxEmpty.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "P_StoneBoxClosed"					{ source = "P_StoneBoxClosed.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "P_StoneLoveseat"					{ source = "P_StoneLoveseat.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "P_StoneArmchair"					{ source = "P_StoneArmchair.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "P_StoneDiningTableSquare"			{ source = "P_StoneDiningTableSquare.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "P_StoneDiningTableLong"			{ source = "P_StoneDiningTableLong.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "P_StoneChair"						{ source = "P_StoneChair.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "P_StoneTableSmall"					{ source = "P_StoneTableSmall.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "P_StoneDesk"						{ source = "P_StoneDesk.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "P_StoneBench"						{ source = "P_StoneBench.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "P_StoneDiningTableRound"			{ source = "P_StoneDiningTableRound.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "P_StoneWallPotRack"				{ source = "P_StoneWallPotRack.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "P_StonePlantStand"					{ source = "P_StonePlantStand.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "P_StoneKitchenCabinet"				{ source = "P_StoneKitchenCabinet.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "P_StoneKitchenStove"				{ source = "P_StoneKitchenStove.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "P_StoneKitchenDrawers"				{ source = "P_StoneKitchenDrawers.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "P_StoneKitchenOven"				{ source = "P_StoneKitchenOven.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "P_StoneWallMugRack"				{ source = "P_StoneWallMugRack.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "P_StoneWallTowelRack"				{ source = "P_StoneWallTowelRack.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "P_StoneDresserLong"				{ source = "P_StoneDresserLong.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "P_StoneBathtubLarge"				{ source = "P_StoneBathtubLarge.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "P_StoneBathtubLargeWater"			{ source = "P_StoneBathtubLargeWater.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "P_StoneBathtubSmall"				{ source = "P_StoneBathtubSmall.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "P_StoneBathtubSmallWater"			{ source = "P_StoneBathtubSmallWater.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "P_StoneSink"						{ source = "P_StoneSink.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "P_StoneSinkWater"					{ source = "P_StoneSinkWater.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "P_StoneWallMirror"					{ source = "P_StoneWallMirror.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "P_StoneSofaCorner"					{ source = "P_StoneSofaCorner.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "P_StoneSofaSide"					{ source = "P_StoneSofaSide.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "P_StoneDresserTall"				{ source = "P_StoneDresserTall.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "P_StoneBedSingle"					{ source = "P_StoneBedSingle.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "P_StoneCoffeeTable"				{ source = "P_StoneCoffeeTable.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "P_StoneKitchenSink"				{ source = "P_StoneKitchenSink.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "P_StoneKitchenSinkWater"			{ source = "P_StoneKitchenSinkWater.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "P_StoneConsoleTable"				{ source = "P_StoneConsoleTable.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "P_StoneMannequin"					{ source = "P_StoneMannequin.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "P_StoneCubeWide"					{ source = "P_StoneCubeWide.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "P_StoneCubeTall"					{ source = "P_StoneCubeTall.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "P_StoneCubeSmall"					{ source = "P_StoneCubeSmall.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "P_DecorPillowB"					{ source = "P_DecorPillowB.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "P_DecorPillowA"					{ source = "P_DecorPillowA.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "P_StoneCandleLight"				{ source = "P_StoneCandleLight.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "P_StoneWallShelf"					{ source = "P_StoneWallShelf.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "P_StoneCandleHolder"				{ source = "P_StoneCandleHolder.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "P_DecorFoldedCloth"				{ source = "P_DecorFoldedCloth.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "P_StoneWallSconce"					{ source = "P_StoneWallSconce.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }

-- Testing dupe
resource "Mesh" "P_StoneCoffeeTableNew"				{ source = "P_StoneCoffeeTableNew.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }

-- Rugs
resource "Mesh" "P_RugSmallClassic"					{ source = "P_RugSmallClassic.fbx", 		loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "P_RugSmallSolid"					{ source = "P_RugSmallSolid.fbx", 			loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "P_RugSmallStripes"					{ source = "P_RugSmallStripes.fbx", 		loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "P_RugSmallHalfCircle"				{ source = "P_RugSmallHalfCircle.fbx", 		loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "P_RugMediumSolid"					{ source = "P_RugMediumSolid.fbx", 			loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "P_RugMediumStripes"				{ source = "P_RugMediumStripes.fbx", 		loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "P_RugMediumDiamonds"				{ source = "P_RugMediumDiamonds.fbx", 		loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "P_RugMediumArgyle"					{ source = "P_RugMediumArgyle.fbx", 		loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "P_RugMediumCircle"					{ source = "P_RugMediumCircle.fbx", 		loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "P_RugLargeSolid"					{ source = "P_RugLargeSolid.fbx", 			loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "P_RugLargeCircle"					{ source = "P_RugLargeCircle.fbx", 			loadAsync = false, registerCollision = true, computeOcclusions = true }

-- AP22 Wood Sets
resource "Mesh" "P_AP22BedSingle"					{ source = "P_AP22BedSingle.fbx", 			loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "P_AP22Chair"						{ source = "P_AP22Chair.fbx", 				loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "P_AP22DiningTable"					{ source = "P_AP22DiningTable.fbx", 		loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "P_AP22Loveseat"					{ source = "P_AP22Loveseat.fbx",	 		loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "P_AP22PendantLight"				{ source = "P_AP22PendantLight.fbx", 		loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "P_AP22BathTub"						{ source = "P_AP22BathTub.fbx", 			loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "P_AP22BathTubWater"				{ source = "P_AP22BathTubWater.fbx", 		loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "P_AP22StepStool"					{ source = "P_AP22StepStool.fbx", 			loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "P_AP22HangingLight"				{ source = "P_AP22HangingLight.fbx", 		loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "P_AP22WallPaintingSet"				{ source = "P_AP22WallPaintingSet.fbx", 	loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "P_AP22WallPainting"				{ source = "P_AP22WallPainting.fbx", 		loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "P_AP22WallSpiceRack"				{ source = "P_AP22WallSpiceRack.fbx", 		loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "P_AP22HangingPlanter"				{ source = "P_AP22HangingPlanter.fbx", 		loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "P_AP22Lamp"						{ source = "P_AP22Lamp.fbx", 				loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "P_AP22Figurine"					{ source = "P_AP22Figurine.fbx", 			loadAsync = false, registerCollision = true, computeOcclusions = true }

-- AP23
resource "Mesh" "P_AP23WallPosterDuet"				{ source = "P_AP23WallPosterDuet.fbx", 		loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "P_AP23WallPosterPiano"				{ source = "P_AP23WallPosterPiano.fbx", 	loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "P_AP23WallPosterCello"				{ source = "P_AP23WallPosterCello.fbx", 	loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "P_AP23WallPosterConch"				{ source = "P_AP23WallPosterConch.fbx", 	loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "P_AP23WallPosterPianoKeys"			{ source = "P_AP23WallPosterPianoKeys.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "P_AP23Vanity"						{ source = "P_AP23Vanity.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "P_AP23ClothDivider"				{ source = "P_AP23ClothDivider.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "P_AP23Curtain"			        	{ source = "P_AP23Curtain.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "P_AP23HalfRug"			        	{ source = "P_AP23HalfRug.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "P_AP23Vase"				    	{ source = "P_AP23Vase.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "P_AP23DecorCup"					{ source = "P_AP23DecorCup.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "P_AP23Cup"					        { source = "P_AP23Cup.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "P_AP23Bench"						{ source = "P_AP23Bench.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }

-- AP24
resource "Mesh" "Prop_AP24EmoteBook"				{ source = "Prop_AP24EmoteBook.fbx", 		loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "P_AP24Portrait"				{ source = "P_AP24Portrait.fbx", 		loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "P_AP24WallPhotos_01"				{ source = "P_AP24WallPhotos_01.fbx", 		loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "P_AP24WallPhotos_02"				{ source = "P_AP24WallPhotos_02.fbx", 		loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "P_AP24Chandelier"				{ source = "P_AP24Chandelier.fbx", 		loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "P_AP24Clock"				{ source = "P_AP24Clock.fbx", 		loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "P_AP24ClockFace"				{ source = "P_AP24ClockFace.fbx", 		loadAsync = false, registerCollision = true, computeOcclusions = true }

-- AP25
resource "Mesh" "P_AP25ClothDivider"				{ source = "P_AP25ClothDivider.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }

-- AP26
resource "Mesh" "P_AP26TreePerch"				{ source = "P_AP26TreePerch.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }

-- AP27
resource "Mesh" "Prop_AP27ButterflyToy"             { source = "Prop_AP27ButterflyToy.fbx", loadAsync = false, registerCollision = false, computeOcclusions = true }
resource "Mesh" "Prop_AP27LightMotes"             	{ source = "Prop_AP27LightMotes.fbx", loadAsync = false, registerCollision = false, computeOcclusions = true }

resource "Mesh" "P_AP27PlantVine"                   { source = "Prop_AP27PlantVine.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "P_AP27PlantVineBack"               { source = "Prop_AP27PlantVineBack.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true, copyFrameDelay = true }
resource "Mesh" "Prop_AP27TeaStall"                 { source = "Prop_AP27TeaStall.fbx", loadAsync = false, registerCollision = false }
resource "Mesh" "Prop_AP27TeaStall_Backpack"        { source = "Prop_AP27TeaStall_Backpack.fbx", computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = false, loadLazy = true }
resource "Mesh" "Prop_AP27ShepherdStaff"            { source = "Prop_AP27ShepherdStaff.fbx",       computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }

-- AP28
resource "Mesh" "P_AP28MigrationBell"                   { source = "P_AP28MigrationBell.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "P_AP28MigrationBellBase"                   { source = "P_AP28MigrationBellBase.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }

-- AP30
resource "Mesh" "Prop_AP30EmoteNotepad"				{ source = "Prop_AP30EmoteNotepad.fbx", 		loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "Prop_AP30EmoteThumbsUp"			{ source = "Prop_AP30EmoteThumbsUp.fbx", 		loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "Prop_AP30EmoteThumbsUpReverse"			{ source = "Prop_AP30EmoteThumbsUpReverse.fbx", 		loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "Prop_AP30Quill"				{ source = "Prop_AP30Quill.fbx", 		loadAsync = false, registerCollision = true, computeOcclusions = true, copyFrameDelay = true }

-- Misc Furniture
resource "Mesh" "BubbleBeanBag"						{ source = "BeanBag_High.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }

-- Fish School
resource "Mesh" "Cone_01"							{ source = "Cone_01.fbx", registerCollision = false, loadLazy = true }
resource "Mesh" "FishH"								{ source = "FishH.fbx", registerCollision = false, loadLazy = true }
resource "Mesh" "BirdA"								{ source = "BirdA.fbx", registerCollision = false, loadLazy = true }
resource "Mesh" "CrabA"								{ source = "CrabA.fbx", registerCollision = false, loadLazy = true }
resource "Mesh" "MantaA"							{ source = "MantaA.fbx", registerCollision = false, loadLazy = true }
resource "Mesh" "ButterflyA"						{ source = "ButterflyA.fbx", registerCollision = false, loadLazy = true }
resource "Mesh" "JellyfishA"						{ source = "JellyfishA.fbx", registerCollision = false, loadLazy = true }
resource "Mesh" "SkyKidFlyingA"						{ source = "SkyKidFlyingA.fbx", registerCollision = false, loadLazy = true }
resource "Mesh" "SkyKidAbstractA"					{ source = "SkyKidAbstractA.fbx", registerCollision = false, loadLazy = true }
resource "Mesh" "SkyKidAbstractB"					{ source = "SkyKidAbstractB.fbx", registerCollision = false, loadLazy = true }
resource "Mesh" "NightMantaLite"					{ source = "NightMantaLite.fbx", registerCollision = false, loadLazy = true }
resource "Mesh" "AP18SerowAbstract"					{ source = "AP18SerowAbstract.fbx", registerCollision = false, loadLazy = true }
resource "Mesh" "AP18BoarAbstract"					{ source = "AP18BoarAbstract.fbx", registerCollision = false, loadLazy = true }
resource "Mesh" "AP18BearAbstract"					{ source = "AP18BearAbstract.fbx", registerCollision = false, loadLazy = true }
resource "Mesh" "AP18MonkeyAbstract"				{ source = "AP18MonkeyAbstract.fbx", registerCollision = false, loadLazy = true }
resource "Mesh" "AP18RaccoonAbstract"				{ source = "AP18RaccoonAbstract.fbx", registerCollision = false, loadLazy = true }
resource "Mesh" "BroomstickAbstract"				{ source = "BroomstickAbstract.fbx", registerCollision = false, loadLazy = true }
resource "Mesh" "Fish_AngelFish"					{ source = "Fish_AngelFish.fbx", registerCollision = false, loadLazy = true }
resource "Mesh" "Fish_AnglerFish"					{ source = "Fish_AnglerFish.fbx", registerCollision = false, loadLazy = true }
resource "Mesh" "Fish_Barracuda"					{ source = "Fish_Barracuda.fbx", registerCollision = false, loadLazy = true }
resource "Mesh" "Fish_ButterflyFish"				{ source = "Fish_ButterflyFish.fbx", registerCollision = false, loadLazy = true }
resource "Mesh" "Fish_MolaMola"			    		{ source = "Fish_MolaMola.fbx", registerCollision = false, loadLazy = true }
resource "Mesh" "Fish_Original"			    		{ source = "Fish_Original.fbx", registerCollision = false, loadLazy = true }
resource "Mesh" "Fish_SailFish"			    		{ source = "Fish_SailFish.fbx", registerCollision = false, loadLazy = true }
resource "Mesh" "Fish_Tuna"				        	{ source = "Fish_Tuna.fbx", registerCollision = false, loadLazy = true }
resource "Mesh" "BUGS_OrigamiFireFly"               { source = "BUGS_OrigamiFireFly.fbx", registerCollision = false, loadLazy = true }
resource "Mesh" "BUGS_OrigamiBeetle"                { source = "BUGS_OrigamiBeetle.fbx", registerCollision = false, loadLazy = true }
resource "Mesh" "BUGS_CrumpledPaper"                { source = "BUGS_CrumpledPaper.fbx", registerCollision = false, loadLazy = true }
resource "Mesh" "BUGS_StoneBust"                    { source = "BUGS_StoneBust.fbx", registerCollision = false, loadLazy = true }

resource "Mesh" "DragonDanceHead_Black"				{ source = "DragonDanceHead_Black.fbx", registerCollision = false, loadLazy = true }
resource "Mesh" "DragonDanceHead_White"				{ source = "DragonDanceHead_White.fbx", registerCollision = false, loadLazy = true }
resource "Mesh" "DragonDanceBody_Black"				{ source = "DragonDanceBody_Black.fbx", registerCollision = false, loadLazy = true }
resource "Mesh" "DragonDanceBody_White"				{ source = "DragonDanceBody_White.fbx", registerCollision = false, loadLazy = true }
resource "Mesh" "DragonDanceTail_Black"				{ source = "DragonDanceTail_Black.fbx", registerCollision = false, loadLazy = true }
resource "Mesh" "DragonDanceTail_White"				{ source = "DragonDanceTail_White.fbx", registerCollision = false, loadLazy = true }

resource "Mesh" "Neck_SnakeGameTail"                { source = "SnakeGameTail.fbx", registerCollision = false, loadLazy = false }
resource "Mesh" "Neck_SnakeGameBody"                { source = "SnakeGameBody.fbx", registerCollision = false, loadLazy = false }

resource "Mesh" "BloomLilyPad_01"					{ source = "BloomLilyPad_01.fbx", registerCollision = false, loadLazy = true }
resource "Mesh" "BloomLilyStem_01"					{ source = "BloomLilyStem_01.fbx", registerCollision = false, loadLazy = true }
resource "Mesh" "BloomLilyStem_02"					{ source = "BloomLilyStem_02.fbx", registerCollision = false, loadLazy = true }
resource "Mesh" "BloomKelp_01"						{ source = "BloomKelp_01.fbx", registerCollision = false, loadLazy = true }
resource "Mesh" "BloomKelp_02"						{ source = "BloomKelp_02.fbx", registerCollision = false, loadLazy = true }
resource "Mesh" "BloomKelp_03"						{ source = "BloomKelp_03.fbx", registerCollision = false, loadLazy = true }
resource "Mesh" "BloomCallaBlossom_01"				{ source = "BloomCallaBlossom_01.fbx", registerCollision = false, loadLazy = true }

-- Season 24
resource "Mesh" "AP24Bush_01"						{ source = "AP24FoliageBush_01_Leaves.fbx", registerCollision = false, loadLazy = true }
resource "Mesh" "AP24Tree_01_Trunk"					{ source = "AP24FoliageTree_01_Trunk.fbx", registerCollision = false, loadLazy = true }
resource "Mesh" "AP24Tree_01_Canopy"				{ source = "AP24FoliageTree_01.fbx", registerCollision = false, loadLazy = true }
resource "Mesh" "AP24Tree_02_Trunk"					{ source = "AP24FoliageTree_02_Trunk.fbx", registerCollision = false, loadLazy = true }
resource "Mesh" "AP24Tree_02_Canopy"				{ source = "AP24FoliageTree_02.fbx", registerCollision = false, loadLazy = true }
resource "Mesh" "AP24Tree_03_Trunk"					{ source = "AP24FoliageTree_02_Trunk.fbx", registerCollision = false, loadLazy = true }
resource "Mesh" "AP24Tree_03_Canopy"				{ source = "AP24FoliageTree_02.fbx", registerCollision = false, loadLazy = true }
resource "Mesh" "AP24PineTree_01_Trunk"				{ source = "AP24FoliagePineTree_01_Trunk.fbx", registerCollision = false, loadLazy = true }
resource "Mesh" "AP24PineTree_01_Canopy"			{ source = "AP24FoliagePineTree_01.fbx", registerCollision = false, loadLazy = true }
resource "Mesh" "AP24PineTree_02_Trunk"				{ source = "AP24FoliagePineTree_02_Trunk.fbx", registerCollision = false, loadLazy = true }
resource "Mesh" "AP24PineTree_02_Canopy"			{ source = "AP24FoliagePineTree_02.fbx", registerCollision = false, loadLazy = true }
resource "Mesh" "AP24PineTree_03_Trunk"				{ source = "AP24FoliagePineTree_02_Trunk.fbx", registerCollision = false, loadLazy = true }
resource "Mesh" "AP24PineTree_03_Canopy"			{ source = "AP24FoliagePineTree_02.fbx", registerCollision = false, loadLazy = true }
resource "Mesh" "AP24Plant_01"						{ source = "AP24Plant_01.fbx", registerCollision = false, loadLazy = true }
resource "Mesh" "AP24Plant_02a"						{ source = "AP24Plant_02a.fbx", registerCollision = false, loadLazy = true }
resource "Mesh" "AP24Plant_02b"						{ source = "AP24Plant_02b.fbx", registerCollision = false, loadLazy = true }
resource "Mesh" "AP24Plant_02c"						{ source = "AP24Plant_02c.fbx", registerCollision = false, loadLazy = true }
resource "Mesh" "AP24Plant_03a"						{ source = "AP24Plant_03a.fbx", registerCollision = false, loadLazy = true }
resource "Mesh" "AP24Plant_03b"						{ source = "AP24Plant_03b.fbx", registerCollision = false, loadLazy = true }
resource "Mesh" "AP24Plant_03c"						{ source = "AP24Plant_03c.fbx", registerCollision = false, loadLazy = true }
resource "Mesh" "AP24Arms_01"						{ source = "AP24Arms_v03.fbx", registerCollision = false, loadLazy = true }

-- Days of Bloom 2025
resource "Mesh" "WildBushS_01"						{ source = "DoB_WildBush_S_01.fbx",		 registerCollision = false, loadLazy = true }
resource "Mesh" "WildBushS_01_Rose"					{ source = "DoB_WildBushRose_S_01.fbx",	 registerCollision = false, loadLazy = true }
resource "Mesh" "WildBushM_01"						{ source = "DoB_WildBush_M_01.fbx",		 registerCollision = false, loadLazy = true }
resource "Mesh" "WildBushM_01_RoseA"				{ source = "DoB_WildBushRose_M_01a.fbx", registerCollision = false, loadLazy = true }
resource "Mesh" "WildBushM_01_RoseB"				{ source = "DoB_WildBushRose_M_01b.fbx", registerCollision = false, loadLazy = true }
resource "Mesh" "WildBushM_01_RoseC"				{ source = "DoB_WildBushRose_M_01c.fbx", registerCollision = false, loadLazy = true }
resource "Mesh" "WildBushL_01"						{ source = "DoB_WildBush_L_01.fbx",		 registerCollision = false, loadLazy = true }
resource "Mesh" "WildBushL_01_RoseA"				{ source = "DoB_WildBushRose_L_01a.fbx", registerCollision = false, loadLazy = true }
resource "Mesh" "WildBushL_01_RoseB"				{ source = "DoB_WildBushRose_L_01b.fbx", registerCollision = false, loadLazy = true }
resource "Mesh" "WildBushL_01_RoseC"				{ source = "DoB_WildBushRose_L_01c.fbx", registerCollision = false, loadLazy = true }
resource "Mesh" "WildBushL_02"						{ source = "DoB_WildBush_L_02.fbx",		 registerCollision = false, loadLazy = true }
resource "Mesh" "WildBushL_02_RoseA"				{ source = "DoB_WildBushRose_L_02a.fbx", registerCollision = false, loadLazy = true }
resource "Mesh" "WildBushL_02_RoseB"				{ source = "DoB_WildBushRose_L_02b.fbx", registerCollision = false, loadLazy = true }
resource "Mesh" "WildBushL_02_RoseC"				{ source = "DoB_WildBushRose_L_02c.fbx", registerCollision = false, loadLazy = true }
resource "Mesh" "DoB_FoliageRose_01"				{ source = "DoB_FoliageRose_01.fbx", registerCollision = false, loadLazy = true }
resource "Mesh" "RosePetal"				            { source = "RosePetal.fbx", registerCollision = false, loadLazy = true }

resource "Mesh" "DarkshroomLeaf01"					{ source = "Darkshroom_PlantB_01.fbx", registerCollision = false, loadLazy = true }

-- Days of Bloom 2026
resource "Mesh" "DoBloom_SunFlowerSprout"			{ source = "DoBloom_SunFlowerSprout.fbx", registerCollision = true, loadLazy = true }
resource "Mesh" "DoBloom_SunFlowerSeedling"			{ source = "DoBloom_SunFlowerSeedling.fbx", registerCollision = true, loadLazy = true }
resource "Mesh" "DoBloom_SunFlower"			        { source = "DoBloom_SunFlower.fbx", registerCollision = true, loadLazy = true }
resource "Mesh" "DoBloom_SunFlowerLarge"			{ source = "DoBloom_SunFlowerLarge.fbx", registerCollision = true, loadLazy = true }
resource "Mesh" "DoBloom_SunFlowerHarvest"			{ source = "DoBloom_SunFlowerHarvest.fbx", registerCollision = true, loadLazy = true }
resource "Mesh" "DoBloom_SunFlowerHarvestLarge"	    { source = "DoBloom_SunFlowerHarvestLarge.fbx", registerCollision = true, loadLazy = true }
resource "Mesh" "DoBloom_SunFlowerStem"			    { source = "DoBloom_SunFlowerStem.fbx", registerCollision = true, loadLazy = true }
resource "Mesh" "DoBloom_SunFlowerWilted"			{ source = "DoBloom_SunFlowerWilted.fbx", registerCollision = true, loadLazy = true }

resource "Mesh" "DoBloom_SunFlowerSprout_AF"		{ source = "DoBloom_SunFlowerSprout_AF.fbx", registerCollision = true, loadLazy = true }
resource "Mesh" "DoBloom_SunFlower_AF"				{ source = "DoBloom_SunFlower_AF.fbx", registerCollision = true, loadLazy = true }
resource "Mesh" "DoBloom_SunFlowerHarvest_AF"		{ source = "DoBloom_SunFlowerHarvest_AF.fbx", registerCollision = true, loadLazy = true }
resource "Mesh" "DoBloom_SunFlowerLarge_AF"			{ source = "DoBloom_SunFlowerLarge_AF.fbx", registerCollision = true, loadLazy = true }
resource "Mesh" "DoBloom_SunFlowerHarvestLarge_AF"	{ source = "DoBloom_SunFlowerHarvestLarge_AF.fbx", registerCollision = true, loadLazy = true }
resource "Mesh" "DoBloom_SunFlowerSeedling_AF"		{ source = "DoBloom_SunFlowerSeedling_AF.fbx", registerCollision = true, loadLazy = true }
resource "Mesh" "DoBloom_SunFlowerSmall_AF"		{ source = "DoBloom_SunFlowerSmall_AF.fbx", registerCollision = true, loadLazy = true }

-- Season 27
resource "Mesh" "AF_S27HouseLong_01"		{ source = "AF_S27HouseLong_01.fbx", registerCollision = false, loadLazy = false }
resource "Mesh" "AF_S27HouseLong_01a"		{ source = "AF_S27HouseLong_01a.fbx", registerCollision = false, loadLazy = false }
resource "Mesh" "AF_S27HouseLong_01b"		{ source = "AF_S27HouseLong_01b.fbx", registerCollision = false, loadLazy = false }
resource "Mesh" "AF_S27HouseSquare_01"		{ source = "AF_S27HouseSquare_01.fbx", registerCollision = false, loadLazy = false }
resource "Mesh" "AF_S27HouseLShape_01"		{ source = "AF_S27HouseLShape_01.fbx", registerCollision = false, loadLazy = false }
resource "Mesh" "AF_S27HouseLarge_01"		{ source = "AF_S27HouseLarge_01.fbx", registerCollision = false, loadLazy = false }
resource "Mesh" "AF_S27HouseLarge_01a"		{ source = "AF_S27HouseLarge_01a.fbx", registerCollision = false, loadLazy = false }

resource "Mesh" "AF_S27_MarketTent_01"		{ source = "AF_S27_MarketTent_01.fbx", registerCollision = false, loadLazy = false }
resource "Mesh" "AF_S27_MarketTent_02"		{ source = "AF_S27_MarketTent_02.fbx", bregisterCollision = false, loadLazy = false }
resource "Mesh" "AF_S27_CivilianTent_01"	{ source = "AF_S27_CivilianTent_01.fbx", registerCollision = false, loadLazy = false }
resource "Mesh" "AF_S27_CivilianTent_02"	{ source = "AF_S27_CivilianTent_02.fbx", registerCollision = false, loadLazy = false }
resource "Mesh" "AF_S27_CivilianTent_03"	{ source = "AF_S27_CivilianTent_03.fbx", registerCollision = false, loadLazy = false }
resource "Mesh" "AF_S27_CivilianTent_04"	{ source = "AF_S27_CivilianTent_04.fbx", registerCollision = false, loadLazy = false }

-- Season 30
resource "Mesh" "S30_BallpitBall_01"				{ source = "S30_BallpitBall_01.fbx", registerCollision = true, loadLazy = true }

-- Test Art Book
resource "Mesh" "CharSkyKid_Prop_SkyArtBook01_Closed"						{ source = "Prop_SkyArtBook01_Closed.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "CharSkyKid_Prop_SkyArtBook01_Open"						{ source = "Prop_SkyArtBook01_Open.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "CharSkyKid_Prop_SkyArtBook02_Closed"            { source = "Prop_SkyArtBook02_Closed.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "CharSkyKid_Prop_SkyArtBook02_Open"            { source = "Prop_SkyArtBook02_Open.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }

-- Instrument extras
resource "Mesh" "Prop_ViolinBow"							{ source = "Prop_ViolinBow.fbx", loadAsync = false, registerCollision = false }

-- Tournament of Triumph

resource "Mesh" "CharSkyKid_Prop_CrabOfCompetition_Stone"   { source = "CharSkyKid_Prop_CrabOfCompetition_Stone.fbx", loadAsync = false, registerCollision = false, computeOcclusions = true }
resource "Mesh" "CharSkyKid_Prop_CrabOfCompetition_Gold"    { source = "CharSkyKid_Prop_CrabOfCompetition_Gold.fbx", loadAsync = false, registerCollision = false, computeOcclusions = true }
resource "Mesh" "CharSkyKid_Prop_HangingFlags"              { source = "CharSkyKid_Prop_HangingFlags.fbx", loadAsync = false, registerCollision = false, computeOcclusions = true }
resource "Mesh" "CharSkyKid_Prop_TriumphFlagsSunset"              { source = "DaysOfCompetition_ColouredFlags_02_red.fbx", loadAsync = false, registerCollision = false, computeOcclusions = true }
resource "Mesh" "CharSkyKid_Prop_TriumphFlagsDusk"              { source = "DaysOfCompetition_ColouredFlags_02_green.fbx", loadAsync = false, registerCollision = false, computeOcclusions = true }
resource "Mesh" "CharSkyKid_Prop_TriumphFlagsRain"              { source = "DaysOfCompetition_ColouredFlags_02_blue.fbx", loadAsync = false, registerCollision = false, computeOcclusions = true }
resource "Mesh" "CharSkyKid_Prop_TriumphFlagsPrairie"              { source = "DaysOfCompetition_ColouredFlags_02_yellow.fbx", loadAsync = false, registerCollision = false, computeOcclusions = true }
resource "Mesh" "CharSkyKid_Prop_Podium"                    { source = "CharSkyKid_Prop_Podium.fbx", loadAsync = false, registerCollision = false, computeOcclusions = true }
resource "Mesh" "CharSkyKid_Prop_TriumphIceBoard"                      { source = "Prop_TriumphIceBoard.fbx", loadAsync = false, registerCollision = false, computeOcclusions = true }

-- Days of Moonlight
resource "Mesh" "MoonlightLantern"      		{ source = "MoonlightLantern.fbx", 		loadAsync = false, 		registerCollision = false, 		loadLazy = true }
resource "Mesh" "Placeable_MoonlightLantern"      		{ source = "Placeable_MoonlightLantern.fbx", 		loadAsync = false, 		registerCollision = false, 		loadLazy = true }

-- Days of Fortune
resource "Mesh" "Prop_FortunePlant"              { source = "Prop_FortunePlant.fbx",         loadAsync = false,         registerCollision = false,         computeOcclusions = true }
resource "Mesh" "Hair_FortuneSnake"                    { source = "Hair_FortuneSnake.fbx",             sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Body_FortuneSnake"                    { source = "Body_FortuneSnake.fbx",             sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_FortuneSnake"             { source = "Wing_FortuneSnake.fbx",         sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Prop_FortuneFan"                        { source = "Prop_FortuneFan.fbx", computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }
resource "Mesh" "Prop_FortuneCoupletPoster"                    { source = "Prop_FortuneCoupletPoster.fbx", loadAsync = false, registerCollision = false, computeOcclusions = true }
resource "Mesh" "Prop_FortuneCandleFlags"                    { source = "Prop_FortuneCandleFlags.fbx", loadAsync = false, registerCollision = false, computeOcclusions = true }
resource "Mesh" "Prop_FortuneBag"                    { source = "Prop_FortuneBag.fbx", loadAsync = false, registerCollision = false, computeOcclusions = true, copyFrameDelay = true }
resource "Mesh" "Mask_FortuneSnake"                { source = "Mask_FortuneSnake.fbx", sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }

resource "Mesh" "Prop_SnakeGameHead"                        { source = "Prop_SnakeGameHead.fbx", computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true, stripUv13 = true }

-- Two Embers --
resource "Mesh" "CandleFruitAnim"            { source = "CandleFruitAnim.fbx", loadAsync = false, registerCollision = false, computeOcclusions = true }
resource "Mesh" "Before_FruitOrangePopulate_VistaDemo1Anim"            { source = "Before_FruitOrangePopulate_VistaDemo1Anim.fbx", loadAsync = false, registerCollision = false, computeOcclusions = true }
resource "Mesh" "FishE"            { source = "FishE.fbx", loadAsync = false, registerCollision = false, computeOcclusions = true }
resource "Mesh" "PropHammer_01"            { source = "PropHammer_01.fbx", loadAsync = false, registerCollision = false, computeOcclusions = true }

resource "Mesh" "Prop_MoonlightPoster"                        { source = "Prop_MoonlightPoster.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true ,loadLazy = true}
resource "Mesh" "Prop_LotusBathtub"                        { source = "Prop_LotusBathtub.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true ,loadLazy = true}
resource "Mesh" "P_LotusBathtubWater"                        { source = "P_LotusBathtubWater.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true ,loadLazy = true}
resource "Mesh" "Wing_Moonlight"                    { source = "Wing_Moonlight.fbx",                 sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Tail_MoonlightRabbit"                    { source = "Tail_MoonlightRabbit.fbx",             sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Prop_Mooncake"                     { source = "Prop_Mooncake.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "Prop_MooncakePlate"                { source = "Prop_MooncakePlate.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }

-- Rabbit
resource "Mesh" "MoonlightRabbit"            { source = "MoonlightRabbit.fbx", loadAsync = false, computeOcclusions = true, computeEdges = false, registerCollision = false }

-- TwinRibbon
resource "Mesh" "TwinRibbon"            { source = "TwinRibbonOrnament.fbx", loadAsync = false, computeOcclusions = true, computeEdges = false, registerCollision = false }
resource "Mesh" "Prop_KizunaAiTVBorder"          { source = "Prop_KizunaAiTVBorder.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "Prop_KizunaAiTV"     			 { source = "Prop_KizunaAiTV.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }

-- FortunePony
resource "Mesh" "Prop_FortunePony"	{ source = "Prop_FortunePony.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "Prop_FortunePony01"    { source = "Prop_FortunePony01.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }

-- Dofortune 2026
resource "Mesh" "Body_FortunePanelDress"                    { source = "Body_FortunePanelDress.fbx",             sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Horn_FortuneGlasses"                { source = "Horn_FortuneGlasses.fbx",         sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Prop_FortuneCarousel"            { source = "Prop_FortuneCarousel.fbx", computeOcclusions = true, computeEdges = false, compressPositions = false, compressUvs = false, stripNormals = false, loadLazy = true, stripUv13 = false, copyFrameDelay = true }
resource "Mesh" "Prop_FortuneCarousel02"          { source = "Prop_FortuneCarousel02.fbx", loadAsync = false, registerCollision = false, computeOcclusions = true }
resource "Mesh" "Hair_FortunePonytail"                    { source = "Hair_FortunePonytail.fbx",             sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Wing_FortuneHorse"                { source = "Wing_FortuneHorse.fbx",         sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Mask_FortuneHorse"            { source = "Mask_FortuneHorse.fbx",         sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }


-- Personality
resource "Mesh" "Neck_Personality_YellowJokerNeck"                        { source = "Neck_Personality_YellowJokerNeck.fbx",                     sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hat_PersonalityPuppyEars"                        { source = "Hat_PersonalityPuppyEars.fbx",                     sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hat_PersonalityPCurve"                        { source = "Hat_PersonalityPCurve.fbx",                     sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hat_PersonalityJStraight"                        { source = "Hat_PersonalityJStraight.fbx",                     sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Face_PersonalityFLove"                        { source = "Face_PersonalityFLove.fbx",                     sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Face_PersonalityTGear"                        { source = "Face_PersonalityTGear.fbx",                     sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hat_PersonalityPaintbrush"                        { source = "Hat_PersonalityPaintbrush.fbx",                     sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Face_PersonalityPurpleGlasses"                        { source = "Face_PersonalityPurpleGlasses.fbx",                     sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }
resource "Mesh" "Hat_PersonalityNurseCap"                        { source = "Hat_PersonalityNurseCap.fbx",                     sharedSkeleton = "CharSkyKid_Skeleton.fbx", stripAnimation = true, computeOcclusions = true, computeEdges = false, compressPositions = true, compressUvs = true, stripNormals = true, loadLazy = true }

-- Challenges
resource "Mesh" "AP30ChallengeFlag"	{ source = "AP30ChallengeFlag.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "S30_Challenge_Bounce_Pad_Small_01"	{ source = "S30_Challenge_Bounce_Pad_Small_01.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "S30_Challenge_Target_01"			{ source = "S30_Challenge_Target_01.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "DCylinder"							{ source = "DCylinder.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "ChallengeFlag"						{ source = "ChallengeFlag.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "Prop_AP30ChallengeBouncePad_Level1" { source = "Prop_AP30ChallengeBouncePad_Level1.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "Prop_AP30ChallengeBouncePad_Level2" { source = "Prop_AP30ChallengeBouncePad_Level2.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "Prop_AP30ChallengeBouncePad_Level3" { source = "Prop_AP30ChallengeBouncePad_Level3.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "Prop_AP30ChallengeLantern"         { source = "Prop_AP30ChallengeLantern.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "Prop_AP30ChallengeLanternTier1"    { source = "Prop_AP30ChallengeLanternTier1.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "Prop_AP30ChallengeLanternTier2"    { source = "Prop_AP30ChallengeLanternTier2.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "Prop_AP30ChallengeLanternTier3"    { source = "Prop_AP30ChallengeLanternTier3.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "Prop_AP30ChallengeToken"           { source = "Prop_AP30ChallengeToken.fbx", loadAsync = false, computeOcclusions = true, computeEdges = false } -- Collectible drop beam
resource "Mesh" "Prop_AP30ChallengeTarget"          { source = "Prop_AP30ChallengeTarget.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "Prop_AP30ChallengeBallDispenser"   { source = "Prop_AP30ChallengeBallDispenser.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "Prop_AP30ChallengeBall"            { source = "Prop_AP30ChallengeBall.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "Prop_AP30ChallengeBallEmote"       { source = "Prop_AP30ChallengeBallEmote.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "Prop_AP30ChallengePlatform"        { source = "Prop_AP30ChallengePlatform.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "AP30ChallengeTierFlag_01"			{ source = "AP30ChallengeTierFlag_01.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "AP30ChallengeTierFlag_02"			{ source = "AP30ChallengeTierFlag_02.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "AP30ChallengeTierFlag_03"			{ source = "AP30ChallengeTierFlag_03.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "DoTreasure_Flag"			        { source = "DoTreasure_Flag.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "S30_Balloon_Lg_01a"				{ source = "S30_Balloon_Lg_01a.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "S30_Balloon_Lg_01b"				{ source = "S30_Balloon_Lg_01b.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "S30_Balloon_Lg_02a"				{ source = "S30_Balloon_Lg_02a.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "S30_Balloon_Lg_02b"				{ source = "S30_Balloon_Lg_02b.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "S30_Balloon_Lg_03a"				{ source = "S30_Balloon_Lg_03a.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }
resource "Mesh" "S30_Balloon_Lg_03b"				{ source = "S30_Balloon_Lg_03b.fbx", loadAsync = false, registerCollision = true, computeOcclusions = true }

