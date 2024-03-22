--Create a Stored Procedure that will insert a new film into the film table with the
--following arguments: title, description, release_year, language_id, rental_duration,
--rental_rate, length, replace_cost, rating

CREATE OR REPLACE PROCEDURE insert_film(
    film_title VARCHAR(255),
    film_description TEXT,
    film_release_year YEAR,
    film_language_id INT2,
    film_rental_duration INT2,
    film_rental_rate NUMERIC(4,2),
    film_length INT2,
    film_replace_cost NUMERIC(5,2),
    film_rating mpaa_rating
) 
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO film(title, description, release_year, language_id, rental_duration, rental_rate, length, replace_cost, rating)
    VALUES(title, description, release_year, language_id, rental_duration, rental_rate, length, replace_cost, rating);
END;
$$;


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