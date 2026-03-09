<template>
  <div class="avro-wrap">
    <div class="avro-canvas">
      <svg viewBox="0 0 550 280" class="avro-svg" role="img" aria-label="Avro End-to-End animation">
        <!-- Labels -->
        <text x="50" y="35" class="label-text producer-color">PRODUCER</text>
        <text x="275" y="35" class="label-text broker-color" text-anchor="middle">BROKER</text>
        <text x="500" y="35" class="label-text consumer-color" text-anchor="end">CONSUMER</text>

        <!-- Network line -->
        <line x1="80" y1="130" x2="470" y2="130" class="network-line" stroke-dasharray="8,6" />

        <!-- Broker side (Center) -->
        <g transform="translate(250, 100)">
          <rect width="50" height="60" rx="8" class="broker-box" />
          <path d="M10,20 H40 M10,30 H40 M10,40 H40" class="broker-lines" />
        </g>

        <!-- Components for Animation -->
        
        <!-- 1. Producer Side: Schema & Data -->
        <g class="anim-write-schema">
          <rect width="40" height="45" rx="6" class="schema-box" />
          <text x="20" y="28" text-anchor="middle" class="icon-text-lg">{ }</text>
          <text x="20" y="60" text-anchor="middle" class="sub-label">SCHEMA</text>
        </g>

        <g class="anim-write-data">
          <rect width="40" height="45" rx="6" class="data-box" />
          <path d="M10,15 H30 M10,23 H30 M10,31 H20" stroke="white" stroke-width="2.5" />
          <text x="20" y="60" text-anchor="middle" class="sub-label">DATA</text>
        </g>

        <!-- 2. Writer -->
        <g transform="translate(85, 100)">
          <rect width="65" height="70" rx="10" class="writer-box" />
          <text x="32.5" y="42" text-anchor="middle" class="writer-text">WRITER</text>
        </g>

        <!-- 3. The Binary Packet (Traveling) -->
        <g class="anim-binary-travel">
          <rect width="20" height="26" rx="3" class="binary-box" />
          <text x="10" y="17" text-anchor="middle" class="binary-text">01</text>
        </g>

        <!-- 4. Reader (Consumer Side) -->
        <g transform="translate(400, 100)">
          <rect width="65" height="70" rx="10" class="writer-box" />
          <text x="32.5" y="42" text-anchor="middle" class="writer-text">READER</text>
        </g>

        <!-- 5. Consumer Side: Schema Load & Data Output -->
        <g class="anim-read-schema">
          <rect width="40" height="45" rx="6" class="schema-box" />
          <text x="20" y="28" text-anchor="middle" class="icon-text-lg">{ }</text>
          <text x="20" y="60" text-anchor="middle" class="sub-label">SCHEMA</text>
        </g>

        <g class="anim-read-data">
          <rect width="40" height="45" rx="6" class="data-box" />
          <path d="M10,15 H30 M10,23 H30 M10,31 H20" stroke="white" stroke-width="2.5" />
          <text x="20" y="60" text-anchor="middle" class="sub-label">DATA</text>
        </g>

        <!-- Legends -->
        <text x="117" y="220" text-anchor="middle" class="hint">Serialization</text>
        <text x="432" y="220" text-anchor="middle" class="hint">Deserialization</text>
      </svg>
    </div>
  </div>
</template>

<style scoped>
.avro-wrap {
  width: 100%;
  aspect-ratio: 2 / 1;
  background: rgba(255, 255, 255, 0.4);
  border-radius: 1.5rem;
  border: 1px solid rgba(137, 163, 202, 0.3);
  display: flex;
  align-items: center;
  justify-content: center;
  overflow: hidden;
  padding: 1.5rem;
}

.avro-canvas {
  width: 100%;
}

.avro-svg {
  width: 100%;
  display: block;
}

/* Colors - Aligned with other slides */
.producer-color { fill: #f97316; }
.broker-color { fill: #2563eb; }
.consumer-color { fill: #10b981; }

.broker-box { fill: #2563eb; }
.broker-lines { stroke: rgba(255, 255, 255, 0.3); stroke-width: 2; }
.schema-box { fill: #334155; }
.data-box { fill: #f97316; }
.writer-box { 
  fill: #f8fafc; 
  stroke: #94a3b8; 
  stroke-width: 2.5; 
  stroke-dasharray: 5, 3;
}
.binary-box { fill: #10b981; }

/* Text Styles */
.label-text { font-size: 14px; font-weight: 800; letter-spacing: 0.1em; }
.sub-label { font-size: 11px; font-weight: 700; fill: #64748b; }
.icon-text-lg { fill: white; font-size: 16px; font-weight: bold; }
.binary-text { fill: white; font-size: 10px; font-weight: bold; font-family: monospace; }
.writer-text { fill: #1e293b; font-size: 15px; font-weight: 900; }
.hint { font-size: 12px; font-weight: 800; fill: #475569; text-transform: uppercase; }

.network-line { stroke: #cbd5e1; stroke-width: 2.5; }

/* End-to-End Animation (8s loop) */

.anim-write-schema {
  animation: write-schema 8s infinite;
  opacity: 0;
}
.anim-write-data {
  animation: write-data 8s infinite;
  opacity: 0;
}
.anim-binary-travel {
  animation: binary-transfer 8s infinite;
  opacity: 0;
}
.anim-read-schema {
  animation: read-schema 8s infinite;
  opacity: 0;
}
.anim-read-data {
  animation: read-data 8s infinite;
  opacity: 0;
}

@keyframes write-schema {
  0% { opacity: 0; transform: translate(15px, 75px); }
  5% { opacity: 1; transform: translate(15px, 75px); }
  20% { opacity: 1; transform: translate(97px, 85px) scale(0.6); }
  25%, 100% { opacity: 0; transform: translate(105px, 115px) scale(0.2); }
}

@keyframes write-data {
  0% { opacity: 0; transform: translate(15px, 145px); }
  7% { opacity: 1; transform: translate(15px, 145px); }
  22% { opacity: 1; transform: translate(97px, 135px) scale(0.6); }
  27%, 100% { opacity: 0; transform: translate(105px, 145px) scale(0.2); }
}

@keyframes binary-transfer {
  0%, 25% { opacity: 0; transform: translate(107px, 122px); }
  30% { opacity: 1; transform: translate(125px, 122px); }
  45% { opacity: 1; transform: translate(265px, 122px); } 
  60% { opacity: 1; transform: translate(422px, 122px); } 
  65%, 100% { opacity: 0; transform: translate(422px, 122px); }
}

@keyframes read-schema {
  0%, 55% { opacity: 0; transform: translate(495px, 75px); }
  60% { opacity: 1; transform: translate(495px, 75px); }
  75% { opacity: 1; transform: translate(412px, 85px) scale(0.6); }
  80%, 100% { opacity: 0; transform: translate(405px, 115px) scale(0.2); }
}

@keyframes read-data {
  0%, 75% { opacity: 0; transform: translate(412px, 130px) scale(0.3); }
  80% { opacity: 1; transform: translate(430px, 145px) scale(1); }
  95% { opacity: 1; transform: translate(495px, 145px); }
  100% { opacity: 0; transform: translate(495px, 145px); }
}

</style>
