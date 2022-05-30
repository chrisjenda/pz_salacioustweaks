
noshoes = {};
--local psquare = getPlayer():getSquare():getFloor():getTextureName();print(psquare);
-- used everytime the player move

noshoes.onPlayerMove = function(f_Player)
  local psquare = f_Player:getSquare():getFloor():getTextureName();
  if not f_Player:getWornItem("Shoes") then
      if string.find(psquare,"wood") then
          noshoes_saytext_wood(f_Player);
      elseif string.find(psquare,"exterior") or string.find(psquare,"street") then
          noshoes_saytext_exterior(f_Player);
      end
  end
end

function noshoes_saytext_wood(player)
  local txtRandom = ZombRand(10);
  if txtRandom == 0 then
      player:Say(getText("I need some shoes!"));
  elseif txtRandom == 1 then
      player:Say(getText("This floor is hard!"));
  elseif txtRandom == 2 then
      player:Say(getText("Oooh, I might get a splinter in my foot!"));
  end
end

function noshoes_saytext_exterior(player)
  local txtRandom = ZombRand(10);
  if txtRandom == 0 then
      player:Say(getText("I need some shoes if I am outside!"));
  elseif txtRandom == 1 then
      player:Say(getText("The ground hurts my feet!"));
  elseif txtRandom == 2 then
      player:Say(getText("Ooow I stepped on a rock!"));
  end
end

--Events.EveryTenMinutes.Add(noshoes.everyTenMinutes);
--Events.OnPlayerMove.Add(noshoes.onPlayerMove);
Events.AddXP.Add(noshoes.onPlayerMove);
