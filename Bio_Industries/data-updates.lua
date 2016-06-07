
--- Help Files
require ("scripts.detectmod") --Detect supported Mods, currently DyTechWar and Bob's Enemies and others
require ("scripts.item-functions") -- From Bob's Libary 
require ("scripts.recipe-functions") -- From Bob's Libary 
require ("scripts.technology-functions") -- From Bob's Libary 


---- Inrease Wood Stack Size
data.raw.item["raw-wood"].stack_size = 400


--- Got tierd of reaching limits...
--[[
if data.raw.player.player.build_distance < 24 then
	data.raw.player.player.build_distance = 24
	data.raw.player.player.reach_distance = 20
	data.raw.player.player.reach_resource_distance = 20
	data.raw.player.player.drop_item_distance = 20
end 
]] 

--- Adds Solar Farm to solar-energy Tech
if BI_Config.Bio_Solar_Farm then
	if data.raw.technology["bob-solar-energy-2"] then
		bobmods.lib.add_technology_recipe ("bob-solar-energy-2", "bi_bio_Solar_Farm")
		bobmods.lib.replace_recipe_item("bi_bio_Solar_Farm", "solar-panel", "solar-panel-large")
		
	else
		bobmods.lib.add_technology_recipe ("solar-energy", "bi_bio_Solar_Farm")
	end	
end

	
if BI_Config.Bio_Farm then	
	--- Changes phosphate & potassium recipes if bob's
	if data.raw.item["sodium-hydroxide"] then
		bobmods.lib.remove_recipe_item ("bi-fertiliser", "sulfur")
		bobmods.lib.add_new_recipe_item ("bi-fertiliser", {type="item", name="sodium-hydroxide", amount=10})
	end	
	
	------- Adds a Mk3 recipe for wood if you're playing with Natural Evolution Buildings
	if BI_Config.mod.NEBuildings then
		require("prototypes.Bio_Farm.technology2")
		bobmods.lib.add_new_recipe_item ("bi-Logs_Mk3", {type="item", name="bi-adv-fertiliser", amount=5})
		bobmods.lib.add_new_recipe_item ("bi-adv-fertiliser", {type="fluid", name="NE_enhanced-nutrient-solution", amount=50})

		--- Adds Clean Air 2 recipe - Using Advanced fertiliser
		if BI_Config.Bio_Garden then
			bobmods.lib.add_technology_recipe ("bi-advanced-biotechnology", "bi-Clean_Air2")
			table.insert(data.raw.recipe["bi-Clean_Air2"].ingredients,{type="item", name="bi-adv-fertiliser", amount=1})
		end
		
	---- Add Bio Fuel & Plastic
		if BI_Config.Bio_Fuel then 
			require("prototypes.Bio_Fuel.fluid")
			require("prototypes.Bio_Fuel.recipe")
			require("prototypes.Bio_Fuel.technology")
			bobmods.lib.add_technology_recipe ("bi-advanced-biotechnology", "bi-bioreactor")
			bobmods.lib.add_technology_recipe ("bi-advanced-biotechnology", "bi-liquid-co2")
			bobmods.lib.add_technology_recipe ("bi-advanced-biotechnology", "bi-cellulose")
			bobmods.lib.add_technology_recipe ("bi-advanced-biotechnology", "bi-biomass-0")
			bobmods.lib.add_technology_recipe ("bi-advanced-biotechnology", "bi-Bio_Fuel")
			bobmods.lib.add_technology_recipe ("bi-advanced-biotechnology", "bi-Fuel_Conversion")
			bobmods.lib.add_new_recipe_item ("bi-Bio_Fuel", {type="fluid", name="NE_revitalization-solution", amount=10})
		end
		
	end


	------- DyTech Support
	if BI_Config.mod.DyTechCore then

	require("prototypes.Bio_Farm.dytech_recipe")
		
		bobmods.lib.add_technology_recipe ("bi_bio_farming", "bi-resin")
		bobmods.lib.add_technology_recipe ("bi-fertiliser", "bi-resin_Mk2")
		bobmods.lib.add_technology_recipe ("bi_bio_farming", "bi-sulfur-wood")
		bobmods.lib.add_technology_recipe ("bi-fertiliser", "bi-sulfur-wood_Mk2")

		
		--- If you're using NE Buildings, add an advanced recipe
		if BI_Config.mod.NEBuildings then
			bobmods.lib.add_technology_recipe ("bi-advanced-biotechnology", "bi-resin_Mk3")
			bobmods.lib.add_technology_recipe ("bi-advanced-biotechnology", "bi-sulfur-wood_Mk3")
			bobmods.lib.add_new_recipe_item ("bi-resin_Mk3", {type="item", name="bi-adv-fertiliser", amount=5})
			bobmods.lib.add_new_recipe_item ("bi-sulfur-wood_Mk3", {type="item", name="bi-adv-fertiliser", amount=5})

		end

	end

end



if BI_Config.Bio_Cannon then
	------- Adds a Biological Hive Buster Ammo
	if BI_Config.mod.NEEnemies then

	-- Add Bio Projectile
		require("prototypes.Bio_Cannon.bio-projectile")
		bobmods.lib.add_technology_recipe ("Bio_Cannon", "Bio_Cannon_Bio_Ammo")
		data.raw.recipe["Bio_Cannon_Bio_Ammo"].category = "crafting-with-fluid"
		bobmods.lib.remove_recipe_item ("Bio_Cannon_Bio_Ammo", "alien-artifact")
		bobmods.lib.add_new_recipe_item ("Bio_Cannon_Bio_Ammo", {type="fluid", name="NE_alien_toxin", amount=50})
		
	end

	------- Changes Hive Buster Recipe
	if BI_Config.mod.NEBuildings then

		bobmods.lib.remove_recipe_item ("Bio_Cannon", "advanced-circuit")
		bobmods.lib.remove_recipe_item ("Bio_Cannon", "steel-plate")
		bobmods.lib.add_new_recipe_item ("Bio_Cannon", {type="item", name="Building_Materials", amount=30})

	end
end


	