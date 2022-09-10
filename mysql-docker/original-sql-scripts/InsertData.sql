INSERT INTO user 
(userId, firstName, lastName, addressLine1, addressLine2, birthMonth, birthYear)
VALUES
(1, "Jerry", "Smith", "123 Test Lane", null, "1", "1990");

INSERT INTO userFoodLove
(userId, foodName, foodDetails, foodUrl, foodVendor, foodVendorUrl)
VALUES
(1, "Choo Chee Curry Salmon", "This is the most delicious curry you'll ever eat.  If you like moderately spicy Thai food, you have to try this!", null, null, null);

INSERT INTO userFoodLove
(userId, foodName, foodDetails, foodUrl, foodVendor, foodVendorUrl)
VALUES
(1, "Berlin Doner Kebab", "If you travel to Berlin you have to try this delicious Middle Eastern Kebab that is iconic there.  I'm partial to the lamb meat filling.", null, null, null);

INSERT INTO userPlaceLove
(userId, placeName, placeDetails, placeMapUrl, placeOfficialUrl)
VALUES
(1, "Berlin, Germany", "Berlin is such a fascinating and modern place that is very English speaker friendly.  It has great food, a hip culture scene, excellent public transportation (except for their poor airports), and its amazing cold war history.  It is very bike friendly also and the weather is wonderful.  I highly recommend visiting.", "https://goo.gl/maps/yA9EQUBJyjGApLFn6", null);

