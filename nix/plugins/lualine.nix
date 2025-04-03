{ ... }: {
  plugins.lualine = {
    enable = true;

    settings = {
      options = {
        theme = "catppuccin";
        globalstatus = true;
        component_separators = { left = ""; right = ""; };
        section_separators = { left = ""; right = ""; };
      };
      sections = {
        lualine_a = [ "mode" ];
        lualine_b = [ "branch" "diff" "diagnostics" ];
        lualine_c = [ "filename" ];
        lualine_x = { __raw = ''{ lunar_emoji }''; };
        lualine_y = [ "filetype" ];
        lualine_z = [ "location" ];
      };
      inactive_sections = {
        lualine_a = [];
        lualine_b = [];
        lualine_c = [ "filename" ];
        lualine_x = { __raw = ''{ lunar_emoji, "location" }''; };
        lualine_y = [];
        lualine_z = [];
      };
    };

    luaConfig.pre = /* lua */ ''
      function lunar_emoji()
        -- Convert the date to Julian Day Number
        local function julian_day(year, month, day)
            if month <= 2 then
                year = year - 1
                month = month + 12
            end
            local A = math.floor(year / 100)
            local B = 2 - A + math.floor(A / 4)
            local jd = math.floor(365.25 * (year + 4716)) + math.floor(30.6001 * (month + 1)) + day + B - 1524.5
            return jd
        end

        -- Calculate the Julian Day Number for the given date
        local now = os.date('!*t')
        local jd = julian_day(now.year, now.month, now.day)

        -- Constants
        local known_new_moon_jd = 2451550.1 -- Julian Day Number for a known New Moon (2000 January 6)
        local synodic_month = 29.53058867 -- Length of a synodic month (days)

        -- Calculate the days since the known New Moon
        local days_since_new_moon = jd - known_new_moon_jd

        -- Calculate the phase of the moon
        local phase = (days_since_new_moon / synodic_month) % 1

        -- Determine the moon phase and return the corresponding emoji
        if phase < 0.01 or phase > 0.99 then return "🌑"
        elseif phase < 0.25 then return "🌒"
        elseif phase < 0.26 then return "🌓"
        elseif phase < 0.50 then return "🌔"
        elseif phase < 0.51 then return "🌕"
        elseif phase < 0.75 then return "🌖"
        elseif phase < 0.76 then return "🌗"
        else return "🌘" end
      end
    '';
  };
}
