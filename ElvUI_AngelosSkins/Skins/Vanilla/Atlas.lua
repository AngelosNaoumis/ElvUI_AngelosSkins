local Name, Private = ...
local E, L, V, P, G = unpack(ElvUI)
local S = E:GetModule('Skins')

local _G = _G

function S:Atlas()

	if not E.db.AngelosSkins.Atlas then return end

    E:Delay(1, function()
        local AtlasFrame = _G.AtlasFrame
        local AtlasFrameSmall = _G.AtlasFrameSmall

        -- Skin main frames
        S:HandleFrame(AtlasFrame)
        S:HandleFrame(AtlasFrameSmall)
        AtlasFrameSmall:SetWidth(AtlasFrameSmall:GetWidth() + 15)

        _G.AtlasFrameMapFrame:CreateBackdrop()
        _G.AtlasFrameSmallMapFrame:CreateBackdrop()

        -- Function to skin multiple buttons
        local function SkinButtonList(buttons)
            for _, button in ipairs(buttons) do
                if button and not button.IsSkinned then
                    S:HandleButton(button)
                    button.IsSkinned = true
                end
            end
        end

        -- Skin common buttons
        SkinButtonList({
            _G.AtlasFrameOptionsButton,
            _G.AtlasFrameLFGButton,
            _G.AtlasSearchButton,
            _G.AtlasSearchClearButton,
            _G.AtlasFrameCollapseButton,
            _G.AtlasFrameSmallExpandButton
        })

        -- Skin next/prev buttons
        local navButtons = {
            _G.AtlasFrameNextMapButton,
            _G.AtlasFramePrevMapButton,
            _G.AtlasFrameSmallNextMapButton,
            _G.AtlasFrameSmallPrevMapButton
        }
        for _, button in ipairs(navButtons) do
            S:HandleNextPrevButton(button)
        end

        -- Skin dropdowns
        local dropdowns = {
            _G.AtlasFrameDropDown,
            _G.AtlasFrameDropDownType,
            _G.AtlasFrameSmallDropDown,
            _G.AtlasFrameSmallDropDownType
        }
        for _, dropdown in ipairs(dropdowns) do
            if dropdown then S:HandleDropDownBox(dropdown) end
        end

        -- Skin edit box
        local searchBox = _G.AtlasSearchEditBox
        S:HandleEditBox(searchBox)
        searchBox:SetSize(searchBox:GetWidth() - 50, searchBox:GetHeight() - 8)

        -- Function to handle button positions
        local function AdjustButtonPositions()
            SkinButtonList({ _G.AtlasSwitchButton })

            -- Clear all points before setting new positions
			local function ClearAndSetPoint(frame, anchor, relative, relativeAnchor, x, y)
				if frame then
					frame:ClearAllPoints()
					frame:SetPoint(anchor, relative, relativeAnchor, x, y)
				end
			end

            ClearAndSetPoint(_G.AtlasSearchClearButton, "BOTTOMRIGHT", AtlasFrame, "BOTTOMRIGHT", -30, 8)
            ClearAndSetPoint(_G.AtlasSearchButton, "RIGHT", _G.AtlasSearchClearButton, "LEFT", -5, 0)
            ClearAndSetPoint(searchBox, "RIGHT", _G.AtlasSearchButton, "LEFT", -5, 0)
            ClearAndSetPoint(_G.AtlasSwitchButton, "RIGHT", searchBox, "LEFT", -5, 0)
            ClearAndSetPoint(_G.AtlasFrameCollapseButton, "BOTTOMRIGHT", _G.AtlasFrameMapFrame, "BOTTOMRIGHT", -10, 10)
            ClearAndSetPoint(_G.AtlasFrameSmallExpandButton, "BOTTOMRIGHT", _G.AtlasFrameSmallMapFrame, "BOTTOMRIGHT", -10, 10)

            -- Dropdown buttons
            local dropdownPositions = {
                { _G.AtlasFrameDropDownButton, _G.AtlasFrameDropDown },
                { _G.AtlasFrameDropDownTypeButton, _G.AtlasFrameDropDownType },
                { _G.AtlasFrameSmallDropDownButton, _G.AtlasFrameSmallDropDown },
                { _G.AtlasFrameSmallDropDownTypeButton, _G.AtlasFrameSmallDropDownType },
            }
            for _, data in ipairs(dropdownPositions) do
                ClearAndSetPoint(data[1], "RIGHT", data[2], "RIGHT", 0, 0)
            end

            -- Dropdown main position
            ClearAndSetPoint(_G.AtlasFrameDropDown, "TOPLEFT", AtlasFrame, "TOPLEFT", 30, -45)
            ClearAndSetPoint(_G.AtlasFrameDropDownType, "LEFT", _G.AtlasFrameDropDown, "RIGHT", 10, 0)
            ClearAndSetPoint(_G.AtlasFrameSmallDropDown, "TOPLEFT", AtlasFrameSmall, "TOPLEFT", 30, -45)
            ClearAndSetPoint(_G.AtlasFrameSmallDropDownType, "LEFT", _G.AtlasFrameSmallDropDown, "RIGHT", 10, 0)

            -- Lock & Options buttons
            ClearAndSetPoint(_G.AtlasFrameLockButton, "RIGHT", _G.AtlasFrameCloseButton, "LEFT", 5, 0)
            ClearAndSetPoint(_G.AtlasFrameOptionsButton, "RIGHT", _G.AtlasFrameLockButton, "LEFT", -2, -1)

            -- Collapse & Expand Button Arrow Fix
			local collapseButton = _G.AtlasFrameCollapseButton
			local expandButton = _G.AtlasFrameSmallExpandButton

			collapseButton:SetNormalTexture("Interface\\AddOns\\ElvUI\\Core\\Media\\Textures\\ArrowRight")
			collapseButton:GetNormalTexture():SetTexCoord(1, 0, 0, 1) -- Flip it correctly
			collapseButton:SetPushedTexture("Interface\\AddOns\\ElvUI\\Core\\Media\\Textures\\ArrowRight")
			collapseButton:GetPushedTexture():SetVertexColor(0.8, 0.8, 0.8)

			expandButton:SetNormalTexture("Interface\\AddOns\\ElvUI\\Core\\Media\\Textures\\ArrowRight")
			expandButton:SetPushedTexture("Interface\\AddOns\\ElvUI\\Core\\Media\\Textures\\ArrowRight")
			expandButton:GetPushedTexture():SetTexCoord(0, 1, 1, 0) -- Flip differently for expanding
			expandButton:GetPushedTexture():SetVertexColor(0.8, 0.8, 0.8)


            -- Small Frame Options
            SkinButtonList({ _G.AtlasFrameSmallOptionsButton })
            ClearAndSetPoint(_G.AtlasFrameSmallLockButton, "RIGHT", _G.AtlasFrameSmallCloseButton, "LEFT", 5, 0)
            ClearAndSetPoint(_G.AtlasFrameSmallOptionsButton, "RIGHT", _G.AtlasFrameSmallLockButton, "LEFT", -2, -1)
        end

        S:SecureHookScript(AtlasFrame, "OnShow", AdjustButtonPositions)

        -- Function to skin dropdown lists
        local function SkinDropDownLists()
            for i = 1, 2 do
                local list = _G["L_DropDownList" .. i]
                if list and not list.IsSkinned then
                    list:StripTextures()
                    list:SetTemplate("Transparent")
                    S:HandleFrame(list)
                    list.IsSkinned = true
                end
                if list.Backdrop then
                    list.Backdrop:Hide()
                end
                for j = 1, list.numButtons or 10 do
                    local button = _G["L_DropDownList" .. i .. "Button" .. j]
                    if button and not button.IsSkinned then
                        button.IsSkinned = true
                    end
                end
            end
        end

        -- Hook dropdown lists for skinning
        S:SecureHookScript(_G.L_DropDownList1, "OnShow", SkinDropDownLists)
    end)
end

S:AddCallbackForAddon("Atlas")
