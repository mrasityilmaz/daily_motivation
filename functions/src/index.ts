import * as functions from 'firebase-functions';
import { CallableRequest, onCall } from 'firebase-functions/https';
import { initializeApp } from './firebase.admin';
import { Claims, JwtService } from './jwt.service';

// Initialize Firebase Admin SDK
initializeApp();

/**
 * FirebaseFunctions class for handling Firebase Functions.
 */
class FirebaseFunctions {
  /**
   * Generates a custom token for the given device ID.
   * @param {CallableRequest<any>} req - The request object containing the device ID.
   * @returns {Promise<any>} - A promise that resolves to the generated token.
   */
  static generateCustomToken = onCall(
    {
      enforceAppCheck: false,
    },
    async (req: CallableRequest<Claims>): Promise<{ token: string }> => {
      try {
        console.debug('data', req.data);

        const token = await JwtService.createCustomToken(req.data);

        console.debug('token', token);

        if (!token) {
          throw new functions.https.HttpsError('internal', 'Error generating custom token');
        } else {
          return {
            token: token,
          };
        }
      } catch (error) {
        throw new functions.https.HttpsError('internal', 'Error generating custom token');
      }
    }
  );
}

export const { generateCustomToken } = FirebaseFunctions;
