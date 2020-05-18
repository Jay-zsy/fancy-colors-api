DROP TABLE IF EXISTS users
CASCADE;
DROP TABLE IF EXISTS sessions
CASCADE;
DROP TABLE IF EXISTS palettes
CASCADE;
DROP TABLE IF EXISTS tags
CASCADE;
DROP TABLE IF EXISTS tags_palettes
CASCADE;

CREATE TABLE users
(
    id SERIAL PRIMARY KEY NOT NULL,
    username VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    profile_pic VARCHAR(255),
    created_at TIMESTAMP DEFAULT now(),
    is_active BOOLEAN DEFAULT true
);

CREATE TABLE sessions
(
    id SERIAL PRIMARY KEY NOT NULL,
    owner_id INTEGER REFERENCES users(id) ON DELETE CASCADE,
    auth_token VARCHAR(255),
    created_at TIMESTAMP DEFAULT now()
);

CREATE TABLE tags
(
    id SERIAL PRIMARY KEY NOT NULL,
    name VARCHAR (255),
    created_at TIMESTAMP DEFAULT now()
);

CREATE TABLE palettes
(
    id SERIAL PRIMARY KEY NOT NULL,
    owner_id INTEGER REFERENCES users(id) ON DELETE CASCADE,
    label VARCHAR(255),
    colors VARCHAR(255),
    created_at TIMESTAMP DEFAULT now()
);

CREATE TABLE tags_palettes
(
    tags_id INTEGER REFERENCES tags(id) ON DELETE CASCADE,
    palettes_id INTEGER REFERENCES palettes(id) ON DELETE CASCADE,
    CONSTRAINT tags_palettes_pkey PRIMARY KEY (tags_id, palettes_id)
);
