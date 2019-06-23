module test_twitchtools_api

using Test
using TwitchTools: API

@test API.get_clip isa Function
@test API.get_clips_by_broadcaster isa Function

end # module test_twitchtools_api
