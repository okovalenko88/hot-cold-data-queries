-- 1. 'All' as story_id, 'All' as model_id, 'All' as query_type, 

SELECT
  success.*,
  error.count_error
FROM
  (
    SELECT
      -- <Next line is auto-generated> All dimensions
story_id, model_id, query_type, 
      execution_date,
      max(duration_success_perc50_ms) duration_success_perc50_ms,
      max(duration_success_perc90_ms) duration_success_perc90_ms,
      max(duration_success_perc95_ms) duration_success_perc95_ms,
      max(duration_success_perc99_ms) duration_success_perc99_ms,
      count(*) AS count_success
    FROM
      (
        SELECT
          -- <Next line is auto-generated> Select group
'All' as story_id, 'All' as model_id, 'All' as query_type, 
          execution_date,
          percentile_cont(0.5) within GROUP (
            ORDER BY
              duration_success
          ) over (
            PARTITION by 
            -- <Next line is auto-generated> Partition group

            execution_date
          ) duration_success_perc50_ms,
          percentile_cont(0.90) within GROUP (
            ORDER BY
              duration_success
          ) over (
            PARTITION by 
            -- <Next line is auto-generated> Partition group

            execution_date
          ) duration_success_perc90_ms,
          percentile_cont(0.95) within GROUP (
            ORDER BY
              duration_success
          ) over (
            PARTITION by 
            -- <Next line is auto-generated> Partition group

            execution_date
          ) duration_success_perc95_ms,
          percentile_cont(0.99) within GROUP (
            ORDER BY
              duration_success
          ) over (
            PARTITION by 
            -- <Next line is auto-generated> Partition group

            execution_date
          ) duration_success_perc99_ms
        FROM
          :success_data_all
      )
    GROUP BY
      -- <Next line is auto-generated> All dimensions
story_id, model_id, query_type, 
      execution_date
  ) AS success
  FULL OUTER JOIN (
    SELECT
      -- <Next line is auto-generated> All dimensions
story_id, model_id, query_type, 
      execution_date,
      count(*) AS count_error
    FROM
      (
        SELECT
          -- <Next line is auto-generated> Select group
'All' as story_id, 'All' as model_id, 'All' as query_type, 
          execution_date
        FROM
          :error_data_all
      )
    GROUP BY
      -- <Next line is auto-generated> All dimensions
story_id, model_id, query_type, 
      execution_date
  ) error 
  ON success.execution_date = error.execution_date
  AND success.model_id = error.model_id
  AND success.query_type = error.query_type

-- delete before commit
--order by execution_date  

UNION
-- 2. 'All' as story_id, 'All' as model_id, query_type, 

SELECT
  success.*,
  error.count_error
FROM
  (
    SELECT
      -- <Next line is auto-generated> All dimensions
story_id, model_id, query_type, 
      execution_date,
      max(duration_success_perc50_ms) duration_success_perc50_ms,
      max(duration_success_perc90_ms) duration_success_perc90_ms,
      max(duration_success_perc95_ms) duration_success_perc95_ms,
      max(duration_success_perc99_ms) duration_success_perc99_ms,
      count(*) AS count_success
    FROM
      (
        SELECT
          -- <Next line is auto-generated> Select group
'All' as story_id, 'All' as model_id, query_type, 
          execution_date,
          percentile_cont(0.5) within GROUP (
            ORDER BY
              duration_success
          ) over (
            PARTITION by 
            -- <Next line is auto-generated> Partition group
query_type, 
            execution_date
          ) duration_success_perc50_ms,
          percentile_cont(0.90) within GROUP (
            ORDER BY
              duration_success
          ) over (
            PARTITION by 
            -- <Next line is auto-generated> Partition group
query_type, 
            execution_date
          ) duration_success_perc90_ms,
          percentile_cont(0.95) within GROUP (
            ORDER BY
              duration_success
          ) over (
            PARTITION by 
            -- <Next line is auto-generated> Partition group
query_type, 
            execution_date
          ) duration_success_perc95_ms,
          percentile_cont(0.99) within GROUP (
            ORDER BY
              duration_success
          ) over (
            PARTITION by 
            -- <Next line is auto-generated> Partition group
query_type, 
            execution_date
          ) duration_success_perc99_ms
        FROM
          :success_data_all
      )
    GROUP BY
      -- <Next line is auto-generated> All dimensions
story_id, model_id, query_type, 
      execution_date
  ) AS success
  FULL OUTER JOIN (
    SELECT
      -- <Next line is auto-generated> All dimensions
story_id, model_id, query_type, 
      execution_date,
      count(*) AS count_error
    FROM
      (
        SELECT
          -- <Next line is auto-generated> Select group
'All' as story_id, 'All' as model_id, query_type, 
          execution_date
        FROM
          :error_data_all
      )
    GROUP BY
      -- <Next line is auto-generated> All dimensions
story_id, model_id, query_type, 
      execution_date
  ) error 
  ON success.execution_date = error.execution_date
  AND success.model_id = error.model_id
  AND success.query_type = error.query_type

