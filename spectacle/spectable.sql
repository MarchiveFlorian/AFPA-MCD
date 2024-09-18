CREATE TABLE room(
   id SERIAL,
   name VARCHAR(50)  NOT NULL,
   address VARCHAR(50)  NOT NULL,
   phone VARCHAR(50) ,
   mail VARCHAR(50) ,
   website VARCHAR(50) ,
   PRIMARY KEY(id)
);

CREATE TABLE show(
   id SERIAL,
   enum VARCHAR(50) ,
   name VARCHAR(50) ,
   start_date TIMESTAMP,
   end_date TIMESTAMP,
   ticket_price INTEGER,
   PRIMARY KEY(id)
);

CREATE TABLE performance(
   id SERIAL,
   start_hour TIME,
   end_hour TIME,
   PRIMARY KEY(id)
);

CREATE TABLE person(
   id SERIAL,
   name VARCHAR(50)  NOT NULL,
   PRIMARY KEY(id)
);

CREATE TABLE spectator(
   id SERIAL,
   address VARCHAR(50) ,
   email VARCHAR(50) ,
   phone VARCHAR(50) ,
   id_1 INTEGER NOT NULL,
   PRIMARY KEY(id),
   UNIQUE(id_1),
   FOREIGN KEY(id_1) REFERENCES person(id)
);

CREATE TABLE worker(
   id SERIAL,
   enum VARCHAR(50) ,
   id_1 INTEGER NOT NULL,
   PRIMARY KEY(id),
   UNIQUE(id_1),
   FOREIGN KEY(id_1) REFERENCES person(id)
);

CREATE TABLE room_spectator(
   id INTEGER,
   id_1 INTEGER,
   type VARCHAR(50)  NOT NULL,
   booking_date TIMESTAMP NOT NULL,
   place_number INTEGER,
   price_amount NUMERIC(15,2)  ,
   PRIMARY KEY(id, id_1),
   FOREIGN KEY(id) REFERENCES performance(id),
   FOREIGN KEY(id_1) REFERENCES spectator(id)
);

CREATE TABLE room_show(
   id INTEGER,
   id_1 INTEGER,
   PRIMARY KEY(id, id_1),
   FOREIGN KEY(id) REFERENCES room(id),
   FOREIGN KEY(id_1) REFERENCES show(id)
);

CREATE TABLE show_performance(
   id INTEGER,
   id_1 INTEGER,
   PRIMARY KEY(id, id_1),
   FOREIGN KEY(id) REFERENCES show(id),
   FOREIGN KEY(id_1) REFERENCES performance(id)
);

CREATE TABLE show_worker(
   id INTEGER,
   id_1 INTEGER,
   PRIMARY KEY(id, id_1),
   FOREIGN KEY(id) REFERENCES show(id),
   FOREIGN KEY(id_1) REFERENCES worker(id)
);
