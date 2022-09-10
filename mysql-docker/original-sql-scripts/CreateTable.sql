CREATE TABLE IF NOT EXISTS user (
    userId INT AUTO_INCREMENT PRIMARY KEY, /* PK */
    firstName VARCHAR (50) NOT NULL,
    lastName VARCHAR (50) NOT NULL, 
    addressLine1 VARCHAR (500),
    addressLine2 VARCHAR (500),
    birthMonth INT,
    birthYear INT
);

CREATE TABLE IF NOT EXISTS userFoodLove (
    userId INT NOT NULL,  
    foodName VARCHAR(100) NOT NULL, 
    foodDetails VARCHAR(1000) NOT NULL, /* User describes what they love */
    foodUrl VARCHAR(500) null, /* link to see / or purchase this food */
    foodVendor VARCHAR(500) null,
    foodVendorUrl VARCHAR(500) null, /* link to this food vendor */
    PRIMARY KEY(userId, foodName)
);

CREATE TABLE IF NOT EXISTS userPlaceLove (
    userId INT NOT NULL, 
    placeName VARCHAR(500) NOT NULL, 
    placeDetails VARCHAR(1000) NOT NULL, /* what user loves about the place */
    placeMapUrl VARCHAR(500), 
    placeOfficialUrl VARCHAR(500), 
    PRIMARY KEY(userId, placeName)
);
