module test_twitchtools_api

using Test
using TwitchTools: API, APIv5

@test API.get_clip isa Function
@test API.get_clips_by_broadcaster isa Function
@test APIv5.get_clip isa Function

using Bukdu
struct ClipController <: ApplicationController
    conn::Conn
end

function clips(::ClipController)
    render(JSON, (a=1,))
end

routes() do
    get("/helix/clips", ClipController, clips)
    get("/kraken/clips/:clipid", ClipController, clips)
end

Bukdu.start(8080)

using HTTP
const local_api_server = HTTP.URI("http://localhost:8080/")

API.get_clip("client_id", "clip_id"; server=local_api_server)
API.get_clips_by_broadcaster("client_id", 0, nothing, nothing; server=local_api_server)
APIv5.get_clip("client_id", "clip_id"; server=local_api_server)

Bukdu.stop()

function mock_action(server, path, headers=[], query=nothing)
    if query !== nothing
        path = string(merge(HTTP.URI(path), query=query))
    end
    Router.call(get, path, headers).resp
end

API.get_clip("client_id", "clip_id"; action=mock_action)
API.get_clips_by_broadcaster("client_id", 0, nothing, nothing; action=mock_action)
APIv5.get_clip("client_id", "clip_id"; action=mock_action)

end # module test_twitchtools_api
