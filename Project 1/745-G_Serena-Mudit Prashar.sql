/** 
Problem 01 :Find department name by using departmentID of people who have start date year 2009 using AdventureWorks2014?

Mudit Prashar -- SIMPLE
**/
USE AdventureWorks2014

SELECT [Name]
	,[StartDate]
	,a.[DepartmentID]
FROM [HumanResources].[Department] AS a
INNER JOIN [HumanResources].[EmployeeDepartmentHistory] AS b ON a.DepartmentID = b.DepartmentID
WHERE StartDate BETWEEN '2009-01-01'
		AND '2009-12-31'
ORDER BY StartDate;


/**
Problem 02: Find the product names that had internet sale and had order date year 2010 using AdventureWorksDW2016?

Mudit Prashar -- SIMPLE
**/
USE AdventureWorksDW2016

SELECT b.[OrderDate]
	,a.[ProductKey]
	,a.[EnglishProductName]
FROM [dbo].[DimProduct] AS a
INNER JOIN [dbo].[FactInternetSales] AS b ON a.ProductKey = b.ProductKey
WHERE OrderDate BETWEEN '2010-01-01'
		AND '2010-12-31'
ORDER BY OrderDate;

/**
 Problem 03: Find the description of items whose last cost price is less than $5 using WideWorldImporters?
 
Mudit Prashar -- SIMPLE
**/
USE WideWorldImporters

SELECT DISTINCT a.[StockItemID]
	,b.[LastCostPrice]
	,a.[Description]
FROM [Purchasing].[PurchaseOrderLines] AS a
INNER JOIN [Warehouse].[StockItemHoldings] AS b ON a.StockItemID = b.StockItemID
WHERE b.LastCostPrice < '5'
ORDER BY b.LastCostPrice;

/**
Problem 04: Find all the orders that was purchased using EFT in the first month of year 2015 using WideWorldImportersDW?

Mudit Prashar -- SIMPLE
**/
USE WideWorldImportersDW

SELECT a.[Payment Method Key]
	,b.[Payment Method]
	,a.[Date Key]
FROM [Fact].[Transaction] AS a
INNER JOIN [Dimension].[Payment Method] AS b ON a.[Payment Method Key] = b.[Payment Method Key]
WHERE a.[Date Key] BETWEEN '2015-01-01'
		AND '2015-01-31'
	AND b.[Payment Method] = 'EFT'
ORDER BY a.[Date Key]

/**
Problem 05: Find all the orders ids that had orders placed for switzerland and find the shipping company names
using Northwinds2019TSQLV5?

Mudit Prashar -- SIMPLE
**/
USE Northwinds2019TSQLV5

SELECT a.OrderId
	,a.ShipperId
	,a.ShipToCountry
	,b.ShipperCompanyName
FROM [Sales].[Order] AS a
INNER JOIN [Sales].[Shipper] AS b ON a.ShipperId = b.ShipperId
WHERE a.ShipToCountry = 'Switzerland';

/**
Problem 06: Find the orderID of the last order placed by each Company using Northwinds2019TSQLV5?

Mudit Prashar -- MEDIUM
**/
USE Northwinds2019TSQLV5

SELECT MAX(a.OrderId) AS LastPlacedOrderId
	,b.CustomerCompanyName
FROM [Sales].[Order] AS a
LEFT JOIN [Sales].[Customer] AS b ON a.CustomerId = b.CustomerId
GROUP BY CustomerCompanyName

/**
Problem 07: Find the number of orders shipped by each shipping Company using Northwinds2019TSQLV5?

Mudit Prashar -- MEDIUM
**/
USE Northwinds2019TSQLV5

SELECT b.ShipperCompanyName
	,COUNT(a.OrderID) AS NumberOfOrders
FROM [Sales].[Order] AS a
LEFT JOIN Sales.Shipper AS b ON a.ShipperID = b.ShipperID
GROUP BY ShipperCompanyName;

/**
Problem 08: Find the total number of orders placed of each stock item using WideWorldImportersDW?

Mudit Prashar -- MEDIUM
**/
USE WideWorldImportersDW

SELECT SA.[Stock Item Key]
	,COUNT(OD.[Order Key]) AS TotalOrders
FROM [Fact].[Order] AS OD
INNER JOIN [Fact].[Sale] AS SA ON OD.[Stock Item Key] = SA.[Stock Item Key]
WHERE OD.[Order Date Key] >= '2016-01-01'
	AND OD.[Order Date Key] < '2017-01-01'
