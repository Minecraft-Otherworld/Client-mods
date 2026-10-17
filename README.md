# Test-git

Сборка Minecraft 1.21.1 на NeoForge 21.1.262 для Prism Launcher.

## Установка

Нужны [Prism Launcher](https://prismlauncher.org/) (или ElyPrism) и [git](https://git-scm.com/). Скрипты запускаются двойным кликом, `git` должен быть в PATH (установщик Git для Windows делает это сам).

1. Клонируйте репозиторий в папку инстансов лаунчера (её путь: «Папки → Экземпляры» в лаунчере):
   ```bash
   git clone <URL> "$APPDATA/PrismLauncher/instances/Test-git"
   ```
2. Откройте папку инстанса и запустите `init.bat`. Он создаст `instance.cfg`, поставит иконку и скопирует конфиги сборки в `minecraft/config/`.
3. Перезапустите лаунчер и запустите инстанс. Java, NeoForge и библиотеки лаунчер скачает сам.

## Обновление

Закройте игру и запустите `update.bat`. Он скачает изменения через `git pull`, обновит иконку и заново скопирует конфиги из `config_copy/` (остальные файлы в `minecraft/config/` не трогает).

## Что лежит в репозитории

- `mmc-pack.json` — версии Minecraft и NeoForge
- `minecraft/mods/` — моды
- `config_copy/` — конфиги сборки, скрипты копируют их в `minecraft/config/`
- `icon.png` — иконка инстанса; Prism берёт иконки только из своей папки `icons/`, поэтому скрипты копируют её туда
- `init.bat`, `update.bat` — установка и обновление

Остальное (`instance.cfg`, `minecraft/config/`, миры, логи, кеши) остаётся локальным.

## Для сопровождающих

Добавили, обновили или удалили мод через лаунчер, или положили нужный конфиг в `config_copy/` (с теми же путями, что внутри `minecraft/config/`), затем:
```bash
git add -A && git commit -m "Update <mod>" && git push
```
Перед коммитом проверьте `git status`: в нём не должно быть ничего лишнего.
