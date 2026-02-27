---
theme: default
title: All About Kafka
author: deadmade
class: text-left
transition: slide-left
mdc: true
---

<div class="section-break">
  <div>
    <h1>Apache Kafka</h1>
  </div>
</div>

---

# Organisatorisches

<div class="grid grid-cols-2 gap-8 items-center mt-4">
  <div>
    <ul>
      <li>Podcast: <strong>All About Kafka</strong></li>
      <li>Mara + Manuel</li>
    </ul>

  </div>
  <div class="text-center">
    <img src="/images/go-time-original.png" alt="GoTime podcast" class="max-h-70 mx-auto rounded-xl shadow-lg" />
  </div>
</div>

<!--
Changelog, GoTime Episode 299 mit Matthew Boyle, Jon Calhoun, Kris Brandow.
Manuel: Kafka-Aufbau, Mara: Kafka Use Cases.
-->

---
layout: center
---

# Wieso lohnt es sich zuzuhören?

## **80 % der Fortune-100-Unternehmen nutzen Kafka**

<div class="logo-grid">
  <img src="/images/formatted/linkedin.png" alt="LinkedIn" />
  <img src="/images/formatted/cloudfare.png" alt="Cloudflare" />
  <img src="/images/formatted/airbnb.png" alt="Airbnb" />
</div>

<!--
Fortune 100 = 100 Firmen mit dem größten Einkommen in den USA.
-->

---
layout: center
---

<SectionBreak
  title="Publish / Subscribe"
  subtitle="Vom Problem klassischer Systeme zur Kafka-Denkweise"
/>

---

# Publish/Subscribe

<PublishSubscribeStepNative :step="1" />

---

# Publish/Subscribe

<PublishSubscribeStepNative :step="2" />

---

# Publish/Subscribe

<PublishSubscribeStepNative :step="3" />

---

# Publish/Subscribe

<PublishSubscribeStepNative :step="4" />

---

# Kafka

<v-clicks>

- Publish/Subscribe-Messaging-System
- Daten werden dauerhaft und in richtiger Reihenfolge gespeichert
- Nachrichten sind deterministisch lesbar
- Daten können auf mehrere Systeme verteilt werden

</v-clicks>

<!--
Kafka = distributed commit log / distributed streaming platform.
Durable Speicherung mit Recovery über Logs.
-->

---

# Kafka im Überblick

<KafkaFlowNative />

---

# Messages

<v-clicks>

- Dateineinheit = **Message**
- Message = Byte-Array (kein festes Format)
- Optionaler Message Key = Byte-Array
- Offset identifiziert Position in der Partition

</v-clicks>

<!--
Vergleichbar mit row/record in einer Datenbank.
Kafka ist Format von Nachricht/Key egal.
-->

---

# Topics

<v-clicks>

- Topic ist grob vergleichbar mit einer Datenbanktabelle
- Jedes Topic hat mehrere Partitionen
- Ein Topic kann über mehrere Server verteilt sein

</v-clicks>

---

# Partition

<v-clicks>

- Kleinste Speichereinheit in Kafka
- Append-only Log-Datei mit chronologischem Schreibverlauf
- Message Key kann die Partition bestimmen
- Reihenfolge gilt strikt **pro Partition**, nicht pro Topic
- Einmal geschriebene Daten sind unveränderlich

</v-clicks>

---

# Topics am Beispiel

<img src="/images/partition-topic.png" alt="Topic Partition example" class="max-h-102 mx-auto" />

---

# Batches

<v-clicks>

- Menge an Messages pro Topic und Partition
- Verbessert Speicher- und Netzwerkeffizienz
- Trade-off zwischen Latenz und Throughput

</v-clicks>

---

# Schemas

<v-clicks>

- Konsistentes Datenformat ermöglicht stabile Kommunikation
- Versionierung verhindert Breaking Changes bei Producer/Consumer
- Schemas liegen oft in einem zentralen Registry-System

</v-clicks>

---

# Schema-Formate

<v-clicks>

- JSON
- XML
- Apache Avro

</v-clicks>

---

# Apache Avro

<v-clicks>

- JSON-orientiert, aber effizient für Big-Data-Workloads
- Besteht aus Schema + kompakter Binary Data
- Writer: Schema + Data -> Binary
- Reader: Schema + Binary -> Data

</v-clicks>

---
layout: center
---

<SectionBreak
  title="Producers & Consumers"
  subtitle="Wie Daten geschrieben, gelesen und skaliert werden"
/>

---

# Producers

<v-clicks>

- Erstellen neue Messages
- Wählen das Ziel-Topic
- Bestimmen optional die Ziel-Partition
- Auch bekannt als *publishers* oder *writers*

</v-clicks>

---

# Consumers

<v-clicks>

- Subscriben Topics und lesen Nachrichten in Erstellungsreihenfolge
- Speichern Offsets, um keine Nachricht doppelt zu verarbeiten
- Können jederzeit neu starten und an derselben Stelle fortsetzen
- Auch bekannt als *subscribers* oder *readers*

</v-clicks>

---

# Consumer Group

<v-clicks>

- Mehrere Consumer arbeiten als Gruppe
- Eine Partition wird nur von einem Consumer der Gruppe gelesen
- Skalierung erfolgt über mehr Consumer und Partitionen

</v-clicks>

---
layout: two-cols
---

# Consumer Group: Rebalancing

::left::
<v-clicks>

- Consumer können horizontal skaliert werden
- Fällt ein Consumer aus, werden Partitionen neu verteilt
- Ziel: Last verteilen und Ausfälle abfangen

</v-clicks>

::right::
<ConsumerRebalanceNative />

---
layout: center
---

<SectionBreak
  title="Brokers & Clusters"
  subtitle="Verfügbarkeit, Replikation und Datenhaltung im Betrieb"
/>

---

# Brokers

<v-clicks>

- Broker = ein Kafka-Server
- Nimmt Nachrichten an, vergibt Offsets und speichert sie
- Liefert Messages an Consumer aus
- Kann tausende Partitionen und sehr hohe Durchsätze verarbeiten

</v-clicks>

---

# Clusters

<v-clicks>

- Broker sind für den Clusterbetrieb ausgelegt
- Ein Broker agiert als Controller
- Controller überwacht Broker-Ausfälle und Partition-Zuteilung
- Jede Partition hat einen Leader-Broker
- Replikation erhöht Ausfallsicherheit

</v-clicks>

---

# Cluster-Architektur

<img src="/images/Cluster.png" alt="Kafka Cluster" class="max-h-105 mx-auto" />

---

# Retention

<RetentionModeNative />

---

# Sources

1. Apache Kafka "Powered By" page: https://kafka.apache.org/powered-by/
2. Kafka: The Definitive Guide (Neha Narkhede, Gwen Shapira, Todd Palino, O'Reilly, 2017), ISBN 978-1-491-93616-0
3. Slidev-native animation components in this repository (`components/*.vue`)
