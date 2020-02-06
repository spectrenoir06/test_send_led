#!/usr/bin/env luajit

local LEDsController = require "lib.LEDsController.LEDsController"

local FPS = 40
local LED_NB = 400
local ctn = 0

local controller = LEDsController:new(LED_NB, "artnet", "192.168.1.120")
controller.rgbw = true
-- controller:start_dump("RLE888")

while true do
	-- controller:sendArtnetPoll()
	for j=0,3 do
		for i=0,100-1 do
			local c = color_wheel(j*(256/5)+ctn)
			controller.leds[i+1+j*100] = {c[1], c[2], c[3], 0}
		end
	end
	controller:send(1/FPS)
	-- controller:dump()
	ctn = ctn + 1
end
