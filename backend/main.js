const admin = require('firebase-admin');
const serviceAccount = require('/Users/rasityilmaz/Desktop/Desktop/quotely_app/quotely_app/backend/env/credentials.json');

admin.initializeApp({
  credential: admin.credential.cert(serviceAccount),
  databaseURL: 'https://quotely-app-52130.firebaseio.com'
});

const message = {
  data: {
    title: 'Test-22',
    message: 'Test-22',
  
  },

  android: {
    priority: 'high',
  },
  apns: {
    payload: {
      aps: {
        'content-available': 1,
      },
    },
  },
  
  token: 'cx_jpstxAEHNlN_tQMevNS:APA91bEq6hY6vSc8j6GrDC67exjpQeUKs-Xo67GLl1cCHpQcBcAcKQQ5cWanHZoxq8K3gcHHiNtM8NtUNQ_TrDDd1NWUeKYXtFeBlfWHAf2MBbwPwf7P1QEolIREAitQxq0E852Ni_bv', // veya topic: 'your_topic'
};

admin.messaging().send(message)
  .then((response) => {
    console.log('Successfully sent message:', response);
  })
  .catch((error) => {
    console.log('Error sending message:', error);
  });
