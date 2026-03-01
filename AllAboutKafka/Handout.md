## Was ist Kafka?

Apache Kafka ist ein Publish/Subscribe-Messaging-System, das oft als Distributed Commit Log oder Distributed Streaming Platform bezeichnet wird.

- **Speicherung:** Daten werden dauerhaft und in chronologischer Reihenfolge gespeichert.
- **Abruf:** Deterministisches Auslesen der Daten ist jederzeit möglich.
- **Architektur:** Verteiltes System ->  hohe Ausfallsicherheit + optimale Skalierbarkeit.

## Messages und Batches

Die grundlegende Dateneinheit in Kafka ist die **Message**.

- **Message:** Technisch gesehen ein simples _Array of Bytes_. Kafka selbst interpretiert den Inhalt nicht.
- **Key (optional):** Ebenfalls ein Byte-Array. Dient als Metadatum, um Messages kontrolliert in spezifische _Partitions_ zu schreiben.
- **Offset**: Identifiziert die Position in der Partition
- **Batches:** Messages für dasselbe Topic/dieselbe Partition werden gebündelt übertragen.
    - _Vorteil:_ Reduziert den Netzwerk-Overhead.
    - _Tradeoff:_ Abwägung zwischen Latenz (Latency) und Durchsatz (Throughput) – größere Batches erhöhen den Durchsatz, aber auch die Übertragungsdauer der einzelnen Message.
## Schemas
Obwohl Kafka die Daten nur als Bytes sieht, benötigen die Anwendungen eine klare Datenstruktur.

- **Gängige Formate:** JSON, XML oder Apache Avro.
- **Entkopplung:** Ein festes Schema entkoppelt Producer (Schreiber) und Consumer (Leser).
- **Vorteil:** Consumer- und Producer-Anwendungen müssen bei Formatänderungen nicht zwingend zeitgleich aktualisiert werden.
- **Best Practice:** Die zentrale Verwaltung von Formaten über eine **Schema Registry**.
## Topics und Partitions

Kafka organisiert Daten in Kategorien und unterteilt diese weiter für maximale Performance.

- **Topic:** Die übergeordnete Kategorie für Messages.
- **Partition:** Unterteilung eines Topics. Fungiert als einzelnes Log.
    - _Append-Only:_ Neue Messages werden stets hinten angehängt.
    - _Reihenfolge:_ Die zeitliche Reihenfolge ist **nur innerhalb einer einzelnen Partition** garantiert, nicht über das gesamte Topic hinweg!
- **Skalierbarkeit & Redundanz:** Partitions eines Topics können über mehrere Server verteilt gehostet werden (horizontale Skalierung)
![[Images/partition-topic.png]]

## Producers und Consumers

Die Nutzer des Kafka-Systems (Clients) werden in zwei grundlegende Typen unterteilt. 

- **Producers**: Producers erstellen neue Messages und senden sie an ein spezifisches Topic.
- **Consumers**: Consumers abonnieren Topics und lesen die darin enthaltenen Messages in exakt der Reihenfolge, in der sie geschrieben wurden. Der Consumer merkt sich den Offset der zuletzt gelesenen Message. Fällt ein Consumer aus oder pausiert er, kann er später exakt an dieser Stelle nahtlos weiterlesen.
### Consumer Groups

Um große Datenmengen effizient zu verarbeiten, arbeiten Consumers oft als **Consumer Group** zusammen.

- **Ownership-Regel:** Jede Partition eines Topics darf immer nur von **genau einem** Consumer innerhalb derselben Gruppe gelesen werden.
- **Horizontale Skalierung:** Durch das Hinzufügen weiterer Consumer in die Gruppe lässt sich die Leselast ideal verteilen.
- **Ausfallsicherheit (Rebalancing):** Fällt ein Consumer innerhalb der Gruppe aus, werden dessen Partitions automatisch auf die verbleibenden Mitglieder umverteilt.
![[Images/ConsumerGroup.png]]

## Brokers und Clusters

Kafka ist für den Betrieb in einem Server-Verbund (Cluster) ausgelegt, um maximale Leistung und Ausfallsicherheit zu gewährleisten.
### Der Broker

Ein einzelner Kafka-Server wird als Broker bezeichnet.

- **Aufgaben:** Er empfängt Messages von den Producers, weist ihnen Offsets zu, speichert sie dauerhaft auf der Festplatte und bedient die Leseanfragen der Consumers.
- **Leistung:** Abhängig von der Hardware kann ein einzelner Broker mühelos tausende Partitions und Millionen von Messages pro Sekunde verarbeiten.

### Der Cluster und der Controller
Mehrere Broker bilden zusammen einen Cluster.

- **Controller:** Ein automatisch gewählter Broker übernimmt zusätzlich die Rolle des _Controllers_. Er steuert administrative Aufgaben, wie die Zuweisung von Partitions zu den Brokern und die Überwachung von Ausfällen.
- **Leader & Replikation:** Jede Partition wird von einem primären Broker verwaltet, dem sogenannten **Leader**.
    - Alle Lese- und Schreibzugriffe der Clients erfolgen zwingend über diesen Leader.
    - Um Datenverlust vorzubeugen, wird die Partition auf andere Broker kopiert (**Replikation**). Fällt der Leader aus, übernimmt ein Replikat nahtlos die Führung.

![[Pasted image 20260228163605.png]]
## Quellen
1. Apache Kafka "Powered By" page: https://kafka.apache.org/powered-by/
2. Kafka: The Definitive Guide (Neha Narkhede, Gwen Shapira, Todd Palino, O'Reilly, 2017), ISBN 978-1-491-93616-0
3. Podcast: https://gotime.fm/299