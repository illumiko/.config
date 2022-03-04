local ls = require("luasnip")
ls.snippets = {
  norg = {
    ls.parser.parse_snippet("ses", "- [ ] session $1 {$2} [$0->to]")
  },
  lua = {
    ls.parser.parse_snippet("lvr","local $1 = require('$0')")
  }
}
