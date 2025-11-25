-- Usar la base de datos
USE db_users;

-- Insertar tipos de empresa
INSERT INTO company_type (company_type_value) VALUES
('EMPRESA INDIVIDUAL DE RESPONSABILIDAD LIMITADA (E.I.R.L.)'),
('SOCIEDAD COMERCIAL DE RESPONSABILIDAD LIMITADA (S.R.L.)'),
('SOCIEDAD ANÓNIMA CERRADA (S.A.C.)'),
('SOCIEDAD ANÓNIMA (S.A.)'),
('SOCIEDAD ANÓNIMA ABIERTA (S.A.A.)');


-- Insertar tipos de documento
INSERT INTO document_type (document_value) VALUES
    ('OTROS TIPOS DE DOCUMENTOS'),
    ('DOCUMENTO NACIONAL DE IDENTIDAD (DNI)'),
    ('CARNET DE EXTRANJERÍA (CE)'),
    ('REGISTRO ÚNICO DE CONTRIBUYENTES (RUC)'),
    ('PASAPORTE'),
    ('CÉDULA DIPLOMÁTICA DE IDENTIDAD'),
    ('DOCUMENTO DE IDENTIDAD DE PAÍS DE RESIDENCIA (NO. DOMICILIADO)'),
    ('TAX IDENTIFICATION NUMBER (TIN) - DOC. TRIBUTARIO PP. NN.'),
    ('IDENTIFICATION NUMBER (IN) - DOC. TRIBUTARIO PP. JJ.'),
    ('TAM - TARJETA ANDINA DE MIGRACIÓN'),
    ('PERMISO TEMPORAL DE PERMANENCIA (PTP)');

-- Insertar tipos de contrato
INSERT INTO contract_kind (contract_kind_value) VALUES
                                                    ('PRUEBA_PRIMERA_VEZ'),
                                                    ('BASICO'),
                                                    ('INTERMEDIO'),
                                                    ('PREMIUM');

-- Datos aleatorios sincronizados para Address, Contract, Person y Company
-- Ejemplo de inserción sincronizada:
-- Supongamos 3 empresas, 3 personas, 3 contratos y 3 direcciones

INSERT INTO address (address_street, address_city, address_state, address_postal_code, address_country,
                     deleted_at, modified_at, created_at, modified_by_user)
VALUES
    ('AV. LOS PRÓCERES 123', 'LIMA', 'LIMA', '15001', 'PERÚ', NULL, NULL, NOW(), 'SYSTEM'),
    ('CALLE LAS FLORES 456', 'AREQUIPA', 'AREQUIPA', '04001', 'PERÚ', NULL, NULL, NOW(), 'SYSTEM'),
    ('JR. SAN PEDRO 789', 'TRUJILLO', 'LA LIBERTAD', '13001', 'PERÚ', NULL, NULL, NOW(), 'SYSTEM');


INSERT INTO contract (contract_time_month, contract_document, contract_state,
                      contract_kind_id, deleted_at, modified_at, created_at, modified_by_user)
VALUES
(12, 'CONTRATO_VENDEDOR_001.PDF', TRUE, 1, NULL, NULL, NOW(), 'SYSTEM'),
(6, 'CONTRATO_ADMIN_002.PDF', TRUE, 2, NULL, NULL, NOW(), 'SYSTEM'),
(24, 'CONTRATO_SUPERVISOR_003.PDF', TRUE, 4, NULL, NULL, NOW(), 'SYSTEM');


INSERT INTO person (person_name, person_last_name, person_phone_number, person_email_address,
                    person_document_number, deleted_at, modified_at, created_at,
                    modified_by_user, state, document_id, address_id)
VALUES
('CARLOS', 'RAMÍREZ', '987654321', 'CARLOS.RAMIREZ@EXAMPLE.COM', '12345678',
 NULL, NULL, NOW(), 'SYSTEM', TRUE, 2, 1),

('MARÍA', 'FERNÁNDEZ', '945321789', 'MARIA.FERNANDEZ@EXAMPLE.COM', '87654321',
 NULL, NULL, NOW(), 'SYSTEM', TRUE, 2, 2),

('LUIS', 'GUTIÉRREZ', '912457863', 'LUIS.GUTIERREZ@EXAMPLE.COM', '45879613',
 NULL, NULL, NOW(), 'SYSTEM', TRUE, 2, 3);


INSERT INTO company (company_ruc, company_name, company_trade_name, company_phone,
                     company_email, company_type_id, document_id, person_id,
                     contract_id, address_id, company_image, created_at,
                     modified_at, modified_by_user, deleted_at, state)
VALUES
('20601234561', 'COMERCIAL LOS ANDES S.A.C.', 'LOS ANDES', '014589632',
 'CONTACTO@LOSANDES.COM', 3, 4, 1, 1, 1, NULL, NOW(), NULL, 'SYSTEM', NULL, TRUE),

