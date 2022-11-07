CREATE TABLE `Owner` (
  `OwnerID` pk,
  `OwnerFName` Type,
  `OwnerLName` Type,
  `OwnerAddress` Type,
  `OwnerZIPCode` Type,
  `OwnerPhone` Type
);

CREATE TABLE `Boat` (
  `BoatID` pk,
  `OwnerID` fk,
  `BoatName` Type,
  `BoatModel` Type,
  `BoatYear` Type,
  `BoatLength` Type,
  `BoatCapacity` Type,
  `PricePerDay` Type,
  FOREIGN KEY (`OwnerID`) REFERENCES `Owner`(`OwnerID`)
);

CREATE TABLE `Renter` (
  `RenterID` pk,
  `RenterFName` <type>,
  `RenterLName` Type,
  `RenterAddress` Type,
  `RenterZIPCode` Type,
  `RenterPhone` Type
);

CREATE TABLE `Order` (
  `OrderID` pk,
  `RentDate` Type,
  `RenterID` fk,
  `OrderTotal` Type,
  FOREIGN KEY (`RenterID`) REFERENCES `Renter`(`RenterID`)
);

CREATE TABLE `OrderLine` (
  `OrderLineID` pk,
  `BoatID` fk,
  `RentLength` Type,
  `SubTotal` Type,
  FOREIGN KEY (`OrderLineID`) REFERENCES `Order`(`OrderID`),
  FOREIGN KEY (`BoatID`) REFERENCES `Boat`(`BoatID`)
);