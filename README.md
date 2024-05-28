# Как запустить проект
### Необходимое ПО

Для запуска проекта необходимо установить
- [NodeJS](https://nodejs.org/en/download)
- [Git](https://git-scm.com/downloads)
- [XAMPP](https://www.apachefriends.org/ru/download.html)

### Клонирование проекта

```
https://github.com/Gleksynian/backend_loputoo.git
cd backend_loputoo
```
### Установка зависимостей
```
npm i
```

### Создание базы данных
В папке backend_loputoo находится файл car_sales.sql. Нужно запустить модули Apache и MySQL В XAMPP и перейти в Admin MySQL, создать базу с названием car_sales.sql и импортировать в нее базу данных из папки.

### .env

В папке backend_loputoo находится файл .env.example. Его нужно переименовать на .env.

### Запуск
```
npm run dev
```