local widget = require ( "widget" )
local stuff = require ( "stuff" )

-- calendar
local day = 1
local calOpt =
{
    text = "Day".. tostring( day ),
    x = 540,
    y = 70,
    width = 100,
    align = "center",
    fontSize = 46
}
local calendar = display.newText( calOpt )

-- bottom bars
local wholeBar = display.newRect( 320, 890, 650, 60 )
wholeBar:setStrokeColor( 1, 1, 1 )
wholeBar.strokeWidth = 2
wholeBar:setFillColor( 0, 0, 0 )

local oxyBar = display.newRect( 2, 890, 2, 58 )
oxyBar:setFillColor( 0.1, 0.3, 1 )

-- parameters
local oxyPar = 0
local dioxPar = 10

-- oxygen
local oxyOpt =
{
    text = "Oxygen: ".. tostring( oxyPar ),
    x = 165,
    y = 90,
    width = 280,
    align = "left",
    fontSize = 40
}
local oxygen = display.newText( oxyOpt )

-- dioxide
local dioxOpt =
{   
    text = "Dioxide: ".. tostring( dioxPar ),
    x = 165,
    y = 45,
    width = 280,
    align = "left",
    fontSize = 40
}
local dioxide = display.newText( dioxOpt )

-- title
local titleOpt = 
{
    text = "Your Plant Parameters",
    x = 320,
    y = -15,
    width = 600,
    align = "left",
    fontSize = 52
}
local title = display.newText( titleOpt )
title:setFillColor( 0.2, 1, 0.4 )

local function timeOn( listener )
    oxyPar = oxyPar + 1
    dioxPar = dioxPar - 1
    --
    oxygen.text = "Oxygen: ".. tostring( oxyPar )
    dioxide.text = "Dioxide: ".. tostring( dioxPar )
    --
    oxyBar.width = oxyBar.width + 1
    --
    day = day + 1
    calendar.text = "Day".. tostring( day )
end

-- time button
local timeOpt =
{
    x = 320,
    y = 980,
    label = "Time on",
    onRelease = timeOn,
    shape = "roundedRect",
    fillColor = { default = { 0, 1, 0 }, over = { 0, 0.6, 0 } },
    labelColor = { default = { 0.2, 0.2, 0.2 }, over = { 0.8, 0.8, 0.8 } },
    cornerRadius = 8,
    width = 640,
    height = 100,
    fontSize = 40
}
local timeBtn = widget.newButton( timeOpt )

-- soil

local soilPar = 1.0

local soilOpt =
{
    text = "Soil level",
    x = 215,
    y = 135,
    width = 380,
    align = "left",
    fontSize = 40
}

local soil = display.newText( soilOpt )

local function changeSoil( listener )
    soilPar = soilPar + 0.1
    -- update the text
    if { soilPar = 1.2 } then
        soil.text = "Soil level: Medium"
    elseif  { soilPar = 1.1 } then
        soil.text = "Soil level: Low"
    elseif { soilPar = 1.3 } then
        soil.text = "Soil level: High"
    elseif { soilPar = 1.4 } then
        soilPar = 1.1
    end
end

local soilBtnOpt =
{
    x = 165,
    y = 800,
    height = 120,
    width = 230,
    label = "Change Soil",
    fontSize = 40,
    shape = "rectangle",
    onRelease = changeSoil
}

local soilBtn = widget.newButton( soilBtnOpt )