<script setup lang="ts">
import { computed, useId } from 'vue'

type PacketRoute = {
  path: string
  dur: string
  begin: string
}

const props = withDefaults(defineProps<{ step: 1 | 2 | 3 | 4 }>(), {
  step: 1,
})

const idBase = useId().replace(/[^a-zA-Z0-9_-]/g, '')
const pid = (suffix: string) => `ps2-${idBase}-${suffix}`

const markerId = pid('arrow')
const markerUrl = `url(#${markerId})`

const step4 = {
  topY1: 170,
  topY2: 190,
  topY3: 210,
  producerLeftXs: [80, 230, 380, 530, 680, 830, 980],
  producerRightXs: [95, 245, 395, 545, 695, 845, 995],
  topRailStartX: 80,
  topRailEndX: 980,
  thirdRailEndX: 925,
  metricsPubSubX: 530,
  loggingPubSubX: 755,
  trackingPubSubX: 975,
  pubSubTopY: 248,
  pubSubBottomY: 342,
  metricsBottomBusY: 392,
  metricsBottomBusStartX: 95,
  metricsBottomBusEndX: 605,
  logBottomBusEndX: 878,
  logSearchX: 745,
  securityX: 878,
  offlineX: 1035,
  consumerTopY: 448,
}

const packetRoutes = computed<PacketRoute[]>(() => {
  if (props.step === 1) {
    return [
      { path: pid('s1-left'), dur: '1.9s', begin: '0s' },
      { path: pid('s1-right'), dur: '2.1s', begin: '0.25s' },
      { path: pid('s1-down'), dur: '1.35s', begin: '0.45s' },
    ]
  }

  if (props.step === 2) {
    return [
      { path: pid('s2-metrics-ui'), dur: '2.4s', begin: '0s' },
      { path: pid('s2-metrics-analysis'), dur: '2.2s', begin: '0.2s' },
      { path: pid('s2-active-monitoring'), dur: '2.35s', begin: '0.4s' },
      { path: pid('s2-db-monitor'), dur: '2.5s', begin: '0.6s' },
    ]
  }

  if (props.step === 3) {
    return [
      { path: pid('s3-top-bus'), dur: '3.2s', begin: '0s' },
      { path: pid('s3-bus-to-metrics'), dur: '1.5s', begin: '0.3s' },
      { path: pid('s3-bottom-bus'), dur: '2.5s', begin: '0.55s' },
      { path: pid('s3-to-metrics-ui'), dur: '1.4s', begin: '0.85s' },
      { path: pid('s3-to-metrics-analysis'), dur: '1.4s', begin: '1.0s' },
      { path: pid('s3-to-active-monitoring'), dur: '1.45s', begin: '1.15s' },
      { path: pid('s3-to-db-monitor'), dur: '1.45s', begin: '1.3s' },
    ]
  }

  return [
    { path: pid('s4-top-bus'), dur: '3.4s', begin: '0s' },
    { path: pid('s4-top-bus-2'), dur: '3.6s', begin: '0.15s' },
    { path: pid('s4-top-bus-3'), dur: '3s', begin: '0.3s' },
    { path: pid('s4-to-metrics-pubsub'), dur: '1.55s', begin: '0.45s' },
    { path: pid('s4-to-logging-pubsub'), dur: '1.5s', begin: '0.6s' },
    { path: pid('s4-to-tracking-pubsub'), dur: '1.45s', begin: '0.75s' },
    { path: pid('s4-metrics-bottom-bus'), dur: '2.1s', begin: '1s' },
    { path: pid('s4-metrics-to-ui'), dur: '1.25s', begin: '1.2s' },
    { path: pid('s4-metrics-to-analysis'), dur: '1.3s', begin: '1.35s' },
    { path: pid('s4-metrics-to-monitoring'), dur: '1.3s', begin: '1.5s' },
    { path: pid('s4-metrics-to-db-monitor'), dur: '1.35s', begin: '1.65s' },
    { path: pid('s4-logging-bottom-bus'), dur: '1.3s', begin: '1.1s' },
    { path: pid('s4-logging-to-log-search'), dur: '1.1s', begin: '1.3s' },
    { path: pid('s4-logging-to-security'), dur: '1.1s', begin: '1.45s' },
    { path: pid('s4-tracking-to-offline'), dur: '1.4s', begin: '1.55s' },
  ]
})
</script>

