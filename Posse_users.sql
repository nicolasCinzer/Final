CREATE USER IF NOT EXISTS 'cliente_1'@'localhost' IDENTIFIED BY 'cl1foobar';
CREATE USER IF NOT EXISTS 'super_cliente_1'@'localhost' IDENTIFIED BY 'super1foobar';

GRANT SELECT ON posse.* TO 'cliente_1'@'localhost';
GRANT SELECT, UPDATE, INSERT ON posse.* TO 'super_cliente_1'@'localhost';
