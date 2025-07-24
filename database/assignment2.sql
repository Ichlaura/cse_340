-- 1. Insertar un nuevo cliente
INSERT INTO account (first_name, last_name, email, password, client_type)
VALUES ('Tony', 'Stark', 'ironman@avengers.com', 'IamIronman123', 'Admin');

-- 2. Actualizar el nombre de Tony Stark
UPDATE account
SET first_name = 'Anthony'
WHERE email = 'ironman@avengers.com';

-- 3. Eliminar a Tony Stark
DELETE FROM account
WHERE email = 'ironman@avengers.com';

-- 4. Actualizar la descripción de un vehículo
UPDATE inventory
SET inv_description = 'Updated description: Now with advanced features.'
WHERE inv_make = 'Ford' AND inv_model = 'Escape';

-- 5. Consulta JOIN entre inventory y classification
SELECT 
    i.inv_make,
    i.inv_model,
    c.classification_name
FROM inventory i
JOIN classification c ON i.classification_id = c.classification_id;

-- 6. Actualizar inv_image y inv_thumbnail
UPDATE inventory
SET inv_image = 'images/ford-escape-new.jpg',
    inv_thumbnail = 'images/ford-escape-new-thumb.jpg'
WHERE inv_make = 'Ford' AND inv_model = 'Escape';
