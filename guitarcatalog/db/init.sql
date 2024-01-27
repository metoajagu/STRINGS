--  create tables

---- Guitars Table -----
CREATE TABLE guitars (
	id	INTEGER NOT NULL UNIQUE PRIMARY KEY AUTOINCREMENT,
	model TEXT NOT NULL,
    year  TEXT NOT NULL,
    color TEXT NOT NULL,
    price TEXT NOT NULL,
    description TEXT NOT NULL,
    fileext TEXT NOT NULL,
    filesource TEXT,
    reviews TEXT
);


-- initial seed data

INSERT INTO
    guitars (
        id,
        model,
        year,
        color,
        price,
        description,
        fileext,
        filesource,
        reviews)
    VALUES
        (
        1,
        'Fender Stratocaster',
        '1952',
        'polar white',
        '$849.99',
        '- 6 Stringed Right-Handed Guitar
        - Maple, modern "C"-shaped neck (satin polyurethane finish)
        - Comes with a "Synchronized Tremelo" bridgepiece
        - Player Series Alnico V Strat Single-coil (Pickup)',
        'jpg',
        'https://cdn11.bigcommerce.com/s-dks6ju/images/stencil/160w/products/14574/284047/883834fb-1435-539b-a784-29252b4a7aef__61635.1673554252.jpg?c=2',
        'This guitar is great for new beginniers who are just starting out, I love the color and hope to buy another guitar like this soon!');
INSERT INTO
    guitars (
        id,
        model,
        year,
        color,
        price,
        description,
        fileext,
        filesource,
        reviews)
    VALUES
        (
        2,
        'Gibson Les Pauls',
        '1950',
        'black',
        '$2,499.00',
        '- 6 Stringed Right-Handed Guitar
        - Black Colored Solid-Body w/ a Mahogany Finish
        - Gibson 60s Burstbucker Humbucker (Pickup)
        - Rosewood Fingerboard',
        'jpeg',
        'https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcQc7Cj4qis8DVM-fodERkACk1mThrGaMhFKod09sOsIuYDe42FTGGtI_eUIb-Km-GeER_NVnICHj1s&usqp=CAc',
        'Man oh man, let me just say that this guitar is a beauty. I am starting a new collection of Gibson pieces and this was a nice edition to the collection!');
INSERT INTO
    guitars (
        id,
        model,
        year,
        color,
        price,
        description,
        fileext,
        filesource,
        reviews)
    VALUES
        (
        3,
        'Gibson Les Pauls',
        '1950',
        'mahogany',
        '$2,790.00',
        '- 6 Stringed Right-Handed Guitar
        - Solid-Body w/ a Mahogany Finish with a nice Mahogany colored touch
        - Gibson 60s Burstbucker Humbucker (Pickup)
        - Rosewood Fingerboard',
        'jpg',
        'https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcQRmoAK39BWgpcgp_GtZo63P8k93CqQDFhLpJxL93TBs4s2_aICoR9In3dit_1p1h5wreEAi7fp9Ofs1pRCbjYhzFeOXAW54FkjYZVh1ZiMCvCyQq3HdackvkAQ9YHfY2oznek&usqp=CAc',
        NULL);
INSERT INTO
    guitars (
        id,
        model,
        year,
        color,
        price,
        description,
        fileext,
        filesource,
        reviews)
    VALUES
        (
        4,
        'Gretsch Guitars',
        '1957',
        'pearl platinum',
        '$899.99',
        '- 22-fretted Maple Neck Guitar
        - Beautiful Glossy Pearl Platinum finish
        - Proprietary Humbucker (Pickup)
        - Laurel Fingerboard',
        'jpg',
        'https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcRAlYNoSwDf3PsrVvIwgyEXHpdDFrlLPGJqVEFYxPYL12ri3fph_yKhgLdR1LIrfpG0LQIe-6gEXjI&usqp=CAc',
        NULL);
