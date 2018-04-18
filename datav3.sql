
-- Level 0
INSERT INTO Address (addressId, country, province, zipCode, city, street, streetNumber, apartment) VALUES
	(default,'Austria', 'Vorarlberg', '6850', 'Dornbirn', 'Marktstraße', '30', null),
	(default,'Austria', 'Vorarlberg', '6800', 'Feldkirch', 'Kaiserstraße', '1', null),
	(default,'Austria', 'Tirol', '6020', 'Innsbruck', 'Dreiheiligenstraße ', '9', '3'),
	(default,'Austria', 'Vorarlberg', '6850', 'Dornbirn', 'Hochschulstraße', '3', null),
	(default,'Austria', 'Vorarlberg', '6751', 'Braz', 'Klostertalerstraße', '95', null),
	(default,'Austria', 'Vorarlberg', '6900', 'Bregenz', 'Montfortstraße', '7', '2'),
	(default,'Germany', 'Bayern', '81547', 'München', 'Säbenerstraße', '51', null),
	(default,'Switzerland', 'St. Gallen', '9000', 'St. Gallen', 'Schillerstrasse', '3', null),
	(default,'Liechtenstein', 'Tirol', '6020', 'Innsbruck', 'Dreiheiligenstraße ', '9', '3'),
	(default,'Italy', 'Rom', '00151', 'Trastevere', 'Basilica Di Santa Maria', '25', null),
	(default,'France', 'Grand Est', '9341', 'Straßburg', 'Rue de Saine', '13', null),
	(default,'Spain', 'Madrid', '28005', 'Embajadores', 'Calle de Tolledo', '42', null),
	(default,'Germany', 'Berlin','50800', 'Friedrichshain', 'Penzlauer Berg', '8', null),
	(default,'Austria', 'Vorarlberg', '6800', 'Feldkirch', 'Bahnhofstraße', '27', '8'),
	(default,'Germany', 'Köln', '50667', 'Marsplatz', 'Mariastraße', '55', null),
	(default,'Switzerland', 'Bayern', '53921', 'München', 'Josefstraße', '13', null),
	(default,'Italy', 'Rom', '00153', 'Straccio', 'Monte Bianco', '4', null),
	(default,'Germany', 'Bayern', '91448', 'Emskirchen', 'Altschauerberg', '8', null);


INSERT INTO CancelationPolicy (cancelationPolicyId, title) VALUES
	(default,'standard'),
	(default,'favored');


INSERT INTO ContractorType (contractorTypeId, description) VALUES
	(default,'company'),
	(default,'travel agency');


INSERT INTO TravelGroup (travelGroupId, name) VALUES
	(default,'Group 1');


INSERT INTO MerchandiseGroup (merchandiseGroupId, description, taxPercentageRate) VALUES
	(default,'groceries', 10.00),
	(default,'beverage', 20.00),
	(default,'overnight stay', 13.00),
	(default,'service', 20.00);


INSERT INTO OptionDescription (optionDescriptionId, description) VALUES
	(default,'confirmation'),
	(default,'deposit');


INSERT INTO OptionStatus (optionStatusCode, description) VALUES
	(1, 'pending'),
	(2, 'confirmed'),
	(3, 'canceled');


INSERT INTO ReservationStatus (reservationStatusCode, description) VALUES
	(1,'pending'),
	(2,'confirmed'),
	(3,'checked-in'),
	(4,'canceled'),
	(5,'checked-out');


INSERT INTO RoomCategory (roomCategoryId, description) VALUES
	(default,'1 bed room'),
	(default,'2 bed room'),
	(default,'3 bed room'),
	(default,'4 bed room'),
	(default,'5 bed room');


INSERT INTO RoomFacility (roomFacilityId, description, extraCharge) VALUES
	(default,'child bed', 10.00),
	(default,'extra bed', 15.00),
	(default,'special shower', 17.00),
	(default,'special curtains', 19.00),
	(default,'high-speed internet access', 23.00),
	(default,'jacuzzi', 144.00);


INSERT INTO RoomStatus (roomStatusCode, description) VALUES
	(1, 'occupied-cleaned'),
	(2, 'occupied-uncleaned'),
	(3, 'free-cleaned'),
	(4, 'free-uncleaned'),
	(5, 'out-of-order');


INSERT INTO Season (seasonId, description, startDate, endDate) VALUES
	(default,'winter 17/18', '2017-11-01', '2018-04-30'),
	(default,'summer 18', '2018-05-01', '2018-10-31'),
	(default,'winter 18/19', '2018-11-01', '2019-04-30'),
	(default,'summer 19', '2019-05-01', '2019-10-31');


-- Level 1
INSERT INTO CancelationCondition (cancelationConditionId, amount, percentage, daysBeforeArrival, cancelationPolicyId) VALUES
	(default,null, 50.00, 20, 1),
	(default,null, 100.00, 10, 1),
	(default,20.00, null, 30, 1),
	(default,null, 30.00, 20, 2),
	(default,null, 80.00, 10, 2);


