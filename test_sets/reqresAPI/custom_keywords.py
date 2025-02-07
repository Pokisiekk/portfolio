import warnings
from urllib3.exceptions import InsecureRequestWarning

def disable_warnings():
    """Disables InsecureRequestWarning."""
    warnings.simplefilter("ignore", InsecureRequestWarning)
