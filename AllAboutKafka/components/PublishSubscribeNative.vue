<template>
  <div class="ps2-wrap">
    <div class="ps2-scroll">
      <div class="ps2-canvas">
        <svg class="ps2-lines" viewBox="0 0 1100 560" aria-hidden="true">
          <defs>
            <marker
              id="ps2-arrow"
              markerWidth="10"
              markerHeight="10"
              refX="8"
              refY="5"
              orient="auto"
            >
              <path d="M0,0 L10,5 L0,10 z" />
            </marker>
          </defs>

          <g v-click="1" class="ps2-layer ps2-stage">
            <path d="M80 114 V195 H535 V248" marker-end="url(#ps2-arrow)" />
            <path d="M230 114 V177 H535 V248" marker-end="url(#ps2-arrow)" />
          </g>

          <g v-click="2" class="ps2-layer ps2-stage">
            <path d="M80 114 V230 H95 V448" marker-end="url(#ps2-arrow)" />
            <path d="M80 114 V215 H265 V448" marker-end="url(#ps2-arrow)" />
            <path d="M230 114 V198 H435 V448" marker-end="url(#ps2-arrow)" />
            <path d="M380 114 V184 H605 V448" marker-end="url(#ps2-arrow)" />
            <path d="M530 114 V210 H435 V448" marker-end="url(#ps2-arrow)" />
            <path d="M680 114 V222 H605 V448" marker-end="url(#ps2-arrow)" />
            <path d="M830 114 V205 H265 V448" marker-end="url(#ps2-arrow)" />
            <path d="M980 114 V230 H95 V448" marker-end="url(#ps2-arrow)" />
          </g>

          <g v-click="3" class="ps2-layer ps2-stage">
            <path d="M80 114 V170" />
            <path d="M230 114 V170" />
            <path d="M380 114 V170" />
            <path d="M530 114 V170" />
            <path d="M680 114 V170" />
            <path d="M830 114 V170" />
            <path d="M980 114 V170" />
            <path d="M80 170 H980" />
            <path d="M530 170 V248" marker-end="url(#ps2-arrow)" />
            <path d="M530 342 V392" />
            <path d="M95 392 H605" />
            <path d="M95 392 V448" marker-end="url(#ps2-arrow)" />
            <path d="M265 392 V448" marker-end="url(#ps2-arrow)" />
            <path d="M435 392 V448" marker-end="url(#ps2-arrow)" />
            <path d="M605 392 V448" marker-end="url(#ps2-arrow)" />
          </g>

          <g v-click="4" class="ps2-layer ps2-stage">
            <path d="M755 170 V248" marker-end="url(#ps2-arrow)" />
            <path d="M975 170 V248" marker-end="url(#ps2-arrow)" />
            <path d="M755 342 V392" />
            <path d="M755 392 H925" />
            <path d="M755 392 V448" marker-end="url(#ps2-arrow)" />
            <path d="M925 392 V448" marker-end="url(#ps2-arrow)" />
            <path d="M975 342 V448" marker-end="url(#ps2-arrow)" />
          </g>
        </svg>

        <div class="ps2-card ps2-top t1">Frontend<br />Server</div>
        <div class="ps2-card ps2-top t2">Frontend<br />Server</div>
        <div v-click="2" class="ps2-card ps2-top t3 ps2-stage">
          Database<br />Server
        </div>
        <div v-click="2" class="ps2-card ps2-top t4 ps2-stage">
          Database<br />Slave
        </div>
        <div v-click="2" class="ps2-card ps2-top t5 ps2-stage">
          Chat<br />Server
        </div>
        <div v-click="2" class="ps2-card ps2-top t6 ps2-stage">
          Shopping<br />Cart
        </div>
        <div v-click="2" class="ps2-card ps2-top t7 ps2-stage">
          Backend<br />Server
        </div>

        <div v-click="1" class="ps2-card ps2-legacy ps2-stage">
          Metrics<br />Server
        </div>

        <div v-click="3" class="ps2-card ps2-bus metrics ps2-stage">
          Metrics<br />Pub/Sub
        </div>
        <div v-click="4" class="ps2-card ps2-bus logging ps2-stage">
          Logging<br />Pub/Sub
        </div>
        <div v-click="4" class="ps2-card ps2-bus tracking ps2-stage">
          Tracking<br />Pub/Sub
        </div>

        <div class="ps2-card ps2-bottom b2">Metrics<br />Analysis</div>
        <div v-click="3" class="ps2-card ps2-bottom b1 ps2-stage">
          Metrics UI
        </div>
        <div v-click="3" class="ps2-card ps2-bottom b3 ps2-stage">
          Active<br />Monitoring
        </div>
        <div v-click="3" class="ps2-card ps2-bottom b4 ps2-stage">
          Database<br />Monitor
        </div>

        <div v-click="4" class="ps2-card ps2-bottom b5 ps2-stage">
          Log<br />Search
        </div>
        <div v-click="4" class="ps2-card ps2-bottom b6 ps2-stage">
          Security<br />Analysis
        </div>
        <div v-click="4" class="ps2-card ps2-bottom b7 ps2-stage">
          Offline<br />Processing
        </div>

        <div v-click="5" class="ps2-final-note ps2-stage">
          Final state: scalable event fan-out with clear ownership per domain.
        </div>
      </div>
    </div>

    <div class="ps2-legend">
      <p v-click="1">1. Centralized metrics server starts simple.</p>
      <p v-click="2">
        2. Point-to-point integrations explode into hard-to-maintain coupling.
      </p>
      <p v-click="3">3. Metrics Pub/Sub decouples producers from consumers.</p>
      <p v-click="4">
        4. Additional Pub/Sub domains scale the same pattern for logs and
        tracking.
      </p>
      <p v-click="5">
        5. Final state: clean fan-out architecture, lower service-to-service
        complexity.
      </p>
    </div>
  </div>
</template>
