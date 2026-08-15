/*
============================================================
THINK BEFORE WRITING SQL
============================================================

Before writing a JOIN query, ask yourself:

1. Do I need to join more than two tables?
2. Which table should I start with?
3. Should I use INNER JOIN or OUTER JOIN?
4. Will every table have matching records?
5. Can I simplify the JOIN order?
6. Should I use table aliases to improve readability?

------------------------------------------------------------
REMEMBER
------------------------------------------------------------

- Choose the starting table based on the main information
  required by the question.
- INNER JOIN returns only rows with matching records in
  the joined tables.
- LEFT JOIN keeps all rows from the left table, even when
  no matching record exists in the right table.
- RIGHT JOIN keeps all rows from the right table, even when
  no matching record exists in the left table.
- FULL OUTER JOIN keeps matching and non-matching rows
  from both tables.
- When joining multiple tables, make sure each JOIN uses
  the correct relationship between the tables.
- Check whether a JOIN can create duplicate rows because
  of one-to-many or many-to-many relationships.
- Use table aliases when queries involve multiple tables
  or when table names are long.
- Build the query one JOIN at a time and check the result
  after adding each JOIN.
- The JOIN order should make the relationships and purpose
  of the query easy to understand.
- Do not add a JOIN unless the required data or condition
  actually depends on another table.

Build the query one JOIN at a time.
*/


-- Exercise 1
-- Display player names, club names, and stadium names.

SELECT PLAYER_NAME,
        CLUB_NAME,
        STADIUM_NAME
FROM PLAYERS PL
INNER JOIN CLUBS C
        ON C.CLUB_ID = PL.CLUB_ID
INNER JOIN STADIUMS ST
        ON ST.STADIUM_ID = C.STADIUM_ID


-- Exercise 2
-- Display coach names, club names, and stadium names.

SELECT COACH_NAME,
        CLUB_NAME,
        STADIUM_NAME
FROM COACHES CH
INNER JOIN CLUB_COACHES CC
        ON CC.COACH_ID = CH.COACH_ID
INNER JOIN CLUBS C
        ON C.CLUB_ID = CC.CLUB_ID
INNER JOIN STADIUMS ST
        ON ST.STADIUM_ID = C.STADIUM_ID


-- Exercise 3
-- Display player names, country names, club names, and stadium names.

SELECT PLAYER_NAME,
        COUNTRY_NAME,
        CLUB_NAME,
        STADIUM_NAME
FROM PLAYERS PL
INNER JOIN COUNTRIES CT
        ON CT.COUNTRY_ID = PL.COUNTRY_ID
INNER JOIN CLUBS C
        ON C.CLUB_ID = PL.CLUB_ID
INNER JOIN STADIUMS ST
        ON ST.STADIUM_ID = C.STADIUM_ID


-- Exercise 4
-- Display all players together with their coaches.

SELECT PLAYER_NAME,
        COACH_NAME
FROM PLAYERS PL
INNER JOIN CLUBS C
        ON C.CLUB_ID = PL.CLUB_ID
INNER JOIN CLUB_COACHES CC
        ON CC.CLUB_ID = C.CLUB_ID
INNER JOIN COACHES CH
        ON CH.COACH_ID = CC.COACH_ID


-- Exercise 5
-- Display all clubs and the number of coaches assigned to each club.

SELECT C.CLUB_ID,
        CLUB_NAME,
        COUNT(*) AS NumberOfCoaches
FROM CLUBS C
INNER JOIN CLUB_COACHES CC
        ON CC.CLUB_ID = C.CLUB_ID
GROUP BY C.CLUB_ID,
        CLUB_NAME


-- Exercise 6
-- Display all stadiums, including stadiums that
-- do not belong to any club.

SELECT STADIUM_NAME,
        CLUB_NAME
FROM STADIUMS ST
LEFT JOIN CLUBS C
        ON C.STADIUM_ID = ST.STADIUM_ID


-- Exercise 7
-- Display all countries together with their players and clubs.

SELECT COUNTRY_NAME,
        PLAYER_NAME,
        CLUB_NAME
FROM COUNTRIES CT
INNER JOIN PLAYERS PL
        ON PL.COUNTRY_ID = CT.COUNTRY_ID
INNER JOIN CLUBS C
        ON C.CLUB_ID = PL.CLUB_ID


-- Exercise 8
-- Display all coaches and the stadiums of the clubs they manage.

SELECT COACH_NAME,
        STADIUM_NAME,
        CLUB_NAME
FROM COACHES CH
INNER JOIN CLUB_COACHES CC
        ON CC.COACH_ID = CH.COACH_ID
INNER JOIN CLUBS C
        ON CC.CLUB_ID = C.CLUB_ID
INNER JOIN STADIUMS ST
        ON ST.STADIUM_ID = C.STADIUM_ID


-- Exercise 9
-- Display players together with their club, country, and coach.

SELECT PLAYER_NAME,
        CLUB_NAME,
        COUNTRY_NAME,
        COACH_NAME
FROM PLAYERS PL
INNER JOIN CLUBS C
        ON C.CLUB_ID = PL.CLUB_ID
INNER JOIN COUNTRIES CT
        ON CT.COUNTRY_ID = PL.COUNTRY_ID
INNER JOIN CLUB_COACHES CC
        ON CC.CLUB_ID = C.CLUB_ID
INNER JOIN COACHES CH
        ON CH.COACH_ID = CC.COACH_ID


-- Exercise 10
-- Display all clubs, players, coaches, and stadiums in one query.

SELECT CLUB_NAME,
        PLAYER_NAME,
        COACH_NAME,
        STADIUM_NAME
FROM CLUBS C
INNER JOIN PLAYERS PL
        ON PL.CLUB_ID = C.CLUB_ID
INNER JOIN CLUB_COACHES CC
        ON CC.CLUB_ID = C.CLUB_ID
INNER JOIN COACHES CH
        ON CH.COACH_ID = CC.COACH_ID
INNER JOIN STADIUMS ST
        ON ST.STADIUM_ID = C.STADIUM_ID