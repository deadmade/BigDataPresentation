<template>
  <div class="formats-container">
    <div class="format-card json">
      <div class="format-icon">
        <svg viewBox="0 0 24 24"><path fill="currentColor" d="M5,3H7V5H5V10A2,2 0 0,1 3,12A2,2 0 0,1 5,14V19H7V21H5C3.93,21 3,20.1 3,19V15.5A2,2 0 0,0 1,13.5V10.5A2,2 0 0,0 3,8.5V5A2,2 0 0,1 5,3M19,3H17V5H19V10A2,2 0 0,1 21,12A2,2 0 0,1 19,14V19H17V21H19A2,2 0 0,0 21,19V15.5A2,2 0 0,1 23,13.5V10.5A2,2 0 0,1 21,8.5V5A2,2 0 0,0 19,3Z" /></svg>
      </div>
      <h3>JSON</h3>
      <div class="visual-hint">
        <div class="line" style="width: 60%"></div>
        <div class="line" style="width: 80%"></div>
        <div class="line" style="width: 40%"></div>
      </div>
      <p>Einfach, lesbar, weit verbreitet.</p>
    </div>

    <div class="format-card xml">
      <div class="format-icon">
        <svg viewBox="0 0 24 24"><path fill="currentColor" d="M12.89,3L14.85,3.4L11.11,21L9.15,20.6L12.89,3M19.59,12L16,8.41V5.58L22.42,12L16,18.41V15.58L19.59,12M1.58,12L8,5.58V8.41L4.41,12L8,15.58V18.41L1.58,12Z" /></svg>
      </div>
      <h3>XML</h3>
      <div class="visual-hint">
        <div class="line" style="width: 70%"></div>
        <div class="line" style="width: 50%"></div>
        <div class="line" style="width: 90%"></div>
      </div>
      <p>Streng strukturiert, aber verbose.</p>
    </div>

    <div class="format-card avro">
      <div class="format-icon">
        <svg viewBox="0 0 24 24"><path fill="currentColor" d="M12,2L4.5,20.29L5.21,21L12,18L18.79,21L19.5,20.29L12,2Z" /></svg>
      </div>
      <h3>Apache Avro</h3>
      <div class="visual-hint binary">
        <div class="bit"></div><div class="bit"></div><div class="bit"></div><div class="bit"></div>
        <div class="bit"></div><div class="bit"></div><div class="bit"></div><div class="bit"></div>
      </div>
      <p>Kompakt, schema-basiert, performant.</p>
    </div>
  </div>
</template>

<style scoped>
.formats-container {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  gap: 1.5rem;
  margin-top: 2rem;
}

.format-card {
  background: white;
  padding: 1.5rem;
  border-radius: 1.25rem;
  border: 1px solid #e2e8f0;
  text-align: center;
  position: relative;
  transition: all 0.3s ease;
  box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.05);
}

.format-card:hover {
  transform: translateY(-8px);
  box-shadow: 0 20px 25px -5px rgba(0, 0, 0, 0.1);
  border-color: #cbd5e1;
}

.format-icon {
  width: 3rem;
  height: 3rem;
  margin: 0 auto 1rem;
  padding: 0.6rem;
  border-radius: 0.75rem;
  background: #f1f5f9;
  color: #64748b;
}

.json .format-icon { color: #eab308; background: #fefce8; }
.xml .format-icon { color: #ef4444; background: #fef2f2; }
.avro .format-icon { color: #3b82f6; background: #eff6ff; }

h3 {
  margin: 0 0 0.5rem;
  font-size: 1.25rem;
  font-weight: 700;
}

p {
  margin: 0;
  font-size: 0.95rem;
  color: #64748b;
  line-height: 1.4;
}

.visual-hint {
  display: flex;
  flex-direction: column;
  gap: 4px;
  margin: 1rem auto;
  align-items: center;
}

.line {
  height: 4px;
  background: #e2e8f0;
  border-radius: 2px;
}

.visual-hint.binary {
  flex-direction: row;
  flex-wrap: wrap;
  width: 60px;
  justify-content: center;
}

.bit {
  width: 8px;
  height: 8px;
  background: #3b82f6;
  border-radius: 2px;
  opacity: 0.4;
}
</style>
