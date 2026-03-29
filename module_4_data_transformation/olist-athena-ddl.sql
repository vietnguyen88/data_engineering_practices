CREATE EXTERNAL TABLE `customers`(
  `customer_id` string, 
  `customer_unique_id` string, 
  `customer_zip_code_prefix` bigint, 
  `customer_city` string, 
  `customer_state` string)
ROW FORMAT SERDE 
  'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe' 
STORED AS INPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat' 
OUTPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat'
LOCATION
  's3://BUCKET/olist/customers/'
TBLPROPERTIES (
  'classification'='parquet', 
  'compressionType'='none', 
  'delimiter'=',', 
  'skip.header.line.count'='1', 
  'typeOfData'='file')
;

CREATE EXTERNAL TABLE `order_items`(
  `order_id` string, 
  `order_item_id` bigint, 
  `product_id` string, 
  `seller_id` string, 
  `shipping_limit_date` bigint, 
  `price` double, 
  `freight_value` double)
ROW FORMAT SERDE 
  'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe' 
STORED AS INPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat' 
OUTPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat'
LOCATION
  's3://BUCKET/olist/order_items/'
TBLPROPERTIES (
  'classification'='parquet', 
  'compressionType'='none', 
  'delimiter'=',', 
  'skip.header.line.count'='1', 
  'typeOfData'='file')
;

CREATE EXTERNAL TABLE `order_payments`(
  `order_id` string, 
  `payment_sequential` bigint, 
  `payment_type` string, 
  `payment_installments` bigint, 
  `payment_value` double)
ROW FORMAT SERDE 
  'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe' 
STORED AS INPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat' 
OUTPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat'
LOCATION
  's3://BUCKET/olist/order_payments/'
TBLPROPERTIES (
  'classification'='parquet', 
  'compressionType'='none', 
  'delimiter'=',', 
  'skip.header.line.count'='1', 
  'typeOfData'='file')
;

CREATE EXTERNAL TABLE `order_reviews`(
  `review_id` string, 
  `order_id` string, 
  `review_score` bigint, 
  `review_comment_title` string, 
  `review_comment_message` string, 
  `review_creation_date` bigint, 
  `review_answer_timestamp` bigint)
ROW FORMAT SERDE 
  'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe' 
STORED AS INPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat' 
OUTPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat'
LOCATION
  's3://BUCKET/olist/order_reviews/'
TBLPROPERTIES (
  'classification'='parquet', 
  'compressionType'='none', 
  'delimiter'=',', 
  'skip.header.line.count'='1', 
  'typeOfData'='file')
;

CREATE EXTERNAL TABLE `orders`(
  `order_id` string, 
  `customer_id` string, 
  `order_status` string, 
  `order_purchase_timestamp` string, 
  `order_approved_at` string, 
  `order_delivered_carrier_date` string, 
  `order_delivered_customer_date` string, 
  `order_estimated_delivery_date` string)
ROW FORMAT SERDE 
  'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe' 
STORED AS INPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat' 
OUTPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat'
LOCATION
  's3://BUCKET/olist/orders/'
TBLPROPERTIES (
  'classification'='parquet', 
  'compressionType'='none', 
  'delimiter'=',', 
  'typeOfData'='file')
;

CREATE EXTERNAL TABLE `product_category_name_translation`(
  `product_category_name` string, 
  `product_category_name_english` string)
ROW FORMAT SERDE 
  'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe' 
STORED AS INPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat' 
OUTPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat'
LOCATION
  's3://BUCKET/olist/product_category_name_translation/'
TBLPROPERTIES (
  'CRAWL_RUN_ID'='796393cd-a39f-4e6d-adf9-e2efa6f122e5', 
  'CrawlerSchemaDeserializerVersion'='1.0', 
  'CrawlerSchemaSerializerVersion'='1.0', 
  'UPDATED_BY_CRAWLER'='olist-crawler', 
  'averageRecordSize'='45', 
  'classification'='parquet', 
  'compressionType'='none', 
  'delimiter'=',', 
  'objectCount'='1', 
  'recordCount'='71', 
  'sizeKey'='4300', 
  'typeOfData'='file')
;

CREATE EXTERNAL TABLE `products`(
  `product_id` string, 
  `product_category_name` string, 
  `product_name_lenght` double, 
  `product_description_lenght` double, 
  `product_photos_qty` double, 
  `product_weight_g` double, 
  `product_length_cm` double, 
  `product_height_cm` double, 
  `product_width_cm` double)
ROW FORMAT SERDE 
  'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe' 
STORED AS INPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat' 
OUTPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat'
LOCATION
  's3://BUCKET/olist/products/'
TBLPROPERTIES (
  'classification'='parquet', 
  'compressionType'='none', 
  'delimiter'=',', 
  'skip.header.line.count'='1', 
  'typeOfData'='file')
;

CREATE EXTERNAL TABLE `sellers`(
  `seller_id` string, 
  `seller_zip_code_prefix` bigint, 
  `seller_city` string, 
  `seller_state` string)
ROW FORMAT SERDE 
  'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe' 
STORED AS INPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat' 
OUTPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat'
LOCATION
  's3://BUCKET_NAME/olist/sellers/'
TBLPROPERTIES (
  'classification'='parquet', 
  'compressionType'='none', 
  'delimiter'=',', 
  'skip.header.line.count'='1', 
  'typeOfData'='file')
;