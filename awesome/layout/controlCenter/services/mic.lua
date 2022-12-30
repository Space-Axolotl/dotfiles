-- Mic button/widget
-- ~~~~~~~~~~~~~~~~~~

local scalar = 0.7
-- requirements
-- ~~~~~~~~~~~~
local awful = require("awful")
local beautiful = require("beautiful")
local gears = require("gears")
local dpi = beautiful.xresources.apply_dpi
local helpers = require("helpers")
local wibox = require("wibox")
local rubato = require("mods.rubato")


-- misc/vars
-- ~~~~~~~~~

local service_name = "Mic"
local service_icon = ""

-- widgets
-- ~~~~~~~

-- icon
local icon = wibox.widget{
    font = beautiful.icon_var .. "18",
    markup = helpers.colorize_text(service_icon, beautiful.fg_color),
    widget = wibox.widget.textbox,
    valign = "center",
    align = "center"
}

-- name
local name = wibox.widget{
    font = beautiful.font_var .. "10",
    widget = wibox.widget.textbox,
    markup = helpers.colorize_text(service_name, beautiful.fg_color),
    valign = "center",
    align = "center"
}

-- animation :love:
local circle_animate = wibox.widget{
	widget = wibox.container.background,
	shape = helpers.rrect(beautiful.rounded),
	bg = beautiful.accent,
	forced_width = 110*(1/scalar),
}

-- mix those
local alright = wibox.widget{
    {
		{
			nil,
			{
				circle_animate,
				layout = wibox.layout.fixed.horizontal
			},
			layout = wibox.layout.align.horizontal,
			expand = "none"
		},
        {
            nil,
            {
                icon,
                name,
                layout = wibox.layout.fixed.vertical,
                spacing = dpi(10)*scalar
            },
            layout = wibox.layout.align.vertical,
            expand = "none"
        },
        layout = wibox.layout.stack
    },
    shape = helpers.rrect(beautiful.rounded),
    widget = wibox.container.background,
    border_color = beautiful.fg_color .. "33",
    forced_width = dpi(110),
    forced_height = dpi(110)*scalar,
    bg = beautiful.bg_3 .. "BF"
}



  local animation_button_opacity = rubato.timed{
      pos = 0,
      rate = 60,
      intro = 0.08,
      duration = 0.3,
      awestore_compat = true,
      subscribed = function(pos)
		circle_animate.opacity = pos
      end
  }
  -- update information
  local function update_server(send_notif)
	awful.spawn.easy_async_with_shell(
		[[
            pacmd list-sources | grep -e index -e name: -e muted -e device.description
		]],
		function(stdout)
			if stdout:match("yes") then
                icon.markup = helpers.colorize_text(service_icon, beautiful.bg_color)
                name.markup = helpers.colorize_text(service_name, beautiful.bg_color)
                animation_button_opacity:set(0)

                if send_notif then
                    require("layout.ding.extra.short")("","Microphone disabled")
                end
			else
                icon.markup = helpers.colorize_text(service_icon, beautiful.fg_color)
                name.markup = helpers.colorize_text(service_name, beautiful.fg_color)
                animation_button_opacity:set(1)

                if send_notif then
                    require("layout.ding.extra.short")("","Microphone enabled")
                end
			end
		end
	)
end

-- run once every startup/reload
update_server()
  alright:buttons(gears.table.join(awful.button({}, 1, nil, function()
    awful.spawn("pactl set-source-mute alsa_input.usb-Solid_State_System_Co._Ltd._LCS_USB_Audio_000000000000-00.mono-fallback toggle")
    update_server(true)
end)))



return alright