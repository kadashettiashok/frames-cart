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
   User.create!(name:”admin”,email:”admin@gmail.com”,password:”123456”,role:”admin”,currency:”USD”)
 ```

 
  #### User 
  ```
   User.create!(name:”user”,email:”user@gmail.com”,password:”123456”,role:”user”,currency:”EUR”)
 ```

 # User login
 
   #### Admin
   
   ![image](https://user-images.githubusercontent.com/100595515/156371904-a7e16da4-c1d1-4d18-9ad5-e0c32e7f4ab2.png) 
   
   #### User
 
 ![image](https://user-images.githubusercontent.com/100595515/156371555-22c30229-c243-4b6e-8594-bc570b04e193.png)
 
 #### Add authorization for following API's
  ![image](https://user-images.githubusercontent.com/100595515/156374035-f553fe9e-a3d3-419b-9ae7-19593362c375.png) 
 
 # Frame creation
   #### Admin
   ![image](https://user-images.githubusercontent.com/100595515/156372517-94d93672-1578-4fec-88bf-3a83306fd4dd.png)
   
   #### User
   ![image](https://user-images.githubusercontent.com/100595515/156372668-6b3a6ae6-a3ee-443b-960b-8f2d71f10aeb.png)
   
 # Lenses creation
   #### Admin
   ![image](https://user-images.githubusercontent.com/100595515/156372859-f78a66eb-caf0-49ee-b849-3b913675f680.png)

   #### User
   ![image](https://user-images.githubusercontent.com/100595515/156372992-da8e88ee-3abb-4d79-82ab-4c6351c44678.png)
   
 # Get all lenses
   #### User
   ![image](https://user-images.githubusercontent.com/100595515/156373270-4e584957-325b-48a6-96f6-7b4f97443349.png)
   
# Get all active frames
   #### User
   ![image](https://user-images.githubusercontent.com/100595515/156373270-4e584957-325b-48a6-96f6-7b4f97443349.png)
   
# Custom glasses API

  #### with stock
  ![image](https://user-images.githubusercontent.com/100595515/156374483-7b6775ae-f9fc-4d27-92db-e17c938aca87.png)

 
  #### without stock
  ![image](https://user-images.githubusercontent.com/100595515/156374574-51fe5241-e96e-43fd-b9a4-17296bf76f7e.png)

  
  

    
   
 
