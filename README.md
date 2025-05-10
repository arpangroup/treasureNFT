# Revptc MLM


### 1. Build the Docker Image

````shell
docker-compose up -d
````

````shell

docker-compose down -v  # reset DB if already exists
````

### Run the Application on Browser
[http://localhost:8080](http://localhost:8080)

#### Login as Admin `admin/admin`:
[http://localhost:8080/admin](http://localhost:8080/admin)

#### Login/Register User:
[http://localhost:localhost:8080/user/register](http://localhost:localhost:8080/user/register) <br/>
[http://localhost:8080/user/login](http://localhost:8080/user/login)


## Configurations
.env file
````console
MYSQL_ROOT_PASSWORD=test
MYSQL_DATABASE=revptc_db
MYSQL_USER=app_user
MYSQL_PASSWORD=app_password
````
