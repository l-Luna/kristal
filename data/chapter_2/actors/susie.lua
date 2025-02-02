return {
    name = "Susie",
    id = "susie",

    width = 25,
    height = 43,

    hitbox = {3, 30, 19, 14},

    color = {1, 0, 1},

    path = "party/susie",
    default = "world/dark",

    text_sound = "susie",
    portrait_path = "face/susie",
    portrait_offset = {-5, 0},

    animations = {
        ["battle/idle"]         = {"battle/dark/idle", 0.2, true},

        ["battle/attack"]       = {"battle/dark/attack", 1/15, false},
        ["battle/act"]          = {"battle/dark/act", 1/15, false},
        ["battle/spell"]        = {"battle/dark/spell", 1/15, false, next="battle/idle"},
        ["battle/item"]         = {"battle/dark/item", 1/12, false, next="battle/idle"},
        ["battle/spare"]        = {"battle/dark/act", 1/15, false, next="battle/idle"},

        ["battle/attack_ready"] = {"battle/dark/attackready", 0.2, true},
        ["battle/act_ready"]    = {"battle/dark/actready", 0.2, true},
        ["battle/spell_ready"]  = {"battle/dark/spellready", 0.2, true},
        ["battle/item_ready"]   = {"battle/dark/itemready", 0.2, true},
        ["battle/defend_ready"] = {"battle/dark/defend", 1/15, false},

        ["battle/act_end"]      = {"battle/dark/actend", 1/15, false, next="battle/idle"},

        ["battle/hurt"]         = {"battle/dark/hurt", 1/15, false, temp=true, duration=0.5},
        ["battle/defeat"]       = {"battle/dark/defeat", 1/15, false},

        ["battle/transition"]   = {"world/dark/right_1", 1/15, false},
        ["battle/intro"]        = {"battle/dark/attack", 1/15, true},
        ["battle/victory"]      = {"battle/dark/victory", 1/10, false},

        ["battle/rude_buster"]  = {"battle/dark/rude_buster", 1/15, false, next="battle/idle"}
    },

    offsets = {
        ["world/dark/down"] = {0, 2},
        ["world/dark/left"] = {0, 2},
        ["world/dark/right"] = {0, 2},
        ["world/dark/up"] = {0, 2},

        ["world/dark/shock_r"] = {13, 1},

        ["battle/dark/idle"] = {22, 1},

        ["battle/dark/attack"] = {26, 25},
        ["battle/dark/attackready"] = {26, 25},
        ["battle/dark/act"] = {26, 25},
        ["battle/dark/actend"] = {26, 25},
        ["battle/dark/actready"] = {26, 25},
        ["battle/dark/spell"] = {22, 30},
        ["battle/dark/spellready"] = {22, 15},
        ["battle/dark/item"] = {22, 1},
        ["battle/dark/itemready"] = {22, 1},
        ["battle/dark/defend"] = {20, 23},

        ["battle/dark/defeat"] = {22, 1},
        ["battle/dark/hurt"] = {22, 1},

        ["battle/dark/victory"] = {28, 7},

        ["battle/dark/rudebuster"] = {44, 33}
    },
}