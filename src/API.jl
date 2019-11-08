module API # TwitchTools

using HTTP: HTTP
using Dates: Dates, Date, DateTime, DateFormat

env = Dict(
    :debug_mode => false
)

const RFC3339 = DateFormat("yyyy-mm-dd\\THH:MM:SSZ")

function _get_request(name::Symbol, client_id::String, url::String, query::Dict{String,String})::Vector{UInt8}
    resp = HTTP.get(url, ["Client-ID"=>client_id]; query=query)
    if env[:debug_mode]
        @info name, query, length(resp.body)
    end
    resp.body
end

function get_clip(client_id::String,
                  clip_id::String;
                  url = "https://api.twitch.tv/helix/clips")::Vector{UInt8}
    query = Dict{String,String}("id" => clip_id)
    _get_request(:get_clip, client_id, url, query)
end

function get_clips_by_broadcaster(client_id::String,
                                  broadcaster_id::Int,
                                  started_at::Union{Nothing, Date, DateTime},
                                  ended_at::Union{Nothing, Date, DateTime}; # started_at + 1 week
                                  url = "https://api.twitch.tv/helix/clips")::Vector{UInt8}
    query = Dict{String,String}("broadcaster_id" => string(broadcaster_id))
    if !isnothing(started_at)
        query["started_at"] = Dates.format(started_at, RFC3339)
    end
    if !isnothing(ended_at)
        query["ended_at"] = Dates.format(ended_at, RFC3339)
    end
    _get_request(:get_clips_by_broadcaster, client_id, url, query)
end

end # TwitchTools.API
