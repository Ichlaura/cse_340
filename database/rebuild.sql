-- 1. Crear ENUM type para client_type
CREATE TYPE client_type_enum AS ENUM ('Client', 'Employee', 'Admin');

-- 2. Crear tabla account
CREATE TABLE account (
    account_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(100) NOT NULL,
    client_type client_type_enum DEFAULT 'Client'
);

-- 3. Crear tabla classification
CREATE TABLE classification (
    classification_id SERIAL PRIMARY KEY,
    classification_name VARCHAR(50) NOT NULL
);

-- 4. Crear tabla inventory
CREATE TABLE inventory (
    inventory_id SERIAL PRIMARY KEY,
    inv_make VARCHAR(50) NOT NULL,
    inv_model VARCHAR(50) NOT NULL,
    inv_year INT NOT NULL,
    inv_description TEXT NOT NULL,
    inv_image VARCHAR(255),
    inv_thumbnail VARCHAR(255),
    inv_price NUMERIC(10,2) NOT NULL,
    inv_miles INT,
    inv_color VARCHAR(50),
    classification_id INT REFERENCES classification(classification_id)
);

-- 5. Insertar datos en classification
INSERT INTO classification (classification_name)
VALUES ('SUV'), ('Sedan'), ('Truck');

-- 6. Insertar datos en inventory
INSERT INTO inventory (inv_make, inv_model, inv_year, inv_description, inv_image, inv_thumbnail, inv_price, inv_miles, inv_color, classification_id)
VALUES
('Ford', 'Escape', 2022, 'A reliable SUV.', 'images/escape.jpg', 'images/escape-thumb.jpg', 25000.00, 10000, 'Blue', 1),
('Toyota', 'Camry', 2023, 'Comfortable and fuel efficient.', 'images/camry.jpg', 'images/camry-thumb.jpg', 27000.00, 5000, 'White', 2),
('Chevrolet', 'Silverado', 2021, 'Powerful pickup truck.', 'images/silverado.jpg', 'images/silverado-thumb.jpg', 35000.00, 15000, 'Black', 3);

-- 7. Consulta JOIN
SELECT 
    inv.inv_make, inv.inv_model, cls.classification_name
FROM 
    inventory AS inv
JOIN 
    classification AS cls ON inv.classification_id = cls.classification_id;

-- 8. Actualizar imágenes
UPDATE inventory
SET inv_image = 'images/updated.jpg',
    inv_thumbnail = 'images/updated-thumb.jpg'
WHERE inventory_id = 1;
