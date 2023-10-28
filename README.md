# 🏨 Hotel Reservation Application

This application allows users to search and view hotel reservations. It was developed using PHP and MySQL.

## Requirements

- PHP (tested with PHP 7)
- MySQL
- Web server (e.g., Apache)

## Installation

1. Clone the project to your web server directory or upload the files.
2. Create a MySQL database (e.g., "hotelreservierung") and import the SQL file `database.sql` included in your project folder.
3. Adjust the database connection information in the `config.php` file:

   ```php
   $dbhost = 'localhost';
   $dbuser = 'root';
   $dbpass = '';
   $dbname = 'hotelreservierung';

## Usage
On the application's homepage, users can search for hotel reservations by selecting various filters and search criteria.
Results are displayed in a table, and users can view details of the found reservations.
