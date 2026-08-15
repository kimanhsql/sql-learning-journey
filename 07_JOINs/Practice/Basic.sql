/*
============================================================
THINK BEFORE WRITING SQL
============================================================

Before writing a JOIN query, ask yourself:

1. Which tables are required?
2. What is the relationship between them?
3. Which columns should be joined?
4. Which key connects the tables?
5. Which JOIN type should I use?

------------------------------------------------------------
REMEMBER
------------------------------------------------------------

- Identify the tables that contain the information required
  by the question.
- Understand how the tables are related before writing the JOIN.
- Usually, the JOIN condition connects a foreign key to the
  corresponding primary key.
- Make sure the columns used in the JOIN represent the correct
  relationship between the tables.
- Use INNER JOIN when only matching records are required.
- Check the result to make sure the JOIN does not produce
  unexpected duplicate rows.
- Use table aliases when they make the query easier to read.

Focus on understanding the relationship before writing the JOIN.
*/


-- Exercise 1
-- Display player names together with their club names.

SELECT CLUB_NAME,
        PLAYER_NAME
FROM CLUBS C
INNER JOIN PLAYERS PL
        ON C.CLUB_ID = PL.CLUB_ID


-- Exercise 2
-- Display player names together with their country names.

SELECT COUNTRY_NAME,
        PLAYER_NAME
FROM COUNTRIES CT
INNER JOIN PLAYERS PL
        ON CT.COUNTRY_ID = PL.COUNTRY_ID


-- Exercise 3
-- Display club names and their stadium names.

SELECT STADIUM_NAME,
        CLUB_NAME
FROM STADIUMS ST
INNER JOIN CLUBS C
        ON ST.STADIUM_ID = C.STADIUM_ID


-- Exercise 4
-- Display coach names together with the clubs they manage.

SELECT COACH_NAME,
        CLUB_NAME
FROM COACHES CH
INNER JOIN CLUB_COACHES CC
        ON CH.COACH_ID = CC.COACH_ID
INNER JOIN CLUBS C
        ON CC.CLUB_ID = C.CLUB_ID


-- Exercise 5
-- Display player names, club names, and country names.

SELECT PLAYER_NAME,
        CLUB_NAME,
        COUNTRY_NAME
FROM PLAYERS PL
INNER JOIN CLUBS C
        ON PL.CLUB_ID = C.CLUB_ID
INNER JOIN COUNTRIES CT
        ON PL.COUNTRY_ID = CT.COUNTRY_ID


-- Exercise 6
-- Display all clubs, including clubs that have no players.

SELECT C.CLUB_ID,
        CLUB_NAME,
        PLAYER_NAME
FROM CLUBS C
LEFT OUTER JOIN PLAYERS PL
        ON C.CLUB_ID = PL.CLUB_ID


-- Exercise 7
-- Display all countries, including countries that have no players.

SELECT CT.COUNTRY_ID,
        COUNTRY_NAME,
        PLAYER_NAME
FROM COUNTRIES CT
LEFT OUTER JOIN PLAYERS PL
        ON CT.COUNTRY_ID = PL.COUNTRY_ID


-- Exercise 8
-- Display all coaches and the clubs they manage,
-- including coaches who are not assigned to any club.

SELECT CH.COACH_ID,
        COACH_NAME,
        CLUB_NAME
FROM COACHES CH
LEFT OUTER JOIN CLUB_COACHES CC
        ON CH.COACH_ID = CC.COACH_ID
LEFT OUTER JOIN CLUBS C
        ON CC.CLUB_ID = C.CLUB_ID


-- Exercise 9
-- Display every possible combination of players and clubs.

SELECT PLAYER_NAME,
        CLUB_NAME
FROM PLAYERS
CROSS JOIN CLUBS


-- Exercise 10
-- Display players who have the same position.

SELECT PL1.PLAYER_NAME,
        PL2.PLAYER_NAME,
        PL1.POSITION
FROM PLAYERS PL1
INNER JOIN PLAYERS PL2
        ON PL1.POSITION = PL2.POSITION
WHERE PL1.PLAYER_ID < PL2.PLAYER_ID