CREATE SCHEMA fullstack_example;
USE fullstack_example;

CREATE TABLE chirps (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    body VARCHAR(150) NOT NULL,
    location VARCHAR(50),
    create_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id)
        REFERENCES users (id),
    CONSTRAINT fk_users FOREIGN KEY (user_id)
        REFERENCES users (id)
        ON DELETE CASCADE
);

CREATE TABLE users (
    id INT AUTO_INCREMENT,
    handle VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL UNIQUE,
    create_at TIMESTAMP,
    PRIMARY KEY (id)
);

CREATE TABLE mentions (
    chirp_id INT,
    user_id INT,
    PRIMARY KEY (chirp_id , user_id),
    FOREIGN KEY (chirp_id)
        REFERENCES chirps (id),
    FOREIGN KEY (user_id)
        REFERENCES users (id),
    CONSTRAINT fk_user FOREIGN KEY (user_id)
        REFERENCES users (id)
        ON DELETE CASCADE,
    CONSTRAINT fk_chirp FOREIGN KEY (chirp_id)
        REFERENCES chirps (id)
        ON DELETE CASCADE
);

CREATE USER "example_user"@"localhost" IDENTIFIED BY "examplepassword";
GRANT ALL PRIVILEGES ON fullstack_example.* TO "example_user"@"localhost";

-- insert into users (handle,email) values 
-- ('JeffTester', 'JeffUsers@gmail.com'),
-- ('CoryUser', 'Cory@hotmail.com');

-- insert into chirps (message,city,user_id) values 
-- ('sample Set chirp 1 @sampleUser2', 'atlanta',1),
-- ('sample Set chirp 2 @sampleUser1', 'atlanta',2);

-- insert into mentions (chirp_id,user_id) values 
-- (1,2),
-- (2,1);

SELECT 
    *
FROM
    users;
SELECT 
    *
FROM
    chirps;
SELECT 
    *
FROM
    mentions;