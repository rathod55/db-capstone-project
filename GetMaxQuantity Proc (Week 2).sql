CREATE PROCEDURE GetMaxQuantity() SELECT MAX(QUANTITY) AS GetMaxQuantity from ORDERS;
CALL GetMaxQuantity();