GROUP BY SA.[Stock Item Key]
ORDER BY SA.[Stock Item Key]


/**
Problem 09: Find the revenue WideWorldImporters made from each item in 2013 using WideWorldImporters?

Mudit Prashar -- MEDIUM
**/
USE WideWorldImporters

SELECT ODL.StockItemID
	,ODL.Description
	,SUM(T.TransactionAmount) AS Revenue
FROM [Sales].[CustomerTransactions] AS T
INNER JOIN [Sales].[Orders] AS OD ON T.CustomerID = OD.CustomerID
INNER JOIN [Sales].[OrderLines] AS ODL ON OD.OrderID = ODL.OrderID
WHERE OD.OrderDate >= '2013-01-01'
	AND OD.OrderDate < '2014-01-01'
GROUP BY ODL.StockItemID
	,ODL.Description
ORDER BY ODL.StockItemID

/**
Problem 10: Find the number of bussinesses in each state of US using AdventureWorks2014?

Mudit Prashar -- MEDIUM
**/
USE AdventureWorks2014

SELECT c.StateProvinceCode
	,c.CountryRegionCode
	,COUNT(a.BusinessEntityID) AS TotalNumberOfBusinessEntityIDs
FROM [Person].[BusinessEntityAddress] AS a
FULL OUTER JOIN [Person].[Address] AS b ON a.AddressID = b.AddressID
FULL OUTER JOIN [Person].[StateProvince] AS c ON c.StateProvinceID = b.StateProvinceID
WHERE c.CountryRegionCode = 'US'
GROUP BY c.StateProvinceCode
	,c.CountryRegionCode
ORDER BY c.StateProvinceCode

/**
Problem 11: Find the Business ID of the first business that is registered using AdventureWorks2014?
If it shows null that means there are businesses in that state

Mudit Prashar -- MEDIUM
**/
USE AdventureWorks2014

SELECT c.StateProvinceCode
	,c.CountryRegionCode
	,MIN(a.BusinessEntityID) AS FirstBusinessToRegisterID
FROM [Person].[BusinessEntityAddress] AS a
FULL OUTER JOIN [Person].[Address] AS b ON a.AddressID = b.AddressID
FULL OUTER JOIN [Person].[StateProvince] AS c ON c.StateProvinceID = b.StateProvinceID
GROUP BY c.StateProvinceCode
	,c.CountryRegionCode
ORDER BY c.CountryRegionCode

/**
Problem 12: Find the total number of male customers in each country using AdventureWorksDW2016?

Mudit Prashar -- MEDIUM
**/
USE AdventureWorksDW2016

SELECT b.CountryRegionCode
	,b.EnglishCountryRegionName
	,COUNT(a.GeographyKey) AS TotalMaleCustomers
FROM [dbo].[DimCustomer] AS a
INNER JOIN [dbo].[DimGeography] AS b ON a.GeographyKey = b.GeographyKey
WHERE a.Gender = 'M'
GROUP BY b.CountryRegionCode
	,b.EnglishCountryRegionName
ORDER BY b.EnglishCountryRegionName

/**
Problem 13: Find the Total number of orders placed during internet sales that used different currencies and don't show the currencies that were never used using AdventureWorksDW2016?

Mudit Prashar -- MEDIUM
**/
USE AdventureWorksDW2016

SELECT b.CurrencyKey
	,b.CurrencyName
	,COUNT(a.ProductKey) AS TotalInternetSales
FROM [dbo].[FactInternetSales] AS a
INNER JOIN [dbo].[DimCurrency] AS b ON a.CurrencyKey = b.CurrencyKey
GROUP BY b.CurrencyKey
	,b.CurrencyName
ORDER BY b.CurrencyName

/**
Problem 14: Find the Full name of the male employees and their age when they got hired and who only do day shifts using AdventureWorks2014?

Mudit Prashar -- COMPLEX
**/
--FUNCTION CODE BEGINS
IF OBJECT_ID('dbo.CalculateYears') IS NOT NULL
	DROP FUNCTION dbo.CalculateYears;
GO

CREATE FUNCTION dbo.CalculateYears (
	@DOS DATE
	,--dateofstart
	@DOF DATE --dateoffinish
	)
RETURNS INT
AS
BEGIN
	DECLARE @AGE INT

	SET @AGE = DATEDIFF(YEAR, @DOS, @DOF) - CASE 
			WHEN (MONTH(@DOS) > MONTH(@DOF))
				OR (
					MONTH(@DOS) = MONTH(@DOF)
					AND DAY(@DOS) > DAY(@DOF)
					)
				THEN 1
			ELSE 0
			END

	RETURN @AGE
