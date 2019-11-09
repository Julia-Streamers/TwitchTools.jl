module API # TwitchTools

using ..TwitchTools: HTTP, TWITCH_API_SERVER, http_action
using Dates: Dates, Date, DateTime, DateFormat

const RFC3339 = DateFormat("yyyy-mm-dd\\THH:MM:SSZ")

function get_clip(client_id::String,
                  clip_id::String ;
                  server::HTTP.URI=TWITCH_API_SERVER,
                  action::Function=http_action)::Vector{UInt8}
    headers = ["Client-ID"=>client_id]
    query = Dict{String,String}("id" => clip_id)
    resp = action(server, "/helix/clips", headers, query)
    resp.body
end

function get_clips_by_broadcaster(client_id::String,
                                  broadcaster_id::Int,
                                  started_at::Union{Nothing, Date, DateTime},
                                  ended_at::Union{Nothing, Date, DateTime} ; # started_at + 1 week
                                  server::HTTP.URI=TWITCH_API_SERVER,
                                  action::Function=http_action)::Vector{UInt8}
    headers = ["Client-ID"=>client_id]
    query = Dict{String,String}("broadcaster_id" => string(broadcaster_id))
    if !isnothing(started_at)
        query["started_at"] = Dates.format(started_at, RFC3339)
    end
    if !isnothing(ended_at)
        query["ended_at"] = Dates.format(ended_at, RFC3339)
    end
    resp = action(server, "/helix/clips", headers, query)
    resp.body
end

end # TwitchTools.API
