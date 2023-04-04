class EndPoints{
     static String contact = "+91xxxxxxxxx";
    static String androidUrl = "whatsapp://send?phone=$contact&text=Hi, I need some help";
    static String iosUrl = "https://wa.me/$contact?text=${Uri.parse('Hi, I need some help')}";
}