--1-      کل فروش شرکت چه مقدار است


select sum(s.Quantity*s.UnitPrice) as TotalSales from salesTable s


--2-      تعداد متمایز مشتریانی که از این شرکت خرید داشته اند، چند تاست؟


select COUNT(distinct Customer) as distinctCustomers from salesTable

--3-      این شرکت از هر محصول چه مقدار فروخته است؟


select s.Product ,COUNT(s.Product) countProduct from salesTable s
group by s.Product


4-      یک کوئری بنویسید که در آن مشتریانی نمایش داده شوند که حداقل یک فاکتور بیش
از مبلغ 1500 دارند و به ازای هر کدام از این مشتریان، مبلغ خرید، تعداد فاکتور و
تعداد آیتم خریداری شده نمایش داده شود.

SELECT
  s.Customer,
  SUM(s.UnitPrice * s.Quantity) AS TotalPurchaseAmount,
  COUNT(DISTINCT s.OrderID) AS NumberOfInvoices,
  SUM(s.Quantity) AS TotalItemsPurchased
FROM
  salesTable AS s
GROUP BY
  s.Customer
HAVING
  SUM(s.UnitPrice * s.Quantity) > 1500;


--مبلغ سود و درصد سود حاصل از فروش کل را محاسبه نمایید.
SELECT
  SUM(st.Quantity * st.UnitPrice) AS TotalSales,
  SUM(st.Quantity * st.UnitPrice * sp.salesprofit) AS TotalProfit,
  (SUM(st.Quantity * st.UnitPrice * sp.salesprofit) / 
  SUM(st.Quantity * st.UnitPrice)) * 100 AS ProfitPercentage
FROM
  SalesTable st
JOIN
  salesprofit sp ON st.Product = sp.salesprofit;





  -- با فرض اینکه خریدهای هر مشتری در هر روز فقط 1 بار شمرده شود، در مجموع چندمشتری از شرکت خرید داشته اند
SELECT SUM(UniqueCustomers) AS SumTotalSales
FROM (
    SELECT  COUNT(DISTINCT s.Customer) AS UniqueCustomers 
    FROM SalesTable s
    GROUP BY Date
) AS SalesSummary;



--ب – جدول چارت سازمانی که در لینک زیر نیز قابل مشاهده است، مربوط به چارت
--سازمانی شرکت پخش مذکور می باشد که نام و آی دی هر کارشناس به همراه مدیر مستقیم
--بالادستی و آیدی مدیر بالادستی را نمایش می ده









SELECT e.Name AS EmployeeName, e.Id AS EmployeeId, m.Name AS ManagerName, m.Id AS ManagerId
FROM chartorga e
inner JOIN chartorga m ON e.[Manager Id] = m.Id
order by 4



CREATE TABLE chartorga (
  Id INT,
  Name VARCHAR(50),
  Manager VARCHAR(50),
  ManagerId INT
);


INSERT INTO chartorga (Id, Name, Manager, ManagerId)
VALUES (1	,"Ken"),
       (2	,"Hugo"),
       (3	,"James"	,"Carol"	,5),
	   (4	,"Mark","Morgan",13),
	   (5	,"Carol"	,"Alex",	12),
	   (6,  "David",	"Rose"	,21),
       (7	,"Michael",	Markos",	11),
		(8	,"Brad"	,"Alex",	12),
		(9	"Rob","	Matt",	15),
		(10	"Dylan"	,"Alex",	12),
		(11	"Markos","	Carol",	5),
		(12	"Alex"	,"Ken",	1),
		(13	"Morgan"	,"Matt",	15),
		(14	"Jennifer",	"Morgan",	13),
		(15	"Matt","	Hugo",	2),
		(16	"Tom"	,"Brad",	8),
		(17	"Oliver",	,"Dylan",	10),
		(18	"Daniel",	"Rob",	9),
		(19	,"Amanda",	Markos",	11),
		(20	,"Ana	","Dylan"	10),
		(21	Rose	Rob	9),
		(22	,"Robert","Rob",	9),
		(23,"Fill","	"Morgan"	13),
		(24	"Antoan","	David",	6)
		(25	"Eddie","	Mark"	4);