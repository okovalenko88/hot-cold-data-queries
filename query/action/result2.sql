------ ALL ------

aggr_data_actiongroup_all = 
-- 1. 'All' as story_id, 99 as is_optimized_view_mode

SELECT
  -- <Next line is auto-generated> All dimensions
			story_id, is_optimized_view_mode, 
  action_name,
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
			'All' as story_id, 99 as is_optimized_view_mode, 
      action_name,
      action_date,
      case 
        when action_name = 'Log On' then 'Log On'
        when action_name in ('Open Story', 'Open Story from URL') then 'Open Story'
        when action_name in ('Open Application', 'Open Application from URL') then 'Open Application'
        when action_name in ('Open Application Runtime', 'Open Application Runtime from URL') then 'Open Application Runtime'
        when action_name in ('Open Presentation', 'Open Presentation from URL') then 'Open Presentation'
      end as action_name,
      percentile_cont(0.5) within GROUP (
        ORDER BY
          action_duration
      ) over (
        PARTITION by 
        -- <Next line is auto-generated> Partition group
			
        action_date
      ) duration_perc50_ms,
      percentile_cont(0.90) within GROUP (
        ORDER BY
          action_duration
      ) over (
        PARTITION by 
        -- <Next line is auto-generated> Partition group
			
        action_name,
        action_date
      ) duration_perc90_ms,
      percentile_cont(0.95) within GROUP (
        ORDER BY
          action_duration
      ) over (
        PARTITION by 
        -- <Next line is auto-generated> Partition group
			
        action_name,
        action_date
      ) duration_perc95_ms,
      percentile_cont(0.99) within GROUP (
        ORDER BY
          action_duration
      ) over (
        PARTITION by 
        -- <Next line is auto-generated> Partition group
			
        action_name,
        action_date
      ) duration_perc99_ms
    FROM
      :data_actiongroup_all
  )
GROUP BY
  -- <Next line is auto-generated> All dimensions
			story_id, is_optimized_view_mode, 
  action_name,
  action_date

UNION
-- 2. 'All' as story_id, is_optimized_view_mode

SELECT
  -- <Next line is auto-generated> All dimensions
			story_id, is_optimized_view_mode, 
  action_name,
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
      action_name,
      action_date,
      case 
        when action_name = 'Log On' then 'Log On'
        when action_name in ('Open Story', 'Open Story from URL') then 'Open Story'
        when action_name in ('Open Application', 'Open Application from URL') then 'Open Application'
        when action_name in ('Open Application Runtime', 'Open Application Runtime from URL') then 'Open Application Runtime'
        when action_name in ('Open Presentation', 'Open Presentation from URL') then 'Open Presentation'
      end as action_name,
      percentile_cont(0.5) within GROUP (
        ORDER BY
          action_duration
      ) over (
        PARTITION by 
        -- <Next line is auto-generated> Partition group
			is_optimized_view_mode, 
        action_date
      ) duration_perc50_ms,
      percentile_cont(0.90) within GROUP (
        ORDER BY
          action_duration
      ) over (
        PARTITION by 
        -- <Next line is auto-generated> Partition group
			is_optimized_view_mode, 
        action_name,
        action_date
      ) duration_perc90_ms,
      percentile_cont(0.95) within GROUP (
        ORDER BY
          action_duration
      ) over (
        PARTITION by 
        -- <Next line is auto-generated> Partition group
			is_optimized_view_mode, 
        action_name,
        action_date
      ) duration_perc95_ms,
      percentile_cont(0.99) within GROUP (
        ORDER BY
          action_duration
      ) over (
        PARTITION by 
        -- <Next line is auto-generated> Partition group
			is_optimized_view_mode, 
        action_name,
        action_date
      ) duration_perc99_ms
    FROM
      :data_actiongroup_all
  )
GROUP BY
  -- <Next line is auto-generated> All dimensions
			story_id, is_optimized_view_mode, 
  action_name,
  action_date

