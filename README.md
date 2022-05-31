# Shop Owners Management

UI for shop owners to manage their product catalogue.​

For intern with [Raisebe](https://www.raisebe.com/)

packages used `firebase_core: ^1.17.1` 
and  `cloud_firestore: ^3.1.17`

Link to [Database](https://console.firebase.google.com/project/shop-owners-management/firestore/data/~2Fproducts~2Fd3M763pwnXV9y21LHqJC)

**Fonts**

-  [Inter](https://fonts.google.com/specimen/Inter)

## Goals
- Create a user interface of 2-3 pages for shop owners to manage their product catalogue.​

- Show your color choices and creativity​
## Description

Flutter UI for shop owners to managed their products catalogue. <br> Shop owners can add their new product, update, and delete (CRUD).<br>
Using Cloud Firestore from Firebase to store the products data (Test database, only online for 30 days).


## Documentation :
 1. Home Page

    Consist of Today's Update for tracking seller's progress, statistics from past 7 days, and news for sellers.

    <img src="https://user-images.githubusercontent.com/99629720/171095991-e2fc5734-c7e9-4944-abf8-852d62bf8a17.png" width="200" height="400">
 
 2. Products Page
    
    ``ListView`` to show seller's products (product's name, price, stocks left, seen, and sold).<br>
    Seller can update and delete their products by clicking the buttons.

    <img src="https://user-images.githubusercontent.com/99629720/171229664-8bcc79b5-d6f7-4d3a-a782-5410114cb820.png" width="200" height="400">

3. Add product Page

   Using ``TextField`` to input the products description, and ``AlertDialog`` to inform that the products have been saved
   
    <img src="https://user-images.githubusercontent.com/99629720/171229108-34837f15-7b0c-4844-9906-4d54151c54df.png" width="200" height="400"> <img src="https://user-images.githubusercontent.com/99629720/171229125-b759e3b7-036d-460d-b32c-930207436bcf.png" width="200" height="400">
   

#### Rafael Matthew Tanumihardja