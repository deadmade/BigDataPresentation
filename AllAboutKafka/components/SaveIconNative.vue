<template>
  <div class="flex items-center justify-center h-full p-4">
    <div class="icon-container">
      <svg 
        xmlns="http://www.w3.org/2000/svg" 
        width="220" 
        height="220" 
        viewBox="0 0 64 64" 
        fill="none" 
        stroke="#2C3E50" 
        stroke-width="2.2" 
        stroke-linecap="round" 
        stroke-linejoin="round"
        class="flaticon-style-svg"
      >
        <!-- Main Disk Body with Clipped Corner -->
        <path d="M52 56H12C9.79086 56 8 54.2091 8 52V12C8 9.79086 9.79086 8 12 8H46L56 18V52C56 54.2091 54.2091 56 52 56Z" />
        
        <!-- Top Shutter Section -->
        <rect x="18" y="8" width="22" height="18" rx="1" />
        <!-- Slider Notch -->
        <rect x="32" y="12" width="4" height="10" rx="0.5" />
        
        <!-- Bottom Label Area -->
        <rect x="16" y="34" width="32" height="22" rx="1.5" />
        
        <!-- Label Lines -->
        <line x1="22" y1="42" x2="42" y2="42" />
        <line x1="22" y1="48" x2="42" y2="48" />
      </svg>
    </div>
  </div>
</template>

<style scoped>
.icon-container {
  @apply flex items-center justify-center w-80 h-80 bg-white border-2 border-slate-100 rounded-[3rem] shadow-sm;
  background: radial-gradient(circle at 30% 30%, #ffffff 0%, #f8fafc 100%);
}

.flaticon-style-svg {
  filter: drop-shadow(0 2px 4px rgba(0,0,0,0.05));
  transition: transform 0.3s ease;
}

.icon-container:hover .flaticon-style-svg {
  transform: scale(1.05);
}
</style>
