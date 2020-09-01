const functions = require('firebase-functions');
const admin = require('firebase-admin');

admin.initializeApp(functions.config().functions);

var newData;

exports.messageTrigger = functions.firestore.document('Messages/{messageId}').onCreate(async (snapshot, context) => {

    if (snapshot.empty) {
        console.log('No Devices');
        return;
    }


    var tokens = ['epJ7tZ1sm3I:APA91bGQloza9XOP4FWR4NkyUagbOJ3Cyt3QTrlg49sBBE9LaKY9epGvZm6G0xE1OM2pqYwKwtZG6uFyrcAldaLDq1Wx7j7qRO2xUsfqatOgfN3RnPp-Rzh3zwnFQ3XhLpOZnPTYxEv5'];
    newData = snapshot.data();

    var payload = {
        notification: {
            title: 'COVID-19 Nepal',
            body: 'New case alert',
            sound: 'default',
        },
        data: {
            click_action: 'FLUTTER_NOTIFICATION_CLICK', message: 'Sample database message'
        },
    };

    try {
        const response = await admin.messaging().sendToDevice(tokens,payload);
        console.log('Notification sent successfully');
    } catch (err) {
        console.log(err);
    }
});