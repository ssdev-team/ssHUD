

if CLIENT then
    surface.CreateFont("Default_font", {
        font = "Roboto", --  Use the font-name which is shown to you by your operating system Font Viewer, not the file name
        extended = false,
        size = 16
    })

    surface.CreateFont("NameWeapon_font", {
        font = "Roboto", --  Use the font-name which is shown to you by your operating system Font Viewer, not the file name
        extended = false,
        size = 12
    })
end

    print("[SSHUD] Loading of cl_hud.lua completed.")

    k = { "DarkRP_HUD", "CHudBattery", "CHudHealth", "CHudAmmo", "CHudSecondaryAmmo" }

 hook.Add( "HUDShouldDraw", "HideHUD", function( v )
    if table.HasValue( k, v ) then return false end
 end)

    local BulletProof = Material("bulletproof.png")
    local Heart = Material("heart-rate.png")
    local Money = Material("money.png")
    local Burger = Material("burger.png")

    local function Base()
        local ply = LocalPlayer()
        local health = LocalPlayer():Health()
        local armor = LocalPlayer():Armor()
        local hunger = math.ceil(LocalPlayer():getDarkRPVar("Energy") or 0)
        
        if !ply:Alive() then
            return
        end


        if health < 1 then
            health = -1
        elseif health > 100 then
            health = 100
        end


        if armor < 1 then
            armor = 0

        elseif armor > 99 then
            armor = 100
        end


        if hunger < 1 then
                hunger = -1
        elseif hunger > 99 then
                hunger = 103
        end
        

        if (GAMEMODE.Config.hungerspeed) then
         
        surface.SetDrawColor(255, 255, 255, 255)

        draw.RoundedBox(3, ScrW() * 0.004, ScrH() - 108, 109, 23, Color(20, 20, 20, 220))
        draw.RoundedBox(3, ScrW() * 0.0057, ScrH() - 106, 104, 19, Color(48, 48, 47, 170))
        draw.DrawText(DarkRP.formatMoney(ply:getDarkRPVar("money")), "Default_font", 60, ScrH() - 105, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

        draw.RoundedBox(3, ScrW() * 0.004, ScrH() - 82, 109, 24, Color(20, 20, 20, 220))
        draw.RoundedBox(3, ScrW() * 0.0057, ScrH() - 80, 104, 20, Color(48, 48, 47, 170))
        draw.RoundedBox(3, ScrW() * 0.0057, ScrH() - 80, health * 1.10 - 6, 20, Color(255, 0, 0))

        draw.RoundedBox(3, ScrW() * 0.004, ScrH() - 55, 109, 24, Color(20, 20, 20, 220))
        draw.RoundedBox(3, ScrW() * 0.0057, ScrH() - 53, 104, 20, Color(48, 48, 47, 170))
         
		        if armor < 1 then
		            draw.RoundedBox(3, ScrW() * 0.0057, ScrH() - 53, armor, 20, Color(41, 11, 214))
		        elseif armor > 1 then
		            draw.RoundedBox(3, ScrW() * 0.0057, ScrH() - 53, armor + 3, 20, Color(41, 11, 214))
		        end
         
		        draw.RoundedBox(3, ScrW() * 0.004, ScrH() - 28, 109, 24, Color(20, 20, 20, 220))
		        draw.RoundedBox(3, ScrW() * 0.0057, ScrH() - 26, 104, 20, Color(48, 48, 47, 170))
		        draw.RoundedBox(3, ScrW() * 0.0057, ScrH() - 26, hunger, 20, Color(224, 177, 20))

		        draw.RoundedBox(3, ScrW() * 0.929, ScrH() - 28, 109, 24, Color(20, 20, 20, 220))
		        draw.RoundedBox(3, ScrW() * 0.930, ScrH() - 26, 104.5, 20, Color(20, 20, 20, 170))

		        draw.RoundedBox(3, ScrW() * 0.929, ScrH() - 55, 109, 24, Color(20, 20, 20, 220))
		        draw.RoundedBox(3, ScrW() * 0.930, ScrH() - 53, 104.5, 20, Color(20, 20, 20, 170))

				        if (ply:GetActiveWeapon():GetPrintName() != nil) then
				            draw.SimpleText(ply:GetActiveWeapon():GetPrintName(), "NameWeapon_font", ScrW() - 110, ScrH() - 49, Color(255,255,255))
				        end

				        if (ply:GetActiveWeapon():Clip1() != -1) then
				            draw.SimpleText(ply:GetActiveWeapon():Clip1() .. "/" .. ply:GetAmmoCount(ply:GetActiveWeapon():GetPrimaryAmmoType()), "NameWeapon_font", ScrW() - 110, ScrH() - 22, Color(255,255,255,255), 0, 0)
				        else
			            draw.SimpleText(ply:GetAmmoCount(ply:GetActiveWeapon():GetPrimaryAmmoType()), "NameWeapon_font", ScrW() - 110, ScrH() - 22, Color(255,255,255,255), 0, 0)
			        end

				        if (ply:GetAmmoCount(ply:GetActiveWeapon():GetSecondaryAmmoType()) > 0 ) then
				            draw.SimpleText(ply:GetAmmoCount(ply:GetActiveWeapon():GetSecondaryAmmoType()), "NameWeapon_font", ScrW() - 110, ScrH() - 22, Color(255,255,255,255), 0, 0)
				        end

        else

        surface.SetDrawColor(255, 255, 255, 255)

        draw.RoundedBox(3, ScrW() * 0.004, ScrH() - 87, 110, 24, Color(20, 20, 20, 220))
        draw.RoundedBox(3, ScrW() * 0.0057, ScrH() - 85, 106, 20, Color(48, 48, 47, 170))
        draw.DrawText(DarkRP.formatMoney(ply:getDarkRPVar("money")), "Default_font", 58, ScrH() - 84, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

        draw.RoundedBox(3, ScrW() * 0.004, ScrH() - 60, 109, 24, Color(20, 20, 20, 220))
        draw.RoundedBox(3, ScrW() * 0.0057, ScrH() - 58, 106, 20, Color(48, 48, 47, 170))
        draw.RoundedBox(3, ScrW() * 0.0057, ScrH() - 58, health * 1.10 - 5, 20, Color(255, 0, 0))

        draw.RoundedBox(3, ScrW() * 0.004, ScrH() - 33, 109, 24, Color(20, 20, 20, 220))
        draw.RoundedBox(3, ScrW() * 0.0057, ScrH() - 31, 106, 20, Color(48, 48, 47, 170))
         
		        if armor < 1 then
		            draw.RoundedBox(3, ScrW() * 0.0057, ScrH() - 31, armor, 20, Color(41, 11, 214))
		        elseif armor > 1 then
		            draw.RoundedBox(3, ScrW() * 0.0057, ScrH() - 31, armor + 4, 20, Color(41, 11, 214))
		        end

		        draw.RoundedBox(3, ScrW() * 0.929, ScrH() - 55, 109, 24, Color(20, 20, 20, 220))
		        draw.RoundedBox(3, ScrW() * 0.930, ScrH() - 53, 104.5, 20, Color(20, 20, 20, 170))


				        if (ply:GetActiveWeapon():GetPrintName() != nil) then
				            draw.SimpleText(ply:GetActiveWeapon():GetPrintName(), "NameWeapon_font", 1492, ScrH() - 49, Color(255,255,255))
				        end

				        if (ply:GetActiveWeapon():Clip1() != -1) then
				            draw.SimpleText(ply:GetActiveWeapon():Clip1() .. "/" .. ply:GetAmmoCount(ply:GetActiveWeapon():GetPrimaryAmmoType()), "NameWeapon_font", 1492, ScrH() - 22, Color(255,255,255,255), 0, 0)
				        else
			            draw.SimpleText(ply:GetAmmoCount(ply:GetActiveWeapon():GetPrimaryAmmoType()), "NameWeapon_font", 1492, ScrH() - 22, Color(255,255,255,255), 0, 0)
			        end

				        if (ply:GetAmmoCount(ply:GetActiveWeapon():GetSecondaryAmmoType()) > 0 ) then
				            draw.SimpleText(ply:GetAmmoCount(ply:GetActiveWeapon():GetSecondaryAmmoType()), "NameWeapon_font", 1492, ScrH() - 22, Color(255,255,255,255), 0, 0)
				        end

        end

    end
    

hook.Add("HUDPaint", "DrawHUD", Base)
