<template>
  <div class="consumer-stage">
    <div class="consumer-aura"></div>
    <div class="consumer-grid">
      <div v-for="(c, i) in consumers" :key="c.name" 
           class="ps2-card static consumer-bg"
           :style="{ '--delay': `${i * 0.1}s` }">
        <div class="ps2-card-content">
          <svg class="ps2-icon large" viewBox="0 0 24 24">
            <path :d="c.icon" fill="currentColor"/>
          </svg>
          <span v-html="c.name"></span>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
const consumers = [
  { name: 'Metrics UI', icon: 'M21,16.5C21,16.88 20.79,17.21 20.47,17.38L12.57,21.82C12.41,21.94 12.21,22 12,22C11.79,22 11.59,21.94 11.43,21.82L3.53,17.38C3.21,17.21 3,16.88 3,16.5V7.5C3,7.12 3.21,6.79 3.53,6.62L11.43,2.18C11.59,2.06 11.79,2 12,2C12.21,2 12.41,2.06 12.57,2.18L20.47,6.62C20.79,6.79 21,7.12 21,7.5V16.5Z' },
  { name: 'Metrics<br/>Analysis', icon: 'M16,11.78L20.24,4.45L21.97,5.45L16.74,14.5L10.23,10.75L5.46,19H22V21H2V3H4V17.54L9.5,8L16,11.78Z' },
  { name: 'Active<br/>Monitoring', icon: 'M12,2C6.5,2 2,6.5 2,12C2,17.5 6.5,22 12,22C17.5,22 22,17.5 22,12C22,6.5 17.5,2,12,2M12,4C16.4,4 20,7.6 20,12C20,14.2 19.1,16.2 17.7,17.7L16.3,16.3C17.4,15.2 18,13.7 18,12C18,8.7 15.3,6 12,6C8.7,6 6,8.7 6,12C6,13.7 6.6,15.2 7.7,16.3L6.3,17.7C4.9,16.2 4,14.2 4,12C4,7.6 7.6,4 12,4M12,8C9.8,8 8,9.8 8,12C8,13.1 8.4,14.1 9.1,14.9L10.5,13.5C10.2,13.1 10,12.6 10,12C10,10.9 10.9,10 12,10C13.1,10 14,10.9 14,12C14,12.6 13.8,13.1 13.5,13.5L14.9,14.9C15.6,14.1 16,13.1 16,12C16,9.8 14.2,8 12,8Z' },
  { name: 'Offline<br/>Processing', icon: 'M12,2L4.5,20.29L5.21,21L12,18L18.79,21L19.5,20.29L12,2Z' }
];
</script>

<style scoped>
.consumer-stage {
  position: relative;
  padding: 1.5rem;
  background: rgba(255, 255, 255, 0.4);
  border-radius: 1.25rem;
  border: 1px solid rgba(137, 163, 202, 0.3);
  box-shadow: none;
  overflow: hidden;
}

.consumer-aura {
  position: absolute;
  inset: -20%;
  background: radial-gradient(circle at center, rgba(16, 185, 129, 0.15) 0%, transparent 70%);
  filter: blur(30px);
  animation: aura-float 6s ease-in-out infinite alternate;
}

.consumer-grid {
  position: relative;
  z-index: 1;
  display: grid;
  grid-template-columns: repeat(2, 1fr);
  gap: 1rem;
  max-width: 28rem;
}

.ps2-card.static {
  position: relative;
  width: 100%;
  left: auto;
  top: auto;
  transform: none;
  min-height: 100px;
  background: linear-gradient(135deg, #10b981 0%, #059669 100%);
  color: white;
  border-radius: 0.75rem;
  box-shadow: none;
  display: flex;
  align-items: center;
  justify-content: center;
  padding: 0.75rem;
  border: 1px solid rgba(255, 255, 255, 0.3);
  animation: card-enter 0.6s cubic-bezier(0.34, 1.56, 0.64, 1) both;
  animation-delay: var(--delay);
}

.ps2-card.static:hover {
  transform: scale(1.05);
  box-shadow: none;
}

.ps2-icon.large {
  width: 2rem;
  height: 2rem;
  margin-bottom: 0.3rem;
}

.ps2-card-content {
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 0.25rem;
  text-align: center;
  font-size: 0.85rem;
  font-weight: 600;
  line-height: 1.15;
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
