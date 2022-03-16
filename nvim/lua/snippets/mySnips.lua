local ls = require("luasnip")
-- some shorthands...
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local l = require("luasnip.extras").lambda
local rep = require("luasnip.extras").rep
local p = require("luasnip.extras").partial
local m = require("luasnip.extras").match
local n = require("luasnip.extras").nonempty
local dl = require("luasnip.extras").dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local types = require("luasnip.util.types")
local conds = require("luasnip.extras.expand_conditions")

ls.snippets = {
  all = {
  },
  norg = {
    --[[ ls.parser.parse_snippet("ses", "- [ ] session $1 {$2} [$0->to]"), ]]
    ls.parser.parse_snippet("h1", "* $1"),
    ls.parser.parse_snippet("h2", "** $1"),
    ls.parser.parse_snippet("h3", "*** $1"),
    ls.parser.parse_snippet("h4", "**** $1"),
    ls.parser.parse_snippet("h5", "***** $1"),
    ls.parser.parse_snippet("h6", "****** $1"),
    ls.parser.parse_snippet("hajime", "* Things i've to take care of\n ** code\n* Pomodoro\n ** breaks\n* Journal\n"),
    s({trig="ses", docstring="ses"}, {
      t("** Session "), i(1,"1 "),
      f(function ()
        result = {}
        result.start_hour = os.date("%I") -- defining start hour
        result.start_min = os.date("%M") -- defining start min
        result.status = function ()
          return os.date("%p") -- finding wheter pm or am
        end
        result.format = function (ses)
          local hour = tonumber(result.end_hour)
          local min = tonumber(result.end_min)

          if hour < 10 then
            -- result.end_hour = string.sub(tostring(result.end_hour),2,2)
            result.start_hour = string.sub(tostring(result.start_hour),2,2)
          end
          if min >= 60 then
            result.end_min = min - 60
            result.end_hour = 1 + hour
            if result.end_min < 10 then
              result.end_min = "0" .. result.end_min
            end
          end
          return "{" .. ses .. " H}" .. " [ "..result.start_time().." -> "..result.end_time().." ]"
        end
        result.adder = function ()
          local time = vim.fn.input("Enter session time (H:M) = ")
          local hour = string.sub(time,1,1)
          local min = string.sub(time,3,4)
          result.end_hour = tonumber(result.start_hour) + tonumber(hour)
          result.end_min = tonumber(result.start_min) + tonumber(min)
          return result.format(time)
          -- result.format(result.end_hour,result.end_min)
        end
        result.end_time = function ()
          return result.end_hour .. ":" .. result.end_min .. result.status()
        end
        result.start_time = function ()
          return result.start_hour .. ":" .. result.start_min .. result.status()
        end
        return " " .. result.adder()
      end),
      t({"","  > "}), i(0)
      --[[ f(function(){{{
        local input = vim.fn.input(" Enter time in HH:MM or MM format: ")
        local plus_hour, plus_min
        if input:find(":") == nil then
          plus_hour = 00
          plus_min = input
        else
          plus_hour, plus_min = input:match("(%d+):(%d+)")
        end
        local time = os.date("%I:%M")
        local hour = tonumber(string.sub(time, 1, 2))
        local min = tonumber(string.sub(time, 4, 5))
        -- add plus_hour and plus_min to current time
        hour = hour + tonumber(plus_hour)
        min = min + tonumber(plus_min)
        -- if minutes are more than 60, add 1 hour and subtract 60 minutes
        if min > 60 then
          hour = hour + 1
          min = min - 60
        end
        if hour > 12 then
          hour = hour - 12
        end
        if min < 10 then
          min = "0" .. min
        end
        if hour < 10 then
          hour = string.sub(hour, 2,2)
        end
        local added_time
        if plus_hour ~= 00 then
          added_time = plus_hour .. ":" .. plus_min .. " H"
        else
          added_time = plus_min .. "M"
        end
        return " [" .. added_time .. "]" .. "(" .. time  .. " -> " .. hour .. ":" .. min .. ")"
      end, {}), ]]--}}}
    }),
  },
  lua = {
    ls.parser.parse_snippet("lvr","local $1 = require('$0')")
  }
}
