CREATE TABLE stipend
(
    student_ticket INT NOT NULL REFERENCES student (student_ticket) ON UPDATE CASCADE ON DELETE SET NULL,
    size INT NOT NULL DEFAULT 0,
    CONSTRAINT stipend_pk PRIMARY KEY (student_ticket)
);