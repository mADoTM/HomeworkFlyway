INSERT INTO student (student_ticket, name)
VALUES (16210241,'Maxim Dolzhenko'),
       (16210242, 'Ivan Ivanov'),
       (16210243, 'Name Surname');

INSERT INTO lecturer (name)
VALUES ('Aleksey Zhukov'),
       ('Evgeniy Chentsov');

INSERT INTO kurs (name, hour, lecturer_id)
VALUES ('Flyway', 2, 1),
       ('Guice', 2, 2);


INSERT INTO kurs_students (kurs_id, student_ticket)
VALUES (1, 16210241),
       (2, 16210241),
       (2, 16210243);

INSERT INTO schedule (kurs_id, date)
VALUES (1, '2022-10-26'),
       (2, '2022-10-19');

INSERT INTO mark (student_ticket, schedule_id, visitted, mark)
VALUES (16210241, 1, true, 0),
       (16210241, 2, true, 6);