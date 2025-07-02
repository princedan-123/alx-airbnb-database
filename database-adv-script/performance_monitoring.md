## Bottle Necks
Although partitioning in MySQL can significantly improve read performance (especially for large datasets), there are some important limitations:
- In MySQL, partitioned tables cannot have foreign key constraints (either referencing another table or being referenced).
- The partition column must be included in all unique keys, including the primary key — this is required for partitioning in InnoDB
-  To benefit from partition pruning, you must use a WHERE clause that filters using the partitioning column.