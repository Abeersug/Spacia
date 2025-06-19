using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Security.Cryptography;
using System.Text;

namespace Spacia.Models
{
    public class DatabaseHelper
    {
        private static string ConnectionString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

        public static void InitializeDatabase()
        {
            // Create database if it doesn't exist
            string masterConnection = "Server=(LocalDB)\\MSSQLLocalDB;Database=master;Integrated Security=True";
            using (SqlConnection conn = new SqlConnection(masterConnection))
            {
                conn.Open();
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.Connection = conn;
                    cmd.CommandText = "IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'Spacia') CREATE DATABASE Spacia";
                    cmd.ExecuteNonQuery();
                }
            }

            // Now initialize the Users table
            using (SqlConnection conn = new SqlConnection(ConnectionString))
            {
                conn.Open();
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.Connection = conn;
                    cmd.CommandText = @"
                        IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Users')
                        BEGIN
                            CREATE TABLE Users (
                                UserId INT IDENTITY(1,1) PRIMARY KEY,
                                Email NVARCHAR(100) UNIQUE NOT NULL,
                                Password NVARCHAR(100) NOT NULL,
                                FirstName NVARCHAR(50) NOT NULL,
                                LastName NVARCHAR(50) NOT NULL,
                                PhoneNumber NVARCHAR(20) NOT NULL,
                                Role NVARCHAR(10) NOT NULL DEFAULT 'user',
                                CreatedAt DATETIME NOT NULL DEFAULT GETDATE(),
                                LastLoginAt DATETIME NULL
                            )
                        END";
                    cmd.ExecuteNonQuery();
                }
            }
        }

        public static string HashPassword(string password)
        {
            using (var sha256 = SHA256.Create())
            {
                var hashedBytes = sha256.ComputeHash(Encoding.UTF8.GetBytes(password));
                var hashedString = Convert.ToBase64String(hashedBytes);
                System.Diagnostics.Debug.WriteLine($"Hashing password. Original length: {password.Length}, Hash: {hashedString}");
                return hashedString;
            }
        }

        public static User GetUserByEmail(string email)
        {
            using (SqlConnection conn = new SqlConnection(ConnectionString))
            {
                conn.Open();
                using (SqlCommand cmd = new SqlCommand("SELECT * FROM Users WHERE Email = @Email", conn))
                {
                    cmd.Parameters.AddWithValue("@Email", email);
                    try
                    {
                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            if (reader.Read())
                            {
                                User user = new User();
                                
                                // Get required fields
                                user.UserId = reader.GetInt32(reader.GetOrdinal("UserId"));
                                user.Email = reader.GetString(reader.GetOrdinal("Email"));
                                user.Password = reader.GetString(reader.GetOrdinal("Password"));
                                
                                // Get fields that may be null with safer handling
                                user.FirstName = !reader.IsDBNull(reader.GetOrdinal("FirstName")) 
                                    ? reader.GetString(reader.GetOrdinal("FirstName")) 
                                    : string.Empty;
                                
                                // Special handling for LastName which might be null
                                int lastNameOrdinal = -1;
                                try {
                                    lastNameOrdinal = reader.GetOrdinal("LastName");
                                    user.LastName = !reader.IsDBNull(lastNameOrdinal) 
                                        ? reader.GetString(lastNameOrdinal) 
                                        : string.Empty;
                                }
                                catch (IndexOutOfRangeException) {
                                    // LastName column doesn't exist in this table
                                    user.LastName = string.Empty;
                                    System.Diagnostics.Debug.WriteLine("LastName column not found in Users table");
                                }
                                
                                // Get phone number if it exists
                                int phoneOrdinal = -1;
                                try {
                                    phoneOrdinal = reader.GetOrdinal("PhoneNumber");
                                    user.PhoneNumber = !reader.IsDBNull(phoneOrdinal) 
                                        ? reader.GetString(phoneOrdinal) 
                                        : string.Empty;
                                }
                                catch (IndexOutOfRangeException) {
                                    // Try legacy "Phone" column name
                                    try {
                                        phoneOrdinal = reader.GetOrdinal("Phone");
                                        user.PhoneNumber = !reader.IsDBNull(phoneOrdinal) 
                                            ? reader.GetString(phoneOrdinal) 
                                            : string.Empty;
                                    }
                                    catch (IndexOutOfRangeException) {
                                        user.PhoneNumber = string.Empty;
                                        System.Diagnostics.Debug.WriteLine("Neither PhoneNumber nor Phone column found in Users table");
                                    }
                                }
                                
                                // Get Role
                                try {
                                    int roleOrdinal = reader.GetOrdinal("Role");
                                    user.Role = !reader.IsDBNull(roleOrdinal) 
                                        ? reader.GetString(roleOrdinal) 
                                        : "user";
                                }
                                catch (IndexOutOfRangeException) {
                                    user.Role = "user";
                                    System.Diagnostics.Debug.WriteLine("Role column not found in Users table");
                                }
                                
                                // Dates
                                try {
                                    int createdAtOrdinal = reader.GetOrdinal("CreatedAt");
                                    user.CreatedAt = !reader.IsDBNull(createdAtOrdinal) 
                                        ? reader.GetDateTime(createdAtOrdinal) 
                                        : DateTime.Now;
                                }
                                catch (IndexOutOfRangeException) {
                                    user.CreatedAt = DateTime.Now;
                                    System.Diagnostics.Debug.WriteLine("CreatedAt column not found in Users table");
                                }
                                
                                try {
                                    int lastLoginOrdinal = reader.GetOrdinal("LastLoginAt");
                                    user.LastLoginAt = !reader.IsDBNull(lastLoginOrdinal) 
                                        ? (DateTime?)reader.GetDateTime(lastLoginOrdinal) 
                                        : null;
                                }
                                catch (IndexOutOfRangeException) {
                                    user.LastLoginAt = null;
                                    System.Diagnostics.Debug.WriteLine("LastLoginAt column not found in Users table");
                                }
                                
                                System.Diagnostics.Debug.WriteLine($"User found: {user.Email}, UserId: {user.UserId}");
                                return user;
                            }
                            return null;
                        }
                    }
                    catch (Exception ex)
                    {
                        System.Diagnostics.Debug.WriteLine($"Error in GetUserByEmail: {ex.Message}");
                        throw;
                    }
                }
            }
        }

        public static bool RegisterUser(User user)
        {
            // Hash the password before saving
            user.Password = HashPassword(user.Password);
            using (SqlConnection conn = new SqlConnection(ConnectionString))
            {
                conn.Open();
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.Connection = conn;
                    cmd.CommandText = @"
                        INSERT INTO Users (Email, Password, FirstName, LastName, PhoneNumber)
                        VALUES (@Email, @Password, @FirstName, @LastName, @PhoneNumber)";

                    cmd.Parameters.AddWithValue("@Email", user.Email);
                    cmd.Parameters.AddWithValue("@Password", user.Password); // Password is already hashed
                    cmd.Parameters.AddWithValue("@FirstName", user.FirstName);
                    cmd.Parameters.AddWithValue("@LastName", user.LastName);
                    cmd.Parameters.AddWithValue("@PhoneNumber", user.PhoneNumber);

                    try
                    {
                        return cmd.ExecuteNonQuery() > 0;
                    }
                    catch (SqlException ex)
                    {
                        System.Diagnostics.Debug.WriteLine($"SQL Error: {ex.Message}");
                        throw; // Let's see the actual error
                    }
                }
            }
        }

        public static bool ValidateUser(string email, string password)
        {
            using (SqlConnection conn = new SqlConnection(ConnectionString))
            {
                conn.Open();
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.Connection = conn;
                    cmd.CommandText = "SELECT UserId FROM Users WHERE Email = @Email AND Password = @Password";
                    cmd.Parameters.AddWithValue("@Email", email);
                    cmd.Parameters.AddWithValue("@Password", HashPassword(password));

                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            int userId = reader.GetInt32(0);
                            reader.Close();

                            // Update last login time
                            cmd.CommandText = "UPDATE Users SET LastLoginAt = GETDATE() WHERE UserId = @UserId";
                            cmd.Parameters.Clear();
                            cmd.Parameters.AddWithValue("@UserId", userId);
                            cmd.ExecuteNonQuery();

                            return true;
                        }
                        return false;
                    }
                }
            }
        }

        public static void UpdateUserLastLogin(int userId)
        {
            using (SqlConnection conn = new SqlConnection(ConnectionString))
            {
                conn.Open();
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.Connection = conn;
                    cmd.CommandText = "UPDATE Users SET LastLoginAt = GETDATE() WHERE UserId = @UserId";
                    cmd.Parameters.AddWithValue("@UserId", userId);
                    cmd.ExecuteNonQuery();
                }
            }
        }

        public static User GetUserById(int userId)
        {
            using (SqlConnection conn = new SqlConnection(ConnectionString))
            {
                conn.Open();
                using (SqlCommand cmd = new SqlCommand("SELECT * FROM Users WHERE UserId = @UserId", conn))
                {
                    cmd.Parameters.AddWithValue("@UserId", userId);
                    try
                    {
                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            if (reader.Read())
                            {
                                User user = new User();
                                
                                // Get required fields
                                user.UserId = reader.GetInt32(reader.GetOrdinal("UserId"));
                                user.Email = reader.GetString(reader.GetOrdinal("Email"));
                                user.Password = reader.GetString(reader.GetOrdinal("Password"));
                                
                                // Get fields that may be null with safer handling
                                user.FirstName = !reader.IsDBNull(reader.GetOrdinal("FirstName")) 
                                    ? reader.GetString(reader.GetOrdinal("FirstName")) 
                                    : string.Empty;
                                
                                // Special handling for LastName which might be null
                                int lastNameOrdinal = -1;
                                try {
                                    lastNameOrdinal = reader.GetOrdinal("LastName");
                                    user.LastName = !reader.IsDBNull(lastNameOrdinal) 
                                        ? reader.GetString(lastNameOrdinal) 
                                        : string.Empty;
                                }
                                catch (IndexOutOfRangeException) {
                                    // LastName column doesn't exist in this table
                                    user.LastName = string.Empty;
                                    System.Diagnostics.Debug.WriteLine("LastName column not found in Users table");
                                }
                                
                                // Get phone number if it exists
                                int phoneOrdinal = -1;
                                try {
                                    phoneOrdinal = reader.GetOrdinal("PhoneNumber");
                                    user.PhoneNumber = !reader.IsDBNull(phoneOrdinal) 
                                        ? reader.GetString(phoneOrdinal) 
                                        : string.Empty;
                                }
                                catch (IndexOutOfRangeException) {
                                    // Try legacy "Phone" column name
                                    try {
                                        phoneOrdinal = reader.GetOrdinal("Phone");
                                        user.PhoneNumber = !reader.IsDBNull(phoneOrdinal) 
                                            ? reader.GetString(phoneOrdinal) 
                                            : string.Empty;
                                    }
                                    catch (IndexOutOfRangeException) {
                                        user.PhoneNumber = string.Empty;
                                        System.Diagnostics.Debug.WriteLine("Neither PhoneNumber nor Phone column found in Users table");
                                    }
                                }
                                
                                // Get Role
                                try {
                                    int roleOrdinal = reader.GetOrdinal("Role");
                                    user.Role = !reader.IsDBNull(roleOrdinal) 
                                        ? reader.GetString(roleOrdinal) 
                                        : "user";
                                }
                                catch (IndexOutOfRangeException) {
                                    user.Role = "user";
                                    System.Diagnostics.Debug.WriteLine("Role column not found in Users table");
                                }
                                
                                // Dates
                                try {
                                    int createdAtOrdinal = reader.GetOrdinal("CreatedAt");
                                    user.CreatedAt = !reader.IsDBNull(createdAtOrdinal) 
                                        ? reader.GetDateTime(createdAtOrdinal) 
                                        : DateTime.Now;
                                }
                                catch (IndexOutOfRangeException) {
                                    user.CreatedAt = DateTime.Now;
                                    System.Diagnostics.Debug.WriteLine("CreatedAt column not found in Users table");
                                }
                                
                                try {
                                    int lastLoginOrdinal = reader.GetOrdinal("LastLoginAt");
                                    user.LastLoginAt = !reader.IsDBNull(lastLoginOrdinal) 
                                        ? (DateTime?)reader.GetDateTime(lastLoginOrdinal) 
                                        : null;
                                }
                                catch (IndexOutOfRangeException) {
                                    user.LastLoginAt = null;
                                    System.Diagnostics.Debug.WriteLine("LastLoginAt column not found in Users table");
                                }
                                
                                System.Diagnostics.Debug.WriteLine($"User found by ID: {userId}, Email: {user.Email}");
                                return user;
                            }
                            return null;
                        }
                    }
                    catch (Exception ex)
                    {
                        System.Diagnostics.Debug.WriteLine($"Error in GetUserById: {ex.Message}");
                        throw;
                    }
                }
            }
        }
    }
}
