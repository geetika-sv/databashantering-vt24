CREATE DATABASE users_application;

USE users_application;

CREATE TABLE användare (
      user_id INT PRIMARY KEY AUTO_INCREMENT,
      username VARCHAR (255) NOT NULL,
      email VARCHAR(255)
      );
      
CREATE TABLE inlägg (
      post_id INT PRIMARY KEY AUTO_INCREMENT,
      user_id INT ,
      title VARCHAR(255),
      content VARCHAR(255),
	  FOREIGN KEY (user_id) REFERENCES användare (user_id)
	  );   
      
CREATE TABLE kommentarer (
      comment_id INT PRIMARY KEY AUTO_INCREMENT,
      post_id INT ,
      user_id INT ,
      content VARCHAR(255),
	  FOREIGN KEY (post_id) REFERENCES inlägg (post_id),
      FOREIGN KEY (user_id) REFERENCES användare (user_id)
       
  ); 

CREATE TABLE gilla_markeringar (
      like_id INT PRIMARY KEY AUTO_INCREMENT,
      post_id INT ,
      user_id INT ,
      FOREIGN KEY (post_id) REFERENCES inlägg (post_id),
      FOREIGN KEY (user_id) REFERENCES användare (user_id)
  );   
  
    INSERT INTO användare (user_id, username, email)
      VALUES (1, 'alice', '-'),
			 (2,'bob', '-'),
             (3, 'charlie', '-');
             
   INSERT INTO inlägg (post_id, user_id, title, content)
      VALUES (1,1, 'Jag älskar SQL', '-'),
			 (2,2,'Vad är en databas', '-'),
             (3, 3,'Hur fungerar en databas?', '-');   
             
                
   INSERT INTO kommentarer (comment_id, post_id, user_id, content)
      VALUES (1,1, 2, 'Bra inlägg!'),
			 (2,2, 3, 'Intressant fråga'),
             (3, 3,1, 'Jag undrar också!');     
             
     INSERT INTO gilla_markeringar (like_id, post_id, user_id)
      VALUES (1,1, 2),
			 (2,2,3),
             (3,3,1);   
             
SELECT * FROM användare;    
        
SELECT * FROM inlägg;
        
SELECT * FROM kommentarer ; 
        
SELECT * FROM gilla_markeringar; 
 
 SELECT inlägg.post_id, inlägg.title, användare.username AS user_name  -- Retrieve posts and names of users who wrote the posts
FROM inlägg
JOIN användare ON inlägg.user_id = användare.user_id;
       
SELECT kommentarer.comment_id, kommentarer.content, användare.username AS user_name -- Retrieve comments and names of users who wrote the comments 
FROM kommentarer
JOIN användare ON kommentarer.user_id = användare.user_id;

SELECT DISTINCT användare.username -- Retrieve the names of all users who like any post where the title contains the word"database"
FROM användare
JOIN gilla_markeringar ON användare.user_id = gilla_markeringar.user_id
JOIN inlägg ON gilla_markeringar.post_id = inlägg.post_id
WHERE inlägg.title LIKE '%databas%';

        
        