-----------------------------------
-- Area: Southern San d'Oria
--  NPC: Atelloune
-- Starts and Finishes Quest: Atelloune's Lament
-- @zone 230
-- !pos 122 0 82
-------------------------------------
package.loaded["scripts/zones/Southern_San_dOria/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/quests");
require("scripts/zones/Southern_San_dOria/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
    -- "Flyers for Regine" conditional script
    local FlyerForRegine = player:getQuestStatus(SANDORIA,FLYERS_FOR_REGINE);

    if (FlyerForRegine == 1) then
        local count = trade:getItemCount();
        local MagicFlyer = trade:hasItemQty(532,1);
        if (MagicFlyer == true and count == 1) then
            player:messageSpecial(FLYER_REFUSED);
        end
    end
    -----lady bug
    if (player:getQuestStatus(SANDORIA,ATELLOUNE_S_LAMENT) == QUEST_ACCEPTED) then
        if (trade:hasItemQty(2506,1) and trade:getItemCount() == 1) then
            player:startEvent(891);
        end
    end

end;

function onTrigger(player,npc)

    atellounesLament = player:getQuestStatus(SANDORIA,ATELLOUNE_S_LAMENT)
    sanFame = player:getFameLevel(SANDORIA);

    if (atellounesLament == QUEST_AVAILABLE and sanFame >= 2) then
        player:startEvent(890);
    elseif (atellounesLament == QUEST_ACCEPTED) then
        player:startEvent(892);
    elseif (atellounesLament == QUEST_COMPLETED) then
        player:startEvent(884); -- im profesors research
    elseif (sanFame < 2) then
        player:startEvent(884);
    end

end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)

    if (csid == 890) then
        player:addQuest(SANDORIA,ATELLOUNE_S_LAMENT);
    elseif (csid == 891) then
        if (player:getFreeSlotsCount() == 0) then
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,15008); -- Trainee Gloves
        else
            player:addItem(15008);
            player:messageSpecial(ITEM_OBTAINED,15008); -- Trainee Gloves
            player:addFame(SANDORIA,30);
            player:completeQuest(SANDORIA,ATELLOUNE_S_LAMENT);
        end
    end

end;