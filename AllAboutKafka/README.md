# AllAboutKafka (Slidev)

This repository uses Slidev as the presentation stack.

## Quickstart

```bash
npm install
npm run dev
```

## Build and export

```bash
npm run build
npm run export
```

## Project structure

- `slides.md`: Main Slidev deck source.
- `styles/index.css`: Global visual language and animation styles.
- `components/`: Reusable visual/animation components.
- `public/images/`: Deck media served by Slidev.
- `AllAboutKafka.md`: Legacy Marp-style snapshot (reference only).

## Animation authoring

Native animations are implemented in Slidev/Vue components:

- `components/KafkaFlowNative.vue`
- `components/ConsumerRebalanceNative.vue`
- `components/RetentionModeNative.vue`

These components use Slidev click steps (`v-click`) for progressive reveal.
