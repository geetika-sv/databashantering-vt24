CREATE DATABASE recept_application;

CREATE TABLE recipes (
      recipe_id INT PRIMARY KEY AUTO_INCREMENT,
      recipe_name VARCHAR (255) NOT NULL,
      description VARCHAR(255)
      );
      
      
      CREATE TABLE ingredients (
      ingredient_id INT PRIMARY KEY AUTO_INCREMENT,
      ingredient_name VARCHAR (255) NOT NULL,
      unit VARCHAR(255)
      );
      
      CREATE TABLE foods (
      recipe_id INT,
      ingredient_id INT NOT NULL,
      quqntity INT
      );
      
      DROP TABLE foods;
      
      
      CREATE TABLE foods (
      recipe_id INT,
      ingredient_id INT NOT NULL,
      quantity INT,
	  FOREIGN KEY (recipe_id) REFERENCES recipes (recipe_id),
	  FOREIGN KEY (ingredient_id) REFERENCES ingredients (ingredient_id)
      ); 
      
      INSERT INTO recipes (recipe_id, recipe_name, description)
      VALUES (1, 'Pasta', 'Tasty italian dish'),
			 (2,'Fried rice', 'yummy east asian cuisine');
	
        
      INSERT INTO ingredients (ingredient_id,ingredient_name,  unit)
      VALUES (1, 'Pasta', 'g'),
			 (2,'Tomato pure', 'ml'),
			 (3,'Rice', 'g'),
			 (4,'Egg', 'unit');
             
        INSERT INTO foods (recipe_id,ingredient_id, quantity)
		VALUES	(1,1, 150),
			    (1,2,200),
			    (2,3,200),       
                (2,4,4);
                
      SELECT * FROM recipes; 
      
      SELECT * FROM ingredients; 
      
      SELECT * FROM foods; 
      
      SELECT Ingredients.ingredient_name, foods.quantity,ingredients.unit
      FROM recipes
      JOIN foods ON recipes.recipe_id= foods.recipe_id
      JOIN ingredients ON foods.ingredient_id = Ingredients.ingredient_id
      WHERE recipes.recipe_name = 'Pasta';
      
      SELECT * FROM foods;