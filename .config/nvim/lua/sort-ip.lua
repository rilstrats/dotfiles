vim.api.nvim_create_user_command("SortLinesIp", function(args)
  if args.range == 0 then
    print("ERROR: called without range")
    return
  end

  local lines = vim.api.nvim_buf_get_lines(0, args.line1 - 1, args.line2, true)
  local ips = {}
  for i, s in ipairs(lines) do
    local ip = { s:match("^%s*(%d%d?%d?).(%d%d?%d?).(%d%d?%d?).(%d%d?%d?)%s*$") }
    if #ip == 0 then
      print("ERROR: line " .. i + args.line1 - 1 .. " not an IP")
      return
    end
    ip.value = ip[1] * 10 ^ 9 + ip[2] * 10 ^ 6 + ip[3] * 10 ^ 3 + ip[4]
    table.insert(ips, ip)
  end

  table.sort(ips, function(a, b)
    return a.value < b.value
  end)

  for i, ip in ipairs(ips) do
    lines[i] = table.concat(ip, ".")
  end

  vim.api.nvim_buf_set_lines(0, args.line1 - 1, args.line2, true, lines)
end, { nargs = 0, range = true })

--[[
1.1.1.1
2.2.2.2
]]
