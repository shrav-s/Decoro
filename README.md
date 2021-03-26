## README
# Decoro #

### What is the  problem that needs solving and why it needs solving?
The global home decor market has witnessed signifacnt growth over the last years. 
Booming real estate and construction industry and a need for more organised space at home during Covid 19, had led to increase in the demand for the home decor item. 

In the year 2019, the home decor market was valued at $616 billion and is expected to grow to $838.6 billion by 2027.
Though there is increase in the demand to buy the homedecor products, Covid 19 has made it difficult for small business (sellers) to sell their products directly to customers.

There are many market place applications but as they cater to wider categories it can be overwhelming and confusinbg for the buyers who are only intending to purchase home decoratioon related items.

Hence there is a void of a single platform that brings buyers and sellers together with main focus on the Home decor items only.

### Purpose: 
Decoro is a two-sided market place web application application. The main purpose of this app is to  provide great platform :
  - for the small business owner who are looking for extra or alternative space to sell their products with no addititonal costs attached. 
  - for buyers who are soleley looking to purchase the Home decor items. 

### Functionality / Features

- Authentication
- Authorisation
- Easy onboarding
- Easy navigation
- CRUD for listings
- Stripe integration
- Image upload 


### Target audience
- Potential Home decoration item buyers
- Potential Home decoration item sellers


### Tech stack (e.g. html, css, deployment platform, etc):
* Core:
  - Ruby on Rails version 6.0.3.5 (information on installation is avaiable via the link)
  - Front end: HTML, CSS, Javascript, Bootstrap, W3 Schools CSS
  - Database: Postgres
  - Deployment: Heroku
  - Testing: DBeaver, Postman
  - Cloud storage: AWS S3
* Integration:
    * External
      - Stripe
      - AWS S3
    * Gems
      -Devise
      -aws-sdk-s3 
      
### Installation
1. Please check that you have:
    - Ruby version - 2.7.2
    - nodejs and yarn is installed
    - Rails version - 6.1.2
    - PostgreSQL
2. When cloning repository please make sure that you delete the master.key file in config folder, and generate your own master key.
3. Run ```gem install bundler```
4. Run ```bundle intsall```
5. Run ```rails s```


