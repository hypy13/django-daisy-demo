from django.apps import AppConfig


class AccountsConfig(AppConfig):
    name = 'accounts'
    icon = 'fa-solid fa-person-military-pointing'

    def ready(self):
        from .signals import reset_default_password  # noqa

        super().ready()
