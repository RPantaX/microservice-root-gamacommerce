-- PostgreSQL script para crear el esquema de orders
-- Base de datos: db_orders
-- Usuario: fazt

-- Crear tipos enum
CREATE TYPE shop_order_status_enum AS ENUM ('CREATED', 'APPROVED', 'REJECTED');
CREATE TYPE order_line_status_enum AS ENUM ('PENDING', 'CONFIRMED', 'SHIPPED', 'DELIVERED', 'CANCELLED');
CREATE TYPE shop_order_history_status_enum AS ENUM ('CREATED', 'APPROVED', 'REJECTED', 'SHIPPED', 'DELIVERED', 'CANCELLED');
CREATE TYPE payment_type_enum AS ENUM ('CREDIT_CARD', 'DEBIT_CARD', 'PAYPAL', 'CASH', 'TRANSFER', 'QR_CODE');

-- Crear tabla de direcciones
CREATE TABLE IF NOT EXISTS address (
                                       address_id BIGSERIAL PRIMARY KEY,
                                       address_street VARCHAR(255) NOT NULL,
                                       address_city VARCHAR(255) NOT NULL,
                                       address_state VARCHAR(255) NOT NULL,
                                       address_postal_code VARCHAR(20),
                                       address_country VARCHAR(100) NOT NULL
);

-- Crear tabla de métodos de compra/envío
CREATE TABLE IF NOT EXISTS shopping_method (
                                               shopping_method_id BIGSERIAL PRIMARY KEY,
                                               shopping_method_name VARCHAR(255) NOT NULL UNIQUE,
                                               shopping_method_description TEXT,
                                               shopping_method_price DECIMAL(10,2) NOT NULL DEFAULT 0.00,
                                               shopping_method_delivery_time VARCHAR(100),
                                               state BOOLEAN NOT NULL DEFAULT TRUE,
                                               modified_by_user VARCHAR(15) NOT NULL,
                                               created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
                                               modified_at TIMESTAMP NULL,
                                               deleted_at TIMESTAMP NULL
);

-- Crear tabla de órdenes de compra
CREATE TABLE IF NOT EXISTS shop_order (
                                          shop_order_id BIGSERIAL PRIMARY KEY,
                                          shop_order_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
                                          shop_order_total DECIMAL(12,2),
                                          shop_order_status shop_order_status_enum NOT NULL DEFAULT 'CREATED',
                                          user_id BIGINT NOT NULL,
                                          Company_ID BIGINT,
                                          address_id BIGINT,
                                          shopping_method_id BIGINT NOT NULL,
                                          modified_by_user VARCHAR(15) NOT NULL,
                                          created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
                                          modified_at TIMESTAMP NULL,
                                          deleted_at TIMESTAMP NULL,
                                          CONSTRAINT fk_shop_order_address
                                              FOREIGN KEY (address_id)
                                                  REFERENCES address(address_id),
                                          CONSTRAINT fk_shop_order_shopping_method
                                              FOREIGN KEY (shopping_method_id)
                                                  REFERENCES shopping_method(shopping_method_id)
);

-- Crear tabla de facturas (CDP)
CREATE TABLE IF NOT EXISTS CDP (
                                       CDP_number BIGSERIAL PRIMARY KEY,
                                       CDP_serie VARCHAR(10) NOT NULL,
                                       CDP_serienumber VARCHAR(20) NOT NULL,
                                       CDP_emision TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
                                       subtotal DECIMAL(12,2) NOT NULL DEFAULT 0.00,
                                       igv DECIMAL(12,2) NOT NULL DEFAULT 0.00,
                                       discounts DECIMAL(12,2) NOT NULL DEFAULT 0.00,
                                       anticipios DECIMAL(12,2) NOT NULL DEFAULT 0.00,
                                       valor_venta DECIMAL(12,2) NOT NULL DEFAULT 0.00,
                                       isc DECIMAL(12,2) DEFAULT 0.00,
                                       icbper DECIMAL(12,2) DEFAULT 0.00,
                                       otros_cargos DECIMAL(12,2) DEFAULT 0.00,
                                       otros_tributos DECIMAL(12,2) DEFAULT 0.00,
                                       monto_redondeo DECIMAL(12,2) NOT NULL DEFAULT 0.00,
                                       total DECIMAL(12,2) NOT NULL DEFAULT 0.00,
                                       observacion TEXT,
                                       usuario_modificador VARCHAR(100) NOT NULL,
                                       emisor_ruc VARCHAR(11) NOT NULL,
                                       shop_order_id BIGINT,
                                       state BOOLEAN NOT NULL DEFAULT TRUE,
                                       modified_by_user VARCHAR(15) NOT NULL,
                                       created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
                                       modified_at TIMESTAMP NULL,
                                       deleted_at TIMESTAMP NULL,
                                       CONSTRAINT fk_shop_order_CDP
                                              FOREIGN KEY (shop_order_id)
                                                  REFERENCES shop_order(shop_order_id) ON DELETE CASCADE,
                                       CONSTRAINT uk_CDP_serie_numero UNIQUE (CDP_serie, CDP_serienumber)
);

