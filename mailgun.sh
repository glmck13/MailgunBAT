#!/bin/bash

MAILGUN_DOMAIN=
MAILGUN_APIKEY=
MAILGUN_FROM=
MAILGUN_TO=
MAILGUN_BCC=

echo -n "Enter template name: "; read MAILGUN_TEMPLATE
echo -n "Enter subject: "; read MAILGUN_SUBJECT
echo -n "Enter attachment: "; read MAILGUN_ATTACHMENT

if [ "$MAILGUN_ATTACHMENT" -a -f "$MAILGUN_ATTACHMENT" ]; then
	MAILGUN_ATTACHMENT="-F attachment=@${MAILGUN_ATTACHMENT}"
else
	MAILGUN_ATTACHMENT=
fi

echo; set | grep MAILGUN
echo; echo -n "Press enter to continue..."; read x; echo

curl -k --user api:${MAILGUN_APIKEY} \
    https://api.mailgun.net/v3/${MAILGUN_DOMAIN}/messages \
    -F from=${MAILGUN_FROM} \
    -F to=${MAILGUN_TO} \
    -F bcc=${MAILGUN_BCC} \
    -F subject="${MAILGUN_SUBJECT}" \
    -F template=${MAILGUN_TEMPLATE} ${MAILGUN_ATTACHMENT} \
    -F h:X-Mailgun-Variables="{\"unsubscribe\":\"%mailing_list_unsubscribe_url%\",\"name\":\"%recipient_name%\"}"

echo; echo -n "Press enter to continue..."; read x; echo
