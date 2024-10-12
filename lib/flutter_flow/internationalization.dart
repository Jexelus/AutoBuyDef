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
  // Orders
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
    'ybdvs5ap': {
      'ru': 'Сменить тему',
      'en': '',
      'ko': '',
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
      'en': 'Enter your message...',
      'ko': '메시지를 입력하세요...',
    },
    'lhq1q012': {
      'ru': 'Домой',
      'en': 'Home',
      'ko': '집',
    },
  },
  // Login
  {
    '8exyvrb6': {
      'ru': 'AutoBuy',
      'en': 'AutoBuy',
      'ko': 'AutoBuy',
    },
    '7oo5161m': {
      'ru': 'Вход',
      'en': 'Login | Register',
      'ko': '로그인 | 등록',
    },
    'ro99rnw0': {
      'ru': 'Введите ваши данные, чтобы продолжить',
      'en': 'Please enter your details to continue.',
      'ko': '계속하려면 세부정보를 입력하세요.',
    },
    'lnca8gc2': {
      'ru': 'Email',
      'en': 'Phone number',
      'ko': '전화 번호',
    },
    'gdytc864': {
      'ru': 'Пароль',
      'en': '',
      'ko': '',
    },
    'i4q35lon': {
      'ru': 'Продолжить',
      'en': 'Continue',
      'ko': '계속하다',
    },
    '8qlxtc8b': {
      'ru': 'Еще нет аккаунта? ',
      'en': '',
      'ko': '',
    },
    'j4ez3qkb': {
      'ru': 'Зарегистрируйтесь',
      'en': '',
      'ko': '',
    },
    'lrmr1488': {
      'ru': 'Забыли пароль? ',
      'en': '',
      'ko': '',
    },
    'aud37nqq': {
      'ru': 'Восстановить',
      'en': '',
      'ko': '',
    },
    '3i2mmp5d': {
      'ru': 'Home',
      'en': 'Home',
      'ko': '집',
    },
  },
  // CreateOrder
  {
    'hpvqeepj': {
      'ru': 'Создание заявки',
      'en': 'Create an application',
      'ko': '애플리케이션 만들기',
    },
    'wq7ey0hi': {
      'ru': 'Добавить фото\n(до 10 штук)',
      'en': 'Add photos\n(up to 10)',
      'ko': '사진 추가\n(최대 10개)',
    },
    '8xco74ol': {
      'ru': 'Модель машины',
      'en': 'Car model',
      'ko': '자동차 모델',
    },
    'me3600cl': {
      'ru': 'Год выпуска',
      'en': 'Year of issue',
      'ko': '발행 연도',
    },
    'j4lt3vkr': {
      'ru': 'Пробег',
      'en': 'Mileage',
      'ko': '사용량',
    },
    'v8jhibgf': {
      'ru': 'Бензин',
      'en': 'Petrol',
      'ko': '가솔린',
    },
    'z2xvchvg': {
      'ru': 'Дизель',
      'en': 'Diesel',
      'ko': '디젤',
    },
    'qgp53g1n': {
      'ru': 'Газ',
      'en': 'Gas',
      'ko': '가스',
    },
    'vwd1epvv': {
      'ru': 'Бензин',
      'en': 'Petrol',
      'ko': '가솔린',
    },
    'wqdwlabv': {
      'ru': 'Пожалуйста, выберите',
      'en': 'Please select',
      'ko': '선택하세요',
    },
    'hlj6edfp': {
      'ru': 'Поиск',
      'en': 'Search',
      'ko': '포이스크',
    },
    '2r8kgcyp': {
      'ru': 'Тип двигателя',
      'en': 'Engine type',
      'ko': '엔진 유형',
    },
    'rdd6vbu1': {
      'ru': 'Объем двигателя',
      'en': 'Engine capacity',
      'ko': '엔진 크기',
    },
    '9gtrgssv': {
      'ru': 'Цвет кузова',
      'en': 'Body color',
      'ko': '바디 컬러',
    },
    'tobk6qg4': {
      'ru': 'Отправить заявку',
      'en': 'Submit request',
      'ko': '요청 보내기',
    },
    'f3n0x68e': {
      'ru': 'Home',
      'en': 'Home',
      'ko': '집',
    },
  },
  // Request
  {
    'u5mymk03': {
      'ru': 'Модель машины:',
      'en': 'Car model:',
      'ko': '자동차 모델:',
    },
    'rbmljl4i': {
      'ru': 'Состояние заявки:',
      'en': 'Application status:',
      'ko': '신청 상태:',
    },
    '3apw77x3': {
      'ru':
          'Администратор ответит в течение нескольких часов.\nПри возникновении вопросов:',
      'en':
          'The administrator will respond within a few hours. If you have any questions:',
      'ko': '관리자가 몇 시간 내에 응답할 것입니다. 질문이 있는 경우:',
    },
    'cglilglu': {
      'ru': 'Звонок',
      'en': 'Call',
      'ko': '부르다',
    },
    'uydd6e0b': {
      'ru': 'Сообщение',
      'en': 'Message',
      'ko': '참여',
    },
    '6ehnlu2s': {
      'ru': 'WhatsApp',
      'en': 'WhatsApp',
      'ko': 'WhatsApp',
    },
    'y3b6ctod': {
      'ru': 'Перейти в чат',
      'en': 'To chat',
      'ko': '채팅으로 이동',
    },
    '7tl2js9o': {
      'ru': 'Удалить',
      'en': 'Delete',
      'ko': '삭제',
    },
    'xz12kzih': {
      'ru': 'Поле обязательно для заполнения',
      'en': 'This field is required',
      'ko': '이 필드는 필수입니다',
    },
    'nh2xo3is': {
      'ru': 'Пожалуйста, выберите',
      'en': 'Please select',
      'ko': '선택하세요',
    },
    '04dajo4c': {
      'ru': 'Поле обязательно для заполнения',
      'en': 'This field is required',
      'ko': '이 필드는 필수입니다',
    },
    'x71z1h7k': {
      'ru': 'Пожалуйста, выберите',
      'en': 'Please select',
      'ko': '선택하세요',
    },
    '5lv4criu': {
      'ru': 'Поле обязательно для заполнения',
      'en': 'This field is required',
      'ko': '이 필드는 필수입니다',
    },
    'hhg33087': {
      'ru': 'Пожалуйста, выберите',
      'en': 'Please select',
      'ko': '선택하세요',
    },
    'f3wpxcy2': {
      'ru': 'Поле обязательно для заполнения',
      'en': 'This field is required',
      'ko': '이 필드는 필수입니다',
    },
    'pryct24f': {
      'ru': 'Пожалуйста, выберите',
      'en': 'Please select',
      'ko': '선택하세요',
    },
    'ydxwa6i8': {
      'ru': 'Поле обязательно для заполнения',
      'en': 'This field is required',
      'ko': '이 필드는 필수입니다',
    },
    'oih23eri': {
      'ru': 'Пожалуйста, выберите',
      'en': 'Please select',
      'ko': '선택하세요',
    },
    'kftcw1xl': {
      'ru': 'Поле обязательно для заполнения',
      'en': 'This field is required',
      'ko': '이 필드는 필수입니다',
    },
    'v20doi7l': {
      'ru': 'Пожалуйста, выберите',
      'en': 'Please select',
      'ko': '선택하세요',
    },
    'bcmr29vd': {
      'ru': 'Поле обязательно для заполнения',
      'en': 'This field is required',
      'ko': '이 필드는 필수입니다',
    },
    'u4xfxco0': {
      'ru': 'Пожалуйста, выберите',
      'en': 'Please select',
      'ko': '선택하세요',
    },
    'r2ognyaa': {
      'ru': 'Поле обязательно для заполнения',
      'en': 'This field is required',
      'ko': '이 필드는 필수입니다',
    },
    '4ram4fao': {
      'ru': 'Пожалуйста, выберите',
      'en': 'Please select',
      'ko': '선택하세요',
    },
    'se5w3jt1': {
      'ru': 'Домой',
      'en': 'Home',
      'ko': '집',
    },
  },
  // Registration
  {
    'iittegaz': {
      'ru': 'AutoBuy',
      'en': '',
      'ko': '',
    },
    '1z1pi32u': {
      'ru': 'Регистрация',
      'en': '',
      'ko': '',
    },
    'xg6cwvu6': {
      'ru': 'Введите ваши данные, чтобы продолжить',
      'en': '',
      'ko': '',
    },
    'ojzrydxa': {
      'ru': 'Email',
      'en': '',
      'ko': '',
    },
    'oyc4p4fy': {
      'ru': 'Номер телефона',
      'en': '',
      'ko': '',
    },
    'gqz87rul': {
      'ru': 'Пароль',
      'en': '',
      'ko': '',
    },
    'mytj8vvt': {
      'ru': 'Подтвердите пароль',
      'en': '',
      'ko': '',
    },
    'pshlpa7o': {
      'ru': 'Зарегистрироваться',
      'en': '',
      'ko': '',
    },
    'x9qw21h9': {
      'ru': 'Уже есть аккаунт? ',
      'en': '',
      'ko': '',
    },
    'nujahaed': {
      'ru': 'Войти',
      'en': '',
      'ko': '',
    },
    '5iy628t0': {
      'ru': 'Home',
      'en': 'Home',
      'ko': '집',
    },
  },
  // ForgotPassword
  {
    'r7krnkwg': {
      'ru': 'AutoBuy',
      'en': '',
      'ko': '',
    },
    '0mt37nc0': {
      'ru': 'Восстановление пароля',
      'en': '',
      'ko': '',
    },
    'b9lbr0jv': {
      'ru': 'Введите ваши данные, чтобы продолжить',
      'en': '',
      'ko': '',
    },
    'at3woqhq': {
      'ru': 'Email',
      'en': '',
      'ko': '',
    },
    '9dsgfdr4': {
      'ru': 'Введите ваш email',
      'en': '',
      'ko': '',
    },
    'obuyahw8': {
      'ru': 'Продолжить',
      'en': '',
      'ko': '',
    },
    'hjn9gnqk': {
      'ru': 'Home',
      'en': '',
      'ko': '',
    },
  },
  // ProfileInfo
  {
    '1n0jnsxt': {
      'ru': 'Ваше имя',
      'en': 'Your name',
      'ko': '당신의 이름',
    },
    'dcfdphq1': {
      'ru': 'Ваш номер телефона',
      'en': '',
      'ko': '',
    },
    'gmosb337': {
      'ru': 'Сохранить',
      'en': 'Save',
      'ko': '구하다',
    },
  },
  // Miscellaneous
  {
    '6a0wzji8': {
      'ru': 'Разрешите доступ к камере...',
      'en': 'Access to the camera',
      'ko': '카메라에 대한 액세스',
    },
    'nj8nfh5w': {
      'ru': 'Разрешите доступ к галерее...',
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