-- delete before commit
--order by execution_date  

UNION
-- 3. 'All' as story_id, model_id, 'All' as query_type, 

SELECT
  success.*,
  error.count_error
FROM
  (
    SELECT
      -- <Next line is auto-generated> All dimensions
story_id, model_id, query_type, 
      execution_date,
      max(duration_success_perc50_ms) duration_success_perc50_ms,
      max(duration_success_perc90_ms) duration_success_perc90_ms,
      max(duration_success_perc95_ms) duration_success_perc95_ms,
      max(duration_success_perc99_ms) duration_success_perc99_ms,
      count(*) AS count_success
    FROM
      (
        SELECT
          -- <Next line is auto-generated> Select group
'All' as story_id, model_id, 'All' as query_type, 
          execution_date,
          percentile_cont(0.5) within GROUP (
            ORDER BY
              duration_success
          ) over (
            PARTITION by 
            -- <Next line is auto-generated> Partition group
model_id, 
            execution_date
          ) duration_success_perc50_ms,
          percentile_cont(0.90) within GROUP (
            ORDER BY
              duration_success
          ) over (
            PARTITION by 
            -- <Next line is auto-generated> Partition group
model_id, 
            execution_date
          ) duration_success_perc90_ms,
          percentile_cont(0.95) within GROUP (
            ORDER BY
              duration_success
          ) over (
            PARTITION by 
            -- <Next line is auto-generated> Partition group
model_id, 
            execution_date
          ) duration_success_perc95_ms,
          percentile_cont(0.99) within GROUP (
            ORDER BY
              duration_success
          ) over (
            PARTITION by 
            -- <Next line is auto-generated> Partition group
model_id, 
            execution_date
          ) duration_success_perc99_ms
        FROM
          :success_data_all
      )
    GROUP BY
      -- <Next line is auto-generated> All dimensions
story_id, model_id, query_type, 
      execution_date
  ) AS success
  FULL OUTER JOIN (
    SELECT
      -- <Next line is auto-generated> All dimensions
story_id, model_id, query_type, 
      execution_date,
      count(*) AS count_error
    FROM
      (
        SELECT
          -- <Next line is auto-generated> Select group
'All' as story_id, model_id, 'All' as query_type, 
          execution_date
        FROM
          :error_data_all
      )
    GROUP BY
      -- <Next line is auto-generated> All dimensions
story_id, model_id, query_type, 
      execution_date
  ) error 
  ON success.execution_date = error.execution_date
  AND success.model_id = error.model_id
  AND success.query_type = error.query_type

-- delete before commit
--order by execution_date  

UNION
-- 4. 'All' as story_id, model_id, query_type, 

SELECT
  success.*,
  error.count_error
