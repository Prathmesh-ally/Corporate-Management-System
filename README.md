# 🏢 Corporate Management System (CMS)

![Tech Stack](https://img.shields.io/badge/Tech-ASP.NET%20Web%20Forms-blue?style=for-the-badge&logo=dotnet)
![Language](https://img.shields.io/badge/Language-C%23-purple?style=for-the-badge&logo=csharp)
![Database](https://img.shields.io/badge/Database-MS%20SQL%20Server-red?style=for-the-badge&logo=microsoftsqlserver)
![UI](https://img.shields.io/badge/UI-Bootstrap%205-563D7C?style=for-the-badge&logo=bootstrap)

A robust, enterprise-grade web application developed during my Web Developer Internship at **Zeel Network Solutions**. This system automates corporate administrative workflows, manages employee lifecycles, and provides real-time data insights through a secure and responsive interface.

---

## ✨ Key Features
- **Secure Authentication:** Robust login system with session management.
- **Employee Lifecycle Management:** Full CRUD operations for tracking employees, departments, and roles.
- **Advanced Data Reporting:** Integrated complex **SQL Joins** to display relational data across multiple entities.
- **Responsive UI:** Modern interface built using **ASP.NET Master Pages** and **Bootstrap 5** for a clean, corporate aesthetic.
- **Data Persistence:** Implemented **ADO.NET Disconnected Architecture** for efficient and reliable database interactions.

---

## 🛠️ Architecture & Tech Stack
- **Frontend:** HTML5, CSS3, Bootstrap 5, JavaScript
- **Backend:** C# (C-Sharp), ASP.NET Web Forms
- **Database:** Microsoft SQL Server
- **State Management:** Session, ViewState

---

## 🚀 How to Run the Project Locally

> **Note:** This repository is optimized as a lightweight, single-project directory. It uses the `.csproj` file directly instead of a heavier `.sln` solution file.

### **Step 1: Setup the Code**
1. Clone this repository to your local machine:
   ```bash
   git clone [https://github.com/Prathmesh-ally/Corporate-Management-System.git](https://github.com/Prathmesh-ally/Corporate-Management-System.git)
2.Navigate to the cloned folder.
3.Double-click on Corporate.csproj. This will automatically open the project in Visual Studio.
4.2Visual Studio will automatically restore the required NuGet packages upon the first build.

---

### **Step 2: Setup the Database**
 1. Open SQL Server Management Studio (SSMS).
 2. Create a new database named CorporateDB (or your preferred name).
 3. Execute the SQL scripts provided in your database folder to create the necessary tables (tbl_Employee, tbl_Department, tbl_Roles, etc.).

---

### **Step 3: Configure the Application**
 1. In Visual Studio, open the Web.config file.
 2. Locate the <connectionStrings> section.
 3. Update the connection string to match your local MS SQL Server instance.
 ```
  <add name="CorporateDB" connectionString="Data Source=YOUR_SERVER_NAME; Initial Catalog=YOUR_DB_NAME; Integrated Security=True;"       providerName="System.Data.SqlClient" /> 
```
---

 ### **Step 4: Build And Run**
 1. In the Visual Studio Solution Explorer, right-click on Login.aspx.
 2. Select "Set As Start Page".
 3. Press F5 or click the Run (IIS Express) button. The application will launch in your default web browser.

---

👨‍💻 Developed By
Prathmesh Dattatray Sanap Computer Engineering Student at SPPU  | 

This project was completed as part of a professional internship at Zeel Network Solutions (Feb 2026 - April 2026).
