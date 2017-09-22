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



/* 6. listing out the names of people who are both in the directors and in the writers tables (they're both directors and writers), without repeats note: this one takes a long time to run so I tested it with a limit!*/

select distinct pb.primary_name, pb.person_id
from person_basics pb join writers w
on pb.person_id = w.person_id
join directors d on pb.person_id = d.person_id;



/* 7. listing the title names with their season number while excluding adult titles and titles without season numbers, and ordering by the title ids*/

select tb.title_id, tb.primary_title, te.parent_title, te.season_num
from title_basics tb join title_episodes te 
on tb.title_id = te.title_id 
where tb.is_adult = False and te.season_num is not null
order by tb.title_id;


/* 8. list titles and their respective genre with ratings higher than 9 and in descending order by year */

select distinct tb.primary_title, tg.genre, tr.average_rating, tb.start_year
from title_basics tb join title_genres tg on tb.title_id = tg.title_id
join title_ratings tr on tb.title_id = tr.title_id
where tr.average_rating > 9
order by tb.start_year desc;


/* 9. list titles and their ratings that have over a million votes, and order them by the number of votes*/ 

select tb.primary_title, tr.average_rating, tr.num_votes
from  title_basics tb join title_ratings tr 
on tb.title_id = tr.title_id 
where tr.num_votes > 1000000
order by num_votes desc;


/* 10. listing directors with their birth and death years, and including only directors who have a birth and a death year*/

select distinct pb.primary_name, pb.birth_year, pb.death_year
from person_basics pb join directors d 
on pb.person_id = d.person_id 
where death_year is not null and birth_year is not null;