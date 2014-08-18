package grayscale

class EMail {

    String name
    String subject
    String email
    String phone
    String message

    static constraints = {

        name blank: false, nullable: false
        subject blank: false, nullable: false
        email blank: false, email: true, nullable: false
        phone blank: true, nullable: true
        message blank: false, nullable: false, maxSize: 10000
    }

    String toString() {
        "$name + <$email>"
    }
}
