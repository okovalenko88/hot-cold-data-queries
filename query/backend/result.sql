-- 1. 'All' as story_hash, 'All' as model_id, 'All' as query_type, 'All' as status


    SELECT
      -- <Next line is auto-generated> All dimensions
story_hash, model_id, query_type, status, 
      execution_date,
      max(duration_perc50_ms) duration_perc50_ms,
      max(duration_perc90_ms) duration_perc90_ms,
      max(duration_perc95_ms) duration_perc95_ms,
      max(duration_perc99_ms) duration_perc99_ms,
      count(*) AS count
    FROM
      (
        SELECT
          -- <Next line is auto-generated> Select group
'All' as story_hash, 'All' as model_id, 'All' as query_type, 'All' as status, 
          execution_date,
          percentile_cont(0.5) within GROUP (
            ORDER BY
              duration
          ) over (
            PARTITION by 
            -- <Next line is auto-generated> Partition group

            execution_date
          ) duration_perc50_ms,
          percentile_cont(0.90) within GROUP (
            ORDER BY
              duration
          ) over (
            PARTITION by 
            -- <Next line is auto-generated> Partition group

            execution_date
          ) duration_perc90_ms,
          percentile_cont(0.95) within GROUP (
            ORDER BY
              duration
          ) over (
            PARTITION by 
            -- <Next line is auto-generated> Partition group

            execution_date
          ) duration_perc95_ms,
          percentile_cont(0.99) within GROUP (
            ORDER BY
              duration
          ) over (
            PARTITION by 
            -- <Next line is auto-generated> Partition group

            execution_date
          ) duration_perc99_ms
        FROM
          :data_all
      )
    GROUP BY
      -- <Next line is auto-generated> All dimensions
story_hash, model_id, query_type, status, 
      execution_date

UNION
-- 2. 'All' as story_hash, 'All' as model_id, 'All' as query_type, status


    SELECT
      -- <Next line is auto-generated> All dimensions
story_hash, model_id, query_type, status, 
      execution_date,
      max(duration_perc50_ms) duration_perc50_ms,
      max(duration_perc90_ms) duration_perc90_ms,
      max(duration_perc95_ms) duration_perc95_ms,
      max(duration_perc99_ms) duration_perc99_ms,
      count(*) AS count
    FROM
      (
        SELECT
          -- <Next line is auto-generated> Select group
'All' as story_hash, 'All' as model_id, 'All' as query_type, status, 
          execution_date,
          percentile_cont(0.5) within GROUP (
            ORDER BY
              duration
          ) over (
            PARTITION by 
            -- <Next line is auto-generated> Partition group
status, 
            execution_date
          ) duration_perc50_ms,
          percentile_cont(0.90) within GROUP (
            ORDER BY
              duration
          ) over (
            PARTITION by 
            -- <Next line is auto-generated> Partition group
status, 
            execution_date
          ) duration_perc90_ms,
          percentile_cont(0.95) within GROUP (
            ORDER BY
              duration
          ) over (
            PARTITION by 
            -- <Next line is auto-generated> Partition group
status, 
            execution_date
          ) duration_perc95_ms,
          percentile_cont(0.99) within GROUP (
            ORDER BY
              duration
          ) over (
            PARTITION by 
            -- <Next line is auto-generated> Partition group
status, 
            execution_date
          ) duration_perc99_ms
        FROM
          :data_all
      )
    GROUP BY
      -- <Next line is auto-generated> All dimensions
story_hash, model_id, query_type, status, 
      execution_date

UNION
-- 3. 'All' as story_hash, 'All' as model_id, query_type, 'All' as status


    SELECT
      -- <Next line is auto-generated> All dimensions
