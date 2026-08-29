/*
-----------------------------------------------------------------
  1. DATABASE CREATION 
-----------------------------------------------------------------
*/
CREATE DATABASE SOCIALMEDIA;

USE SOCIALMEDIA; 
/*
-------------------------------------------------------------
 2. TABLE CREATION
-------------------------------------------------------------

*/ 

/* ----------------------------- ACCOUNTS TABLE ------------------------ */

CREATE  TABLE ACCOUNTS(ACCOUNTID int primary key, USERNAME VARCHAR(255) , EMAIL VARCHAR(255), CITY VARCHAR(100), FOLLOWERS INT, FOLLOWING INT , JOINDATE DATE);

/* ----------------------------------- POSTS TABLE ------------------------- */

CREATE TABLE POSTS( POSTID int primary key, ACCOUNTID INT, POSTTITLE VARCHAR(255),CATEGORY VARCHAR(100),LIKES INT,COMMENTS INT,POSTDATE DATE,foreign key (ACCOUNTID) references ACCOUNTS(ACCOUNTID));

/* ------------------------------ LIKES TABLE------------------------------- */

CREATE TABLE LIKES( LIKEID INT primary key, POSTID INT, ACCOUNTID INT, LIKEDATE DATE, foreign key (POSTID) references POSTS(POSTID),foreign key (ACCOUNTID) references ACCOUNTS(ACCOUNTID));

/* --------------------------------------- COMMENTS TABLE----------------------- */

CREATE TABLE COMMENTS ( COMMENTID INT primary key, POSTID INT,ACCOUNTID INT,COMMENTTEXT VARCHAR(50), COMMENTDATE DATE, FOREIGN KEY (POSTID) references POSTS (POSTID), foreign key (ACCOUNTID) references ACCOUNTS (ACCOUNTID));

/*
------------------------------------------------------------------------------------------
3.DATA INSERTION
------------------------------------------------------------------------------------------
*/

/* -------------------------------- ACCOUNTS DATA ---------------------------------- */

INSERT INTO ACCOUNTS
 VALUES
 ( "1", "TANUJA_TANU@52", "TANUJA@USER.COM" , "VIZG" , "56" , "50" , '10-10-2022' ),
( "2", "RAMYA_RAMI@10", "RAMYA@MADDALA.COM" , "SHEELANAGR" , "100" , "150" , '2021-10-07'),
( "3", "LATHA_LATHA@25", "LATHA@SUBHA.COM" , "HYD" , "76" , "50" , '2020-04-16'),
( "4", "NARAYANA_NARI@76", "NARAYANA@EXAMPLE.COM" , "NARSHAPUR" , "156" , "200" , '2021-06-01'),
( "5", "SUBHASRI_SUBBU@32", "SUBHA@SUBBU.COM" , "HYD" , "300" , "100" , '2025-04-12'),
( "6", "SANDEEP_SANDY@29", "SANDEEP@SANDY.COM" , "VIZG" , "500" , "160" , '2012-8-8'),
( "7", "LAVANYA_LAVU@18", "LAVANYA@LAVU.COM" , "GAJUWAKA" , "606" , "70" , '2019-5-31'),
( "8", "PAVITHRA_PAVI@91", "PAVITHRA@PAVI.COM" , "HINDUPUR" , "80" , "30" , '2004-11-19'),
( "9", "PAVANI_PAV@78", "PAVANI@PAV.COM" , "KADIRI" , "96" , "20" , '2026-6-16'),
( "10", "THORANI_THORANI@89", "THORANI@EXAMPLE.COM" , "ONGLE" , "900" , "678" , '2008-6-9');

/* -------------------------------------- POSTS DATA ------------------------------------ */

INSERT INTO POSTS
 VALUES
