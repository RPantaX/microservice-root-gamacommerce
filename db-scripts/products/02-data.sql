-- PostgreSQL script para datos iniciales de productos
-- Datos de ejemplo para el sistema de productos de salón de belleza

-- ======================================
-- CATEGORÍAS DE PRODUCTOS
-- ======================================

-- Insertar categorías principales
-- INSERTAR CATEGORÍAS PRINCIPALES
INSERT INTO Product_Category (Product_Category_Name, Product_Category_Parent_ID, state, modified_by_user, created_at) VALUES
                                                                                                                          ('ROPA PARA HOMBRES', NULL, TRUE, 'SYSTEM', CURRENT_TIMESTAMP),
                                                                                                                          ('ROPA PARA MUJERES', NULL, TRUE, 'SYSTEM', CURRENT_TIMESTAMP),
                                                                                                                          ('ROPA PARA NIÑOS', NULL, TRUE, 'SYSTEM', CURRENT_TIMESTAMP),
                                                                                                                          ('ROPA DEPORTIVA', NULL, TRUE, 'SYSTEM', CURRENT_TIMESTAMP),
                                                                                                                          ('ROPA INTERIOR', NULL, TRUE, 'SYSTEM', CURRENT_TIMESTAMP),
                                                                                                                          ('CALZADO', NULL, TRUE, 'SYSTEM', CURRENT_TIMESTAMP),
                                                                                                                          ('ACCESORIOS DE MODA', NULL, TRUE, 'SYSTEM', CURRENT_TIMESTAMP),
                                                                                                                          ('ABRIGOS', NULL, TRUE, 'SYSTEM', CURRENT_TIMESTAMP),
                                                                                                                          ('CHAQUETAS', NULL, TRUE, 'SYSTEM', CURRENT_TIMESTAMP),
                                                                                                                          ('TRAJES', NULL, TRUE, 'SYSTEM', CURRENT_TIMESTAMP),
                                                                                                                          ('VESTIDOS', NULL, TRUE, 'SYSTEM', CURRENT_TIMESTAMP),
                                                                                                                          ('JEANS', NULL, TRUE, 'SYSTEM', CURRENT_TIMESTAMP),
                                                                                                                          ('PANTALONES', NULL, TRUE, 'SYSTEM', CURRENT_TIMESTAMP);
-- ======================================
-- PROMOCIONES POR COMPAÑÍA
-- Sistema de Productos de Ropa
-- ======================================

-- ======================================
-- PROMOCIONES COMPAÑÍA 1
-- ======================================

INSERT INTO Promotion (Promotion_Name, Promotion_Description, Promotion_Discount_Rate, Promotion_Start_Date, Promotion_End_Date, Company_ID, state, modified_by_user, created_at) VALUES
-- Promoción 1 - COMPANY 1
('VERANO FASHION 2025', 'DESCUENTO ESPECIAL EN ROPA DE VERANO PARA TODA LA FAMILIA', 20.00, '2025-12-01 00:00:00', '2026-02-28 23:59:59', 1, TRUE, 'ADMIN', CURRENT_TIMESTAMP),

-- Promoción 2 - COMPANY 1
('BLACK FRIDAY STYLE', 'DESCUENTOS MASIVOS EN TODA LA LÍNEA DE ROPA PARA HOMBRES Y ACCESORIOS', 30.00, '2025-11-24 00:00:00', '2025-11-30 23:59:59', 1, TRUE, 'ADMIN', CURRENT_TIMESTAMP),

-- Promoción 3 - COMPANY 1
('REGRESO A CLASES', 'PROMOCIÓN ESPECIAL EN ROPA DEPORTIVA Y CALZADO INFANTIL', 15.00, '2026-02-15 00:00:00', '2026-03-15 23:59:59', 1, TRUE, 'ADMIN', CURRENT_TIMESTAMP),

-- Promoción 4 - COMPANY 1
('CYBER MONDAY URBAN', 'DESCUENTOS EN ZAPATILLAS Y ACCESORIOS URBANOS', 25.00, '2025-12-02 00:00:00', '2025-12-02 23:59:59', 1, TRUE, 'ADMIN', CURRENT_TIMESTAMP);

-- ======================================
-- PROMOCIONES COMPAÑÍA 2
-- ======================================

INSERT INTO Promotion (Promotion_Name, Promotion_Description, Promotion_Discount_Rate, Promotion_Start_Date, Promotion_End_Date, Company_ID, state, modified_by_user, created_at) VALUES
-- Promoción 5 - COMPANY 2
('OTOÑO ELEGANTE', 'DESCUENTO EN CAMISAS FORMALES Y ROPA DE VESTIR', 18.00, '2026-03-01 00:00:00', '2026-05-31 23:59:59', 2, TRUE, 'ADMIN', CURRENT_TIMESTAMP),

-- Promoción 6 - COMPANY 2
('DÍA DEL NIÑO 2026', 'PROMOCIÓN ESPECIAL EN TODA LA LÍNEA INFANTIL', 22.00, '2026-04-15 00:00:00', '2026-04-30 23:59:59', 2, TRUE, 'ADMIN', CURRENT_TIMESTAMP),

-- Promoción 7 - COMPANY 2
('JEANS LOVER', 'DESCUENTO ESPECIAL EN TODA LA COLECCIÓN DE JEANS', 20.00, '2025-12-15 00:00:00', '2026-01-15 23:59:59', 2, TRUE, 'ADMIN', CURRENT_TIMESTAMP),

-- Promoción 8 - COMPANY 2
('CALZADO DE TEMPORADA', 'OFERTAS EN BOTINES Y CALZADO DE CUERO', 17.00, '2026-05-01 00:00:00', '2026-06-30 23:59:59', 2, TRUE, 'ADMIN', CURRENT_TIMESTAMP);

-- ======================================
-- PROMOCIONES COMPAÑÍA 3
-- ======================================

INSERT INTO Promotion (Promotion_Name, Promotion_Description, Promotion_Discount_Rate, Promotion_Start_Date, Promotion_End_Date, Company_ID, state, modified_by_user, created_at) VALUES
-- Promoción 9 - COMPANY 3
('INVIERNO CHIC', 'DESCUENTO EN ABRIGOS Y PARKAS DE INVIERNO', 28.00, '2026-05-15 00:00:00', '2026-07-31 23:59:59', 3, TRUE, 'ADMIN', CURRENT_TIMESTAMP),

-- Promoción 10 - COMPANY 3
('MUJER MODERNA', 'PROMOCIÓN EN BLUSAS Y ROPA FEMENINA DE TEMPORADA', 19.00, '2025-12-20 00:00:00', '2026-01-20 23:59:59', 3, TRUE, 'ADMIN', CURRENT_TIMESTAMP),

-- Promoción 11 - COMPANY 3
('PRIMAVERA KIDS', 'DESCUENTOS EN ROPA PARA NIÑOS Y CASACAS', 23.00, '2025-09-01 00:00:00', '2025-10-31 23:59:59', 3, TRUE, 'ADMIN', CURRENT_TIMESTAMP),

-- Promoción 12 - COMPANY 3
('ACCESORIOS PREMIUM', 'OFERTAS EN MOCHILAS Y ACCESORIOS DE MODA', 16.00, '2026-01-10 00:00:00', '2026-02-10 23:59:59', 3, TRUE, 'ADMIN', CURRENT_TIMESTAMP);

