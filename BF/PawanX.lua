if game.PlaceId == 2753915549 or game.PlaceId == 4442272183 or game.PlaceId == 7449423635 then
    _G.Color = Color3.fromRGB(255, 0, 0)
    if not game:IsLoaded() then
        repeat
            game.Loaded:Wait()
        until game:IsLoaded()
    end

    repeat
        wait()
    until game:GetService("Players")

    if not game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        repeat
            wait()
        until game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    end

    wait(1)

    do
        local ui = game.CoreGui:FindFirstChild("UlLib")
        if ui then
            ui:Destroy()
        end
    end

    local UserInputService = game:GetService("UserInputService")
    local TweenService = game:GetService("TweenService")

    local function MakeDraggable(topbarobject, object)
        local Dragging = nil
        local DragInput = nil
        local DragStart = nil
        local StartPosition = nil

        local function Update(input)
            local Delta = input.Position - DragStart
            local pos = UDim2.new(StartPosition.X.Scale, StartPosition.X.Offset + Delta.X, StartPosition.Y.Scale,
                StartPosition.Y.Offset + Delta.Y)
            local Tween = TweenService:Create(object, TweenInfo.new(0.2), {
                Position = pos
            })
            Tween:Play()
        end

        topbarobject.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                Dragging = true
                DragStart = input.Position
                StartPosition = object.Position

                input.Changed:Connect(function()
                    if input.UserInputState == Enum.UserInputState.End then
                        Dragging = false
                    end
                end)
            end
        end)

        topbarobject.InputChanged:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType ==
                Enum.UserInputType.Touch then
                DragInput = input
            end
        end)

        UserInputService.InputChanged:Connect(function(input)
            if input == DragInput and Dragging then
                Update(input)
            end
        end)
    end

    local library = {}

    function library:AddWindow(text, keybind)
        local bind = keybind or Enum.KeyCode.RightControl
        local ff = false
        local currenttab = ""

        local DoctorShiba = Instance.new("ScreenGui")
        DoctorShiba.Name = "UlLib"
        DoctorShiba.Parent = game.CoreGui
        DoctorShiba.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

        local Main = Instance.new("Frame")
        Main.Name = "Main"
        Main.Parent = DoctorShiba
        Main.AnchorPoint = Vector2.new(0.5, 0.5)
        Main.BackgroundColor3 = Color3.fromRGB(30, 28, 39)
        Main.BackgroundTransparency = 0.100
        Main.BorderSizePixel = 0
        Main.ClipsDescendants = true
        Main.Position = UDim2.new(0.499526083, 0, 0.499241292, 0)
        Main.Size = UDim2.new(0, 600, 0, 350)

        local Top = Instance.new("Frame")
        Top.Name = "Top"
        Top.Parent = Main
        Top.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Top.BackgroundTransparency = 1.000
        Top.BorderSizePixel = 0
        Top.Size = UDim2.new(0, 600, 0, 20)

        local Page = Instance.new("Frame")
        Page.Name = "Page"
        Page.Parent = Main
        Page.BackgroundColor3 = Color3.fromRGB(25, 23, 35)
        Page.BackgroundTransparency = 0.100
        Page.BorderSizePixel = 0
        Page.Size = UDim2.new(0, 125, 0, 350)

        local NameHub = Instance.new("TextLabel")
        NameHub.Name = "NameHub"
        NameHub.Parent = Page
        NameHub.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        NameHub.BackgroundTransparency = 1.000
        NameHub.Position = UDim2.new(0.113333493, 0, 0, 0)
        NameHub.Size = UDim2.new(0, 110, 0, 20)
        NameHub.Font = Enum.Font.GothamSemibold
        NameHub.Text = text
        NameHub.TextColor3 = Color3.fromRGB(225, 0, 0)
        NameHub.TextSize = 11.000
        NameHub.TextXAlignment = Enum.TextXAlignment.Left

        local User = Instance.new("Frame")
        User.Name = "User"
        User.Parent = Page
        User.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        User.BackgroundTransparency = 1.000
        User.Position = UDim2.new(0, 0, 0.8, 30)
        User.Size = UDim2.new(0, 125, 0, 40)

        local UserText = Instance.new("TextLabel")
        UserText.Name = "UserText"
        UserText.Parent = User
        UserText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        UserText.BackgroundTransparency = 1.000
        UserText.Position = UDim2.new(0.354999989, 0, 0, 11)
        UserText.Size = UDim2.new(0, 80, 0, 20)
        UserText.Font = Enum.Font.Gotham
        UserText.Text = tostring(game.Players.LocalPlayer.Name)
        spawn(function()
            while wait() do
                pcall(function()
                    wait(0.1)
                    game:GetService('TweenService'):Create(UserText, TweenInfo.new(1, Enum.EasingStyle.Linear,
                        Enum.EasingDirection.InOut), {
                        TextColor3 = Color3.fromRGB(255, 0, 0)
                    }):Play()
                    wait(.5)
                    game:GetService('TweenService'):Create(UserText, TweenInfo.new(1, Enum.EasingStyle.Linear,
                        Enum.EasingDirection.InOut), {
                        TextColor3 = Color3.fromRGB(255, 155, 0)
                    }):Play()
                    wait(.5)
                    game:GetService('TweenService'):Create(UserText, TweenInfo.new(1, Enum.EasingStyle.Linear,
                        Enum.EasingDirection.InOut), {
                        TextColor3 = Color3.fromRGB(255, 255, 0)
                    }):Play()
                    wait(.5)
                    game:GetService('TweenService'):Create(UserText, TweenInfo.new(1, Enum.EasingStyle.Linear,
                        Enum.EasingDirection.InOut), {
                        TextColor3 = Color3.fromRGB(0, 255, 0)
                    }):Play()
                    wait(.5)
                    game:GetService('TweenService'):Create(UserText, TweenInfo.new(1, Enum.EasingStyle.Linear,
                        Enum.EasingDirection.InOut), {
                        TextColor3 = Color3.fromRGB(0, 255, 255)
                    }):Play()
                    wait(.5)
                    game:GetService('TweenService'):Create(UserText, TweenInfo.new(1, Enum.EasingStyle.Linear,
                        Enum.EasingDirection.InOut), {
                        TextColor3 = Color3.fromRGB(0, 155, 255)
                    }):Play()
                    wait(.5)
                    game:GetService('TweenService'):Create(UserText, TweenInfo.new(1, Enum.EasingStyle.Linear,
                        Enum.EasingDirection.InOut), {
                        TextColor3 = Color3.fromRGB(255, 0, 255)
                    }):Play()
                    wait(.5)
                    game:GetService('TweenService'):Create(UserText, TweenInfo.new(1, Enum.EasingStyle.Linear,
                        Enum.EasingDirection.InOut), {
                        TextColor3 = Color3.fromRGB(255, 0, 155)
                    }):Play()
                    wait(.5)
                end)
            end
        end)
        UserText.TextScaled = true
        UserText.TextSize = 11.000
        UserText.TextWrapped = true
        UserText.TextXAlignment = Enum.TextXAlignment.Left

        local UITextSizeConstraint = Instance.new("UITextSizeConstraint")
        UITextSizeConstraint.Parent = UserText
        UITextSizeConstraint.MaxTextSize = 11

        local UserImage = Instance.new("ImageLabel")
        UserImage.Name = "UserImage"
        UserImage.Parent = User
        UserImage.BackgroundColor3 = Color3.fromRGB(225, 225, 225)
        UserImage.Position = UDim2.new(0, 10, 0, 9)
        UserImage.Size = UDim2.new(0, 25, 0, 25)
        UserImage.Image =
            "https://www.roblox.com/headshot-thumbnail/image?userId=" .. game.Players.LocalPlayer.UserId ..
                "&width=420&height=420&format=png"

        local UserImageCorner = Instance.new("UICorner")
        UserImageCorner.CornerRadius = UDim.new(0, 100)
        UserImageCorner.Name = "UserImageCorner"
        UserImageCorner.Parent = UserImage

        local ScrollPage = Instance.new("ScrollingFrame")
        ScrollPage.Name = "ScrollPage"
        ScrollPage.Parent = Page
        ScrollPage.Active = true
        ScrollPage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        ScrollPage.BackgroundTransparency = 1.000
        ScrollPage.BorderSizePixel = 0
        ScrollPage.Position = UDim2.new(0, 0, 0.086, 0)
        ScrollPage.Size = UDim2.new(0, 125, 0, 290)
        ScrollPage.CanvasSize = UDim2.new(0, 0, 0, 0)
        ScrollPage.ScrollBarThickness = 0
        local PageList = Instance.new("UIListLayout")
        PageList.Name = "PageList"
        PageList.Parent = ScrollPage
        PageList.SortOrder = Enum.SortOrder.LayoutOrder
        PageList.Padding = UDim.new(0, 7)

        local PagePadding = Instance.new("UIPadding")
        PagePadding.Name = "PagePadding"
        PagePadding.Parent = ScrollPage
        PagePadding.PaddingTop = UDim.new(0, 5)
        PagePadding.PaddingLeft = UDim.new(0, 28)

        local TabFolder = Instance.new("Folder")
        TabFolder.Name = "TabFolder"
        TabFolder.Parent = Main

        MakeDraggable(Top, Main)

        local uihide = false

        UserInputService.InputBegan:Connect(function(input)
            if input.KeyCode == bind then
                if uihide == false then
                    uihide = true
                    Main:TweenSize(UDim2.new(0, 0, 0, 0), "In", "Quad", 0.2, true)
                else
                    uihide = false
                    Main:TweenSize(UDim2.new(0, 600, 0, 350), "Out", "Quad", 0.2, true)
                end
            end
        end)

        local uitab = {}

        function uitab:AddTab(text, image)
            local Image = image or 6023426915

            local PageButton = Instance.new("TextButton")
            PageButton.Name = "PageButton"
            PageButton.Parent = ScrollPage
            PageButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            PageButton.BackgroundTransparency = 1.000
            PageButton.BorderSizePixel = 0
            PageButton.Position = UDim2.new(0.224000007, 0, 0.029787235, 0)
            PageButton.Size = UDim2.new(0, 97, 0, 20)
            PageButton.AutoButtonColor = false
            PageButton.Font = Enum.Font.GothamSemibold
            PageButton.Text = text
            PageButton.TextColor3 = Color3.fromRGB(225, 225, 225)
            PageButton.TextSize = 11.000
            PageButton.TextXAlignment = Enum.TextXAlignment.Left

            local PageImage = Instance.new("ImageLabel")
            PageImage.Name = "PageImage"
            PageImage.Parent = PageButton
            PageImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            PageImage.BackgroundTransparency = 1.000
            PageImage.Position = UDim2.new(0, -20, 0, 3)
            PageImage.Size = UDim2.new(0, 15, 0, 15)
            PageImage.Image = "rbxassetid://" .. tostring(Image)

            local MainTab = Instance.new("Frame")
            MainTab.Name = "MainTab"
            MainTab.Parent = TabFolder
            MainTab.BackgroundColor3 = Color3.fromRGB(30, 28, 39)
            MainTab.BorderSizePixel = 0
            MainTab.Position = UDim2.new(0.208333328, 0, 0, 0)
            MainTab.Size = UDim2.new(0, 475, 0, 350)
            MainTab.Visible = false

            local ScrollTab = Instance.new("ScrollingFrame")
            ScrollTab.Name = "ScrollTab"
            ScrollTab.Parent = MainTab
            ScrollTab.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ScrollTab.BackgroundTransparency = 1.000
            ScrollTab.BorderSizePixel = 0
            ScrollTab.Position = UDim2.new(0, 0, 0.057, 0)
            ScrollTab.Size = UDim2.new(0, 475, 0, 330)
            ScrollTab.CanvasSize = UDim2.new(0, 0, 0, 0)
            ScrollTab.ScrollBarThickness = 3

            local TabList = Instance.new("UIListLayout")
            TabList.Name = "TabList"
            TabList.Parent = ScrollTab
            TabList.SortOrder = Enum.SortOrder.LayoutOrder
            TabList.Padding = UDim.new(0, 5)

            local TabPadding = Instance.new("UIPadding")
            TabPadding.Name = "TabPadding"
            TabPadding.Parent = ScrollTab
            TabPadding.PaddingLeft = UDim.new(0, 10)
            TabPadding.PaddingTop = UDim.new(0, 10)

            PageButton.MouseButton1Click:Connect(function()
                currenttab = MainTab.Name
                for i, v in next, TabFolder:GetChildren() do
                    if v.Name == "MainTab" then
                        v.Visible = false
                    end
                end
                MainTab.Visible = true

                for i, v in next, ScrollPage:GetChildren() do
                    if v:IsA("TextButton") then
                        TweenService:Create(v, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                            TextColor3 = Color3.fromRGB(225, 225, 225)
                        }):Play()
                    end
                    TweenService:Create(PageButton, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {
                            TextColor3 = Color3.fromRGB(255, 0, 0)
                        }):Play()
                end
            end)

            if ff == false then
                TweenService:Create(PageButton, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                    TextColor3 = Color3.fromRGB(255, 0, 0)
                }):Play()
                for i, v in next, TabFolder:GetChildren() do
                    if v.Name == "MainTab" then
                        v.Visible = false
                    end
                    MainTab.Visible = true
                end
                ff = true
            end

            game:GetService("RunService").Stepped:Connect(function()
                pcall(function()
                    ScrollPage.CanvasSize = UDim2.new(0, 0, 0, PageList.AbsoluteContentSize.Y + 10)
                    ScrollTab.CanvasSize = UDim2.new(0, 0, 0, TabList.AbsoluteContentSize.Y + 30)
                end)
            end)

            local main = {}

            function main:AddButton(text, callback)
                local Button = Instance.new("TextButton")

                Button.Name = "Button"
                Button.Parent = ScrollTab
                Button.BackgroundColor3 = Color3.fromRGB(50, 48, 59)
                Button.BackgroundTransparency = 0.1
                Button.BorderSizePixel = 0
                Button.Size = UDim2.new(0, 455, 0, 30)
                Button.AutoButtonColor = false
                Button.Font = Enum.Font.Gotham
                Button.Text = text
                Button.TextColor3 = Color3.fromRGB(225, 225, 225)
                Button.TextSize = 11.000
                Button.TextWrapped = true

                local ButtonCorner = Instance.new("UICorner")
                ButtonCorner.Name = "ButtonCorner"
                ButtonCorner.CornerRadius = UDim.new(0, 5)
                ButtonCorner.Parent = Button

                Button.MouseEnter:Connect(function()
                    TweenService:Create(Button, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                        TextColor3 = Color3.fromRGB(255, 0, 0)
                    }):Play()
                end)

                Button.MouseLeave:Connect(function()
                    TweenService:Create(Button, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                        TextColor3 = Color3.fromRGB(225, 225, 225)
                    }):Play()
                end)

                Button.MouseButton1Click:Connect(function()
                    callback()
                    Button.TextSize = 0
                    TweenService:Create(Button, TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
                        TextSize = 11
                    }):Play()
                end)
            end

            function main:AddToggle(text, config, callback)
                local ToggleImage = Instance.new("Frame")

                local Toggle = Instance.new("TextButton")
                Toggle.Name = "Toggle"
                Toggle.Parent = ScrollTab
                Toggle.BackgroundColor3 = Color3.fromRGB(50, 48, 59)
                Toggle.BackgroundTransparency = 0.1
                Toggle.BorderSizePixel = 0
                Toggle.AutoButtonColor = false
                Toggle.Size = UDim2.new(0, 455, 0, 30)
                Toggle.Font = Enum.Font.SourceSans
                Toggle.Text = ""
                Toggle.TextColor3 = Color3.fromRGB(0, 0, 0)
                Toggle.TextSize = 14.000

                local ToggleCorner = Instance.new("UICorner")
                ToggleCorner.Name = "ToggleCorner"
                ToggleCorner.CornerRadius = UDim.new(0, 5)
                ToggleCorner.Parent = Toggle

                local ToggleLabel = Instance.new("TextLabel")
                ToggleLabel.Name = "ToggleLabel"
                ToggleLabel.Parent = Toggle
                ToggleLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                ToggleLabel.BackgroundTransparency = 1.000
                ToggleLabel.Position = UDim2.new(0, 13, 0, 0)
                ToggleLabel.Size = UDim2.new(0, 410, 0, 30)
                ToggleLabel.Font = Enum.Font.Gotham
                ToggleLabel.Text = text
                ToggleLabel.TextColor3 = Color3.fromRGB(225, 225, 225)
                ToggleLabel.TextSize = 11.000
                ToggleLabel.TextXAlignment = Enum.TextXAlignment.Left

                ToggleImage.Name = "ToggleImage"
                ToggleImage.Parent = Toggle
                ToggleImage.BackgroundColor3 = Color3.fromRGB(70, 68, 79)
                ToggleImage.Position = UDim2.new(0, 425, 0, 5)
                ToggleImage.BorderSizePixel = 0
                ToggleImage.Size = UDim2.new(0, 20, 0, 20)
                local ToggleImageCorner = Instance.new("UICorner")
                ToggleImageCorner.Name = "ToggleImageCorner"
                ToggleImageCorner.CornerRadius = UDim.new(0, 5)
                ToggleImageCorner.Parent = ToggleImage

                local ToggleImage2 = Instance.new("Frame")
                ToggleImage2.Name = "ToggleImage2"
                ToggleImage2.Parent = ToggleImage
                ToggleImage2.AnchorPoint = Vector2.new(0.5, 0.5)
                ToggleImage2.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
                ToggleImage2.Position = UDim2.new(0, 10, 0, 10)
                ToggleImage2.Visible = false

                local ToggleImage2Corner = Instance.new("UICorner")
                ToggleImage2Corner.Name = "ToggleImageCorner"
                ToggleImage2Corner.CornerRadius = UDim.new(0, 5)
                ToggleImage2Corner.Parent = ToggleImage2

                Toggle.MouseEnter:Connect(function()
                    TweenService:Create(ToggleLabel,
                        TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                            TextColor3 = Color3.fromRGB(255, 0, 0)
                        }):Play()
                end)

                Toggle.MouseLeave:Connect(function()
                    TweenService:Create(ToggleLabel,
                        TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                            TextColor3 = Color3.fromRGB(225, 225, 225)
                        }):Play()
                end)
                if config == nil then
                    config = false
                end
                local toggled = config or false
                Toggle.MouseButton1Click:Connect(function()
                    if toggled == false then
                        toggled = true
                        ToggleImage2.Visible = true
                        ToggleImage2:TweenSize(UDim2.new(0, 21, 0, 21), "In", "Quad", 0.1, true)
                    else
                        toggled = false
                        ToggleImage2:TweenSize(UDim2.new(0, 0, 0, 0), "In", "Quad", 0.1, true)
                        wait(0.1)
                        ToggleImage2.Visible = false
                    end
                    callback(toggled)
                end)

                if config == true then
                    ToggleImage2.Visible = true
                    ToggleImage2:TweenSize(UDim2.new(0, 21, 0, 21), "In", "Quad", 0.1, true)
                    toggled = true
                    callback(toggled)
                end
            end

            function main:AddTextbox(text, holder, disappear, callback)
                local Textboxx = Instance.new("Frame")
                local TextboxxCorner = Instance.new("UICorner")
                local TextboxTitle = Instance.new("TextLabel")
                local Textbox = Instance.new("TextBox")
                local TextboxCorner = Instance.new("UICorner")

                Textboxx.Name = "Textboxx"
                Textboxx.Parent = ScrollTab
                Textboxx.BackgroundColor3 = Color3.fromRGB(50, 48, 59)
                Textboxx.Size = UDim2.new(0, 455, 0, 30)

                TextboxxCorner.CornerRadius = UDim.new(0, 5)
                TextboxxCorner.Name = "TextboxxCorner"
                TextboxxCorner.Parent = Textboxx

                TextboxTitle.Name = "TextboxTitle"
                TextboxTitle.Parent = Textboxx
                TextboxTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                TextboxTitle.BackgroundTransparency = 1.000
                TextboxTitle.Position = UDim2.new(0, 15, 0, 0)
                TextboxTitle.Size = UDim2.new(0, 300, 0, 30)
                TextboxTitle.Font = Enum.Font.Gotham
                TextboxTitle.Text = text
                TextboxTitle.TextColor3 = Color3.fromRGB(225, 225, 225)
                TextboxTitle.TextSize = 11.000
                TextboxTitle.TextXAlignment = Enum.TextXAlignment.Left

                Textbox.Name = "Textbox"
                Textbox.Parent = Textboxx
                Textbox.BackgroundColor3 = Color3.fromRGB(30, 28, 39)
                Textbox.Position = UDim2.new(0, 310, 0, 5)
                Textbox.Size = UDim2.new(0, 140, 0, 20)
                Textbox.Font = Enum.Font.Gotham
                Textbox.Text = holder
                Textbox.TextColor3 = Color3.fromRGB(225, 225, 225)
                Textbox.TextSize = 11.000

                Textbox.FocusLost:Connect(function()
                    if #Textbox.Text > 0 then
                        callback(Textbox.Text)
                    end
                    if disappear then
                        Textbox.Text = ""
                    else
                        Textbox.Text = holder
                    end
                end)

                TextboxCorner.Name = "TextboxCorner"
                TextboxCorner.CornerRadius = UDim.new(0, 5)
                TextboxCorner.Parent = Textbox
            end

            function main:AddDropdown(text, table, callback)
                local Dropdown = Instance.new("Frame")
                local UICorner = Instance.new("UICorner")
                local DropButton = Instance.new("TextButton")
                local Droptitle = Instance.new("TextLabel")
                local DropScroll = Instance.new("ScrollingFrame")
                local DropdownList = Instance.new("UIListLayout")
                local DropdownPadding = Instance.new("UIPadding")
                local DropImage = Instance.new("ImageLabel")

                Dropdown.Name = "Dropdown"
                Dropdown.Parent = ScrollTab
                Dropdown.Active = true
                Dropdown.BackgroundColor3 = Color3.fromRGB(50, 48, 59)
                Dropdown.ClipsDescendants = true
                Dropdown.Size = UDim2.new(0, 455, 0, 30)

                UICorner.CornerRadius = UDim.new(0, 5)
                UICorner.Parent = Dropdown

                DropButton.Name = "DropButton"
                DropButton.Parent = Dropdown
                DropButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                DropButton.BackgroundTransparency = 1.000
                DropButton.Size = UDim2.new(0, 455, 0, 30)
                DropButton.Font = Enum.Font.SourceSans
                DropButton.Text = ""
                DropButton.TextColor3 = Color3.fromRGB(0, 0, 0)
                DropButton.TextSize = 14.000

                Droptitle.Name = "Droptitle"
                Droptitle.Parent = Dropdown
                Droptitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Droptitle.BackgroundTransparency = 1.000
                Droptitle.Position = UDim2.new(0.0281690136, 0, 0, 0)
                Droptitle.Size = UDim2.new(0, 410, 0, 30)
                Droptitle.Font = Enum.Font.Gotham
                Droptitle.Text = text .. " : "
                Droptitle.TextColor3 = Color3.fromRGB(225, 225, 225)
                Droptitle.TextSize = 11.000
                Droptitle.TextXAlignment = Enum.TextXAlignment.Left

                DropImage.Name = "DropImage"
                DropImage.Parent = Dropdown
                DropImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                DropImage.BackgroundTransparency = 1.000
                DropImage.Position = UDim2.new(0, 425, 0, 5)
                DropImage.Rotation = 0
                DropImage.Size = UDim2.new(0, 20, 0, 20)
                DropImage.Image = "rbxassetid://5012539403"

                DropScroll.Name = "DropScroll"
                DropScroll.Parent = Droptitle
                DropScroll.Active = true
                DropScroll.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                DropScroll.BackgroundTransparency = 1.000
                DropScroll.BorderSizePixel = 0
                DropScroll.Position = UDim2.new(-0.0317460336, 0, 1, 0)
                DropScroll.Size = UDim2.new(0, 455, 0, 70)
                DropScroll.CanvasSize = UDim2.new(0, 0, 0, 2)
                DropScroll.ScrollBarThickness = 2

                DropdownList.Name = "DropdownList"
                DropdownList.Parent = DropScroll
                DropdownList.SortOrder = Enum.SortOrder.LayoutOrder
                DropdownList.Padding = UDim.new(0, 5)

                DropdownPadding.Name = "DropdownPadding"
                DropdownPadding.Parent = DropScroll
                DropdownPadding.PaddingTop = UDim.new(0, 5)

                local isdropping = false

                for i, v in next, table do
                    local DropButton2 = Instance.new("TextButton")

                    DropButton2.Name = "DropButton2"
                    DropButton2.Parent = DropScroll
                    DropButton2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    DropButton2.BackgroundTransparency = 1.000
                    DropButton2.Size = UDim2.new(0, 455, 0, 30)
                    DropButton2.AutoButtonColor = false
                    DropButton2.Font = Enum.Font.Gotham
                    DropButton2.TextColor3 = Color3.fromRGB(225, 225, 225)
                    DropButton2.TextSize = 11.000
                    DropButton2.Text = tostring(v)

                    DropButton2.MouseEnter:Connect(function()
                        TweenService:Create(DropButton2,
                            TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                TextColor3 = Color3.fromRGB(255, 0, 0)
                            }):Play()
                    end)
                    DropButton2.MouseLeave:Connect(function()
                        TweenService:Create(DropButton2,
                            TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                TextColor3 = Color3.fromRGB(225, 225, 225)
                            }):Play()
                    end)

                    DropButton2.MouseButton1Click:Connect(function()
                        TweenService:Create(Dropdown,
                            TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                Size = UDim2.new(0, 455, 0, 30)
                            }):Play()
                        TweenService:Create(DropImage,
                            TweenInfo.new(0.3, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
                                Rotation = 0
                            }):Play()
                        Droptitle.Text = text .. " : " .. tostring(v)
                        callback(v)
                        isdropping = not isdropping
                        DropScroll.CanvasSize = UDim2.new(0, 0, 0, DropdownList.AbsoluteContentSize.Y + 10)
                    end)
                end

                DropButton.MouseButton1Click:Connect(function()
                    if isdropping == false then
                        isdropping = true
                        TweenService:Create(Dropdown,
                            TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                Size = UDim2.new(0, 455, 0, 100)
                            }):Play()
                        TweenService:Create(DropImage,
                            TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                Rotation = -180
                            }):Play()
                        DropScroll.CanvasSize = UDim2.new(0, 0, 0, DropdownList.AbsoluteContentSize.Y + 10)
                    else
                        isdropping = false
                        TweenService:Create(Dropdown,
                            TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                Size = UDim2.new(0, 455, 0, 30)
                            }):Play()
                        TweenService:Create(DropImage,
                            TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                Rotation = 0
                            }):Play()
                        DropScroll.CanvasSize = UDim2.new(0, 0, 0, DropdownList.AbsoluteContentSize.Y + 10)
                    end
                end)
                DropScroll.CanvasSize = UDim2.new(0, 0, 0, DropdownList.AbsoluteContentSize.Y + 10)

                local drop = {}

                function drop:Clear()
                    Droptitle.Text = tostring(text) .. " :"
                    TweenService:Create(Dropdown, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                        Size = UDim2.new(0, 455, 0, 30)
                    }):Play()
                    isdropping = false
                    for i, v in next, DropScroll:GetChildren() do
                        if v:IsA("TextButton") then
                            v:Destroy()
                        end
                    end
                end
                function drop:Add(t)
                    local DropButton2 = Instance.new("TextButton")

                    DropButton2.Name = "DropButton2"
                    DropButton2.Parent = DropScroll
                    DropButton2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    DropButton2.BackgroundTransparency = 1.000
                    DropButton2.Size = UDim2.new(0, 455, 0, 30)
                    DropButton2.AutoButtonColor = false
                    DropButton2.Font = Enum.Font.Gotham
                    DropButton2.TextColor3 = Color3.fromRGB(225, 225, 225)
                    DropButton2.TextSize = 11.000
                    DropButton2.Text = tostring(t)

                    DropButton2.MouseButton1Click:Connect(function()
                        TweenService:Create(Dropdown,
                            TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                Size = UDim2.new(0, 455, 0, 30)
                            }):Play()
                        TweenService:Create(DropImage,
                            TweenInfo.new(0.3, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
                                Rotation = 0
                            }):Play()
                        Droptitle.Text = text .. " : " .. tostring(t)
                        callback(t)
                        isdropping = not isdropping
                        DropScroll.CanvasSize = UDim2.new(0, 0, 0, DropdownList.AbsoluteContentSize.Y + 10)
                    end)
                end
                return drop
            end

            function main:AddSlider(text, min, max, set, callback)
                set = (math.clamp(set, min, max))
                if set > max then
                    set = max
                end

                local Slider = Instance.new("Frame")
                local UICorner = Instance.new("UICorner")
                local SliderTitle = Instance.new("TextLabel")
                local SliderValue = Instance.new("TextLabel")
                local SliderButton = Instance.new("TextButton")
                local Bar1 = Instance.new("Frame")
                local Bar = Instance.new("Frame")
                local UICorner_2 = Instance.new("UICorner")
                local CircleBar = Instance.new("Frame")
                local UICorner_3 = Instance.new("UICorner")
                local UICorner_4 = Instance.new("UICorner")

                Slider.Name = "Slider"
                Slider.Parent = ScrollTab
                Slider.BackgroundColor3 = Color3.fromRGB(50, 48, 59)
                Slider.Size = UDim2.new(0, 455, 0, 40)

                UICorner.CornerRadius = UDim.new(0, 5)
                UICorner.Parent = Slider

                SliderTitle.Name = "SliderTitle"
                SliderTitle.Parent = Slider
                SliderTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                SliderTitle.BackgroundTransparency = 1.000
                SliderTitle.Position = UDim2.new(0.0283286124, 0, 0, 0)
                SliderTitle.Size = UDim2.new(0, 290, 0, 20)
                SliderTitle.Font = Enum.Font.Gotham
                SliderTitle.Text = text
                SliderTitle.TextColor3 = Color3.fromRGB(225, 225, 225)
                SliderTitle.TextSize = 11.000
                SliderTitle.TextXAlignment = Enum.TextXAlignment.Left

                SliderValue.Name = "SliderValue"
                SliderValue.Parent = Slider
                SliderValue.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                SliderValue.BackgroundTransparency = 1.000
                SliderValue.Position = UDim2.new(0.887778878, 0, 0, 0)
                SliderValue.Size = UDim2.new(0, 40, 0, 20)
                SliderValue.Font = Enum.Font.Gotham
                SliderValue.Text = tostring(set and math.floor((set / max) * (max - min) + min) or 0)
                SliderValue.TextColor3 = Color3.fromRGB(225, 225, 225)
                SliderValue.TextSize = 11.000

                SliderButton.Name = "SliderButton"
                SliderButton.Parent = Slider
                SliderButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                SliderButton.BackgroundTransparency = 1.000
                SliderButton.Position = UDim2.new(0, 10, 0, 25)
                SliderButton.Size = UDim2.new(0, 435, 0, 5)
                SliderButton.AutoButtonColor = false
                SliderButton.Font = Enum.Font.SourceSans
                SliderButton.Text = ""
                SliderButton.TextColor3 = Color3.fromRGB(0, 0, 0)
                SliderButton.TextSize = 14.000

                Bar1.Name = "Bar1"
                Bar1.Parent = SliderButton
                Bar1.BackgroundColor3 = Color3.fromRGB(30, 28, 39)
                Bar1.Size = UDim2.new(0, 435, 0, 5)

                Bar.Name = "Bar"
                Bar.Parent = Bar1
                Bar.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
                Bar.Size = UDim2.new(set / max, 0, 0, 5)

                UICorner_2.CornerRadius = UDim.new(0, 100)
                UICorner_2.Parent = Bar

                CircleBar.Name = "CircleBar"
                CircleBar.Parent = Bar
                CircleBar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                CircleBar.Position = UDim2.new(1, -2, 0, -2)
                CircleBar.AnchorPoint = Vector2.new(0, 0.1)
                CircleBar.Size = UDim2.new(0, 10, 0, 10)

                UICorner_3.CornerRadius = UDim.new(0, 100)
                UICorner_3.Parent = CircleBar

                UICorner_4.CornerRadius = UDim.new(0, 100)
                UICorner_4.Parent = Bar1

                local mouse = game.Players.LocalPlayer:GetMouse()
                local uis = game:GetService("UserInputService")

                if Value == nil then
                    Value = set
                    pcall(function()
                        callback(Value)
                    end)
                end

                SliderButton.MouseButton1Down:Connect(function()
                    Value =
                        math.floor((((tonumber(max) - tonumber(min)) / 435) * Bar.AbsoluteSize.X) + tonumber(min)) or 0
                    pcall(function()
                        callback(Value)
                    end)
                    Bar.Size = UDim2.new(0, math.clamp(mouse.X - Bar.AbsolutePosition.X, 0, 435), 0, 5)
                    CircleBar.Position = UDim2.new(0, math.clamp(mouse.X - Bar.AbsolutePosition.X - 2, 0, 425), 0, -2)
                    moveconnection = mouse.Move:Connect(function()
                        SliderValue.Text = Value
                        Value = math.floor((((tonumber(max) - tonumber(min)) / 435) * Bar.AbsoluteSize.X) +
                                               tonumber(min))
                        pcall(function()
                            callback(Value)
                        end)
                        Bar.Size = UDim2.new(0, math.clamp(mouse.X - Bar.AbsolutePosition.X, 0, 435), 0, 5)
                        CircleBar.Position = UDim2.new(0, math.clamp(mouse.X - Bar.AbsolutePosition.X - 2, 0, 425), 0,
                            -2)
                    end)
                    releaseconnection = uis.InputEnded:Connect(function(Mouse)
                        if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then
                            Value = math.floor((((tonumber(max) - tonumber(min)) / 435) * Bar.AbsoluteSize.X) +
                                                   tonumber(min))
                            pcall(function()
                                callback(Value)
                            end)
                            Bar.Size = UDim2.new(0, math.clamp(mouse.X - Bar.AbsolutePosition.X, 0, 435), 0, 5)
                            CircleBar.Position = UDim2.new(0, math.clamp(mouse.X - Bar.AbsolutePosition.X - 2, 0, 425),
                                0, -2)
                            moveconnection:Disconnect()
                            releaseconnection:Disconnect()
                        end
                    end)
                end)
                releaseconnection = uis.InputEnded:Connect(function(Mouse)
                    if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then
                        Value = math.floor((((tonumber(max) - tonumber(min)) / 435) * Bar.AbsoluteSize.X) +
                                               tonumber(min))
                        SliderValue.Text = Value
                    end
                end)
            end
            function main:AddSeperator(text)
                local Seperator = Instance.new("Frame")
                local Sep1 = Instance.new("Frame")
                local SepLabel = Instance.new("TextLabel")
                local Sep2 = Instance.new("Frame")

                Seperator.Name = "Seperator"
                Seperator.Parent = ScrollTab
                Seperator.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Seperator.BackgroundTransparency = 1.000
                Seperator.ClipsDescendants = true
                Seperator.Size = UDim2.new(0, 455, 0, 20)

                Sep1.Name = "Sep1"
                Sep1.Parent = Seperator
                Sep1.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
                Sep1.BorderSizePixel = 0
                Sep1.Position = UDim2.new(0, 0, 0, 10)
                Sep1.Size = UDim2.new(0, 150, 0, 1)

                SepLabel.Name = "SepLabel"
                SepLabel.Parent = Seperator
                SepLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                SepLabel.BackgroundTransparency = 1.000
                SepLabel.Position = UDim2.new(0, 95, 0, 0)
                SepLabel.Size = UDim2.new(0, 255, 0, 20)
                SepLabel.Font = Enum.Font.Gotham
                SepLabel.Text = text
                SepLabel.TextColor3 = Color3.fromRGB(225, 225, 225)
                SepLabel.TextSize = 11.000

                Sep2.Name = "Sep2"
                Sep2.Parent = Seperator
                Sep2.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
                Sep2.BorderSizePixel = 0
                Sep2.Position = UDim2.new(0, 305, 0, 10)
                Sep2.Size = UDim2.new(0, 150, 0, 1)
            end
            function main:AddLine()
                local Line = Instance.new("Frame")
                local Linee = Instance.new("Frame")

                Line.Name = "Line"
                Line.Parent = ScrollTab
                Line.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Line.BackgroundTransparency = 1.000
                Line.ClipsDescendants = true
                Line.Size = UDim2.new(0, 455, 0, 20)

                Linee.Name = "Linee"
                Linee.Parent = Line
                Linee.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
                Linee.BorderSizePixel = 0
                Linee.Position = UDim2.new(0, 0, 0, 10)
                Linee.Size = UDim2.new(0, 455, 0, 1)
            end
            function main:AddLabel(text)
                local Label = Instance.new("TextLabel")
                local PaddingLabel = Instance.new("UIPadding")
                local labell = {}

                Label.Name = "Label"
                Label.Parent = ScrollTab
                Label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Label.BackgroundTransparency = 1.000
                Label.Size = UDim2.new(0, 455, 0, 20)
                Label.Font = Enum.Font.Gotham
                Label.TextColor3 = Color3.fromRGB(225, 225, 225)
                Label.TextSize = 11.000
                Label.Text = text
                Label.TextXAlignment = Enum.TextXAlignment.Left

                PaddingLabel.PaddingLeft = UDim.new(0, 10)
                PaddingLabel.Parent = Label
                PaddingLabel.Name = "PaddingLabel"

                function labell:Set(newtext)
                    Label.Text = newtext
                end

                return labell
            end

            return main
        end
        return uitab
    end

    --------------------------------------------------------------------
    if game.PlaceId == 2753915549 then
        World1 = true
    elseif game.PlaceId == 4442272183 then
        World2 = true
    elseif game.PlaceId == 7449423635 then
        World3 = true
    end

    function CheckQuest()
        local MyLevel = game.Players.LocalPlayer.Data.Level.Value
        if World1 then
            if MyLevel == 1 or MyLevel <= 9 or _G.Select_Mob_Farm == "Bandit [Lv. 5]" then -- Bandit
                Ms = "Bandit [Lv. 5]"
                NameQuest = "BanditQuest1"
                LevelQuest = 1
                NameMon = "Bandit"
                CFrameQuest = CFrame.new(1061.66699, 16.5166187, 1544.52905, -0.942978859, -3.33851502e-09, 0.332852632,
                    7.04340497e-09, 1, 2.99841325e-08, -0.332852632, 3.06188177e-08, -0.942978859)
                CFrameMon = CFrame.new(1199.31287, 52.2717781, 1536.91516, -0.929782331, 6.60215846e-08, -0.368109822,
                    3.9077392e-08, 1, 8.06501603e-08, 0.368109822, 6.06023249e-08, -0.929782331)
                SPAWNPOINT = "Default"
            elseif MyLevel == 10 or MyLevel <= 14 or _G.Select_Mob_Farm == "Monkey [Lv. 14]" then -- Monkey
                Ms = "Monkey [Lv. 14]"
                NameQuest = "JungleQuest"
                LevelQuest = 1
                NameMon = "Monkey"
                CFrameQuest = CFrame.new(-1604.12012, 36.8521118, 154.23732, 0.0648873374, -4.70858913e-06,
                    -0.997892559, 1.41431883e-07, 1, -4.70933674e-06, 0.997892559, 1.64442184e-07, 0.0648873374)
                CFrameMon = CFrame.new(-1502.74609, 98.5633316, 90.6417007, 0.836947978, 0, 0.547282517, -0, 1, -0,
                    -0.547282517, 0, 0.836947978)
                SPAWNPOINT = "Jungle"
            elseif MyLevel == 15 or MyLevel <= 29 or _G.Select_Mob_Farm == "Gorilla [Lv. 20]" then -- Gorilla
                Ms = "Gorilla [Lv. 20]"
                NameQuest = "JungleQuest"
                LevelQuest = 2
                NameMon = "Gorilla"
                CFrameQuest = CFrame.new(-1604.12012, 36.8521118, 154.23732, 0.0648873374, -4.70858913e-06,
                    -0.997892559, 1.41431883e-07, 1, -4.70933674e-06, 0.997892559, 1.64442184e-07, 0.0648873374)
                CFrameMon = CFrame.new(-1223.52808, 6.27936459, -502.292664, 0.310949147, -5.66602516e-08, 0.950426519,
                    -3.37275488e-08, 1, 7.06501808e-08, -0.950426519, -5.40241736e-08, 0.310949147)
                SPAWNPOINT = "Jungle"
            elseif MyLevel == 30 or MyLevel <= 39 or _G.Select_Mob_Farm == "Pirate [Lv. 35]" then -- Pirate
                Ms = "Pirate [Lv. 35]"
                NameQuest = "BuggyQuest1"
                LevelQuest = 1
                NameMon = "Pirate"
                CFrameQuest = CFrame.new(-1139.59717, 4.75205183, 3825.16211, -0.959730506, -7.5857054e-09, 0.280922383,
                    -4.06310328e-08, 1, -1.11807175e-07, -0.280922383, -1.18718916e-07, -0.959730506)
                CFrameMon = CFrame.new(-1219.32324, 4.75205183, 3915.63452, -0.966492832, -6.91238853e-08, 0.25669381,
                    -5.21195496e-08, 1, 7.3047012e-08, -0.25669381, 5.72206496e-08, -0.966492832)
                SPAWNPOINT = "Pirate"
            elseif MyLevel == 40 or MyLevel <= 59 or _G.Select_Mob_Farm == "Brute [Lv. 45]" then -- Brute
                Ms = "Brute [Lv. 45]"
                NameQuest = "BuggyQuest1"
                LevelQuest = 2
                NameMon = "Brute"
                CFrameQuest = CFrame.new(-1139.59717, 4.75205183, 3825.16211, -0.959730506, -7.5857054e-09, 0.280922383,
                    -4.06310328e-08, 1, -1.11807175e-07, -0.280922383, -1.18718916e-07, -0.959730506)
                CFrameMon = CFrame.new(-1146.49646, 96.0936813, 4312.1333, -0.978175163, -1.53222057e-08, 0.207781896,
                    -3.33316912e-08, 1, -8.31738873e-08, -0.207781896, -8.82843523e-08, -0.978175163)
                SPAWNPOINT = "Pirate"
            elseif MyLevel == 60 or MyLevel <= 74 or _G.Select_Mob_Farm == "Desert Bandit [Lv. 60]" then -- Desert Bandit
                Ms = "Desert Bandit [Lv. 60]"
                NameQuest = "DesertQuest"
                LevelQuest = 1
                NameMon = "Desert Bandit"
                CFrameQuest = CFrame.new(897.031128, 6.43846416, 4388.97168, -0.804044724, 3.68233266e-08, 0.594568789,
                    6.97835176e-08, 1, 3.24365246e-08, -0.594568789, 6.75715199e-08, -0.804044724)
                CFrameMon = CFrame.new(932.788818, 6.4503746, 4488.24609, -0.998625934, 3.08948351e-08, 0.0524050146,
                    2.79967303e-08, 1, -5.60361286e-08, -0.0524050146, -5.44919629e-08, -0.998625934)
                SPAWNPOINT = "Desert"
            elseif MyLevel == 75 or MyLevel <= 89 or _G.Select_Mob_Farm == "Desert Officer [Lv. 70]" then -- Desert Officre
                Ms = "Desert Officer [Lv. 70]"
                NameQuest = "DesertQuest"
                LevelQuest = 2
                NameMon = "Desert Officer"
                CFrameQuest = CFrame.new(897.031128, 6.43846416, 4388.97168, -0.804044724, 3.68233266e-08, 0.594568789,
                    6.97835176e-08, 1, 3.24365246e-08, -0.594568789, 6.75715199e-08, -0.804044724)
                CFrameMon = CFrame.new(1580.03198, 4.61375761, 4366.86426, 0.135744005, -6.44280718e-08, -0.990743816,
                    4.35738308e-08, 1, -5.90598574e-08, 0.990743816, -3.51534837e-08, 0.135744005)
                SPAWNPOINT = "Desert"
            elseif MyLevel == 90 or MyLevel <= 99 or _G.Select_Mob_Farm == "Snow Bandit [Lv. 90]" then -- Snow Bandits
                Ms = "Snow Bandit [Lv. 90]"
                NameQuest = "SnowQuest"
                LevelQuest = 1
                NameMon = "Snow Bandits"
                CFrameQuest = CFrame.new(1384.14001, 87.272789, -1297.06482, 0.348555952, -2.53947841e-09, -0.937287986,
                    1.49860568e-08, 1, 2.86358204e-09, 0.937287986, -1.50443711e-08, 0.348555952)
                CFrameMon = CFrame.new(1370.24316, 102.403511, -1411.52905, 0.980274439, -1.12995728e-08, 0.197641045,
                    -9.57343449e-09, 1, 1.04655214e-07, -0.197641045, -1.04482936e-07, 0.980274439)
                SPAWNPOINT = "Ice"
            elseif MyLevel == 100 or MyLevel <= 119 or _G.Select_Mob_Farm == "Snowman [Lv. 100]" then -- Snowman
                Ms = "Snowman [Lv. 100]"
                NameQuest = "SnowQuest"
                LevelQuest = 2
                NameMon = "Snowman"
                CFrameQuest = CFrame.new(1384.14001, 87.272789, -1297.06482, 0.348555952, -2.53947841e-09, -0.937287986,
                    1.49860568e-08, 1, 2.86358204e-09, 0.937287986, -1.50443711e-08, 0.348555952)
                CFrameMon = CFrame.new(1370.24316, 102.403511, -1411.52905, 0.980274439, -1.12995728e-08, 0.197641045,
                    -9.57343449e-09, 1, 1.04655214e-07, -0.197641045, -1.04482936e-07, 0.980274439)
                SPAWNPOINT = "Ice"
            elseif MyLevel == 120 or MyLevel <= 149 or _G.Select_Mob_Farm == "Chief Petty Officer [Lv. 120]" then -- Chief Petty Officer
                Ms = "Chief Petty Officer [Lv. 120]"
                NameQuest = "MarineQuest2"
                LevelQuest = 1
                NameMon = "Chief Petty Officer"
                CFrameQuest = CFrame.new(-5035.0835, 28.6520386, 4325.29443, 0.0243340395, -7.08064647e-08, 0.999703884,
                    -6.36926814e-08, 1, 7.23777944e-08, -0.999703884, -6.54350671e-08, 0.0243340395)
                CFrameMon = CFrame.new(-4882.8623, 22.6520386, 4255.53516, 0.273695946, -5.40380647e-08, -0.96181643,
                    4.37720793e-08, 1, -4.37274998e-08, 0.96181643, -3.01326679e-08, 0.273695946)
                SPAWNPOINT = "MarineBase"
            elseif MyLevel == 150 or MyLevel <= 174 or _G.Select_Mob_Farm == "Sky Bandit [Lv. 150]" then -- Sky Bandit
                Ms = "Sky Bandit [Lv. 150]"
                NameQuest = "SkyQuest"
                LevelQuest = 1
                NameMon = "Sky Bandit"
                CFrameQuest = CFrame.new(-4841.83447, 717.669617, -2623.96436, -0.875942111, 5.59710216e-08,
                    -0.482416272, 3.04023082e-08, 1, 6.08195947e-08, 0.482416272, 3.86078725e-08, -0.875942111)
                CFrameMon = CFrame.new(-4970.74219, 294.544342, -2890.11353, -0.994874597, -8.61311236e-08,
                    -0.101116329, -9.10836206e-08, 1, 4.43614923e-08, 0.101116329, 5.33441664e-08, -0.994874597)
                SPAWNPOINT = "Sky"
            elseif MyLevel == 175 or MyLevel <= 189 or _G.Select_Mob_Farm == "Dark Master [Lv. 175]" then -- Dark Master
                Ms = "Dark Master [Lv. 175]"
                NameQuest = "SkyQuest"
                LevelQuest = 2
                NameMon = "Dark Master"
                CFrameQuest = CFrame.new(-4841.83447, 717.669617, -2623.96436, -0.875942111, 5.59710216e-08,
                    -0.482416272, 3.04023082e-08, 1, 6.08195947e-08, 0.482416272, 3.86078725e-08, -0.875942111)
                CFrameMon = CFrame.new(-5220.58594, 430.693298, -2278.17456, -0.925375521, 1.12086873e-08, 0.379051805,
                    -1.05115507e-08, 1, -5.52320891e-08, -0.379051805, -5.50948407e-08, -0.925375521)
                SPAWNPOINT = "Sky"
            elseif MyLevel == 190 or MyLevel <= 209 or _G.Select_Mob_Farm == "Prisoner [Lv. 190]" then
                Ms = "Prisoner [Lv. 190]"
                NameQuest = "PrisonerQuest"
                LevelQuest = 1
                NameMon = "Prisoner"
                CFrameQuest = CFrame.new(5308.93115, 1.65517521, 475.120514, -0.0894274712, -5.00292918e-09,
                    -0.995993316, 1.60817859e-09, 1, -5.16744869e-09, 0.995993316, -2.06384709e-09, -0.0894274712)
                CFrameMon = CFrame.new(5433.39307, 88.678093, 514.986877, 0.879988372, 0, -0.474995494, 0, 1, 0,
                    0.474995494, 0, 0.879988372)
                SPAWNPOINT = "Prison"
            elseif MyLevel == 210 or MyLevel <= 249 or _G.Select_Mob_Farm == "Dangerous Prisoner [Lv. 210]" then
                Ms = "Dangerous Prisoner [Lv. 210]"
                NameQuest = "PrisonerQuest"
                LevelQuest = 2
                NameMon = "Dangerous Prisoner"
                CFrameQuest = CFrame.new(5308.93115, 1.65517521, 475.120514, -0.0894274712, -5.00292918e-09,
                    -0.995993316, 1.60817859e-09, 1, -5.16744869e-09, 0.995993316, -2.06384709e-09, -0.0894274712)
                CFrameMon = CFrame.new(5433.39307, 88.678093, 514.986877, 0.879988372, 0, -0.474995494, 0, 1, 0,
                    0.474995494, 0, 0.879988372)
                SPAWNPOINT = "Prison"
            elseif MyLevel == 250 or MyLevel <= 274 or _G.Select_Mob_Farm == "Toga Warrior [Lv. 225]" then -- Toga Warrior
                Ms = "Toga Warrior [Lv. 250]"
                NameQuest = "ColosseumQuest"
                LevelQuest = 1
                NameMon = "Toga Warrior"
                CFrameQuest = CFrame.new(-1576.11743, 7.38933945, -2983.30762, 0.576966345, 1.22114863e-09, 0.816767931,
                    -3.58496594e-10, 1, -1.24185606e-09, -0.816767931, 4.2370063e-10, 0.576966345)
                CFrameMon = CFrame.new(-1779.97583, 44.6077499, -2736.35474, 0.984437346, 4.10396339e-08, 0.175734788,
                    -3.62286876e-08, 1, -3.05844168e-08, -0.175734788, 2.3741821e-08, 0.984437346)
                SPAWNPOINT = "Colosseum"
            elseif MyLevel == 275 or MyLevel <= 299 or _G.Select_Mob_Farm == "Gladiator [Lv. 275]" then -- Gladiato
                Ms = "Gladiator [Lv. 275]"
                NameQuest = "ColosseumQuest"
                LevelQuest = 2
                NameMon = "Gladiato"
                CFrameQuest = CFrame.new(-1576.11743, 7.38933945, -2983.30762, 0.576966345, 1.22114863e-09, 0.816767931,
                    -3.58496594e-10, 1, -1.24185606e-09, -0.816767931, 4.2370063e-10, 0.576966345)
                CFrameMon = CFrame.new(-1274.75903, 58.1895943, -3188.16309, 0.464524001, 6.21005611e-08, 0.885560572,
                    -4.80449414e-09, 1, -6.76054768e-08, -0.885560572, 2.71497012e-08, 0.464524001)
                SPAWNPOINT = "Colosseum"
            elseif MyLevel == 300 or MyLevel <= 324 or _G.Select_Mob_Farm == "Military Soldier [Lv. 300]" then -- Military Soldier
                Ms = "Military Soldier [Lv. 300]"
                NameQuest = "MagmaQuest"
                LevelQuest = 1
                NameMon = "Military Soldier"
                CFrameQuest = CFrame.new(-5316.55859, 12.2370615, 8517.2998, 0.588437557, -1.37880001e-08, -0.808542669,
                    -2.10116209e-08, 1, -3.23446478e-08, 0.808542669, 3.60215964e-08, 0.588437557)
                CFrameMon = CFrame.new(-5363.01123, 41.5056877, 8548.47266, -0.578253984, -3.29503091e-10, 0.815856814,
                    9.11209668e-08, 1, 6.498761e-08, -0.815856814, 1.11920997e-07, -0.578253984)
                SPAWNPOINT = "Magma"
            elseif MyLevel == 325 or MyLevel <= 374 or _G.Select_Mob_Farm == "Military Spy [Lv. 330]" then -- Military Spy
                Ms = "Military Spy [Lv. 325]"
                NameQuest = "MagmaQuest"
                LevelQuest = 2
                NameMon = "Military Spy"
                CFrameQuest = CFrame.new(-5316.55859, 12.2370615, 8517.2998, 0.588437557, -1.37880001e-08, -0.808542669,
                    -2.10116209e-08, 1, -3.23446478e-08, 0.808542669, 3.60215964e-08, 0.588437557)
                CFrameMon = CFrame.new(-5787.99023, 120.864456, 8762.25293, -0.188358366, -1.84706277e-08, 0.982100308,
                    -1.23782129e-07, 1, -4.93306951e-09, -0.982100308, -1.22495649e-07, -0.188358366)
                SPAWNPOINT = "Magma"
            elseif MyLevel == 375 or MyLevel <= 399 or _G.Select_Mob_Farm == "Fishman Warrior [Lv. 375]" then -- Fishman Warrior
                Ms = "Fishman Warrior [Lv. 375]"
                NameQuest = "FishmanQuest"
                LevelQuest = 1
                NameMon = "Fishman Warrior"
                CFrameQuest = CFrame.new(61122.5625, 18.4716396, 1568.16504, 0.893533468, 3.95251609e-09, 0.448996574,
                    -2.34327455e-08, 1, 3.78297464e-08, -0.448996574, -4.43233645e-08, 0.893533468)
                CFrameMon = CFrame.new(60946.6094, 48.6735229, 1525.91687, -0.0817126185, 8.90751153e-08, 0.996655822,
                    2.00889794e-08, 1, -8.77269599e-08, -0.996655822, 1.28533992e-08, -0.0817126185)
                SPAWNPOINT = "Fountain"
            elseif MyLevel == 400 or MyLevel <= 449 or _G.Select_Mob_Farm == "Fishman Commando [Lv. 400]" then -- Fishman Commando
                Ms = "Fishman Commando [Lv. 400]"
                NameQuest = "FishmanQuest"
                LevelQuest = 2
                NameMon = "Fishman Commando"
                CFrameQuest = CFrame.new(61122.5625, 18.4716396, 1568.16504, 0.893533468, 3.95251609e-09, 0.448996574,
                    -2.34327455e-08, 1, 3.78297464e-08, -0.448996574, -4.43233645e-08, 0.893533468)
                CFrameMon = CFrame.new(61885.5039, 18.4828243, 1504.17896, 0.577502489, 0, -0.816389024, -0, 1.00000012,
                    -0, 0.816389024, 0, 0.577502489)
                SPAWNPOINT = "Fountain"
            elseif MyLevel == 450 or MyLevel <= 474 or _G.Select_Mob_Farm == "God's Guard [Lv. 450]" then -- God's Guards
                Ms = "God's Guard [Lv. 450]"
                NameQuest = "SkyExp1Quest"
                LevelQuest = 1
                NameMon = "God's Guards"
                CFrameQuest = CFrame.new(-4721.71436, 845.277161, -1954.20105, -0.999277651, -5.56969759e-09,
                    0.0380011722, -4.14751478e-09, 1, 3.75035256e-08, -0.0380011722, 3.73188307e-08, -0.999277651)
                CFrameMon = CFrame.new(-4716.95703, 853.089722, -1933.92542, -0.93441087, -6.77488776e-09, -0.356197298,
                    1.12145182e-08, 1, -4.84390199e-08, 0.356197298, -4.92565206e-08, -0.93441087)
                SPAWNPOINT = "Sky"
            elseif MyLevel == 475 or MyLevel <= 524 or _G.Select_Mob_Farm == "Shanda [Lv. 475]" then -- Shandas
                sky = false
                Ms = "Shanda [Lv. 475]"
                NameQuest = "SkyExp1Quest"
                LevelQuest = 2
                NameMon = "Shandas"
                CFrameQuest = CFrame.new(-7863.63672, 5545.49316, -379.826324, 0.362120807, -1.98046344e-08,
                    -0.93213129, 4.05822291e-08, 1, -5.48095125e-09, 0.93213129, -3.58431969e-08, 0.362120807)
                CFrameMon = CFrame.new(-7685.12354, 5601.05127, -443.171509, 0.150056243, 1.79768236e-08, -0.988677442,
                    6.67798661e-09, 1, 1.91962481e-08, 0.988677442, -9.48289181e-09, 0.150056243)
                SPAWNPOINT = "Sky"
            elseif MyLevel == 525 or MyLevel <= 549 or _G.Select_Mob_Farm == "Royal Squad [Lv. 525]" then -- Royal Squad
                sky = true
                Ms = "Royal Squad [Lv. 525]"
                NameQuest = "SkyExp2Quest"
                LevelQuest = 1
                NameMon = "Royal Squad"
                CFrameQuest = CFrame.new(-7902.66895, 5635.96387, -1411.71802, 0.0504222959, 2.5710392e-08, 0.998727977,
                    1.12541557e-07, 1, -3.14249675e-08, -0.998727977, 1.13982921e-07, 0.0504222959)
                CFrameMon = CFrame.new(-7685.02051, 5606.87842, -1442.729, 0.561947823, 7.69527464e-09, -0.827172697,
                    -4.24974544e-09, 1, 6.41599973e-09, 0.827172697, -9.01838604e-11, 0.561947823)
                SPAWNPOINT = "Sky2"
            elseif MyLevel == 550 or MyLevel <= 624 or _G.Select_Mob_Farm == "Royal Soldier [Lv. 550]" then -- Royal Soldier
                Dis = 240
                sky = true
                Ms = "Royal Soldier [Lv. 550]"
                NameQuest = "SkyExp2Quest"
                LevelQuest = 2
                NameMon = "Royal Soldier"
                CFrameQuest = CFrame.new(-7902.66895, 5635.96387, -1411.71802, 0.0504222959, 2.5710392e-08, 0.998727977,
                    1.12541557e-07, 1, -3.14249675e-08, -0.998727977, 1.13982921e-07, 0.0504222959)
                CFrameMon = CFrame.new(-7864.44775, 5661.94092, -1708.22351, 0.998389959, 2.28686137e-09, -0.0567218624,
                    1.99431383e-09, 1, 7.54200258e-08, 0.0567218624, -7.54117195e-08, 0.998389959)
                SPAWNPOINT = "Sky2"
            elseif MyLevel == 625 or MyLevel <= 649 or _G.Select_Mob_Farm == "Galley Pirate [Lv. 625]" then -- Galley Pirate
                Dis = 240
                sky = false
                Ms = "Galley Pirate [Lv. 625]"
                NameQuest = "FountainQuest"
                LevelQuest = 1
                NameMon = "Galley Pirate"
                CFrameQuest = CFrame.new(5254.60156, 38.5011406, 4049.69678, -0.0504891425, -3.62066501e-08,
                    -0.998724639, -9.87921389e-09, 1, -3.57534553e-08, 0.998724639, 8.06145284e-09, -0.0504891425)
                CFrameMon = CFrame.new(5595.06982, 41.5013695, 3961.47095, -0.992138803, -2.11610267e-08, -0.125142589,
                    -1.34249509e-08, 1, -6.26613996e-08, 0.125142589, -6.04887518e-08, -0.992138803)
                SPAWNPOINT = "Fountain"
            elseif MyLevel >= 650 or _G.Select_Mob_Farm == "Galley Captain [Lv. 650]" then -- Galley Captain
                Dis = 240
                Ms = "Galley Captain [Lv. 650]"
                NameQuest = "FountainQuest"
                LevelQuest = 2
                NameMon = "Galley Captain"
                CFrameQuest = CFrame.new(5254.60156, 38.5011406, 4049.69678, -0.0504891425, -3.62066501e-08,
                    -0.998724639, -9.87921389e-09, 1, -3.57534553e-08, 0.998724639, 8.06145284e-09, -0.0504891425)
                CFrameMon = CFrame.new(5658.5752, 38.5361786, 4928.93506, -0.996873081, 2.12391046e-06, -0.0790185928,
                    2.16989656e-06, 1, -4.96097414e-07, 0.0790185928, -6.66008248e-07, -0.996873081)
                SPAWNPOINT = "Fountain"
            end
        elseif World2 then
            if MyLevel == 700 or MyLevel <= 724 or _G.Select_Mob_Farm == "Raider [Lv. 700]" then -- Raider [Lv. 700]
                Ms = "Raider [Lv. 700]"
                NameQuest = "Area1Quest"
                LevelQuest = 1
                NameMon = "Raider"
                CFrameQuest = CFrame.new(-424.080078, 73.0055847, 1836.91589, 0.253544956, -1.42165932e-08, 0.967323601,
                    -6.00147771e-08, 1, 3.04272909e-08, -0.967323601, -6.5768397e-08, 0.253544956)
                CFrameMon = CFrame.new(-737.026123, 39.1748352, 2392.57959, 0.272128761, 0, -0.962260842, -0, 1, -0,
                    0.962260842, 0, 0.272128761)
                SPAWNPOINT = "DressTown"
            elseif MyLevel == 725 or MyLevel <= 774 or _G.Select_Mob_Farm == "Mercenary [Lv. 725]" then -- Mercenary [Lv. 725]
                Ms = "Mercenary [Lv. 725]"
                NameQuest = "Area1Quest"
                LevelQuest = 2
                NameMon = "Mercenary"
                CFrameQuest = CFrame.new(-424.080078, 73.0055847, 1836.91589, 0.253544956, -1.42165932e-08, 0.967323601,
                    -6.00147771e-08, 1, 3.04272909e-08, -0.967323601, -6.5768397e-08, 0.253544956)
                CFrameMon = CFrame.new(-973.731995, 95.8733215, 1836.46936, 0.999135971, 2.02326991e-08, -0.0415605344,
                    -1.90767793e-08, 1, 2.82094952e-08, 0.0415605344, -2.73922804e-08, 0.999135971)
                SPAWNPOINT = "DressTown"
            elseif MyLevel == 775 or MyLevel <= 799 or _G.Select_Mob_Farm == "Swan Pirate [Lv. 775]" then -- Swan Pirate [Lv. 775]
                Ms = "Swan Pirate [Lv. 775]"
                NameQuest = "Area2Quest"
                LevelQuest = 1
                NameMon = "Swan Pirate"
                CFrameQuest = CFrame.new(632.698608, 73.1055908, 918.666321, -0.0319722369, 8.96074881e-10,
                    -0.999488771, 1.36326533e-10, 1, 8.92172336e-10, 0.999488771, -1.07732087e-10, -0.0319722369)
                CFrameMon = CFrame.new(970.369446, 142.653198, 1217.3667, 0.162079468, -4.85452638e-08, -0.986777723,
                    1.03357589e-08, 1, -4.74980872e-08, 0.986777723, -2.50063148e-09, 0.162079468)
                SPAWNPOINT = "DressTown"
            elseif MyLevel == 800 or MyLevel <= 874 or _G.Select_Mob_Farm == "Factory Staff [Lv. 800]" then -- Factory Staff [Lv. 800]
                Ms = "Factory Staff [Lv. 800]"
                NameQuest = "Area2Quest"
                LevelQuest = 2
                NameMon = "Factory Staff"
                CFrameQuest = CFrame.new(632.698608, 73.1055908, 918.666321, -0.0319722369, 8.96074881e-10,
                    -0.999488771, 1.36326533e-10, 1, 8.92172336e-10, 0.999488771, -1.07732087e-10, -0.0319722369)
                CFrameMon = CFrame.new(296.786499, 72.9948196, -57.1298141, -0.876037002, -5.32364979e-08, 0.482243896,
                    -3.87658332e-08, 1, 3.99718729e-08, -0.482243896, 1.63222538e-08, -0.876037002)
                SPAWNPOINT = "DressTown"
            elseif MyLevel == 875 or MyLevel <= 899 or _G.Select_Mob_Farm == "Marine Lieutenant [Lv. 875]" then -- Marine Lieutenant [Lv. 875]
                Ms = "Marine Lieutenant [Lv. 875]"
                NameQuest = "MarineQuest3"
                LevelQuest = 1
                NameMon = "Marine Lieutenant"
                CFrameQuest = CFrame.new(-2442.65015, 73.0511475, -3219.11523, -0.873540044, 4.2329841e-08,
                    -0.486752301, 5.64383384e-08, 1, -1.43220786e-08, 0.486752301, -3.99823996e-08, -0.873540044)
                CFrameMon = CFrame.new(-2913.26367, 73.0011826, -2971.64282, 0.910507619, 0, 0.413492233, 0, 1.00000012,
                    0, -0.413492233, 0, 0.910507619)
                SPAWNPOINT = "Greenb"
            elseif MyLevel == 900 or MyLevel <= 949 or _G.Select_Mob_Farm == "Marine Captain [Lv. 900]" then -- Marine Captain [Lv. 900]
                Ms = "Marine Captain [Lv. 900]"
                NameQuest = "MarineQuest3"
                LevelQuest = 2
                NameMon = "Marine Captain"
                CFrameQuest = CFrame.new(-2442.65015, 73.0511475, -3219.11523, -0.873540044, 4.2329841e-08,
                    -0.486752301, 5.64383384e-08, 1, -1.43220786e-08, 0.486752301, -3.99823996e-08, -0.873540044)
                CFrameMon = CFrame.new(-1868.67688, 73.0011826, -3321.66333, -0.971402287, 1.06502087e-08, 0.237439692,
                    3.68856199e-08, 1, 1.06050372e-07, -0.237439692, 1.11775684e-07, -0.971402287)
                SPAWNPOINT = "Greenb"
            elseif MyLevel == 950 or MyLevel <= 974 or _G.Select_Mob_Farm == "Zombie [Lv. 950]" then -- Zombie [Lv. 950]
                Ms = "Zombie [Lv. 950]"
                NameQuest = "ZombieQuest"
                LevelQuest = 1
                NameMon = "Zombie"
                CFrameQuest = CFrame.new(-5492.79395, 48.5151672, -793.710571, 0.321800292, -6.24695815e-08,
                    0.946807742, 4.05616092e-08, 1, 5.21931227e-08, -0.946807742, 2.16082796e-08, 0.321800292)
                CFrameMon = CFrame.new(-5634.83838, 126.067039, -697.665039, -0.992770672, 6.77618939e-09, 0.120025545,
                    1.65461245e-08, 1, 8.04023372e-08, -0.120025545, 8.18070234e-08, -0.992770672)
                SPAWNPOINT = "Graveyard"
            elseif MyLevel == 975 or MyLevel <= 999 or _G.Select_Mob_Farm == "Vampire [Lv. 975]" then -- Vampire [Lv. 975]
                Ms = "Vampire [Lv. 975]"
                NameQuest = "ZombieQuest"
                LevelQuest = 2
                NameMon = "Vampire"
                CFrameQuest = CFrame.new(-5492.79395, 48.5151672, -793.710571, 0.321800292, -6.24695815e-08,
                    0.946807742, 4.05616092e-08, 1, 5.21931227e-08, -0.946807742, 2.16082796e-08, 0.321800292)
                CFrameMon = CFrame.new(-6030.32031, 6.4377408, -1313.5564, -0.856965423, 3.9138893e-08, -0.515373945,
                    -1.12178942e-08, 1, 9.45958547e-08, 0.515373945, 8.68467822e-08, -0.856965423)
                SPAWNPOINT = "Graveyard"
            elseif MyLevel == 1000 or MyLevel <= 1049 or _G.Select_Mob_Farm == "Snow Trooper [Lv. 1000]" then -- Snow Trooper [Lv. 1000] **
                Ms = "Snow Trooper [Lv. 1000]"
                NameQuest = "SnowMountainQuest"
                LevelQuest = 1
                NameMon = "Snow Trooper"
                CFrameQuest = CFrame.new(604.964966, 401.457062, -5371.69287, 0.353063971, 1.89520435e-08, -0.935599446,
                    -5.81846002e-08, 1, -1.70033754e-09, 0.935599446, 5.50377841e-08, 0.353063971)
                CFrameMon = CFrame.new(535.893433, 401.457062, -5329.6958, -0.999524176, 0, 0.0308452044, 0, 1, -0,
                    -0.0308452044, 0, -0.999524176)
                SPAWNPOINT = "Snowy"
            elseif MyLevel == 1050 or MyLevel <= 1099 or _G.Select_Mob_Farm == "Winter Warrior [Lv. 1050]" then -- Winter Warrior [Lv. 1050]
                Ms = "Winter Warrior [Lv. 1050]"
                NameQuest = "SnowMountainQuest"
                LevelQuest = 2
                NameMon = "Winter Warrior"
                CFrameQuest = CFrame.new(604.964966, 401.457062, -5371.69287, 0.353063971, 1.89520435e-08, -0.935599446,
                    -5.81846002e-08, 1, -1.70033754e-09, 0.935599446, 5.50377841e-08, 0.353063971)
                CFrameMon = CFrame.new(1223.7417, 454.575226, -5170.02148, 0.473996818, 2.56845354e-08, 0.880526543,
                    -5.62456428e-08, 1, 1.10811016e-09, -0.880526543, -5.00510211e-08, 0.473996818)
                SPAWNPOINT = "Snowy"
            elseif MyLevel == 1100 or MyLevel <= 1124 or _G.Select_Mob_Farm == "Lab Subordinate [Lv. 1100]" then -- Lab Subordinate [Lv. 1100]
                Ms = "Lab Subordinate [Lv. 1100]"
                NameQuest = "IceSideQuest"
                LevelQuest = 1
                NameMon = "Lab Subordinate"
                CFrameQuest = CFrame.new(-6060.10693, 15.9868021, -4904.7876, -0.411000341, -5.06538868e-07, 0.91163528,
                    1.26306062e-07, 1, 6.12581289e-07, -0.91163528, 3.66916197e-07, -0.411000341)
                CFrameMon = CFrame.new(-5769.2041, 37.9288292, -4468.38721, -0.569419742, -2.49055017e-08, 0.822046936,
                    -6.96206541e-08, 1, -1.79282633e-08, -0.822046936, -6.74401548e-08, -0.569419742)
                SPAWNPOINT = "CircleIslandIce"
            elseif MyLevel == 1125 or MyLevel <= 1174 or _G.Select_Mob_Farm == "Horned Warrior [Lv. 1125]" then -- Horned Warrior [Lv. 1125]
                Ms = "Horned Warrior [Lv. 1125]"
                NameQuest = "IceSideQuest"
                LevelQuest = 2
                NameMon = "Horned Warrior"
                CFrameQuest = CFrame.new(-6060.10693, 15.9868021, -4904.7876, -0.411000341, -5.06538868e-07, 0.91163528,
                    1.26306062e-07, 1, 6.12581289e-07, -0.91163528, 3.66916197e-07, -0.411000341)
                CFrameMon = CFrame.new(-6400.85889, 24.7645149, -5818.63574, -0.964845479, 8.65926566e-08, -0.262817472,
                    3.98261392e-07, 1, -1.13260398e-06, 0.262817472, -1.19745812e-06, -0.964845479)
                SPAWNPOINT = "CircleIslandIce"
            elseif MyLevel == 1175 or MyLevel <= 1199 or _G.Select_Mob_Farm == "Magma Ninja [Lv. 1175]" then -- Magma Ninja [Lv. 1175]
                Ms = "Magma Ninja [Lv. 1175]"
                NameQuest = "FireSideQuest"
                LevelQuest = 1
                NameMon = "Magma Ninja"
                CFrameQuest = CFrame.new(-5431.09473, 15.9868021, -5296.53223, 0.831796765, 1.15322464e-07,
                    -0.555080295, -1.10814341e-07, 1, 4.17010995e-08, 0.555080295, 2.68240168e-08, 0.831796765)
                CFrameMon = CFrame.new(-5496.65576, 58.6890411, -5929.76855, -0.885073781, 0, -0.465450764, 0,
                    1.00000012, -0, 0.465450764, 0, -0.885073781)
                SPAWNPOINT = "CircleIslandFire"
            elseif MyLevel == 1200 or MyLevel <= 1249 or _G.Select_Mob_Farm == "Lava Pirate [Lv. 1200]" then -- Lava Pirate [Lv. 1200]
                Ms = "Lava Pirate [Lv. 1200]"
                NameQuest = "FireSideQuest"
                LevelQuest = 2
                NameMon = "Lava Pirate"
                CFrameQuest = CFrame.new(-5431.09473, 15.9868021, -5296.53223, 0.831796765, 1.15322464e-07,
                    -0.555080295, -1.10814341e-07, 1, 4.17010995e-08, 0.555080295, 2.68240168e-08, 0.831796765)
                CFrameMon = CFrame.new(-5169.71729, 34.1234779, -4669.73633, -0.196780294, 0, 0.98044765, 0, 1.00000012,
                    -0, -0.98044765, 0, -0.196780294)
                SPAWNPOINT = "CircleIslandFire"
            elseif MyLevel == 1250 or MyLevel <= 1274 or _G.Select_Mob_Farm == "Ship Deckhand [Lv. 1250]" then -- Ship Deckhand [Lv. 1250]
                Ms = "Ship Deckhand [Lv. 1250]"
                NameQuest = "ShipQuest1"
                LevelQuest = 1
                NameMon = "Ship Deckhand"
                CFrameQuest = CFrame.new(1037.80127, 125.092171, 32911.6016, -0.244533166, -0, -0.969640911, -0,
                    1.00000012, -0, 0.96964103, 0, -0.244533136)
                CFrameMon = CFrame.new(1163.80872, 138.288452, 33058.4258, -0.998580813, 5.49076979e-08, -0.0532564968,
                    5.57436763e-08, 1, -1.42118655e-08, 0.0532564968, -1.71604082e-08, -0.998580813)
                SPAWNPOINT = "Ship"
            elseif MyLevel == 1275 or MyLevel <= 1299 or _G.Select_Mob_Farm == "Ship Engineer [Lv. 1275]" then -- Ship Engineer [Lv. 1275]
                Ms = "Ship Engineer [Lv. 1275]"
                NameQuest = "ShipQuest1"
                LevelQuest = 2
                NameMon = "Ship Engineer"
                CFrameQuest = CFrame.new(1037.80127, 125.092171, 32911.6016, -0.244533166, -0, -0.969640911, -0,
                    1.00000012, -0, 0.96964103, 0, -0.244533136)
                CFrameMon = CFrame.new(916.666504, 44.0920448, 32917.207, -0.99746871, -4.85034697e-08, -0.0711069331,
                    -4.8925461e-08, 1, 4.19294288e-09, 0.0711069331, 7.66126895e-09, -0.99746871)
                SPAWNPOINT = "Ship"
            elseif MyLevel == 1300 or MyLevel <= 1324 or _G.Select_Mob_Farm == "Ship Steward [Lv. 1300]" then -- Ship Steward [Lv. 1300]
                Ms = "Ship Steward [Lv. 1300]"
                NameQuest = "ShipQuest2"
                LevelQuest = 1
                NameMon = "Ship Steward"
                CFrameQuest = CFrame.new(968.80957, 125.092171, 33244.125, -0.869560242, 1.51905191e-08, -0.493826836,
                    1.44108379e-08, 1, 5.38534195e-09, 0.493826836, -2.43357912e-09, -0.869560242)
                CFrameMon = CFrame.new(918.743286, 129.591064, 33443.4609, -0.999792814, -1.7070947e-07, -0.020350717,
                    -1.72559169e-07, 1, 8.91351277e-08, 0.020350717, 9.2628369e-08, -0.999792814)
                SPAWNPOINT = "Ship"
            elseif MyLevel == 1325 or MyLevel <= 1349 or _G.Select_Mob_Farm == "Ship Officer [Lv. 1325]" then -- Ship Officer [Lv. 1325]
                Ms = "Ship Officer [Lv. 1325]"
                NameQuest = "ShipQuest2"
                LevelQuest = 2
                NameMon = "Ship Officer"
                CFrameQuest = CFrame.new(968.80957, 125.092171, 33244.125, -0.869560242, 1.51905191e-08, -0.493826836,
                    1.44108379e-08, 1, 5.38534195e-09, 0.493826836, -2.43357912e-09, -0.869560242)
                CFrameMon = CFrame.new(786.051941, 181.474106, 33303.2969, 0.999285698, -5.32193063e-08, 0.0377905183,
                    5.68968588e-08, 1, -9.62386864e-08, -0.0377905183, 9.83201005e-08, 0.999285698)
                SPAWNPOINT = "Ship"
            elseif MyLevel == 1350 or MyLevel <= 1374 or _G.Select_Mob_Farm == "Arctic Warrior [Lv. 1350]" then -- Arctic Warrior [Lv. 1350]
                Ms = "Arctic Warrior [Lv. 1350]"
                NameQuest = "FrostQuest"
                LevelQuest = 1
                NameMon = "Arctic Warrior"
                CFrameQuest = CFrame.new(5669.43506, 28.2117786, -6482.60107, 0.888092756, 1.02705066e-07, 0.459664226,
                    -6.20391774e-08, 1, -1.03572376e-07, -0.459664226, 6.34646895e-08, 0.888092756)
                CFrameMon = CFrame.new(5995.07471, 57.3188477, -6183.47314, 0.702747107, -1.53454167e-07, -0.711440146,
                    -1.08168464e-07, 1, -3.22542007e-07, 0.711440146, 3.03620908e-07, 0.702747107)
                SPAWNPOINT = "IceCastle"
            elseif MyLevel == 1375 or MyLevel <= 1424 or _G.Select_Mob_Farm == "Snow Lurker [Lv. 1375]" then -- Snow Lurker [Lv. 1375]
                Ms = "Snow Lurker [Lv. 1375]"
                NameQuest = "FrostQuest"
                LevelQuest = 2
                NameMon = "Snow Lurker"
                CFrameQuest = CFrame.new(5669.43506, 28.2117786, -6482.60107, 0.888092756, 1.02705066e-07, 0.459664226,
                    -6.20391774e-08, 1, -1.03572376e-07, -0.459664226, 6.34646895e-08, 0.888092756)
                CFrameMon = CFrame.new(5518.00684, 60.5559731, -6828.80518, -0.650781393, -3.64292951e-08, 0.759265184,
                    -4.07668654e-09, 1, 4.44854642e-08, -0.759265184, 2.58550248e-08, -0.650781393)
                SPAWNPOINT = "IceCastle"
            elseif MyLevel == 1425 or MyLevel <= 1449 or _G.Select_Mob_Farm == "Sea Soldier [Lv. 1425]" then -- Sea Soldier [Lv. 1425]
                Ms = "Sea Soldier [Lv. 1425]"
                NameQuest = "ForgottenQuest"
                LevelQuest = 1
                NameMon = "Sea Soldier"
                CFrameQuest = CFrame.new(-3052.99097, 236.881363, -10148.1943, -0.997911751, 4.42321983e-08,
                    0.064591676, 4.90968759e-08, 1, 7.37270085e-08, -0.064591676, 7.67442998e-08, -0.997911751)
                CFrameMon = CFrame.new(-3029.78467, 66.944252, -9777.38184, -0.998552859, 1.09555076e-08, 0.0537791774,
                    7.79564235e-09, 1, -5.89660658e-08, -0.0537791774, -5.84614881e-08, -0.998552859)
                SPAWNPOINT = "ForgottenIsland"
            elseif MyLevel >= 1450 or _G.Select_Mob_Farm == "Water Fighter [Lv. 1450]" then -- Water Fighter [Lv. 1450]
                Ms = "Water Fighter [Lv. 1450]"
                NameQuest = "ForgottenQuest"
                LevelQuest = 2
                NameMon = "Water Fighter"
                CFrameQuest = CFrame.new(-3052.99097, 236.881363, -10148.1943, -0.997911751, 4.42321983e-08,
                    0.064591676, 4.90968759e-08, 1, 7.37270085e-08, -0.064591676, 7.67442998e-08, -0.997911751)
                CFrameMon = CFrame.new(-3262.00098, 298.699615, -10553.6943, -0.233570755, -4.57538185e-08, 0.972339869,
                    -5.80986068e-08, 1, 3.30992194e-08, -0.972339869, -4.87605725e-08, -0.233570755)
                SPAWNPOINT = "ForgottenIsland"
            end
        elseif World3 then
            if MyLevel == 1500 or MyLevel <= 1524 or _G.Select_Mob_Farm == "Pirate Millionaire [Lv. 1500]" then
                Ms = "Pirate Millionaire [Lv. 1500]"
                NameQuest = "PiratePortQuest"
                LevelQuest = 1
                NameMon = "Pirate Millionaire"
                CFrameQuest = CFrame.new(-290.074677, 42.9034653, 5581.58984, 0.965929627, -0, -0.258804798, 0, 1, -0,
                    0.258804798, 0, 0.965929627)
                CFrameMon = CFrame.new(81.164993286133, 43.755737304688, 5724.7021484375)
                SPAWNPOINT = "Default"
            elseif MyLevel == 1525 or MyLevel <= 1574 or _G.Select_Mob_Farm == "Pistol Billionaire [Lv. 1525]" then
                Ms = "Pistol Billionaire [Lv. 1525]"
                NameQuest = "PiratePortQuest"
                LevelQuest = 2
                NameMon = "Pistol Billionaire"
                CFrameQuest = CFrame.new(-290.074677, 42.9034653, 5581.58984, 0.965929627, -0, -0.258804798, 0, 1, -0,
                    0.258804798, 0, 0.965929627)
                CFrameMon = CFrame.new(81.164993286133, 43.755737304688, 5724.7021484375)
                SPAWNPOINT = "Default"
            elseif MyLevel == 1575 or MyLevel <= 1599 or _G.Select_Mob_Farm == "Dragon Crew Warrior [Lv. 1575]" then
                Ms = "Dragon Crew Warrior [Lv. 1575]"
                NameQuest = "AmazonQuest"
                LevelQuest = 1
                NameMon = "Dragon Crew Warrior"
                CFrameQuest = CFrame.new(5832.83594, 51.6806107, -1101.51563, 0.898790359, -0, -0.438378751, 0, 1, -0,
                    0.438378751, 0, 0.898790359)
                CFrameMon = CFrame.new(6241.9951171875, 51.522083282471, -1243.9771728516)
                SPAWNPOINT = "Hydra3"
            elseif MyLevel == 1600 or MyLevel <= 1624 or _G.Select_Mob_Farm == "Dragon Crew Archer [Lv. 1600]" then
                Ms = "Dragon Crew Archer [Lv. 1600]"
                NameQuest = "AmazonQuest"
                LevelQuest = 2
                NameMon = "Dragon Crew Archer"
                CFrameQuest = CFrame.new(5832.83594, 51.6806107, -1101.51563, 0.898790359, -0, -0.438378751, 0, 1, -0,
                    0.438378751, 0, 0.898790359)
                CFrameMon = CFrame.new(6488.9155273438, 383.38375854492, -110.66246032715)
                SPAWNPOINT = "Hydra3"
            elseif MyLevel == 1625 or MyLevel <= 1649 or _G.Select_Mob_Farm == "Female Islander [Lv. 1625]" then
                Ms = "Female Islander [Lv. 1625]"
                NameQuest = "AmazonQuest2"
                LevelQuest = 1
                NameMon = "Female Islander"
                CFrameQuest = CFrame.new(5448.86133, 601.516174, 751.130676, 0, 0, 1, 0, 1, -0, -1, 0, 0)
                CFrameMon = CFrame.new(4770.4990234375, 758.95520019531, 1069.8680419922)
                SPAWNPOINT = "Hydra1"
            elseif MyLevel == 1650 or MyLevel <= 1699 or _G.Select_Mob_Farm == "Giant Islander [Lv. 1650]" then
                Ms = "Giant Islander [Lv. 1650]"
                NameQuest = "AmazonQuest2"
                LevelQuest = 2
                NameMon = "Giant Islander"
                CFrameQuest = CFrame.new(5448.86133, 601.516174, 751.130676, 0, 0, 1, 0, 1, -0, -1, 0, 0)
                CFrameMon = CFrame.new(4530.3540039063, 656.75695800781, -131.60952758789)
                SPAWNPOINT = "Hydra1"
            elseif MyLevel == 1700 or MyLevel <= 1724 or _G.Select_Mob_Farm == "Marine Commodore [Lv. 1700]" then
                Ms = "Marine Commodore [Lv. 1700]"
                NameQuest = "MarineTreeIsland"
                LevelQuest = 1
                NameMon = "Marine Commodore"
                CFrameQuest = CFrame.new(2180.54126, 27.8156815, -6741.5498, -0.965929747, 0, 0.258804798, 0, 1, 0,
                    -0.258804798, 0, -0.965929747)
                CFrameMon = CFrame.new(2490.0844726563, 190.4232635498, -7160.0502929688)
                SPAWNPOINT = "GreatTree"
            elseif MyLevel == 1725 or MyLevel <= 1774 or _G.Select_Mob_Farm == "Marine Rear Admiral [Lv. 1725]" then
                Ms = "Marine Rear Admiral [Lv. 1725]"
                NameQuest = "MarineTreeIsland"
                LevelQuest = 2
                NameMon = "Marine Rear Admiral"
                CFrameQuest = CFrame.new(2180.54126, 27.8156815, -6741.5498, -0.965929747, 0, 0.258804798, 0, 1, 0,
                    -0.258804798, 0, -0.965929747)
                CFrameMon = CFrame.new(3951.3903808594, 229.11549377441, -6912.81640625)
                SPAWNPOINT = "GreatTree"
            elseif MyLevel == 1775 or MyLevel <= 1799 or _G.Select_Mob_Farm == "Fishman Raider [Lv. 1775]" then
                Ms = "Fishman Raider [Lv. 1775]"
                NameQuest = "DeepForestIsland3"
                LevelQuest = 1
                NameMon = "Fishman Raider"
                CFrameQuest = CFrame.new(-10581.6563, 330.872955, -8761.18652, -0.882952213, 0, 0.469463557, 0, 1, 0,
                    -0.469463557, 0, -0.882952213)
                CFrameMon = CFrame.new(-10322.400390625, 390.94473266602, -8580.0908203125)
                SPAWNPOINT = "PineappleTown"
            elseif MyLevel == 1800 or MyLevel <= 1824 or _G.Select_Mob_Farm == "Fishman Captain [Lv. 1800]" then
                Ms = "Fishman Captain [Lv. 1800]"
                NameQuest = "DeepForestIsland3"
                LevelQuest = 2
                NameMon = "Fishman Captain"
                CFrameQuest = CFrame.new(-10581.6563, 330.872955, -8761.18652, -0.882952213, 0, 0.469463557, 0, 1, 0,
                    -0.469463557, 0, -0.882952213)
                CFrameMon = CFrame.new(-11194.541992188, 442.02795410156, -8608.806640625)
                SPAWNPOINT = "PineappleTown"
            elseif MyLevel == 1825 or MyLevel <= 1849 or _G.Select_Mob_Farm == "Forest Pirate [Lv. 1825]" then
                Ms = "Forest Pirate [Lv. 1825]"
                NameQuest = "DeepForestIsland"
                LevelQuest = 1
                NameMon = "Forest Pirate"
                CFrameQuest = CFrame.new(-13234.04, 331.488495, -7625.40137, 0.707134247, -0, -0.707079291, 0, 1, -0,
                    0.707079291, 0, 0.707134247)
                CFrameMon = CFrame.new(-13225.809570313, 428.19387817383, -7753.1245117188)
                SPAWNPOINT = "BigMansion"
            elseif MyLevel == 1850 or MyLevel <= 1899 or _G.Select_Mob_Farm == "Mythological Pirate [Lv. 1850]" then
                Ms = "Mythological Pirate [Lv. 1850]"
                NameQuest = "DeepForestIsland"
                LevelQuest = 2
                NameMon = "Mythological Pirate"
                CFrameQuest = CFrame.new(-13234.04, 331.488495, -7625.40137, 0.707134247, -0, -0.707079291, 0, 1, -0,
                    0.707079291, 0, 0.707134247)
                CFrameMon = CFrame.new(-13869.172851563, 564.95251464844, -7084.4135742188)
                SPAWNPOINT = "BigMansion"
            elseif MyLevel == 1900 or MyLevel <= 1924 or _G.Select_Mob_Farm == "Jungle Pirate [Lv. 1900]" then
                Ms = "Jungle Pirate [Lv. 1900]"
                NameQuest = "DeepForestIsland2"
                LevelQuest = 1
                NameMon = "Jungle Pirate"
                CFrameQuest = CFrame.new(-12680.3818, 389.971039, -9902.01953, -0.0871315002, 0, 0.996196866, 0, 1, 0,
                    -0.996196866, 0, -0.0871315002)
                CFrameMon = CFrame.new(-11982.221679688, 376.32522583008, -10451.415039063)
                SPAWNPOINT = "PineappleTown"
            elseif MyLevel == 1925 or MyLevel <= 1974 or _G.Select_Mob_Farm == "Musketeer Pirate [Lv. 1925]" then
                Ms = "Musketeer Pirate [Lv. 1925]"
                NameQuest = "DeepForestIsland2"
                LevelQuest = 2
                NameMon = "Musketeer Pirate"
                CFrameQuest = CFrame.new(-12680.3818, 389.971039, -9902.01953, -0.0871315002, 0, 0.996196866, 0, 1, 0,
                    -0.996196866, 0, -0.0871315002)
                CFrameMon = CFrame.new(-13282.3046875, 496.23684692383, -9565.150390625)
                SPAWNPOINT = "PineappleTown"
            elseif MyLevel == 1975 or MyLevel <= 1999 or _G.Select_Mob_Farm == "Reborn Skeleton [Lv. 1975]" then
                Ms = "Reborn Skeleton [Lv. 1975]"
                NameQuest = "HauntedQuest1"
                LevelQuest = 1
                NameMon = "Reborn Skeleton"
                CFrameQuest = CFrame.new(-9479.2168, 141.215088, 5566.09277, 0, 0, 1, 0, 1, -0, -1, 0, 0)
                CFrameMon = CFrame.new(-8761.3154296875, 164.85829162598, 6161.1567382813)
                SPAWNPOINT = "HauntedCastle"
            elseif MyLevel == 2000 or MyLevel <= 2024 or _G.Select_Mob_Farm == "Living Zombie [Lv. 2000]" then
                Ms = "Living Zombie [Lv. 2000]"
                NameQuest = "HauntedQuest1"
                LevelQuest = 2
                NameMon = "Living Zombie"
                CFrameQuest = CFrame.new(-9479.2168, 141.215088, 5566.09277, 0, 0, 1, 0, 1, -0, -1, 0, 0)
                CFrameMon = CFrame.new(-10093.930664063, 237.38233947754, 6180.5654296875)
                SPAWNPOINT = "HauntedCastle"
            elseif MyLevel == 2025 or MyLevel <= 2049 or _G.Select_Mob_Farm == "Demonic Soul [Lv. 2025]" then
                Ms = "Demonic Soul [Lv. 2025]"
                NameQuest = "HauntedQuest2"
                LevelQuest = 1
                NameMon = "Demonic Soul"
                CFrameQuest = CFrame.new(-9514.78027, 171.162918, 6078.82373, 0.301918149, 7.4535027e-09, 0.953333855,
                    -3.22802141e-09, 1, -6.79604995e-09, -0.953333855, -1.02553133e-09, 0.301918149)
                CFrameMon = CFrame.new(-9466.72949, 171.162918, 6132.01514)
                SPAWNPOINT = "HauntedCastle"
            elseif MyLevel == 2050 or MyLevel <= 2074 or _G.Select_Mob_Farm == "Posessed Mummy [Lv. 2050]" then
                Ms = "Posessed Mummy [Lv. 2050]"
                NameQuest = "HauntedQuest2"
                LevelQuest = 2
                NameMon = "Posessed Mummy"
                CFrameQuest = CFrame.new(-9514.78027, 171.162918, 6078.82373, 0.301918149, 7.4535027e-09, 0.953333855,
                    -3.22802141e-09, 1, -6.79604995e-09, -0.953333855, -1.02553133e-09, 0.301918149)
                CFrameMon = CFrame.new(-9589.93848, 4.85058546, 6190.27197)
                SPAWNPOINT = "HauntedCastle"
            elseif MyLevel == 2075 or MyLevel <= 2099 or _G.Select_Mob_Farm == "Peanut Scout [Lv. 2075]" then
                Ms = "Peanut Scout [Lv. 2075]"
                NameQuest = "NutsIslandQuest"
                LevelQuest = 1
                NameMon = "Peanut Scout"
                CFrameQuest = CFrame.new(-2103.9375, 38.139019012451, -10192.702148438)
                CFrameMon = CFrame.new(-2150.587890625, 122.49767303467, -10358.994140625)
                SPAWNPOINT = "Peanut"
            elseif MyLevel == 2100 or MyLevel <= 2124 or _G.Select_Mob_Farm == "Peanut President [Lv. 2100]" then
                Ms = "Peanut President [Lv. 2100]"
                NameQuest = "NutsIslandQuest"
                LevelQuest = 2
                NameMon = "Peanut President"
                CFrameQuest = CFrame.new(-2103.9375, 38.139019012451, -10192.702148438)
                CFrameMon = CFrame.new(-2150.587890625, 122.49767303467, -10358.994140625)
                SPAWNPOINT = "Peanut"
            elseif MyLevel == 2125 or MyLevel <= 2149 or _G.Select_Mob_Farm == "Ice Cream Chef [Lv. 2125]" then
                Ms = "Ice Cream Chef [Lv. 2125]"
                NameQuest = "IceCreamIslandQuest"
                LevelQuest = 1
                NameMon = "Ice Cream Chef"
                CFrameQuest = CFrame.new(-819.84533691406, 65.845329284668, -10965.487304688)
                CFrameMon = CFrame.new(-890.55895996094, 186.34135437012, -11127.306640625)
                SPAWNPOINT = "IceCream"
            elseif MyLevel == 2150 or MyLevel <= 2199 or _G.Select_Mob_Farm == "Ice Cream Commander [Lv. 2150]" then
                Ms = "Ice Cream Commander [Lv. 2150]"
                NameQuest = "IceCreamIslandQuest"
                LevelQuest = 2
                NameMon = "Ice Cream Commander"
                CFrameQuest = CFrame.new(-819.84533691406, 65.845329284668, -10965.487304688)
                CFrameMon = CFrame.new(-890.55895996094, 186.34135437012, -11127.306640625)
                SPAWNPOINT = "IceCream"
            elseif MyLevel == 2200 or MyLevel <= 2224 or _G.Select_Mob_Farm == "Cookie Crafter [Lv. 2200]" then
                Ms = "Cookie Crafter [Lv. 2200]"
                NameQuest = "CakeQuest1"
                LevelQuest = 1
                NameMon = "Cookie Crafter"
                CFrameQuest = CFrame.new(-2021.5509033203125, 37.798221588134766, -12028.103515625)
                CFrameMon = CFrame.new(-2273.00244140625, 90.22590637207031, -12151.62109375)
                SPAWNPOINT = "Loaf"
            elseif MyLevel == 2225 or MyLevel <= 2249 or _G.Select_Mob_Farm == "Cake Guard [Lv. 2225]" then
                Ms = "Cake Guard [Lv. 2225]"
                NameQuest = "CakeQuest1"
                LevelQuest = 2
                NameMon = "Cake Guard"
                CFrameQuest = CFrame.new(-2021.5509033203125, 37.798221588134766, -12028.103515625)
                CFrameMon = CFrame.new(-1442.373046875, 158.14111328125, -12277.37109375)
                SPAWNPOINT = "Loaf"
            elseif MyLevel == 2250 or MyLevel <= 2274 or _G.Select_Mob_Farm == "Baking Staff [Lv. 2250]" then
                Ms = "Baking Staff [Lv. 2250]"
                NameQuest = "CakeQuest2"
                LevelQuest = 1
                NameMon = "Baking Staff"
                CFrameQuest = CFrame.new(-1927.9107666015625, 37.79813003540039, -12843.78515625)
                CFrameMon = CFrame.new(-1837.2803955078125, 129.0594482421875, -12934.5498046875)
                SPAWNPOINT = "Loaf"
            elseif MyLevel == 2275 or MyLevel <= 2299 or _G.Select_Mob_Farm == "Head Baker [Lv. 2275]" then
                Ms = "Head Baker [Lv. 2275]"
                NameQuest = "CakeQuest2"
                LevelQuest = 2
                NameMon = "Head Baker"
                CFrameQuest = CFrame.new(-1927.9107666015625, 37.79813003540039, -12843.78515625)
                CFrameMon = CFrame.new(-2203.302490234375, 109.90937042236328, -12788.7333984375)
                SPAWNPOINT = "Loaf"
            elseif MyLevel == 2300 or MyLevel <= 2324 or _G.Select_Mob_Farm == "Cocoa Warrior [Lv. 2300]" then
                Ms = "Cocoa Warrior [Lv. 2300]"
                NameQuest = "ChocQuest1"
                LevelQuest = 1
                NameMon = "Cocoa Warrior"
                CFrameQuest = CFrame.new(231.13571166992188, 24.734268188476562, -12195.1162109375)
                CFrameMon = CFrame.new(231.13571166992188, 24.734268188476562, -12195.1162109375)
                SPAWNPOINT = "Chocolate"
            elseif MyLevel == 2325 or MyLevel <= 2349 or _G.Select_Mob_Farm == "Chocolate Bar Battler [Lv. 2325]" then
                Ms = "Chocolate Bar Battler [Lv. 2325]"
                NameQuest = "ChocQuest1"
                LevelQuest = 2
                NameMon = "Chocolate Bar Battler"
                CFrameQuest = CFrame.new(231.13571166992188, 24.734268188476562, -12195.1162109375)
                CFrameMon = CFrame.new(231.13571166992188, 24.734268188476562, -12195.1162109375)
                SPAWNPOINT = "Chocolate"
            elseif MyLevel == 2350 or MyLevel <= 2374 or _G.Select_Mob_Farm == "Sweet Thief [Lv. 2350]" then
                Ms = "Sweet Thief [Lv. 2350]"
                NameQuest = "ChocQuest2"
                LevelQuest = 1
                NameMon = "Sweet Thief"
                CFrameQuest = CFrame.new(147.52256774902344, 24.793832778930664, -12775.3583984375)
                CFrameMon = CFrame.new(147.52256774902344, 24.793832778930664, -12775.3583984375)
                SPAWNPOINT = "Chocolate"
            elseif MyLevel >= 2375 or _G.Select_Mob_Farm == "Candy Rebel [Lv. 2375]" then
                Ms = "Candy Rebel [Lv. 2375]"
                NameQuest = "ChocQuest2"
                LevelQuest = 2
                NameMon = "Candy Rebel"
                CFrameQuest = CFrame.new(147.52256774902344, 24.793832778930664, -12775.3583984375)
                CFrameMon = CFrame.new(147.52256774902344, 24.793832778930664, -12775.3583984375)
                SPAWNPOINT = "Chocolate"
            end
        end
    end

    function Hop()
        local PlaceID = game.PlaceId
        local AllIDs = {}
        local foundAnything = ""
        local actualHour = os.date("!*t").hour
        local Deleted = false
        function TPReturner()
            local Site;
            if foundAnything == "" then
                Site = game.HttpService:JSONDecode(game:HttpGet(
                    'https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
            else
                Site = game.HttpService:JSONDecode(game:HttpGet(
                    'https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' ..
                        foundAnything))
            end
            local ID = ""
            if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
                foundAnything = Site.nextPageCursor
            end
            local num = 0;
            for i, v in pairs(Site.data) do
                local Possible = true
                ID = tostring(v.id)
                if tonumber(v.maxPlayers) > tonumber(v.playing) then
                    for _, Existing in pairs(AllIDs) do
                        if num ~= 0 then
                            if ID == tostring(Existing) then
                                Possible = false
                            end
                        else
                            if tonumber(actualHour) ~= tonumber(Existing) then
                                local delFile = pcall(function()
                                    AllIDs = {}
                                    table.insert(AllIDs, actualHour)
                                end)
                            end
                        end
                        num = num + 1
                    end
                    if Possible == true then
                        table.insert(AllIDs, ID)
                        wait()
                        pcall(function()
                            wait()
                            game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID,
                                game.Players.LocalPlayer)
                        end)
                        wait(4)
                    end
                end
            end
        end
        function Teleport()
            while wait() do
                pcall(function()
                    TPReturner()
                    if foundAnything ~= "" then
                        TPReturner()
                    end
                end)
            end
        end
        Teleport()
    end

    function isnil(thing)
        return (thing == nil)
    end
    local function round(n)
        return math.floor(tonumber(n) + 0.5)
    end
    Number = math.random(1, 1000000)
    function UpdateEspPlayer()
        if ESPPlayer then
            for i, v in pairs(game:GetService("Players"):GetPlayers()) do
                if not isnil(v.Character) then
                    if not v.Character.Head:FindFirstChild('NameEsp' .. v.Name) then
                        local BillboardGui = Instance.new("BillboardGui")
                        local ESP = Instance.new("TextLabel")
                        local HealthESP = Instance.new("TextLabel")
                        BillboardGui.Parent = v.Character.Head
                        BillboardGui.Name = 'NameEsp' .. v.Name
                        BillboardGui.ExtentsOffset = Vector3.new(0, 1, 0)
                        BillboardGui.Size = UDim2.new(1, 200, 1, 30)
                        BillboardGui.Adornee = v.Character.Head
                        BillboardGui.AlwaysOnTop = true
                        ESP.Name = "ESP"
                        ESP.Parent = BillboardGui
                        ESP.TextTransparency = 0
                        ESP.BackgroundTransparency = 1
                        ESP.Size = UDim2.new(0, 200, 0, 30)
                        ESP.Position = UDim2.new(0, 25, 0, 0)
                        ESP.Font = Enum.Font.Gotham
                        ESP.Text = (v.Name .. ' ' .. "[ " ..
                                       round(
                                (game:GetService('Players').LocalPlayer.Character.Head.Position -
                                    v.Character.Head.Position).Magnitude / 3) .. ' M' .. " ]")
                        if v.Team == game:GetService("Players").LocalPlayer.Team then
                            ESP.TextColor3 = Color3.new(0, 255, 255)
                        else
                            ESP.TextColor3 = Color3.new(255, 0, 0)
                        end
                        ESP.TextSize = 14
                        ESP.TextStrokeTransparency = 0.500
                        ESP.TextWrapped = true
                        HealthESP.Name = "HealthESP"
                        HealthESP.Parent = ESP
                        HealthESP.TextTransparency = 0
                        HealthESP.BackgroundTransparency = 1
                        HealthESP.Position = ESP.Position + UDim2.new(0, -25, 0, 15)
                        HealthESP.Size = UDim2.new(0, 200, 0, 30)
                        HealthESP.Font = Enum.Font.Gotham
                        HealthESP.TextColor3 = Color3.fromRGB(255, 0, 0)
                        HealthESP.TextSize = 14
                        HealthESP.TextStrokeTransparency = 0.500
                        HealthESP.TextWrapped = true
                        HealthESP.Text = "Health " .. math.floor(v.Character.Humanoid.Health) .. "/" ..
                                             math.floor(v.Character.Humanoid.MaxHealth)
                    else
                        v.Character.Head['NameEsp' .. v.Name].ESP.Text = (v.Name .. ' ' ..
                                                                             round(
                                (game:GetService('Players').LocalPlayer.Character.Head.Position -
                                    v.Character.Head.Position).Magnitude / 3) .. ' M')
                        v.Character.Head['NameEsp' .. v.Name].ESP.HealthESP.Text = "Health " ..
                                                                                       math.floor(
                                v.Character.Humanoid.Health) .. "/" .. math.floor(v.Character.Humanoid.MaxHealth)
                        v.Character.Head:FindFirstChild('NameEsp' .. v.Name).ESP.TextTransparency = 0
                        v.Character.Head:FindFirstChild('NameEsp' .. v.Name).ESP.HealthESP.TextTransparency = 0
                    end
                end
            end
        else
            for i, v in pairs(game:GetService("Players"):GetPlayers()) do
                if v.Character.Head:FindFirstChild('NameEsp' .. v.Name) then
                    v.Character.Head:FindFirstChild('NameEsp' .. v.Name).ESP.TextTransparency = 1
                    v.Character.Head:FindFirstChild('NameEsp' .. v.Name).ESP.HealthESP.TextTransparency = 1
                end
            end
        end
    end

    function UpdateIslandESP()
        for i, v in pairs(game:GetService("Workspace")["_WorldOrigin"].Locations:GetChildren()) do
            pcall(function()
                if IslandESP then
                    if v.Name ~= "Sea" then
                        if not v:FindFirstChild('NameEsp') then
                            local bill = Instance.new('BillboardGui', v)
                            bill.Name = 'NameEsp'
                            bill.ExtentsOffset = Vector3.new(0, 1, 0)
                            bill.Size = UDim2.new(1, 200, 1, 30)
                            bill.Adornee = v
                            bill.AlwaysOnTop = true
                            local name = Instance.new('TextLabel', bill)
                            name.Font = "GothamBold"
                            name.FontSize = "Size14"
                            name.TextWrapped = true
                            name.Size = UDim2.new(1, 0, 1, 0)
                            name.TextYAlignment = 'Top'
                            name.BackgroundTransparency = 1
                            name.TextStrokeTransparency = 0.5
                            name.TextColor3 = Color3.fromRGB(80, 245, 245)
                        else
                            v['NameEsp'].TextLabel.Text = (v.Name .. '   \n' ..
                                                              round(
                                    (game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude /
                                        3) .. ' M')
                        end
                    end
                else
                    if v:FindFirstChild('NameEsp') then
                        v:FindFirstChild('NameEsp'):Destroy()
                    end
                end
            end)
        end
    end

    function UpdateChestEsp()
        for i, v in pairs(game:GetService("Workspace"):GetChildren()) do
            pcall(function()
                if string.find(v.Name, "Chest") then
                    if ChestESP then
                        if string.find(v.Name, "Chest") then
                            if not v:FindFirstChild('NameEsp' .. Number) then
                                local bill = Instance.new('BillboardGui', v)
                                bill.Name = 'NameEsp' .. Number
                                bill.ExtentsOffset = Vector3.new(0, 1, 0)
                                bill.Size = UDim2.new(1, 200, 1, 30)
                                bill.Adornee = v
                                bill.AlwaysOnTop = true
                                local name = Instance.new('TextLabel', bill)
                                name.Font = "GothamBold"
                                name.FontSize = "Size14"
                                name.TextWrapped = true
                                name.Size = UDim2.new(1, 0, 1, 0)
                                name.TextYAlignment = 'Top'
                                name.BackgroundTransparency = 1
                                name.TextStrokeTransparency = 0.5
                                name.TextColor3 = Color3.fromRGB(0, 255, 250)
                                if v.Name == "Chest1" then
                                    name.Text = ("Chest 1" .. ' \n' ..
                                                    round(
                                            (game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude /
                                                3) .. ' M')
                                end
                                if v.Name == "Chest2" then
                                    name.Text = ("Chest 2" .. ' \n' ..
                                                    round(
                                            (game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude /
                                                3) .. ' M')
                                end
                                if v.Name == "Chest3" then
                                    name.Text = ("Chest 3" .. ' \n' ..
                                                    round(
                                            (game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude /
                                                3) .. ' M')
                                end
                            else
                                v['NameEsp' .. Number].TextLabel.Text = (v.Name .. '   \n' ..
                                                                            round(
                                        (game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude /
                                            3) .. ' M')
                            end
                        end
                    else
                        if v:FindFirstChild('NameEsp' .. Number) then
                            v:FindFirstChild('NameEsp' .. Number):Destroy()
                        end
                    end
                end
            end)
        end
    end

    function UpdateBfEsp()
        for i, v in pairs(game:GetService("Workspace"):GetChildren()) do
            pcall(function()
                if DevilFruitESP then
                    if string.find(v.Name, "Fruit") then
                        if not v.Handle:FindFirstChild('NameEsp' .. Number) then
                            local bill = Instance.new('BillboardGui', v.Handle)
                            bill.Name = 'NameEsp' .. Number
                            bill.ExtentsOffset = Vector3.new(0, 1, 0)
                            bill.Size = UDim2.new(1, 200, 1, 30)
                            bill.Adornee = v.Handle
                            bill.AlwaysOnTop = true
                            local name = Instance.new('TextLabel', bill)
                            name.Font = "GothamBold"
                            name.FontSize = "Size14"
                            name.TextWrapped = true
                            name.Size = UDim2.new(1, 0, 1, 0)
                            name.TextYAlignment = 'Top'
                            name.BackgroundTransparency = 1
                            name.TextStrokeTransparency = 0.5
                            name.TextColor3 = Color3.fromRGB(255, 0, 0)
                            name.Text = (v.Name .. ' \n' ..
                                            round(
                                    (game:GetService('Players').LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude /
                                        3) .. ' M')
                        else
                            v.Handle['NameEsp' .. Number].TextLabel.Text = (v.Name .. '   \n' ..
                                                                               round(
                                    (game:GetService('Players').LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude /
                                        3) .. ' M')
                        end
                    end
                else
                    if v.Handle:FindFirstChild('NameEsp' .. Number) then
                        v.Handle:FindFirstChild('NameEsp' .. Number):Destroy()
                    end
                end
            end)
        end
    end

    function UpdateFlowerEsp()
        for i, v in pairs(game:GetService("Workspace"):GetChildren()) do
            pcall(function()
                if v.Name == "Flower2" or v.Name == "Flower1" then
                    if FlowerESP then
                        if not v:FindFirstChild('NameEsp' .. Number) then
                            local bill = Instance.new('BillboardGui', v)
                            bill.Name = 'NameEsp' .. Number
                            bill.ExtentsOffset = Vector3.new(0, 1, 0)
                            bill.Size = UDim2.new(1, 200, 1, 30)
                            bill.Adornee = v
                            bill.AlwaysOnTop = true
                            local name = Instance.new('TextLabel', bill)
                            name.Font = "GothamBold"
                            name.FontSize = "Size14"
                            name.TextWrapped = true
                            name.Size = UDim2.new(1, 0, 1, 0)
                            name.TextYAlignment = 'Top'
                            name.BackgroundTransparency = 1
                            name.TextStrokeTransparency = 0.5
                            name.TextColor3 = Color3.fromRGB(255, 0, 0)
                            if v.Name == "Flower1" then
                                name.Text = ("Blue Flower" .. ' \n' ..
                                                round(
                                        (game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude /
                                            3) .. ' M')
                                name.TextColor3 = Color3.fromRGB(0, 0, 255)
                            end
                            if v.Name == "Flower2" then
                                name.Text = ("Red Flower" .. ' \n' ..
                                                round(
                                        (game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude /
                                            3) .. ' M')
                                name.TextColor3 = Color3.fromRGB(255, 0, 0)
                            end
                        else
                            v['NameEsp' .. Number].TextLabel.Text = (v.Name .. '   \n' ..
                                                                        round(
                                    (game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude /
                                        3) .. ' M')
                        end
                    else
                        if v:FindFirstChild('NameEsp' .. Number) then
                            v:FindFirstChild('NameEsp' .. Number):Destroy()
                        end
                    end
                end
            end)
        end
    end

    function InfAb()
        if InfAbility then
            if not game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("Agility") then
                local inf = Instance.new("ParticleEmitter")
                inf.Acceleration = Vector3.new(0, 0, 0)
                inf.Archivable = true
                inf.Drag = 20
                inf.EmissionDirection = Enum.NormalId.Top
                inf.Enabled = true
                inf.Lifetime = NumberRange.new(0.2, 0.2)
                inf.LightInfluence = 0
                inf.LockedToPart = true
                inf.Name = "Agility"
                inf.Rate = 500
                local numberKeypoints2 = {NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(1, 4)}
                inf.Size = NumberSequence.new(numberKeypoints2)
                inf.RotSpeed = NumberRange.new(999, 9999)
                inf.Rotation = NumberRange.new(0, 0)
                inf.Speed = NumberRange.new(30, 30)
                inf.SpreadAngle = Vector2.new(360, 360)
                inf.Texture = "rbxassetid://7157487174"
                inf.VelocityInheritance = 0
                inf.ZOffset = 2
                inf.Transparency = NumberSequence.new(0)
                inf.Color = ColorSequence.new(Color3.fromRGB(80, 245, 245), Color3.fromRGB(80, 245, 245))
                inf.Parent = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
            end
        else
            if game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("Agility") then
                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("Agility"):Destroy()
            end
        end
    end

    local LocalPlayer = game:GetService 'Players'.LocalPlayer
    local originalstam = LocalPlayer.Character.Energy.Value
    function infinitestam()
        LocalPlayer.Character.Energy.Changed:connect(function()
            if InfiniteEnergy then
                LocalPlayer.Character.Energy.Value = originalstam
            end
        end)
    end

    spawn(function()
        pcall(function()
            while wait(.1) do
                if InfiniteEnergy then
                    wait(0.3)
                    originalstam = LocalPlayer.Character.Energy.Value
                    infinitestam()
                end
            end
        end)
    end)

    function NoDodgeCool()
        if nododgecool then
            for i, v in next, getgc() do
                if game:GetService("Players").LocalPlayer.Character.Dodge then
                    if typeof(v) == "function" and getfenv(v).script ==
                        game:GetService("Players").LocalPlayer.Character.Dodge then
                        for i2, v2 in next, getupvalues(v) do
                            if tostring(v2) == "0.4" then
                                repeat
                                    wait(.1)
                                    setupvalue(v, i2, 0)
                                until not nododgecool
                            end
                        end
                    end
                end
            end
        end
    end

    function fly()
        local mouse = game:GetService("Players").LocalPlayer:GetMouse ''
        localplayer = game:GetService("Players").LocalPlayer
        game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart")
        local torso = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
        local speedSET = 25
        local keys = {
            a = false,
            d = false,
            w = false,
            s = false
        }
        local e1
        local e2
        local function start()
            local pos = Instance.new("BodyPosition", torso)
            local gyro = Instance.new("BodyGyro", torso)
            pos.Name = "EPIXPOS"
            pos.maxForce = Vector3.new(math.huge, math.huge, math.huge)
            pos.position = torso.Position
            gyro.maxTorque = Vector3.new(9e9, 9e9, 9e9)
            gyro.CFrame = torso.CFrame
            repeat
                wait()
                localplayer.Character.Humanoid.PlatformStand = true
                local new = gyro.CFrame - gyro.CFrame.p + pos.position
                if not keys.w and not keys.s and not keys.a and not keys.d then
                    speed = 1
                end
                if keys.w then
                    new = new + workspace.CurrentCamera.CoordinateFrame.lookVector * speed
                    speed = speed + speedSET
                end
                if keys.s then
                    new = new - workspace.CurrentCamera.CoordinateFrame.lookVector * speed
                    speed = speed + speedSET
                end
                if keys.d then
                    new = new * CFrame.new(speed, 0, 0)
                    speed = speed + speedSET
                end
                if keys.a then
                    new = new * CFrame.new(-speed, 0, 0)
                    speed = speed + speedSET
                end
                if speed > speedSET then
                    speed = speedSET
                end
                pos.position = new.p
                if keys.w then
                    gyro.CFrame = workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad(speed * 15), 0, 0)
                elseif keys.s then
                    gyro.CFrame = workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(math.rad(speed * 15), 0, 0)
                else
                    gyro.CFrame = workspace.CurrentCamera.CoordinateFrame
                end
            until not Fly
            if gyro then
                gyro:Destroy()
            end
            if pos then
                pos:Destroy()
            end
            flying = false
            localplayer.Character.Humanoid.PlatformStand = false
            speed = 0
        end
        e1 = mouse.KeyDown:connect(function(key)
            if not torso or not torso.Parent then
                flying = false
                e1:disconnect()
                e2:disconnect()
                return
            end
            if key == "w" then
                keys.w = true
            elseif key == "s" then
                keys.s = true
            elseif key == "a" then
                keys.a = true
            elseif key == "d" then
                keys.d = true
            end
        end)
        e2 = mouse.KeyUp:connect(function(key)
            if key == "w" then
                keys.w = false
            elseif key == "s" then
                keys.s = false
            elseif key == "a" then
                keys.a = false
            elseif key == "d" then
                keys.d = false
            end
        end)
        start()
    end

    function Click()
        game:GetService 'VirtualUser':CaptureController()
        game:GetService 'VirtualUser':Button1Down(Vector2.new(1280, 672))
    end

    function AutoHaki()
        if not game:GetService("Players").LocalPlayer.Character:FindFirstChild("HasBuso") then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
        end
    end

    function UnEquipWeapon(Weapon)
        if game.Players.LocalPlayer.Character:FindFirstChild(Weapon) then
            _G.NotAutoEquip = true
            wait(.5)
            game.Players.LocalPlayer.Character:FindFirstChild(Weapon).Parent = game.Players.LocalPlayer.Backpack
            wait(.1)
            _G.NotAutoEquip = false
        end
    end

    function EquipWeapon(ToolSe)
        if not _G.NotAutoEquip then
            if game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe) then
                Tool = game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe)
                wait(.1)
                game.Players.LocalPlayer.Character.Humanoid:EquipTool(Tool)
            end
        end
    end

    function topos(Pos)
        Distance = (Pos.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
        if game.Players.LocalPlayer.Character.Humanoid.Sit == true then
            game.Players.LocalPlayer.Character.Humanoid.Sit = false
        end
        pcall(function()
            tween = game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart,
                TweenInfo.new(Distance / 210, Enum.EasingStyle.Linear), {
                    CFrame = Pos
                })
        end)
        tween:Play()
        if Distance <= 250 then
            tween:Cancel()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Pos
        end
        if _G.StopTween == true then
            tween:Cancel()
            _G.Clip = false
        end
    end

    function GetDistance(target)
        return math.floor((target.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude)
    end

    function TP(Pos)
        Distance = (Pos.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
        if Distance < 250 then
            Speed = 600
        elseif Distance >= 1000 then
            Speed = 200
        end
        game:GetService("TweenService"):Create(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart,
            TweenInfo.new(Distance / Speed, Enum.EasingStyle.Linear), {
                CFrame = Pos
            }):Play()
        _G.Clip = true
        wait(Distance / Speed)
        _G.Clip = false
    end

    spawn(function()
        pcall(function()
            while wait() do
                if _G.AutoAdvanceDungeon or _G.AutoDoughtBoss or _G.Auto_DungeonMobAura or _G.Auto_Farm_LevelChest or
                    _G.Auto_Farm_BossHallow or _G.Auto_Farm_LevelSwanGlasses or _G.AutoLongSword or
                    _G.AutoBlackSpikeycoat or _G.AutoElectricClaw or _G.Auto_Farm_LevelGunMastery or _G.AutoHolyTorch or
                    _G.AutoLawRaid or _G.Auto_Farm_Boss or _G.AutoTwinHooks or _G.AutoOpenSwanDoor or
                    _G.AutoDragon_Trident or _G.AutoSaber or _G.Auto_Farm_LevelFruitMastery or
                    _G.Auto_Farm_LevelGunMastery or _G.TeleportIsland or _G.Auto_EvoRace or
                    _G.Auto_Farm_LevelAllMsBypassType or _G.AutoObservationv2 or _G.AutoMusketeerHat or _G.AutoEctoplasm or
                    _G.AutoRengoku or _G.Auto_Rainbow_Haki or _G.AutoObservation or _G.AutoDarkDagger or _G.Safe_Mode or
                    _G.MasteryFruit or _G.AutoBudySword or _G.AutoBounty or _G.AutoAllBoss or _G.Auto_Bounty or
                    _G.AutoSharkman or _G.Auto_Mastery_Fruit or _G.Auto_Mastery_Gun or _G.Auto_Dungeon or
                    _G.Auto_Cavender or _G.Auto_Pole or _G.Auto_Kill_Ply or _G.Auto_Factory or _G.AutoSecondSea or
                    _G.TeleportPly or _G.AutoBartilo or _G.Auto_DarkBoss or _G.GrabChest or _G.Auto_Farm_LevelBounty or
                    _G.Holy_Torch or _G.Auto_Farm_Level or _G.Clip or FarmBoss or _G.AutoElitehunter or _G.AutoThirdSea or
                    _G.Auto_Bone == true then
                    if not game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip") then
                        local Noclip = Instance.new("BodyVelocity")
                        Noclip.Name = "BodyClip"
                        Noclip.Parent = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
                        Noclip.MaxForce = Vector3.new(100000, 100000, 100000)
                        Noclip.Velocity = Vector3.new(0, 0, 0)
                    end
                end
            end
        end)
    end)

    spawn(function()
        pcall(function()
            game:GetService("RunService").Stepped:Connect(function()
                if _G.AutoAdvanceDungeon or _G.AutoDoughtBoss or _G.Auto_DungeonMobAura or _G.Auto_Farm_LevelChest or
                    _G.Auto_Farm_BossHallow or _G.Auto_Farm_LevelSwanGlasses or _G.AutoLongSword or
                    _G.AutoBlackSpikeycoat or _G.AutoElectricClaw or _G.Auto_Farm_LevelGunMastery or _G.AutoHolyTorch or
                    _G.AutoLawRaid or _G.Auto_Farm_Boss or _G.AutoTwinHooks or _G.AutoOpenSwanDoor or
                    _G.AutoDragon_Trident or _G.AutoSaber or _G.NOCLIP or _G.Auto_Farm_LevelFruitMastery or
                    _G.Auto_Farm_LevelGunMastery or _G.TeleportIsland or _G.Auto_EvoRace or
                    _G.Auto_Farm_LevelAllMsBypassType or _G.AutoObservationv2 or _G.AutoMusketeerHat or _G.AutoEctoplasm or
                    _G.AutoRengoku or _G.Auto_Rainbow_Haki or _G.AutoObservation or _G.AutoDarkDagger or _G.Safe_Mode or
                    _G.MasteryFruit or _G.AutoBudySword or _G.AutoBounty or _G.AutoAllBoss or _G.Auto_Bounty or
                    _G.AutoSharkman or _G.Auto_Mastery_Fruit or _G.Auto_Mastery_Gun or _G.Auto_Dungeon or
                    _G.Auto_Cavender or _G.Auto_Pole or _G.Auto_Kill_Ply or _G.Auto_Factory or _G.AutoSecondSea or
                    _G.TeleportPly or _G.AutoBartilo or _G.Auto_DarkBoss or _G.GrabChest or _G.Auto_Farm_LevelBounty or
                    _G.Holy_Torch or _G.Auto_Farm_Level or _G.Clip or _G.AutoElitehunter or _G.AutoThirdSea or
                    _G.Auto_Bone == true then
                    for _, v in pairs(game:GetService("Players").LocalPlayer.Character:GetDescendants()) do
                        if v:IsA("BasePart") then
                            v.CanCollide = false
                        end
                    end
                end
            end)
        end)
    end)

    spawn(function()
        while wait() do
            if _G.AutoDoughtBoss or _G.Auto_DungeonMobAura or _G.Auto_Farm_LevelChest or _G.Auto_Farm_BossHallow or
                _G.Auto_Farm_LevelSwanGlasses or _G.AutoLongSword or _G.AutoBlackSpikeycoat or _G.AutoElectricClaw or
                _G.Auto_Farm_LevelGunMastery or _G.AutoHolyTorch or _G.AutoLawRaid or _G.Auto_Farm_Boss or
                _G.AutoTwinHooks or _G.AutoOpenSwanDoor or _G.AutoDragon_Trident or _G.AutoSaber or _G.NOCLIP or
                _G.Auto_Farm_LevelFruitMastery or _G.Auto_Farm_LevelGunMastery or _G.TeleportIsland or _G.Auto_EvoRace or
                _G.Auto_Farm_LevelAllMsBypassType or _G.AutoObservationv2 or _G.AutoMusketeerHat or _G.AutoEctoplasm or
                _G.AutoRengoku or _G.Auto_Rainbow_Haki or _G.AutoObservation or _G.AutoDarkDagger or _G.Safe_Mode or
                _G.MasteryFruit or _G.AutoBudySword or _G.AutoAllBoss or _G.Auto_Bounty or _G.AutoSharkman or
                _G.Auto_Mastery_Fruit or _G.Auto_Mastery_Gun or _G.Auto_Dungeon or _G.Auto_Cavender or _G.Auto_Pole or
                _G.Auto_Kill_Ply or _G.Auto_Factory or _G.AutoSecondSea or _G.TeleportPly or _G.AutoBartilo or
                _G.Auto_DarkBoss or _G.Auto_Farm_Level or _G.Clip or _G.AutoElitehunter or _G.AutoThirdSea or
                _G.Auto_Bone == true then
                pcall(function()
                    game:GetService("ReplicatedStorage").Remotes.CommE:FireServer("Ken", true)
                end)
            end
        end
    end)

    function StopTween(target)
        if not target then
            _G.StopTween = true
            wait()
            topos(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
            wait()
            if game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip") then
                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip"):Destroy()
            end
            _G.StopTween = false
            _G.Clip = false
        end
    end

    spawn(function()
        pcall(function()
            while wait() do
                for i, v in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
                    if v:IsA("Tool") then
                        if v:FindFirstChild("RemoteFunctionShoot") then
                            SelectWeaponGun = v.Name
                        end
                    end
                end
            end
        end)
    end)

    game:GetService("Players").LocalPlayer.Idled:connect(function()
        game:GetService("VirtualUser"):Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
        wait(1)
        game:GetService("VirtualUser"):Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
    end)

    local ScreenGui = Instance.new("ScreenGui")
    local Toggle = Instance.new("TextButton")

    ScreenGui.Name = "ScreenGui"
    ScreenGui.Parent = game.CoreGui

    Toggle.Name = "Toggle"
    Toggle.Parent = ScreenGui
    Toggle.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    Toggle.Position = UDim2.new(0.120833337, 0, 0.0952890813, 0)
    Toggle.Size = UDim2.new(0, 50, 0, 50)
    Toggle.Font = Enum.Font.Code
    Toggle.Text = "R"
    Toggle.TextColor3 = Color3.fromRGB(255, 0, 0)
    Toggle.TextScaled = true
    Toggle.MouseButton1Down:connect(function()
        game:GetService("VirtualInputManager"):SendKeyEvent(true, 305, false, game)
        game:GetService("VirtualInputManager"):SendKeyEvent(false, 305, false, game)
    end)
    --------------------------------------------------------------------
    local RenUi = library:AddWindow("Ren Hub | BF", Enum.KeyCode.RightControl)
    --------------------------------------------------------------------
    local Main = RenUi:AddTab("Auto Farm", "6026568198")
    local Events = RenUi:AddTab("Events", "6136668198")
    local Combat = RenUi:AddTab("Combat", "7251993295")
    local Stats = RenUi:AddTab("Stats", "7040410130")
    local Teleport = RenUi:AddTab("Teleport", "6035190846")
    local Dungeon = RenUi:AddTab("Dungeon", "7044284832")
    local DevilFruit = RenUi:AddTab("Devil Fruit", "7044233235")
    local Shop = RenUi:AddTab("Shop", "6031265976")
    local Misc = RenUi:AddTab("Misc", "6034509993")
    --------------------------------------------------------------------
    Main:AddSeperator("Settings")

    Time = Main:AddLabel("Server Time")

    function UpdateTime()
        local GameTime = math.floor(workspace.DistributedGameTime + 0.5)
        local Hour = math.floor(GameTime / (60 ^ 2)) % 24
        local Minute = math.floor(GameTime / (60 ^ 1)) % 60
        local Second = math.floor(GameTime / (60 ^ 0)) % 60
        Time:Set("Hr(s) : " .. Hour .. " Min(s) : " .. Minute .. " Sec(s) : " .. Second)
    end

    spawn(function()
        while task.wait() do
            pcall(function()
                UpdateTime()
            end)
        end
    end)

    Main:AddToggle("Auto Set Spawn Points", true, function(value)
        _G.AutoSetSpawn = value
    end)

    spawn(function()
        pcall(function()
            while wait() do
                if _G.AutoSetSpawn then
                    if game:GetService("Players").LocalPlayer.Character.Humanoid.Health > 0 then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
                    end
                end
            end
        end)
    end)

    Main:AddToggle("Bring Mob", true, function(value)
        _G.BringMonster = value
    end)

    WeaponList = {}

    for i, v in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
        if v:IsA("Tool") then
            table.insert(WeaponList, v.Name)
        end
    end

    local SelectWeapona = Main:AddDropdown("Select Weapon", WeaponList, function(value)
        _G.SelectWeapon = value
    end)

    Main:AddButton("Refresh Weapon", function()
        SelectWeapona:Clear()
        for i, v in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
            SelectWeapona:Add(v.Name)
        end
    end)

    Main:AddSeperator("Main")

    local AutoFarm = Main:AddToggle("Auto Farm Level", _G.Auto_Farm_Level, function(value)
        _G.Auto_Farm_Level = value
        StopTween(_G.Auto_Farm_Level)
    end)

    spawn(function()
        game:GetService("RunService").Heartbeat:Connect(function()
            CheckQuest()
            pcall(function()
                if _G.Select_Bring_Mob_Mode == "Bring Mob [Normal]" then
                    for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if _G.Auto_Farm_Level and StartMagnet and v.Name == Ms and
                            (v.HumanoidRootPart.Position - PosMon.Position).magnitude <= 350 then
                            v.HumanoidRootPart.CFrame = PosMon
                            v.HumanoidRootPart.CanCollide = false
                            v.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                            if v.Humanoid:FindFirstChild("Animator") then
                                v.Humanoid.Animator:Destroy()
                            end
                            sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                        end
                    end
                elseif _G.Select_Bring_Mob_Mode == "Bring Mob [Extra]" then
                    for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if _G.Auto_Farm_Level and StartMagnet and v.Name ~= "Ice Admiral [Lv. 700] [Boss]" and v.Name ~=
                            "Don Swan [Lv. 3000] [Boss]" and v.Name ~= "Saber Expert [Lv. 200] [Boss]" and v.Name ~=
                            "Longma [Lv. 2000] [Boss]" and (v.HumanoidRootPart.Position - PosMon.Position).magnitude <=
                            350 then
                            v.HumanoidRootPart.CFrame = PosMon
                            v.HumanoidRootPart.CanCollide = false
                            v.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                            if v.Humanoid:FindFirstChild("Animator") then
                                v.Humanoid.Animator:Destroy()
                            end
                            sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                        end
                    end
                end
            end)
        end)
    end)

    spawn(function()
        game:GetService("RunService").Heartbeat:Connect(function()
            CheckQuest()
            pcall(function()
                for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                    if _G.Auto_Farm_Level and MasteryBFMagnetActive and v.Name == Ms and
                        (v.HumanoidRootPart.Position - PosMonMasteryFruit.Position).magnitude <= 350 then
                        v.HumanoidRootPart.CFrame = PosMonMasteryFruit
                        v.HumanoidRootPart.CanCollide = false
                        v.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                        if v.Humanoid:FindFirstChild("Animator") then
                            v.Humanoid.Animator:Destroy()
                        end
                        sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                    end
                end
            end)
        end)
    end)

    spawn(function()
        game:GetService("RunService").Heartbeat:Connect(function()
            CheckQuest()
            pcall(function()
                for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                    if _G.Auto_Farm_Level and MasteryGunMagnetActive and v.Name == Ms and
                        (v.HumanoidRootPart.Position - PosMonMasteryGun.Position).magnitude <= 350 then
                        v.HumanoidRootPart.CFrame = PosMonMasteryGun
                        v.HumanoidRootPart.CanCollide = false
                        v.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                        if v.Humanoid:FindFirstChild("Animator") then
                            v.Humanoid.Animator:Destroy()
                        end
                        sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                    end
                end
            end)
        end)
    end)

    spawn(function()
        while wait() do
            if _G.Auto_Farm_Level then
                if _G.Select_Mode_Farm == "Normal Mode" then
                    pcall(function()
                        if not string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container
                                               .QuestTitle.Title.Text, NameMon) then
                            StartMagnet = false
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
                        end
                        if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
                            StartMagnet = false
                            CheckQuest()
                            repeat
                                wait()
                                getgenv().ToTarget(CFrameQuest)
                            until (CFrameQuest.Position -
                                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <=
                                3 or not _G.Auto_Farm_Level
                            if (CFrameQuest.Position -
                                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <=
                                3 then
                                wait(1.2)
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest",
                                    NameQuest, LevelQuest)
                                wait(0.5)
                            end
                        elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
                            CheckQuest()
                            if game:GetService("Workspace").Enemies:FindFirstChild(Ms) then
                                for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                    if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and
                                        v.Humanoid.Health > 0 then
                                        if v.Name == Ms then
                                            repeat
                                                wait()
                                                if string.find(
                                                    game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest
                                                        .Container.QuestTitle.Title.Text, NameMon) then
                                                    EquipWeapon(_G.Select_Weapon)
                                                    AutoHaki()
                                                    PosMon = v.HumanoidRootPart.CFrame
                                                    v.HumanoidRootPart.CanCollide = false
                                                    v.Humanoid.WalkSpeed = 0
                                                    v.Head.CanCollide = false
                                                    v.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                                                    StartMagnet = true
                                                    getgenv().ToTarget(v.HumanoidRootPart.CFrame *
                                                                           CFrame.new(0, _G.Select_Distance, 0))
                                                    game:GetService 'VirtualUser':CaptureController()
                                                    game:GetService 'VirtualUser':Button1Down(Vector2.new(1280, 672))
                                                else
                                                    StartMagnet = false
                                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                                                        "AbandonQuest")
                                                end
                                            until not _G.Auto_Farm_Level or v.Humanoid.Health <= 0 or not v.Parent or
                                                game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible ==
                                                false
                                        end
                                    end
                                end
                            else
                                StartMagnet = false
                                if game:GetService("ReplicatedStorage"):FindFirstChild(Ms) then
                                    getgenv().ToTarget(
                                        game:GetService("ReplicatedStorage"):FindFirstChild(Ms).HumanoidRootPart.CFrame *
                                            CFrame.new(0, 20, 0))
                                else
                                    getgenv().ToTarget(CFrameMon)
                                end
                            end
                        end
                    end)
                elseif _G.Select_Mode_Farm == "Fast Mode" then
                    pcall(function()
                        if game:GetService("Players").LocalPlayer.Data.SpawnPoint.Value == SPAWNPOINT then
                            if not string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container
                                                   .QuestTitle.Title.Text, NameMon) then
                                StartMagnet = false
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
                            end
                            if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
                                StartMagnet = false
                                CheckQuest()
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest",
                                    NameQuest, LevelQuest)
                            elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
                                CheckQuest()
                                if game:GetService("Workspace").Enemies:FindFirstChild(Ms) then
                                    for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                        if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and
                                            v.Humanoid.Health > 0 then
                                            if v.Name == Ms then
                                                repeat
                                                    wait()
                                                    if string.find(
                                                        game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest
                                                            .Container.QuestTitle.Title.Text, NameMon) then
                                                        EquipWeapon(_G.Select_Weapon)
                                                        AutoHaki()
                                                        PosMon = v.HumanoidRootPart.CFrame
                                                        v.HumanoidRootPart.CanCollide = false
                                                        v.Humanoid.WalkSpeed = 0
                                                        v.Head.CanCollide = false
                                                        v.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                                                        StartMagnet = true
                                                        getgenv().ToTarget(v.HumanoidRootPart.CFrame *
                                                                               CFrame.new(0, _G.Select_Distance, 0))
                                                        game:GetService 'VirtualUser':CaptureController()
                                                        game:GetService 'VirtualUser'
                                                            :Button1Down(Vector2.new(1280, 672))
                                                    else
                                                        StartMagnet = false
                                                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                                                            "AbandonQuest")
                                                    end
                                                until not _G.Auto_Farm_Level or v.Humanoid.Health <= 0 or not v.Parent or
                                                    game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible ==
                                                    false
                                            end
                                        end
                                    end
                                else
                                    StartMagnet = false
                                    if game:GetService("ReplicatedStorage"):FindFirstChild(Ms) then
                                        getgenv().ToTarget(
                                            game:GetService("ReplicatedStorage"):FindFirstChild(Ms).HumanoidRootPart
                                                .CFrame * CFrame.new(0, 20, 0))
                                    else
                                        getgenv().ToTarget(CFrameMon)
                                    end
                                end
                            end
                        else
                            repeat
                                task.wait()
                                game.Players.LocalPlayer.Character.Head:Destroy()
                                wait(0.5)
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameQuest
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
                            until game:GetService("Players").LocalPlayer.Data.SpawnPoint.Value == SPAWNPOINT
                        end
                    end)
                elseif _G.Select_Mode_Farm == "No Quest" then
                    pcall(function()
                        CheckQuest()
                        if game:GetService("Workspace").Enemies:FindFirstChild(Ms) then
                            for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and
                                    v.Humanoid.Health > 0 then
                                    if v.Name == Ms then
                                        if v.Humanoid.Health > 0 then
                                            repeat
                                                wait()
                                                EquipWeapon(_G.Select_Weapon)
                                                AutoHaki()
                                                PosMon = v.HumanoidRootPart.CFrame
                                                v.HumanoidRootPart.CanCollide = false
                                                v.Humanoid.WalkSpeed = 0
                                                v.Head.CanCollide = false
                                                v.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                                                StartMagnet = true
                                                getgenv().ToTarget(v.HumanoidRootPart.CFrame *
                                                                       CFrame.new(0, _G.Select_Distance, 0))
                                                game:GetService 'VirtualUser':CaptureController()
                                                game:GetService 'VirtualUser':Button1Down(Vector2.new(1280, 672))
                                            until not _G.Auto_Farm_Level or v.Humanoid.Health <= 0 or not v.Parent
                                        end
                                    end
                                end
                            end
                        else
                            StartMagnet = false
                            if game:GetService("ReplicatedStorage"):FindFirstChild(Ms) then
                                getgenv().ToTarget(
                                    game:GetService("ReplicatedStorage"):FindFirstChild(Ms).HumanoidRootPart.CFrame *
                                        CFrame.new(0, 20, 0))
                            else
                                getgenv().ToTarget(CFrameMon)
                            end
                        end
                    end)
                elseif _G.Select_Mode_Farm == "Fruit Mastery Mode" then
                    pcall(function()
                        if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
                            MasteryBFMagnetActive = false
                            CheckQuest()
                            repeat
                                wait()
                                getgenv().ToTarget(CFrameQuest)
                            until (CFrameQuest.Position -
                                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <=
                                3 or not _G.Auto_Farm_Level
                            if (CFrameQuest.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <=
                                30 then
                                wait(1.1)
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest",
                                    NameQuest, LevelQuest)
                            end
                        elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
                            CheckQuest()
                            if game:GetService("Workspace").Enemies:FindFirstChild(Ms) then
                                pcall(function()
                                    for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                        if v.Name == Ms then
                                            repeat
                                                wait()
                                                if string.find(
                                                    game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest
                                                        .Container.QuestTitle.Title.Text, NameMon) then
                                                    HealthMin = v.Humanoid.MaxHealth * _G.Select_Health / 100
                                                    if v.Humanoid.Health <= HealthMin then
                                                        EquipWeapon(game.Players.LocalPlayer.Data.DevilFruit.Value)
                                                        AutoHaki()
                                                        v.Head.CanCollide = false
                                                        v.HumanoidRootPart.CanCollide = false
                                                        v.HumanoidRootPart.Size = Vector3.new(2, 2, 1)
                                                        getgenv().ToTarget(v.HumanoidRootPart.CFrame *
                                                                               CFrame.new(0, 20, 0))
                                                        PositionSkillMasteryDevilFruit = v.HumanoidRootPart.Position
                                                        UseSkillMasteryDevilFruit = true
                                                        DevilFruitMastery =
                                                            game:GetService("Players").LocalPlayer.Character[game.Players
                                                                .LocalPlayer.Data.DevilFruit.Value].Level.Value
                                                        if game:GetService("Players").LocalPlayer.Character:FindFirstChild(
                                                            "Dragon-Dragon") then
                                                            if _G.Skill_Z and v:FindFirstChild("HumanoidRootPart") and
                                                                v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 and
                                                                DevilFruitMastery >= 1 then
                                                                game:service('VirtualInputManager'):SendKeyEvent(true,
                                                                    "Z", false, game)
                                                                wait(.1)
                                                                game:service('VirtualInputManager'):SendKeyEvent(false,
                                                                    "Z", false, game)
                                                            end
                                                            if _G.Skill_X and v:FindFirstChild("HumanoidRootPart") and
                                                                v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 and
                                                                DevilFruitMastery >= 1 then
                                                                game:service('VirtualInputManager'):SendKeyEvent(true,
                                                                    "X", false, game)
                                                                wait(.1)
                                                                game:service('VirtualInputManager'):SendKeyEvent(false,
                                                                    "X", false, game)
                                                            end
                                                        elseif game:GetService("Players").LocalPlayer.Character:FindFirstChild(
                                                            "Human-Human: Buddha") then
                                                            if _G.Skill_Z and v:FindFirstChild("HumanoidRootPart") and
                                                                v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 and
                                                                DevilFruitMastery >= 1 and
                                                                game.Players.LocalPlayer.Character.HumanoidRootPart.Size ==
                                                                Vector3.new(7.6, 7.676, 3.686) then
                                                            else
                                                                game:service('VirtualInputManager'):SendKeyEvent(true,
                                                                    "Z", false, game)
                                                                wait(.1)
                                                                game:service('VirtualInputManager'):SendKeyEvent(false,
                                                                    "Z", false, game)
                                                            end
                                                            if _G.Skill_X and v:FindFirstChild("HumanoidRootPart") and
                                                                v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 and
                                                                DevilFruitMastery >= 1 then
                                                                game:service('VirtualInputManager'):SendKeyEvent(true,
                                                                    "X", false, game)
                                                                wait(.1)
                                                                game:service('VirtualInputManager'):SendKeyEvent(false,
                                                                    "X", false, game)
                                                            end
                                                            if _G.Skill_C and v:FindFirstChild("HumanoidRootPart") and
                                                                v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 and
                                                                DevilFruitMastery >= 1 then
                                                                game:service('VirtualInputManager'):SendKeyEvent(true,
                                                                    "C", false, game)
                                                                wait(.1)
                                                                game:service('VirtualInputManager'):SendKeyEvent(false,
                                                                    "C", false, game)
                                                            end
                                                        elseif game:GetService("Players").LocalPlayer.Character:FindFirstChild(
                                                            game.Players.LocalPlayer.Data.DevilFruit.Value) then
                                                            game:GetService("Players").LocalPlayer.Character:FindFirstChild(
                                                                game.Players.LocalPlayer.Data.DevilFruit.Value).MousePos
                                                                .Value = v.HumanoidRootPart.Position
                                                            if _G.Skill_Z and v:FindFirstChild("HumanoidRootPart") and
                                                                v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 and
                                                                DevilFruitMastery >= 1 then
                                                                game:service('VirtualInputManager'):SendKeyEvent(true,
                                                                    "Z", false, game)
                                                                wait(.1)
                                                                game:service('VirtualInputManager'):SendKeyEvent(false,
                                                                    "Z", false, game)
                                                            end
                                                            if _G.Skill_X and v:FindFirstChild("HumanoidRootPart") and
                                                                v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 and
                                                                DevilFruitMastery >= 1 then
                                                                game:service('VirtualInputManager'):SendKeyEvent(true,
                                                                    "X", false, game)
                                                                wait(.1)
                                                                game:service('VirtualInputManager'):SendKeyEvent(false,
                                                                    "X", false, game)
                                                            end
                                                            if _G.Skill_C and v:FindFirstChild("HumanoidRootPart") and
                                                                v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 and
                                                                DevilFruitMastery >= 1 then
                                                                game:service('VirtualInputManager'):SendKeyEvent(true,
                                                                    "C", false, game)
                                                                wait(.1)
                                                                game:service('VirtualInputManager'):SendKeyEvent(false,
                                                                    "C", false, game)
                                                            end
                                                            if _G.Skill_V and v:FindFirstChild("HumanoidRootPart") and
                                                                v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 and
                                                                DevilFruitMastery >= 1 then
                                                                game:service('VirtualInputManager'):SendKeyEvent(true,
                                                                    "V", false, game)
                                                                wait(.1)
                                                                game:service('VirtualInputManager'):SendKeyEvent(false,
                                                                    "V", false, game)
                                                            end
                                                        end
                                                    else
                                                        UseSkillMasteryDevilFruit = true
                                                        EquipWeapon(_G.Select_Weapon)
                                                        AutoHaki()
                                                        getgenv().ToTarget(v.HumanoidRootPart.CFrame *
                                                                               CFrame.new(0, _G.Select_Distance, 0))
                                                        game:GetService 'VirtualUser':CaptureController()
                                                        game:GetService 'VirtualUser'
                                                            :Button1Down(Vector2.new(1280, 672))
                                                        v.Head.CanCollide = false
                                                        v.HumanoidRootPart.CanCollide = false
                                                        v.HumanoidRootPart.Size = Vector3.new(40, 40, 40)
                                                    end
                                                    MasteryBFMagnetActive = true
                                                    PosMonMasteryFruit = v.HumanoidRootPart.CFrame
                                                else
                                                    MasteryBFMagnetActive = false
                                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                                                        "AbandonQuest")
                                                end
                                            until v.Humanoid.Health <= 0 or _G.Auto_Farm_Level == false or
                                                game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == false
                                            UseSkillMasteryDevilFruit = true
                                        end
                                    end
                                end)
                            else
                                MasteryBFMagnetActive = false
                                if game:GetService("ReplicatedStorage"):FindFirstChild(Ms) then
                                    getgenv().ToTarget(
                                        game:GetService("ReplicatedStorage"):FindFirstChild(Ms).HumanoidRootPart.CFrame *
                                            CFrame.new(0, 20, 0))
                                else
                                    getgenv().ToTarget(CFrameMon)
                                end
                            end
                        end
                    end)
                elseif _G.Select_Mode_Farm == "Gun Mastery Mode" then
                    pcall(function()
                        if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
                            MasteryGunMagnetActive = false
                            CheckQuest()
                            repeat
                                wait()
                                getgenv().ToTarget(CFrameQuest)
                            until (CFrameQuest.Position -
                                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <=
                                3 or not _G.Auto_Farm_Level
                            if (CFrameQuest.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <=
                                30 then
                                wait(1.1)
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest",
                                    NameQuest, LevelQuest)
                            end
                        elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
                            CheckQuest()
                            if game:GetService("Workspace").Enemies:FindFirstChild(Ms) then
                                for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                    if v.Name == Ms then
                                        repeat
                                            wait()
                                            if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest
                                                               .Container.QuestTitle.Title.Text, NameMon) then
                                                HealthMin = v.Humanoid.MaxHealth * _G.Select_Health / 100
                                                if v.Humanoid.Health <= HealthMin and
                                                    v:FindFirstChild("HumanoidRootPart") and
                                                    v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                                                    AutoHaki()
                                                    EquipWeapon(SelectToolWeaponGun)
                                                    v.HumanoidRootPart.CanCollide = false
                                                    getgenv().ToTarget(v.HumanoidRootPart.CFrame *
                                                                           CFrame.new(0, _G.Select_Distance, 0))
                                                    UseGun = true
                                                    game:GetService("Players").LocalPlayer.Character[SelectToolWeaponGun]
                                                        .Cooldown.Value = 0
                                                    game:GetService("VirtualUser"):CaptureController()
                                                    game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 670),
                                                        workspace.CurrentCamera.CFrame)
                                                else
                                                    AutoHaki()
                                                    EquipWeapon(_G.Select_Weapon)
                                                    v.Head.CanCollide = false
                                                    v.HumanoidRootPart.CanCollide = false
                                                    v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                                    getgenv().ToTarget(v.HumanoidRootPart.CFrame *
                                                                           CFrame.new(0, _G.Select_Distance, 0))
                                                    UseGun = false
                                                    game:GetService("VirtualUser"):CaptureController()
                                                    game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 670),
                                                        workspace.CurrentCamera.CFrame)
                                                end
                                                MasteryGunMagnetActive = true
                                                PosMonMasteryGun = v.HumanoidRootPart.CFrame
                                            else
                                                UseGun = false
                                                MasteryGunMagnetActive = false
                                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                                                    "AbandonQuest")
                                            end
                                        until v.Humanoid.Health <= 0 or _G.Auto_Farm_Level == false or
                                            game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == false
                                        UseGun = false
                                        MasteryGunMagnetActive = false
                                    end
                                end
                            else
                                if game:GetService("ReplicatedStorage"):FindFirstChild(Ms) then
                                    getgenv().ToTarget(
                                        game:GetService("ReplicatedStorage"):FindFirstChild(Ms).HumanoidRootPart.CFrame *
                                            CFrame.new(0, 20, 0))
                                else
                                    getgenv().ToTarget(CFrameMon)
                                end
                            end
                        end
                    end)
                end
            end
        end
    end)

    if World1 then
        Main:AddToggle("Auto Second Sea", _G.AutoSecondSea, function(value)
            _G.AutoSecondSea = value
            StopTween(_G.AutoSecondSea)
        end)

        spawn(function()
            while wait() do
                if _G.AutoSecondSea then
                    pcall(function()
                        local MyLevel = game:GetService("Players").LocalPlayer.Data.Level.Value
                        if MyLevel >= 700 and World1 then
                            if game:GetService("Workspace").Map.Ice.Door.CanCollide == false and
                                game:GetService("Workspace").Map.Ice.Door.Transparency == 1 then
                                local CFrame1 = CFrame.new(4849.29883, 5.65138149, 719.611877)
                                repeat
                                    topos(CFrame1)
                                    wait()
                                until (CFrame1.Position -
                                    game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <=
                                    3 or _G.AutoSecondSea == false
                                wait(1.1)
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                                    "DressrosaQuestProgress", "Detective")
                                wait(0.5)
                                EquipWeapon("Key")
                                repeat
                                    topos(CFrame.new(1347.7124, 37.3751602, -1325.6488))
                                    wait()
                                until (Vector3.new(1347.7124, 37.3751602, -1325.6488) -
                                    game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <=
                                    3 or _G.AutoSecondSea == false
                                wait(0.5)
                            else
                                if game:GetService("Workspace").Map.Ice.Door.CanCollide == false and
                                    game:GetService("Workspace").Map.Ice.Door.Transparency == 1 then
                                    if game:GetService("Workspace").Enemies:FindFirstChild(
                                        "Ice Admiral [Lv. 700] [Boss]") then
                                        for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                            if v.Name == "Ice Admiral [Lv. 700] [Boss]" then
                                                if not v.Humanoid.Health <= 0 then
                                                    if v:FindFirstChild("Humanoid") and
                                                        v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                                        OldCFrameSecond = v.HumanoidRootPart.CFrame
                                                        repeat
                                                            task.wait()
                                                            AutoHaki()
                                                            EquipWeapon(_G.SelectWeapon)
                                                            v.HumanoidRootPart.CanCollide = false
                                                            v.Humanoid.WalkSpeed = 0
                                                            v.Head.CanCollide = false
                                                            v.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                                                            v.HumanoidRootPart.CFrame = OldCFrameSecond
                                                            topos(v.HumanoidRootPart.CFrame * CFrame.new(5, 10, 7))
                                                            game:GetService("VirtualUser"):CaptureController()
                                                            game:GetService("VirtualUser"):Button1Down(Vector2.new(1280,
                                                                672))
                                                            sethiddenproperty(game:GetService("Players").LocalPlayer,
                                                                "SimulationRadius", math.huge)
                                                        until not _G.AutoSecondSea or not v.Parent or v.Humanoid.Health <=
                                                            0
                                                    end
                                                else
                                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                                                        "TravelDressrosa")
                                                end
                                            end
                                        end
                                    else
                                        if game:GetService("ReplicatedStorage"):FindFirstChild(
                                            "Ice Admiral [Lv. 700] [Boss]") then
                                            topos(game:GetService("ReplicatedStorage"):FindFirstChild(
                                                      "Ice Admiral [Lv. 700] [Boss]").HumanoidRootPart.CFrame *
                                                      CFrame.new(5, 10, 7))
                                        end
                                    end
                                end
                            end
                        end
                    end)
                end
            end
        end)
    end

    if World2 then
        Main:AddToggle("Auto Third Sea", _G.AutoThirdSea, function(value)
            _G.AutoThirdSea = value
            StopTween(_G.AutoThirdSea)
        end)

        spawn(function()
            while wait() do
                if _G.AutoThirdSea then
                    pcall(function()
                        if game:GetService("Players").LocalPlayer.Data.Level.Value >= 1500 and World2 then
                            _G.Auto_Farm_Level = false
                            if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ZQuestProgress",
                                "Check") == 0 then
                                topos(CFrame.new(-1926.3221435547, 12.819851875305, 1738.3092041016))
                                if (CFrame.new(-1926.3221435547, 12.819851875305, 1738.3092041016).Position -
                                    game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <=
                                    10 then
                                    wait(1.5)
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ZQuestProgress",
                                        "Begin")
                                end
                                wait(1.8)
                                if game:GetService("Workspace").Enemies:FindFirstChild("rip_indra [Lv. 1500] [Boss]") then
                                    for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                        if v.Name == "rip_indra [Lv. 1500] [Boss]" then
                                            OldCFrameThird = v.HumanoidRootPart.CFrame
                                            repeat
                                                task.wait()
                                                AutoHaki()
                                                EquipWeapon(_G.SelectWeapon)
                                                topos(v.HumanoidRootPart.CFrame * CFrame.new(5, 10, 7))
                                                v.HumanoidRootPart.CFrame = OldCFrameThird
                                                v.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                                                v.HumanoidRootPart.CanCollide = false
                                                v.Humanoid.WalkSpeed = 0
                                                game:GetService 'VirtualUser':CaptureController()
                                                game:GetService 'VirtualUser':Button1Down(Vector2.new(1280, 672))
                                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                                                    "TravelZou")
                                                sethiddenproperty(game:GetService("Players").LocalPlayer,
                                                    "SimulationRadius", math.huge)
                                            until _G.AutoThirdSea == false or v.Humanoid.Health <= 0 or not v.Parent
                                        end
                                    end
                                elseif not game:GetService("Workspace").Enemies:FindFirstChild(
                                    "rip_indra [Lv. 1500] [Boss]") and
                                    (CFrame.new(-26880.93359375, 22.848554611206, 473.18951416016).Position -
                                        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <=
                                    1000 then
                                    topos(CFrame.new(-26880.93359375, 22.848554611206, 473.18951416016))
                                end
                            end
                        end
                    end)
                end
            end
        end)
    end

    if World2 then
        Main:AddToggle("Auto Farm Factory", _G.AutoFactory, function(value)
            _G.AutoFactory = value
            StopTween(_G.AutoFactory)
        end)

        spawn(function()
            while wait() do
                pcall(function()
                    if _G.AutoFactory then
                        if game:GetService("Workspace").Enemies:FindFirstChild("Core") then
                            for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if v.Name == "Core" and v.Humanoid.Health > 0 then
                                    repeat
                                        task.wait()
                                        AutoHaki()
                                        EquipWeapon(_G.SelectWeapon)
                                        topos(CFrame.new(448.46756, 199.356781, -441.389252))
                                        game:GetService("VirtualUser"):CaptureController()
                                        game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                                    until v.Humanoid.Health <= 0 or _G.AutoFactory == false
                                end
                            end
                        else
                            topos(CFrame.new(448.46756, 199.356781, -441.389252))
                        end
                    end
                end)
            end
        end)
    elseif World3 then
        Main:AddToggle("Auto Mystic Island", _G.AutoMysticIsland, function(value)
            _G.AutoMysticIsland = value
        end)

        spawn(function()
            while wait() do
                if _G.AutoMysticIsland then
                    pcall(function()
                        if game:GetService("Workspace").Map:FindFirstChild("MysticIsland") then
                            topos(game:GetService("Workspace").Map:FindFirstChild("MysticIsland").HumanoidRootPart
                                      .CFrame * CFrame.new(0, 500, -100))
                        end
                    end)
                end
            end
        end)
    end

    List_Mode = {"Normal Mode","Fast Mode","No Quest","Fruit Mastery Mode","Gun Mastery Mode"}
    Main:AddDropdown("Select Mode Farm", List_Mode, function(value)
        List_Mode = Value
    end)

    Main:AddSeperator("Fighting Style")

    Main:AddToggle("Auto Superhuman", _G.AutoSuperhuman, function(value)
        _G.AutoSuperhuman = value
    end)

    spawn(function()
        pcall(function()
            while wait() do
                if _G.AutoSuperhuman then
                    if game.Players.LocalPlayer.Backpack:FindFirstChild("Combat") or
                        game.Players.LocalPlayer.Character:FindFirstChild("Combat") and
                        game:GetService("Players")["LocalPlayer"].Data.Beli.Value >= 150000 then
                        UnEquipWeapon("Combat")
                        wait(.1)
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyBlackLeg")
                    end
                    if game.Players.LocalPlayer.Character:FindFirstChild("Superhuman") or
                        game.Players.LocalPlayer.Backpack:FindFirstChild("Superhuman") then
                        _G.SelectWeapon = "Superhuman"
                    end
                    if game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg") or
                        game.Players.LocalPlayer.Character:FindFirstChild("Black Leg") or
                        game.Players.LocalPlayer.Backpack:FindFirstChild("Electro") or
                        game.Players.LocalPlayer.Character:FindFirstChild("Electro") or
                        game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate") or
                        game.Players.LocalPlayer.Character:FindFirstChild("Fishman Karate") or
                        game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw") or
                        game.Players.LocalPlayer.Character:FindFirstChild("Dragon Claw") then
                        if game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg") and
                            game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg").Level.Value <= 299 then
                            _G.SelectWeapon = "Black Leg"
                        end
                        if game.Players.LocalPlayer.Backpack:FindFirstChild("Electro") and
                            game.Players.LocalPlayer.Backpack:FindFirstChild("Electro").Level.Value <= 299 then
                            _G.SelectWeapon = "Electro"
                        end
                        if game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate") and
                            game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate").Level.Value <= 299 then
                            _G.SelectWeapon = "Fishman Karate"
                        end
                        if game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw") and
                            game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw").Level.Value <= 299 then
                            _G.SelectWeapon = "Dragon Claw"
                        end
                        if game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg") and
                            game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg").Level.Value >= 300 and
                            game:GetService("Players")["LocalPlayer"].Data.Beli.Value >= 300000 then
                            UnEquipWeapon("Black Leg")
                            wait(.1)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectro")
                        end
                        if game.Players.LocalPlayer.Character:FindFirstChild("Black Leg") and
                            game.Players.LocalPlayer.Character:FindFirstChild("Black Leg").Level.Value >= 300 and
                            game:GetService("Players")["LocalPlayer"].Data.Beli.Value >= 300000 then
                            UnEquipWeapon("Black Leg")
                            wait(.1)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectro")
                        end
                        if game.Players.LocalPlayer.Backpack:FindFirstChild("Electro") and
                            game.Players.LocalPlayer.Backpack:FindFirstChild("Electro").Level.Value >= 300 and
                            game:GetService("Players")["LocalPlayer"].Data.Beli.Value >= 750000 then
                            UnEquipWeapon("Electro")
                            wait(.1)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyFishmanKarate")
                        end
                        if game.Players.LocalPlayer.Character:FindFirstChild("Electro") and
                            game.Players.LocalPlayer.Character:FindFirstChild("Electro").Level.Value >= 300 and
                            game:GetService("Players")["LocalPlayer"].Data.Beli.Value >= 750000 then
                            UnEquipWeapon("Electro")
                            wait(.1)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyFishmanKarate")
                        end
                        if game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate") and
                            game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate").Level.Value >= 300 and
                            game:GetService("Players")["Localplayer"].Data.Fragments.Value >= 1500 then
                            UnEquipWeapon("Fishman Karate")
                            wait(.1)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward",
                                "DragonClaw", "1")
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward",
                                "DragonClaw", "2")
                        end
                        if game.Players.LocalPlayer.Character:FindFirstChild("Fishman Karate") and
                            game.Players.LocalPlayer.Character:FindFirstChild("Fishman Karate").Level.Value >= 300 and
                            game:GetService("Players")["Localplayer"].Data.Fragments.Value >= 1500 then
                            UnEquipWeapon("Fishman Karate")
                            wait(.1)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward",
                                "DragonClaw", "1")
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward",
                                "DragonClaw", "2")
                        end
                        if game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw") and
                            game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw").Level.Value >= 300 and
                            game:GetService("Players")["LocalPlayer"].Data.Beli.Value >= 3000000 then
                            UnEquipWeapon("Dragon Claw")
                            wait(.1)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySuperhuman")
                        end
                        if game.Players.LocalPlayer.Character:FindFirstChild("Dragon Claw") and
                            game.Players.LocalPlayer.Character:FindFirstChild("Dragon Claw").Level.Value >= 300 and
                            game:GetService("Players")["LocalPlayer"].Data.Beli.Value >= 3000000 then
                            UnEquipWeapon("Dragon Claw")
                            wait(.1)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySuperhuman")
                        end
                    end
                end
            end
        end)
    end)

    Main:AddToggle("Auto DeathStep", _G.AutoDeathStep, function(value)
        _G.AutoDeathStep = value
    end)

    spawn(function()
        while wait() do
            wait()
            if _G.AutoDeathStep then
                if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Black Leg") or
                    game:GetService("Players").LocalPlayer.Character:FindFirstChild("Black Leg") or
                    game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Death Step") or
                    game:GetService("Players").LocalPlayer.Character:FindFirstChild("Death Step") then
                    if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Black Leg") and
                        game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Black Leg").Level.Value >= 450 then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDeathStep")
                        _G.SelectWeapon = "Death Step"
                    end
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Black Leg") and
                        game:GetService("Players").LocalPlayer.Character:FindFirstChild("Black Leg").Level.Value >= 450 then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDeathStep")
                        _G.SelectWeapon = "Death Step"
                    end
                    if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Black Leg") and
                        game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Black Leg").Level.Value <= 449 then
                        _G.SelectWeapon = "Black Leg"
                    end
                else
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyBlackLeg")
                end
            end
        end
    end)

    Main:AddToggle("Auto Sharkman Karate", _G.AutoSharkman, function(value)
        _G.AutoSharkman = value
    end)

    spawn(function()
        pcall(function()
            while wait() do
                if _G.AutoSharkman then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyFishmanKarate")
                    if string.find(
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate"), "keys") then
                        if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Water Key") or
                            game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Water Key") then
                            topos(CFrame.new(-2604.6958, 239.432526, -10315.1982, 0.0425701365, 0, -0.999093413, 0, 1,
                                0, 0.999093413, 0, 0.0425701365))
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate")
                        elseif game:GetService("Players").LocalPlayer.Character:FindFirstChild("Fishman Karate") and
                            game:GetService("Players").LocalPlayer.Character:FindFirstChild("Fishman Karate").Level
                                .Value >= 400 then
                        else
                            Ms = "Tide Keeper [Lv. 1475] [Boss]"
                            if game:GetService("Workspace").Enemies:FindFirstChild(Ms) then
                                for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                    if v.Name == Ms then
                                        OldCFrameShark = v.HumanoidRootPart.CFrame
                                        repeat
                                            task.wait()
                                            AutoHaki()
                                            EquipWeapon(_G.SelectWeapon)
                                            v.Head.CanCollide = false
                                            v.Humanoid.WalkSpeed = 0
                                            v.HumanoidRootPart.CanCollide = false
                                            v.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                                            v.HumanoidRootPart.CFrame = OldCFrameShark
                                            topos(v.HumanoidRootPart.CFrame * CFrame.new(5, 10, 7))
                                            game:GetService("VirtualUser"):CaptureController()
                                            game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 670))
                                            sethiddenproperty(game:GetService("Players").LocalPlayer,
                                                "SimulationRadius", math.huge)
                                        until not v.Parent or v.Humanoid.Health <= 0 or _G.AutoSharkman == false or
                                            game:GetService("Players").LocalPlayer.Character:FindFirstChild("Water Key") or
                                            game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Water Key")
                                    end
                                end
                            else
                                topos(CFrame.new(-3570.18652, 123.328949, -11555.9072, 0.465199202, -1.3857326e-08,
                                    0.885206044, 4.0332897e-09, 1, 1.35347511e-08, -0.885206044, -2.72606271e-09,
                                    0.465199202))
                                wait(3)
                            end
                        end
                    else
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate")
                    end
                end
            end
        end)
    end)

    Main:AddToggle("Auto Electric Claw", _G.AutoElectricClaw, function(value)
        _G.AutoElectricClaw = value
        StopTween(_G.AutoElectricClaw)
    end)

    spawn(function()
        pcall(function()
            while wait() do
                if _G.AutoElectricClaw then
                    if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Electro") or
                        game:GetService("Players").LocalPlayer.Character:FindFirstChild("Electro") or
                        game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Electric Claw") or
                        game:GetService("Players").LocalPlayer.Character:FindFirstChild("Electric Claw") then
                        if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Electro") and
                            game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Electro").Level.Value >= 400 then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw")
                            _G.SelectWeapon = "Electric Claw"
                        end
                        if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Electro") and
                            game:GetService("Players").LocalPlayer.Character:FindFirstChild("Electro").Level.Value >=
                            400 then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw")
                            _G.SelectWeapon = "Electric Claw"
                        end
                        if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Electro") and
                            game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Electro").Level.Value <= 399 then
                            _G.SelectWeapon = "Electro"
                        end
                    else
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectro")
                    end
                end
                if _G.AutoElectricClaw then
                    if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Electro") or
                        game:GetService("Players").LocalPlayer.Character:FindFirstChild("Electro") then
                        if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Electro") or
                            game:GetService("Players").LocalPlayer.Character:FindFirstChild("Electro") and
                            game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Electro").Level.Value >= 400 or
                            game:GetService("Players").LocalPlayer.Character:FindFirstChild("Electro").Level.Value >=
                            400 then
                            if _G.Auto_Farm_Level == false then
                                repeat
                                    task.wait()
                                    topos(CFrame.new(-10371.4717, 330.764496, -10131.4199))
                                until not _G.AutoElectricClaw or
                                    (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position -
                                        CFrame.new(-10371.4717, 330.764496, -10131.4199).Position).Magnitude <= 10
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw",
                                    "Start")
                                wait(2)
                                repeat
                                    task.wait()
                                    topos(CFrame.new(-12550.532226563, 336.22631835938, -7510.4233398438))
                                until not _G.AutoElectricClaw or
                                    (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position -
                                        CFrame.new(-12550.532226563, 336.22631835938, -7510.4233398438).Position).Magnitude <=
                                    10
                                wait(1)
                                repeat
                                    task.wait()
                                    topos(CFrame.new(-10371.4717, 330.764496, -10131.4199))
                                until not _G.AutoElectricClaw or
                                    (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position -
                                        CFrame.new(-10371.4717, 330.764496, -10131.4199).Position).Magnitude <= 10
                                wait(1)
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw")
                            elseif _G.Auto_Farm_Level == true then
                                _G.Auto_Farm_Level = false
                                wait(1)
                                repeat
                                    task.wait()
                                    topos(CFrame.new(-10371.4717, 330.764496, -10131.4199))
                                until not _G.AutoElectricClaw or
                                    (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position -
                                        CFrame.new(-10371.4717, 330.764496, -10131.4199).Position).Magnitude <= 10
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw",
                                    "Start")
                                wait(2)
                                repeat
                                    task.wait()
                                    topos(CFrame.new(-12550.532226563, 336.22631835938, -7510.4233398438))
                                until not _G.AutoElectricClaw or
                                    (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position -
                                        CFrame.new(-12550.532226563, 336.22631835938, -7510.4233398438).Position).Magnitude <=
                                    10
                                wait(1)
                                repeat
                                    task.wait()
                                    topos(CFrame.new(-10371.4717, 330.764496, -10131.4199))
                                until not _G.AutoElectricClaw or
                                    (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position -
                                        CFrame.new(-10371.4717, 330.764496, -10131.4199).Position).Magnitude <= 10
                                wait(1)
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw")
                                _G.SelectWeapon = "Electric Claw"
                                wait(.1)
                                _G.Auto_Farm_Level = true
                            end
                        end
                    end
                end
            end
        end)
    end)

    Main:AddToggle("Auto Dragon Talon", _G.AutoDragonTalon, function(value)
        _G.AutoDragonTalon = value
    end)

    spawn(function()
        while wait() do
            if _G.AutoDragonTalon then
                if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dragon Claw") or
                    game:GetService("Players").LocalPlayer.Character:FindFirstChild("Dragon Claw") or
                    game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dragon Talon") or
                    game:GetService("Players").LocalPlayer.Character:FindFirstChild("Dragon Talon") then
                    if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dragon Claw") and
                        game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dragon Claw").Level.Value >= 400 then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDragonTalon")
                        _G.SelectWeapon = "Dragon Talon"
                    end
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Dragon Claw") and
                        game:GetService("Players").LocalPlayer.Character:FindFirstChild("Dragon Claw").Level.Value >=
                        400 then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDragonTalon")
                        _G.SelectWeapon = "Dragon Talon"
                    end
                    if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dragon Claw") and
                        game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dragon Claw").Level.Value <= 399 then
                        _G.SelectWeapon = "Dragon Claw"
                    end
                else
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward", "DragonClaw",
                        "2")
                end
            end
        end
    end)

    Main:AddSeperator("Mastery")

    Main:AddToggle("Auto Farm BF Mastery", _G.Auto_Farm_LevelFruitMastery, function(value)
        _G.Auto_Farm_LevelFruitMastery = value
        StopTween(_G.Auto_Farm_LevelFruitMastery)
        if _G.Auto_Farm_LevelFruitMastery == false then
            UseSkill = false
        end
    end)

    spawn(function()
        while wait() do
            if _G.Auto_Farm_LevelFruitMastery then
                pcall(function()
                    local QuestTitle = game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle
                                           .Title.Text
                    if not string.find(QuestTitle, NameMon) then
                        Magnet = false
                        UseSkill = false
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
                    end
                    if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
                        StartMasteryFruitMagnet = false
                        UseSkill = false
                        CheckQuest()
                        repeat
                            wait()
                            topos(CFrameQuest)
                        until (CFrameQuest.Position -
                            game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3 or
                            not _G.Auto_Farm_LevelFruitMastery
                        if (CFrameQuest.Position -
                            game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3 then
                            wait(1.2)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", NameQuest,
                                LevelQuest)
                            wait(0.5)
                        end
                    elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
                        CheckQuest()
                        if game:GetService("Workspace").Enemies:FindFirstChild(Mon) then
                            for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and
                                    v.Humanoid.Health > 0 then
                                    if v.Name == Mon then
                                        if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest
                                                           .Container.QuestTitle.Title.Text, NameMon) then
                                            HealthMs = v.Humanoid.MaxHealth * _G.Kill_At / 100
                                            repeat
                                                task.wait()
                                                if v.Humanoid.Health <= HealthMs then
                                                    AutoHaki()
                                                    EquipWeapon(
                                                        game:GetService("Players").LocalPlayer.Data.DevilFruit.Value)
                                                    topos(v.HumanoidRootPart.CFrame * CFrame.new(5, 10, 7))
                                                    v.HumanoidRootPart.CanCollide = false
                                                    PosMonMasteryFruit = v.HumanoidRootPart.CFrame
                                                    v.Humanoid.WalkSpeed = 0
                                                    v.Head.CanCollide = false
                                                    UseSkill = true
                                                else
                                                    UseSkill = false
                                                    AutoHaki()
                                                    EquipWeapon(_G.SelectWeapon)
                                                    topos(v.HumanoidRootPart.CFrame * CFrame.new(5, 10, 7))
                                                    v.HumanoidRootPart.CanCollide = false
                                                    v.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                                                    PosMonMasteryFruit = v.HumanoidRootPart.CFrame
                                                    v.Humanoid.WalkSpeed = 0
                                                    v.Head.CanCollide = false
                                                end
                                                StartMasteryFruitMagnet = true
                                                game:GetService 'VirtualUser':CaptureController()
                                                game:GetService 'VirtualUser':Button1Down(Vector2.new(1280, 672))
                                            until not _G.Auto_Farm_LevelFruitMastery or v.Humanoid.Health <= 0 or
                                                not v.Parent or
                                                game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible ==
                                                false
                                        else
                                            UseSkill = false
                                            StartMasteryFruitMagnet = false
                                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                                                "AbandonQuest")
                                        end
                                    end
                                end
                            end
                        else
                            StartMasteryFruitMagnet = false
                            UseSkill = false
                            local Mob = game:GetService("ReplicatedStorage"):FindFirstChild(Mon)
                            if Mob then
                                topos(Mob.HumanoidRootPart.CFrame * CFrame.new(5, 10, 7))
                            else
                                if game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame.Y <= 1 then
                                    game:GetService("Players").LocalPlayer.Character.Humanoid.Jump = true
                                    task.wait()
                                    game:GetService("Players").LocalPlayer.Character.Humanoid.Jump = false
                                end
                            end
                        end
                    end
                end)
            end
        end
    end)

    spawn(function()
        while wait() do
            if UseSkill then
                pcall(function()
                    CheckQuest()
                    for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if game:GetService("Players").LocalPlayer.Character:FindFirstChild(
                            game:GetService("Players").LocalPlayer.Data.DevilFruit.Value) then
                            MasBF =
                                game:GetService("Players").LocalPlayer.Character[game:GetService("Players").LocalPlayer
                                    .Data.DevilFruit.Value].Level.Value
                        elseif game:GetService("Players").LocalPlayer.Backpack:FindFirstChild(
                            game:GetService("Players").LocalPlayer.Data.DevilFruit.Value) then
                            MasBF =
                                game:GetService("Players").LocalPlayer.Backpack[game:GetService("Players").LocalPlayer
                                    .Data.DevilFruit.Value].Level.Value
                        end
                        if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Dragon-Dragon") then
                            if _G.SkillZ then
                                local args = {
                                    [1] = PosMonMasteryFruit.Position
                                }
                                game:GetService("Players").LocalPlayer.Character[game:GetService("Players").LocalPlayer
                                    .Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack(args))
                                game:GetService("VirtualInputManager"):SendKeyEvent(true, "Z", false, game)
                                game:GetService("VirtualInputManager"):SendKeyEvent(false, "Z", false, game)
                            end
                            if _G.SkillX then
                                local args = {
                                    [1] = PosMonMasteryFruit.Position
                                }
                                game:GetService("Players").LocalPlayer.Character[game:GetService("Players").LocalPlayer
                                    .Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack(args))
                                game:GetService("VirtualInputManager"):SendKeyEvent(true, "X", false, game)
                                game:GetService("VirtualInputManager"):SendKeyEvent(false, "X", false, game)
                            end
                            if _G.SkillC then
                                local args = {
                                    [1] = PosMonMasteryFruit.Position
                                }
                                game:GetService("Players").LocalPlayer.Character[game:GetService("Players").LocalPlayer
                                    .Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack(args))
                                game:GetService("VirtualInputManager"):SendKeyEvent(true, "C", false, game)
                                wait(2)
                                game:GetService("VirtualInputManager"):SendKeyEvent(false, "C", false, game)
                            end
                        elseif game:GetService("Players").LocalPlayer.Character:FindFirstChild("Venom-Venom") then
                            if _G.SkillZ then
                                local args = {
                                    [1] = PosMonMasteryFruit.Position
                                }
                                game:GetService("Players").LocalPlayer.Character[game:GetService("Players").LocalPlayer
                                    .Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack(args))
                                game:GetService("VirtualInputManager"):SendKeyEvent(true, "Z", false, game)
                                game:GetService("VirtualInputManager"):SendKeyEvent(false, "Z", false, game)
                            end
                            if _G.SkillX then
                                local args = {
                                    [1] = PosMonMasteryFruit.Position
                                }
                                game:GetService("Players").LocalPlayer.Character[game:GetService("Players").LocalPlayer
                                    .Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack(args))
                                game:GetService("VirtualInputManager"):SendKeyEvent(true, "X", false, game)
                                game:GetService("VirtualInputManager"):SendKeyEvent(false, "X", false, game)
                            end
                            if _G.SkillC then
                                local args = {
                                    [1] = PosMonMasteryFruit.Position
                                }
                                game:GetService("Players").LocalPlayer.Character[game:GetService("Players").LocalPlayer
                                    .Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack(args))
                                game:GetService("VirtualInputManager"):SendKeyEvent(true, "C", false, game)
                                wait(2)
                                game:GetService("VirtualInputManager"):SendKeyEvent(false, "C", false, game)
                            end
                        elseif game:GetService("Players").LocalPlayer.Character:FindFirstChild("Human-Human: Buddha") then
                            if _G.SkillZ and game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Size ==
                                Vector3.new(2, 2.0199999809265, 1) then
                                local args = {
                                    [1] = PosMonMasteryFruit.Position
                                }
                                game:GetService("Players").LocalPlayer.Character[game:GetService("Players").LocalPlayer
                                    .Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack(args))
                                game:GetService("VirtualInputManager"):SendKeyEvent(true, "Z", false, game)
                                game:GetService("VirtualInputManager"):SendKeyEvent(false, "Z", false, game)
                            end
                            if _G.SkillX then
                                local args = {
                                    [1] = PosMonMasteryFruit.Position
                                }
                                game:GetService("Players").LocalPlayer.Character[game:GetService("Players").LocalPlayer
                                    .Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack(args))
                                game:GetService("VirtualInputManager"):SendKeyEvent(true, "X", false, game)
                                game:GetService("VirtualInputManager"):SendKeyEvent(false, "X", false, game)
                            end
                            if _G.SkillC then
                                local args = {
                                    [1] = PosMonMasteryFruit.Position
                                }
                                game:GetService("Players").LocalPlayer.Character[game:GetService("Players").LocalPlayer
                                    .Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack(args))
                                game:GetService("VirtualInputManager"):SendKeyEvent(true, "C", false, game)
                                game:GetService("VirtualInputManager"):SendKeyEvent(false, "C", false, game)
                            end
                            if _G.SkillV then
                                local args = {
                                    [1] = PosMonMasteryFruit.Position
                                }
                                game:GetService("Players").LocalPlayer.Character[game:GetService("Players").LocalPlayer
                                    .Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack(args))
                                game:GetService("VirtualInputManager"):SendKeyEvent(true, "V", false, game)
                                game:GetService("VirtualInputManager"):SendKeyEvent(false, "V", false, game)
                            end
                        elseif game:GetService("Players").LocalPlayer.Character:FindFirstChild(
                            game:GetService("Players").LocalPlayer.Data.DevilFruit.Value) then
                            if _G.SkillZ then
                                local args = {
                                    [1] = PosMonMasteryFruit.Position
                                }
                                game:GetService("Players").LocalPlayer.Character[game:GetService("Players").LocalPlayer
                                    .Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack(args))
                                game:GetService("VirtualInputManager"):SendKeyEvent(true, "Z", false, game)
                                game:GetService("VirtualInputManager"):SendKeyEvent(false, "Z", false, game)
                            end
                            if _G.SkillX then
                                local args = {
                                    [1] = PosMonMasteryFruit.Position
                                }
                                game:GetService("Players").LocalPlayer.Character[game:GetService("Players").LocalPlayer
                                    .Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack(args))
                                game:GetService("VirtualInputManager"):SendKeyEvent(true, "X", false, game)
                                game:GetService("VirtualInputManager"):SendKeyEvent(false, "X", false, game)
                            end
                            if _G.SkillC then
                                local args = {
                                    [1] = PosMonMasteryFruit.Position
                                }
                                game:GetService("Players").LocalPlayer.Character[game:GetService("Players").LocalPlayer
                                    .Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack(args))
                                game:GetService("VirtualInputManager"):SendKeyEvent(true, "C", false, game)
                                game:GetService("VirtualInputManager"):SendKeyEvent(false, "C", false, game)
                            end
                            if _G.SkillV then
                                local args = {
                                    [1] = PosMonMasteryFruit.Position
                                }
                                game:GetService("Players").LocalPlayer.Character[game:GetService("Players").LocalPlayer
                                    .Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack(args))
                                game:GetService("VirtualInputManager"):SendKeyEvent(true, "V", false, game)
                                game:GetService("VirtualInputManager"):SendKeyEvent(false, "V", false, game)
                            end
                        end
                    end
                end)
            end
        end
    end)

    spawn(function()
        game:GetService("RunService").RenderStepped:Connect(function()
            if UseGun then
                pcall(function()
                    for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if v.Name == Ms then
                            local args = {
                                [1] = "TAP",
                                [2] = v.HumanoidRootPart.Position
                            }

                            game:GetService("Players").LocalPlayer.Character.Humanoid:FindFirstChild("Soul Guitar")
                                :InvokeServer(unpack(args))
                            local args = {
                                [1] = v.HumanoidRootPart.Position,
                                [2] = v.HumanoidRootPart
                            }
                            game:GetService("Players").LocalPlayer.Character[SelectToolWeaponGun].RemoteFunctionShoot:InvokeServer(
                                unpack(args))
                        end
                    end
                end)
            end
        end)
    end)

    spawn(function()
        game:GetService("RunService").RenderStepped:Connect(function()
            if UseGunKillPlayer then
                pcall(function()
                    for i, v in pairs(game:GetService("Workspace").Characters:GetChildren()) do
                        if v.Name == _G.Select_Player then
                            local args = {
                                [1] = v.HumanoidRootPart.Position,
                                [2] = v.HumanoidRootPart
                            }
                            game:GetService("Players").LocalPlayer.Character[SelectToolWeaponGun].RemoteFunctionShoot:InvokeServer(
                                unpack(args))
                        end
                    end
                end)
            end
        end)
    end)

    Main:AddToggle("Auto Farm Gun Mastery", _G.Auto_Farm_LevelGunMastery, function(value)
        _G.Auto_Farm_LevelGunMastery = value
        StopTween(_G.Auto_Farm_LevelGunMastery)
    end)

    spawn(function()
        pcall(function()
            while wait() do
                if _G.Auto_Farm_LevelGunMastery then
                    local QuestTitle = game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle
                                           .Title.Text
                    if not string.find(QuestTitle, NameMon) then
                        Magnet = false
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
                    end
                    if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
                        StartMasteryGunMagnet = false
                        CheckQuest()
                        topos(CFrameQuest)
                        if (CFrameQuest.Position -
                            game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 10 then
                            wait(1.2)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", NameQuest,
                                LevelQuest)
                        end
                    elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
                        CheckQuest()
                        if game:GetService("Workspace").Enemies:FindFirstChild(Mon) then
                            pcall(function()
                                for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                    if v.Name == Mon then
                                        repeat
                                            task.wait()
                                            if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest
                                                               .Container.QuestTitle.Title.Text, NameMon) then
                                                HealthMin = v.Humanoid.MaxHealth * _G.Kill_At / 100
                                                if v.Humanoid.Health <= HealthMin then
                                                    EquipWeapon(SelectWeaponGun)
                                                    topos(v.HumanoidRootPart.CFrame * CFrame.new(5, 10, 7))
                                                    v.Humanoid.WalkSpeed = 0
                                                    v.HumanoidRootPart.CanCollide = false
                                                    v.HumanoidRootPart.Size = Vector3.new(2, 2, 1)
                                                    v.Head.CanCollide = false
                                                    local args = {
                                                        [1] = v.HumanoidRootPart.Position,
                                                        [2] = v.HumanoidRootPart
                                                    }
                                                    game:GetService("Players").LocalPlayer.Character[SelectWeaponGun]
                                                        .RemoteFunctionShoot:InvokeServer(unpack(args))
                                                else
                                                    AutoHaki()
                                                    EquipWeapon(_G.SelectWeapon)
                                                    v.Humanoid.WalkSpeed = 0
                                                    v.HumanoidRootPart.CanCollide = false
                                                    v.Head.CanCollide = false
                                                    v.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                                                    topos(v.HumanoidRootPart.CFrame * CFrame.new(5, 10, 7))
                                                    game:GetService 'VirtualUser':CaptureController()
                                                    game:GetService 'VirtualUser':Button1Down(Vector2.new(1280, 672))
                                                end
                                                StartMasteryGunMagnet = true
                                                PosMonMasteryGun = v.HumanoidRootPart.CFrame
                                            else
                                                StartMasteryGunMagnet = false
                                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                                                    "AbandonQuest")
                                            end
                                        until v.Humanoid.Health <= 0 or _G.Auto_Farm_LevelGunMastery == false or
                                            game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false
                                        StartMasteryGunMagnet = false
                                    end
                                end
                            end)
                        else
                            StartMasteryGunMagnet = false
                            local Mob = game:GetService("ReplicatedStorage"):FindFirstChild(Mon)
                            if Mob then
                                topos(Mob.HumanoidRootPart.CFrame * CFrame.new(5, 10, 7))
                            else
                                if game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame.Y <= 1 then
                                    game:GetService("Players").LocalPlayer.Character.Humanoid.Jump = true
                                    task.wait()
                                    game:GetService("Players").LocalPlayer.Character.Humanoid.Jump = false
                                end
                            end
                        end
                    end
                end
            end
        end)
    end)

    _G.Kill_At = 25
    Main:AddSlider("Kill At %", 1, 100, 25, function(value)
        _G.Kill_At = value
    end)

    Main:AddSeperator("Bosses")

    local Boss = {}

    for i, v in pairs(game:GetService("ReplicatedStorage"):GetChildren()) do
        if string.find(v.Name, "Boss") then
            if v.Name == "Ice Admiral [Lv. 700] [Boss]" then
            else
                table.insert(Boss, v.Name)
            end
        end
    end

    local BossName = Main:AddDropdown("Select Boss", Boss, function(value)
        _G.SelectBoss = value
    end)

    Main:AddButton("Refresh Boss", function()
        BossName:Clear()
        for i, v in pairs(game:GetService("ReplicatedStorage"):GetChildren()) do
            if string.find(v.Name, "Boss") then
                BossName:Add(v.Name)
            end
        end
    end)

    Main:AddToggle("Auto Farm Boss", _G.Auto_Farm_Boss, function(value)
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
        _G.Auto_Farm_Boss = value
        StopTween(_G.Auto_Farm_Boss)
    end)

    spawn(function()
        while wait() do
            if _G.Auto_Farm_Boss then
                pcall(function()
                    if game:GetService("Workspace").Enemies:FindFirstChild(_G.SelectBoss) then
                        for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if v.Name == _G.SelectBoss then
                                if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and
                                    v.Humanoid.Health > 0 then
                                    repeat
                                        task.wait()
                                        AutoHaki()
                                        EquipWeapon(_G.SelectWeapon)
                                        v.HumanoidRootPart.CanCollide = false
                                        v.Humanoid.WalkSpeed = 0
                                        v.HumanoidRootPart.Size = Vector3.new(80, 80, 80)
                                        topos(v.HumanoidRootPart.CFrame * CFrame.new(5, 10, 7))
                                        game:GetService("VirtualUser"):CaptureController()
                                        game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                                        sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius",
                                            math.huge)
                                    until not _G.Auto_Farm_Boss or not v.Parent or v.Humanoid.Health <= 0
                                end
                            end
                        end
                    else
                        if game:GetService("ReplicatedStorage"):FindFirstChild(_G.SelectBoss) then
                            topos(game:GetService("ReplicatedStorage"):FindFirstChild(_G.SelectBoss).HumanoidRootPart
                                      .CFrame * CFrame.new(5, 10, 7))
                        end
                    end
                end)
            end
        end
    end)

    Main:AddToggle("Auto Farm All Boss", _G.AutoAllBoss, function(value)
        _G.AutoAllBoss = value
        StopTween(_G.AutoAllBoss)
    end)

    Main:AddToggle("Auto Farm All Boss Hop", _G.AutoAllBossHop, function(value)
        _G.AutoAllBossHop = value
    end)

    spawn(function()
        while wait() do
            if _G.AutoAllBoss then
                pcall(function()
                    for i, v in pairs(game.ReplicatedStorage:GetChildren()) do
                        if string.find(v.Name, "Boss") then
                            if (v.HumanoidRootPart.Position -
                                game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 17000 then
                                repeat
                                    task.wait()
                                    AutoHaki()
                                    EquipWeapon(_G.SelectWeapon)
                                    v.Humanoid.WalkSpeed = 0
                                    v.HumanoidRootPart.CanCollide = false
                                    v.Head.CanCollide = false
                                    v.HumanoidRootPart.Size = Vector3.new(80, 80, 80)
                                    topos(v.HumanoidRootPart.CFrame * CFrame.new(5, 10, 7))
                                    game:GetService 'VirtualUser':CaptureController()
                                    game:GetService 'VirtualUser':Button1Down(Vector2.new(1280, 672))
                                    sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                                until v.Humanoid.Health <= 0 or _G.AutoAllBoss == false or not v.Parent
                            end
                        else
                            if _G.AutoAllBossHop then
                                Hop()
                            end
                        end
                    end
                end)
            end
        end
    end)

    Main:AddSeperator("Dought")

    local MobKilled = Main:AddLabel("Killed")

    spawn(function()
        while wait() do
            pcall(function()
                if string.len(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner")) ==
                    88 then
                    MobKilled:Set("Defeat : " ..
                                      string.sub(
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner"), 39,
                            41))
                elseif string.len(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner")) ==
                    87 then
                    MobKilled:Set("Defeat : " ..
                                      string.sub(
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner"), 39,
                            40))
                elseif string.len(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner")) ==
                    86 then
                    MobKilled:Set("Defeat : " ..
                                      string.sub(
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner"), 39,
                            39))
                else
                    MobKilled:Set("Boss Is Spawning")
                end
            end)
        end
    end)

    Main:AddToggle("Auto Dought Boss", _G.AutoDoughtBoss, function(value)
        _G.AutoDoughtBoss = value
        StopTween(_G.AutoDoughtBoss)
    end)

    spawn(function()
        while wait() do
            pcall(function()
                if string.len(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner")) ==
                    88 then
                    KillMob = (tonumber(string.sub(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                        "CakePrinceSpawner"), 39, 41)) - 500)
                elseif string.len(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner")) ==
                    87 then
                    KillMob = (tonumber(string.sub(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                        "CakePrinceSpawner"), 40, 41)) - 500)
                elseif string.len(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner")) ==
                    86 then
                    KillMob = (tonumber(string.sub(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                        "CakePrinceSpawner"), 41, 41)) - 500)
                end
            end)
        end
    end)

    spawn(function()
        while wait() do
            if _G.AutoDoughtBoss then
                pcall(function()
                    if game:GetService("Workspace").Enemies:FindFirstChild("Cake Prince [Lv. 2300] [Raid Boss]") then
                        for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if v.Name == "Cake Prince [Lv. 2300] [Raid Boss]" then
                                if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and
                                    v.Humanoid.Health > 0 then
                                    repeat
                                        task.wait()
                                        AutoHaki()
                                        EquipWeapon(_G.SelectWeapon)
                                        v.HumanoidRootPart.CanCollide = false
                                        v.Humanoid.WalkSpeed = 0
                                        v.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                                        topos(v.HumanoidRootPart.CFrame * CFrame.new(5, 10, 7))
                                        game:GetService("VirtualUser"):CaptureController()
                                        game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                                        sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                                    until not _G.AutoDoughtBoss or not v.Parent or v.Humanoid.Health <= 0
                                end
                            end
                        end
                    else
                        if game:GetService("ReplicatedStorage"):FindFirstChild("Cake Prince [Lv. 2300] [Raid Boss]") then
                            topos(game:GetService("ReplicatedStorage"):FindFirstChild(
                                      "Cake Prince [Lv. 2300] [Raid Boss]").HumanoidRootPart.CFrame *
                                      CFrame.new(5, 10, 7))
                        else
                            if KillMob == 0 then
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner",
                                    true)
                            end
                            if game:GetService("Workspace").Map.CakeLoaf.BigMirror.Other.Transparency == 1 then
                                if game:GetService("Workspace").Enemies:FindFirstChild("Cookie Crafter [Lv. 2200]") or
                                    game:GetService("Workspace").Enemies:FindFirstChild("Cake Guard [Lv. 2225]") or
                                    game:GetService("Workspace").Enemies:FindFirstChild("Baking Staff [Lv. 2250]") or
                                    game:GetService("Workspace").Enemies:FindFirstChild("Head Baker [Lv. 2275]") then
                                    for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                        if v.Name == "Cookie Crafter [Lv. 2200]" or v.Name == "Cake Guard [Lv. 2225]" or
                                            v.Name == "Baking Staff [Lv. 2250]" or v.Name == "Head Baker [Lv. 2275]" then
                                            if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and
                                                v.Humanoid.Health > 0 then
                                                repeat
                                                    task.wait()
                                                    AutoHaki()
                                                    EquipWeapon(_G.SelectWeapon)
                                                    v.HumanoidRootPart.CanCollide = false
                                                    v.Humanoid.WalkSpeed = 0
                                                    v.Head.CanCollide = false
                                                    v.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                                                    MagnetDought = true
                                                    PosMonDoughtOpenDoor = v.HumanoidRootPart.CFrame
                                                    topos(v.HumanoidRootPart.CFrame * CFrame.new(5, 10, 7))
                                                    game:GetService("VirtualUser"):CaptureController()
                                                    game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                                                until not _G.AutoDoughtBoss or not v.Parent or v.Humanoid.Health <= 0 or
                                                    game:GetService("Workspace").Map.CakeLoaf.BigMirror.Other
                                                        .Transparency == 0 or
                                                    game:GetService("ReplicatedStorage")
                                                        :FindFirstChild("Cake Prince [Lv. 2300] [Raid Boss]") or
                                                    game:GetService("Workspace").Enemies:FindFirstChild(
                                                        "Cake Prince [Lv. 2300] [Raid Boss]") or KillMob == 0
                                            end
                                        end
                                    end
                                else
                                    MagnetDought = false
                                    if game:GetService("ReplicatedStorage"):FindFirstChild("Cookie Crafter [Lv. 2200]") then
                                        topos(game:GetService("ReplicatedStorage"):FindFirstChild(
                                                  "Cookie Crafter [Lv. 2200]").HumanoidRootPart.CFrame *
                                                  CFrame.new(5, 10, 7))
                                    else
                                        if game:GetService("ReplicatedStorage"):FindFirstChild("Cake Guard [Lv. 2225]") then
                                            topos(game:GetService("ReplicatedStorage"):FindFirstChild(
                                                      "Cake Guard [Lv. 2225]").HumanoidRootPart.CFrame *
                                                      CFrame.new(5, 10, 7))
                                        else
                                            if game:GetService("ReplicatedStorage"):FindFirstChild(
                                                "Baking Staff [Lv. 2250]") then
                                                topos(game:GetService("ReplicatedStorage"):FindFirstChild(
                                                          "Baking Staff [Lv. 2250]").HumanoidRootPart.CFrame *
                                                          CFrame.new(5, 10, 7))
                                            else
                                                if game:GetService("ReplicatedStorage"):FindFirstChild(
                                                    "Head Baker [Lv. 2275]") then
                                                    topos(game:GetService("ReplicatedStorage"):FindFirstChild(
                                                              "Head Baker [Lv. 2275]").HumanoidRootPart.CFrame *
                                                              CFrame.new(5, 10, 7))
                                                end
                                            end
                                        end
                                    end
                                end
                            else
                                if game:GetService("Workspace").Enemies:FindFirstChild(
                                    "Cake Prince [Lv. 2300] [Raid Boss]") then
                                    topos(game:GetService("Workspace").Enemies:FindFirstChild(
                                              "Cake Prince [Lv. 2300] [Raid Boss]").HumanoidRootPart.CFrame *
                                              CFrame.new(5, 10, 7))
                                else
                                    if game:GetService("ReplicatedStorage"):FindFirstChild(
                                        "Cake Prince [Lv. 2300] [Raid Boss]") then
                                        topos(game:GetService("ReplicatedStorage"):FindFirstChild(
                                                  "Cake Prince [Lv. 2300] [Raid Boss]").HumanoidRootPart.CFrame *
                                                  CFrame.new(5, 10, 7))
                                    end
                                end
                            end
                        end
                    end
                end)
            end
        end
    end)

    Main:AddSeperator("Advance Dungeon")

    Main:AddToggle("Auto Advance Dungeon", _G.AutoAdvanceDungeon, function(value)
        _G.AutoAdvanceDungeon = value
        StopTween(_G.AutoAdvanceDungeon)
    end)

    spawn(function()
        while wait() do
            if _G.AutoAdvanceDungeon then
                pcall(function()
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Bird-Bird: Phoenix") or
                        game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Bird-Bird: Phoenix") then
                        if game.Players.LocalPlayer.Backpack:FindFirstChild(
                            game.Players.LocalPlayer.Data.DevilFruit.Value) then
                            if game.Players.LocalPlayer.Backpack:FindFirstChild(
                                game.Players.LocalPlayer.Data.DevilFruit.Value).Level.Value >= 400 then
                                topos(CFrame.new(-2812.76708984375, 254.803466796875, -12595.560546875))
                                if (CFrame.new(-2812.76708984375, 254.803466796875, -12595.560546875).Position -
                                    game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 10 then
                                    wait(1.5)
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SickScientist",
                                        "Check")
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SickScientist",
                                        "Heal")
                                end
                            end
                        elseif game.Players.LocalPlayer.Character:FindFirstChild(game.Players.LocalPlayer.Data
                                                                                     .DevilFruit.Value) then
                            if game.Players.LocalPlayer.Character:FindFirstChild(game.Players.LocalPlayer.Data
                                                                                     .DevilFruit.Value).Level.Value >=
                                400 then
                                topos(CFrame.new(-2812.76708984375, 254.803466796875, -12595.560546875))
                                if (CFrame.new(-2812.76708984375, 254.803466796875, -12595.560546875).Position -
                                    game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 10 then
                                    wait(1.5)
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SickScientist",
                                        "Check")
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SickScientist",
                                        "Heal")
                                end
                            end
                        end
                    end
                end)
            end
        end
    end)

    Main:AddSeperator("Buddy Sword")

    Main:AddToggle("Auto Buddy Sword", _G.AutoBudySword, function(value)
        _G.AutoBudySword = value
        StopTween(_G.AutoBudySword)
    end)

    Main:AddToggle("Auto Buddy Sword Hop", _G.AutoBudySwordHop, function(value)
        _G.AutoBudySwordHop = value
    end)

    spawn(function()
        while wait() do
            if _G.AutoBudySword then
                pcall(function()
                    if game:GetService("Workspace").Enemies:FindFirstChild("Cake Queen [Lv. 2175] [Boss]") then
                        for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if v.Name == "Cake Queen [Lv. 2175] [Boss]" then
                                if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and
                                    v.Humanoid.Health > 0 then
                                    repeat
                                        task.wait()
                                        AutoHaki()
                                        EquipWeapon(_G.SelectWeapon)
                                        v.HumanoidRootPart.CanCollide = false
                                        v.Humanoid.WalkSpeed = 0
                                        v.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                                        topos(v.HumanoidRootPart.CFrame * CFrame.new(5, 10, 7))
                                        game:GetService("VirtualUser"):CaptureController()
                                        game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                                        sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                                    until not _G.AutoBudySword or not v.Parent or v.Humanoid.Health <= 0
                                end
                            end
                        end
                    else
                        if game:GetService("ReplicatedStorage"):FindFirstChild("Cake Queen [Lv. 2175] [Boss]") then
                            topos(
                                game:GetService("ReplicatedStorage"):FindFirstChild("Cake Queen [Lv. 2175] [Boss]").HumanoidRootPart
                                    .CFrame * CFrame.new(5, 10, 7))
                        else
                            if _G.AutoBudySwordHop then
                                Hop()
                            end
                        end
                    end
                end)
            end
        end
    end)

    Main:AddSeperator("Elite")

    local EliteProgress = Main:AddLabel("")

    spawn(function()
        pcall(function()
            while wait() do
                EliteProgress:Set("Elite Progress : " ..
                                      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EliteHunter",
                        "Progress"))
            end
        end)
    end)

    Main:AddToggle("Auto Elite Hunter", _G.AutoElitehunter, function(value)
        _G.AutoElitehunter = value
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
        StopTween(_G.AutoElitehunter)
    end)

    spawn(function()
        while wait() do
            if _G.AutoElitehunter and World3 then
                pcall(function()
                    local QuestTitle = game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle
                                           .Title.Text
                    if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
                        repeat
                            wait()
                            topos(CFrame.new(-5418.892578125, 313.74130249023, -2826.2260742188))
                        until not _G.AutoElitehunter or
                            (Vector3.new(-5418.892578125, 313.74130249023, -2826.2260742188) -
                                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <=
                            3
                        if (Vector3.new(-5418.892578125, 313.74130249023, -2826.2260742188) -
                            game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3 then
                            wait(1.1)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EliteHunter")
                            wait(0.5)
                        end
                    elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
                        if string.find(QuestTitle, "Diablo") or string.find(QuestTitle, "Deandre") or
                            string.find(QuestTitle, "Urban") then
                            if game:GetService("Workspace").Enemies:FindFirstChild("Diablo [Lv. 1750]") or
                                game:GetService("Workspace").Enemies:FindFirstChild("Deandre [Lv. 1750]") or
                                game:GetService("Workspace").Enemies:FindFirstChild("Urban [Lv. 1750]") then
                                for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                    if v.Name == "Diablo [Lv. 1750]" or v.Name == "Deandre [Lv. 1750]" or v.Name ==
                                        "Urban [Lv. 1750]" then
                                        if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and
                                            v.Humanoid.Health > 0 then
                                            repeat
                                                task.wait()
                                                AutoHaki()
                                                EquipWeapon(_G.SelectWeapon)
                                                v.HumanoidRootPart.CanCollide = false
                                                v.Humanoid.WalkSpeed = 0
                                                v.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                                                topos(v.HumanoidRootPart.CFrame * CFrame.new(5, 10, 7))
                                                game:GetService("VirtualUser"):CaptureController()
                                                game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                                                sethiddenproperty(game:GetService("Players").LocalPlayer,
                                                    "SimulationRadius", math.huge)
                                            until _G.AutoElitehunter == false or v.Humanoid.Health <= 0 or not v.Parent
                                        end
                                    end
                                end
                            else
                                if game:GetService("ReplicatedStorage"):FindFirstChild("Diablo [Lv. 1750]") then
                                    topos(
                                        game:GetService("ReplicatedStorage"):FindFirstChild("Diablo [Lv. 1750]").HumanoidRootPart
                                            .CFrame * CFrame.new(5, 10, 7))
                                elseif game:GetService("ReplicatedStorage"):FindFirstChild("Deandre [Lv. 1750]") then
                                    topos(
                                        game:GetService("ReplicatedStorage"):FindFirstChild("Deandre [Lv. 1750]").HumanoidRootPart
                                            .CFrame * CFrame.new(5, 10, 7))
                                elseif game:GetService("ReplicatedStorage"):FindFirstChild("Urban [Lv. 1750]") then
                                    topos(
                                        game:GetService("ReplicatedStorage"):FindFirstChild("Urban [Lv. 1750]").HumanoidRootPart
                                            .CFrame * CFrame.new(5, 10, 7))
                                else
                                    if _G.AutoEliteHunterHop then
                                        Hop()
                                    else
                                        topos(CFrame.new(-5418.892578125, 313.74130249023, -2826.2260742188))
                                    end
                                end
                            end
                        end
                    end
                end)
            end
        end
    end)

    Main:AddToggle("Auto Elite Hunter Hop", _G.AutoEliteHunterHop, function(value)
        _G.AutoEliteHunterHop = value
    end)

    Main:AddSeperator("Hallow Scythe")

    Main:AddToggle("Auto Hallow Scythe", _G.Auto_Farm_BossHallow, function(value)
        _G.Auto_Farm_BossHallow = value
        StopTween(_G.Auto_Farm_BossHallow)
    end)

    Main:AddToggle("Auto Hallow Scythe Hop", _G.Auto_Farm_BossHallowHop, function(value)
        _G.Auto_Farm_BossHallowHop = value
    end)

    spawn(function()
        while wait() do
            if _G.Auto_Farm_BossHallow then
                pcall(function()
                    if game:GetService("Workspace").Enemies:FindFirstChild("Soul Reaper [Lv. 2100] [Raid Boss]") then
                        for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if string.find(v.Name, "Soul Reaper") then
                                repeat
                                    task.wait()
                                    EquipWeapon(_G.SelectWeapon)
                                    AutoHaki()
                                    v.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                                    topos(v.HumanoidRootPart.CFrame * CFrame.new(5, 10, 7))
                                    game:GetService("VirtualUser"):CaptureController()
                                    game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 670))
                                    v.HumanoidRootPart.Transparency = 1
                                    sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                                until v.Humanoid.Health <= 0 or _G.Auto_Farm_BossHallow == false
                            end
                        end
                    elseif game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Hallow Essence") or
                        game:GetService("Players").LocalPlayer.Character:FindFirstChild("Hallow Essence") then
                        repeat
                            topos(CFrame.new(-8932.322265625, 146.83154296875, 6062.55078125))
                            wait()
                        until (CFrame.new(-8932.322265625, 146.83154296875, 6062.55078125).Position -
                            game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 8
                        EquipWeapon("Hallow Essence")
                    else
                        if game:GetService("ReplicatedStorage"):FindFirstChild("Soul Reaper [Lv. 2100] [Raid Boss]") then
                            topos(game:GetService("ReplicatedStorage"):FindFirstChild(
                                      "Soul Reaper [Lv. 2100] [Raid Boss]").HumanoidRootPart.CFrame *
                                      CFrame.new(5, 10, 7))
                        else
                            if _G.Auto_Farm_BossHallowHop then
                                Hop()
                            end
                        end
                    end
                end)
            end
        end
    end)

    Main:AddSeperator("Dark Dagger")

    Main:AddToggle("Auto Dark Dagger", _G.AutoDarkDagger, function(value)
        _G.AutoDarkDagger = value
        StopTween(_G.AutoDarkDagger)
    end)

    spawn(function()
        pcall(function()
            while wait() do
                if _G.AutoDarkDagger then
                    if game:GetService("Workspace").Enemies:FindFirstChild("rip_indra True Form [Lv. 5000] [Raid Boss]") or
                        game:GetService("Workspace").Enemies:FindFirstChild("rip_indra [Lv. 5000] [Raid Boss]") then
                        for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if v.Name ==
                                ("rip_indra True Form [Lv. 5000] [Raid Boss]" or v.Name ==
                                    "rip_indra [Lv. 5000] [Raid Boss]") and v.Humanoid.Health > 0 and v:IsA("Model") and
                                v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") then
                                repeat
                                    task.wait()
                                    pcall(function()
                                        AutoHaki()
                                        EquipWeapon(_G.SelectWeapon)
                                        v.HumanoidRootPart.CanCollide = false
                                        v.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                                        topos(v.HumanoidRootPart.CFrame * CFrame.new(5, 10, 7))
                                        game:GetService("VirtualUser"):CaptureController()
                                        game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 670),
                                            workspace.CurrentCamera.CFrame)
                                    end)
                                until _G.AutoDarkDagger == false or v.Humanoid.Health <= 0
                            end
                        end
                    else
                        topos(CFrame.new(-5344.822265625, 423.98541259766, -2725.0930175781))
                    end
                end
            end
        end)
    end)

    Main:AddToggle("Auto Dark Dagger Hop", _G.AutoDarkDagger_Hop, function(value)
        _G.AutoDarkDagger_Hop = value
    end)

    spawn(function()
        pcall(function()
            while wait() do
                if (_G.AutoDarkDagger_Hop and _G.AutoDarkDagger) and World3 and
                    not game:GetService("ReplicatedStorage")
                        :FindFirstChild("rip_indra True Form [Lv. 5000] [Raid Boss]") and
                    not game:GetService("Workspace").Enemies:FindFirstChild("rip_indra True Form [Lv. 5000] [Raid Boss]") then
                    Hop()
                end
            end
        end)
    end)

    Main:AddSeperator("Swan Glasses")

    Main:AddToggle("Auto Swan Glasses", _G.Auto_Farm_LevelSwanGlasses, function(value)
        _G.Auto_Farm_LevelSwanGlasses = value
        StopTween(_G.Auto_Farm_LevelSwanGlasses)
    end)

    spawn(function()
        pcall(function()
            while wait() do
                if _G.Auto_Farm_LevelSwanGlasses then
                    if game:GetService("Workspace").Enemies:FindFirstChild("Don Swan [Lv. 1000] [Boss]") then
                        for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if v.Name == "Don Swan [Lv. 1000] [Boss]" and v.Humanoid.Health > 0 and v:IsA("Model") and
                                v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") then
                                repeat
                                    task.wait()
                                    pcall(function()
                                        AutoHaki()
                                        EquipWeapon(_G.SelectWeapon)
                                        v.HumanoidRootPart.CanCollide = false
                                        v.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                                        topos(v.HumanoidRootPart.CFrame * CFrame.new(5, 10, 7))
                                        game:GetService("VirtualUser"):CaptureController()
                                        game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 670))
                                        sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius",
                                            math.huge)
                                    end)
                                until _G.Auto_Farm_LevelSwanGlasses == false or v.Humanoid.Health <= 0
                            end
                        end
                    else
                        repeat
                            task.wait()
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",
                                Vector3.new(2284.912109375, 15.537666320801, 905.48291015625))
                        until (CFrame.new(2284.912109375, 15.537666320801, 905.48291015625).Position -
                            game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 4 or
                            _G.Auto_Farm_LevelSwanGlasses == false
                    end
                end
            end
        end)
    end)

    Main:AddToggle("Auto Swan Glasses Hop", _G.Auto_Farm_LevelSwanGlasses_Hop, function(value)
        _G.Auto_Farm_LevelSwanGlasses_Hop = value
    end)

    spawn(function()
        pcall(function()
            while wait(.1) do
                if (_G.Auto_Farm_LevelSwanGlasses and _G.Auto_Farm_LevelSwanGlasses_Hop) and World2 and
                    not game:GetService("ReplicatedStorage"):FindFirstChild("Don Swan [Lv. 1000] [Boss]") and
                    not game:GetService("Workspace").Enemies:FindFirstChild("Don Swan [Lv. 1000] [Boss]") then
                    Hop()
                end
            end
        end)
    end)

    Main:AddSeperator("Bone")

    local BoneFarm = Main:AddToggle("Auto Farm Bone", _G.Auto_Bone, function(value)
        _G.Auto_Bone = value
        StopTween(_G.Auto_Bone)
    end)

    spawn(function()
        while wait() do
            if _G.Auto_Bone and World3 then
                pcall(function()
                    if game:GetService("Workspace").Enemies:FindFirstChild("Reborn Skeleton [Lv. 1975]") or
                        game:GetService("Workspace").Enemies:FindFirstChild("Living Zombie [Lv. 2000]") or
                        game:GetService("Workspace").Enemies:FindFirstChild("Demonic Soul [Lv. 2025]") or
                        game:GetService("Workspace").Enemies:FindFirstChild("Posessed Mummy [Lv. 2050]") then
                        for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if v.Name == "Reborn Skeleton [Lv. 1975]" or v.Name == "Living Zombie [Lv. 2000]" or v.Name ==
                                "Demonic Soul [Lv. 2025]" or v.Name == "Posessed Mummy [Lv. 2050]" then
                                if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and
                                    v.Humanoid.Health > 0 then
                                    repeat
                                        task.wait()
                                        AutoHaki()
                                        EquipWeapon(_G.SelectWeapon)
                                        v.HumanoidRootPart.CanCollide = false
                                        v.Humanoid.WalkSpeed = 0
                                        v.Head.CanCollide = false
                                        StartMagnetBoneMon = true
                                        PosMonBone = v.HumanoidRootPart.CFrame
                                        topos(v.HumanoidRootPart.CFrame * CFrame.new(5, 10, 7))
                                        game:GetService("VirtualUser"):CaptureController()
                                        game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                                    until not _G.Auto_Farm_Bone or not v.Parent or v.Humanoid.Health <= 0
                                end
                            end
                        end
                    else
                        StartMagnetBoneMon = false
                        for i, v in pairs(game:GetService("ReplicatedStorage"):GetChildren()) do
                            if v.Name == "Reborn Skeleton [Lv. 1975]" then
                                topos(v.HumanoidRootPart.CFrame * CFrame.new(5, 10, 7))
                            elseif v.Name == "Living Zombie [Lv. 2000]" then
                                topos(v.HumanoidRootPart.CFrame * CFrame.new(5, 10, 7))
                            elseif v.Name == "Demonic Soul [Lv. 2025]" then
                                topos(v.HumanoidRootPart.CFrame * CFrame.new(5, 10, 7))
                            elseif v.Name == "Posessed Mummy [Lv. 2050]" then
                                topos(v.HumanoidRootPart.CFrame * CFrame.new(5, 10, 7))
                            end
                        end
                    end
                end)
            end
        end
    end)

    Main:AddToggle("Auto Random Surprise", _G.Auto_Random_Bone, function(value)
        _G.Auto_Random_Bone = value
    end)

    spawn(function()
        pcall(function()
            while wait(.1) do
                if _G.Auto_Random_Bone then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Bones", "Buy", 1, 1)
                end
            end
        end)
    end)

    Main:AddSeperator("Observation")

    local ObservationRange = Main:AddLabel("")

    spawn(function()
        while wait() do
            pcall(function()
                ObservationRange:Set("Observation Range Level : " ..
                                         math.floor(game:GetService("Players").LocalPlayer.VisionRadius.Value))
            end)
        end
    end)

    Main:AddToggle("Auto Farm Observation", _G.AutoObservation, function(value)
        _G.AutoObservation = value
        StopTween(_G.AutoObservation)
    end)

    spawn(function()
        while wait() do
            pcall(function()
                if _G.AutoObservation then
                    repeat
                        task.wait()
                        if not game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") then
                            game:GetService('VirtualUser'):CaptureController()
                            game:GetService('VirtualUser'):SetKeyDown('0x65')
                            wait(2)
                            game:GetService('VirtualUser'):SetKeyUp('0x65')
                        end
                    until game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") or
                        not _G.AutoObservation
                end
            end)
        end
    end)

    Main:AddToggle("Auto Farm Observation Hop", _G.AutoObservation_Hop, function(value)
        _G.AutoObservation_Hop = value
    end)

    spawn(function()
        pcall(function()
            while wait() do
                if _G.AutoObservation then
                    if game:GetService("Players").LocalPlayer.VisionRadius.Value >= 3000 then
                        game:GetService("StarterGui"):SetCore("SendNotification", {
                            Icon = "rbxassetid://0",
                            Title = "Observation",
                            Text = "You Have Max Points"
                        })
                        wait(2)
                    else
                        if World2 then
                            if game:GetService("Workspace").Enemies:FindFirstChild("Lava Pirate [Lv. 1200]") then
                                if game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild(
                                    "ImageLabel") then
                                    repeat
                                        task.wait()
                                        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame =
                                            game:GetService("Workspace").Enemies:FindFirstChild("Lava Pirate [Lv. 1200]")
                                                .HumanoidRootPart.CFrame * CFrame.new(3, 0, 0)
                                    until _G.AutoObservation == false or
                                        not game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild(
                                            "ImageLabel")
                                else
                                    repeat
                                        task.wait()
                                        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame =
                                            game:GetService("Workspace").Enemies:FindFirstChild("Lava Pirate [Lv. 1200]")
                                                .HumanoidRootPart.CFrame * CFrame.new(0, 50, 0) + wait(1)
                                        if not game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild(
                                            "ImageLabel") and _G.AutoObservation_Hop == true then
                                            game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService(
                                                "Players").LocalPlayer)
                                        end
                                    until _G.AutoObservation == false or
                                        game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild(
                                            "ImageLabel")
                                end
                            else
                                topos(CFrame.new(-5478.39209, 15.9775667, -5246.9126))
                            end
                        elseif World1 then
                            if game:GetService("Workspace").Enemies:FindFirstChild("Galley Captain [Lv. 650]") then
                                if game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild(
                                    "ImageLabel") then
                                    repeat
                                        task.wait()
                                        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame =
                                            game:GetService("Workspace").Enemies:FindFirstChild(
                                                "Galley Captain [Lv. 650]").HumanoidRootPart.CFrame *
                                                CFrame.new(3, 0, 0)
                                    until _G.AutoObservation == false or
                                        not game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild(
                                            "ImageLabel")
                                else
                                    repeat
                                        task.wait()
                                        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame =
                                            game:GetService("Workspace").Enemies:FindFirstChild(
                                                "Galley Captain [Lv. 650]").HumanoidRootPart.CFrame *
                                                CFrame.new(0, 50, 0)
                                        wait(1)
                                        if not game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild(
                                            "ImageLabel") and _G.AutoObservation_Hop == true then
                                            game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService(
                                                "Players").LocalPlayer)
                                        end
                                    until _G.AutoObservation == false or
                                        game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild(
                                            "ImageLabel")
                                end
                            else
                                topos(CFrame.new(5533.29785, 88.1079102, 4852.3916))
                            end
                        elseif World3 then
                            if game:GetService("Workspace").Enemies:FindFirstChild("Giant Islander [Lv. 1650]") then
                                if game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild(
                                    "ImageLabel") then
                                    repeat
                                        task.wait()
                                        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame =
                                            game:GetService("Workspace").Enemies:FindFirstChild(
                                                "Giant Islander [Lv. 1650]").HumanoidRootPart.CFrame *
                                                CFrame.new(3, 0, 0)
                                    until _G.AutoObservation == false or
                                        not game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild(
                                            "ImageLabel")
                                else
                                    repeat
                                        task.wait()
                                        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame =
                                            game:GetService("Workspace").Enemies:FindFirstChild(
                                                "Giant Islander [Lv. 1650]").HumanoidRootPart.CFrame *
                                                CFrame.new(0, 50, 0)
                                        wait(1)
                                        if not game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild(
                                            "ImageLabel") and _G.AutoObservation_Hop == true then
                                            game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService(
                                                "Players").LocalPlayer)
                                        end
                                    until _G.AutoObservation == false or
                                        game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild(
                                            "ImageLabel")
                                end
                            else
                                topos(CFrame.new(4530.3540039063, 656.75695800781, -131.60952758789))
                            end
                        end
                    end
                end
            end
        end)
    end)

    Main:AddSeperator("Saber")

    Main:AddToggle("Auto Saber", _G.AutoSaber, function(value)
        _G.AutoSaber = value
        StopTween(_G.AutoSaber)
    end)

    Main:AddToggle("Auto Saber Hop", _G.AutoSaber_Hop, function(value)
        _G.AutoSaber_Hop = value
    end)

    spawn(function()
        while wait() do
            if _G.AutoSaber then
                pcall(function()
                    if game:GetService("Workspace").Enemies:FindFirstChild("Saber Expert [Lv. 200] [Boss]") then
                        for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if v.Name == "Saber Expert [Lv. 200] [Boss]" then
                                if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and
                                    v.Humanoid.Health > 0 then
                                    PosMonSaber = v.HumanoidRootPart.CFrame
                                    repeat
                                        task.wait()
                                        AutoHaki()
                                        EquipWeapon(_G.SelectWeapon)
                                        v.HumanoidRootPart.CanCollide = false
                                        v.Humanoid.WalkSpeed = 0
                                        v.HumanoidRootPart.CFrame = PosMonSaber
                                        topos(v.HumanoidRootPart.CFrame * CFrame.new(5, 10, 7))
                                        v.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                                        game:GetService("VirtualUser"):CaptureController()
                                        game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                                        sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                                    until not _G.AutoSaber or not v.Parent or v.Humanoid.Health <= 0
                                end
                            end
                        end
                    else
                        if game:GetService("ReplicatedStorage"):FindFirstChild("Saber Expert [Lv. 200] [Boss]") then
                            topos(
                                game:GetService("ReplicatedStorage"):FindFirstChild("Saber Expert [Lv. 200] [Boss]").HumanoidRootPart
                                    .CFrame * CFrame.new(5, 10, 7))
                        else
                            if _G.AutoSaber_Hop then
                                Hop()
                            end
                        end
                    end
                end)
            end
        end
    end)

    Main:AddSeperator("Legendary Sword")

    Main:AddToggle("Auto Legendary Sword", _G.AutoBuyLegendarySword, function(value)
        _G.AutoBuyLegendarySword = value
    end)

    spawn(function()
        while wait() do
            if _G.AutoBuyLegendarySword then
                pcall(function()
                    local args = {
                        [1] = "LegendarySwordDealer",
                        [2] = "1"
                    }
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                    local args = {
                        [1] = "LegendarySwordDealer",
                        [2] = "2"
                    }
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                    local args = {
                        [1] = "LegendarySwordDealer",
                        [2] = "3"
                    }
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                    if _G.AutoBuyLegendarySword_Hop and _G.AutoBuyLegendarySword and World2 then
                        wait(10)
                        Hop()
                    end
                end)
            end
        end
    end)

    Main:AddToggle("Auto Legendary Sword Hop", _G.AutoBuyLegendarySword_Hop, function(value)
        _G.AutoBuyLegendarySword_Hop = value
    end)

    Main:AddSeperator("Enchancement Colour")

    Main:AddToggle("Auto Enchancement Colour", _G.AutoBuyEnchancementColour, function(value)
        _G.AutoBuyEnchancementColour = value
    end)

    Main:AddToggle("Auto Enchancement Hop", _G.AutoBuyEnchancementColour_Hop, function(value)
        _G.AutoBuyEnchancementColour_Hop = value
    end)

    spawn(function()
        while wait() do
            if _G.AutoBuyEnchancementColour then
                local args = {
                    [1] = "ColorsDealer",
                    [2] = "2"
                }
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                if _G.AutoBuyEnchancementColour_Hop and _G.AutoBuyEnchancementColour and not World1 then
                    wait(10)
                    Hop()
                end
            end
        end
    end)

    Main:AddSeperator("Other")

    Main:AddToggle("Auto Musketeer Hat", _G.AutoMusketeerHat, function(value)
        _G.AutoMusketeerHat = value
        StopTween(_G.AutoMusketeerHat)
    end)

    spawn(function()
        pcall(function()
            while wait(.1) do
                if _G.AutoMusketeerHat then
                    if game:GetService("Players").LocalPlayer.Data.Level.Value >= 1800 and
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CitizenQuestProgress")
                            .KilledBandits == false then
                        if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle
                                           .Title.Text, "Forest Pirate") and
                            string.find(
                                game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title
                                    .Text, "50") and game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible ==
                            true then
                            if game:GetService("Workspace").Enemies:FindFirstChild("Forest Pirate [Lv. 1825]") then
                                for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                    if v.Name == "Forest Pirate [Lv. 1825]" then
                                        repeat
                                            task.wait()
                                            pcall(function()
                                                EquipWeapon(_G.SelectWeapon)
                                                AutoHaki()
                                                v.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                                                topos(v.HumanoidRootPart.CFrame * CFrame.new(5, 10, 7))
                                                v.HumanoidRootPart.CanCollide = false
                                                game:GetService 'VirtualUser':CaptureController()
                                                game:GetService 'VirtualUser':Button1Down(Vector2.new(1280, 672))
                                                MusketeerHatMon = v.HumanoidRootPart.CFrame
                                                StartMagnetMusketeerhat = true
                                            end)
                                        until _G.AutoMusketeerHat == false or not v.Parent or v.Humanoid.Health <= 0 or
                                            game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false
                                        StartMagnetMusketeerhat = false
                                    end
                                end
                            else
                                StartMagnetMusketeerhat = false
                                topos(CFrame.new(-13206.452148438, 425.89199829102, -7964.5537109375))
                            end
                        else
                            topos(CFrame.new(-12443.8671875, 332.40396118164, -7675.4892578125))
                            if (Vector3.new(-12443.8671875, 332.40396118164, -7675.4892578125) -
                                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <=
                                30 then
                                wait(1.5)
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest",
                                    "CitizenQuest", 1)
                            end
                        end
                    elseif game:GetService("Players").LocalPlayer.Data.Level.Value >= 1800 and
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CitizenQuestProgress")
                            .KilledBoss == false then
                        if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible and
                            string.find(
                                game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title
                                    .Text, "Captain Elephant") and
                            game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
                            if game:GetService("Workspace").Enemies:FindFirstChild("Captain Elephant [Lv. 1875] [Boss]") then
                                for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                    if v.Name == "Captain Elephant [Lv. 1875] [Boss]" then
                                        OldCFrameElephant = v.HumanoidRootPart.CFrame
                                        repeat
                                            task.wait()
                                            pcall(function()
                                                EquipWeapon(_G.SelectWeapon)
                                                AutoHaki()
                                                v.HumanoidRootPart.CanCollide = false
                                                v.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                                                topos(v.HumanoidRootPart.CFrame * CFrame.new(5, 10, 7))
                                                v.HumanoidRootPart.CanCollide = false
                                                v.HumanoidRootPart.CFrame = OldCFrameElephant
                                                game:GetService("VirtualUser"):CaptureController()
                                                game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                                                sethiddenproperty(game:GetService("Players").LocalPlayer,
                                                    "SimulationRadius", math.huge)
                                            end)
                                        until _G.AutoMusketeerHat == false or v.Humanoid.Health <= 0 or not v.Parent or
                                            game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false
                                    end
                                end
                            else
                                topos(CFrame.new(-13374.889648438, 421.27752685547, -8225.208984375))
                            end
                        else
                            topos(CFrame.new(-12443.8671875, 332.40396118164, -7675.4892578125))
                            if (CFrame.new(-12443.8671875, 332.40396118164, -7675.4892578125).Position -
                                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <=
                                4 then
                                wait(1.5)
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CitizenQuestProgress",
                                    "Citizen")
                            end
                        end
                    elseif game:GetService("Players").LocalPlayer.Data.Level.Value >= 1800 and
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CitizenQuestProgress",
                            "Citizen") == 2 then
                        topos(CFrame.new(-12512.138671875, 340.39279174805, -9872.8203125))
                    end
                end
            end
        end)
    end)

    Main:AddToggle("Auto Rainbow Haki", _G.Auto_Rainbow_Haki, function(value)
        _G.Auto_Rainbow_Haki = value
        StopTween(_G.Auto_Rainbow_Haki)
    end)

    spawn(function()
        pcall(function()
            while wait(.1) do
                if _G.Auto_Rainbow_Haki then
                    if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
                        topos(CFrame.new(-11892.0703125, 930.57672119141, -8760.1591796875))
                        if (Vector3.new(-11892.0703125, 930.57672119141, -8760.1591796875) -
                            game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 30 then
                            wait(1.5)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("HornedMan", "Bet")
                        end
                    elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true and
                        string.find(
                            game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text,
                            "Stone") then
                        if game:GetService("Workspace").Enemies:FindFirstChild("Stone [Lv. 1550] [Boss]") then
                            for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if v.Name == "Stone [Lv. 1550] [Boss]" then
                                    OldCFrameRainbow = v.HumanoidRootPart.CFrame
                                    repeat
                                        task.wait()
                                        EquipWeapon(_G.SelectWeapon)
                                        topos(v.HumanoidRootPart.CFrame * CFrame.new(5, 10, 7))
                                        v.HumanoidRootPart.CanCollide = false
                                        v.HumanoidRootPart.CFrame = OldCFrameRainbow
                                        v.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                                        game:GetService("VirtualUser"):CaptureController()
                                        game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                                        sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius",
                                            math.huge)
                                    until _G.Auto_Rainbow_Haki == false or v.Humanoid.Health <= 0 or not v.Parent or
                                        game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false
                                end
                            end
                        else
                            topos(CFrame.new(-1086.11621, 38.8425903, 6768.71436, 0.0231462717, -0.592676699,
                                0.805107772, 2.03251839e-05, 0.805323839, 0.592835128, -0.999732077, -0.0137055516,
                                0.0186523199))
                        end
                    elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true and
                        string.find(
                            game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text,
                            "Island Empress") then
                        if game:GetService("Workspace").Enemies:FindFirstChild("Island Empress [Lv. 1675] [Boss]") then
                            for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if v.Name == "Island Empress [Lv. 1675] [Boss]" then
                                    OldCFrameRainbow = v.HumanoidRootPart.CFrame
                                    repeat
                                        task.wait()
                                        EquipWeapon(_G.SelectWeapon)
                                        topos(v.HumanoidRootPart.CFrame * CFrame.new(5, 10, 7))
                                        v.HumanoidRootPart.CanCollide = false
                                        v.HumanoidRootPart.CFrame = OldCFrameRainbow
                                        v.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                                        game:GetService("VirtualUser"):CaptureController()
                                        game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                                        sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius",
                                            math.huge)
                                    until _G.Auto_Rainbow_Haki == false or v.Humanoid.Health <= 0 or not v.Parent or
                                        game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false
                                end
                            end
                        else
                            topos(CFrame.new(5713.98877, 601.922974, 202.751251, -0.101080291, -0, -0.994878292, -0, 1,
                                -0, 0.994878292, 0, -0.101080291))
                        end
                    elseif string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle
                                           .Title.Text, "Kilo Admiral") then
                        if game:GetService("Workspace").Enemies:FindFirstChild("Kilo Admiral [Lv. 1750] [Boss]") then
                            for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if v.Name == "Kilo Admiral [Lv. 1750] [Boss]" then
                                    OldCFrameRainbow = v.HumanoidRootPart.CFrame
                                    repeat
                                        task.wait()
                                        EquipWeapon(_G.SelectWeapon)
                                        topos(v.HumanoidRootPart.CFrame * CFrame.new(5, 10, 7))
                                        v.HumanoidRootPart.CanCollide = false
                                        v.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                                        v.HumanoidRootPart.CFrame = OldCFrameRainbow
                                        game:GetService("VirtualUser"):CaptureController()
                                        game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                                        sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius",
                                            math.huge)
                                    until _G.Auto_Rainbow_Haki == false or v.Humanoid.Health <= 0 or not v.Parent or
                                        game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false
                                end
                            end
                        else
                            topos(CFrame.new(2877.61743, 423.558685, -7207.31006, -0.989591599, -0, -0.143904909, -0,
                                1.00000012, -0, 0.143904924, 0, -0.989591479))
                        end
                    elseif string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle
                                           .Title.Text, "Captain Elephant") then
                        if game:GetService("Workspace").Enemies:FindFirstChild("Captain Elephant [Lv. 1875] [Boss]") then
                            for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if v.Name == "Captain Elephant [Lv. 1875] [Boss]" then
                                    OldCFrameRainbow = v.HumanoidRootPart.CFrame
                                    repeat
                                        task.wait()
                                        EquipWeapon(_G.SelectWeapon)
                                        topos(v.HumanoidRootPart.CFrame * CFrame.new(5, 10, 7))
                                        v.HumanoidRootPart.CanCollide = false
                                        v.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                                        v.HumanoidRootPart.CFrame = OldCFrameRainbow
                                        game:GetService("VirtualUser"):CaptureController()
                                        game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                                        sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius",
                                            math.huge)
                                    until _G.Auto_Rainbow_Haki == false or v.Humanoid.Health <= 0 or not v.Parent or
                                        game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false
                                end
                            end
                        else
                            topos(CFrame.new(-13485.0283, 331.709259, -8012.4873, 0.714521289, 7.98849911e-08,
                                0.69961375, -1.02065748e-07, 1, -9.94383065e-09, -0.69961375, -6.43015241e-08,
                                0.714521289))
                        end
                    elseif string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle
                                           .Title.Text, "Beautiful Pirate") then
                        if game:GetService("Workspace").Enemies:FindFirstChild("Beautiful Pirate [Lv. 1950] [Boss]") then
                            for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if v.Name == "Beautiful Pirate [Lv. 1950] [Boss]" then
                                    OldCFrameRainbow = v.HumanoidRootPart.CFrame
                                    repeat
                                        task.wait()
                                        EquipWeapon(_G.SelectWeapon)
                                        topos(v.HumanoidRootPart.CFrame * CFrame.new(5, 10, 7))
                                        v.HumanoidRootPart.CanCollide = false
                                        v.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                                        v.HumanoidRootPart.CFrame = OldCFrameRainbow
                                        game:GetService("VirtualUser"):CaptureController()
                                        game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                                        sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius",
                                            math.huge)
                                    until _G.Auto_Rainbow_Haki == false or v.Humanoid.Health <= 0 or not v.Parent or
                                        game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false
                                end
                            end
                        else
                            topos(CFrame.new(5312.3598632813, 20.141201019287, -10.158538818359))
                        end
                    else
                        topos(CFrame.new(-11892.0703125, 930.57672119141, -8760.1591796875))
                        if (Vector3.new(-11892.0703125, 930.57672119141, -8760.1591796875) -
                            game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 30 then
                            wait(1.5)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("HornedMan", "Bet")
                        end
                    end
                end
            end
        end)
    end)

    Main:AddToggle("Auto Observation Haki v2", _G.AutoObservationv2, function(value)
        _G.AutoObservationv2 = value
        StopTween(_G.AutoObservationv2)
    end)

    spawn(function()
        while wait() do
            pcall(function()
                if _G.AutoObservationv2 then
                    if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CitizenQuestProgress",
                        "Citizen") == 3 then
                        _G.AutoMusketeerHat = false
                        if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Banana") and
                            game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Apple") and
                            game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Pineapple") then
                            repeat
                                topos(CFrame.new(-12444.78515625, 332.40396118164, -7673.1806640625))
                                wait()
                            until not _G.AutoObservationv2 or
                                (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position -
                                    Vector3.new(-12444.78515625, 332.40396118164, -7673.1806640625)).Magnitude <= 10
                            wait(.5)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CitizenQuestProgress",
                                "Citizen")
                        elseif game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Fruit Bowl") or
                            game:GetService("Players").LocalPlayer.Character:FindFirstChild("Fruit Bowl") then
                            repeat
                                topos(CFrame.new(-10920.125, 624.20275878906, -10266.995117188))
                                wait()
                            until not _G.AutoObservationv2 or
                                (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position -
                                    Vector3.new(-10920.125, 624.20275878906, -10266.995117188)).Magnitude <= 10
                            wait(.5)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("KenTalk2", "Start")
                            wait(1)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("KenTalk2", "Buy")
                        else
                            for i, v in pairs(game:GetService("Workspace"):GetDescendants()) do
                                if v.Name == "Apple" or v.Name == "Banana" or v.Name == "Pineapple" then
                                    v.Handle.CFrame = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
                                                          .CFrame * CFrame.new(0, 1, 10)
                                    wait()
                                    firetouchinterest(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart,
                                        v.Handle, 0)
                                    wait()
                                end
                            end
                        end
                    else
                        _G.AutoMusketeerHat = true
                    end
                end
            end)
        end
    end)

    Main:AddToggle("Auto Rengoku", _G.AutoRengoku, function(value)
        _G.AutoRengoku = value
        StopTween(_G.AutoRengoku)
    end)

    spawn(function()
        pcall(function()
            while wait() do
                if _G.AutoRengoku then
                    if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Hidden Key") or
                        game:GetService("Players").LocalPlayer.Character:FindFirstChild("Hidden Key") then
                        EquipWeapon("Hidden Key")
                        topos(CFrame.new(6571.1201171875, 299.23028564453, -6967.841796875))
                    elseif game:GetService("Workspace").Enemies:FindFirstChild("Snow Lurker [Lv. 1375]") or
                        game:GetService("Workspace").Enemies:FindFirstChild("Arctic Warrior [Lv. 1350]") then
                        for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if (v.Name == "Snow Lurker [Lv. 1375]" or v.Name == "Arctic Warrior [Lv. 1350]") and
                                v.Humanoid.Health > 0 then
                                repeat
                                    task.wait()
                                    EquipWeapon(_G.SelectWeapon)
                                    AutoHaki()
                                    v.HumanoidRootPart.CanCollide = false
                                    v.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                                    RengokuMon = v.HumanoidRootPart.CFrame
                                    topos(v.HumanoidRootPart.CFrame * CFrame.new(5, 10, 7))
                                    game:GetService 'VirtualUser':CaptureController()
                                    game:GetService 'VirtualUser':Button1Down(Vector2.new(1280, 672))
                                    StartRengokuMagnet = true
                                until game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Hidden Key") or
                                    _G.AutoRengoku == false or not v.Parent or v.Humanoid.Health <= 0
                                StartRengokuMagnet = false
                            end
                        end
                    else
                        StartRengokuMagnet = false
                        topos(CFrame.new(5439.716796875, 84.420944213867, -6715.1635742188))
                    end
                end
            end
        end)
    end)

    Main:AddToggle("Auto Farm Ectoplasm", _G.AutoEctoplasm, function(value)
        _G.AutoEctoplasm = value
        StopTween(_G.AutoEctoplasm)
    end)

    spawn(function()
        pcall(function()
            while wait() do
                if _G.AutoEctoplasm then
                    if game:GetService("Workspace").Enemies:FindFirstChild("Ship Deckhand [Lv. 1250]") or
                        game:GetService("Workspace").Enemies:FindFirstChild("Ship Engineer [Lv. 1275]") or
                        game:GetService("Workspace").Enemies:FindFirstChild("Ship Steward [Lv. 1300]") or
                        game:GetService("Workspace").Enemies:FindFirstChild("Ship Officer [Lv. 1325]") then
                        for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if string.find(v.Name, "Ship") then
                                repeat
                                    task.wait()
                                    EquipWeapon(_G.SelectWeapon)
                                    AutoHaki()
                                    if string.find(v.Name, "Ship") then
                                        v.HumanoidRootPart.CanCollide = false
                                        v.Head.CanCollide = false
                                        v.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                                        topos(v.HumanoidRootPart.CFrame * CFrame.new(5, 10, 7))
                                        game:GetService 'VirtualUser':CaptureController()
                                        game:GetService 'VirtualUser':Button1Down(Vector2.new(1280, 672))
                                        EctoplasmMon = v.HumanoidRootPart.CFrame
                                        StartEctoplasmMagnet = true
                                    else
                                        StartEctoplasmMagnet = false
                                        topos(CFrame.new(911.35827636719, 125.95812988281, 33159.5390625))
                                    end
                                until _G.AutoEctoplasm == false or not v.Parent or v.Humanoid.Health <= 0
                            end
                        end
                    else
                        StartEctoplasmMagnet = false
                        local Distance = (Vector3.new(911.35827636719, 125.95812988281, 33159.5390625) -
                                             game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
                        if Distance > 18000 then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",
                                Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
                        end
                        topos(CFrame.new(911.35827636719, 125.95812988281, 33159.5390625))
                    end
                end
            end
        end)
    end)

    Main:AddToggle("Auto Yama", _G.AutoYama, function(value)
        _G.AutoYama = value
        StopTween(_G.AutoYama)
    end)

    spawn(function()
        while wait() do
            if _G.AutoYama then
                if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EliteHunter", "Progress") >= 30 then
                    repeat
                        wait(.1)
                        fireclickdetector(game:GetService("Workspace").Map.Waterfall.SealedKatana.Handle.ClickDetector)
                    until game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Yama") or not _G.AutoYama
                end
            end
        end
    end)

    Main:AddToggle("Auto Evo Race", _G.Auto_EvoRace, function(value)
        _G.Auto_EvoRace = value
        StopTween(_G.Auto_EvoRace)
    end)

    spawn(function()
        pcall(function()
            while wait(.1) do
                if _G.Auto_EvoRace then
                    if not game:GetService("Players").LocalPlayer.Data.Race:FindFirstChild("Evolved") then
                        if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist", "1") == 0 then
                            topos(CFrame.new(-2779.83521, 72.9661407, -3574.02002, -0.730484903, 6.39014104e-08,
                                -0.68292886, 3.59963224e-08, 1, 5.50667032e-08, 0.68292886, 1.56424669e-08, -0.730484903))
                            if (Vector3.new(-2779.83521, 72.9661407, -3574.02002) -
                                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <=
                                4 then
                                wait(1.3)
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist", "2")
                            end
                        elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist", "1") == 1 then
                            pcall(function()
                                if not game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flower 1") and
                                    not game:GetService("Players").LocalPlayer.Character:FindFirstChild("Flower 1") then
                                    topos(game:GetService("Workspace").Flower1.CFrame)
                                elseif not game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flower 2") and
                                    not game:GetService("Players").LocalPlayer.Character:FindFirstChild("Flower 2") then
                                    topos(game:GetService("Workspace").Flower2.CFrame)
                                elseif not game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flower 3") and
                                    not game:GetService("Players").LocalPlayer.Character:FindFirstChild("Flower 3") then
                                    if game:GetService("Workspace").Enemies:FindFirstChild("Zombie [Lv. 950]") then
                                        for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                            if v.Name == "Zombie [Lv. 950]" then
                                                repeat
                                                    task.wait()
                                                    AutoHaki()
                                                    EquipWeapon(_G.SelectWeapon)
                                                    topos(v.HumanoidRootPart.CFrame * CFrame.new(5, 10, 7))
                                                    v.HumanoidRootPart.CanCollide = false
                                                    v.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                                                    game:GetService("VirtualUser"):CaptureController()
                                                    game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                                                    PosMonEvo = v.HumanoidRootPart.CFrame
                                                    StartEvoMagnet = true
                                                until game:GetService("Players").LocalPlayer.Backpack:FindFirstChild(
                                                    "Flower 3") or not v.Parent or v.Humanoid.Health <= 0 or
                                                    _G.Auto_EvoRace == false
                                                StartEvoMagnet = false
                                            end
                                        end
                                    else
                                        StartEvoMagnet = false
                                        topos(CFrame.new(-5685.9233398438, 48.480125427246, -853.23724365234))
                                    end
                                end
                            end)
                        elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist", "1") == 2 then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist", "3")
                        end
                    end
                end
            end
        end)
    end)

    Main:AddToggle("Auto Bartlio Quest", _G.AutoBartilo, function(value)
        _G.AutoBartilo = value
    end)

    spawn(function()
        pcall(function()
            while wait(.1) do
                if _G.AutoBartilo then
                    if game:GetService("Players").LocalPlayer.Data.Level.Value >= 800 and
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress",
                            "Bartilo") == 0 then
                        if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle
                                           .Title.Text, "Swan Pirates") and
                            string.find(
                                game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title
                                    .Text, "50") and game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible ==
                            true then
                            if game:GetService("Workspace").Enemies:FindFirstChild("Swan Pirate [Lv. 775]") then
                                Ms = "Swan Pirate [Lv. 775]"
                                for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                    if v.Name == Ms then
                                        pcall(function()
                                            repeat
                                                task.wait()
                                                sethiddenproperty(game:GetService("Players").LocalPlayer,
                                                    "SimulationRadius", math.huge)
                                                EquipWeapon(_G.SelectWeapon)
                                                AutoHaki()
                                                v.HumanoidRootPart.Transparency = 1
                                                v.HumanoidRootPart.CanCollide = false
                                                v.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                                                topos(v.HumanoidRootPart.CFrame * CFrame.new(5, 10, 7))
                                                PosMonBarto = v.HumanoidRootPart.CFrame
                                                game:GetService 'VirtualUser':CaptureController()
                                                game:GetService 'VirtualUser':Button1Down(Vector2.new(1280, 672))
                                                AutoBartiloBring = true
                                            until not v.Parent or v.Humanoid.Health <= 0 or _G.AutoBartilo == false or
                                                game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible ==
                                                false
                                            AutoBartiloBring = false
                                        end)
                                    end
                                end
                            else
                                repeat
                                    topos(CFrame.new(932.624451, 156.106079, 1180.27466, -0.973085582, 4.55137119e-08,
                                        -0.230443969, 2.67024713e-08, 1, 8.47491108e-08, 0.230443969, 7.63147128e-08,
                                        -0.973085582))
                                    wait()
                                until not _G.AutoBartilo or
                                    (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position -
                                        Vector3.new(932.624451, 156.106079, 1180.27466, -0.973085582, 4.55137119e-08,
                                            -0.230443969, 2.67024713e-08, 1, 8.47491108e-08, 0.230443969,
                                            7.63147128e-08, -0.973085582)).Magnitude <= 10
                            end
                        else
                            repeat
                                topos(CFrame.new(-456.28952, 73.0200958, 299.895966))
                                wait()
                            until not _G.AutoBartilo or
                                (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position -
                                    Vector3.new(-456.28952, 73.0200958, 299.895966)).Magnitude <= 10
                            wait(1.1)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest",
                                "BartiloQuest", 1)
                        end
                    elseif game:GetService("Players").LocalPlayer.Data.Level.Value >= 800 and
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress",
                            "Bartilo") == 1 then
                        if game:GetService("Workspace").Enemies:FindFirstChild("Jeremy [Lv. 850] [Boss]") then
                            Ms = "Jeremy [Lv. 850] [Boss]"
                            for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if v.Name == Ms then
                                    OldCFrameBartlio = v.HumanoidRootPart.CFrame
                                    repeat
                                        task.wait()
                                        sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius",
                                            math.huge)
                                        EquipWeapon(_G.SelectWeapon)
                                        AutoHaki()
                                        v.HumanoidRootPart.Transparency = 1
                                        v.HumanoidRootPart.CanCollide = false
                                        v.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                                        v.HumanoidRootPart.CFrame = OldCFrameBartlio
                                        topos(v.HumanoidRootPart.CFrame * CFrame.new(5, 10, 7))
                                        game:GetService 'VirtualUser':CaptureController()
                                        game:GetService 'VirtualUser':Button1Down(Vector2.new(1280, 672))
                                        sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius",
                                            math.huge)
                                    until not v.Parent or v.Humanoid.Health <= 0 or _G.AutoBartilo == false
                                end
                            end
                        elseif game:GetService("ReplicatedStorage"):FindFirstChild("Jeremy [Lv. 850] [Boss]") then
                            repeat
                                topos(CFrame.new(-456.28952, 73.0200958, 299.895966))
                                wait()
                            until not _G.AutoBartilo or
                                (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position -
                                    Vector3.new(-456.28952, 73.0200958, 299.895966)).Magnitude <= 10
                            wait(1.1)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress",
                                "Bartilo")
                            wait(1)
                            repeat
                                topos(CFrame.new(2099.88159, 448.931, 648.997375))
                                wait()
                            until not _G.AutoBartilo or
                                (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position -
                                    Vector3.new(2099.88159, 448.931, 648.997375)).Magnitude <= 10
                            wait(2)
                        else
                            repeat
                                topos(CFrame.new(2099.88159, 448.931, 648.997375))
                                wait()
                            until not _G.AutoBartilo or
                                (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position -
                                    Vector3.new(2099.88159, 448.931, 648.997375)).Magnitude <= 10
                        end
                    elseif game:GetService("Players").LocalPlayer.Data.Level.Value >= 800 and
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress",
                            "Bartilo") == 2 then
                        repeat
                            topos(CFrame.new(-1850.49329, 13.1789551, 1750.89685))
                            wait()
                        until not _G.AutoBartilo or
                            (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position -
                                Vector3.new(-1850.49329, 13.1789551, 1750.89685)).Magnitude <= 10
                        wait(1)
                        repeat
                            topos(CFrame.new(-1858.87305, 19.3777466, 1712.01807))
                            wait()
                        until not _G.AutoBartilo or
                            (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position -
                                Vector3.new(-1858.87305, 19.3777466, 1712.01807)).Magnitude <= 10
                        wait(1)
                        repeat
                            topos(CFrame.new(-1803.94324, 16.5789185, 1750.89685))
                            wait()
                        until not _G.AutoBartilo or
                            (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position -
                                Vector3.new(-1803.94324, 16.5789185, 1750.89685)).Magnitude <= 10
                        wait(1)
                        repeat
                            topos(CFrame.new(-1858.55835, 16.8604317, 1724.79541))
                            wait()
                        until not _G.AutoBartilo or
                            (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position -
                                Vector3.new(-1858.55835, 16.8604317, 1724.79541)).Magnitude <= 10
                        wait(1)
                        repeat
                            topos(CFrame.new(-1869.54224, 15.987854, 1681.00659))
                            wait()
                        until not _G.AutoBartilo or
                            (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position -
                                Vector3.new(-1869.54224, 15.987854, 1681.00659)).Magnitude <= 10
                        wait(1)
                        repeat
                            topos(CFrame.new(-1800.0979, 16.4978027, 1684.52368))
                            wait()
                        until not _G.AutoBartilo or
                            (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position -
                                Vector3.new(-1800.0979, 16.4978027, 1684.52368)).Magnitude <= 10
                        wait(1)
                        repeat
                            topos(CFrame.new(-1819.26343, 14.795166, 1717.90625))
                            wait()
                        until not _G.AutoBartilo or
                            (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position -
                                Vector3.new(-1819.26343, 14.795166, 1717.90625)).Magnitude <= 10
                        wait(1)
                        repeat
                            topos(CFrame.new(-1813.51843, 14.8604736, 1724.79541))
                            wait()
                        until not _G.AutoBartilo or
                            (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position -
                                Vector3.new(-1813.51843, 14.8604736, 1724.79541)).Magnitude <= 10
                    end
                end
            end
        end)
    end)

    Main:AddToggle("Auto Holy Torch", _G.AutoHolyTorch, function(value)
        _G.AutoHolyTorch = value
        StopTween(_G.AutoHolyTorch)
    end)

    spawn(function()
        while wait() do
            if _G.AutoHolyTorch then
                pcall(function()
                    wait(1)
                    TP(CFrame.new(-10752, 417, -9366))
                    wait(1)
                    TP(CFrame.new(-11672, 334, -9474))
                    wait(1)
                    TP(CFrame.new(-12132, 521, -10655))
                    wait(1)
                    TP(CFrame.new(-13336, 486, -6985))
                    wait(1)
                    TP(CFrame.new(-13489, 332, -7925))
                end)
            end
        end
    end)

    spawn(function()
        while task.wait() do
            pcall(function()
                if _G.BringMonster then
                    CheckQuest()
                    for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if _G.Auto_Farm_Level and StartMagnet and v.Name == Mon and
                            (Mon == "Factory Staff [Lv. 800]" or Mon == "Monkey [Lv. 14]" or Mon ==
                                "Dragon Crew Warrior [Lv. 1575]" or Mon == "Dragon Crew Archer [Lv. 1600]") and
                            v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health >
                            0 and
                            (v.HumanoidRootPart.Position -
                                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <=
                            220 then
                            v.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                            v.HumanoidRootPart.CFrame = PosMon
                            v.Humanoid:ChangeState(14)
                            v.HumanoidRootPart.CanCollide = false
                            v.Head.CanCollide = false
                            if v.Humanoid:FindFirstChild("Animator") then
                                v.Humanoid.Animator:Destroy()
                            end
                            sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
                        elseif _G.Auto_Farm_Level and StartMagnet and v.Name == Mon and v:FindFirstChild("Humanoid") and
                            v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 and
                            (v.HumanoidRootPart.Position -
                                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <=
                            275 then
                            v.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                            v.HumanoidRootPart.CFrame = PosMon
                            v.Humanoid:ChangeState(14)
                            v.HumanoidRootPart.CanCollide = false
                            v.Head.CanCollide = false
                            if v.Humanoid:FindFirstChild("Animator") then
                                v.Humanoid.Animator:Destroy()
                            end
                            sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
                        end
                        if _G.AutoEctoplasm and StartEctoplasmMagnet then
                            if string.find(v.Name, "Ship") and v:FindFirstChild("Humanoid") and
                                v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 and
                                (v.HumanoidRootPart.Position - EctoplasmMon.Position).Magnitude <= 250 then
                                v.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                                v.HumanoidRootPart.CFrame = EctoplasmMon
                                v.Humanoid:ChangeState(14)
                                v.HumanoidRootPart.CanCollide = false
                                v.Head.CanCollide = false
                                if v.Humanoid:FindFirstChild("Animator") then
                                    v.Humanoid.Animator:Destroy()
                                end
                                sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
                            end
                        end
                        if _G.AutoRengoku and StartRengokuMagnet then
                            if (v.Name == "Snow Lurker [Lv. 1375]" or v.Name == "Arctic Warrior [Lv. 1350]") and
                                (v.HumanoidRootPart.Position - RengokuMon.Position).Magnitude <= 250 and
                                v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and
                                v.Humanoid.Health > 0 then
                                v.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                                v.Humanoid:ChangeState(14)
                                v.HumanoidRootPart.CanCollide = false
                                v.Head.CanCollide = false
                                v.HumanoidRootPart.CFrame = RengokuMon
                                if v.Humanoid:FindFirstChild("Animator") then
                                    v.Humanoid.Animator:Destroy()
                                end
                                sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
                            end
                        end
                        if _G.AutoMusketeerHat and StartMagnetMusketeerhat then
                            if v.Name == "Forest Pirate [Lv. 1825]" and
                                (v.HumanoidRootPart.Position - MusketeerHatMon.Position).Magnitude <= 250 and
                                v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and
                                v.Humanoid.Health > 0 then
                                v.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                                v.Humanoid:ChangeState(14)
                                v.HumanoidRootPart.CanCollide = false
                                v.Head.CanCollide = false
                                v.HumanoidRootPart.CFrame = MusketeerHatMon
                                if v.Humanoid:FindFirstChild("Animator") then
                                    v.Humanoid.Animator:Destroy()
                                end
                                sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
                            end
                        end
                        if _G.Auto_EvoRace and StartEvoMagnet then
                            if v.Name == "Zombie [Lv. 950]" and
                                (v.HumanoidRootPart.Position - PosMonEvo.Position).Magnitude <= 250 and
                                v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and
                                v.Humanoid.Health > 0 then
                                v.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                                v.Humanoid:ChangeState(14)
                                v.HumanoidRootPart.CanCollide = false
                                v.Head.CanCollide = false
                                v.HumanoidRootPart.CFrame = PosMonEvo
                                if v.Humanoid:FindFirstChild("Animator") then
                                    v.Humanoid.Animator:Destroy()
                                end
                                sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
                            end
                        end
                        if _G.AutoBartilo and AutoBartiloBring then
                            if v.Name == "Swan Pirate [Lv. 775]" and
                                (v.HumanoidRootPart.Position - PosMonBarto.Position).Magnitude <= 250 and
                                v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and
                                v.Humanoid.Health > 0 then
                                v.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                                v.Humanoid:ChangeState(14)
                                v.HumanoidRootPart.CanCollide = false
                                v.Head.CanCollide = false
                                v.HumanoidRootPart.CFrame = PosMonBarto
                                if v.Humanoid:FindFirstChild("Animator") then
                                    v.Humanoid.Animator:Destroy()
                                end
                                sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
                            end
                        end
                        if _G.Auto_Farm_LevelFruitMastery and StartMasteryFruitMagnet then
                            if v.Name == "Monkey [Lv. 14]" then
                                if (v.HumanoidRootPart.Position - PosMonMasteryFruit.Position).Magnitude <= 250 and
                                    v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and
                                    v.Humanoid.Health > 0 then
                                    v.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                                    v.Humanoid:ChangeState(14)
                                    v.HumanoidRootPart.CanCollide = false
                                    v.Head.CanCollide = false
                                    v.HumanoidRootPart.CFrame = PosMonMasteryFruit
                                    if v.Humanoid:FindFirstChild("Animator") then
                                        v.Humanoid.Animator:Destroy()
                                    end
                                    sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius",
                                        math.huge)
                                end
                            elseif v.Name == "Factory Staff [Lv. 800]" then
                                if (v.HumanoidRootPart.Position - PosMonMasteryFruit.Position).Magnitude <= 250 and
                                    v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and
                                    v.Humanoid.Health > 0 then
                                    v.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                                    v.Humanoid:ChangeState(14)
                                    v.HumanoidRootPart.CanCollide = false
                                    v.Head.CanCollide = false
                                    v.HumanoidRootPart.CFrame = PosMonMasteryFruit
                                    if v.Humanoid:FindFirstChild("Animator") then
                                        v.Humanoid.Animator:Destroy()
                                    end
                                    sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius",
                                        math.huge)
                                end
                            elseif v.Name == Mon then
                                if (v.HumanoidRootPart.Position - PosMonMasteryFruit.Position).Magnitude <= 250 and
                                    v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and
                                    v.Humanoid.Health > 0 then
                                    v.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                                    v.Humanoid:ChangeState(14)
                                    v.HumanoidRootPart.CanCollide = false
                                    v.Head.CanCollide = false
                                    v.HumanoidRootPart.CFrame = PosMonMasteryFruit
                                    if v.Humanoid:FindFirstChild("Animator") then
                                        v.Humanoid.Animator:Destroy()
                                    end
                                    sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius",
                                        math.huge)
                                end
                            end
                        end
                        if _G.Auto_Farm_LevelGunMastery and StartMasteryGunMagnet then
                            if v.Name == "Monkey [Lv. 14]" then
                                if (v.HumanoidRootPart.Position - PosMonMasteryGun.Position).Magnitude <= 250 and
                                    v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and
                                    v.Humanoid.Health > 0 then
                                    v.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                                    v.Humanoid:ChangeState(14)
                                    v.HumanoidRootPart.CanCollide = false
                                    v.Head.CanCollide = false
                                    v.HumanoidRootPart.CFrame = PosMonMasteryGun
                                    if v.Humanoid:FindFirstChild("Animator") then
                                        v.Humanoid.Animator:Destroy()
                                    end
                                    sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius",
                                        math.huge)
                                end
                            elseif v.Name == "Factory Staff [Lv. 800]" then
                                if (v.HumanoidRootPart.Position - PosMonMasteryGun.Position).Magnitude <= 250 and
                                    v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and
                                    v.Humanoid.Health > 0 then
                                    v.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                                    v.Humanoid:ChangeState(14)
                                    v.HumanoidRootPart.CanCollide = false
                                    v.Head.CanCollide = false
                                    v.HumanoidRootPart.CFrame = PosMonMasteryGun
                                    if v.Humanoid:FindFirstChild("Animator") then
                                        v.Humanoid.Animator:Destroy()
                                    end
                                    sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius",
                                        math.huge)
                                end
                            elseif v.Name == Mon then
                                if (v.HumanoidRootPart.Position - PosMonMasteryGun.Position).Magnitude <= 250 and
                                    v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and
                                    v.Humanoid.Health > 0 then
                                    v.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                                    v.Humanoid:ChangeState(14)
                                    v.HumanoidRootPart.CanCollide = false
                                    v.Head.CanCollide = false
                                    v.HumanoidRootPart.CFrame = PosMonMasteryGun
                                    if v.Humanoid:FindFirstChild("Animator") then
                                        v.Humanoid.Animator:Destroy()
                                    end
                                    sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius",
                                        math.huge)
                                end
                            end
                        end
                        if _G.Auto_Bone and StartMagnetBoneMon then
                            if (v.Name == "Reborn Skeleton [Lv. 1975]" or v.Name == "Living Zombie [Lv. 2000]" or v.Name ==
                                "Demonic Soul [Lv. 2025]" or v.Name == "Posessed Mummy [Lv. 2050]") and
                                (v.HumanoidRootPart.Position - PosMonBone.Position).Magnitude <= 250 and
                                v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and
                                v.Humanoid.Health > 0 then
                                v.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                                v.Humanoid:ChangeState(14)
                                v.HumanoidRootPart.CanCollide = false
                                v.Head.CanCollide = false
                                v.HumanoidRootPart.CFrame = PosMonBone
                                if v.Humanoid:FindFirstChild("Animator") then
                                    v.Humanoid.Animator:Destroy()
                                end
                                sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
                            end
                        end
                        if _G.AutoDoughtBoss and MagnetDought then
                            if (v.Name == "Cookie Crafter [Lv. 2200]" or v.Name == "Cake Guard [Lv. 2225]" or v.Name ==
                                "Baking Staff [Lv. 2250]" or v.Name == "Head Baker [Lv. 2275]") and
                                (v.HumanoidRootPart.Position - PosMonDoughtOpenDoor.Position).Magnitude <= 250 and
                                v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and
                                v.Humanoid.Health > 0 then
                                v.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                                v.Humanoid:ChangeState(14)
                                v.HumanoidRootPart.CanCollide = false
                                v.Head.CanCollide = false
                                v.HumanoidRootPart.CFrame = PosMonDoughtOpenDoor
                                if v.Humanoid:FindFirstChild("Animator") then
                                    v.Humanoid.Animator:Destroy()
                                end
                                sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
                            end
                        end
                        if _G.AutoCandy and StartMagnetCandy then
                            if (v.HumanoidRootPart.Position - PosMonCandy.Position).Magnitude <= 250 and
                                v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and
                                v.Humanoid.Health > 0 then
                                v.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                                v.Humanoid:ChangeState(14)
                                v.HumanoidRootPart.CanCollide = false
                                v.Head.CanCollide = false
                                v.HumanoidRootPart.CFrame = PosMonCandy
                                if v.Humanoid:FindFirstChild("Animator") then
                                    v.Humanoid.Animator:Destroy()
                                end
                                sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
                            end
                        end
                    end
                end
            end)
        end
    end)



    local plyserv = Combat:AddLabel("Players")

    spawn(function()
        while wait() do
            pcall(function()
                for i, v in pairs(game:GetService("Players"):GetPlayers()) do
                    if i == 12 then
                        plyserv:Set("Players :" .. " " .. i .. " " .. "/" .. " " .. "12" .. " " .. "(Max)")
                    elseif i == 1 then
                        plyserv:Set("Player :" .. " " .. i .. " " .. "/" .. " " .. "12")
                    else
                        plyserv:Set("Players :" .. " " .. i .. " " .. "/" .. " " .. "12")
                    end
                end
            end)
        end
    end)

    Playerslist = {}

    for i, v in pairs(game:GetService("Players"):GetChildren()) do
        table.insert(Playerslist, v.Name)
    end

    local SelectedPly = Combat:AddDropdown("Select Players", Playerslist, function(value)
        _G.SelectPly = value
    end)

    Combat:AddButton("Refresh Player", function()
        Playerslist = {}
        SelectedPly:Clear()
        for i, v in pairs(game:GetService("Players"):GetChildren()) do
            SelectedPly:Add(v.Name)
        end
    end)

    Combat:AddToggle("Spectate Player", false, function(value)
        SpectatePlys = value
        local plr1 = game:GetService("Players").LocalPlayer.Character.Humanoid
        local plr2 = game:GetService("Players"):FindFirstChild(_G.SelectPly)
        repeat
            wait(.1)
            game:GetService("Workspace").Camera.CameraSubject =
                game:GetService("Players"):FindFirstChild(_G.SelectPly).Character.Humanoid
        until SpectatePlys == false
        game:GetService("Workspace").Camera.CameraSubject = game:GetService("Players").LocalPlayer.Character.Humanoid
    end)

    Combat:AddToggle("Teleport", false, function(value)
        _G.TeleportPly = value
        pcall(function()
            if _G.TeleportPly then
                repeat
                    topos(game:GetService("Players")[_G.SelectPly].Character.HumanoidRootPart.CFrame)
                    wait()
                until _G.TeleportPly == false
            end
            StopTween(_G.TeleportPly)
        end)
    end)

    Combat:AddToggle("Auto Farm Player", false, function(value)
        _G.Auto_Kill_Ply = value
        StopTween(_G.Auto_Kill_Ply)
    end)

    spawn(function()
        while wait() do
            if _G.Auto_Kill_Ply then
                pcall(function()
                    if _G.SelectPly ~= nil then
                        if game.Players:FindFirstChild(_G.SelectPly) then
                            if game.Players:FindFirstChild(_G.SelectPly).Character.Humanoid.Health > 0 then
                                repeat
                                    task.wait()
                                    EquipWeapon(_G.SelectWeapon)
                                    AutoHaki()
                                    game.Players:FindFirstChild(_G.SelectPly).Character.HumanoidRootPart.CanCollide =
                                        false
                                    topos(game.Players:FindFirstChild(_G.SelectPly).Character.HumanoidRootPart.CFrame *
                                              CFrame.new(0, 35, 0))
                                    spawn(function()
                                        pcall(function()
                                            if _G.SelectWeapon == SelectWeaponGun then
                                                local args = {
                                                    [1] = game.Players:FindFirstChild(_G.SelectPly).Character
                                                        .HumanoidRootPart.Position,
                                                    [2] = game.Players:FindFirstChild(_G.SelectPly).Character
                                                        .HumanoidRootPart
                                                }
                                                game:GetService("Players").LocalPlayer.Character[SelectWeaponGun]
                                                    .RemoteFunctionShoot:InvokeServer(unpack(args))
                                            else
                                                game:GetService("VirtualUser"):CaptureController()
                                                game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                                            end
                                        end)
                                    end)
                                until game.Players:FindFirstChild(_G.SelectPly).Character.Humanoid.Health <= 0 or
                                    not game.Players:FindFirstChild(_G.SelectPly) or not _G.Auto_Kill_Ply
                            end
                        end
                    end
                end)
            end
        end
    end)

    Combat:AddSeperator("Aimbot")

    spawn(function()
        while wait() do
            pcall(function()
                local MaxDistance = math.huge
                for i, v in pairs(game:GetService("Players"):GetPlayers()) do
                    if v.Name ~= game:GetService("Players").LocalPlayer.Name then
                        local Distance = v:DistanceFromCharacter(
                            game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position)
                        if Distance < MaxDistance then
                            MaxDistance = Distance
                            PlayerSelectAimbot = v.Name
                        end
                    end
                end
            end)
        end
    end)

    Combat:AddToggle("Aimbot Gun", false, function(value)
        _G.Aimbot_Gun = value
    end)

    spawn(function()
        while task.wait() do
            if _G.Aimbot_Gun and game:GetService("Players").LocalPlayer.Character:FindFirstChild(SelectWeaponGun) then
                pcall(function()
                    game:GetService("Players").LocalPlayer.Character[SelectWeaponGun].Cooldown.Value = 0
                    local args = {
                        [1] = game:GetService("Players"):FindFirstChild(PlayerSelectAimbot).Character.HumanoidRootPart
                            .Position,
                        [2] = game:GetService("Players"):FindFirstChild(PlayerSelectAimbot).Character.HumanoidRootPart
                    }
                    game:GetService("Players").LocalPlayer.Character[SelectWeaponGun].RemoteFunctionShoot:InvokeServer(
                        unpack(args))
                    game:GetService 'VirtualUser':CaptureController()
                    game:GetService 'VirtualUser':Button1Down(Vector2.new(1280, 672))
                end)
            end
        end
    end)

    Combat:AddToggle("Aimbot Skill", false, function(value)
        _G.Aimbot_Skill = value
    end)

    spawn(function()
        pcall(function()
            while task.wait() do
                if _G.Aimbot_Skill and PlayerSelectAimbot ~= nil and
                    game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool") and
                    game.Players.LocalPlayer.Character[game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")
                        .Name]:FindFirstChild("MousePos") then
                    local args = {
                        [1] = game:GetService("Players"):FindFirstChild(PlayerSelectAimbot).Character.HumanoidRootPart
                            .Position
                    }

                    game:GetService("Players").LocalPlayer.Character:FindFirstChild(
                        game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Name).RemoteEvent:FireServer(
                        unpack(args))
                end
            end
        end)
    end)

    Combat:AddSeperator("PvP")

    Combat:AddToggle("Enabled PvP", false, function(value)
        _G.EnabledPvP = value
    end)

    spawn(function()
        pcall(function()
            while wait(.1) do
                if _G.EnabledPvP then
                    if game:GetService("Players").LocalPlayer.PlayerGui.Main.PvpDisabled.Visible == true then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EnablePvp")
                    end
                end
            end
        end)
    end)

    Combat:AddToggle("Safe Mode", false, function(value)
        _G.Safe_Mode = value
        StopTween(_G.Safe_Mode)
    end)

    spawn(function()
        pcall(function()
            while wait() do
                if _G.Safe_Mode then
                    game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame =
                        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame
                end
            end
        end)
    end)

    Combat:AddButton("Respawn", function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetTeam", "Pirates")
        wait()
    end)

    Combat:AddSeperator("Bounty")

    local Current = Combat:AddLabel("Current Bounties :")

    local Bounty = tostring(game:GetService("Players").LocalPlayer.leaderstats["Bounty/Honor"].Value)
    local sub = string.sub
    local len = string.len
    spawn(function()
        while wait() do
            pcall(function()
                if len(Bounty) == 4 then
                    Bounty1 = sub(Bounty, 1, 1) .. "." .. sub(Bounty, 2, 3) .. "K"
                elseif len(Bounty) == 5 then
                    Bounty1 = sub(Bounty, 1, 2) .. "." .. sub(Bounty, 3, 4) .. "K"
                elseif len(Bounty) == 6 then
                    Bounty1 = sub(Bounty, 1, 3) .. "." .. sub(Bounty, 4, 5) .. "K"
                elseif len(Bounty) == 7 then
                    Bounty1 = sub(Bounty, 1, 1) .. "." .. sub(Bounty, 2, 3) .. "M"
                elseif len(Bounty) == 8 then
                    Bounty1 = sub(Bounty, 1, 2) .. "." .. sub(Bounty, 3, 4) .. "M"
                elseif len(Bounty) <= 3 then
                    Bounty1 = Bounty
                end
                if tonumber(Bounty) == 25000000 then
                    Current:Set("Current Bounties : " .. Bounty1 .. " [ Max ]")
                elseif tonumber(Bounty) < 25000000 then
                    Current:Set("Current Bounties : " .. Bounty1)
                end
            end)
        end
    end)

    local Earn = Combat:AddLabel("Earned")
    local OldBounty = game:GetService("Players").LocalPlayer.leaderstats["Bounty/Honor"].Value
    local Bounty = tostring(game:GetService("Players").LocalPlayer.leaderstats["Bounty/Honor"].Value)
    local Earned = tostring(game:GetService("Players").LocalPlayer.leaderstats["Bounty/Honor"].Value - OldBounty)
    local sub = string.sub
    local len = string.len
    spawn(function()
        while wait() do
            pcall(function()
                if len(Earned) == 4 then
                    Earned1 = sub(Earned, 1, 1) .. "." .. sub(Earned, 2, 3) .. "K"
                elseif len(Earned) == 5 then
                    Earned1 = sub(Earned, 1, 2) .. "." .. sub(Earned, 3, 4) .. "K"
                elseif len(Earned) == 6 then
                    Earned1 = sub(Earned, 1, 3) .. "." .. sub(Earned, 4, 5) .. "K"
                elseif len(Earned) == 7 then
                    Earned1 = sub(Earned, 1, 1) .. "." .. sub(Earned, 2, 3) .. "M"
                elseif len(Earned) == 8 then
                    Earned1 = sub(Earned, 1, 2) .. "." .. sub(Earned, 3, 4) .. "M"
                elseif len(Earned) <= 3 then
                    Earned1 = Earned
                end
                Earn:Set("Earned : " .. tonumber(Earned1))
            end)
        end
    end)

    Combat:AddToggle("Auto Farm Bounty", _G.Auto_Farm_LevelBounty, function(value)
        _G.Auto_Farm_LevelBounty = value
        StopTween(_G.Auto_Farm_LevelBounty)
    end)

    spawn(function()
        while wait() do
            pcall(function()
                if _G.Auto_Farm_LevelBounty then
                    for i, v in pairs(game:GetService("Players").LocalPlayer.Character:GetChildren()) do
                        if v:IsA("Shirt") then
                            v:Destroy()
                        end
                        if v:IsA("Pants") then
                            v:Destroy()
                        end
                        if v:IsA("Accessory") then
                            v:Destroy()
                        end
                    end
                end
            end)
        end
    end)

    spawn(function()
        pcall(function()
            if _G.Auto_Farm_LevelBounty then
                while wait() do
                    if game.Players.LocalPlayer.Character.Humanoid.Health > 0 then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
                    end
                end
            end
        end)
    end)

    spawn(function()
        while wait() do
            pcall(function()
                if _G.Auto_Farm_LevelBounty then
                    if not game:GetService("Players").LocalPlayer.Character:FindFirstChild("HasBuso") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
                    end
                end
            end)
        end
    end)

    spawn(function()
        while task.wait() do
            pcall(function()
                if _G.Auto_Farm_LevelBounty then
                    game:GetService("Players").LocalPlayer.Character[SelectWeaponGun].Cooldown.Value = 0
                    spawn(function()
                        game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Beli.Visible = false
                        game:GetService("Players")["LocalPlayer"].PlayerGui.Main.HP.Visible = false
                        game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Energy.Visible = false
                        game:GetService("Players")["LocalPlayer"].PlayerGui.Main.StatsButton.Visible = false
                        game:GetService("Players")["LocalPlayer"].PlayerGui.Main.ShopButton.Visible = false
                        game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Skills.Visible = false
                        game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Level.Visible = false
                        game:GetService("Players")["LocalPlayer"].PlayerGui.Main.MenuButton.Visible = false
                        game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Code.Visible = false
                        game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Settings.Visible = false
                        game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Mute.Visible = false
                        game:GetService("Players")["LocalPlayer"].PlayerGui.Main.CrewButton.Visible = false
                        game.Players.LocalPlayer.Character.Animate.Disabled = true
                    end)
                end
            end)
        end
    end)
    CastlePostoMansion = CFrame.new(-5084.8447265625, 316.48101806641, -3145.3752441406)
    MansiontoCastlePos = CFrame.new(-12464.596679688, 376.30590820312, -7567.2626953125)
    Castletophydra = CFrame.new(-5095.33984375, 316.48101806641, -3168.3134765625)
    HydratoCastle = CFrame.new(5741.869140625, 611.94750976562, -282.61154174805)
    spawn(function()
        while wait() do
            pcall(function()
                if _G.Auto_Farm_LevelBounty then
                    for i, v in pairs(game:GetService("Workspace").Characters:GetChildren()) do
                        if v.Name ~= game.Players.LocalPlayer.Name then
                            if v:WaitForChild("Humanoid").Health > 0 and
                                (game.Players.LocalPlayer.Character.HumanoidRootPart.Position -
                                    v.HumanoidRootPart.Position).Magnitude <= 17000 then
                                plyselecthunthelpold = v.Humanoid.Health
                                repeat
                                    task.wait()
                                    EquipWeapon(SelectWeaponGun)
                                    NameTarget = v.Name
                                    if tostring(game.Players.LocalPlayer.Team) == "Pirates" then
                                        topos(v.HumanoidRootPart.CFrame * CFrame.new(0, 60, -20))
                                    elseif tostring(game.Players.LocalPlayer.Team) == "Marines" then
                                        if game.Players[NameTarget].Team ~= game.Players.LocalPlayer.Team then
                                            topos(v.HumanoidRootPart.CFrame * CFrame.new(0, 60, -20))
                                        end
                                    end
                                    spawn(function()
                                        if (v.HumanoidRootPart.Position -
                                            game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <=
                                            150 then
                                            StartCheckTarget = true
                                        end
                                    end)
                                    v.HumanoidRootPart.CanCollide = false
                                    spawn(function()
                                        pcall(function()
                                            local args = {
                                                [1] = v.HumanoidRootPart.Position,
                                                [2] = v.HumanoidRootPart
                                            }
                                            game:GetService("Players").LocalPlayer.Character[SelectWeaponGun]
                                                .RemoteFunctionShoot:InvokeServer(unpack(args))
                                        end)
                                    end)
                                    TargetSelectHunt = v.Humanoid
                                until _G.Auto_Farm_LevelBounty == false or v.Humanoid.Health == 0 or
                                    not v:FindFirstChild("HumanoidRootPart") or not v:FindFirstChild("Humanoid") or
                                    not v.Parent or NextplySelect == true
                                NextplySelect = false
                                StartCheckTarget = false
                            end
                        end
                    end
                end
            end)
        end
    end)

    spawn(function()
        pcall(function()
            while task.wait() do
                if _G.Auto_Farm_LevelBounty then
                    game:GetService("Players").LocalPlayer.PlayerGui.Main.InCombat.Visible = false
                    game:GetService("Players").LocalPlayer.PlayerGui.Main.SafeZone.Visible = false
                end
            end
        end)
    end)

    spawn(function()
        pcall(function()
            while wait() do
                if _G.Auto_Farm_LevelBounty then
                    if TargetSelectHunt ~= nil then
                        if StartCheckTarget then
                            wait(6.5)
                            if TargetSelectHunt.Health == TargetSelectHunt.MaxHealth or TargetSelectHunt.Health >=
                                plyselecthunthelpold then
                                NextplySelect = true
                                TargetSelectHunt = nil
                            end
                        end
                    end
                end
            end
        end)
    end)

    spawn(function()
        pcall(function()
            while wait(.1) do
                if _G.Auto_Farm_LevelBounty then
                    if game:GetService("Players").LocalPlayer.PlayerGui.Main.PvpDisabled.Visible == true then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EnablePvp")
                    end
                end
            end
        end)
    end)

    Combat:AddToggle("Auto Farm Bounty Hop", _G.Auto_Farm_LevelBounty_Hop, function(value)
        _G.Auto_Farm_LevelBounty_Hop = value
    end)

    spawn(function()
        while wait() do
            if _G.Auto_Farm_LevelBounty then
                if _G.Auto_Farm_LevelBounty_Hop then
                    pcall(function()
                        wait(120)
                        Hop()
                    end)
                end
            end
        end
    end)

    Combat:AddSeperator("Misc Bounty")

    Combat:AddButton("Next Player", function()
        NextplySelect = true
        wait(.1)
        NextplySelect = false
    end)

    Combat:AddSlider("Lock Bounty", 1, 25000000, 750000, function(value)
        _G.BountyLock = value
    end)

    Combat:AddToggle("Start Bounty Lock", false, function(value)
        _G.StartBountyLock = value
    end)

    spawn(function()
        while wait() do
            if _G.StartBountyLock then
                pcall(function()
                    if game:GetService("Players").LocalPlayer.leaderstats["Bounty/Honor"].Value >= _G.BountyLock then
                        game:GetService("Players").LocalPlayer:Kick("Successfully! Bounty Farm")
                    end
                end)
            end
        end
    end)

    Stats:AddSeperator("Auto Stats")

    local Pointstat = Stats:AddLabel("Stat Points")

    spawn(function()
        while wait() do
            pcall(function()
                Pointstat:Set("Stat Points : " .. tostring(game:GetService("Players")["LocalPlayer"].Data.Points.Value))
            end)
        end
    end)

    Stats:AddToggle("Auto Melee", _G.Auto_Melee, function(value)
        _G.Auto_Melee = value
    end)

    Stats:AddToggle("Auto Defense", _G.Auto_Defense, function(value)
        _G.Auto_Defense = value
    end)

    Stats:AddToggle("Auto Sword", _G.Auto_Sword, function(value)
        _G.Auto_Sword = value
    end)

    Stats:AddToggle("Auto Gun", _G.Auto_Gun, function(value)
        _G.Auto_Gun = value
    end)

    Stats:AddToggle("Auto Devil Fruits", _G.Auto_DevilFruit, function(value)
        _G.Auto_DevilFruit = value
    end)

    _G.PointStats = 1
    Stats:AddSlider("Select Point", 1, 100, 1, function(value)
        _G.PointStats = value
    end)

    spawn(function()
        while wait() do
            pcall(function()
                if _G.Auto_Melee then
                    if game:GetService("Players")["LocalPlayer"].Data.Points.Value ~= 0 then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AddPoint", "Melee",
                            _G.PointStats)
                    end
                end
            end)
        end
    end)

    spawn(function()
        while wait() do
            pcall(function()
                if _G.Auto_Defense then
                    if game:GetService("Players")["LocalPlayer"].Data.Points.Value ~= 0 then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AddPoint", "Defense",
                            _G.PointStats)
                    end
                end
            end)
        end
    end)

    spawn(function()
        while wait() do
            pcall(function()
                if _G.Auto_Sword then
                    if game:GetService("Players")["LocalPlayer"].Data.Points.Value ~= 0 then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AddPoint", "Sword",
                            _G.PointStats)
                    end
                end
            end)
        end
    end)

    spawn(function()
        while wait() do
            pcall(function()
                if _G.Auto_Gun then
                    if game:GetService("Players")["LocalPlayer"].Data.Points.Value ~= 0 then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AddPoint", "Gun",
                            _G.PointStats)
                    end
                end
            end)
        end
    end)

    spawn(function()
        while wait() do
            pcall(function()
                if _G.Auto_DevilFruit then
                    if game:GetService("Players")["LocalPlayer"].Data.Points.Value ~= 0 then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AddPoint", "Devil Fruit",
                            _G.PointStats)
                    end
                end
            end)
        end
    end)

    Stats:AddSeperator("Status")

    local locallv = Stats:AddLabel("Level")

    spawn(function()
        while wait() do
            pcall(function()
                locallv:Set("Level :" .. " " .. game:GetService("Players").LocalPlayer.Data.Level.Value)
            end)
        end
    end)

    local localrace = Stats:AddLabel("Race")

    spawn(function()
        while wait() do
            pcall(function()
                localrace:Set("Race :" .. " " .. game:GetService("Players").LocalPlayer.Data.Race.Value)
            end)
        end
    end)

    local localbeli = Stats:AddLabel("Beli")

    spawn(function()
        while wait() do
            pcall(function()
                localbeli:Set("Beli :" .. " " .. game:GetService("Players").LocalPlayer.Data.Beli.Value)
            end)
        end
    end)

    local localfrag = Stats:AddLabel("Fragment")

    spawn(function()
        while wait() do
            pcall(function()
                localfrag:Set("Fragments :" .. " " .. game:GetService("Players").LocalPlayer.Data.Fragments.Value)
            end)
        end
    end)

    local localexp = Stats:AddLabel("ExP")

    spawn(function()
        while wait() do
            pcall(function()
                localexp:Set("ExP Points :" .. " " .. game:GetService("Players").LocalPlayer.Data.Exp.Value)
            end)
        end
    end)

    local localstat = Stats:AddLabel("Stats Points")

    spawn(function()
        while wait() do
            pcall(function()
                localstat:Set("Stats Points :" .. " " .. game:GetService("Players").LocalPlayer.Data.Points.Value)
            end)
        end
    end)

    local localbountyhornor = Stats:AddLabel("Bounty")

    spawn(function()
        while wait() do
            pcall(function()
                localbountyhornor:Set("Bounty / Honor :" .. " " ..
                                          game:GetService("Players").LocalPlayer.leaderstats["Bounty/Honor"].Value)
            end)
        end
    end)

    local localDevil = Stats:AddLabel("Devil Fruit")

    spawn(function()
        while wait() do
            pcall(function()
                if game:GetService("Players").LocalPlayer.Character:FindFirstChild(
                    game:GetService("Players").LocalPlayer.Data.DevilFruit.Value) or
                    game:GetService("Players").LocalPlayer.Backpack:FindFirstChild(
                        game:GetService("Players").LocalPlayer.Data.DevilFruit.Value) then
                    localDevil:Set("Devil Fruit :" .. " " ..
                                       game:GetService("Players").LocalPlayer.Data.DevilFruit.Value)
                else
                    localDevil:Set("Not Have Devil Fruit")
                end
            end)
        end
    end)

    Stats:AddSeperator("Fake")

    Stats:AddToggle("Enabled Fake", _G.EnabledStat, function(value)
        _G.EnabledStat = value
    end)

    Stats:AddTextbox("Level", "", true, function(value)
        if _G.EnabledStat then
            game:GetService("Players")["LocalPlayer"].Data.Level.Value = tonumber(value)
        end
    end)

    Stats:AddTextbox("Exp ", "", true, function(value)
        if _G.EnabledStat then
            game:GetService("Players")["LocalPlayer"].Data.Exp.Value = tonumber(value)
        end
    end)

    Stats:AddTextbox("Beli", "", true, function(value)
        if _G.EnabledStat then
            game:GetService("Players")["LocalPlayer"].Data.Beli.Value = tonumber(value)
        end
    end)

    Stats:AddTextbox("Fragments", "", true, function(value)
        if _G.EnabledStat then
            game:GetService("Players")["Localplayer"].Data.Fragments.Value = tonumber(value)
        end
    end)

    Stats:AddTextbox("Melee", "", true, function(value)
        if _G.EnabledStat then
            game:GetService("Players")["LocalPlayer"].Data.Stats.Melee.Level.Value = tonumber(value)
        end
    end)

    Stats:AddTextbox("Defense", "", true, function(value)
        if _G.EnabledStat then
            game:GetService("Players")["LocalPlayer"].Data.Stats.Defense.Level.Value = tonumber(value)
        end
    end)

    Stats:AddTextbox("Sword", "", true, function(value)
        if _G.EnabledStat then
            game:GetService("Players")["LocalPlayer"].Data.Stats.Sword.Level.Value = tonumber(value)
        end
    end)

    Stats:AddTextbox("Gun", "", true, function(value)
        if _G.EnabledStat then
            game:GetService("Players")["LocalPlayer"].Data.Stats.Gun.Level.Value = tonumber(value)
        end
    end)
    Stats:AddTextbox("Fruit", "", true, function(value)
        if _G.EnabledStat then
            game:GetService("Players")["LocalPlayer"].Data.Stats["Demon Fruit"].Level.Value = tonumber(value)
        end
    end)

    Stats:AddTextbox("Bounty", "", true, function(value)
        if _G.EnabledStat then
            game:GetService("Players")["LocalPlayer"].leaderstats["Bounty/Honor"].Value = tonumber(value)
        end
    end)

    Teleport:AddSeperator("World - Monster")

    Teleport:AddButton("Teleport To Old World", function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelMain")
    end)

    Teleport:AddButton("Teleport To Second Sea", function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelDressrosa")
    end)

    Teleport:AddButton("Teleport To Third Sea", function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelZou")
    end)

    Teleport:AddButton("Teleport to Seabeast", function()
        for i, v in pairs(game:GetService("Workspace").SeaBeasts:GetChildren()) do
            if v:FindFirstChild("HumanoidRootPart") then
                topos(v.HumanoidRootPart.CFrame * CFrame.new(0, 100, 0))
            end
        end
    end)

    Teleport:AddSeperator("Island")

    if World1 then
        Teleport:AddDropdown("Select Island",
            {"WindMill", "Marine", "Middle Town", "Jungle", "Pirate Village", "Desert", "Snow Island", "MarineFord",
             "Colosseum", "Sky Island 1", "Sky Island 2", "Sky Island 3", "Prison", "Magma Village",
             "Under Water Island", "Fountain City", "Shank Room", "Mob Island"}, function(value)
                _G.SelectIsland = value
            end)
    end

    if World2 then
        Teleport:AddDropdown("Select Island",
            {"The Cafe", "Frist Spot", "Dark Area", "Flamingo Mansion", "Flamingo Room", "Green Zone", "Factory",
             "Colossuim", "Zombie Island", "Two Snow Mountain", "Punk Hazard", "Cursed Ship", "Ice Castle",
             "Forgotten Island", "Ussop Island", "Mini Sky Island"}, function(value)
                _G.SelectIsland = value
            end)
    end

    if World3 then
        Teleport:AddDropdown("Select Island",
            {"Mansion", "Port Town", "Great Tree", "Castle On The Sea", "MiniSky", "Hydra Island", "Floating Turtle",
             "Haunted Castle", "Ice Cream Island", "Peanut Island", "Cake Island"}, function(value)
                _G.SelectIsland = value
            end)
    end

    Teleport:AddToggle("Teleport", false, function(value)
        _G.TeleportIsland = value
        if _G.TeleportIsland == true then
            repeat
                wait()
                if _G.SelectIsland == "WindMill" then
                    topos(CFrame.new(979.79895019531, 16.516613006592, 1429.0466308594))
                elseif _G.SelectIsland == "Marine" then
                    topos(CFrame.new(-2566.4296875, 6.8556680679321, 2045.2561035156))
                elseif _G.SelectIsland == "Middle Town" then
                    topos(CFrame.new(-690.33081054688, 15.09425163269, 1582.2380371094))
                elseif _G.SelectIsland == "Jungle" then
                    topos(CFrame.new(-1612.7957763672, 36.852081298828, 149.12843322754))
                elseif _G.SelectIsland == "Pirate Village" then
                    topos(CFrame.new(-1181.3093261719, 4.7514905929565, 3803.5456542969))
                elseif _G.SelectIsland == "Desert" then
                    topos(CFrame.new(944.15789794922, 20.919729232788, 4373.3002929688))
                elseif _G.SelectIsland == "Snow Island" then
                    topos(CFrame.new(1347.8067626953, 104.66806030273, -1319.7370605469))
                elseif _G.SelectIsland == "MarineFord" then
                    topos(CFrame.new(-4914.8212890625, 50.963626861572, 4281.0278320313))
                elseif _G.SelectIsland == "Colosseum" then
                    topos(CFrame.new(-1427.6203613281, 7.2881078720093, -2792.7722167969))
                elseif _G.SelectIsland == "Sky Island 1" then
                    topos(CFrame.new(-4869.1025390625, 733.46051025391, -2667.0180664063))
                elseif _G.SelectIsland == "Sky Island 2" then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(
                        -4607.82275, 872.54248, -1667.55688))
                elseif _G.SelectIsland == "Sky Island 3" then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(
                        -7894.6176757813, 5547.1416015625, -380.29119873047))
                elseif _G.SelectIsland == "Prison" then
                    topos(CFrame.new(4875.330078125, 5.6519818305969, 734.85021972656))
                elseif _G.SelectIsland == "Magma Village" then
                    topos(CFrame.new(-5247.7163085938, 12.883934020996, 8504.96875))
                elseif _G.SelectIsland == "Under Water Island" then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(
                        61163.8515625, 11.6796875, 1819.7841796875))
                elseif _G.SelectIsland == "Fountain City" then
                    topos(CFrame.new(5127.1284179688, 59.501365661621, 4105.4458007813))
                elseif _G.SelectIsland == "Shank Room" then
                    topos(CFrame.new(-1442.16553, 29.8788261, -28.3547478))
                elseif _G.SelectIsland == "Mob Island" then
                    topos(CFrame.new(-2850.20068, 7.39224768, 5354.99268))
                elseif _G.SelectIsland == "The Cafe" then
                    topos(CFrame.new(-380.47927856445, 77.220390319824, 255.82550048828))
                elseif _G.SelectIsland == "Frist Spot" then
                    topos(CFrame.new(-11.311455726624, 29.276733398438, 2771.5224609375))
                elseif _G.SelectIsland == "Dark Area" then
                    topos(CFrame.new(3780.0302734375, 22.652164459229, -3498.5859375))
                elseif _G.SelectIsland == "Flamingo Mansion" then
                    topos(CFrame.new(-483.73370361328, 332.0383605957, 595.32708740234))
                elseif _G.SelectIsland == "Flamingo Room" then
                    topos(CFrame.new(2284.4140625, 15.152037620544, 875.72534179688))
                elseif _G.SelectIsland == "Green Zone" then
                    topos(CFrame.new(-2448.5300292969, 73.016105651855, -3210.6306152344))
                elseif _G.SelectIsland == "Factory" then
                    topos(CFrame.new(424.12698364258, 211.16171264648, -427.54049682617))
                elseif _G.SelectIsland == "Colossuim" then
                    topos(CFrame.new(-1503.6224365234, 219.7956237793, 1369.3101806641))
                elseif _G.SelectIsland == "Zombie Island" then
                    topos(CFrame.new(-5622.033203125, 492.19604492188, -781.78552246094))
                elseif _G.SelectIsland == "Two Snow Mountain" then
                    topos(CFrame.new(753.14288330078, 408.23559570313, -5274.6147460938))
                elseif _G.SelectIsland == "Punk Hazard" then
                    topos(CFrame.new(-6127.654296875, 15.951762199402, -5040.2861328125))
                elseif _G.SelectIsland == "Cursed Ship" then
                    topos(CFrame.new(923.40197753906, 125.05712890625, 32885.875))
                elseif _G.SelectIsland == "Ice Castle" then
                    topos(CFrame.new(6148.4116210938, 294.38687133789, -6741.1166992188))
                elseif _G.SelectIsland == "Forgotten Island" then
                    topos(CFrame.new(-3032.7641601563, 317.89672851563, -10075.373046875))
                elseif _G.SelectIsland == "Ussop Island" then
                    topos(CFrame.new(4816.8618164063, 8.4599885940552, 2863.8195800781))
                elseif _G.SelectIsland == "Mini Sky Island" then
                    topos(CFrame.new(-288.74060058594, 49326.31640625, -35248.59375))
                elseif _G.SelectIsland == "Great Tree" then
                    topos(CFrame.new(2681.2736816406, 1682.8092041016, -7190.9853515625))
                elseif _G.SelectIsland == "Castle On The Sea" then
                    topos(CFrame.new(-5074.45556640625, 314.5155334472656, -2991.054443359375))
                elseif _G.SelectIsland == "MiniSky" then
                    topos(CFrame.new(-260.65557861328, 49325.8046875, -35253.5703125))
                elseif _G.SelectIsland == "Port Town" then
                    topos(CFrame.new(-290.7376708984375, 6.729952812194824, 5343.5537109375))
                elseif _G.SelectIsland == "Hydra Island" then
                    topos(CFrame.new(5228.8842773438, 604.23400878906, 345.0400390625))
                elseif _G.SelectIsland == "Floating Turtle" then
                    topos(CFrame.new(-13274.528320313, 531.82073974609, -7579.22265625))
                elseif _G.SelectIsland == "Mansion" then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(
                        -12471.169921875, 374.94024658203, -7551.677734375))
                elseif _G.SelectIsland == "Haunted Castle" then
                    topos(CFrame.new(-9515.3720703125, 164.00624084473, 5786.0610351562))
                elseif _G.SelectIsland == "Ice Cream Island" then
                    topos(CFrame.new(-902.56817626953, 79.93204498291, -10988.84765625))
                elseif _G.SelectIsland == "Peanut Island" then
                    topos(CFrame.new(-2062.7475585938, 50.473892211914, -10232.568359375))
                elseif _G.SelectIsland == "Cake Island" then
                    topos(CFrame.new(-1884.7747802734375, 19.327526092529297, -11666.8974609375))
                end
            until not _G.TeleportIsland
        end
        StopTween(_G.TeleportIsland)
    end)

    Dungeon:AddLine()

    local TimeRaid = Dungeon:AddLabel("Wait For Dungeon")

    spawn(function()
        pcall(function()
            while wait() do
                if game:GetService("Players").LocalPlayer.PlayerGui.Main.Timer.Visible == true then
                    TimeRaid:Set(game:GetService("Players").LocalPlayer.PlayerGui.Main.Timer.Text)
                else
                    TimeRaid:Set("Wait For Dungeon")
                end
            end
        end)
    end)

    Dungeon:AddToggle("Auto Farm Dungeon", _G.Auto_Dungeon, function(value)
        _G.Auto_Dungeon = value
        StopTween(_G.Auto_Dungeon)
    end)

    spawn(function()
        pcall(function()
            while wait() do
                if _G.Auto_Dungeon then
                    if game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Timer.Visible == true then
                        for i, v in pairs(game:GetService("Workspace").Enemies:GetDescendants()) do
                            if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and
                                v.Humanoid.Health > 0 then
                                pcall(function()
                                    repeat
                                        wait()
                                        sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius",
                                            math.huge)
                                        v.Humanoid.Health = 0
                                        v.HumanoidRootPart.CanCollide = false
                                    until not _G.Auto_Dungeon or not v.Parent or v.Humanoid.Health <= 0
                                end)
                            end
                        end
                    end
                end
            end
        end)
    end)

    spawn(function()
        pcall(function()
            while wait() do
                if _G.Auto_Dungeon then
                    if game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Timer.Visible == true then
                        if game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 5") then
                            topos(game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 5")
                                      .CFrame * CFrame.new(0, 80, 100))
                        elseif game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 4") then
                            topos(game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 4")
                                      .CFrame * CFrame.new(0, 80, 100))
                        elseif game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 3") then
                            topos(game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 3")
                                      .CFrame * CFrame.new(0, 80, 100))
                        elseif game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 2") then
                            topos(game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 2")
                                      .CFrame * CFrame.new(0, 80, 100))
                        elseif game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 1") then
                            topos(game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 1")
                                      .CFrame * CFrame.new(0, 80, 100))
                        end
                    end
                end
            end
        end)
    end)

    Dungeon:AddToggle("Auto Awakener", _G.Auto_Awakener, function(value)
        _G.Auto_Awakener = value
    end)

    spawn(function()
        pcall(function()
            while wait(.1) do
                if _G.Auto_Awakener then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Awakener", "Check")
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Awakener", "Awaken")
                end
            end
        end)
    end)

    Dungeon:AddLine()

    Dungeon:AddDropdown("Select Chips", {"Flame", "Ice", "Quake", "Light", "Dark", "String", "Rumble", "Magma",
                                         "Human: Buddha", "Sand", "Bird: Phoenix"}, function(value)
        _G.SelectChip = value
    end)

    Dungeon:AddToggle("Auto Select Dungeon", _G.AutoSelectDungeon, function(value)
        _G.AutoSelectDungeon = value
    end)

    spawn(function()
        while wait() do
            if _G.AutoSelectDungeon then
                pcall(function()
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Flame-Flame") or
                        game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flame-Flame") then
                        _G.SelectChip = "Flame"
                    elseif game:GetService("Players").LocalPlayer.Character:FindFirstChild("Ice-Ice") or
                        game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Ice-Ice") then
                        _G.SelectChip = "Ice"
                    elseif game:GetService("Players").LocalPlayer.Character:FindFirstChild("Quake-Quake") or
                        game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Quake-Quake") then
                        _G.SelectChip = "Quake"
                    elseif game:GetService("Players").LocalPlayer.Character:FindFirstChild("Light-Light") or
                        game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Light-Light") then
                        _G.SelectChip = "Light"
                    elseif game:GetService("Players").LocalPlayer.Character:FindFirstChild("Dark-Dark") or
                        game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dark-Dark") then
                        _G.SelectChip = "Dark"
                    elseif game:GetService("Players").LocalPlayer.Character:FindFirstChild("String-String") or
                        game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("String-String") then
                        _G.SelectChip = "String"
                    elseif game:GetService("Players").LocalPlayer.Character:FindFirstChild("Rumble-Rumble") or
                        game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Rumble-Rumble") then
                        _G.SelectChip = "Rumble"
                    elseif game:GetService("Players").LocalPlayer.Character:FindFirstChild("Magma-Magma") or
                        game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Magma-Magma") then
                        _G.SelectChip = "Magma"
                    elseif game:GetService("Players").LocalPlayer.Character:FindFirstChild("Human-Human: Buddha Fruit") or
                        game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Human-Human: Buddha Fruit") then
                        _G.SelectChip = "Human: Buddha"
                    elseif game:GetService("Players").LocalPlayer.Character:FindFirstChild("Sand-Sand") or
                        game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Sand-Sand") then
                        _G.SelectChip = "Sand"
                    elseif game:GetService("Players").LocalPlayer.Character:FindFirstChild("Bird-Bird: Phoenix") or
                        game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Bird-Bird: Phoenix") then
                        _G.SelectChip = "Bird: Phoenix"
                    else
                        _G.SelectChip = "Flame"
                    end
                end)
            end
        end
    end)

    Dungeon:AddToggle("Auto Buy Chip", _G.AutoBuyChip, function(value)
        _G.AutoBuyChip = value
    end)

    spawn(function()
        pcall(function()
            while wait() do
                if _G.AutoBuyChip then
                    if not game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Special Microchip") or
                        not game:GetService("Players").LocalPlayer.Character:FindFirstChild("Special Microchip") then
                        if not game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 1") then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("RaidsNpc", "Select",
                                _G.SelectChip)
                        end
                    end
                end
            end
        end)
    end)

    Dungeon:AddButton("Buy Chip Select", function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("RaidsNpc", "Select", _G.SelectChip)
    end)

    Dungeon:AddToggle("Auto Start Raid", _G.Auto_StartRaid, function(value)
        _G.Auto_StartRaid = value
    end)

    spawn(function()
        while wait(.1) do
            pcall(function()
                if _G.Auto_StartRaid then
                    if game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Timer.Visible == false then
                        if not game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 1") and
                            game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Special Microchip") or
                            game:GetService("Players").LocalPlayer.Character:FindFirstChild("Special Microchip") then
                            if World2 then
                                fireclickdetector(game:GetService("Workspace").Map.CircleIsland.RaidSummon2.Button.Main
                                                      .ClickDetector)
                            elseif World3 then
                                fireclickdetector(game:GetService("Workspace").Map["Boat Castle"].RaidSummon2.Button
                                                      .Main.ClickDetector)
                            end
                        end
                    end
                end
            end)
        end
    end)

    Dungeon:AddButton("Start Raid", function()
        if World2 then
            fireclickdetector(game:GetService("Workspace").Map.CircleIsland.RaidSummon2.Button.Main.ClickDetector)
        elseif World3 then
            fireclickdetector(game:GetService("Workspace").Map["Boat Castle"].RaidSummon2.Button.Main.ClickDetector)
        end
    end)

    Dungeon:AddLine()

    Dungeon:AddButton("Next Island", function()
        pcall(function()
            if game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 5") then
                TP(game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 5").CFrame *
                       CFrame.new(0, 70, 100))
            elseif game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 4") then
                TP(game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 4").CFrame *
                       CFrame.new(0, 70, 100))
            elseif game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 3") then
                TP(game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 3").CFrame *
                       CFrame.new(0, 70, 100))
            elseif game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 2") then
                TP(game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 2").CFrame *
                       CFrame.new(0, 70, 100))
            elseif game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 1") then
                TP(game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 1").CFrame *
                       CFrame.new(0, 70, 100))
            end
        end)
    end)

    if World2 then
        Dungeon:AddButton("Teleport to Lab", function()
            TP(CFrame.new(-6438.73535, 250.645355, -4501.50684))
        end)
    elseif World3 then
        Dungeon:AddButton("Teleport to Lab", function()
            TP(CFrame.new(-5017.40869, 314.844055, -2823.0127, -0.925743818, 4.48217499e-08, -0.378151238,
                4.55503146e-09, 1, 1.07377559e-07, 0.378151238, 9.7681621e-08, -0.925743818))
        end)
    end

    if World2 then
        Dungeon:AddButton("Awakening Room", function()
            TP(CFrame.new(266.227783, 1.39509034, 1857.00732))
        end)
    elseif World3 then
        Dungeon:AddButton("Awakening Room", function()
            TP(CFrame.new(-11571.440429688, 49.172668457031, -7574.7368164062))
        end)
    end

    DevilFruit:AddSeperator("Sniper")

    FruitList = {"Bomb-Bomb", "Spike-Spike", "Chop-Chop", "Spring-Spring", "Kilo-Kilo", "Spin-Spin", "Bird: Falcon",
                 "Smoke-Smoke", "Flame-Flame", "Ice-Ice", "Sand-Sand", "Dark-Dark", "Revive-Revive", "Diamond-Diamond",
                 "Light-Light", "Love-Love", "Rubber-Rubber", "Barrier-Barrier", "Magma-Magma", "Door-Door",
                 "Quake-Quake", "Human-Human: Buddha", "String-String", "Bird-Bird: Phoenix", "Rumble-Rumble",
                 "Paw-Paw", "Gravity-Gravity", "Dough-Dough", "Venom-Venom", "Shadow-Shadow", "Control-Control",
                 "Soul-Soul", "Dragon-Dragon"}

    _G.SelectFruit = ""
    DevilFruit:AddDropdown("Select Fruits Sniper", FruitList, function(value)
        _G.SelectFruit = value
    end)

    DevilFruit:AddToggle("Auto Buy Fruit Sniper", _G.AutoBuyFruitSniper, function(value)
        _G.AutoBuyFruitSniper = value
    end)

    DevilFruit:AddSeperator("Others")

    DevilFruit:AddDropdown("Select Fruits Eat", FruitList, function(value)
        _G.SelectFruitEat = value
    end)

    DevilFruit:AddToggle("Auto Eat Fruit", _G.AutoEatFruit, function(value)
        _G.AutoEatFruit = value
    end)

    spawn(function()
        pcall(function()
            while wait(.1) do
                if _G.AutoEatFruit then
                    game:GetService("Players").LocalPlayer.Character:FindFirstChild(_G.SelectFruitEat).EatRemote:InvokeServer()
                end
            end
        end)
    end)

    DevilFruit:AddToggle("Auto Eat Fruit Hop", _G.AutoEatFruitHop, function(value)
        _G.AutoEatFruitHop = value
    end)

    spawn(function()
        pcall(function()
            while wait(.1) do
                wait(10)
                if _G.AutoEatFruitHop and _G.SelectFruitEat ~= nil then
                    if not game:GetService("Players").LocalPlayer.Character:FindFirstChild(_G.SelectFruitEat) or
                        not game:GetService("Players").LocalPlayer.Backpack:FindFirstChild(_G.SelectFruitEat) then
                        Hop()
                    else
                        game:GetService("Players").LocalPlayer.Character:FindFirstChild(_G.SelectFruitEat).EatRemote:InvokeServer()
                    end
                end
            end
        end)
    end)

    spawn(function()
        pcall(function()
            while wait(.1) do
                if _G.AutoBuyFruitSniper then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("GetFruits")
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("PurchaseRawFruit", _G.SelectFruit)
                end
            end
        end)
    end)

    DevilFruit:AddToggle("Auto Random Fruit", _G.Random_Auto, function(value)
        _G.Random_Auto = value
    end)

    spawn(function()
        pcall(function()
            while wait(.1) do
                if _G.Random_Auto then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Cousin", "Buy")
                end
            end
        end)
    end)

    DevilFruit:AddButton("Random Fruit", function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Cousin", "Buy")
    end)

    DevilFruit:AddToggle("Auto Drop Fruit", _G.DropFruit, function(value)
        _G.DropFruit = value
    end)

    spawn(function()
        while wait() do
            if _G.DropFruit then
                pcall(function()
                    for i, v in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
                        if string.find(v.Name, "Fruit") then
                            EquipWeapon(v.Name)
                            wait(.1)
                            if game:GetService("Players").LocalPlayer.PlayerGui.Main.Dialogue.Visible == true then
                                game:GetService("Players").LocalPlayer.PlayerGui.Main.Dialogue.Visible = false
                            end
                            EquipWeapon(v.Name)
                            game:GetService("Players").LocalPlayer.Character:FindFirstChild(SelectFruit).EatRemote:InvokeServer(
                                "Drop")
                        end
                    end
                    for i, v in pairs(game:GetService("Players").LocalPlayer.Character:GetChildren()) do
                        if string.find(v.Name, "Fruit") then
                            EquipWeapon(v.Name)
                            wait(.1)
                            if game:GetService("Players").LocalPlayer.PlayerGui.Main.Dialogue.Visible == true then
                                game:GetService("Players").LocalPlayer.PlayerGui.Main.Dialogue.Visible = false
                            end
                            EquipWeapon(v.Name)
                            game:GetService("Players").LocalPlayer.Character:FindFirstChild(SelectFruit).EatRemote:InvokeServer(
                                "Drop")
                        end
                    end
                end)
            end
        end
    end)

    DevilFruit:AddToggle("Auto Store Fruit", _G.AutoStoreFruit, function(value)
        _G.AutoStoreFruit = value
    end)

    spawn(function()
        pcall(function()
            while wait(.1) do
                if _G.AutoStoreFruit then
                    for i, v in pairs(FruitList) do
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", v)
                    end
                end
            end
        end)
    end)

    DevilFruit:AddToggle("Grab Fruit", _G.BringFruit, function(value)
        _G.BringFruit = value
        pcall(function()
            while _G.BringFruit do
                wait(.1)
                for i, v in pairs(game:GetService("Workspace"):GetChildren()) do
                    if v:IsA("Tool") then
                        local OldCFrame = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame
                        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = v.Handle.CFrame *
                                                                                                       CFrame.new(0, 0,
                                8)
                        v.Handle.CFrame = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame
                        wait(.1)
                        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = OldCFrame
                    end
                end
            end
        end)
    end)

    Shop:AddSeperator("Abilities")

    Shop:AddButton("Buy Geppo", function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki", "Geppo")
    end)

    Shop:AddButton("Buy Buso Haki", function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki", "Buso")
    end)

    Shop:AddButton("Buy Soru", function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki", "Soru")
    end)

    Shop:AddButton("Buy Observation(Ken) Haki", function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("KenTalk", "Buy")
    end)

    Shop:AddSeperator("Fighting Style")

    Shop:AddButton("Buy Black Leg", function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyBlackLeg")
    end)

    Shop:AddButton("Buy Electro", function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectro")
    end)

    Shop:AddButton("Buy Fishman Karate", function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyFishmanKarate")
    end)

    Shop:AddButton("Buy Dragon Claw", function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward", "DragonClaw", "1")
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward", "DragonClaw", "2")
    end)

    Shop:AddButton("Buy Superhuman", function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySuperhuman")
    end)

    Shop:AddButton("Buy Death Step", function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDeathStep")
    end)

    Shop:AddButton("Buy Sharkman Karate", function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate", true)
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate")
    end)

    Shop:AddButton("Buy Electric Claw", function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw")
    end)

    Shop:AddButton("Buy Dragon Talon", function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDragonTalon")
    end)
    -----Shop----------------
    Shop:AddSeperator("Accessory")

    Shop:AddButton("Tomoe Ring", function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Tomoe Ring")
    end)

    Shop:AddButton("Black Cape", function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Black Cape")
    end)

    Shop:AddButton("Swordsman Hat", function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Swordsman Hat")
    end)

    Shop:AddSeperator("Sword")

    Shop:AddButton("Cutlass", function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Cutlass")
    end)

    Shop:AddButton("Katana", function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Katana")
    end)

    Shop:AddButton("Iron Mace", function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Iron Mace")
    end)

    Shop:AddButton("Duel Katana", function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Duel Katana")
    end)

    Shop:AddButton("Triple Katana", function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Triple Katana")
    end)

    Shop:AddButton("Pipe", function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Pipe")
    end)

    Shop:AddButton("Dual Headed Blade", function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Dual-Headed Blade")
    end)

    Shop:AddButton("Bisento", function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Bisento")
    end)

    Shop:AddButton("Soul Cane", function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Soul Cane")
    end)

    Shop:AddSeperator("Gun")

    Shop:AddButton("Slingshot", function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Slingshot")
    end)

    Shop:AddButton("Musket", function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Musket")
    end)

    Shop:AddButton("Flintlock", function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Flintlock")
    end)

    Shop:AddButton("Refined Flintlock", function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Refined Flintlock")
    end)

    Shop:AddButton("Cannon", function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Cannon")
    end)

    Shop:AddButton("Kabucha", function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward", "Slingshot", "1")
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward", "Slingshot", "2")
    end)
    ------------Bone------------------

    Shop:AddSeperator("Bones")

    Shop:AddButton("Buy Surprise", function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Bones", "Buy", 1, 1)
    end)

    Shop:AddButton("Stat Refund", function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Bones", "Buy", 1, 2)
    end)

    Shop:AddButton("Race Reroll", function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Bones", "Buy", 1, 3)
    end)

    Misc:AddSeperator("Server")

    Misc:AddButton("Rejoin Server", function()
        game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService("Players").LocalPlayer)
    end)

    Misc:AddButton("Server Hop", function()
        Hop()
    end)

    Misc:AddButton("Hop To Lower Player", function()
        getgenv().AutoTeleport = true
        getgenv().DontTeleportTheSameNumber = true
        getgenv().CopytoClipboard = false
        if not game:IsLoaded() then
            print("Game is loading waiting...")
        end
        local maxplayers = math.huge
        local serversmaxplayer;
        local goodserver;
        local gamelink = "https://games.roblox.com/v1/games/" .. game.PlaceId ..
                             "/servers/Public?sortOrder=Asc&limit=100"
        function serversearch()
            for _, v in pairs(game:GetService("HttpService"):JSONDecode(game:HttpGetAsync(gamelink)).data) do
                if type(v) == "table" and v.playing ~= nil and maxplayers > v.playing then
                    serversmaxplayer = v.maxPlayers
                    maxplayers = v.playing
                    goodserver = v.id
                end
            end
        end
        function getservers()
            serversearch()
            for i, v in pairs(game:GetService("HttpService"):JSONDecode(game:HttpGetAsync(gamelink))) do
                if i == "nextPageCursor" then
                    if gamelink:find("&cursor=") then
                        local a = gamelink:find("&cursor=")
                        local b = gamelink:sub(a)
                        gamelink = gamelink:gsub(b, "")
                    end
                    gamelink = gamelink .. "&cursor=" .. v
                    getservers()
                end
            end
        end
        getservers()
        if AutoTeleport then
            if DontTeleportTheSameNumber then
                if #game:GetService("Players"):GetPlayers() - 4 == maxplayers then
                    return warn("It has same number of players (except you)")
                elseif goodserver == game.JobId then
                    return warn("Your current server is the most empty server atm")
                end
            end
            game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, goodserver)
        end
    end)

    Misc:AddSeperator("Ui")

    Misc:AddButton("Open Devil Shop", function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("GetFruits")
        game:GetService("Players").LocalPlayer.PlayerGui.Main.FruitShop.Visible = true
    end)

    Misc:AddButton("Open Inventory", function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("getInventoryWeapons")
        wait(1)
        game:GetService("Players").LocalPlayer.PlayerGui.Main.Inventory.Visible = true
    end)

    Misc:AddButton("Open Inventory Fruit", function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("getInventoryFruits")
        game:GetService("Players").LocalPlayer.PlayerGui.Main.FruitInventory.Visible = true
    end)

    Misc:AddToggle("Highlight Mode", false, function(value)
        if value == true then
            game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Beli.Visible = false
            game:GetService("Players")["LocalPlayer"].PlayerGui.Main.HP.Visible = false
            game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Energy.Visible = false
            game:GetService("Players")["LocalPlayer"].PlayerGui.Main.StatsButton.Visible = false
            game:GetService("Players")["LocalPlayer"].PlayerGui.Main.ShopButton.Visible = false
            game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Skills.Visible = false
            game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Level.Visible = false
            game:GetService("Players")["LocalPlayer"].PlayerGui.Main.MenuButton.Visible = false
            game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Code.Visible = false
            game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Settings.Visible = false
            game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Mute.Visible = false
            game:GetService("Players")["LocalPlayer"].PlayerGui.Main.CrewButton.Visible = false
        else
            game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Beli.Visible = true
            game:GetService("Players")["LocalPlayer"].PlayerGui.Main.HP.Visible = true
            game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Energy.Visible = true
            game:GetService("Players")["LocalPlayer"].PlayerGui.Main.StatsButton.Visible = true
            game:GetService("Players")["LocalPlayer"].PlayerGui.Main.ShopButton.Visible = true
            game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Skills.Visible = true
            game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Level.Visible = true
            game:GetService("Players")["LocalPlayer"].PlayerGui.Main.MenuButton.Visible = true
            game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Code.Visible = true
            game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Settings.Visible = true
            game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Mute.Visible = true
            game:GetService("Players")["LocalPlayer"].PlayerGui.Main.CrewButton.Visible = true
        end
    end)

    Misc:AddSeperator("Teams")

    Misc:AddButton("Join Pirates Team", function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetTeam", "Pirates")
    end)

    Misc:AddButton("Join Marines Team", function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetTeam", "Marines")
    end)

    Misc:AddSeperator("Boost")

    Misc:AddButton("Unlock Portal", function()
        _G.UnlockPortal = true
    end)

    spawn(function()
        while wait() do
            pcall(function()
                if _G.UnlockPortal == true then
                    for i, v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.Notifications:GetChildren()) do
                        if v.Name == "NotificationTemplate" then
                            if string.find(v.Text, "cannot") then
                                v:Destroy()
                            end
                        end
                    end
                end
            end)
        end
    end)

    spawn(function()
        while wait() do
            pcall(function()
                if _G.UnlockPortal == true then
                    CastlePostoMansion = CFrame.new(-5084.8447265625, 316.48101806641, -3145.3752441406)
                    MansiontoCastlePos = CFrame.new(-12464.596679688, 376.30590820312, -7567.2626953125)
                    Castletophydra = CFrame.new(-5095.33984375, 316.48101806641, -3168.3134765625)
                    HydratoCastle = CFrame.new(5741.869140625, 611.94750976562, -282.61154174805)
                    if (CastlePostoMansion.Position -
                        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 8 then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(
                            -12471.169921875, 374.94024658203, -7551.677734375))
                    end
                    if (MansiontoCastlePos.Position -
                        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 8 then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(
                            -5072.08984375, 314.5412902832, -3151.1098632812))
                    end
                    if (Castletophydra.Position -
                        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 8 then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(
                            5748.7587890625, 610.44982910156, -267.81704711914))
                    end
                    if (HydratoCastle.Position -
                        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 8 then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(
                            -5072.08984375, 314.5412902832, -3151.1098632812))
                    end
                end
            end)
        end
    end)

    Misc:AddButton("Invisible", function()
        game:GetService("Players").LocalPlayer.Character.LowerTorso:Destroy()
    end)

    Misc:AddButton("Click TP Tool", function()
        local plr = game:GetService("Players").LocalPlayer
        local mouse = plr:GetMouse()
        local tool = Instance.new("Tool")
        tool.RequiresHandle = false
        tool.Name = "Teleport Tool"
        tool.Activated:Connect(function()
            local root = plr.Character.HumanoidRootPart
            local pos = mouse.Hit.Position + Vector3.new(0, 2.5, 0)
            local offset = pos - root.Position
            root.CFrame = root.CFrame + offset
        end)
        tool.Parent = plr.Backpack
    end)

    Misc:AddButton("Stop All Tween", function()
        topos(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
        _G.Clip = false
    end)

    Misc:AddSeperator("Codes")

    local x2Code = {"3BVISITS", "UPD16", "FUDD10", "BIGNEWS", "THEGREATACE", "SUB2GAMERROBOT_EXP1", "StrawHatMaine",
                    "Sub2OfficialNoobie", "SUB2NOOBMASTER123", "Sub2Daigrock", "Axiore", "TantaiGaming", "STRAWHATMAINE"}

    Misc:AddButton("Redeem All Codes", function()
        function RedeemCode(value)
            game:GetService("ReplicatedStorage").Remotes.Redeem:InvokeServer(value)
        end
        for i, v in pairs(x2Code) do
            RedeemCode(v)
        end
    end)

    Misc:AddDropdown("Selected Codes", {"1MLIKES_RESET", "THIRDSEA", "SUB2GAMERROBOT_RESET1", "SUB2UNCLEKIZARU"},
        function(value)
            _G.CodeSelect = value
        end)

    Misc:AddButton("Redeem Code", function()
        game:GetService("ReplicatedStorage").Remotes.Redeem:InvokeServer(_G.CodeSelect)
    end)

    Misc:AddSeperator("State")

    Misc:AddDropdown("Select Haki State", {"State 0", "State 1", "State 2", "State 3", "State 4", "State 5"},
        function(value)
            _G.SelectStateHaki = value
        end)

    Misc:AddButton("Change Buso Haki State", function()
        if _G.SelectStateHaki == "State 0" then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ChangeBusoStage", 0)
        elseif _G.SelectStateHaki == "State 1" then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ChangeBusoStage", 1)
        elseif _G.SelectStateHaki == "State 2" then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ChangeBusoStage", 2)
        elseif _G.SelectStateHaki == "State 3" then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ChangeBusoStage", 3)
        elseif _G.SelectStateHaki == "State 4" then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ChangeBusoStage", 4)
        elseif _G.SelectStateHaki == "State 5" then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ChangeBusoStage", 5)
        end
    end)

    Misc:AddSeperator("Graphic")

    local a = game.Lighting
    local c = Instance.new("ColorCorrectionEffect", a)
    local e = Instance.new("ColorCorrectionEffect", a)
    OldAmbient = a.Ambient
    OldBrightness = a.Brightness
    OldColorShift_Top = a.ColorShift_Top
    OldBrightnessc = c.Brightness
    OldContrastc = c.Contrast
    OldTintColorc = c.TintColor
    OldTintColore = e.TintColor
    Misc:AddToggle("RTX Mode", _G.RTXMode, function(value)
        _G.RTXMode = value
        if not _G.RTXMode then
            return
        end
        while _G.RTXMode do
            wait()
            a.Ambient = Color3.fromRGB(33, 33, 33)
            a.Brightness = 0.3
            c.Brightness = 0.176
            c.Contrast = 0.39
            c.TintColor = Color3.fromRGB(217, 145, 57)
            game.Lighting.FogEnd = 999
            if not game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("PointLight") then
                local a2 = Instance.new("PointLight")
                a2.Parent = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
                a2.Range = 15
                a2.Color = Color3.fromRGB(217, 145, 57)
            end
            if not _G.RTXMode then
                a.Ambient = OldAmbient
                a.Brightness = OldBrightness
                a.ColorShift_Top = OldColorShift_Top
                c.Contrast = OldContrastc
                c.Brightness = OldBrightnessc
                c.TintColor = OldTintColorc
                e.TintColor = OldTintColore
                game.Lighting.FogEnd = 2500
                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("PointLight"):Destroy()
            end
        end
    end)

    Misc:AddButton("FPS Boost", function()
        pcall(function()
            game:GetService("Lighting").FantasySky:Destroy()
            local g = game
            local w = g.Workspace
            local l = g.Lighting
            local t = w.Terrain
            t.WaterWaveSize = 0
            t.WaterWaveSpeed = 0
            t.WaterReflectance = 0
            t.WaterTransparency = 0
            l.GlobalShadows = false
            l.FogEnd = 9e9
            l.Brightness = 0
            settings().Rendering.QualityLevel = "Level01"
            for i, v in pairs(g:GetDescendants()) do
                if v:IsA("Part") or v:IsA("Union") or v:IsA("CornerWedgePart") or v:IsA("TrussPart") then
                    v.Material = "Plastic"
                    v.Reflectance = 0
                elseif v:IsA("Decal") or v:IsA("Texture") then
                    v.Transparency = 1
                elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
                    v.Lifetime = NumberRange.new(0)
                elseif v:IsA("Explosion") then
                    v.BlastPressure = 1
                    v.BlastRadius = 1
                elseif v:IsA("Fire") or v:IsA("SpotLight") or v:IsA("Smoke") or v:IsA("Sparkles") then
                    v.Enabled = false
                elseif v:IsA("MeshPart") then
                    v.Material = "Plastic"
                    v.Reflectance = 0
                    v.TextureID = 10385902758728957
                end
            end
            for i, e in pairs(l:GetChildren()) do
                if e:IsA("BlurEffect") or e:IsA("SunRaysEffect") or e:IsA("ColorCorrectionEffect") or
                    e:IsA("BloomEffect") or e:IsA("DepthOfFieldEffect") then
                    e.Enabled = false
                end
            end
            for i, v in pairs(game:GetService("Workspace").Camera:GetDescendants()) do
                if v.Name == ("Water;") then
                    v.Transparency = 1
                    v.Material = "Plastic"
                end
            end
        end)
    end)

    Misc:AddToggle("Remove Fog", RemoveFog, function(value)
        RemoveFog = value
        if not RemoveFog then
            return
        end
        while RemoveFog do
            wait()
            game.Lighting.FogEnd = 9e9
            if not RemoveFog then
                game.Lighting.FogEnd = 2500
            end
        end
    end)

    Misc:AddButton("Unlock FPS", function()
        setfpscap(100)
    end)

    Misc:AddSeperator("ESP")

    Misc:AddToggle("ESP Player", false, function(value)
        ESPPlayer = value
        while ESPPlayer do
            wait()
            UpdateEspPlayer()
        end
    end)

    Misc:AddToggle("ESP Chest", false, function(value)
        ChestESP = value
        while ChestESP do
            wait()
            UpdateChestEsp()
        end
    end)

    Misc:AddToggle("ESP Fruit", false, function(value)
        DevilFruitESP = value
        while DevilFruitESP do
            wait()
            UpdateBfEsp()
        end
    end)

    Misc:AddToggle("ESP Flower", false, function(value)
        FlowerESP = value
        while FlowerESP do
            wait()
            UpdateFlowerEsp()
        end
    end)

    Misc:AddToggle("ESP Island", IslandESP, function(value)
        IslandESP = value
        while IslandESP do
            wait()
            UpdateIslandESP()
        end
    end)

    Misc:AddSeperator("Abilities")

    Misc:AddToggle("Dodge No Cooldown", false, function(value)
        nododgecool = value
        NoDodgeCool()
    end)

    Misc:AddToggle("Infinite Energy", false, function(value)
        InfiniteEnergy = value
        originalstam = LocalPlayer.Character.Energy.Value
    end)

    Misc:AddToggle("Auto Active Race", _G.AutoAgility, function(value)
        _G.AutoAgility = value
    end)

    spawn(function()
        pcall(function()
            while wait() do
                if _G.AutoAgility then
                    game:GetService("ReplicatedStorage").Remotes.CommE:FireServer("ActivateAbility")
                end
            end
        end)
    end)

    Misc:AddToggle("Infinite Ability", false, function(value)
        InfAbility = value
        if value == false then
            game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("Agility"):Destroy()
        end
    end)

    spawn(function()
        while wait() do
            if InfAbility then
                InfAb()
            end
        end
    end)

    Misc:AddToggle("Infinite Obversation Range", getgenv().InfiniteObRange, function(value)
        getgenv().InfiniteObRange = value
        local VS = game:GetService("Players").LocalPlayer.VisionRadius.Value
        while getgenv().InfiniteObRange do
            wait()
            local player = game:GetService("Players").LocalPlayer
            local char = player.Character
            local VisionRadius = player.VisionRadius
            if player then
                if char.Humanoid.Health <= 0 then
                    wait(5)
                end
                VisionRadius.Value = math.huge
            elseif getgenv().InfiniteObRange == false and player then
                VisionRadius.Value = VS
            end
        end
    end)

    Misc:AddToggle("Infinite Geppo", getgenv().InfGeppo, function(value)
        getgenv().InfGeppo = value
    end)

    spawn(function()
        while wait() do
            pcall(function()
                if getgenv().InfGeppo then
                    for i, v in next, getgc() do
                        if game:GetService("Players").LocalPlayer.Character.Geppo then
                            if typeof(v) == "function" and getfenv(v).script ==
                                game:GetService("Players").LocalPlayer.Character.Geppo then
                                for i2, v2 in next, getupvalues(v) do
                                    if tostring(i2) == "9" then
                                        repeat
                                            wait(.1)
                                            setupvalue(v, i2, 0)
                                        until not getgenv().InfGeppo or
                                            game:GetService("Players").LocalPlayer.Character.Humanoid.Health <= 0
                                    end
                                end
                            end
                        end
                    end
                end
            end)
        end
    end)

    Misc:AddToggle("Infinite Soru", getgenv().InfSoru, function(value)
        getgenv().InfSoru = value
    end)

    spawn(function()
        while wait() do
            pcall(function()
                if getgenv().InfSoru and
                    game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart") ~= nil then
                    for i, v in next, getgc() do
                        if game:GetService("Players").LocalPlayer.Character.Soru then
                            if typeof(v) == "function" and getfenv(v).script ==
                                game:GetService("Players").LocalPlayer.Character.Soru then
                                for i2, v2 in next, getupvalues(v) do
                                    if typeof(v2) == "table" then
                                        repeat
                                            wait(.1)
                                            v2.LastUse = 0
                                        until not getgenv().InfSoru or
                                            game:GetService("Players").LocalPlayer.Character.Humanoid.Health <= 0
                                    end
                                end
                            end
                        end
                    end
                end
            end)
        end
    end)

    Misc:AddToggle("Walk on Water", _G.WalkWater, function(value)
        _G.WalkWater = value
    end)

    spawn(function()
        pcall(function()
            while wait() do
                if _G.WalkWater then
                    if game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame.Y <= 1 then
                        if not game:GetService("Workspace"):FindFirstChild("Water") then
                            local Water = Instance.new("Part", game:GetService("Workspace"))
                            Water.Name = "Water"
                            Water.Size = Vector3.new(15, 0.5, 15)
                            Water.Anchored = true
                            Water.Material = "Neon"
                            Water.Color = _G.Color
                            game:GetService("Workspace").Water.CFrame = CFrame.new(
                                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame.X,
                                game:GetService("Workspace").Camera["Water;"].CFrame.Y,
                                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame.Z)
                        else
                            game:GetService("Workspace").Water.CFrame = CFrame.new(
                                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame.X,
                                game:GetService("Workspace").Camera["Water;"].CFrame.Y,
                                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame.Z)
                        end
                    elseif game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame.Y >= 1 and
                        game:GetService("Workspace"):FindFirstChild("Water") then
                        game:GetService("Workspace"):FindFirstChild("Water"):Destroy()
                    end
                else
                    if game:GetService("Workspace"):FindFirstChild("Water") then
                        game:GetService("Workspace"):FindFirstChild("Water"):Destroy()
                    end
                end
            end
        end)
    end)

    Misc:AddToggle("Fly", false, function(value)
        Fly = value
    end)

    spawn(function()
        while wait() do
            pcall(function()
                if Fly then
                    fly()
                end
            end)
        end
    end)

    Misc:AddToggle("NoClip", _G.NOCLIP, function(value)
        _G.NOCLIP = value
    end)

    Misc:AddSeperator("Mastery Skill Settings")

    Misc:AddToggle("Skill Z", true, function(value)
        _G.SkillZ = value
    end)

    Misc:AddToggle("Skill X", true, function(value)
        _G.SkillX = value
    end)

    Misc:AddToggle("Skill C", true, function(value)
        _G.SkillC = value
    end)

    Misc:AddToggle("Skill V", true, function(value)
        _G.SkillV = value
    end)
elseif game.PlaceId == 4520749081 or game.PlaceId == 6381829480 or game.PlaceId == 5931540094 or game.PlaceId ==
    5931540094 then
    _G.Color = Color3.fromRGB(255, 0, 0)
    if not game:IsLoaded() then
        repeat
            game.Loaded:Wait()
        until game:IsLoaded()
    end

    repeat
        wait()
    until game:GetService("Players")

    if not game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        repeat
            wait()
        until game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    end

    wait(1)

    do
        local ui = game.CoreGui:FindFirstChild("UlLib")
        if ui then
            ui:Destroy()
        end
    end

    local UserInputService = game:GetService("UserInputService")
    local TweenService = game:GetService("TweenService")

    local function MakeDraggable(topbarobject, object)
        local Dragging = nil
        local DragInput = nil
        local DragStart = nil
        local StartPosition = nil

        local function Update(input)
            local Delta = input.Position - DragStart
            local pos = UDim2.new(StartPosition.X.Scale, StartPosition.X.Offset + Delta.X, StartPosition.Y.Scale,
                StartPosition.Y.Offset + Delta.Y)
            local Tween = TweenService:Create(object, TweenInfo.new(0.2), {
                Position = pos
            })
            Tween:Play()
        end

        topbarobject.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                Dragging = true
                DragStart = input.Position
                StartPosition = object.Position

                input.Changed:Connect(function()
                    if input.UserInputState == Enum.UserInputState.End then
                        Dragging = false
                    end
                end)
            end
        end)

        topbarobject.InputChanged:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType ==
                Enum.UserInputType.Touch then
                DragInput = input
            end
        end)

        UserInputService.InputChanged:Connect(function(input)
            if input == DragInput and Dragging then
                Update(input)
            end
        end)
    end

    local library = {}

    function library:AddWindow(text, keybind)
        local bind = keybind or Enum.KeyCode.RightControl
        local ff = false
        local currenttab = ""

        local DoctorShiba = Instance.new("ScreenGui")
        DoctorShiba.Name = "UlLib"
        DoctorShiba.Parent = game.CoreGui
        DoctorShiba.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

        local Main = Instance.new("Frame")
        Main.Name = "Main"
        Main.Parent = DoctorShiba
        Main.AnchorPoint = Vector2.new(0.5, 0.5)
        Main.BackgroundColor3 = Color3.fromRGB(30, 28, 39)
        Main.BackgroundTransparency = 0.100
        Main.BorderSizePixel = 0
        Main.ClipsDescendants = true
        Main.Position = UDim2.new(0.499526083, 0, 0.499241292, 0)
        Main.Size = UDim2.new(0, 600, 0, 350)

        local Top = Instance.new("Frame")
        Top.Name = "Top"
        Top.Parent = Main
        Top.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Top.BackgroundTransparency = 1.000
        Top.BorderSizePixel = 0
        Top.Size = UDim2.new(0, 600, 0, 20)

        local Page = Instance.new("Frame")
        Page.Name = "Page"
        Page.Parent = Main
        Page.BackgroundColor3 = Color3.fromRGB(25, 23, 35)
        Page.BackgroundTransparency = 0.100
        Page.BorderSizePixel = 0
        Page.Size = UDim2.new(0, 125, 0, 350)

        local NameHub = Instance.new("TextLabel")
        NameHub.Name = "NameHub"
        NameHub.Parent = Page
        NameHub.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        NameHub.BackgroundTransparency = 1.000
        NameHub.Position = UDim2.new(0.113333493, 0, 0, 0)
        NameHub.Size = UDim2.new(0, 110, 0, 20)
        NameHub.Font = Enum.Font.GothamSemibold
        NameHub.Text = text
        NameHub.TextColor3 = Color3.fromRGB(225, 0, 0)
        NameHub.TextSize = 11.000
        NameHub.TextXAlignment = Enum.TextXAlignment.Left

        local User = Instance.new("Frame")
        User.Name = "User"
        User.Parent = Page
        User.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        User.BackgroundTransparency = 1.000
        User.Position = UDim2.new(0, 0, 0.8, 30)
        User.Size = UDim2.new(0, 125, 0, 40)

        local UserText = Instance.new("TextLabel")
        UserText.Name = "UserText"
        UserText.Parent = User
        UserText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        UserText.BackgroundTransparency = 1.000
        UserText.Position = UDim2.new(0.354999989, 0, 0, 11)
        UserText.Size = UDim2.new(0, 80, 0, 20)
        UserText.Font = Enum.Font.Gotham
        UserText.Text = tostring(game.Players.LocalPlayer.Name)
        spawn(function()
            while wait() do
                pcall(function()
                    wait(0.1)
                    game:GetService('TweenService'):Create(UserText, TweenInfo.new(1, Enum.EasingStyle.Linear,
                        Enum.EasingDirection.InOut), {
                        TextColor3 = Color3.fromRGB(255, 0, 0)
                    }):Play()
                    wait(.5)
                    game:GetService('TweenService'):Create(UserText, TweenInfo.new(1, Enum.EasingStyle.Linear,
                        Enum.EasingDirection.InOut), {
                        TextColor3 = Color3.fromRGB(255, 155, 0)
                    }):Play()
                    wait(.5)
                    game:GetService('TweenService'):Create(UserText, TweenInfo.new(1, Enum.EasingStyle.Linear,
                        Enum.EasingDirection.InOut), {
                        TextColor3 = Color3.fromRGB(255, 255, 0)
                    }):Play()
                    wait(.5)
                    game:GetService('TweenService'):Create(UserText, TweenInfo.new(1, Enum.EasingStyle.Linear,
                        Enum.EasingDirection.InOut), {
                        TextColor3 = Color3.fromRGB(0, 255, 0)
                    }):Play()
                    wait(.5)
                    game:GetService('TweenService'):Create(UserText, TweenInfo.new(1, Enum.EasingStyle.Linear,
                        Enum.EasingDirection.InOut), {
                        TextColor3 = Color3.fromRGB(0, 255, 255)
                    }):Play()
                    wait(.5)
                    game:GetService('TweenService'):Create(UserText, TweenInfo.new(1, Enum.EasingStyle.Linear,
                        Enum.EasingDirection.InOut), {
                        TextColor3 = Color3.fromRGB(0, 155, 255)
                    }):Play()
                    wait(.5)
                    game:GetService('TweenService'):Create(UserText, TweenInfo.new(1, Enum.EasingStyle.Linear,
                        Enum.EasingDirection.InOut), {
                        TextColor3 = Color3.fromRGB(255, 0, 255)
                    }):Play()
                    wait(.5)
                    game:GetService('TweenService'):Create(UserText, TweenInfo.new(1, Enum.EasingStyle.Linear,
                        Enum.EasingDirection.InOut), {
                        TextColor3 = Color3.fromRGB(255, 0, 155)
                    }):Play()
                    wait(.5)
                end)
            end
        end)
        UserText.TextScaled = true
        UserText.TextSize = 11.000
        UserText.TextWrapped = true
        UserText.TextXAlignment = Enum.TextXAlignment.Left

        local UITextSizeConstraint = Instance.new("UITextSizeConstraint")
        UITextSizeConstraint.Parent = UserText
        UITextSizeConstraint.MaxTextSize = 11

        local UserImage = Instance.new("ImageLabel")
        UserImage.Name = "UserImage"
        UserImage.Parent = User
        UserImage.BackgroundColor3 = Color3.fromRGB(225, 225, 225)
        UserImage.Position = UDim2.new(0, 10, 0, 9)
        UserImage.Size = UDim2.new(0, 25, 0, 25)
        UserImage.Image =
            "https://www.roblox.com/headshot-thumbnail/image?userId=" .. game.Players.LocalPlayer.UserId ..
                "&width=420&height=420&format=png"

        local UserImageCorner = Instance.new("UICorner")
        UserImageCorner.CornerRadius = UDim.new(0, 100)
        UserImageCorner.Name = "UserImageCorner"
        UserImageCorner.Parent = UserImage

        local ScrollPage = Instance.new("ScrollingFrame")
        ScrollPage.Name = "ScrollPage"
        ScrollPage.Parent = Page
        ScrollPage.Active = true
        ScrollPage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        ScrollPage.BackgroundTransparency = 1.000
        ScrollPage.BorderSizePixel = 0
        ScrollPage.Position = UDim2.new(0, 0, 0.086, 0)
        ScrollPage.Size = UDim2.new(0, 125, 0, 290)
        ScrollPage.CanvasSize = UDim2.new(0, 0, 0, 0)
        ScrollPage.ScrollBarThickness = 0
        local PageList = Instance.new("UIListLayout")
        PageList.Name = "PageList"
        PageList.Parent = ScrollPage
        PageList.SortOrder = Enum.SortOrder.LayoutOrder
        PageList.Padding = UDim.new(0, 7)

        local PagePadding = Instance.new("UIPadding")
        PagePadding.Name = "PagePadding"
        PagePadding.Parent = ScrollPage
        PagePadding.PaddingTop = UDim.new(0, 5)
        PagePadding.PaddingLeft = UDim.new(0, 28)

        local TabFolder = Instance.new("Folder")
        TabFolder.Name = "TabFolder"
        TabFolder.Parent = Main

        MakeDraggable(Top, Main)

        local uihide = false

        UserInputService.InputBegan:Connect(function(input)
            if input.KeyCode == bind then
                if uihide == false then
                    uihide = true
                    Main:TweenSize(UDim2.new(0, 0, 0, 0), "In", "Quad", 0.2, true)
                else
                    uihide = false
                    Main:TweenSize(UDim2.new(0, 600, 0, 350), "Out", "Quad", 0.2, true)
                end
            end
        end)

        local uitab = {}

        function uitab:AddTab(text, image)
            local Image = image or 6023426915

            local PageButton = Instance.new("TextButton")
            PageButton.Name = "PageButton"
            PageButton.Parent = ScrollPage
            PageButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            PageButton.BackgroundTransparency = 1.000
            PageButton.BorderSizePixel = 0
            PageButton.Position = UDim2.new(0.224000007, 0, 0.029787235, 0)
            PageButton.Size = UDim2.new(0, 97, 0, 20)
            PageButton.AutoButtonColor = false
            PageButton.Font = Enum.Font.GothamSemibold
            PageButton.Text = text
            PageButton.TextColor3 = Color3.fromRGB(225, 225, 225)
            PageButton.TextSize = 11.000
            PageButton.TextXAlignment = Enum.TextXAlignment.Left

            local PageImage = Instance.new("ImageLabel")
            PageImage.Name = "PageImage"
            PageImage.Parent = PageButton
            PageImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            PageImage.BackgroundTransparency = 1.000
            PageImage.Position = UDim2.new(0, -20, 0, 3)
            PageImage.Size = UDim2.new(0, 15, 0, 15)
            PageImage.Image = "rbxassetid://" .. tostring(Image)

            local MainTab = Instance.new("Frame")
            MainTab.Name = "MainTab"
            MainTab.Parent = TabFolder
            MainTab.BackgroundColor3 = Color3.fromRGB(30, 28, 39)
            MainTab.BorderSizePixel = 0
            MainTab.Position = UDim2.new(0.208333328, 0, 0, 0)
            MainTab.Size = UDim2.new(0, 475, 0, 350)
            MainTab.Visible = false

            local ScrollTab = Instance.new("ScrollingFrame")
            ScrollTab.Name = "ScrollTab"
            ScrollTab.Parent = MainTab
            ScrollTab.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ScrollTab.BackgroundTransparency = 1.000
            ScrollTab.BorderSizePixel = 0
            ScrollTab.Position = UDim2.new(0, 0, 0.057, 0)
            ScrollTab.Size = UDim2.new(0, 475, 0, 330)
            ScrollTab.CanvasSize = UDim2.new(0, 0, 0, 0)
            ScrollTab.ScrollBarThickness = 3

            local TabList = Instance.new("UIListLayout")
            TabList.Name = "TabList"
            TabList.Parent = ScrollTab
            TabList.SortOrder = Enum.SortOrder.LayoutOrder
            TabList.Padding = UDim.new(0, 5)

            local TabPadding = Instance.new("UIPadding")
            TabPadding.Name = "TabPadding"
            TabPadding.Parent = ScrollTab
            TabPadding.PaddingLeft = UDim.new(0, 10)
            TabPadding.PaddingTop = UDim.new(0, 10)

            PageButton.MouseButton1Click:Connect(function()
                currenttab = MainTab.Name
                for i, v in next, TabFolder:GetChildren() do
                    if v.Name == "MainTab" then
                        v.Visible = false
                    end
                end
                MainTab.Visible = true

                for i, v in next, ScrollPage:GetChildren() do
                    if v:IsA("TextButton") then
                        TweenService:Create(v, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                            TextColor3 = Color3.fromRGB(225, 225, 225)
                        }):Play()
                    end
                    TweenService:Create(PageButton, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {
                            TextColor3 = Color3.fromRGB(255, 0, 0)
                        }):Play()
                end
            end)

            if ff == false then
                TweenService:Create(PageButton, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                    TextColor3 = Color3.fromRGB(255, 0, 0)
                }):Play()
                for i, v in next, TabFolder:GetChildren() do
                    if v.Name == "MainTab" then
                        v.Visible = false
                    end
                    MainTab.Visible = true
                end
                ff = true
            end

            game:GetService("RunService").Stepped:Connect(function()
                pcall(function()
                    ScrollPage.CanvasSize = UDim2.new(0, 0, 0, PageList.AbsoluteContentSize.Y + 10)
                    ScrollTab.CanvasSize = UDim2.new(0, 0, 0, TabList.AbsoluteContentSize.Y + 30)
                end)
            end)

            local main = {}

            function main:AddButton(text, callback)
                local Button = Instance.new("TextButton")

                Button.Name = "Button"
                Button.Parent = ScrollTab
                Button.BackgroundColor3 = Color3.fromRGB(50, 48, 59)
                Button.BackgroundTransparency = 0.1
                Button.BorderSizePixel = 0
                Button.Size = UDim2.new(0, 455, 0, 30)
                Button.AutoButtonColor = false
                Button.Font = Enum.Font.Gotham
                Button.Text = text
                Button.TextColor3 = Color3.fromRGB(225, 225, 225)
                Button.TextSize = 11.000
                Button.TextWrapped = true

                local ButtonCorner = Instance.new("UICorner")
                ButtonCorner.Name = "ButtonCorner"
                ButtonCorner.CornerRadius = UDim.new(0, 5)
                ButtonCorner.Parent = Button

                Button.MouseEnter:Connect(function()
                    TweenService:Create(Button, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                        TextColor3 = Color3.fromRGB(255, 0, 0)
                    }):Play()
                end)

                Button.MouseLeave:Connect(function()
                    TweenService:Create(Button, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                        TextColor3 = Color3.fromRGB(225, 225, 225)
                    }):Play()
                end)

                Button.MouseButton1Click:Connect(function()
                    callback()
                    Button.TextSize = 0
                    TweenService:Create(Button, TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
                        TextSize = 11
                    }):Play()
                end)
            end

            function main:AddToggle(text, config, callback)
                local ToggleImage = Instance.new("Frame")

                local Toggle = Instance.new("TextButton")
                Toggle.Name = "Toggle"
                Toggle.Parent = ScrollTab
                Toggle.BackgroundColor3 = Color3.fromRGB(50, 48, 59)
                Toggle.BackgroundTransparency = 0.1
                Toggle.BorderSizePixel = 0
                Toggle.AutoButtonColor = false
                Toggle.Size = UDim2.new(0, 455, 0, 30)
                Toggle.Font = Enum.Font.SourceSans
                Toggle.Text = ""
                Toggle.TextColor3 = Color3.fromRGB(0, 0, 0)
                Toggle.TextSize = 14.000

                local ToggleCorner = Instance.new("UICorner")
                ToggleCorner.Name = "ToggleCorner"
                ToggleCorner.CornerRadius = UDim.new(0, 5)
                ToggleCorner.Parent = Toggle

                local ToggleLabel = Instance.new("TextLabel")
                ToggleLabel.Name = "ToggleLabel"
                ToggleLabel.Parent = Toggle
                ToggleLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                ToggleLabel.BackgroundTransparency = 1.000
                ToggleLabel.Position = UDim2.new(0, 13, 0, 0)
                ToggleLabel.Size = UDim2.new(0, 410, 0, 30)
                ToggleLabel.Font = Enum.Font.Gotham
                ToggleLabel.Text = text
                ToggleLabel.TextColor3 = Color3.fromRGB(225, 225, 225)
                ToggleLabel.TextSize = 11.000
                ToggleLabel.TextXAlignment = Enum.TextXAlignment.Left

                ToggleImage.Name = "ToggleImage"
                ToggleImage.Parent = Toggle
                ToggleImage.BackgroundColor3 = Color3.fromRGB(70, 68, 79)
                ToggleImage.Position = UDim2.new(0, 425, 0, 5)
                ToggleImage.BorderSizePixel = 0
                ToggleImage.Size = UDim2.new(0, 20, 0, 20)
                local ToggleImageCorner = Instance.new("UICorner")
                ToggleImageCorner.Name = "ToggleImageCorner"
                ToggleImageCorner.CornerRadius = UDim.new(0, 5)
                ToggleImageCorner.Parent = ToggleImage

                local ToggleImage2 = Instance.new("Frame")
                ToggleImage2.Name = "ToggleImage2"
                ToggleImage2.Parent = ToggleImage
                ToggleImage2.AnchorPoint = Vector2.new(0.5, 0.5)
                ToggleImage2.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
                ToggleImage2.Position = UDim2.new(0, 10, 0, 10)
                ToggleImage2.Visible = false

                local ToggleImage2Corner = Instance.new("UICorner")
                ToggleImage2Corner.Name = "ToggleImageCorner"
                ToggleImage2Corner.CornerRadius = UDim.new(0, 5)
                ToggleImage2Corner.Parent = ToggleImage2

                Toggle.MouseEnter:Connect(function()
                    TweenService:Create(ToggleLabel,
                        TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                            TextColor3 = Color3.fromRGB(255, 0, 0)
                        }):Play()
                end)

                Toggle.MouseLeave:Connect(function()
                    TweenService:Create(ToggleLabel,
                        TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                            TextColor3 = Color3.fromRGB(225, 225, 225)
                        }):Play()
                end)
                if config == nil then
                    config = false
                end
                local toggled = config or false
                Toggle.MouseButton1Click:Connect(function()
                    if toggled == false then
                        toggled = true
                        ToggleImage2.Visible = true
                        ToggleImage2:TweenSize(UDim2.new(0, 21, 0, 21), "In", "Quad", 0.1, true)
                    else
                        toggled = false
                        ToggleImage2:TweenSize(UDim2.new(0, 0, 0, 0), "In", "Quad", 0.1, true)
                        wait(0.1)
                        ToggleImage2.Visible = false
                    end
                    callback(toggled)
                end)

                if config == true then
                    ToggleImage2.Visible = true
                    ToggleImage2:TweenSize(UDim2.new(0, 21, 0, 21), "In", "Quad", 0.1, true)
                    toggled = true
                    callback(toggled)
                end
            end

            function main:AddTextbox(text, holder, disappear, callback)
                local Textboxx = Instance.new("Frame")
                local TextboxxCorner = Instance.new("UICorner")
                local TextboxTitle = Instance.new("TextLabel")
                local Textbox = Instance.new("TextBox")
                local TextboxCorner = Instance.new("UICorner")

                Textboxx.Name = "Textboxx"
                Textboxx.Parent = ScrollTab
                Textboxx.BackgroundColor3 = Color3.fromRGB(50, 48, 59)
                Textboxx.Size = UDim2.new(0, 455, 0, 30)

                TextboxxCorner.CornerRadius = UDim.new(0, 5)
                TextboxxCorner.Name = "TextboxxCorner"
                TextboxxCorner.Parent = Textboxx

                TextboxTitle.Name = "TextboxTitle"
                TextboxTitle.Parent = Textboxx
                TextboxTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                TextboxTitle.BackgroundTransparency = 1.000
                TextboxTitle.Position = UDim2.new(0, 15, 0, 0)
                TextboxTitle.Size = UDim2.new(0, 300, 0, 30)
                TextboxTitle.Font = Enum.Font.Gotham
                TextboxTitle.Text = text
                TextboxTitle.TextColor3 = Color3.fromRGB(225, 225, 225)
                TextboxTitle.TextSize = 11.000
                TextboxTitle.TextXAlignment = Enum.TextXAlignment.Left

                Textbox.Name = "Textbox"
                Textbox.Parent = Textboxx
                Textbox.BackgroundColor3 = Color3.fromRGB(30, 28, 39)
                Textbox.Position = UDim2.new(0, 310, 0, 5)
                Textbox.Size = UDim2.new(0, 140, 0, 20)
                Textbox.Font = Enum.Font.Gotham
                Textbox.Text = holder
                Textbox.TextColor3 = Color3.fromRGB(225, 225, 225)
                Textbox.TextSize = 11.000

                Textbox.FocusLost:Connect(function()
                    if #Textbox.Text > 0 then
                        callback(Textbox.Text)
                    end
                    if disappear then
                        Textbox.Text = ""
                    else
                        Textbox.Text = holder
                    end
                end)

                TextboxCorner.Name = "TextboxCorner"
                TextboxCorner.CornerRadius = UDim.new(0, 5)
                TextboxCorner.Parent = Textbox
            end

            function main:AddDropdown(text, table, callback)
                local Dropdown = Instance.new("Frame")
                local UICorner = Instance.new("UICorner")
                local DropButton = Instance.new("TextButton")
                local Droptitle = Instance.new("TextLabel")
                local DropScroll = Instance.new("ScrollingFrame")
                local DropdownList = Instance.new("UIListLayout")
                local DropdownPadding = Instance.new("UIPadding")
                local DropImage = Instance.new("ImageLabel")

                Dropdown.Name = "Dropdown"
                Dropdown.Parent = ScrollTab
                Dropdown.Active = true
                Dropdown.BackgroundColor3 = Color3.fromRGB(50, 48, 59)
                Dropdown.ClipsDescendants = true
                Dropdown.Size = UDim2.new(0, 455, 0, 30)

                UICorner.CornerRadius = UDim.new(0, 5)
                UICorner.Parent = Dropdown

                DropButton.Name = "DropButton"
                DropButton.Parent = Dropdown
                DropButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                DropButton.BackgroundTransparency = 1.000
                DropButton.Size = UDim2.new(0, 455, 0, 30)
                DropButton.Font = Enum.Font.SourceSans
                DropButton.Text = ""
                DropButton.TextColor3 = Color3.fromRGB(0, 0, 0)
                DropButton.TextSize = 14.000

                Droptitle.Name = "Droptitle"
                Droptitle.Parent = Dropdown
                Droptitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Droptitle.BackgroundTransparency = 1.000
                Droptitle.Position = UDim2.new(0.0281690136, 0, 0, 0)
                Droptitle.Size = UDim2.new(0, 410, 0, 30)
                Droptitle.Font = Enum.Font.Gotham
                Droptitle.Text = text .. " : "
                Droptitle.TextColor3 = Color3.fromRGB(225, 225, 225)
                Droptitle.TextSize = 11.000
                Droptitle.TextXAlignment = Enum.TextXAlignment.Left

                DropImage.Name = "DropImage"
                DropImage.Parent = Dropdown
                DropImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                DropImage.BackgroundTransparency = 1.000
                DropImage.Position = UDim2.new(0, 425, 0, 5)
                DropImage.Rotation = 0
                DropImage.Size = UDim2.new(0, 20, 0, 20)
                DropImage.Image = "rbxassetid://5012539403"

                DropScroll.Name = "DropScroll"
                DropScroll.Parent = Droptitle
                DropScroll.Active = true
                DropScroll.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                DropScroll.BackgroundTransparency = 1.000
                DropScroll.BorderSizePixel = 0
                DropScroll.Position = UDim2.new(-0.0317460336, 0, 1, 0)
                DropScroll.Size = UDim2.new(0, 455, 0, 70)
                DropScroll.CanvasSize = UDim2.new(0, 0, 0, 2)
                DropScroll.ScrollBarThickness = 2

                DropdownList.Name = "DropdownList"
                DropdownList.Parent = DropScroll
                DropdownList.SortOrder = Enum.SortOrder.LayoutOrder
                DropdownList.Padding = UDim.new(0, 5)

                DropdownPadding.Name = "DropdownPadding"
                DropdownPadding.Parent = DropScroll
                DropdownPadding.PaddingTop = UDim.new(0, 5)

                local isdropping = false

                for i, v in next, table do
                    local DropButton2 = Instance.new("TextButton")

                    DropButton2.Name = "DropButton2"
                    DropButton2.Parent = DropScroll
                    DropButton2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    DropButton2.BackgroundTransparency = 1.000
                    DropButton2.Size = UDim2.new(0, 455, 0, 30)
                    DropButton2.AutoButtonColor = false
                    DropButton2.Font = Enum.Font.Gotham
                    DropButton2.TextColor3 = Color3.fromRGB(225, 225, 225)
                    DropButton2.TextSize = 11.000
                    DropButton2.Text = tostring(v)

                    DropButton2.MouseEnter:Connect(function()
                        TweenService:Create(DropButton2,
                            TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                TextColor3 = Color3.fromRGB(255, 0, 0)
                            }):Play()
                    end)
                    DropButton2.MouseLeave:Connect(function()
                        TweenService:Create(DropButton2,
                            TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                TextColor3 = Color3.fromRGB(225, 225, 225)
                            }):Play()
                    end)

                    DropButton2.MouseButton1Click:Connect(function()
                        TweenService:Create(Dropdown,
                            TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                Size = UDim2.new(0, 455, 0, 30)
                            }):Play()
                        TweenService:Create(DropImage,
                            TweenInfo.new(0.3, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
                                Rotation = 0
                            }):Play()
                        Droptitle.Text = text .. " : " .. tostring(v)
                        callback(v)
                        isdropping = not isdropping
                        DropScroll.CanvasSize = UDim2.new(0, 0, 0, DropdownList.AbsoluteContentSize.Y + 10)
                    end)
                end

                DropButton.MouseButton1Click:Connect(function()
                    if isdropping == false then
                        isdropping = true
                        TweenService:Create(Dropdown,
                            TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                Size = UDim2.new(0, 455, 0, 100)
                            }):Play()
                        TweenService:Create(DropImage,
                            TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                Rotation = -180
                            }):Play()
                        DropScroll.CanvasSize = UDim2.new(0, 0, 0, DropdownList.AbsoluteContentSize.Y + 10)
                    else
                        isdropping = false
                        TweenService:Create(Dropdown,
                            TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                Size = UDim2.new(0, 455, 0, 30)
                            }):Play()
                        TweenService:Create(DropImage,
                            TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                Rotation = 0
                            }):Play()
                        DropScroll.CanvasSize = UDim2.new(0, 0, 0, DropdownList.AbsoluteContentSize.Y + 10)
                    end
                end)
                DropScroll.CanvasSize = UDim2.new(0, 0, 0, DropdownList.AbsoluteContentSize.Y + 10)

                local drop = {}

                function drop:Clear()
                    Droptitle.Text = tostring(text) .. " :"
                    TweenService:Create(Dropdown, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                        Size = UDim2.new(0, 455, 0, 30)
                    }):Play()
                    isdropping = false
                    for i, v in next, DropScroll:GetChildren() do
                        if v:IsA("TextButton") then
                            v:Destroy()
                        end
                    end
                end
                function drop:Add(t)
                    local DropButton2 = Instance.new("TextButton")

                    DropButton2.Name = "DropButton2"
                    DropButton2.Parent = DropScroll
                    DropButton2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    DropButton2.BackgroundTransparency = 1.000
                    DropButton2.Size = UDim2.new(0, 455, 0, 30)
                    DropButton2.AutoButtonColor = false
                    DropButton2.Font = Enum.Font.Gotham
                    DropButton2.TextColor3 = Color3.fromRGB(225, 225, 225)
                    DropButton2.TextSize = 11.000
                    DropButton2.Text = tostring(t)

                    DropButton2.MouseButton1Click:Connect(function()
                        TweenService:Create(Dropdown,
                            TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                Size = UDim2.new(0, 455, 0, 30)
                            }):Play()
                        TweenService:Create(DropImage,
                            TweenInfo.new(0.3, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
                                Rotation = 0
                            }):Play()
                        Droptitle.Text = text .. " : " .. tostring(t)
                        callback(t)
                        isdropping = not isdropping
                        DropScroll.CanvasSize = UDim2.new(0, 0, 0, DropdownList.AbsoluteContentSize.Y + 10)
                    end)
                end
                return drop
            end

            function main:AddSlider(text, min, max, set, callback)
                set = (math.clamp(set, min, max))
                if set > max then
                    set = max
                end

                local Slider = Instance.new("Frame")
                local UICorner = Instance.new("UICorner")
                local SliderTitle = Instance.new("TextLabel")
                local SliderValue = Instance.new("TextLabel")
                local SliderButton = Instance.new("TextButton")
                local Bar1 = Instance.new("Frame")
                local Bar = Instance.new("Frame")
                local UICorner_2 = Instance.new("UICorner")
                local CircleBar = Instance.new("Frame")
                local UICorner_3 = Instance.new("UICorner")
                local UICorner_4 = Instance.new("UICorner")

                Slider.Name = "Slider"
                Slider.Parent = ScrollTab
                Slider.BackgroundColor3 = Color3.fromRGB(50, 48, 59)
                Slider.Size = UDim2.new(0, 455, 0, 40)

                UICorner.CornerRadius = UDim.new(0, 5)
                UICorner.Parent = Slider

                SliderTitle.Name = "SliderTitle"
                SliderTitle.Parent = Slider
                SliderTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                SliderTitle.BackgroundTransparency = 1.000
                SliderTitle.Position = UDim2.new(0.0283286124, 0, 0, 0)
                SliderTitle.Size = UDim2.new(0, 290, 0, 20)
                SliderTitle.Font = Enum.Font.Gotham
                SliderTitle.Text = text
                SliderTitle.TextColor3 = Color3.fromRGB(225, 225, 225)
                SliderTitle.TextSize = 11.000
                SliderTitle.TextXAlignment = Enum.TextXAlignment.Left

                SliderValue.Name = "SliderValue"
                SliderValue.Parent = Slider
                SliderValue.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                SliderValue.BackgroundTransparency = 1.000
                SliderValue.Position = UDim2.new(0.887778878, 0, 0, 0)
                SliderValue.Size = UDim2.new(0, 40, 0, 20)
                SliderValue.Font = Enum.Font.Gotham
                SliderValue.Text = tostring(set and math.floor((set / max) * (max - min) + min) or 0)
                SliderValue.TextColor3 = Color3.fromRGB(225, 225, 225)
                SliderValue.TextSize = 11.000

                SliderButton.Name = "SliderButton"
                SliderButton.Parent = Slider
                SliderButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                SliderButton.BackgroundTransparency = 1.000
                SliderButton.Position = UDim2.new(0, 10, 0, 25)
                SliderButton.Size = UDim2.new(0, 435, 0, 5)
                SliderButton.AutoButtonColor = false
                SliderButton.Font = Enum.Font.SourceSans
                SliderButton.Text = ""
                SliderButton.TextColor3 = Color3.fromRGB(0, 0, 0)
                SliderButton.TextSize = 14.000

                Bar1.Name = "Bar1"
                Bar1.Parent = SliderButton
                Bar1.BackgroundColor3 = Color3.fromRGB(30, 28, 39)
                Bar1.Size = UDim2.new(0, 435, 0, 5)

                Bar.Name = "Bar"
                Bar.Parent = Bar1
                Bar.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
                Bar.Size = UDim2.new(set / max, 0, 0, 5)

                UICorner_2.CornerRadius = UDim.new(0, 100)
                UICorner_2.Parent = Bar

                CircleBar.Name = "CircleBar"
                CircleBar.Parent = Bar
                CircleBar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                CircleBar.Position = UDim2.new(1, -2, 0, -2)
                CircleBar.AnchorPoint = Vector2.new(0, 0.1)
                CircleBar.Size = UDim2.new(0, 10, 0, 10)

                UICorner_3.CornerRadius = UDim.new(0, 100)
                UICorner_3.Parent = CircleBar

                UICorner_4.CornerRadius = UDim.new(0, 100)
                UICorner_4.Parent = Bar1

                local mouse = game.Players.LocalPlayer:GetMouse()
                local uis = game:GetService("UserInputService")

                if Value == nil then
                    Value = set
                    pcall(function()
                        callback(Value)
                    end)
                end

                SliderButton.MouseButton1Down:Connect(function()
                    Value =
                        math.floor((((tonumber(max) - tonumber(min)) / 435) * Bar.AbsoluteSize.X) + tonumber(min)) or 0
                    pcall(function()
                        callback(Value)
                    end)
                    Bar.Size = UDim2.new(0, math.clamp(mouse.X - Bar.AbsolutePosition.X, 0, 435), 0, 5)
                    CircleBar.Position = UDim2.new(0, math.clamp(mouse.X - Bar.AbsolutePosition.X - 2, 0, 425), 0, -2)
                    moveconnection = mouse.Move:Connect(function()
                        SliderValue.Text = Value
                        Value = math.floor((((tonumber(max) - tonumber(min)) / 435) * Bar.AbsoluteSize.X) +
                                               tonumber(min))
                        pcall(function()
                            callback(Value)
                        end)
                        Bar.Size = UDim2.new(0, math.clamp(mouse.X - Bar.AbsolutePosition.X, 0, 435), 0, 5)
                        CircleBar.Position = UDim2.new(0, math.clamp(mouse.X - Bar.AbsolutePosition.X - 2, 0, 425), 0,
                            -2)
                    end)
                    releaseconnection = uis.InputEnded:Connect(function(Mouse)
                        if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then
                            Value = math.floor((((tonumber(max) - tonumber(min)) / 435) * Bar.AbsoluteSize.X) +
                                                   tonumber(min))
                            pcall(function()
                                callback(Value)
                            end)
                            Bar.Size = UDim2.new(0, math.clamp(mouse.X - Bar.AbsolutePosition.X, 0, 435), 0, 5)
                            CircleBar.Position = UDim2.new(0, math.clamp(mouse.X - Bar.AbsolutePosition.X - 2, 0, 425),
                                0, -2)
                            moveconnection:Disconnect()
                            releaseconnection:Disconnect()
                        end
                    end)
                end)
                releaseconnection = uis.InputEnded:Connect(function(Mouse)
                    if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then
                        Value = math.floor((((tonumber(max) - tonumber(min)) / 435) * Bar.AbsoluteSize.X) +
                                               tonumber(min))
                        SliderValue.Text = Value
                    end
                end)
            end
            function main:AddSeperator(text)
                local Seperator = Instance.new("Frame")
                local Sep1 = Instance.new("Frame")
                local SepLabel = Instance.new("TextLabel")
                local Sep2 = Instance.new("Frame")

                Seperator.Name = "Seperator"
                Seperator.Parent = ScrollTab
                Seperator.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Seperator.BackgroundTransparency = 1.000
                Seperator.ClipsDescendants = true
                Seperator.Size = UDim2.new(0, 455, 0, 20)

                Sep1.Name = "Sep1"
                Sep1.Parent = Seperator
                Sep1.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
                Sep1.BorderSizePixel = 0
                Sep1.Position = UDim2.new(0, 0, 0, 10)
                Sep1.Size = UDim2.new(0, 150, 0, 1)

                SepLabel.Name = "SepLabel"
                SepLabel.Parent = Seperator
                SepLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                SepLabel.BackgroundTransparency = 1.000
                SepLabel.Position = UDim2.new(0, 95, 0, 0)
                SepLabel.Size = UDim2.new(0, 255, 0, 20)
                SepLabel.Font = Enum.Font.Gotham
                SepLabel.Text = text
                SepLabel.TextColor3 = Color3.fromRGB(225, 225, 225)
                SepLabel.TextSize = 11.000

                Sep2.Name = "Sep2"
                Sep2.Parent = Seperator
                Sep2.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
                Sep2.BorderSizePixel = 0
                Sep2.Position = UDim2.new(0, 305, 0, 10)
                Sep2.Size = UDim2.new(0, 150, 0, 1)
            end
            function main:AddLine()
                local Line = Instance.new("Frame")
                local Linee = Instance.new("Frame")

                Line.Name = "Line"
                Line.Parent = ScrollTab
                Line.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Line.BackgroundTransparency = 1.000
                Line.ClipsDescendants = true
                Line.Size = UDim2.new(0, 455, 0, 20)

                Linee.Name = "Linee"
                Linee.Parent = Line
                Linee.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
                Linee.BorderSizePixel = 0
                Linee.Position = UDim2.new(0, 0, 0, 10)
                Linee.Size = UDim2.new(0, 455, 0, 1)
            end
            function main:AddLabel(text)
                local Label = Instance.new("TextLabel")
                local PaddingLabel = Instance.new("UIPadding")
                local labell = {}

                Label.Name = "Label"
                Label.Parent = ScrollTab
                Label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Label.BackgroundTransparency = 1.000
                Label.Size = UDim2.new(0, 455, 0, 20)
                Label.Font = Enum.Font.Gotham
                Label.TextColor3 = Color3.fromRGB(225, 225, 225)
                Label.TextSize = 11.000
                Label.Text = text
                Label.TextXAlignment = Enum.TextXAlignment.Left

                PaddingLabel.PaddingLeft = UDim.new(0, 10)
                PaddingLabel.Parent = Label
                PaddingLabel.Name = "PaddingLabel"

                function labell:Set(newtext)
                    Label.Text = newtext
                end

                return labell
            end

            return main
        end
        return uitab
    end

    local ScreenGui = Instance.new("ScreenGui")
    local Toggle = Instance.new("TextButton")

    ScreenGui.Name = "ScreenGui"
    ScreenGui.Parent = game.CoreGui

    Toggle.Name = "Toggle"
    Toggle.Parent = ScreenGui
    Toggle.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    Toggle.Position = UDim2.new(0.120833337, 0, 0.0952890813, 0)
    Toggle.Size = UDim2.new(0, 50, 0, 50)
    Toggle.Font = Enum.Font.Code
    Toggle.Text = "R"
    Toggle.TextColor3 = Color3.fromRGB(255, 0, 0)
    Toggle.TextScaled = true
    Toggle.MouseButton1Down:connect(function()
        game:GetService("VirtualInputManager"):SendKeyEvent(true, 305, false, game)
        game:GetService("VirtualInputManager"):SendKeyEvent(false, 305, false, game)
    end)

    if game.PlaceId == 4520749081 then
        First_Sea = true
    elseif game.PlaceId == 6381829480 then
        Second_Sea = true
    elseif game.PlaceId == 5931540094 then
        Dungeon_Sea = true
    end
    function CheckQuest()
        QUEST = {}
        LVLREAL = {}
        local MyLevel = game.Players.LocalPlayer.PlayerStats.lvl.Value
        for i, v in pairs(game:GetService("Workspace").AntiTPNPC:GetChildren()) do
            if string.find(v.Name, "QuestLvl") then
                table.insert(QUEST, v.Name)
            end
        end
        for i, v in pairs(game:GetService("ReplicatedStorage").MAP:GetChildren()) do
            if string.find(v.Name, "QuestLvl") then
                table.insert(QUEST, v.Name)
            end
        end
        for i, v in pairs(QUEST) do
            values = v:split("QuestLvl")
            LVL = values[2]
            if MyLevel >= tonumber(LVL) then
                table.insert(LVLREAL, LVL)
            end
        end
        LevelQuest = math.max(unpack(LVLREAL))
    end

    function fly()
        local mouse = game.Players.LocalPlayer:GetMouse ''
        localplayer = game.Players.LocalPlayer
        game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")
        local torso = game.Players.LocalPlayer.Character.HumanoidRootPart
        local speedSET = 25
        local keys = {
            a = false,
            d = false,
            w = false,
            s = false
        }
        local e1
        local e2
        local function start()
            local pos = Instance.new("BodyPosition", torso)
            local gyro = Instance.new("BodyGyro", torso)
            pos.Name = "EPIXPOS"
            pos.maxForce = Vector3.new(math.huge, math.huge, math.huge)
            pos.position = torso.Position
            gyro.maxTorque = Vector3.new(9e9, 9e9, 9e9)
            gyro.CFrame = torso.CFrame
            repeat
                wait()
                localplayer.Character.Humanoid.PlatformStand = true
                local new = gyro.CFrame - gyro.CFrame.p + pos.position
                if not keys.w and not keys.s and not keys.a and not keys.d then
                    speed = 1
                end
                if keys.w then
                    new = new + workspace.CurrentCamera.CoordinateFrame.lookVector * speed
                    speed = speed + speedSET
                end
                if keys.s then
                    new = new - workspace.CurrentCamera.CoordinateFrame.lookVector * speed
                    speed = speed + speedSET
                end
                if keys.d then
                    new = new * CFrame.new(speed, 0, 0)
                    speed = speed + speedSET
                end
                if keys.a then
                    new = new * CFrame.new(-speed, 0, 0)
                    speed = speed + speedSET
                end
                if speed > speedSET then
                    speed = speedSET
                end
                pos.position = new.p
                if keys.w then
                    gyro.CFrame = workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad(speed * 15), 0, 0)
                elseif keys.s then
                    gyro.CFrame = workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(math.rad(speed * 15), 0, 0)
                else
                    gyro.CFrame = workspace.CurrentCamera.CoordinateFrame
                end
            until not Fly
            if gyro then
                gyro:Destroy()
            end
            if pos then
                pos:Destroy()
            end
            flying = false
            localplayer.Character.Humanoid.PlatformStand = false
            speed = 0
        end
        e1 = mouse.KeyDown:connect(function(key)
            if not torso or not torso.Parent then
                flying = false
                e1:disconnect()
                e2:disconnect()
                return
            end
            if key == "w" then
                keys.w = true
            elseif key == "s" then
                keys.s = true
            elseif key == "a" then
                keys.a = true
            elseif key == "d" then
                keys.d = true
            end
        end)
        e2 = mouse.KeyUp:connect(function(key)
            if key == "w" then
                keys.w = false
            elseif key == "s" then
                keys.s = false
            elseif key == "a" then
                keys.a = false
            elseif key == "d" then
                keys.d = false
            end
        end)
        start()
    end

    function isnil(thing)
        return (thing == nil)
    end
    local function round(n)
        return math.floor(tonumber(n) + 0.5)
    end
    Number = math.random(1, 1000000)
    function UpdateEspPlayer()
        if ESPPlayer then
            pcall(function()
                for i, v in pairs(game.Players:GetPlayers()) do
                    if not isnil(v.Character) then
                        if not v.Character.Head:FindFirstChild('NameEsp' .. v.Name) then
                            local BillboardGui = Instance.new("BillboardGui")
                            local ESP = Instance.new("TextLabel")
                            local HealthESP = Instance.new("TextLabel")
                            BillboardGui.Parent = v.Character.Head
                            BillboardGui.Name = 'NameEsp' .. v.Name
                            BillboardGui.ExtentsOffset = Vector3.new(0, 1, 0)
                            BillboardGui.Size = UDim2.new(1, 200, 1, 30)
                            BillboardGui.Adornee = v.Character.Head
                            BillboardGui.AlwaysOnTop = true
                            ESP.Name = "ESP"
                            ESP.Parent = BillboardGui
                            ESP.TextTransparency = 0
                            ESP.BackgroundTransparency = 1
                            ESP.Size = UDim2.new(0, 200, 0, 30)
                            ESP.Position = UDim2.new(0, 25, 0, 0)
                            ESP.Font = Enum.Font.Gotham
                            ESP.Text = (v.Name .. ' ' .. "[ " ..
                                           round(
                                    (game:GetService('Players').LocalPlayer.Character.Head.Position -
                                        v.Character.Head.Position).Magnitude / 3) .. ' M' .. " ]")
                            ESP.TextColor3 = Color3.new(0, 255, 255)
                            ESP.TextSize = 14
                            ESP.TextStrokeTransparency = 0.500
                            ESP.TextWrapped = true
                            HealthESP.Name = "HealthESP"
                            HealthESP.Parent = ESP
                            HealthESP.TextTransparency = 0
                            HealthESP.BackgroundTransparency = 1
                            HealthESP.Position = ESP.Position + UDim2.new(0, -25, 0, 15)
                            HealthESP.Size = UDim2.new(0, 200, 0, 30)
                            HealthESP.Font = Enum.Font.Gotham
                            HealthESP.TextColor3 = Color3.fromRGB(80, 255, 245)
                            HealthESP.TextSize = 14
                            HealthESP.TextStrokeTransparency = 0.500
                            HealthESP.TextWrapped = true
                            HealthESP.Text = "Health " .. math.floor(v.Character.Humanoid.Health) .. "/" ..
                                                 math.floor(v.Character.Humanoid.MaxHealth)
                        else
                            v.Character.Head['NameEsp' .. v.Name].ESP.Text = (v.Name .. ' ' ..
                                                                                 round(
                                    (game:GetService('Players').LocalPlayer.Character.Head.Position -
                                        v.Character.Head.Position).Magnitude / 3) .. ' M')
                            v.Character.Head['NameEsp' .. v.Name].ESP.HealthESP.Text = "Health " ..
                                                                                           math.floor(
                                    v.Character.Humanoid.Health) .. "/" .. math.floor(v.Character.Humanoid.MaxHealth)
                            v.Character.Head:FindFirstChild('NameEsp' .. v.Name).ESP.TextTransparency = 0
                            v.Character.Head:FindFirstChild('NameEsp' .. v.Name).ESP.HealthESP.TextTransparency = 0
                        end
                    end
                end
            end)
        else
            for i, v in pairs(game.Players:GetPlayers()) do
                if v.Character.Head:FindFirstChild('NameEsp' .. v.Name) then
                    pcall(function()
                        v.Character.Head:FindFirstChild('NameEsp' .. v.Name):Destroy()
                    end)
                end
            end
        end
    end

    function UpdateBfEsp()
        for i, v in pairs(game.Workspace:GetChildren()) do
            pcall(function()
                if DevilFruitESP then
                    if string.find(v.Name, "Fruit") then
                        if not v.Handle:FindFirstChild('NameEsp' .. Number) then
                            local bill = Instance.new('BillboardGui', v.Handle)
                            bill.Name = 'NameEsp' .. Number
                            bill.ExtentsOffset = Vector3.new(0, 1, 0)
                            bill.Size = UDim2.new(1, 200, 1, 30)
                            bill.Adornee = v.Handle
                            bill.AlwaysOnTop = true
                            local name = Instance.new('TextLabel', bill)
                            name.Font = "GothamBold"
                            name.FontSize = "Size14"
                            name.TextWrapped = true
                            name.Size = UDim2.new(1, 0, 1, 0)
                            name.TextYAlignment = 'Top'
                            name.BackgroundTransparency = 1
                            name.TextStrokeTransparency = 0.5
                            name.TextColor3 = Color3.fromRGB(255, 0, 0)
                            name.Text = (v.Name .. ' \n' ..
                                            round(
                                    (game:GetService('Players').LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude /
                                        3) .. ' M')
                        else
                            v.Handle['NameEsp' .. Number].TextLabel.Text = (v.Name .. '   \n' ..
                                                                               round(
                                    (game:GetService('Players').LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude /
                                        3) .. ' M')
                        end
                    end
                else
                    if v.Handle:FindFirstChild('NameEsp' .. Number) then
                        v.Handle:FindFirstChild('NameEsp' .. Number):Destroy()
                    end
                end
            end)
        end
    end

    function Hop()
        local PlaceID = game.PlaceId
        local AllIDs = {}
        local foundAnything = ""
        local actualHour = os.date("!*t").hour
        local Deleted = false
        function TPReturner()
            local Site;
            if foundAnything == "" then
                Site = game.HttpService:JSONDecode(game:HttpGet(
                    'https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
            else
                Site = game.HttpService:JSONDecode(game:HttpGet(
                    'https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' ..
                        foundAnything))
            end
            local ID = ""
            if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
                foundAnything = Site.nextPageCursor
            end
            local num = 0;
            for i, v in pairs(Site.data) do
                local Possible = true
                ID = tostring(v.id)
                if tonumber(v.maxPlayers) > tonumber(v.playing) then
                    for _, Existing in pairs(AllIDs) do
                        if num ~= 0 then
                            if ID == tostring(Existing) then
                                Possible = false
                            end
                        else
                            if tonumber(actualHour) ~= tonumber(Existing) then
                                local delFile = pcall(function()
                                    AllIDs = {}
                                    table.insert(AllIDs, actualHour)
                                end)
                            end
                        end
                        num = num + 1
                    end
                    if Possible == true then
                        table.insert(AllIDs, ID)
                        wait()
                        pcall(function()
                            wait()
                            game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID,
                                game.Players.LocalPlayer)
                        end)
                        wait(4)
                    end
                end
            end
        end
        function Teleport()
            while wait() do
                pcall(function()
                    TPReturner()
                    if foundAnything ~= "" then
                        TPReturner()
                    end
                end)
            end
        end
        Teleport()
    end

    spawn(function()
        game:GetService("RunService").RenderStepped:Connect(function()
            if _G.AutoGhostShip or _G.AutoSantaEvents or _G.AutoSecondSea or _G.AutoXmas or _G.AutoSeaking or
                _G.AutoBigMomBlade or _G.AutoBigMomBoss or _G.AutoKaido or _G.AutoSaber or _G.AutoKillply or
                _G.Auto_Farm_Level or _G.AutoBisento or _G.Auto_Farm_LevelDungeon or _G.AutoKillply or _G.AutoEnma then
                if not game:GetService("Workspace"):FindFirstChild("TaiFoot") then
                    local Part = Instance.new("Part")
                    Part.Name = "TaiFoot"
                    Part.Parent = game.Workspace
                    Part.Anchored = true
                    Part.Transparency = 1
                    Part.Size = Vector3.new(30, 0.5, 30)
                elseif game:GetService("Workspace"):FindFirstChild("TaiFoot") then
                    game.Workspace["TaiFoot"].CFrame = CFrame.new(
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.X,
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Y - 3.92,
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Z)
                end
            else
                if game:GetService("Workspace"):FindFirstChild("TaiFoot") then
                    game:GetService("Workspace"):FindFirstChild("TaiFoot"):Destroy()
                end
            end
        end)
    end)

    spawn(function()
        while wait() do
            if _G.AutoGhostShip or _G.AutoSantaEvents or _G.AutoSecondSea or _G.AutoXmas or _G.AutoSeaking or
                _G.AutoBigMomBlade or _G.AutoBigMomBoss or _G.AutoKaido or _G.AutoSaber or _G.AutoKillply or
                _G.Auto_Farm_Level or _G.AutoBisento or _G.Auto_Farm_LevelDungeon or _G.AutoKillply or _G.AutoEnma then
                pcall(function()
                    game:GetService("Players").LocalPlayer.Character.Services.Client.KenEvent:InvokeServer(true)
                end)
            end
        end
    end)

    spawn(function()
        pcall(function()
            game:GetService("RunService").Stepped:Connect(function()
                if _G.AutoSantaEvents or _G.AutoSecondSea or _G.AutoXmas or _G.AutoSeaking or _G.AutoBigMomBlade or
                    _G.AutoBigMomBoss or _G.AutoKaido or _G.AutoSaber or _G.AutoKillply or _G.Auto_Farm_Level or
                    _G.AutoBisento or _G.Auto_Farm_LevelDungeon or _G.AutoKillply or _G.AutoEnma or _G.NoClip then
                    for _, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                        if v:IsA("BasePart") then
                            v.CanCollide = false
                        end
                    end
                end
            end)
        end)
    end)

    function UseSkill(skill)
        Tool = game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool")
        game:GetService("VirtualInputManager"):SendKeyEvent(true, skill, false, game)
        task.wait()
        game:GetService("VirtualInputManager"):SendKeyEvent(false, skill, false, game)
    end

    function TP(pos)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = pos
    end

    game:GetService("Players").LocalPlayer.Idled:connect(function()
        game:GetService("VirtualUser"):Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
        wait(1)
        game:GetService("VirtualUser"):Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
    end)

    function EquipWeapon(ToolSe)
        if game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe) then
            getgenv().tool = game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe)
            wait()
            game.Players.LocalPlayer.Character.Humanoid:EquipTool(tool)
        end
    end

    function Click()
        game:GetService 'VirtualUser':Button1Down(Vector2.new(0.9, 0.9))
        game:GetService 'VirtualUser':Button1Up(Vector2.new(0.9, 0.9))
    end

    function StopNoClip(Config)
        if Config == false then
            if game:GetService("Workspace"):FindFirstChild("TaiFoot") then
                game:GetService("Workspace"):FindFirstChild("TaiFoot"):Destroy()
            end
        end
    end

    function AutoHaki()
        pcall(function()
            if game.Players.LocalPlayer.Character.Haki.Value ~= 1 then
                game:GetService("Players").LocalPlayer.Character.Services.Client.Armament:FireServer()
                wait(1.5)
            end
        end)
    end
    --
    local RenUi = library:AddWindow("Ren Hub | KL", Enum.KeyCode.RightControl)
    --
    local Main = RenUi:AddTab("Auto Farm", "6026568198")
    local Stats = RenUi:AddTab("Stats", "7040410130")
    local Combat = RenUi:AddTab("Combat", "7251993295")
    local Teleport = RenUi:AddTab("Teleport", "7044226690")
    local Dungeon = RenUi:AddTab("Dungeon", "7044284832")
    local Misc = RenUi:AddTab("Misc", "6034900727")
    local Settings = RenUi:AddTab("Settings", "6034509993")
    --
    Main:AddSeperator("Settings")

    Time = Main:AddLabel("Server Time")

    function UpdateTime()
        local GameTime = math.floor(workspace.DistributedGameTime + 0.5)
        local Hour = math.floor(GameTime / (60 ^ 2)) % 24
        local Minute = math.floor(GameTime / (60 ^ 1)) % 60
        local Second = math.floor(GameTime / (60 ^ 0)) % 60
        Time:Set("Hr(s) : " .. Hour .. " Min(s) : " .. Minute .. " Sec(s) : " .. Second)
    end

    spawn(function()
        while task.wait() do
            pcall(function()
                UpdateTime()
                if game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("TopbarPlus") then
                    game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("TopbarPlus").Enabled = false
                end
            end)
        end
    end)

    Main:AddDropdown("Select Method", {"Behind", "Below", "Upper"}, function(value)
        _G.Method = value
    end)

    spawn(function()
        while wait() do
            pcall(function()
                if _G.Method == "Behind" then
                    MethodFarm = CFrame.new(0, 0, _G.DistanceMob)
                elseif _G.Method == "Below" then
                    MethodFarm = CFrame.new(0, -_G.DistanceMob, 0) * CFrame.Angles(math.rad(90), 0, 0)
                elseif _G.Method == "Upper" then
                    MethodFarm = CFrame.new(0, _G.DistanceMob, 0) * CFrame.Angles(math.rad(-90), 0, 0)
                else
                    MethodFarm = CFrame.new(0, 0, _G.DistanceMob)
                end
            end)
        end
    end)

    _G.DistanceMob = 2
    Main:AddSlider("Distance", 1, 100, 2, function(value)
        _G.DistanceMob = value
    end)

    Main:AddToggle("Auto Skill", _G.AutoSkill, function(value)
        _G.AutoSkill = value
    end)

    Wapon = {}
    for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
        if v:IsA("Tool") then
            table.insert(Wapon, v.Name)
        end
    end

    local SelectWeapon = Main:AddDropdown("Select Weapon", Wapon, function(value)
        _G.SelectWeapon = value
    end)

    Main:AddButton("Refresh Weapon", function()
        SelectWeapon:Clear()
        for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
            if v:IsA("Tool") then
                SelectWeapon:Add(v.Name)
            end
        end
        for i, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
            if v:IsA("Tool") then
                SelectWeapon:Add(v.Name)
            end
        end
    end)

    Main:AddSeperator("Main")

    Main:AddToggle("Auto Farm Level", _G.Auto_Farm_Level, function(value)
        _G.Auto_Farm_Level = value
        StopNoClip(_G.Auto_Farm_Level)
    end)

    local LocalPlayer = game:GetService("Players").LocalPlayer
    local VirtualUser = game:GetService('VirtualUser')
    spawn(function()
        while wait() do
            if _G.Auto_Farm_Level then
                pcall(function()
                    CheckQuest()
                    if game:GetService("Players").LocalPlayer.PlayerGui.Quest.QuestBoard.Visible == false then
                        if not game:GetService("Workspace").AntiTPNPC:FindFirstChild("QuestLvl" .. LevelQuest) then
                            TP(game:GetService("ReplicatedStorage").MAP["QuestLvl" .. LevelQuest].HumanoidRootPart
                                   .CFrame * CFrame.new(0, 0, -3))
                        else
                            TP(
                                game:GetService("Workspace").AntiTPNPC["QuestLvl" .. LevelQuest].HumanoidRootPart.CFrame *
                                    CFrame.new(0, 0, -3))
                        end
                        Click()
                        wait(.5)
                        for i, v in pairs(game.Players.LocalPlayer.PlayerGui:GetDescendants()) do
                            if v.Name == "Dialogue" then
                                v.Accept.Size = UDim2.new(0, 10000, 0, 10000)
                                v.Accept.Position = UDim2.new(-2, 0, -5, 0)
                                v.Accept.ImageTransparency = 1
                                game:GetService("ReplicatedStorage").Remotes.Functions.CheckQuest:InvokeServer()
                            end
                        end
                    elseif game:GetService("Players").LocalPlayer.PlayerGui.Quest.QuestBoard.Visible == true then
                        Mon = string.sub(game:GetService("Players").LocalPlayer.PlayerGui.Quest.QuestBoard.QuestCount
                                             .Text, 5, #game:GetService("Players").LocalPlayer.PlayerGui.Quest
                            .QuestBoard.QuestCount.Text)
                        if game:GetService("Workspace").Monster.Mon:FindFirstChild(Mon) then
                            for i, v in pairs(game:GetService("Workspace").Monster.Mon:GetChildren()) do
                                if v.Name == Mon then
                                    if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and
                                        v.Humanoid.Health > 0 then
                                        repeat
                                            task.wait()
                                            AutoHaki()
                                            EquipWeapon(_G.SelectWeapon)
                                            VirtualUser:CaptureController()
                                            VirtualUser:ClickButton1(Vector2.new(1280, 672))
                                            TP(v.HumanoidRootPart.CFrame * MethodFarm)
                                            if _G.AutoSkill then
                                                UseSkill("Z")
                                                UseSkill("X")
                                                UseSkill("C")
                                                UseSkill("V")
                                            end
                                        until not v.Parent or v.Humanoid.Health <= 0 or _G.Auto_Farm_Level == false or
                                            game:GetService("Players").LocalPlayer.PlayerGui.Quest.QuestBoard.Visible ==
                                            false
                                    else
                                        UseSkill("E")
                                        if Second_Sea and game.Players.LocalPlayer.PlayerStats.lvl.Value >= 3275 then
                                            TP(CFrame.new(30272.3203125, 65.4236068725586, 93207.0234375))
                                        else
                                            if not game:GetService("Workspace").AntiTPNPC:FindFirstChild("QuestLvl" ..
                                                                                                             LevelQuest) then
                                                TP(game:GetService("ReplicatedStorage").MAP["QuestLvl" .. LevelQuest]
                                                       .HumanoidRootPart.CFrame * CFrame.new(0, 500, 0))
                                            else
                                                TP(game:GetService("Workspace").AntiTPNPC["QuestLvl" .. LevelQuest]
                                                       .HumanoidRootPart.CFrame * CFrame.new(0, 500, 0))
                                            end
                                        end
                                    end
                                end
                            end
                        elseif game:GetService("Workspace").Monster.Boss:FindFirstChild(Mon) then
                            for i, v in pairs(game:GetService("Workspace").Monster.Boss:GetChildren()) do
                                if v.Name == Mon then
                                    if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and
                                        v.Humanoid.Health > 0 then
                                        repeat
                                            task.wait()
                                            AutoHaki()
                                            EquipWeapon(_G.SelectWeapon)
                                            VirtualUser:CaptureController()
                                            VirtualUser:ClickButton1(Vector2.new(1280, 672))
                                            TP(v.HumanoidRootPart.CFrame * MethodFarm)
                                            if _G.AutoSkill then
                                                UseSkill("Z")
                                                UseSkill("X")
                                                UseSkill("C")
                                                UseSkill("V")
                                            end
                                        until not v.Parent or v.Humanoid.Health <= 0 or _G.Auto_Farm_Level == false or
                                            game:GetService("Players").LocalPlayer.PlayerGui.Quest.QuestBoard.Visible ==
                                            false
                                    else
                                        UseSkill("E")
                                        if Second_Sea and game.Players.LocalPlayer.PlayerStats.lvl.Value >= 3275 then
                                            TP(CFrame.new(30272.3203125, 65.4236068725586, 93207.0234375))
                                        else
                                            if not game:GetService("Workspace").AntiTPNPC:FindFirstChild("QuestLvl" ..
                                                                                                             LevelQuest) then
                                                TP(game:GetService("ReplicatedStorage").MAP["QuestLvl" .. LevelQuest]
                                                       .HumanoidRootPart.CFrame * CFrame.new(0, 500, 0))
                                            else
                                                TP(game:GetService("Workspace").AntiTPNPC["QuestLvl" .. LevelQuest]
                                                       .HumanoidRootPart.CFrame * CFrame.new(0, 500, 0))
                                            end
                                        end
                                    end
                                end
                            end
                        else
                            UseSkill("E")
                            if Second_Sea and game.Players.LocalPlayer.PlayerStats.lvl.Value >= 3275 then
                                TP(CFrame.new(30272.3203125, 65.4236068725586, 93207.0234375))
                            else
                                if not game:GetService("Workspace").AntiTPNPC:FindFirstChild("QuestLvl" .. LevelQuest) then
                                    TP(game:GetService("ReplicatedStorage").MAP["QuestLvl" .. LevelQuest]
                                           .HumanoidRootPart.CFrame * CFrame.new(0, 500, 0))
                                else
                                    TP(game:GetService("Workspace").AntiTPNPC["QuestLvl" .. LevelQuest].HumanoidRootPart
                                           .CFrame * CFrame.new(0, 500, 0))
                                end
                            end
                        end
                    end
                end)
            end
        end
    end)

    Main:AddToggle("Auto Second Sea", _G.AutoSecondSea, function(value)
        _G.AutoSecondSea = value
    end)

    spawn(function()
        while wait() do
            pcall(function()
                if _G.AutoSecondSea and First_Sea then
                    if game.Players.LocalPlayer.PlayerStats.IsSecondSea == Yes then
                        TP(CFrame.new(1798.5653076171875, 16.172266006469727, -1475.4083251953125))
                        Click()
                        wait(.5)
                        for i, v in pairs(game.Players.LocalPlayer.PlayerGui:GetDescendants()) do
                            if v.Name == "Dialogue" then
                                v.Accept.Size = UDim2.new(0, 10000, 0, 10000)
                                v.Accept.Position = UDim2.new(-2, 0, -5, 0)
                                v.Accept.ImageTransparency = 1
                                game:GetService("ReplicatedStorage").Remotes.Functions.CheckQuest:InvokeServer()
                            end
                        end
                    else
                        if game.Players.LocalPlayer.PlayerStats.lvl.Value >= 1500 then
                            _G.Auto_Farm_Level = false
                            if game.Players.LocalPlayer.Character:FindFirstChild("Map") or
                                game.Players.LocalPlayer.Backpack:FindFirstChild("Map") then
                                TP(CFrame.new(6806.78662109375, 211.32806396484375, 1077.6700439453125))
                                Click()
                                wait(.5)
                                for i, v in pairs(game.Players.LocalPlayer.PlayerGui:GetDescendants()) do
                                    if v.Name == "Dialogue" then
                                        v.Accept.Size = UDim2.new(0, 10000, 0, 10000)
                                        v.Accept.Position = UDim2.new(-2, 0, -5, 0)
                                        v.Accept.ImageTransparency = 1
                                        game:GetService("ReplicatedStorage").Remotes.Functions.CheckQuest:InvokeServer()
                                    end
                                end
                            else
                                if game:GetService("Players").LocalPlayer.PlayerGui.Quest.QuestBoard.Visible == false then
                                    TP(CFrame.new(6806.78662109375, 211.32806396484375, 1077.6700439453125))
                                    Click()
                                    wait(.5)
                                    for i, v in pairs(game.Players.LocalPlayer.PlayerGui:GetDescendants()) do
                                        if v.Name == "Dialogue" then
                                            v.Accept.Size = UDim2.new(0, 10000, 0, 10000)
                                            v.Accept.Position = UDim2.new(-2, 0, -5, 0)
                                            v.Accept.ImageTransparency = 1
                                            game:GetService("ReplicatedStorage").Remotes.Functions.CheckQuest:InvokeServer()
                                        end
                                    end
                                else
                                    if game:GetService("Workspace").Monster.Boss:FindFirstChild(
                                        "Seasoned Fishman [Lv. 2200]") then
                                        for i, v in pairs(game:GetService("Workspace").Monster.Boss:GetChildren()) do
                                            if v.Name == "Seasoned Fishman [Lv. 2200]" and v.Humanoid.Health > 0 then
                                                repeat
                                                    task.wait()
                                                    AutoHaki()
                                                    EquipWeapon(_G.SelectWeapon)
                                                    TP(v.HumanoidRootPart.CFrame * MethodFarm)
                                                    if _G.AutoSkill then
                                                        UseSkill("Z")
                                                        UseSkill("X")
                                                        UseSkill("C")
                                                        UseSkill("V")
                                                    end
                                                    VirtualUser:CaptureController()
                                                    VirtualUser:ClickButton1(Vector2.new(1280, 672))
                                                until v.Humanoid.Health <= 0 or not _G.AutoSecondSea or
                                                    game.Players.LocalPlayer.Character:FindFirstChild("Map") or
                                                    game.Players.LocalPlayer.Backpack:FindFirstChild("Map")
                                            end
                                        end
                                    else
                                        if game:GetService("ReplicatedStorage").MOB:FindFirstChild(
                                            "Seasoned Fishman [Lv. 2200]") then
                                            TP(game:GetService("ReplicatedStorage").MOB:FindFirstChild(
                                                   "Seasoned Fishman [Lv. 2200]").HumanoidRootPart.CFrame * MethodFarm)
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end)
        end
    end)

    Main:AddSeperator("Sea King")

    Main:AddToggle("Auto Sea King", _G.AutoSeaking, function(value)
        _G.AutoSeaking = value
        StopNoClip(_G.AutoSeaking)
    end)

    Main:AddToggle("Auto Sea King Hop", _G.AutoSeaking_Hop, function(value)
        _G.AutoSeaking_Hop = value
    end)

    spawn(function()
        while wait() do
            if _G.AutoSeaking then
                pcall(function()
                    for i, v in pairs(game:GetService("Workspace").SeaMonster:GetChildren()) do
                        if game:GetService("Workspace").SeaMonster:FindFirstChild("SeaKing") and v.Humanoid.Health > 0 then
                            if v.Name == "SeaKing" then
                                repeat
                                    task.wait()
                                    AutoHaki()
                                    EquipWeapon(_G.SelectWeapon)
                                    TP(v.HumanoidRootPart.CFrame * CFrame.Angles(math.rad(90), 0, 0) -
                                           Vector3.new(0, 25, 0))
                                    if _G.AutoSkill then
                                        UseSkill("Z")
                                        UseSkill("X")
                                        UseSkill("C")
                                        UseSkill("V")
                                    end
                                    VirtualUser:CaptureController()
                                    VirtualUser:ClickButton1(Vector2.new(1280, 672))
                                until v.Humanoid.Health <= 0 or not _G.AutoSeaking or
                                    not game:GetService("Workspace").SeaMonster:FindFirstChild("SeaKing")
                            end
                        else
                            if game:GetService("Workspace").Island:FindFirstChild("Legacy Island1") then
                                TP(game:GetService("Workspace").Island:FindFirstChild("Legacy Island1").ChestSpawner
                                       .CFrame * CFrame.new(0, 0, 2))
                            elseif game:GetService("Workspace").Island:FindFirstChild("Legacy Island2") then
                                TP(game:GetService("Workspace").Island:FindFirstChild("Legacy Island2").ChestSpawner
                                       .CFrame * CFrame.new(0, 0, 2))
                            elseif game:GetService("Workspace").Island:FindFirstChild("Legacy Island3") then
                                TP(game:GetService("Workspace").Island:FindFirstChild("Legacy Island3").ChestSpawner
                                       .CFrame * CFrame.new(0, 0, 2))
                            elseif game:GetService("Workspace").Island:FindFirstChild("Legacy Island4") then
                                TP(game:GetService("Workspace").Island:FindFirstChild("Legacy Island4").ChestSpawner
                                       .CFrame * CFrame.new(0, 0, 2))
                            end
                        end
                    end
                end)
            end
        end
    end)

    spawn(function()
        while wait() do
            if _G.AutoSeaking and _G.AutoSeaking_Hop then
                pcall(function()
                    if not game:GetService("Workspace").SeaMonster:FindFirstChild("SeaKing") then
                        wait(3)
                        Hop()
                    end
                end)
            end
        end
    end)

    Main:AddSeperator("Saber")

    Main:AddToggle("Auto Saber", _G.AutoSaber, function(value)
        _G.AutoSaber = value
        StopNoClip(_G.AutoSaber)
    end)

    Main:AddToggle("Auto Saber Hop", _G.AutoSaber_Hop, function(value)
        _G.AutoSaber_Hop = value
    end)

    spawn(function()
        while wait() do
            if _G.AutoSaber then
                pcall(function()
                    if game:GetService("Workspace").Monster.Boss:FindFirstChild("Expert Swordman [Lv. 3000]") then
                        for i, v in pairs(game:GetService("Workspace").Monster.Boss:GetChildren()) do
                            if v.Name == "Expert Swordman [Lv. 3000]" and v.Humanoid.Health > 0 then
                                repeat
                                    task.wait()
                                    AutoHaki()
                                    EquipWeapon(_G.SelectWeapon)
                                    TP(v.HumanoidRootPart.CFrame * MethodFarm)
                                    if _G.AutoSkill then
                                        UseSkill("Z")
                                        UseSkill("X")
                                        UseSkill("C")
                                        UseSkill("V")
                                    end
                                    VirtualUser:CaptureController()
                                    VirtualUser:ClickButton1(Vector2.new(1280, 672))
                                until v.Humanoid.Health <= 0 or not _G.AutoSaber
                            end
                        end
                    else
                        if game:GetService("ReplicatedStorage").MOB:FindFirstChild("Expert Swordman [Lv. 3000]") then
                            TP(game:GetService("ReplicatedStorage").MOB:FindFirstChild("Expert Swordman [Lv. 3000]")
                                   .HumanoidRootPart.CFrame * MethodFarm)
                        else
                            if _G.AutoSaber_Hop then
                                Hop()
                            end
                        end
                    end
                end)
            end
        end
    end)

    --
    Main:AddSeperator("Ghost Ship")

    Main:AddToggle("Auto Ghost Ship", _G.AutoGhostShip, function(value)
        _G.AutoGhostShip = value
        StopNoClip(_G.AutoGhostShip)
    end)

    Main:AddToggle("Auto Ghost Ship Hop", _G.AutoGhostShip_Hop, function(value)
        _G.AutoGhostShip_Hop = value
    end)

    spawn(function()
        while wait() do
            if _G.AutoGhostShip then
                pcall(function()
                    if game:GetService("Workspace").GhostMonster:FindFirstChild("Ghost Ship") then
                        for i, v in pairs(game:GetService("Workspace"):FindFirstChild("GhostMonster"):GetChildren()) do
                            if v.Name == "Ghost Ship" and v.Humanoid.Health > 0 then
                                repeat
                                    task.wait()
                                    AutoHaki()
                                    EquipWeapon(_G.SelectWeapon)
                                    TP(v.HumanoidRootPart.CFrame * CFrame.new(0, 10, 0))
                                    if _G.AutoSkill then
                                        UseSkill("Z")
                                        UseSkill("X")
                                        UseSkill("C")
                                        UseSkill("V")
                                    end
                                    VirtualUser:CaptureController()
                                    VirtualUser:ClickButton1(Vector2.new(1280, 672))
                                until v.Humanoid.Health <= 0 or not _G.AutoGhostShip or
                                    not game:GetService("Workspace").GhostMonster:FindFirstChild("Ghost Ship")
                            end
                        end
                    else
                        if game:GetService("Workspace"):FindFirstChild("Chest1") then
                            TP(game:GetService("Workspace"):FindFirstChild("Chest1").HumanoidRootPart.CFrame)
                        elseif game:GetService("Workspace"):FindFirstChild("Chest2") then
                            TP(game:GetService("Workspace"):FindFirstChild("Chest2").HumanoidRootPart.CFrame)
                        elseif game:GetService("Workspace"):FindFirstChild("Chest3") then
                            TP(game:GetService("Workspace"):FindFirstChild("Chest3").HumanoidRootPart.CFrame)
                        else
                            if _G.AutoGhostShip_Hop then
                                Hop()
                            end
                        end
                    end
                end)
            end
        end
    end)

    Main:AddSeperator("Enma")

    Main:AddToggle("Auto Enma", _G.AutoEnma, function(value)
        _G.AutoEnma = value
        StopNoClip(_G.AutoEnma)
    end)

    Main:AddToggle("Auto Enma Hop", _G.AutoEnma_Hop, function(value)
        _G.AutoEnma_Hop = value
    end)

    spawn(function()
        while wait() do
            if _G.AutoEnma then
                pcall(function()
                    if game:GetService("Workspace").Monster.Boss:FindFirstChild("King Samurai [Lv. 3500]") then
                        for i, v in pairs(game:GetService("Workspace").Monster.Boss:GetChildren()) do
                            if v.Name == "King Samurai [Lv. 3500]" and v.Humanoid.Health > 0 then
                                repeat
                                    task.wait()
                                    AutoHaki()
                                    EquipWeapon(_G.SelectWeapon)
                                    TP(v.HumanoidRootPart.CFrame * MethodFarm)
                                    if _G.AutoSkill then
                                        UseSkill("Z")
                                        UseSkill("X")
                                        UseSkill("C")
                                        UseSkill("V")
                                    end
                                    VirtualUser:CaptureController()
                                    VirtualUser:ClickButton1(Vector2.new(1280, 672))
                                until v.Humanoid.Health <= 0 or not _G.AutoEnma
                            end
                        end
                    else
                        if game:GetService("ReplicatedStorage").MOB:FindFirstChild("King Samurai [Lv. 3500]") then
                            TP(game:GetService("ReplicatedStorage").MOB:FindFirstChild("King Samurai [Lv. 3500]")
                                   .HumanoidRootPart.CFrame * MethodFarm)
                        else
                            if _G.AutoEnma_Hop then
                                Hop()
                            end
                        end
                    end
                end)
            end
        end
    end)

    Main:AddSeperator("Big Mom Boss")

    Main:AddToggle("Auto Big Mom Boss", _G.AutoBigMomBoss, function(value)
        _G.AutoBigMomBoss = value
        StopNoClip(_G.AutoBigMomBoss)
    end)

    Main:AddToggle("Auto Big Mom Boss Hop", _G.AutoBigMomBoss_Hop, function(value)
        _G.AutoBigMomBoss_Hop = value
    end)

    spawn(function()
        while wait() do
            if _G.AutoBigMomBoss then
                pcall(function()
                    if game:GetService("Workspace").Monster.Boss:FindFirstChild("Ms. Mother [Lv.7500]") then
                        for i, v in pairs(game:GetService("Workspace").Monster.Boss:GetChildren()) do
                            if v.Name == "Ms. Mother [Lv.7500]" and v.Humanoid.Health > 0 then
                                repeat
                                    task.wait()
                                    AutoHaki()
                                    EquipWeapon(_G.SelectWeapon)
                                    TP(v.HumanoidRootPart.CFrame * MethodFarm)
                                    if _G.AutoSkill then
                                        UseSkill("Z")
                                        UseSkill("X")
                                        UseSkill("C")
                                        UseSkill("V")
                                    end
                                    VirtualUser:CaptureController()
                                    VirtualUser:ClickButton1(Vector2.new(1280, 672))
                                until v.Humanoid.Health <= 0 or not _G.AutoBigMomBoss
                            end
                        end
                    else
                        if game:GetService("ReplicatedStorage").MOB:FindFirstChild("Ms. Mother [Lv.7500]") then
                            TP(game:GetService("ReplicatedStorage").MOB:FindFirstChild("Ms. Mother [Lv.7500]")
                                   .HumanoidRootPart.CFrame * MethodFarm)
                        else
                            if _G.AutoBigMomBoss_Hop then
                                Hop()
                            end
                        end
                    end
                end)
            end
        end
    end)

    Main:AddSeperator("Others")

    Main:AddToggle("Auto Big Mom Blade", _G.AutoBigMomBlade, function(value)
        _G.AutoBigMomBlade = value
        StopNoClip(_G.AutoBigMomBlade)
    end)

    spawn(function()
        while wait() do
            if _G.AutoBigMomBlade then
                pcall(function()
                    if game.Players.LocalPlayer.Backpack:FindFirstChild("Gem") or
                        game.Players.LocalPlayer.Character:FindFirstChild("Gem") then
                        EquipWeapon("Gem")
                        TP(game:GetService("Workspace").Island["K - Zombie Island"].SummonAltar.Handle.CFrame)
                    elseif game:GetService("Workspace").Monster.Boss:FindFirstChild("Monster [Lv. 2500]") then
                        if game:GetService("Workspace").Monster.Boss:FindFirstChild("Monster [Lv. 2500]") then
                            for i, v in pairs(game:GetService("Workspace").Monster.Boss:GetChildren()) do
                                if v.Name == "Monster [Lv. 2500]" and v.Humanoid.Health > 0 then
                                    repeat
                                        task.wait()
                                        AutoHaki()
                                        EquipWeapon(_G.SelectWeapon)
                                        TP(v.HumanoidRootPart.CFrame * MethodFarm)
                                        if _G.AutoSkill then
                                            UseSkill("Z")
                                            UseSkill("X")
                                            UseSkill("C")
                                            UseSkill("V")
                                        end
                                        VirtualUser:CaptureController()
                                        VirtualUser:ClickButton1(Vector2.new(1280, 672))
                                    until _G.AutoBigMomBlade == false or v.Humanoid.Health <= 0
                                end
                            end
                        else
                            if game:GetService("ReplicatedStorage").MOB:FindFirstChild("Monster [Lv. 2500]") then
                                TP(game:GetService("ReplicatedStorage").MOB:FindFirstChild("Monster [Lv. 2500]")
                                       .HumanoidRootPart.CFrame * MethodFarm)
                            end
                        end
                    elseif game:GetService("Workspace").Monster.Boss:FindFirstChild("Shadow Master [Lv. 1600]") then
                        if game:GetService("Workspace").Monster.Boss:FindFirstChild("Shadow Master [Lv. 1600]") then
                            for i, v in pairs(game:GetService("Workspace").Monster.Boss:GetChildren()) do
                                if v.Name == "Shadow Master [Lv. 1600]" and v.Humanoid.Health > 0 then
                                    repeat
                                        task.wait()
                                        AutoHaki()
                                        EquipWeapon(_G.SelectWeapon)
                                        TP(v.HumanoidRootPart.CFrame * MethodFarm)
                                        if _G.AutoSkill then
                                            UseSkill("Z")
                                            UseSkill("X")
                                            UseSkill("C")
                                            UseSkill("V")
                                        end
                                        VirtualUser:CaptureController()
                                        VirtualUser:ClickButton1(Vector2.new(1280, 672))
                                    until _G.AutoBigMomBlade == false or v.Humanoid.Health <= 0 or
                                        game.Players.LocalPlayer.Backpack:FindFirstChild("Gem") or
                                        game.Players.LocalPlayer.Character:FindFirstChild("Gem")
                                end
                            end
                        else
                            if game:GetService("ReplicatedStorage").MOB:FindFirstChild("Shadow Master [Lv. 1600]") then
                                TP(game:GetService("ReplicatedStorage").MOB:FindFirstChild("Shadow Master [Lv. 1600]")
                                       .HumanoidRootPart.CFrame * MethodFarm)
                            end
                        end
                    else
                        TP(CFrame.new(1452.2967529297, 39.12340927124, 6998.6513671875))
                    end
                end)
            end
        end
    end)

    Main:AddToggle("Auto Bisento", _G.AutoBisento, function(value)
        _G.AutoBisento = value
        StopNoClip(_G.AutoBisento)
    end)

    spawn(function()
        while wait() do
            if _G.AutoBisento then
                pcall(function()
                    if game:GetService("Workspace").Monster.Boss:FindFirstChild("Quake Woman [Lv. 1925]") then
                        for i, v in pairs(game:GetService("Workspace").Monster.Boss:GetChildren()) do
                            if v.Name == "Quake Woman [Lv. 1925]" and v.Humanoid.Health > 0 then
                                repeat
                                    task.wait()
                                    AutoHaki()
                                    EquipWeapon(_G.SelectWeapon)
                                    TP(v.HumanoidRootPart.CFrame * MethodFarm)
                                    if _G.AutoSkill then
                                        UseSkill("Z")
                                        UseSkill("X")
                                        UseSkill("C")
                                        UseSkill("V")
                                    end
                                    VirtualUser:CaptureController()
                                    VirtualUser:ClickButton1(Vector2.new(1280, 672))
                                until v.Humanoid.Health <= 0 or not _G.AutoBisento
                            end
                        end
                    else
                        if game:GetService("ReplicatedStorage").MOB:FindFirstChild("Quake Woman [Lv. 1925]") then
                            TP(game:GetService("ReplicatedStorage").MOB:FindFirstChild("Quake Woman [Lv. 1925]")
                                   .HumanoidRootPart.CFrame * MethodFarm)
                        end
                    end
                end)
            end
        end
    end)

    Main:AddToggle("Auto Kaido", _G.AutoKaido, function(value)
        _G.AutoKaido = value
        StopNoClip(_G.AutoKaido)
    end)

    spawn(function()
        while wait() do
            if _G.AutoKaido then
                pcall(function()
                    if game.Players.LocalPlayer.Backpack:FindFirstChild("Gem") or
                        game.Players.LocalPlayer.Character:FindFirstChild("Gem") then
                        EquipWeapon("Gem")
                        TP(CFrame.new(1295.93237, 462.133698, 7368.77197, 0.945548892, -2.44059528e-08, 0.325480014,
                            3.26880851e-08, 1, -1.99773549e-08, -0.325480014, 2.95288842e-08, 0.945548892))
                    else
                        if game:GetService("Workspace").Monster.Boss:FindFirstChild("Dragon [Lv. 5000]") then
                            for i, v in pairs(game:GetService("Workspace").Monster.Boss:GetChildren()) do
                                if v.Name == "Dragon [Lv. 5000]" and v.Humanoid.Health > 0 then
                                    repeat
                                        task.wait()
                                        AutoHaki()
                                        EquipWeapon(_G.SelectWeapon)
                                        TP(v.HumanoidRootPart.CFrame * MethodFarm)
                                        if _G.AutoSkill then
                                            UseSkill("Z")
                                            UseSkill("X")
                                            UseSkill("C")
                                            UseSkill("V")
                                        end
                                        VirtualUser:CaptureController()
                                        VirtualUser:ClickButton1(Vector2.new(1280, 672))
                                    until _G.AutoKaido == false or v.Humanoid.Health <= 0
                                end
                            end
                        else
                            if game:GetService("ReplicatedStorage").MOB:FindFirstChild("Dragon [Lv. 5000]") then
                                TP(game:GetService("ReplicatedStorage").MOB:FindFirstChild("Dragon [Lv. 5000]")
                                       .HumanoidRootPart.CFrame * MethodFarm)
                            else
                                if game:GetService("Workspace").Monster.Boss:FindFirstChild("Elite Skeleton [Lv. 3100]") then
                                    for i, v in pairs(game:GetService("Workspace").Monster.Boss:GetChildren()) do
                                        if v.Name == "Elite Skeleton [Lv. 3100]" and v.Humanoid.Health > 0 then
                                            repeat
                                                task.wait()
                                                AutoHaki()
                                                EquipWeapon(_G.SelectWeapon)
                                                TP(v.HumanoidRootPart.CFrame * MethodFarm)
                                                if _G.AutoSkill then
                                                    UseSkill("Z")
                                                    UseSkill("X")
                                                    UseSkill("C")
                                                    UseSkill("V")
                                                end
                                                VirtualUser:CaptureController()
                                                VirtualUser:ClickButton1(Vector2.new(1280, 672))
                                            until _G.AutoKaido == false or v.Humanoid.Health <= 0
                                        end
                                    end
                                else
                                    if game:GetService("ReplicatedStorage").MOB:FindFirstChild(
                                        "Elite Skeleton [Lv. 3100]") then
                                        TP(game:GetService("ReplicatedStorage").MOB:FindFirstChild(
                                               "Elite Skeleton [Lv. 3100]").HumanoidRootPart.CFrame * MethodFarm)
                                    else
                                        TP(CFrame.new(1295.93237, 462.133698, 7368.77197, 0.945548892, -2.44059528e-08,
                                            0.325480014, 3.26880851e-08, 1, -1.99773549e-08, -0.325480014,
                                            2.95288842e-08, 0.945548892))
                                    end
                                end
                            end
                        end
                    end
                end)
            end
        end
    end)

    Stats:AddSeperator("Auto Stats")

    Stats:AddToggle("Auto Defense", _G.AutoDefense, function(value)
        _G.AutoDefense = value
    end)

    spawn(function()
        while wait() do
            if _G.AutoDefense then
                if game:GetService("Players")["LocalPlayer"].PlayerStats.Points.Value ~= 0 then
                    pcall(function()
                        game:GetService("Players").LocalPlayer.PlayerGui.Stats.Button.StatsFrame.RemoteEvent:FireServer(
                            "Defense", PointStats)
                    end)
                end
            end
        end
    end)

    Stats:AddToggle("Auto Melee", _G.AutoMelee, function(value)
        _G.AutoMelee = value
    end)

    spawn(function()
        while wait() do
            if _G.AutoMelee then
                if game:GetService("Players")["LocalPlayer"].PlayerStats.Points.Value ~= 0 then
                    pcall(function()
                        game:GetService("Players").LocalPlayer.PlayerGui.Stats.Button.StatsFrame.RemoteEvent:FireServer(
                            "Melee", PointStats)
                    end)
                end
            end
        end
    end)

    Stats:AddToggle("Auto Sword", _G.AutoSword, function(value)
        _G.AutoSword = value
    end)

    spawn(function()
        while wait() do
            if _G.AutoSword then
                if game:GetService("Players")["LocalPlayer"].PlayerStats.Points.Value ~= 0 then
                    pcall(function()
                        game:GetService("Players").LocalPlayer.PlayerGui.Stats.Button.StatsFrame.RemoteEvent:FireServer(
                            "Sword", PointStats)
                    end)
                end
            end
        end
    end)

    Stats:AddToggle("Auto Devil Fruit", _G.AutoDevilFruit, function(value)
        _G.AutoDevilFruit = value
    end)

    spawn(function()
        while wait() do
            if _G.AutoDevilFruit then
                if game:GetService("Players")["LocalPlayer"].PlayerStats.Points.Value ~= 0 then
                    pcall(function()
                        game:GetService("Players").LocalPlayer.PlayerGui.Stats.Button.StatsFrame.RemoteEvent:FireServer(
                            "Devil Fruit", PointStats)
                    end)
                end
            end
        end
    end)

    Stats:AddSeperator("Settings")

    local PointLabel = Stats:AddLabel("Point")

    spawn(function()
        while wait() do
            pcall(function()
                PointLabel:Set("Points : " .. game:GetService("Players")["LocalPlayer"].PlayerStats.Points.Value)
            end)
        end
    end)

    PointStats = 1
    Stats:AddSlider("Select Point", 1, 100, 1, function(value)
        PointStats = value
    end)

    Combat:AddSeperator("Players")

    local plyserv = Combat:AddLabel("Players")

    spawn(function()
        while wait() do
            pcall(function()
                for i, v in pairs(game:GetService("Players"):GetPlayers()) do
                    if i == 12 then
                        plyserv:Set("Players :" .. " " .. i .. " " .. "/" .. " " .. "12" .. " " .. "(Max)")
                    elseif i == 1 then
                        plyserv:Set("Player :" .. " " .. i .. " " .. "/" .. " " .. "12")
                    else
                        plyserv:Set("Players :" .. " " .. i .. " " .. "/" .. " " .. "12")
                    end
                end
            end)
        end
    end)

    PlayerName = {}
    for i, v in pairs(game.Players:GetChildren()) do
        if v.Name ~= game.Players.LocalPlayer.Name then
            table.insert(PlayerName, v.Name)
        end
    end

    local SelectedPly = Combat:AddDropdown("Select Players", PlayerName, function(value)
        _G.SelectPly = value
    end)

    Combat:AddButton("Refresh Player", function()
        PlayerName = {}
        SelectedPly:Clear()
        for i, v in pairs(game.Players:GetChildren()) do
            if v.Name ~= game.Players.LocalPlayer.Name then
                SelectedPly:Add(v.Name)
            end
        end
    end)

    Combat:AddToggle("Spectate Player", false, function(value)
        Spectate = value
        local plr1 = game.Players.LocalPlayer.Character.Humanoid
        local plr2 = game.Players:FindFirstChild(_G.SelectPly)
        repeat
            task.wait()
            game.Workspace.Camera.CameraSubject = plr2.Character.Humanoid
        until Spectate == false
        game.Workspace.Camera.CameraSubject = plr1
    end)

    Combat:AddButton("Teleport", function()
        TP(game.Players[_G.SelectPly].Character.HumanoidRootPart.CFrame)
    end)

    Combat:AddToggle("Auto Kill Player", false, function(value)
        _G.AutoKillply = value
        StopNoClip(_G.AutoKillply)
    end)
    spawn(function()
        while wait() do
            pcall(function()
                if _G.AutoKillply then
                    if game.Players:FindFirstChild(_G.SelectPly) and
                        game.Players:FindFirstChild(_G.SelectPly).Character.Humanoid.Health > 0 then
                        repeat
                            task.wait()
                            AutoHaki()
                            EquipWeapon(_G.SelectWeaponKill)
                            TP(game.Players:FindFirstChild(_G.SelectPly).Character.HumanoidRootPart.CFrame * MethodKill)
                            game:GetService 'VirtualUser':CaptureController()
                            game:GetService 'VirtualUser':Button1Down(Vector2.new(1280, 672))
                        until game.Players:FindFirstChild(_G.SelectPly).Character.Humanoid.Health <= 0 or
                            not _G.AutoKillply or not game.Players:FindFirstChild(_G.SelectPly)
                    end
                end
            end)
        end
    end)

    Combat:AddDropdown("Select Method", {"Behind", "Below", "Upper"}, function(value)
        _G.Method2 = value
    end)

    spawn(function()
        while wait() do
            pcall(function()
                if _G.Method2 == "Behind" then
                    MethodKill = CFrame.new(0, 0, Distanceply)
                elseif _G.Method2 == "Below" then
                    MethodKill = CFrame.new(0, -Distanceply, 0) * CFrame.Angles(math.rad(90), 0, 0)
                elseif _G.Method2 == "Upper" then
                    MethodKill = CFrame.new(0, Distanceply, 0) * CFrame.Angles(math.rad(-90), 0, 0)
                else
                    _G.Method2 = CFrame.new(0, 0, Distanceply)
                end
            end)
        end
    end)

    Distanceply = 1
    Combat:AddSlider("Distance", 1, 100, 1, function(value)
        Distanceply = value
    end)

    Weaponply = {}
    for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
        if v:IsA("Tool") then
            table.insert(Weaponply, v.Name)
        end
    end

    local SelectWeaponply = Combat:AddDropdown("Select Weapon", Weaponply, function(value)
        _G.SelectWeaponKill = value
    end)

    Combat:AddButton("Refresh Weapon", function()
        SelectWeaponply:Clear()
        Weaponply = {}
        for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
            if v:IsA("Tool") then
                SelectWeaponply:Add(v.Name)
            end
        end
        for i, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
            if v:IsA("Tool") then
                SelectWeaponply:Add(v.Name)
            end
        end
    end)

    Teleport:AddSeperator("MaP")

    if Second_Sea then
        Teleport:AddButton("Old Wolrd", function()
            TeleporttoOldWorld = true
        end)
        spawn(function()
            while wait() do
                if TeleporttoOldWorld then
                    pcall(function()
                        TP(CFrame.new(3947.696044921875, 16.74089813232422, 324.06292724609375))
                        Click()
                        wait(.5)
                        for i, v in pairs(game.Players.LocalPlayer.PlayerGui:GetDescendants()) do
                            if v.Name == "Dialogue" then
                                v.Accept.Size = UDim2.new(0, 10000, 0, 10000)
                                v.Accept.Position = UDim2.new(-2, 0, -5, 0)
                                v.Accept.ImageTransparency = 1
                                game:GetService("ReplicatedStorage").Remotes.Functions.CheckQuest:InvokeServer()
                            end
                        end
                    end)
                end
            end
        end)
    end

    if First_Sea then
        Teleport:AddButton("Second Sea", function()
            TeleporttoNewWorld = true
        end)
        spawn(function()
            while wait() do
                if TeleporttoNewWorld then
                    pcall(function()
                        TP(CFrame.new(1798.5653076171875, 16.172266006469727, -1475.4083251953125))
                        Click()
                        wait(.5)
                        for i, v in pairs(game.Players.LocalPlayer.PlayerGui:GetDescendants()) do
                            if v.Name == "Dialogue" then
                                v.Accept.Size = UDim2.new(0, 10000, 0, 10000)
                                v.Accept.Position = UDim2.new(-2, 0, -5, 0)
                                v.Accept.ImageTransparency = 1
                                game:GetService("ReplicatedStorage").Remotes.Functions.CheckQuest:InvokeServer()
                            end
                        end
                    end)
                end
            end
        end)
    end

    Teleport:AddSeperator("Island")

    if Second_Sea then
        Teleport:AddButton("Floresco", function()
            TP(CFrame.new(3709.0542, 56.4489174, 231.976654))
        end)
        Teleport:AddButton("Hibernus Land", function()
            TP(CFrame.new(2763.18311, 134.725479, -819.026123))
        end)
        Teleport:AddButton("Torrefacio", function()
            TP(CFrame.new(1779.29321, 56.12677, 1060.08374))
        end)
        Teleport:AddButton("Cercer", function()
            TP(CFrame.new(3017.57373, 29.2057247, 1378.00024))
        end)
        Teleport:AddButton("Skull lsland", function()
            TP(CFrame.new(1003.04968, 87.1491852, 6579.34277))
        end)
        Teleport:AddButton("Loaf lsland", function()
            TP(CFrame.new(6552.32617, 28.6099815, 7612.51514))
        end)
        Teleport:AddButton("Dead Thudra", function()
            TP(CFrame.new(8377.90527, 14.3858547, 969.619324))
        end)
        Teleport:AddButton("Santa Factory", function()
            TP(CFrame.new(10495.908203125, 61.35665512084961, 5763.68310546875))
        end)
    else
        Teleport:AddButton("Stone Rain Sea", function()
            TP(CFrame.new(6210.5903320312, 50.080966949463, -2050.3303222656))
        end)
        Teleport:AddButton("Town", function()
            TP(CFrame.new(2061.2985839844, 48.301433563232, -1572.8010253906))
        end)
        Teleport:AddButton("Pirate Island", function()
            TP(CFrame.new(3751.3720703125, 42.429008483887, -479.09103393555))
        end)
        Teleport:AddButton("Soldier Town", function()
            TP(CFrame.new(1734.4392089844, 68.61457824707, 233.17127990723))
        end)
        Teleport:AddButton("Shark Island", function()
            TP(CFrame.new(3507.51171875, 10.541933059692, 1499.6036376953))
        end)
        Teleport:AddButton("Chef Ship", function()
            TP(CFrame.new(32.638660430908, 149.17311096191, -37.506324768066))
        end)
        Teleport:AddButton("Snow Island", function()
            TP(CFrame.new(-1242.2866210938, 18.07179069519, 1587.9304199219))
        end)
        Teleport:AddButton("Desert Island", function()
            TP(CFrame.new(1536.3891601562, 12.834725379944, 2125.1857910156))
        end)
        Teleport:AddButton("Skyland", function()
            TP(CFrame.new(89.631294250488, 386.47360229492, 4216.4599609375))
        end)
        Teleport:AddButton("Bubbleland", function()
            TP(CFrame.new(5783.2954101562, 11.971294403076, 3483.4353027344))
        end)
        Teleport:AddButton("Stone Arena", function()
            TP(CFrame.new(9555.916015625, 37.722194671631, -3841.9360351562))
        end)
        Teleport:AddButton("War Island", function()
            TP(CFrame.new(6510.5747070312, 49.603099822998, 937.15655517578))
        end)
        Teleport:AddButton("Lobby Island", function()
            TP(CFrame.new(3032.4575195312, 13.059648513794, 5632.8969726562))
        end)
        Teleport:AddButton("Zombie Island", function()
            TP(CFrame.new(1641.8089599609, 26.438592910767, 6653.8837890625))
        end)
        Teleport:AddButton("Fishland", function()
            TP(CFrame.new(2412.5144042969, 40.273021697998, 9371.54296875))
        end)
    end

    Teleport:AddSeperator("SHOP")

    if First_Sea then
        Teleport:AddButton("Buso Shop", function()
            TP(CFrame.new(5841.32080078125, 12.240174293518066, 3603.513671875))
        end)
    elseif Second_Sea then
        Teleport:AddButton("Electro Shop", function()
            TP(CFrame.new(2462.47412109375, 173.04458618164062, -1099.1248779296875))
        end)
    end

    if First_Sea then
        Teleport:AddButton("Ken Shop", function()
            TP(CFrame.new(65.57159423828125, 386.49786376953125, 4064.0361328125))
        end)
    elseif Second_Sea then
        Teleport:AddButton("Dragon Claw Shop", function()
            TP(CFrame.new(2719.325927734375, 430.6570739746094, 721.2157592773438))
        end)
    end

    Teleport:AddButton("Black Leg Shop", function()
        if First_Sea then
            TP(CFrame.new(6457.87548828125, 168.47467041015625, -2376.072509765625))
        elseif Second_Sea then
            TP(CFrame.new(2367.072265625, 57.30705261230469, 135.1882781982422))
        end
    end)

    Teleport:AddButton("Cybrog Shop", function()
        if First_Sea then
            TP(CFrame.new(6457.87548828125, 168.47467041015625, -2376.072509765625))
        elseif Second_Sea then
            TP(CFrame.new(2325.837158203125, 57.26703643798828, 235.82777404785156))
        end
    end)

    Teleport:AddButton("Water Style Shop", function()
        if First_Sea then
            TP(CFrame.new(3944.12646484375, 123.67578125, 1489.2821044921875))
        elseif Second_Sea then
            TP(CFrame.new(2455.255859375, 57.30705261230469, 224.07823181152344))
        end
    end)

    if First_Sea then
        Teleport:AddButton("Sword Shop", function()
            TP(CFrame.new(2360.398681640625, 40.2966423034668, 9683.9658203125))
        end)
    elseif Second_Sea then
        Teleport:AddButton("ReStat Shop", function()
            TP(CFrame.new(2433.724609375, 57.30705261230469, 142.7527618408203))
        end)
    end

    Dungeon:AddSeperator("Dungeon")

    Dungeon:AddButton("Teleport to Dungeon", function()
        if First_Sea then
            TP(CFrame.new(6729.3916015625, 103.67321777344, 952.03881835938))
        elseif Second_Sea then
            TP(CFrame.new(2698.6772460938, 223.11566162109, 6.6630764007568))
        end
    end)

    if not Dungeon_Sea then
        Dungeon:AddLabel("In Dungeon Only!")
    end

    if Dungeon_Sea then
        Dungeon:AddToggle("Auto Farm Dungeon", _G.Auto_Farm_LevelDungeon, function(value)
            _G.Auto_Farm_LevelDungeon = value
        end)

        _G.SaveAt = 30
        Dungeon:AddSlider("Save At", 1, 100, 30, function(value)
            _G.SaveAt = value
        end)

        DistanceDungeon = 2
        Dungeon:AddSlider("Distance", 1, 100, 2, function(value)
            DistanceDungeon = value
        end)

        spawn(function()
            while wait() do
                if _G.Auto_Farm_LevelDungeon then
                    if not _G.NotEquip then
                        pcall(function()
                            for i, v in ipairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
                                if v:IsA("Tool") then
                                    game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
                                end
                            end
                        end)
                    end
                end
            end
        end)

        spawn(function()
            while wait() do
                pcall(function()
                    if _G.Auto_Farm_LevelDungeon then
                        if game.Players.LocalPlayer.Character.Humanoid.Health >
                            game.Players.LocalPlayer.Character.Humanoid.MaxHealth / 100 * _G.SaveAt then
                            AutoFarmMobDungeon = true
                            AutoSaveModeDungeon = false
                        else
                            AutoFarmMobDungeon = false
                            AutoSaveModeDungeon = true
                        end
                    end
                end)
            end
        end)

        spawn(function()
            while wait() do
                if _G.Auto_Farm_LevelDungeon and AutoFarmMobDungeon then
                    pcall(function()
                        if game.Players.LocalPlayer.Character.Humanoid.Health >
                            game.Players.LocalPlayer.Character.Humanoid.MaxHealth / 100 * _G.SaveAt then
                            for i, v in pairs(game:GetService("Workspace").MOB:GetChildren()) do
                                if v:FindFirstChild("HumanoidRootPart") then
                                    repeat
                                        task.wait()
                                        _G.NotEquip = false
                                        AutoHaki()
                                        TP(v.HumanoidRootPart.CFrame * CFrame.new(0, 0, DistanceDungeon))
                                        UseSkill("Z")
                                        UseSkill("X")
                                        UseSkill("C")
                                        UseSkill("V")
                                    until v.Humanoid.Health <= 0 or not _G.Auto_Farm_LevelDungeon or
                                        not AutoFarmMobDungeon or game.Players.LocalPlayer.Character.Humanoid.Health <=
                                        game.Players.LocalPlayer.Character.Humanoid.MaxHealth / 100 * _G.SaveAt
                                end
                            end
                        end
                    end)
                end
            end
        end)

        spawn(function()
            while wait() do
                if _G.Auto_Farm_LevelDungeon and AutoSaveModeDungeon then
                    pcall(function()
                        if game.Players.LocalPlayer.Character.Humanoid.Health <=
                            game.Players.LocalPlayer.Character.Humanoid.MaxHealth / 100 * _G.SaveAt then
                            repeat
                                task.wait()
                                _G.NotEquip = true
                                if game:GetService("Workspace").Island:FindFirstChild("Arena1") then
                                    TP(CFrame.new(-9.393295288085938, 201.8232879638672, 16.94792366027832))
                                else
                                    TP(CFrame.new(-19.639192581176758, 182.88330078125, 6.57674503326416))
                                end
                                for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                                    if v:IsA("Tool") then
                                        if v.ToolTip == "Combat" then
                                            EquipWeapon(v.Name)
                                        end
                                    end
                                end
                                for i, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                                    if v:IsA("Tool") then
                                        if v.ToolTip == "Combat" then
                                            EquipWeapon(v.Name)
                                        end
                                    end
                                end
                                game:GetService("VirtualInputManager"):SendKeyEvent(true, "E", false, game.Players
                                    .LocalPlayer.Character.HumanoidRootPart)
                            until game.Players.LocalPlayer.Character.Humanoid.Health ==
                                game.Players.LocalPlayer.Character.Humanoid.MaxHealth or not AutoSaveModeDungeon or
                                not _G.Auto_Farm_LevelDungeon
                            _G.NotEquip = false
                            game:GetService("VirtualInputManager"):SendKeyEvent(false, "E", false, game.Players
                                .LocalPlayer.Character.HumanoidRootPart)
                        end
                    end)
                end
            end
        end)
    end

    Misc:AddSeperator("Server")

    Misc:AddButton("Rejoin Server", function()
        game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService("Players").LocalPlayer)
    end)

    Misc:AddButton("Server Hop", function()
        Hop()
    end)

    Misc:AddButton("Hop To Lower Player", function()
        getgenv().AutoTeleport = true
        getgenv().DontTeleportTheSameNumber = true
        getgenv().CopytoClipboard = false
        if not game:IsLoaded() then
            print("Game is loading waiting...")
        end
        local maxplayers = math.huge
        local serversmaxplayer;
        local goodserver;
        local gamelink = "https://games.roblox.com/v1/games/" .. game.PlaceId ..
                             "/servers/Public?sortOrder=Asc&limit=100"
        function serversearch()
            for _, v in pairs(game:GetService("HttpService"):JSONDecode(game:HttpGetAsync(gamelink)).data) do
                if type(v) == "table" and v.playing ~= nil and maxplayers > v.playing then
                    serversmaxplayer = v.maxPlayers
                    maxplayers = v.playing
                    goodserver = v.id
                end
            end
        end
        function getservers()
            serversearch()
            for i, v in pairs(game:GetService("HttpService"):JSONDecode(game:HttpGetAsync(gamelink))) do
                if i == "nextPageCursor" then
                    if gamelink:find("&cursor=") then
                        local a = gamelink:find("&cursor=")
                        local b = gamelink:sub(a)
                        gamelink = gamelink:gsub(b, "")
                    end
                    gamelink = gamelink .. "&cursor=" .. v
                    getservers()
                end
            end
        end
        getservers()
        if AutoTeleport then
            if DontTeleportTheSameNumber then
                if #game:GetService("Players"):GetPlayers() - 4 == maxplayers then
                    return warn("It has same number of players (except you)")
                elseif goodserver == game.JobId then
                    return warn("Your current server is the most empty server atm")
                end
            end
            game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, goodserver)
        end
    end)

    Misc:AddSeperator("Devil Fruits")

    Misc:AddToggle("Auto Random Fruit Beli", _G.AutoRandomFruitBeli, function(value)
        _G.AutoRandomFruitBeli = value
    end)

    spawn(function()
        while wait() do
            if _G.AutoRandomFruitBeli then
                pcall(function()
                    if First_Sea then
                        TP(CFrame.new(2027.9697265625, 48.14053726196289, -1737.6326904296875))
                    elseif Second_Sea then
                        TP(CFrame.new(2362.600341796875, 57.83930969238281, 259.5265808105469))
                    end
                    wait(.5)
                    game:GetService("ReplicatedStorage").Remotes.Functions.CheckQuest:InvokeServer(workspace.AntiTPNPC
                                                                                                       .ARandomFruit)
                    if game:GetService("Players").LocalPlayer.PlayerGui.ARandomFruit.Dialogue.Beli.Visible == true then
                        Click()
                        wait(.1)
                        for i, v in pairs(game.Players.LocalPlayer.PlayerGui:GetDescendants()) do
                            if v.Name == "Dialogue" then
                                v.Beli.Size = UDim2.new(0, 10000, 0, 10000)
                                v.Beli.Position = UDim2.new(-2, 0, -5, 0)
                                v.Beli.ImageTransparency = 1
                            end
                        end
                    end
                end)
            end
        end
    end)

    Misc:AddToggle("Auto Random Fruit Gem", _G.AutoRandomFruitGem, function(value)
        _G.AutoRandomFruitGem = value
    end)

    spawn(function()
        while wait() do
            if _G.AutoRandomFruitGem then
                pcall(function()
                    if First_Sea then
                        TP(CFrame.new(2027.9697265625, 48.14053726196289, -1737.6326904296875))
                    elseif Second_Sea then
                        TP(CFrame.new(2362.600341796875, 57.83930969238281, 259.5265808105469))
                    end
                    wait(.5)
                    game:GetService("ReplicatedStorage").Remotes.Functions.CheckQuest:InvokeServer(workspace.AntiTPNPC
                                                                                                       .ARandomFruit)
                    if game:GetService("Players").LocalPlayer.PlayerGui.ARandomFruit.Dialogue.Gem.Visible == true then
                        Click()
                        wait(.1)
                        for i, v in pairs(game.Players.LocalPlayer.PlayerGui:GetDescendants()) do
                            if v.Name == "Dialogue" then
                                v.Gem.Size = UDim2.new(0, 10000, 0, 10000)
                                v.Gem.Position = UDim2.new(-2, 0, -5, 0)
                                v.Gem.ImageTransparency = 1
                            end
                        end
                    end
                end)
            end
        end
    end)

    Misc:AddToggle("Bring Fruit", _G.BringFruit, function(value)
        _G.BringFruit = value
    end)

    spawn(function()
        while wait() do
            if _G.BringFruit then
                pcall(function()
                    for i, v in pairs(game.Workspace:GetChildren()) do
                        if v:IsA("Tool") then
                            v.Handle.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                        end
                    end
                end)
            end
        end
    end)

    Misc:AddSeperator("Abilities")

    OldCanGeppo = game.Players.LocalPlayer.Backpack.GeppoNew.cds.Value
    Misc:AddToggle("Inf Geppo", false, function(value)
        if value == true then
            game.Players.LocalPlayer.Backpack.GeppoNew.cds.Value = 1000000000000000000
        elseif value == false then
            game.Players.LocalPlayer.Backpack.GeppoNew.cds.Value = OldCanGeppo
        end
    end)

    Misc:AddToggle("Fly", false, function(value)
        Fly = value
    end)

    spawn(function()
        while wait() do
            pcall(function()
                if Fly then
                    fly()
                end
            end)
        end
    end)

    Misc:AddToggle("No Clip", false, function(value)
        _G.NoClip = value
    end)

    Misc:AddSeperator("ESP")

    Misc:AddToggle("Player ESP", ESPPlayer, function(value)
        ESPPlayer = value
        while ESPPlayer do
            wait()
            UpdateEspPlayer()
        end
    end)

    Misc:AddToggle("Devil Fruit ESP", DevilFruitESP, function(value)
        DevilFruitESP = value
        while DevilFruitESP do
            wait()
            UpdateBfEsp()
        end
    end)

    Settings:AddSeperator("Ui")

    Settings:AddButton("Destroy Ui", function()
        if game.CoreGui:FindFirstChild("UlLib") then
            game.CoreGui:FindFirstChild("UlLib"):Destroy()
        end
    end)

    Settings:AddTextbox("Level", "", true, function(value)
        _G.LockAt = value
    end)

    Settings:AddToggle("Lock Level", _G.LockLevel, function(value)
        _G.LockLevel = value
    end)

    spawn(function()
        while wait() do
            if _G.LockLevel then
                pcall(function()
                    if game.Players.LocalPlayer.PlayerStats.lvl.Value >= tonumber(_G.LockAt) then
                        game.Players.LocalPlayer:Kick("\nSuccessfully Farm!")
                    end
                end)
            end
        end
    end)
elseif game.PlaceId == 6329844902 then
    _G.Color = Color3.fromRGB(255, 0, 0)
    if not game:IsLoaded() then
        repeat
            game.Loaded:Wait()
        until game:IsLoaded()
    end

    repeat
        wait()
    until game:GetService("Players")

    if not game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        repeat
            wait()
        until game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    end

    wait(1)

    do
        local ui = game.CoreGui:FindFirstChild("UlLib")
        if ui then
            ui:Destroy()
        end
    end

    local UserInputService = game:GetService("UserInputService")
    local TweenService = game:GetService("TweenService")

    local function MakeDraggable(topbarobject, object)
        local Dragging = nil
        local DragInput = nil
        local DragStart = nil
        local StartPosition = nil

        local function Update(input)
            local Delta = input.Position - DragStart
            local pos = UDim2.new(StartPosition.X.Scale, StartPosition.X.Offset + Delta.X, StartPosition.Y.Scale,
                StartPosition.Y.Offset + Delta.Y)
            local Tween = TweenService:Create(object, TweenInfo.new(0.2), {
                Position = pos
            })
            Tween:Play()
        end

        topbarobject.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                Dragging = true
                DragStart = input.Position
                StartPosition = object.Position

                input.Changed:Connect(function()
                    if input.UserInputState == Enum.UserInputState.End then
                        Dragging = false
                    end
                end)
            end
        end)

        topbarobject.InputChanged:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType ==
                Enum.UserInputType.Touch then
                DragInput = input
            end
        end)

        UserInputService.InputChanged:Connect(function(input)
            if input == DragInput and Dragging then
                Update(input)
            end
        end)
    end

    local library = {}

    function library:AddWindow(text, keybind)
        local bind = keybind or Enum.KeyCode.RightControl
        local ff = false
        local currenttab = ""

        local DoctorShiba = Instance.new("ScreenGui")
        DoctorShiba.Name = "UlLib"
        DoctorShiba.Parent = game.CoreGui
        DoctorShiba.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

        local Main = Instance.new("Frame")
        Main.Name = "Main"
        Main.Parent = DoctorShiba
        Main.AnchorPoint = Vector2.new(0.5, 0.5)
        Main.BackgroundColor3 = Color3.fromRGB(30, 28, 39)
        Main.BackgroundTransparency = 0.100
        Main.BorderSizePixel = 0
        Main.ClipsDescendants = true
        Main.Position = UDim2.new(0.499526083, 0, 0.499241292, 0)
        Main.Size = UDim2.new(0, 600, 0, 350)

        local Top = Instance.new("Frame")
        Top.Name = "Top"
        Top.Parent = Main
        Top.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Top.BackgroundTransparency = 1.000
        Top.BorderSizePixel = 0
        Top.Size = UDim2.new(0, 600, 0, 20)

        local Page = Instance.new("Frame")
        Page.Name = "Page"
        Page.Parent = Main
        Page.BackgroundColor3 = Color3.fromRGB(25, 23, 35)
        Page.BackgroundTransparency = 0.100
        Page.BorderSizePixel = 0
        Page.Size = UDim2.new(0, 125, 0, 350)

        local NameHub = Instance.new("TextLabel")
        NameHub.Name = "NameHub"
        NameHub.Parent = Page
        NameHub.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        NameHub.BackgroundTransparency = 1.000
        NameHub.Position = UDim2.new(0.113333493, 0, 0, 0)
        NameHub.Size = UDim2.new(0, 110, 0, 20)
        NameHub.Font = Enum.Font.GothamSemibold
        NameHub.Text = text
        NameHub.TextColor3 = Color3.fromRGB(225, 0, 0)
        NameHub.TextSize = 11.000
        NameHub.TextXAlignment = Enum.TextXAlignment.Left

        local User = Instance.new("Frame")
        User.Name = "User"
        User.Parent = Page
        User.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        User.BackgroundTransparency = 1.000
        User.Position = UDim2.new(0, 0, 0.8, 30)
        User.Size = UDim2.new(0, 125, 0, 40)

        local UserText = Instance.new("TextLabel")
        UserText.Name = "UserText"
        UserText.Parent = User
        UserText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        UserText.BackgroundTransparency = 1.000
        UserText.Position = UDim2.new(0.354999989, 0, 0, 11)
        UserText.Size = UDim2.new(0, 80, 0, 20)
        UserText.Font = Enum.Font.Gotham
        UserText.Text = tostring(game.Players.LocalPlayer.Name)
        spawn(function()
            while wait() do
                pcall(function()
                    wait(0.1)
                    game:GetService('TweenService'):Create(UserText, TweenInfo.new(1, Enum.EasingStyle.Linear,
                        Enum.EasingDirection.InOut), {
                        TextColor3 = Color3.fromRGB(255, 0, 0)
                    }):Play()
                    wait(.5)
                    game:GetService('TweenService'):Create(UserText, TweenInfo.new(1, Enum.EasingStyle.Linear,
                        Enum.EasingDirection.InOut), {
                        TextColor3 = Color3.fromRGB(255, 155, 0)
                    }):Play()
                    wait(.5)
                    game:GetService('TweenService'):Create(UserText, TweenInfo.new(1, Enum.EasingStyle.Linear,
                        Enum.EasingDirection.InOut), {
                        TextColor3 = Color3.fromRGB(255, 255, 0)
                    }):Play()
                    wait(.5)
                    game:GetService('TweenService'):Create(UserText, TweenInfo.new(1, Enum.EasingStyle.Linear,
                        Enum.EasingDirection.InOut), {
                        TextColor3 = Color3.fromRGB(0, 255, 0)
                    }):Play()
                    wait(.5)
                    game:GetService('TweenService'):Create(UserText, TweenInfo.new(1, Enum.EasingStyle.Linear,
                        Enum.EasingDirection.InOut), {
                        TextColor3 = Color3.fromRGB(0, 255, 255)
                    }):Play()
                    wait(.5)
                    game:GetService('TweenService'):Create(UserText, TweenInfo.new(1, Enum.EasingStyle.Linear,
                        Enum.EasingDirection.InOut), {
                        TextColor3 = Color3.fromRGB(0, 155, 255)
                    }):Play()
                    wait(.5)
                    game:GetService('TweenService'):Create(UserText, TweenInfo.new(1, Enum.EasingStyle.Linear,
                        Enum.EasingDirection.InOut), {
                        TextColor3 = Color3.fromRGB(255, 0, 255)
                    }):Play()
                    wait(.5)
                    game:GetService('TweenService'):Create(UserText, TweenInfo.new(1, Enum.EasingStyle.Linear,
                        Enum.EasingDirection.InOut), {
                        TextColor3 = Color3.fromRGB(255, 0, 155)
                    }):Play()
                    wait(.5)
                end)
            end
        end)
        UserText.TextScaled = true
        UserText.TextSize = 11.000
        UserText.TextWrapped = true
        UserText.TextXAlignment = Enum.TextXAlignment.Left

        local UITextSizeConstraint = Instance.new("UITextSizeConstraint")
        UITextSizeConstraint.Parent = UserText
        UITextSizeConstraint.MaxTextSize = 11

        local UserImage = Instance.new("ImageLabel")
        UserImage.Name = "UserImage"
        UserImage.Parent = User
        UserImage.BackgroundColor3 = Color3.fromRGB(225, 225, 225)
        UserImage.Position = UDim2.new(0, 10, 0, 9)
        UserImage.Size = UDim2.new(0, 25, 0, 25)
        UserImage.Image =
            "https://www.roblox.com/headshot-thumbnail/image?userId=" .. game.Players.LocalPlayer.UserId ..
                "&width=420&height=420&format=png"

        local UserImageCorner = Instance.new("UICorner")
        UserImageCorner.CornerRadius = UDim.new(0, 100)
        UserImageCorner.Name = "UserImageCorner"
        UserImageCorner.Parent = UserImage

        local ScrollPage = Instance.new("ScrollingFrame")
        ScrollPage.Name = "ScrollPage"
        ScrollPage.Parent = Page
        ScrollPage.Active = true
        ScrollPage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        ScrollPage.BackgroundTransparency = 1.000
        ScrollPage.BorderSizePixel = 0
        ScrollPage.Position = UDim2.new(0, 0, 0.086, 0)
        ScrollPage.Size = UDim2.new(0, 125, 0, 290)
        ScrollPage.CanvasSize = UDim2.new(0, 0, 0, 0)
        ScrollPage.ScrollBarThickness = 0
        local PageList = Instance.new("UIListLayout")
        PageList.Name = "PageList"
        PageList.Parent = ScrollPage
        PageList.SortOrder = Enum.SortOrder.LayoutOrder
        PageList.Padding = UDim.new(0, 7)

        local PagePadding = Instance.new("UIPadding")
        PagePadding.Name = "PagePadding"
        PagePadding.Parent = ScrollPage
        PagePadding.PaddingTop = UDim.new(0, 5)
        PagePadding.PaddingLeft = UDim.new(0, 28)

        local TabFolder = Instance.new("Folder")
        TabFolder.Name = "TabFolder"
        TabFolder.Parent = Main

        MakeDraggable(Top, Main)

        local uihide = false

        UserInputService.InputBegan:Connect(function(input)
            if input.KeyCode == bind then
                if uihide == false then
                    uihide = true
                    Main:TweenSize(UDim2.new(0, 0, 0, 0), "In", "Quad", 0.2, true)
                else
                    uihide = false
                    Main:TweenSize(UDim2.new(0, 600, 0, 350), "Out", "Quad", 0.2, true)
                end
            end
        end)

        local uitab = {}

        function uitab:AddTab(text, image)
            local Image = image or 6023426915

            local PageButton = Instance.new("TextButton")
            PageButton.Name = "PageButton"
            PageButton.Parent = ScrollPage
            PageButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            PageButton.BackgroundTransparency = 1.000
            PageButton.BorderSizePixel = 0
            PageButton.Position = UDim2.new(0.224000007, 0, 0.029787235, 0)
            PageButton.Size = UDim2.new(0, 97, 0, 20)
            PageButton.AutoButtonColor = false
            PageButton.Font = Enum.Font.GothamSemibold
            PageButton.Text = text
            PageButton.TextColor3 = Color3.fromRGB(225, 225, 225)
            PageButton.TextSize = 11.000
            PageButton.TextXAlignment = Enum.TextXAlignment.Left

            local PageImage = Instance.new("ImageLabel")
            PageImage.Name = "PageImage"
            PageImage.Parent = PageButton
            PageImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            PageImage.BackgroundTransparency = 1.000
            PageImage.Position = UDim2.new(0, -20, 0, 3)
            PageImage.Size = UDim2.new(0, 15, 0, 15)
            PageImage.Image = "rbxassetid://" .. tostring(Image)

            local MainTab = Instance.new("Frame")
            MainTab.Name = "MainTab"
            MainTab.Parent = TabFolder
            MainTab.BackgroundColor3 = Color3.fromRGB(30, 28, 39)
            MainTab.BorderSizePixel = 0
            MainTab.Position = UDim2.new(0.208333328, 0, 0, 0)
            MainTab.Size = UDim2.new(0, 475, 0, 350)
            MainTab.Visible = false

            local ScrollTab = Instance.new("ScrollingFrame")
            ScrollTab.Name = "ScrollTab"
            ScrollTab.Parent = MainTab
            ScrollTab.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ScrollTab.BackgroundTransparency = 1.000
            ScrollTab.BorderSizePixel = 0
            ScrollTab.Position = UDim2.new(0, 0, 0.057, 0)
            ScrollTab.Size = UDim2.new(0, 475, 0, 330)
            ScrollTab.CanvasSize = UDim2.new(0, 0, 0, 0)
            ScrollTab.ScrollBarThickness = 3

            local TabList = Instance.new("UIListLayout")
            TabList.Name = "TabList"
            TabList.Parent = ScrollTab
            TabList.SortOrder = Enum.SortOrder.LayoutOrder
            TabList.Padding = UDim.new(0, 5)

            local TabPadding = Instance.new("UIPadding")
            TabPadding.Name = "TabPadding"
            TabPadding.Parent = ScrollTab
            TabPadding.PaddingLeft = UDim.new(0, 10)
            TabPadding.PaddingTop = UDim.new(0, 10)

            PageButton.MouseButton1Click:Connect(function()
                currenttab = MainTab.Name
                for i, v in next, TabFolder:GetChildren() do
                    if v.Name == "MainTab" then
                        v.Visible = false
                    end
                end
                MainTab.Visible = true

                for i, v in next, ScrollPage:GetChildren() do
                    if v:IsA("TextButton") then
                        TweenService:Create(v, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                            TextColor3 = Color3.fromRGB(225, 225, 225)
                        }):Play()
                    end
                    TweenService:Create(PageButton, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {
                            TextColor3 = Color3.fromRGB(255, 0, 0)
                        }):Play()
                end
            end)

            if ff == false then
                TweenService:Create(PageButton, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                    TextColor3 = Color3.fromRGB(255, 0, 0)
                }):Play()
                for i, v in next, TabFolder:GetChildren() do
                    if v.Name == "MainTab" then
                        v.Visible = false
                    end
                    MainTab.Visible = true
                end
                ff = true
            end

            game:GetService("RunService").Stepped:Connect(function()
                pcall(function()
                    ScrollPage.CanvasSize = UDim2.new(0, 0, 0, PageList.AbsoluteContentSize.Y + 10)
                    ScrollTab.CanvasSize = UDim2.new(0, 0, 0, TabList.AbsoluteContentSize.Y + 30)
                end)
            end)

            local main = {}

            function main:AddButton(text, callback)
                local Button = Instance.new("TextButton")

                Button.Name = "Button"
                Button.Parent = ScrollTab
                Button.BackgroundColor3 = Color3.fromRGB(50, 48, 59)
                Button.BackgroundTransparency = 0.1
                Button.BorderSizePixel = 0
                Button.Size = UDim2.new(0, 455, 0, 30)
                Button.AutoButtonColor = false
                Button.Font = Enum.Font.Gotham
                Button.Text = text
                Button.TextColor3 = Color3.fromRGB(225, 225, 225)
                Button.TextSize = 11.000
                Button.TextWrapped = true

                local ButtonCorner = Instance.new("UICorner")
                ButtonCorner.Name = "ButtonCorner"
                ButtonCorner.CornerRadius = UDim.new(0, 5)
                ButtonCorner.Parent = Button

                Button.MouseEnter:Connect(function()
                    TweenService:Create(Button, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                        TextColor3 = Color3.fromRGB(255, 0, 0)
                    }):Play()
                end)

                Button.MouseLeave:Connect(function()
                    TweenService:Create(Button, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                        TextColor3 = Color3.fromRGB(225, 225, 225)
                    }):Play()
                end)

                Button.MouseButton1Click:Connect(function()
                    callback()
                    Button.TextSize = 0
                    TweenService:Create(Button, TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
                        TextSize = 11
                    }):Play()
                end)
            end

            function main:AddToggle(text, config, callback)
                local ToggleImage = Instance.new("Frame")

                local Toggle = Instance.new("TextButton")
                Toggle.Name = "Toggle"
                Toggle.Parent = ScrollTab
                Toggle.BackgroundColor3 = Color3.fromRGB(50, 48, 59)
                Toggle.BackgroundTransparency = 0.1
                Toggle.BorderSizePixel = 0
                Toggle.AutoButtonColor = false
                Toggle.Size = UDim2.new(0, 455, 0, 30)
                Toggle.Font = Enum.Font.SourceSans
                Toggle.Text = ""
                Toggle.TextColor3 = Color3.fromRGB(0, 0, 0)
                Toggle.TextSize = 14.000

                local ToggleCorner = Instance.new("UICorner")
                ToggleCorner.Name = "ToggleCorner"
                ToggleCorner.CornerRadius = UDim.new(0, 5)
                ToggleCorner.Parent = Toggle

                local ToggleLabel = Instance.new("TextLabel")
                ToggleLabel.Name = "ToggleLabel"
                ToggleLabel.Parent = Toggle
                ToggleLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                ToggleLabel.BackgroundTransparency = 1.000
                ToggleLabel.Position = UDim2.new(0, 13, 0, 0)
                ToggleLabel.Size = UDim2.new(0, 410, 0, 30)
                ToggleLabel.Font = Enum.Font.Gotham
                ToggleLabel.Text = text
                ToggleLabel.TextColor3 = Color3.fromRGB(225, 225, 225)
                ToggleLabel.TextSize = 11.000
                ToggleLabel.TextXAlignment = Enum.TextXAlignment.Left

                ToggleImage.Name = "ToggleImage"
                ToggleImage.Parent = Toggle
                ToggleImage.BackgroundColor3 = Color3.fromRGB(70, 68, 79)
                ToggleImage.Position = UDim2.new(0, 425, 0, 5)
                ToggleImage.BorderSizePixel = 0
                ToggleImage.Size = UDim2.new(0, 20, 0, 20)
                local ToggleImageCorner = Instance.new("UICorner")
                ToggleImageCorner.Name = "ToggleImageCorner"
                ToggleImageCorner.CornerRadius = UDim.new(0, 5)
                ToggleImageCorner.Parent = ToggleImage

                local ToggleImage2 = Instance.new("Frame")
                ToggleImage2.Name = "ToggleImage2"
                ToggleImage2.Parent = ToggleImage
                ToggleImage2.AnchorPoint = Vector2.new(0.5, 0.5)
                ToggleImage2.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
                ToggleImage2.Position = UDim2.new(0, 10, 0, 10)
                ToggleImage2.Visible = false

                local ToggleImage2Corner = Instance.new("UICorner")
                ToggleImage2Corner.Name = "ToggleImageCorner"
                ToggleImage2Corner.CornerRadius = UDim.new(0, 5)
                ToggleImage2Corner.Parent = ToggleImage2

                Toggle.MouseEnter:Connect(function()
                    TweenService:Create(ToggleLabel,
                        TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                            TextColor3 = Color3.fromRGB(255, 0, 0)
                        }):Play()
                end)

                Toggle.MouseLeave:Connect(function()
                    TweenService:Create(ToggleLabel,
                        TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                            TextColor3 = Color3.fromRGB(225, 225, 225)
                        }):Play()
                end)
                if config == nil then
                    config = false
                end
                local toggled = config or false
                Toggle.MouseButton1Click:Connect(function()
                    if toggled == false then
                        toggled = true
                        ToggleImage2.Visible = true
                        ToggleImage2:TweenSize(UDim2.new(0, 21, 0, 21), "In", "Quad", 0.1, true)
                    else
                        toggled = false
                        ToggleImage2:TweenSize(UDim2.new(0, 0, 0, 0), "In", "Quad", 0.1, true)
                        wait(0.1)
                        ToggleImage2.Visible = false
                    end
                    callback(toggled)
                end)

                if config == true then
                    ToggleImage2.Visible = true
                    ToggleImage2:TweenSize(UDim2.new(0, 21, 0, 21), "In", "Quad", 0.1, true)
                    toggled = true
                    callback(toggled)
                end
            end

            function main:AddTextbox(text, holder, disappear, callback)
                local Textboxx = Instance.new("Frame")
                local TextboxxCorner = Instance.new("UICorner")
                local TextboxTitle = Instance.new("TextLabel")
                local Textbox = Instance.new("TextBox")
                local TextboxCorner = Instance.new("UICorner")

                Textboxx.Name = "Textboxx"
                Textboxx.Parent = ScrollTab
                Textboxx.BackgroundColor3 = Color3.fromRGB(50, 48, 59)
                Textboxx.Size = UDim2.new(0, 455, 0, 30)

                TextboxxCorner.CornerRadius = UDim.new(0, 5)
                TextboxxCorner.Name = "TextboxxCorner"
                TextboxxCorner.Parent = Textboxx

                TextboxTitle.Name = "TextboxTitle"
                TextboxTitle.Parent = Textboxx
                TextboxTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                TextboxTitle.BackgroundTransparency = 1.000
                TextboxTitle.Position = UDim2.new(0, 15, 0, 0)
                TextboxTitle.Size = UDim2.new(0, 300, 0, 30)
                TextboxTitle.Font = Enum.Font.Gotham
                TextboxTitle.Text = text
                TextboxTitle.TextColor3 = Color3.fromRGB(225, 225, 225)
                TextboxTitle.TextSize = 11.000
                TextboxTitle.TextXAlignment = Enum.TextXAlignment.Left

                Textbox.Name = "Textbox"
                Textbox.Parent = Textboxx
                Textbox.BackgroundColor3 = Color3.fromRGB(30, 28, 39)
                Textbox.Position = UDim2.new(0, 310, 0, 5)
                Textbox.Size = UDim2.new(0, 140, 0, 20)
                Textbox.Font = Enum.Font.Gotham
                Textbox.Text = holder
                Textbox.TextColor3 = Color3.fromRGB(225, 225, 225)
                Textbox.TextSize = 11.000

                Textbox.FocusLost:Connect(function()
                    if #Textbox.Text > 0 then
                        callback(Textbox.Text)
                    end
                    if disappear then
                        Textbox.Text = ""
                    else
                        Textbox.Text = holder
                    end
                end)

                TextboxCorner.Name = "TextboxCorner"
                TextboxCorner.CornerRadius = UDim.new(0, 5)
                TextboxCorner.Parent = Textbox
            end

            function main:AddDropdown(text, table, callback)
                local Dropdown = Instance.new("Frame")
                local UICorner = Instance.new("UICorner")
                local DropButton = Instance.new("TextButton")
                local Droptitle = Instance.new("TextLabel")
                local DropScroll = Instance.new("ScrollingFrame")
                local DropdownList = Instance.new("UIListLayout")
                local DropdownPadding = Instance.new("UIPadding")
                local DropImage = Instance.new("ImageLabel")

                Dropdown.Name = "Dropdown"
                Dropdown.Parent = ScrollTab
                Dropdown.Active = true
                Dropdown.BackgroundColor3 = Color3.fromRGB(50, 48, 59)
                Dropdown.ClipsDescendants = true
                Dropdown.Size = UDim2.new(0, 455, 0, 30)

                UICorner.CornerRadius = UDim.new(0, 5)
                UICorner.Parent = Dropdown

                DropButton.Name = "DropButton"
                DropButton.Parent = Dropdown
                DropButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                DropButton.BackgroundTransparency = 1.000
                DropButton.Size = UDim2.new(0, 455, 0, 30)
                DropButton.Font = Enum.Font.SourceSans
                DropButton.Text = ""
                DropButton.TextColor3 = Color3.fromRGB(0, 0, 0)
                DropButton.TextSize = 14.000

                Droptitle.Name = "Droptitle"
                Droptitle.Parent = Dropdown
                Droptitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Droptitle.BackgroundTransparency = 1.000
                Droptitle.Position = UDim2.new(0.0281690136, 0, 0, 0)
                Droptitle.Size = UDim2.new(0, 410, 0, 30)
                Droptitle.Font = Enum.Font.Gotham
                Droptitle.Text = text .. " : "
                Droptitle.TextColor3 = Color3.fromRGB(225, 225, 225)
                Droptitle.TextSize = 11.000
                Droptitle.TextXAlignment = Enum.TextXAlignment.Left

                DropImage.Name = "DropImage"
                DropImage.Parent = Dropdown
                DropImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                DropImage.BackgroundTransparency = 1.000
                DropImage.Position = UDim2.new(0, 425, 0, 5)
                DropImage.Rotation = 0
                DropImage.Size = UDim2.new(0, 20, 0, 20)
                DropImage.Image = "rbxassetid://5012539403"

                DropScroll.Name = "DropScroll"
                DropScroll.Parent = Droptitle
                DropScroll.Active = true
                DropScroll.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                DropScroll.BackgroundTransparency = 1.000
                DropScroll.BorderSizePixel = 0
                DropScroll.Position = UDim2.new(-0.0317460336, 0, 1, 0)
                DropScroll.Size = UDim2.new(0, 455, 0, 70)
                DropScroll.CanvasSize = UDim2.new(0, 0, 0, 2)
                DropScroll.ScrollBarThickness = 2

                DropdownList.Name = "DropdownList"
                DropdownList.Parent = DropScroll
                DropdownList.SortOrder = Enum.SortOrder.LayoutOrder
                DropdownList.Padding = UDim.new(0, 5)

                DropdownPadding.Name = "DropdownPadding"
                DropdownPadding.Parent = DropScroll
                DropdownPadding.PaddingTop = UDim.new(0, 5)

                local isdropping = false

                for i, v in next, table do
                    local DropButton2 = Instance.new("TextButton")

                    DropButton2.Name = "DropButton2"
                    DropButton2.Parent = DropScroll
                    DropButton2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    DropButton2.BackgroundTransparency = 1.000
                    DropButton2.Size = UDim2.new(0, 455, 0, 30)
                    DropButton2.AutoButtonColor = false
                    DropButton2.Font = Enum.Font.Gotham
                    DropButton2.TextColor3 = Color3.fromRGB(225, 225, 225)
                    DropButton2.TextSize = 11.000
                    DropButton2.Text = tostring(v)

                    DropButton2.MouseEnter:Connect(function()
                        TweenService:Create(DropButton2,
                            TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                TextColor3 = Color3.fromRGB(255, 0, 0)
                            }):Play()
                    end)
                    DropButton2.MouseLeave:Connect(function()
                        TweenService:Create(DropButton2,
                            TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                TextColor3 = Color3.fromRGB(225, 225, 225)
                            }):Play()
                    end)

                    DropButton2.MouseButton1Click:Connect(function()
                        TweenService:Create(Dropdown,
                            TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                Size = UDim2.new(0, 455, 0, 30)
                            }):Play()
                        TweenService:Create(DropImage,
                            TweenInfo.new(0.3, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
                                Rotation = 0
                            }):Play()
                        Droptitle.Text = text .. " : " .. tostring(v)
                        callback(v)
                        isdropping = not isdropping
                        DropScroll.CanvasSize = UDim2.new(0, 0, 0, DropdownList.AbsoluteContentSize.Y + 10)
                    end)
                end

                DropButton.MouseButton1Click:Connect(function()
                    if isdropping == false then
                        isdropping = true
                        TweenService:Create(Dropdown,
                            TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                Size = UDim2.new(0, 455, 0, 100)
                            }):Play()
                        TweenService:Create(DropImage,
                            TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                Rotation = -180
                            }):Play()
                        DropScroll.CanvasSize = UDim2.new(0, 0, 0, DropdownList.AbsoluteContentSize.Y + 10)
                    else
                        isdropping = false
                        TweenService:Create(Dropdown,
                            TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                Size = UDim2.new(0, 455, 0, 30)
                            }):Play()
                        TweenService:Create(DropImage,
                            TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                Rotation = 0
                            }):Play()
                        DropScroll.CanvasSize = UDim2.new(0, 0, 0, DropdownList.AbsoluteContentSize.Y + 10)
                    end
                end)
                DropScroll.CanvasSize = UDim2.new(0, 0, 0, DropdownList.AbsoluteContentSize.Y + 10)

                local drop = {}

                function drop:Clear()
                    Droptitle.Text = tostring(text) .. " :"
                    TweenService:Create(Dropdown, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                        Size = UDim2.new(0, 455, 0, 30)
                    }):Play()
                    isdropping = false
                    for i, v in next, DropScroll:GetChildren() do
                        if v:IsA("TextButton") then
                            v:Destroy()
                        end
                    end
                end
                function drop:Add(t)
                    local DropButton2 = Instance.new("TextButton")

                    DropButton2.Name = "DropButton2"
                    DropButton2.Parent = DropScroll
                    DropButton2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    DropButton2.BackgroundTransparency = 1.000
                    DropButton2.Size = UDim2.new(0, 455, 0, 30)
                    DropButton2.AutoButtonColor = false
                    DropButton2.Font = Enum.Font.Gotham
                    DropButton2.TextColor3 = Color3.fromRGB(225, 225, 225)
                    DropButton2.TextSize = 11.000
                    DropButton2.Text = tostring(t)

                    DropButton2.MouseButton1Click:Connect(function()
                        TweenService:Create(Dropdown,
                            TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                Size = UDim2.new(0, 455, 0, 30)
                            }):Play()
                        TweenService:Create(DropImage,
                            TweenInfo.new(0.3, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
                                Rotation = 0
                            }):Play()
                        Droptitle.Text = text .. " : " .. tostring(t)
                        callback(t)
                        isdropping = not isdropping
                        DropScroll.CanvasSize = UDim2.new(0, 0, 0, DropdownList.AbsoluteContentSize.Y + 10)
                    end)
                end
                return drop
            end

            function main:AddSlider(text, min, max, set, callback)
                set = (math.clamp(set, min, max))
                if set > max then
                    set = max
                end

                local Slider = Instance.new("Frame")
                local UICorner = Instance.new("UICorner")
                local SliderTitle = Instance.new("TextLabel")
                local SliderValue = Instance.new("TextLabel")
                local SliderButton = Instance.new("TextButton")
                local Bar1 = Instance.new("Frame")
                local Bar = Instance.new("Frame")
                local UICorner_2 = Instance.new("UICorner")
                local CircleBar = Instance.new("Frame")
                local UICorner_3 = Instance.new("UICorner")
                local UICorner_4 = Instance.new("UICorner")

                Slider.Name = "Slider"
                Slider.Parent = ScrollTab
                Slider.BackgroundColor3 = Color3.fromRGB(50, 48, 59)
                Slider.Size = UDim2.new(0, 455, 0, 40)

                UICorner.CornerRadius = UDim.new(0, 5)
                UICorner.Parent = Slider

                SliderTitle.Name = "SliderTitle"
                SliderTitle.Parent = Slider
                SliderTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                SliderTitle.BackgroundTransparency = 1.000
                SliderTitle.Position = UDim2.new(0.0283286124, 0, 0, 0)
                SliderTitle.Size = UDim2.new(0, 290, 0, 20)
                SliderTitle.Font = Enum.Font.Gotham
                SliderTitle.Text = text
                SliderTitle.TextColor3 = Color3.fromRGB(225, 225, 225)
                SliderTitle.TextSize = 11.000
                SliderTitle.TextXAlignment = Enum.TextXAlignment.Left

                SliderValue.Name = "SliderValue"
                SliderValue.Parent = Slider
                SliderValue.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                SliderValue.BackgroundTransparency = 1.000
                SliderValue.Position = UDim2.new(0.887778878, 0, 0, 0)
                SliderValue.Size = UDim2.new(0, 40, 0, 20)
                SliderValue.Font = Enum.Font.Gotham
                SliderValue.Text = tostring(set and math.floor((set / max) * (max - min) + min) or 0)
                SliderValue.TextColor3 = Color3.fromRGB(225, 225, 225)
                SliderValue.TextSize = 11.000

                SliderButton.Name = "SliderButton"
                SliderButton.Parent = Slider
                SliderButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                SliderButton.BackgroundTransparency = 1.000
                SliderButton.Position = UDim2.new(0, 10, 0, 25)
                SliderButton.Size = UDim2.new(0, 435, 0, 5)
                SliderButton.AutoButtonColor = false
                SliderButton.Font = Enum.Font.SourceSans
                SliderButton.Text = ""
                SliderButton.TextColor3 = Color3.fromRGB(0, 0, 0)
                SliderButton.TextSize = 14.000

                Bar1.Name = "Bar1"
                Bar1.Parent = SliderButton
                Bar1.BackgroundColor3 = Color3.fromRGB(30, 28, 39)
                Bar1.Size = UDim2.new(0, 435, 0, 5)

                Bar.Name = "Bar"
                Bar.Parent = Bar1
                Bar.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
                Bar.Size = UDim2.new(set / max, 0, 0, 5)

                UICorner_2.CornerRadius = UDim.new(0, 100)
                UICorner_2.Parent = Bar

                CircleBar.Name = "CircleBar"
                CircleBar.Parent = Bar
                CircleBar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                CircleBar.Position = UDim2.new(1, -2, 0, -2)
                CircleBar.AnchorPoint = Vector2.new(0, 0.1)
                CircleBar.Size = UDim2.new(0, 10, 0, 10)

                UICorner_3.CornerRadius = UDim.new(0, 100)
                UICorner_3.Parent = CircleBar

                UICorner_4.CornerRadius = UDim.new(0, 100)
                UICorner_4.Parent = Bar1

                local mouse = game.Players.LocalPlayer:GetMouse()
                local uis = game:GetService("UserInputService")

                if Value == nil then
                    Value = set
                    pcall(function()
                        callback(Value)
                    end)
                end

                SliderButton.MouseButton1Down:Connect(function()
                    Value =
                        math.floor((((tonumber(max) - tonumber(min)) / 435) * Bar.AbsoluteSize.X) + tonumber(min)) or 0
                    pcall(function()
                        callback(Value)
                    end)
                    Bar.Size = UDim2.new(0, math.clamp(mouse.X - Bar.AbsolutePosition.X, 0, 435), 0, 5)
                    CircleBar.Position = UDim2.new(0, math.clamp(mouse.X - Bar.AbsolutePosition.X - 2, 0, 425), 0, -2)
                    moveconnection = mouse.Move:Connect(function()
                        SliderValue.Text = Value
                        Value = math.floor((((tonumber(max) - tonumber(min)) / 435) * Bar.AbsoluteSize.X) +
                                               tonumber(min))
                        pcall(function()
                            callback(Value)
                        end)
                        Bar.Size = UDim2.new(0, math.clamp(mouse.X - Bar.AbsolutePosition.X, 0, 435), 0, 5)
                        CircleBar.Position = UDim2.new(0, math.clamp(mouse.X - Bar.AbsolutePosition.X - 2, 0, 425), 0,
                            -2)
                    end)
                    releaseconnection = uis.InputEnded:Connect(function(Mouse)
                        if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then
                            Value = math.floor((((tonumber(max) - tonumber(min)) / 435) * Bar.AbsoluteSize.X) +
                                                   tonumber(min))
                            pcall(function()
                                callback(Value)
                            end)
                            Bar.Size = UDim2.new(0, math.clamp(mouse.X - Bar.AbsolutePosition.X, 0, 435), 0, 5)
                            CircleBar.Position = UDim2.new(0, math.clamp(mouse.X - Bar.AbsolutePosition.X - 2, 0, 425),
                                0, -2)
                            moveconnection:Disconnect()
                            releaseconnection:Disconnect()
                        end
                    end)
                end)
                releaseconnection = uis.InputEnded:Connect(function(Mouse)
                    if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then
                        Value = math.floor((((tonumber(max) - tonumber(min)) / 435) * Bar.AbsoluteSize.X) +
                                               tonumber(min))
                        SliderValue.Text = Value
                    end
                end)
            end
            function main:AddSeperator(text)
                local Seperator = Instance.new("Frame")
                local Sep1 = Instance.new("Frame")
                local SepLabel = Instance.new("TextLabel")
                local Sep2 = Instance.new("Frame")

                Seperator.Name = "Seperator"
                Seperator.Parent = ScrollTab
                Seperator.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Seperator.BackgroundTransparency = 1.000
                Seperator.ClipsDescendants = true
                Seperator.Size = UDim2.new(0, 455, 0, 20)

                Sep1.Name = "Sep1"
                Sep1.Parent = Seperator
                Sep1.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
                Sep1.BorderSizePixel = 0
                Sep1.Position = UDim2.new(0, 0, 0, 10)
                Sep1.Size = UDim2.new(0, 150, 0, 1)

                SepLabel.Name = "SepLabel"
                SepLabel.Parent = Seperator
                SepLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                SepLabel.BackgroundTransparency = 1.000
                SepLabel.Position = UDim2.new(0, 95, 0, 0)
                SepLabel.Size = UDim2.new(0, 255, 0, 20)
                SepLabel.Font = Enum.Font.Gotham
                SepLabel.Text = text
                SepLabel.TextColor3 = Color3.fromRGB(225, 225, 225)
                SepLabel.TextSize = 11.000

                Sep2.Name = "Sep2"
                Sep2.Parent = Seperator
                Sep2.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
                Sep2.BorderSizePixel = 0
                Sep2.Position = UDim2.new(0, 305, 0, 10)
                Sep2.Size = UDim2.new(0, 150, 0, 1)
            end
            function main:AddLine()
                local Line = Instance.new("Frame")
                local Linee = Instance.new("Frame")

                Line.Name = "Line"
                Line.Parent = ScrollTab
                Line.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Line.BackgroundTransparency = 1.000
                Line.ClipsDescendants = true
                Line.Size = UDim2.new(0, 455, 0, 20)

                Linee.Name = "Linee"
                Linee.Parent = Line
                Linee.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
                Linee.BorderSizePixel = 0
                Linee.Position = UDim2.new(0, 0, 0, 10)
                Linee.Size = UDim2.new(0, 455, 0, 1)
            end
            function main:AddLabel(text)
                local Label = Instance.new("TextLabel")
                local PaddingLabel = Instance.new("UIPadding")
                local labell = {}

                Label.Name = "Label"
                Label.Parent = ScrollTab
                Label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Label.BackgroundTransparency = 1.000
                Label.Size = UDim2.new(0, 455, 0, 20)
                Label.Font = Enum.Font.Gotham
                Label.TextColor3 = Color3.fromRGB(225, 225, 225)
                Label.TextSize = 11.000
                Label.Text = text
                Label.TextXAlignment = Enum.TextXAlignment.Left

                PaddingLabel.PaddingLeft = UDim.new(0, 10)
                PaddingLabel.Parent = Label
                PaddingLabel.Name = "PaddingLabel"

                function labell:Set(newtext)
                    Label.Text = newtext
                end

                return labell
            end

            return main
        end
        return uitab
    end

    local ScreenGui = Instance.new("ScreenGui")
    local Toggle = Instance.new("TextButton")

    ScreenGui.Name = "ScreenGui"
    ScreenGui.Parent = game.CoreGui

    Toggle.Name = "Toggle"
    Toggle.Parent = ScreenGui
    Toggle.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    Toggle.Position = UDim2.new(0.120833337, 0, 0.0952890813, 0)
    Toggle.Size = UDim2.new(0, 50, 0, 50)
    Toggle.Font = Enum.Font.Code
    Toggle.Text = "R"
    Toggle.TextColor3 = Color3.fromRGB(255, 0, 0)
    Toggle.TextScaled = true
    Toggle.MouseButton1Down:connect(function()
        game:GetService("VirtualInputManager"):SendKeyEvent(true, 305, false, game)
        game:GetService("VirtualInputManager"):SendKeyEvent(false, 305, false, game)
    end)
    --
    function CheckQuest()
        local MyLevel = game:GetService("Players").LocalPlayer.PlayerStats.Level.Value
        if MyLevel >= 1 and MyLevel < 15 then
            Mon = "Bandit [Lv:5]"
            NameQuest = "Bandit"
        elseif MyLevel >= 15 and MyLevel < 30 then
            Mon = "Pirates [Lv:15]"
            NameQuest = "Pirates"
        elseif MyLevel >= 30 and MyLevel < 60 then
            Mon = "BagyPirates [Lv:30]"
            NameQuest = "BagyPirates"
        elseif MyLevel >= 60 and MyLevel < 150 then
            Mon = "Clown Pirate [Lv:60]"
            NameQuest = "Clown Pirate"
        elseif MyLevel >= 150 and MyLevel < 200 then
            Mon = "Revolutionary Troop [Lv:150]"
            NameQuest = "Revolutionary Troop"
        elseif MyLevel >= 200 and MyLevel < 500 then
            Mon = "Marines [Lv:200]"
            NameQuest = "Marines"
        elseif MyLevel >= 500 and MyLevel < 600 then
            Mon = "Marines [Lv:200]"
            NameQuest = "Marines"
        elseif MyLevel >= 600 and MyLevel < 700 then
            Mon = "Fishman [Lv:600]"
            NameQuest = "Fishman"
        elseif MyLevel >= 700 and MyLevel < 850 then
            Mon = "WinterBandit [Lv:700]"
            NameQuest = "WinterBandit"
        elseif MyLevel >= 850 and MyLevel < 950 then
            Mon = "Sky Bandit [Lv:850]"
            NameQuest = "Sky Bandit"
        elseif MyLevel >= 950 and MyLevel < 1150 then
            Mon = "Sky Bandit [Lv:850]"
            NameQuest = "Sky Bandit"
        elseif MyLevel >= 1150 and MyLevel < 1200 then
            Mon = "Monkey [Lv:1150]"
            NameQuest = "Monkey"
        elseif MyLevel >= 1200 and MyLevel < 1400 then
            Mon = "Monkey [Lv:1150]"
            NameQuest = "Monkey"
        elseif MyLevel >= 1400 then
            Mon = "Skeleton [Lv:1400]"
            NameQuest = "Skeleton"
        end
    end

    function fly()
        local mouse = game.Players.LocalPlayer:GetMouse ''
        localplayer = game.Players.LocalPlayer
        game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")
        local torso = game.Players.LocalPlayer.Character.HumanoidRootPart
        local speedSET = 25
        local keys = {
            a = false,
            d = false,
            w = false,
            s = false
        }
        local e1
        local e2
        local function start()
            local pos = Instance.new("BodyPosition", torso)
            local gyro = Instance.new("BodyGyro", torso)
            pos.Name = "EPIXPOS"
            pos.maxForce = Vector3.new(math.huge, math.huge, math.huge)
            pos.position = torso.Position
            gyro.maxTorque = Vector3.new(9e9, 9e9, 9e9)
            gyro.CFrame = torso.CFrame
            repeat
                wait()
                localplayer.Character.Humanoid.PlatformStand = true
                local new = gyro.CFrame - gyro.CFrame.p + pos.position
                if not keys.w and not keys.s and not keys.a and not keys.d then
                    speed = 1
                end
                if keys.w then
                    new = new + workspace.CurrentCamera.CoordinateFrame.lookVector * speed
                    speed = speed + speedSET
                end
                if keys.s then
                    new = new - workspace.CurrentCamera.CoordinateFrame.lookVector * speed
                    speed = speed + speedSET
                end
                if keys.d then
                    new = new * CFrame.new(speed, 0, 0)
                    speed = speed + speedSET
                end
                if keys.a then
                    new = new * CFrame.new(-speed, 0, 0)
                    speed = speed + speedSET
                end
                if speed > speedSET then
                    speed = speedSET
                end
                pos.position = new.p
                if keys.w then
                    gyro.CFrame = workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad(speed * 15), 0, 0)
                elseif keys.s then
                    gyro.CFrame = workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(math.rad(speed * 15), 0, 0)
                else
                    gyro.CFrame = workspace.CurrentCamera.CoordinateFrame
                end
            until not Fly
            if gyro then
                gyro:Destroy()
            end
            if pos then
                pos:Destroy()
            end
            flying = false
            localplayer.Character.Humanoid.PlatformStand = false
            speed = 0
        end
        e1 = mouse.KeyDown:connect(function(key)
            if not torso or not torso.Parent then
                flying = false
                e1:disconnect()
                e2:disconnect()
                return
            end
            if key == "w" then
                keys.w = true
            elseif key == "s" then
                keys.s = true
            elseif key == "a" then
                keys.a = true
            elseif key == "d" then
                keys.d = true
            end
        end)
        e2 = mouse.KeyUp:connect(function(key)
            if key == "w" then
                keys.w = false
            elseif key == "s" then
                keys.s = false
            elseif key == "a" then
                keys.a = false
            elseif key == "d" then
                keys.d = false
            end
        end)
        start()
    end

    function Hop()
        local PlaceID = game.PlaceId
        local AllIDs = {}
        local foundAnything = ""
        local actualHour = os.date("!*t").hour
        local Deleted = false
        function TPReturner()
            local Site;
            if foundAnything == "" then
                Site = game.HttpService:JSONDecode(game:HttpGet(
                    'https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
            else
                Site = game.HttpService:JSONDecode(game:HttpGet(
                    'https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' ..
                        foundAnything))
            end
            local ID = ""
            if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
                foundAnything = Site.nextPageCursor
            end
            local num = 0;
            for i, v in pairs(Site.data) do
                local Possible = true
                ID = tostring(v.id)
                if tonumber(v.maxPlayers) > tonumber(v.playing) then
                    for _, Existing in pairs(AllIDs) do
                        if num ~= 0 then
                            if ID == tostring(Existing) then
                                Possible = false
                            end
                        else
                            if tonumber(actualHour) ~= tonumber(Existing) then
                                local delFile = pcall(function()
                                    AllIDs = {}
                                    table.insert(AllIDs, actualHour)
                                end)
                            end
                        end
                        num = num + 1
                    end
                    if Possible == true then
                        table.insert(AllIDs, ID)
                        wait()
                        pcall(function()
                            wait()
                            game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID,
                                game.Players.LocalPlayer)
                        end)
                        wait(4)
                    end
                end
            end
        end
        function Teleport()
            while wait() do
                pcall(function()
                    TPReturner()
                    if foundAnything ~= "" then
                        TPReturner()
                    end
                end)
            end
        end
        Teleport()
    end

    spawn(function()
        game:GetService("RunService").RenderStepped:Connect(function()
            if _G.NoClip or _G.Auto_Farm_Level or _G.Auto_Farm_LevelFactory or _G.AutoSeaBeats or _G.AutoTreeMonster or
                _G.AutoFlameEmperor or _G.AutoGodOfLighting or _G.Auto_Farm_LevelPlayer or _G.AutoSwordMan or
                _G.AutoShisui then
                if not game:GetService("Workspace"):FindFirstChild("TaiFoot") then
                    local Part = Instance.new("Part")
                    Part.Name = "TaiFoot"
                    Part.Parent = game.Workspace
                    Part.Anchored = true
                    Part.Transparency = 1
                    Part.Size = Vector3.new(30, 0.5, 30)
                elseif game:GetService("Workspace"):FindFirstChild("TaiFoot") then
                    game.Workspace["TaiFoot"].CFrame = CFrame.new(
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.X,
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Y - 3.92,
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Z)
                end
            else
                if game:GetService("Workspace"):FindFirstChild("TaiFoot") then
                    game:GetService("Workspace"):FindFirstChild("TaiFoot"):Destroy()
                end
            end
        end)
    end)

    spawn(function()
        pcall(function()
            game:GetService("RunService").Stepped:Connect(function()
                if _G.NoClip or _G.Auto_Farm_Level or _G.Auto_Farm_LevelFactory or _G.AutoSeaBeats or _G.AutoTreeMonster or
                    _G.AutoFlameEmperor or _G.AutoGodOfLighting or _G.Auto_Farm_LevelPlayer or _G.AutoSwordMan or
                    _G.AutoShisui then
                    for _, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                        if v:IsA("BasePart") then
                            v.CanCollide = false
                        end
                    end
                end
            end)
        end)
    end)

    function EquipWeapon(ToolSe)
        if game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe) then
            getgenv().tool = game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe)
            wait()
            game.Players.LocalPlayer.Character.Humanoid:EquipTool(tool)
        end
    end

    function AutoHaki()
        if not game.Players.LocalPlayer.Character:FindFirstChild("Buso") then
            game:GetService("ReplicatedStorage").Haki:FireServer("Buso")
        end
    end

    game:GetService("Players").LocalPlayer.Idled:connect(function()
        game:GetService("VirtualUser"):Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
        wait(1)
        game:GetService("VirtualUser"):Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
    end)

    FarmMethod = CFrame.new(0, 1, 2.5)
    --
    local RenUi = library:AddWindow("Ren Hub | LP", Enum.KeyCode.RightControl)
    --
    local Main = RenUi:AddTab("Auto Farm", "6026568198")
    local Stats = RenUi:AddTab("Stats", "7040410130")
    local Combat = RenUi:AddTab("Combat", "7251993295")
    local Teleport = RenUi:AddTab("Teleport", "7044226690")
    local Shop = RenUi:AddTab("Shop", "6031265976")
    local Misc = RenUi:AddTab("Misc", "6034900727")
    --
    Main:AddSeperator("Settings")

    Time = Main:AddLabel("Server Time")

    function UpdateTime()
        local GameTime = math.floor(workspace.DistributedGameTime + 0.5)
        local Hour = math.floor(GameTime / (60 ^ 2)) % 24
        local Minute = math.floor(GameTime / (60 ^ 1)) % 60
        local Second = math.floor(GameTime / (60 ^ 0)) % 60
        Time:Set("Hr(s) : " .. Hour .. " Min(s) : " .. Minute .. " Sec(s) : " .. Second)
    end

    spawn(function()
        while task.wait() do
            pcall(function()
                UpdateTime()
            end)
        end
    end)

    WeaponList = {}

    for i, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
        if v:IsA("Tool") then
            table.insert(WeaponList, v.Name)
        end
    end

    for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
        if v:IsA("Tool") then
            table.insert(WeaponList, v.Name)
        end
    end

    local SelectP = Main:AddDropdown("Select Weapon", WeaponList, function(value)
        _G.SelectWeapon = value
    end)

    Main:AddButton("Refresh Weapon", function()
        SelectP:Clear()
        for i, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
            if v:IsA("Tool") then
                SelectP:Add(v.Name)
            end
        end

        for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
            if v:IsA("Tool") then
                SelectP:Add(v.Name)
            end
        end
    end)

    Main:AddSeperator("Main")

    Main:AddToggle("Auto Farm Level", _G.Auto_Farm_Level, function(value)
        _G.Auto_Farm_Level = value
    end)

    spawn(function()
        while wait() do
            if _G.Auto_Farm_Level then
                pcall(function()
                    CheckQuest()
                    if game:GetService("Players").LocalPlayer.PlayerGui.QuestGui.Enabled then
                        for i, v in pairs(game:GetService("Workspace").Lives:GetChildren()) do
                            if game:GetService("Workspace").Lives:FindFirstChild(Mon) then
                                if v.Name == Mon then
                                    if v.Torso.Transparency ~= 1 then
                                        if string.find(game:GetService("Players").LocalPlayer.Quest.Doing.Value,
                                            NameQuest) then
                                            repeat
                                                task.wait()
                                                EquipWeapon(_G.SelectWeapon)
                                                AutoHaki()
                                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                                                    v.HumanoidRootPart.CFrame
                                                game:GetService 'VirtualUser':CaptureController()
                                                game:GetService 'VirtualUser':Button1Down(Vector2.new(1280, 672),
                                                    game:GetService("Workspace").Camera.CFrame)
                                            until v.Torso.Transparency == 1 or not _G.Auto_Farm_Level or
                                                not game:GetService("Players").LocalPlayer.PlayerGui.QuestGui.Enabled
                                        else
                                            game:GetService("Players").LocalPlayer.PlayerGui.QuestGui.Enabled = false
                                        end
                                    end
                                end
                            end
                        end
                    elseif not game:GetService("Players").LocalPlayer.PlayerGui.QuestGui.Enabled then
                        game:GetService("ReplicatedStorage").FuncQuest:InvokeServer(NameQuest)
                    end
                end)
            end
        end
    end)

    Main:AddSeperator("Factory")

    Main:AddToggle("Auto Factory", _G.Auto_Farm_LevelFactory, function(value)
        _G.Auto_Farm_LevelFactory = value
    end)

    Main:AddToggle("Auto Factory Hop", _G.Auto_Farm_LevelFactory_Hop, function(value)
        _G.Auto_Farm_LevelFactory_Hop = value
    end)

    spawn(function()
        while wait() do
            if _G.Auto_Farm_LevelFactory then
                pcall(function()
                    for i, v in pairs(game:GetService("Workspace").Lives:GetChildren()) do
                        if game:GetService("Workspace").Lives:FindFirstChild("Factory") then
                            if v.Name == "Factory" then
                                repeat
                                    task.wait()
                                    EquipWeapon(_G.SelectWeapon)
                                    AutoHaki()
                                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart
                                                                                                     .CFrame
                                    game:GetService 'VirtualUser':CaptureController()
                                    game:GetService 'VirtualUser':Button1Down(Vector2.new(1280, 672), game:GetService(
                                        "Workspace").Camera.CFrame)
                                until v.Humanoid.Health <= 0 or
                                    not game:GetService("Workspace").Lives:FindFirstChild("Factory") or
                                    not _G.Auto_Farm_LevelFactory or not v.Parent
                            end
                        else
                            if _G.Auto_Farm_LevelFactory_Hop then
                                Hop()
                            end
                        end
                    end
                end)
            end
        end
    end)

    Main:AddSeperator("Sea Beats")

    Main:AddToggle("Auto Sea Beats", _G.AutoSeaBeats, function(value)
        _G.AutoSeaBeats = value
    end)

    Main:AddToggle("Auto Sea Beats Hop", _G.AutoSeaBeats_Hop, function(value)
        _G.AutoSeaBeats_Hop = value
    end)

    spawn(function()
        while wait() do
            if _G.AutoSeaBeats then
                pcall(function()
                    for i, v in pairs(game:GetService("Workspace").Lives:GetChildren()) do
                        if game:GetService("Workspace").Lives:FindFirstChild("Sea Beast") then
                            if v.Name == "Sea Beast" then
                                repeat
                                    task.wait()
                                    EquipWeapon(_G.SelectWeapon)
                                    AutoHaki()
                                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart
                                                                                                     .CFrame
                                    game:GetService 'VirtualUser':CaptureController()
                                    game:GetService 'VirtualUser':Button1Down(Vector2.new(1280, 672), game:GetService(
                                        "Workspace").Camera.CFrame)
                                until v.Humanoid.Health <= 0 or
                                    not game:GetService("Workspace").Lives:FindFirstChild("Sea Beast") or
                                    not _G.AutoSeaBeats or not v.Parent
                            end
                        else
                            if _G.AutoSeaBeats_Hop then
                                Hop()
                            end
                        end
                    end
                end)
            end
        end
    end)

    Main:AddSeperator("Tree Monster")

    Main:AddToggle("Auto Tree Monster", _G.AutoTreeMonster, function(value)
        _G.AutoTreeMonster = value
    end)

    Main:AddToggle("Auto Tree Monster Hop", _G.AutoTreeMonster_Hop, function(value)
        _G.AutoTreeMonster_Hop = value
    end)

    spawn(function()
        while wait() do
            if _G.AutoTreeMonster then
                pcall(function()
                    for i, v in pairs(game:GetService("Workspace").Lives:GetChildren()) do
                        if game:GetService("Workspace").Lives:FindFirstChild("TreeMoster") then
                            if v.Name == "TreeMoster" then
                                repeat
                                    task.wait()
                                    EquipWeapon(_G.SelectWeapon)
                                    AutoHaki()
                                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart
                                                                                                     .CFrame
                                    game:GetService 'VirtualUser':CaptureController()
                                    game:GetService 'VirtualUser':Button1Down(Vector2.new(1280, 672), game:GetService(
                                        "Workspace").Camera.CFrame)
                                until v.Humanoid.Health <= 0 or
                                    not game:GetService("Workspace").Lives:FindFirstChild("TreeMoster") or
                                    not _G.AutoTreeMonster or not v.Parent
                            end
                        else
                            if _G.AutoTreeMonster_Hop then
                                Hop()
                            end
                        end
                    end
                end)
            end
        end
    end)

    Main:AddSeperator("Sword Man")

    Main:AddToggle("Auto Sword Man", _G.AutoSwordMan, function(value)
        _G.AutoSwordMan = value
    end)

    Main:AddToggle("Auto Sword Man Hop", _G.AutoSwordMan_Hop, function(value)
        _G.AutoSwordMan_Hop = value
    end)

    spawn(function()
        while wait() do
            if _G.AutoSwordMan then
                pcall(function()
                    for i, v in pairs(game:GetService("Workspace").Lives:GetChildren()) do
                        if game:GetService("Workspace").Lives:FindFirstChild("Sword Man [Boss]") then
                            if v.Name == "Sword Man [Boss]" then
                                repeat
                                    task.wait()
                                    EquipWeapon(_G.SelectWeapon)
                                    AutoHaki()
                                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart
                                                                                                     .CFrame
                                    game:GetService 'VirtualUser':CaptureController()
                                    game:GetService 'VirtualUser':Button1Down(Vector2.new(1280, 672), game:GetService(
                                        "Workspace").Camera.CFrame)
                                until v.Humanoid.Health <= 0 or
                                    not game:GetService("Workspace").Lives:FindFirstChild("Sword Man [Boss]") or
                                    not _G.AutoSwordMan or not v.Parent
                            end
                        else
                            if _G.AutoSwordMan_Hop then
                                Hop()
                            end
                        end
                    end
                end)
            end
        end
    end)

    Main:AddSeperator("Flame Emperor")

    Main:AddToggle("Auto Flame Emperor", _G.AutoFlameEmperor, function(value)
        _G.AutoFlameEmperor = value
    end)

    Main:AddToggle("Auto Flame Emperor Hop", _G.AutoFlameEmperor_Hop, function(value)
        _G.AutoFlameEmperor_Hop = value
    end)

    spawn(function()
        while wait() do
            if _G.AutoFlameEmperor then
                pcall(function()
                    for i, v in pairs(game:GetService("Workspace").Lives:GetChildren()) do
                        if game:GetService("Workspace").Lives:FindFirstChild("Flame Emperor [Boss]") then
                            if v.Name == "Flame Emperor [Boss]" then
                                repeat
                                    task.wait()
                                    EquipWeapon(_G.SelectWeapon)
                                    AutoHaki()
                                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart
                                                                                                     .CFrame
                                    game:GetService 'VirtualUser':CaptureController()
                                    game:GetService 'VirtualUser':Button1Down(Vector2.new(1280, 672), game:GetService(
                                        "Workspace").Camera.CFrame)
                                until v.Humanoid.Health <= 0 or
                                    not game:GetService("Workspace").Lives:FindFirstChild("Flame Emperor [Boss]") or
                                    not _G.AutoFlameEmperor or not v.Parent
                            end
                        else
                            if _G.AutoFlameEmperor_Hop then
                                Hop()
                            end
                        end
                    end
                end)
            end
        end
    end)

    Main:AddSeperator("God Of Lighting")

    Main:AddToggle("Auto God Of Lighting", _G.AutoGodOfLighting, function(value)
        _G.AutoGodOfLighting = value
    end)

    Main:AddToggle("Auto God Of Lighting Hop", _G.AutoGodOfLighting_Hop, function(value)
        _G.AutoGodOfLighting_Hop = value
    end)

    spawn(function()
        while wait() do
            if _G.AutoGodOfLighting then
                pcall(function()
                    for i, v in pairs(game:GetService("Workspace").Lives:GetChildren()) do
                        if game:GetService("Workspace").Lives:FindFirstChild("God Of Lighting") then
                            if v.Name == "God Of Lighting" then
                                repeat
                                    task.wait()
                                    EquipWeapon(_G.SelectWeapon)
                                    AutoHaki()
                                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart
                                                                                                     .CFrame
                                    game:GetService 'VirtualUser':CaptureController()
                                    game:GetService 'VirtualUser':Button1Down(Vector2.new(1280, 672), game:GetService(
                                        "Workspace").Camera.CFrame)
                                until v.Humanoid.Health <= 0 or
                                    not game:GetService("Workspace").Lives:FindFirstChild("God Of Lighting") or
                                    not _G.AutoGodOfLighting or not v.Parent
                            end
                        else
                            if _G.AutoGodOfLighting_Hop then
                                Hop()
                            end
                        end
                    end
                end)
            end
        end
    end)

    Main:AddSeperator("Shisui")

    Main:AddToggle("Auto Shisui", _G.AutoShisui, function(value)
        _G.AutoShisui = value
    end)

    Main:AddToggle("Auto Shisui Hop", _G.AutoShisui_Hop, function(value)
        _G.AutoShisui_Hop = value
    end)

    spawn(function()
        while wait() do
            if _G.AutoShisui then
                pcall(function()
                    if game.Players.LocalPlayer.PlayerStats.Experience.Value >= 10 then
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(3062.078369140625,
                            35.42287826538086, -2440.669677734375)
                        wait(.8)
                        game:GetService("ReplicatedStorage").BuyMysterious:InvokeServer("Shushi", true)
                        wait(.5)
                        game:GetService("ReplicatedStorage").BuyMysterious:InvokeServer("Shushi", false)
                    else
                        for i, v in pairs(game:GetService("Workspace").Lives:GetChildren()) do
                            if game:GetService("Workspace").Lives:FindFirstChild("TreeMoster") then
                                if v.Name == "TreeMoster" then
                                    repeat
                                        task.wait()
                                        EquipWeapon(_G.SelectWeapon)
                                        AutoHaki()
                                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart
                                                                                                         .CFrame
                                        game:GetService 'VirtualUser':CaptureController()
                                        game:GetService 'VirtualUser':Button1Down(Vector2.new(1280, 672),
                                            game:GetService("Workspace").Camera.CFrame)
                                    until v.Humanoid.Health <= 0 or
                                        not game:GetService("Workspace").Lives:FindFirstChild("TreeMoster") or
                                        not _G.AutoShisui or not v.Parent
                                end
                            else
                                if _G.AutoShisui_Hop then
                                    Hop()
                                end
                            end
                        end
                    end
                end)
            end
        end
    end)

    Combat:AddSeperator("Settings")

    PlayerName = {}
    for i, v in pairs(game.Players:GetChildren()) do
        if v.Name ~= game.Players.LocalPlayer.Name then
            table.insert(PlayerName, v.Name)
        end
    end

    local SelectedPly = Combat:AddDropdown("Select Players", PlayerName, function(value)
        _G.SelectPly = value
    end)

    Combat:AddButton("Refresh Player", function()
        PlayerName = {}
        SelectedPly:Clear()
        for i, v in pairs(game.Players:GetChildren()) do
            if v.Name ~= game.Players.LocalPlayer.Name then
                SelectedPly:Add(v.Name)
            end
        end
    end)

    Combat:AddSeperator("Menu")

    Combat:AddToggle("Spectate Player", false, function(value)
        Spectate = value
        local plr1 = game.Players.LocalPlayer.Character.Humanoid
        local plr2 = game.Players:FindFirstChild(_G.SelectPly)
        repeat
            task.wait()
            game.Workspace.Camera.CameraSubject = plr2.Character.Humanoid
        until Spectate == false
        game.Workspace.Camera.CameraSubject = plr1
    end)

    Combat:AddButton("Teleport", function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
            game.Players[_G.SelectPly].Character.HumanoidRootPart.CFrame
    end)

    Combat:AddSeperator("Farm")

    Weaponply = {}
    for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
        if v:IsA("Tool") then
            table.insert(Weaponply, v.Name)
        end
    end

    local SelectWeaponply = Combat:AddDropdown("Select Weapon", Weaponply, function(value)
        _G.SelectWeaponKill = value
    end)

    Combat:AddButton("Refresh Weapon", function()
        SelectWeaponply:Clear()
        Weaponply = {}
        for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
            if v:IsA("Tool") then
                SelectWeaponply:Add(v.Name)
            end
        end
        for i, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
            if v:IsA("Tool") then
                SelectWeaponply:Add(v.Name)
            end
        end
    end)

    Combat:AddToggle("Auto Farm Player", false, function(value)
        _G.Auto_Farm_LevelPlayer = value
    end)

    spawn(function()
        while wait() do
            pcall(function()
                if _G.Auto_Farm_LevelPlayer then
                    if game.Players:FindFirstChild(_G.SelectPly) and
                        game.Players:FindFirstChild(_G.SelectPly).Character.Humanoid.Health > 0 then
                        repeat
                            task.wait()
                            EquipWeapon(_G.SelectWeaponKill)
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players:FindFirstChild(
                                                                                             _G.SelectPly).Character
                                                                                             .HumanoidRootPart.CFrame
                            game:GetService 'VirtualUser':CaptureController()
                            game:GetService 'VirtualUser':Button1Down(Vector2.new(1280, 672))
                        until game.Players:FindFirstChild(_G.SelectPly).Character.Humanoid.Health <= 0 or
                            not _G.Auto_Farm_LevelPlayer or not game.Players:FindFirstChild(_G.SelectPly)
                    end
                end
            end)
        end
    end)

    Stats:AddSeperator("Stats")

    Stats:AddToggle("Auto Malee", _G.AutoMalee, function(value)
        _G.AutoMalee = value
    end)

    spawn(function()
        while wait() do
            if _G.AutoMalee then
                if game:GetService("Players").LocalPlayer.PlayerStats.Points.Value ~= 0 then
                    pcall(function()
                        game:GetService("ReplicatedStorage").okStats:FireServer(_G.SelectPoints, "1")
                    end)
                end
            end
        end
    end)

    Stats:AddToggle("Auto Sword", _G.AutoSword, function(value)
        _G.AutoSword = value
    end)

    spawn(function()
        while wait() do
            if _G.AutoSword then
                if game:GetService("Players").LocalPlayer.PlayerStats.Points.Value ~= 0 then
                    pcall(function()
                        game:GetService("ReplicatedStorage").okStats:FireServer(_G.SelectPoints, "2")
                    end)
                end
            end
        end
    end)

    Stats:AddToggle("Auto Defense", _G.AutoDefense, function(value)
        _G.AutoDefense = value
    end)

    spawn(function()
        while wait() do
            if _G.AutoDefense then
                if game:GetService("Players").LocalPlayer.PlayerStats.Points.Value ~= 0 then
                    pcall(function()
                        game:GetService("ReplicatedStorage").okStats:FireServer(_G.SelectPoints, "3")
                    end)
                end
            end
        end
    end)

    Stats:AddToggle("Auto Devil Fruits", _G.AutoDevilFruits, function(value)
        _G.AutoDevilFruits = value
    end)

    spawn(function()
        while wait() do
            if _G.AutoDevilFruits then
                if game:GetService("Players").LocalPlayer.PlayerStats.Points.Value ~= 0 then
                    pcall(function()
                        game:GetService("ReplicatedStorage").okStats:FireServer(_G.SelectPoints, "4")
                    end)
                end
            end
        end
    end)

    Stats:AddSeperator("Settings")

    local PointsLabel = Stats:AddLabel("Points")

    spawn(function()
        while wait() do
            pcall(function()
                PointsLabel:Set("Points : " .. game:GetService("Players").LocalPlayer.PlayerStats.Points.Value)
            end)
        end
    end)

    _G.SelectPoints = 1
    Stats:AddSlider("Select Points", 1, 100, 1, function(value)
        _G.SelectPoints = value
    end)

    Teleport:AddSeperator("Island")

    Teleport:AddButton("Start Island", function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
            CFrame.new(375.6844177246094, 40.559078216552734, -1817.482666015625)
    end)

    Teleport:AddButton("justical Island", function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
            CFrame.new(-2626.17724609375, 66.47785949707031, 191.99685668945312)
    end)

    Teleport:AddButton("Rock Island", function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
            CFrame.new(-2115.826904296875, 128.0514373779297, -2987.5615234375)
    end)

    Teleport:AddButton("Carnival Island", function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
            CFrame.new(1576.714111328125, 91.70256805419922, 578.6084594726562)
    end)

    Teleport:AddButton("Chef Ship Island", function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
            CFrame.new(1112.2225341796875, 238.87881469726562, -5139.44970703125)
    end)

    Teleport:AddButton("Fishman Island", function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
            CFrame.new(4875.50341796875, 55.92596435546875, 1960.6123046875)
    end)

    Teleport:AddButton("Snow Island", function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
            CFrame.new(2329.197265625, 317.1258544921875, 4727.833984375)
    end)

    Teleport:AddButton("Sky Island", function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
            CFrame.new(-81.80178833007812, 341.2190246582031, 3342.12890625)
    end)

    Teleport:AddButton("Banadian Island", function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
            CFrame.new(3003.07958984375, 34.90738296508789, -2876.93701171875)
    end)

    Teleport:AddButton("Factory Island", function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
            CFrame.new(-63.78919219970703, 24.393857955932617, -9258.2197265625)
    end)

    Teleport:AddButton("Colosseum Island", function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
            CFrame.new(-5226.998046875, 39.16239929199219, -2048.358154296875)
    end)

    Teleport:AddButton("Valenta Land", function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
            CFrame.new(-5530.51367, 50, -5784.32617, 1, 0, 0, 0, 1, 0, 0, 0, 1)
    end)

    Teleport:AddSeperator("NPC")

    Teleport:AddLabel("Fighting Style")

    Teleport:AddButton("Blackleg V1", function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
            CFrame.new(1106.1300048828, 83.481460571289, -5288.6684570312)
    end)

    Teleport:AddButton("FishmanKarate", function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
            CFrame.new(4993.3798828125, 3.8742942810059, 1891.7390136719)
    end)

    Teleport:AddLabel("Seller")

    Teleport:AddButton("Saber", function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
            CFrame.new(3137.8322753906, 71.283683776855, -2336.1936035156)
    end)

    Teleport:AddButton("Shisui", function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
            CFrame.new(3062.8059082031, 35.422878265381, -2443.71875)
    end)

    Teleport:AddButton("Pole", function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
            CFrame.new(-67.620330810547, 263.66351318359, 3411.5913085938)
    end)

    Teleport:AddButton("Bisento", function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
            CFrame.new(3234.86328125, 60.833969116211, -2618.2893066406)
    end)

    Teleport:AddButton("Bisento V2", function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
            CFrame.new(2414.9047851562, 22.441854476929, 5015.9580078125)
    end)

    Teleport:AddLabel("Misc NPC")

    Teleport:AddButton("Buso Color", function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
            CFrame.new(-30.596668243408, 25.325693130493, -9159.78515625)
    end)

    Teleport:AddButton("Ken Haki", function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
            CFrame.new(-6276.5288085938, 32.993175506592, 3838.0651855469)
    end)

    Teleport:AddButton("Buso Haki", function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
            CFrame.new(-2202.8803710938, 136.26412963867, -2478.4768066406)
    end)

    Teleport:AddButton("Reset Stats", function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
            CFrame.new(-44.78331756591797, 25.325693130493164, -9114.814453125)
    end)

    Shop:AddSeperator("Sword")

    Shop:AddButton("Cutlass", function()
        game:GetService("ReplicatedStorage").BuySword:InvokeServer("Cutlass")
    end)

    Shop:AddButton("Katana", function()
        game:GetService("ReplicatedStorage").BuySword:InvokeServer("Katana")
    end)

    Shop:AddButton("Saber", function()
        game:GetService("ReplicatedStorage").BuySword:InvokeServer("Saber")
    end)

    Shop:AddButton("Bisento", function()
        game:GetService("ReplicatedStorage").BuySword:InvokeServer("Bisento")
    end)

    Shop:AddButton("Bisento V2", function()
        game:GetService("ReplicatedStorage").UpgradePowa:InvokeServer("BisentoV2")
    end)

    Shop:AddButton("Pole", function()
        game:GetService("ReplicatedStorage").BuySword:InvokeServer("Pole")
    end)

    Shop:AddButton("Shisui", function()
        game:GetService("ReplicatedStorage").BuyMysterious:InvokeServer("Shushi", true)
        wait(.5)
        game:GetService("ReplicatedStorage").BuyMysterious:InvokeServer("Shushi", false)
    end)

    Shop:AddSeperator("Abilities")

    Shop:AddButton("Buso", function()
        game:GetService("ReplicatedStorage").BuySpecial:InvokeServer("BusoHaki")
    end)

    Shop:AddButton("Buso Color", function()
        game:GetService("ReplicatedStorage").HakiColour:InvokeServer()
    end)

    Misc:AddToggle("Auto Xmas", _G.AutoXmas, function(value)
        _G.AutoXmas = value
        StopNoClip(_G.AutoXmas)
    end)

    Misc:AddToggle("Auto Xmas Hop", _G.AutoXmas_Hop, function(value)
        _G.AutoXmas_Hop = value
    end)

    spawn(function()
        while wait() do
            if _G.AutoXmas then
                pcall(function()
                    if game:GetService("Workspace").Monster.Boss:FindFirstChild("Santa [Lv. 5000]") then
                        for i, v in pairs(game:GetService("Workspace").Monster.Boss:GetChildren()) do
                            if v.Name == "Santa [Lv. 5000]" and v.Humanoid.Health > 0 then
                                repeat
                                    task.wait()
                                    AutoHaki()
                                    EquipWeapon(_G.SelectWeapon)
                                    TP(v.HumanoidRootPart.CFrame * MethodFarm)
                                    if _G.AutoSkill then
                                        UseSkill("Z")
                                        UseSkill("X")
                                        UseSkill("C")
                                        UseSkill("V")
                                    end
                                    VirtualUser:CaptureController()
                                    VirtualUser:ClickButton1(Vector2.new(1280, 672))
                                until v.Humanoid.Health <= 0 or not _G.AutoXmas
                            end
                        end
                    else
                        if game:GetService("ReplicatedStorage").MOB:FindFirstChild("Santa [Lv. 5000]") then
                            TP(game:GetService("ReplicatedStorage").MOB:FindFirstChild("Santa [Lv. 5000]")
                                   .HumanoidRootPart.CFrame * MethodFarm)
                        else
                            if _G.AutoXmas_Hop then
                                Hop()
                            end
                        end
                    end
                end)
            end
        end
    end)

    Misc:AddSeperator("Server")

    Misc:AddButton("Rejoin Server", function()
        game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService("Players").LocalPlayer)
    end)

    Misc:AddButton("Server Hop", function()
        Hop()
    end)

    Misc:AddButton("Hop To Lower Player", function()
        getgenv().AutoTeleport = true
        getgenv().DontTeleportTheSameNumber = true
        getgenv().CopytoClipboard = false
        if not game:IsLoaded() then
            print("Game is loading waiting...")
        end
        local maxplayers = math.huge
        local serversmaxplayer;
        local goodserver;
        local gamelink = "https://games.roblox.com/v1/games/" .. game.PlaceId ..
                             "/servers/Public?sortOrder=Asc&limit=100"
        function serversearch()
            for _, v in pairs(game:GetService("HttpService"):JSONDecode(game:HttpGetAsync(gamelink)).data) do
                if type(v) == "table" and v.playing ~= nil and maxplayers > v.playing then
                    serversmaxplayer = v.maxPlayers
                    maxplayers = v.playing
                    goodserver = v.id
                end
            end
        end
        function getservers()
            serversearch()
            for i, v in pairs(game:GetService("HttpService"):JSONDecode(game:HttpGetAsync(gamelink))) do
                if i == "nextPageCursor" then
                    if gamelink:find("&cursor=") then
                        local a = gamelink:find("&cursor=")
                        local b = gamelink:sub(a)
                        gamelink = gamelink:gsub(b, "")
                    end
                    gamelink = gamelink .. "&cursor=" .. v
                    getservers()
                end
            end
        end
        getservers()
        if AutoTeleport then
            if DontTeleportTheSameNumber then
                if #game:GetService("Players"):GetPlayers() - 4 == maxplayers then
                    return warn("It has same number of players (except you)")
                elseif goodserver == game.JobId then
                    return warn("Your current server is the most empty server atm")
                end
            end
            game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, goodserver)
        end
    end)

    Misc:AddSeperator("Codes")

    CodesData = {}

    for i, v in pairs(game:GetService("Players").LocalPlayer.CodeData:GetChildren()) do
        table.insert(CodesData, v.Name)
    end

    Misc:AddButton("Redeem All Codes", function()
        for i, v in pairs(CodesData) do
            game:GetService("ReplicatedStorage").CodeEnter:FireServer(v, game:GetService("Players").LocalPlayer
                .PlayerGui:FindFirstChild("New Gui Image").CodeGUI.TextBox)
        end
    end)

    Misc:AddSeperator("Character")

    Misc:AddToggle("NoClip", _G.NoClip, function(value)
        _G.NoClip = value
    end)

    Misc:AddToggle("Fly", false, function(value)
        Fly = value
    end)

    spawn(function()
        while wait() do
            pcall(function()
                if Fly then
                    fly()
                end
            end)
        end
    end)
else
    game.Players.LocalPlayer:Kick(
        "\224\185\132\224\184\161\224\185\136\224\184\158\224\184\154\224\185\129\224\184\161\224\184\158")
    wait(1)
    game:Shutdown()
end