FROM
  (
    SELECT
      -- <Next line is auto-generated> All dimensions
story_id, model_id, query_type, 
      execution_date,
      max(duration_success_perc50_ms) duration_success_perc50_ms,
      max(duration_success_perc90_ms) duration_success_perc90_ms,
      max(duration_success_perc95_ms) duration_success_perc95_ms,
      max(duration_success_perc99_ms) duration_success_perc99_ms,
      count(*) AS count_success
    FROM
      (
        SELECT
          -- <Next line is auto-generated> Select group
'All' as story_id, model_id, query_type, 
          execution_date,
          percentile_cont(0.5) within GROUP (
            ORDER BY
              duration_success
          ) over (
            PARTITION by 
            -- <Next line is auto-generated> Partition group
model_id, query_type, 
            execution_date
          ) duration_success_perc50_ms,
          percentile_cont(0.90) within GROUP (
            ORDER BY
              duration_success
          ) over (
            PARTITION by 
            -- <Next line is auto-generated> Partition group
model_id, query_type, 
            execution_date
          ) duration_success_perc90_ms,
          percentile_cont(0.95) within GROUP (
            ORDER BY
              duration_success
          ) over (
            PARTITION by 
            -- <Next line is auto-generated> Partition group
model_id, query_type, 
            execution_date
          ) duration_success_perc95_ms,
          percentile_cont(0.99) within GROUP (
            ORDER BY
              duration_success
          ) over (
            PARTITION by 
            -- <Next line is auto-generated> Partition group
model_id, query_type, 
            execution_date
          ) duration_success_perc99_ms
        FROM
          :success_data_all
      )
    GROUP BY
      -- <Next line is auto-generated> All dimensions
story_id, model_id, query_type, 
      execution_date
  ) AS success
  FULL OUTER JOIN (
    SELECT
      -- <Next line is auto-generated> All dimensions
story_id, model_id, query_type, 
      execution_date,
      count(*) AS count_error
    FROM
      (
        SELECT
          -- <Next line is auto-generated> Select group
'All' as story_id, model_id, query_type, 
          execution_date
        FROM
          :error_data_all
      )
    GROUP BY
      -- <Next line is auto-generated> All dimensions
story_id, model_id, query_type, 
      execution_date
  ) error 
  ON success.execution_date = error.execution_date
  AND success.model_id = error.model_id
  AND success.query_type = error.query_type

-- delete before commit
--order by execution_date  

UNION
-- 5. story_id, 'All' as model_id, 'All' as query_type, 

SELECT
  success.*,
  error.count_error
FROM
  (
    SELECT
      -- <Next line is auto-generated> All dimensions
story_id, model_id, query_type, 
      execution_date,
      max(duration_success_perc50_ms) duration_success_perc50_ms,
      max(duration_success_perc90_ms) duration_success_perc90_ms,
      max(duration_success_perc95_ms) duration_success_perc95_ms,
      max(duration_success_perc99_ms) duration_success_perc99_ms,
      count(*) AS count_success
    FROM
      (
        SELECT
          -- <Next line is auto-generated> Select group
story_id, 'All' as model_id, 'All' as query_type, 
          execution_date,
          percentile_cont(0.5) within GROUP (
            ORDER BY
              duration_success
          ) over (
            PARTITION by 
            -- <Next line is auto-generated> Partition group
story_id, 
            execution_date
          ) duration_success_perc50_ms,
          percentile_cont(0.90) within GROUP (
            ORDER BY
              duration_success
          ) over (
            PARTITION by 
            -- <Next line is auto-generated> Partition group
story_id, 
            execution_date
          ) duration_success_perc90_ms,
          percentile_cont(0.95) within GROUP (
            ORDER BY
              duration_success
          ) over (
            PARTITION by 
            -- <Next line is auto-generated> Partition group
story_id, 
            execution_date
          ) duration_success_perc95_ms,
          percentile_cont(0.99) within GROUP (
            ORDER BY
              duration_success
          ) over (
            PARTITION by 
            -- <Next line is auto-generated> Partition group
story_id, 
            execution_date
          ) duration_success_perc99_ms
        FROM
          :success_data_all
      )
    GROUP BY
      -- <Next line is auto-generated> All dimensions
story_id, model_id, query_type, 
      execution_date
  ) AS success
  FULL OUTER JOIN (
    SELECT
      -- <Next line is auto-generated> All dimensions
story_id, model_id, query_type, 
      execution_date,
      count(*) AS count_error
    FROM
      (
        SELECT
          -- <Next line is auto-generated> Select group
story_id, 'All' as model_id, 'All' as query_type, 
          execution_date
        FROM
          :error_data_all
      )
    GROUP BY
      -- <Next line is auto-generated> All dimensions
story_id, model_id, query_type, 
      execution_date
  ) error 
  ON success.execution_date = error.execution_date
  AND success.model_id = error.model_id
  AND success.query_type = error.query_type