-- ======================================
-- RELACIÓN PROMOCIONES CON CATEGORÍAS
-- ======================================

-- PROMOCIONES COMPANY 1
INSERT INTO Promotion_Product_Category (Promotion_ID, Product_Category_ID) VALUES
-- Promoción 1: VERANO FASHION 2025
(1, 1),  -- ROPA PARA HOMBRES
(1, 2),  -- ROPA PARA MUJERES
(1, 3),  -- ROPA PARA NIÑOS

-- Promoción 2: BLACK FRIDAY STYLE
(2, 1),  -- ROPA PARA HOMBRES
(2, 7),  -- ACCESORIOS DE MODA

-- Promoción 3: REGRESO A CLASES
(3, 3),  -- ROPA PARA NIÑOS
(3, 4),  -- ROPA DEPORTIVA
(3, 6),  -- CALZADO

-- Promoción 4: CYBER MONDAY URBAN
(4, 6),  -- CALZADO
(4, 7);  -- ACCESORIOS DE MODA

-- PROMOCIONES COMPANY 2
INSERT INTO Promotion_Product_Category (Promotion_ID, Product_Category_ID) VALUES
-- Promoción 5: OTOÑO ELEGANTE
(5, 1),  -- ROPA PARA HOMBRES
(5, 10), -- TRAJES
(5, 9),  -- CHAQUETAS

-- Promoción 6: DÍA DEL NIÑO 2026
(6, 3),  -- ROPA PARA NIÑOS

-- Promoción 7: JEANS LOVER
(7, 12), -- JEANS
(7, 13), -- PANTALONES

-- Promoción 8: CALZADO DE TEMPORADA
(8, 6);  -- CALZADO

-- PROMOCIONES COMPANY 3
INSERT INTO Promotion_Product_Category (Promotion_ID, Product_Category_ID) VALUES
-- Promoción 9: INVIERNO CHIC
(9, 8),  -- ABRIGOS
(9, 9),  -- CHAQUETAS

-- Promoción 10: MUJER MODERNA
(10, 2), -- ROPA PARA MUJERES
(10, 11),-- VESTIDOS

-- Promoción 11: PRIMAVERA KIDS
(11, 3), -- ROPA PARA NIÑOS

-- Promoción 12: ACCESORIOS PREMIUM
(12, 7); -- ACCESORIOS DE MODA

-- ======================================
-- RESUMEN DE PROMOCIONES
-- ======================================

/*
COMPANY 1 (4 PROMOCIONES):
- VERANO FASHION 2025: 20% en Ropa Hombres, Mujeres y Niños
- BLACK FRIDAY STYLE: 30% en Ropa Hombres y Accesorios
- REGRESO A CLASES: 15% en Ropa Niños, Deportiva y Calzado
- CYBER MONDAY URBAN: 25% en Calzado y Accesorios

COMPANY 2 (4 PROMOCIONES):
- OTOÑO ELEGANTE: 18% en Ropa Hombres, Trajes y Chaquetas
- DÍA DEL NIÑO 2026: 22% en Ropa para Niños
- JEANS LOVER: 20% en Jeans y Pantalones
- CALZADO DE TEMPORADA: 17% en Calzado

COMPANY 3 (4 PROMOCIONES):
- INVIERNO CHIC: 28% en Abrigos y Chaquetas
- MUJER MODERNA: 19% en Ropa Mujeres y Vestidos
- PRIMAVERA KIDS: 23% en Ropa para Niños
- ACCESORIOS PREMIUM: 16% en Accesorios de Moda

TOTAL: 12 PROMOCIONES (4 por compañía)
*/
-- ======================================
-- VARIACIONES
-- ======================================

-- ======================================
-- VARIACIONES COMPANY 1
-- ======================================

INSERT INTO Variation (Variation_Name, Product_Category_ID, Company_ID, state, modified_by_user, created_at) VALUES
-- VARIACIONES PARA ROPA PARA HOMBRES (ID: 1)
('TALLA', 1, 1, TRUE, 'ADMIN', CURRENT_TIMESTAMP),
('COLOR', 1, 1, TRUE, 'ADMIN', CURRENT_TIMESTAMP),

-- VARIACIONES PARA ROPA PARA MUJERES (ID: 2)
('TALLA', 2, 1, TRUE, 'ADMIN', CURRENT_TIMESTAMP),
('COLOR', 2, 1, TRUE, 'ADMIN', CURRENT_TIMESTAMP),

-- VARIACIONES PARA CALZADO (ID: 6)
('TALLA CALZADO', 6, 1, TRUE, 'ADMIN', CURRENT_TIMESTAMP),
('COLOR', 6, 1, TRUE, 'ADMIN', CURRENT_TIMESTAMP),

-- VARIACIONES PARA ACCESORIOS (ID: 7)
('COLOR', 7, 1, TRUE, 'ADMIN', CURRENT_TIMESTAMP),
('TAMAÑO', 7, 1, TRUE, 'ADMIN', CURRENT_TIMESTAMP);

-- ======================================
-- VARIACIONES COMPANY 2
-- ======================================

INSERT INTO Variation (Variation_Name, Product_Category_ID, Company_ID, state, modified_by_user, created_at) VALUES
-- VARIACIONES PARA ROPA PARA HOMBRES (ID: 1)
('TALLA', 1, 2, TRUE, 'ADMIN', CURRENT_TIMESTAMP),
('COLOR', 1, 2, TRUE, 'ADMIN', CURRENT_TIMESTAMP),

-- VARIACIONES PARA ROPA PARA NIÑOS (ID: 3)
('TALLA', 3, 2, TRUE, 'ADMIN', CURRENT_TIMESTAMP),
('COLOR', 3, 2, TRUE, 'ADMIN', CURRENT_TIMESTAMP),
('EDAD', 3, 2, TRUE, 'ADMIN', CURRENT_TIMESTAMP),

-- VARIACIONES PARA CALZADO (ID: 6)
('TALLA CALZADO', 6, 2, TRUE, 'ADMIN', CURRENT_TIMESTAMP),
('COLOR', 6, 2, TRUE, 'ADMIN', CURRENT_TIMESTAMP),

-- VARIACIONES PARA JEANS (ID: 12)
('TALLA', 12, 2, TRUE, 'ADMIN', CURRENT_TIMESTAMP),
('COLOR', 12, 2, TRUE, 'ADMIN', CURRENT_TIMESTAMP);

-- ======================================
-- VARIACIONES COMPANY 3
-- ======================================

INSERT INTO Variation (Variation_Name, Product_Category_ID, Company_ID, state, modified_by_user, created_at) VALUES
-- VARIACIONES PARA ROPA PARA MUJERES (ID: 2)
('TALLA', 2, 3, TRUE, 'ADMIN', CURRENT_TIMESTAMP),
('COLOR', 2, 3, TRUE, 'ADMIN', CURRENT_TIMESTAMP),

-- VARIACIONES PARA ROPA PARA NIÑOS (ID: 3)
('TALLA', 3, 3, TRUE, 'ADMIN', CURRENT_TIMESTAMP),
('COLOR', 3, 3, TRUE, 'ADMIN', CURRENT_TIMESTAMP),
('EDAD', 3, 3, TRUE, 'ADMIN', CURRENT_TIMESTAMP),

-- VARIACIONES PARA ACCESORIOS (ID: 7)
('COLOR', 7, 3, TRUE, 'ADMIN', CURRENT_TIMESTAMP),
('TAMAÑO', 7, 3, TRUE, 'ADMIN', CURRENT_TIMESTAMP),

