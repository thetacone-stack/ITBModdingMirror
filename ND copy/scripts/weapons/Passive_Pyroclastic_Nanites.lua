---@diagnostic disable: undefined-global, duplicate-set-field
-- For upgraded Rusting Hulks
-- Upgraded Storm Generator that turns fire into smoke and allows mechs to attack while in smoke
Passive_Pyroclastic_Nanites = Passive_Electric:new{
	-- Icon = "weapons/passive_electric.png",
}
modApi:addWeapon_Texts({
	Passive_Pyroclastic_Nanites_Name = "Pyroclastic Nanites",
	Passive_Pyroclastic_Nanites_Description = "Smoke hurt vek, mech ignore smoke, fire go to smoke",
	Passive_Pyroclastic_Nanites_Upgrade1 = "+1 Damage",
	Passive_Pyroclastic_Nanites_A_UpgradeDescription = "Storms do 2 damage",
})
Passive_Pyroclastic_Nanites_A = Passive_Pyroclastic_Nanites:new{
	Damage = 2,
	Passive = "Electric_Smoke_A"
}