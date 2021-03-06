-----------------------------------
-- Area: Western Adoulin
--  NPC: Ansegusele
-- Type: Shop NPC
--  @zone 256
--  !pos 74 4 -126 256
-----------------------------------
package.loaded["scripts/zones/Western_Adoulin/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/shop");
require("scripts/zones/Western_Adoulin/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    -- Standard shop
    player:showText(npc, ANSEGUSELE_SHOP_TEXT);
    local stock =
    {
        4363, 44, -- Faerie Apple
        4388, 44, -- Eggplant
        4444, 24, -- Rarab Tail
        619, 48, -- Popoto
        4468, 80, -- Pamamas
        4389, 32, -- San D'Or. Carrot
        630, 96, -- Ogre Pumpkin
    }
    dsp.shop.general(player, stock);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
