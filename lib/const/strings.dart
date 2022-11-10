abstract class LoginScreenStrings {
  static const appName = 'Birge';
  static const welcome = 'Добро пожаловать!';
  static const pleaseEnterEmail = 'Пожалуйста, введите свой e-mail';
  static const pleaseEnterPwd = 'Пожалуйста, введите пароль';
  static const enterButton = 'Войти';
  static const forgotPwd = 'Забыли пароль?';
  static const personalInfo = 'Личная информация';
  static const enterEmail = 'Введите e-mail';
  static const enterPassword = 'Введите пароль';
  static const email = 'Почта';
  static const password = 'Пароль';
  static const dontHaveAcc = 'Нет аккаунта? ';
  static const signUp = 'Зарегистрируйтесь';
  static const continueWith = 'Или продолжить с';
  static const imageLogin = 'assets/images/welcome_image.jpg';
}

abstract class SplashScreenStrings {
  static const firstPhrase =
      'Даже своим интересом, вы уже делаете шаг на встречу кардинальным изменениям в своей жизни';
  static const greetings = 'Мы рады приветствовать вас!';
}

abstract class MainScreenStrings {
  static const question = 'Какая помощь вам нужна?';
  static const meditationButton = 'Медитация';
  static const therapistButton = 'Психолог';
  static const planButton = 'Статьи'; //comment to the client
  static const diaryButton = 'Дневник';
}

abstract class HelpScreenStrings {
  static const hello = 'Привет!';
  static const helloText =
      'Меня зовут - Айша! Рада с тобой познакомится, жду не дождусь узнать тебя по ближе.';
  static const therapist = 'О нашем психологе:';
  static const therapistAbout =
      'Вам не хватает мотивации что-либо делать или просто наплевать на то, что происходит вокруг вас. Это часто длится долго. У вас может отсутствовать желание делать что-либо, что связано с мышлением или вашими эмоциями. Каждый человек в тот или иной момент теряет интерес к вещам, но когда это происходит часто, это может повлиять на ваши отношения, вашу работу и вашу способность наслаждаться жизнью.';
  static const sighUp = 'Записаться';
  static const goBack = 'Вернуться назад';
  static const imageHello = 'assets/images/help_screen_image.png';
  static const imageCongrats = 'assets/images/help_screen_image_congrats.png';
  static const sighingUp = 'Запись';
  static const email = 'Почта';
  static const name = 'Имя';
  static const date = 'Дата';
  static const create = 'Создайте учетную запись, чтобы начать';
  static const goFurther = 'Далее';
  static const congrats = 'Поздравляю';
  static const goMain = 'Вернуться на главную';
}

abstract class ProfileScreenStrings {
  static const profile = 'Профиль';
  static const photo = 'Фото профиля';
  static const name = 'Ваше имя';
  static const login = 'Логин';
  static const oldPassword = 'Ваш пароль';
  static const newPassword = 'Новый пароль';
}

abstract class QuestionnaireScreenStrings {
  static const tests = 'Психологические тесты';
  static const phrase =
      'Пожалуйста, ответьте правдиво даже если не хочется признаваться';
  static const startButton = 'Начнем!';
  static const firstQuestion = ['Первый вопрос', 'Ответ1', 'Ответ2', 'Ответ3'];
  static const secondQuestion = ['Второй вопрос', 'Ответ1', 'Ответ2', 'Ответ3'];
  static const thirdQuestion = ['ЕТретий вопрос', 'Ответ1', 'Ответ2', 'Ответ3'];
  static const result = 'Результат';
  static const text = 'Текст';
  static const recommendations = 'Рекомендация';
  static const backButton = 'Назад';
}

abstract class ArticlesScreenStrings {
  static const articles = 'Статьи';
  static const phrase = 'Про что вы хотите прочитать?';
  static const anxiety = 'Тревога';
  static const burnout = 'Выгорание';
  static const selfEsteem = 'Самооценка';
  static const apathy = 'Апатия';
  static const depression = 'Депрессия';
  static const bullying = 'Буллинг';
}

abstract class SingleArticleScreenStrings {
  static const continueReading = ' Читать далee';
  static const hide = ' Скрыть';
}

abstract class MeditationsScreenStrings {
  static const meditations = 'Медитация';
  static const rain = 'Звуки дождя';
  static const nature = 'Звуки природы';
  static const anxiety = 'Уменьшите беспокойство';
  static const relax = 'Успокойся и расслабься';
  static const sleep = 'Для сна';
  static const stress = 'Снятие стресса';
  static const search = 'Поиск';
}

abstract class TaskScreenStrings {
  static const plan = 'Составьте план';
  static const rate = 'Важность этой задачи';
  static const rating = 'Оцените от 1 до 10';
  static const when = 'Когда нужно закончить?';
  static const date = 'Выберите дату';
  static const title = 'Название задачи';
  static const subtitle = 'Напишите что хотите сделать';
  static const add = 'Добавить';
}

abstract class DiaryScreenStrings {
  static const diary = 'Дневник';
  static const exampleTitle = 'Пример';
  static const exampleSubtitle =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.';
  static const exampleDiaryNote =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum';
  static const hintText = 'Как прошел Ваш день?';
}

abstract class OnBoardingScreenStrings {
  static const youAreNotAlone = 'Вы не одиноки, мы поможем вам';
  static const weAreHere =
      'Чувствуете себя подавленным? Мы здесь, чтобы поддержать вас.';
  static const goOn = 'Дальше';
  static const imageImage = 'assets/images/onboarding_image.jpg';
  static const imageArrow = 'assets/images/arrow.png';
}

abstract class SignupScreenStrings {
  static const registration = 'Регистрация';
  static const registrationSubtitle = 'Создайте учётную запись, чтобы начать';
  static const name = 'Имя';
  static const enterName = 'Введите имя';
  static const plsEnterName = 'Пожалуйста, введите имя';
  static const email = 'Почта';
  static const emailExample = 'name@email.com';
  static const plsEnterEmail = 'Пожалуйста, введите e-mail';
  static const password = 'Пароль';
  static const createPwd = 'Создайте пароль';
  static const plsEnterPwd = 'Пожалуйста, введите пароль';
  static const confirmPwd = 'Подтвердите пароль';
  static const plsConfirmPwd = 'Пожалуйста, подтвердите пароль';
  static const signUp = 'Зарегистрироваться';
}

abstract class BottomBarStrings {
  static const menu = 'Меню';
  static const articles = 'Статьи';
  static const psychologist = 'Психолог';
}

abstract class PasswordRecoveryScreenStrings {
  static const changePassword = 'Изменить пароль';
  static const enterEmail = 'Введите e-mail, указанный при регистрации';
  static const getLink = 'Получить ссылку для восстановления пароля';
  static const plsEnterEmail = 'Пожалуйста, введите e-mail';
  static const instructionsSent =
      'Мы отправили ссылку для восстановления пароля на вашу почту. Вы получите её в течение 2-х минут';
  static const okButton = 'Ок';
}