<template>
  <div class="ps2-wrap">
    <div class="ps2-scroll">
      <div class="ps2-canvas">
        <svg class="ps2-lines" viewBox="0 0 1100 560" aria-hidden="true">
          <defs>
            <marker :id="markerId" markerWidth="10" markerHeight="10" refX="8" refY="5" orient="auto">
              <path d="M0,0 L10,5 L0,10 z" />
            </marker>
          </defs>

          <g v-if="props.step === 1" class="ps2-layer">
            <path :id="pid('s1-left')" d="M470 114 V190 H550" />
            <path :id="pid('s1-right')" d="M630 114 V190 H550" />
            <path :id="pid('s1-down')" d="M550 190 V248" :marker-end="markerUrl" />
          </g>

          <g v-if="props.step === 2" class="ps2-layer">
            <path :id="pid('s2-metrics-ui')" d="M80 114 V230 H95 V448" :marker-end="markerUrl" />
            <path :id="pid('s2-metrics-analysis')" d="M80 114 V215 H265 V448" :marker-end="markerUrl" />
            <path :id="pid('s2-active-monitoring')" d="M230 114 V198 H435 V448" :marker-end="markerUrl" />
            <path :id="pid('s2-db-monitor')" d="M380 114 V184 H605 V448" :marker-end="markerUrl" />
            <path :id="pid('s2-dbserver-to-active')" d="M530 114 V210 H435 V448" :marker-end="markerUrl" />
            <path :id="pid('s2-chat-to-dbmonitor')" d="M680 114 V222 H605 V448" :marker-end="markerUrl" />
            <path :id="pid('s2-shopping-to-analysis')" d="M830 114 V205 H265 V448" :marker-end="markerUrl" />
            <path :id="pid('s2-backend-to-ui')" d="M980 114 V230 H95 V448" :marker-end="markerUrl" />
          </g>

          <g v-if="props.step === 3" class="ps2-layer">
            <path d="M80 114 V170" />
            <path d="M230 114 V170" />
            <path d="M380 114 V170" />
            <path d="M530 114 V170" />
            <path d="M680 114 V170" />
            <path d="M830 114 V170" />
            <path d="M980 114 V170" />
            <path :id="pid('s3-top-bus')" d="M80 170 H980" />
            <path :id="pid('s3-bus-to-metrics')" d="M530 170 V248" :marker-end="markerUrl" />
            <path d="M530 342 V392" />
            <path :id="pid('s3-bottom-bus')" d="M95 392 H605" />
            <path :id="pid('s3-to-metrics-ui')" d="M95 392 V448" :marker-end="markerUrl" />
            <path :id="pid('s3-to-metrics-analysis')" d="M265 392 V448" :marker-end="markerUrl" />
            <path :id="pid('s3-to-active-monitoring')" d="M435 392 V448" :marker-end="markerUrl" />
            <path :id="pid('s3-to-db-monitor')" d="M605 392 V448" :marker-end="markerUrl" />
          </g>

          <g v-if="props.step === 4" class="ps2-layer">
            <path v-for="x in step4.producerLeftXs" :key="`step4-left-${x}`" :d="`M${x} 114 V${step4.topY1}`" />
            <path v-for="x in step4.producerRightXs" :key="`step4-right-${x}`" :d="`M${x} 114 V${step4.topY2}`" />

            <path :id="pid('s4-top-bus')" :d="`M${step4.topRailStartX} ${step4.topY1} H${step4.topRailEndX}`" />
            <path :id="pid('s4-top-bus-2')" :d="`M${step4.topRailStartX} ${step4.topY2} H${step4.topRailEndX}`" />
            <path :id="pid('s4-top-bus-3')" :d="`M${step4.topRailStartX} ${step4.topY3} H${step4.thirdRailEndX}`" />

            <path
              :id="pid('s4-to-metrics-pubsub')"
              :d="`M${step4.metricsPubSubX} ${step4.topY3} V${step4.pubSubTopY}`"
              :marker-end="markerUrl"
            />
            <path
              :id="pid('s4-to-logging-pubsub')"
              :d="`M${step4.loggingPubSubX} ${step4.topY2} V${step4.pubSubTopY}`"
              :marker-end="markerUrl"
            />
            <path
              :id="pid('s4-to-tracking-pubsub')"
              :d="`M${step4.trackingPubSubX} ${step4.topY1} V${step4.pubSubTopY}`"
              :marker-end="markerUrl"
            />

            <path :d="`M${step4.metricsPubSubX} ${step4.pubSubBottomY} V${step4.metricsBottomBusY}`" />
            <path
              :id="pid('s4-metrics-bottom-bus')"
              :d="`M${step4.metricsBottomBusStartX} ${step4.metricsBottomBusY} H${step4.metricsBottomBusEndX}`"
            />
            <path :id="pid('s4-metrics-to-ui')" :d="`M95 ${step4.metricsBottomBusY} V${step4.consumerTopY}`" :marker-end="markerUrl" />
            <path
              :id="pid('s4-metrics-to-analysis')"
              :d="`M265 ${step4.metricsBottomBusY} V${step4.consumerTopY}`"
              :marker-end="markerUrl"
            />
            <path
              :id="pid('s4-metrics-to-monitoring')"
              :d="`M435 ${step4.metricsBottomBusY} V${step4.consumerTopY}`"
              :marker-end="markerUrl"
            />
            <path
              :id="pid('s4-metrics-to-db-monitor')"
              :d="`M605 ${step4.metricsBottomBusY} V${step4.consumerTopY}`"
              :marker-end="markerUrl"
            />

            <path :id="pid('s4-logging-bottom-bus')" :d="`M${step4.loggingPubSubX} ${step4.pubSubBottomY} V${step4.metricsBottomBusY}`" />
            <path :d="`M${step4.loggingPubSubX} ${step4.metricsBottomBusY} H${step4.logBottomBusEndX}`" />
            <path
              :id="pid('s4-logging-to-log-search')"
              :d="`M${step4.logSearchX} ${step4.metricsBottomBusY} V${step4.consumerTopY}`"
              :marker-end="markerUrl"
            />
            <path
              :id="pid('s4-logging-to-security')"
              :d="`M${step4.securityX} ${step4.metricsBottomBusY} V${step4.consumerTopY}`"
              :marker-end="markerUrl"
            />

            <path
              :id="pid('s4-tracking-to-offline')"
              :d="`M${step4.trackingPubSubX} ${step4.pubSubBottomY} V${step4.metricsBottomBusY} H${step4.offlineX} V${step4.consumerTopY}`"
              :marker-end="markerUrl"
            />
          </g>

          <g class="ps2-packets" aria-hidden="true">
            <circle v-for="route in packetRoutes" :key="route.path" class="ps2-packet" r="5.5">
              <animateMotion :dur="route.dur" :begin="route.begin" repeatCount="indefinite" rotate="auto">
                <mpath :href="`#${route.path}`" :xlink:href="`#${route.path}`" />
              </animateMotion>
            </circle>
          </g>
        </svg>

        <div v-if="props.step === 1" class="ps2-card ps2-top ps2-step1-t1">Frontend<br />Server</div>
        <div v-if="props.step === 1" class="ps2-card ps2-top ps2-step1-t2">Frontend<br />Server</div>
        <div v-if="props.step >= 2" class="ps2-card ps2-top t1">Frontend<br />Server</div>
        <div v-if="props.step >= 2" class="ps2-card ps2-top t2">Frontend<br />Server</div>
        <div v-if="props.step >= 2" class="ps2-card ps2-top t3">Database<br />Server</div>
        <div v-if="props.step >= 2" class="ps2-card ps2-top t4">Database<br />Slave</div>
        <div v-if="props.step >= 2" class="ps2-card ps2-top t5">Chat<br />Server</div>
        <div v-if="props.step >= 2" class="ps2-card ps2-top t6">Shopping<br />Cart</div>
        <div v-if="props.step >= 2" class="ps2-card ps2-top t7">Backend<br />Server</div>

        <div v-if="props.step === 1" class="ps2-card ps2-legacy">Metrics<br />Server</div>
        <div v-if="props.step >= 3" class="ps2-card ps2-bus metrics">Metrics<br />Pub/Sub</div>
        <div v-if="props.step === 4" class="ps2-card ps2-bus logging">Logging<br />Pub/Sub</div>
        <div v-if="props.step === 4" class="ps2-card ps2-bus tracking">Tracking<br />Pub/Sub</div>

        <div v-if="props.step >= 2" class="ps2-card ps2-bottom b1">Metrics UI</div>
        <div v-if="props.step >= 2" class="ps2-card ps2-bottom b2">Metrics<br />Analysis</div>
        <div v-if="props.step >= 2" class="ps2-card ps2-bottom b3">Active<br />Monitoring</div>
        <div v-if="props.step >= 2" class="ps2-card ps2-bottom b4">Database<br />Monitor</div>

        <div v-if="props.step === 4" class="ps2-card ps2-bottom b5">Log<br />Search</div>
        <div v-if="props.step === 4" class="ps2-card ps2-bottom b6">Security<br />Analysis</div>
        <div v-if="props.step === 4" class="ps2-card ps2-bottom b7">Offline<br />Processing</div>
      </div>
    </div>
  </div>
</template>