UNION
-- 3. story_id, 99 as is_optimized_view_mode

SELECT
  -- <Next line is auto-generated> All dimensions
			story_id, is_optimized_view_mode, 
  action_name,
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
			story_id, 99 as is_optimized_view_mode, 
      action_name,
      action_date,
      case 
        when action_name = 'Log On' then 'Log On'
        when action_name in ('Open Story', 'Open Story from URL') then 'Open Story'
        when action_name in ('Open Application', 'Open Application from URL') then 'Open Application'
        when action_name in ('Open Application Runtime', 'Open Application Runtime from URL') then 'Open Application Runtime'
        when action_name in ('Open Presentation', 'Open Presentation from URL') then 'Open Presentation'
      end as action_name,
      percentile_cont(0.5) within GROUP (
        ORDER BY
          action_duration
      ) over (
        PARTITION by 
        -- <Next line is auto-generated> Partition group
			story_id, 
        action_date
      ) duration_perc50_ms,
      percentile_cont(0.90) within GROUP (
        ORDER BY
          action_duration
      ) over (
        PARTITION by 
        -- <Next line is auto-generated> Partition group
			story_id, 
        action_name,
        action_date
      ) duration_perc90_ms,
      percentile_cont(0.95) within GROUP (
        ORDER BY
          action_duration
      ) over (
        PARTITION by 
        -- <Next line is auto-generated> Partition group
			story_id, 
        action_name,
        action_date
      ) duration_perc95_ms,
      percentile_cont(0.99) within GROUP (
        ORDER BY
          action_duration
      ) over (
        PARTITION by 
        -- <Next line is auto-generated> Partition group
			story_id, 
        action_name,
        action_date
      ) duration_perc99_ms
    FROM
      :data_actiongroup_all
  )
GROUP BY
  -- <Next line is auto-generated> All dimensions
			story_id, is_optimized_view_mode, 
  action_name,
  action_date

UNION
-- 4. story_id, is_optimized_view_mode

SELECT
  -- <Next line is auto-generated> All dimensions
			story_id, is_optimized_view_mode, 
  action_name,
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
      action_name,
      action_date,
      case 
        when action_name = 'Log On' then 'Log On'
        when action_name in ('Open Story', 'Open Story from URL') then 'Open Story'
        when action_name in ('Open Application', 'Open Application from URL') then 'Open Application'
        when action_name in ('Open Application Runtime', 'Open Application Runtime from URL') then 'Open Application Runtime'
        when action_name in ('Open Presentation', 'Open Presentation from URL') then 'Open Presentation'
      end as action_name,
      percentile_cont(0.5) within GROUP (
        ORDER BY
          action_duration
      ) over (
        PARTITION by 
        -- <Next line is auto-generated> Partition group
			story_id, is_optimized_view_mode, 
        action_date
      ) duration_perc50_ms,
      percentile_cont(0.90) within GROUP (
        ORDER BY
          action_duration
      ) over (
        PARTITION by 
        -- <Next line is auto-generated> Partition group
			story_id, is_optimized_view_mode, 
        action_name,
        action_date
      ) duration_perc90_ms,
      percentile_cont(0.95) within GROUP (
        ORDER BY
          action_duration
      ) over (
        PARTITION by 
        -- <Next line is auto-generated> Partition group
			story_id, is_optimized_view_mode, 
        action_name,
        action_date
      ) duration_perc95_ms,
      percentile_cont(0.99) within GROUP (
        ORDER BY
          action_duration
      ) over (
        PARTITION by 
        -- <Next line is auto-generated> Partition group
			story_id, is_optimized_view_mode, 
        action_name,
        action_date
      ) duration_perc99_ms
    FROM
      :data_actiongroup_all
  )
GROUP BY
  -- <Next line is auto-generated> All dimensions
			story_id, is_optimized_view_mode, 
  action_name,
  action_date;

