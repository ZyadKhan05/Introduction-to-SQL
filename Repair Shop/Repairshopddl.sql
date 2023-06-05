CREATE TABLE `Person` (
  `id` INT not null auto_increment,
  `First_Name` varchar(36) not null,
  `Last_Name` varchar(36) not null,
  `phoneNumber` varchar(30) not null,
  `emailAddress` varchar(200) ,
  `streetAddress` varchar(100),
  `city` varchar(60),
  `state` char(2),
  `zip` varchar(10),
  PRIMARY KEY (`id`)
);

CREATE TABLE `Supplier` (
  `SupplierID` int not null auto_increment,
  `supplier_name` varchar(64) not null,
  `supplier_address` varchar(100) not null,
  `supplier_city` varchar(60) not null,
  `supplier_state` char(2) not null,
  `supplier_zip` varchar(10) not null,	
  `supplier_phone` int(30),
  PRIMARY KEY (`SupplierID`)
);

CREATE TABLE `Part` (
  `PartID` int not null auto_increment,
  `SupplierID` int not null,
  `part_cost` int ,
  `part_serial_number` varchar(64) not null,
  PRIMARY KEY (`PartID`),
  FOREIGN KEY (`SupplierID`) REFERENCES Supplier(SupplierID)
);


CREATE TABLE `Inventory` (
  `InventoryID` int not null auto_increment,
  `PartID` int not null,
  `inventory_quantity` int,
  PRIMARY KEY (`InventoryID`),
  FOREIGN KEY (PartID) REFERENCES Part(PartID)
);



CREATE TABLE `Insurance` (
  `InsuranceID` int not null auto_increment,
  `insurance_name` varchar(36) not null,
  `insurance_policy_number` int not null,
  `insurance_phone_number` varchar(30) ,
  `insurance_address` varchar(100),
  `insurance_city` varchar(60) not null,
  `insurance_state` char(2) not null,
  `insurance_zip` varchar(10) not null,
  PRIMARY KEY (`InsuranceID`)
);

CREATE TABLE `Payor` (
  `PayorID` int not null auto_increment,
  `InsuranceID` int not null,
  `PersonID` int not null,
  PRIMARY KEY (`PayorID`),
  FOREIGN KEY (InsuranceID) REFERENCES Insurance(InsuranceID),
  FOREIGN KEY (PersonID) REFERENCES Person(id)
);


CREATE TABLE `Mechanic` (
  `MechanicID` int not null auto_increment,
  `PersonID` int not null,
  `mechanic_rate` int ,
  PRIMARY KEY (`MechanicID`),
  FOREIGN KEY (PersonID) REFERENCES Person(id)
);

CREATE TABLE `Labor` (
  `LaborID` int not null auto_increment,
  `MechanicID` int not null,
  `labor_tools` varchar(128),
  `labor_time` date not null,
  PRIMARY KEY (`LaborID`),
  FOREIGN KEY (`MechanicID`) REFERENCES `Mechanic`(`MechanicID`)
);

CREATE TABLE `Vehicle` (
  `id` int not null auto_increment,
  `ownerID` int not null,
  `vehicle_mileage` int not null,
  `vehicle_make` varchar(52) not null,
  `vehicle_model` varchar(52) not null,
  `vehicle_year` int(4) not null,
  `vehicle_plate` varchar(8) ,
  `vehicle_color` varchar(24),
  PRIMARY KEY (`id`),
  FOREIGN KEY (`ownerID`) REFERENCES `Person`(`id`)
);

CREATE TABLE `Invoice` (
  `Invoice_number` int not null auto_increment,
  `vehicle_id` int not null,
  `invoice_amount` int not null,
  `PayorID` int not null,
  `PartID` int not null,
  `invoice_date` date not null,
  `ownerID` int not null,
  `LaborID` int not null,
  PRIMARY KEY (`Invoice_number`),
  FOREIGN KEY (`PartID`) REFERENCES `Part`(`PartID`),
  FOREIGN KEY (`ownerID`) REFERENCES `Vehicle`(`ownerID`),
  FOREIGN KEY (`vehicle_id`) REFERENCES `Vehicle`(`id`),
  FOREIGN KEY (`PayorID`) REFERENCES `Payor`(`PayorID`),
  FOREIGN KEY (`LaborID`) REFERENCES `Labor`(`LaborID`)
);

