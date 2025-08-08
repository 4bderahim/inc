-- CREATE DATABASE IF NOT EXISTS wordpress;
-- CREATE USER IF NOT EXISTS 'wpuser'@'%' IDENTIFIED BY 'wppass';
-- GRANT ALL PRIVILEGES ON wordpress.* TO 'wpuser'@'%';
-- FLUSH PRIVILEGES;



-- Create the WordPress database (if not exists)
CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};

-- Create the user and allow connection from any host in the Docker network
CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';

-- Grant full access to the WordPress DB
GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'%';

-- Reload privileges
FLUSH PRIVILEGES;
