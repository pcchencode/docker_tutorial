# now=`date`
# a=1444 # shell scipt 等號不能有空格
# echo ${a}

# printf "Please input your name:"
# read Name
# echo "Your name is $Name"

# s=0
# for (( i=1; i<=100; i=i+1 ))
# do
# 	s=$(($s+$i))
# done
# echo "The result of '1+2+3+...+100' is ==> $s"

# pwd
# ls
# echo pwd

# cal_date=
# while getopts "d:" opt; do
# 	case $opt in
# 		d)
# 		cal_date=$OPTARG
# 		;;
# 	esac
# done

# # data sync
# # if [ $mode -eq 1 ]; then
# # touch /tmp/tmp.lock
# echo 'daily job start'
# # touch /tmp/tmp.lock
# echo ${cal_date}
# # rm -rf /tmp/tmp.lock

day=`date +%u`
day=`date`
echo ${day}