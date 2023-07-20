# Backend-Starter

> Simple server app with JWT authentication that uses Mysql, Node.js, and the Express web framework 
## Requirements

- git
- Node.js
- A browser (e.g., Firefox or Chrome)
- bash shell
- Mysql


## How To Start
- rename the .env.example file to .env
- add mysql database information
- paste your cluster connection string to DB_CONNECTION in .env
- add TOKEN_SECRET for JWT
- Install dependencies with `npm install`
- Run the server locally with `npm start` or `npm run dev`


## View local app in browser

- <http://localhost:3000>

## Test requests with Postman

- Install [Postman](https://www.getpostman.com/)
- Additional details in following sections

- POST <http://localhost:3000/api/user/register>
- POST <http://localhost:3000/api/user/login>
- GET <http://localhost:3000/api/example>

## test app with Postman (provides token)

1. POST <http://localhost:3000/api/users/register> - set Body / Raw / JSON - Send

```JSON
{
  "name": "fajri",
  "email": "fajri@farindev.my.id",
  "password": "123456789"
}
```

Should return something like:

```JSON
{
    "name": "fajri",
    "email": "fajri@farindev.my.id",
    "password": "$2a$10$hQN7uKIcuu2fXTet2nxPSe3jXD7GtSglsX/2JZM3Wxz31JWk8mTTS",
    "_id": "6288838ce9afa35b2f1537b1",
    "created_at": "2022-05-21T06:15:40.958Z",
    "__v": 0
}
```

2. POST <http://localhost:3000/api/users/login> - set Body / Raw / JSON - Send

```JSON
{
  "email": "fajri@farindev.my.id",
  "password": "123456789"
}
```

Should return something like:

```JSON
{
    "messsage": "loggedd In ",
    "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2Mjg4ODM4Y2U5YWZhMzViMmYxNTM3YjEiLCJpYXQiOjE2NTMxMTM3OTR9.7wdHLeDIxzJCm7ZyOWJSlk1b1HPp2Y4cxIVNzcnjf5g",
    "name": "fajri",
    "email": "fajri@farindev.my.id"
}
```

3. GET <http://localhost:3000/api/example>
set Headers `auth-token : <YOUR_TOKEN>`
example `auth-token : eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2Mjg4ODM4Y2U5YWZhMzViMmYxNTM3YjEiLCJpYXQiOjE2NTMxMTM3OTR9.7wdHLeDIxzJCm7ZyOWJSlk1b1HPp2Y4cxIVNzcnjf5g`


response:

```JSON
{
    "title": "Example Title",
    "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin vel libero turpis. Suspendisse venenatis, nunc nec aliquam mollis, mi libero aliquam nunc, ut condimentum odio metus id nisi. Sed ac ex placerat, egestas dui vel, fermentum leo. Fusce sed velit at enim tempus vehicula. Nulla maximus sit amet turpis id aliquam. Donec ut arcu hendrerit, convallis augue et, laoreet tortor. Proin interdum magna consectetur lacinia posuere. Sed erat nunc, laoreet sed justo id, dapibus imperdiet elit. Vestibulum sit amet ornare ipsum. Sed cursus metus non nisl euismod, eget mollis metus blandit. Nulla facilisi. "
}
```
