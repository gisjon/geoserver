CREATE TABLE OBJECT (OID int IDENTITY NOT NULL, TYPE_ID int NOT NULL, ID varchar(255) NOT NULL, BLOB text NOT NULL, PRIMARY KEY (OID));
CREATE TABLE OBJECT_PROPERTY (OID int NOT NULL, PROPERTY_TYPE int NOT NULL, ID varchar(255) NOT NULL, RELATED_OID int NULL, RELATED_PROPERTY_TYPE int NULL, COLINDEX int NOT NULL, VALUE varchar(max) NULL, PRIMARY KEY (OID, PROPERTY_TYPE, COLINDEX));
CREATE TABLE TYPE (OID int IDENTITY NOT NULL, TYPENAME varchar(255) NOT NULL, PRIMARY KEY (OID));
CREATE TABLE PROPERTY_TYPE (OID int IDENTITY NOT NULL, TARGET_PROPERTY int NULL, TYPE_ID int NOT NULL, NAME varchar(255) NOT NULL, COLLECTION bit NOT NULL, TEXT bit NOT NULL, PRIMARY KEY (OID));
CREATE TABLE DEFAULT_OBJECT (DEF_KEY varchar(255) NOT NULL, ID varchar(255) NOT NULL);
ALTER TABLE OBJECT_PROPERTY ADD CONSTRAINT FK_OBJECT_PROPERTY FOREIGN KEY (OID) REFERENCES OBJECT (OID) ON DELETE Cascade;
ALTER TABLE PROPERTY_TYPE ADD CONSTRAINT FK_TYPE_PROPERTY_TYPE FOREIGN KEY (TYPE_ID) REFERENCES TYPE (OID);
ALTER TABLE OBJECT ADD CONSTRAINT FK_OBJECT_TYPE FOREIGN KEY (TYPE_ID) REFERENCES TYPE (OID);
ALTER TABLE PROPERTY_TYPE ADD CONSTRAINT FK_PROPERTY_TYPE_TARGET_PROPERTY FOREIGN KEY (TARGET_PROPERTY) REFERENCES PROPERTY_TYPE (OID);
ALTER TABLE OBJECT_PROPERTY ADD CONSTRAINT FK_OBJECT_PROPERTY_PROPERTY_TYPE FOREIGN KEY (PROPERTY_TYPE) REFERENCES PROPERTY_TYPE (OID);
CREATE UNIQUE INDEX OBJECT_OID ON OBJECT (OID);
CREATE INDEX OBJECT_TYPE_ID ON OBJECT (TYPE_ID);
CREATE UNIQUE INDEX OBJECT_ID ON OBJECT (ID);
CREATE INDEX OBJECT_PROPERTY_OID ON OBJECT_PROPERTY (OID);
CREATE INDEX OBJECT_PROPERTY_PROPERTY_TYPE ON OBJECT_PROPERTY (PROPERTY_TYPE);
CREATE INDEX OBJECT_PROPERTY_ID ON OBJECT_PROPERTY (ID);
CREATE INDEX OBJECT_PROPERTY_RELATED_OID ON OBJECT_PROPERTY (RELATED_OID);
CREATE INDEX OBJECT_PROPERTY_RELATED_PROPERTY_TYPE ON OBJECT_PROPERTY (RELATED_PROPERTY_TYPE);
CREATE INDEX OBJECT_PROPERTY_COLINDEX ON OBJECT_PROPERTY (COLINDEX);
CREATE INDEX OBJECT_PROPERTY_VALUE ON OBJECT_PROPERTY (VALUE);
CREATE UNIQUE INDEX TYPE_OID ON TYPE (OID);
CREATE UNIQUE INDEX TYPE_TYPENAME ON TYPE (TYPENAME);
CREATE UNIQUE INDEX PROPERTY_TYPE_OID ON PROPERTY_TYPE (OID);
CREATE INDEX PROPERTY_TYPE_TARGET_PROPERTY ON PROPERTY_TYPE (TARGET_PROPERTY);
CREATE INDEX PROPERTY_TYPE_TYPE_ID ON PROPERTY_TYPE (TYPE_ID);
CREATE INDEX PROPERTY_TYPE_NAME ON PROPERTY_TYPE (NAME);
CREATE INDEX PROPERTY_TYPE_COLLECTION ON PROPERTY_TYPE (COLLECTION);
CREATE UNIQUE INDEX DEFAULT_OBJECT_DEF_KEY ON DEFAULT_OBJECT (DEF_KEY);
CREATE INDEX DEFAULT_OBJECT_ID ON DEFAULT_OBJECT (ID);
