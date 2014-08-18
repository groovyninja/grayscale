<%@ page import="grayscale.EMail" %>

<g:formRemote id="ajax-contact-form" name="sendMail" url="[controller: 'EMail', action: 'send']" method="post"
              update="sendMailDiv">
    <div class="grid_6">
        <input type="text" name="name" required="true" value="${email?.name}" placeholder="Имя"/>
        <input type="text" name="phone" value="${email?.phone}" placeholder="Телефон"/>
        <input type="text" name="email" required="true" value="${email?.email}" placeholder="Email"/>
    </div>

    <div class="grid_6 omega">
        <textarea name="message" id="message" required="true" placeholder="Сообщение">${email?.message}</textarea>
    </div>

    <div class="clear"></div>
    <input type="reset" class="contact_btn" value="Очистить"/>
    <input type="submit" class="contact_btn send_btn" value="Отправить"/>


    <div class="clear"></div>
</g:formRemote>

<script type="text/javascript">
    $(document).ready(function () {
        if ("${flash.message}" != '') {
            if (${flash.message == 'OK'})
                intsystems.generate('Ваше сообщение успешно отправлено!', 'success');
            else
                intsystems.generate('При отправке сообщения возникли ошибки! Сообщение не отправлено.', 'error');
        };
        $(":input[placeholder]").placeholder();
    });
</script>
