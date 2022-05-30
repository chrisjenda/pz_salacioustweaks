-- remove the old functions from the events

-- store original functions.
local oldMSTDoTraits = MSTVanillaBaseGameCharacterDetails.DoTraits

--More vanilla traits
Events.OnGameBoot.Remove(oldMSTDoTraits)

-- More Brews Traits
Events.OnGameBoot.Remove(initMoreBrewsRecipes)
Events.OnNewGame.Remove(MoreBrewsStarterKit)

-- Wooden Dowels Traits
Events.OnCreateSurvivor.Remove(initDowelsProfessions)
Events.OnCreateSurvivor.Remove(initDowelTraits)

-- Better Lockpicking Traits
Events.OnGameBoot.Remove(initProfessions)
Events.OnNewGame.Remove(onNewGame)


local addTrait = ProfessionFramework.addTrait
local addProfession = ProfessionFramework.addProfession


SalaciousTweaks1 = {}

SalaciousTweaks1.testtesttest = function()
    print("\nRemoving all Professions and re-adding since Burglar is stupid");
    ProfessionFramework.Professions["burglar"] = nil;

    ProfessionFactory.Reset();
    ProfessionFramework.doProfessions();

    TraitFactory.Reset();
    ProfessionFramework.doTraits();



    print("\n");
    print("PF Traits:");
    for ptype2, details2 in pairs(ProfessionFramework.Traits) do

      print(ptype2);
    end

    print("\n");
    print("ProfessionFactory Traits:");
    for i=0,ProfessionFactory.getProfessions():size()-1 do
        local prof = ProfessionFactory.getProfessions():get(i);
         print(prof:getType());
         --[[
         if (prof:getType() == 'burglar') then
            print("\n");
            print(ProfessionFactory[9])
          --  ProfessionFactory.Reset();
            print("Pop " .. i);
            print("\n");

          --  table.add(ProfessionFactory, "test")
            --table.remove(ProfessionFactory,i)
            --table.insert(self.comboList, prof);
         end
         --]]
    end

end


Events.OnCreateSurvivor.Add(SalaciousTweaks1.testtesttest);