-- VARIACIONES PARA ABRIGOS (ID: 8)
('TALLA', 8, 3, TRUE, 'ADMIN', CURRENT_TIMESTAMP),
('COLOR', 8, 3, TRUE, 'ADMIN', CURRENT_TIMESTAMP);

-- ======================================
-- OPCIONES DE VARIACIÓN - COMPANY 1
-- ======================================

-- OPCIONES PARA TALLA ROPA HOMBRES - COMPANY 1 (VARIATION_ID: 1)
INSERT INTO Variation_Option (Variation_Option_Value, Variation_ID, state, modified_by_user, created_at) VALUES
                                                                                                             ('S', 1, TRUE, 'ADMIN', CURRENT_TIMESTAMP),
                                                                                                             ('M', 1, TRUE, 'ADMIN', CURRENT_TIMESTAMP),
                                                                                                             ('L', 1, TRUE, 'ADMIN', CURRENT_TIMESTAMP),
                                                                                                             ('XL', 1, TRUE, 'ADMIN', CURRENT_TIMESTAMP),
                                                                                                             ('XXL', 1, TRUE, 'ADMIN', CURRENT_TIMESTAMP);

-- OPCIONES PARA COLOR ROPA HOMBRES - COMPANY 1 (VARIATION_ID: 2)
INSERT INTO Variation_Option (Variation_Option_Value, Variation_ID, state, modified_by_user, created_at) VALUES
                                                                                                             ('BLANCO', 2, TRUE, 'ADMIN', CURRENT_TIMESTAMP),
                                                                                                             ('NEGRO', 2, TRUE, 'ADMIN', CURRENT_TIMESTAMP),
                                                                                                             ('AZUL', 2, TRUE, 'ADMIN', CURRENT_TIMESTAMP),
                                                                                                             ('GRIS', 2, TRUE, 'ADMIN', CURRENT_TIMESTAMP),
                                                                                                             ('VERDE', 2, TRUE, 'ADMIN', CURRENT_TIMESTAMP),
                                                                                                             ('ROJO', 2, TRUE, 'ADMIN', CURRENT_TIMESTAMP);

-- OPCIONES PARA TALLA ROPA MUJERES - COMPANY 1 (VARIATION_ID: 3)
INSERT INTO Variation_Option (Variation_Option_Value, Variation_ID, state, modified_by_user, created_at) VALUES
                                                                                                             ('XS', 3, TRUE, 'ADMIN', CURRENT_TIMESTAMP),
                                                                                                             ('S', 3, TRUE, 'ADMIN', CURRENT_TIMESTAMP),
                                                                                                             ('M', 3, TRUE, 'ADMIN', CURRENT_TIMESTAMP),
                                                                                                             ('L', 3, TRUE, 'ADMIN', CURRENT_TIMESTAMP),
                                                                                                             ('XL', 3, TRUE, 'ADMIN', CURRENT_TIMESTAMP),
                                                                                                             ('28', 3, TRUE, 'ADMIN', CURRENT_TIMESTAMP),
                                                                                                             ('30', 3, TRUE, 'ADMIN', CURRENT_TIMESTAMP),
                                                                                                             ('32', 3, TRUE, 'ADMIN', CURRENT_TIMESTAMP);

-- OPCIONES PARA COLOR ROPA MUJERES - COMPANY 1 (VARIATION_ID: 4)
INSERT INTO Variation_Option (Variation_Option_Value, Variation_ID, state, modified_by_user, created_at) VALUES
                                                                                                             ('NEGRO', 4, TRUE, 'ADMIN', CURRENT_TIMESTAMP),
                                                                                                             ('BLANCO', 4, TRUE, 'ADMIN', CURRENT_TIMESTAMP),
                                                                                                             ('ROSA', 4, TRUE, 'ADMIN', CURRENT_TIMESTAMP),
                                                                                                             ('AZUL', 4, TRUE, 'ADMIN', CURRENT_TIMESTAMP),
                                                                                                             ('ROJO', 4, TRUE, 'ADMIN', CURRENT_TIMESTAMP),
                                                                                                             ('BEIGE', 4, TRUE, 'ADMIN', CURRENT_TIMESTAMP);

-- OPCIONES PARA TALLA CALZADO - COMPANY 1 (VARIATION_ID: 5)
INSERT INTO Variation_Option (Variation_Option_Value, Variation_ID, state, modified_by_user, created_at) VALUES
                                                                                                             ('36', 5, TRUE, 'ADMIN', CURRENT_TIMESTAMP),
                                                                                                             ('37', 5, TRUE, 'ADMIN', CURRENT_TIMESTAMP),
                                                                                                             ('38', 5, TRUE, 'ADMIN', CURRENT_TIMESTAMP),
                                                                                                             ('39', 5, TRUE, 'ADMIN', CURRENT_TIMESTAMP),
                                                                                                             ('40', 5, TRUE, 'ADMIN', CURRENT_TIMESTAMP),
                                                                                                             ('41', 5, TRUE, 'ADMIN', CURRENT_TIMESTAMP),
                                                                                                             ('42', 5, TRUE, 'ADMIN', CURRENT_TIMESTAMP),
                                                                                                             ('43', 5, TRUE, 'ADMIN', CURRENT_TIMESTAMP),
                                                                                                             ('44', 5, TRUE, 'ADMIN', CURRENT_TIMESTAMP);

-- OPCIONES PARA COLOR CALZADO - COMPANY 1 (VARIATION_ID: 6)
INSERT INTO Variation_Option (Variation_Option_Value, Variation_ID, state, modified_by_user, created_at) VALUES
                                                                                                             ('NEGRO', 6, TRUE, 'ADMIN', CURRENT_TIMESTAMP),
                                                                                                             ('BLANCO', 6, TRUE, 'ADMIN', CURRENT_TIMESTAMP),
                                                                                                             ('MARRÓN', 6, TRUE, 'ADMIN', CURRENT_TIMESTAMP),
                                                                                                             ('AZUL', 6, TRUE, 'ADMIN', CURRENT_TIMESTAMP),
                                                                                                             ('GRIS', 6, TRUE, 'ADMIN', CURRENT_TIMESTAMP);

-- OPCIONES PARA COLOR ACCESORIOS - COMPANY 1 (VARIATION_ID: 7)
INSERT INTO Variation_Option (Variation_Option_Value, Variation_ID, state, modified_by_user, created_at) VALUES
                                                                                                             ('NEGRO', 7, TRUE, 'ADMIN', CURRENT_TIMESTAMP),
                                                                                                             ('MARRÓN', 7, TRUE, 'ADMIN', CURRENT_TIMESTAMP),
                                                                                                             ('GRIS', 7, TRUE, 'ADMIN', CURRENT_TIMESTAMP),
                                                                                                             ('AZUL', 7, TRUE, 'ADMIN', CURRENT_TIMESTAMP),
                                                                                                             ('VERDE', 7, TRUE, 'ADMIN', CURRENT_TIMESTAMP);

