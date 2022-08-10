fx_version 'adamant'
game 'gta5'

author "gush3l"
description "Simple and beautiful notify script with compatibility in syntax with most popular notify scripts!"
version '1.0.0'
ui_page "html/main.html"

lua54 'yes'

client_scripts {
    'client.lua',
    'config.lua'
}

files {
    'html/main.html',
    'html/js/*.js',
    'html/css/*.css',
    'html/js/sounds/*.ogg'
}

escrow_ignore {
  '*.lua'
}

export 'SendNotify'
-- export 'SendNotification'
-- export 'Alert'
-- export 'Notify'
-- export 'DoShortHudText'
-- export 'DoHudText'
-- export 'DoLongHudText'
-- export 'DoCustomHudText'