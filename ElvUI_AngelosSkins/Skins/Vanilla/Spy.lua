local Name, Private = ...
local E, L, V, P, G = unpack(ElvUI)
local S = E:GetModule('Skins')

local _G = _G
local hooksecurefunc = hooksecurefunc
local pairs = pairs
local type = type
local unpack = unpack

function S:Spy()
	if not E.db.AngelosSkins.Spy then return end

    -- Handle the main Spy window
    local SpyMain = _G.Spy_MainWindow
    if SpyMain then
        S:HandleFrame(SpyMain)
        SpyMain:SetTemplate("Transparent")
        if SpyMain.TitleBar then
            SpyMain.TitleBar:SetAlpha(0) -- Make title bar transparent
        end
    end

    -- Handle the alert window
    if _G.Spy_AlertWindow then
        S:HandleFrame(_G.Spy_AlertWindow)
        if _G.Spy_AlertWindow.Icon then
            _G.Spy_AlertWindow.Icon:CreateBackdrop() -- Add backdrop to alert icon
        end
    end

    -- Skin bar frames (detected players list)
    for i = 1, 10 do
        local bar = _G["Spy_MainWindow_Bar" .. i]
        if bar then bar:SetTemplate("Transparent") end
    end

    -- Handle various buttons with standardized sizing
    local buttons = {
        {SpyMain and SpyMain.CloseButton, 22, 22, S.HandleCloseButton},
        {SpyMain and SpyMain.ClearButton, 22, 22},
        {SpyMain and SpyMain.StatsButton, 14, 14},
        {SpyMain and SpyMain.LeftButton, 16, 16, S.HandleNextPrevButton},
        {SpyMain and SpyMain.RightButton, 16, 16, S.HandleNextPrevButton},
    }

    for _, btn in pairs(buttons) do
        local button, w, h, handler = unpack(btn)
        if button then
            if handler then handler(S, button) end
            button:SetSize(w, h)
        end
    end

    -- Handle the statistics frame and related UI elements
    if _G.SpyStatsFrame then
        S:HandlePortraitFrame(_G.SpyStatsFrame)
        local frames = {
            _G.SpyStatsFrame.StatsFrame,
            _G.SpyStatsPlayerHistoryFrame,
            _G.SpyStatsTabFrameTabContentFrame,
            _G.SpyStatsTabFrameTabContentFrame and _G.SpyStatsTabFrameTabContentFrame.ContentFrame,
        }

        for _, frame in pairs(frames) do
            if frame then
                frame:StripTextures()
                frame:SetTemplate('Transparent')
            end
        end
    end

    -- Handle close button for the stats frame
    if _G.SpyStatsFrameTopCloseButton then
        S:HandleCloseButton(_G.SpyStatsFrameTopCloseButton)
    end

    -- Handle the search filter box
    if _G.SpyStatsFilterBox and _G.SpyStatsFilterBox.FilterBox then
        _G.SpyStatsFilterBox.FilterBox:StripTextures()
        S:HandleEditBox(_G.SpyStatsFilterBox.FilterBox)
        _G.SpyStatsFilterBox:SetSize(150, 15)
    end

    -- Handle checkboxes
    local checkboxes = {
        _G.SpyStatsKosCheckbox,
        _G.SpyStatsRealmCheckbox,
        _G.SpyStatsWinsLosesCheckbox,
        _G.SpyStatsReasonCheckbox
    }
    for _, cb in pairs(checkboxes) do
        if cb then S:HandleCheckBox(cb) end
    end

    -- Handle refresh button for stats frame
    if _G.SpyStatsRefreshButton then
        S:HandleButton(_G.SpyStatsRefreshButton)
        _G.SpyStatsRefreshButton:ClearAllPoints()
        _G.SpyStatsRefreshButton:SetPoint("BOTTOMRIGHT", _G.SpyStatsFrame, "BOTTOMRIGHT", -12, 5)
        _G.SpyStatsRefreshButton:SetBackdrop()
    end

    -- Handle scrollbar for stats frame content
    local scrollbar = _G.SpyStatsTabFrameTabContentFrameScrollFrameScrollBar
    if scrollbar then S:HandleScrollBar(scrollbar) end
end

S:AddCallbackForAddon("Spy")
