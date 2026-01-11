CREATE TABLE Books (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    Title CHAR(200) NOT NULL,
    Author CHAR(150),
    Price DECIMAL(10, 2),
    IsAvailable BIT
);

INSERT INTO Books (Title, Author, Price, IsAvailable)
VALUES
('The Alchemist', 'Paulo Coelho', 65, 1),
('The Little Prince', 'Antoine de Saint-Exupéry', 55, 1),
('Superintelligence: Paths, Dangers, Strategies', 'Nick Bostrom', 45, 0);


SELECT *
FROM Books
WHERE Price > 50;


UPDATE Books
SET Price = 70.00
WHERE ID = 1;


DELETE FROM Books
WHERE ID = 3;


