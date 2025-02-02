local HealItem, super = Class(Item)

function HealItem:init(o)
    -- Amount this item heals for by default
    self.heal_amount = 0

    super:init(self, o)
end

function HealItem:getHealAmount(id)
    return self.heal_amount
end

function HealItem:onWorldUse(target)
    -- TODO: World healing
    return false
end

function HealItem:onBattleUse(user, target)
    if not target then
        -- Heal all party members
        for _,battler in ipairs(Game.battle.party) do
            local amount = self:getHealAmount(battler.chara.id)
            battler:heal(amount)
        end
    elseif target:includes(PartyBattler) then
        -- Heal one party member
        local amount = self:getHealAmount(target.chara.id)
        target:heal(amount)
    elseif target:includes(EnemyBattler) then
        -- why
        local amount = self:getHealAmount()
        target:heal(amount)
    end
end

return HealItem