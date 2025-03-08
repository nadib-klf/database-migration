-- Create Discount Table
CREATE TABLE IF NOT EXISTS public.discount (
    discount_id SERIAL PRIMARY KEY,
    product_id INTEGER NOT NULL,
    discount_code VARCHAR(50) NOT NULL UNIQUE,
    discount_percentage NUMERIC(5,2) NOT NULL,
    valid_from DATE NOT NULL,
    valid_to DATE NOT NULL,
    max_uses INTEGER DEFAULT 0,
    is_active BOOLEAN DEFAULT true,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_product FOREIGN KEY (product_id) REFERENCES public.product(product_id) ON DELETE CASCADE
);