-- OPCIONES PARA TAMAÑO ACCESORIOS - COMPANY 1 (VARIATION_ID: 8)
INSERT INTO Variation_Option (Variation_Option_Value, Variation_ID, state, modified_by_user, created_at) VALUES
                                                                                                             ('PEQUEÑO', 8, TRUE, 'ADMIN', CURRENT_TIMESTAMP),
                                                                                                             ('MEDIANO', 8, TRUE, 'ADMIN', CURRENT_TIMESTAMP),
                                                                                                             ('GRANDE', 8, TRUE, 'ADMIN', CURRENT_TIMESTAMP),
                                                                                                             ('ÚNICO', 8, TRUE, 'ADMIN', CURRENT_TIMESTAMP),
                                                                                                             ('80 CM', 8, TRUE, 'ADMIN', CURRENT_TIMESTAMP),
                                                                                                             ('90 CM', 8, TRUE, 'ADMIN', CURRENT_TIMESTAMP),
                                                                                                             ('100 CM', 8, TRUE, 'ADMIN', CURRENT_TIMESTAMP),
                                                                                                             ('110 CM', 8, TRUE, 'ADMIN', CURRENT_TIMESTAMP);

-- ======================================
-- OPCIONES DE VARIACIÓN - COMPANY 2
-- ======================================

-- OPCIONES PARA TALLA ROPA HOMBRES - COMPANY 2 (VARIATION_ID: 9)
INSERT INTO Variation_Option (Variation_Option_Value, Variation_ID, state, modified_by_user, created_at) VALUES
                                                                                                             ('S', 9, TRUE, 'ADMIN', CURRENT_TIMESTAMP),
                                                                                                             ('M', 9, TRUE, 'ADMIN', CURRENT_TIMESTAMP),
                                                                                                             ('L', 9, TRUE, 'ADMIN', CURRENT_TIMESTAMP),
                                                                                                             ('XL', 9, TRUE, 'ADMIN', CURRENT_TIMESTAMP),
                                                                                                             ('XXL', 9, TRUE, 'ADMIN', CURRENT_TIMESTAMP);

-- OPCIONES PARA COLOR ROPA HOMBRES - COMPANY 2 (VARIATION_ID: 10)
INSERT INTO Variation_Option (Variation_Option_Value, Variation_ID, state, modified_by_user, created_at) VALUES
                                                                                                             ('BLANCO', 10, TRUE, 'ADMIN', CURRENT_TIMESTAMP),
                                                                                                             ('NEGRO', 10, TRUE, 'ADMIN', CURRENT_TIMESTAMP),
                                                                                                             ('AZUL', 10, TRUE, 'ADMIN', CURRENT_TIMESTAMP),
                                                                                                             ('GRIS', 10, TRUE, 'ADMIN', CURRENT_TIMESTAMP),
                                                                                                             ('BEIGE', 10, TRUE, 'ADMIN', CURRENT_TIMESTAMP);

-- OPCIONES PARA TALLA ROPA NIÑOS - COMPANY 2 (VARIATION_ID: 11)
INSERT INTO Variation_Option (Variation_Option_Value, Variation_ID, state, modified_by_user, created_at) VALUES
                                                                                                             ('2', 11, TRUE, 'ADMIN', CURRENT_TIMESTAMP),
                                                                                                             ('4', 11, TRUE, 'ADMIN', CURRENT_TIMESTAMP),
                                                                                                             ('6', 11, TRUE, 'ADMIN', CURRENT_TIMESTAMP),
                                                                                                             ('8', 11, TRUE, 'ADMIN', CURRENT_TIMESTAMP),
                                                                                                             ('10', 11, TRUE, 'ADMIN', CURRENT_TIMESTAMP),
                                                                                                             ('12', 11, TRUE, 'ADMIN', CURRENT_TIMESTAMP),
                                                                                                             ('S', 11, TRUE, 'ADMIN', CURRENT_TIMESTAMP),
                                                                                                             ('M', 11, TRUE, 'ADMIN', CURRENT_TIMESTAMP);

-- OPCIONES PARA COLOR ROPA NIÑOS - COMPANY 2 (VARIATION_ID: 12)
INSERT INTO Variation_Option (Variation_Option_Value, Variation_ID, state, modified_by_user, created_at) VALUES
                                                                                                             ('ROJO', 12, TRUE, 'ADMIN', CURRENT_TIMESTAMP),
                                                                                                             ('AZUL', 12, TRUE, 'ADMIN', CURRENT_TIMESTAMP),
                                                                                                             ('VERDE', 12, TRUE, 'ADMIN', CURRENT_TIMESTAMP),
                                                                                                             ('AMARILLO', 12, TRUE, 'ADMIN', CURRENT_TIMESTAMP),
                                                                                                             ('ROSA', 12, TRUE, 'ADMIN', CURRENT_TIMESTAMP),
                                                                                                             ('NEGRO', 12, TRUE, 'ADMIN', CURRENT_TIMESTAMP);

-- OPCIONES PARA EDAD NIÑOS - COMPANY 2 (VARIATION_ID: 13)
INSERT INTO Variation_Option (Variation_Option_Value, Variation_ID, state, modified_by_user, created_at) VALUES
                                                                                                             ('2-4 AÑOS', 13, TRUE, 'ADMIN', CURRENT_TIMESTAMP),
                                                                                                             ('4-6 AÑOS', 13, TRUE, 'ADMIN', CURRENT_TIMESTAMP),
                                                                                                             ('6-8 AÑOS', 13, TRUE, 'ADMIN', CURRENT_TIMESTAMP),
                                                                                                             ('8-10 AÑOS', 13, TRUE, 'ADMIN', CURRENT_TIMESTAMP),
                                                                                                             ('10-12 AÑOS', 13, TRUE, 'ADMIN', CURRENT_TIMESTAMP);

-- OPCIONES PARA TALLA CALZADO - COMPANY 2 (VARIATION_ID: 14)
INSERT INTO Variation_Option (Variation_Option_Value, Variation_ID, state, modified_by_user, created_at) VALUES
                                                                                                             ('36', 14, TRUE, 'ADMIN', CURRENT_TIMESTAMP),
                                                                                                             ('37', 14, TRUE, 'ADMIN', CURRENT_TIMESTAMP),
                                                                                                             ('38', 14, TRUE, 'ADMIN', CURRENT_TIMESTAMP),
                                                                                                             ('39', 14, TRUE, 'ADMIN', CURRENT_TIMESTAMP),
                                                                                                             ('40', 14, TRUE, 'ADMIN', CURRENT_TIMESTAMP),
                                                                                                             ('41', 14, TRUE, 'ADMIN', CURRENT_TIMESTAMP),
                                                                                                             ('42', 14, TRUE, 'ADMIN', CURRENT_TIMESTAMP),
                                                                                                             ('43', 14, TRUE, 'ADMIN', CURRENT_TIMESTAMP),
                                                                                                             ('44', 14, TRUE, 'ADMIN', CURRENT_TIMESTAMP);

-- OPCIONES PARA COLOR CALZADO - COMPANY 2 (VARIATION_ID: 15)
INSERT INTO Variation_Option (Variation_Option_Value, Variation_ID, state, modified_by_user, created_at) VALUES
                                                                                                             ('NEGRO', 15, TRUE, 'ADMIN', CURRENT_TIMESTAMP),
                                                                                                             ('MARRÓN', 15, TRUE, 'ADMIN', CURRENT_TIMESTAMP),
                                                                                                             ('BLANCO', 15, TRUE, 'ADMIN', CURRENT_TIMESTAMP),
                                                                                                             ('AZUL', 15, TRUE, 'ADMIN', CURRENT_TIMESTAMP);

