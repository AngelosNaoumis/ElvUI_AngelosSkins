local Name, Private = ...
local E, L, V, P, G = unpack(ElvUI)
local S = E:GetModule('Skins')

local _G = _G
local pairs = pairs

function S:NovaSpellRankChecker()
	if not E.db.AngelosSkins.NovaAddons then return end

	--style Nova Spell Rank Checker button
	S:HandleButton(_G.SpellBookFrameButton)
	_G.SpellBookFrameButton:SetFrameStrata('HIGH')
	_G.SpellBookFrameButton:Width(140)
	_G.SpellBookFrameButton:Height(32)

	--handle Nova Spell Rank Checker position
	_G.SpellBookFrameButton:ClearAllPoints()
	_G.SpellBookFrameButton:Point('BOTTOMLEFT', _G.SpellBookFrame, 'BOTTOMLEFT', 25, 100)
end

function S:NovaWorldBuffs()
	if not E.db.AngelosSkins.NovaAddons then return end

	E:Delay(1, function()
		--style minimap layer frame
		_G.MinimapLayerFrame:Width(100)
		_G.MinimapLayerFrame:Height(18)
		S:HandleFrame(_G.MinimapLayerFrame)

		--handle minimap layer position
		_G.MinimapLayerFrame:ClearAllPoints()
		_G.MinimapLayerFrame:Point('BOTTOMRIGHT', _G.Minimap, 1, -20)
		_G.MinimapLayerFrame:SetMovable(false)
	end)
end

S:AddCallbackForAddon('NovaSpellRankChecker')
S:AddCallbackForAddon("NovaWorldBuffs")
