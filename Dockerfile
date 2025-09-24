# Простой Dockerfile
FROM node:18-alpine

WORKDIR /app

# Копируем все файлы
COPY . .

# Устанавливаем зависимости
RUN npm ci

# Собираем приложение
RUN npm run build

# Экспонируем порт
EXPOSE 3000

# Запускаем приложение
CMD ["npm", "start"]
