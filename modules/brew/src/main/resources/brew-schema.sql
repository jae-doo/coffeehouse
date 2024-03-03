CREATE SCHEMA IF NOT EXISTS `BREW`;

CREATE TABLE IF NOT EXISTS `BREW`.`ORDER_SHEET` (
    ID VARCHAR(36) NOT NULL,
    ORDER_ID VARCHAR(36) NOT NULL,
    STATUS VARCHAR(255) NOT NULL,
    SUBMITTED_AT TIMESTAMP NOT NULL,
    CONFIRMED_AT TIMESTAMP NULL,
    PROCESSED_AT TIMESTAMP NULL,
    REFUSED_AT TIMESTAMP NULL,        
    VERSION BIGINT NULL,
    PRIMARY KEY (id)
);
CREATE TABLE IF NOT EXISTS `BREW`.`ORDER_SHEET_ITEM` (
    ID VARCHAR(36) NOT NULL,
    ORDER_SHEET_ID VARCHAR(36) NOT NULL,
    ORDER_ITEM_ID VARCHAR(36) NOT NULL,
    ORDER_PRODUCT_ID VARCHAR(36) NOT NULL,
    ORDER_QUANTITY INT NULL,
    STATUS VARCHAR(255) NOT NULL,
    CONFIRMED_AT TIMESTAMP NULL,
    PICKUP_REQUESTED_AT TIMESTAMP NULL,
    PICKUP_COMPLETED_AT TIMESTAMP NULL,
    REFUSED_AT TIMESTAMP NULL,        
    VERSION BIGINT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS `BREW`.`MODULE_EVENT_OUTBOX` (
    ID BIGINT NOT NULL AUTO_INCREMENT,
    EVENT_ID VARCHAR(36) NOT NULL,
    EVENT_TYPE VARCHAR(255) NOT NULL,
    EVENT_SOURCE VARCHAR(255) NOT NULL,   
    EVENT_DATA TEXT NOT NULL,
    EVENT_OCCURRENCE_TIME TIMESTAMP NOT NULL,
    PRIMARY KEY (id),
    UNIQUE (EVENT_ID)    
);

CREATE TABLE IF NOT EXISTS `BREW`.`MODULE_EVENT_INBOX` (
    ID BIGINT NOT NULL AUTO_INCREMENT,
    EVENT_ID VARCHAR(36) NOT NULL,
    EVENT_TYPE VARCHAR(255) NOT NULL,
    EVENT_SOURCE VARCHAR(255) NOT NULL,   
    EVENT_DATA TEXT NOT NULL,
    EVENT_OCCURRENCE_TIME TIMESTAMP NOT NULL,
    PROCESSED_AT TIMESTAMP NOT NULL,
    PRIMARY KEY (ID),
    UNIQUE (EVENT_ID)
);
