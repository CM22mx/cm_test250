view: order_items {
  sql_table_name: demo_db.order_items ;;
  drill_fields: [id]

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
  parameter: number_of_results {
    type: string
    allowed_value: {
      label: "Less than 500"
      value: "< 500"
    }
    allowed_value: {
      label: "Less than 10,000"
      value: "< 10000"
    }
    allowed_value: {
      label: "All Results"
      value: "> 0"
    }
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
    drill_fields: [ct_drill*]
  }

  set: ct_drill {
    fields: [
      order_items.sale_price,
      orders.status,
      order_items_vijaya.count,
      inventory_items.cost,
      users.age,
      users.city,
      users.country,
      users.gender,
      users.first_name,
      users.last_name,
      users.state,
      products.brand,
      products.category,
      products.department,
      products.item_name,
      products.retail_price,
      users.zip,
      order_items.phone
    ]
  }
}