addProfession('unemployed', {
    icon = "",
})
--[[
addProfession('burglar', {
		name = "UI_prof_Burglar",
		icon = "profession_burglar2",
		cost = -6,
		xp = {
				[Perks.Nimble] = 2,
				[Perks.Sneak] = 2,
				[Perks.Lightfoot] = 2,
		},
		traits = {"Burglar", "nimblefingers"},
})
--]]
--[[]]
ProfessionFramework.Professions["burglar"] = nil;
addProfession('burglar2', {
		name = "UI_prof_Burglar",
		icon = "profession_burglar2",
		cost = -6,
		xp = {
				[Perks.Nimble] = 2,
				[Perks.Sneak] = 2,
				[Perks.Lightfoot] = 2,
		},
		traits = {"Burglar", "nimblefingers"},
})
--[[
addProfession('burglar', {
    name = "UI_prof_Burglar",
    icon = "profession_burglar2",
    cost = -6,
		traits = {"Burglar", "nimblefingers"},

  --[[  OnNewGame = function(_player, _tile, _prof)

      if _prof == "burglar" then
          local proflist = {"Lockpicking"};
          local profskills = {};
          profskills["Lockpicking"] = {};
          profskills["Lockpicking"].level = 2
          profskills["Lockpicking"].boost = 3
          profskills["Lockpicking"].xp = 225
          _player:getModData().proflist = proflist;
          _player:getModData().profskills = profskills
      elseif _player:HasTrait("nimblefingers2") then
          print("testing22");
          error("Function cannot format text");
          local proflist = {"Lockpicking"};
          local profskills = {};
          profskills["Lockpicking"] = {};
          profskills["Lockpicking"].level = 0
          profskills["Lockpicking"].boost = 2
          profskills["Lockpicking"].xp = 0
          _player:getModData().proflist = proflist;
          _player:getModData().profskills = profskills
      end

    end--]]
--})

addProfession('carpenter', {
		traits = {"dowelmaker"},
})

addProfession('repairman', {
		traits = {"dowelmaker"},
})

addProfession('constructionworker', {
		traits = {"dowelmaker"},
})

addTrait("nimblefingers", {
	name = "UI_trait_nimblefingers",
	description = "UI_trait_nimblefingersDesc",
	cost = 0,
	xp = {
		[Perks.Lockpicking] = 2,
	},
	profession = true,
	recipes = { "Lockpicking", "Alarm check", "Create BobbyPin"},
})

addTrait("nimblefingers2", {
	name = "UI_trait_nimblefingers",
	description = "UI_trait_nimblefingersDesc",
	cost = 3,
	exclude = { "nimblefingers" },
	xp = {
		[Perks.Lockpicking] = 2,
	},
	recipes = { "Lockpicking", "Alarm check", "Create BobbyPin"},
})

addTrait("Sneaky", {
    name = "UI_trait_sneaky",
    description = "UI_trait_sneakydesc",
    cost = 2,
    xp = {
        [Perks.Sneak] = 1
    },
    exclude = { "Conspicuous" }
})


addTrait("Lightfooted", {
    name = "UI_trait_lightfooted",
    description = "UI_trait_lightfooteddesc",
    cost = 2,
    xp = {
        [Perks.Lightfoot] = 1
    },
    exclude = { "Clumsy" }
})

addTrait("Nimble", {
    name = "UI_trait_nimble",
    description = "UI_trait_nimbledesc",
    cost = 3,
    xp = {
        [Perks.Nimble] = 1
    },
})

addTrait("MarathonRunner", {
    name = "UI_trait_marathonrunner",
    description = "UI_trait_marathonrunnerdesc",
    cost = 7,
    xp = {
        [Perks.Fitness] = 1,
        [Perks.Sprinting] = 1
    },
    exclude = { "Unfit", "Obese", "Asthmatic" }
})

addTrait("StrongNimble", {
    name = "UI_trait_strongnimble",
    description = "UI_trait_strongnimbledesc",
    cost = 6,
    xp = {
        [Perks.Strength] = 1,
        [Perks.Nimble] = 1
    },
    exclude = { "Weak", "Very Underweight" }
})

addTrait("Taut", {
    name = "UI_trait_taut",
    description = "UI_trait_tautdesc",
    cost = 6,
    xp = {
        [Perks.Fitness] = 1,
        [Perks.Strength] = 1
    },
    exclude = { "Unfit", "Weak" }
})

addTrait("AMForager", {
    name = "UI_trait_amforager",
    description = "UI_trait_amforagerdesc",
    cost = 3,
    xp = {
        [Perks.PlantScavenging] = 1,
    },
})

addTrait("AMTrapper", {
    name = "UI_trait_amtrapper",
    description = "UI_trait_amtrapperdesc",
    cost = 3,
    xp = {
        [Perks.Trapping] = 1
    },
    recipes = { "Make Stick Trap", "Make Snare Trap", "Make Wooden Cage Trap", "Make Trap Box", "Make Cage Trap" },
})

addTrait("Mushroomer", {
    name = "UI_trait_mushroomer",
    description = "UI_trait_mushroomerdesc",
    cost = 8,
    xp = {
        [Perks.PlantScavenging] = 1,
    },
    recipes = { "Herbalist"},
    exclude = { "Herbalist"},
})

addTrait("AMCook", {
    name = "UI_trait_amcook",
    description = "UI_trait_amcookdesc",
    cost = 3,
    xp = {
        [Perks.Cooking] = 1,
    },
})

addTrait("AMElectrician", {
    name = "UI_trait_amelectrician",
    description = "UI_trait_amelectriciandesc",
    cost = 4,
    xp = {
        [Perks.Electricity] = 1,
    },
})
--[[
addTrait("AMMechanic", {
    name = "UI_trait_ammechanic",
    description = "UI_trait_ammechanicdesc",
    cost = 4,
    xp = {
        [Perks.Mechanics] = 1,
    },
})
--]]
addTrait("AMCarpenter", {
    name = "UI_trait_amcarpenter",
    description = "UI_trait_amcarpenterdesc",
    cost = 4,
    xp = {
        [Perks.Woodwork] = 1,
    },
})

addTrait("AMMetalworker", {
    name = "UI_trait_ammetalworker",
    description = "UI_trait_ammetalworkerdesc",
    cost = 4,
    xp = {
        [Perks.MetalWelding] = 1,
    },
})

addTrait("Durabile", {
    name = "UI_trait_durabile",
    description = "UI_trait_durabiledesc",
    cost = 3,
    xp = {
        [Perks.Maintenance] = 1,
    },
})

addTrait("Shortbladefan", {
    name = "UI_trait_shortbladefan",
    description = "UI_trait_shortbladefandesc",
    cost = 3,
    xp = {
        [Perks.SmallBlade] = 1,
    },
})

addTrait("Shortbluntfan", {
    name = "UI_trait_shortbluntfan",
    description = "UI_trait_shortbluntfandesc",
    cost = 3,
    xp = {
        [Perks.SmallBlunt] = 1,
    },
})

addTrait("Cutter", {
    name = "UI_trait_cutter",
    description = "UI_trait_cutterdesc",
    cost = 4,
    xp = {
        [Perks.Axe] = 1,
    },
})

addTrait("Spearman", {
    name = "UI_trait_spearman",
    description = "UI_trait_spearmandesc",
    cost = 4,
    xp = {
        [Perks.Spear] = 1,
    },
})

addTrait("Swordsman", {
    name = "UI_trait_swordsman",
    description = "UI_trait_swordsmandesc",
    cost = 4,
    xp = {
        [Perks.LongBlade] = 1,
    },
})

addTrait("Gunfan", {
    name = "UI_trait_gunfan",
    description = "UI_trait_gunfandesc",
    cost = 4,
    xp = {
        [Perks.Aiming] = 1,
        [Perks.Reloading] = 1,
    },
})

addTrait("Sharpshooter", {
    name = "UI_trait_sharpshooter",
    description = "UI_trait_sharpshooterdesc",
    cost = 3,
    xp = {
        [Perks.Aiming] = 3,
    },
})

addTrait("OwlPerson", {
    name = "UI_trait_owlperson",
    description = "UI_trait_owlpersondesc",
    cost = -2,
})

addTrait("larkperson", {
    name = "UI_trait_larkperson",
    description = "UI_trait_larkpersondesc",
    cost = -2,
    exclude = { "OwlPerson" },
})

addTrait("Slack", {
    name = "UI_trait_slack",
    description = "UI_trait_slackdesc",
    cost = -6,
    xp = {
        [Perks.Fitness] = -1,
        [Perks.Strength] = -1,
    },
    exclude = { "MarathonRunner", "StrongNimble", "Athletic", "Strong", "Taut" },
})

addTrait("WeatherSensitive", {
    name = "UI_trait_weathersensitive",
    description = "UI_trait_weathersensitivedesc",
    cost = -3,
})

addTrait("SoreLegsTrait", {
    name = "UI_trait_sorelegstrait",
    description = "UI_trait_sorelegstraitdesc",
    cost = -10,
    exclude = { "Jogger", "MarathonRunner" },
})

addTrait("SensitiveStomach", {
    name = "UI_trait_sensitivestomach",
    description = "UI_trait_sensitivestomachdesc",
    cost = -2,
})

addTrait("CanGrabMore", {
    name = "UI_trait_cangrabmore",
    description = "UI_trait_cangrabmoredesc",
    cost = 3,
    exclude = { "Weak" },
})

addTrait("CanGrabLess", {
    name = "UI_trait_cangrabless",
    description = "UI_trait_cangrablessdesc",
    cost = -3,
    exclude = { "CanGrabMore", "Strong" },
})

addTrait("HeavilyBleedingWounds", {
    name = "UI_trait_hbwounds",
    description = "UI_trait_hbwoundsdesc",
    cost = -3,
    exclude = { "WeaklyBleedingWounds" },
})

addTrait("dowelmaker", {
    name = "Dowels Enthusiast",
    description = "Can craft and use wooden dowels as nails alternative.<br>Building with dowels requires Screwdriver & Hammer",
    cost = 3,
    profession = true,
    recipes = { "Build with Dowels", "Craft Dowels from Branch", "Craft Dowels from Plank", "Build Drawer with Dowels" },
})

addTrait("dowelmaker2", {
    name = "Dowels Enthusiast",
    description = "Can craft and use wooden dowels as nails alternative.<br>Building with dowels requires Screwdriver & Hammer.<br>Need to reach at least 1 point in Carpentry to start crafting dowels!",
    cost = 2,
    exclude = { "dowelmaker" },
    recipes = { "Build with Dowels", "Craft Dowels from Branch", "Craft Dowels from Plank", "Build Drawer with Dowels" },
})

local brewerrecipies = { "Create American Lager Wort",
"Create APA1 Wort",
"Create APA2 Wort",
"Create IPA1 Wort",
"Create IPA2 Wort",
"Create Light Lager Wort",
"Create Pilsner Wort",
"Create Porter Wort",
"Create Stout Wort",
"Prep to Ferment American Lager Beer",
"Prep to Ferment Dark American Pale Ale Beer",
"Prep to Ferment Light American Pale Ale Beer",
"Prep to Ferment Light India Pale Ale Beer",
"Prep to Ferment Dark India Pale Ale Beer",
"Prep to Ferment Light Lager Beer",
"Prep to Ferment Pilsner Beer",
"Prep to Ferment Porter Beer",
"Prep to Ferment Stout Beer",
"Dry Hop for Secondary Fermenting Dark American Pale Ale Beer",
"Dry Hop for Secondary Fermenting Light American Pale Ale Beer",
"Dry Hop for Secondary Fermenting Light India Pale Ale Beer",
"Dry Hop for Secondary Fermenting Dark India Pale Ale Beer",
"Fill American Lager Keg",
"Fill APA1 Keg",
"Fill APA2 Keg",
"Fill IPA1 Keg",
"Fill IPA2 Keg",
"Fill Light Lager Keg",
"Fill Pilsner Keg",
"Fill Porter Keg",
"Fill Stout Keg",
"Fill Bottle with American Lager",
"Fill Bottle with APA 1",
"Fill Bottle with APA 2",
"Fill Bottle with IPA 1",
"Fill Bottle with IPA 2",
"Fill Bottle with Light Lager",
"Fill Bottle with Pilsner",
"Fill Bottle with Porter",
"Fill Bottle with Stout",
"Fill Bottle with Skunked Beer",
"Fill Can with American Lager",
"Fill Can with APA 1",
"Fill Can with APA 2",
"Fill Can with IPA 1",
"Fill Can with IPA 2",
"Fill Can with Light Lager",
"Fill Can with Pilsner",
"Fill Can with Porter",
"Fill Can with Stout",
"Fill Can with Skunked Beer" };

addTrait("WeaklyBleedingWounds", {
    name = "UI_trait_wbwounds",
    description = "UI_trait_wbwoundsdesc",
    cost = 3,
})
if SandboxVars.StarterKit then
      addTrait("Brewer", {
          name = "UI_trait_brewer",
          description = "UI_trait_amtrapperdesc",
          cost = 2,
          xp = {
              [Perks.Brewing] = 2
          },
          inventory = {
              ["Base.Bag_Schoolbag"] = 1,
              ["MoreBrews.BeerCanPilsner"] = 6,
          },
          square = {
              ["MoreBrews.BrewingKit"] = 1,
          },
          recipes = brewerrecipies,
      })
else
      addTrait("Brewer", {
          name = "UI_trait_brewer",
          description = "UI_trait_amtrapperdesc",
          cost = 2,
          xp = {
              [Perks.Brewing] = 2
          },
          recipes = brewerrecipies,
      })
end

MSTVanillaBaseGameCharacterDetails.DoTraitsExtras = function()

  ----------------------------
	--- FORAGING INTEGRATION ---
	----------------------------

	forageSkills = forageSkills or {}
	-- Forrage Skills
	forageSkills["Mushroomer"] = {
        name 					= "Mushroomer",
        type 					= "trait",
        visionBonus 			= 0.6,
        weatherEffect 			= 5,
        darknessEffect 			= 10,
        specialisations 		= {
			["Mushrooms"] = 35
		}
	};
	forageSkills["AMForager"] = {
        name 					= "AMForager",
        type 					= "trait",
        visionBonus 			= 0.8,
        weatherEffect 			= 10,
        darknessEffect 			= 3,
        specialisations 		= {
            ["Animals"] 		= 3,
	        ["JunkFood"] 		= 3,
            ["Berries"] 		= 3,
            ["Mushrooms"] 		= 3,
            ["MedicinalPlants"] = 3,
	        ["ForestRarities"] 	= 3,
	        ["Insects"] 		= 3,
	        ["WildPlants"]		= 3,
	        ["Trash"] 			= 3
		}
	};
	forageSkills["AMTrapper"] = {
        name 					= "AMTrapper",
        type 					= "trait",
        specialisations 		= {
            ["Animals"] 		= 5
		},
	};
	forageSkills["AMElectrician"] = {
        name 					= "AMElectrician",
        type 					= "trait",
        specialisations 		= {
	        ["Trash"] 			= 3
		}
	};
	forageSkills["AMMechanic"] = {
        name 					= "AMMechanic",
        type 					= "trait",
        specialisations 		= {
	        ["Trash"] 			= 3,
		},
	};
	forageSkills["AMCarpenter"] = {
        name 					= "AMCarpenter",
        type 					= "trait",
        specialisations 		= {
	        ["Trash"] 			= 3
		}
	};
	forageSkills["AMMetalworker"] = {
        name 					= "AMMetalworker",
        type 					= "trait",
        specialisations 		= {
	        ["Trash"] 			= 3
		},
	};
	forageSkills["AMCook"] = {
        name 					= "AMCook",
        type 					= "trait",
        specialisations 		= {
	        ["JunkFood"]		= 5
		}
	};
		forageSkills["WeatherSensitive"] = {
        name 					= "WeatherSensitive",
        type 					= "trait",
        visionBonus 			= -0.2,
        weatherEffect 			= -3,
        darknessEffect 			= -3,
	};
--[[
	-- Compatibility with "More Description for Traits"
	BaseGameCharacterDetails.SetTraitDescription(sneaky)
	BaseGameCharacterDetails.SetTraitDescription(lightfooted)
	BaseGameCharacterDetails.SetTraitDescription(nimble)
	BaseGameCharacterDetails.SetTraitDescription(marathonrunner)
	BaseGameCharacterDetails.SetTraitDescription(strongnimble)
	BaseGameCharacterDetails.SetTraitDescription(mushroomer)
  BaseGameCharacterDetails.SetTraitDescription(amforager)
  BaseGameCharacterDetails.SetTraitDescription(amtrapper)
	BaseGameCharacterDetails.SetTraitDescription(amcook)
  BaseGameCharacterDetails.SetTraitDescription(amelectrician)
  BaseGameCharacterDetails.SetTraitDescription(ammechanic)
  BaseGameCharacterDetails.SetTraitDescription(amcarpenter)
  BaseGameCharacterDetails.SetTraitDescription(ammetalworker)
	BaseGameCharacterDetails.SetTraitDescription(durabile)
	BaseGameCharacterDetails.SetTraitDescription(shortbladefan)
	BaseGameCharacterDetails.SetTraitDescription(shortbluntfan)
	BaseGameCharacterDetails.SetTraitDescription(cutter)
	BaseGameCharacterDetails.SetTraitDescription(spearman)
	BaseGameCharacterDetails.SetTraitDescription(swordsman)
	BaseGameCharacterDetails.SetTraitDescription(gunfan)
	BaseGameCharacterDetails.SetTraitDescription(sharpshooter)
	BaseGameCharacterDetails.SetTraitDescription(slack)
	BaseGameCharacterDetails.SetTraitDescription(taut)
	BaseGameCharacterDetails.SetTraitDescription(weathersensitive)
--]]
end

--[[
addTrait("Lightfooted", {
    name = "UI_trait_lightfooted",
    description = "UI_trait_lightfooteddesc",
    cost = 2,
    profession = true,
})

addTrait("FirstAid", {
    name = "UI_trait_FirstAid",
    description = "UI_trait_FirstAidDesc",
    cost = 4,
    xp = {
        [Perks.Doctor] = 1
    }
})

addTrait("Fishing", {
    name = "UI_trait_Fishing",
    description = "UI_trait_FishingDesc",
    cost = 4,
    xp = {
        [Perks.Fishing] = 1
    },
    recipes = { "Make Fishing Rod", "Fix Fishing Rod" },
})
--]]
Events.OnGameBoot.Add(MSTVanillaBaseGameCharacterDetails.DoTraitsExtras);
