-----------------------------------
-- Area: Ru'Lude Gardens
--   NPC: Explorer Moogle
-- Type: Mog Tablet
-- @zone 243
-- !pos 1.000 -1 0.000
--
-- Auto-Script: Requires Verification (Verified by Brawndo)
-----------------------------------
package.loaded["scripts/zones/RuLude_Gardens/TextIDs"] = nil;
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:startEvent(10114);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;

