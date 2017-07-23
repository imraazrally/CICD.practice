#waiting for mysql
i='1'

echo "waiting for db  to start"
while [ $i -gt 0 ]; do
	mysqladmin ping -h rubyappdb -u $MYSQL_USER -p$MYSQL_ROOT_PASSWORD 2>/dev/null 1>/dev/null
	mysql_status=${?}
	if [ ${mysql_status} -eq 0 ]; then 
		break;
	fi
	sleep 10
done

#starting server
bundle exec rails db:migrate
bundle exec rails s