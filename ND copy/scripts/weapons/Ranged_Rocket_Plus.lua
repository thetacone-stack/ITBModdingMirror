---@diagnostic disable: undefined-global, duplicate-set-field
-- For upgraded Rusting Hulks
-- Upgraded Rocket that puts down significantly more smoke
Ranged_Rocket_Plus = Ranged_Rocket:new{
	SmokeTier = 0,
}
modApi:addWeapon_Texts({
	Ranged_Rocket_Plus_Name = "Missile",
	Ranged_Rocket_Plus_Description = "Fires a pushing artillery and creates Smoke.",
	Ranged_Rocket_Plus_Upgrade1 = "Bigger Missile",
	Ranged_Rocket_Plus_A_UpgradeDescription = "Increases Damage by 1 and produces more Smoke",
	Ranged_Rocket_Plus_Upgrade2 = "Bigger Missile",
	Ranged_Rocket_Plus_B_UpgradeDescription = "Increases Damage by 1 and produces more Smoke"
})
function Ranged_Rocket_Plus:GetSkillEffect(p1, p2)
	local ret = SkillEffect()
	local direction = GetDirection(p2 - p1)
	ret:AddBounce(p1, 1)
	local smoke = SpaceDamage(p1 - DIR_VECTORS[direction], 0)
	smoke.iSmoke = 1
	smoke.sAnimation = "exploout0_"..GetDirection(p1 - p2)
	ret:AddDamage(smoke)
	local damage = SpaceDamage(p2, self.Damage)
	if self.SmokeTier > 0 then
		damage.iSmoke = 1
		smoke = SpaceDamage(p1, 0)
		smoke.iSmoke = 1
		ret:AddDamage(smoke)
		if self.SmokeTier > 1 then
			for dir = DIR_START, DIR_END do
				smoke = SpaceDamage(p1 + DIR_VECTORS[dir], 0)
				smoke.iSmoke = 1
				smoke.sAnimation = "exploout0_"..dir
				ret:AddDamage(smoke)
			end
		end
	end
	damage.iPush = direction
	damage.sAnimation = "explopush2_"..direction
	ret:AddArtillery(damage, self.UpShot)
	ret:AddBounce(p2, self.BounceAmount)
	if self.SmokeTier > 0 then
		smoke = SpaceDamage(p2 + DIR_VECTORS[direction], 0)
		smoke.iSmoke = 1
		smoke.sAnimation = "exploout0_"..direction
		ret:AddDamage(smoke)
		if self.SmokeTier > 1 then
			for dir = DIR_START, DIR_END do
				smoke = SpaceDamage(p2 + DIR_VECTORS[dir], 0)
				smoke.iSmoke = 1
				smoke.sAnimation = "exploout0_"..dir
				ret:AddDamage(smoke)
			end
		end
	end
	return ret
end
Ranged_Rocket_Plus_A = Ranged_Rocket_Plus:new{
	Damage = 3,
	BounceAmount = 2.5,
	SmokeTier = 1
}
Ranged_Rocket_Plus_B = Ranged_Rocket_Plus_A
Ranged_Rocket_Plus_AB = Ranged_Rocket_Plus:new{
	Damage = 4,
	BounceAmount = 3,
	SmokeTier = 2
}