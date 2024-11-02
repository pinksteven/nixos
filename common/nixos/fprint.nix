{
    services.fprintd.enable = true;

    security.pam.services = {
        greetd.fprintAuth = false;
        polkit-1.fprintAuth = false;
    };
}