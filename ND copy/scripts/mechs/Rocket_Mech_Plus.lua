---@diagnostic disable: undefined-global, duplicate-set-field
-- Upgraded Rusting Hulks
Rocket_Mech_Plus = RocketMech:new{
	Name = "Missile Mech",
	Image = "MechRocket",
	ImageOffset = 1,
	Class = "Ranged",
	MoveSpeed = 3,
	SkillList = {"Ranged_Rocket_Plus", "Passive_Pyroclastic_Nanites"},
	DefaultTeam = TEAM_PLAYER,
	ImpactMaterial = IMPACT_METAL,
	Massive = true
}
AddPawn("Rocket_Mech_Plus")