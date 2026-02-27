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

<div class="k-split">
  <div>
    <ul>
      <li>Publish/Subscribe-Messaging-System</li>
      <li>Dauerhafte Speicherung als Commit Log</li>
      <li>Deterministisch lesbar über Offsets</li>
      <li>Datenverteilung über mehrere Systeme</li>
    </ul>
  </div>
  <div class="k-visual-card">
    <img src="/Images/producer-consumer-kafka.png" alt="Kafka distributed log overview" class="max-h-72 mx-auto rounded-lg" />
  </div>
</div>

<!--
Kafka = distributed commit log / distributed streaming platform.
Durable Speicherung mit Recovery über Logs.
-->

---

# Kafka im Überblick

<KafkaFlowNative />

---

# Messages

<div class="k-split">
  <div>
    <ul>
      <li>Dateineinheit = <strong>Message</strong></li>
      <li>Message und Key sind Byte-Arrays</li>
      <li>Offset identifiziert die Position in der Partition</li>
    </ul>
  </div>
  <div class="k-visual-card">
    <img src="/images/message-structure.svg" alt="Kafka message structure with key, value and metadata" class="max-h-72 mx-auto rounded-lg" />
  </div>
</div>

<!--
Vergleichbar mit row/record in einer Datenbank.
Kafka ist Format von Nachricht/Key egal.
-->

---

# Topics

<div class="k-split">
  <div>
    <ul>
      <li>Topic ist grob vergleichbar mit einer Datenbanktabelle</li>
      <li>Jedes Topic hat mehrere Partitionen</li>
      <li>Partitionen können über mehrere Broker verteilt sein</li>
    </ul>
  </div>
  <div class="k-visual-card">
    <img src="/images/topic-partitions.png" alt="Kafka topic with multiple partitions" class="max-h-72 mx-auto rounded-lg" />
    <p class="k-figure-caption">Ein Topic skaliert horizontal über mehrere Partitionen.</p>
  </div>
</div>

---

# Partition

<div class="k-split">
  <div>
    <ul>
      <li>Kleinste Speichereinheit in Kafka</li>
      <li>Append-only Log mit chronologischem Verlauf</li>
      <li>Message Key kann die Zielpartition bestimmen</li>
      <li>Reihenfolge gilt strikt <strong>pro Partition</strong></li>
    </ul>
  </div>
  <div class="k-visual-card">
    <img src="/images/partition-ordering.png" alt="Ordering in a Kafka partition" class="max-h-72 mx-auto rounded-lg" />
    <p class="k-figure-caption">Nur innerhalb einer Partition bleibt die Reihenfolge garantiert.</p>
  </div>
</div>

---
layout: center
---

# Ordering Guarantee

<div class="k-visual-hero">
  <img src="/images/ordering-guarantee.svg" alt="Ordering guarantee per partition and not globally per topic" class="max-h-95 mx-auto" />
  <p class="k-figure-caption text-center">Globale Reihenfolge gibt es nicht. Garantiert ist nur die Reihenfolge innerhalb derselben Partition.</p>
</div>

---

# Topics am Beispiel

<img src="/images/partition-topic.png" alt="Topic Partition example" class="max-h-102 mx-auto" />

---

# Batches

<div class="k-split">
  <div>
    <ul>
      <li>Menge an Messages pro Topic und Partition</li>
      <li>Verbessert Speicher- und Netzwerkeffizienz</li>
      <li>Trade-off zwischen Latenz und Throughput</li>
    </ul>
  </div>
  <div class="k-visual-card">
    <img src="/images/batch-tradeoff.png" alt="Batch size tradeoff between latency and throughput" class="max-h-72 mx-auto rounded-lg" />
    <p class="k-figure-caption">Größere Batches steigern Throughput, erhöhen aber oft die Latenz.</p>
  </div>
</div>

---

# Schemas

<div class="k-split">
  <div>
    <ul>
      <li>Konsistentes Datenformat ermöglicht stabile Kommunikation</li>
      <li>Versionierung verhindert Breaking Changes bei Producer/Consumer</li>
      <li>Schemas liegen oft in einer zentralen Registry</li>
    </ul>
  </div>
  <div class="k-visual-card">
    <img src="/images/schema-registry-flow.png" alt="Schema registry flow between producers and consumers" class="max-h-72 mx-auto rounded-lg" />
    <p class="k-figure-caption">Schema Registry synchronisiert Producer- und Consumer-Versionen.</p>
  </div>
</div>

---

# Schema-Formate

<div class="k-icon-row">
  <div class="k-icon-item">
    <h3>JSON</h3>
    <p>Einfach, lesbar, weit verbreitet.</p>
  </div>
  <div class="k-icon-item">
    <h3>XML</h3>
    <p>Streng strukturiert, aber eher verbose.</p>
  </div>
  <div class="k-icon-item">
    <h3>Apache Avro</h3>
    <p>Kompakt, schema-basiert, performant.</p>
  </div>
