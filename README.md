# 📍 Local Resolve
**A comprehensive citizen reporting platform bridging communities and municipal authorities.**

Local Resolve is a full-stack web application designed to empower citizens by allowing them to easily report, track, and verify civic issues like potholes, broken streetlights, water leakages, and illegal dumping. 

With community upvoting, real-time status tracking, and mandatory visual proof for resolutions, this platform ensures transparency and accountability between local governments and the public.

![Local Resolve Dashboard Demo](https://via.placeholder.com/800x450/003135/afdde5?text=Local+Resolve+Platform)

## ✨ Core Features
- **Interactive Issue Reporting**: Users can drop precise pins on an interactive map and upload photo evidence.
- **Community Upvoting Matrix**: Prioritize urgent issues based on community consensus (👍).
- **Live Status Tracking**: Absolute transparency as issues move from **Open → In Progress → Resolved**.
- **Admin Verification Protocol**: Authorities are required to upload "Resolution Proof" (Before/After photos) when closing an issue.
- **Citizen Badges & Reputation**: Users earn gamified titles (e.g., *Community Hero*, *Civic Pioneer*) based on reporting and verification activity.
- **Admin Analytics Dashboard**: Real-time KPI charts monitoring resolution rates, category breakdowns, and trends over time.

## 🛠️ Tech Stack
* **Frontend**: React.js, Vite, React Router, Recharts, Context API
* **Backend**: Java Spring Boot 3, Spring Security (JWT)
* **Database**: MySQL / Hibernate ORM
* **Maps & Geo**: Leaflet.js / React-Leaflet
* **Styling**: Custom CSS (Deep Teal & Warm Amber UI)
* **Authentication**: Email/Password + Google OAuth2

## 🚀 Quick Start (Local Development)

### Prerequisites
- JDK 17+
- Node.js 18+
- MySQL Server

### Backend Setup
1. Navigate to the `/backend` directory: `cd backend`
2. Configure your MySQL database in `src/main/resources/application.properties`:
   ```properties
   spring.datasource.url=jdbc:mysql://localhost:3306/local_resolve
   spring.datasource.username=root
   spring.datasource.password=your_password
   ```
3. Run the Spring Boot application:
   ```bash
   ./mvnw spring-boot:run
   ```

### Frontend Setup
1. Navigate to the `/frontend` directory: `cd frontend`
2. Install dependencies:
   ```bash
   npm install
   ```
3. Start the Vite development server:
   ```bash
   npm run dev
   ```
4. Access the application at `http://localhost:5173`

## 🔐 Built-in Admin Account
For testing the dashboard, a default admin account is seeded on startup:
- **Email:** `admin@localresolve.com`
- **Password:** `admin123`

## 📜 License
This project is licensed under the MIT License.
