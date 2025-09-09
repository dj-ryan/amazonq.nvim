local completion = require('amazonq.completion')

local function eq(actual, expected, msg)
  assert(
    actual == expected,
    string.format('%s\nExp: %s\nGot: %s', msg or '', vim.inspect(expected), vim.inspect(actual))
  )
end

local tests = {
  { 'function foo(', true },
  { 'if condition', true },
  { '-- comment', false },
}

for _, t in ipairs(tests) do
  local line, want = t[1], t[2]
  eq(completion._should_trigger_from_text(line), want, line)
end

print('passed')
