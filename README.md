# MailgunBAT
Windows batch script for Mailgun

The attached Windows batch script sends email through Mailgun making use of the following components:
* [Mailgun API](https://documentation.mailgun.com/en/latest/api_reference.html)
* [Mailgun templates](https://www.mailgun.com/blog/product/mailgun-template-builder)
* [Mailgun mailing lists](https://documentation.mailgun.com/en/latest/user_manual.html#mailing-lists-1)
* Windows curl

To get started, follow the Mailgun instructions posted [here](https://documentation.mailgun.com/en/latest/quickstart-sending.html).  The most important step is to get your domain name properly configured so that Mailgun can use it to send email.  Afterwards you’ll want to create an email distribution list together with a template that contains the body of your email.  The template can contain substitution variables that are enclosed in double braces, i.e. {{ this_is_a_variable }}.  These user-defined variables can either be fixed strings or reference a second set of system-defined variables that depend upon the particular email recipient.  These system-defined variables are enclosed in percent signs, i.e. %recipient%.  You can find a list of them [here](https://documentation.mailgun.com/en/latest/user_manual.html#mailing-lists-1).   Two brace-enclosed variables are defined in the attached batch script:
```
{{unsubscribe}} -> %mailing_list_unsubscribe_url%
{{name}} -> %recipient_name%
```
You can modify the script to define others as needed.
