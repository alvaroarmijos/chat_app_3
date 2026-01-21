const functions = require('firebase-functions/v1');
const admin = require('firebase-admin');
const { error } = require('firebase-functions/logger');

admin.initializeApp();

exports.pushNotifications = functions.database.ref('/chats/{chatId}/{messageId}').onCreate((snap, context) => {
    console.log('New message added, sending notifications...');

    const messageData = snap.val();

    const sentBy = messageData.sentBy;
    const sentTo = messageData.sentTo;

    const name = admin.database().ref(`/contacts/${sentBy}/name`).once('value');
    const token = admin.database().ref(`/contacts/${sentTo}/token`).once('value');

    Promise.all([name, token]).then( async ([nameSnapshot, tokenSnapshot]) => {
        const name = nameSnapshot.val();
        const token = tokenSnapshot.val();

        if (token == null) return error('No token found for the recipient');

            const payload = {
                token: token,
                notification: {
                    title: name,
                    body: messageData.message

                }
            };

        try {
            await admin.messaging().send(payload);
            console.log('Notification sent successfully');
            return {success: true};
        } catch (error) {
            console.error('Error sending notification:', error);
        }
        
    });

});