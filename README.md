# Bank accounting API

This API is for transfer money between bank accounts and for get account balance.

## Getting Started

## Prerequisites

Before start, you must to have installed in your machine this prerequisites:
* **[Docker](https://www.docker.com/) (docker compose)** -
To install docker, [see official documentation](https://docs.docker.com/engine/installation/) according to you operational system.

## Installing

### Develop

To install on your local machine, just follow these steps:

**1**. Clone and enter project
```
$ git clone git@github.com:bcapalbo/bank-accounting.git
$ cd bank-accounting
```

**2**. Copy and edit .env.example if necessary
```
cp .env.example .env
```

**3**. Start application
```
$ ./start.sh --build
```

### Migrations

In order to make developers live easier, this project will run some migrations (can be found and updated at `db/migrate`) that will creates the table used on application and populate it with some test data each time the database container is restarted.

### Running UnitTests

To run locally unit tests of this project, just follow this step:
```
$ ./run_unit_tests.sh
```

### Debugging

To be able to use `byebug` debugger, you will need to use debugging configuration following this step:
```
$ ./debug.sh
```

### Shutdown application

To shutdown the aplication, just run this following command:
```
$ docker-compose down
```

## Built With

* [Ruby 2.6](https://www.ruby-lang.org/pt/)
* [Sinatra Framework](http://sinatrarb.com/)

## Author

This project is mantained by Bruno Capalbo (https://github.com/bcapalbo).
