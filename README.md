# RAM_notification_for_ubantu

#edit and execute notification.sh script
1.nano notification.sh 
2. change the mail id from EMAIL="your@mail_id.com" 

#save the file and give executable rights to the file chmod +x notification.sh

#Install mailutils
1.sudo apt udate
2.sudo apt install mailutils

#set cronjob
1. crontab -e
*/5 * * * * /path/to/notification.sh
