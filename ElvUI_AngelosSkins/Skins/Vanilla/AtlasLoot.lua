local Name, Private = ...
local E, L, V, P, G = unpack(ElvUI)
local S = E:GetModule('Skins')

local _G = _G
local pairs = pairs

local function AtlasLoot()
	if not E.db.AngelosSkins.AtlasLoot then return end

    local ATL = _G["AtlasLoot_GUI-Frame"]
    if not ATL or ATL.IsSkinned then return end
    ATL.IsSkinned = true -- Prevent double skinning

    -- Skin main frame & scrollbar
    S:HandleFrame(ATL)
end

local function OnEvent(self, event, addon)
    if event == "ADDON_LOADED" and addon == "SimpleAddonManager" then
        local ATL = _G["AtlasLoot_GUI-Frame"]
        if ATL then
            if ATL:IsShown() then
                AtlasLoot() -- Skin immediately if already visible
            else
                ATL:HookScript("OnShow", AtlasLoot)
            end
        end
    end
end

local frame = CreateFrame("Frame")
frame:RegisterEvent("ADDON_LOADED")
frame:SetScript("OnEvent", OnEvent)