story_hash, model_id, query_type, status, 
      execution_date,
      max(duration_perc50_ms) duration_perc50_ms,
      max(duration_perc90_ms) duration_perc90_ms,
      max(duration_perc95_ms) duration_perc95_ms,
      max(duration_perc99_ms) duration_perc99_ms,
      count(*) AS count
    FROM
      (
        SELECT
          -- <Next line is auto-generated> Select group
'All' as story_hash, 'All' as model_id, query_type, 'All' as status, 
          execution_date,
          percentile_cont(0.5) within GROUP (
            ORDER BY
              duration
          ) over (
            PARTITION by 
            -- <Next line is auto-generated> Partition group
query_type, 
            execution_date
          ) duration_perc50_ms,
          percentile_cont(0.90) within GROUP (
            ORDER BY
              duration
          ) over (
            PARTITION by 
            -- <Next line is auto-generated> Partition group
query_type, 
            execution_date
          ) duration_perc90_ms,
          percentile_cont(0.95) within GROUP (
            ORDER BY
              duration
          ) over (
            PARTITION by 
            -- <Next line is auto-generated> Partition group
query_type, 
            execution_date
          ) duration_perc95_ms,
          percentile_cont(0.99) within GROUP (
            ORDER BY
              duration
          ) over (
            PARTITION by 
            -- <Next line is auto-generated> Partition group
query_type, 
            execution_date
          ) duration_perc99_ms
        FROM
          :data_all
      )
    GROUP BY
      -- <Next line is auto-generated> All dimensions
story_hash, model_id, query_type, status, 
      execution_date

UNION
-- 4. 'All' as story_hash, 'All' as model_id, query_type, status


    SELECT
      -- <Next line is auto-generated> All dimensions
story_hash, model_id, query_type, status, 
      execution_date,
      max(duration_perc50_ms) duration_perc50_ms,
      max(duration_perc90_ms) duration_perc90_ms,
      max(duration_perc95_ms) duration_perc95_ms,
      max(duration_perc99_ms) duration_perc99_ms,
      count(*) AS count
    FROM
      (
        SELECT
          -- <Next line is auto-generated> Select group
'All' as story_hash, 'All' as model_id, query_type, status, 
          execution_date,
          percentile_cont(0.5) within GROUP (
            ORDER BY
              duration
          ) over (
            PARTITION by 
            -- <Next line is auto-generated> Partition group
query_type, status, 
            execution_date
          ) duration_perc50_ms,
          percentile_cont(0.90) within GROUP (
            ORDER BY
              duration
          ) over (
            PARTITION by 
            -- <Next line is auto-generated> Partition group
query_type, status, 
            execution_date
          ) duration_perc90_ms,
          percentile_cont(0.95) within GROUP (
            ORDER BY
              duration
          ) over (
            PARTITION by 
            -- <Next line is auto-generated> Partition group
query_type, status, 
            execution_date
          ) duration_perc95_ms,
          percentile_cont(0.99) within GROUP (
            ORDER BY
              duration
          ) over (
            PARTITION by 
            -- <Next line is auto-generated> Partition group
query_type, status, 
            execution_date
          ) duration_perc99_ms
        FROM
          :data_all
      )
    GROUP BY
      -- <Next line is auto-generated> All dimensions
story_hash, model_id, query_type, status, 
      execution_date

UNION
-- 5. 'All' as story_hash, model_id, 'All' as query_type, 'All' as status


    SELECT
      -- <Next line is auto-generated> All dimensions
story_hash, model_id, query_type, status, 
      execution_date,
      max(duration_perc50_ms) duration_perc50_ms,
      max(duration_perc90_ms) duration_perc90_ms,
      max(duration_perc95_ms) duration_perc95_ms,
      max(duration_perc99_ms) duration_perc99_ms,
      count(*) AS count
    FROM
      (
        SELECT
          -- <Next line is auto-generated> Select group
'All' as story_hash, model_id, 'All' as query_type, 'All' as status, 
          execution_date,
          percentile_cont(0.5) within GROUP (
            ORDER BY
              duration
          ) over (
            PARTITION by 
            -- <Next line is auto-generated> Partition group
model_id, 
            execution_date
          ) duration_perc50_ms,
          percentile_cont(0.90) within GROUP (
            ORDER BY
              duration
          ) over (
            PARTITION by 
            -- <Next line is auto-generated> Partition group
model_id, 
            execution_date
          ) duration_perc90_ms,
          percentile_cont(0.95) within GROUP (
            ORDER BY
              duration
          ) over (
            PARTITION by 
            -- <Next line is auto-generated> Partition group
model_id, 
            execution_date
          ) duration_perc95_ms,
          percentile_cont(0.99) within GROUP (
            ORDER BY
              duration
          ) over (
            PARTITION by 
            -- <Next line is auto-generated> Partition group
model_id, 
            execution_date
          ) duration_perc99_ms
        FROM
          :data_all
      )
    GROUP BY
      -- <Next line is auto-generated> All dimensions
