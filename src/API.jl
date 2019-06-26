module API # TwitchTools

using HTTP: HTTP
using Dates: Dates, Date, DateTime, DateFormat

env = Dict(
    :debug_mode => true
)

const RFC3339 = DateFormat("yyyy-mm-dd\\THH:MM:SSZ")

function get_clip(client_id::String, clip_id::String)::Vector{UInt8}
    url = "https://api.twitch.tv/helix/clips"
    query = Dict{String,String}("id" => clip_id)
    resp = HTTP.get(url, ["Client-ID"=>client_id]; query=query)
    if env[:debug_mode]
        @info :get_clip (clip_id, length(resp.body))
    end
    resp.body
end

function get_clips_by_broadcaster(client_id::String,
                                  broadcaster_id::Int,
                                  started_at::Union{Missing, Date, DateTime},
                                  ended_at::Union{Missing, Date, DateTime}# started_at + 1 week
                                  )::Vector{UInt8}
    url = "https://api.twitch.tv/helix/clips"
    query = Dict{String,String}("broadcaster_id" => string(broadcaster_id))
    if !ismissing(started_at)
        query["started_at"] = Dates.format(started_at, RFC3339)
    end
    if !ismissing(ended_at)
        query["ended_at"] = Dates.format(ended_at, RFC3339)
    end
    resp = HTTP.get(url, ["Client-ID"=>client_id]; query=query)
    if env[:debug_mode]
        @info :get_clips_by_broadcaster (broadcaster_id, length(resp.body))
    end
    resp.body
end

end # TwitchTools.API
