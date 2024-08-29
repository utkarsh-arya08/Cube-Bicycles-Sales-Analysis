Use adventure_works;

Select * from factsales;

-- checking the datatype of the each column
describe factsales;

-- disable the safe update mode if unabled
SET	SQL_SAFE_UPDATEs = 0;

-- Changing the format of the date column
update factsales
set OrderDateKey = str_to_date(OrderDateKey,'%d-%m-%Y');

-- Changing the datetype to datetype
alter table factsales
modify Column OrderDateKey date;

-- Changing the format of the date column
update factsales
set DueDateKey = str_to_date(DueDateKey,'%d-%m-%Y');

-- Changing the datetype to datetype
alter table factsales
modify Column DueDateKey date;

-- Changing the format of the date column
update factsales
set ShipDateKey = str_to_date(ShipDateKey,'%d-%m-%Y');

-- Changing the datetype to datetype
alter table factsales
modify Column ShipDateKey date;



