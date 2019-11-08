module APIv5 # TwitchTools

using HTTP: HTTP

env = Dict(
    :debug_mode => false
)

function get_clip(client_id::String,
                  clip_id::String;
                  url = "https://api.twitch.tv/kraken/clips/$clip_id")::Vector{UInt8}
    resp = HTTP.get(url, ["Client-ID"=>client_id, "Accept"=>"application/vnd.twitchtv.v5+json"])
    if env[:debug_mode]
        @info :get_clip (clip_id, length(resp.body))
    end
    resp.body
end

end # TwitchTools.APIv5
