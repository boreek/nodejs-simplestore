## Запуск
- `npm update`
- `npm run dev`

## Задание
- Поднять сервер на NodeJS (express, connect или любой другой фреймворк по желанию)
- Создать базу на postgresql в которой должна хранится информация о товарах и заказах
- На главной вывести товары (товар должен состоять минимум из цены и заголовка, остальное по вкусу и желанию)  из базы и создать кнопку купить (Верстка должна быть минимальной, но без нее никак)
- При клике на кнопку купить происходит переход в корзину (AJAX) в которой указан товар что был выбрал и присутствует поле (<input>) в котором интегрирована API Google Maps и работает авто заполнение, при вводе адреса вылетает подсказка с адресом возможной доставки
- После выборе адреса пользователь может нажать кнопку оформить заказ при нажатии которой в базе добавляется новый заказ с адресом доставки, именем товара и его ценой