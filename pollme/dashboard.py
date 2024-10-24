from django.utils.translation import gettext_lazy as _

from django_daisy.admin import DaisyAdminSite


class PollmeAdminDashboard(DaisyAdminSite):
    site_title = _('Django Daisy')
    site_header = _('Pollme Administration')
    index_title = _('Pollme Dashboard Index Page')
