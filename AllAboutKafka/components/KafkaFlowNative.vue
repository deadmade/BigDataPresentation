<template>
  <div class="k-flow-wrap">
    <div class="k-flow-grid">
      <div v-click="1" class="k-node k-producer">Producer</div>
      <div v-click="2" class="k-node k-topic">Topic</div>
      <div v-click="3" class="k-node k-broker">Broker Cluster</div>
      <div v-click="4" class="k-node k-consumer">Consumer Group</div>
    </div>
    <div class="k-legend">
      <span v-click="1">1. Producer schreibt Events</span>
      <span v-click="2">2. Topic nimmt Events partitioniert auf</span>
      <span v-click="3">3. Broker replizieren und speichern</span>
      <span v-click="4">4. Consumer lesen offsetsicher</span>
    </div>
  </div>
</template>
