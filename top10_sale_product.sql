with top10_SaleProduct as 
(
SELECT prodid, SUM(subtotal) as sale_product
from stg_order
group by prodid
)
SELECT stg_product.prodid,stg_product."Name", stg_product."Model", top10_SaleProduct.sale_product
FROM stg_product JOIN top10_SaleProduct on stg_product.prodid=top10_SaleProduct.prodi