-- OPCIONES PARA TALLA JEANS - COMPANY 2 (VARIATION_ID: 16)
INSERT INTO Variation_Option (Variation_Option_Value, Variation_ID, state, modified_by_user, created_at) VALUES
                                                                                                             ('28', 16, TRUE, 'ADMIN', CURRENT_TIMESTAMP),
                                                                                                             ('30', 16, TRUE, 'ADMIN', CURRENT_TIMESTAMP),
                                                                                                             ('32', 16, TRUE, 'ADMIN', CURRENT_TIMESTAMP),
                                                                                                             ('34', 16, TRUE, 'ADMIN', CURRENT_TIMESTAMP),
                                                                                                             ('36', 16, TRUE, 'ADMIN', CURRENT_TIMESTAMP),
                                                                                                             ('38', 16, TRUE, 'ADMIN', CURRENT_TIMESTAMP);

-- OPCIONES PARA COLOR JEANS - COMPANY 2 (VARIATION_ID: 17)
INSERT INTO Variation_Option (Variation_Option_Value, Variation_ID, state, modified_by_user, created_at) VALUES
                                                                                                             ('AZUL CLÁSICO', 17, TRUE, 'ADMIN', CURRENT_TIMESTAMP),
                                                                                                             ('AZUL OSCURO', 17, TRUE, 'ADMIN', CURRENT_TIMESTAMP),
                                                                                                             ('NEGRO', 17, TRUE, 'ADMIN', CURRENT_TIMESTAMP),
                                                                                                             ('GRIS', 17, TRUE, 'ADMIN', CURRENT_TIMESTAMP);

-- ======================================
-- OPCIONES DE VARIACIÓN - COMPANY 3
-- ======================================

-- OPCIONES PARA TALLA ROPA MUJERES - COMPANY 3 (VARIATION_ID: 18)
INSERT INTO Variation_Option (Variation_Option_Value, Variation_ID, state, modified_by_user, created_at) VALUES
                                                                                                             ('XS', 18, TRUE, 'ADMIN', CURRENT_TIMESTAMP),
                                                                                                             ('S', 18, TRUE, 'ADMIN', CURRENT_TIMESTAMP),
                                                                                                             ('M', 18, TRUE, 'ADMIN', CURRENT_TIMESTAMP),
                                                                                                             ('L', 18, TRUE, 'ADMIN', CURRENT_TIMESTAMP),
                                                                                                             ('XL', 18, TRUE, 'ADMIN', CURRENT_TIMESTAMP);

-- OPCIONES PARA COLOR ROPA MUJERES - COMPANY 3 (VARIATION_ID: 19)
INSERT INTO Variation_Option (Variation_Option_Value, Variation_ID, state, modified_by_user, created_at) VALUES
                                                                                                             ('NEGRO', 19, TRUE, 'ADMIN', CURRENT_TIMESTAMP),
                                                                                                             ('BLANCO', 19, TRUE, 'ADMIN', CURRENT_TIMESTAMP),
                                                                                                             ('ROSA', 19, TRUE, 'ADMIN', CURRENT_TIMESTAMP),
                                                                                                             ('AZUL', 19, TRUE, 'ADMIN', CURRENT_TIMESTAMP),
                                                                                                             ('BEIGE', 19, TRUE, 'ADMIN', CURRENT_TIMESTAMP),
                                                                                                             ('VERDE', 19, TRUE, 'ADMIN', CURRENT_TIMESTAMP);

-- OPCIONES PARA TALLA ROPA NIÑOS - COMPANY 3 (VARIATION_ID: 20)
INSERT INTO Variation_Option (Variation_Option_Value, Variation_ID, state, modified_by_user, created_at) VALUES
                                                                                                             ('2', 20, TRUE, 'ADMIN', CURRENT_TIMESTAMP),
                                                                                                             ('4', 20, TRUE, 'ADMIN', CURRENT_TIMESTAMP),
                                                                                                             ('6', 20, TRUE, 'ADMIN', CURRENT_TIMESTAMP),
                                                                                                             ('8', 20, TRUE, 'ADMIN', CURRENT_TIMESTAMP),
                                                                                                             ('10', 20, TRUE, 'ADMIN', CURRENT_TIMESTAMP),
                                                                                                             ('12', 20, TRUE, 'ADMIN', CURRENT_TIMESTAMP);

-- OPCIONES PARA COLOR ROPA NIÑOS - COMPANY 3 (VARIATION_ID: 21)
INSERT INTO Variation_Option (Variation_Option_Value, Variation_ID, state, modified_by_user, created_at) VALUES
                                                                                                             ('AZUL', 21, TRUE, 'ADMIN', CURRENT_TIMESTAMP),
                                                                                                             ('ROJO', 21, TRUE, 'ADMIN', CURRENT_TIMESTAMP),
                                                                                                             ('VERDE', 21, TRUE, 'ADMIN', CURRENT_TIMESTAMP),
                                                                                                             ('NEGRO', 21, TRUE, 'ADMIN', CURRENT_TIMESTAMP),
                                                                                                             ('GRIS', 21, TRUE, 'ADMIN', CURRENT_TIMESTAMP);

-- OPCIONES PARA EDAD NIÑOS - COMPANY 3 (VARIATION_ID: 22)
INSERT INTO Variation_Option (Variation_Option_Value, Variation_ID, state, modified_by_user, created_at) VALUES
                                                                                                             ('2-4 AÑOS', 22, TRUE, 'ADMIN', CURRENT_TIMESTAMP),
                                                                                                             ('4-6 AÑOS', 22, TRUE, 'ADMIN', CURRENT_TIMESTAMP),
                                                                                                             ('6-8 AÑOS', 22, TRUE, 'ADMIN', CURRENT_TIMESTAMP),
                                                                                                             ('8-10 AÑOS', 22, TRUE, 'ADMIN', CURRENT_TIMESTAMP),
                                                                                                             ('10-12 AÑOS', 22, TRUE, 'ADMIN', CURRENT_TIMESTAMP);

-- OPCIONES PARA COLOR ACCESORIOS - COMPANY 3 (VARIATION_ID: 23)
INSERT INTO Variation_Option (Variation_Option_Value, Variation_ID, state, modified_by_user, created_at) VALUES
                                                                                                             ('NEGRO', 23, TRUE, 'ADMIN', CURRENT_TIMESTAMP),
                                                                                                             ('GRIS', 23, TRUE, 'ADMIN', CURRENT_TIMESTAMP),
                                                                                                             ('MARRÓN', 23, TRUE, 'ADMIN', CURRENT_TIMESTAMP),
                                                                                                             ('AZUL', 23, TRUE, 'ADMIN', CURRENT_TIMESTAMP),
                                                                                                             ('VERDE', 23, TRUE, 'ADMIN', CURRENT_TIMESTAMP);

-- OPCIONES PARA TAMAÑO ACCESORIOS - COMPANY 3 (VARIATION_ID: 24)
INSERT INTO Variation_Option (Variation_Option_Value, Variation_ID, state, modified_by_user, created_at) VALUES
                                                                                                             ('PEQUEÑO', 24, TRUE, 'ADMIN', CURRENT_TIMESTAMP),
                                                                                                             ('MEDIANO', 24, TRUE, 'ADMIN', CURRENT_TIMESTAMP),
                                                                                                             ('GRANDE', 24, TRUE, 'ADMIN', CURRENT_TIMESTAMP),
                                                                                                             ('ÚNICO', 24, TRUE, 'ADMIN', CURRENT_TIMESTAMP);

