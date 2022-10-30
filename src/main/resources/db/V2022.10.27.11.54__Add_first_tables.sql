CREATE TABLE student
(
    student_ticket INT UNIQUE NOT NULL,
    name VARCHAR NOT NULL,
    CONSTRAINT student_pk PRIMARY KEY (student_ticket)
);

CREATE TABLE lecturer
(
    id SERIAL NOT NULL,
    name VARCHAR NOT NULL,
    CONSTRAINT lecturer_pk PRIMARY KEY (id)
);

CREATE TABLE kurs
(
    id SERIAL NOT NULL,
    name VARCHAR NOT NULL,
    hour INT NOT NULL,
    lecturer_id INT NOT NULL REFERENCES lecturer (id) ON UPDATE CASCADE ON DELETE SET NULL,
    CONSTRAINT kurs_pk PRIMARY KEY (id)
);

CREATE TABLE kurs_students
(
    kurs_id INT NOT NULL REFERENCES kurs (id) ON UPDATE CASCADE ON DELETE CASCADE,
    student_ticket INT NOT NULL REFERENCES student (student_ticket) ON UPDATE CASCADE ON DELETE CASCADE,
    PRIMARY KEY (kurs_id, student_ticket),
    CONSTRAINT kurs_students_pk UNIQUE (kurs_id, student_ticket)
);

CREATE TABLE schedule
(
    id SERIAL NOT NULL,
    kurs_id INT NOT NULL REFERENCES kurs (id) ON UPDATE CASCADE ON DELETE CASCADE,
    date DATE NOT NULL,
    CONSTRAINT schedule_pk PRIMARY KEY (id)
);

CREATE TABLE mark
(
    student_ticket INT NOT NULL REFERENCES student (student_ticket) ON UPDATE CASCADE ON DELETE CASCADE,
    schedule_id INT NOT NULL REFERENCES schedule (id) ON UPDATE CASCADE ON DELETE CASCADE,
    visitted BOOLEAN NOT NULL DEFAULT false,
    mark INT NOT NULL DEFAULT 0,
    PRIMARY KEY(student_ticket, schedule_id),
    CONSTRAINT mark_pk UNIQUE (student_ticket, schedule_id)
);