("101","1", "NEW COLORING BOOK", "EDUCATION", "30", "5", '2023-8-8'),
("102","2", "MY FIRST REEL", "TRAVEL", "70", "25", '2020-5-9'),
("103","3", "NEW CRAFT BUSINESS IEDAS", "EDUCATION", "100", "75", '2016-5-16'),
("104" , "4", "HOUSE OPENING", "TECHNOLOGY", "330", "105", '2022-8-31'),
("105","5", "BIRYANI HOTELS", "FOOD", "700", "650", '2026-7-16'),
("106","6", "THE BEAUTY OF OOTY", "TRAVEL", "454", "255", '2021-6-13'),
("107","7", "STRESS FREE", "FOOD", "900", "565", '2024-3-14'),
("108","8", "NEW VERSIONS ", "TECHNOLOGY", "400", "32", '2023-1-19'),
("109","9", "CHICKEN RECIPES", "FOOD", "700", "455", '2023-8-29'),
("110","10", "FITNESS", "SPORTS", "600", "85", '2022-2-14');

/* ------------------------------------- LIKES DATA ------------------------------- */

INSERT INTO LIKES
 VALUES
 ("201", "101","1", '2021-6-6'),
("202", "102","2", '2020-5-17'),
("203", "103","3", '2026-6-9'),
("204", "104","4", '2023-5-5'),
("205", "105","5", '2019-3-14'),
("206", "106","6", '2020-9-9'),
("207", "107","7", '2025-7-12'),
("208", "108","8", '2018-4-16'),
("209", "109","9", '2024-1-29'),
("210", "110","10", '2022-2-28');

/* ------------------------------------------COMMENTS DATA -------------------------- */

INSERT INTO COMMENTS  
VALUES 
("301", "101", "1", "NICE POST",'2020-11-11'),
("302", "102", "2", "NICE POST", '2021-10-27'),
("303", "103", "3", "AMAZING PICTURE", '2024-9-4'),
("304", "104", "4", "GREAT WORK", '2023-8-3'),
("305", "105", "5", "AWESOME CONTENT", '2026-6-7'),
("306", "106", "6" , "KEEP IT UP", '2020-8-24'),
("307", "107", "7", "VERY INFORMATIVE", '2025-5-31'),
("308", "108", "8", "LOVED THIS POST", '2023-9-15'),
("309", "109", "9", "BEATIFUL PHOTO", '2024-2-19'),
("310", "110", "10", "EXCELLENT EXPLANATION", '2026-8-8');

/*
----------------------------------------------------------------------------------------------
4. DATA VALIDATION
-----------------------------------------------------------------------------------------------
*/

SELECT*FROM ACCOUNTS;

select*from POSTS;

SELECT*FROM LIKES;

SELECT*FROM COMMENTS;

SELECT COUNT(*) AS TOTAL_ACCOUNTS
FROM ACCOUNTS;

SELECT COUNT(*) AS TOTAL_POSTS
FROM POSTS;

SELECT COUNT(*) AS TOTAL_LIKES
FROM LIKES;

SELECT COUNT(*) AS TOTAL_COMMENTS
FROM COMMENTS;
 
 /*
 -----------------------------------------------------------------------------------
 5.ACCOUNT ANALYSIS
  ----------------------------------------------------------------------------------
  */
  
/* Q1. User with highest  followers */

 select username,followers
 from accounts
 where followers = (select max(followers) from accounts);
 
/* Q2. Users above average  followers */

select username,followers 
from accounts
where followers > (select avg(followers) from accounts);

/* Q3.city with highest number of users */

select city, count(*) as user_count
from accounts 
group by city
order by user_count desc 
limit 1; 

/* Q4. User following the highest number of people */

select username ,following  
from accounts
where following = (select max(following)from accounts);

/* Q5. users whose followers are greater than following */

select username,followers 
from accounts
where  followers > following;

/*
-------------------------------------------------------------------------------
6.POST ANALYSIS      
-------------------------------------------------------------------------------
*/
                  
/* Q1. Display all posts */

select POSTTITLE,CATEGORY,LIKES,COMMENTS from posts;

/* Q2. Posts with  more than 500 likes */

