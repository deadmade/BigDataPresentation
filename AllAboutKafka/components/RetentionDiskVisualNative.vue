<template>
  <div class="disk-retention-wrap">
    <div class="visual-container">
      <!-- Disk Icon -->
      <div class="disk-icon" v-click="1">
        <div class="disk-cylinder">
          <div class="top"></div>
          <div class="side"></div>
          <div class="label">PERSISTENT STORAGE</div>
        </div>
      </div>

      <!-- Log Path -->
      <div class="log-path">
        <div class="segments-container">
          <!-- Expired Segment -->
          <div class="segment expired" v-click="2">
            <div class="segment-box">
              <span class="status">DELETED</span>
              <span class="info">Old > 7 Days</span>
            </div>
            <div class="connector dashed"></div>
          </div>

          <!-- Retained Segments -->
          <div class="segment retained" v-click="1">
            <div class="segment-box">
              <span class="status">RETAINED</span>
              <span class="info">Log Segment 001</span>
            </div>
            <div class="connector"></div>
          </div>

          <div class="segment retained" v-click="1">
            <div class="segment-box">
              <span class="status">RETAINED</span>
              <span class="info">Log Segment 002</span>
            </div>
            <div class="connector"></div>
          </div>

          <!-- Active Segment -->
          <div class="segment active" v-click="3">
            <div class="segment-box">
              <div class="writing-indicator"></div>
              <span class="status">ACTIVE</span>
              <span class="info">Writing...</span>
            </div>
          </div>
        </div>

        <!-- Retention Window Overlay -->
        <div class="retention-window" v-click="2">
          <div class="window-border"></div>
          <div class="window-label">RETENTION POLICY WINDOW</div>
        </div>
      </div>
    </div>
  </div>
</template>

<style scoped>
.disk-retention-wrap {
  width: 100%;
  height: 350px;
  background: rgba(15, 23, 42, 0.6);
  border-radius: 1.5rem;
  padding: 2rem;
  display: flex;
  align-items: center;
  justify-content: center;
  border: 1px solid rgba(255, 255, 255, 0.1);
  overflow: hidden;
}

.visual-container {
  display: flex;
  align-items: center;
  gap: 3rem;
  width: 100%;
  max-width: 800px;
}

/* Disk Cylinder Style */
.disk-icon {
  flex-shrink: 0;
  width: 120px;
  height: 140px;
  position: relative;
}

.disk-cylinder {
  width: 100%;
  height: 100%;
}

.disk-cylinder .top {
  width: 100px;
  height: 40px;
  background: #64748b;
  border-radius: 50%;
  border: 2px solid #94a3b8;
  position: absolute;
  top: 0;
  left: 10px;
  z-index: 2;
}

.disk-cylinder .side {
  width: 100px;
  height: 100px;
  background: #475569;
  border: 2px solid #94a3b8;
  border-top: none;
  border-radius: 0 0 50px 50px / 0 0 20px 20px;
  position: absolute;
  top: 20px;
  left: 10px;
  display: flex;
  align-items: center;
  justify-content: center;
}

.disk-cylinder .label {
  position: absolute;
  bottom: -30px;
  left: 0;
  width: 120px;
  text-align: center;
  font-size: 0.7rem;
  font-weight: 800;
  color: #94a3b8;
  letter-spacing: 0.1em;
}

/* Log Segments */
.log-path {
  position: relative;
  flex-grow: 1;
  height: 200px;
  display: flex;
  align-items: center;
}

.segments-container {
  display: flex;
  gap: 0;
  align-items: center;
  z-index: 2;
}

.segment {
  display: flex;
  align-items: center;
}

.segment-box {
  width: 120px;
  height: 80px;
  border-radius: 0.5rem;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  gap: 0.25rem;
  position: relative;
  transition: all 0.3s ease;
}

.connector {
  width: 30px;
  height: 4px;
  background: #334155;
}

.connector.dashed {
  background: none;
  border-top: 4px dashed #ef4444;
  opacity: 0.5;
}

.status {
  font-size: 0.6rem;
  font-weight: 900;
  letter-spacing: 0.05em;
}

.info {
  font-size: 0.6rem;
  opacity: 0.8;
}

/* Segment States */
.retained .segment-box {
  background: #1e293b;
  border: 2px solid #3b82f6;
  color: #3b82f6;
  box-shadow: 0 0 15px rgba(59, 130, 246, 0.2);
}

.active .segment-box {
  background: #1e293b;
  border: 2px solid #22c55e;
  color: #22c55e;
  box-shadow: 0 0 20px rgba(34, 197, 94, 0.3);
}

.expired .segment-box {
  background: rgba(239, 68, 68, 0.1);
  border: 2px dashed #ef4444;
  color: #ef4444;
  opacity: 0.4;
}

/* Writing Indicator */
.writing-indicator {
  position: absolute;
  top: 5px;
  right: 5px;
  width: 8px;
  height: 8px;
  background: #22c55e;
  border-radius: 50%;
  animation: pulse 1s infinite;
}

@keyframes pulse {
  0% { transform: scale(1); opacity: 1; }
  50% { transform: scale(1.5); opacity: 0.5; }
  100% { transform: scale(1); opacity: 1; }
}

/* Retention Window Overlay */
.retention-window {
  position: absolute;
  left: 140px; /* Aligned to cover retained segments */
  width: 290px;
  height: 120px;
  pointer-events: none;
}

.window-border {
  position: absolute;
  inset: 0;
  border: 2px solid #f59e0b;
  border-radius: 1rem;
  background: rgba(245, 158, 11, 0.05);
}

.window-label {
  position: absolute;
  top: -25px;
  left: 50%;
  transform: translateX(-50%);
  background: #f59e0b;
  color: #000;
  font-size: 0.6rem;
  font-weight: 900;
  padding: 2px 10px;
  border-radius: 99px;
  white-space: nowrap;
}
</style>
