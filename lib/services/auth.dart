import 'package:amazon_cognito_identity_dart_2/cognito.dart';
import 'package:auth/services/auth_storage.dart';
import 'package:auth/utils/random.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Setup AWS User Pool Id & Client Id settings here:
const awsUserPoolId = 'eu-west-2_Sj83k3lX8';
const awsClientId = '335jdbkc7rggq2o3c1fohrjdp0';
const identityPoolId =
    'arn:aws:cognito-idp:eu-west-2:727222249318:userpool/eu-west-2_Sj83k3lX8';

GetIt locator = GetIt.instance;

class Auth {
  CognitoUserPool userPool;
  CognitoUser cognitoUser;
  CognitoUserSession session;
  CognitoCredentials credentials;

  String emailFromUserAttributes(List<CognitoUserAttribute> list) {
    CognitoUserAttribute emailAttribute =
        list.firstWhere((item) => item.getName() == 'email');
    return emailAttribute.getValue();
  }

  Future<String> init() async {
    userPool = CognitoUserPool(awsUserPoolId, awsClientId);

    final prefs = await SharedPreferences.getInstance();
    final storage = AuthStorage(prefs);
    userPool.storage = storage;
    cognitoUser = await userPool.getCurrentUser();

    if (cognitoUser != null) {
      session = await cognitoUser.getSession();
      if (session.isValid()) {
        print('session Valid ');
        final listAttribute = await cognitoUser.getUserAttributes();
        return emailFromUserAttributes(listAttribute);
      }
    }
    storage.clear();
    return null;
  }

  Future<String> getCurrentUsername() async {
    if (cognitoUser == null || session == null) {
      return null;
    }
    if (!session.isValid()) {
      return null;
    }

    return cognitoUser.getUsername();
  }

  Future<bool> checkAuthenticated() async {
    if (cognitoUser == null || session == null) {
      return false;
    }
    return session.isValid();
  }

  Future<bool> signUp(String email) async {
    final randomPwd = UtilsRandom.randomString(10);

    final userAttributes = [
      new AttributeArg(name: 'email', value: email),
      new AttributeArg(name: 'name', value: email),
    ];
    try {
      await userPool.signUp(
        email,
        randomPwd,
        userAttributes: userAttributes,
      );
      cognitoUser = new CognitoUser(email, userPool, storage: userPool.storage);

      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> askCode(String email) async {
    cognitoUser = new CognitoUser(email, userPool, storage: userPool.storage);
    print("authstorage ${userPool.storage}");
    print('cognitoUser AskCode $cognitoUser');
    try {
      await cognitoUser.forgotPassword();
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> confirmCode(String code) async {
    final randomPwd = UtilsRandom.randomString(10);
    print('cognitoUser confirmCode $cognitoUser');

    if (cognitoUser == null) {
      return false;
    }

    try {
      final passwordConfirmed =
          await cognitoUser.confirmPassword(code, randomPwd);

      final authDetails = AuthenticationDetails(
        username: cognitoUser.username,
        password: randomPwd,
      );

      print('passwordConfirmed $passwordConfirmed');

      session = await cognitoUser.authenticateUser(authDetails);
      print('session ${session.isValid()}');
      return (passwordConfirmed);
    } catch (e) {
      return false;
    }
  }

  Future<void> signOut() async {
    print('SISTARTT');

    if (credentials != null) {
      await credentials.resetAwsCredentials();
    }
    if (cognitoUser != null) {
      await cognitoUser.signOut();
    }
    if (userPool != null) {
      await userPool.storage.clear();
    }

    print('SIGNOUT');
  }

  Future<CognitoCredentials> getCredentials() async {
    if (cognitoUser == null || session == null) {
      return null;
    }
    credentials = CognitoCredentials(identityPoolId, userPool);
    await credentials.getAwsCredentials(session.getIdToken().getJwtToken());
    return credentials;
  }
}