END;

--FUNCTION CODE ENDS HERE
USE AdventureWorks2014

SELECT CONCAT (
		B.FirstName
		,' '
		,B.LastName
		) AS FullName
	,dbo.CalculateYears(convert(NVARCHAR, A.BirthDate, 101), convert(NVARCHAR, A.HireDate, 101)) AS AgeWhenTheyGotHired
	,D.[Name] AS ShiftType
FROM [HumanResources].[Employee] AS A
INNER JOIN [Person].[Person] AS B ON A.BusinessEntityID = B.BusinessEntityID
INNER JOIN [HumanResources].[EmployeeDepartmentHistory] AS C ON B.BusinessEntityID = C.BusinessEntityID
INNER JOIN [HumanResources].[Shift] AS D ON C.ShiftID = D.ShiftID
WHERE D.[Name] = 'Day'
	AND A.Gender = 'M'
GROUP BY dbo.CalculateYears(convert(NVARCHAR, A.BirthDate, 101), convert(NVARCHAR, A.HireDate, 101))
	,B.FirstName
	,B.LastName
	,D.[Name]

/**
Problem 15: Find the name of the Customers, number of clothing internet sales order they placed and also count the number of years since they made their first purchase up until today using
AdventureWorksDW2016?

Mudit Prashar -- COMPLEX
**/
--FUNCTION CODE BEGINS
IF OBJECT_ID('dbo.CalculateYears') IS NOT NULL
	DROP FUNCTION dbo.CalculateYears;
GO

CREATE FUNCTION dbo.CalculateYears (
	@DOS DATE
	,--dateofstart
	@DOF DATE --dateoffinish
	)
RETURNS INT
AS
BEGIN
	DECLARE @AGE INT

	SET @AGE = DATEDIFF(YEAR, @DOS, @DOF) - CASE 
			WHEN (MONTH(@DOS) > MONTH(@DOF))
				OR (
					MONTH(@DOS) = MONTH(@DOF)
					AND DAY(@DOS) > DAY(@DOF)
					)
				THEN 1
			ELSE 0
			END

	RETURN @AGE
END;

--FUNCTION CODE ENDS HERE
USE AdventureWorksDW2016

SELECT A.CustomerKey
	,CONCAT (
		A.FirstName
		,' '
		,A.LastName
		) AS FullName
	,dbo.CalculateYears(A.DateFirstPurchase, getDate()) AS YearsSinceTheirFirstPurchase
	,COUNT(B.OrderQuantity) TotalInternetSalesOrder
	,C.EnglishProductSubcategoryName
FROM [dbo].[DimCustomer] AS A
INNER JOIN [dbo].[FactInternetSales] AS B ON A.CustomerKey = B.CustomerKey
INNER JOIN [dbo].[FactSurveyResponse] AS C ON B.CustomerKey = C.CustomerKey
WHERE C.EnglishProductCategoryName = 'Clothing'
GROUP BY A.CustomerKey
	,dbo.CalculateYears(A.DateFirstPurchase, getDate())
	,A.FirstName
	,A.LastName
	,C.EnglishProductSubcategoryName
ORDER BY A.CustomerKey

/**
Problem 16: Find the sales total order for each order including tax and frieght cost and also find the reason for sales using AdventureWorks2014?

Mudit Prashar -- COMPLEX
**/
--FUNCTION CODE BEGINS
IF OBJECT_ID('dbo.CalculateSalesOrderTotal') IS NOT NULL
	DROP FUNCTION dbo.CalculateSalesOrderTotal;
GO

CREATE FUNCTION dbo.CalculateSalesOrderTotal (
	@LineTotal INT
	,@TaxAmt INT
	,@Freight INT
	)
RETURNS MONEY

BEGIN
	DECLARE @SalesOrderTotal AS MONEY

	SELECT @SalesOrderTotal = @LineTotal + @TaxAmt + @Freight

	RETURN @SalesOrderTotal;
END;
GO

--FUNCTION CODE ENDS HERE
USE AdventureWorks2014

SELECT OD.SalesOrderID
	,dbo.CalculateSalesOrderTotal(OD.LineTotal, OH.TaxAmt, OH.Freight) AS SalesOrderTotal
	,SR.ReasonType
