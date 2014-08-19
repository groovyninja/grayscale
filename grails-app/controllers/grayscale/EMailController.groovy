package grayscale

class EMailController {

    /*
     * Dependency Injection для сервиса отправки почтовых сообщений.
     * Связыванеи происходит по соглашению именования сервисов.
     * Плагин mail-1.0.7 объявляет доступный сервис
     * grails.plugin.mail.MailService
     * Соответственно мы должны объявить атрибут класса с именем
     * mailService для DI сервиса
     * grails.plugin.mail.MailService
     * в рассматриваемы класс
     */
    def mailService

    /*
     * Добавляем скаффолдинго для CRUD операций на объектами EMail.
     * Это позволяет нам быстро добавить панель администрирования
     * для работы с объектами системы, доступную по адресу
     * http://localhost:8080/grayscale/EMail/index
     * Однако, все ситилевое оформление в ней будет нарушено,
     * поскольку мы изменили основной шаблон
     * views/layouts/main.gsp
     * отключив в нем все стили, добавляемые по умолчанию.
     */
    static scaffold = true

    /**
     * Основная страница нашего приложения. В соответствии с соглашением, принятым в Grails,
     * при обрашениии к этому действию по адресу
     * http://localhost:8080/grayscale/EMail/main_page
     * будет отрисована страница
     * /views/EMail/main_page.gsp
     * связанная с этим контроллером.
     *
     * @return Пустой объект EMail для сброса формы обратной связи при перезагрузке страницы
     */
    def main_page()
    {
        def email = new EMail()
        //email.properties = params
        flash.message = ""
        return [email: email]
    }

    /**
     * Действие по отправке сообщения email с сайта приложения.
     *
     * @return
     */
    def send() {

        flash.message = "OK" // <-- статус об отправке письма записывается в динамически созданный атрибут неявного объекта flash (облать видимости аналогичная request, session, apllication из servlet)
                             // <-- далее мы будем использовать этот статус в js библиотеке noty для отображения всплывающего сообщения об успешности отправки письма

        // иницализируем значения атрибутов объекта EMail данными, пришедшими из html формы, описанной в шаблоне
        // views/EMail/_sendMail.gsp
        def email = new EMail(params);
        email.subject = "Сообщение с сайта \"Fruit Inc.\""; // <-- тему письма задаем явным образов в коде, а не из формы отправки

        def validMessage = true

        // сохраняем объект в БД при этом срабатываю валидаторы уровня доменного слоя Grails
        if (!email.save())
        {
            validMessage = false
            flash.message = "ERROR" // <-- если объект не прошел валидацию записываем в flash сообщение для noty
        }

        // формируем тело письма
        def message = "${email?.message} \n\n" + "С уважением, ${email?.name},\n" + "email: ${email?.email}" + ((email?.phone == null) ? "" : ",\n тел.: ${email?.phone}");

        // если валидация объекта прошла успешно, отправляем письмо
        if (validMessage)
        {
            try
            {
                mailService.sendMail {
                    //to "example@gmail.com" // <-- необходимо указать адрес получателя сообщений
                    from "${email?.name} <${email?.email}>"
                    subject "${email?.subject}"
                    body message
                }

                // при удачной отправке (нет exception) сбразываем данные объекта модели, используемого при отрисовки формы обратной связи
                email = new EMail()

            }
            catch (Exception e)
            {
                flash.message = "ERROR" // <-- сервис выбросил сообщение об ошибке, сообщаем об этом пользователю посредством noty
            }
        }

        // после отправки электронного сообщения
        // возвращаем в теле ajax запроса html код из шаблона
        // views/EMail/_sendMail.gsp
        // и кроме того иницализируем бин с идентификатором email
        // значением переменной email
        render(template: "sendMail", model: ['email': email])
    }
}
