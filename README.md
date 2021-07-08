# README

This project provides an API for a gamer e-commerce. It is developed with Ruby on Rails. 

To run this project, you must to have docker installed. Go to the docker folder and run: 

```
user@machine: cd e-commerce/docker/
user@machine:e-commerce$ e-commerce/docker/ docker-compose up -d 
```
The comand will run the postgree machine and the adminer. 

Then you can start the application. You can create the databases with the folow commands

```
user@machine:e-commerce$ rails db:create
user@machine:e-commerce$ rails db:migrate
```

