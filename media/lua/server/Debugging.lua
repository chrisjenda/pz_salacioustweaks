SalaciousTweaks.tickRate = 120;
SalaciousTweaks.currentTick = 0;

SalaciousTweaks.onPlayerUpdate_Debug = function(_player)
  -- Only check player ever so often
  if SalaciousTweaks.currentTick > SalaciousTweaks.tickRate - 1 then
    SalaciousTweaks.currentTick = 0
    return;
  end
  SalaciousTweaks.currentTick = SalaciousTweaks.currentTick + 1

  --Check player is valid
  if _player:isDeadOrNotExist() or not _player:isInitialized() then
      return false;
  end
  --Check player health

end














--Events.OnPlayerUpdate.Add(functionName)