-- delete before commit
--order by execution_date  

UNION
-- 6. story_id, 'All' as model_id, query_type, 

SELECT
  success.*,
  error.count_error
FROM
  (
    SELECT
      -- <Next line is auto-generated> All dimensions
story_id, model_id, query_type, 
      execution_date,
      max(duration_success_perc50_ms) duration_success_perc50_ms,
      max(duration_success_perc90_ms) duration_success_perc90_ms,
      max(duration_success_perc95_ms) duration_success_perc95_ms,
      max(duration_success_perc99_ms) duration_success_perc99_ms,
      count(*) AS count_success
    FROM
      (
        SELECT
          -- <Next line is auto-generated> Select group
story_id, 'All' as model_id, query_type, 
          execution_date,
          percentile_cont(0.5) within GROUP (
            ORDER BY
              duration_success
          ) over (
            PARTITION by 
            -- <Next line is auto-generated> Partition group
story_id, query_type, 
            execution_date
          ) duration_success_perc50_ms,
          percentile_cont(0.90) within GROUP (
            ORDER BY
              duration_success
          ) over (
            PARTITION by 
            -- <Next line is auto-generated> Partition group
story_id, query_type, 
            execution_date
          ) duration_success_perc90_ms,
          percentile_cont(0.95) within GROUP (
            ORDER BY
              duration_success
          ) over (
            PARTITION by 
            -- <Next line is auto-generated> Partition group
story_id, query_type, 
            execution_date
          ) duration_success_perc95_ms,
          percentile_cont(0.99) within GROUP (
            ORDER BY
              duration_success
          ) over (
            PARTITION by 
            -- <Next line is auto-generated> Partition group
story_id, query_type, 
            execution_date
          ) duration_success_perc99_ms
        FROM
          :success_data_all
      )
    GROUP BY
      -- <Next line is auto-generated> All dimensions
story_id, model_id, query_type, 
      execution_date
  ) AS success
  FULL OUTER JOIN (
    SELECT
      -- <Next line is auto-generated> All dimensions
story_id, model_id, query_type, 
      execution_date,
      count(*) AS count_error
    FROM
      (
        SELECT
          -- <Next line is auto-generated> Select group
story_id, 'All' as model_id, query_type, 
          execution_date
        FROM
          :error_data_all
      )
    GROUP BY
      -- <Next line is auto-generated> All dimensions
story_id, model_id, query_type, 
      execution_date
  ) error 
  ON success.execution_date = error.execution_date
  AND success.model_id = error.model_id
  AND success.query_type = error.query_type

-- delete before commit
--order by execution_date  

UNION
-- 7. story_id, model_id, 'All' as query_type, 

SELECT
  success.*,
  error.count_error
