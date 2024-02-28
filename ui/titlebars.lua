local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local rubato = require("modules.rubato")
-- titlebars --

--Buttons template
--They take a color a name and a function that works
--when click on
local create_button = function(color, name, func)
	local widget = wibox.widget {
		widget = wibox.container.background,
		forced_width = 22,
		forced_height = 24,
		bg = color,
		buttons = {
			awful.button({}, 1, function()
				func()
			end)
		}
	}
	local popup = awful.tooltip {
		objects = { widget },
		timer_function = function()
			return name
		end,
		mode = "outside",
		gaps = beautiful.useless_gap,
		margins_leftright = 10,
		margins_topbottom = 10,
		delay_show = 1.5
	}
	--Animation when a window is open that display 
	--the buttons
	local widget_anim = rubato.timed{
		duration = 0.3,
		easing = rubato.easing.linear,
		subscribed = function(h)
			widget.forced_height = h
		end
	}
	widget_anim.target = 24

	widget:connect_signal("mouse::enter",function()
		widget_anim.target = 38
	end)
	widget:connect_signal("mouse::leave",function()
		widget_anim.target = 24
	end)
	

	return widget
end

client.connect_signal("request::titlebars", function(c)
--Minimize button
local minimize = create_button("#DDE64D", "Minimize",
	function ()
	gears.timer.delayed_call(function()
		c.minimized = not c.minimized
	end)
	end
)
--Maximize the window
local maximize = create_button("#62C762", "Maximize",
	function ()
		c.maximized = not c.maximized
	end
)
--Kill the window button
local close = create_button("#BF3D49", "Kill",
	function ()
		c:kill()
	end
)
--When the mouse pass above displays the info about the button
local buttons = gears.table.join(
	awful.button({ }, 1, function()
		client.focus = c
		c:raise()
		awful.mouse.client.move(c)
	end),
	awful.button({ }, 3, function()
		client.focus = c
		c:raise()
		awful.mouse.client.resize(c)
	end)
)
--Declares the titlebar with size and position
	--when a window is open
awful.titlebar(c, {
size = 36,
position = "left"
}):setup {
	layout = wibox.layout.align.vertical,
	{	--Bc the var is on the left we go from top to bot
			--[[TOP]]
		widget = wibox.container.place,
		valign = "top",
		{
			widget = wibox.container.margin,
			margins = {right = 12, left = 12, top = 12},
			{	--Call buttons
				layout = wibox.layout.fixed.vertical,
				spacing = 8,
				maximize,
				minimize,
				close,
			}
		}
	},
	{	--[Middle]
		widget = wibox.container.background,
		buttons = buttons,
	},
	{	--{Bottom}
		widget = wibox.container.background,
		buttons = buttons
	}
}

end)
