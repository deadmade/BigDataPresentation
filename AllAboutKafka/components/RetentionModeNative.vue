<template>
  <div class="retention-wrap">
    <div class="retention-track">
      <div class="segment" v-click="1">Event A (alt)</div>
      <div class="segment" v-click="1">Event B</div>
      <div class="segment" v-click="1">Event C</div>
      <div class="segment" v-click="1">Event D</div>
      <div class="segment" v-click="1">Event E (neu)</div>
    </div>

    <div class="retention-states">
      <p v-click="2">
        <strong>Time-based:</strong> Älteste Events laufen nach Zeitfenster aus.
      </p>
      <p v-click="3">
        <strong>Size-based:</strong> Bei voller Log-Größe werden alte Segmente
        entfernt.
      </p>
      <p v-click="4">
        <strong>Compaction:</strong> Pro Key bleibt der neueste Wert bestehen.
      </p>
    </div>
  </div>
</template>
