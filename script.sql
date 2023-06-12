-- Create the User table
CREATE TABLE User (
  user_id SERIAL PRIMARY KEY,
  username VARCHAR(255) NOT NULL,
  password VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL,
  full_name VARCHAR(255) NOT NULL,
  date_of_birth DATE,
  created_at TIMESTAMP DEFAULT NOW(),
  updated_at TIMESTAMP DEFAULT NOW()
);

-- Create the Relationship table
CREATE TABLE Relationship (
  relationship_id SERIAL PRIMARY KEY,
  user_id INTEGER NOT NULL,
  contact_id INTEGER NOT NULL,
  status VARCHAR(255) NOT NULL,
  created_at TIMESTAMP DEFAULT NOW(),
  FOREIGN KEY (user_id) REFERENCES User (user_id),
  FOREIGN KEY (contact_id) REFERENCES User (user_id)
);

-- Create the Post table
CREATE TABLE Post (
  post_id SERIAL PRIMARY KEY,
  user_id INTEGER NOT NULL,
  content TEXT NOT NULL,
  created_at TIMESTAMP DEFAULT NOW(),
  updated_at TIMESTAMP DEFAULT NOW(),
  FOREIGN KEY (user_id) REFERENCES User (user_id)
);

-- Create the Comment table
CREATE TABLE Comment (
  comment_id SERIAL PRIMARY KEY,
  post_id INTEGER NOT NULL,
  user_id INTEGER NOT NULL,
  content TEXT NOT NULL,
  created_at TIMESTAMP DEFAULT NOW(),
  FOREIGN KEY (post_id) REFERENCES Post (post_id),
  FOREIGN KEY (user_id) REFERENCES User (user_id)
);

-- Create the Like table
CREATE TABLE Like (
  like_id SERIAL PRIMARY KEY,
  post_id INTEGER NOT NULL,
  user_id INTEGER NOT NULL,
  created_at TIMESTAMP DEFAULT NOW(),
  FOREIGN KEY (post_id) REFERENCES Post (post_id),
  FOREIGN KEY (user_id) REFERENCES User (user_id)
);

-- Create the Photo table
CREATE TABLE Photo (
  photo_id SERIAL PRIMARY KEY,
  user_id INTEGER NOT NULL,
  file_path VARCHAR(255) NOT NULL,
  created_at TIMESTAMP DEFAULT NOW(),
  FOREIGN KEY (user_id) REFERENCES User (user_id)
);

-- Create the Message table
CREATE TABLE Message (
  message_id SERIAL PRIMARY KEY,
  sender_id INTEGER NOT NULL,
  receiver_id INTEGER NOT NULL,
  content TEXT NOT NULL,
  created_at TIMESTAMP DEFAULT NOW(),
  FOREIGN KEY (sender_id) REFERENCES User (user_id),
  FOREIGN KEY (receiver_id) REFERENCES User (user_id)
);
