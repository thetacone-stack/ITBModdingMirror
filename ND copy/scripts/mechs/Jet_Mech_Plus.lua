---@diagnostic disable: undefined-global, duplicate-set-field
-- Upgraded Rusting Hulks
Jet_Mech_Plus = JetMech:new{
	Name = "Fighter Jet",
	Image = "MechJet",
	ImageOffset = 1,
	Class = "Brute",
	MoveSpeed = 4,
	SkillList = { "Weapon_Jetmech_Plus" },
	DefaultTeam = TEAM_PLAYER,
	ImpactMaterial = IMPACT_METAL,
	Massive = true,
	Flying = true
}
AddPawn("Jet_Mech_Plus")