view: products {
  sql_table_name: demo_db.products ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
  dimension: brand {
    type: string
    sql: ${TABLE}.brand ;;
  }
  dimension: category {
    type: string
    sql: ${TABLE}.category ;;
  }
  dimension: department {
    type: string
    sql: ${TABLE}.department ;;
  }
  dimension: item_name {
    type: string
    sql: ${TABLE}.item_name ;;
  }
  dimension: rank {
    type: number
    sql: ${TABLE}.rank ;;
  }
  dimension: retail_price {
    type: number
    sql: ${TABLE}.retail_price ;;
  }
  dimension: sku {
    type: string
    sql: ${TABLE}.sku ;;
  }
  measure: count {
    type: count
    #drill_fields: [id, item_name, inventory_items.count]
    drill_fields: [ct_drill*]
  }

  set: ct_drill {
    fields: [
      products.brand,
      order_items.sale_price,
      orders.status,
      inventory_items.cost,
      users.age,
      users.city,
      users.country,
      users.gender,
      users.first_name,
      users.last_name,
      users.state,
      users.zip,
      order_items.phone
    ]
  }
}
