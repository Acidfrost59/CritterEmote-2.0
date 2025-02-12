local CritterEmote = LibStub("AceAddon-3.0"):NewAddon("CritterEmote", "AceConsole-3.0", "AceEvent-3.0")

-- Default Settings
CritterEmote.defaults = {
    profile = {
        enable = true,
        debug = false,
        categories = {
            General = true,
            Singing = true,
            PVP = false,
            Locations = false,
            Special = false,
            Silly = true
        }
    }
}

-- Create AceDB to save settings
function CritterEmote:OnInitialize()
    self.db = LibStub("AceDB-3.0"):New("CritterEmoteDB", CritterEmote.defaults, true)

    LibStub("AceConfig-3.0"):RegisterOptionsTable("CritterEmote", self:GetOptions())
    self.optionsFrame = LibStub("AceConfigDialog-3.0"):AddToBlizOptions("CritterEmote", "CritterEmote")
end

-- UI Configuration Table
function CritterEmote:GetOptions()
    local options = {
        name = "CritterEmote Settings",
        handler = CritterEmote,
        type = 'group',
        args = {
            enable = {
                type = 'toggle',
                name = "Enable",
                desc = "Enable or disable CritterEmote",
                get = function() return self.db.profile.enable end,
                set = function(_, val) self.db.profile.enable = val end,
            },
            debug = {
                type = 'toggle',
                name = "Debug Mode",
                desc = "Enable debugging output",
                get = function() return self.db.profile.debug end,
                set = function(_, val) self.db.profile.debug = val end,
            },
            categories = {
                type = "group",
                name = "Emote Categories",
                inline = true,
                args = {
                    General = {
                        type = "toggle",
                        name = "General Emotes",
                        desc = "Enable general emotes.",
                        get = function() return self.db.profile.categories.General end,
                        set = function(_, val) self.db.profile.categories.General = val end,
                    },
                    Singing = {
                        type = "toggle",
                        name = "Singing Emotes",
                        desc = "Enable singing emotes.",
                        get = function() return self.db.profile.categories.Singing end,
                        set = function(_, val) self.db.profile.categories.Singing = val end,
                    },
                    PVP = {
                        type = "toggle",
                        name = "PVP Emotes",
                        desc = "Enable PVP emotes.",
                        get = function() return self.db.profile.categories.PVP end,
                        set = function(_, val) self.db.profile.categories.PVP = val end,
                    },
                    Locations = {
                        type = "toggle",
                        name = "Location-Based Emotes",
                        desc = "Enable emotes based on locations.",
                        get = function() return self.db.profile.categories.Locations end,
                        set = function(_, val) self.db.profile.categories.Locations = val end,
                    },
                    Special = {
                        type = "toggle",
                        name = "Special Event Emotes",
                        desc = "Enable emotes for special holidays/events.",
                        get = function() return self.db.profile.categories.Special end,
                        set = function(_, val) self.db.profile.categories.Special = val end,
                    },
                    Silly = {
                        type = "toggle",
                        name = "Silly Emotes",
                        desc = "Enable silly/funny emotes.",
                        get = function() return self.db.profile.categories.Silly end,
                        set = function(_, val) self.db.profile.categories.Silly = val end,
                    },
                }
            }
        }
    }
    return options
end
