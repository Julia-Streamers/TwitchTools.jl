# TwitchTools.jl

|  **Build Status**                                                |
|:----------------------------------------------------------------:|
|  [![][travis-img]][travis-url]  [![][codecov-img]][codecov-url]  |


https://dev.twitch.tv/docs/

```julia
using TwitchTools.API
client_id = get(ENV, "TWITCH_CLIENT_ID", "")
clip = API.get_clip(client_id, "LittleGrossSoybeanHassanChop")
@info clip
@info clip.data[1].broadcaster_name

using TwitchTools.APIv5
clip = APIv5.get_clip(client_id, "LittleGrossSoybeanHassanChop")
@info clip
@info clip.broadcaster.display_name
```


[travis-img]: https://api.travis-ci.org/wookay/TwitchTools.jl.svg?branch=master
[travis-url]: https://travis-ci.org/wookay/TwitchTools.jl

[codecov-img]: https://codecov.io/gh/wookay/TwitchTools.jl/branch/master/graph/badge.svg
[codecov-url]: https://codecov.io/gh/wookay/TwitchTools.jl/branch/master
