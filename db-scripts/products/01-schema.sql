-- PostgreSQL script para crear el esquema de productos
-- Base de datos: db_products
-- Usuario: fazt

-- Crear tabla de categorías de productos (con auto-referencia para jerarquía)
CREATE TABLE IF NOT EXISTS Product_Category (
                                                Product_Category_ID BIGSERIAL PRIMARY KEY,
                                                Product_Category_Name VARCHAR(255) UNIQUE NOT NULL,
                                                Product_Category_Parent_ID BIGINT,
                                                state BOOLEAN NOT NULL DEFAULT TRUE,
                                                modified_by_user VARCHAR(15) NOT NULL,
                                                created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
                                                modified_at TIMESTAMP NULL,
                                                deleted_at TIMESTAMP NULL,
                                                CONSTRAINT fk_product_category_parent
                                                    FOREIGN KEY (Product_Category_Parent_ID)
                                                        REFERENCES Product_Category(Product_Category_ID)
);

-- Crear tabla de promociones
CREATE TABLE IF NOT EXISTS Promotion (
                                         Promotion_ID BIGSERIAL PRIMARY KEY,
                                         Promotion_Name VARCHAR(255),
                                         Promotion_Description TEXT,
                                         Promotion_Discount_Rate DECIMAL(5,2),
                                         Promotion_Start_Date TIMESTAMP,
                                         Promotion_End_Date TIMESTAMP,
                                         Company_ID BIGINT,
                                         state BOOLEAN NOT NULL DEFAULT TRUE,
                                         modified_by_user VARCHAR(15) NOT NULL,
                                         created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
                                         modified_at TIMESTAMP NULL,
                                         deleted_at TIMESTAMP NULL
);

-- Crear tabla intermedia promociones-categorías
CREATE TABLE IF NOT EXISTS Promotion_Product_Category (
                                                          Promotion_ID BIGINT NOT NULL,
                                                          Product_Category_ID BIGINT NOT NULL,
                                                          PRIMARY KEY (Promotion_ID, Product_Category_ID),
                                                          CONSTRAINT fk_promotion_product_category_promotion
                                                              FOREIGN KEY (Promotion_ID)
                                                                  REFERENCES Promotion(Promotion_ID) ON DELETE CASCADE,
                                                          CONSTRAINT fk_promotion_product_category_category
                                                              FOREIGN KEY (Product_Category_ID)
                                                                  REFERENCES Product_Category(Product_Category_ID) ON DELETE CASCADE
);

-- Crear tabla de productos
CREATE TABLE IF NOT EXISTS Product (
                                       Product_ID BIGSERIAL PRIMARY KEY,
                                       Product_Name VARCHAR(255) NOT NULL,
                                       Product_Description TEXT,
                                       Product_Image VARCHAR(500),
                                       Product_Category_ID BIGINT,
                                       Company_ID BIGINT,
                                       state BOOLEAN NOT NULL DEFAULT TRUE,
                                       modified_by_user VARCHAR(15) NOT NULL,
                                       created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
                                       modified_at TIMESTAMP NULL,
                                       deleted_at TIMESTAMP NULL,
                                       CONSTRAINT fk_product_category
                                           FOREIGN KEY (Product_Category_ID)
                                               REFERENCES Product_Category(Product_Category_ID)
);

-- Crear tabla de variaciones
CREATE TABLE IF NOT EXISTS Variation (
                                         Variation_ID BIGSERIAL PRIMARY KEY,
                                         Variation_Name VARCHAR(255) NOT NULL,
                                         Product_Category_ID BIGINT,
                                         Company_ID BIGINT,
                                         state BOOLEAN NOT NULL DEFAULT TRUE,
                                         modified_by_user VARCHAR(15) NOT NULL,
                                         created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
                                         modified_at TIMESTAMP NULL,
                                         deleted_at TIMESTAMP NULL,
                                         CONSTRAINT fk_variation_category
                                             FOREIGN KEY (Product_Category_ID)
                                                 REFERENCES Product_Category(Product_Category_ID)
);

