module test_twitchtools_api

using Test
using TwitchTools: API

@test API.get_clip isa Function

end # module test_twitchtools_api
