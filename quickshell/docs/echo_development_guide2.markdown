# ECHO: The Master Plan

This isn’t just a desktop config—it’s a fucking manifesto. We’re crafting a music-driven, cyberpunk-themed command center that feels like you’re DJing a matrix-coded rave in a Hong Kong hacker den while coding at 300 MPH. Every pixel pulses, every sound slaps, and every interaction screams bold, unapologetic dominance. This is your Batmobile console on steroids—let’s build it, you glorious bastard!

---

## I. The Creed: Core Philosophy

1. **Music is the Soul**: The desktop beats with your music. The UI is a living visualizer—sine waves, progress bars, and sliders sync to your tracks, making it the heart of *Echo*.
2. **Cyberpunk Matrix HK Vibes**: Glitchy fonts, neon glows, and Hong Kong’s chaotic skyline energy meet *The Matrix* code rain. It’s bold, aggressive, and in-your-face.
3. **Data as Augmentation**: System stats, habits, and notifications are a HUD—floating, blur-enhanced, and togglable, always looking like a hacker’s wet dream.
4. **Speed & Control**: Keybinds rule everything. Animations are slick and fast, with blur effects and eyecandy corners to keep that neon vibe alive.

---

## II. Visual & Auditory Identity: THEME_CYBERPUNK

### Color Palette

| Hex Code  | Name              | Tags                                                 | Behavior                                                                                             |
| :-------- | :---------------- | :--------------------------------------------------- | :--------------------------------------------------------------------------------------------------- |
| `000000`  | black             | background, terminal background                      | static, blurred backdrop                                                  |
| `505050`  | dark grey         | subtle UI dividers, shadows                          | static, blurred edges                                                     |
| `a8a8a8`  | silver            | inactive text, muted labels                          | static                                                                     |
| `ffffff`  | white             | general text, highlight text                         | static                                                                     |
| `ff2525`  | red               | battery < 20%, critical alerts                       | blinks with bittersweet at 20%, 15%, 10%; rapid blink with aerospace orange at 5%                    |
| `ff5750`  | bittersweet       | battery critical gradient, alert animation           | blinks with red per above                                                 |
| `ff5000`  | aerospace orange  | final battery emergency highlight                    | rapid blink with red at 5%                                                 |
| `ff7500`  | safety orange     | battery 40%–21%                                      | static gradient                                                            |
| `ffee25`  | aureolin          | warnings (non-breaking), caution messages            | hover transition with screamin' green; gradient with safety orange at 40%                           |
| `deff5d`  | chartreuse        | hover effect for text, battery 60%–41%               | hover color for emerald                                                    |
| `85f55d`  | screamin' green   | battery 80%–61%                                      | battery swing: emerald ↔ screamin' green at 80%, screamin' green ↔ aureolin at 60%                 |
| `1bd775`  | emerald           | confirmation, success, battery 100%–81%, base text   | battery swing with screamin' green at 80%                                                            |
| `25e5c5`  | seafoam           | links, secondary accent                              | static                                                                     |
| `5ff5ff`  | electric blue     | optional accent, future module highlights            | static                                                                     |
| `9925ff`  | veronica          | decorative highlight, accent, optional module emphasis | static, used for popup borders                                             |
| `dd25dd`  | steel pink        | decorative, accent, possible error border            | static, used for eyecandy corners on hover/tab                             |

### ⚡️ Battery Animation Gradient — Full Behavior

| Battery Level | Color                         | Transition Behavior                          |
| :------------ | :---------------------------- | :------------------------------------------- |
| 100%–81%      | `emerald`                     | static                                       |
| 80%           | `emerald` ↔ `screamin' green` | brief swing animation (2 sec)                |
| 80%–61%       | `screamin' green`             | static                                       |
| 60%           | `screamin' green` ↔ `aureolin`  | brief swing animation (2 sec)                |
| 60%–41%       | `aureolin`                    | static                                       |
| 40%           | `aureolin` ↔ `safety orange`  | brief swing animation (2 sec)                |
| 40%–21%       | `safety orange`               | static                                       |
| 20%           | `bittersweet` ↔ `red`         | blinking gradient (soft, 2 sec cycle)        |
| 15%           | `bittersweet` ↔ `red`         | blinking                                     |
| 10%           | `bittersweet` ↔ `red`         | blinking                                     |
| 5%            | `aerospace orange` ↔ `red`    | rapid blinking, high urgency                 |

### Fonts & Sounds

- **Font**: Orbitron (glitchy, cyberpunk) for headers, Monoid for text—perfect for that matrix HK vibe.
- **Sounds**:
  - `notification.wav`: Sharp synthwave beep.
  - `engine_rev.mp3`: V8 roar for habit streaks (via `mpg123`).
  - `connected.wav`: Synth beep for WiFi connect.
  - `matrix_rain.mp3`: Ambient code rain loop for background (optional).

### Blur & Eyecandy

- **Blur**: Apply `hyprctl` blur settings to all floating elements (Bar, Sidebars, Popups) using Hyprland’s blur config. Set opacity to 0.7 with a neon glow effect.
- **Eyecandy Corners**: On hover or tab selection, corners of menus (e.g., Launcher, Popups) get a `steel pink` glow with rounded edges (radius 8px) and a subtle pulse animation.

---

## III. The Arsenal: Component Breakdown

