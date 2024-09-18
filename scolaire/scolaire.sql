CREATE TABLE class(
   id SERIAL,
   name VARCHAR(50) ,
   PRIMARY KEY(id)
);

CREATE TABLE classroom(
   id SERIAL,
   number INTEGER,
   _floor_ INTEGER,
   building VARCHAR(50) ,
   id_1 INTEGER,
   PRIMARY KEY(id),
   UNIQUE(id_1),
   FOREIGN KEY(id_1) REFERENCES class(id)
);

CREATE TABLE person(
   id INTEGER,
   last_name VARCHAR(50)  NOT NULL,
   first_name VARCHAR(50)  NOT NULL,
   PRIMARY KEY(id)
);

CREATE TABLE teacher(
   id SERIAL,
   id_1 INTEGER NOT NULL,
   PRIMARY KEY(id),
   UNIQUE(id_1),
   FOREIGN KEY(id_1) REFERENCES person(id)
);

CREATE TABLE subject(
   id SERIAL,
   name VARCHAR(50)  NOT NULL,
   id_1 INTEGER,
   PRIMARY KEY(id),
   FOREIGN KEY(id_1) REFERENCES teacher(id)
);

CREATE TABLE student(
   id SERIAL,
   id_1 INTEGER NOT NULL,
   id_2 INTEGER NOT NULL,
   PRIMARY KEY(id),
   UNIQUE(id_2),
   FOREIGN KEY(id_1) REFERENCES class(id),
   FOREIGN KEY(id_2) REFERENCES person(id)
);

CREATE TABLE grade_subject(
   id INTEGER,
   id_1 INTEGER,
   _value_ INTEGER,
   PRIMARY KEY(id, id_1),
   FOREIGN KEY(id) REFERENCES subject(id),
   FOREIGN KEY(id_1) REFERENCES student(id)
);

CREATE TABLE class_subject(
   id INTEGER,
   id_1 INTEGER,
   _hour_ NUMERIC(15,2)  ,
   PRIMARY KEY(id, id_1),
   FOREIGN KEY(id) REFERENCES class(id),
   FOREIGN KEY(id_1) REFERENCES subject(id)
);
