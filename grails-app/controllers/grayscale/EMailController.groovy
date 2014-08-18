package grayscale

class EMailController {

    def mailService

    static scaffold = true

    def main_page()
    {
        def email = new EMail()
        //email.properties = params
        flash.message = ""
        return [email: email]
    }

    def send() {

        flash.message = "OK"
        def email = new EMail(params);
        email.subject = "Сообщение с сайта \"Fruit Inc.\"";

        def validMessage = true

        if (!email.save()) {
            validMessage = false
            flash.message = "ERROR"
        }

        def message = "${email?.message} \n\n" + "С уважением, ${email?.name},\n" + "email: ${email?.email}" + ((email?.phone == null) ? "" : ",\n тел.: ${email?.phone}");

        if (validMessage) {
            try {
                mailService.sendMail {
                    //to "example@gmail.com" // <-- необходимо указать адрес получателя сообщений
                    from "${email?.name} <${email?.email}>"
                    subject "${email?.subject}"
                    body message
                }

                // Reset form
                email = new EMail()

            }
            catch (Exception e) {
                flash.message = "ERROR"
            }
        }

        render(template: "sendMail", model: ['email': email])
    }
}
