# module TwitchTools

using HTTP: HTTP

const TWITCH_API_SERVER = HTTP.URI("https://api.twitch.tv/")

function http_action(endpoint::HTTP.URI, path::String, headers::Vector{Pair{String,String}}=[], query::Union{Nothing,Dict{String,String}}=nothing)
    url = string(merge(endpoint, path=path))
    HTTP.get(url, headers; query=query)
end

# module TwitchTools
