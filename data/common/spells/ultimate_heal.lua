local spell = Spell{
    -- Spell ID (optional, defaults to path)
    id = "ultimate_heal",
    -- Display name
    name = "UltimatHeal",

    -- Battle description
    effect = "Best\nhealing",
    -- Menu description
    description = "Heals 1 party member to the\nbest of Susie's ability.",

    -- TP cost (default tp max is 250)
    cost = 250,

    -- Target mode (party, enemy, or none/nil)
    target = "party",
}

function spell:getCastMessage(user, target)
    return "* "..user.chara.name.." cast ULTIMATEHEAL!"
end

function spell:onCast(user, target)
    target:heal(user.chara.stats.magic + 1)
end

return spell
