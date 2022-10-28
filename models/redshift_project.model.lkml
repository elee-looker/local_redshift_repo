connection: "redshift"

# include all the views
include: "/views/**/*.view"

datagroup: redshift_project_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: redshift_project_default_datagroup

explore: all_types {}

explore: billion_orders {
  join: orders {
    type: left_outer
    sql_on: ${billion_orders.order_id} = ${orders.id} ;;
    relationship: many_to_one
  }

  join: users {
    type: left_outer
    sql_on: ${orders.user_id} = ${users.id} ;;
    relationship: many_to_one
  }
}

explore: hundred_million_orders {
  join: orders {
    type: left_outer
    sql_on: ${hundred_million_orders.order_id} = ${orders.id} ;;
    relationship: many_to_one
  }

  join: users {
    type: left_outer
    sql_on: ${orders.user_id} = ${users.id} ;;
    relationship: many_to_one
  }
}

explore: my_table_has_a_space {}

explore: mytable {}

explore: order_items {
  join: orders {
    type: left_outer
    sql_on: ${order_items.order_id} = ${orders.id} ;;
    relationship: many_to_one
  }

  join: users {
    type: left_outer
    sql_on: ${orders.user_id} = ${users.id} ;;
    relationship: many_to_one
  }
}

explore: orders {
  join: users {
    type: left_outer
    sql_on: ${orders.user_id} = ${users.id} ;;
    relationship: many_to_one
  }
}

explore: table_b {
  join: orders {
    type: left_outer
    sql_on: ${table_b.order_id} = ${orders.id} ;;
    relationship: many_to_one
  }

  join: users {
    type: left_outer
    sql_on: ${orders.user_id} = ${users.id} ;;
    relationship: many_to_one
  }
}

explore: users {}

explore: joined_pdts {
  view_name: pdt_tester1
  join: pdt_tester2 {
    relationship: one_to_one
    sql_on: ${pdt_tester2.id} = ${pdt_tester1.id} ;;
  }
}

explore: pdt_tester3 {}
