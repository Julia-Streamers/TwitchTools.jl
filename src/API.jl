module API # TwitchTools

using HTTP: HTTP

env = Dict(
    :debug_mode => true
)

function get_clip(client_id::String, clip_id::String)::Vector{UInt8}
    url = "https://api.twitch.tv/helix/clips?id=$clip_id"
    resp = HTTP.get(url, ["Client-ID"=>client_id])
    if env[:debug_mode]
        @info :get_clip (clip_id, length(resp.body))
    end
    resp.body
end

function get_clips_by_broadcaster(client_id::String, broadcaster_id::Int)::Vector{UInt8}
    url = "https://api.twitch.tv/helix/clips?broadcaster_id=$broadcaster_id"
    resp = HTTP.get(url, ["Client-ID"=>client_id])
    if env[:debug_mode]
        @info :get_clips_by_broadcaster (broadcaster_id, length(resp.body))
    end
    resp.body
end

end # TwitchTools.API
