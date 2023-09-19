SELECT
  success.*,
  error.count_error
FROM
  (
    SELECT
      <all_dims>
      execution_date,
      max(duration_success_perc50_ms) duration_success_perc50_ms,
      max(duration_success_perc90_ms) duration_success_perc90_ms,
      max(duration_success_perc95_ms) duration_success_perc95_ms,
      max(duration_success_perc99_ms) duration_success_perc99_ms,
      count(*) AS count_success
    FROM
      (
        SELECT
          <select_group>
          execution_date,
          percentile_cont(0.5) within GROUP (
            ORDER BY
              duration_success
          ) over (
            PARTITION by 
            <partition_group>
            execution_date
          ) duration_success_perc50_ms,
          percentile_cont(0.90) within GROUP (
            ORDER BY
              duration_success
          ) over (
            PARTITION by 
            <partition_group>
            execution_date
          ) duration_success_perc90_ms,
          percentile_cont(0.95) within GROUP (
            ORDER BY
              duration_success
          ) over (
            PARTITION by 
            <partition_group>
            execution_date
          ) duration_success_perc95_ms,
          percentile_cont(0.99) within GROUP (
            ORDER BY
              duration_success
          ) over (
            PARTITION by 
            <partition_group>
            execution_date
          ) duration_success_perc99_ms
        FROM
          :success_data_all
      )
    GROUP BY
      <all_dims>
      execution_date
  ) AS success
  FULL OUTER JOIN (
    SELECT
      <all_dims>
      execution_date,
      count(*) AS count_error
    FROM
      (
        SELECT
          <select_group>
          execution_date
        FROM
          :error_data_all
      )
    GROUP BY
      <all_dims>
      execution_date
  ) error 
  ON success.execution_date = error.execution_date
  AND success.model_id = error.model_id
  AND success.query_type = error.query_type

-- delete before commit
--order by execution_date  