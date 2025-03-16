local Name, Private = ...
local E, L, V, P, G = unpack(ElvUI)
local S = E:GetModule('Skins')
local IsAddOnLoaded = _G.C_AddOns and _G.C_AddOns.IsAddOnLoaded or _G.IsAddOnLoaded

local _G = _G
local pairs = pairs

local function DBMStatusBarTimers()
    if not E.db.AngelosSkins.DBM or not IsAddOnLoaded("DBM-Core") or not _G.DBT then return end
    
    -- Hook into ApplyStyle instead of doing it inside CreateBar
    hooksecurefunc(_G.DBT, 'CreateBar', function()
        for bar in _G.DBT:GetBarIterator() do
            if not bar.EltruismSkin then
                hooksecurefunc(bar, "ApplyStyle", function()
                    local statusbar = _G[bar.frame:GetName()..'Bar']
                    local icon = _G[bar.frame:GetName()..'BarIcon1']
                    local spark = _G[bar.frame:GetName().."BarSpark"]
                    if spark then spark:Hide() end -- Hide the spark

                    -- Apply ElvUI-style background
                    bar.frame:CreateBackdrop()

                    -- Style the Icon
                    if icon then
                        icon:SetSize(22.5, 22.5) -- Adjust icon size
                        icon:SetTexCoord(0.08, 0.92, 0.08, 0.92) -- Crop edges
                        icon:CreateBackdrop()
                        icon:ClearAllPoints()
                        icon:SetPoint("BOTTOMRIGHT", bar.frame, "BOTTOMLEFT", E.PixelMode and -5 or -10, 0)
                    end

                    bar.EltruismSkin = true
                end)
                bar:ApplyStyle() -- Apply the skin immediately
            end
        end
    end)
end

-- Properly register the function with ElvUI skins
S:AddCallbackForAddon('DBM-StatusBarTimers', "ElvUI_DBM", function() DBMStatusBarTimers() end)
