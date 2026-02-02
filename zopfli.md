---
title: Der Zopfli-Algorithmus
theme:
    name: catppuccin-frappe
---

<!-- font_size: 2 -->
Was ist Zopfli?
---
<!-- incremental_lists: true -->
- **Entwickler:** Google (Lode Vandevenne & Jyrki Alakuijala, 2013).
- **Ziel:** Die bestmögliche Kompression für das **Deflate-Format**.
- **Kompatibilität:** 
    * Erzeugt Standard-Dateien (.png, .gz, .zip).
    * Jeder Standard-Dekoder kann Zopfli-Dateien lesen.
- Archivierung: Oktober 2025
- 100% Verlustfrei

<!-- end_slide -->

<!-- font_size: 2 -->
Das Fundament: Das Deflate-Format
---

<!-- incremental_lists: true -->
- Kombinations-Algorithmus: Deflate verbindet zwei Techniken:
    1. **LZ77:** Eliminiert Duplikate durch Referenzen (Distanz/Länge).
    2. **Huffman:** Reduziert die Bit-Länge häufig vorkommender Zeichen.


<!-- new_lines: 3 -->
<!-- end_slide -->

<!-- font_size: 2 -->
Wie werden die Daten komprimiert?
---

<!-- incremental_lists: true -->
- Graph-Optimierung: Zopfli betrachtet alle möglichen LZ77-Kombinationen als Wege in einem Graphen.
- Shortest Path: Es berechnet den "kürzesten Pfad" (die kleinste Dateigröße) durch diesen Graphen.
- Rechenaufwand: 
    - Die Kompression dauert ca. **100x länger** als bei Standard-zlib.
    - Der Dekompressionsvorgang bleibt jedoch blitzschnell.
<!-- end_slide -->

<!-- font_size: 1 -->
Beispiel
---

<!-- column_layout: [2, 2] -->
<!-- column: 0 -->

## Zopfli
```python +exec
import subprocess
import time

def run_zopfli_cli(input_file):
    output_file = "compressed_via_cli.png"
    
    command = ["zopflipng", "-y", "--lossy_transparent", input_file, output_file]

    start_time = time.perf_counter()
    result = subprocess.run(command, capture_output=True, text=True, check=True)
    end_time = time.perf_counter()
        
    print(result.stdout)
    print(f"Total Time: {end_time - start_time:.4f} seconds")

run_zopfli_cli("image.png")






```

<!-- column: 1 -->

## Zlib

```python +exec
import time
import zlib

def run_standard_zlib(input_file):
    output_file = "compressed_zlib.dat"
    
    with open(input_file, "rb") as f:
        data = f.read()

    print(f"Original Size: {len(data) / 1024:.2f} KB")
    
    start_time = time.perf_counter()
    compressed_data = zlib.compress(data, level=9)
    end_time = time.perf_counter()
    
    new_size = len(compressed_data)
    savings = (1 - (new_size / len(data))) * 100
    
    print("-" * 30)
    print(f"Elapsed Time:  {end_time - start_time:.6f} seconds")
    print(f"New Size:      {new_size / 1024:.2f} KB")
    print(f"Reduction:     {savings:.2f}%")

run_standard_zlib("image.png")
```

<!-- reset_layout -->
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

