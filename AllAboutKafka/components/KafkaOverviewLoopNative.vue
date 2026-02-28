<script setup lang="ts">
type NodeId = "producer" | "topic" | "broker" | "consumer";

defineProps<{
  activeNode: NodeId;
  nextLabel: string;
  phase?: "entry" | "return";
}>();

const nodes: { id: NodeId; title: string; subtitle: string }[] = [
  { id: "producer", title: "Producer" },
  { id: "topic", title: "Topic" },
  { id: "broker", title: "Broker" },
  { id: "consumer", title: "Consumer" },
];
</script>

<template>
  <div class="k-loop-wrap" :class="`phase-${phase ?? 'entry'}`">
    <div class="k-loop-aura" aria-hidden="true"></div>
    <div class="k-loop-grid">
      <div
        v-for="(node, index) in nodes"
        :key="node.id"
        class="k-loop-node"
        :class="[node.id, { active: node.id === activeNode }]"
        :style="{ '--k-loop-order': String(index + 1) }"
      >
        <p class="k-loop-title">{{ node.title }}</p>
        <p class="k-loop-subtitle">{{ node.subtitle }}</p>
      </div>
    </div>

    <div class="k-loop-rail" aria-hidden="true">
      <div class="k-loop-particle k-loop-particle-a"></div>
      <div class="k-loop-particle k-loop-particle-b"></div>
      <div class="k-loop-particle k-loop-particle-c"></div>
    </div>

    <p class="k-loop-caption"></p>
  </div>
</template>
