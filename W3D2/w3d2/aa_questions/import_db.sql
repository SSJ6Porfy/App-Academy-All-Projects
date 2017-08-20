CREATE TABLE
  users
  (
    id INTEGER PRIMARY KEY,
    fname TEXT NOT NULL,
    lname TEXT NOT NULL
  );

CREATE TABLE
  questions
  (
    id INTEGER PRIMARY KEY,
    title TEXT NOT NULL,
    body TEXT NOT NULL,
    author_id INTEGER,


FOREIGN KEY(author_id) REFERENCES user(id)
);

CREATE TABLE
  questions_follows
  (
    id INTEGER PRIMARY KEY,
    question_id INTEGER NOT NULL,
    author_id INTEGER NOT NULL,


FOREIGN KEY(author_id) REFERENCES users(id),
FOREIGN KEY(question_id) REFERENCES questions(id)
);

CREATE TABLE
  replies
  (
    id INTEGER PRIMARY KEY,
    question_id INTEGER NOT NULL,
    parent_id INTEGER,
    user_id INTEGER NOT NULL,
    body TEXT,


FOREIGN KEY(question_id) REFERENCES questions(id),
FOREIGN KEY(user_id) REFERENCES questions(author_id)
);

CREATE TABLE
  question_likes
  (
    id INTEGER PRIMARY KEY,
    question_id INTEGER,
    user_id INTEGER,

FOREIGN KEY(question_id) REFERENCES questions(id),
FOREIGN KEY(user_id) REFERENCES users(id)
);


INSERT INTO
  users(fname, lname)
VALUES
  ('Porfy', 'Matias'),
  ('Evan', 'Schwalm');
