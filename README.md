# Simple Web App
This directory contains a working API application with a database.  It is a good starting point for any web app.  Made by Jeff Ladino in September 2022.

## Tech Stack
* C# and .NET version 6.0 + Swagger for the web application
* MySQL for the relational database engine (running in a Docker container)
* Docker for the build and run environment

## Web app concept explained
This web app is called "MyLovesAPI".  It is a simple app to save and print out the foods and places that the user loves.

## Data Model
The data model is very simple.
* A record in the `user` table represents a single user of the system with their basic personal info
* A record in the `userFoodLove` table represents a single food that a single user loves.  It is related to the user via the userId key.
* A record in the `userPlaceLove` table represents a single place that a single user loves.  It is related to the user via the userId key.

## How to run this web application
### Prerequisites
* You have a git client installed.  There is probably already one on your system. There are lots of options on how to do this.  Just google it and pick what you are most comfortable with.
* (Optional) .NET 6 should be installed if you want to code, build, and test this web app C# code locally.  If you'll just be running in the Docker containers you don't need .NET 6.  You can download it [here](https://dotnet.microsoft.com/en-us/download/dotnet/6.0)
* Docker Desktop is installed. You can download it [here](https://www.docker.com/products/docker-desktop/)

## What must I do?
* git clone this repository `git clone git@github.com:jeffrol/simplewebapp.git`
* CD to your local directory for this repo. `cd simplewebapp`
* Startup a Docker container running MySQL from the official MySQL docker image. Also create the "myloves" database and run setup scripts from `./mysql-docker/sql-scripts` to populate the database.
    * TODO: I should clearly have a different way to insert the password and save it more securely for a production system.  This would be in a key vault somewhere.
        ```
        docker run -d -p 3306:3306 --name myloves-mysql \
        -v ./mysql-docker/sql-scripts:/docker-entrypoint-initdb.d/ \
        -e MYSQL_ROOT_PASSWORD=supersecret \
        -e MYSQL_DATABASE=myloves \
        mysql
        ```
* Verify that the myloves-mysql container is running with `docker ps`
* Verify the myloves-mysql container is running as expected with the myloves database setup.
    ```bash
    $ docker exec -it myloves-mysql bash
    root@c86ff80d7524:/
    bash# mysql -uroot -psupersecret
    mysql> show databases;
    # "myloves" database should be in the list
    mysql> use myloves;
    mysql> show tables;
    # "tables" should show user, userFoodLove, userPlaceLove
    ```

    * Alternatively you can connect to your database directly form localhost as below if you have the mysql client running on your local machine. (I installed the mysql client via `brew install mysql`.)
        ```bash
        % mysql -h 127.0.0.1 -P 3306 -u root -psupersecret myloves
        mysql> select * from userPlaceLove;
        # You should see the data you've inserted into this table
        ```

### Continue here to just run the web application hosted in docker
* Put together three containers to make a working web-application with docker-compose.  This application has:
1. A container running MySQL with the myloves database
2. A container running the mylovesapi ASP.NET APIs.
3. A container running "Adminer", a simple web-based DB admin application to examine and update data and tables.
    ```bash
    # Go to the simplewebapp directory before running docker-compose
    % docker-compose up -d
    ```

### Continue here to build, test, and debug the web application locally
* 

## Running app reference URLs
* [MyLovesAPI test page in swagger](http://localhost:8880/swagger/index.html)
* [Adminer. A web based DB Admininstration app.](http://localhost:8080/)
    * Login using the following credentials (that all come from the docker-compose.yml file for the `db` server.)
    ```
    System: MySQL
    Server: db
    Username: root
    Password: supersecret
    Database: myloves
    ```
* To access MySQL use docker CLI access via `docker exec -it myloves-mysql bash`
    * You can then run the following helpful commands:
    ```bash
    bash# mysql -uroot -psupersecret
    mysql> show databases;
    # "myloves" database should be in the list
    mysql> use myloves;
    mysql> show tables;
    # "tables" should show user, userFoodLove, userPlaceLove
    # when you finish use the "exit" command to exit mysql and then "exit" again to exit bash on the container.
    ```


## What I learned
* To test changes to your web app container, you'll have to not only stop and delete the running docker-compose containers.  You must also delete the docker-compose image.  If you don't delete it then `docker-compose up -d` will simply rerun the prexisting image, not your new changes.
* Adminer is a nice and simple web based tool to administer 

## References
Here are helpful references that I used along the way
* [Here](https://betterprogramming.pub/customize-your-mysql-database-in-docker-723ffd59d8fb) is a helpful guide to setting up a new MySQL Docker container to run your database.
* [Here](https://www.docker.com/blog/building-multi-container-net-app-using-docker-desktop/) is a guide on how to setup a multi-container .NET Web App + Database using Docker and Docker Compose.
* [Here](https://www.youtube.com/watch?v=VgStKMB1duY) is a good video on ASP.NET docker integration testing.  He recommends using Fluent assertions in his test project.

### Ignore this: Out of date notes made while developing this solution
* If you want to save any data that you've written to your database, you can do a database dump and save the results into the sql-scripts directory.  Do this:
    ```bash
    % docker exec -it myloves-mysql bash

    bash % mysqldump myloves -psupersecret
    # This dumps all of the Table create statements and insert statements for each table in your db

    # Copy the output and paste it into sql-scripts/MySqlDump.sql
    ```

* Build a docker image for the MyLovesAPI web app.
    ```bash
    % cd mylovesapi
    % docker build -t mylovesapi .
    ```
* Verify that your image built. `docker image ls`
* Run your mylovesapi docker image mapping the container's port 80 to your local port 8880. `docker run --rm --name mylovesapi -p 8880:80 mylovesapi`
* Verify that you can browse to the mylovesapi running container by opening a browser to [the swagger test page](http://localhost:8880/swagger/index.html) or  [this direct api test call](http://localhost:8880/MyLoves/foodloves?userLastName=Smith)
    * My first iteration of this container wasn't running the Swagger UI test pages.  This was because my Program.cs was configured to only show them in the development environment. I've solved this issue for this test app only by enabling SwaggerUI regardless of environment.
