--// Cache

local getgenv, getnamecallmethod, hookmetamethod, newcclosure, checkcaller, stringlower = getgenv, getnamecallmethod, hookmetamethod, newcclosure, checkcaller, string.lower

--// Loaded check

if getgenv().ED_AntiKick then return end

--// Variables

local Players = game:GetService("Players")

--// Global Variables

getgenv().ED_AntiKick = {
SendNotifications = false, -- Set to true if you want to get notified for every event
CheckCaller = false -- Set to true if you want to disable kicking by other executed scripts
}

--// Main

hookmetamethod(game, "__namecall", newcclosure(function(...)
if (getgenv().ED_AntiKick.CheckCaller and not checkcaller() or true) and stringlower(getnamecallmethod()) == "kick" then
return nil
end
return oldNamecall(...)
end))
