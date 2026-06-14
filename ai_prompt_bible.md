# AI Prompt Bible
## Project: The Legacy of Tomba & the Evil Pigs' Curse
*Document Revision Date: June 13, 2026*

---

## 1. Character Sprite Sheet (Player: The Savior)
**Purpose**: Generates a strictly formatted, game-ready animation sprite sheet containing an Idle, Run, and Jump cycle from a side-profile view.

* **Tool Used**: Scenario.gg / Nano Banana Pro (or equivalent 2D asset generator)
* **Format**: 1:1 Square Canvas (Recommended for sprite generation)
* **Style**: Retro 90s Anime, Cel-Shaded

### 1.1 Positive Prompt
```text
CRITICAL AI INSTRUCTION: DO NOT draw any text, words, numbers, or labels on the image. DO NOT draw visible grid lines or boxes. Generate ONLY the character poses on a blank background.

Professional 2D game sprite sheet for Godot. Character: A wild fantasy young male hero with bright spiky pink hair, athletic build, wearing green adventure shorts, agile hunter appearance, heroic and expressive anime face. Style: Retro 90s anime video game character, flat colors, cel shading, clean defined black ink outlines, consistent proportions. View: STRICT SIDE PROFILE VIEW ONLY, 100% profile facing right, no front view. Sprite Sheet Layout: Strict mathematical grid of 8 Columns and 3 Rows. All poses must have identical width, identical height, and equal empty spacing between them. The character must be perfectly centered inside each invisible grid cell with no overlapping body parts. Row 1 (Top): Breathing sequence of 6 poses, followed by 2 blank empty spaces. Row 2 (Middle): Complete running cycle sequence of 8 poses with dynamic arm swing. Row 3 (Bottom): Jumping sequence of 6 poses (crouch, takeoff, rising, apex, falling, landing), followed by 2 blank empty spaces. Requirements: Poses arranged LEFT TO RIGHT in chronological order. Every pose must have identical character design, identical hairstyle, identical clothing, full body completely visible. Background: Pure flat white or transparent. Strictly NO scenery, NO written text, NO words, NO letters, NO numbers, NO visible grid lines, NO boxes. Output: Single complete sprite sheet perfectly aligned for an 8x3 cut.
```

### 1.2 Negative Prompt (Crucial for clean extraction)
```text
front view, facing forward, 3/4 view, text, words, numbers, labels, frames, boxes, borders, grid lines, watermarks, realistic, photorealistic, 3d render, shadows, background scenery, bad proportions, bad anatomy, duplicate limbs
```

---

## 2. Environment Tileset (Phase 1: Forest & Village)
**Purpose**: Generates a massive, interconnected cross-section grid of terrain blocks that can be cut into individual tiles for 2D level building in Godot.

* **Format**: 16:9 Landscape (To allow generation of multiple blocks)
* **Style**: Retro 90s Anime, Cel-Shaded Flat Colors

### 2.1 Positive Prompt
```text
Massive complete 2D side-scroller platformer game tileset sprite sheet. PERFECTLY FLAT 2D SIDE-VIEW, cross-section profile view. STRICTLY NO isometric, NO 3D depth, NO perspective. Theme: Lush fantasy forest and retro village. Arranged in a dense grid with many different square block variations. Content must include: top surface grass blocks, left and right grass corners, inner deep underground dark dirt blocks, floating wooden log platforms, grey stone temple bricks, and small decorative bushes. Style: Retro 90s anime video game asset, vibrant green and brown colors, cel-shaded, clean defined dark ink outlines, highly detailed but flat. Background: Pure solid flat white. Completely clean. Output: A full, rich, flat 2D game terrain sprite sheet.
```

### 2.2 Negative Prompt
```text
isometric, 3d, depth, perspective angle, top-down view, text, numbers, labels, gradients, background scenery, realistic, photorealistic, shadows behind blocks
```