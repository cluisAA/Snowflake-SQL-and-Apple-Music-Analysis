# 📊 Apple Music Listening Analytics  
### *A Snowflake + SQL + Apple Music Portfolio Project by Clive*

This project analyzes my **Apple Music listening history (15 years) ** using **Snowflake**, **SQL**, Python, and a structured **ELT pipeline** (RAW → SILVER → GOLD).  
The dataset comes from my **Apple Privacy Export**, containing detailed play activity, timestamps, device metadata, and playback metrics.

---

## ⭐ Sample Insight — Top 10 Songs by Real Listening Time

This is one sample insight produced from the analytics pipeline.  
It highlights the songs with the highest **real listening time**, not just number of plays.

| Rank | Song Name | Minutes Listened | Play Count |
|------|-----------|------------------|------------|
| 1 | All Aboard | 493.23 | 135 |
| 2 | Baby (feat. Ludacris) | 406.78 | 44 |
| 3 | Feeling Hot | 405.00 | 254 |
| 4 | Wheels on the Bus | 402.16 | 141 |
| 5 | How Many Kings | 368.76 | 450 |
| 6 | Old MacDonald | 362.89 | 137 |
| 7 | Tennessee Whiskey | 316.23 | 383 |
| 8 | Marvin Gaye (feat. Meghan Trainor) | 313.50 | 236 |
| 9 | Mysterious Girl | 306.13 | 115 |
| 10 | Here Comes the Fire Truck | 303.69 | 129 |

---

## 🚀 Tech Stack
- Snowflake — cloud data warehouse  
- SQL — transformations & analytics  
- Python — automated schema generation from CSV header  
- Apple Privacy Export — source dataset  
- ELT Architecture — RAW → SILVER → GOLD  

---

## 🧰 Python Automation (143 Columns → Snowflake Schema)

This script automatically converts the CSV header into Snowflake column definitions:

```python
import csv

with open("Apple Music Play Activity.csv") as f:
    header = next(csv.reader(f))
    for h in header:
        print(f'"{h}" VARCHAR,')
```

This output is pasted into:

```
CREATE TABLE apple_music_play_activity_raw (...)
```

This ensures scalable, reproducible RAW table creation.

---

## 🧱 SQL Model (Top Songs)

```sql
SELECT
    song_name,
    ROUND(SUM(play_duration_ms) / 60000, 2) AS minutes_listened,
    COUNT(*) AS play_count
FROM APPLE_MUSIC_DB.SILVER.silver_apple_music_play_activity
WHERE play_duration_ms > 0
  AND song_name IS NOT NULL
  AND media_duration_ms > 0
GROUP BY song_name
ORDER BY minutes_listened DESC
LIMIT 10;
```

---

## 🔄 ELT Architecture (RAW → SILVER → GOLD)

### RAW Layer  
Apple Music CSV → Snowflake Stage → RAW table  
Schema generated automatically using Python.

### SILVER Layer  
Cleaned & typed data:  
- timestamps normalized  
- durations validated  
- device metadata standardized  
- non-music rows removed  

### GOLD Layer  
Final analytical tables for insights:  
- Top Songs  
- Top Artists  
- Hourly Listening Patterns  
- UAE vs UK Listening  
- Daily Trends  

---

## 📂 Additional SQL Models (Inside /sql/ Folder)

- **Top Artists** — `sql/create_gold_top_artists.sql`  
- **Top Albums** — `sql/create_gold_top_albums.sql`  
- **Hourly Listening Trend** — `sql/create_gold_hourly_trend.sql`  
- **Daily Listening Trend** — `sql/create_gold_daily_trend.sql`  
- **UAE vs UK Listening** — `sql/create_gold_country_trend.sql`  
- **RAW Table Creation** — `sql/create_raw_table.sql`  
- **SILVER Table Creation** — `sql/create_silver_table.sql`  

---

## 🧩 Skills Demonstrated
- Automated schema creation (Python)  
- Snowflake ELT pipeline design  
- SQL modeling & data cleaning  
- Timezone handling  
- Analytical SQL (ranking, aggregation)  
- Professional documentation  

---

## 📄 How to Reproduce

1. Export your data from **privacy.apple.com**  
2. Run the Python script to generate schema  
3. Load CSV → Snowflake Stage → RAW table  
4. Run SILVER transformation  
5. Run GOLD analytical models  
6. Query results or build charts  

---

## 👤 Author
**Clive Luis AA**
