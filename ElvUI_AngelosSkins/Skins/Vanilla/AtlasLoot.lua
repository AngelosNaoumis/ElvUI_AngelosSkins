local Name, Private = ...
local E, L, V, P, G = unpack(ElvUI)
local S = E:GetModule('Skins')

local _G = _G

function S:AtlasLootClassic()
	if not E.db.AngelosSkins.AtlasLoot then return end

	local function SkinOnFrameShow()

		S:HandleFrame(_G["AtlasLoot_GUI-Frame"])
		S:HandleFrame(_G["AtlasLoot-Select-1"])
		S:HandleFrame(_G["AtlasLoot-Select-2"])
		S:HandleFrame(_G["AtlasLoot-Select-3"])
		S:HandleFrame(_G["AtlasLoot_GUI-Frame"].titleFrame)

		S:HandleEditBox(_G["AtlasLoot_GUI-ItemFrame-SearchBox"])

		S:HandleButton(_G["AtlasLoot-Button-1"])
		S:HandleButton(_G["AtlasLoot-Button-2"])
		S:HandleButton(_G["AtlasLoot-Button-3"])
		
		S:HandleDropDownBox(_G["AtlasLoot-DropDown-1"],200)
		S:HandleDropDownBox(_G["AtlasLoot-DropDown-2"],200)

		S:HandleNextPrevButton(_G["AtlasLoot_GUI-ItemFrame-nextPageButton"])
		S:HandleNextPrevButton(_G["AtlasLoot_GUI-ItemFrame-prevPageButton"])

		-- Adjust Sizes
		_G["AtlasLoot_GUI-ItemFrame-SearchBox"]:SetHeight(_G["AtlasLoot_GUI-ItemFrame-SearchBox"]:GetHeight() - 14)

		-- Additional Things
		-- Stip Dropdown Game Buttons
		_G["AtlasLoot-DropDown-1-button"]:StripTextures()
		_G["AtlasLoot-DropDown-1-button"]:SetTemplate('Transparent')
		_G["AtlasLoot-DropDown-1-button"]:SetBackdrop(nil)
		_G["AtlasLoot-DropDown-2-button"]:StripTextures()
		_G["AtlasLoot-DropDown-2-button"]:SetTemplate('Transparent')
		_G["AtlasLoot-DropDown-2-button"]:SetBackdrop(nil)

		-- GameVersionButton/Logo
		S:HandleButton(_G["AtlasLoot_GUI-Frame-gameVersionButton"])
		_G["AtlasLoot_GUI-Frame-gameVersionButton"]:SetBackdrop(nil)
		local transparentTexture = _G["AtlasLoot_GUI-Frame-gameVersionButton"]:CreateTexture(nil, "ARTWORK")
		transparentTexture:SetAlpha(0)  -- Set the texture to be fully transparent

		_G["AtlasLoot_GUI-Frame-gameVersionButton"]:SetHighlightTexture(transparentTexture)
		_G["AtlasLoot_GUI-Frame-gameVersionButton"]:SetNormalTexture(538639)
		_G["AtlasLoot_GUI-Frame-gameVersionButton"]:SetPushedTexture(538639)
		_G["AtlasLoot_GUI-Frame-gameVersionLogo"]:Hide()  -- Hide the texture

		-- Clear Extra lines on GameVersionButton
		if _G["AtlasLoot_GUI-Frame"].gameVersionButton.Box then
			for i, line in ipairs(_G["AtlasLoot_GUI-Frame"].gameVersionButton.Box) do
				line:ClearAllPoints()  -- Remove any points the lines have
				line:SetParent(nil)    -- Remove lines from their parent
			end
			_G["AtlasLoot_GUI-Frame"].gameVersionButton.Box = {}  -- Clear the Box table
		end

		-- Add backdrop to item frame
		_G["AtlasLoot_GUI-ItemFrame"]:CreateBackdrop()

		S:Unhook(_G["AtlasLoot_GUI-Frame"], "OnShow")

		local function SkinAtlasLootCatFrames()
			if _G["AtlasLoot-DropDown-CatFrame1"] then
				S:HandleFrame(_G["AtlasLoot-DropDown-CatFrame1"])
			end
			if _G["AtlasLoot-DropDown-CatFrame2"] then
				S:HandleFrame(_G["AtlasLoot-DropDown-CatFrame2"])
			end
			if _G["AtlasLoot-DropDown-CatFrame3"] then
				S:HandleFrame(_G["AtlasLoot-DropDown-CatFrame3"])
			end
			if _G["AtlasLoot-DropDown-CatFrame4"] then
				S:HandleFrame(_G["AtlasLoot-DropDown-CatFrame4"])
			end
		end

		S:SecureHookScript(_G["AtlasLoot-DropDown-1"], "OnClick", SkinAtlasLootCatFrames)
		S:SecureHookScript(_G["AtlasLoot-DropDown-2"], "OnClick", SkinAtlasLootCatFrames)
		S:SecureHookScript(_G["AtlasLoot-DropDown-1-button"], "OnClick", SkinAtlasLootCatFrames)
		S:SecureHookScript(_G["AtlasLoot-DropDown-2-button"], "OnClick", SkinAtlasLootCatFrames)

		local function SkinSelectionFrame()
			if _G["AtlasLoot_GUI-ItemFrame-clasFilterButton"].selectionFrame then
				S:HandleFrame(_G["AtlasLoot_GUI-ItemFrame-clasFilterButton"].selectionFrame)
			end
		end

		S:SecureHookScript(_G["AtlasLoot_GUI-ItemFrame-clasFilterButton"], "OnClick", SkinSelectionFrame)

	end

	S:SecureHookScript(_G["AtlasLoot_GUI-Frame"], "OnShow", SkinOnFrameShow)
end

S:AddCallbackForAddon("AtlasLootClassic")
