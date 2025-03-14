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

		S:HandleDropDown(_G["AtlasLoot-DropDown-1"])
		S:HandleDropDown(_G["AtlasLoot-DropDown-2"])

		S:HandleNextPrevButton(_G["AtlasLoot_GUI-ItemFrame-nextPageButton"])
		S:HandleNextPrevButton(_G["AtlasLoot_GUI-ItemFrame-prevPageButton"])

		-- Adjust Sizes
		_G["AtlasLoot_GUI-ItemFrame-SearchBox"]:SetHeigth(_G["AtlasLoot_GUI-ItemFrame-SearchBox"]:GetHeigth-14)

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
	end

	S:SecureHookScript(_G["AtlasLoot_GUI-Frame"], "OnShow", SkinOnFrameShow)
end

S:AddCallbackForAddon("AtlasLootClassic")
