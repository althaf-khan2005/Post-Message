# 💬 Post & Like App (Flutter + Firebase)

A clean Flutter app using **Firebase as the backend**, allowing users to **post messages**, **view others’ posts**, and **like them**. Built using simple **CRUD operations** with Firestore and Firebase Authentication. Great for learning full-stack Flutter with Firebase backend integration.

---

## 🧠 Backend - Firebase

This app uses **Firebase as the backend**, including:

- 🔐 **Firebase Authentication** for login and signup
- 🗃️ **Cloud Firestore** to store and manage posts
- 💾 **Realtime updates** using Firestore streams
- 📡 **No need for custom backend servers**

All CRUD operations (Create, Read, Update, Delete) are done using Firestore documents and collections.

---

## 🚀 Features

✅ Firebase Authentication (Login/Signup)  
✅ Cloud Firestore Realtime Database  
✅ Post Messages (CRUD)  
✅ Like Other Users' Posts  
✅ Clean Flutter UI with Widgets  
✅ Simple and Beginner-Friendly Architecture  

---

## 📦 Dependencies

Add these dependencies to your `pubspec.yaml`:

```yaml
dependencies:
  flutter:
    sdk: flutter
  firebase_core: ^2.0.0
  firebase_auth: ^4.0.0
  cloud_firestore: ^4.0.0




## 📁 Project Structure


/lib
│── main.dart
│── firebase_options.dart
│
├── pages/
│   ├── auth.dart
│   ├── authservices.dart
│   ├── login.dart
│   ├── registration.dart
│   ├── loginor_registre.dart
│   ├── home.dart
│   ├── wall.dart           // View all posts
│   ├── like.dart           // Like logic
│   ├── user.dart           // User model
│   ├── firestore.dart      // Firestore service (CRUD logic)
│   ├── profile.dart
│   ├── forgot.dart
│   ├── button.dart
│   ├── buttontext.dart
│   ├── textfilled.dart

```

## 🔐 Authentication Flow

1.Login/Register → User logs in or signs up via Firebase Auth

2.Auth Gate → Checks user session

3.Wall Page → Displays all user posts (Firestore stream)

4.Create Post → User can write a message

5.Like Post → Tap to like posts in real-time

6.Logout → Securely logs out user


## How to run 

1. Clone the repo  
   ```sh
   git clone https://github.com/althaf-khan2005/post_like_app.git
   cd post_like_app

   ```
2. Install dependencies  
   ```sh
   flutter pub get
   ```
3. Run the app  
   ```sh
   flutter run

## Screenshots 

![Image](https://github.com/user-attachments/assets/df4997b2-2708-4c4c-af77-59d6a415bb2c)

![Image](https://github.com/user-attachments/assets/b053e0f3-801f-4d61-9da6-29727c4c7060)

![Image](https://github.com/user-attachments/assets/bdad3f18-4f72-4d2c-834f-472499b6e4c6)

![Image](https://github.com/user-attachments/assets/0544cb22-8738-4ab5-8460-1a872dfcda02)

![Image](https://github.com/user-attachments/assets/c00ac8a4-b85a-4495-a89c-2fb15a2e2c08)

![Image](https://github.com/user-attachments/assets/99ee56be-d20e-4412-b57d-66470bba972e)

![Image](https://github.com/user-attachments/assets/94b31baf-31f8-4c66-ac88-bf4c22ea3ef3)

![Image](https://github.com/user-attachments/assets/5a426a36-24fd-4181-a442-dcd58c6c87bd)