</div>

---

# Apache Avro

<div class="k-split">
  <div>
    <ul>
      <li>JSON-orientiert, aber effizient für Big-Data-Workloads</li>
      <li>Besteht aus Schema + kompakter Binary Data</li>
      <li>Writer: Schema + Data -> Binary</li>
      <li>Reader: Schema + Binary -> Data</li>
    </ul>
  </div>
  <div class="k-visual-card">
    <img src="/images/avro-pipeline.svg" alt="Avro writer and reader pipeline" class="max-h-72 mx-auto rounded-lg" />
    <p class="k-figure-caption">Gleiches Schema-Verständnis reduziert Integrationsfehler.</p>
  </div>
</div>

---
layout: center
---

<SectionBreak
  title="Producers & Consumers"
  subtitle="Wie Daten geschrieben, gelesen und skaliert werden"
/>

---

# Producers

<div class="k-split">
  <div>
    <ul>
      <li>Erstellen neue Messages</li>
      <li>Wählen das Ziel-Topic</li>
      <li>Bestimmen optional die Ziel-Partition</li>
      <li>Auch bekannt als <em>publishers</em> oder <em>writers</em></li>
    </ul>
  </div>
  <div class="k-visual-card">
    <img src="/images/producer-partitioning.png" alt="Producer partitioning strategy" class="max-h-72 mx-auto rounded-lg" />
    <p class="k-figure-caption">Producer steuern über Key und Strategie, in welche Partition geschrieben wird.</p>
  </div>
</div>

---

# Consumers

<div class="k-split">
  <div>
    <ul>
      <li>Lesen Nachrichten in Erstellungsreihenfolge pro Partition</li>
      <li>Speichern Offsets für idempotente Verarbeitung</li>
      <li>Können jederzeit neu starten und fortsetzen</li>
      <li>Auch bekannt als <em>subscribers</em> oder <em>readers</em></li>
    </ul>
  </div>
  <div class="k-visual-card">
    <img src="/images/consumer-offset-commit.png" alt="Consumer offset commit and resume flow" class="max-h-72 mx-auto rounded-lg" />
    <p class="k-figure-caption">Offset-Commits entscheiden, ab welcher Nachricht erneut gelesen wird.</p>
  </div>
</div>

---

# Consumer Group

<div class="k-split">
  <div>
    <ul>
      <li>Mehrere Consumer arbeiten als Gruppe</li>
      <li>Eine Partition wird nur von einem Consumer der Gruppe gelesen</li>
      <li>Skalierung erfolgt über mehr Consumer und Partitionen</li>
    </ul>
  </div>
  <div class="k-visual-card">
    <img src="/images/ConsumerGroup.png" alt="Kafka consumer group partition assignment" class="max-h-72 mx-auto rounded-lg" />
    <p class="k-figure-caption">Partitionen werden exklusiv auf aktive Consumer verteilt.</p>
  </div>
</div>

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

<div class="k-split">
  <div>
    <ul>
      <li>Broker = ein Kafka-Server</li>
      <li>Nimmt Nachrichten an, vergibt Offsets und speichert sie</li>
      <li>Liefert Messages an Consumer aus</li>
      <li>Verarbeitet viele Partitionen mit hohem Durchsatz</li>
    </ul>
  </div>
  <div class="k-visual-card">
    <img src="/images/kafka-overview.png" alt="Broker role in Kafka data flow" class="max-h-72 mx-auto rounded-lg" />
    <p class="k-figure-caption">Der Broker ist der zentrale Knoten für Persistenz und Auslieferung.</p>
  </div>
</div>

---

# Clusters

<div class="k-split">
  <div>
    <ul>
      <li>Broker sind für Clusterbetrieb ausgelegt</li>
      <li>Ein Broker agiert als Controller</li>
      <li>Controller überwacht Broker-Ausfälle und Partition-Zuteilung</li>
      <li>Jede Partition hat einen Leader-Broker</li>
      <li>Replikation erhöht Ausfallsicherheit</li>
    </ul>
  </div>
  <div class="k-visual-card">
    <img src="/images/Cluster.png" alt="Kafka cluster with multiple brokers and partitions" class="max-h-72 mx-auto rounded-lg" />
    <p class="k-figure-caption">Cluster kombinieren Lastverteilung mit Leader/Follower-Replikation.</p>
  </div>
</div>

---
layout: center
---

# Replication & Failover

<div class="k-visual-hero">
  <img src="/images/replication-failover.svg" alt="Kafka replication and failover sequence across brokers" class="max-h-95 mx-auto" />
  <p class="k-figure-caption text-center">Fällt ein Leader aus, übernimmt ein replizierter Follower die Partition.</p>
</div>

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
3. Slidev-native animations authored in-repo via Vue components (`components/*.vue`)
4. In-repo diagrams authored for this deck: `/public/images/ordering-guarantee.svg`, `/public/images/avro-pipeline.svg`, `/public/images/replication-failover.svg`
