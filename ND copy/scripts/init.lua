---@diagnostic disable: undefined-global, duplicate-set-field
local mod = {
	id = "ND_Squad",
	name = "ND Squad",
	version = "1.0",
	requirements = {
		-- modApiExt = "1.25",
	},
	icon = "img/mod_icon.png",
}

function mod:init()
	require(self.scriptPath .. "mechs/Jet_Mech_Plus")
	require(self.scriptPath .. "mechs/Rocket_Mech_Plus")
	require(self.scriptPath .. "weapons/Passive_Pyroclastic_Nanites")
	require(self.scriptPath .. "weapons/Ranged_Rocket_Plus")
	require(self.scriptPath .. "weapons/Weapon_Jetmech_Plus")
end

function mod:load()
	modApi:addSquad(
		{
			id = "Rusted_Hulks_Plus",
			"Rusted Hulks Plus",
			"Jet_Mech_Plus",
			"Rocket_Mech_Plus",
			"PulseMech",
		},
		"Rusted Hulks Plus",
		"They seem so familiar... but smokey."
		-- self.resourcePath .. "img/squad_icon.png"
	)
local FireList = {false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false}
modApi:addMissionStartHook(function(_)
	if Board and isPassiveActive("Passive_Pyroclastic_Nanites") then
		local pawns = Board:GetPawns(TEAM_PLAYER)
		for i = 1, pawns:size() do
			local pawn = Board:GetPawn(pawns:index(i))
			if pawn and pawn:IsMech() then
				pawn.IgnoreSmoke = enabled
			end
		end
	end
end)
-- ignore no work
modApi:addMissionEndHook(function(_)
	FireList = {false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false}
	if Board then
		local pawns = Board:GetPawns(TEAM_PLAYER)
		for i = 1, pawns:size() do
			local pawn = Board:GetPawn(pawns:index(i))
			if pawn and pawn:IsMech() and pawn.IgnoreSmoke == enabled then
				local pilot = pawn:GetPilot()
				if pilot and not pilot.id == "Pilot_Soldier" then
					pawn.IgnoreSmoke = disabled
				end
			end
		end
	end
end)
modApi:addNextTurnHook(function(_)
	if Board and Game:GetTeamTurn() == TEAM_ENEMY and isPassiveActive("Passive_Pyroclastic_Nanites") then
		for x = 0, 7 do
		for y = 0, 7 do
			local point = Point(x, y)
			if FireList[8*y+x+1] then
				LOG(x .. " " .. y .. " was")
				if Board:IsFire(point) then
					LOG(x .. " " .. y .. " still")
					Board:SetFire(point, false)
					Board:SetSmoke(point, true)
				end
				FireList[8*y+x] = false
				LOG(x .. " " .. y .. " not")
			elseif Board:IsFire(point) then
				LOG(x .. " " .. y .. " is")
				FireList[8*y+x] = true
			end
		end
		end
	end
end)
	-- Fuse Breaker - Reach 25% Grid DEF
	-- Fog of War - Cover 20 tiles in Smoke in a single battle or cancel 15 attacks
	-- Perfect Offensive - Achieve a 40k run while taking no mech or allied npc damage and not failing an objective and machinizing objectives

end

return mod