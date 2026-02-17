---
title: Spotify
theme:
    name: catppuccin-frappe
---

<!-- font_size: 2 -->
Envelope
---
<!-- incremental_lists: true -->
- 500k users -> 30 million songs.
- Audio formats:  Ogg (Mobile/Desktop) AAC(Web) 
    - 64kbps for mobile data saving
    - 128kbps for standard quality
    - 320kbps for premium users

<!-- end_slide -->

<!-- font_size: 2 -->
Basic Data
---

<!-- incremental_lists: true -->
- Song storage: 3MB × 30M songs ≈ 90TB of raw audio data
- Song metadata: At roughly 100 bytes per song × 30M songs ≈ 3GB
- Daily bandwidth:  3.5 Minuten (AVG) at 128-160kbps -> 3-4MB per stream -> 15 Songs / User -> 30 Terrabite / Day

<!-- new_lines: 3 -->
<!-- end_slide -->

<!-- font_size: 2 -->
Datenarten
---

<!-- incremental_lists: true -->
- Apache Casandra
    - Scalability
    - Excellent for handling huge amounts of writes (like millions of users updating playlists simultaneously)

- Postgress: 
    - Important for Payments (Transactions)

- Audio Storage: 
    - Google Cloud Storage / S3
    - Object Storage

<!-- end_slide -->

<!-- font_size: 1 -->
Audio Streaming
---

- Chunking
- Audio file is split into small chunks.
- The player downloads the first few chunks immediately so playback starts instantly (low latency), then buffers the rest in the background

<!-- end_slide -->

<!-- font_size: 2 -->
Warum Zopfli nutzen?
---

<!-- incremental_lists: true -->
- Anwendungsfall: "Write Once, Read Many".
- Beispiele: 
    - Statische Assets im Web (CSS, JS, PNGs).
    - Software-Updates.
    - Langzeit-Archivierung.
