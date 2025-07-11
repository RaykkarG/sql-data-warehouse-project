/*
===============================================================================
Stored Procedure: Load Bronze Layer (Source -> Bronze)
===============================================================================

Script Purpose:
    This stored procedure Truncate and then loads data into the 'bronze' schema from external CSV files. 

Usage Example:
    EXEC bronze.load_bronze;
*/

CREATE OR ALTER PROCEDURE bronze.load_bronze AS
BEGIN
	BEGIN TRY
		PRINT '======================================================';
		PRINT '------- Loading data to Bronze Layer ------';
		PRINT '======================================================';

		PRINT '------------------------------------------------------';
		PRINT 'Loading CRM Tables';
		PRINT '------------------------------------------------------';

	--CRM Bulk Insert

		TRUNCATE TABLE bronze.crm_cust_info;
		PRINT 'Inserting Data into crm_cust_info ';
		BULK INSERT bronze.crm_cust_info
		FROM 'C:\Users\Yenrag\Desktop\Yen\Data Analysis\Data Warehouse Project\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);

		TRUNCATE TABLE bronze.crm_prd_info;
		PRINT 'Inserting Data into crm_prd_info ';
		BULK INSERT bronze.crm_prd_info
		FROM 'C:\Users\Yenrag\Desktop\Yen\Data Analysis\Data Warehouse Project\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);

		TRUNCATE TABLE bronze.crm_sales_details;
		PRINT 'Inserting Data into crm_sales_details ';
		BULK INSERT bronze.crm_sales_details
		FROM 'C:\Users\Yenrag\Desktop\Yen\Data Analysis\Data Warehouse Project\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);


	--ERP Bulk Insert

		PRINT '------------------------------------------------------';
		PRINT 'Loading ERP Tables';
		PRINT '------------------------------------------------------';


		TRUNCATE TABLE bronze.erp_cust_az12;
		PRINT 'Inserting Data into erp_cust_az12';
		BULK INSERT bronze.erp_cust_az12
		FROM 'C:\Users\Yenrag\Desktop\Yen\Data Analysis\Data Warehouse Project\sql-data-warehouse-project\datasets\source_erp\CUST_AZ12.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);

		TRUNCATE TABLE bronze.erp_loc_a101;
		PRINT 'Inserting Data into erp_loc_a101 ';
		BULK INSERT bronze.erp_loc_a101
		FROM 'C:\Users\Yenrag\Desktop\Yen\Data Analysis\Data Warehouse Project\sql-data-warehouse-project\datasets\source_erp\LOC_A101.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);

		TRUNCATE TABLE bronze.erp_px_cat_g1v2;
		PRINT 'Inserting Data into erp_px_cat_g1v2 ';
		BULK INSERT bronze.erp_px_cat_g1v2
		FROM 'C:\Users\Yenrag\Desktop\Yen\Data Analysis\Data Warehouse Project\sql-data-warehouse-project\datasets\source_erp\PX_CAT_G1V2.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
	END TRY
	BEGIN CATCH
		PRINT 'ERROR OCCURED DURING LOADING BRONZE LAYER';
		PRINT 'ERROR MESSAGE' + ERROR_MESSAGE();
	END CATCH

END