INSERT INTO
    guitars (
        id,
        model,
        year,
        color,
        price,
        description,
        fileext,
        filesource,
        reviews)
    VALUES
        (
        5,
        'Ibanez Standard Electric Guitar',
        '2020',
        'Black Aurora Burste Matte',
        '$429.99',
        '- 24-fretted Multi-Piece Maple Necked Guitar
        - Comes with Jumbo Frets
        - Proprietary Humbucker (Pickup)',
        'jpg',
        'https://media.guitarcenter.com/is/image/MMGS7/L90658000001000-00-720x720.jpg',
        'I just recently purchased my new Ibanez guitar and I love playing my favorite rock songs on it. If there are any new players out there I would love to connect');
INSERT INTO
    guitars (
        id,
        model,
        year,
        color,
        price,
        description,
        fileext,
        filesource,
        reviews)
    VALUES
        (
        6,
        'D Angelico Deluxe Series SS Semi-Hollow',
        '2016',
        'Transparent Wine',
        '$2,299.99',
        '- 3-Piece Semi-Hollow Multi-Wood Necked Guitar(Maple, Mahogany and Dao Veneer)
        - Seymour Duncan Seth Lover A4 humbuckers (Pickups)
        - Ebony Material Fingerboard
        - Dual-Action Truss Rod',
        'png',
        'https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcT8wF0wG6MlMHFZ2knz4uQk-gmK4iZEucDHUwBiuMMbjZFIvGu2nTgueq5QsujhkPknsyn22ingQUU&usqp=CAc',
        'Price was definitely steep but I will say it was worth it. Strum on fellow guitar players');

-- ---- Reviews Table ------
-- CREATE TABLE reviews (
--  id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,
--  username  TEXT NOT NULL,
--  review   TEXT NOT NULL,
--  guitar_id INTEGER NOT NULL,
--  FOREIGN KEY (guitar_id) REFERENCES guitars(id)
-- );

-- INSERT INTO
--     reviews (
--         id,
--         username,
--         review,
--         guitar_id)
--     VALUES
--         (
--         10,
--         'meto_321',
--         'This guitar is great for new beginniers who are just starting out, I love the color and hope to buy another guitar like this soon!',
--         1);
-- INSERT INTO
--     reviews (
--         id,
--         username,
--         review,
--         guitar_id)
--     VALUES
--         (
--         20,
--         'sarah_the_guitarist',
--         'I just recently purchased my new Ibanez guitar and I love playing my favorite rock songs on it. If there are any new players out there I would love to connect',
--         5);
-- INSERT INTO
--     reviews (
--         id,
--         username,
--         review,
--         guitar_id)
--     VALUES
--         (
--         30,
--         'davidhendrix101',
--         'Man oh man, let me just say that this guitar is a beauty. I am starting a new collection of Gibson pieces and this was a nice edition to the collection!',
--         2);
-- INSERT INTO
--     reviews (
--         id,
--         username,
--         review,
--         guitar_id)
--     VALUES
--         (
--         40,
--         'mysterioussolo_',
--         'Price was definitely steep but I will say it was worth it. Strum on fellow guitar players',
--         6);

-- -- Guitar Reviews Table --
-- CREATE TABLE guitar_reviews (
--  id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
--  guitar_id INTEGER NOT NULL,
--  review_id INTEGER NOT NULL,
--  FOREIGN KEY (guitar_id) REFERENCES guitars(id),
--  FOREIGN KEY(review_id) REFERENCES reviews(id)
-- );

-- INSERT INTO
--     guitar_reviews(
--         guitar_id,
--         review_id
--     )
-- VALUES
--     (
--     1,
--     10
--     );
-- INSERT INTO
--     guitar_reviews(
--         guitar_id,
--         review_id
--     )
-- VALUES
--     (
--     2,
--     30
--     );
-- INSERT INTO
--     guitar_reviews(
--         guitar_id,
--         review_id
--     )
-- VALUES
--     (
--     6,
--     40
--     );
--     INSERT INTO
--     guitar_reviews(
--         guitar_id,
--         review_id
--     )
-- VALUES
--     (
--     5,
--     20
--     );

-- Tags Table --
CREATE TABLE tags (
    id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL
);

-- seed data --
INSERT INTO
    tags(
        id,
        name
    )
VALUES
    (
    32,
    "dark red"
    );
INSERT INTO
    tags(
        id,
        name
    )
