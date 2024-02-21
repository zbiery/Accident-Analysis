SELECT * FROM final.Crashes c
INNER JOIN final.People p
ON c.CrashID = p.CrashID
INNER JOIN final.Injuries i 
ON p.PersonID = i.PersonID


SELECT * FROM final.People

SELECT i.InjuryID, i.PersonID, a.InjuryArea, i.Severity
FROM final.Injuries i
INNER JOIN final.InjuryAreas a
ON i.InjuryAreaID = a.InjuryAreaID

SELECT * FROM final.InjuryAreas

--most common injury areas (frequency distribution)
SELECT InjuryArea, COUNT(*) AS NumInjuries
FROM final.Injuries
GROUP BY InjuryArea
ORDER BY NumInjuries DESC;

--most common injury areas by death

SELECT a.InjuryArea, COUNT(*) AS NumFatalities
FROM final.Injuries i
INNER JOIN final.InjuryAreas a
ON a.InjuryAreaID = i.InjuryAreaID
WHERE i.Severity = 'Fatal'
GROUP BY a.InjuryArea
ORDER BY NumFatalities DESC;

SELECT SUM(NumInjuries) AS Total FROM
(
SELECT InjuryArea, COUNT(*) AS NumInjuries
FROM final.Injuries
GROUP BY InjuryArea
--ORDER BY NumInjuries DESC;
) AS SumSub


SELECT Age, COUNT(CrashID) AS TotalCrashes
FROM final.People
GROUP BY Age
ORDER BY TotalCrashes  DESC;

--count the number of injuries for each person type by injury area
SELECT p.Type, InjuriesSub.InjuryArea, COUNT(*) AS NumInjuries
FROM final.People p
INNER JOIN 
    (SELECT PersonID, InjuryArea
    FROM final.Injuries
    GROUP BY PersonID, InjuryArea) AS InjuriesSub
ON InjuriesSub.PersonID = p.PersonID
GROUP BY p.Type, InjuriesSub.InjuryArea;



