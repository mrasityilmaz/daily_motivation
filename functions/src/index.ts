import * as functions from 'firebase-functions';

// const serviceAccount = functions.config().service_account;

// const firebaseServiceAccount = typeof serviceAccount === 'string'
//   ? JSON.parse(serviceAccount)
//   : serviceAccount || {};

export const dailyJob = functions.pubsub.schedule('every 5 minutes').onRun(() => {
  const date = new Date();
  console.log('This will be run every 5 minutes! - ', date);
  return null;
});
