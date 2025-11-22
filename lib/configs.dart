// ignore_for_file: constant_identifier_names

import 'package:country_picker/country_picker.dart';

const APP_NAME = 'KortoTV';
const APP_MINI_LOGO_URL = '$DOMAIN_URL/img/logo/mini_logo.png';
const APP_LOGO_URL = '$DOMAIN_URL/img/logo/logo.png';
const DEFAULT_LANGUAGE = 'en';
const DASHBOARD_AUTO_SLIDER_SECOND = 6000;
const CUSTOM_AD_AUTO_SLIDER_SECOND_VIDEO = 30000;
const CUSTOM_AD_AUTO_SLIDER_SECOND_IMAGE = 30000;
const LIVE_AUTO_SLIDER_SECOND = 5;

const API_VERSION = 2;

///DO NOT ADD SLASH HERE
const DOMAIN_URL = "https://pruebasv1.kortotv.com";

const BASE_URL = '$DOMAIN_URL/api/';

const APP_APPSTORE_URL = '';

///LOCAL VIDEO TYPE URL
const LOCAL_VIDEO_DOMAIN_URL = '$DOMAIN_URL/storage/streamit-laravel/';

//region STRIPE
const STRIPE_URL = 'https://api.stripe.com/v1/payment_intents';
const STRIPE_merchantIdentifier = "merchant.flutter.stripe.test";
const STRIPE_MERCHANT_COUNTRY_CODE = 'IN';
const STRIPE_CURRENCY_CODE = 'INR';
//endregion

//region RazorPay
const String commonSupportedCurrency = 'INR';
//endregion

//region  PAYSTACK
const String payStackCurrency = "NGN";
//endregion

// PAYPAl
const String payPalSupportedCurrency = 'USD';
//endregion

//ADs
//Live keys
// //Android
const INTERSTITIAL_AD_ID = "Please add your ad id here";
const BANNER_AD_ID = "Please add your ad id here";

// //IOS
const IOS_INTERSTITIAL_AD_ID = "Please add your ad id here";
const IOS_BANNER_AD_ID = "Please add your ad id here";

//Note: For FIREBASE_SERVER_CLIENT_ID ---> Go to android/app/google-services.json
// - Find press ctrl+F and look for "client_type": 3
// "client_id" in same object has be pasted here
const FIREBASE_SERVER_CLIENT_ID =
    'Please add your Firebase Server client id here';
//region defaultCountry
Country get defaultCountry => Country(
      phoneCode: '57',
      countryCode: 'CO',
      e164Sc: 0,
      geographic: true,
      level: 1,
      name: 'Colombia',
      example: '3211234567',
      displayName: 'Colombia (CO) [+57]',
      displayNameNoCountryCode: 'Colombia (CO)',
      e164Key: '57-CO-0',
      fullExampleWithPlusSign: '+573211234567',
    );
//endregion
