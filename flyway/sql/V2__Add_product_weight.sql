-- V2__Add_product_weight.sql
ALTER TABLE public.product
ADD COLUMN product_weight numeric(10,2);

COMMENT ON COLUMN public.product.product_weight IS 'Weight of the product in kilograms';