local function create_alert(host, key, info, manager)
  local stmt, err = manager:stmt('select manager.create_alert_if_needed($1::text, $2::text, $3::jsonb)')
  if err then error(err) end
  local _, err = stmt:exec(host, key, info)
  if err then error("exec error: "..err) end
  local err = stmt:close()
  if err then error(err) end
end

return create_alert