FROM [Sales].[SalesOrderDetail] AS OD
FULL OUTER JOIN [Sales].[SalesOrderHeader] AS OH ON OD.SalesOrderID = OH.SalesOrderID
INNER JOIN [Sales].[SalesOrderHeaderSalesReason] AS OHSR ON OD.SalesOrderID = OHSR.SalesOrderID
INNER JOIN [Sales].[SalesReason] AS SR ON OHSR.SalesReasonID = SR.SalesReasonID
WHERE SR.ReasonType != 'OTHER'
GROUP BY OD.SalesOrderID
	,dbo.CalculateSalesOrderTotal(OD.LineTotal, OH.TaxAmt, OH.Freight)
	,SR.ReasonType
ORDER BY OD.SalesOrderID

/**
Problem 17: Find the fiscal year quarter for order date for each customer the first quarter beginning with july. also find the total freight, total line cost and total cost customer paid after discounts 
using Northwinds2019TSQLV5?

Mudit Prashar -- COMPLEX
**/
--FUNCTION CODE BEGINS
IF OBJECT_ID('dbo.fiscalCalendarYear') IS NOT NULL
	DROP FUNCTION dbo.fiscalCalendarYear;
GO

CREATE FUNCTION dbo.fiscalCalendarYear (@date DATE)
RETURNS NVARCHAR(25)
AS
BEGIN
	DECLARE @getYear INT
		,@getMonth INT
		,@getDay INT
		,@output1 NVARCHAR(20)
		,@output2 NVARCHAR(20)

	SET @getYear = YEAR(@date)
	SET @getMonth = MONTH(@date)
	SET @getDay = DAY(@date)

	SELECT @output1 = CASE 
			WHEN (
					@getMonth >= 7
					AND @getMonth <= 9
					)
				THEN '-Quarter I'
			WHEN (
					@getMonth >= 10
					AND @getMonth <= 12
					)
				THEN '-Quarter II'
			WHEN (
					@getMonth >= 1
					AND @getMonth <= 3
					)
				THEN '-Quarter III'
			WHEN (
					@getMonth >= 4
					AND @getMonth <= 6
					)
				THEN '-Quarter IV'
			ELSE '0'
			END

	SET @output2 = @output1
	SET @output1 = CAST(@getYear AS NVARCHAR(20)) + @output2

	RETURN @output1
END;
GO

--FUNCTION CODE ENDS HERE
USE Northwinds2019TSQLV5

SELECT C.CustomerCompanyName
	,dbo.fiscalCalendarYear(O.OrderDate) AS FiscalYearQuarter
	,COUNT(DISTINCT O.OrderId) AS TotalNumberOfOrders
	,'$ ' + CONVERT(NVARCHAR(20), SUM(O.Freight)) AS [TotalFreight]
	,'$ ' + CONVERT(NVARCHAR(20), SUM(OD.UnitPrice * OD.Quantity)) AS TotalLineCost
	,'$ ' + CONVERT(NVARCHAR(20), SUM((OD.UnitPrice * OD.Quantity) * (1. - OD.DiscountPercentage))) AS TotalDicountedLineCost
FROM Sales.Customer AS C
INNER JOIN Sales.[Order] AS O ON O.CustomerId = C.CustomerId
INNER JOIN Sales.OrderDetail AS OD ON OD.OrderId = O.OrderId
GROUP BY C.CustomerCompanyName
	,dbo.fiscalCalendarYear(O.orderdate)
ORDER BY C.CustomerCompanyName

/**
Problem 18: Find the orders total after discount and show which ones are discounted, also show the name of the product and category it belongs to using Northwinds2019TSQLV5?

Mudit Prashar -- COMPLEX
**/
--FUNCTION CODE BEGINS
IF OBJECT_ID('dbo.isSomethingTrueOrFalse') IS NOT NULL
	DROP FUNCTION dbo.isSomethingTrueOrFalse;
GO

CREATE FUNCTION dbo.isSomethingTrueOrFalse (@input NVARCHAR(255))
RETURNS NVARCHAR(255)
AS
BEGIN
	DECLARE @output NVARCHAR(255)

	SELECT @output = CASE 
			WHEN (@input = '0.000')
				THEN 'No'
			ELSE 'Yes'
			END

	RETURN @output
END;
GO

--FUNCTION CODE ENDS HERE
USE Northwinds2019TSQLV5

SELECT OD.OrderId
	,P.ProductId
	,P.ProductName
	,C.CategoryName
	,'$ ' + CONVERT(NVARCHAR(20), SUM((OD.UnitPrice * OD.Quantity) * (1. - OD.DiscountPercentage))) AS TotalDicountedLineCost
	,dbo.isSomethingTrueOrFalse(OD.DiscountPercentage) AS IsDiscounted
