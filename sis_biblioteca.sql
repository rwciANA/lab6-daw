-- Eliminar tablas si existen (para evitar errores)
DROP TABLE IF EXISTS loans;
DROP TABLE IF EXISTS books;
DROP TABLE IF EXISTS users;

-- Tabla users
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    status BOOLEAN DEFAULT true,
    created TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    modified TIMESTAMP,
    created_id INT,
    modified_id INT
);

-- Tabla books
CREATE TABLE books (
    id SERIAL PRIMARY KEY,
    title VARCHAR(150),
    author VARCHAR(100),
    status BOOLEAN DEFAULT true,
    created TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    modified TIMESTAMP,
    created_id INT,
    modified_id INT
);

-- Tabla loans
CREATE TABLE loans (
    id SERIAL PRIMARY KEY,
    user_id INT,
    book_id INT,
    loan_date DATE,
    return_date DATE,
    status BOOLEAN DEFAULT true,
    created TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    modified TIMESTAMP,
    created_id INT,
    modified_id INT,

    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (book_id) REFERENCES books(id)
);

-- Datos de prueba
INSERT INTO users (name, email) VALUES 
('Anton', 'anton@gmail.com'),
('Juan', 'juan@gmail.com');

INSERT INTO books (title, author) VALUES 
('Clean Code', 'Robert C. Martin'),
('1984', 'George Orwell');

INSERT INTO loans (user_id, book_id, loan_date, return_date) VALUES 
(1, 1, '2026-01-01', '2026-01-10'),
(2, 2, '2026-01-05', '2026-01-15');
