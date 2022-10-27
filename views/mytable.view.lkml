view: mytable {
  sql_table_name: public.mytable ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: array {
    type: string
    sql: ${TABLE}."array" ;;
  }

  dimension: date {
    type: string
    sql: ${TABLE}.date ;;
  }

  dimension: level_1 {
    type: string
    sql: ${TABLE}.level_1 ;;
  }

  dimension: level_2 {
    type: string
    sql: ${TABLE}.level_2 ;;
  }

  dimension: level_3 {
    type: string
    sql: ${TABLE}.level_3 ;;
  }

  dimension: q1 {
    type: number
    sql: ${TABLE}.q1 ;;
  }

  dimension: q2 {
    type: number
    sql: ${TABLE}.q2 ;;
  }

  dimension: struct {
    type: string
    sql: ${TABLE}.struct ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
