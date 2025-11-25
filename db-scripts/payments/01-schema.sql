
-- PostgreSQL script para crear el esquema de payment
-- Base de datos: db_payment
-- Usuario: fazt

-- Crear tipos enum
CREATE TYPE payment_type_enum AS ENUM ('CREDIT_CARD', 'DEBIT_CARD', 'PAYPAL', 'CASH', 'TRANSFER', 'QR_CODE');

-- Crear tabla de pagos
CREATE TABLE IF NOT EXISTS payment (
                                       payment_id BIGSERIAL PRIMARY KEY,
                                       payment_provider VARCHAR(255) NOT NULL,
                                       payment_account_number BIGINT NOT NULL,
                                       payment_expiration_date TIME NOT NULL,
                                       payment_total_price DECIMAL(12,2) NOT NULL,
                                       paymen_is_default BOOLEAN NOT NULL,
                                       user_id BIGINT,
                                       shop_order_id BIGINT NOT NULL,
                                       payment_entity payment_type_enum NOT NULL
);

-- Crear índices para mejorar el rendimiento
CREATE INDEX IF NOT EXISTS idx_payment_user ON payment(user_id);
CREATE INDEX IF NOT EXISTS idx_payment_shop_order ON payment(shop_order_id);
CREATE INDEX IF NOT EXISTS idx_payment_type ON payment(payment_entity);
CREATE INDEX IF NOT EXISTS idx_payment_provider ON payment(payment_provider);

-- Comentarios para documentación
COMMENT ON TABLE payment IS 'Pagos del sistema';

COMMENT ON COLUMN payment.payment_id IS 'ID único del pago';
COMMENT ON COLUMN payment.payment_provider IS 'Proveedor del servicio de pago';
COMMENT ON COLUMN payment.payment_account_number IS 'Número de cuenta del pago';
COMMENT ON COLUMN payment.payment_expiration_date IS 'Fecha de expiración del pago';
COMMENT ON COLUMN payment.payment_total_price IS 'Precio total del pago';
COMMENT ON COLUMN payment.paymen_is_default IS 'Indica si es el método de pago por defecto';
COMMENT ON COLUMN payment.user_id IS 'ID del usuario que realizó el pago';
COMMENT ON COLUMN payment.shop_order_id IS 'ID de la orden asociada al pago';
COMMENT ON COLUMN payment.payment_entity IS 'Tipo de pago utilizado';