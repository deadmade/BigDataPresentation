<template>
  <div class="rebalance-wrap">
    <div class="rebalance-cols">
      <div class="rebalance-col">
        <h3>Vorher</h3>
        <div class="partition-list">
          <div class="partition-pill">P0 -> C1</div>
          <div class="partition-pill">P1 -> C2</div>
          <div class="partition-pill">P2 -> C3</div>
          <div class="partition-pill">P3 -> C1</div>
        </div>
      </div>
      <div class="rebalance-col" v-click="2">
        <h3>Ausfall</h3>
        <div class="partition-list">
          <div class="partition-pill danger">C2 ausgefallen</div>
          <div class="partition-pill">P0 -> C1</div>
          <div class="partition-pill">P2 -> C3</div>
          <div class="partition-pill">P3 -> C1</div>
        </div>
      </div>
      <div class="rebalance-col" v-click="3">
        <h3>Nach Rebalance</h3>
        <div class="partition-list">
          <div class="partition-pill success">P0 -> C1</div>
          <div class="partition-pill success">P1 -> C3</div>
          <div class="partition-pill success">P2 -> C1</div>
          <div class="partition-pill success">P3 -> C3</div>
        </div>
      </div>
    </div>
  </div>
</template>