story_hash, model_id, query_type, status, 
      execution_date

UNION
-- 6. 'All' as story_hash, model_id, 'All' as query_type, status


    SELECT
      -- <Next line is auto-generated> All dimensions
story_hash, model_id, query_type, status, 
      execution_date,
      max(duration_perc50_ms) duration_perc50_ms,
      max(duration_perc90_ms) duration_perc90_ms,
      max(duration_perc95_ms) duration_perc95_ms,
      max(duration_perc99_ms) duration_perc99_ms,
      count(*) AS count
    FROM
      (
        SELECT
          -- <Next line is auto-generated> Select group
'All' as story_hash, model_id, 'All' as query_type, status, 
          execution_date,
          percentile_cont(0.5) within GROUP (
            ORDER BY
              duration
          ) over (
            PARTITION by 
            -- <Next line is auto-generated> Partition group
model_id, status, 
            execution_date
          ) duration_perc50_ms,
          percentile_cont(0.90) within GROUP (
            ORDER BY
              duration
          ) over (
            PARTITION by 
            -- <Next line is auto-generated> Partition group
model_id, status, 
            execution_date
          ) duration_perc90_ms,
          percentile_cont(0.95) within GROUP (
            ORDER BY
              duration
          ) over (
            PARTITION by 
            -- <Next line is auto-generated> Partition group
model_id, status, 
            execution_date
          ) duration_perc95_ms,
          percentile_cont(0.99) within GROUP (
            ORDER BY
              duration
          ) over (
            PARTITION by 
            -- <Next line is auto-generated> Partition group
model_id, status, 
            execution_date
          ) duration_perc99_ms
        FROM
          :data_all
      )
    GROUP BY
      -- <Next line is auto-generated> All dimensions
story_hash, model_id, query_type, status, 
      execution_date

UNION
-- 7. 'All' as story_hash, model_id, query_type, 'All' as status


    SELECT
      -- <Next line is auto-generated> All dimensions
story_hash, model_id, query_type, status, 
      execution_date,
      max(duration_perc50_ms) duration_perc50_ms,
      max(duration_perc90_ms) duration_perc90_ms,
      max(duration_perc95_ms) duration_perc95_ms,
      max(duration_perc99_ms) duration_perc99_ms,
      count(*) AS count
    FROM
      (
        SELECT
          -- <Next line is auto-generated> Select group
'All' as story_hash, model_id, query_type, 'All' as status, 
          execution_date,
          percentile_cont(0.5) within GROUP (
            ORDER BY
              duration
          ) over (
            PARTITION by 
            -- <Next line is auto-generated> Partition group
model_id, query_type, 
            execution_date
          ) duration_perc50_ms,
          percentile_cont(0.90) within GROUP (
            ORDER BY
              duration
          ) over (
            PARTITION by 
            -- <Next line is auto-generated> Partition group
model_id, query_type, 
            execution_date
          ) duration_perc90_ms,
          percentile_cont(0.95) within GROUP (
            ORDER BY
              duration
          ) over (
            PARTITION by 
            -- <Next line is auto-generated> Partition group
model_id, query_type, 
            execution_date
          ) duration_perc95_ms,
          percentile_cont(0.99) within GROUP (
            ORDER BY
              duration
          ) over (
            PARTITION by 
            -- <Next line is auto-generated> Partition group
model_id, query_type, 
            execution_date
          ) duration_perc99_ms
        FROM
          :data_all
      )
    GROUP BY
      -- <Next line is auto-generated> All dimensions
