view: pdt_tester3 {
  derived_table: {
    sql_trigger_value: SELECT DATE_PART('hour', GETDATE()) ;;
    sql: SELECT
          orders.id  AS "orders.id",
          orders.status  AS "orders.status",
              (DATE(CONVERT_TIMEZONE('UTC', 'America/Los_Angeles', orders.created_at ))) AS "orders.created_date"
          FROM public.orders  AS orders
          WHERE ((( orders.created_at  ) >= ((CONVERT_TIMEZONE('America/Los_Angeles', 'UTC', TIMESTAMP '2011-01-01'))) AND ( orders.created_at  ) < ((CONVERT_TIMEZONE('America/Los_Angeles', 'UTC', DATEADD(year,1, TIMESTAMP '2011-01-01' ))))))
          LIMIT 500 ;;
  }

  dimension: id {
    primary_key: yes
    type: number
    sql:  ${TABLE}."orders.id" ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}."orders.status" ;;
  }
}