-- OPCIONES PARA TALLA ABRIGOS - COMPANY 3 (VARIATION_ID: 25)
INSERT INTO Variation_Option (Variation_Option_Value, Variation_ID, state, modified_by_user, created_at) VALUES
                                                                                                             ('S', 25, TRUE, 'ADMIN', CURRENT_TIMESTAMP),
                                                                                                             ('M', 25, TRUE, 'ADMIN', CURRENT_TIMESTAMP),
                                                                                                             ('L', 25, TRUE, 'ADMIN', CURRENT_TIMESTAMP),
                                                                                                             ('XL', 25, TRUE, 'ADMIN', CURRENT_TIMESTAMP);

-- OPCIONES PARA COLOR ABRIGOS - COMPANY 3 (VARIATION_ID: 26)
INSERT INTO Variation_Option (Variation_Option_Value, Variation_ID, state, modified_by_user, created_at) VALUES
                                                                                                             ('NEGRO', 26, TRUE, 'ADMIN', CURRENT_TIMESTAMP),
                                                                                                             ('GRIS', 26, TRUE, 'ADMIN', CURRENT_TIMESTAMP),
                                                                                                             ('AZUL MARINO', 26, TRUE, 'ADMIN', CURRENT_TIMESTAMP),
                                                                                                             ('BEIGE', 26, TRUE, 'ADMIN', CURRENT_TIMESTAMP);

-- ======================================
-- PRODUCTOS
-- ======================================

INSERT INTO Product (Product_Name, Product_Description, Product_Image, Product_Category_ID, Company_ID, state, modified_by_user, created_at) VALUES
-- Productos de Cuidado del Cabello
('POLO BÁSICO DE ALGODÓN', 'POLO DE ALGODÓN SUAVE DE ALTA DURABILIDAD, CORTE REGULAR.', 'POLO_HOMBRE_BASICO.JPG', 1, 1, TRUE, 'ADMIN', CURRENT_TIMESTAMP),
('CAMISA FORMAL SLIM FIT', 'CAMISA DE CORTE SLIM, IDEAL PARA OFICINA O EVENTOS.', 'CAMISA_SLIM_FIT.JPG', 1, 2, TRUE, 'ADMIN', CURRENT_TIMESTAMP),

-- ROPA PARA MUJERES
('BLUSA SATINADA MANGA LARGA', 'BLUSA ELEGANTE DE SATÉN, AJUSTE CÓMODO Y LIGERO.', 'BLUSA_SATINADA.JPG', 2, 3, TRUE, 'ADMIN', CURRENT_TIMESTAMP),
('PANTALÓN SKINNY STRETCH', 'PANTALÓN AJUSTADO CON TELA ELÁSTICA PARA MAYOR COMODIDAD.', 'PANTALON_SKINNY.JPG', 2, 1, TRUE, 'ADMIN', CURRENT_TIMESTAMP),

-- ROPA PARA NIÑOS
('POLO ESTAMPADO INFANTIL', 'POLO CON ESTAMPADOS COLORIDOS PARA NIÑOS.', 'POLO_INFANTIL.JPG', 3, 2, TRUE, 'ADMIN', CURRENT_TIMESTAMP),
('CASACA IMPERMEABLE NIÑO', 'CASACA LIGERA A PRUEBA DE AGUA CON FORRO TÉRMICO.', 'CASACA_NINO.JPG', 3, 3, TRUE, 'ADMIN', CURRENT_TIMESTAMP),

-- CALZADO
('ZAPATILLAS URBANAS', 'ZAPATILLAS LIGERAS PARA USO DIARIO, SUELA ANTIDESLIZANTE.', 'ZAPATILLAS_URBANAS.JPG', 6, 1, TRUE, 'ADMIN', CURRENT_TIMESTAMP),
('BOTINES DE CUERO', 'BOTINES DE CUERO GENUINO, DISEÑO RESISTENTE.', 'BOTINES_CUERO.JPG', 6, 2, TRUE, 'ADMIN', CURRENT_TIMESTAMP),

-- ACCESORIOS
('MOCHILA URBANA', 'MOCHILA RESISTENTE CON MÚLTIPLES COMPARTIMIENTOS.', 'MOCHILA_URBANA.JPG', 7, 3, TRUE, 'ADMIN', CURRENT_TIMESTAMP),
('CINTURÓN DE CUERO', 'CINTURÓN CLÁSICO DE CUERO AJUSTABLE.', 'CINTURON_CUERO.JPG', 7, 1, TRUE, 'ADMIN', CURRENT_TIMESTAMP),

-- JEANS
('JEAN RECTO CLÁSICO', 'JEAN CORTE RECTO, COLOR AZUL CLÁSICO.', 'JEAN_RECTO.JPG', 12, 2, TRUE, 'ADMIN', CURRENT_TIMESTAMP),

-- ABRIGOS
('PARKA ACOLCHADA', 'PARKA DE INVIERNO ACOLCHADA CON CAPUCHA.', 'PARKA_ACOLCHADA.JPG', 8, 3, TRUE, 'ADMIN', CURRENT_TIMESTAMP);

-- ======================================
-- ITEMS DE PRODUCTO CON PRECIOS Y STOCK
-- ======================================

INSERT INTO Product_Item (Product_Item_SKU, Product_Item_Quantity_In_Stock, Product_Item_Image, Product_Item_Price, Product_ID, Company_ID, state, modified_by_user, created_at) VALUES
-- PRODUCTO 1: POLO BÁSICO DE ALGODÓN (COMPANY 1)
('POLO-H-ALG-BLANCO-S', 60, 'POLO_BLANCO_S.JPG', 29.90, 1, 1, TRUE, 'ADMIN', CURRENT_TIMESTAMP),
('POLO-H-ALG-BLANCO-M', 50, 'POLO_BLANCO_M.JPG', 29.90, 1, 1, TRUE, 'ADMIN', CURRENT_TIMESTAMP),
('POLO-H-ALG-AZUL-M',   45, 'POLO_AZUL_M.JPG',   29.90, 1, 1, TRUE, 'ADMIN', CURRENT_TIMESTAMP),

-- PRODUCTO 2: CAMISA FORMAL SLIM FIT (COMPANY 2)
('CAM-FOR-AZUL-S', 35, 'CAMISA_AZUL_S.JPG', 79.90, 2, 2, TRUE, 'ADMIN', CURRENT_TIMESTAMP),
('CAM-FOR-AZUL-M', 30, 'CAMISA_AZUL_M.JPG', 79.90, 2, 2, TRUE, 'ADMIN', CURRENT_TIMESTAMP),
('CAM-FOR-BLANCA-L', 28, 'CAMISA_BLANCA_L.JPG', 84.90, 2, 2, TRUE, 'ADMIN', CURRENT_TIMESTAMP),

-- PRODUCTO 3: BLUSA SATINADA (COMPANY 3)
('BLUSA-SAT-ROSA-S', 40, 'BLUSA_ROSA_S.JPG', 69.90, 3, 3, TRUE, 'ADMIN', CURRENT_TIMESTAMP),
('BLUSA-SAT-ROSA-M', 35, 'BLUSA_ROSA_M.JPG', 69.90, 3, 3, TRUE, 'ADMIN', CURRENT_TIMESTAMP),
('BLUSA-SAT-NEGRA-M', 30, 'BLUSA_NEGRA_M.JPG', 72.90, 3, 3, TRUE, 'ADMIN', CURRENT_TIMESTAMP),