select posttitle,likes
from posts 
where likes > 500;

/*  Q3. Posts with more than 100 comments */

select posttitle,comments
 from posts 
 where comments > 100;

/*  Q4. Posts with  100 and 500 likes */

select posttitle,category,likes
from posts
where likes between 100 and 500;

/* Q5. Highest liked post */

select posttitle,likes
from posts
where likes = (select max(likes)from posts);

/* Q6. Posts where comments > likes */

select posttitle,likes,comments
from posts
where comments > likes;

/* Q7. highest likes to lowest likes */

select posttitle,category,likes,comments
from posts
order by likes desc;

 /* Q8. Category with highest total likes */

select category , sum(likes) as total_likes
from posts
group by category
order by total_likes desc
limit 1;

/* Q9. Category with highest total comments */

select category, sum(comments) as total_comments 
from posts
group by category order by total_comments desc
limit 1;

/*  Q10. Average likes by category */

select category, avg(likes) as average_likes 
from posts
group by category;

/*
----------------------------------------------------------------------------------------------
7. JOIN ANALYSIS
--------------------------------------------------------------------------------------------       
*/
  
  /* Q1.Display each username along with the post title they created */     
 
 select a.username , 
             p.posttitle 
 from accounts as a
 inner join posts as p
 on a.accountid = p.accountid;
 
 /* Q2.Display the username, post title, category, and likes for every post */
 
 select a.username,
          p.posttitle, 
		  p.category,
		  p.likes
 from accounts as a
 inner join posts as p
 on a.accountid = p.accountid;

/*  Q3.Find the users who created posts with more than 500 likes */

select a.username,
		p.posttitle, 
		p.likes
 from accounts as a
 inner join posts as p
 on a.accountid = p.accountid 
 where likes > 500;

/*  Q4. Find users whose posts received more than 100 comments */

select a.username,
		p.posttitle,
        p.comments
from accounts as a
inner join posts as p
on a.accountid = p.accountid
where comments > 100;

/*
-----------------------------------------------------------------------------------------------------------
8. ENGAGEMENT ANALYSIS
 -----------------------------------------------------------------------------------------------------------
 */
 
/* Q1. Classify every post as High, Medium, or Low engagement */

select posts.posttitle, 
		posts.likes, 
        posts.comments, 
        posts.likes + posts.comments as total_engagement, 
case 
      when posts.likes + posts.comments >=1000 then 'high'
      when posts.likes + posts.comments >=500 then 'medium' 
      else 'low' 
 end as engagement_level 
from posts;
 
 /* Q2. Find the average total engagement across all posts */

select avg(likes + comments) as total_engagement 
from posts;

/* Q3.Find the top 3 posts based on total engagement */

select posts.posttitle, 
        posts.likes, 
        posts.comments, 
        posts.likes + posts.comments as total_engagement 
from posts 
order by (likes+comments)desc 
limit 3;

/* Q4. Calculate engagement rate for each post */

select accounts.username,
       posts.posttitle, 
       accounts.followers, 
       posts.likes, 
       posts.comments, 
       (posts.likes + posts.comments) / accounts.followers *100  
       as engagement_rate 
from accounts 
inner join posts 
on accounts.accountid = posts.accountid;

/* Q5. Classify users based on engagement rate */

select accounts.username,
	    posts.posttitle,
        (posts.likes + posts.comments) / accounts.followers*100 
        as engagement_rate ,
   case
         when (posts.likes + posts.comments) / accounts.followers * 100 >=100 
           then 'high'
         when (posts.likes + posts.comments) / accounts.followers * 100 >=50 
           then 'medium'
         else 'low'
    end  as engagement_level 
from accounts 
inner join posts 
on accounts.accountid = posts.accountid;

/* Q6. Which category has the highest total engagement */

select posts.category, 
	   sum(posts.likes +posts.comments) as total_engagement 
from posts  
group by category 
order by total_engagement desc 
limit 1;

