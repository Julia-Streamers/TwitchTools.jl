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
    get("/clips", ClipController, clips)
    get("/clips/:clipid", ClipController, clips)
end

Bukdu.start(8080)

API.get_clip("client_id", "clip_id"; url="http://localhost:8080/clips")
broadcaster_id = 0
API.get_clips_by_broadcaster("client_id", broadcaster_id, nothing, nothing; url="http://localhost:8080/clips")

clip_id = "clip_id"
APIv5.get_clip("client_id", clip_id; url="http://localhost:8080/clips/$clip_id")

Bukdu.stop()

end # module test_twitchtools_api
