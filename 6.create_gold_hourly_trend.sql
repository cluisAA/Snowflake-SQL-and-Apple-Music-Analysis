CREATE OR REPLACE TABLE APPLE_MUSIC_DB.GOLD.gold_hourly_trend AS
SELECT
    HOUR(event_start_timestamp_tz) AS hour_utc,
    ROUND(SUM(play_duration_ms) / 60000, 2) AS total_minutes,
    COUNT(*) AS events
FROM APPLE_MUSIC_DB.SILVER.silver_apple_music_play_activity
WHERE play_duration_ms > 0
GROUP BY hour_utc
ORDER BY hour_utc;
