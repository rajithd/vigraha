DROP TABLE IF EXISTS `admin`;
DROP TABLE IF EXISTS `promotion`;
DROP TABLE IF EXISTS `company`;


INSERT INTO login VALUES('12345','superadmin','123');
INSERT INTO login VALUES('123456','admin','123');
INSERT INTO login VALUES('1234567','customer','123');

INSERT INTO authority VALUES ('12345','ROLE_SUPER_ADMIN');
INSERT INTO authority VALUES ('12345','ROLE_ADMIN');
INSERT INTO authority VALUES ('12345','ROLE_PROGRAMME');
INSERT INTO authority VALUES ('12345','ROLE_COMPANY_REGISTER');
INSERT INTO authority VALUES ('12345','ROLE_VIEW_REPORT');
INSERT INTO authority VALUES ('12345','ROLE_ADMIN_REGISTRATION');

INSERT INTO authority VALUES ('123456','ROLE_ADMIN');
INSERT INTO authority VALUES ('123456','ROLE_PROGRAMME');
INSERT INTO authority VALUES ('123456','ROLE_COMPANY_REGISTER');
INSERT INTO authority VALUES ('123456','ROLE_VIEW_REPORT');

INSERT INTO authority VALUES ('1234567','ROLE_CUSTOMER');
INSERT INTO authority VALUES ('1234567','ROLE_VIEW_REPORT');


INSERT INTO admin VALUES('admin','mobile','12345','superadmin','123');

insert into `company` values("Pizza Hut","PH","011","022","pizzaAddress","pizzaHut@yahoo.com","pizza","pizza");
insert into `company` values("Odel","OD","011","022","odelAddress","odel@yahoo.com","odel","odel");