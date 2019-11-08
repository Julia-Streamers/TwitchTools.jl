module APIv5 # TwitchTools

using HTTP: HTTP

env = Dict(
    :debug_mode => false
)

const TWITCH_API_SERVER = HTTP.URI("https://api.twitch.tv/")

function get_clip(client_id::String,
                  clip_id::String ;
                  server::HTTP.URI=TWITCH_API_SERVER)::Vector{UInt8}
    url = string(merge(server, path="/kraken/clips/$clip_id"))
    resp = HTTP.get(url, ["Client-ID"=>client_id, "Accept"=>"application/vnd.twitchtv.v5+json"])
    if env[:debug_mode]
        @info :get_clip (clip_id, length(resp.body))
    end
    resp.body
end

end # TwitchTools.APIv5
