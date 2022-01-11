local toggles={};
local uis=game:GetService'UserInputService'
local r=game:GetService'RunService'
local p=game:GetService'Players'.LocalPlayer
local m=p:GetMouse()
local cg=game:GetService'CoreGui'
local rs=game:GetService'ReplicatedStorage'
local ID=game.PlaceId
function GetCamera()
    return game:GetService'Workspace':FindFirstChild'Camera'
end;
local MyCam=GetCamera()

do --Reset
    local Drawing={'Line';'Text';}
    function ResetDrawing(able)
        for i,_ in next,Drawing do
            for i2,_2 in next,able do
                if type(_2)=="table" then
                    ResetDrawing(_2)
                elseif tostring(_2)==_ then
                    pcall(function()
                        _2:Remove()
                    end)
                end
            end
        end
    end;
    if _G.info~=nil then
        ResetDrawing(_G.info)
        if _G.info.Render~=nil then
            _G.info.Render:Disconnect()
        end;
    end;
    if cg:FindFirstChild'Crosshair'then
        cg:FindFirstChild'Crosshair':Destroy()
    end
    _G.info=nil
end;

local Input=Instance.new('ScreenGui',cg)
Input.Name="Authorless"

_G.info={
    DrawingCreation=false;
    Crosshair={L;R;T;B};
    Render=nil;
    Color=Color3.fromRGB(255,255,255);
    CrosshairGui={L;R;T;B};
};

