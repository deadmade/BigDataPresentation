<template>
  <div class="broker-stage">
    <div class="broker-aura"></div>
    <div class="broker-grid">
      <div v-for="(b, i) in brokers" :key="b.name" 
           class="ps2-card static broker-bg"
           :style="{ '--delay': `${i * 0.15}s` }">
        <div class="ps2-card-content">
          <svg class="ps2-icon large" viewBox="0 0 24 24">
            <path :d="b.icon" fill="currentColor"/>
          </svg>
          <span v-html="b.name"></span>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
const brokers = [
  { name: 'Metrics<br/>Pub/Sub', icon: 'M17,17H7V14L3,18L7,22V19H17V22L21,18L17,14V17M7,7H17V10L21,6L17,2V5H7V2L3,6L7,10V7Z' },
  { name: 'Logging<br/>Pub/Sub', icon: 'M17,17H7V14L3,18L7,22V19H17V22L21,18L17,14V17M7,7H17V10L21,6L17,2V5H7V2L3,6L7,10V7Z' },
  { name: 'Tracking<br/>Pub/Sub', icon: 'M17,17H7V14L3,18L7,22V19H17V22L21,18L17,14V17M7,7H17V10L21,6L17,2V5H7V2L3,6L7,10V7Z' }
];
</script>

<style scoped>
.broker-stage {
  position: relative;
  padding: 1.25rem;
  background: rgba(255, 255, 255, 0.4);
  border-radius: 1.25rem;
  border: 1px solid rgba(137, 163, 202, 0.3);
  box-shadow: none;
  overflow: hidden;
}

.broker-aura {
  position: absolute;
  inset: -20%;
  background: radial-gradient(circle at center, rgba(37, 99, 235, 0.15) 0%, transparent 70%);
  filter: blur(30px);
  animation: aura-float 6s ease-in-out infinite alternate;
}

.broker-grid {
  position: relative;
  z-index: 1;
  display: flex;
  flex-direction: column;
  gap: 0.8rem;
  max-width: 16rem;
  margin-inline: auto;
}

.ps2-card.static {
  position: relative;
  width: 100%;
  left: auto;
  top: auto;
  transform: none;
  min-height: 80px;
  background: linear-gradient(135deg, #3b82f6 0%, #2563eb 100%);
  color: white;
  border-radius: 0.75rem;
  box-shadow: none;
  display: flex;
  align-items: center;
  justify-content: center;
  padding: 0.6rem;
  border: 1px solid rgba(255, 255, 255, 0.3);
  animation: card-enter 0.6s cubic-bezier(0.34, 1.56, 0.64, 1) both;
  animation-delay: var(--delay);
}

.ps2-card.static:hover {
  transform: scale(1.03);
  box-shadow: none;
}

.ps2-icon.large {
  width: 1.8rem;
  height: 1.8rem;
  margin-bottom: 0.25rem;
}

.ps2-card-content {
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 0.2rem;
  text-align: center;
  font-size: 0.85rem;
  font-weight: 600;
  line-height: 1.1;
}

@keyframes aura-float {
  from { transform: scale(1) translate(0, 0); }
  to { transform: scale(1.1) translate(2%, 2%); }
}

@keyframes card-enter {
  from { opacity: 0; transform: translateY(20px) scale(0.9); }
  to { opacity: 1; transform: translateY(0) scale(1); }
}
</style>
