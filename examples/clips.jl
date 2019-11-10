using TwitchTools.API
client_id = get(ENV, "TWITCH_CLIENT_ID", "")
clip = API.get_clip(client_id, "LittleGrossSoybeanHassanChop")
@info clip
@info clip.data[1].broadcaster_name

using TwitchTools.APIv5
clip = APIv5.get_clip(client_id, "LittleGrossSoybeanHassanChop")
@info clip
@info clip.broadcaster.display_name
