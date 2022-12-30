-- a minimal bar
-- ~~~~~~~~~~~~~

-- requirements
-- ~~~~~~~~~~~~
local awful         = require("awful")
local gears         = require("gears")
local wibox         = require("wibox")
local beautiful     = require("beautiful")
local helpers       = require("helpers")
local dpi           = beautiful.xresources.apply_dpi



-- misc/vars
-- ~~~~~~~~~





-- connect to screen
-- ~~~~~~~~~~~~~~~~~
awful.screen.connect_for_each_screen(function(s)

-- screen width
local screen_height = s.geometry.height




    -- widgets
    -- ~~~~~~~

    -- taglist
    local taglist = require("layout.bar.taglist")(s)


    -- launcher {{
    local launcher = wibox.widget{
        widget = wibox.widget.textbox,
        markup = helpers.colorize_text("", beautiful.fg_color),
        font = beautiful.icon_var .. "21",
        align = "center",
        valign = "center",
    }

    launcher:buttons(gears.table.join({
        awful.button({ }, 1, function ()
            awful.spawn.with_shell(require("misc").rofiCommand, false)
        end)

    }))
    -- }}



    -- wifi
    local wifi = wibox.widget{
        markup = "",
        font = beautiful.icon_var .. "15",
        valign = "center",
        align = "center",
        widget = wibox.widget.textbox
    }

    -- cc
    local cc_ic = wibox.widget{
        markup = "",
        font = beautiful.icon_var .. "17",
        valign = "center",
        align = "center",
        widget = wibox.widget.textbox
    }



    -- Eo battery
    -----------------------------------------------------



    cc_ic:buttons{gears.table.join(
        awful.button({ }, 1, function ()
            cc_toggle(s)
        end)
    )}



    -- clock
    ---------------------------
    local clock = wibox.widget{
        {
            widget = wibox.widget.textclock,
            format = "%I",
            font = beautiful.font_var .. "Bold 12",
            valign = "center",
            align = "center"
        },
        {
            widget = wibox.widget.textclock,
            format = "%M",
            font = beautiful.font_var .. "Medium 12",
            valign = "center",
            align = "center"
        },
        layout = wibox.layout.fixed.vertical,
        spacing = dpi(3)
    }
    -- Eo clock
    ------------------------------------------




    -- update widgets accordingly
    -- ~~~~~~~~~~~~~~~~~~~~~~~~~~
    awesome.connect_signal("signal::battery", function(value, state)
        battery_progress.value = value


        if state == 1 then
            bat_icon.visible = true
        else
            bat_icon.visible = false
        end

    end)

    awesome.connect_signal("signal::wifi", function (value)
        if value then
            wifi.markup = helpers.colorize_text("", beautiful.fg_color .. "CC")
        else
            wifi.markup = helpers.colorize_text("", beautiful.fg_color .. "99")
        end
        
    end)


    -- wibar
    s.wibar_wid = awful.wibar({
        screen      = s,
        visible     = true,
        ontop       = false,
        type        = "dock",
        width      = dpi(48),
        shape       = helpers.rrect(beautiful.rounded - 5),
        bg          =  beautiful.bg_color,
        height       = screen_height - beautiful.useless_gap * 4
    })


    -- wibar placement
    awful.placement.left(s.wibar_wid, {margins = beautiful.useless_gap * 2})
    s.wibar_wid:struts{left = s.wibar_wid.width + beautiful.useless_gap * 2 }


    -- bar setup
    s.wibar_wid:setup {
        {
            launcher,
            {
                taglist,
                margins = {left = dpi(8), right = dpi(8)},
                widget = wibox.container.margin
            },
            {
                {
                    battery,
                    margins = {left = dpi(8), right = dpi(8)},
                    widget = wibox.container.margin
                },
                {
                    cc_ic,
                    clock,
                    layout = wibox.layout.fixed.vertical,
                    spacing = dpi(20)
                },
                layout = wibox.layout.fixed.vertical,
                spacing = dpi(20)
            },
            layout = wibox.layout.align.vertical,
            expand = "none"
        },
        layout = wibox.container.margin,
        margins = {top = dpi(10), bottom = dpi(14)}
    }

end)