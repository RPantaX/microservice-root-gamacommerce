-- PostgreSQL script para datos iniciales del sistema de orders
-- Datos de ejemplo para métodos de compra/envío

-- ======================================
-- MÉTODOS DE COMPRA/ENVÍO
-- ======================================

INSERT INTO shopping_method (
    shopping_method_name,
    shopping_method_description,
    shopping_method_price,
    shopping_method_delivery_time,
    state,
    modified_by_user,
    created_at
) VALUES
-- Métodos de envío a domicilio
(
    'Envío Estándar',
    'Entrega a domicilio en horario laboral de 8:00 AM a 6:00 PM. Tiempo estimado de 3 a 5 días hábiles.',
    15.00,
    '3-5 días hábiles',
    TRUE,
    'admin',
    CURRENT_TIMESTAMP
),
(
    'Envío Express',
    'Entrega rápida a domicilio en 24-48 horas. Disponible en zona metropolitana.',
    25.00,
    '1-2 días hábiles',
    TRUE,
    'admin',
    CURRENT_TIMESTAMP
),
(
    'Envío Premium',
    'Entrega el mismo día para pedidos realizados antes de las 12:00 PM. Solo zona centro de la ciudad.',
    35.00,
    'Mismo día',
    TRUE,
    'admin',
    CURRENT_TIMESTAMP
),

-- Recojo en tienda
(
    'Recojo en Tienda',
    'Retira tu pedido directamente en nuestro salón de belleza. Sin costo adicional.',
    0.00,
    'Inmediato',
    TRUE,
    'admin',
    CURRENT_TIMESTAMP
),
(
    'Recojo en Tienda - Programado',
    'Programa la fecha y hora de recojo en nuestro salón. Ideal para servicios y productos.',
    0.00,
    'Fecha programada',
    TRUE,
    'admin',
    CURRENT_TIMESTAMP
),

-- Métodos especiales
(
    'Envío Nacional',
    'Envío a nivel nacional a través de courier especializado. Para pedidos fuera de la ciudad.',
    45.00,
    '5-7 días hábiles',
    TRUE,
    'admin',
    CURRENT_TIMESTAMP
),
(
    'Envío Internacional',
    'Envío internacional para productos seleccionados. Tiempo variable según destino.',
    120.00,
    '10-15 días hábiles',
    TRUE,
    'admin',
    CURRENT_TIMESTAMP
),



-- Métodos promocionales o especiales
(
    'Envío Gratuito - Promoción',
    'Envío sin costo para compras mayores a $150. Promoción por tiempo limitado.',
    0.00,
    '3-5 días hábiles',
    TRUE,
    'admin',
    CURRENT_TIMESTAMP
),
(
    'Entrega Programada',
    'Programa la fecha y hora exacta de entrega. Perfecto para regalos y ocasiones especiales.',
    20.00,
    'Fecha programada',
    TRUE,
    'admin',
    CURRENT_TIMESTAMP
);

-- ======================================
-- VERIFICACIÓN DE DATOS INSERTADOS
-- ======================================

-- Mostrar todos los métodos de envío insertados
SELECT
    shopping_method_id,
    shopping_method_name,
    shopping_method_description,
    shopping_method_price,
    shopping_method_delivery_time,
    state,
    created_at
FROM shopping_method
WHERE state = TRUE
ORDER BY shopping_method_price ASC;