FROM
  (
    SELECT
      -- <Next line is auto-generated> All dimensions
story_id, model_id, query_type, 
      execution_date,
      max(duration_success_perc50_ms) duration_success_perc50_ms,
      max(duration_success_perc90_ms) duration_success_perc90_ms,
      max(duration_success_perc95_ms) duration_success_perc95_ms,
      max(duration_success_perc99_ms) duration_success_perc99_ms,
      count(*) AS count_success
    FROM
      (
        SELECT
          -- <Next line is auto-generated> Select group
story_id, model_id, 'All' as query_type, 
          execution_date,
          percentile_cont(0.5) within GROUP (
            ORDER BY
              duration_success
          ) over (
            PARTITION by 
            -- <Next line is auto-generated> Partition group
story_id, model_id, 
            execution_date
          ) duration_success_perc50_ms,
          percentile_cont(0.90) within GROUP (
            ORDER BY
              duration_success
          ) over (
            PARTITION by 
            -- <Next line is auto-generated> Partition group
story_id, model_id, 
            execution_date
          ) duration_success_perc90_ms,
          percentile_cont(0.95) within GROUP (
            ORDER BY
              duration_success
          ) over (
            PARTITION by 
            -- <Next line is auto-generated> Partition group
story_id, model_id, 
            execution_date
          ) duration_success_perc95_ms,
          percentile_cont(0.99) within GROUP (
            ORDER BY
              duration_success
          ) over (
            PARTITION by 
            -- <Next line is auto-generated> Partition group
story_id, model_id, 
            execution_date
          ) duration_success_perc99_ms
        FROM
          :success_data_all
      )
    GROUP BY
      -- <Next line is auto-generated> All dimensions
story_id, model_id, query_type, 
      execution_date
  ) AS success
  FULL OUTER JOIN (
    SELECT
      -- <Next line is auto-generated> All dimensions
story_id, model_id, query_type, 
      execution_date,
      count(*) AS count_error
    FROM
      (
        SELECT
          -- <Next line is auto-generated> Select group
story_id, model_id, 'All' as query_type, 
          execution_date
        FROM
          :error_data_all
      )
    GROUP BY
      -- <Next line is auto-generated> All dimensions
story_id, model_id, query_type, 
      execution_date
  ) error 
  ON success.execution_date = error.execution_date
  AND success.model_id = error.model_id
  AND success.query_type = error.query_type

-- delete before commit
--order by execution_date  

UNION
-- 8. story_id, model_id, query_type, 

SELECT
  success.*,
  error.count_error
FROM
  (
    SELECT
      -- <Next line is auto-generated> All dimensions
story_id, model_id, query_type, 
      execution_date,
      max(duration_success_perc50_ms) duration_success_perc50_ms,
      max(duration_success_perc90_ms) duration_success_perc90_ms,
      max(duration_success_perc95_ms) duration_success_perc95_ms,
      max(duration_success_perc99_ms) duration_success_perc99_ms,
      count(*) AS count_success
    FROM
      (
        SELECT
          -- <Next line is auto-generated> Select group
story_id, model_id, query_type, 
          execution_date,
          percentile_cont(0.5) within GROUP (
            ORDER BY
              duration_success
          ) over (
            PARTITION by 
            -- <Next line is auto-generated> Partition group
story_id, model_id, query_type, 
            execution_date
          ) duration_success_perc50_ms,
          percentile_cont(0.90) within GROUP (
            ORDER BY
              duration_success
          ) over (
            PARTITION by 
            -- <Next line is auto-generated> Partition group
story_id, model_id, query_type, 
            execution_date
          ) duration_success_perc90_ms,
          percentile_cont(0.95) within GROUP (
            ORDER BY
              duration_success
          ) over (
            PARTITION by 
            -- <Next line is auto-generated> Partition group
story_id, model_id, query_type, 
            execution_date
          ) duration_success_perc95_ms,
          percentile_cont(0.99) within GROUP (
            ORDER BY
              duration_success
          ) over (
            PARTITION by 
            -- <Next line is auto-generated> Partition group
story_id, model_id, query_type, 
            execution_date
          ) duration_success_perc99_ms
        FROM
          :success_data_all
      )
    GROUP BY
      -- <Next line is auto-generated> All dimensions
story_id, model_id, query_type, 
      execution_date
  ) AS success
  FULL OUTER JOIN (
    SELECT
      -- <Next line is auto-generated> All dimensions
story_id, model_id, query_type, 
      execution_date,
      count(*) AS count_error
    FROM
      (
        SELECT
          -- <Next line is auto-generated> Select group
story_id, model_id, query_type, 
          execution_date
        FROM
          :error_data_all
      )
    GROUP BY
      -- <Next line is auto-generated> All dimensions
story_id, model_id, query_type, 
      execution_date
  ) error 
  ON success.execution_date = error.execution_date
  AND success.model_id = error.model_id
  AND success.query_type = error.query_type

-- delete before commit
--order by execution_date  
;