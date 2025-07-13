# Design Language: ECHO Cyberpunk Tactical

This design language fuses cyberpunk aesthetics with a tactical, in-your-face edge, inspired by matrix code rains, Hong Kong hacker dens, and a DJ’s high-octane workflow. It’s bold, neon-drenched, and built for dominance on a 4K Arch/Wayland/Hyprland setup.

## Core Aesthetic
- **Cyberpunk Matrix HK Vibes**: A blend of *The Matrix* green code cascades and Hong Kong’s neon-lit chaos—skyscrapers, holographic overlays, and a hacker’s loft energy.
- **Tactical HUD**: Inspired by the aircraft list UI—clean, boxed data fields with subtle borders, floating above a dark void like a mission control dashboard.
- **Neon Pulse**: Every element glows with purpose—`emerald` for success, `veronica` for accents, `red` for alerts, pulsing to music beats or system events.

## Color Palette
| Hex Code  | Name              | Usage                                      | Behavior                        |
| :-------- | :---------------- | :----------------------------------------- | :------------------------------ |
| `000000`  | black             | Background, blurred backdrop              | Static, deep void               |
| `ffffff`  | white             | Text, labels                              | Static, crisp contrast          |
| `1bd775`  | emerald           | Success, base text, progress bars         | Static, glows on hover          |
| `9925ff`  | veronica          | Accents, borders, popup highlights        | Static, pulses on interaction   |
| `ff2525`  | red               | Alerts, critical states                   | Blinks rapidly at 5% battery    |

## Typography
- **Font**: Orbitron (glitchy headers), Monoid (clean text)—matrix-inspired with a futuristic edge.
- **Size**: 16px base for 4K, scalable with implicitHeight 40 for UI elements.
- **Style**: Bold for titles (e.g., “Aircraft currently in flight”), regular for data (e.g., “Amount: 0”).

## Layout & Structure
- **Floating Elements**: All UI (Bar, Sidebars, Popups) floats above desktop with Hyprland blur (opacity 0.7), 4px gaps between stacked components.
- **Boxed Data**: Inspired by the aircraft list—rectangular fields with thin `white` borders, stacked vertically with equal padding (8px).
- **ImplicitHeight**: 40px for 4K compatibility, ensuring bold visibility.

## Interactive Elements
- **Menus & Selection**: 
  - **Corners**: 45-degree 1px outer highlights in `veronica` on hover/tab, matching the aircraft list’s subtle edge emphasis.
  - **Hover Effect**: `emerald` glow expands 2px outward, fading to `chartreuse`.
  - **Click Action**: Triggers popups or toggles with slick animations (e.g., Bar music popup).
- **Sliders & Gauges**: Neon `emerald` bars with `veronica` endpoints, pulsing to music or system updates.
- **Buttons**: Rectangular with rounded 4px corners, `veronica` border, `emerald` fill on click.

## Animations & Transitions
- **Pulse**: Syncs to music BPM (via cava sine waves) or system events (e.g., battery blinks).
- **Slide**: Sidebars toggle with `wlrctl` sliding (200ms), blur intensifies mid-transition.
- **Glitch**: Subtle matrix-style flicker on popup open, `steel pink` static for 0.5s.

## Audio Integration
- **Core**: Music drives the UI—cava sine waves in popups, `engine_rev.mp3` for habit streaks.
- **Feedback**: `notification.wav` for alerts, `connected.wav` for WiFi.

## Inspirations
- **Aircraft List**: Clean, tactical data boxes with minimalistic borders and stark contrast.
- **Echo Visuals**: Neon HK skyline, matrix code rain, and DJ booth vibes from previous designs.
- **Goal**: Blind mfers with bold, unhinged energy—hacker DJ’s ultimate playground.

This language is your blueprint for the next two months—build it loud, build it proud!