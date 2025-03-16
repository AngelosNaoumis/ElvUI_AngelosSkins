local Name, Private = ...
local E, L, V, P, G = unpack(ElvUI)
local S = E:GetModule('Skins')
local IsAddOnLoaded = _G.C_AddOns and _G.C_AddOns.IsAddOnLoaded or _G.IsAddOnLoaded

local _G = _G
local pairs = pairs

function S:LFGBulletinBoard()
	if not E.db.AngelosSkins.LFGBulletinBoard then return end
    if not IsAddOnLoaded("LFGBulletinBoard") then return end

	--skin main frame
	S:HandleFrame(_G.GroupBulletinBoardFrame)

	--skin scroll bar
	S:HandleScrollBar(_G.GroupBulletinBoardFrame_ScrollFrameScrollBar)

	--skin search bar
	S:HandleEditBox(_G.GroupBulletinBoardFrameResultsFilter)
	_G.GroupBulletinBoardFrameResultsFilter:Size(_G.GroupBulletinBoardFrameResultsFilter:GetWidth(), _G.GroupBulletinBoardFrameResultsFilter:GetHeight() + 5)

	if _G.GroupBulletinBoardFrameCloseButton then
		_G.GroupBulletinBoardFrameCloseButton:StripTextures()

		-- Apply ElvUI skinning
		S:HandleCloseButton(_G.GroupBulletinBoardFrameCloseButton)

		-- Remove the embedded texture from text
		_G.GroupBulletinBoardFrameCloseButton:SetText("")

		-- Reset font styling in case it's missing
		if _G.GroupBulletinBoardFrameCloseButton:GetFontString() then
			_G.GroupBulletinBoardFrameCloseButton:GetFontString():SetFont(E.LSM:Fetch("font", E.db.general.font), 14, "NONE")
			_G.GroupBulletinBoardFrameCloseButton:GetFontString():SetTextColor(1, 1, 1)
			_G.GroupBulletinBoardFrameCloseButton:GetFontString():SetText("X")
		end

		-- Hide any child textures
		for i = 1, _G.GroupBulletinBoardFrameCloseButton:GetNumRegions() do
			local region = select(i, _G.GroupBulletinBoardFrameCloseButton:GetRegions())
			if region and region:IsObjectType("Texture") then
				region:SetTexture(nil)
				region:Hide()
			end
		end
	end


	_G.GroupBulletinBoardFrameSettingsButton:StripTextures()
	_G.GroupBulletinBoardFrameSettingsButton:SetTemplate("Transparent")
	S:HandleButton(_G.GroupBulletinBoardFrameSettingsButton)

	_G.GroupBulletinBoardFrameRefreshButton:StripTextures()
	_G.GroupBulletinBoardFrameRefreshButton:SetTemplate("Transparent")
	S:HandleButton(_G.GroupBulletinBoardFrameRefreshButton)

	_G.GroupBulletinBoardFrameSettingsButton:ClearAllPoints()
	_G.GroupBulletinBoardFrameSettingsButton:Point('BOTTOMRIGHT', _G.GroupBulletinBoardFrameCloseButton, 'BOTTOMLEFT', -3, 0)
	_G.GroupBulletinBoardFrameRefreshButton:ClearAllPoints()
	_G.GroupBulletinBoardFrameRefreshButton:Point('BOTTOMRIGHT', _G.GroupBulletinBoardFrameSettingsButton, 'BOTTOMLEFT', -3, 0)


	--skin & position bottom tabs
	S:HandleTab(_G.GroupBulletinBoardFrameTab1)
	S:HandleTab(_G.GroupBulletinBoardFrameTab2)
	_G.GroupBulletinBoardFrameTab1:ClearAllPoints()
	_G.GroupBulletinBoardFrameTab1:Point('TOPLEFT', _G.GroupBulletinBoardFrame, 'BOTTOMLEFT', -10, -2)
	_G.GroupBulletinBoardFrameTab2:ClearAllPoints()
	_G.GroupBulletinBoardFrameTab2:Point('BOTTOMLEFT', _G.GroupBulletinBoardFrameTab1, 'BOTTOMRIGHT', -10, 0)
end

S:AddCallbackForAddon("LFGBulletinBoard")