VALUES
    (
    45,
    "black"
    );
INSERT INTO
    tags(
        id,
        name
    )
VALUES
    (
    19,
    "gold"
    );
INSERT INTO
    tags(
        id,
        name
    )
VALUES
    (
    78,
    "blue"
    );
INSERT INTO
    tags(
        id,
        name
    )
VALUES
    (
    54,
    "white"
    );
INSERT INTO
    tags(
        id,
        name
    )
VALUES
    (
    24,
    "6-stringed"
    );
INSERT INTO
    tags(
        id,
        name
    )
VALUES
    (
    66,
    "platinum"
    );
-- Guitar Tags Table --
CREATE TABLE guitar_tags (
    id INTEGER NOT NULL PRIMARY KEY        AUTOINCREMENT  UNIQUE,
    tag_id INTEGER NOT NULL,
    guitar_id INTEGER NOT NULL,
    FOREIGN KEY(tag_id) REFERENCES tags(id),
    FOREIGN KEY(guitar_id) REFERENCES guitars(id)
);
-- initial data --
INSERT INTO
    guitar_tags(
        id,
        tag_id,
        guitar_id
    )
VALUES
    (
    21,
    32,
    6
    );
INSERT INTO
    guitar_tags(
        id,
        tag_id,
        guitar_id
    )
VALUES
    (
    31,
    45,
    2
    );
INSERT INTO
    guitar_tags(
        id,
        tag_id,
        guitar_id
    )
VALUES
    (
    41,
    19,
    3
    );
INSERT INTO
    guitar_tags(
        id,
        tag_id,
        guitar_id
    )
VALUES
    (
    81,
    78,
    4
    );
INSERT INTO
    guitar_tags(
        id,
        tag_id,
        guitar_id
    )
VALUES
    (
    91,
    54,
    1
    );
INSERT INTO
    guitar_tags(
        id,
        tag_id,
        guitar_id
    )
VALUES
    (
    35,
    66,
    5
    );
INSERT INTO
    guitar_tags(
        id,
        tag_id,
        guitar_id
    )
VALUES
    (
    2,
    24,
    1
    );
INSERT INTO
    guitar_tags(
        id,
        tag_id,
        guitar_id
    )
VALUES
    (
    4,
    24,
    2
    );
INSERT INTO
    guitar_tags(
        id,
        tag_id,
        guitar_id
    )
VALUES
    (
    9,
    24,
    3
    );
INSERT INTO
    guitar_tags(
        id,
        tag_id,
        guitar_id
    )
VALUES
    (
    7,
    24,
    4
    );
INSERT INTO
    guitar_tags(
        id,
        tag_id,
        guitar_id
    )
VALUES
    (
    71,
    24,
    5
    );
INSERT INTO
    guitar_tags(
        id,
        tag_id,
        guitar_id
    )
VALUES
    (
    10,
    24,
    6
    );

--- Users ---
CREATE TABLE users (
  id INTEGER NOT NULL UNIQUE,
  name TEXT NOT NULL,
  email TEXT NOT NULL,
  username TEXT NOT NULL UNIQUE,
  password TEXT NOT NULL,
  PRIMARY KEY(id AUTOINCREMENT)
);

-- password: monkey
INSERT INTO
  users (id, name, email, username, password)
VALUES
  (
    1,
    'Kyle Harms',
    'kyle.harms@cornell.edu',
    'kyle',
    '$2y$10$QtCybkpkzh7x5VN11APHned4J8fu78.eFXlyAMmahuAaNcbwZ7FH.' -- monkey
  );

-- password: monkey
INSERT INTO
  users (id, name, email, username, password)
VALUES
  (
    2,
    'Sharon Jeong',
    'sharon@example.com',
    'sharon',
    '$2y$10$QtCybkpkzh7x5VN11APHned4J8fu78.eFXlyAMmahuAaNcbwZ7FH.' -- monkey
  );

--- Sessions ---
CREATE TABLE sessions (
  id INTEGER NOT NULL UNIQUE,
  user_id INTEGER NOT NULL,
  session TEXT NOT NULL UNIQUE,
  last_login TEXT NOT NULL,
  PRIMARY KEY(id AUTOINCREMENT) FOREIGN KEY(user_id) REFERENCES users(id)
);