/*
-------------------------------------------------------------------------------------------------------
9.GROUP BY & HAVING        
-------------------------------------------------------------------------------------------------------
*/ 
                     
/* Q1. Which categories have more than 500 total likes */

select posts.category,
      sum(likes) as total_likes 
from posts 
group by category 
having sum(likes) > 500;

/* Q2. Which categories have more than 500 total comments */

select posts.category, 
      sum(comments) as total_comments 
from posts 
group by category 
having sum(comments) > 500;

/* Q3. Which categories have an average number of likes greater than 300 */

select posts.category,
		avg(likes) as average_likes 
from posts 
group by category 
having avg(likes) > 300;

/* Q4. Which cities have more than 1 user */

select accounts.city,
       count(city) as user_count 
from accounts 
group by city 
having count(city) > 1;

/*
--------------------------------------------------------------------------------------------------------------
10.SUBQUERY ANALYSIS
-------------------------------------------------------------------------------------------------------------
*/
   
/* Q1. users whose followers are greater than the average followers */

select accounts.username ,
       accounts.followers 
from accounts 
where followers > (select avg(followers) from accounts); 
  
/* Q2.Posts with likes greater than average likes */

select posts.posttitle, 
        posts.likes 
from posts 
where likes > (select avg(likes) from posts);

/* Q3. Users whose followers are greater than RAMYA_RAMI@10 */

select accounts.username , 
        accounts.followers 
from accounts 
where followers > (select followers from accounts where username ='RAMYA_RAMI@10');

/* Q4. Post with the highest number of comments */

select posts.posttitle, 
        posts.comments 
from posts 
where comments = (select max(comments) from posts);

/* Q5. Users who have more followers than the user with the highest following */

select a.username,
         a.followers 
from accounts as a
where a.followers > (
      select a2.followers 
      from accounts as a2
      where a2.following = (
           select max(a3.following) 
           from accounts as a3
           )
	);

/* Q6.Posts whose likes are greater than BIRYaNI HOTELS likes */

select posts.posttitle,
        posts.likes 
from posts 
where likes > (select likes from posts where posttitle ='BIRYANI HOTELS');

/*
----------------------------------------------------------------------------------------------
11.BUSINESS INSIGHTS
---------------------------------------------------------------------------------------------
*/
                 
/* Q1. Which category generates the highest overall engagement */

SELECT posts.category,
       SUM(posts.likes + posts.comments) AS total_engagement
FROM posts
GROUP BY category
ORDER BY total_engagement DESC
LIMIT 1;

/* Q2. Which user has the highest total engagement across all their posts */

select accounts.username,
      sum(posts.likes + posts.comments) as total_engagement 
from accounts 
inner join posts 
on accounts.accountid = posts.accountid 
group by  accounts.username 
order by total_engagement desc 
limit 1;

/* Q3. Which post has the highest total engagement, and who created it? */

select accounts.username,
        posts.posttitle, 
        posts.likes + posts.comments as total_engagement 
from accounts 
inner join posts 
on accounts.accountid = posts.accountid 
order by total_engagement desc 
limit 1;

/* Q4. Which category has the highest average likes per post */

select posts.category, 
        avg(likes) as average_likes 
from posts 
group by category 
order by average_likes desc 
limit 1;

/* Q5.Which user has the highest engagement rate */

select accounts.username,
       (posts.likes + posts.comments)/ accounts.followers *100 
	   as engagement_rate 
from accounts 
inner join posts 
on accounts.accountid = posts.accountid 
order by engagement_rate desc 
limit 1;

/* Q6.Which category has the highest total number of likes and comments combined */

select posts.category, 
    SUM(posts.likes) as total_likes, 
    SUM(posts.comments) as total_comments, 
    SUM(posts.likes + posts.comments) 
  as total_engagement 
from posts 
group by category 
order by total_engagement desc 
limit 1;

/*
---------------------------------------------------------------------------------------------------------------
END OF PROJECT
----------------------------------------------------------------------------------------------------------------
*/
