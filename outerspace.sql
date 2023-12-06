CREATE TABLE planets(
    --in real world could ask clients or coworkers what max size string should be
    --and change to varchar
    name TEXT PRIMARY KEY,
    orbital_period_in_yrs numeric NOT NULL,
    star_name TEXT NOT NULL REFERENCES stars
);

CREATE TABLE stars(
    name TEXT PRIMARY KEY,
    --Assuming VARCHAR(10) based hottest star according online is 210,000K
    --change type star_temp_in_kelvin to integer
    star_temp_in_kelvin VARCHAR(10) NOT NULL
);

CREATE TABLE moons(
    name TEXT PRIMARY KEY,
    planet_name TEXT NOT NULL REFERENCES planets
);

INSERT INTO stars(name, star_temp_in_kelvin)
    VALUES
    ('The Sun', '5800°K'),
    ('Proxima Centauri', '3042°K'),
    ('Gliese 876', '3192°K');

INSERT INTO planets(name, orbital_period_in_yrs, star_name)
    VALUES
    ('Earth', 1.00, 'The Sun'),
    ('Mars', 1.882, 'The Sun'),
    ('Venus', 0.62, 'The Sun'),
    ('Proxima Centauri b', 0.03, 'Proxima Centauri'),
    ('Gliese 876 b', 0.236, 'Gliese 876');

INSERT INTO moons(name, planet_name)
    VALUES
    ('The Moon', 'Earth'),
    ('Phobos', 'Mars'),
    ('Deimos', 'Mars');


SELECT planets.name, star_name, COUNT(moons.name) as moon_count
--could alias planets as p
FROM planets
LEFT JOIN moons
ON planets.name = moons.planet_name
GROUP BY planets.name
ORDER BY planets.name;