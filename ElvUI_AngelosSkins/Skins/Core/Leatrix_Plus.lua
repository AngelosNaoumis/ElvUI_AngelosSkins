local Name, Private = ...
local E, L, V, P, G = unpack(ElvUI)
local S = E:GetModule('Skins')

local _G = _G
local pairs = pairs

function S:Leatrix_Plus()
	if not E.db.AngelosSkins.Leatrix_Plus then return end

	E:Delay(1, function()
		--style Cloak and Helm checkboxes
		if _G.LeaPlusDB["ShowVanityControls"] == "On" then
			for _, checkbox in pairs({ PaperDollFrame:GetChildren() }) do
				if checkbox:IsObjectType('CheckButton') and not checkbox.isSkinned then
					S:HandleCheckBox(checkbox)
				end
			end
		end
    end)
end

function S:Blizzard_TrainerUI()
	if not E.db.AngelosSkins.Leatrix_Plus then return end

	--style trainner enhancer
	if _G.LeaPlusDB["EnhanceTrainers"] == "On" and _G.LeaPlusDB["ShowTrainAllBtn"] == "On" then
		-- Position and add border to train all button
		_G.LeaPlusGlobalTrainAllButton:ClearAllPoints()
		_G.LeaPlusGlobalTrainAllButton:SetPoint("RIGHT", _G.ClassTrainerTrainButton, "LEFT", -7, 0)
	end
end

S:AddCallbackForAddon('Blizzard_TrainerUI')
S:AddCallbackForAddon("Leatrix_Plus")
