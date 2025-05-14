-- Create Authors Table
CREATE TABLE Authors (
    AuthorID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(100) NOT NULL,
    LastName VARCHAR(100) NOT NULL,
    BirthDate DATE,
    Nationality VARCHAR(100)
);

-- Create Books Table
CREATE TABLE Books (
    BookID INT AUTO_INCREMENT PRIMARY KEY,
    Title VARCHAR(255) NOT NULL,
    Genre VARCHAR(100),
    PublishedYear INT,
    ISBN VARCHAR(20) UNIQUE NOT NULL
);

-- Create Patrons Table
CREATE TABLE Patrons (
    PatronID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(100) NOT NULL,
    LastName VARCHAR(100) NOT NULL,
    Email VARCHAR(255) UNIQUE NOT NULL,
    PhoneNumber VARCHAR(15)
);

-- Create Loans Table
CREATE TABLE Loans (
    LoanID INT AUTO_INCREMENT PRIMARY KEY,
    BookID INT,
    PatronID INT,
    LoanDate DATE NOT NULL,
    DueDate DATE NOT NULL,
    ReturnDate DATE,
    FOREIGN KEY (BookID) REFERENCES Books(BookID),
    FOREIGN KEY (PatronID) REFERENCES Patrons(PatronID)
);

-- Create BookAuthors Table for Many-to-Many relationship
CREATE TABLE BookAuthors (
    BookID INT,
    AuthorID INT,
    PRIMARY KEY (BookID, AuthorID),
    FOREIGN KEY (BookID) REFERENCES Books(BookID),
    FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID)
);

-- Insert sample authors
INSERT INTO Authors (FirstName, LastName, BirthDate, Nationality) VALUES
('J.K.', 'Rowling', '1965-07-31', 'British'),
('George', 'Orwell', '1903-06-25', 'British');

-- Insert sample books
INSERT INTO Books (Title, Genre, PublishedYear, ISBN) VALUES
('Harry Potter and the Philosopher\'s Stone', 'Fantasy', 1997, '978-0747532743'),
('1984', 'Dystopian', 1949, '978-0451524935');

-- Insert sample patrons
INSERT INTO Patrons (FirstName, LastName, Email, PhoneNumber) VALUES
('Alice', 'Johnson', 'alice@example.com', '1234567890'),
('Bob', 'Smith', 'bob@example.com', '0987654321');

-- Insert sample loans
INSERT INTO Loans (BookID, PatronID, LoanDate, DueDate) VALUES
(1, 1, '2025-01-01', '2025-01-15'),
(2, 2, '2025-01-03', '2025-01-17');

-- Link books and authors in BookAuthors
INSERT INTO BookAuthors (BookID, AuthorID) VALUES
(1, 1),
(2, 2);
