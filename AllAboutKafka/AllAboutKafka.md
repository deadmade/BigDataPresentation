---
title: All about Kafka
theme:
    name: catppuccin-frappe
---

<!-- font_size: 3 -->
Organisatorisches
---
<!-- column_layout: [2, 1] -->
<!-- column: 0 -->
- Podcast: All About Kafka
<!-- speaker_note: Changelog -> gotime 299 von Matthew Boyle, Jon Calhoun, Kris Brandow-->
- Mara + Manuel
<!-- speaker_note: ich -> Aufbau Kafka  Mara -> Kafka Use Cases -->

<!-- column: 1 -->
![](Images/go-time-original.png)

<!-- reset_layout -->

<!-- end_slide -->

<!-- font_size: 3 -->
Wieso Lohnt es sich zuzuhören?
---

<!-- alignment: center -->
**80 % der Fortune-100-Unternehmen nutzen Kafka**
<!-- speaker_note: Fortune 100 -> 100 firmen mit dem größten Einkommen in den USA -->



<!-- column_layout: [1, 1, 1] -->

<!-- column: 0 -->
![](Images/formatted/linkedin.png)

<!-- column: 1 -->
![](Images/formatted/cloudfare.png)

<!-- column: 2 -->
![](Images/formatted/airbnb.png)

<!-- reset_layout -->
<!-- end_slide -->

<!-- jump_to_middle -->

<!-- font_size: 5 -->
Public/Subscription
---
<!-- no_footer -->
<!-- end_slide -->

<!-- font_size: 3 -->
Public/Subscription
---
![](Images/Problem-Kafka-1.png)
<!-- end_slide -->

<!-- font_size: 3 -->
Public/Subscription
---
![](Images/Problem-Kafka-2.png)
<!-- end_slide -->

<!-- font_size: 3 -->
Public/Subscription
---
![](Images/Problem-Kafka-3.png)
<!-- end_slide -->

<!-- font_size: 3 -->
Public/Subscription
---
![](Images/Problem-Kafka-4.png)
<!-- end_slide -->

<!-- font_size: 3 -->
Kafka
---
- Publish/Subscribe-Messaging-System
<!-- speaker_note: Kafka = “distributed commit log" ||  “distributing streaming platform.” -->
- Daten werden dauerhaft und in Richtige reihenfolge gespeichert
<!-- speaker_note: Dateisystem || Datenbank speichern Daten durable sodass diese bei Problem wiederhergestellt werden können (DB Log) -->
- Können deterministisch gelesen werden
- Daten können im System verteilt werden
<!-- speaker_note: Bietet zusätzliche ausfallsicherheit + scaling-->
<!-- end_slide -->

<!-- font_size: 3 -->
Messages
---
- Dateineinheit = Message
<!-- speaker_note: Vergleichbar mit row/record in einer Datenbank -->
- Message = Byte-Array
    -> Kein Spezifisches Format
    -> Optionale Metadaten(Schlüssel) = Byte-Array
<!-- speaker_note: Kafka ist das Vormat der Nachricht oder Schlüssel komplett egal! -->
<!-- end_slide -->

<!-- font_size: 3 -->
Batches
---

<!-- end_slide -->


<!-- font_size: 3 -->
Sources
---
<!-- include: sources.md -->
<!-- end_slide -->
