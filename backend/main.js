const admin = require('firebase-admin');
const serviceAccount = require('/Users/rasityilmaz/Desktop/Desktop/quotely_app/quotely_app/backend/env/credentials.json');

admin.initializeApp({
  credential: admin.credential.cert(serviceAccount),
  databaseURL: 'https://quotely-app-52130.firebaseio.com'
});

const message = {
  data: {
    title: 'Custom Data Title',
    message: 'This is a data message',
  
  },
  
  token: 'eV74DO5WzU6PqDg8Z83ee0:APA91bEFMU0E6outNbkTbNFTxdRHlYVh23oT4zbt5lIxzRPAydpOUTmOosQr3aKOGfe7wBchuEJQto_VrNDvjQp__fJ0ZXXf0JqutoPRlFTfICreWsCIr-iP00Sq9e9DOKg6CgaXXBTz', // veya topic: 'your_topic'
};

admin.messaging().send(message)
  .then((response) => {
    console.log('Successfully sent message:', response);
  })
  .catch((error) => {
    console.log('Error sending message:', error);
  });
