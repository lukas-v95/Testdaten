
-- Level 8
DROP TABLE IF EXISTS ReservationUnitOccupancy;
DROP TABLE IF EXISTS ReservationUnitHotelServiceDescription;

-- Level 7
DROP TABLE IF EXISTS ReservationUnit;

-- Level 6
DROP TABLE IF EXISTS Quota;
DROP TABLE IF EXISTS Discount;
DROP TABLE IF EXISTS ContractCancelationCondition;
DROP TABLE IF EXISTS CreditVoucher;

-- Level 5
DROP TABLE IF EXISTS ContractDetail;

-- Level 4
DROP TABLE IF EXISTS Contract;

-- Level 3
DROP TABLE IF EXISTS ReservationOption;
DROP TABLE IF EXISTS ReservationGuest;
DROP TABLE IF EXISTS PersonGroup;
DROP TABLE IF EXISTS Occupancy;
DROP TABLE IF EXISTS Contractor;

-- Level 2
DROP TABLE IF EXISTS RoomRoomFacility;
DROP TABLE IF EXISTS Reservation;
DROP TABLE IF EXISTS Person;
DROP TABLE IF EXISTS PackageDescription;
DROP TABLE IF EXISTS ContactNote;

-- Level 1
DROP TABLE IF EXISTS RoomCategoryPrice;
DROP TABLE IF EXISTS Room;
DROP TABLE IF EXISTS HotelServiceDescription;
DROP TABLE IF EXISTS Contact;
DROP TABLE IF EXISTS CancelationCondition;

-- Level 0
DROP TABLE IF EXISTS Season;
DROP TABLE IF EXISTS RoomStatus;
DROP TABLE IF EXISTS RoomFacility;
DROP TABLE IF EXISTS RoomCategory;
DROP TABLE IF EXISTS ReservationStatus;
DROP TABLE IF EXISTS OptionStatus;
DROP TABLE IF EXISTS OptionDescription;
DROP TABLE IF EXISTS MerchandiseGroup;
DROP TABLE IF EXISTS TravelGroup;
DROP TABLE IF EXISTS ContractorType;
DROP TABLE IF EXISTS CancelationPolicy;
DROP TABLE IF EXISTS Address;


-- Level 0
CREATE TABLE Address (
  addressId INT UNSIGNED AUTO_INCREMENT,
  country VARCHAR(30),
  province VARCHAR(30),
  zipCode VARCHAR(6),
  city VARCHAR(30),
  street VARCHAR(40),
  streetNumber VARCHAR(10),
  apartment VARCHAR(10),
  PRIMARY KEY (addressId)
);
CREATE TABLE CancelationPolicy (
  cancelationPolicyId INT UNSIGNED AUTO_INCREMENT,
  title VARCHAR(40),
  PRIMARY KEY (cancelationPolicyId)
);
CREATE TABLE ContractorType (
  contractorTypeId INT UNSIGNED AUTO_INCREMENT,
  description TEXT,
  PRIMARY KEY (contractorTypeId)
);
CREATE TABLE TravelGroup(
  travelGroupId INT UNSIGNED AUTO_INCREMENT,
  name VARCHAR(40),
  PRIMARY KEY (travelGroupId)
);
CREATE TABLE MerchandiseGroup (
  merchandiseGroupId INT UNSIGNED AUTO_INCREMENT,
  description VARCHAR(40),
  taxPercentageRate NUMERIC(5,2),
  PRIMARY KEY (merchandiseGroupId)
);
CREATE TABLE OptionDescription (
  optionDescriptionId INT UNSIGNED AUTO_INCREMENT,
  description TEXT,
  PRIMARY KEY (optionDescriptionId)
);
CREATE TABLE OptionStatus (
  optionStatusCode INT UNSIGNED NOT NULL,
  description VARCHAR(40),
  PRIMARY KEY (optionStatusCode)
);
CREATE TABLE ReservationStatus (
  reservationStatusCode INT UNSIGNED NOT NULL,
  description VARCHAR(40),
  PRIMARY KEY (reservationStatusCode)
);
CREATE TABLE RoomCategory (
  roomCategoryId INT UNSIGNED AUTO_INCREMENT,
  description VARCHAR(40),
  PRIMARY KEY (roomCategoryId)
);
CREATE TABLE RoomFacility(
  roomFacilityId INT UNSIGNED AUTO_INCREMENT,
  description VARCHAR(40),
  extraCharge NUMERIC(6,2),
  PRIMARY KEY (roomFacilityId)
);
CREATE TABLE RoomStatus(
  roomStatusCode INT UNSIGNED NOT NULL,
  description VARCHAR(40),
  PRIMARY KEY (roomStatusCode)
);
CREATE TABLE Season (
  seasonId INT UNSIGNED AUTO_INCREMENT,
  description VARCHAR(40),
  startDate DATE,
  endDate DATE,
  PRIMARY KEY (seasonId)
);

