# TwitchTools.jl

|  **Build Status**                 |
|:---------------------------------:|
|  [![][actions-img]][actions-url]  |


https://dev.twitch.tv/docs/

```julia
using TwitchTools.APIv5
client_id = get(ENV, "TWITCH_CLIENT_ID", "");
clip = APIv5.get_clip(client_id, "LittleGrossSoybeanHassanChop")
@info clip
@info clip.broadcaster.display_name
```


[actions-img]: https://github.com/Julia-Streamers/TwitchTools.jl/workflows/CI/badge.svg
[actions-url]: https://github.com/Julia-Streamers/TwitchTools.jl/actions
