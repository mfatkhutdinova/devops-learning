Подключаемся к серверу и заходим в директорию своего проекта .
  cd /u0/projects/dwh_python_dev/my_user_name/myproject .

Посмотреть доступные версии: .
  pyenv versions .

Выбор версии .
  pyenv shell 3.6.8 .

Проверка .
  pyenv version .

Создаем виртуальное окружение (после выполнения в текущей директории появится поддиректория .venv, содержащая окружение) .
  python -m venv .venv .

Активируем окружение .
  source  .venv/bin/activate .

Деактивировать окружение .
  deactivate .