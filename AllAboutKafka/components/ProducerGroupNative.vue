<template>
  <div class="producer-stage">
    <div class="producer-aura"></div>
    <div class="producer-grid">
      <div v-for="(p, i) in producers" :key="p.name" 
           class="ps2-card static producer-bg"
           :style="{ '--delay': `${i * 0.1}s` }">
        <div class="ps2-card-content">
          <svg class="ps2-icon large" viewBox="0 0 24 24">
            <path :d="p.icon" fill="currentColor"/>
          </svg>
          <span v-html="p.name"></span>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
const producers = [
  { name: 'Frontend<br/>Server', icon: 'M20,13H4V11H20M20,17H4V15H20M20,7H4V5H20M20,19H4A2,2 0 0,1 2,17V5A2,2 0 0,1 4,3H20A2,2 0 0,1 22,5V17A2,2 0 0,1 20,19Z' },
  { name: 'Database<br/>Server', icon: 'M12,3C7.58,3 4,4.79 4,7C4,9.21 7.58,11 12,11C16.42,11 20,9.21 20,7C20,4.79 16.42,3 12,3M4,9V12C4,14.21 7.58,16 12,16C16.42,16 20,14.21 20,12V9C20,11.21 16.42,13 12,13C7.58,13 4,11.21 4,9M4,14V17C4,19.21 7.58,21 12,21C16.42,21 20,19.21 20,17V14C20,16.21 16.42,18 12,18C7.58,18 4,16.21 4,14Z' },
  { name: 'Chat<br/>Server', icon: 'M20,2H4A2,2 0 0,0 2,4V22L6,18H20A2,2 0 0,0 22,16V4A2,2 0 0,0 20,2Z' },
  { name: 'Shopping<br/>Cart', icon: 'M17,18A2,2 0 0,1 19,20A2,2 0 0,1 17,22C15.89,22 15,21.1 15,20C15,18.89 15.89,18 17,18M1,2H4.27L5.21,4H20A1,1 0 0,1 21,5C21,5.17 20.95,5.34 20.88,5.5L17.3,11.97C16.96,12.58 16.3,13 15.55,13H8.1L7.2,14.63L7.17,14.75A0.25,0.25 0 0,0 7.42,15H19V17H7A2,2 0 0,1 5,15C5,14.65 5.09,14.32 5.24,14.04L6.6,11.59L3,4H1V2M7,18A2,2 0 0,1 9,20A2,2 0 0,1 7,22C5.89,22 5,21.1 5,20C5,18.89 5.89,18 7,18M18.5,9H15.5V6H14V9H11V10.5H14V13.5H15.5V10.5H18.5V9Z' }
];
</script>

<style scoped>
.producer-stage {
  position: relative;
  padding: 2rem;
  background: rgba(255, 255, 255, 0.4);
  border-radius: 1.5rem;
  border: 1px solid rgba(137, 163, 202, 0.3);
  box-shadow: none;
  overflow: hidden;
}

.producer-aura {
  position: absolute;
  inset: -20%;
  background: radial-gradient(circle at center, rgba(249, 115, 22, 0.15) 0%, transparent 70%);
  filter: blur(40px);
  animation: aura-float 6s ease-in-out infinite alternate;
}

.producer-grid {
  position: relative;
  z-index: 1;
  display: grid;
  grid-template-columns: repeat(2, 1fr);
  gap: 1.5rem;
  max-width: 32rem;
}

.ps2-card.static {
  position: relative;
  width: 100%;
  left: auto;
  top: auto;
  transform: none;
  min-height: 120px;
  background: linear-gradient(135deg, #f97316 0%, #ea580c 100%);
  color: white;
  border-radius: 1rem;
  box-shadow: none;
  display: flex;
  align-items: center;
  justify-content: center;
  padding: 1rem;
  border: 1px solid rgba(255, 255, 255, 0.3);
  animation: card-enter 0.6s cubic-bezier(0.34, 1.56, 0.64, 1) both;
  animation-delay: var(--delay);
}

.ps2-card.static:hover {
  transform: scale(1.05);
  box-shadow: none;
}

.ps2-icon.large {
  width: 2.2rem;
  height: 2.2rem;
  margin-bottom: 0.4rem;
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
