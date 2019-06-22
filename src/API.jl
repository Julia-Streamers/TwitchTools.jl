module API # TwitchTools

using HTTP: HTTP

function get_clip(client_id::String, clip_id::String)::String
    url = "https://api.twitch.tv/helix/clips?id=$clip_id"
    HTTP.get(url, ["Client-ID"=>client_id])
end

end # TwitchTools.API