-- Crear tabla de líneas de orden
CREATE TABLE IF NOT EXISTS order_line (
                                          order_line_id BIGSERIAL PRIMARY KEY,
                                          order_line_quantity INTEGER NOT NULL DEFAULT 1,
                                          order_line_price DECIMAL(10,2) NOT NULL,
                                          order_line_total DECIMAL(12,2) NOT NULL,
                                          order_line_state order_line_status_enum NOT NULL DEFAULT 'PENDING',
                                          product_item_id BIGINT,
                                          reservation_id BIGINT,
                                          guia_remision_id BIGINT,
                                          shop_order_id BIGINT,
                                          CONSTRAINT fk_order_line_shop_order
                                              FOREIGN KEY (shop_order_id)
                                                  REFERENCES shop_order(shop_order_id) ON DELETE CASCADE,
                                          CONSTRAINT chk_order_line_item_or_reservation
                                              CHECK (product_item_id IS NOT NULL OR reservation_id IS NOT NULL)
);

-- Crear tabla de historial de órdenes
CREATE TABLE IF NOT EXISTS shop_order_history (
                                                  shop_order_history_id BIGSERIAL PRIMARY KEY,
                                                  shop_order_id BIGINT NOT NULL,
                                                  status shop_order_history_status_enum NOT NULL,
                                                  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
                                                  CONSTRAINT fk_shop_order_history_order
                                                      FOREIGN KEY (shop_order_id)
                                                          REFERENCES shop_order(shop_order_id) ON DELETE CASCADE
);

-- Crear índices para mejorar el rendimiento
CREATE INDEX IF NOT EXISTS idx_shop_order_user ON shop_order(user_id);
CREATE INDEX IF NOT EXISTS idx_shop_order_status ON shop_order(shop_order_status);
CREATE INDEX IF NOT EXISTS idx_shop_order_date ON shop_order(shop_order_date);
CREATE INDEX IF NOT EXISTS idx_shop_order_address ON shop_order(address_id);
CREATE INDEX IF NOT EXISTS idx_shop_order_shopping_method ON shop_order(shopping_method_id);

CREATE INDEX IF NOT EXISTS idx_order_line_shop_order ON order_line(shop_order_id);
CREATE INDEX IF NOT EXISTS idx_order_line_product_item ON order_line(product_item_id);
CREATE INDEX IF NOT EXISTS idx_order_line_reservation ON order_line(reservation_id);

CREATE INDEX IF NOT EXISTS idx_shop_order_history_order ON shop_order_history(shop_order_id);
CREATE INDEX IF NOT EXISTS idx_shop_order_history_status ON shop_order_history(status);

CREATE INDEX IF NOT EXISTS idx_CDP_emisor ON CDP(emisor_ruc);
CREATE INDEX IF NOT EXISTS idx_CDP_fecha ON CDP(CDP_emision);
CREATE INDEX IF NOT EXISTS idx_CDP_serie ON CDP(CDP_serie, CDP_number);

CREATE INDEX IF NOT EXISTS idx_address_city_state ON address(address_city, address_state);
CREATE INDEX IF NOT EXISTS idx_address_country ON address(address_country);

-- Comentarios para documentación
COMMENT ON TABLE address IS 'Direcciones de entrega para las órdenes';
COMMENT ON TABLE shopping_method IS 'Métodos de envío/entrega disponibles';
COMMENT ON TABLE shop_order IS 'Órdenes de compra principales del sistema';
COMMENT ON TABLE order_line IS 'Líneas de detalle de cada orden (productos o servicios)';
COMMENT ON TABLE CDP IS 'Facturas (CDPs) generadas para las órdenes';
COMMENT ON TABLE shop_order_history IS 'Historial de cambios de estado de las órdenes';

COMMENT ON COLUMN shop_order.user_id IS 'ID del usuario que realizó la orden';
COMMENT ON COLUMN order_line.product_item_id IS 'ID del producto (si aplica)';
COMMENT ON COLUMN order_line.reservation_id IS 'ID de la reserva de servicio (si aplica)';
COMMENT ON COLUMN order_line.guia_remision_id IS 'ID de la guía de remisión para envío';