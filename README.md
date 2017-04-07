# Week 1 - Homework Zhengyang Chang

*CnetID: zhengyangc*

### SQL questions:

1.1

SELECT count(id) FROM movies WHERE year = 2004

1.2

SELECT AVG(movies.duration) FROM movies INNER JOIN roles ON movies.id = roles.movie_id INNER JOIN actors ON roles.actor_id = actors.id WHERE actors.name = "Tom Hanks"

2

inventory(id, flavor_name, amount)

sell(id, flavor_name, amount)

order(id, flavor_name, amount)