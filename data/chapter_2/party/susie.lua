local character = PartyMember{
    -- Party member ID (optional, defaults to path)
    id = "susie",
    -- Display name
    name = "Susie",

    -- Actor ID (handles sprites)
    actor = "susie",

    -- Title / class (saved to the save file)
    title = "LV1 Dark Knight\nDoes damage using\ndark energy.",

    -- Whether the party member can act / use spells
    has_act = false,
    has_spells = true,

    -- X-Action name (displayed in this character's spell menu)
    xact_name = "S-Action",

    -- Spells by id (saved to the save file)
    spells = {"rude_buster", "ultimate_heal"},

    -- Current health (saved to the save file)
    health = 140,

    -- Base stats (saved to the save file)
    stats = {
        health = 140,
        attack = 16,
        defense = 2,
        magic = 1
    },

    -- Weapon icon in equip menu
    weapon_icon = "ui/menu/equip/axe",

    -- Equipment (saved to the save file)
    equipped = {
        weapon = "mane_ax",
        armor = {"amber_card", "amber_card"}
    },

    -- Character color (for action box outline and hp bar)
    color = {1, 0, 1},
    -- Damage color (for the number when attacking enemies) (defaults to the main color)
    dmg_color = {0.8, 0.6, 0.8},
    -- Attack bar color (for the target bar used in attack mode) (defaults to the main color)
    attack_bar_color = {234/255, 121/255, 200/255},
    -- Attack box color (for the attack area in attack mode) (defaults to darkened main color)
    attack_box_color = {0.5, 0, 0.5},
    -- X-Action color (for the color of X-Action menu items) (defaults to the main color)
    xact_color = {1, 0.5, 1},

    -- Head icon in the equip / power menu
    menu_icon = "party/susie/head",
    -- Path to head icons used in battle
    head_icons = "party/susie/icon",
    -- Name sprite (TODO: optional)
    name_sprite = "party/susie/name",

    -- Effect shown above enemy after attacking it
    attack_sprite = "effects/attack/mash",
    -- Sound played when this character attacks
    attack_sound = "snd_laz_c",
    -- Pitch of the attack sound
    attack_pitch = 0.9,

    -- Battle position offset (optional)
    battle_offset = {3, 1},
}

function character:onAttackHit(enemy, damage)
    if damage > 0 then
        Assets.playSound("snd_impact", 0.8)
        Game.battle.shake = 4
    end
end

return character