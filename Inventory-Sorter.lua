local InputKey = "Q" -- Use capital please Enum.KeyCode takes capitals only!
local SortedList = {} -- Put items in sorted order in this list

game:GetService("UserInputService").InputBegan:Connect(function(input, Typing)
    if Typing then return end
    
    if input.KeyCode == Enum.KeyCode[InputKey] then
        local toolsToSort = {}

        for _, itemName in ipairs(SortedList) do
            for _, tool in ipairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                if tool:IsA("Tool") and string.lower(tool.Name):find(string.lower(itemName)) then
                    table.insert(toolsToSort, tool)
                    break
                end
            end
        end

        for _, tool in ipairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
            if tool:IsA("Tool") then
                tool.Parent = nil
            end
        end

        for _, tool in ipairs(toolsToSort) do
            tool.Parent = game.Players.LocalPlayer.Backpack
        end

    end
end)
