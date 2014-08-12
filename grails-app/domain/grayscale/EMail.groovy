package grayscale

class EMail {

    String title
    String message
    String email
    String sender

    static constraints = {
        title   nullable: false, blank: false, maxSize: 500
        message nullable: false, blank: false, maxSize: 10000
        email   nullable: false, blank: false, email: true
        sender  nullable: false, blank: false, maxSize: 500
    }

    String toString()
    {
        "$title $message $email $sender"
    }
}
