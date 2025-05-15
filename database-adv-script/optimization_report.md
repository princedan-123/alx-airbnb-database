## Optimization Report ##
The goal is to perform a complex query, examine the query using EXPLAIN, identify inefficiency and them optimize it.
## Query Performed ##
`
SELECT *
FROM
User AS u  INNER JOIN Booking AS b ON b.user_id = u.user_id
INNER JOIN Property AS p ON b.property_id = p.property_id
INNER JOIN Payment AS pa ON pa.booking_id = b.booking_id;
`
## Inefficiency Identified
`id: 1
  select_type: SIMPLE
        table: pa
   partitions: NULL
         type: ALL
possible_keys: booking_id
          key: NULL
      key_len: NULL
          ref: NULL
         rows: 31
     filtered: 100.00
        Extra: Using where
`
**Comment**: 31 rows where scan instead instead of 1 like in other queries. This may be due to the fact that no index was used in this part of the query. 