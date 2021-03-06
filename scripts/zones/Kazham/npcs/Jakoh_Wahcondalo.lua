-----------------------------------
-- Area: Kazham (250)
-- NPC: Jakoh Wahcondalo
-- !pos 101 -16 -115 250
-- Starts Quests: A Question of Taste, Cloak and Dagger, Everyone's Grudging
-- Inovlved in Missions: ZM3 Kazham's Chieftainess, WM7-2 Awakening of the Gods
-- Involved in Quests: Tuning Out
-----------------------------------
package.loaded["scripts/zones/Kazham/TextIDs"] = nil
-----------------------------------
require("scripts/globals/missions")
require("scripts/globals/wsquest")
require("scripts/zones/Kazham/TextIDs")

local wsQuest = dsp.wsquest.evisceration

function onTrade(player,npc,trade)
    local wsQuestEvent = dsp.wsquest.getTradeEvent(wsQuest,player,trade)

    if (wsQuestEvent ~= nil) then
        player:startEvent(wsQuestEvent)
    end
end

function onTrigger(player,npc)
    local wsQuestEvent = dsp.wsquest.getTriggerEvent(wsQuest,player)

    if (wsQuestEvent ~= nil) then
        player:startEvent(wsQuestEvent)
    elseif (player:getCurrentMission(ZILART) == KAZAMS_CHIEFTAINESS) then
        player:startEvent(114)
    elseif (player:getCurrentMission(ZILART) == THE_TEMPLE_OF_UGGALEPIH) then
        player:startEvent(115)
    elseif (player:getCurrentMission(WINDURST) == AWAKENING_OF_THE_GODS and player:getVar("MissionStatus") == 2) then
        player:startEvent(265)
    else
        player:startEvent(113)
    end

end

function onEventFinish(player,csid,option)
    if (csid == 114) then
        player:addKeyItem(dsp.ki.SACRIFICIAL_CHAMBER_KEY)
        player:messageSpecial(KEYITEM_OBTAINED,dsp.ki.SACRIFICIAL_CHAMBER_KEY)
        player:completeMission(ZILART,KAZAMS_CHIEFTAINESS)
        player:addMission(ZILART,THE_TEMPLE_OF_UGGALEPIH)
    elseif (csid == 265) then
        player:setVar("MissionStatus",3)
    else
        dsp.wsquest.handleEventFinish(wsQuest,player,csid,option,EVISCERATION_LEARNED)
    end

end