-- PRODUCTO 4: PANTALÓN SKINNY (COMPANY 1)
('PANT-SKIN-AZUL-28', 50, 'PANT_SKIN_28.JPG', 99.90, 4, 1, TRUE, 'ADMIN', CURRENT_TIMESTAMP),
('PANT-SKIN-AZUL-30', 45, 'PANT_SKIN_30.JPG', 99.90, 4, 1, TRUE, 'ADMIN', CURRENT_TIMESTAMP),
('PANT-SKIN-NEGRO-30', 40, 'PANT_SKIN_NEGRO_30.JPG', 109.90, 4, 1, TRUE, 'ADMIN', CURRENT_TIMESTAMP),

-- PRODUCTO 5: POLO INFANTIL (COMPANY 2)
('POLO-NIÑO-RJ-S', 70, 'POLO_NINO_ROJO.JPG', 24.90, 5, 2, TRUE, 'ADMIN', CURRENT_TIMESTAMP),
('POLO-NIÑO-AZ-M', 65, 'POLO_NINO_AZUL.JPG', 24.90, 5, 2, TRUE, 'ADMIN', CURRENT_TIMESTAMP),

-- PRODUCTO 6: CASACA NIÑO (COMPANY 3)
('CAS-NINO-IMP-6', 30, 'CASACA_6.JPG', 119.90, 6, 3, TRUE, 'ADMIN', CURRENT_TIMESTAMP),
('CAS-NINO-IMP-8', 28, 'CASACA_8.JPG', 119.90, 6, 3, TRUE, 'ADMIN', CURRENT_TIMESTAMP),

-- PRODUCTO 7: ZAPATILLAS URBANAS (COMPANY 1)
('ZAP-URB-NEGRO-40', 45, 'ZAP_40.JPG', 159.90, 7, 1, TRUE, 'ADMIN', CURRENT_TIMESTAMP),
('ZAP-URB-NEGRO-42', 38, 'ZAP_42.JPG', 159.90, 7, 1, TRUE, 'ADMIN', CURRENT_TIMESTAMP),

-- PRODUCTO 8: BOTINES DE CUERO (COMPANY 2)
('BOT-CUER-NEG-40', 25, 'BOTIN_40.JPG', 249.90, 8, 2, TRUE, 'ADMIN', CURRENT_TIMESTAMP),
('BOT-CUER-MRR-41', 22, 'BOTIN_41.JPG', 249.90, 8, 2, TRUE, 'ADMIN', CURRENT_TIMESTAMP),

-- PRODUCTO 9: MOCHILA URBANA (COMPANY 3)
('MOCH-URB-NEG', 50, 'MOCH_NEGRA.JPG', 89.90, 9, 3, TRUE, 'ADMIN', CURRENT_TIMESTAMP),
('MOCH-URB-GRIS', 40, 'MOCH_GRIS.JPG', 89.90, 9, 3, TRUE, 'ADMIN', CURRENT_TIMESTAMP),

-- PRODUCTO 10: CINTURÓN DE CUERO (COMPANY 1)
('CINT-CUER-NEG-100', 70, 'CINTURON_NEGRO.JPG', 49.90, 10, 1, TRUE, 'ADMIN', CURRENT_TIMESTAMP),
('CINT-CUER-MRR-100', 65, 'CINTURON_MARRON.JPG', 49.90, 10, 1, TRUE, 'ADMIN', CURRENT_TIMESTAMP),

-- PRODUCTO 11: JEAN RECTO (COMPANY 2)
('JEAN-RECT-32', 55, 'JEAN_32.JPG', 109.90, 11, 2, TRUE, 'ADMIN', CURRENT_TIMESTAMP),
('JEAN-RECT-34', 48, 'JEAN_34.JPG', 109.90, 11, 2, TRUE, 'ADMIN', CURRENT_TIMESTAMP),

-- PRODUCTO 12: PARKA ACOLCHADA (COMPANY 3)
('PARKA-ACOL-NEG-S', 25, 'PARKA_NEGRA_S.JPG', 199.90, 12, 3, TRUE, 'ADMIN', CURRENT_TIMESTAMP),
('PARKA-ACOL-NEG-M', 22, 'PARKA_NEGRA_M.JPG', 199.90, 12, 3, TRUE, 'ADMIN', CURRENT_TIMESTAMP),
('PARKA-ACOL-NEG-L', 35, 'PARKA_NEGRA_L.jpg', 42.99, 12,3,  TRUE, 'ADMIN', CURRENT_TIMESTAMP);


-- ======================================
-- CONFIGURACIONES DE PRODUCTOS
-- ======================================

-- PRODUCTO 1: POLO BÁSICO DE ALGODÓN - COMPANY 1 (PRODUCT_ITEM_ID: 1, 2, 3)
-- Item 1: POLO-H-ALG-BLANCO-S
INSERT INTO Product_Configuration (Product_Item_ID, Variation_Option_ID) VALUES
                                                                             (1, 1),  -- TALLA: S
                                                                             (1, 6);  -- COLOR: BLANCO

-- Item 2: POLO-H-ALG-BLANCO-M
INSERT INTO Product_Configuration (Product_Item_ID, Variation_Option_ID) VALUES
                                                                             (2, 2),  -- TALLA: M
                                                                             (2, 6);  -- COLOR: BLANCO

-- Item 3: POLO-H-ALG-AZUL-M
INSERT INTO Product_Configuration (Product_Item_ID, Variation_Option_ID) VALUES
                                                                             (3, 2),  -- TALLA: M
                                                                             (3, 8);  -- COLOR: AZUL

-- PRODUCTO 2: CAMISA FORMAL SLIM FIT - COMPANY 2 (PRODUCT_ITEM_ID: 4, 5, 6)
-- Item 4: CAM-FOR-AZUL-S
INSERT INTO Product_Configuration (Product_Item_ID, Variation_Option_ID) VALUES
                                                                             (4, 59),  -- TALLA: S (COMPANY 2)
                                                                             (4, 66);  -- COLOR: AZUL (COMPANY 2)

-- Item 5: CAM-FOR-AZUL-M
INSERT INTO Product_Configuration (Product_Item_ID, Variation_Option_ID) VALUES
                                                                             (5, 60),  -- TALLA: M (COMPANY 2)
                                                                             (5, 66);  -- COLOR: AZUL (COMPANY 2)

-- Item 6: CAM-FOR-BLANCA-L
INSERT INTO Product_Configuration (Product_Item_ID, Variation_Option_ID) VALUES
                                                                             (6, 61),  -- TALLA: L (COMPANY 2)
                                                                             (6, 64);  -- COLOR: BLANCO (COMPANY 2)

-- PRODUCTO 3: BLUSA SATINADA MANGA LARGA - COMPANY 3 (PRODUCT_ITEM_ID: 7, 8, 9)
-- Item 7: BLUSA-SAT-ROSA-S
INSERT INTO Product_Configuration (Product_Item_ID, Variation_Option_ID) VALUES
                                                                             (7, 104),  -- TALLA: S (COMPANY 3)
                                                                             (7, 111);  -- COLOR: ROSA (COMPANY 3)

-- Item 8: BLUSA-SAT-ROSA-M
INSERT INTO Product_Configuration (Product_Item_ID, Variation_Option_ID) VALUES
                                                                             (8, 105),  -- TALLA: M (COMPANY 3)
                                                                             (8, 111);  -- COLOR: ROSA (COMPANY 3)

