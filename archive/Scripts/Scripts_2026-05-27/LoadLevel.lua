-------------------------------------------------------------------------------
-- Notes:  Routines to support live attribute update from Blue Sky Thinking to
--         the game.
--
--         Important note: BST's CreateGameObject.lua requires the LoadObject
--         function defined in this file, so you need to keep that in mind when
--         updating the interface or functionality.
--
-- Author: John Edwards (was Nick Clark)
-- Date C: 06-23-2014
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-- LevelObjects registration functions
-------------------------------------------------------------------------------
__LevelObjects = __LevelObjects or {} -- Written this way to allow this file to be hot loaded without clearing __LevelObjects

function RegisterLevelObjectsForHotDate( name, objects )
	__LevelObjects[ name ] = objects
end

function UnregisterLevelObjectsForHotDate( name )
	__LevelObjects[ name ] = nil
end

-------------------------------------------------------------------------------
-- HotDate function for a single level object
-------------------------------------------------------------------------------
function HotDateLevelObject( hotDateType, levelName, objectName, objectData )
	assert( __LevelObjects[ levelName ], "Failed hot-dating "..objectName.." in "..levelName..". Couldn't find level." )
	local function LookUpObject( name )
		return __LevelObjects[ levelName ]:GetObjectByName( name )
	end
	local object = LookUpObject( objectName )
	if not object then
		return
	end

	if hotDateType == "full" then
		LoadObject( levelName.."."..objectName, object, objectData.Vars, LookUpObject )
	elseif hotDateType == "transform" then
		SetObjectTransform( object, objectData )
	elseif hotDateType == "enable" then
		-- Note: 'enable' has been overloaded to perform other operations based on contents of objectData
		-- if objectData['action'] ~= nil then
		--	 if objectData['action']== 'HotDateUser' then
		--		objectData['methodName]'] will specify the method to invoke
		--		objectData['param]'] will be a string to pass to the method as a parameter
		--	 else 
		--		-- Some new action type we don't yet support
		--	 end
		-- else
		--		objectData['enable]'] will be a boolean we pass to SetObjectEnable(), if not provided then we default to 'true'
		local action = objectData['action']
		if action ~= nil then
			if action == 'HotDateUser' then
				local methodName = objectData['methodName']
				local param = objectData['param']
				if methodName == nil or methodName == '' then
					methodName = 'HotDateUser'
				end
				if object[methodName] then
					local method = object[methodName]
					-- Testing confirms that we can pass a parameter from lua even if
					-- the C++ method was defined as taking zero parameters, the lua->c++
					-- interface knows what to do
					if param == nil then
						param = ''
					end
					method(object, param)
				end
			else
				-- Some other 'action' was specified and this script needs to be updated to handle it
			end
			-- As this HotDate was to invoke a user specified action rather than any of the original
			-- HotDate actions, we should exit this function now so as not to invoke the the last 
			-- line of this function that calls object:HotDate()
			return
		else
			local enable = objectData['enable']
			if enable == nil then
				enable = true
			elseif enable == 0 then
				enable = false
			else
				enable = true
			end
			SetObjectEnabled( object, enable )
		end
	end

	-- If the object wants to be told when it's been hot-dated, tell it
	if object.HotDate then object:HotDate() end
end

-------------------------------------------------------------------------------
-- Helpers
-------------------------------------------------------------------------------
function LoadObject( fullObjectName, object, luaData, LookUpObject )
	for varName, var in pairs( object.__vars ) do
		local luaValue = luaData[ varName ]
		if luaValue ~= nil then
			local success, msg = pcall( LoadValue, fullObjectName, object, varName, luaValue, LookUpObject )
			if not success then
				print( "*** WARNING: Failed hot dating "..fullObjectName.."."..varName.." with value: "..tostring( luaValue ).."." )
				print( "             Error: "..msg )
			end
		end
	end
end

function LoadValue( fullObjectName, object, varName, luaValue, LookUpObject )
	local var = object[ varName ]

	if not var.__isclass then
		var( object, luaValue )
	else
		if not var.__len then
			local oldValue = var( object )
			local ptrValue = LoadObjectPtr( var, luaValue, LookUpObject, oldValue )
			if ptrValue ~= nil or var.__metadata.Tool_Nullable then
				var( object, ptrValue )
			end
		else
			-- Make sure the array is properly allocated
			local allocator = var.__metadata.ArrayAllocator
			local count = #luaValue
			object[ allocator ]( object, count )
			assert( var.__len( object ) == count )

			-- Load the elements
			for i = 1, count do
				if type( luaValue[ i ] ) == "table" then
					local elem = var[ i - 1 ]( object )
					local elemName = fullObjectName.."."..varName.."[ "..i.." ]"
					LoadObject( elemName, elem, luaValue[ i ], LookUpObject )
				else
					local oldValue = var[ i - 1 ]( object )
					local ptrValue = LoadObjectPtr( var, luaValue[ i ], LookUpObject, oldValue )
					if ptrValue ~= nil or var.__metadata.Tool_Nullable then
						var[ i - 1 ]( object, ptrValue )
					end
				end
			end
		end
	end
end

function LoadObjectPtr( var, luaValue, LookUpObject, oldValue )
	local ptrValue = nil
	if type( luaValue ) == "string" then
		ptrValue = LookUpObject( luaValue )
	end
	if ptrValue and ptrValue ~= nil and not _G[ var.__ctype ].cast( ptrValue ) then
		if var.__ctype == "Clump" then
			local clumpType = var.__metadata.Tool_ClumpType
			assert( clumpType )
			if _G[ clumpType ] and _G[ clumpType ].cast( ptrValue ) then
				-- Wrap this pointer in a single-item clump.
				-- Reuse the existing wrapper clump if available, to avoid
				-- exhausting the clumpBarn during repeated hotdating.
				if oldValue and _G.Clump.cast( oldValue ) and oldValue:Size() == 1 then
					oldValue:SetAt( 0, ptrValue )
					ptrValue = oldValue
				else
					local newClump = _G.game:clumpBarn():CreateClumpWithSize( 1 )
					newClump:SetAt( 0, ptrValue )
					ptrValue = newClump
				end
			end
		else
			assert( false, "*** ERROR: pointer type mismatch. Expected "..var.__ctype..", got "..tostring( ptrValue ) )
		end
	end
	return ptrValue
end
