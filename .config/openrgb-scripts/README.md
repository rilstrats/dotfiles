# OpenRGB Scripts

## Prep

In order for these scripts to work properly,
you must have two profiles set up in OpenRGB:

- `running`: Loaded when computer turns on or wakes up
- `sleeping`: Loaded when the computer goes to sleep

Currently, loading a profile when going to sleep is not working.

## Installation

```
./install-openrgb-services.sh
```

You will be prompted for sudo password.

The `install-openrgb-services.sh` will:

- Load necessary kernel modules
- Ensure the kernel modules are loaded at each boot
- Install three `systemd` services
- Enable two of those services

## Development

Currently the `suspend` script isn't working,
something to do with the necessary kernel modules being unloaded,
so that script is currently disabled.
