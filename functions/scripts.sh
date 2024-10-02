firebase functions:secrets:set service_account="$(cat /Users/rasityilmaz/Desktop/Projects-Mine/quotely_app/quotely_app/functions/src/serviceAccount.json)"
firebase functions:config:set jwt.secret_key="secret_key"

firebase functions:config:get
