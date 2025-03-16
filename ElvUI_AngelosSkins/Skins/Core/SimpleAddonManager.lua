local Name, Private = ...
local E, L, V, P, G = unpack(ElvUI)
local S = E:GetModule('Skins')

local _G = _G
local pairs = pairs

local function SkinSimpleAddonManager()
    if not E.db.AngelosSkins.SimpleAddonManager and not IsAddOnLoaded("SkinSimpleAddonManager") then return end

    local SAM = _G.SimpleAddonManager
    if not SAM or SAM.IsSkinned then return end
    SAM.IsSkinned = true -- Prevent double skinning

    -- Skin main frame & scrollbar
    S:HandleFrame(SAM)
    S:HandleScrollBar(SAM.AddonListFrame.ScrollFrame.ScrollBar)

    -- Buttons to skin
    local buttons = {
        SAM.EnableAllButton, SAM.DisableAllButton, SAM.OkButton, SAM.CancelButton,
        SAM.SetsButton, SAM.ConfigButton, SAM.CategoryButton
    }
    for _, button in pairs(buttons) do
        S:HandleButton(button)
    end
    SAM.SetsButton:SetHeight(SAM.SetsButton:GetHeight() + 6)
    SAM.SetsButton:ClearAllPoints()
    SAM.SetsButton:SetPoint("TOPLEFT", _G.SAM_CharacterDropDown, "TOPRIGHT", 4, -2)

    -- Edit box
    S:HandleEditBox(SAM.SearchBox)
    SAM.SearchBox:SetHeight(SAM.SearchBox:GetHeight() + 8)
    SAM.SearchBox:ClearAllPoints()
    SAM.SearchBox:SetPoint("TOPLEFT", SAM.SetsButton, "TOPRIGHT", 6, 0)

    -- Adjust button positions
    SAM.OkButton:ClearAllPoints()
    SAM.OkButton:SetPoint("RIGHT", SAM.CancelButton, "LEFT", -2, 0)
    SAM.DisableAllButton:ClearAllPoints()
    SAM.DisableAllButton:SetPoint("LEFT", SAM.EnableAllButton, "RIGHT", 2, 0)

    -- Category frame elements
    S:HandleScrollBar(SAM.CategoryFrame.ScrollFrame.ScrollBar)

    local categoryButtons = {
        SAM.CategoryFrame.NewButton, SAM.CategoryFrame.SelectAllButton, SAM.CategoryFrame.ClearSelectionButton
    }
    for _, button in pairs(categoryButtons) do
        S:HandleButton(button)
    end

    -- Adjust category button positions
    SAM.CategoryFrame.NewButton:SetPoint("BOTTOMLEFT", SAM.CategoryFrame.SelectAllButton, "TOPLEFT", 0, 2)
    SAM.CategoryFrame.NewButton:SetPoint("BOTTOMRIGHT", SAM.CategoryFrame.ClearSelectionButton, "TOPRIGHT", 0, 2)

    -- Dropdown box
    S:HandleDropDownBox(_G.SAM_CharacterDropDown)
    _G.SAM_CharacterDropDown:SetPoint("TOPLEFT", 5, -20)
    _G.SAM_CharacterDropDown:SetWidth(_G.SAM_CharacterDropDown:GetWidth() - 10)

    -- Skin ElioteDropDownMenu dropdowns
    local edd = _G.LibStub("ElioteDropDownMenu-1.0", true)
    if edd then
		hooksecurefunc(edd, "UIDropDownMenu_CreateFrames", function(level)
			local dropdown = _G["ElioteDDM_DropDownList" .. level]
			if dropdown then
				local backdrop = _G[dropdown:GetName() .. "Backdrop"]
				local menuBackdrop = _G[dropdown:GetName() .. "MenuBackdrop"]
				if backdrop then backdrop:SetTemplate("Transparent") end
				if menuBackdrop then menuBackdrop:SetTemplate("Transparent") end
			end
		end)
    end
end

local function OnEvent(self, event, addon)
    if event == "ADDON_LOADED" and addon == "SimpleAddonManager" then
        local SAM = _G.SimpleAddonManager
        if SAM then
            if SAM:IsShown() then
                SkinSimpleAddonManager() -- Skin immediately if already visible
            else
                SAM:HookScript("OnShow", SkinSimpleAddonManager)
            end
        end
    end
end

local frame = CreateFrame("Frame")
frame:RegisterEvent("ADDON_LOADED")
frame:SetScript("OnEvent", OnEvent)
