-- For upgraded Rusting Hulks
-- Upgraded Aerial Bombs whose range upgrade is a +2 instead of a +1
Weapon_Jetmech_Plus = Brute_Jetmech:new{
	Class = "",
	-- Flying requirement???
}
modApi:addWeapon_Texts({
	Weapon_Jetmech_Plus_Name = "Bombing Run",
	Weapon_Jetmech_Plus_Description = "Fly over a target, dropping an explosive smoke bomb.",
	Weapon_Jetmech_Plus_Upgrade1 = "+1 Damage",
	Weapon_Jetmech_Plus_A_UpgradeDescription = "Increases Damage by 1",
	Weapon_Jetmech_Plus_Upgrade2 = "+2 Range",
	Weapon_Jetmech_Plus_B_UpgradeDescription = "Allows jumping over and attacking 2 additional targets."
	-- use dash not jump
})
Weapon_Jetmech_Plus_A = Weapon_Jetmech_Plus:new{
	Damage = 2,
	AttackAnimation = "ExploRaining2",
}
Weapon_Jetmech_Plus_B = Weapon_Jetmech_Plus:new{
	Range = 4,
	TipImage = {
		Unit = Point(2, 4),
		Enemy = Point(2, 3),
		Enemy2 = Point(2, 1),
		Target = Point(2, 0)
	}
}
Weapon_Jetmech_Plus_AB = Weapon_Jetmech_Plus:new{
	Damage = 2,
	AttackAnimation = "ExploRaining2",
	Range = 4,
	TipImage = {
		Unit = Point(2, 4),
		Enemy = Point(2, 3),
		Enemy2 = Point(2, 1),
		Target = Point(2, 0)
	}
}