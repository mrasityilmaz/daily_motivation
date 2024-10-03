
import * as functions from 'firebase-functions';
import { getAdminAuth } from './firebase.admin';

/**
 * Claims interface for custom token generation.
 */
interface Claims {
  uid: string;
  deviceId: string;
}

/**
 * JwtService class for handling JWT operations.
 */
class JwtService {
  /**
   * Creates a custom token with the given claims.
   * @param {Claims} claims - The claims to include in the custom token.
   * @return {Promise<string>} - A promise that resolves to the generated custom token.
   * @throws {functions.https.HttpsError} - Throws an error if claims are missing or token generation fails.
   */
  static async createCustomToken(claims: Claims): Promise<string> {
    if (!claims) {
      throw new functions.https.HttpsError('invalid-argument', 'Claims are required');
    }

    const userClaims: Claims = {
      uid: claims.uid,
      deviceId: claims.deviceId,
    };

    console.debug('userClaims', userClaims);

    const generatedToken = await getAdminAuth().createCustomToken(userClaims.uid, { deviceId: userClaims.deviceId });

    if (!generatedToken) {
      throw new functions.https.HttpsError('internal', 'Error generating custom token');
    }

    return generatedToken;
  }

  // Uncomment and add JSDoc comments if you need this method
  // /**
  //  * Verifies a given token.
  //  * @param {string} token - The token to verify.
  //  * @returns {{ valid: boolean; deviceId?: string; error?: string }} - The verification result.
  //  * @throws {functions.https.HttpsError} - Throws an error if token is missing or verification fails.
  //  */
  // static verifyToken(token: string): { valid: boolean; deviceId?: string; error?: string } {
  //   if (!token) {
  //     throw new functions.https.HttpsError('invalid-argument', 'Token is required');
  //   }

  //   try {
  //     const decoded = jwt.verify(token, SECRET_KEY) as jwt.JwtPayload;
  //     return { valid: true, deviceId: decoded.deviceId };
  //   } catch (error) {
  //     return { valid: false, error: error.message };
  //   }
  // }
}

export { Claims, JwtService };
