# Первое задание: верстка приложения "Attendia"


Наша цель — не идеальное повторение, а понимание основных принципов верстки во Flutter.

**Ссылка на макет в Figma:** [https://www.figma.com/design/3abyMyNTH7gMqb7Q592lIC/%D0%9F%D1%80%D0%B8%D0%BB%D0%BE%D0%B6%D0%B5%D0%BD%D0%B8%D0%B5-%D1%82%D0%B5%D1%81%D1%82%D0%BE%D0%B2%D0%BE%D0%B5?node-id=0-1&p=f&t=MHKNpqLMCzBQpRUh-0]

---

### ✅ Ваша задача:

1.  **Обязательная часть:** Сверстать два экрана:
    *   **Splash Screen** (Экран загрузки)
    *   **Login Page** (Экран входа)

2.  **⭐ Бонусная часть:**
    *   Сверстать экран **Profile Page** (Просмотр профиля).

---

### 📚 Шаг за шагом к результату

#### Шаг 0: Подготовка проекта

1.  Создайте новый Flutter-проект.
2.  Очистите файл `lib/main.dart` от всего лишнего кода (от стандартного счетчика).
3.  Создайте в корне проекта папку `assets`. Внутри нее создайте папку `images`.
4.  Скачайте логотип из Figma и положите его в `assets/images/`.
5.  Откройте файл `pubspec.yaml` и "активируйте" папку с ассетами. Найдите закомментированный блок `assets:` и приведите его к такому виду (следите за отступами, это очень важно!):

    ```yaml
    flutter:
      uses-material-design: true
      assets:
        - assets/images/
    ```

#### Шаг 1: Splash Screen

Это самый простой экран. Он состоит из фона с градиентом и логотипа по центру.

**Подсказки (виджеты, которые вам понадобятся):**

*   `Container`: Чтобы задать фон. У него есть свойство `decoration`.
*   `BoxDecoration`: Чтобы создать градиент. У него есть свойство `gradient`.
*   `LinearGradient`: Для создания линейного градиента. Укажите `begin`, `end` и `colors`.
*   `Center`: Чтобы разместить логотип по центру.
*   `Image.asset`: Чтобы показать логотип из вашей папки `assets`.

**Заготовка кода:**

// Внутри вашего виджета экрана
```dart
Scaffold(
  body: Container(
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [Color(0xFFF9A825), Color(0xFFF57C00)], // Подберите цвета из Figma
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    ),
  ),
  child: Center(
    child: Image.asset('assets/images/logo.png'), // Убедитесь, что путь правильный
    ),
  ),
);
```


#### Шаг 2: Login Page

Здесь уже интереснее! Элементы идут друг под другом.

**Подсказки:**

*   `Column`: Основной виджет для расположения элементов вертикально.
*   `SizedBox(height: ...)`: Для создания вертикальных отступов между элементами.
*   `Image.asset`: Логотип.
*   `Text`: Для текста "Welcome back...".
*   `TextField`: Для полей ввода. У него есть свойство `decoration`, внутри которого используется `InputDecoration`.
*   `InputDecoration`: Чтобы добавить текст-подсказку (`hintText: 'Enter your email'`) и скруглить углы (`border: OutlineInputBorder(...)`).
*   `ElevatedButton`: Для большой оранжевой кнопки "Login".

**Важно:** Пока не пытайтесь реализовать иконку глаза в поле пароля и кнопку "Forgot Password?". Сделаем это позже. Сконцентрируйтесь на основной структуре.

**Заготовка кода для поля ввода:**

// Пример одного поля ввода
```dart
Padding(
  padding: const EdgeInsets.symmetric(horizontal: 24.0),
  child: TextField(
    decoration: InputDecoration(
      hintText: 'Enter your email',
      filled: true,
      fillColor: Colors.grey[200], // Подберите цвет
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none, // Убираем стандартную рамку
      ),
    ),
  ),
);
```



---

### 🛠️ Что гуглить, если застряли?

Умение искать — главный навык. Вот примеры запросов:
*   `flutter column align center`
*   `flutter textfield hint text style`
*   `flutter elevatedbutton change color`
*   `flutter add custom font` (если захотите использовать тот же шрифт, что в макете)
*   `flutter circle image` (для бонусного задания)

---

### 🏆 Как сдать задание

Вечером присылайте репозиторий:
1.  Скриншоты получившихся экранов.
2.  Ссылку на ваш GitHub-репозиторий с кодом.

Удачи! Помните, что я на связи, если возникнут вопросы.
```
