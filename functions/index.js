const admin = require("firebase-admin");
const logger = require("firebase-functions/logger");
const functions = require("firebase-functions");
const crypto = require("crypto");
const { FieldValue } = require("firebase-admin/firestore");

admin.initializeApp();

exports.initAccount = functions.auth.user().onCreate(async (user, _) => {
    logger.log(user);
    // TODO enforce uniqueness of accountId
    const data = {
        "accountId": crypto.randomUUID(),
        "createdAt": Date.now(),
        // act
        "lnurl": null,
        "baseCurrency": "usd",
        "plaidLink": false,
        "baasAccount": false,
    };
    // custom claims

    // TODO add a second call to create a metadat collection document
    // where the uid is used as the document id, just like the account collection 
    // document for the user.
    return await admin.firestore().collection("account").doc(user.uid).set(data)
    .then((_res) => {
        return admin.firestore().doc(`metadata/${user.uid}`).set({refreshTime: FieldValue.serverTimestamp()})
    })
    .catch((err) => {
        // TODO handle error case
        console.log("An error occurred writing an account collection document for a new user.", err);
        return null;
    })
});
