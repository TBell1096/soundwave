CREATE TABLE artist (
    id              BIGSERIAL PRIMARY KEY,
    name            TEXT NOT NULL,
    sort_name       TEXT NOT NULL,
    created_at      TIMESTAMPTZ NOT NULL,
    CONSTRAINT uq_artist_sort_name UNIQUE (sort_name)
);

CREATE TABLE album (
    id              BIGSERIAL PRIMARY KEY,
    artist_id       BIGINT NOT NULL REFERENCES artist(id),
    title           TEXT NOT NULL,
    year            INT,
    artwork_path    TEXT,
    created_at      TIMESTAMPTZ NOT NULL DEFAULT now(),
    CONSTRAINT uq_album_artist_title UNIQUE (artist_id, title)
);

CREATE TABLE track (
    id      BIGSERIAL PRIMARY KEY,
    album_id    BIGINT NOT NULL REFERENCES album(id),
    title       TEXT NOT NULL,
    track_no    INT,
    duration_ms BIGINT,
    file_path   TEXT NOT NULL,
    file_hash   CHAR(64) NOT NULL,
    format      TEXT NOT NULL,
    created_at  TIMESTAMPTZ NOT NULL DEFAULT now(),
    CONSTRAINT uq_track_file_hash UNIQUE (file_hash)
);

CREATE INDEX idx_album_artist ON album(artist_id);
CREATE INDEX idx_track_album ON track(album_id);