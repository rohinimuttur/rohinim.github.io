select * from imdbdisney;

select a.Title,a.year,Metascore,IMDB,link,`Worldwide gross`,Budget,`Total Sales` from imdbdisney a
join disneygrosssales b
on a.Title=b.title;

CREATE VIEW MOVIE_IMDB_GROSS AS
select a.Title,a.year,Metascore,IMDB,link,`Worldwide gross`,Budget,`Total Sales` from imdbdisney a
join disneygrosssales b
on a.Title=b.title;

select * from MOVIE_IMDB_GROSS;


select * from imdbdisney;

select a.Title,a.year,Metascore,IMDB,link,`Worldwide gross`,Budget,`Total Sales` from imdbdisney a
join disneygrosssales b
on a.Title=b.title
Order by b.`Total Sales` DESC
Limit 10;

CREATE VIEW TOP_10_GROSSERS AS
select a.Title,a.year,Metascore,IMDB,link,`Worldwide gross`,Budget,`Total Sales` from imdbdisney a
join disneygrosssales b
on a.Title=b.title
Order by b.`Total Sales` DESC
Limit 10;

select * from TOP_10_GROSSERS;


select Title,Budget,Year,`Total Sales`
from disneygrosssales
where Year between 2010 and 2019
group by year
order by `Total Sales` desc ;

