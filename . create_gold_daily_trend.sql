CREATE OR REPLACE TABLE APPLE_MUSIC_DB.GOLD.gold_daily_trend AS
SELECT
    DATE(event_start_timestamp_tz) AS date_utc,
    ROUND(SUM(play_duration_ms) / 60000, 2) AS total_minutes,
    COUNT(*) AS events
FROM APPLE_MUSIC_DB.SILVER.silver_apple_music_play_activity
GROUP BY date_utc
ORDER BY date_utc;
