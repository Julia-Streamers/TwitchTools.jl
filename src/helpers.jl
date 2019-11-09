# module TwitchTools

using HTTP: HTTP

const TWITCH_API_SERVER = HTTP.URI("https://api.twitch.tv/")

function http_action(server::HTTP.URI, path::String, headers::Vector{Pair{String,String}}=[], query::Union{Nothing,Dict{String,String}}=nothing)
    url = string(merge(server, path=path))
    HTTP.get(url, headers; query=query)
end

# module TwitchTools
