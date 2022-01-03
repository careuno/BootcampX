/* https://web.compass.lighthouselabs.ca/days/w05d1/activities/934 

Select all rollover students.

Get the student's name, student's start_date, cohort's name, and cohort's start_date.
Alias the column names to be more descriptive.
Order by the start date of the cohort.

*/



        SELECT students.name, cohorts.name, cohorts.start_date AS cohort_start_date, students.start_date AS student_start_date
        FROM students JOIN cohorts ON cohort_id = cohorts.id
        WHERE cohorts.start_date != students.start_date
        ORDER BY cohort_start_date;

        /*  You want to do an INNER JOIN cause rollover students would have a cohort_id so they would meet the condition */