--- Groups ----
CREATE TABLE groups (
  id INTEGER NOT NULL UNIQUE,
  name TEXT NOT NULL UNIQUE,
  PRIMARY KEY(id AUTOINCREMENT)
);

INSERT INTO
  groups (id, name)
VALUES
  (1, 'admin');

--- Group Membership ---
CREATE TABLE user_groups (
  id INTEGER NOT NULL UNIQUE,
  user_id INTEGER NOT NULL,
  group_id INTEGER NOT NULL,
  PRIMARY KEY(id AUTOINCREMENT) FOREIGN KEY(group_id) REFERENCES groups(id),
  FOREIGN KEY(user_id) REFERENCES users(id)
);

-- User 'kyle' is a member of the 'admin' group.
INSERT INTO
  user_groups (user_id, group_id)
VALUES
  (1, 1);
-- Uploads Table --
-- CREATE TABLE uploads(
--     id INTEGER PRIMARY KEY AUTOINCREMENT UNIQUE,
--     filename TEXT NOT NULL,
--     fileext TEXT NOT NULL,
--     filesource TEXT NOT NULL,
--     guitar_id INTEGER NOT NULL,
--     FOREIGN KEY (guitar_id) REFERENCES guitars(id)
-- );
-- -- initial data --
--     INSERT INTO
--         uploads(
--             id,
--             filename,
--             fileext,
--             filesource,
--             guitar_id
--         )
--     VALUES
--         (
--         43,
--         'dangelio',
--         'png',
--         'https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcT8wF0wG6MlMHFZ2knz4uQk-gmK4iZEucDHUwBiuMMbjZFIvGu2nTgueq5QsujhkPknsyn22ingQUU&usqp=CAc',
--         6
--         );
--     INSERT INTO
--         uploads(
--             id,
--             filename,
--             fileext,
--             filesource,
--             guitar_id
--         )
--     VALUES
--         (
--         23,
--         'fender',
--         'jpg',
--         'https://cdn11.bigcommerce.com/s-dks6ju/images/stencil/160w/products/14574/284047/883834fb-1435-539b-a784-29252b4a7aef__61635.1673554252.jpg?c=2',
--         1
--         );
--     INSERT INTO
--         uploads(
--             id,
--             filename,
--             fileext,
--             filesource,
--             guitar_id
--         )
--     VALUES
--         (
--         3,
--         'gretsch',
--         'jpg',
--         'https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcRAlYNoSwDf3PsrVvIwgyEXHpdDFrlLPGJqVEFYxPYL12ri3fph_yKhgLdR1LIrfpG0LQIe-6gEXjI&usqp=CAc',
--         4
--         );
--     INSERT INTO
--         uploads(
--             id,
--             filename,
--             fileext,
--             filesource,
--             guitar_id
--         )
--     VALUES
--         (
--         1,
--         'ibanez',
--         'jpg',
--         'https://media.guitarcenter.com/is/image/MMGS7/L90658000001000-00-720x720.jpg',
--         5
--         );
--     INSERT INTO
--         uploads(
--             id,
--             filename,
--             fileext,
--             filesource,
--             guitar_id
--         )
--     VALUES
--         (
--         78,
--         'lespaul',
--         'jpeg',
--         'https://images.ctfassets.net/m8onsx4mm13s/7G9klqQRPVeJoo5k28aGCf/c4b75bd4a604c64e73227e6c80b63bf5/__static.gibson.com_product-images_USA_USAUBC849_Gold_Top_LPS5P00GTNH1_1.jpg?h=900',
--         2
--         );
--     INSERT INTO
--         uploads(
--             id,
--             filename,
--             fileext,
--             filesource,
--             guitar_id
--         )
--     VALUES
--         (
--         7,
--         'lespaul2',
--         'jpg',
--         'https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcQc7Cj4qis8DVM-fodERkACk1mThrGaMhFKod09sOsIuYDe42FTGGtI_eUIb-Km-GeER_NVnICHj1s&usqp=CAc',
--         3
--         )
