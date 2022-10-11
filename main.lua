if not game:IsLoaded() then
	game.Loaded:Wait()
end

assert(rconsoleprint, "Your exploit is not supported!")
local game = game
local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local character = Player.Character
local Humanoid = character:WaitForChild("Humanoid")
local User = Player.Name
local Title = "Welcome to Shartware Admin |"
local rconsoleclear = rconsoleclear
local rconsoleprint = rconsoleprint
local rconsoleinput = rconsoleinput
local string = string
rconsolename(Title .. " " .. User)

local function getroot(char)
	local rpart = char:FindFirstChild("HumanoidRootPart") or char:FindFirstChild("Torso") or char:FindFirstChild("UpperTorso")
	return rpart
end

local import = function(asset)
	if type(asset) == "number" then
		return game:GetObjects("rbxassetid://" .. asset)[1]
	else
		local link = string.format("https://raw.githubusercontent.com/Teemsploit/SituationAdmin.lua/main/plugins/%s", asset)
		local resp = game:HttpGetAsync(link)
		local callfunc = loadstring(resp)
		local Success, weget = pcall(callfunc)
		if Success then
			return weget
		else
			rconsolewarn("Failed to import" .. "'" .. asset .. "'")
		end
	end
end

commands = {
    help = function(...)
		for key, value in pairs(commands) do
			rconsoleprint("@@WHITE@@")
			rconsoleprint(key .. '\n')
		end
	end,
    lagserver = function(...)
		for _, v in pairs(getconnections(game:GetService("ScriptContext").Error)) do
			v:Disable()
		end
		local storage = game:GetService("ReplicatedStorage")
		local v = 96000000
		local msg = "" .. string.rep(" ", (v - 12))
		for i = 1, 7 do
			if storage:FindFirstChild("DefaultChatSystemChatEvents") then
				storage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(msg, "All")
			else
				rconsolewarn("It seems this game has a custom chat this command will not work.")
			end
		end
	end,
	deletetouchinterests = function(...)
		for _, v in ipairs(workspace:GetDescendants()) do
			if v.IsA(v, "TouchTransmitter") then
				v:Destroy()
			end
		end
	end,
	networkownership = function(...)
		local function network()
			local Render = game:GetService("RunService").RenderStepped
			local Huge = math.huge * math.huge
			local BigHuge = math.pow(math.huge, math.huge)
			Render:Connect(function()
				sethiddenproperty(Player, 'MaximumSimulationRadius', BigHuge)
				sethiddenproperty(Player, 'SimulationRadius', Huge)
			end)
		end
		network()
	end,
    spoofmemory = function(...)
		hookfunction((gcinfo or collectgarbage), function(...)
			return math.random(200, 350)
		end)
		task.wait(0.01)
		local gamemt = getrawmetatable(game)
		setreadonly(gamemt, false)
		local nc = gamemt.__namecall
		gamemt.__namecall = newcclosure(function(...)
			if (getnamecallmethod() == 'GetTotalMemoryUsageMb') then
				return math.random(395, 405)
			end
			return nc(...)
		end)
		hookfunction(game.Stats.GetTotalMemoryUsageMb, function()
			return math.random(395, 405)
		end)
		task.wait()
		rconsoleprint("Memory Spoofed! \n")
	end,
        
    teleport = function(...)
		for i, plr in ipairs(Players:GetPlayers()) do
			rconsoleprint(i .. ".) " .. plr.Name .. "\n")
		end
		rconsoleprint("Choice: ")
		local playerNum = tonumber(rconsoleinput())
		local players = Players:GetPlayers()
		if playerNum ~= nil and playerNum > 0 and playerNum <= #players then
			local plrchar = players[playerNum].Character
			getroot(character).CFrame = getroot(plrchar).CFrame
		else
			rconsolewarn("Player chosen is invalid!\n")
		end
	end,
    bitchcount = function(...)
		local rnumb = math.random(1, 100)
		rconsolewarn("You have " .. rnumb .. " bitches")
	end,
	owlhub = function(...)
		loadstring(game:HttpGet("https://raw.githubusercontent.com/CriShoux/OwlHub/master/OwlHub.txt"))();
	end,
	tracers = function(...)
		local lplr = game.Players.LocalPlayer
local camera = game:GetService("Workspace").CurrentCamera
local CurrentCamera = workspace.CurrentCamera
local worldToViewportPoint = CurrentCamera.worldToViewportPoint

_G.TeamCheck = false -- Use True or False to toggle TeamCheck

for i,v in pairs(game.Players:GetChildren()) do
    local Tracer = Drawing.new("Line")
    Tracer.Visible = false
    Tracer.Color = Color3.new(1,1,1)
    Tracer.Thickness = 1
    Tracer.Transparency = 1

    function lineesp()
        game:GetService("RunService").RenderStepped:Connect(function()
            if v.Character ~= nil and v.Character:FindFirstChild("Humanoid") ~= nil and v.Character:FindFirstChild("HumanoidRootPart") ~= nil and v ~= lplr and v.Character.Humanoid.Health > 0 then
                local Vector, OnScreen = camera:worldToViewportPoint(v.Character.HumanoidRootPart.Position)

                if OnScreen then
                    Tracer.From = Vector2.new(camera.ViewportSize.X / 2, camera.ViewportSize.Y / 1)
                    Tracer.To = Vector2.new(Vector.X, Vector.Y)

                    if _G.TeamCheck and v.TeamColor == lplr.TeamColor then
                        --//Teammates
                        Tracer.Visible = false
                    else
                        --//Enemies
                        Tracer.Visible = true
                    end
                else
                    Tracer.Visible = false
                end
            else
                Tracer.Visible = false
            end
        end)
    end
    coroutine.wrap(lineesp)()
end

game.Players.PlayerAdded:Connect(function(v)
    local Tracer = Drawing.new("Line")
    Tracer.Visible = false
    Tracer.Color = Color3.new(1,1,1)
    Tracer.Thickness = 1
    Tracer.Transparency = 1

    function lineesp()
        game:GetService("RunService").RenderStepped:Connect(function()
            if v.Character ~= nil and v.Character:FindFirstChild("Humanoid") ~= nil and v.Character:FindFirstChild("HumanoidRootPart") ~= nil and v ~= lplr and v.Character.Humanoid.Health > 0 then
                local Vector, OnScreen = camera:worldToViewportPoint(v.Character.HumanoidRootPart.Position)

                if OnScreen then
                    Tracer.From = Vector2.new(camera.ViewportSize.X / 2, camera.ViewportSize.Y / 1)
                    Tracer.To = Vector2.new(Vector.X, Vector.Y)

                    if _G.TeamCheck and v.TeamColor == lplr.TeamColor then
                        --//Teammates
                        Tracer.Visible = false
                    else
                        --//Enemies
                        Tracer.Visible = true
                    end
                else
                    Tracer.Visible = false
                end
            else
                Tracer.Visible = false
            end
        end)
    end
    coroutine.wrap(lineesp)()
end)
	end,
	cmds = function(...)
		game.StarterGui:SetCore("SendNotification", {
			Title = "Check f9 console";
			Text = "printed cmds in f9 console"; -- what the text says (ofc)
			Duration = 5;
		})
		print("btools")
print("walkspeed")
print("bitchcount")
print("teleport")
print("joinlogs")
print("spoofmemory")
print("esp")
print("cocksize")
print("serverhop")
print("tpwalk")
print("owlhub")
print("nametags")
print ("tracers")
print ("nametags")
print ("reset")
print ("cmds --- prints the commands dumbass")
	end,
	reset = function(...)
		game.StarterGui:SetCore("SendNotification", {
			Title = "Press q to reset";
			Text = "Press q to reset anytime"; -- what the text says (ofc)
			Duration = 5;
		})
		local Player = game:GetService("Players").LocalPlayer
local Mouse = Player:GetMouse()
 
Mouse.KeyDown:Connect(function(key)
    if key == "q" then
 
local plr = game.Players.LocalPlayer --tells the script what plr is
local humanoid = plr.Character.Humanoid
local position = plr.Character.HumanoidRootPart.CFrame
wait(0.1)
humanoid:Destroy()
plr:ClearAllChildren() --clears all of the plr instance aka the local player
wait(5.25)
plr.Character.HumanoidRootPart.CFrame = position
    end
  end)
	end,
	nametags = function(...)
		local c = workspace.CurrentCamera
local ps = game:GetService("Players")
local lp = ps.LocalPlayer
local rs = game:GetService("RunService")

local function esp(p,cr)
    local h = cr:WaitForChild("Humanoid")
    local hrp = cr:WaitForChild("HumanoidRootPart")

    local text = Drawing.new("Text")
    text.Visible = false
    text.Center = true
    text.Outline = true 
    text.Font = 2
    text.Color = Color3.fromRGB(255,255,255)
    text.Size = 13

    local c1
    local c2
    local c3

    local function dc()
        text.Visible = false
        text:Remove()
        if c1 then
            c1:Disconnect()
            c1 = nil 
        end
        if c2 then
            c2:Disconnect()
            c2 = nil 
        end
        if c3 then
            c3:Disconnect()
            c3 = nil 
        end
    end

    c2 = cr.AncestryChanged:Connect(function(_,parent)
        if not parent then
            dc()
        end
    end)

    c3 = h.HealthChanged:Connect(function(v)
        if (v<=0) or (h:GetState() == Enum.HumanoidStateType.Dead) then
            dc()
        end
    end)

    c1 = rs.RenderStepped:Connect(function()
        local hrp_pos,hrp_onscreen = c:WorldToViewportPoint(hrp.Position)
        if hrp_onscreen then
            text.Position = Vector2.new(hrp_pos.X, hrp_pos.Y)
            text.Text = p.Name
            text.Visible = true
        else
            text.Visible = false
        end
    end)
end

local function p_added(p)
    if p.Character then
        esp(p,p.Character)
    end
    p.CharacterAdded:Connect(function(cr)
        esp(p,cr)
    end)
end

for i,p in next, ps:GetPlayers() do 
    if p ~= lp then
        p_added(p)
    end
end

ps.PlayerAdded:Connect(p_added)
	end,
	tpwalk = function(...)
		local char = game.Players.LocalPlayer.Character
game:GetService"UserInputService".InputBegan:Connect(function(input,gP)
   if gP then return end -- the code below won't be executed if you're typing in something like a TextBox and you type the keycode

local function inrange(CFrame1, CFrame2)
   if tonumber(CFrame1.X) - tonumber(CFrame2.X) < 10 then
       return true
   else
       return false
   end
end

local function inrange2(CFrame1, CFrame2)
   if tonumber(CFrame1.Z) - tonumber(CFrame2.Z) < 10 then
       return true
   else
       return false
   end
end


   
   if input.KeyCode == Enum.KeyCode.D then -- X
       local old = char.HumanoidRootPart.CFrame
       char.HumanoidRootPart.CFrame = char.HumanoidRootPart.CFrame + Vector3.new(12, 0, 0)
          while task.wait() do
       if inrange(char.HumanoidRootPart.CFrame, old) == true then -- char is set before and old after in + values
           char.HumanoidRootPart.CFrame = char.HumanoidRootPart.CFrame + Vector3.new(12, 0, 0)
           end
       end
       end
   
   if input.KeyCode == Enum.KeyCode.A then -- X
       local old = char.HumanoidRootPart.CFrame
       char.HumanoidRootPart.CFrame = char.HumanoidRootPart.CFrame + Vector3.new(-12, 0, 0)
       while task.wait() do
           if inrange(old, char.HumanoidRootPart.CFrame) == true then
               char.HumanoidRootPart.CFrame = char.HumanoidRootPart.CFrame + Vector3.new(-12, 0, 0)
           end
       end
       end
   
     if input.KeyCode == Enum.KeyCode.W then
         local old = char.HumanoidRootPart.CFrame
       char.HumanoidRootPart.CFrame = char.HumanoidRootPart.CFrame + Vector3.new(0, 0, -12)
         while task.wait() do
       if inrange2(old, char.HumanoidRootPart.CFrame) then
           char.HumanoidRootPart.CFrame = char.HumanoidRootPart.CFrame + Vector3.new(0, 0, -12)
           end
       end
     end

 if input.KeyCode == Enum.KeyCode.S then
     local old = char.HumanoidRootPart.CFrame
       char.HumanoidRootPart.CFrame = char.HumanoidRootPart.CFrame + Vector3.new(0, 0, 12)
       while task.wait() do -- remember the task.wait
           if inrange2(char.HumanoidRootPart.CFrame, old) == true then
               char.HumanoidRootPart.CFrame = char.HumanoidRootPart.CFrame + Vector3.new(0, 0, 12)
               end
       end
 end

end)

	end,
    joinlogs = function(...)
		local args = {
			...
		}
		joinlogsenabled = args[1] or not joinlogsenabled
		if joinlogsenabled then
			joinlogcon = Players.PlayerAdded:Connect(function(plr)
				rconsoleprint("@@WHITE@@")
				rconsoleprint("\n" .. plr.Name .. " has joined, account is " .. plr.AccountAge .. " days old!\n")
			end)
			leavelogcon = Players.PlayerRemoving:Connect(function(plr)
				rconsoleprint("@@WHITE@@")
				rconsoleprint("\n" .. plr.Name .. " has left!\n")
			end)
		elseif not joinlogsenabled and joinlogcon and leavelogcon then
			joinlogcon = joinlogcon:Disconnect()
			leavelogcon = leavelogcon:Disconnect()
		end
	end,
    btools = function(...)
		import("btools.lua")
	end,
    funfact = function(...)
		rconsoleprint(game:GetService("HttpService"):JSONDecode(game:HttpGet("https://uselessfacts.jsph.pl/random.json?language=en")).text)
		rconsoleprint("\n")
	end,
    walkspeed = function(...)
		local args = {
			...
		}
		local ws = args[1]
		Humanoid.WalkSpeed = ws
	end,
        jumppower  = function(...)
		local args = {
			...
		}
		local jp = args[1]
		Humanoid.JumpPower = jp
	end,
           hipheight  = function(...)
		local args = {
			...
		}
		local hh = args[1]
		Humanoid.HipHeight = hh
	end,
    avatar = function(...)
		local args = {
			...
		}
		local id = args[1]
		local newmodel = Players:GetCharacterAppearanceAsync(id)
		character = newmodel
		rconsolewarn("This is client-side only!\n")
	end,
    serverhop = function(...)
		import("serverhop.lua")
	end,
    esp = function(...)
		import("ESP.lua")
	end,
    antiafk = function(...)
		for i, v in pairs(getconnections(game:GetService("Players").LocalPlayer.Idled)) do
			v:Disable()
		end
	end,
    chat = function(...)
		local args = {
			...
		}
		local Message = args[1]
		local storage = game:GetService("ReplicatedStorage")
		if storage:FindFirstChild("DefaultChatSystemChatEvents") then
			storage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(Message, "All")
		else
			rconsolewarn("It seems this game has a custom chat this command will not work.")
		end
	end,
    
    cocksize = function(...)
		local rnumb = math.random(1, 600)
		rconsolewarn("Your cock is " .. rnumb / 100 .. " inches.")
	end,
    
    noclip = Humanoid:ChangeState(11),
    clear = rconsoleclear}

function nexthandler()
	rconsoleprint("@@WHITE@@")
	rconsoleprint("Input: ")
	local args = rconsoleinput()
	local tokens = {}
	for v in string.gmatch(args, "([^ ]+)") do
		table.insert(tokens, v)
	end
	local command = string.lower(tokens[1])
	local getCommand = commands[command]
	table.remove(tokens, 1)
	if getCommand then
		commands[command](table.unpack(tokens))
		rconsoleprint("@@GREEN@@")
		rconsoleprint("Executed " .. command .. " successfully!\n")
	else
		rconsoleerr("Failed to execute " .. command .. "!\n")
	end
	nexthandler()
end

nexthandler()
