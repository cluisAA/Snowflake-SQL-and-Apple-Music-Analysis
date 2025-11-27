CREATE OR REPLACE TABLE APPLE_MUSIC_DB.GOLD.gold_country_trend AS
SELECT
    ip_country_code,
    ROUND(SUM(play_duration_ms) / 60000, 2) AS total_minutes,
    COUNT(*) AS events
FROM APPLE_MUSIC_DB.SILVER.silver_apple_music_play_activity
WHERE ip_country_code IS NOT NULL
GROUP BY ip_country_code
ORDER BY total_minutes DESC;