story_hash, model_id, query_type, status, 
      execution_date

UNION
-- 8. 'All' as story_hash, model_id, query_type, status


    SELECT
      -- <Next line is auto-generated> All dimensions
story_hash, model_id, query_type, status, 
      execution_date,
      max(duration_perc50_ms) duration_perc50_ms,
      max(duration_perc90_ms) duration_perc90_ms,
      max(duration_perc95_ms) duration_perc95_ms,
      max(duration_perc99_ms) duration_perc99_ms,
      count(*) AS count
    FROM
      (
        SELECT
          -- <Next line is auto-generated> Select group
'All' as story_hash, model_id, query_type, status, 
          execution_date,
          percentile_cont(0.5) within GROUP (
            ORDER BY
              duration
          ) over (
            PARTITION by 
            -- <Next line is auto-generated> Partition group
model_id, query_type, status, 
            execution_date
          ) duration_perc50_ms,
          percentile_cont(0.90) within GROUP (
            ORDER BY
              duration
          ) over (
            PARTITION by 
            -- <Next line is auto-generated> Partition group
model_id, query_type, status, 
            execution_date
          ) duration_perc90_ms,
          percentile_cont(0.95) within GROUP (
            ORDER BY
              duration
          ) over (
            PARTITION by 
            -- <Next line is auto-generated> Partition group
model_id, query_type, status, 
            execution_date
          ) duration_perc95_ms,
          percentile_cont(0.99) within GROUP (
            ORDER BY
              duration
          ) over (
            PARTITION by 
            -- <Next line is auto-generated> Partition group
model_id, query_type, status, 
            execution_date
          ) duration_perc99_ms
        FROM
          :data_all
      )
    GROUP BY
      -- <Next line is auto-generated> All dimensions
story_hash, model_id, query_type, status, 
      execution_date

UNION
-- 9. story_hash, 'All' as model_id, 'All' as query_type, 'All' as status


    SELECT
      -- <Next line is auto-generated> All dimensions
story_hash, model_id, query_type, status, 
      execution_date,
      max(duration_perc50_ms) duration_perc50_ms,
      max(duration_perc90_ms) duration_perc90_ms,
      max(duration_perc95_ms) duration_perc95_ms,
      max(duration_perc99_ms) duration_perc99_ms,
      count(*) AS count
    FROM
      (
        SELECT
          -- <Next line is auto-generated> Select group
story_hash, 'All' as model_id, 'All' as query_type, 'All' as status, 
          execution_date,
          percentile_cont(0.5) within GROUP (
            ORDER BY
              duration
          ) over (
            PARTITION by 
            -- <Next line is auto-generated> Partition group
story_hash, 
            execution_date
          ) duration_perc50_ms,
          percentile_cont(0.90) within GROUP (
            ORDER BY
              duration
          ) over (
            PARTITION by 
            -- <Next line is auto-generated> Partition group
story_hash, 
            execution_date
          ) duration_perc90_ms,
          percentile_cont(0.95) within GROUP (
            ORDER BY
              duration
          ) over (
            PARTITION by 
            -- <Next line is auto-generated> Partition group
story_hash, 
            execution_date
          ) duration_perc95_ms,
          percentile_cont(0.99) within GROUP (
            ORDER BY
              duration
          ) over (
            PARTITION by 
            -- <Next line is auto-generated> Partition group
story_hash, 
            execution_date
          ) duration_perc99_ms
        FROM
          :data_all
      )
    GROUP BY
      -- <Next line is auto-generated> All dimensions
story_hash, model_id, query_type, status, 
      execution_date

UNION
-- 10. story_hash, 'All' as model_id, 'All' as query_type, status


    SELECT
      -- <Next line is auto-generated> All dimensions
