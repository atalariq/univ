-- PL/SQL Function
-- https://www.oracletutorial.com/plsql-tutorial/plsql-function/

-- EXAMPLE 1
-- Calculates total sales by year
CREATE OR REPLACE FUNCTION get_total_sales(
    in_year PLS_INTEGER
)
RETURN NUMBER
IS
    l_total_sales NUMBER := 0;
BEGIN
    -- get total sales
    SELECT SUM(unit_price * quantity)
    INTO l_total_sales
    FROM order_items
    INNER JOIN orders USING (order_id)
    WHERE status = 'Shipped'
    GROUP BY EXTRACT(YEAR FROM order_date)
    HAVING EXTRACT(YEAR FROM order_date) = in_year;

    -- return the total sales
    RETURN l_total_sales;
END;


-- Function Calling
SET SERVEROUTPUT ON;

DECLARE
    l_sales NUMBER := 0;
BEGIN
    l_sales := get_total_sales (2017);
    DBMS_OUTPUT.PUT_LINE('Sales 2017: ' || l_sales);
END;

-- Boolean Expression
SET SERVEROUTPUT ON;

BEGIN
    IF get_total_sales (2017) > 10000000 THEN
        DBMS_OUTPUT.PUT_LINE('Sales 2017 is above target');
    END IF;
END;

-- SQL Statement
SELECT
    get_total_sales(2017) sales_2017
FROM
    dual;

-- Removing function
DROP FUNCTION get_total_sales;

-- ---------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION get_avg_items_sold_per_year
RETURN NUMBER
IS
  l_avg NUMBER := 0;
BEGIN
  SELECT AVG(yearly_qty)
  INTO   l_avg
  FROM (
    SELECT EXTRACT(YEAR FROM o.order_date) AS yr,
           SUM(oi.quantity)                AS yearly_qty
    FROM   orders o
    JOIN   order_items oi USING (order_id)
    WHERE  o.status = 'Shipped'
    GROUP BY EXTRACT(YEAR FROM o.order_date)
  );

  RETURN ROUND(l_avg, 2);
END get_avg_items_sold_per_year;
/

DECLARE
  l_result NUMBER;
BEGIN
  l_result :=
    get_avg_items_sold_per_year();
  DBMS_OUTPUT.PUT_LINE(
    'Rata-rata item/tahun: '
    || l_result
  );
END;
/

SELECT
  get_avg_items_sold_per_year()
    AS avg_items_per_year
FROM dual;

-- ---------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION get_customers_by_order_year(
  in_year IN PLS_INTEGER
)
RETURN SYS_REFCURSOR
IS
  l_cursor SYS_REFCURSOR;
BEGIN
  OPEN l_cursor FOR
    SELECT DISTINCT
           c.customer_id,
           c.name,
           c.address
    FROM   customers c
    JOIN   orders o
           ON c.customer_id = o.customer_id
    WHERE  EXTRACT(YEAR FROM o.order_date) = in_year
    ORDER BY c.name;

  RETURN l_cursor;
END get_customers_by_order_year;
/

DECLARE
  l_cur       SYS_REFCURSOR;
  l_id        customers.customer_id%TYPE;
  l_name      customers.name%TYPE;
  l_address   customers.address%TYPE;
BEGIN
  l_cur := get_customers_by_order_year(2017);

  LOOP
    FETCH l_cur INTO l_id, l_name, l_address;
    EXIT WHEN l_cur%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE(
      l_id || ' | ' || l_name || ' | ' || l_address
    );
  END LOOP;

  CLOSE l_cur;
END;
/

-- ---------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION get_order_status_label(
  in_status IN VARCHAR2
)
RETURN VARCHAR2
IS
BEGIN
  RETURN CASE UPPER(TRIM(in_status))
    WHEN 'PENDING'   THEN 'Menunggu Konfirmasi'
    WHEN 'PROCESSING' THEN 'Sedang Diproses'
    WHEN 'SHIPPED'   THEN 'Sudah Dikirim'
    WHEN 'DELIVERED' THEN 'Sudah Diterima'
    WHEN 'CANCELLED' THEN 'Dibatalkan'
    ELSE                  'Status Tidak Dikenal'
  END;
END get_order_status_label;
/


BEGIN
  DBMS_OUTPUT.PUT_LINE(
    get_order_status_label('shipped')
  );
  -- Output: Sudah Dikirim

  DBMS_OUTPUT.PUT_LINE(
    get_order_status_label('  Pending  ')
  );
  -- Output: Menunggu Konfirmasi
END;
/

SELECT
  order_id,
  status,
  get_order_status_label(status)
    AS status_label
FROM orders
WHERE ROWNUM <= 10;
