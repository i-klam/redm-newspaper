fx_version "adamant"
games {"rdr3"}
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'


lua54 'yes'

ui_page 'web/public/index.html'

author 'xFutte'
description 'News script'
version '1.0'

shared_script 'config.lua'

client_script {'client/**/*', '@PolyZone/client.lua', '@PolyZone/EntityZone.lua'}
server_script "server/**/*"

files {'web/public/index.html', 'web/public/**/*'}

server_exports {'CreateJailStory'}