INSERT INTO Contact (contactId, phone, email, fax, creditCardNumber, addressId) VALUES
	(default,'+436607079799', 'sabine.maier@hotmail.com', null, null, 1),
	(default,'+436643280412', 'p.treller@gmx.at', null, null, 2),
	(default,'+436763314090', 'claudia.mueller@gmail.com', null, null, 3),
	(default,'+436663424020', 'markus.meyer@gmx.de', null, null, 5),
	(default,'+436643483929', 'hansi@gmx.net', null, null, 6),
	(default,'+436997656837', 'nico01@gmail.de', null, null, 4),
	(default,'+436683453832', 'GuentherWeb@outlook.de', null, null, 9),
	(default,'+436604552593', 'Jkob@webmail.com', null, null, 11),
	(default,'+436680983832', 'PrinzPeter@outlook.com', null, null, 12);


INSERT INTO HotelServiceDescription (hotelServiceDescriptionId, description, title, priceSuggestion, isPackage, merchandiseGroupId) VALUES
	(default,'garage', 'garage', 5.00, false, 4),
	(default,'telefon', 'telefon', 0.30, false, 4),
	(default,'cafe', 'cafe', 3.50, true, 2),
	(default,'happy weekend', 'happy weekend', 3.50, true, 4),
	(default,'full board', 'full board', 30.00, false, 4),
	(default,'half board', 'half board', 20.00, false, 4),
	(default,'breakfast', 'breakfast', 5.00, false, 4),
	(default,'lemonade', 'lemonade', 5.00, false, 2),
	(default,'restaurant 10%', 'restaurant 10%', 0.00, false, 1),
	(default,'restaurant 20%', 'restaurant 20%', 0.00, false, 2),
	(default,'complete weekend for half the price', 'full board', 25.00, true, 4),
	(default,'family tariff', 'full board', 40.00, true, 4),
	(default,'0.5l bottle', 'still water', 0.50, false, 2),
	(default,'0.5l bottle', 'carbonated water', 0.50, false, 2),
	(default,'0.5l bottle', 'sprinkled apple juice', 0.50, false, 2),
	(default,'0,5l bottle', 'Ice-Tea peach', 1.00, false, 2),
	(default,'0.5l bottle', 'Coca-Cola', 1.50, false, 2);


INSERT INTO Room (roomNumber, maxPerson, roomStatusCode, roomCategoryId) VALUES
	(101, 2, 2, 2),
	(102, 2, 2, 2),
	(103, 1, 3, 1),
	(104, 2, 3, 2),
	(105, 2, 3, 2),
	(106, 3, 3, 2),
	(107, 3, 3, 2),
	(108, 3, 3, 3),
	(109, 3, 3, 3),
	(110, 4, 3, 3),
	(111, 4, 3, 3),
	(112, 4, 3, 4),
	(113, 4, 3, 4),
	(114, 5, 3, 4),
	(115, 5, 3, 4),
	(116, 5, 3, 5),
	(117, 5, 3, 5),
	(118, 5, 3, 5),
	(119, 6, 3, 5),
	(120, 6, 3, 5),
	(201, 4, 2, 3),
	(202, 3, 2, 3),
	(203, 1, 2, 1),
	(204, 5, 1, 5),
	(205, 5, 3, 5),
	(206, 4, 2, 4),
	(207, 3, 3, 3),
	(208, 2, 3, 1),
	(209, 2, 3, 1),
	(210, 2, 3, 1),
	(211, 2, 3, 1),
	(301, 3, 2, 2),
	(302, 3, 4, 3),
	(303, 1, 3, 1),
	(304, 2, 3, 2),
	(305, 2, 3, 2),
	(306, 2, 3, 2),
	(307, 3, 3, 2),
	(308, 3, 3, 2),
	(309, 3, 3, 2),
	(310, 3, 3, 2);

INSERT INTO RoomCategoryPrice (roomCategoryPriceId, listPrice, minimumPrice, dayPrice, costPrice, roomCategoryId, seasonId) VALUES
	(default,85, 70, 60, 50, 1, 1),
	(default,111, 100, 60, 50, 1, 2),
	(default,95, 80, 60, 50, 2, 1),
	(default,130, 110, 60, 50, 2, 2),
	(default,95, 80, 60, 50, 3, 1),
	(default,130, 110, 60, 50, 3, 2);


-- Level 2
INSERT INTO ContactNote (contactNoteId, text, contactId) VALUES
	(default,'Very quarrelsome', 1),
	(default,'Does not like cheese', 2),
	(default,'Likes high-class things', 3),
	(default,'Very quarrelsome', 5),
	(default,'Is vegan', 3),
	(default,'Has three children', 1),
	(default,'Has birthday while his stay', 2),
	(default,'Very sociable', 4),
	(default,'Needs his silence', 2);


