local Name, Private = ...
local E, L, V, P, G = unpack(ElvUI)
local S = E:GetModule('Skins')

local _G = _G
local pairs = pairs

function S:WhatsTraining()
	if not E.db.AngelosSkins.WhatsTraining then return end

	E:Delay(1, function()
		--main frame
		S:HandleFrame(_G.WhatsTrainingFrame, true, true, 11, -50, -32, 76)

		--position main frame
		_G.WhatsTrainingFrame:Point('TOPLEFT', _G.SpellBookFrame, 'TOPLEFT', 0, 38)

		--scroll bar
		S:HandleScrollBar(_G.WhatsTrainingFrameScrollBarScrollBar)

		--position search box
		S:HandleEditBox(_G.WhatsTrainingFrameSearchBox)
		_G.WhatsTrainingFrameSearchBox:Size(_G.WhatsTrainingFrameSearchBox:GetWidth() - 8, _G.WhatsTrainingFrameSearchBox:GetHeight() - 10)
		_G.WhatsTrainingFrameSearchBox:ClearAllPoints()
		WhatsTrainingFrameSearchBox:Point('TOPLEFT', _G.SpellBookFrame, 'TOPLEFT', 20, -18)

		--raise strata of close button
		SpellBookCloseButton:SetFrameStrata('HIGH')
	end)
end

S:AddCallbackForAddon("WhatsTraining")
