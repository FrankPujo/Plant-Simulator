local widget = require ( "widget" )
local stuff = require ( "stuff" )

--soil---------------------------------------------------------------------------------------------
local soilOpt =
{
    text = "Soil level: Medium",
    x = 215,
    y = 135,
    width = 380,
    align = "left",
    fontSize = 40
}

local soil = display.newText( soilOpt )

local segmOpt =
{
    x = 165,
    y = 800,
    segments = { "Low", "Medium", "High" },
    defaultSegment = 2,
    segmentWidth = 100,
    labelSize = 24
}

local segmSoil = widget.newSegmentedControl( segmOpt )

-- calendar----------------------------------------------------------------------------------------
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

---------------------------------------------------------------------------------------------------
local oxyBarOpt =
{
    x = 320,
    y = 900,
    width = 640,
    isAnimated = true
}

local oxyBar = widget.newProgressView( oxyBarOpt )
oxyBar:setProgress( 0 )

-- parameters--------------------------------------------------------------------------------------
local oxyPar = 0
local dioxPar = 10

-- oxygen------------------------------------------------------------------------------------------
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

-- dioxide-----------------------------------------------------------------------------------------
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

-- title-------------------------------------------------------------------------------------------
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

---------------------------------------------------------------------------------------------------
local function timeOn( listener )
    oxyPar = oxyPar + 1
    dioxPar = dioxPar - 1
    --
    oxygen.text = "Oxygen: ".. tostring( oxyPar )
    dioxide.text = "Dioxide: ".. tostring( dioxPar )
    --
    day = day + 1
    calendar.text = "Day".. tostring( day )
    --
    soil.text = "Soil Level: ".. segmSoil.segmentLabel
    --
    oxyBar:setProgress( oxyPar/1000)
    --
end

--
-- time button-------------------------------------------------------------------------------------
--

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

print( sNum )