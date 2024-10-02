import * as admin from 'firebase-admin';
import firebaseConfig from './config/firebase.config';


const firebaseServiceAccount = firebaseConfig().firebaseServiceAccount;

const initializeApp = () => {
  admin.initializeApp({
    credential: admin.credential.cert(firebaseServiceAccount as admin.ServiceAccount),
  });
};

const getAdminAuth = () => {
  if (!admin.apps.length) {
    initializeApp();
  }
  return admin.auth();
};

export { getAdminAuth, initializeApp };
