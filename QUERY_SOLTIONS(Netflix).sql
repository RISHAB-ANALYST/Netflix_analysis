

-- 1. Count the number of Movies vs TV Shows


SELECT 
	type,
	COUNT(*)
	FROM netflix
GROUP BY 
	type


-- 2. Find the most common rating for movies and TV shows


SELECT 
	type,
	rating
FROM

(
	SELECT 
		type,
		rating,
		COUNT(*),
		RANK() OVER(PARTITION BY type ORDER BY COUNT(*) DESC)	AS ranking
	FROM netflix
	GROUP BY 1,2
) AS t1

WHERE	
	ranking = 1 


-- 3. List all movies released in a specific year (e.g., 2020)


SELECT title, director, release_year FROM netflix
WHERE type = 'Movie' AND release_year = 2020


-- 4. Find the top 5 countries with the most content on Netflix  


SELECT 
	UNNEST(STRING_TO_ARRAY(country, ',')) AS new_country,
	COUNT(show_id) AS total_content
	FROM netflix
GROUP BY 1
ORDER BY total_content DESC
LIMIT 5


-- 5. Identify the longest movie

/* So, as the data shows that there are movies and series whose lengths are written in minutes and seasons. 
I have to find the longest movies, which will be in minutes. */


SELECT * FROM netflix
WHERE -- where type is movie and duration is splitted and converted into integers. 
	type  = 'Movie'
	AND
	CAST(SPLIT_PART(duration,' ',1) AS INTEGER) = (
		SELECT MAX(CAST(SPLIT_PART(duration, ' ', 1) AS INTEGER))
		FROM netflix
		WHERE type = 'Movie')
		



-- 6. Find content added in the last 10 years

SELECT 
	*	
FROM netflix
WHERE 
	TO_DATE(date_added, 'Month DD, YYY') >= CURRENT_DATE - INTERVAL '5 years'


-- 7. Find all the movies/TV shows by director 'Rajiv Chilaka'!

SELECT * 
FROM netflix 
WHERE director iLIKE '%Rajiv Chilaka%'


-- 8. List all TV shows with more than 5 seasons

SELECT *
FROM netflix
WHERE 
	type = 'TV Show'
	AND
	SPLIT_PART(duration, ' ',1)::int> 5
 
-- 9. Count the number of content items in each genre

SELECT  
	UNNEST(STRING_TO_ARRAY(listed_in, ',')) AS genre,
	COUNT(show_id) AS content_no
	FROM netflix
GROUP BY genre
ORDER BY content_no DESC

-- 10. Find each year and the average number of content releases by India on Netflix.

SELECT 
	EXTRACT(YEAR FROM TO_DATE(date_added, 'Month DD, YYYY')) AS year,
	COUNT(*) AS yearly_realeased_content,
	ROUND(
	COUNT(*)::NUMERIC/(SELECT COUNT(*) FROM netflix WHERE country = 'India')::NUMERIC * 100 ,2
	) AS avg_content_per_year
FROM netflix
WHERE country = 'India'
GROUP BY year
ORDER BY year


-- return top 5 year with the highest avg content release!

-- SOLUTION 1

SELECT release_year,
	COUNT(*) AS documentaries_count
	FROM (SELECT 
			release_year,
			TRIM(UNNEST(STRING_TO_ARRAY(listed_in, ','))) AS genre 
		FROM netflix) 
AS T1
WHERE genre = 'Documentaries'
GROUP BY release_year
ORDER BY documentaries_count DESC
LIMIT 5

-- SOLUTION 2

SELECT release_year, COUNT(listed_in)
FROM netflix 
WHERE listed_in iLIKE '%Documentaries%'
GROUP BY release_year
ORDER BY COUNT(listed_in) DESC
LIMIT 5


-- 11. List all movies that are documentaries



SELECT title, listed_in
FROM netflix 
WHERE listed_in iLIKE '%Documentaries%'



-- 12. Find all content without a director

SELECT * FROM netflix 
WHERE director IS NULL


-- 13. Find how many movies actor 'Salman Khan' appeared in last 10 years!

SELECT * FROM netflix
WHERE 
	casts ILIKE '%Salman Khan%'
	AND 
	release_year> EXTRACT(YEAR FROM CURRENT_DATE)  - 10


-- 14. Find the top 10 actors who have appeared in the highest number of movies produced in India.


SELECT actors, COUNT(actors) AS count_actors
from 
	(SELECT 
		TRIM(UNNEST(STRING_TO_ARRAY(casts, ','))) AS actors,
		country
	FROM netflix
	WHERE country ILIKE '%India%')
GROUP BY actors
ORDER BY count_actors DESC
LIMIT 10


/*
Question 15:
Categorise the content based on the presence of the keywords 'kill' and 'violence' in 
the description field. Label content containing these keywords as 'Bad' and all other 
content as 'Good'. Count how many items fall into each category.
*/

SELECT title,
		CASE 
		WHEN description ~* '\y(kill|killed|killer|killing|violence|violent)\y' THEN 'BAD_CONTENT'
			  ELSE 'GOOD_CONTENT'
		END AS Content_category
FROM netflix;