### 1. Bar (Top Bar)
- **Purpose**: The main HUD.
- **Layout**: Centered music player, implicitHeight 40 for 4K compatibility.
- **Elements**:
  - **Clock**: Orbitron font, glitch animation, `white` text.
  - **System Stats**: CPU, RAM, `silver` text with `emerald` bars.
  - **Music Player**: Centerpiece (implicitWidth dynamic, max 60% of bar).
    - **Data**: MPRIS (Spotify, etc.) via `media_control.py`.
    - **Visuals**:
      - Track title and artist in `emerald`, bold and large.
      - Previous/Next controls (left/right arrows, `veronica` glow on hover).
      - Neon progress bar (`emerald`, pulsing to beat).
    - **Interaction**: Click center triggers popup below (4px gap, floats above desktop).
- **Implementation**: `Bar.qml` with QML animations, styled via `theme.qml`.

### 2. SideBarLeft (The Habit HUD)
- **Purpose**: Track habits with racing flair.
- **Elements**:
  - Habit list (Gym, Code, Work) with `emerald` progress bars.
  - ASCII car animation on completion, `engine_rev.mp3` trigger.
- **Implementation**: `SidebarLeft.qml` with `habits.py` data, blur-enabled.

### 3. SideBarRight (PWA & Command Center)
- **Purpose**: Host PWAs and system controls.
- **Elements**:
  - **PWA Integration**: `PwaManager.qml` renders Brave PWAs as sidebar items. Each PWA gets a `seafoam` icon, clickable to launch in a floating window (blur-enabled).
  - **Notification Center**: Log of past notifications, `silver` text.
  - **Calendar**: Simple view, `white` text.
- **Implementation**: `SidebarRight.qml`, synced with `services/SystemInfo.qml`.

### 4. Notifications
- **Purpose**: Aggressive feedback.
- **Features**:
  - Popups with `steel pink` glitch borders, blur background.
  - Messages from `encouragement.js` (e.g., “You crushed it, you fucking beast!”).
  - `notification.wav` trigger.
- **Implementation**: `NotificationPopup.qml`.

### 5. Popups (System Indicators)
- **Purpose**: On-demand controls, floats above desktop.
- **Features**:
  - **Volume**: `veronica` slider with waveform, controlled via `pactl`.
  - **Brightness**: Radial `emerald` gauge, `brightnessctl`.
  - **WiFi**: Signal bars, `connected.wav` on connect.
  - **Caps Lock**: Blinking `red` “ERROR” popup.
- **Implementation**: `popups/*.qml` with `system_indicators.py`.

### 6. Cliphist Integration
- **Purpose**: Clipboard history.
- **Trigger**: `SUPER + V`.
- **UI**: Searchable list, `steel pink` eyecandy corners on hover.
- **Implementation**: `Cliphist.qml` with `CliphistService.qml`.

### 7. Launcher
- **Purpose**: App launcher.
- **UI**: Centered input, instant search, `emerald` text, `steel pink` corners on hover.
- **Implementation**: `Launcher.qml` with `LauncherService.qml`.

### 8. Music Player Popup
- **Purpose**: Detailed music control on Bar click.
- **Features**:
  - Floats below Bar (4px gap), blur-enabled.
  - **Content**: Album cover, progress slider (`emerald`), volume slider (`veronica`), play/pause/next/prev controls, track title/artist.
  - **Cava Integration**: Custom sine wave visualizer (via `cava` fork), `emerald` waves pulsing to beat.
- **Implementation**: Extend `Bar.qml` with popup logic, sync with `media_control.py`.

---

## IV. Keybindings & Workflow

- **Batmobile Console**: `SUPER + S` toggles Sidebars with sliding animation.
- **Togglable UI**: Individual toggles for Bar (`SUPER + B`), Popups (`SUPER + P`).
- **Music Popup**: Bar center click triggers `SUPER + M` action.

---

## V. Design Language & Vibes: The Hacker DJ’s Dream

### Core Aesthetic
- **Matrix Meets Hong Kong**: Imagine *The Matrix* code rain cascading over a neon-lit Hong Kong skyline—skyscrapers with holographic billboards, bustling streets, and a hacker’s loft overlooking it all. This is the vibe: chaotic, vibrant, and unapologetically bold.
- **Neon Dominance**: Every element glows—`emerald` for success, `veronica` for accents, `red` for urgency. Blur enhances the depth, making it feel like a HUD floating in a digital ether.
- **Music as Visual Pulse**: The UI breathes with your tracks. Cava sine waves, pulsing progress bars, and slider animations sync to the BPM, turning *Echo* into a living DJ booth.

### Design Principles
1. **In-Your-Face Boldness**: Text is large, icons are sharp, and animations are aggressive. Blind those mfers with neon glare—use 4K scaling (implicitHeight 40) to dominate the screen.
2. **Eyecandy Overload**: Corners on hover/tab get `steel pink` glows with 8px radius pulses. Sliders and gauges have dynamic gradients (e.g., `emerald` to `screamin' green`).
3. **Float & Blur**: All elements (Bar, Popups, Sidebars) float above the desktop with Hyprland blur (opacity 0.7, neon glow). It’s like a holographic overlay in a cyberpunk flick.
4. **Hacker DJ Flow**: The music player popup is the climax—album art, sliders, and cava waves create a sensory explosion. Keybinds keep it snappy, mimicking a DJ’s live mix.

### Two-Month Roadmap
- **Month 1**: Build core components (Bar, Sidebars, Popups) with QML and blur. Integrate `habits.py` and `media_control.py`.
- **Month 2**: Polish animations, add cava, refine PWA sidebar, and test on 4K. Finalize GTK global theme with custom icons.

This *Echo* setup is your ticket to ruling the digital underworld, you sexy niche soul. It’s a middle finger to your soul-sucking job and a love letter to your UI fetish. Bust that nut when it’s done—let’s fucking go!