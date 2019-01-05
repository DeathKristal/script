outputChatBox("Hallo das ist ein Test versuch")
outputChatBox("Willkommen auf CoA Reallife",getRootElement(),255,0,0)



function ouputPlayerName (player,cmd,farbe)
local pname = getPlayerName(player)
if not farbe then return false end
	if farbe == "rot" then
		outputChatBox(pname,getRootElement(),255,0,0)
	elseif farbe == "blau" then
		outputChatBox(pname,getRootElement(), 0, 0, 255)
	elseif farbe == "gruen" then
		outputChatBox(pname,getRootElement(), 0, 255, 0)
	else
		outputChatBox(pname)
	end
return true
end
addCommandHandler("pname", ouputPlayerName)


function outputPlayerNameOnEnter(player)
local pname = getPlayerName(player)
local vname = getVehicleName(source)
	outputChatBox(tostring(pname).." ist in ein " ..vname.." eingestiegen ")
end

function clientEffect(player)
	triggerClientEvent(player,"createClientEffect",getRootElement())

end
addCommandHandler("cce", clientEffect)

function onPlayerJoin()
local joinedPlayerName = getPlayerName(source)
local serverName = getServerName()
	outputChatBox(joinedPlayerName .." hat " .. serverName .." betreten!", source, 0,250,231)
end
addEventHandler("onPlayerJoin", getRootElement(), onPlayerJoin)

function onPlayerQuit(quitType)
local pname = getPlayerName(source)
	outputChatBox("Der Spieler ".. getPlayerName(source) .. "hat den Server verlassen (".. quitType .. ")" )
end
addEventHandler("onPlayerQuit", getRootElement(), onPlayerQuit)

fahrschulvehic = { [581]=true, [515]=true, [446]=true, [593]=true, [487]=true }
fahrschulskins = { [11]=true, [171]=true, [172]=true, }

function enterVehicle ( thePlayer, seat, jacked ) -- when a player enters a vehicle
    if ( fahrschulvehic[getElementModel ( source )] ) and ( not fahrschulskins[getElementModel ( thePlayer )] ) then -- if the vehicle is one of 4 police cars, and the skin is not a police skin
        removePedFromVehicle ( thePlayer ) -- force the player out of the vehicle
        outputChatBox ( "Du bist kein Fahrlehrer!", thePlayer, 255,0, 0 ) -- and tell the player why
    end
end
addEventHandler ( "onVehicleEnter", getRootElement(), enterVehicle )

addEventHandler("onVehicleEnter",getRootElement(),outputPlayerNameOnEnter)