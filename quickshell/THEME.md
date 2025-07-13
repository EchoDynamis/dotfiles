# THEME_CYBERPUNK

## Color Palette
| Hex Code  | RGB                 | Name              | Tags                                     | Behavior                                                                                             |
| :-------- | :------------------ | :---------------- | :--------------------------------------- | :--------------------------------------------------------------------------------------------------- |
| `000000`  | `rgb(0, 0, 0)`      | black             | background, terminal background          | static                                                                                               |
| `505050`  | `rgb(80, 80, 80)`   | dark grey         | subtle UI dividers, shadows              | static                                                                                               |
| `a8a8a8`  | `rgb(168, 168, 168)`| silver            | inactive text, muted labels              | static                                                                                               |
| `ffffff`  | `rgb(255, 255, 255)`| white             | general text, highlight text             | static                                                                                               |
| `ff2525`  | `rgb(255, 37, 37)`  | red               | battery 20% and below, critical alerts   | blinks with bittersweet at 20%, 15%, 10%; blinks with aerospace orange at 5% — fast, urgent         |
| `ff5750`  | `rgb(255, 87, 80)`  | bittersweet       | battery critical gradient, alert animation | blinks with red per above, part of low battery warning                                               |
| `ff5000`  | `rgb(255, 80, 0)`   | aerospace orange  | final battery emergency highlight, urgent call to action | blinks with red at 5% — fast, attention grab                                                         |
| `ff7500`  | `rgb(255, 117, 0)`  | safety orange     | battery 40%–21%                          | part of battery level gradient, static otherwise                                                     |
| `ffee25`  | `rgb(255, 238, 37)` | aureolin          | warnings (non-breaking), caution messages| battery 60%–41%, hover transition (with screamin' green); gradient swing with safety orange at 40% |
| `deff5d`  | `rgb(222, 255, 93)` | chartreuse        | hover effect for text, battery 60%–41%   | hover color for emerald, battery gradient with aureolin                                              |
| `85f55d`  | `rgb(133, 245, 93)` | screamin' green   | battery 80%–61%                          | battery swing: emerald ↔ screamin' green at 80%, screamin' green ↔ aureolin at 60%                   |
| `1bd775`  | `rgb(27, 215, 117)` | emerald           | confirmation, success, battery 100%–81%, base text, borders, waybar text | battery swing with screamin' green at 80%                                                            |
| `25e5c5`  | `rgb(37, 229, 197)` | seafoam           | links, secondary accent                  | static                                                                                               |
| `5ff5ff`  | `rgb(95, 245, 255)` | electric blue     | optional accent, future module highlights| static                                                                                               |
| `9925ff`  | `rgb(153, 37, 255)` | veronica          | decorative highlight, accent, optional module emphasis | static                                                                                               |
| `dd25dd`  | `rgb(221, 37, 221)` | steel pink        | decorative, accent, possible error border| static                                                                                               |

## ⚡️ Battery Animation Gradient — full behavior
| Battery Level | Color                       | Transition Behavior                      |
| :------------ | :-------------------------- | :--------------------------------------- |
| 100%–81%      | emerald                     | static                                   |
| 80%           | emerald ↔ screamin' green   | brief swing animation (2 sec)            |
| 80%–61%      | screamin' green             | static                                   |
| 60%           | screamin' green ↔ aureolin  | brief swing animation (2 sec)            |
| 60%–41%      | aureolin                    | static                                   |
| 40%           | aureolin ↔ safety orange    | brief swing animation (2 sec)            |
| 40%–21%      | safety orange               | static                                   |
| 20%           | bittersweet ↔ red           | blinking gradient (soft, 2 sec cycle)    |
| 15%           | bittersweet ↔ red           | blinking                                 |
| 10%           | bittersweet ↔ red           | blinking                                 |
| 5%            | aerospace orange ↔ red      | rapid blinking, high urgency             |

## Highlights
- Emerald is the main theme anchor: borders, waybar text, success, default hover base.
- Chartreuse + aureolin handle mild interaction feedback and low-level warnings.
- Bittersweet, red, aerospace orange handle escalation to severe alerts.
- Seafoam, electric blue, veronica, steel pink are stylistic accents for modules, highlights, or fun details.
- Black is the background, with silver and white for contrast layers.
