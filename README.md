# Minecraft Server Config Editor
A simple UI for editing Minecraft server configs.

> [!IMPORTANT]
> Currently project is in POC state and under construction. Not fit for use just yet.

# Requirements
* Golang
    * Wails
* Elm
* Python3

# Build
```bash
# With dev tools
python3 build.py dev

# Without dev tools
python3 build.py
```
# Limitations
* File Explorer will not be implemented until core functionality is in place first. Hence, MC server config files need to be stored in a dir `server-config/` located in the same place the app exe is started from.
* **Potential** support for modded server properties entries may come, but only after core functionality is implemented.
