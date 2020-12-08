local widget = require ( "widget" )


local wholeBar = display.newRect( 320, 890, 636, 60 )
wholeBar:setStrokeColor( 1, 1, 1 )
wholeBar.strokeWidth = 2
wholeBar:setFillColor( 0, 0, 0 )

local oxyBar = display.newRect( 3, 890, 2, 58 )
oxyBar:setFillColor( 0, 0.2, 0.9 )

--parameters
local oxyPar = 1
local dioxPar = 10

--oxygen
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

--dioxide
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

--title
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
    oxygen.text = "Oxygen: ".. tostring( oxyPar )
    dioxide.text = "Dioxide: ".. tostring( dioxPar )
    --
    oxyBar.x = oxyBar.x + 1
    oxyBar.width = oxyBar.width + 2 
end

--time button
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

local paint = 
{
    type = "gradient",
    color1 = { 0, 0.1, 0.8 },
    color2 = { 0, 0, 0.6 },
    direction = "right"
}