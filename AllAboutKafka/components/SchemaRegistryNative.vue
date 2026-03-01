<template>
  <div class="schema-wrap">
    <div class="schema-canvas">
      <svg class="schema-svg" viewBox="0 0 400 300">
        <defs>
          <filter id="schema-glow" x="-20%" y="-20%" width="140%" height="140%">
            <feGaussianBlur stdDeviation="4" result="blur" />
            <feComposite in="SourceGraphic" in2="blur" operator="over" />
          </filter>
        </defs>

        <!-- Connection Beams -->
        <path class="beam p-beam" d="M100,220 L200,80" stroke="url(#beam-grad)" />
        <path class="beam c-beam" d="M300,220 L200,80" stroke="url(#beam-grad)" />

        <linearGradient id="beam-grad" x1="0%" y1="100%" x2="100%" y2="0%">
          <stop offset="0%" stop-color="var(--ps2-line-active)" stop-opacity="0" />
          <stop offset="50%" stop-color="var(--ps2-line-active)" stop-opacity="0.5" />
          <stop offset="100%" stop-color="var(--ps2-line-active)" stop-opacity="0" />
        </linearGradient>

        <!-- Central Registry -->
        <g class="registry-group">
          <rect x="150" y="40" width="100" height="80" rx="12" class="registry-box" />
          <svg x="182" y="55" width="36" height="36" viewBox="0 0 24 24" class="registry-icon">
            <path fill="white" d="M12,11L12,19L10.5,19L10.5,11L12,11M13.5,11L13.5,19L15,19L15,11L13.5,11M3,5L3,9L21,5L21,9L3,5M3,19A2,2 0 0,1 1,17V5A2,2 0 0,1 3,3H21A2,2 0 0,1 23,5V17A2,2 0 0,1 21,19H3Z" />
          </svg>
          <text x="200" y="105" text-anchor="middle" class="registry-label">REGISTRY</text>
        </g>

        <!-- Producer Node -->
        <g class="node-group producer">
          <circle cx="100" cy="220" r="35" class="node-bg" />
          <svg x="85" y="205" width="30" height="30" viewBox="0 0 24 24">
            <path fill="white" d="M20,13H4V11H20M20,17H4V15H20M20,7H4V5H20M20,19H4A2,2 0 0,1 2,17V5A2,2 0 0,1 4,3H20A2,2 0 0,1 22,5V17A2,2 0 0,1 20,19Z" />
          </svg>
        </g>

        <!-- Consumer Node -->
        <g class="node-group consumer">
          <circle cx="300" cy="220" r="35" class="node-bg" />
          <svg x="285" y="205" width="30" height="30" viewBox="0 0 24 24">
            <path fill="white" d="M21,16.5L12,21.5L3,16.5V7.5L12,2.5L21,7.5V16.5Z" />
          </svg>
        </g>

        <!-- The "Contract" -->
        <g class="contract-group">
          <rect x="175" y="160" width="50" height="65" rx="4" class="contract-paper" />
          <line x1="185" y1="175" x2="215" y2="175" stroke="rgba(255,255,255,0.3)" stroke-width="2" />
          <line x1="185" y1="185" x2="215" y2="185" stroke="rgba(255,255,255,0.3)" stroke-width="2" />
          <line x1="185" y1="195" x2="205" y2="195" stroke="rgba(255,255,255,0.3)" stroke-width="2" />
          <circle cx="210" cy="205" r="6" fill="#fbbf24" filter="url(#schema-glow)" />
        </g>
      </svg>
    </div>
  </div>
</template>

<style scoped>
.schema-wrap {
  width: 100%;
  aspect-ratio: 4 / 3;
  background: rgba(255, 255, 255, 0.4);
  border-radius: 1.5rem;
  border: 1px solid rgba(137, 163, 202, 0.2);
  display: flex;
  align-items: center;
  justify-content: center;
  overflow: hidden;
}

.schema-canvas {
  width: 90%;
  height: 90%;
}

.registry-box {
  fill: #2563eb;
  stroke: rgba(255, 255, 255, 0.2);
  stroke-width: 2;
  filter: drop-shadow(0 8px 15px rgba(37, 99, 235, 0.3));
}

.registry-label {
  fill: #1e293b;
  font-size: 10px;
  font-weight: 800;
  letter-spacing: 0.1em;
}

.node-bg {
  fill: #64748b;
  transition: all 0.3s ease;
}

.producer .node-bg { fill: #f97316; }
.consumer .node-bg { fill: #10b981; }

.contract-paper {
  fill: #334155;
  stroke: rgba(255, 255, 255, 0.1);
}

.beam {
  fill: none;
  stroke-width: 3;
  stroke-dasharray: 10, 5;
  animation: dash 20s linear infinite;
}

@keyframes dash {
  to { stroke-dashoffset: -1000; }
}
</style>
