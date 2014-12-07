TEST ANGULAR.JS
===============================

Установка
=========

    $ git clone git@github.com:AdaevK/testangularjs.git
    $ cd testangularjs
    $ bundle install
    $ rake db:migrate db:seed
    $ cd advert_messeger/
    $ npm install

Запуск
========

  Для работы необходим локально запущеный redis на 6379 порту.

    $ rails s

  и в папке advert_messager/

    $ node app.js

  Redis и Node.js сервер необходимы для отправки сообщений через socket.io о добавлении нового объявления.
