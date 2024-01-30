
- dashboard: year_fiscal_test1
  title: year_fiscal_test1
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: mUOELh2e2vLzKQSVmlvGEz
  elements:
  - title: year_fiscal_test1
    name: year_fiscal_test1
    model: arturo_thelook
    explore: order_items
    type: table
    fields: [order_items.returned_date]
    fill_fields: [order_items.returned_date]
    sorts: [order_items.returned_date desc]
    limit: 500
    column_limit: 50
    query_timezone: America/Los_Angeles
    listen:
      Created Date: inventory_items.created_date
    row:
    col:
    width:
    height:
  filters:
  - name: Created Date
    title: Created Date
    type: field_filter
    default_value: this day
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: arturo_thelook
    explore: order_items
    listens_to_filters: []
    field: inventory_items.created_date
