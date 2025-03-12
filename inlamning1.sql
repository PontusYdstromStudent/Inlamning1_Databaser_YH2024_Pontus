/* INLÄMNING 1 - Pontus Ydström, YH 2024 */
CREATE DATABASE Bokhandel;
USE Bokhandel;

-- Skapar tabellen Böcker
CREATE TABLE Böcker (
    BokID INT AUTO_INCREMENT PRIMARY KEY,
    ISBN VARCHAR(20) UNIQUE NOT NULL,
    Titel VARCHAR(100) NOT NULL,
    Författare VARCHAR(50) NOT NULL,
	`Antal i lager` INT NOT NULL,
    `Pris per styck i SEK` DECIMAL(8,2) NOT NULL
);

-- Skapar tabellen Kunder
CREATE TABLE Kunder (
	KundID INT AUTO_INCREMENT PRIMARY KEY,
    Namn VARCHAR(50) NOT NULL,
    Adress VARCHAR(50) NOT NULL,
    Telefon VARCHAR(20) NOT NULL,
    Epostadress VARCHAR(50) NOT NULL UNIQUE
    );
    
-- Skapar tabellen Beställningar
CREATE TABLE Beställningar (
	OrdernummerID INT AUTO_INCREMENT PRIMARY KEY,
    Datum DATETIME DEFAULT CURRENT_TIMESTAMP,
    KundID INT NOT NULL, FOREIGN KEY (KundID) REFERENCES Kunder(KundID),
    Totalbelopp DECIMAL(8,2) DEFAULT NULL
    );
    
-- Skapar tabellen Orderrader
    CREATE TABLE Orderrader (
    OrderradID INT AUTO_INCREMENT PRIMARY KEY,
    OrderID INT NOT NULL,  FOREIGN KEY (OrderID) REFERENCES Beställningar(OrdernummerID),
    BokID INT NOT NULL, FOREIGN KEY (BokID) REFERENCES Böcker(BokID),
    Antal INT NOT NULL, 
    `Pris per styck` DECIMAL(8,2) NOT NULL
);

    -- Infogar data i tabellen Böcker
    INSERT INTO Böcker (ISBN, Titel, Författare, `Antal i lager`, `Pris per styck i SEK`) VALUES
    ("9789197655460", "Den svenska historien om världens snabbaste bilsport", "Christina Boden", 5, 294.00),
	("9781788842686", "Grands Prix", "Motorsport Images", 1, 743.99),
    ("9789180066068", "Cirkus Formel 1", "Anna Andersson", 8, 259.00),
    ("9780241712443", "Grand Prix", "Will Buxton", 20, 360.00),
    ("9781785949241", "How to read F1", "Jennie Gow", 8, 190.00),
    ("9781035418756", "Formula 1 2025", "Bruce Jones", 4, 224.00),
    ("9780008196806", "How to Build a Car", "Adrian Newey", 22, 277.35),
    ("9781471162381", "Total Competition: Lessons in Strategy from Formula One", "Ross Brawn", 4, 102.85),
    ("9781787290433", "The Mechanic: The Secret World of The F1 Pitlane", "Marc Priestley", 19, 123.86);
    
    -- Infogar data i tabellen Kunder
INSERT INTO Kunder (Namn, Adress, Telefon, Epostadress) VALUES
	("Anna Andersson", "Fogdegatan 11, 268 20 Kågeröd", "0487-326 12", "anna@globalemail.com"),
    ("Berit Beritsson", "Skogsvägen 13C 389 40 Svansta", "0981-753 10", "beritblatand@unicastemail.com"),
    ("Rut Hjärtrudsson", "Altanstigen 1 873 20 Lingonberget", "078-819 20 12", "rutirutan@gmail.com"),
    ("Boris Knapphatt", "Himmelsvägen 47C 921 98 Himmelriket", "073-461 23 23", "borisknapphatt@live.com"),
    ("Gösta Lagerkrans", "Stuprörsstigen 34 478 21 Lustgasriket", "021-431 22", "lagerkransgosta@emailkonto.se"),
    ("Hjördis Buske", "Plommonruinen 98 777 21 Hybrisorten", "097-778 78", "buskibusk@roligt.nu"),
    ("Billy Plattfot", "Jättevägen 172 912 43 Sagolandet", "010-666 66", "plattfot@spunkmejl.com"),
    ("Sixten Rubensson", "Lingongatan 1 872 11 Kolaträsket", "012-922 12", "nattroll@ruggigt.se"),
    ("Lola Andersson", "Kamprads gata 22 866 22 Möbellandet", "076-888 22 32", "lola@fastcars.pl"),
    ("Göran Rudbäck", "Lyckostigen 12 943 31 Kalmarsand", "090-774 32", "goran@karamelkompott.se");
    
    -- Infogar data i tabellen beställningar
INSERT INTO Beställningar (KundID, Totalbelopp) VALUES
	(8, 259.00),
    (1, 277.35),
    (3, 190.00),
    (10, 999.00),
    (6, 49.90),
    (4, 223.09),
    (2, 400.00),
    (5, 260.00);


    -- Infogar data i tabellen Orderrader
INSERT INTO Orderrader (OrderID, BokID, Antal, `Pris per styck`) VALUES
	(3, 3, 1, 259.00),
    (4, 4, 4, 129.50),
    (8, 4, 2, 200.00),
    (2, 2, 4, 65.00);
    
    -- En SELECT-fråga som vid körning visar all data i tabellen Kunder
    SELECT * FROM Kunder;
