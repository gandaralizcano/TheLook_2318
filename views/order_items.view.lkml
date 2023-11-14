view: order_items {
  sql_table_name: demo_db.order_items ;;
  drill_fields: [id]

  parameter: reporting_timeframe {
    label: "Current Aggregation Period"
    type: string
    allowed_value: {
      label: "Last 1 Day"
      value: "1"
    }
    allowed_value: {
      label: "Last 7 Days"
      value: "7"
    }
    allowed_value: {
      label: "Last 30 Days"
      value: "30"
    }
    allowed_value: {
      label: "Last 90 Days"
      value: "90"
    }
    allowed_value: {
      label: "Last year"
      value: "365"
    }
    default_value: "365"
  }

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
  dimension: inventory_item_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.inventory_item_id ;;
  }
  dimension: order_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.order_id ;;
  }
  dimension: phone {
    type: string
    sql: ${TABLE}.phone ;;
  }
  dimension: phones {
    type: string
    sql: ${TABLE}.phones ;;
  }
  dimension_group: returned {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.returned_at ;;
  }
  dimension: sale_price {
    type: number
    sql: ${TABLE}.sale_price ;;
  }
  measure: count {
    type: count
    drill_fields: [id, orders.id, inventory_items.id]
  }
}
