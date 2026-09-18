# TeachBeach: Student Tutoring Management Database

Group project for IS 380 (Database Management) at CSULB. Team of five. First place, Database Management App Contest, 2025. Built out the conceptual model, logical model, and the queries. 

## The problem

At large universities, tutoring demand outgrows the staff who schedule it. Students struggle to find and book a tutor, and administrators struggle to manage tutor availability or see how the service is used. We designed a database to handle tutor profiles, scheduling, booking, attendance, feedback, and invoicing.

## What's in this repo

- `TeachBeach_IS380.pdf`: the full write-up. Conceptual model, logical model (19 entities in four clusters: student, payment, session, tutor), data dictionary, physical design, and the test queries with their output.
- `queries.sql`: the seven test queries, written in Oracle SQL and run in SQL Developer for VS Code.

## What the queries cover

1. Sessions at specific tutoring locations (multi-table join, `IN` filter)
2. Tutors ranked by average session rating (`AVG`, `ROUND`, `GROUP BY`)
3. Sessions filtered by subject
4. Tutors sorted by experience level
5. Session counts per tutor and subject (`COUNT`, `GROUP BY`)
6. Sessions on a given date or time (`TO_DATE`)
7. Upcoming sessions (`SYSDATE`, ordered by date and time)

## Limits and what I'd change

- All data is fake test data.
- The queries use a simpler table layout than the logical model. For example, location, subject, and rating are read straight from the sessions table.
- Query 2 groups by tutor name. Grouping by tutor ID would keep two tutors with the same name from merging.
- Query 4 sorts a text column, which only works here because "Advanced" sorts before "Intermediate". A numeric rank would be safer.
- Query 6 uses `OR`, so it returns sessions that match either the date or the time. Use `AND` to find one specific slot.
- The queries stay at joins, filters, and simple aggregation. I haven't yet used window functions, subqueries, or CTEs in a project like this.
