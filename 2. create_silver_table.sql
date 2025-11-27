CREATE OR REPLACE TABLE APPLE_MUSIC_DB.SILVER.silver_apple_music_play_activity AS
SELECT
    TRY_TO_TIMESTAMP_TZ("Event Start Timestamp") AS event_start_timestamp_tz,
    TRY_TO_TIMESTAMP_TZ("Event End Timestamp") AS event_end_timestamp_tz,
    TRY_TO_TIMESTAMP_TZ("Event Timestamp") AS event_timestamp_tz,

    TRY_TO_NUMBER("Play Duration Milliseconds") AS play_duration_ms,
    TRY_TO_NUMBER("Media Duration In Milliseconds") AS media_duration_ms,

    "Song Name" AS song_name,
    "Album Name" AS album_name,
    "Container Artist Name" AS artist_name,
    "IP Country Code" AS ip_country_code,
    "Device OS Name" AS device_os,
    "Device Type" AS device_type,

    *
FROM APPLE_MUSIC_DB.RAW.apple_music_play_activity_raw
WHERE "Song Name" IS NOT NULL;
