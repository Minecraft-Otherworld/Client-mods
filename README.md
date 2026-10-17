# Test-git

Сборка Minecraft 1.21.1 на NeoForge 21.1.262 для Prism Launcher.

## Установка

Нужны [Prism Launcher](https://prismlauncher.org/) (или ElyPrism) и [git](https://git-scm.com/). На Windows команды выполняйте в Git Bash.

1. Клонируйте репозиторий в папку инстансов лаунчера (её путь: «Папки → Экземпляры» в лаунчере):
   ```bash
   git clone <URL> "$APPDATA/PrismLauncher/instances/Test-git"
   ```
2. Запустите скрипт инициализации, он создаст `instance.cfg`:
   ```bash
   "$APPDATA/PrismLauncher/instances/Test-git/init.sh"
   ```
3. Перезапустите лаунчер и запустите инстанс. Java, NeoForge и библиотеки лаунчер скачает сам.

## Обновление

Закройте игру и выполните в папке инстанса:
```bash
git pull
```

## Что лежит в репозитории

- `mmc-pack.json` — версии Minecraft и NeoForge
- `minecraft/mods/` — моды и их метаданные (`.index/`)

Конфиги не коммитятся: моды создают их сами, а серверные настройки приходят с сервера. Личные настройки, миры, логи и `instance.cfg` тоже остаются локальными.

## Для сопровождающих

Добавили, обновили или удалили мод через лаунчер, затем:
```bash
git add -A && git commit -m "Update <mod>" && git push
```
Перед коммитом проверьте `git status`: в нём не должно быть ничего лишнего.
