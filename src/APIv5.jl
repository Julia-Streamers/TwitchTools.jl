module APIv5 # TwitchTools

using ..TwitchTools: HTTP, TWITCH_API_SERVER, http_action
using JSON2

function get_clip(client_id::String,
                  clip_id::String ;
                  endpoint::HTTP.URI = TWITCH_API_SERVER,
                  action::Function = http_action)
    headers = ["Client-ID"=>client_id, "Accept"=>"application/vnd.twitchtv.v5+json"]
    resp = action(endpoint, "/kraken/clips/$clip_id", headers)
    data = JSON2.read(IOBuffer(resp.body))
end

end # TwitchTools.APIv5
