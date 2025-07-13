# ECHO: The Master Plan

This is not just a desktop config. This is a statement. We're building a music-driven, cyberpunk-themed command center that makes you feel like you’re DJing a cyber-rave while coding at 200 MPH. Every interaction, every animation, every notification is designed to be **lethal**, responsive, and drenched in neon.

This is your Batmobile console. Let's fucking go.

---

## I. The Creed: Core Philosophy

1.  **Music is the Heartbeat:** The entire desktop pulses with your music. The UI is not static; it's a living visualizer for your workflow and your soundtrack.
2.  **Cyberpunk, Unhinged:** The aesthetic is pure, unfiltered cyberpunk. Glitchy fonts, neon glows, synthwave sounds, and aggressive, motivational feedback.
3.  **Information as an Augmentation:** Data (system stats, habits, notifications) is presented as a Heads-Up Display (HUD). It's there when you need it, gone when you don't, and always looks badass.
4.  **Speed & Control:** Every element is togglable via keybinds. Animations are slick, fast, and responsive. This is about building the most efficient, high-octane workflow possible.

---

## II. Visual & Auditory Identity: THEME_CYBERPUNK

This is the DNA of the look and feel.

### Color Palette

| Hex Code  | Name              | Tags                                                 | Behavior                                                                                             |
| :-------- | :---------------- | :--------------------------------------------------- | :--------------------------------------------------------------------------------------------------- |
| `000000`  | black             | background, terminal background                      | static                                                                                               |
| `505050`  | dark grey         | subtle UI dividers, shadows                          | static                                                                                               |
| `a8a8a8`  | silver            | inactive text, muted labels                          | static                                                                                               |
| `ffffff`  | white             | general text, highlight text                         | static                                                                                               |
| `ff2525`  | red               | battery < 20%, critical alerts                       | blinks with bittersweet at 20%, 15%, 10%; blinks with aerospace orange at 5% — fast, urgent          |
| `ff5750`  | bittersweet       | battery critical gradient, alert animation           | blinks with red per above, part of low battery warning                                               |
| `ff5000`  | aerospace orange  | final battery emergency highlight, urgent call to action | blinks with red at 5% — fast, attention grab                                                         |
| `ff7500`  | safety orange     | battery 40%–21%                                      | part of battery level gradient, static otherwise                                                     |
| `ffee25`  | aureolin          | warnings (non-breaking), caution messages            | battery 60%–41%, hover transition (with screamin' green); gradient swing with safety orange at 40% |
| `deff5d`  | chartreuse        | hover effect for text, battery 60%–41%               | hover color for emerald, battery gradient with aureolin                                              |
| `85f55d`  | screamin' green   | battery 80%–61%                                      | battery swing: emerald ↔ screamin' green at 80%, screamin' green ↔ aureolin at 60%                 |
| `1bd775`  | emerald           | confirmation, success, battery 100%–81%, base text   | battery swing with screamin' green at 80%                                                            |
| `25e5c5`  | seafoam           | links, secondary accent                              | static                                                                                               |
| `5ff5ff`  | electric blue     | optional accent, future module highlights            | static                                                                                               |
| `9925ff`  | veronica          | decorative highlight, accent, optional module emphasis | static                                                                                               |
| `dd25dd`  | steel pink        | decorative, accent, possible error border            | static                                                                                               |

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

*   **Font:** We need a glitchy, cyberpunk-style font. This will be used for the clock and other key UI elements.
*   **Sounds:**
    *   `notification.wav`: A sharp, synthwave-inspired sound for notifications.
    *   `engine_rev.mp3`: V8 roar for habit streak completion (played via `mpg123`).
    *   `connected.wav`: A clean, synth beep for WiFi connection.

---

## III. The Arsenal: Component Breakdown

### 1. Bar (Top Bar)
*   **Purpose:** The main dashboard.
*   **Elements:**
    *   **Clock:** Uses the cyberpunk font with a subtle glitch animation.
    *   **System Stats:** CPU, RAM, time. Clean, readable, and styled with `silver` and `white`.
    *   **Music Player:** This is the centerpiece.
        *   **Data:** Pulls from MPRIS (Spotify, etc.).
        *   **Visuals:**
            *   Large, prominent album art.
            *   Track title and artist.
            *   Play/Pause toggle.
            *   **Neon Progress Bar:** A sleek `emerald` progress bar for the track timeline. It should have a subtle pulse/glow animation that syncs to the beat of the music.

### 2. SideBarLeft (The Habit HUD)
*   **Purpose:** Track your personal stats and progress.
*   **Elements:**
    *   **Habit Tracker:** A clear list of daily goals (Gym, Code Commits, etc.).
    *   **Racing Twist:**
        *   Completing a habit triggers a notification with an ASCII art car and an engine rev sound (`mpg123`).
        *   Hitting a streak could make the car "level up" or the engine sound more powerful.

### 3. SideBarRight (Command & Control)
*   **Purpose:** Manage system state and information.
*   **Elements:**
    *   **Notification Center:** A log of all past notifications.
    *   **Calendar:** A simple, clean calendar view.
    *   **System Tray:** For background application icons.

### 4. Notifications
*   **Purpose:** Provide aggressive, motivational feedback.
*   **Features:**
    *   **Style:** Popups with glitchy `steel pink` borders.
    *   **Content:** Unhinged, gymbro-vibe encouragement from `encouragement.js`.
    *   **Sound:** Accompanied by `notification.wav`.

### 5. Popups (System Indicators)
*   **Purpose:** On-demand system controls.
*   **Features:**
    *   **Volume:** A slider with a neon `veronica` waveform animation.
    *   **Brightness:** A radial gauge that looks like a speedometer.
    *   **WiFi:** Signal strength bars with a `connected.wav` sound on connect.
    *   **Caps Lock:** A blinking `red` "ERROR" style warning.

### 6. Cliphist Integration
*   **Purpose:** Fast access to clipboard history.
*   **Trigger:** `SUPER + V`.
*   **UI:** A clean, searchable list of clipboard entries in a popup.

### 7. Launcher
*   **Purpose:** A fast, `wofi`-like application launcher.
*   **UI:** A simple, centered input field that provides instant search results.

### 8. PWA Integration
*   **Purpose:** Treat web apps like native citizens.
*   **Source:** Brave Browser PWAs.
*   **Integration:** They should appear in the launcher and potentially have their own icons in the dock/bar.

---

## IV. Keybindings & Workflow

*   **The Batmobile Console:** A master keybind (e.g., `SUPER + S`) will toggle the sidebars with a slick, fast animation (using `wlrctl` or similar). It should feel like activating a console.
*   **Togglable Everything:** Every major UI component (Bar, Sidebars, Popups) will be individually togglable via keybinds for maximum control.

This is the vision. Now, let's build it.