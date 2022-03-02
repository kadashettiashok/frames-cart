# Frames-cart

### Getting Started

Install required dependency

```
bundle install
```
Setup `pgsql` datebase
```
  rake db:setup
  rake db:migarte
```
Start your project locally using `rails`
```
rails s
```


## Technologies

- `ruby-on-rails`: Back-end framework
-  `pgsql`: Database
- `devise-gem` : For authorization.
- `simple-token-authentication-gem` : For token based authentication
- `rspec-gem` : To test our Controller, Model.
- `rubo-cop-gem` : Code Format (unify the code format)

## API
# User Creation

    Run rails c in terminal from project root folder

     
  #### Admin
  ```
       User.create!(name:”Ashok”,email:”ashok@gmail.com”,password:”123456”,role:”admin”,currency:”USD”)
 ```

 
  #### User 
  ```
      User.create!(name:”Ashok1”,email:”ashok1@gmail.com”,password:”123456”,role:”user”,currency:”EUR”)
 ```

 # User login
 
 ![image](https://user-images.githubusercontent.com/100595515/156370441-10f4836f-aebb-4b5e-a9f5-af8ab137c963.png)

 
 