-- Level 1
CREATE TABLE CancelationCondition (
  cancelationConditionId INT UNSIGNED AUTO_INCREMENT,
  amount NUMERIC(6,2),
  percentage NUMERIC(5,2),
  daysBeforeArrival INT UNSIGNED,
  cancelationPolicyId INT UNSIGNED,
  PRIMARY KEY (cancelationConditionId),
  FOREIGN KEY (cancelationPolicyId) REFERENCES CancelationPolicy (cancelationPolicyId)
);
CREATE TABLE Contact (
  contactId INT UNSIGNED AUTO_INCREMENT,
  phone VARCHAR(15),
  email VARCHAR(254),
  fax VARCHAR(15),
  creditCardNumber VARCHAR(19),
  addressId INT UNSIGNED,
  PRIMARY KEY (contactId),
  FOREIGN KEY (addressId) REFERENCES Address (addressId)
);
CREATE TABLE HotelServiceDescription (
  hotelServiceDescriptionId INT UNSIGNED AUTO_INCREMENT,
  description TEXT,
  title VARCHAR(50),
  priceSuggestion NUMERIC(6,2),
  isPackage BOOL,
  merchandiseGroupId INT UNSIGNED,
  PRIMARY KEY (hotelServiceDescriptionId),
  FOREIGN KEY (merchandiseGroupId) REFERENCES MerchandiseGroup (merchandiseGroupId)
);
CREATE TABLE Room(
  roomNumber INT UNSIGNED NOT NULL,
  maxPerson INT UNSIGNED,
  roomStatusCode INT UNSIGNED,
  roomCategoryId INT UNSIGNED,
  PRIMARY KEY (roomNumber),
  FOREIGN KEY (roomStatusCode) REFERENCES RoomStatus (roomStatusCode),
  FOREIGN KEY (roomCategoryId) REFERENCES RoomCategory (roomCategoryId)
);
CREATE TABLE RoomCategoryPrice (
  roomCategoryPriceId INT UNSIGNED AUTO_INCREMENT,
  listPrice NUMERIC(6,2) UNSIGNED,
  minimumPrice NUMERIC(6,2) UNSIGNED,
  dayPrice NUMERIC(6,2) UNSIGNED,
  costPrice NUMERIC(6,2) UNSIGNED,
  roomCategoryId INT UNSIGNED,
  seasonId INT UNSIGNED,
  PRIMARY KEY (roomCategoryPriceId),
  FOREIGN KEY (roomCategoryId) REFERENCES RoomCategory (roomCategoryId),
  FOREIGN KEY (seasonId) REFERENCES Season (seasonId)
);

