import subprocess
import sys

def get_caps_lock_state():
    try:
        # Run 'xset q' command
        result = subprocess.run(['xset', 'q'], capture_output=True, text=True, check=True)
        output = result.stdout

        # Parse the output to find Caps Lock state
        # Example output line: "  Caps Lock:    on" or "  Caps Lock:    off"
        for line in output.splitlines():
            if "Caps Lock:" in line:
                if "on" in line:
                    return "on"
                elif "off" in line:
                    return "off"
        return "unknown"
    except Exception as e:
        return f"error: {e}"

if __name__ == "__main__":
    print(get_caps_lock_state())