story_hash, model_id, query_type, status, 
      execution_date,
      max(duration_perc50_ms) duration_perc50_ms,
      max(duration_perc90_ms) duration_perc90_ms,
      max(duration_perc95_ms) duration_perc95_ms,
      max(duration_perc99_ms) duration_perc99_ms,
      count(*) AS count
    FROM
      (
        SELECT
          -- <Next line is auto-generated> Select group
story_hash, 'All' as model_id, 'All' as query_type, status, 
          execution_date,
          percentile_cont(0.5) within GROUP (
            ORDER BY
              duration
          ) over (
            PARTITION by 
            -- <Next line is auto-generated> Partition group
story_hash, status, 
            execution_date
          ) duration_perc50_ms,
          percentile_cont(0.90) within GROUP (
            ORDER BY
              duration
          ) over (
            PARTITION by 
            -- <Next line is auto-generated> Partition group
story_hash, status, 
            execution_date
          ) duration_perc90_ms,
          percentile_cont(0.95) within GROUP (
            ORDER BY
              duration
          ) over (
            PARTITION by 
            -- <Next line is auto-generated> Partition group
story_hash, status, 
            execution_date
          ) duration_perc95_ms,
          percentile_cont(0.99) within GROUP (
            ORDER BY
              duration
          ) over (
            PARTITION by 
            -- <Next line is auto-generated> Partition group
story_hash, status, 
            execution_date
          ) duration_perc99_ms
        FROM
          :data_all
      )
    GROUP BY
      -- <Next line is auto-generated> All dimensions
story_hash, model_id, query_type, status, 
      execution_date

UNION
-- 11. story_hash, 'All' as model_id, query_type, 'All' as status


    SELECT
      -- <Next line is auto-generated> All dimensions
story_hash, model_id, query_type, status, 
      execution_date,
      max(duration_perc50_ms) duration_perc50_ms,
      max(duration_perc90_ms) duration_perc90_ms,
      max(duration_perc95_ms) duration_perc95_ms,
      max(duration_perc99_ms) duration_perc99_ms,
      count(*) AS count
    FROM
      (
        SELECT
          -- <Next line is auto-generated> Select group
story_hash, 'All' as model_id, query_type, 'All' as status, 
          execution_date,
          percentile_cont(0.5) within GROUP (
            ORDER BY
              duration
          ) over (
            PARTITION by 
            -- <Next line is auto-generated> Partition group
story_hash, query_type, 
            execution_date
          ) duration_perc50_ms,
          percentile_cont(0.90) within GROUP (
            ORDER BY
              duration
          ) over (
            PARTITION by 
            -- <Next line is auto-generated> Partition group
story_hash, query_type, 
            execution_date
          ) duration_perc90_ms,
          percentile_cont(0.95) within GROUP (
            ORDER BY
              duration
          ) over (
            PARTITION by 
            -- <Next line is auto-generated> Partition group
story_hash, query_type, 
            execution_date
          ) duration_perc95_ms,
          percentile_cont(0.99) within GROUP (
            ORDER BY
              duration
          ) over (
            PARTITION by 
            -- <Next line is auto-generated> Partition group
story_hash, query_type, 
            execution_date
          ) duration_perc99_ms
        FROM
          :data_all
      )
    GROUP BY
      -- <Next line is auto-generated> All dimensions
story_hash, model_id, query_type, status, 
      execution_date

UNION
-- 12. story_hash, 'All' as model_id, query_type, status


    SELECT
      -- <Next line is auto-generated> All dimensions
