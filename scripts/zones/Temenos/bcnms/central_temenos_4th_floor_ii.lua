-----------------------------------
-- Area: Temenos
-- Name:
require("scripts/globals/battlefield")
-----------------------------------



function onBattlefieldTick(battlefield, tick)
    g_Battlefield.onBattlefieldTick(battlefield, tick)
end

-- After registering the BCNM via bcnmRegister(bcnmid)
function onBattlefieldRegister(player,battlefield)
end;

-- Physically entering the BCNM via bcnmEnter(bcnmid)
function onBattlefieldEnter(player,battlefield)
end;

-- Leaving by every mean possible, given by the LeaveCode
-- 3=Disconnected or warped out (if dyna is empty: launch 4 after 3)
-- 4=Finish he dynamis

function onBattlefieldLeave(player,battlefield,leavecode)
--print("leave code "..leavecode);

    if leavecode == 2 then
        local name, clearTime, partySize = battlefield:getRecord()
     --    player:setPos(0,0,0,0,0x00);
    end
    if (leavecode == 4) then
    end
end;