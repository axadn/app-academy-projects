CREATE table users(
  user integer PRIMARY KEY AUTOINCREMENT,
  fname varchar(64) NOT NULL,
  lname varchar(128) NOT NULL
);

INSERT into users (fname,lname) VALUES ('Tyler','Wood');
INSERT into users (fname,lname) VALUES ('Adan','Marrufo');


CREATE table questions(
  question integer PRIMARY KEY autoincrement,
  title varchar(64) NOT NULL,
  body text NOT NULL,
  author integer NOT NULL,
  FOREIGN KEY(author) REFERENCES users(user)
);

INSERT into questions (title,body,author) VALUES ('How do I use google?','Question about using google',1);
INSERT into questions (title,body,author) VALUES ('How do I use ask jeeves?','Question about using ask jeeves',2);

CREATE table question_follows(
  question_follow integer PRIMARY KEY autoincrement,
  user_id integer NOT NULL,
  question_id integer NOT NULL,
  FOREIGN KEY(user_id) REFERENCES users(user),
  FOREIGN KEY(question_id) REFERENCES questions(question)
);

INSERT into question_follows (user_id,question_id) VALUES (1,2);
INSERT into question_follows (user_id,question_id) VALUES (2,1);

CREATE  table replies(
  reply integer PRIMARY KEY autoincrement,
  subject_question integer NOT NULL,
  parent_reply integer,
  author_id integer NOT NULL,
  body text,
  FOREIGN KEY(subject_question) REFERENCES questions(question),
  FOREIGN KEY(parent_reply) REFERENCES replies(reply),
  FOREIGN KEY(author_id) REFERENCES users(user)
);

INSERT INTO replies (subject_question,author_id,body) VALUES (1,2,'You type stuff into the search bar dummy');
INSERT INTO replies (subject_question,author_id,body) VALUES (2,1,'P much do the same there');

CREATE table question_likes(
  question_like integer PRIMARY KEY autoincrement,
  user_id integer NOT NULL,
  question_id integer NOT NULL,
  FOREIGN KEY(user_id) REFERENCES users(user),
  FOREIGN KEY(question_id) REFERENCES questions(question)
);

INSERT INTO question_likes (user_id,question_id) VALUES (1,2);
INSERT INTO question_likes (user_id,question_id) VALUES (2,1);
