local ls = require("luasnip")
ls.snippets = {
  norg = {
    ls.parser.parse_snippet("ses", "- [ ] session $1 {$2} [$0->to]"),
    ls.parser.parse_snippet("h1", "* $1"),
    ls.parser.parse_snippet("h2", "** $1"),
    ls.parser.parse_snippet("h3", "*** $1"),
    ls.parser.parse_snippet("h4", "**** $1"),
    ls.parser.parse_snippet("h5", "***** $1"),
    ls.parser.parse_snippet("h6", "****** $1"),
    ls.parser.parse_snippet("hajime", "* Things i've to take care of\n* Pomodoro\n* Journal\n"),
  },
  lua = {
    ls.parser.parse_snippet("lvr","local $1 = require('$0')")
  }
}
