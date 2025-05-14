## Performance Report for Partitioning Booking Table ##
This report aims to monitor the Booking table and evaluate its performance before and after the partition.

## Analysis Before the Partition ##
`
mysql> explain select * from Booking where start_date = '2025-06-01'\G
*************************** 1. row ***************************
           id: 1
  select_type: SIMPLE
        table: Booking
   partitions: NULL
         type: ALL
possible_keys: NULL
          key: NULL
      key_len: NULL
          ref: NULL
         rows: 32
     filtered: 10.00
        Extra: Using where
1 row in set, 1 warning (0.00 sec)
`
`
mysql> explain analyze select * from Booking where start_date = '2025-06-01'\G
*************************** 1. row ***************************
EXPLAIN: -> Filter: (Booking.start_date = DATE'2025-06-01')  (cost=3.45 rows=3.2) (actual time=0.0424..0.0745 rows=1 loops=1)
    -> Table scan on Booking  (cost=3.45 rows=32) (actual time=0.0392..0.068 rows=32 loops=1)

1 row in set (0.00 sec)

`
### Comments ###
32 rows where scanned
And it costs 3.45 seconds
----
**After partitioning**
`
mysql> explain select * from Booking where start_date ='2023-10-10'\G
*************************** 1. row ***************************
           id: 1
  select_type: SIMPLE
        table: Booking
   partitions: p2023
         type: ref
possible_keys: start_date
          key: start_date
      key_len: 3
          ref: const
         rows: 1
     filtered: 100.00
        Extra: NULL
1 row in set, 1 warning (0.00 sec)
`
mysql> explain analyze select * from Booking where start_date ='2023-10-10'\G
*************************** 1. row ***************************
EXPLAIN: -> Index lookup on Booking using start_date (start_date=DATE'2023-10-10')  (cost=0.35 rows=1) (actual time=0.047..0.0501 rows=1 loops=1)
`
## Comment ## 
The number of rows scanned by MySQL in other to retrieve the result has now reduced to **1**
The time take to retrieve the result has reduced to **0.047**