('20587654322', 'SERVICIOS INTEGRALES DEL SUR S.R.L.', 'SISUR', '017452698',
 'INFO@SISUR.COM', 2, 4, 2, 2, 2, NULL, NOW(), NULL, 'SYSTEM', NULL, TRUE),

('20456789177', 'INVERSIONES LA COSTA E.I.R.L.', 'LA COSTA', '013698745',
 'VENTAS@LACOSTA.COM', 1, 4, 3, 3, 3, NULL, NOW(), NULL, 'SYSTEM', NULL, TRUE);


-- 1. Insertar los roles necesarios si no existen
-- Asegúrate de que los IDs (1 y 4) coincidan con lo que esperas.
-- Con AUTO_INCREMENT, el primer rol será 1, el segundo 2, etc.
INSERT INTO role (role_id, role_name) VALUES
                                     (1, 'ROLE_ADMIN'),
                                     (2, 'ROLE_SUPER_ADMIN'),
                                     (4, 'ROLE_USER'),
                                     (5, 'ROLE_GUEST')
ON DUPLICATE KEY UPDATE role_name=VALUES(role_name);


-- 2. Insertar el nuevo usuario desde el JSON
-- El ID se establece explícitamente en 6.
-- La fecha se convierte al formato DATETIME de SQL.
INSERT INTO user (user_id, keycloak_id, username, password, enabled, email, state, company_id, modified_by_user, created_at, modified_at, deleted_at)
VALUES (
           6,
           'sdsdcs152',
           'ANDESADMIN',
           '$2a$10$guR0AFdTbVKZOJFS.FGURO1dgpjOeyFFpmoyUoPkM81HGvFcAYELO',
           TRUE,
           'ANDRESADMIN@GMAIL.COM',
           TRUE,
           1,
           'SYSTEM',
           '2025-07-17 01:28:18',  -- Formato 'YYYY-MM-DD HH:MI:SS'
           NULL,
           NULL
       );
INSERT INTO user (user_id, keycloak_id, username, password, enabled, email, state, company_id, modified_by_user, created_at, modified_at, deleted_at)
VALUES (
           7,
           'sdsdcs152',
           'INTEGRALESSURADMIN',
           '$2a$10$guR0AFdTbVKZOJFS.FGURO1dgpjOeyFFpmoyUoPkM81HGvFcAYELO',
           TRUE,
           'INTEGRALESSURADMIN@GMAIL.COM',
           TRUE,
           1,
           'SYSTEM',
           '2025-07-17 01:28:18',  -- Formato 'YYYY-MM-DD HH:MI:SS'
           NULL,
           NULL
       );

INSERT INTO user (user_id, keycloak_id, username, password, enabled, email, state, company_id, modified_by_user, created_at, modified_at, deleted_at)
VALUES (
           8,
           'sdsdcs152',
           'SUPERADMIN',
           '$2a$10$guR0AFdTbVKZOJFS.FGURO1dgpjOeyFFpmoyUoPkM81HGvFcAYELO',
           TRUE,
           'SUPERADMIN@GMAIL.COM',
           TRUE,
           1,
           'SYSTEM',
           '2025-07-17 01:28:18',  -- Formato 'YYYY-MM-DD HH:MI:SS'
           NULL,
           NULL
       );
INSERT INTO user (user_id, keycloak_id, username, password, enabled, email, state, company_id, modified_by_user, created_at, modified_at, deleted_at)
VALUES (
           9,
           'sdsdcs152',
           'INVERSIONESLACOSTAADMIN',
           '$2a$10$guR0AFdTbVKZOJFS.FGURO1dgpjOeyFFpmoyUoPkM81HGvFcAYELO',
           TRUE,
           'INVERSIONESLACOSTAADMIN@GMAIL.COM',
           TRUE,
           1,
           'SYSTEM',
           '2025-07-17 01:28:18',  -- Formato 'YYYY-MM-DD HH:MI:SS'
           NULL,
           NULL
       );

-- 3. Asignar los roles al nuevo usuario (id=6)
-- Se asigna ROLE_ADMIN (id=1) y ROLE_USER (id=4)
INSERT INTO users_roles (user_id, role_id) VALUES
                                               (6, 1), -- Asigna ROLE_ADMIN
                                               (6, 4), -- Asigna ROLE_USER
                                               (7, 4), -- Asigna ROLE_USER
                                               (7, 1), -- Asigna ROLE_ADMIN
                                                  (8, 2), -- Asigna ROLE_SUPER_ADMIN
                                                  (8, 1), -- Asigna ROLE_SUPER_ADMIN
                                                  (8, 4), -- Asigna ROLE_SUPER_ADMIN
                                                  (9, 1), -- Asigna ROLE_ADMIN
                                                  (9, 4); -- Asigna ROLE_USER