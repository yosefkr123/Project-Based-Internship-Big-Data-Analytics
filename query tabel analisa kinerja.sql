-- CREATE BY: Yosef Krismyanto (rakamin-kf-analytics-yosef123)
-- CREATE DATE: 2025-08-02

CREATE OR REPLACE TABLE `rakamin-kf-analytics-yosef123.kimia_farma.analisa_kinerja` AS
SELECT
  trx.transaction_id,
  trx.date,
  trx.branch_id,
  cab.branch_name,
  cab.kota,
  cab.provinsi,
  cab.rating AS rating_cabang,
  trx.customer_name,
  trx.product_id,
  prod.product_name,
  
  -- Harga asli dari transaksi
  trx.price AS actual_price,
  trx.discount_percentage,

  -- Persentase gross laba sesuai ketentuan
  CASE
    WHEN trx.price <= 50000 THEN 0.10
    WHEN trx.price <= 100000 THEN 0.15
    WHEN trx.price <= 300000 THEN 0.20
    WHEN trx.price <= 500000 THEN 0.25
    ELSE 0.30
  END AS persentase_gross_laba,

  -- Nett Sales = harga setelah diskon
  ROUND(trx.price * (1 - trx.discount_percentage / 100.0), 2) AS nett_sales,

  -- Nett Profit = nett_sales * margin
  ROUND(
    (trx.price * (1 - trx.discount_percentage / 100.0)) *
    CASE
      WHEN trx.price <= 50000 THEN 0.10
      WHEN trx.price <= 100000 THEN 0.15
      WHEN trx.price <= 300000 THEN 0.20
      WHEN trx.price <= 500000 THEN 0.25
      ELSE 0.30
    END
  , 2) AS nett_profit,

  trx.rating AS rating_transaksi

FROM
  `rakamin-kf-analytics-yosef123.kimia_farma.kf_final_transaction` AS trx
LEFT JOIN
  `rakamin-kf-analytics-yosef123.kimia_farma.kf_product` AS prod
ON
  trx.product_id = prod.product_id
LEFT JOIN
  `rakamin-kf-analytics-yosef123.kimia_farma.kf_kantor_cabang` AS cab
ON
  trx.branch_id = cab.branch_id;