-- Item 9: BLUSA-SAT-NEGRA-M
INSERT INTO Product_Configuration (Product_Item_ID, Variation_Option_ID) VALUES
                                                                             (9, 105),  -- TALLA: M (COMPANY 3)
                                                                             (9, 109);  -- COLOR: NEGRO (COMPANY 3)

-- PRODUCTO 4: PANTALÓN SKINNY STRETCH - COMPANY 1 (PRODUCT_ITEM_ID: 10, 11, 12)
-- Item 10: PANT-SKIN-AZUL-28
INSERT INTO Product_Configuration (Product_Item_ID, Variation_Option_ID) VALUES
                                                                             (10, 17),  -- TALLA: 28
                                                                             (10, 22);  -- COLOR: AZUL

-- Item 11: PANT-SKIN-AZUL-30
INSERT INTO Product_Configuration (Product_Item_ID, Variation_Option_ID) VALUES
                                                                             (11, 18),  -- TALLA: 30
                                                                             (11, 22);  -- COLOR: AZUL

-- Item 12: PANT-SKIN-NEGRO-30
INSERT INTO Product_Configuration (Product_Item_ID, Variation_Option_ID) VALUES
                                                                             (12, 18),  -- TALLA: 30
                                                                             (12, 19);  -- COLOR: NEGRO

-- PRODUCTO 5: POLO ESTAMPADO INFANTIL - COMPANY 2 (PRODUCT_ITEM_ID: 13, 14)
-- Item 13: POLO-NIÑO-RJ-S
INSERT INTO Product_Configuration (Product_Item_ID, Variation_Option_ID) VALUES
                                                                             (13, 73),  -- TALLA: S (NIÑO - COMPANY 2)
                                                                             (13, 76);  -- COLOR: ROJO (COMPANY 2)

-- Item 14: POLO-NIÑO-AZ-M
INSERT INTO Product_Configuration (Product_Item_ID, Variation_Option_ID) VALUES
                                                                             (14, 74),  -- TALLA: M (NIÑO - COMPANY 2)
                                                                             (14, 77);  -- COLOR: AZUL (COMPANY 2)

-- PRODUCTO 6: CASACA IMPERMEABLE NIÑO - COMPANY 3 (PRODUCT_ITEM_ID: 15, 16)
-- Item 15: CAS-NINO-IMP-6
INSERT INTO Product_Configuration (Product_Item_ID, Variation_Option_ID) VALUES
                                                                             (15, 117),  -- TALLA: 6 (COMPANY 3)
                                                                             (15, 125);  -- EDAD: 6-8 AÑOS (COMPANY 3)

-- Item 16: CAS-NINO-IMP-8
INSERT INTO Product_Configuration (Product_Item_ID, Variation_Option_ID) VALUES
                                                                             (16, 119),  -- TALLA: 8 (COMPANY 3)
                                                                             (16, 125);  -- EDAD: 6-8 AÑOS (COMPANY 3)

-- PRODUCTO 7: ZAPATILLAS URBANAS - COMPANY 1 (PRODUCT_ITEM_ID: 17, 18)
-- Item 17: ZAP-URB-NEGRO-40
INSERT INTO Product_Configuration (Product_Item_ID, Variation_Option_ID) VALUES
                                                                             (17, 31),  -- TALLA CALZADO: 40
                                                                             (17, 39);  -- COLOR: NEGRO

-- Item 18: ZAP-URB-NEGRO-42
INSERT INTO Product_Configuration (Product_Item_ID, Variation_Option_ID) VALUES
                                                                             (18, 33),  -- TALLA CALZADO: 42
                                                                             (18, 39);  -- COLOR: NEGRO

-- PRODUCTO 8: BOTINES DE CUERO - COMPANY 2 (PRODUCT_ITEM_ID: 19, 20)
-- Item 19: BOT-CUER-NEG-40
INSERT INTO Product_Configuration (Product_Item_ID, Variation_Option_ID) VALUES
                                                                             (19, 85),  -- TALLA CALZADO: 40 (COMPANY 2)
                                                                             (19, 94);  -- COLOR: NEGRO (COMPANY 2)

-- Item 20: BOT-CUER-MRR-41
INSERT INTO Product_Configuration (Product_Item_ID, Variation_Option_ID) VALUES
                                                                             (20, 86),  -- TALLA CALZADO: 41 (COMPANY 2)
                                                                             (20, 95);  -- COLOR: MARRÓN (COMPANY 2)

-- PRODUCTO 9: MOCHILA URBANA - COMPANY 3 (PRODUCT_ITEM_ID: 21, 22)
-- Item 21: MOCH-URB-NEG
INSERT INTO Product_Configuration (Product_Item_ID, Variation_Option_ID) VALUES
                                                                             (21, 128),  -- COLOR: NEGRO (COMPANY 3)
                                                                             (21, 131);  -- TAMAÑO: MEDIANO (COMPANY 3)

-- Item 22: MOCH-URB-GRIS
INSERT INTO Product_Configuration (Product_Item_ID, Variation_Option_ID) VALUES
                                                                             (22, 129),  -- COLOR: GRIS (COMPANY 3)
                                                                             (22, 131);  -- TAMAÑO: MEDIANO (COMPANY 3)

-- PRODUCTO 10: CINTURÓN DE CUERO - COMPANY 1 (PRODUCT_ITEM_ID: 23, 24)
-- Item 23: CINT-CUER-NEG-100
INSERT INTO Product_Configuration (Product_Item_ID, Variation_Option_ID) VALUES
                                                                             (23, 44),  -- COLOR: NEGRO
                                                                             (23, 53);  -- TAMAÑO: 100 CM

-- Item 24: CINT-CUER-MRR-100
INSERT INTO Product_Configuration (Product_Item_ID, Variation_Option_ID) VALUES
                                                                             (24, 45),  -- COLOR: MARRÓN
                                                                             (24, 53);  -- TAMAÑO: 100 CM

-- PRODUCTO 11: JEAN RECTO CLÁSICO - COMPANY 2 (PRODUCT_ITEM_ID: 25, 26)
-- Item 25: JEAN-RECT-32
INSERT INTO Product_Configuration (Product_Item_ID, Variation_Option_ID) VALUES
                                                                             (25, 100),  -- TALLA: 32 (COMPANY 2)
                                                                             (25, 103);  -- COLOR: AZUL CLÁSICO (COMPANY 2)

-- Item 26: JEAN-RECT-34
INSERT INTO Product_Configuration (Product_Item_ID, Variation_Option_ID) VALUES
                                                                             (26, 101),  -- TALLA: 34 (COMPANY 2)
                                                                             (26, 103);  -- COLOR: AZUL CLÁSICO (COMPANY 2)

-- PRODUCTO 12: PARKA ACOLCHADA - COMPANY 3 (PRODUCT_ITEM_ID: 27, 28)
-- Item 27: PARKA-ACOL-NEG-S
INSERT INTO Product_Configuration (Product_Item_ID, Variation_Option_ID) VALUES
                                                                             (27, 134),  -- TALLA: S (COMPANY 3)
                                                                             (27, 138);  -- COLOR: NEGRO (COMPANY 3)

-- Item 28: PARKA-ACOL-NEG-M
INSERT INTO Product_Configuration (Product_Item_ID, Variation_Option_ID) VALUES
                                                                             (28, 135),  -- TALLA: M (COMPANY 3)
                                                                             (28, 138);  -- COLOR: NEGRO (COMPANY 3)