CREATE OR REPLACE TABLE APPLE_MUSIC_DB.GOLD.gold_top_songs AS
SELECT
    song_name,
    ROUND(SUM(play_duration_ms) / 60000, 2) AS minutes_listened,
    COUNT(*) AS play_count
FROM APPLE_MUSIC_DB.SILVER.silver_apple_music_play_activity
WHERE play_duration_ms > 0
GROUP BY song_name
ORDER BY minutes_listened DESC;
