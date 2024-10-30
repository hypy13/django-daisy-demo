from django.contrib.auth import get_user_model
from django.contrib.auth.hashers import make_password
from django.db.models.signals import pre_save
from django.dispatch import receiver


@receiver(pre_save, sender=get_user_model())
def reset_default_password(sender, instance, **kwargs):
    if instance.username == 'demo':
        instance.email = 'demo@gmail.com'
        instance.is_staff = True
        instance.username = 'demo'
        instance.first_name = 'Demo'
        instance.last_name = 'Demo'
        instance.password = make_password('demo')
