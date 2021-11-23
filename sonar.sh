echo 'switch case demo starts' 
case $1 in
start)
echo 'starting SonarQube server'
echo 'SonarQube server started';;
stop)
echo 'stopping SonarQube server'
echo 'SonarQube server stopped';;
restart)
echo 'restarting SonarQube server'
echo 'SonarQube server restarted';;
enable)
echo 'SonarQube service ebanled';;
*)
echo 'sorry you passed the wrong option'
echo 'Options are start|stop|restart|enable';;
esac
echo 'switch case demo ends'

