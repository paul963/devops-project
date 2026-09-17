CREATE TABLE IF NOT EXISTS users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  surname VARCHAR(100) NOT NULL,
  age INTEGER NOT NULL,
  city VARCHAR(100) NOT NULL,
  country VARCHAR(100) NOT NULL
);

INSERT INTO users (name, surname, age, city, country)
VALUES
  ('Andrei', 'Popescu', 28, 'Bucharest', 'Romania'),
  ('Maria', 'Ionescu', 34, 'Cluj-Napoca', 'Romania'),
  ('David', 'Marin', 25, 'Timisoara', 'Romania'),
  ('Elena', 'Dumitru', 31, 'Iasi', 'Romania'),
  ('Alex', 'Stan', 22, 'Brasov', 'Romania'),
  ('Ioana', 'Munteanu', 29, 'Constanta', 'Romania'),
  ('Vlad', 'Radu', 36, 'Sibiu', 'Romania'),
  ('Ana', 'Georgescu', 27, 'Oradea', 'Romania'),
  ('Mihai', 'Pop', 41, 'Arad', 'Romania'),
  ('Laura', 'Tudor', 33, 'Craiova', 'Romania'),
  ('Daniel', 'Nistor', 24, 'Budapest', 'Hungary'),
  ('Sofia', 'Kovacs', 30, 'Prague', 'Czech Republic'),
  ('Thomas', 'Miller', 38, 'Berlin', 'Germany'),
  ('Emma', 'Brown', 26, 'London', 'United Kingdom'),
  ('Liam', 'Wilson', 32, 'Dublin', 'Ireland'),
  ('Olivia', 'Smith', 23, 'Amsterdam', 'Netherlands'),
  ('Noah', 'Taylor', 35, 'Vienna', 'Austria'),
  ('Mia', 'Anderson', 29, 'Warsaw', 'Poland'),
  ('Lucas', 'Martin', 40, 'Paris', 'France'),
  ('Isabella', 'Rossi', 27, 'Rome', 'Italy');