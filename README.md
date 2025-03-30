# **Employee Registration System**

This project is a simple Employee Registration System using **HTML, JSP, MySQL, and Apache Tomcat**. The system allows users to fill out an employee registration form, store the data in a MySQL database, and display success messages upon submission.

## **📌 Features**  
- A web-based form for employee registration.
- Data storage in MySQL using JSP.
- Backend connection using JDBC.
- Apache Tomcat as the web server.

---

## **🔧 Prerequisites**  

Before setting up the project, ensure you have the following installed:  

### **Windows Users**  
- **Java Development Kit (JDK 23.0.1 or higher)**  
  - [Download JDK](https://jdk.java.net/)  
  - Verify installation:  
    ```sh
    java -version
    javac -version
    ```  
- **Apache Tomcat 11.0**  
  - [Download Tomcat](https://tomcat.apache.org/download-11.cgi)  
  - Extract and place it in `C:\apache-tomcat-11.0\`  
- **MySQL and MySQL Workbench**  
  - [Download MySQL](https://dev.mysql.com/downloads/)  
  - During setup, configure a **root password**  
- **MySQL Connector/J (JDBC Driver)**  
  - [Download JDBC Driver](https://dev.mysql.com/downloads/connector/j/)
  - Select the "Platform Independent" option as Operating System.
  - Place `mysql-connector-java-<version>.jar` inside `C:\apache-tomcat-11.0\lib\`  

### **MacOS Users**  
- **Install Java**  
  ```sh
  brew install openjdk
  ```  
  - Verify installation:  
    ```sh
    java -version
    javac -version
    ```  
- **Install Apache Tomcat**  
  ```sh
  brew install tomcat
  ```  
- **Install MySQL**  
  ```sh
  brew install mysql
  ```  
  - Start MySQL Server:  
    ```sh
    mysql.server start
    ```  
- **Download MySQL Connector/J**  
  - Move `.jar` file to:  
    ```sh
    /usr/local/Cellar/tomcat/libexec/lib/
    ```  

---

## **🚀 Installation Steps**  

### **1️⃣ Clone the Repository**  
```sh
git clone https://github.com/U-Jayadhar/WAD-Lab-2.git
cd WAD-Lab-2
```  

### **2️⃣ Set Up MySQL Database**  
1. Open **MySQL Workbench** or Terminal and run:  
   ```sql
   CREATE DATABASE EmployeeDB;
   USE EmployeeDB;

   CREATE TABLE employees (
       id INT AUTO_INCREMENT PRIMARY KEY,
       name VARCHAR(100) NOT NULL,
       gender VARCHAR(10) NOT NULL,
       department VARCHAR(50) NOT NULL,
       dob DATE NOT NULL,
       email VARCHAR(100) UNIQUE NOT NULL,
       phone VARCHAR(15) NOT NULL
   );
   ```  
2. Update `submit.jsp` if your MySQL credentials differ:  
   ```jsp
   String url = "jdbc:mysql://localhost:3306/EmployeeDB?useSSL=false&allowPublicKeyRetrieval=true";
   String user = "root";
   String password = "your_mysql_password";
   ```  

### **3️⃣ Deploy to Apache Tomcat**  
1. Move the project files into Tomcat’s webapps directory:  
   ```sh
   mv employee-registration-jsp /path/to/tomcat/webapps/EmployeeApp
   ```  
   **Windows:** Move the folder to `C:\apache-tomcat-11.0\webapps\EmployeeApp`  

2. **Start Tomcat Server**  
   - **Windows:**  
     ```sh
     C:\apache-tomcat-11.0\bin\startup.bat
     ```  
   - **Mac/Linux:**  
     ```sh
     ./path/to/tomcat/bin/startup.sh
     ```  

---

## **🌐 Access the Web Application**  
1. Open a browser and go to:  
   ```
   http://localhost:8080/EmployeeApp/index.html
   ```
2. Fill out the employee registration form and submit.  
3. If everything is set up correctly, you should see a success message.
4. Check the data in MySQL:  
   ```sql
   SELECT * FROM employees;
   ```  

---

## **🛠️ Stopping the Server**  
- **Windows:**  
  ```sh
  C:\apache-tomcat-11.0\bin\shutdown.bat
  ```  
- **Mac/Linux:**  
  ```sh
  ./path/to/tomcat/bin/shutdown.sh
  ```  

---

## **❓ Troubleshooting**  
| Issue | Solution |
|--------|----------|
| **`com.mysql.cj.jdbc.Driver not found`** | Ensure `mysql-connector-java-<version>.jar` is inside `tomcat/lib/`, then restart Tomcat. |
| **`Access denied for user 'root'@'localhost'`** | Verify MySQL username/password. Try resetting the password in MySQL Workbench. |
| **Form submits but no data in DB** | Check if MySQL is running and `EmployeeDB.employees` table exists. |

---

## **👤 Author**
Developed by U. Jayadhar.