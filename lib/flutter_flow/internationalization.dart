import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['ru', 'en', 'ko'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? ruText = '',
    String? enText = '',
    String? koText = '',
  }) =>
      [ruText, enText, koText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // CreateNewOrder
  {
    't39u5i2w': {
      'ru': 'Мои заявки',
      'en': 'Offers',
      'ko': '제안',
    },
    'yjpkdja2': {
      'ru': 'Создать заявку',
      'en': 'Create a offer',
      'ko': '요청 만들기',
    },
    'al304jjo': {
      'ru': 'Заявки',
      'en': 'Applications',
      'ko': '응용',
    },
  },
  // CreateAccount
  {
    '5rl0xq4p': {
      'ru': 'AutoBuy',
      'en': 'AutoBuy',
      'ko': 'AutoBuy',
    },
    'w2hj9fdt': {
      'ru': 'Создать аккаунт',
      'en': 'Sign up',
      'ko': '계정 만들기',
    },
    'x5v02gyr': {
      'ru': 'Заполните ваши данные, чтобы создать учётную запись',
      'en': 'Fill in your details to create an account',
      'ko': '계정을 만들려면 세부 정보를 입력하세요.',
    },
    'h049yf63': {
      'ru': 'Номер телефона',
      'en': '',
      'ko': '',
    },
    'ktm4857l': {
      'ru': 'Email',
      'en': 'Email',
      'ko': 'Email',
    },
    'j5xofn0w': {
      'ru': 'Имя профиля',
      'en': 'Prifile name',
      'ko': '프로필 이름',
    },
    'quuquviq': {
      'ru': 'Пароль',
      'en': 'Password',
      'ko': '비밀번호',
    },
    'dr0ukhl2': {
      'ru': 'Подтвердите пароль',
      'en': 'Confirm password',
      'ko': '비밀번호를 확인하세요',
    },
    'q7fyxhze': {
      'ru': 'Создать аккаунт',
      'en': 'Create account',
      'ko': '계정 만들기',
    },
    '7x4y261i': {
      'ru': 'Уже зарегистрированы? ',
      'en': 'Already registered?',
      'ko': '이미 등록?',
    },
    'zhpel6yr': {
      'ru': 'Войдите здесь',
      'en': 'Login here',
      'ko': '여기에 로그인하세요',
    },
    '3i2mmp5d': {
      'ru': 'Домой',
      'en': 'Home',
      'ko': '집',
    },
  },
  // Login
  {
    'cz07m05i': {
      'ru': 'AutoBuy',
      'en': 'AutoBuy',
      'ko': 'AutoBuy',
    },
    '736gednw': {
      'ru': 'Вход',
      'en': 'Sign in',
      'ko': '안으로',
    },
    'r0f7h1mz': {
      'ru': 'Введите ваши данные, чтобы продолжить',
      'en': 'Enter your details to continue',
      'ko': '계속하려면 세부정보를 입력하세요',
    },
    'o1oqc8ao': {
      'ru': 'Email',
      'en': 'Email',
      'ko': 'Email',
    },
    'kgypic30': {
      'ru': 'Пароль',
      'en': 'Password',
      'ko': '비밀번호',
    },
    'o7vvf7sb': {
      'ru': 'Войти',
      'en': 'Log in',
      'ko': '안으로',
    },
    '6f08hvb1': {
      'ru': 'Ещё не зарегистрированы? ',
      'en': 'Not registered yet?',
      'ko': '아직 등록하지 않으셨나요?',
    },
    'fm5qm78p': {
      'ru': 'Создайте учётную запись',
      'en': 'Create an account',
      'ko': '계정 만들기',
    },
    '3p6oyw16': {
      'ru': 'Забыли пароль? ',
      'en': 'Forgot your password?',
      'ko': '비밀번호를 잊어 버렸습니까?',
    },
    'bxu44a0p': {
      'ru': 'Сбросьте с помощью Email',
      'en': 'Reset using Email',
      'ko': '이메일을 사용하여 재설정',
    },
    'hxcno2ba': {
      'ru': 'Домой',
      'en': 'Home',
      'ko': '집',
    },
  },
  // ForgotPassword
  {
    'rz5129ch': {
      'ru': 'AutoBuy',
      'en': 'AutoBuy',
      'ko': 'AutoBuy',
    },
    '2g0beb9b': {
      'ru': 'Забыли пароль?',
      'en': 'Forgot your password?',
      'ko': '비밀번호를 잊어 버렸습니까?',
    },
    'eaoo1woe': {
      'ru': 'Введите ваш email для восстановления аккаунта',
      'en': 'Enter your email to recover your account',
      'ko': '계정을 복구하려면 이메일을 입력하세요',
    },
    'lg6ynns6': {
      'ru': 'Введите ваш email',
      'en': '',
      'ko': '',
    },
    '10cwqazw': {
      'ru': 'Восстановить',
      'en': 'Recover',
      'ko': '복원하다',
    },
    'se5w3jt1': {
      'ru': 'Домой',
      'en': 'Home',
      'ko': '집',
    },
  },
  // Profile
  {
    'n5kyb2n4': {
      'ru': 'Выйти из профиля',
      'en': 'Log out',
      'ko': '프로필에서 로그아웃',
    },
    'wti68mb7': {
      'ru': 'Профиль',
      'en': 'Profile',
      'ko': '프로필',
    },
    'm4btj391': {
      'ru': 'Профиль',
      'en': 'Profile',
      'ko': '프로필',
    },
  },
  // ChatPage
  {
    's1qapfhf': {
      'ru': 'Введите ваше сообщение...',
      'en': '',
      'ko': '',
    },
    'lhq1q012': {
      'ru': 'Home',
      'en': '',
      'ko': '',
    },
  },
  // PhoneLogin
  {
    '8exyvrb6': {
      'ru': 'AutoBuy',
      'en': '',
      'ko': '',
    },
    '7oo5161m': {
      'ru': 'Вход | Регистрация',
      'en': '',
      'ko': '',
    },
    'ro99rnw0': {
      'ru': 'Введите ваши данные, чтобы продолжить',
      'en': '',
      'ko': '',
    },
    'lnca8gc2': {
      'ru': 'Номер телефона',
      'en': '',
      'ko': '',
    },
    'i4q35lon': {
      'ru': 'Продолжить',
      'en': '',
      'ko': '',
    },
    '5iy628t0': {
      'ru': 'Home',
      'en': '',
      'ko': '',
    },
  },
  // PhoneVerify
  {
    'tmnm9udk': {
      'ru': 'AutoBuy',
      'en': '',
      'ko': '',
    },
    'tc6lfd4l': {
      'ru': 'Код верификации',
      'en': '',
      'ko': '',
    },
    'nanauz73': {
      'ru': 'Введите 6-и значный код подтверждения отправленный на номер ',
      'en': '',
      'ko': '',
    },
    '1iuyqd9h': {
      'ru': 'Подтвердить',
      'en': '',
      'ko': '',
    },
    'f3n0x68e': {
      'ru': 'Home',
      'en': '',
      'ko': '',
    },
  },
  // CreateNewOrderPage
  {
    'zpd67i7i': {
      'ru': 'Добавить фото\n(до 10 штук)',
      'en': '',
      'ko': '',
    },
    'dnxmno9b': {
      'ru': 'Модель машины',
      'en': '',
      'ko': '',
    },
    're82dreu': {
      'ru': 'Год выпуска',
      'en': '',
      'ko': '',
    },
    'ezhl92ye': {
      'ru': 'Пробег',
      'en': '',
      'ko': '',
    },
    '9tqcfi6z': {
      'ru': 'Бензин',
      'en': '',
      'ko': '',
    },
    'd0dukzba': {
      'ru': 'Дизель',
      'en': '',
      'ko': '',
    },
    '5df6fz9g': {
      'ru': 'Газ',
      'en': '',
      'ko': '',
    },
    'hcj0hu59': {
      'ru': 'Бензин',
      'en': '',
      'ko': '',
    },
    'd3egs9kk': {
      'ru': 'Пожалуйста, выберите',
      'en': '',
      'ko': '',
    },
    'zzuypj03': {
      'ru': 'Поиск',
      'en': '',
      'ko': '',
    },
    'd9hdhscm': {
      'ru': 'Тип двигателя',
      'en': '',
      'ko': '',
    },
    'b7jfrdss': {
      'ru': 'Объем двигателя',
      'en': '',
      'ko': '',
    },
    'pusucc6g': {
      'ru': 'Цвет кузова',
      'en': '',
      'ko': '',
    },
    'is1ynt6o': {
      'ru': 'Отправить заявку',
      'en': '',
      'ko': '',
    },
    '9pveqsmj': {
      'ru': 'Home',
      'en': '',
      'ko': '',
    },
  },
  // NewRequest
  {
    'ptiwfh4r': {
      'ru': 'Добавить фото\n(до 10 штук)',
      'en': '',
      'ko': '',
    },
    'sxu7f7bq': {
      'ru': 'Модель машины',
      'en': 'The model of car',
      'ko': '',
    },
    '9nwjbcb2': {
      'ru': 'Год выпуска',
      'en': 'Year of issue',
      'ko': '',
    },
    'lbi55ml0': {
      'ru': 'Пробег',
      'en': 'Car mileage',
      'ko': '',
    },
    'praa0b7g': {
      'ru': 'Бензин',
      'en': '',
      'ko': '',
    },
    '0g7c7h88': {
      'ru': 'Дизель',
      'en': '',
      'ko': '',
    },
    'bmxwkb5t': {
      'ru': 'Газ',
      'en': '',
      'ko': '',
    },
    '6u7s8c6u': {
      'ru': 'Бензин',
      'en': '',
      'ko': '',
    },
    '2jhkmk0d': {
      'ru': 'Пожалуйста, выберите',
      'en': '',
      'ko': '',
    },
    'wtf2gyo2': {
      'ru': 'Поиск',
      'en': '',
      'ko': '',
    },
    'urslwy47': {
      'ru': 'Тип двигателя',
      'en': '',
      'ko': '',
    },
    'adqjybdo': {
      'ru': 'Объем двигателя',
      'en': '',
      'ko': '',
    },
    't64pmskg': {
      'ru': 'Цвет кузова',
      'en': '',
      'ko': '',
    },
    'vvoeywy7': {
      'ru': 'Отправить заявку',
      'en': '',
      'ko': '',
    },
  },
  // Request
  {
    'hueurji7': {
      'ru': 'Модель машины:',
      'en': '',
      'ko': '',
    },
    '9h1gz5bb': {
      'ru': 'Состояние заявки:',
      'en': '',
      'ko': '',
    },
    'ti3kjf3l': {
      'ru': 'При возникновении вопросов:',
      'en': '',
      'ko': '',
    },
    'zvxcbqy9': {
      'ru': 'Звонок',
      'en': '',
      'ko': '',
    },
    '312cer0f': {
      'ru': 'Сообщение',
      'en': '',
      'ko': '',
    },
    'c5flm84n': {
      'ru': 'WhatsApp',
      'en': '',
      'ko': '',
    },
    '687yk0ml': {
      'ru': 'Перейти в чат',
      'en': '',
      'ko': '',
    },
    'lskawpwv': {
      'ru': 'Удалить',
      'en': '',
      'ko': '',
    },
    'tg7bijna': {
      'ru': 'Поле обязательно для заполнения',
      'en': '',
      'ko': '',
    },
    'esni7d8k': {
      'ru': 'Пожалуйста, выберите',
      'en': '',
      'ko': '',
    },
    'c0wmae6y': {
      'ru': 'Поле обязательно для заполнения',
      'en': '',
      'ko': '',
    },
    'llbxocwu': {
      'ru': 'Пожалуйста, выберите',
      'en': '',
      'ko': '',
    },
    '3sum2uo5': {
      'ru': 'Поле обязательно для заполнения',
      'en': '',
      'ko': '',
    },
    'rs2niu87': {
      'ru': 'Пожалуйста, выберите',
      'en': '',
      'ko': '',
    },
    '0yny6xc9': {
      'ru': 'Поле обязательно для заполнения',
      'en': '',
      'ko': '',
    },
    't8in7zsi': {
      'ru': 'Пожалуйста, выберите',
      'en': '',
      'ko': '',
    },
    '2vwfjxme': {
      'ru': 'Поле обязательно для заполнения',
      'en': '',
      'ko': '',
    },
    '00qvqydr': {
      'ru': 'Пожалуйста, выберите',
      'en': '',
      'ko': '',
    },
    'cqt66zw9': {
      'ru': 'Поле обязательно для заполнения',
      'en': '',
      'ko': '',
    },
    'rlps81el': {
      'ru': 'Пожалуйста, выберите',
      'en': '',
      'ko': '',
    },
    'f3qb7nx9': {
      'ru': 'Поле обязательно для заполнения',
      'en': '',
      'ko': '',
    },
    'zn22g9n3': {
      'ru': 'Пожалуйста, выберите',
      'en': '',
      'ko': '',
    },
    '7jssacvz': {
      'ru': 'Поле обязательно для заполнения',
      'en': '',
      'ko': '',
    },
    'mry8rf7h': {
      'ru': 'Пожалуйста, выберите',
      'en': '',
      'ko': '',
    },
  },
  // Miscellaneous
  {
    '6a0wzji8': {
      'ru': '',
      'en': 'Access to the camera',
      'ko': '카메라에 대한 액세스',
    },
    'nj8nfh5w': {
      'ru': '',
      'en': 'Access to the gallery',
      'ko': '갤러리에 대한 액세스',
    },
    'vz11wnu9': {
      'ru': 'Ошибка',
      'en': 'Error',
      'ko': '실수',
    },
    'pw0deynm': {
      'ru': 'Ссылка для сброса пароля отправлена на почту',
      'en': 'Password reset link sent by email',
      'ko': '이메일로 전송된 비밀번호 재설정 링크',
    },
    'h4rfep3y': {
      'ru': 'Введите Email',
      'en': 'Enter Email',
      'ko': '이메일을 입력하세요',
    },
    'g4s1vpu4': {
      'ru': 'Введите номер телефона (+)',
      'en': 'Enter your phone number (+)',
      'ko': '전화번호를 입력하세요 (+)',
    },
    'lcybziya': {
      'ru': 'Пароли не совпадают',
      'en': 'Password mismatch',
      'ko': '암호 불일치',
    },
    'yu8rw43s': {
      'ru': 'Введите код из СМС',
      'en': 'Enter the code from SMS',
      'ko': 'SMS의 코드를 입력하세요',
    },
    '1c08vptk': {
      'ru': 'Войдите в аккаунт',
      'en': 'Login to your account',
      'ko': '귀하의 계정에 로그인하십시오',
    },
    'jyru27fb': {
      'ru': 'Войдите в аккаунт',
      'en': 'Login to your account',
      'ko': '귀하의 계정에 로그인하십시오',
    },
    'ejhgff1c': {
      'ru': 'Ссылка для броса Email отправлена на почту',
      'en': 'Email reset link sent to your email',
      'ko': '귀하의 이메일로 이메일 재설정 링크가 전송되었습니다',
    },
    '0fxmxbmo': {
      'ru': 'Email уже занят',
      'en': 'Email is already taken',
      'ko': '이메일은 이미 사용 중입니다',
    },
    'uvv0a994': {
      'ru': 'Неверные данные',
      'en': 'Incorrect data',
      'ko': '잘못된 데이터',
    },
    'c4vxfdon': {
      'ru': 'Неверный формат файла',
      'en': 'Invalid file format',
      'ko': '잘못된 파일 형식',
    },
    'lrcsbk53': {
      'ru': 'Загрузить файл(ы)',
      'en': 'Upload file',
      'ko': '파일 업로드',
    },
    'kxowumi0': {
      'ru': 'Успешно',
      'en': 'Successfully',
      'ko': '성공적으로',
    },
    'x4kp4ftf': {
      'ru': 'Ошибка',
      'en': 'Error',
      'ko': '오류',
    },
    'sjt6ccyy': {
      'ru': '',
      'en': '',
      'ko': '',
    },
    'b3nwliuo': {
      'ru': 'Выберите источник',
      'en': 'Select source',
      'ko': '소스 선택',
    },
    'iuxyhea6': {
      'ru': 'Галерея',
      'en': 'Gallery',
      'ko': '갤러리',
    },
    '0lu7vq0k': {
      'ru': 'Галерея (фото)',
      'en': 'Gallery (photo)',
      'ko': '갤러리 (사진)',
    },
    'c5mnopqj': {
      'ru': 'Галерея (видео)',
      'en': 'Gallery (video)',
      'ko': '갤러리(동영상)',
    },
    'm1wrgdbb': {
      'ru': 'Камера',
      'en': 'Camera',
      'ko': '카메라',
    },
    'osxglesx': {
      'ru': '',
      'en': '',
      'ko': '',
    },
    'krs2ivao': {
      'ru': '',
      'en': '',
      'ko': '',
    },
    'kip116pd': {
      'ru': '',
      'en': '',
      'ko': '',
    },
    '21w6047l': {
      'ru': '',
      'en': '',
      'ko': '',
    },
  },
].reduce((a, b) => a..addAll(b));
