<script setup lang="ts">
import { computed, useId } from "vue";

type PacketRoute = {
  path: string;
  dur: string;
  begin: string;
};

const props = withDefaults(defineProps<{ step: 1 | 2 | 3 | 4 }>(), {
  step: 1,
});

const idBase = useId().replace(/[^a-zA-Z0-9_-]/g, "");
const pid = (suffix: string) => `ps2-${idBase}-${suffix}`;

const markerId = pid("arrow");
const markerUrl = `url(#${markerId})`;

const step4 = {
  busY: 190,
  producerCenters: [80, 230, 380, 530, 680, 830, 980],
  metricsHubX: 530,
  loggingHubX: 755,
  trackingHubX: 975,
  pubSubTopY: 260,
  pubSubBottomY: 315,
  bottomBusY: 395,
  metricsConsumerXs: [95, 265, 435, 605],
  loggingConsumerXs: [745, 878],
  trackingConsumerX: 1035,
  consumerTopY: 460,
};

const packetRoutes = computed<PacketRoute[]>(() => {
  if (props.step === 1) {
    return [
      { path: pid("s1-left"), dur: "1.9s", begin: "0s" },
      { path: pid("s1-right"), dur: "2.1s", begin: "0.25s" },
      { path: pid("s1-down"), dur: "1.35s", begin: "0.45s" },
    ];
  }

  if (props.step === 2) {
    return [
      { path: pid("s2-p1"), dur: "2.4s", begin: "0s" },
      { path: pid("s2-p2"), dur: "2.2s", begin: "0.3s" },
      { path: pid("s2-p3"), dur: "2.35s", begin: "0.6s" },
      { path: pid("s2-p4"), dur: "2.5s", begin: "0.9s" },
      { path: pid("s2-p5"), dur: "2.3s", begin: "1.2s" },
      { path: pid("s2-p6"), dur: "2.45s", begin: "1.5s" },
      { path: pid("s2-p7"), dur: "2.25s", begin: "1.8s" },
      { path: pid("s2-p8"), dur: "2.4s", begin: "2.1s" },
    ];
  }

  if (props.step === 3) {
    return [
      { path: pid("s3-prod-1"), dur: "2s", begin: "0s" },
      { path: pid("s3-prod-2"), dur: "2s", begin: "0.4s" },
      { path: pid("s3-prod-3"), dur: "2s", begin: "0.8s" },
      { path: pid("s3-prod-4"), dur: "2s", begin: "1.2s" },
      { path: pid("s3-prod-5"), dur: "2s", begin: "0.2s" },
      { path: pid("s3-prod-6"), dur: "2s", begin: "0.6s" },
      { path: pid("s3-prod-7"), dur: "2s", begin: "1s" },
      { path: pid("s3-to-metrics-ui"), dur: "1.4s", begin: "0.85s" },
      { path: pid("s3-to-metrics-analysis"), dur: "1.4s", begin: "1.0s" },
      { path: pid("s3-to-active-monitoring"), dur: "1.45s", begin: "1.15s" },
      { path: pid("s3-to-db-monitor"), dur: "1.45s", begin: "1.3s" },
    ];
  }

  return [
    { path: pid("s4-flow-1"), dur: "3s", begin: "0s" },
    { path: pid("s4-flow-2"), dur: "2.8s", begin: "0.2s" },
    { path: pid("s4-flow-3"), dur: "2.6s", begin: "0.4s" },
    { path: pid("s4-flow-4"), dur: "2.4s", begin: "0.6s" },
    { path: pid("s4-flow-5"), dur: "2.7s", begin: "0.8s" },
    { path: pid("s4-flow-6"), dur: "2.9s", begin: "1s" },
    { path: pid("s4-flow-7"), dur: "3.1s", begin: "1.2s" },
    { path: pid("s4-m-c1"), dur: "1.4s", begin: "1.5s" },
    { path: pid("s4-m-c2"), dur: "1.4s", begin: "1.7s" },
    { path: pid("s4-m-c3"), dur: "1.4s", begin: "1.9s" },
    { path: pid("s4-m-c4"), dur: "1.4s", begin: "2.1s" },
    { path: pid("s4-l-c1"), dur: "1.4s", begin: "1.8s" },
    { path: pid("s4-l-c2"), dur: "1.4s", begin: "2.0s" },
    { path: pid("s4-t-c1-full"), dur: "1.8s", begin: "2.2s" },
  ];
});
</script>

