local network=(get_separate_remote and get_separate_remote'NetworkRemoteEvent')or
                game:Getservice'ReplicatedStorage'.NetworkRemoteEvent
local Counter=game:Getservice'Players'.LocalPlayer.PlayerGui.SceenGui.StatsFrame.Bubble.Amount
_G.run=not _G.run
while _G.run and wait()do
    local number=Counter.Text:split('/');
    local corrent,max=tonumber(number[1]),tonumber(number[2]);

    if corrent>=max then
        network:FireServer('Teleport','Sell');
        network:FireServer('SellBubble','Sell');
    end;
    network:FireServer('BlowBubble');
end;