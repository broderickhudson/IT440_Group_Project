USE IT440_Group_Project;
GO

CREATE TABLE Location (
  locationID int,
  locationName varchar(max),
  locationAddress varchar(max),
  createdBy varchar(max),
  createdDate date,
  updatedBy varchar(max),
  updatedDate varchar(max),
  activeFlag bit,
  PRIMARY KEY (locationID)
);

CREATE TABLE Car_Make (
  carMakeID int,
  carMakeName varchar(max),
  createdBy varchar(max),
  createdDate date,
  updatedBy varchar(max),
  updatedDate date,
  activeFlag bit,
  PRIMARY KEY (carMakeID)
);

CREATE TABLE Car_Type (
  carTypeID int,
  carTypeName varchar(max),
  createdBy varchar(max),
  createdDate date,
  updatedBy varchar(max),
  updatedDate date,
  activeFlag bit,
  PRIMARY KEY (carTypeID)
);

CREATE TABLE Customer (
  customerID int,
  customerFName varchar(max),
  customerLName varchar(max),
  birthDate date,
  socialSecurity int,
  [address] varchar(max),
  city varchar(max),
  [state] varchar(2),
  zipCode varchar(10),
  createdBy varchar(max),
  createdDate date,
  updatedBy varchar(max),
  updatedDate date,
  activeFlag bit,
  PRIMARY KEY (customerID)
);

CREATE TABLE Insurance (
  insuranceID int,
  policyNumber int,
  policyCarrier varchar(max),
  createdBy varchar(max),
  createdDate date,
  updatedBy varchar(max),
  updatedDate date,
  activeFlag bit,
  PRIMARY KEY (insuranceID)
);

CREATE TABLE Car_Model (
  carModelID int,
  carMakeID int FOREIGN KEY REFERENCES Car_Make(carMakeID),
  carModelName varchar(max),
  createdBy varchar(max),
  createdDate date,
  updatedBy varchar(max),
  updatedDate date,
  activeFlag bit,
  PRIMARY KEY (carModelID)
);

CREATE TABLE Car_Type_Location_Assignment (
  carTypeLocationAssignmentID int,
  locationID int FOREIGN KEY REFERENCES Location(locationID),
  carTypeID int FOREIGN KEY REFERENCES Car_Type(carTypeID),
  costPerDay money,
  createdBy varchar(max),
  createdDate date,
  updatedBy varchar(max),
  updatedDate date,
  activeFlag bit,
  PRIMARY KEY (carTypeLocationAssignmentID)
);

CREATE TABLE Car (
  carID int,
  carTypeLocationAssignmentID int FOREIGN KEY REFERENCES Car_Type_Location_Assignment(carTypeLocationAssignmentID),
  carModelID int FOREIGN KEY REFERENCES Car_Model(carModelID),
  insuranceID int FOREIGN KEY REFERENCES Insurance(insuranceID),
  carMileage int,
  purchaseDate date,
  createdBy varchar(max),
  createdDate date,
  updatedBy varchar(max),
  updatedDate date,
  activeFlag bit,
  PRIMARY KEY (carID)
);

CREATE TABLE Rental (
  rentalID int,
  customerID int FOREIGN KEY REFERENCES Customer(customerID),
  carID int FOREIGN KEY REFERENCES Car(carID),
  rentalDate date,
  dueDate date,
  returnDate date,
  updatedBy varchar(max),
  PRIMARY KEY (rentalID)
);



