-- penis!!! :) 

function isn_rebind_head()
	local swaptable = root.assetJson("/objects/upgrade/techconsole/isn_tech_swap_table.config")
	local tech_to_swap_out = player.equippedTech("head")
	local tech_to_swap_in = swaptable.swap_table[tech_to_swap_out]
	if tech_to_swap_in ~= nil then isn_tech_swap(tech_to_swap_out,tech_to_swap_in,0,"Head")
	else world.sendEntityMessage(pane.sourceEntity(), "isn_sound_error")
	end
end

function isn_rebind_body()
	local swaptable = root.assetJson("/objects/upgrade/techconsole/isn_tech_swap_table.config")
	local tech_to_swap_out = player.equippedTech("body")
	local tech_to_swap_in = swaptable.swap_table[tech_to_swap_out]
	if tech_to_swap_in ~= nil then isn_tech_swap(tech_to_swap_out,tech_to_swap_in,1,"Body")
	else world.sendEntityMessage(pane.sourceEntity(), "isn_sound_error")
	end
end

function isn_rebind_legs()
	local swaptable = root.assetJson("/objects/upgrade/techconsole/isn_tech_swap_table.config")
	local tech_to_swap_out = player.equippedTech("legs")
	local tech_to_swap_in = swaptable.swap_table[tech_to_swap_out]
	if tech_to_swap_in ~= nil then isn_tech_swap(tech_to_swap_out,tech_to_swap_in,2,"Legs")
	else world.sendEntityMessage(pane.sourceEntity(), "isn_sound_error")
	end
end

function isn_tech_swap(tech_switchout,tech_switchin,button,slot)
	player.unequipTech(tech_switchout)
	player.makeTechUnavailable(tech_switchout)
	player.makeTechAvailable(tech_switchin)
	player.enableTech(tech_switchin)
	player.equipTech(tech_switchin)
	world.sendEntityMessage(pane.sourceEntity(), "isn_sound_success")
	init()
	techSlotGroup(button, slot)
end
