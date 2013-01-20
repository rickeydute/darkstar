-----------------------------------------
--  Spell: Poison
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell)
    local effect = EFFECT_POISON;
    local duration = 180;

    pINT = caster:getStat(MOD_INT);
    mINT = target:getStat(MOD_INT);

    dINT = (pINT - mINT);
    power = caster:getSkillLevel(ENFEEBLING_MAGIC_SKILL) / 15 + 1;
    if power > 25 then
        power = 25;
    end

    if(math.random(0,100) >= target:getMod(MOD_POISONRES)) then
        bonus = AffinityBonus(caster, spell);
        resist = applyResistance(caster,spell,target,dINT,ENFEEBLING_MAGIC_SKILL,bonus);
        if(resist == 1 or resist == 0.5) then -- effect taken
            duration = duration / resist;

            -- Try to erase a weaker poison.
            poison = target:getStatusEffect(effect)
            if(poison ~= nil) then
                if(poison:getPower() < power) then
                    -- remove weaker poison
                    target:delStatusEffect(effect);
                    target:addStatusEffect(effect,power,3,duration);
                    spell:setMsg(267);
                else
                    -- no effect
                    spell:setMsg(75);
                end
            else
                target:addStatusEffect(effect,power,3,duration);
                spell:setMsg(267);
            end

        else -- resist entirely.
                spell:setMsg(85);
        end
    else
        spell:setMsg(284);
    end
    return effect;
end;