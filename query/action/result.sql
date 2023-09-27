-- 1. 'All' as story_id, 'All' as is_optimized_view_mode, 


    SELECT
      -- <Next line is auto-generated> All dimensions
story_id, is_optimized_view_mode, 
      action_date,
      max(duration_perc50_ms) duration_perc50_ms,
      max(duration_perc90_ms) duration_perc90_ms,
      max(duration_perc95_ms) duration_perc95_ms,
      max(duration_perc99_ms) duration_perc99_ms,
      count(*) AS count
    FROM
      (
        SELECT
          -- <Next line is auto-generated> Select group
'All' as story_id, 'All' as is_optimized_view_mode, 
          action_date,
          percentile_cont(0.5) within GROUP (
            ORDER BY
              duration
          ) over (
            PARTITION by 
            -- <Next line is auto-generated> Partition group

            action_date
          ) duration_perc50_ms,
          percentile_cont(0.90) within GROUP (
            ORDER BY
              duration
          ) over (
            PARTITION by 
            -- <Next line is auto-generated> Partition group

            action_date
          ) duration_perc90_ms,
          percentile_cont(0.95) within GROUP (
            ORDER BY
              duration
          ) over (
            PARTITION by 
            -- <Next line is auto-generated> Partition group

            action_date
          ) duration_perc95_ms,
          percentile_cont(0.99) within GROUP (
            ORDER BY
              duration
          ) over (
            PARTITION by 
            -- <Next line is auto-generated> Partition group

            action_date
          ) duration_perc99_ms
        FROM
          :data_all
      )
    GROUP BY
      -- <Next line is auto-generated> All dimensions
story_id, is_optimized_view_mode, 
      action_date

UNION
-- 2. 'All' as story_id, is_optimized_view_mode, 


    SELECT
      -- <Next line is auto-generated> All dimensions
story_id, is_optimized_view_mode, 
      action_date,
      max(duration_perc50_ms) duration_perc50_ms,
      max(duration_perc90_ms) duration_perc90_ms,
      max(duration_perc95_ms) duration_perc95_ms,
      max(duration_perc99_ms) duration_perc99_ms,
      count(*) AS count
    FROM
      (
        SELECT
          -- <Next line is auto-generated> Select group
'All' as story_id, is_optimized_view_mode, 
          action_date,
          percentile_cont(0.5) within GROUP (
            ORDER BY
              duration
          ) over (
            PARTITION by 
            -- <Next line is auto-generated> Partition group
is_optimized_view_mode, 
            action_date
          ) duration_perc50_ms,
          percentile_cont(0.90) within GROUP (
            ORDER BY
              duration
          ) over (
            PARTITION by 
            -- <Next line is auto-generated> Partition group
is_optimized_view_mode, 
            action_date
          ) duration_perc90_ms,
          percentile_cont(0.95) within GROUP (
            ORDER BY
              duration
          ) over (
            PARTITION by 
            -- <Next line is auto-generated> Partition group
is_optimized_view_mode, 
            action_date
          ) duration_perc95_ms,
          percentile_cont(0.99) within GROUP (
            ORDER BY
              duration
          ) over (
            PARTITION by 
            -- <Next line is auto-generated> Partition group
is_optimized_view_mode, 
            action_date
          ) duration_perc99_ms
        FROM
          :data_all
      )
    GROUP BY
      -- <Next line is auto-generated> All dimensions
story_id, is_optimized_view_mode, 
      action_date

UNION
-- 3. story_id, 'All' as is_optimized_view_mode, 


    SELECT
      -- <Next line is auto-generated> All dimensions
story_id, is_optimized_view_mode, 
      action_date,
      max(duration_perc50_ms) duration_perc50_ms,
      max(duration_perc90_ms) duration_perc90_ms,
      max(duration_perc95_ms) duration_perc95_ms,
      max(duration_perc99_ms) duration_perc99_ms,
      count(*) AS count
    FROM
      (
        SELECT
          -- <Next line is auto-generated> Select group
story_id, 'All' as is_optimized_view_mode, 
          action_date,
          percentile_cont(0.5) within GROUP (
            ORDER BY
              duration
          ) over (
            PARTITION by 
            -- <Next line is auto-generated> Partition group
story_id, 
            action_date
          ) duration_perc50_ms,
          percentile_cont(0.90) within GROUP (
            ORDER BY
              duration
          ) over (
            PARTITION by 
            -- <Next line is auto-generated> Partition group
story_id, 
            action_date
          ) duration_perc90_ms,
          percentile_cont(0.95) within GROUP (
            ORDER BY
              duration
          ) over (
            PARTITION by 
            -- <Next line is auto-generated> Partition group
story_id, 
            action_date
          ) duration_perc95_ms,
          percentile_cont(0.99) within GROUP (
            ORDER BY
              duration
          ) over (
            PARTITION by 
            -- <Next line is auto-generated> Partition group
story_id, 
            action_date
          ) duration_perc99_ms
        FROM
          :data_all
      )
    GROUP BY
      -- <Next line is auto-generated> All dimensions
story_id, is_optimized_view_mode, 
      action_date

UNION
-- 4. story_id, is_optimized_view_mode, 


    SELECT
      -- <Next line is auto-generated> All dimensions
story_id, is_optimized_view_mode, 
      action_date,
      max(duration_perc50_ms) duration_perc50_ms,
      max(duration_perc90_ms) duration_perc90_ms,
      max(duration_perc95_ms) duration_perc95_ms,
      max(duration_perc99_ms) duration_perc99_ms,
      count(*) AS count
    FROM
      (
        SELECT
          -- <Next line is auto-generated> Select group
story_id, is_optimized_view_mode, 
          action_date,
          percentile_cont(0.5) within GROUP (
            ORDER BY
              duration
          ) over (
            PARTITION by 
            -- <Next line is auto-generated> Partition group
story_id, is_optimized_view_mode, 
            action_date
          ) duration_perc50_ms,
          percentile_cont(0.90) within GROUP (
            ORDER BY
              duration
          ) over (
            PARTITION by 
            -- <Next line is auto-generated> Partition group
story_id, is_optimized_view_mode, 
            action_date
          ) duration_perc90_ms,
          percentile_cont(0.95) within GROUP (
            ORDER BY
              duration
          ) over (
            PARTITION by 
            -- <Next line is auto-generated> Partition group
story_id, is_optimized_view_mode, 
            action_date
          ) duration_perc95_ms,
          percentile_cont(0.99) within GROUP (
            ORDER BY
              duration
          ) over (
            PARTITION by 
            -- <Next line is auto-generated> Partition group
story_id, is_optimized_view_mode, 
            action_date
          ) duration_perc99_ms
        FROM
          :data_all
      )
    GROUP BY
      -- <Next line is auto-generated> All dimensions
story_id, is_optimized_view_mode, 
      action_date
;