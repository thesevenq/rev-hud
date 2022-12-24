
-- RegisterNetEvent('revolucija_pancirSave:setPancir/health')
-- AddEventHandler('revolucija_pancirSave:setPancir/health', function(health, armour)
--     ESX.SetTimeout(5000, function()
--         if tonumber(health) > 10 then
--             SetEntityHealth(PlayerPedId(), tonumber(health))
--             Wait(111)
--             SetPedArmour(PlayerPedId(), tonumber(armour))
--             spasiii = true
--         else
--             SetEntityHealth(PlayerPedId(), 30)
--             Wait(111)
--             SetPedArmour(PlayerPedId(), tonumber(armour))
--             spasiii = true
--         end
--     end)
-- end)

CreateThread(function()
    while true do
		Citizen.Wait(300)
		if IsPedOnFoot(PlayerPedId()) then 
			DisplayRadar(false)
		elseif IsPedInAnyVehicle(PlayerPedId(), true) then
			DisplayRadar(true)
			SetRadarZoom(1100)
		end
    end
end)

CreateThread(function()
	SetMapZoomDataLevel(0, 0.96, 0.9, 0.08, 0.0, 0.0) -- Level 0
	SetMapZoomDataLevel(1, 1.6, 0.9, 0.08, 0.0, 0.0) -- Level 1
	SetMapZoomDataLevel(2, 8.6, 0.9, 0.08, 0.0, 0.0) -- Level 2
	SetMapZoomDataLevel(3, 12.3, 0.9, 0.08, 0.0, 0.0) -- Level 3
	SetMapZoomDataLevel(4, 22.3, 0.9, 0.08, 0.0, 0.0) -- Level 4
	RequestStreamedTextureDict("circlemap", false)
	while not HasStreamedTextureDictLoaded("circlemap") do
		Wait(100)
	end
  
	AddReplaceTexture("platform:/textures/graphics", "radarmasksm", "circlemap", "radarmasksm")
  
	SetMinimapClipType(1)
	SetMinimapComponentPosition('minimap', 'L', 'B', -0.0085, -0.020, 0.148, 0.251)
	SetMinimapComponentPosition('minimap_mask', 'L', 'B', -0.005, 0.012, 0.205, 0.292)
	SetMinimapComponentPosition('minimap_blur', 'L', 'B', -0.005, 0.012, 0.205, 0.292)
  
	local minimap = RequestScaleformMovie("minimap")
  
	SetRadarBigmapEnabled(true, false)
	Wait(0)
	SetRadarBigmapEnabled(false, false)
	BeginScaleformMovieMethod(minimap, "SETUP_HEALTH_ARMOUR")
	ScaleformMovieMethodAddParamInt(3)
	EndScaleformMovieMethod()
	while true do
		Wait(600)
		BeginScaleformMovieMethod(minimap, "SETUP_HEALTH_ARMOUR")
		ScaleformMovieMethodAddParamInt(3)
		EndScaleformMovieMethod()
		if IsBigmapActive() or IsBigmapFull() then
			SetBigmapActive(false, false)
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(3000)
		entity = PlayerPedId()
		ped = PlayerPedId()
		HideHudComponentThisFrame(21)
		HideHudComponentThisFrame(22)
		hp = GetEntityHealth(entity)/2
		pancir = GetPedArmour(entity)
		stamina = 100 - GetPlayerSprintStaminaRemaining(PlayerId())

		TriggerEvent('esx_status:getStatus', 'hunger', function(status)
			hrana = status.getPercent()
		end)

		TriggerEvent('esx_status:getStatus', 'thirst', function(status)
			voda = status.getPercent()
		end)

		nui_poruka = {
			action = "hudcina",
			hp = hp,
			pancir = pancir,
			hrana = hrana,
			voda = voda,
			stamina = stamina
		}
		SendNUIMessage(nui_poruka)
	end

end)


   
CreateThread(function()
   	while true do
		Wait(5)
	   	HideHudComponentThisFrame(3) -- CASH
	   	HideHudComponentThisFrame(4) -- MP CASH
	   	HideHudComponentThisFrame(2) -- weapon icon
	   	HideHudComponentThisFrame(9) -- STREET NAME
	   	HideHudComponentThisFrame(7) -- Area NAME
	   	HideHudComponentThisFrame(8) -- Vehicle Class
	   	HideHudComponentThisFrame(6) -- Vehicle Name
   	end
end)