story_hash, model_id, query_type, status, 
      execution_date,
      max(duration_perc50_ms) duration_perc50_ms,
      max(duration_perc90_ms) duration_perc90_ms,
      max(duration_perc95_ms) duration_perc95_ms,
      max(duration_perc99_ms) duration_perc99_ms,
      count(*) AS count
    FROM
      (
        SELECT
          -- <Next line is auto-generated> Select group
story_hash, 'All' as model_id, query_type, status, 
          execution_date,
          percentile_cont(0.5) within GROUP (
            ORDER BY
              duration
          ) over (
            PARTITION by 
            -- <Next line is auto-generated> Partition group
story_hash, query_type, status, 
            execution_date
          ) duration_perc50_ms,
          percentile_cont(0.90) within GROUP (
            ORDER BY
              duration
          ) over (
            PARTITION by 
            -- <Next line is auto-generated> Partition group
story_hash, query_type, status, 
            execution_date
          ) duration_perc90_ms,
          percentile_cont(0.95) within GROUP (
            ORDER BY
              duration
          ) over (
            PARTITION by 
            -- <Next line is auto-generated> Partition group
story_hash, query_type, status, 
            execution_date
          ) duration_perc95_ms,
          percentile_cont(0.99) within GROUP (
            ORDER BY
              duration
          ) over (
            PARTITION by 
            -- <Next line is auto-generated> Partition group
story_hash, query_type, status, 
            execution_date
          ) duration_perc99_ms
        FROM
          :data_all
      )
    GROUP BY
      -- <Next line is auto-generated> All dimensions
story_hash, model_id, query_type, status, 
      execution_date

UNION
-- 13. story_hash, model_id, 'All' as query_type, 'All' as status


    SELECT
      -- <Next line is auto-generated> All dimensions
story_hash, model_id, query_type, status, 
      execution_date,
      max(duration_perc50_ms) duration_perc50_ms,
      max(duration_perc90_ms) duration_perc90_ms,
      max(duration_perc95_ms) duration_perc95_ms,
      max(duration_perc99_ms) duration_perc99_ms,
      count(*) AS count
    FROM
      (
        SELECT
          -- <Next line is auto-generated> Select group
story_hash, model_id, 'All' as query_type, 'All' as status, 
          execution_date,
          percentile_cont(0.5) within GROUP (
            ORDER BY
              duration
          ) over (
            PARTITION by 
            -- <Next line is auto-generated> Partition group
story_hash, model_id, 
            execution_date
          ) duration_perc50_ms,
          percentile_cont(0.90) within GROUP (
            ORDER BY
              duration
          ) over (
            PARTITION by 
            -- <Next line is auto-generated> Partition group
story_hash, model_id, 
            execution_date
          ) duration_perc90_ms,
          percentile_cont(0.95) within GROUP (
            ORDER BY
              duration
          ) over (
            PARTITION by 
            -- <Next line is auto-generated> Partition group
story_hash, model_id, 
            execution_date
          ) duration_perc95_ms,
          percentile_cont(0.99) within GROUP (
            ORDER BY
              duration
          ) over (
            PARTITION by 
            -- <Next line is auto-generated> Partition group
story_hash, model_id, 
            execution_date
          ) duration_perc99_ms
        FROM
          :data_all
      )
    GROUP BY
      -- <Next line is auto-generated> All dimensions
story_hash, model_id, query_type, status, 
      execution_date

UNION
-- 14. story_hash, model_id, 'All' as query_type, status


    SELECT
      -- <Next line is auto-generated> All dimensions
story_hash, model_id, query_type, status, 
      execution_date,
      max(duration_perc50_ms) duration_perc50_ms,
      max(duration_perc90_ms) duration_perc90_ms,
      max(duration_perc95_ms) duration_perc95_ms,
      max(duration_perc99_ms) duration_perc99_ms,
      count(*) AS count
    FROM
      (
        SELECT
          -- <Next line is auto-generated> Select group
story_hash, model_id, 'All' as query_type, status, 
          execution_date,
          percentile_cont(0.5) within GROUP (
            ORDER BY
              duration
          ) over (
            PARTITION by 
            -- <Next line is auto-generated> Partition group
story_hash, model_id, status, 
            execution_date
          ) duration_perc50_ms,
          percentile_cont(0.90) within GROUP (
            ORDER BY
              duration
          ) over (
            PARTITION by 
            -- <Next line is auto-generated> Partition group
story_hash, model_id, status, 
            execution_date
          ) duration_perc90_ms,
          percentile_cont(0.95) within GROUP (
            ORDER BY
              duration
          ) over (
            PARTITION by 
            -- <Next line is auto-generated> Partition group
story_hash, model_id, status, 
            execution_date
          ) duration_perc95_ms,
          percentile_cont(0.99) within GROUP (
            ORDER BY
              duration
          ) over (
            PARTITION by 
            -- <Next line is auto-generated> Partition group
story_hash, model_id, status, 
            execution_date
          ) duration_perc99_ms
        FROM
          :data_all
      )
    GROUP BY
      -- <Next line is auto-generated> All dimensions
