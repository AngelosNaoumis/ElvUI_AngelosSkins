local Name, Private = ...
local E, L, V, P, G = unpack(ElvUI)
local S = E:GetModule('Skins')
local IsAddOnLoaded = _G.C_AddOns and _G.C_AddOns.IsAddOnLoaded or _G.IsAddOnLoaded

local _G = _G
local pairs = pairs

function S:Ranker()
	if not E.db.AngelosSkins.Ranker then return end
    if not IsAddOnLoaded("Ranker") then return end

	E:Delay(1, function()
		-- Skin main frame and scrollbar
		S:HandleFrame(_G.RankerMainFrame)
		S:HandleScrollBar(_G.RankerMainFrameScrollBar)

		-- Position main frame next to the Honor Frame
		_G.RankerMainFrame:ClearAllPoints()
		_G.RankerMainFrame:Point('TOPLEFT', _G.HonorFrame, 'TOPRIGHT', -31, -12)
		_G.RankerMainFrame:SetHeight(_G.HonorFrame:GetHeight() - 88)

		-- Skin outer buttons (Toggle & What-If buttons)
		S:HandleButton(_G.RankerToggleButton, nil, nil, nil, true)
		S:HandleButton(_G.RankerWhatIfButton, nil, nil, nil, true)
		_G.RankerToggleButton:ClearAllPoints()
		_G.RankerToggleButton:Point('BOTTOMRIGHT', _G.HonorFrame, 'TOPRIGHT', -32, -11)
		_G.RankerWhatIfButton:ClearAllPoints()
		_G.RankerWhatIfButton:Point('BOTTOMRIGHT', _G.RankerMainFrame, 'TOPRIGHT', 0, 1)

		-- Skin Objective dropdown
		_G.RankerObjective:StripTextures()
		_G.RankerObjective:SetTemplate('Transparent')
		S:HandleDropDownBox(_G.RankerObjective, 170)
		_G.RankerObjective:ClearAllPoints()
		_G.RankerObjective:Point('TOPLEFT', _G.RankerFrameHeading, 'BOTTOMLEFT', 2, -5)
		_G.RankerObjectiveText:ClearAllPoints()
		_G.RankerObjectiveText:Point('LEFT', _G.RankerObjective, 'LEFT', 5, 0)
		_G.RankerObjectiveText:SetJustifyH('LEFT')
		_G.RankerObjectiveButton:ClearAllPoints()
		_G.RankerObjectiveButton:Point('RIGHT', _G.RankerObjective, 'RIGHT', 0, 0)

		-- Skin Limit dropdown
		_G.RankerLimit:StripTextures()
		_G.RankerLimit:SetTemplate('Transparent')
		S:HandleDropDownBox(_G.RankerLimit, 170)
		_G.RankerLimit:ClearAllPoints()
		_G.RankerLimit:Point('TOPRIGHT', _G.RankerFrameHeading, 'BOTTOMRIGHT', -5, -5)
		_G.RankerLimitText:ClearAllPoints()
		_G.RankerLimitText:Point('LEFT', _G.RankerLimit, 'LEFT', 5, 0)
		_G.RankerLimitText:SetJustifyH('LEFT')
		_G.RankerLimitButton:ClearAllPoints()
		_G.RankerLimitButton:Point('RIGHT', _G.RankerLimit, 'RIGHT', 0, 0)

		-- Skin Objective Max Rank dropdown
		_G.RankerObjectiveMaxRank:StripTextures()
		_G.RankerObjectiveMaxRank:SetTemplate('Transparent')
		S:HandleDropDownBox(_G.RankerObjectiveMaxRank, 170)
		_G.RankerObjectiveMaxRank:ClearAllPoints()
		_G.RankerObjectiveMaxRank:Point('TOPLEFT', _G.RankerFrameHeading, 'BOTTOMLEFT', 2, -5)
		_G.RankerObjectiveMaxRankText:ClearAllPoints()
		_G.RankerObjectiveMaxRankText:Point('LEFT', _G.RankerObjectiveMaxRank, 'LEFT', 5, 0)
		_G.RankerObjectiveMaxRankText:SetJustifyH('LEFT')
		_G.RankerObjectiveMaxRankButton:ClearAllPoints()
		_G.RankerObjectiveMaxRankButton:Point('RIGHT', _G.RankerObjectiveMaxRank, 'RIGHT', 0, 0)

		-- Skin Limit Max Rank dropdown
		_G.RankerLimitMaxRank:StripTextures()
		_G.RankerLimitMaxRank:SetTemplate('Transparent')
		S:HandleDropDownBox(_G.RankerLimitMaxRank, 170)
		_G.RankerLimitMaxRank:ClearAllPoints()
		_G.RankerLimitMaxRank:Point('TOPRIGHT', _G.RankerFrameHeading, 'BOTTOMRIGHT', -5, -5)
		_G.RankerLimitMaxRankText:ClearAllPoints()
		_G.RankerLimitMaxRankText:Point('LEFT', _G.RankerLimitMaxRank, 'LEFT', 5, 0)
		_G.RankerLimitMaxRankText:SetJustifyH('LEFT')
		_G.RankerLimitMaxRankButton:ClearAllPoints()
		_G.RankerLimitMaxRankButton:Point('RIGHT', _G.RankerLimitMaxRank, 'RIGHT', 0, 0)

		-- Skin What-If Rank List dropdown
		_G.RankerWhatIfRankList:StripTextures()
		_G.RankerWhatIfRankList:SetTemplate('Transparent')
		S:HandleDropDownBox(_G.RankerWhatIfRankList, 70, true)
		_G.RankerWhatIfRankList:SetPoint("TOPLEFT", 104, 0)
		_G.RankerWhatIfRankList:SetHeight(_G.RankerWhatIfRankList:GetHeight() - 8)
		_G.RankerWhatIfRankList.SetHeight = function() end -- Prevent height reset
		_G.RankerWhatIfRankListText:ClearAllPoints()
		_G.RankerWhatIfRankListText:Point('LEFT', _G.RankerWhatIfRankList, 'LEFT', 5, 0)
		_G.RankerWhatIfRankListText:SetJustifyH('LEFT')
		_G.RankerWhatIfRankListButton:ClearAllPoints()
		_G.RankerWhatIfRankListButton:Point('RIGHT', _G.RankerWhatIfRankList, 'RIGHT', 0, 0)
		_G.RankerWhatIfRankListButton:SetHeight(_G.RankerWhatIfRankListButton:GetHeight() - 8)

		-- Adjust positioning of extra elements
		_G.RankerFrameHeadingAnd:SetPoint("TOPLEFT", _G.RankerWhatIfRankListButton, "TOPRIGHT", -10, -2)
		_G.RankerWhatIfRankProgressBox:SetPoint("TOPLEFT", _G.RankerWhatIfRankListButton, "TOPRIGHT", 24, 4)

		-- Skin What-If Rank Progress Box
		S:HandleEditBox(_G.RankerWhatIfRankProgressBox)
	end)
end

S:AddCallbackForAddon("Ranker")
