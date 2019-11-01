#!/usr/bin/env luajit

local LEDsController = require "lib.LEDsController.LEDsController"

local FPS = 100
local LED_NB = 512
local ctn = 0

local controller = LEDsController:new(LED_NB, "BRO888", "192.168.1.198")
-- controller:start_dump("RLE888")

while true do

	for i=0,LED_NB-1 do
		local c = color_wheel((math.floor(i/8)+ctn)*8)
		-- local c = color_wheel(i+ctn)
		controller.leds[i+1] = {c[1], c[2], c[3]}
	end
	controller:send(1/FPS)
	-- controller:dump()
	ctn = ctn + 1
end
