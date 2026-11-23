# MyVibe Launcher (Python edition)

A Windows desktop Minecraft launcher with a dark purple interface. This version uses Python + CustomTkinter and does not use Node.js or Electron.

## Requirements
- Windows 10/11, 64-bit
- Python 3.10 or newer (64-bit recommended)
- Internet connection for downloading Minecraft versions and libraries
- Java/runtime support as required by the selected Minecraft version (the launcher library resolves Minecraft runtimes where supported)

## Run from source
1. Install Python from https://www.python.org/downloads/ and enable **Add Python to PATH**.
2. Extract this folder.
3. Double-click `run.bat`, or run these commands in CMD from this folder:

   ```bat
   python -m pip install -r requirements.txt
   python src\main.py
   ```

## Build an EXE
Double-click `build.bat`. The output will be:

`dist\MyVibe Launcher\MyVibe Launcher.exe`

The first build downloads dependencies. PyInstaller builds a folder-based app (more reliable for this launcher and its dependencies). You can distribute the whole `dist\MyVibe Launcher` folder.

## Included features
- Purple/dark desktop UI
- Minecraft release and snapshot version list
- Nickname field with validation
- RAM allocation control
- Download/repair selected Minecraft version
- Launch Minecraft and write a session log
- Uses a separate game directory under `%APPDATA%\MyVibeLauncher\.minecraft`

## Authentication limitation
This starter build uses a local/offline profile. It is suitable for local testing and offline-mode servers only. It does **not** implement Microsoft/Xbox/Minecraft account sign-in, and it cannot authenticate to online-mode servers. A Microsoft account login flow must be added before presenting this as a complete public launcher.

## Troubleshooting
- If `python` is not recognized, reinstall Python and enable **Add Python to PATH**, or use `py` instead of `python` in the batch files.
- If installation fails, check the internet connection and try `python -m pip install --upgrade pip`.
- Minecraft download and game output logs are stored in `%APPDATA%\MyVibeLauncher\minecraft-session.log`.


## Mod sources
- **Modrinth:** search and compatible version downloads use the public Modrinth API; no API key is needed.
- **CurseForge:** requires a CurseForge API key. Enter your own key in the Mods window. The launcher does not bundle or provide API keys.
- Select the same Minecraft version and mod loader that your game profile uses. This update installs `.jar` files into the shared `mods` folder; it does not install Fabric/Forge/NeoForge itself or automatically create separate mod profiles.


## Новые возможности (1.2)
- **Настройки:** сохраняются RAM по умолчанию, основная папка игры и CurseForge API-ключ в `%APPDATA%\MyVibeLauncher\settings.json`.
- **Друзья:** локальный список ников и адресов серверов в `%APPDATA%\MyVibeLauncher\friends.json`. Это адресная книга, не система онлайн-друзей/чата.
- **Сборки:** отдельные профили Minecraft с изолированными папками игры и `mods`; профили хранятся в `%APPDATA%\MyVibeLauncher\profiles.json`. Удаление профиля из списка не удаляет игровые файлы.
- **Зависимости:** при установке Modrinth автоматически загружаются обязательные зависимости рекурсивно; для CurseForge — зависимости с типом RequiredDependency, если API возвращает прямые ссылки на файлы. Необязательные зависимости не ставятся автоматически.

### Ограничения сборок
Создание сборки создаёт отдельный профиль и папку, но пока не устанавливает сам загрузчик Fabric/Forge/NeoForge/Quilt. Для запуска модовой сборки соответствующий loader должен быть установлен вручную в эту папку/профиль. Не смешивай моды разных загрузчиков.
