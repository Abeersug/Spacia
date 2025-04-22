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
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            return new User
                            {
                                UserId = reader.GetInt32(reader.GetOrdinal("UserId")),
                                Email = reader.GetString(reader.GetOrdinal("Email")),
                                Password = reader.GetString(reader.GetOrdinal("Password")),
                                FirstName = reader.GetString(reader.GetOrdinal("FirstName")),
                                LastName = reader.GetString(reader.GetOrdinal("LastName")),
                                CreatedAt = reader.GetDateTime(reader.GetOrdinal("CreatedAt")),
                                LastLoginAt = reader.IsDBNull(reader.GetOrdinal("LastLoginAt")) ? null : (DateTime?)reader.GetDateTime(reader.GetOrdinal("LastLoginAt"))
                            };
                        }
                        return null;
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
    }
}
