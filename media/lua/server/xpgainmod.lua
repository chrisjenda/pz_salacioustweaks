function superxpgain(f_Player, _perk, _amount)

	-- We only want to modify XP Gained so return if loss
	if _amount <= 0 then
		 return
	end
	if (not f_Player) then
		 return
	end

  -- Get our Sandbox Var
	local xpmod = SandboxVars.SalaciousTweaks.XPmulti;

  -- Explicit
	if _perk == Perks.Strength or _perk == Perks.Fitness then

			-- Multiply the Ammount
			xpmod = _amount * xpmod;

			-- Minus the original ammount to not get double
			xpmod = xpmod - _amount;

			-- Final check that ammount is valid
			if xpmod > 0 then
				-- Give new XP to the player
				f_Player:getXp():AddXP(_perk, xpmod, false, false, true);
			end
	end
end

Events.AddXP.Add(superxpgain);
