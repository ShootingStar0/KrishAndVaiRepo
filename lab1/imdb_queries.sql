/* 1. List the full names of all the directors in the directors table and order them by their person ids. */

select distinct pb.person_id, pb.primary_name 
from person_basics pb join directors d 
on pb.person_id = d.person_id
order by pb.person_id;

/* 2. List the primary names of all of the stars in the stars table sorted alphabetically. */

select distinct pb.person_id, pb.primary_name 
from person_basics pb join stars d 
on pb.person_id = d.person_id
order by pb.primary_name;


/* 3. list all of the primary titles with an average rating of above 5. */

select tb.title_id, tr.average_rating, tb.primary_title
from title_basics tb join title_ratings tr
on tb.title_id = tr.title_id
where tr.average_rating > 5;


/* 4. show the titles of all documentaries that have an average rating of above 7, ordered alphabetically by primary title, and show the title id, genre, average rating, etc. */

select tg.title_id, tr.average_rating, tb.primary_title, tg.genre
from title_basics tb join title_genres tg on tb.title_id = tg.title_id
join title_ratings tr on tb.title_id = tr.title_id
where tg.genre = 'Documentary' and tr.average_rating >7
order by tb.primary_title;


/* 5. list out people's full names and their professions ordered by their person_id to group them */

select pb.primary_name, pp.profession
from person_basics pb join person_professions pp
on pb.person_id = pp.person_id
order by pb.person_id;