------ YESTERDAY ------

aggr_data_actiongroup_yesterday = 
-- 1. 'All' as story_id, 99 as is_optimized_view_mode

SELECT
  -- <Next line is auto-generated> All dimensions
			story_id, is_optimized_view_mode, 
  action_name,
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
			'All' as story_id, 99 as is_optimized_view_mode, 
      action_name,
      action_date,
      case 
        when action_name = 'Log On' then 'Log On'
        when action_name in ('Open Story', 'Open Story from URL') then 'Open Story'
        when action_name in ('Open Application', 'Open Application from URL') then 'Open Application'
        when action_name in ('Open Application Runtime', 'Open Application Runtime from URL') then 'Open Application Runtime'
        when action_name in ('Open Presentation', 'Open Presentation from URL') then 'Open Presentation'
      end as action_name,
      percentile_cont(0.5) within GROUP (
        ORDER BY
          action_duration
      ) over (
        PARTITION by 
        -- <Next line is auto-generated> Partition group
			
        action_date
      ) duration_perc50_ms,
      percentile_cont(0.90) within GROUP (
        ORDER BY
          action_duration
      ) over (
        PARTITION by 
        -- <Next line is auto-generated> Partition group
			
        action_name,
        action_date
      ) duration_perc90_ms,
      percentile_cont(0.95) within GROUP (
        ORDER BY
          action_duration
      ) over (
        PARTITION by 
        -- <Next line is auto-generated> Partition group
			
        action_name,
        action_date
      ) duration_perc95_ms,
      percentile_cont(0.99) within GROUP (
        ORDER BY
          action_duration
      ) over (
        PARTITION by 
        -- <Next line is auto-generated> Partition group
			
        action_name,
        action_date
      ) duration_perc99_ms
    FROM
      :data_actiongroup_yesterday
  )
GROUP BY
  -- <Next line is auto-generated> All dimensions
			story_id, is_optimized_view_mode, 
  action_name,
  action_date

UNION
-- 2. 'All' as story_id, is_optimized_view_mode

SELECT
  -- <Next line is auto-generated> All dimensions
			story_id, is_optimized_view_mode, 
  action_name,
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
      action_name,
      action_date,
      case 
        when action_name = 'Log On' then 'Log On'
        when action_name in ('Open Story', 'Open Story from URL') then 'Open Story'
        when action_name in ('Open Application', 'Open Application from URL') then 'Open Application'
        when action_name in ('Open Application Runtime', 'Open Application Runtime from URL') then 'Open Application Runtime'
        when action_name in ('Open Presentation', 'Open Presentation from URL') then 'Open Presentation'
      end as action_name,
      percentile_cont(0.5) within GROUP (
        ORDER BY
          action_duration
      ) over (
        PARTITION by 
        -- <Next line is auto-generated> Partition group
			is_optimized_view_mode, 
        action_date
      ) duration_perc50_ms,
      percentile_cont(0.90) within GROUP (
        ORDER BY
          action_duration
      ) over (
        PARTITION by 
        -- <Next line is auto-generated> Partition group
			is_optimized_view_mode, 
        action_name,
        action_date
      ) duration_perc90_ms,
      percentile_cont(0.95) within GROUP (
        ORDER BY
          action_duration
      ) over (
        PARTITION by 
        -- <Next line is auto-generated> Partition group
			is_optimized_view_mode, 
        action_name,
        action_date
      ) duration_perc95_ms,
      percentile_cont(0.99) within GROUP (
        ORDER BY
          action_duration
      ) over (
        PARTITION by 
        -- <Next line is auto-generated> Partition group
			is_optimized_view_mode, 
        action_name,
        action_date
      ) duration_perc99_ms
    FROM
      :data_actiongroup_yesterday
  )
GROUP BY
  -- <Next line is auto-generated> All dimensions
			story_id, is_optimized_view_mode, 
  action_name,
  action_date

