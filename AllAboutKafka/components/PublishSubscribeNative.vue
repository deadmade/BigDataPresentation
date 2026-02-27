<template>
  <div class="ps-wrap">
    <div class="ps-lanes">
      <div class="ps-node ps-producer" :class="{ 'ps-node-active': $clicks >= 1 }">Producer</div>
      <div class="ps-node ps-topic" :class="{ 'ps-node-active': $clicks >= 2 }">Topic</div>
      <div class="ps-node ps-broker" :class="{ 'ps-node-active': $clicks >= 3 }">Kafka Broker</div>
      <div class="ps-node ps-sub" :class="{ 'ps-node-active': $clicks >= 4 }">Subscriber A</div>
      <div class="ps-node ps-sub" :class="{ 'ps-node-active': $clicks >= 4 }">Subscriber B</div>
    </div>

    <svg class="ps-arrows" viewBox="0 0 1000 220" preserveAspectRatio="none" aria-hidden="true">
      <defs>
        <marker id="ps-arrow-head" markerWidth="8" markerHeight="8" refX="7" refY="4" orient="auto">
          <path d="M0,0 L8,4 L0,8 z" fill="#43658b" />
        </marker>
      </defs>

      <path class="ps-arrow" :class="{ 'ps-arrow-active': $clicks >= 1 }" d="M150,50 C250,50 250,50 350,50" marker-end="url(#ps-arrow-head)" />
      <path class="ps-arrow" :class="{ 'ps-arrow-active': $clicks >= 2 }" d="M450,50 C550,50 550,50 650,50" marker-end="url(#ps-arrow-head)" />
      <path class="ps-arrow" :class="{ 'ps-arrow-active': $clicks >= 4 }" d="M750,55 C840,75 840,115 920,135" marker-end="url(#ps-arrow-head)" />
      <path class="ps-arrow" :class="{ 'ps-arrow-active': $clicks >= 4 }" d="M750,45 C840,30 840,30 920,25" marker-end="url(#ps-arrow-head)" />
    </svg>

    <div class="ps-legend">
      <p class="ps-label" :class="{ 'ps-label-active': $clicks >= 1 }">1. Producer published eine Nachricht</p>
      <p class="ps-label" :class="{ 'ps-label-active': $clicks >= 2 }">2. Topic sammelt Nachrichten logisch pro Stream</p>
      <p class="ps-label" :class="{ 'ps-label-active': $clicks >= 3 }">3. Broker speichert die Nachricht dauerhaft</p>
      <p class="ps-label" :class="{ 'ps-label-active': $clicks >= 4 }">4. Nachricht wird an mehrere Subscriber verteilt</p>
      <p class="ps-label" :class="{ 'ps-label-active': $clicks >= 5 }">5. Final state: vollständiger, statisch lesbarer Informationsfluss</p>
    </div>
  </div>
</template>
