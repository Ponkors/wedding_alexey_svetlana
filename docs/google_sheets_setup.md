# Настройка Google Sheets для RSVP

## 1. Создание Google Таблицы

1. Создайте новую Google Таблицу
2. Добавьте следующие заголовки в первую строку:
   - Timestamp
   - Имя
   - Телефон
   - Количество гостей
   - Присутствие

## 2. Настройка Google Apps Script

1. В Google Таблице перейдите в меню Extensions -> Apps Script
2. Создайте новый файл скрипта и вставьте следующий код:

```javascript
function doPost(e) {
  var sheet = SpreadsheetApp.getActiveSpreadsheet().getActiveSheet();
  var data = JSON.parse(e.postData.contents);
  
  sheet.appendRow([
    new Date(),
    data.name,
    data.phone,
    data.guests,
    data.isAttending ? 'Да' : 'Нет'
  ]);
  
  return ContentService.createTextOutput(JSON.stringify({
    'result': 'success',
    'row': sheet.getLastRow()
  })).setMimeType(ContentService.MimeType.JSON);
}
```

3. Нажмите Deploy -> New deployment
4. Выберите "Web app"
5. Настройте:
   - Execute as: Me
   - Who has access: Anyone
6. Нажмите Deploy
7. Скопируйте URL для использования в приложении

## 3. Обновление кода приложения

После получения URL, обновите значение `YOUR_GOOGLE_APPS_SCRIPT_URL` в файле `lib/widgets/rsvp_section.dart` на полученный URL. 