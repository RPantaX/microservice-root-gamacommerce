-- Crear base de datos
-- =========================
--  DROP TABLES (Orden)
-- =========================
DROP TABLE IF EXISTS users_roles;
DROP TABLE IF EXISTS user;
DROP TABLE IF EXISTS role;
DROP TABLE IF EXISTS company_type;
DROP TABLE IF EXISTS document_type;
DROP TABLE IF EXISTS address;
DROP TABLE IF EXISTS contract;
DROP TABLE IF EXISTS person;
DROP TABLE IF EXISTS company;


-- =========================
--  TABLE: Company_type
-- =========================
CREATE TABLE company_type (
    company_type_id      BIGINT AUTO_INCREMENT PRIMARY KEY,
    company_type_value   VARCHAR(255) NOT NULL UNIQUE
) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci;

-- =========================
--  TABLE: Document_type
-- =========================
CREATE TABLE document_type (
    document_id      BIGINT AUTO_INCREMENT PRIMARY KEY,
    document_value   VARCHAR(255) NOT NULL UNIQUE
) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci;

CREATE TABLE contract_kind (
    contract_kind_id      BIGINT AUTO_INCREMENT PRIMARY KEY,
    contract_kind_value   VARCHAR(255) NOT NULL UNIQUE
) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci;

-- =========================
--  TABLE: Address
-- =========================
CREATE TABLE address (
    address_id        BIGINT AUTO_INCREMENT PRIMARY KEY,
    address_street    VARCHAR(255),
    address_city      VARCHAR(100),
    address_state     VARCHAR(100),
    address_postal_code VARCHAR(20),
    address_country   VARCHAR(100),
    deleted_at        DATETIME NULL,
    modified_at       DATETIME NULL,
    created_at        DATETIME NOT NULL,
    modified_by_user  VARCHAR(15) NOT NULL
) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci;

-- =========================
--  TABLE: Contract
-- =========================
CREATE TABLE contract (
    contract_id         BIGINT AUTO_INCREMENT PRIMARY KEY,
    contract_time_month INT NOT NULL,
    contract_document   VARCHAR(500),
    contract_state      BOOLEAN NOT NULL,
    contract_kind_id    BIGINT NOT NULL,
    deleted_at          DATETIME NULL,
    modified_at         DATETIME NULL,
    created_at          DATETIME NOT NULL,
    modified_by_user    VARCHAR(15) NOT NULL,
    FOREIGN KEY (contract_kind_id) REFERENCES contract_kind(contract_kind_id)
) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci;

-- =========================
--  TABLE: Person
-- =========================
CREATE TABLE person (
    person_id        BIGINT AUTO_INCREMENT PRIMARY KEY,
    person_name             VARCHAR(255) NOT NULL,
    person_last_name        VARCHAR(255) NOT NULL,
    person_phone_number     VARCHAR(20),
    person_email_address    VARCHAR(255),
    person_document_number VARCHAR(100) NOT NULL UNIQUE ,
    deleted_at       DATETIME NULL,
    modified_at      DATETIME NULL,
    created_at       DATETIME NOT NULL,
    modified_by_user VARCHAR(15) NOT NULL,
    state             BOOLEAN NOT NULL,
    document_id      BIGINT NOT NULL,
    address_id       BIGINT NOT NULL,

    FOREIGN KEY (document_id) REFERENCES document_type(document_id),
    FOREIGN KEY (address_id)  REFERENCES address(address_id)
) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci;

-- =========================
--  TABLE: Company
-- =========================
CREATE TABLE company (
    company_id        BIGINT AUTO_INCREMENT PRIMARY KEY,
    company_ruc        VARCHAR(11) NOT NULL UNIQUE,
    company_name      VARCHAR(255) NOT NULL,
    company_trade_name VARCHAR(255),
    company_phone    VARCHAR(20),
    company_email    VARCHAR(255),
    company_type_id   BIGINT NOT NULL,
    document_id      BIGINT NOT NULL,
    person_id         BIGINT NOT NULL,
    contract_id       BIGINT NOT NULL,
    address_id        BIGINT NOT NULL,

    company_image     VARCHAR(500),
    created_at        DATETIME NOT NULL,
    modified_at       DATETIME NULL,
    modified_by_user  VARCHAR(15) NOT NULL,
    deleted_at        DATETIME NULL,
    state             BOOLEAN NOT NULL,

    FOREIGN KEY (company_type_id) REFERENCES company_type(company_type_id),
    FOREIGN KEY (person_id)       REFERENCES person(person_id),
    FOREIGN KEY (contract_id)     REFERENCES contract(contract_id),
    FOREIGN KEY (document_id)     REFERENCES document_type(document_id),
    FOREIGN KEY (address_id)      REFERENCES address(address_id)

) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci;
-- =========================
--  TABLE: role
-- =========================
CREATE TABLE role (
    role_id     BIGINT AUTO_INCREMENT PRIMARY KEY,
    role_name   VARCHAR(100) NOT NULL UNIQUE
) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci;

-- =========================
--  TABLE: user
-- =========================
CREATE TABLE user (
    user_id             BIGINT AUTO_INCREMENT PRIMARY KEY,
    keycloak_id         VARCHAR(255) NULL,
    username            VARCHAR(255) NOT NULL UNIQUE,
    password            VARCHAR(255) NOT NULL,
    email               VARCHAR(255) NOT NULL UNIQUE,
    enabled             BOOLEAN DEFAULT TRUE,
    company_id          BIGINT NULL,
    state               BOOLEAN NOT NULL,
    modified_by_user    VARCHAR(15) NOT NULL,
    created_at          DATETIME NOT NULL,
    modified_at         DATETIME NULL,
    deleted_at          DATETIME NULL,
    FOREIGN KEY (company_id)         REFERENCES company(company_id)
) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci;

-- =========================
--  TABLE: users_roles (N-N)
-- =========================
CREATE TABLE users_roles (
    user_id BIGINT NOT NULL,
    role_id BIGINT NOT NULL,
    PRIMARY KEY (user_id, role_id),
    FOREIGN KEY (user_id) REFERENCES user(user_id) ON DELETE CASCADE,
    FOREIGN KEY (role_id) REFERENCES role(role_id) ON DELETE CASCADE
);

