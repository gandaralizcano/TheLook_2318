include:/views/orders.view.lkml

view: derived {
derived_table: {
  sql: SELECT
    user_id
FROM
    `demo_db`.`orders` AS `orders`
   {% if date_granularity._parameter_value == 'day' %}
      orders.status
    {% elsif date_granularity._parameter_value == 'month' %}
      orders.user_id
    {% else %}
      orders.status
    {% endif %};;


 }

  parameter: date_granularity {
    type: unquoted
    allowed_value: {
      label: "Break down by Day"
      value: "day"
    }
    allowed_value: {
      label: "Break down by Month"
      value: "month"
    }
  }

# dimension: date {
#   #primary_key: yes
#   type: date
#   sql: ;;
# }
# dimension_group: created {
#   type: time
#   timeframes: [raw, time, date, week, month, quarter, year]
#   sql: ${TABLE}.created_at ;;
# }
dimension: status {
  type: string
  sql: ${TABLE}.status ;;
}
dimension: user_id {
  type: number
  # hidden: yes
  sql: ${TABLE}.user_id ;;
}
}