story_hash, model_id, query_type, status, 
      execution_date

UNION
-- 15. story_hash, model_id, query_type, 'All' as status


    SELECT
      -- <Next line is auto-generated> All dimensions
story_hash, model_id, query_type, status, 
      execution_date,
      max(duration_perc50_ms) duration_perc50_ms,
      max(duration_perc90_ms) duration_perc90_ms,
      max(duration_perc95_ms) duration_perc95_ms,
      max(duration_perc99_ms) duration_perc99_ms,
      count(*) AS count
    FROM
      (
        SELECT
          -- <Next line is auto-generated> Select group
story_hash, model_id, query_type, 'All' as status, 
          execution_date,
          percentile_cont(0.5) within GROUP (
            ORDER BY
              duration
          ) over (
            PARTITION by 
            -- <Next line is auto-generated> Partition group
story_hash, model_id, query_type, 
            execution_date
          ) duration_perc50_ms,
          percentile_cont(0.90) within GROUP (
            ORDER BY
              duration
          ) over (
            PARTITION by 
            -- <Next line is auto-generated> Partition group
story_hash, model_id, query_type, 
            execution_date
          ) duration_perc90_ms,
          percentile_cont(0.95) within GROUP (
            ORDER BY
              duration
          ) over (
            PARTITION by 
            -- <Next line is auto-generated> Partition group
story_hash, model_id, query_type, 
            execution_date
          ) duration_perc95_ms,
          percentile_cont(0.99) within GROUP (
            ORDER BY
              duration
          ) over (
            PARTITION by 
            -- <Next line is auto-generated> Partition group
story_hash, model_id, query_type, 
            execution_date
          ) duration_perc99_ms
        FROM
          :data_all
      )
    GROUP BY
      -- <Next line is auto-generated> All dimensions
story_hash, model_id, query_type, status, 
      execution_date

UNION
-- 16. story_hash, model_id, query_type, status


    SELECT
      -- <Next line is auto-generated> All dimensions
story_hash, model_id, query_type, status, 
      execution_date,
      max(duration_perc50_ms) duration_perc50_ms,
      max(duration_perc90_ms) duration_perc90_ms,
      max(duration_perc95_ms) duration_perc95_ms,
      max(duration_perc99_ms) duration_perc99_ms,
      count(*) AS count
    FROM
      (
        SELECT
          -- <Next line is auto-generated> Select group
story_hash, model_id, query_type, status, 
          execution_date,
          percentile_cont(0.5) within GROUP (
            ORDER BY
              duration
          ) over (
            PARTITION by 
            -- <Next line is auto-generated> Partition group
story_hash, model_id, query_type, status, 
            execution_date
          ) duration_perc50_ms,
          percentile_cont(0.90) within GROUP (
            ORDER BY
              duration
          ) over (
            PARTITION by 
            -- <Next line is auto-generated> Partition group
story_hash, model_id, query_type, status, 
            execution_date
          ) duration_perc90_ms,
          percentile_cont(0.95) within GROUP (
            ORDER BY
              duration
          ) over (
            PARTITION by 
            -- <Next line is auto-generated> Partition group
story_hash, model_id, query_type, status, 
            execution_date
          ) duration_perc95_ms,
          percentile_cont(0.99) within GROUP (
            ORDER BY
              duration
          ) over (
            PARTITION by 
            -- <Next line is auto-generated> Partition group
story_hash, model_id, query_type, status, 
            execution_date
          ) duration_perc99_ms
        FROM
          :data_all
      )
    GROUP BY
      -- <Next line is auto-generated> All dimensions
story_hash, model_id, query_type, status, 
      execution_date
;