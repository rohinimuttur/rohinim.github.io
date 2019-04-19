create TABLE MOVIE_DISNEY_GROSS_SALES
( id  int(11) NOT NULL AUTO_INCREMENT,
  Year int NOT NULL,
  title varchar(100) ,
  `Worldwide gross` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  Budget varchar(20),
  `Total Sales` int ,
  PRIMARY KEY (id)  
);