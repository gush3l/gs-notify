function getIcon(type)
    if type == "info" then
        return Config.notificationTypes.Info.Icon
    elseif type == "warn" then
        return Config.notificationTypes.Warn.Icon
    elseif type == "error" then
        return Config.notificationTypes.Error.Icon
    elseif type == "default" then
        return Config.notificationTypes.Default.Icon
    else
        return Config.notificationTypes.Default.Icon
    end
end

function getColor(type)
    if type == "info" then
        return Config.notificationTypes.Info.Color
    elseif type == "warn" then
        return Config.notificationTypes.Warn.Color
    elseif type == "error" then
        return Config.notificationTypes.Error.Color
    elseif type == "default" then
        return Config.notificationTypes.Default.Color
    else
        return Config.notificationTypes.Default.Color
    end
end

function getSound(type)
    if type == "info" then
        return Config.notificationTypes.Info.Sound
    elseif type == "warn" then
        return Config.notificationTypes.Warn.Sound
    elseif type == "error" then
        return Config.notificationTypes.Error.Sound
    elseif type == "default" then
        return Config.notificationTypes.Default.Sound
    else
        return Config.notificationTypes.Default.Sound
    end
end

function SendNotify(title, content, duration, type)
    local icon = getIcon(type)
    local color = getColor(type)
    local sound = getSound(type)
    SendNUIMessage(
        {
            title = title or "",
            content = content,
            duration = duration or 5000,
            icon = icon,
            color = color,
            sound = sound,
        }
    )
end

RegisterNetEvent('gs-notify:SendNotification')
AddEventHandler('gs-notify:SendNotification', function(title, content, duration, type)
    SendNotify(title, content, duration, type)
end)

RegisterCommand("gsnotify", function(source)
    TriggerEvent("gs-notify:SendNotification", "Informatie", "Aceasta notificare contine o informatie si este albastra!", 5000, "info")
    Citizen.Wait(1000)
    TriggerEvent("gs-notify:SendNotification", "Atentie", "Aceasta notificare contine o avertizare si este portocalie!", 5000, "warn")
    Citizen.Wait(1000)
    TriggerEvent("gs-notify:SendNotification", "Eroare", "Aceasta notificare contine o eroare si este rosie!", 5000, "error")
    Citizen.Wait(1000)
    TriggerEvent("gs-notify:SendNotification", "", "Aceasta notificare contine un mesaj fara titlu si este gri!", 5000, "default")
end, false)

-- COMPATIBILITY FOR OTHER NOTIFY SCRIPTS - EVENTS AND FUNCTIONS - YOU CAN JUST REMOVE EVERYTHING BELOW IF NOT NEEDED

-- -------------------------
-- okokNotify
-- okokNotify
-- okokNotify
-- -------------------------

-- function Alert(title, message, time, type)
--     SendNotify(title, message, time, type)
-- end

-- RegisterNetEvent('okokNotify:Alert')
-- AddEventHandler('okokNotify:Alert', function(title, message, time, type)
--     Alert(title, message, time, type)
-- end)

-- -------------------------
-- pNotify
-- pNotify
-- pNotify
-- -------------------------

-- function SendNotification(options)
--     SendNotify(options.docTitle, options.text, options.timeout, options.type)
-- end

-- RegisterNetEvent("pNotify:SendNotification")
-- AddEventHandler("pNotify:SendNotification", function(options)
--     SendNotify(options.docTitle, options.text, options.timeout, options.type)
-- end)

-- -------------------------
-- t-notify
-- t-notify
-- t-notify
-- -------------------------

-- function Alert(data)
--     SendNotify("", data.message, data.duration, data.style)
-- end

-- function Custom(data)
--     SendNotify(data.title, data.message, data.duration, data.style)
-- end


-- RegisterNetEvent('t-notify:client:Alert')
-- AddEventHandler('t-notify:client:Alert', function(data)
--     SendNotify("", data.message, data.duration, data.style)
-- end)

-- RegisterNetEvent('t-notify:client:Custom')
-- AddEventHandler('t-notify:client:Custom', function(data)
--     SendNotify(data.title, data.message, data.duration, data.style)
-- end)

-- -------------------------
-- b1g_notify
-- b1g_notify
-- b1g_notify
-- -------------------------

-- RegisterNetEvent('b1g_notify:client:Notify')
-- AddEventHandler('b1g_notify:client:Notify', function(data)
--     SendNotify("",data.text,5000,data.type)
-- end)

-- function Notify(type, text)
--     SendNotify("",data.text,5000,data.type)
-- end

-- -------------------------
-- esx_notify
-- esx_notify
-- esx_notify
-- -------------------------

-- function Notify(notificatonType, length, message)
--     SendNotify("",message,length,notificatonType)
-- end

-- RegisterNetEvent("ESX:Notify", Notify)

-- -------------------------
-- mythic_notify
-- mythic_notify
-- mythic_notify
-- -------------------------

-- RegisterNetEvent("mythic_notify:client:SendAlert")
-- AddEventHandler("mythic_notify:client:SendAlert", function(data)
--     SendNotify("", data.text, 5000, data.type)
-- end)

-- function DoShortHudText(type, text)
--     SendNotify("", text, 5000, type)
-- end

-- function DoHudText(type, text)
--     SendNotify("", text, 5000, type)
-- end

-- function DoLongHudText(type, text)
--     SendNotify("", text, 5000, type)
-- end

-- function DoCustomHudText(type, text, length)
--     SendNotify("", text, length, type)
-- end