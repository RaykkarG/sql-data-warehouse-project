-- Check for null or duplicates in primary key
-- Expectation: No Results

SELECT	prd_id,
		COUNT(*) as cont
FROM silver.crm_prd_info
GROUP BY prd_id
HAVING COUNT(*) >1 OR prd_id IS NULL;

-- Check for unwanted spaces
-- Expectation: No Results

SELECT prd_nm
FROM silver.crm_prd_info
WHERE prd_nm != TRIM(prd_nm)

-- Check for NULLs or negative Numbers
-- Expectation: No Results

SELECT prd_cost
FROM silver.crm_prd_info
WHERE prd_cost <0 OR prd_cost IS NULL

-- Data Standardization % consistency
-- Marital = M, S, NULL / Gender = M, F, NULL

SELECT DISTINCT prd_line
FROM silver.crm_prd_info


SELECT * FROM silver.crm_prd_info

-- Check for invalid Dates (0 or < 0, != 8, >2050, <1900)

SELECT
NULLIF(sls_order_dt,0) AS sls_order_dt
FROM bronze.crm_sales_details
WHERE sls_order_dt <=0
OR LEN(sls_order_dt) != 8
OR sls_order_dt > 20500101
OR sls_order_dt < 19000101


-- Check for invalid Date Orders

SELECT *
FROM bronze.crm_sales_details
WHERE sls_order_dt > sls_ship_dt OR sls_order_dt > sls_due_dt

-- Check data consistency Between Sales, Quantity and Price
--	Sales -> Quantity * Price
--	Values must not be NULL, Zero or Negative.

SELECT DISTINCT
	 sls_sales
	,sls_quantity
	,sls_price
FROM bronze.crm_sales_details
WHERE sls_sales != sls_quantity * sls_price
OR sls_quantity IS NULL OR sls_sales IS NULL OR sls_price IS NULL
OR sls_quantity <=0 OR sls_sales <=0 OR sls_price <=0
ORDER BY sls_sales, sls_quantity, sls_price
