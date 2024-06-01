-- Q1. Show how many medal counts present for entire data.
select count(*) as All_Medals from athletes_cleaned;

-- Q2. Show count of unique Sports are present in olympics. 
select count(distinct Sport) as Unique_sports from athletes_cleaned;

-- Show how many different medals won by Team India in data.
select
sum(case when Medal = 'Gold' then 1 ELSE 0 END) AS Gold_Count,
sum(case when Medal = 'Silver' then 1 ELSE 0 END) AS Silver_Count,
sum(case when Medal = 'Bronze' then 1 ELSE 0 END) AS Bronze_Count
from athletes_cleaned where Team = 'India';

-- Q4. Show event wise medals won by india show from highest to lowest medals won in order.
select Event, Medal, count(*) AS Medal_Count from athletes_cleaned
where Team = 'India'group by Event, Medal;

-- Q5. Show event and yearwise medals won by india in order of year.
select Event, Year, Medal from athletes_cleaned
where Team = 'India' order by Year;

-- Q6. Show the country with maximum medals won gold, silver, bronze.
select team, sum(case when medal = 'Gold' then 1 else 0 end) as gold,
			 sum(case when medal = 'Silver' then 1 else 0 end) as silver,
               sum(case when medal = 'Bronze' then 1 else 0 end) as bronze
from athletes_cleaned group by team order by gold desc, silver desc, bronze desc;

-- Q7. Show the top 10 countries with respect to gold medals.
select team, sum(case when medal = 'Gold' then 1 else 0 end) as gold
from athletes_cleaned group by Team order by gold desc limit 10;
        
        
-- Q8. Show in which year did United States won most medals.
select Team, Year, Medal, count(*) as Max_Medal from athletes_cleaned 
where Team = 'United States' group by Team, Year, Medal order by Max_medal desc limit 5;


-- Q9. In which sports United States has most medals
select Sport, Team, count(Medal) as Max_medals from athletes_cleaned 
where Team = 'United States' group by Sport order by Max_medals desc limit 5 ;
-- we can set limit as 1 as per the ques in Q9.

-- Q10. Find top 3 players who have won most medals along with their sports and country.
select Name, Sport, Team, count(Medal) as Max_Medals from athletes_cleaned
group by Name, Sport, Team order by Max_medals desc limit 3;

-- Q11. Find player with most gold medals in cycling along with his country.
select Name, Team, count(*) as gold from athletes_cleaned
where Sport = 'Cycling' and Medal = 'Gold' group by Name, Team order by gold desc limit 3;
-- we have to set limit as 1 as per the ques in Q11.

-- Q12. Find out the count of different medals of the top basketball player.
SELECT Name, Sport,
sum(case when medal = 'Gold' then 1 else 0 end) as gold,
sum(case when medal = 'Silver' then 1 else 0 end) as silver,
sum(case when medal = 'Bronze' then 1 else 0 end) as bronze, count(*) All_Medals
FROM athletes_cleaned where Sport= 'Basketball' GROUP BY Name, Sport
ORDER BY gold DESC, silver DESC, bronze DESC limit 1;

-- Q13. Find out medals won by male, female each year .
SELECT Year, Sex, 
sum(case when medal = 'Gold' then 1 else 0 end) as gold,
sum(case when medal = 'Silver' then 1 else 0 end) as silver,
sum(case when medal = 'Bronze' then 1 else 0 end) as bronze, count(*) All_Medals
FROM athletes_cleaned where Sport= 'Basketball' GROUP BY Year, Sex
ORDER BY All_Medals desc;