-- Level 2
CREATE TABLE ContactNote (
  contactNoteId INT UNSIGNED AUTO_INCREMENT,
  text TEXT,
  contactId INT UNSIGNED,
  PRIMARY KEY (contactNoteId),
  FOREIGN KEY (contactId) REFERENCES Contact (contactId)
);
CREATE TABLE PackageDescription (
  packageId INT UNSIGNED,
  serviceId INT UNSIGNED,
  PRIMARY KEY (packageId,serviceId),
  FOREIGN KEY (packageId) REFERENCES HotelServiceDescription (hotelServiceDescriptionId),
  FOREIGN KEY (serviceId) REFERENCES HotelServiceDescription (hotelServiceDescriptionId)
);
CREATE TABLE Person (
  personId INT UNSIGNED NOT NULL,
  degree VARCHAR(15),
  fname VARCHAR(50),
  lname VARCHAR(50),
  dateOfBirth DATE,
  sex CHAR(1),
  isVip BOOL,
  inArchive BOOL,
  PRIMARY KEY (personId),
  FOREIGN KEY (personId) REFERENCES Contact (contactId)
);
CREATE TABLE Reservation (
  reservationNumber INT UNSIGNED AUTO_INCREMENT,
  arrivalDate DATE,
  arrivalTime TIME,
  departureDate DATE,
  payerContactId INT UNSIGNED,
  cancelationPolicy INT UNSIGNED,
  reservationStatusCode INT UNSIGNED,
  PRIMARY KEY (reservationNumber),
  FOREIGN KEY (payerContactId) REFERENCES Contact (contactId),
  FOREIGN KEY (cancelationPolicy) REFERENCES CancelationPolicy (cancelationPolicyId),
  FOREIGN KEY (reservationStatusCode) REFERENCES ReservationStatus (reservationStatusCode)
);
CREATE Table RoomRoomFacility(
  roomNumber INT UNSIGNED,
  roomFacilityId INT UNSIGNED,
  PRIMARY KEY (roomNumber, roomFacilityId),
  FOREIGN KEY (roomNumber) REFERENCES Room (roomNumber),
  FOREIGN KEY (roomFacilityId) REFERENCES RoomFacility (roomFacilityId)
);

-- Level 3
CREATE TABLE Contractor (
  contractorId INT UNSIGNED NOT NULL,
  name VARCHAR(50),
  uid VARCHAR(15),
  iban VARCHAR(34),
  bic VARCHAR(11),
  contactPersonId INT UNSIGNED,
  contractorTypeId INT UNSIGNED,
  PRIMARY KEY (contractorId),
  FOREIGN KEY (contractorId) REFERENCES Contact (contactId),
  FOREIGN KEY (contactPersonId) REFERENCES Person (personId),
  FOREIGN KEY (contractorTypeId) REFERENCES ContractorType (contractorTypeId)
);
CREATE TABLE ReservationOption (
  reservationOptionId INT UNSIGNED AUTO_INCREMENT,
  optionDate DATE,
  optionDescriptionId INT UNSIGNED,
  optionStatusCode INT UNSIGNED,
  reservationNumber INT UNSIGNED,
  PRIMARY KEY (reservationOptionId),
  FOREIGN KEY (optionDescriptionId) REFERENCES OptionDescription (optionDescriptionId),
  FOREIGN KEY (optionStatusCode) REFERENCES OptionStatus (optionStatusCode),
  FOREIGN KEY (reservationNumber) REFERENCES Reservation (reservationNumber)
);
CREATE TABLE Occupancy(
  occupancyNumber INT UNSIGNED AUTO_INCREMENT,
  startDate DATE,
  endDate DATE,
  travelGroupId INT UNSIGNED,
  personId INT UNSIGNED,
  roomNumber INT UNSIGNED,
  positionId INT UNSIGNED,
  PRIMARY KEY(occupancyNumber),
  FOREIGN KEY(travelGroupId) REFERENCES TravelGroup (travelGroupId),
  FOREIGN KEY(personId) REFERENCES Person (personId),
  FOREIGN KEY (roomNumber) REFERENCES Room (roomNumber)
  -- FOREIGN KEY (positionId) REFERENCES Position (positionID)
);
CREATE TABLE PersonGroup(
  travelGroupId INT UNSIGNED,
  personId INT UNSIGNED,
  PRIMARY KEY(travelGroupId, personId),
  FOREIGN KEY(travelGroupId) REFERENCES TravelGroup(travelGroupId),
  FOREIGN KEY(personId) REFERENCES Person(personId)
);
CREATE TABLE ReservationGuest (
  reservationNumber INT UNSIGNED,
  personId INT UNSIGNED,
  PRIMARY KEY (reservationNumber,personId),
  FOREIGN KEY (reservationNumber) REFERENCES Reservation (reservationNumber),
  FOREIGN KEY (personId) REFERENCES Person (personId)
);