FROM [Sales].[OrderDetail] AS OD
INNER JOIN [Production].[Product] AS P ON OD.ProductId = P.ProductId
INNER JOIN [Production].[Category] AS C ON P.CategoryId = C.CategoryId
GROUP BY OD.OrderId
	,P.ProductId
	,OD.DiscountPercentage
	,C.CategoryName
	,P.ProductName
ORDER BY OD.OrderId

/**
Problem 19:Find all the orders that were placed in 2013 and show the order date in form of fiscal year quarters with january  as the 1st month for first quarter
and also calculate the total amount paid for each order ID including taxes using WideWorldImporters?

Mudit Prashar -- COMPLEX
**/
--FUNCTION CODE BEGINS
IF OBJECT_ID('dbo.fiscalCalendarYear') IS NOT NULL
	DROP FUNCTION dbo.fiscalCalendarYear;
GO

CREATE FUNCTION dbo.fiscalCalendarYear (@date DATE)
RETURNS NVARCHAR(25)
AS
BEGIN
	DECLARE @getYear INT
		,@getMonth INT
		,@getDay INT
		,@output1 NVARCHAR(20)
		,@output2 NVARCHAR(20)

	SET @getYear = YEAR(@date)
	SET @getMonth = MONTH(@date)
	SET @getDay = DAY(@date)

	SELECT @output1 = CASE 
			WHEN (
					@getMonth >= 1
					AND @getMonth <= 3
					)
				THEN '-Quarter I'
			WHEN (
					@getMonth >= 4
					AND @getMonth <= 6
					)
				THEN '-Quarter II'
			WHEN (
					@getMonth >= 7
					AND @getMonth <= 9
					)
				THEN '-Quarter III'
			WHEN (
					@getMonth >= 10
					AND @getMonth <= 12
					)
				THEN '-Quarter IV'
			ELSE '0'
			END

	SET @output2 = @output1
	SET @output1 = CAST(@getYear AS NVARCHAR(20)) + @output2

	RETURN @output1
END;
GO

--FUNCTION CODE ENDS HERE
USE WideWorldImporters

SELECT DISTINCT O.OrderID
	,dbo.fiscalCalendarYear(O.OrderDate) AS FiscalOrderDate
	,'$ ' + CONVERT(NVARCHAR(255), SUM((OL.UnitPrice) * (1 + (OL.TaxRate / 100)))) AS AmountPaidIncludingTax
FROM [Sales].[Orders] AS O
INNER JOIN [Sales].[OrderLines] AS OL ON OL.OrderID = O.OrderID
INNER JOIN [Warehouse].[StockItems] AS S ON OL.StockItemID = S.StockItemID
WHERE YEAR(O.OrderDate) = '2013'
GROUP BY O.OrderID
	,dbo.fiscalCalendarYear(O.OrderDate)
ORDER BY OrderID

/**
Problem 20: Find the total quantities of each item that was ordered and also the tax amount for one quantity  using WideWorldImportersDW?

Mudit Prashar -- COMPLEX
**/
--FUNCTION CODE BEGINS
IF OBJECT_ID('dbo.taxonONE') IS NOT NULL
	DROP FUNCTION dbo.taxonONE;
GO

CREATE FUNCTION dbo.taxonONE (
	@unitprice NUMERIC(38, 2)
	,@taxrate NUMERIC(38, 2)
	)
RETURNS NUMERIC(38, 2)
AS
BEGIN
	DECLARE @output NUMERIC(38, 2);

	SET @output = (@unitprice * (@taxrate / 100));

	RETURN @output
END;
GO

--FUNCTION CODE ENDS HERE
USE WideWorldImportersDW

SELECT SI.[Stock Item Key]
	,SI.[Stock Item]
	,COUNT(SI.[Stock Item Key]) AS TotalNumberOrdered
	,dbo.taxonONE(OD.[Unit Price], OD.[Tax Rate]) AS TaxOnEachQuantity
FROM [Fact].[Order] AS OD
FULL OUTER JOIN [Fact].[Stock Holding] AS SH ON OD.[Stock Item Key] = SH.[Stock Item Key]
FULL OUTER JOIN [Dimension].[Stock Item] AS SI ON OD.[Stock Item Key] = SI.[Stock Item Key]
WHERE OD.[Customer Key] != '0'
GROUP BY SI.[Stock Item Key]
	,SI.[Stock Item]
	,od.[Tax Rate]
	,OD.[Unit Price]
ORDER BY SI.[Stock Item Key]