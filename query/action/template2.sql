SELECT
  <all_dims>
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
      <select_group>
      action_name,
      action_date,
      -- case 
      --   when action_name = 'Log On' then 'Log On'
      --   when action_name in ('Open Story', 'Open Story from URL') then 'Open Story'
      --   when action_name in ('Open Application', 'Open Application from URL') then 'Open Application'
      --   when action_name in ('Open Application Runtime', 'Open Application Runtime from URL') then 'Open Application Runtime'
      --   when action_name in ('Open Presentation', 'Open Presentation from URL') then 'Open Presentation'
      -- end as action_name,
      percentile_cont(0.5) within GROUP (
        ORDER BY
          action_duration
      ) over (
        PARTITION by 
        <partition_group>
        action_date
      ) duration_perc50_ms,
      percentile_cont(0.90) within GROUP (
        ORDER BY
          action_duration
      ) over (
        PARTITION by 
        <partition_group>
        action_name,
        action_date
      ) duration_perc90_ms,
      percentile_cont(0.95) within GROUP (
        ORDER BY
          action_duration
      ) over (
        PARTITION by 
        <partition_group>
        action_name,
        action_date
      ) duration_perc95_ms,
      percentile_cont(0.99) within GROUP (
        ORDER BY
          action_duration
      ) over (
        PARTITION by 
        <partition_group>
        action_name,
        action_date
      ) duration_perc99_ms
    FROM
      :<table>
  )
GROUP BY
  <all_dims>
  action_name,
  action_date