-----------------------------------
-- Area: King Ranperres Tomb
--  MOB: Goblin Gambler
-----------------------------------
require("scripts/globals/groundsofvalor");
-----------------------------------

function onMobInitialize(mob)
end;

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,631,2);
    checkGoVregime(player,mob,635,3);
end;