-- Table Subquery
 
SELECT
    SUM(Top10Patients.Tariff) AS Top10Tariff
FROM
    (
    SELECT
        TOP 10
        ps.PatientId,
        ps.Tariff
    FROM
        PatientStay ps
    ORDER BY
        ps.Tariff DESC) Top10Patients;


-- CTE

WITH TopPatients AS (
    SELECT
        TOP 10
        ps.PatientId,
        ps.Tariff
    FROM
        PatientStay ps
    ORDER BY
        ps.Tariff DESC)

SELECT SUM(TopPatients.Tariff) AS Top10Tariff FROM TopPatients;


-- CTE 2

WITH TopPatients(PatientId, SquaredTariff) AS (
    SELECT
        TOP 10
        ps.PatientId,
        ps.Tariff * ps.Tariff
    FROM
        PatientStay ps
    ORDER BY
        ps.Tariff DESC)

SELECT SUM(TopPatients.SquaredTariff) AS Top10Tariff FROM TopPatients;


-- Temporary Table

SELECT
    TOP 10
    ps.PatientId,
    ps.Tariff * ps.Tariff AS SquaredTariff
INTO #TopPatients
FROM
    PatientStay ps
ORDER BY
    ps.Tariff DESC

SELECT SUM(#TopPatients.SquaredTariff) AS Top10Tariff FROM #TopPatients;