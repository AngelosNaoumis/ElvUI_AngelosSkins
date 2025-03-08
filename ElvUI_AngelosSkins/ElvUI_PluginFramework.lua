--[[
	This is a framework showing how to create a plugin for ElvUI.
	It creates some default options and inserts a GUI table to the ElvUI Config.
	If you have questions then ask in the Tukui lua section: https://www.tukui.org/forum/viewforum.php?f=10
]]

local E, L, V, P, G = unpack(ElvUI); --Import: Engine, Locales, PrivateDB, ProfileDB, GlobalDB
local MyPlugin = E:NewModule('AngelosSkins', 'AceHook-3.0', 'AceEvent-3.0', 'AceTimer-3.0'); --Create a plugin within ElvUI and adopt AceHook-3.0, AceEvent-3.0 and AceTimer-3.0. We can make use of these later.
local EP = LibStub("LibElvUIPlugin-1.0") --We can use this to automatically insert our GUI tables when ElvUI_Config is loaded.
local addonName, addonTable = ... --See http://www.wowinterface.com/forums/showthread.php?t=51502&p=304704&postcount=2

--Default options
P["AngelosSkins"] = {
	["Atlas"] = true,
	["AtlasLoot"] = true,
	["LFGBulletinBoard"] = true,
	["NovaAddons"] = true,
	["OpenAll"] = true,
	["Ranker"] = true,
	["Spy"] = true,
	["WhatsTraining"] = true,
	["Leatrix_Plus"] = true,
	["RXPGuidesAH"] = true,
	["SimpleAddonManager"] = true,
}

--This function inserts our GUI table into the ElvUI Config. You can read about AceConfig here: http://www.wowace.com/addons/ace3/pages/ace-config-3-0-options-tables/
function MyPlugin:InsertOptions()
	E.Options.args.AngelosSkins = {
		order = 100,
		type = "group",
		name = "ElvUI AngelosSkins",
		args = {
			Atlas = {
				order = 1,
				type = "toggle",
				name = "Atlas",
				get = function(info)
					return E.db.AngelosSkins.Atlas
				end,
				set = function(info, value)
					E.db.AngelosSkins.Atlas = value
					E:StaticPopup_Show('CONFIG_RL')
				end,
			},
			AtlasLoot = {
				order = 2,
				type = "toggle",
				name = "AtlasLoot",
				get = function(info)
					return E.db.AngelosSkins.AtlasLoot
				end,
				set = function(info, value)
					E.db.AngelosSkins.AtlasLoot = value
					E:StaticPopup_Show('CONFIG_RL')
				end,
			},
			LFGBulletinBoard = {
				order = 3,
				type = "toggle",
				name = "LFGBulletinBoard",
				get = function(info)
					return E.db.AngelosSkins.LFGBulletinBoard
				end,
				set = function(info, value)
					E.db.AngelosSkins.LFGBulletinBoard = value
					E:StaticPopup_Show('CONFIG_RL')
				end,
			},
			NovaAddons = {
				order = 4,
				type = "toggle",
				name = "NovaAddons",
				get = function(info)
					return E.db.AngelosSkins.NovaAddons
				end,
				set = function(info, value)
					E.db.AngelosSkins.NovaAddons = value
					E:StaticPopup_Show('CONFIG_RL')
				end,
			},
			OpenAll = {
				order = 5,
				type = "toggle",
				name = "OpenAll",
				get = function(info)
					return E.db.AngelosSkins.OpenAll
				end,
				set = function(info, value)
					E.db.AngelosSkins.OpenAll = value
					E:StaticPopup_Show('CONFIG_RL')
				end,
			},
			Ranker = {
				order = 6,
				type = "toggle",
				name = "Ranker",
				get = function(info)
					return E.db.AngelosSkins.Ranker
				end,
				set = function(info, value)
					E.db.AngelosSkins.Ranker = value
					E:StaticPopup_Show('CONFIG_RL')
				end,
			},
			Spy = {
				order = 7,
				type = "toggle",
				name = "Spy",
				get = function(info)
					return E.db.AngelosSkins.Spy
				end,
				set = function(info, value)
					E.db.AngelosSkins.Spy = value
					E:StaticPopup_Show('CONFIG_RL')
				end,
			},
			WhatsTraining = {
				order = 8,
				type = "toggle",
				name = "WhatsTraining",
				get = function(info)
					return E.db.AngelosSkins.WhatsTraining
				end,
				set = function(info, value)
					E.db.AngelosSkins.WhatsTraining = value
					E:StaticPopup_Show('CONFIG_RL')
				end,
			},
			Leatrix_Plus = {
				order = 9,
				type = "toggle",
				name = "Leatrix_Plus",
				get = function(info)
					return E.db.AngelosSkins.Leatrix_Plus
				end,
				set = function(info, value)
					E.db.AngelosSkins.Leatrix_Plus = value
					E:StaticPopup_Show('CONFIG_RL')
				end,
			},
			RXPGuidesAH = {
				order = 10,
				type = "toggle",
				name = "RXPGuidesAH",
				get = function(info)
					return E.db.AngelosSkins.RXPGuidesAH
				end,
				set = function(info, value)
					E.db.AngelosSkins.RXPGuidesAH = value
					E:StaticPopup_Show('CONFIG_RL')
				end,
			},
			SimpleAddonManager = {
				order = 11,
				type = "toggle",
				name = "SimpleAddonManager",
				get = function(info)
					return E.db.AngelosSkins.SimpleAddonManager
				end,
				set = function(info, value)
					E.db.AngelosSkins.SimpleAddonManager = value
					E:StaticPopup_Show('CONFIG_RL')
				end,
			},
		},
	}
end

function MyPlugin:Initialize()
	--Register plugin so options are properly inserted when config is loaded
	EP:RegisterPlugin(addonName, MyPlugin.InsertOptions)
end

E:RegisterModule(MyPlugin:GetName()) --Register the module with ElvUI. ElvUI will now call MyPlugin:Initialize() when ElvUI is ready to load our plugin.
