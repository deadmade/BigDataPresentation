<template>
  <div class="batch-wrap">
    <div class="batch-canvas">
      <svg viewBox="0 0 400 200" class="batch-svg">
        <!-- Labels -->
        <text x="50" y="30" class="label">PRODUCER</text>
        <text x="350" y="30" class="label" text-anchor="end">BROKER</text>
        
        <!-- Network Line -->
        <line x1="80" y1="110" x2="320" y2="110" class="network-line" stroke-dasharray="8,6" />

        <!-- Broker Icon -->
        <g transform="translate(330, 85)">
          <rect width="40" height="50" rx="4" class="broker-box" />
          <path d="M10,15 H30 M10,25 H30 M10,35 H30" stroke="rgba(255,255,255,0.3)" stroke-width="2" />
        </g>

        <!-- The Batch Container (The "Box") -->
        <g class="batch-container" transform="translate(60, 85)">
          <rect width="60" height="50" rx="6" class="container-outline" />
          
          <!-- Individual Messages in Batch -->
          <rect x="8" y="10" width="12" height="30" rx="2" class="msg m1" />
          <rect x="24" y="10" width="12" height="30" rx="2" class="msg m2" />
          <rect x="40" y="10" width="12" height="30" rx="2" class="msg m3" />
        </g>

        <!-- Sending Animation Group -->
        <g class="shipping-batch">
          <rect x="0" y="0" width="60" height="50" rx="6" class="container-fill" />
          <rect x="8" y="10" width="12" height="30" rx="2" fill="white" opacity="0.8" />
          <rect x="24" y="10" width="12" height="30" rx="2" fill="white" opacity="0.8" />
          <rect x="40" y="10" width="12" height="30" rx="2" fill="white" opacity="0.8" />
        </g>
      </svg>
    </div>
  </div>
</template>

<style scoped>
.batch-wrap {
  width: 100%;
  aspect-ratio: 2 / 1;
  background: rgba(255, 255, 255, 0.4);
  border-radius: 1.5rem;
  border: 1px solid rgba(137, 163, 202, 0.2);
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  padding: 1rem;
}

.batch-canvas { width: 100%; position: relative; }

.label {
  font-size: 10px;
  font-weight: 800;
  fill: #64748b;
  letter-spacing: 0.1em;
}

.network-line {
  stroke: #cbd5e1;
  stroke-width: 2;
}

.broker-box {
  fill: #2563eb;
}

.container-outline {
  fill: none;
  stroke: #f97316;
  stroke-width: 2;
  stroke-dasharray: 4,2;
}

.msg {
  fill: #f97316;
  opacity: 0;
  animation: msg-appear 4s infinite;
}

.m1 { animation-delay: 0.5s; }
.m2 { animation-delay: 1.2s; }
.m3 { animation-delay: 1.9s; }

@keyframes msg-appear {
  0%, 10% { opacity: 0; transform: translateY(5px); }
  20%, 60% { opacity: 1; transform: translateY(0); }
  70%, 100% { opacity: 0; }
}

.shipping-batch {
  opacity: 0;
  animation: ship 4s infinite;
}

.container-fill {
  fill: #f97316;
}

@keyframes ship {
  0%, 65% { opacity: 0; transform: translate(60px, 85px); }
  70% { opacity: 1; transform: translate(60px, 85px); }
  90% { opacity: 1; transform: translate(270px, 85px); }
  100% { opacity: 0; transform: translate(270px, 85px); }
}
</style>
