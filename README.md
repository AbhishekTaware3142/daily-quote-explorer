# 🌟 Daily Quote Explorer

A simple full-stack app built with **Flutter (frontend)** and **Spring Boot + MySQL (backend)**.  
The app shows motivational quotes, lets you save favorites, and switch between Home & Favorites screens.

---

## 📂 Project Structure
```
daily-quote-explorer/
├── backend/   # Spring Boot backend (REST APIs + MySQL)
├── frontend/  # Flutter frontend (UI for app)
└── README.md  # Project documentation
```

---

## 🚀 Features

### ✅ Flutter App
- Home screen shows a random motivational quote  
- "Get New Quote" button → loads a new random quote  
- "Save to Favorites" button → adds quote to favorites  
- Favorites screen → view and delete saved quotes  
- Navigation using BottomNavigationBar  
- Prevents duplicate favorites  
- Shows message if favorites list is empty  

### ✅ Spring Boot Backend
- REST APIs to manage quotes  
  - `GET /api/quotes` → Get all quotes  
  - `GET /api/quotes/random` → Get random quote  
  - `POST /api/quotes` → Add a new quote  
  - `DELETE /api/quotes/{id}` → Delete a quote  
- MySQL database stores all quotes  

---

## 🛠️ Setup Instructions

### 1️⃣ Database (MySQL)
1. Install MySQL  
2. Create a database:
   ```sql
   CREATE DATABASE quotesdb;
   ```
3. Insert sample quotes:
   ```sql
   INSERT INTO quote (text, author) VALUES
   ("Believe in yourself", "Unknown"),
   ("Stay positive, work hard, make it happen", "Unknown"),
   ("Dream big and dare to fail", "Norman Vaughan");
   ```

---

### 2️⃣ Backend (Spring Boot)
1. Open the folder `backend/` in Eclipse or IntelliJ  
2. Update `src/main/resources/application.properties`:
   ```properties
   spring.datasource.url=jdbc:mysql://localhost:3306/quotesdb
   spring.datasource.username=root
   spring.datasource.password=yourpassword
   spring.jpa.hibernate.ddl-auto=update
   spring.jpa.show-sql=true
   ```
   *(Change `yourpassword` to your actual MySQL password)*  
3. Run backend:
   ```bash
   cd backend
   mvn spring-boot:run
   ```
4.  Run on Eclipse:
   Select project and run as Spring Boot App
  
5. Backend runs at:  
   👉 `http://localhost:8080/api/quotes/random`

---

### 3️⃣ Frontend (Flutter)
1. Open the folder `frontend/`  
2. Install dependencies:
   ```bash
   flutter pub get
   ```
3. Run the app on emulator/device:
   ```bash
   flutter run
   ```
⚠️ Note: For Android Emulator use  
```dart
http://10.0.2.2:8080/api/quotes/random
```
instead of `localhost`.

---

## ✅ Deliverables
- GitHub repo with Flutter + Spring Boot projects  
- README file (this file)  
- Screenshots of Home & Favorites screens  
- A short demo video showing app features  

---

## 📸 Screenshots
👉 [View Screenshots](PASTE_YOUR_SCREENSHOT_LINK_HERE)

---

## 🎥 Demo Video
👉 [Watch Demo Video](https://drive.google.com/file/d/10mDeRsbRarTUqrpsv4wWob1maZsk0wnl/view?usp=sharing)

---

## ✨ Bonus Features (Optional)
- Save favorites permanently using `shared_preferences` or Hive  
- Search bar in Favorites  
- Share quotes using `share_plus`  .