do --UI
    local function RandomVariable(length)
        local res = ""
        for i = 1, length do
            res = res .. string.char(math.random(97, 122))
        end
        return res
    end

    if cg:FindFirstChild'Authorless'then
        game:GetService'CoreGui':FindFirstChild'Authorless':Destroy()
    end;

    local main = Instance.new("Frame")
    local Main = Instance.new("Frame")
    local Background = Instance.new("Frame")
    local image = Instance.new("ImageLabel")
    local main_2 = Instance.new("Frame")
    local UIListLayout = Instance.new("UIListLayout")
    local Title = Instance.new("Frame")
    local image_2 = Instance.new("ImageLabel")
    local TitleBar = Instance.new("TextLabel")

    Input.Name = "Authorless"
    Input.Parent = game:GetService'CoreGui'
    
    main.Name = "main"
    main.Parent = Input
    main.Active = true
    main.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    main.BackgroundTransparency = 1.000
    main.BorderSizePixel = 0
    main.Draggable = true
    main.Position = UDim2.new(0.5, -99, 0.5, -160)
    main.Size = UDim2.new(0, 387, 0, 65)
    main.ZIndex = 0
    function IncreaseSize(n)
        main.Size = UDim2.new(0, 387, 0,main.Size.Y.Offset+((n or 1)*22))
    end;
    Main.Name = "Main"
    Main.Parent = main
    Main.Active = true
    Main.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Main.BackgroundTransparency = 1.000
    Main.BorderColor3 = Color3.fromRGB(55, 55, 64)
    Main.BorderSizePixel = 0
    Main.Position = UDim2.new(0, 5, 0, 32)
    Main.Selectable = true
    Main.Size = UDim2.new(1, -9, 1, -39)
    Main.ZIndex = 0

    Background.Name = "Background"
    Background.Parent = main
    Background.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Background.BackgroundTransparency = 1.000
    Background.ClipsDescendants = true
    Background.Position = UDim2.new(0, 0, 0, 25)
    Background.Size = UDim2.new(1, 0, 1, -25)
    Background.ZIndex = 0

    image.Name = "image"
    image.Parent = Background
    image.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    image.BackgroundTransparency = 1.000
    image.Position = UDim2.new(0, 0, 0, -25)
    image.Size = UDim2.new(1, 0, 1, 25)
    image.ZIndex = 0
    image.Image = "rbxassetid://1051180924"
    image.ImageColor3 = Color3.fromRGB(25, 25, 25)
    image.ScaleType = Enum.ScaleType.Slice
    image.SliceCenter = Rect.new(20, 20, 20, 20)

    main_2.Name = "main"
    main_2.Parent = Background
    main_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    main_2.BackgroundTransparency = 1.000
    main_2.Position = UDim2.new(0, 0, 0, 5)
    main_2.Size = UDim2.new(1, 0, 1, -5)

    UIListLayout.Parent = main_2
    UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

    Title.Name = "Title"
    Title.Parent = main
    Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Title.BackgroundTransparency = 1.000
    Title.ClipsDescendants = true
    Title.Size = UDim2.new(1, 0, 0, 25)
    Title.ZIndex = 0

    image_2.Name = "image"
    image_2.Parent = Title
    image_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    image_2.BackgroundTransparency = 1.000
    image_2.Size = UDim2.new(1, 0, 2, 0)
    image_2.ZIndex = 0
    image_2.Image = "rbxassetid://3570695787"
    image_2.ImageColor3 = Color3.fromRGB(20, 20, 23)
    image_2.ScaleType = Enum.ScaleType.Slice
    image_2.SliceCenter = Rect.new(100, 100, 100, 100)
    image_2.SliceScale = 0.030

    TitleBar.Name = "TitleBar"
    TitleBar.Parent = image_2
    TitleBar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TitleBar.BackgroundTransparency = 1.000
    TitleBar.Position = UDim2.new(0, 7, 0, 0)
    TitleBar.Size = UDim2.new(1, -7, 0, 25)
    TitleBar.Font = Enum.Font.SourceSans
    TitleBar.Text = "Authorless"
    TitleBar.TextColor3 = Color3.fromRGB(255, 255, 255)
    TitleBar.TextSize = 15.000
    TitleBar.TextStrokeTransparency = 0.000
    TitleBar.TextXAlignment = Enum.TextXAlignment.Left

    local function getTextSize(label)
        local vec2=game:GetService'TextService':GetTextSize(label.Text,label.TextSize,label.Font,Vector2.new(10000, 25))
        return vec2
    end;

    function Toggle(text,flag,default,callback)
        local Button = Instance.new("Frame")
        local name = Instance.new("TextLabel")
        local ImageButton = Instance.new("ImageButton")
        local Frame = Instance.new("ImageLabel")

        Button.Name = "Button"
        Button.Parent = main_2
        Button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Button.BackgroundTransparency = 1.000
        Button.Size = UDim2.new(1, 0, 0, 22)

        name.Name = "name"
        name.Parent = Button
        name.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        name.BackgroundTransparency = 1.000
        name.Position = UDim2.new(0, 40, 0, 1)
        name.Size = UDim2.new(1, -40, 0, 20)
        name.Font = Enum.Font.SourceSans
        name.Text = tostring(text)
        name.TextColor3 = Color3.fromRGB(255, 255, 255)
        name.TextSize = 15.000
        name.TextStrokeTransparency = 0.000
        name.TextXAlignment = Enum.TextXAlignment.Left

        ImageButton.Parent = Button
        ImageButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        ImageButton.BackgroundTransparency = 1.000
        ImageButton.Position = UDim2.new(0, 13, 0, 1)
        ImageButton.Size = UDim2.new(0, 20, 0, 20)
        ImageButton.Image = "rbxassetid://3570695787"
        ImageButton.ImageColor3 = Color3.fromRGB(59, 59, 59)
        ImageButton.ScaleType = Enum.ScaleType.Slice
        ImageButton.SliceCenter = Rect.new(100, 100, 100, 100)
        ImageButton.SliceScale = 0.020

        Frame.Name = "Frame"
        Frame.Parent = ImageButton
        Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Frame.BackgroundTransparency = 1.000
        Frame.Position = UDim2.new(0, 3, 0, 3)
        Frame.Size = UDim2.new(0, 14, 0, 14)
        Frame.Image = "rbxassetid://3570695787"
        Frame.ImageColor3 = Color3.fromRGB(118, 118, 118)
        Frame.ScaleType = Enum.ScaleType.Slice
        Frame.SliceCenter = Rect.new(100, 100, 100, 100)
        Frame.Visible=false;
        Frame.SliceScale = 0.010

        local flag=flag or RandomVariable(5)
        toggles[flag]=default or false
        local callback=callback or function()end;
        ImageButton.MouseButton1Click:Connect(function()
            toggles[flag] = not toggles[flag];
            Frame.Visible=toggles[flag] and true or false;
            if callback then
                local s,e=pcall(function()callback(toggles[flag])end)
                if not s then warn("error: "..e)end
            end
        end)
        Frame.Visible=toggles[flag] and true or false;IncreaseSize()
    end;

    function slider(text,flag,min,max,default,callback)
        local flag=flag or ''
        local min=min or 0
        local max=max or 1
        toggles[flag]=default or min
        local callback=callback or function()end

        local Slider = Instance.new("Frame")
        local ImageButton = Instance.new("ImageButton")
        local number = Instance.new("TextLabel")
        local Frame = Instance.new("ImageLabel")
        local name = Instance.new("TextLabel")
        
        Slider.Name = "Slider"
        Slider.Parent = main_2
        Slider.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Slider.BackgroundTransparency = 1.000
        Slider.Size = UDim2.new(1, 0, 0, 22)
        
        ImageButton.Parent = Slider
        ImageButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        ImageButton.BackgroundTransparency = 1.000
        ImageButton.Position = UDim2.new(0, 53, 0, 1)
        ImageButton.Size = UDim2.new(0, 280, 0, 20)
        ImageButton.Image = "rbxassetid://3570695787"
        ImageButton.ImageColor3 = Color3.fromRGB(59, 59, 59)
        ImageButton.ScaleType = Enum.ScaleType.Slice
        ImageButton.SliceCenter = Rect.new(100, 100, 100, 100)
        ImageButton.SliceScale = 0.020
        
        number.Name = "number"
        number.Parent = ImageButton
        number.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        number.BackgroundTransparency = 1.000
        number.Size = UDim2.new(1, 0, 1, 0)
        number.Font = Enum.Font.SourceSans
        number.ZIndex=5
        number.Text = "0"
        number.TextColor3 = Color3.fromRGB(255, 255, 255)
        number.TextSize = 15.000
        number.TextStrokeTransparency = 0.000
        
        Frame.Name = "Frame"
        Frame.Parent = ImageButton
        Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Frame.BackgroundTransparency = 1.000
        Frame.Position = UDim2.new(0, 3, 0, 3)
        Frame.Size = UDim2.new(0, 9, 0, 14)
        Frame.Image = "rbxassetid://3570695787"
        Frame.ImageColor3 = Color3.fromRGB(118, 118, 118)
        Frame.ScaleType = Enum.ScaleType.Slice
        Frame.SliceCenter = Rect.new(100, 100, 100, 100)
        Frame.SliceScale = 0.010
        
        name.Name = "name"
        name.Parent = Slider
        name.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        name.BackgroundTransparency = 1.000
        name.Position = UDim2.new(0, 13, 0, 1)
        name.Font = Enum.Font.SourceSans
        name.Text = tostring(text)
        name.TextColor3 = Color3.fromRGB(255, 255, 255)
        name.TextSize = 15.000
        name.TextStrokeTransparency = 0.000
        name.TextXAlignment = Enum.TextXAlignment.Left
        name.ZIndex=5
        name.Size=UDim2.new(0,getTextSize(name).X+5,0,20)

        ImageButton.Position = UDim2.new(0, (getTextSize(name).X/1)*2, 0, 1)

        ImageButton.MouseEnter:connect(function()
            local function update()
                if renderSteppedConnection then renderSteppedConnection:disconnect() end 
                
                renderSteppedConnection=r.RenderStepped:connect(function()
                    local percent=math.clamp(((m.X-ImageButton.AbsolutePosition.X)/(ImageButton.AbsoluteSize.X)),0,1)
                    toggles[flag]=math.floor(min+(max-min)*percent)
                    number.Text=tostring(toggles[flag])

                    if callback then
                        local s, e = pcall(function()
                            callback(toggles[flag])
                        end)

                        if not s then warn("error: ".. e) end
                    end
                    Frame.Position=UDim2.new(math.clamp(percent,0,0.945),3,0,3)
                end)
            end

            local function disconnect()
                if renderSteppedConnection then renderSteppedConnection:Disconnect() end
                if inputBeganConnection then inputBeganConnection:Disconnect() end
                if inputEndedConnection then inputEndedConnection:Disconnect() end
                if mouseLeaveConnection then mouseLeaveConnection:Disconnect() end
                if mouseUpConnection then mouseUpConnection:Disconnect() end
            end

            inputBeganConnection=ImageButton.InputBegan:connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    update()
                end
            end)

            inputEndedConnection=ImageButton.InputEnded:connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    disconnect()
                end
            end)

            mouseDownConnection=ImageButton.MouseButton1Down:connect(update)

            mouseUpConnection=uis.InputEnded:connect(function(a, b)
                if a.UserInputType==Enum.UserInputType.MouseButton1 and(mouseDownConnection.Connected) then
                    disconnect()
                end
            end)
        end)

        if toggles[flag] then
            local percent=1-((max-toggles[flag])/(max-min))
            number.Text=tostring(toggles[flag])
            Frame.Position=UDim2.new(math.clamp(percent,0,0.945),3,0,3)
        end;IncreaseSize()
    end;

    function Button(text,callback)
        local Button = Instance.new("Frame")
        local Button_2 = Instance.new("ImageButton")
        local Label = Instance.new("TextLabel")

        Button.Name = "Button"
        Button.Parent = main_2
        Button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Button.BackgroundTransparency = 1.000
        Button.ClipsDescendants = true
        Button.Position = UDim2.new(0, 0, 0.137055844, 0)
        Button.Size = UDim2.new(0, 65+13, 0, 24)
        Button.ZIndex = 7

        Button_2.Name = "Button"
        Button_2.Parent = Button
        Button_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Button_2.BackgroundTransparency = 1.000
        Button_2.Position = UDim2.new(0, 13, 0, 1)
        Button_2.Size = UDim2.new(0, 60, 0, 20)
        Button_2.ZIndex = 7
        Button_2.Image = "rbxassetid://3570695787"
        Button_2.ImageColor3 = Color3.fromRGB(118, 118, 118)
        Button_2.ImageTransparency = 0.500
        Button_2.ScaleType = Enum.ScaleType.Slice
        Button_2.SliceCenter = Rect.new(100, 100, 100, 100)
        Button_2.SliceScale = 0.020

        Label.Name = "Label"
        Label.Parent = Button_2
        Label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Label.BackgroundTransparency = 1.000
        Label.Size = UDim2.new(1, 0, 1, 0)
        Label.ZIndex = 7
        Label.Font = Enum.Font.SourceSans
        Label.Text = tostring(text)
        Label.TextColor3 = Color3.fromRGB(255, 255, 255)
        Label.TextSize = 15.000
        Label.TextStrokeTransparency = 0.000

        Button_2.MouseButton1Click:Connect(function()
            if callback then
                local s,e=pcall(function()callback(toggles[flag])end)
                if not s then warn("error: "..e)end
            end
        end)
        Button_2.Size=UDim2.new(0,getTextSize(Label).X+10,0,20)
    end;
end

do --HUB
    if ID==3102144307 then
        local remote=rs.Remotes
        Toggle('Auto Click','auto_click',false)
        Toggle('Auto Rebirth','auto_rebirth',false)
        Button('Codeem',function()
            local list={
                'LikeYenBoost';
                'SpradenCapped';
                'ClickBoost';
                'LuckyLikeGoal';
                'SuperClicks';
                'Gift of Giving';
                'MonsterYen';
                'Release';
            };
            for i,_ in next,list do
                remote.RedeemCode:InvokeServer(_)
            end;
        end)
        coroutine.resume(coroutine.create(function()
            while wait() and Input.Parent~=nil do
                if toggles['auto_click']then
                    remote.ClickRemote:FireServer(true,'Clicker!')
                end;
                if toggles['auto_rebirth']then
                    remote.RebirthRemote:FireServer(13)
                end;
            end;
        end));
    end;
end