-- Crear tabla de opciones de variación
CREATE TABLE IF NOT EXISTS Variation_Option (
                                                Variation_Option_ID BIGSERIAL PRIMARY KEY,
                                                Variation_Option_Value VARCHAR(255) NOT NULL,
                                                Variation_ID BIGINT,
                                                state BOOLEAN NOT NULL DEFAULT TRUE,
                                                modified_by_user VARCHAR(15) NOT NULL,
                                                created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
                                                modified_at TIMESTAMP NULL,
                                                deleted_at TIMESTAMP NULL,
                                                CONSTRAINT fk_variation_option_variation
                                                    FOREIGN KEY (Variation_ID)
                                                        REFERENCES Variation(Variation_ID)
);

-- Crear tabla de items de producto
CREATE TABLE IF NOT EXISTS Product_Item (
                                            Product_Item_ID BIGSERIAL PRIMARY KEY,
                                            Product_Item_SKU VARCHAR(100),
                                            Product_Item_Quantity_In_Stock INTEGER NOT NULL DEFAULT 0,
                                            Product_Item_Image VARCHAR(500),
                                            Product_Item_Price DECIMAL(10,2) NOT NULL,
                                            Shopping_Cart_Item_ID BIGINT,
                                            Product_ID BIGINT,
                                            Company_ID BIGINT,
                                            state BOOLEAN NOT NULL DEFAULT TRUE,
                                            modified_by_user VARCHAR(15) NOT NULL,
                                            created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
                                            modified_at TIMESTAMP NULL,
                                            deleted_at TIMESTAMP NULL,
                                            CONSTRAINT fk_product_item_product
                                                FOREIGN KEY (Product_ID)
                                                    REFERENCES Product(Product_ID)
);

-- Crear tabla intermedia para configuración de productos (Product_Item - Variation_Option)
CREATE TABLE IF NOT EXISTS Product_Configuration (
                                                     Product_Item_ID BIGINT NOT NULL,
                                                     Variation_Option_ID BIGINT NOT NULL,
                                                     PRIMARY KEY (Product_Item_ID, Variation_Option_ID),
                                                     CONSTRAINT fk_product_config_item
                                                         FOREIGN KEY (Product_Item_ID)
                                                             REFERENCES Product_Item(Product_Item_ID) ON DELETE CASCADE,
                                                     CONSTRAINT fk_product_config_variation
                                                         FOREIGN KEY (Variation_Option_ID)
                                                             REFERENCES Variation_Option(Variation_Option_ID) ON DELETE CASCADE
);

-- Crear índices para mejorar el rendimiento
CREATE INDEX IF NOT EXISTS idx_product_category_parent ON Product_Category(Product_Category_Parent_ID);
CREATE INDEX IF NOT EXISTS idx_product_category ON Product(Product_Category_ID);
CREATE INDEX IF NOT EXISTS idx_variation_category ON Variation(Product_Category_ID);
CREATE INDEX IF NOT EXISTS idx_variation_option_variation ON Variation_Option(Variation_ID);
CREATE INDEX IF NOT EXISTS idx_product_item_product ON Product_Item(Product_ID);
CREATE INDEX IF NOT EXISTS idx_product_item_sku ON Product_Item(Product_Item_SKU);

-- Comentarios para documentación
COMMENT ON TABLE Product_Category IS 'Categorías de productos con soporte para jerarquías';
COMMENT ON TABLE Product IS 'Productos principales del catálogo';
COMMENT ON TABLE Product_Item IS 'Items específicos de productos con SKU, precio y stock';
COMMENT ON TABLE Variation IS 'Tipos de variaciones (color, tamaño, etc.)';
COMMENT ON TABLE Variation_Option IS 'Opciones específicas de cada variación';
COMMENT ON TABLE Product_Configuration IS 'Configuración de variaciones para cada item de producto';
COMMENT ON TABLE Promotion IS 'Promociones y descuentos aplicables';
COMMENT ON TABLE Promotion_Product_Category IS 'Relación entre promociones y categorías';