<template>
  <div class="ps2-wrap">
    <div class="ps2-scroll">
      <div class="ps2-canvas">
        <svg class="ps2-lines" viewBox="0 0 1100 560" aria-hidden="true">
          <defs>
            <filter id="ps2-glow" x="-20%" y="-20%" width="140%" height="140%">
              <feGaussianBlur stdDeviation="3" result="blur" />
              <feComposite in="SourceGraphic" in2="blur" operator="over" />
            </filter>
            <marker
              :id="markerId"
              markerWidth="8"
              markerHeight="8"
              refX="7"
              refY="4"
              orient="auto"
            >
              <path d="M0,0 L8,4 L0,8 z" fill="var(--ps2-line-active)" />
            </marker>
          </defs>

          <g v-if="props.step === 1" class="ps2-layer active">
            <path :id="pid('s1-left')" d="M467.5 114 V190 H550" />
            <path :id="pid('s1-right')" d="M632.5 114 V190 H550" />
            <path
              :id="pid('s1-down')"
              d="M550 190 V255"
              :marker-end="markerUrl"
            />
          </g>

          <g v-if="props.step === 2" class="ps2-layer active">
            <path
              :id="pid('s2-p1')"
              d="M80 114 V180 H95 V455"
              :marker-end="markerUrl"
            />
            <path
              :id="pid('s2-p2')"
              d="M80 114 V200 H265 V455"
              :marker-end="markerUrl"
            />
            <path
              :id="pid('s2-p3')"
              d="M230 114 V220 H435 V455"
              :marker-end="markerUrl"
            />
            <path
              :id="pid('s2-p4')"
              d="M380 114 V240 H605 V455"
              :marker-end="markerUrl"
            />
            <path
              :id="pid('s2-p5')"
              d="M530 114 V260 H435 V455"
              :marker-end="markerUrl"
            />
            <path
              :id="pid('s2-p6')"
              d="M680 114 V280 H605 V455"
              :marker-end="markerUrl"
            />
            <path
              :id="pid('s2-p7')"
              d="M831 114 V300 H265 V455"
              :marker-end="markerUrl"
            />
            <path
              :id="pid('s2-p8')"
              d="M980 114 V320 H95 V455"
              :marker-end="markerUrl"
            />
          </g>

          <g v-if="props.step === 3" class="ps2-layer active">
            <path :id="pid('s3-prod-1')" d="M80 114 V170 H530 V255" />
            <path :id="pid('s3-prod-2')" d="M230 114 V170 H530 V255" />
            <path :id="pid('s3-prod-3')" d="M380 114 V170 H530 V255" />
            <path :id="pid('s3-prod-4')" d="M530 114 V255" />
            <path :id="pid('s3-prod-5')" d="M680 114 V170 H530 V255" />
            <path :id="pid('s3-prod-6')" d="M830 114 V170 H530 V255" />
            <path :id="pid('s3-prod-7')" d="M980 114 V170 H530 V255" />
            <path d="M80 170 H980" />
            <path d="M530 320 V392" />
            <path d="M95 392 H605" />
            <path
              :id="pid('s3-to-metrics-ui')"
              d="M95 392 V455"
              :marker-end="markerUrl"
            />
            <path
              :id="pid('s3-to-metrics-analysis')"
              d="M265 392 V455"
              :marker-end="markerUrl"
            />
            <path
              :id="pid('s3-to-active-monitoring')"
              d="M435 392 V455"
              :marker-end="markerUrl"
            />
            <path
              :id="pid('s3-to-db-monitor')"
              d="M605 392 V455"
              :marker-end="markerUrl"
            />
          </g>

          <g v-if="props.step === 4" class="ps2-layer active">
            <!-- Producers to Bus -->
            <path v-for="c in step4.producerCenters" :key="`s4-p-${c}`" :d="`M${c} 100 V${step4.busY}`" />

            <!-- Single Bus Rail -->
            <path :d="`M80 ${step4.busY} H980`" />

            <!-- Hub Connections from single Bus -->
            <path :d="`M${step4.metricsHubX} ${step4.busY} V${step4.pubSubTopY}`" :marker-end="markerUrl" />
            <path :d="`M${step4.loggingHubX} ${step4.busY} V${step4.pubSubTopY}`" :marker-end="markerUrl" />
            <path :d="`M${step4.trackingHubX} ${step4.busY} V${step4.pubSubTopY}`" :marker-end="markerUrl" />

            <!-- Simplified Animation Paths -->
            <path :id="pid('s4-flow-1')" :d="`M80 100 V${step4.busY} H${step4.trackingHubX} V${step4.pubSubTopY}`" fill="none" />
            <path :id="pid('s4-flow-2')" :d="`M230 100 V${step4.busY} H${step4.loggingHubX} V${step4.pubSubTopY}`" fill="none" />
            <path :id="pid('s4-flow-3')" :d="`M380 100 V${step4.busY} H${step4.metricsHubX} V${step4.pubSubTopY}`" fill="none" />
            <path :id="pid('s4-flow-4')" :d="`M530 100 V${step4.pubSubTopY}`" fill="none" />
            <path :id="pid('s4-flow-5')" :d="`M680 100 V${step4.busY} H${step4.loggingHubX} V${step4.pubSubTopY}`" fill="none" />
            <path :id="pid('s4-flow-6')" :d="`M830 100 V${step4.busY} H${step4.trackingHubX} V${step4.pubSubTopY}`" fill="none" />
            <path :id="pid('s4-flow-7')" :d="`M980 100 V${step4.busY} H${step4.metricsHubX} V${step4.pubSubTopY}`" fill="none" />

            <!-- Hubs to Consumers -->
            <path :d="`M${step4.metricsHubX} ${step4.pubSubBottomY} V${step4.bottomBusY}`" />
            <path :d="`M95 ${step4.bottomBusY} H605`"/>
            <path v-for="(x, i) in step4.metricsConsumerXs" :key="`s4-m-c-${x}`" :id="pid(`s4-m-c${i+1}`)" :d="`M${x} ${step4.bottomBusY} V${step4.consumerTopY}`" :marker-end="markerUrl" />

            <path :d="`M${step4.loggingHubX} ${step4.pubSubBottomY} V${step4.bottomBusY}`" />
            <path :d="`M745 ${step4.bottomBusY} H878`" />
            <path v-for="(x, i) in step4.loggingConsumerXs" :key="`s4-l-c-${x}`" :id="pid(`s4-l-c${i+1}`)" :d="`M${x} ${step4.bottomBusY} V${step4.consumerTopY}`" :marker-end="markerUrl" />

            <path :d="`M${step4.trackingHubX} ${step4.pubSubBottomY} V${step4.bottomBusY} H${step4.trackingConsumerX}`" />
            <path :id="pid('s4-t-c1')" :d="`M${step4.trackingConsumerX} ${step4.bottomBusY} V${step4.consumerTopY}`" :marker-end="markerUrl" />
            <path :id="pid('s4-t-c1-full')" :d="`M${step4.trackingHubX} ${step4.pubSubBottomY} V${step4.bottomBusY} H${step4.trackingConsumerX} V${step4.consumerTopY}`" fill="none" />
          </g>

          <g class="ps2-packets" aria-hidden="true">
            <circle
              v-for="route in packetRoutes"
              :key="route.path"
              class="ps2-packet"
              r="6"
              filter="url(#ps2-glow)"
            >

              <animateMotion
                :dur="route.dur"
                :begin="route.begin"
                repeatCount="indefinite"
                rotate="auto"
              >
                <mpath
                  :href="`#${route.path}`"
                  :xlink:href="`#${route.path}`"
                />
              </animateMotion>
            </circle>
          </g>
        </svg>

        <div v-if="props.step === 1" class="ps2-card ps2-top ps2-step1-t1">
          <div class="ps2-card-content">
            <svg class="ps2-icon" viewBox="0 0 24 24"><path d="M20,13H4V11H20M20,17H4V15H20M20,7H4V5H20M20,19H4A2,2 0 0,1 2,17V5A2,2 0 0,1 4,3H20A2,2 0 0,1 22,5V17A2,2 0 0,1 20,19Z" fill="currentColor"/></svg>
            <span>Frontend<br />Server</span>
          </div>
        </div>
        <div v-if="props.step === 1" class="ps2-card ps2-top ps2-step1-t2">
          <div class="ps2-card-content">
            <svg class="ps2-icon" viewBox="0 0 24 24"><path d="M20,13H4V11H20M20,17H4V15H20M20,7H4V5H20M20,19H4A2,2 0 0,1 2,17V5A2,2 0 0,1 4,3H20A2,2 0 0,1 22,5V17A2,2 0 0,1 20,19Z" fill="currentColor"/></svg>
            <span>Frontend<br />Server</span>
          </div>
        </div>
        <div v-if="props.step >= 2" class="ps2-card ps2-top t1">
          <div class="ps2-card-content">
            <svg class="ps2-icon" viewBox="0 0 24 24"><path d="M20,13H4V11H20M20,17H4V15H20M20,7H4V5H20M20,19H4A2,2 0 0,1 2,17V5A2,2 0 0,1 4,3H20A2,2 0 0,1 22,5V17A2,2 0 0,1 20,19Z" fill="currentColor"/></svg>
            <span>Frontend<br />Server</span>
          </div>
        </div>
        <div v-if="props.step >= 2" class="ps2-card ps2-top t2">
          <div class="ps2-card-content">
            <svg class="ps2-icon" viewBox="0 0 24 24"><path d="M20,13H4V11H20M20,17H4V15H20M20,7H4V5H20M20,19H4A2,2 0 0,1 2,17V5A2,2 0 0,1 4,3H20A2,2 0 0,1 22,5V17A2,2 0 0,1 20,19Z" fill="currentColor"/></svg>
            <span>Frontend<br />Server</span>
          </div>
        </div>
        <div v-if="props.step >= 2" class="ps2-card ps2-top t3">
          <div class="ps2-card-content">
            <svg class="ps2-icon" viewBox="0 0 24 24"><path d="M12,3C7.58,3 4,4.79 4,7C4,9.21 7.58,11 12,11C16.42,11 20,9.21 20,7C20,4.79 16.42,3 12,3M4,9V12C4,14.21 7.58,16 12,16C16.42,16 20,14.21 20,12V9C20,11.21 16.42,13 12,13C7.58,13 4,11.21 4,9M4,14V17C4,19.21 7.58,21 12,21C16.42,21 20,19.21 20,17V14C20,16.21 16.42,18 12,18C7.58,18 4,16.21 4,14Z" fill="currentColor"/></svg>
            <span>Database<br />Server</span>
          </div>
        </div>
        <div v-if="props.step >= 2" class="ps2-card ps2-top t4">
          <div class="ps2-card-content">
            <svg class="ps2-icon" viewBox="0 0 24 24"><path d="M12,3C7.58,3 4,4.79 4,7C4,9.21 7.58,11 12,11C16.42,11 20,9.21 20,7C20,4.79 16.42,3 12,3M4,9V12C4,14.21 7.58,16 12,16C16.42,16 20,14.21 20,12V9C20,11.21 16.42,13 12,13C7.58,13 4,11.21 4,9M4,14V17C4,19.21 7.58,21 12,21C16.42,21 20,19.21 20,17V14C20,16.21 16.42,18 12,18C7.58,18 4,16.21 4,14Z" fill="currentColor"/></svg>
            <span>Database<br />Slave</span>
          </div>
        </div>
        <div v-if="props.step >= 2" class="ps2-card ps2-top t5">
          <div class="ps2-card-content">
            <svg class="ps2-icon" viewBox="0 0 24 24"><path d="M20,2H4A2,2 0 0,0 2,4V22L6,18H20A2,2 0 0,0 22,16V4A2,2 0 0,0 20,2Z" fill="currentColor"/></svg>
            <span>Chat<br />Server</span>
          </div>
        </div>
        <div v-if="props.step >= 2" class="ps2-card ps2-top t6">
          <div class="ps2-card-content">
            <svg class="ps2-icon" viewBox="0 0 24 24"><path d="M17,18A2,2 0 0,1 19,20A2,2 0 0,1 17,22C15.89,22 15,21.1 15,20C15,18.89 15.89,18 17,18M1,2H4.27L5.21,4H20A1,1 0 0,1 21,5C21,5.17 20.95,5.34 20.88,5.5L17.3,11.97C16.96,12.58 16.3,13 15.55,13H8.1L7.2,14.63L7.17,14.75A0.25,0.25 0 0,0 7.42,15H19V17H7A2,2 0 0,1 5,15C5,14.65 5.09,14.32 5.24,14.04L6.6,11.59L3,4H1V2M7,18A2,2 0 0,1 9,20A2,2 0 0,1 7,22C5.89,22 5,21.1 5,20C5,18.89 5.89,18 7,18M18.5,9H15.5V6H14V9H11V10.5H14V13.5H15.5V10.5H18.5V9Z" fill="currentColor"/></svg>
            <span>Shopping<br />Cart</span>
          </div>
        </div>
        <div v-if="props.step >= 2" class="ps2-card ps2-top t7">
          <div class="ps2-card-content">
            <svg class="ps2-icon" viewBox="0 0 24 24"><path d="M20,13H4V11H20M20,17H4V15H20M20,7H4V5H20M20,19H4A2,2 0 0,1 2,17V5A2,2 0 0,1 4,3H20A2,2 0 0,1 22,5V17A2,2 0 0,1 20,19Z" fill="currentColor"/></svg>
            <span>Backend<br />Server</span>
          </div>
        </div>

        <div v-if="props.step === 1" class="ps2-card ps2-legacy step1-legacy">
          <div class="ps2-card-content">
            <svg class="ps2-icon" viewBox="0 0 24 24"><path d="M12,2A10,10 0 0,0 2,12A10,10 0 0,0 12,22A10,10 0 0,0 22,12A10,10 0 0,0 12,2M12,4A8,8 0 0,1 20,12A8,8 0 0,1 12,20A8,8 0 0,1 4,12A8,8 0 0,1 12,4M12,6A6,6 0 0,0 6,12A6,6 0 0,0 12,18A6,6 0 0,0 18,12A6,6 0 0,0 12,6M12,8A4,4 0 0,1 16,12A4,4 0 0,1 12,16A4,4 0 0,1 8,12A4,4 0 0,1 12,8Z" fill="currentColor"/></svg>
            <span>Metrics<br />Server</span>
          </div>
        </div>
        <div v-if="props.step >= 3" class="ps2-card ps2-bus metrics">
          <div class="ps2-card-content">
            <svg class="ps2-icon" viewBox="0 0 24 24"><path d="M17,17H7V14L3,18L7,22V19H17V22L21,18L17,14V17M7,7H17V10L21,6L17,2V5H7V2L3,6L7,10V7Z" fill="currentColor"/></svg>
            <span>Metrics<br />Pub/Sub</span>
          </div>
        </div>
        <div v-if="props.step === 4" class="ps2-card ps2-bus logging">
          <div class="ps2-card-content">
            <svg class="ps2-icon" viewBox="0 0 24 24"><path d="M17,17H7V14L3,18L7,22V19H17V22L21,18L17,14V17M7,7H17V10L21,6L17,2V5H7V2L3,6L7,10V7Z" fill="currentColor"/></svg>
            <span>Logging<br />Pub/Sub</span>
          </div>
        </div>
        <div v-if="props.step === 4" class="ps2-card ps2-bus tracking">
          <div class="ps2-card-content">
            <svg class="ps2-icon" viewBox="0 0 24 24"><path d="M17,17H7V14L3,18L7,22V19H17V22L21,18L17,14V17M7,7H17V10L21,6L17,2V5H7V2L3,6L7,10V7Z" fill="currentColor"/></svg>
            <span>Tracking<br />Pub/Sub</span>
          </div>
        </div>

        <div v-if="props.step >= 2" class="ps2-card ps2-bottom b1">
          <div class="ps2-card-content">
            <svg class="ps2-icon" viewBox="0 0 24 24"><path d="M21,16.5C21,16.88 20.79,17.21 20.47,17.38L12.57,21.82C12.41,21.94 12.21,22 12,22C11.79,22 11.59,21.94 11.43,21.82L3.53,17.38C3.21,17.21 3,16.88 3,16.5V7.5C3,7.12 3.21,6.79 3.53,6.62L11.43,2.18C11.59,2.06 11.79,2 12,2C12.21,2 12.41,2.06 12.57,2.18L20.47,6.62C20.79,6.79 21,7.12 21,7.5V16.5Z" fill="currentColor"/></svg>
            <span>Metrics UI</span>
          </div>
        </div>
        <div v-if="props.step >= 2" class="ps2-card ps2-bottom b2">
          <div class="ps2-card-content">
            <svg class="ps2-icon" viewBox="0 0 24 24"><path d="M16,11.78L20.24,4.45L21.97,5.45L16.74,14.5L10.23,10.75L5.46,19H22V21H2V3H4V17.54L9.5,8L16,11.78Z" fill="currentColor"/></svg>
            <span>Metrics<br />Analysis</span>
          </div>
        </div>
        <div v-if="props.step >= 2" class="ps2-card ps2-bottom b3">
          <div class="ps2-card-content">
            <svg class="ps2-icon" viewBox="0 0 24 24"><path d="M12,2C6.5,2 2,6.5 2,12C2,17.5 6.5,22 12,22C17.5,22 22,17.5 22,12C22,6.5 17.5,2,12,2M12,4C16.4,4 20,7.6 20,12C20,14.2 19.1,16.2 17.7,17.7L16.3,16.3C17.4,15.2 18,13.7 18,12C18,8.7 15.3,6 12,6C8.7,6 6,8.7 6,12C6,13.7 6.6,15.2 7.7,16.3L6.3,17.7C4.9,16.2 4,14.2 4,12C4,7.6 7.6,4 12,4M12,8C9.8,8 8,9.8 8,12C8,13.1 8.4,14.1 9.1,14.9L10.5,13.5C10.2,13.1 10,12.6 10,12C10,10.9 10.9,10 12,10C13.1,10 14,10.9 14,12C14,12.6 13.8,13.1 13.5,13.5L14.9,14.9C15.6,14.1 16,13.1 16,12C16,9.8 14.2,8 12,8Z" fill="currentColor"/></svg>
            <span>Active<br />Monitoring</span>
          </div>
        </div>
        <div v-if="props.step >= 2" class="ps2-card ps2-bottom b4">
          <div class="ps2-card-content">
            <svg class="ps2-icon" viewBox="0 0 24 24"><path d="M12,3C7.58,3 4,4.79 4,7C4,9.21 7.58,11 12,11C16.42,11 20,9.21 20,7C20,4.79 16.42,3 12,3M4,9V12C4,14.21 7.58,16 12,16C16.42,16 20,14.21 20,12V9C20,11.21 16.42,13 12,13C7.58,13 4,11.21 4,9M4,14V17C4,19.21 7.58,21 12,21C16.42,21 20,19.21 20,17V14C20,16.21 16.42,18 12,18C7.58,18 4,16.21 4,14Z" fill="currentColor"/></svg>
            <span>Database<br />Monitor</span>
          </div>
        </div>

        <div v-if="props.step === 4" class="ps2-card ps2-bottom b5">
          <div class="ps2-card-content">
            <svg class="ps2-icon" viewBox="0 0 24 24"><path d="M9.5,3A6.5,6.5 0 0,1 16,9.5C16,11.11 15.41,12.59 14.44,13.73L14.71,14H15.5L20.5,19L19,20.5L14,15.5V14.71L13.73,14.44C12.59,15.41 11.11,16 9.5,16A6.5,6.5 0 0,1 3,9.5A6.5,6.5 0 0,1 9.5,3M9.5,5C7,5 5,7 5,9.5C5,12 7,14 9.5,14C12,14 14,12 14,9.5C14,7 12,5 9.5,5Z" fill="currentColor"/></svg>
            <span>Log<br />Search</span>
          </div>
        </div>
        <div v-if="props.step === 4" class="ps2-card ps2-bottom b6">
          <div class="ps2-card-content">
            <svg class="ps2-icon" viewBox="0 0 24 24"><path d="M12,1L3,5V11C3,16.55 6.84,21.74 12,23C17.16,21.74 21,16.55 21,11V5L12,1M12,7C13.4,7 14.8,7.3 16,7.9V11C16,14.5 14.3,17.7 12,19.5C9.7,17.7 8,14.5 8,11V7.9C9.2,7.3 10.6,7 12,7Z" fill="currentColor"/></svg>
            <span>Security<br />Analysis</span>
          </div>
        </div>
        <div v-if="props.step === 4" class="ps2-card ps2-bottom b7">
          <div class="ps2-card-content">
            <svg class="ps2-icon" viewBox="0 0 24 24"><path d="M12,2L4.5,20.29L5.21,21L12,18L18.79,21L19.5,20.29L12,2Z" fill="currentColor"/></svg>
            <span>Offline<br />Processing</span>
          </div>
        </div>

      </div>
    </div>
  </div>
</template>
