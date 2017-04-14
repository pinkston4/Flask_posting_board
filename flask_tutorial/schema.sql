DELETE FROM COMMENTS;
DELETE FROM USERPOSTS;
DELETE FROM CATEGORIES;
DELETE FROM USERS;

DROP TABLE IF EXISTS USERS;
DROP TABLE IF EXISTS CATEGORIES;
DROP TABLE IF EXISTS USERPOSTS;
DROP TABLE IF EXISTS COMMENTS;

CREATE TABLE `USERS` (
	`UserId` INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`Username` TEXT NOT NULL,
	`Email` TEXT NOT NULL,
	`Password` TEXT NOT NULL,
	`UserFirstName` TEXT NOT NULL,
	`UserLastName` TEXT NOT NULL
);

CREATE TABLE `CATEGORIES` (
    `CategoryId` INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    `Category` TEXT NOT NULL
);

INSERT INTO CATEGORIES VALUES (null, 'Random');
INSERT INTO CATEGORIES VALUES (null, 'Funny');
INSERT INTO CATEGORIES VALUES (null, 'News');
INSERT INTO CATEGORIES VALUES (null, 'Politics');
INSERT INTO CATEGORIES VALUES (null, 'Tech');
INSERT INTO CATEGORIES VALUES (null, 'Education');
INSERT INTO CATEGORIES VALUES (null, 'Sports');

CREATE TABLE `USERPOSTS` (
    `PostId` INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    `UserId` INTEGER NOT NULL,
    `CategoryId` INTEGER NOT NULL,
    `PostDate` INTEGER NOT NULL,
    `PostText` TEXT NOT NULL,
    FOREIGN KEY(`UserId`) REFERENCES `USERS`(`UserId`),
    FOREIGN KEY(`CategoryId`) REFERENCES `CATEGORIES`(`CategoryId`)
);

CREATE TABLE `COMMENTS` (
    `CommentId` INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    `UserId` INTEGER NOT NULL,
    `PostId` INTEGER NOT NULL,
    `CommentDate` INTEGER NOT NULL,
    `CommentText` TEXT NOT NULL,
    FOREIGN KEY(`UserId`) REFERENCES `USERS`(`UserId`),
    FOREIGN KEY(`PostId`) REFERENCES `USERPOSTS`(`PostId`)
);