--Create a Stored Procedure that will insert a new film into the film table with the
--following arguments: title, description, release_year, language_id, rental_duration,
--rental_rate, length, replace_cost, rating

CREATE OR REPLACE PROCEDURE insert_film(
    title VARCHAR(255),
    description TEXT,
    release_year INTEGER,
    language_id INTEGER,
    rental_duration INTEGER,
    rental_rate NUMERIC(4,2),
    length INTEGER,
    replacement_cost NUMERIC(5,2),
    rating mpaa_rating
) 
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO film(title, description, release_year, language_id, rental_duration, rental_rate, length, replacement_cost, rating)
    VALUES(title, description, release_year, language_id, rental_duration, rental_rate, length, replacement_cost, rating);
END;
$$;

--Example using stored procedure
CALL insert_film('John Wick: Chapter 4', 'A retired hit man is forced back into the underground world of assassins when he embarks on a merciless rampage to hunt down his adversaries.', 2023, 1, 3, 14.99, 169, 29.99, 'R');

--View new movie inserted by stored function
SELECT *
FROM film 
ORDER BY film_id DESC
LIMIT 1;

--===============================================================

--Create a Stored Function that will take in a category_id and return the number of
--films in that category

CREATE OR REPLACE FUNCTION get_film_count(num INTEGER)
RETURNS INTEGER
LANGUAGE plpgsql
AS $$
	DECLARE film_count INTEGER;
BEGIN
	SELECT COUNT(*) INTO film_count
	FROM   film_category
	WHERE  category_id = num;
	RETURN film_count;
END;
$$;

--Example using stored function; returns 74
--Category 15 contains 74 movies

SELECT get_film_count('15');