view: orders {
  sql_table_name: demo_db.orders ;;
  drill_fields: [id]

  parameter: test {
    allowed_value: {
      value: "sample_value_1"
      label: "My Value from the Main view"
    }

    allowed_value: {
      value: "sample_value_2"
      label: "My Second Value from the Main view"
    }
  }


  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.created_at ;;
  }

  dimension_group: created_group_date {
    label: "daily_log_date"
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.created_at ;;
    drill_fields: [id]
  }

  dimension: year_created {
    type: number
    sql: ${created_year} ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }
  dimension: user_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.user_id ;;
  }
  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
  id,
  users.id,
  users.first_name,
  users.last_name,
  billion_orders.count,
  fakeorders.count,
  hundred_million_orders.count,
  hundred_million_orders_wide.count,
  order_items.count,
  order_items_vijaya.count,
  ten_million_orders.count
  ]
  }

}
