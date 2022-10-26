# Microsuck added this annoying password expiration date that forces password changes every 5 days or some shit.
# If you have a reasonably long password, like something generated with openssl rand -hex 16 which would be 32 characters long, then attempting to remotely RDP back to your house is annoying as fuck
#Ctrl+R enter 'cmd.exe' and then Ctrl+Shift+Enter to run as Admin
wmic UserAccount where Name='username' set PasswordExpires=False
