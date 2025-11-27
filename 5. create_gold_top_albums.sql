CREATE OR REPLACE TABLE APPLE_MUSIC_DB.GOLD.gold_top_albums AS
SELECT
    album_name,
    ROUND(SUM(play_duration_ms) / 60000, 2) AS minutes_listened,
    COUNT(*) AS play_count
FROM APPLE_MUSIC_DB.SILVER.silver_apple_music_play_activity
WHERE album_name IS NOT NULL
GROUP BY album_name
ORDER BY minutes_listened DESC;