-- Level 4
CREATE TABLE Contract (
  contractNumber INT UNSIGNED AUTO_INCREMENT,
  startDate DATE,
  endDate DATE,
  document BLOB,
  contractorId INT UNSIGNED,
  PRIMARY KEY (contractNumber),
  FOREIGN KEY (contractorId) REFERENCES Contractor (contractorId)
);

-- Level 5
CREATE TABLE ContractDetail(
  contractDetailId INT UNSIGNED AUTO_INCREMENT,
  startDate DATE,
  endDate DATE,
  contractNumber INT UNSIGNED,
  PRIMARY KEY (contractDetailId),
  FOREIGN KEY (contractNumber) REFERENCES Contract (contractNumber)
);

-- Level 6
CREATE TABLE CreditVoucher(
  creditVoucherId INT UNSIGNED,
  amount NUMERIC(6,2),
  PRIMARY KEY (creditVoucherId),
  FOREIGN KEY (creditVoucherId) REFERENCES ContractDetail (contractDetailId)
);
CREATE TABLE ContractCancelationCondition (
  contractCancelationConditionId INT UNSIGNED,
  amount NUMERIC(6,2),
  percentage NUMERIC(6,2),
  daysBeforeArrival INT,
  PRIMARY KEY (contractCancelationConditionId),
  FOREIGN KEY (contractCancelationConditionId) REFERENCES ContractDetail (contractDetailId)
);
CREATE TABLE Discount(
  discountId INT UNSIGNED,
  discountPercentage NUMERIC(5,2),
  PRIMARY KEY (discountId),
  FOREIGN KEY (discountId) REFERENCES ContractDetail (contractDetailId)
);
CREATE TABLE Quota (
  quotaId INT UNSIGNED,
  numberOfNights INT UNSIGNED,
  price NUMERIC(6,2),
  roomCategory INT UNSIGNED,
  PRIMARY KEY (quotaId),
  FOREIGN KEY (quotaId) REFERENCES ContractDetail (contractDetailId),
  FOREIGN KEY (roomCategory) REFERENCES RoomCategory (roomCategoryId)
);

-- Level 7
CREATE TABLE ReservationUnit (
  reservationUnitId INT UNSIGNED AUTO_INCREMENT,
  startDate DATE,
  endDate DATE,
  notes TEXT,
  reservationNumber INT UNSIGNED,
  roomNumber INT UNSIGNED,
  roomCategoryId INT UNSIGNED,
  quotaId INT UNSIGNED,
  PRIMARY KEY (reservationUnitId),
  FOREIGN KEY (reservationNumber) REFERENCES Reservation (reservationNumber),
  FOREIGN KEY (roomNumber) REFERENCES Room (roomNumber),
  FOREIGN KEY (roomCategoryId) REFERENCES RoomCategory (roomCategoryId),
  FOREIGN KEY (quotaId) REFERENCES Quota (quotaId)
);

-- Level 8
CREATE TABLE ReservationUnitOccupancy(
  occupancyNumber INT UNSIGNED,
  reservationUnitId INT UNSIGNED,
  PRIMARY KEY (occupancyNumber,reservationUnitId),
  FOREIGN KEY (occupancyNumber) REFERENCES Occupancy (occupancyNumber),
  FOREIGN KEY (reservationUnitId) REFERENCES ReservationUnit (reservationUnitId)
);
CREATE TABLE ReservationUnitHotelServiceDescription (
  hotelServiceDescriptionId INT UNSIGNED,
  reservationUnitId INT UNSIGNED,
  PRIMARY KEY (hotelServiceDescriptionId,reservationUnitId),
  FOREIGN KEY (hotelServiceDescriptionId) REFERENCES HotelServiceDescription (hotelServiceDescriptionId),
  FOREIGN KEY (reservationUnitId) REFERENCES ReservationUnit (reservationUnitId)
);
