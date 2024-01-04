const admin = require("firebase-admin");
const logger = require("firebase-functions/logger");
const  functions = require("firebase-functions");

admin.initializeApp();

exports.initAccount = functions.auth.user().onCreate(async (user, _) => {
    logger.log(user);

    const data = {
        // gen
        "email": user.email,
        "passwordHash": user.passwordHash,
        "emailVerified": user.emailVerified,
        "createdAt": Date.now(),
        // act
        "lnurl": null,
        "baseCurrency": "usd",
        "plaidLink": false,
        "baasAccount": false,
    };

    return await admin.firestore().collection("account").doc(user.uid).set(data)
    .then((res) => {
        return res;
    })
    .catch((err) => {
        // TODO handle error case
        console.log("An error occurred writing an account collection document for a new user.", err);
        return null;
    })
});