INSERT INTO PackageDescription (packageId, serviceId) VALUES
	(4,1),
	(4,2),
	(4,5);


INSERT INTO Person (personId, degree, fname, lname, dateOfBirth, sex, isVip, inArchive) VALUES
	(1, null, 'Sabine', 'Maier', '1977-04-28', 'f', false, true),
	(2, 'Dr', 'Peter', 'Treller', '1991-10-02', 'm', false, true),
	(3, null, 'Claudia', 'Müller', '1985-01-15', 'f', false, true),
	(4, 'Mag', 'Denise', 'Sparr', '1996-01-01', 'f', false, true),
	(5, null, 'Verena', 'Luschnig', '1999-06-08', 'f', false, true);


INSERT INTO Reservation (reservationNumber, arrivalDate, arrivalTime, departureDate, payerContactId, cancelationPolicy, reservationStatusCode) VALUES
	(default,'2018-03-01', '14:00:00', '2018-05-25',1, 1, 3),
	(default,'2018-03-01', '15:30:00', '2018-05-27',2, 2, 3),
	(default,'2018-04-23', '17:30:00', '2018-04-29',7, 2, 2);


INSERT INTO RoomRoomFacility (roomNumber, roomFacilityId) VALUES
	(301, 2),
	(201, 2);


-- Level 3
INSERT INTO Contractor (contractorId, name, uid, iban, bic, contactPersonId, contractorTypeId) VALUES
	(6,'Omicron GmbH','342345656','AT472060111122223333','DOSPAT1ABLO',1,1),
	(7,'Blum GmbH','342345657','AT472060111122223334','DOSPAT1ABLL',2,1),
	(8,'Doppelmayr AG','342345658','AT472060111122223335','DOSPAT1ABLP',3,1),
	(9,'VKW AG','342345658','AT472060111122223335','DOSPAT1ABLP',4,1);


INSERT INTO Occupancy (occupancyNumber, startDate, endDate, travelGroupId, personId, roomNumber, positionId) VALUES
	(default,'2018-03-01','2018-04-18',1,1,201,null),
	(default,'2018-04-18','2018-05-25',1,2,202,null),
	(default,'2018-04-15','2018-04-18',1,3,203,null);


INSERT INTO PersonGroup (travelGroupId, personId) VALUES
	(1,1),
	(1,2),
	(1,3);


INSERT INTO ReservationGuest (reservationNumber, personId) VALUES
	(1, 1),
	(1, 5),
	(2, 4),
	(3, 2),
	(3, 3);


INSERT INTO ReservationOption (reservationOptionId, optionDate, optionDescriptionId, optionStatusCode, reservationNumber) VALUES
	(default,'2018-05-05', 1, 1, 2),
	(default,'2018-04-13', 2, 1, 3);


-- Level 4
INSERT INTO Contract (contractNumber, startDate, endDate, document, contractorId) VALUES
(default,'2018-01-01','2018-12-31',null,6),
(default,'2017-01-01','2017-12-31',null,7);


-- Level 5
INSERT INTO ContractDetail (contractDetailId, startDate, endDate, contractNumber) VALUES
	(default,'2017-01-01','2017-12-31',2),
	(default,'2018-01-01','2018-12-31',2),
	(default,'2018-06-08','2018-12-31',2),
	(default,'2018-01-01','2018-12-31',2);


-- Level 6
INSERT INTO CreditVoucher (creditVoucherId, amount) VALUES
	(1,20.99);


INSERT INTO ContractCancelationCondition (contractCancelationConditionId, amount, percentage, daysBeforeArrival) VALUES
	(2,22.99,30,30);


INSERT INTO Discount (discountId, discountPercentage) VALUES
	(3,29.30);


INSERT INTO Quota (quotaId, numberOfNights, price, roomCategory) VALUES
	(4,10,20.50,1);


-- Level 7
INSERT INTO ReservationUnit (reservationUnitId, startDate, endDate, notes, reservationNumber, roomNumber, roomCategoryId, quotaId) VALUES
	(default,'2018-01-01', '2018-01-16', null, 1, null, 1, null),
	(default,'2018-01-01', '2018-01-11', null, 1, null, 2, null),
	(default,'2018-01-03', '2018-01-23', null, 2, null, 4, null),
	(default,'2018-04-23', '2018-04-29', 'test note', 3, null, 2, 4),
	(default,'2018-04-23', '2018-04-29', null, 3, null, 2, 4),
	(default,'2018-04-23', '2018-04-29', 'test note', 3, null, 1, 4);


-- Level 8
INSERT INTO ReservationUnitHotelServiceDescription (hotelServiceDescriptionId, reservationUnitId) VALUES
	(1,1),
	(1,2),
	(11,2),
	(5,3),
	(6,4),
	(6,5),
	(7,6);


INSERT INTO ReservationUnitOccupancy (occupancyNumber, reservationUnitId) VALUES
	(1,1),
	(2,1);
