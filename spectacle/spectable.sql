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
   type VARCHAR(50) ,
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
   id_person INTEGER NOT NULL,
   PRIMARY KEY(id),
   FOREIGN KEY(id_person) REFERENCES person(id)
);

CREATE TABLE worker(
   id SERIAL,
   type VARCHAR(50) ,
   id_person INTEGER NOT NULL,
   PRIMARY KEY(id),
   FOREIGN KEY(id_person) REFERENCES person(id)
);

CREATE TABLE room_spectator(
   id_room INTEGER,
   id_spectator INTEGER,
   id INTEGER NOT NULL,
   type VARCHAR(50)  NOT NULL,
   booking_date TIMESTAMP NOT NULL,
   place_number INTEGER,
   price_amount NUMERIC(15,2)  ,
   PRIMARY KEY(id),
   FOREIGN KEY(id_room) REFERENCES room(id),
   FOREIGN KEY(id_spectator) REFERENCES spectator(id)
);

CREATE TABLE room_show(
   id_room INTEGER,
   id_show INTEGER,
   id INTEGER NOT NULL,
   PRIMARY KEY(id),
   FOREIGN KEY(id_room) REFERENCES room(id),
   FOREIGN KEY(id_show) REFERENCES show(id)
);

CREATE TABLE show_performance(
   id_show INTEGER,
   id_performance INTEGER,
   id INTEGER,
   PRIMARY KEY(id),
   FOREIGN KEY(id_show) REFERENCES show(id),
   FOREIGN KEY(id_performance) REFERENCES performance(id)
);

CREATE TABLE show_worker(
   id_show INTEGER,
   id_worker INTEGER,
   id INTEGER,
   PRIMARY KEY(id),
   FOREIGN KEY(id_show) REFERENCES show(id),
   FOREIGN KEY(id_worker) REFERENCES worker(id)
);