UNION
-- 3. story_id, 99 as is_optimized_view_mode

SELECT
  -- <Next line is auto-generated> All dimensions
			story_id, is_optimized_view_mode, 
  action_name,
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
			story_id, 99 as is_optimized_view_mode, 
      action_name,
      action_date,
      case 
        when action_name = 'Log On' then 'Log On'
        when action_name in ('Open Story', 'Open Story from URL') then 'Open Story'
        when action_name in ('Open Application', 'Open Application from URL') then 'Open Application'
        when action_name in ('Open Application Runtime', 'Open Application Runtime from URL') then 'Open Application Runtime'
        when action_name in ('Open Presentation', 'Open Presentation from URL') then 'Open Presentation'
      end as action_name,
      percentile_cont(0.5) within GROUP (
        ORDER BY
          action_duration
      ) over (
        PARTITION by 
        -- <Next line is auto-generated> Partition group
			story_id, 
        action_date
      ) duration_perc50_ms,
      percentile_cont(0.90) within GROUP (
        ORDER BY
          action_duration
      ) over (
        PARTITION by 
        -- <Next line is auto-generated> Partition group
			story_id, 
        action_name,
        action_date
      ) duration_perc90_ms,
      percentile_cont(0.95) within GROUP (
        ORDER BY
          action_duration
      ) over (
        PARTITION by 
        -- <Next line is auto-generated> Partition group
			story_id, 
        action_name,
        action_date
      ) duration_perc95_ms,
      percentile_cont(0.99) within GROUP (
        ORDER BY
          action_duration
      ) over (
        PARTITION by 
        -- <Next line is auto-generated> Partition group
			story_id, 
        action_name,
        action_date
      ) duration_perc99_ms
    FROM
      :data_actiongroup_yesterday
  )
GROUP BY
  -- <Next line is auto-generated> All dimensions
			story_id, is_optimized_view_mode, 
  action_name,
  action_date

UNION
-- 4. story_id, is_optimized_view_mode

SELECT
  -- <Next line is auto-generated> All dimensions
			story_id, is_optimized_view_mode, 
  action_name,
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
      action_name,
      action_date,
      case 
        when action_name = 'Log On' then 'Log On'
        when action_name in ('Open Story', 'Open Story from URL') then 'Open Story'
        when action_name in ('Open Application', 'Open Application from URL') then 'Open Application'
        when action_name in ('Open Application Runtime', 'Open Application Runtime from URL') then 'Open Application Runtime'
        when action_name in ('Open Presentation', 'Open Presentation from URL') then 'Open Presentation'
      end as action_name,
      percentile_cont(0.5) within GROUP (
        ORDER BY
          action_duration
      ) over (
        PARTITION by 
        -- <Next line is auto-generated> Partition group
			story_id, is_optimized_view_mode, 
        action_date
      ) duration_perc50_ms,
      percentile_cont(0.90) within GROUP (
        ORDER BY
          action_duration
      ) over (
        PARTITION by 
        -- <Next line is auto-generated> Partition group
			story_id, is_optimized_view_mode, 
        action_name,
        action_date
      ) duration_perc90_ms,
      percentile_cont(0.95) within GROUP (
        ORDER BY
          action_duration
      ) over (
        PARTITION by 
        -- <Next line is auto-generated> Partition group
			story_id, is_optimized_view_mode, 
        action_name,
        action_date
      ) duration_perc95_ms,
      percentile_cont(0.99) within GROUP (
        ORDER BY
          action_duration
      ) over (
        PARTITION by 
        -- <Next line is auto-generated> Partition group
			story_id, is_optimized_view_mode, 
        action_name,
        action_date
      ) duration_perc99_ms
    FROM
      :data_actiongroup_yesterday
  )
GROUP BY
  -- <Next line is auto-generated> All dimensions
			story_id, is_optimized_view_mode, 
  action_name,
  action_date

------ END ------
;