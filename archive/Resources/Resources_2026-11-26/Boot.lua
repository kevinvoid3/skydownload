-------------------------------------------------------------------------------
-- Notes:  Lists all the resources that are loaded for the Core modules. This
--         file should remain as short as possible to minimize load times.
--         These resources may be reordered to ensure that important resources
--         are available first.
--
-- Author: Mike Lester
-- Date C: 10-02-2016
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-- SCRIPTS
-------------------------------------------------------------------------------

-- Hotloading
resource "Script" "DebugFunctions"	{ source = "Scripts/DebugFunctions.lua", stripDebug = false }

-- Intro level selection
resource "Script" "LevelSelect"		{ source = "Scripts/LevelSelect.lua", stripDebug = false, autoRun = true }
resource "Script" "LoadLevel"		{ source = "Scripts/LoadLevel.lua", stripDebug = false, autoRun = true }



