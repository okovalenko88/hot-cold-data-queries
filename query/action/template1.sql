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
      percentile_cont(0.5) within GROUP (
        ORDER BY
          action_duration
      ) over (
        PARTITION by 
        <partition_group>
        action_name,
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