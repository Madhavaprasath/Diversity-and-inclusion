extends Node

var days=["Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"]
var date=1
var time="00:00"
var counter=0
var current_day=days[counter]



#changes the time in the particular day
func change_time():
	var hours_minutes=time.split(":")
	hours_minutes[1]=str(int(str(hours_minutes[1]))+30)
	if int(hours_minutes[1])>=60:
		hours_minutes[1]='00'
		hours_minutes[0]=str(int(hours_minutes[0])+1)
		hours_minutes[0]= str(hours_minutes[0]) if int(hours_minutes[0])>9 else "0"+str(hours_minutes[0])
	if hours_minutes[0]=='24':
		hours_minutes[0]="00"
		change_day()
		date+=1
	time=hours_minutes[0]+":"+hours_minutes[1]


#changes the day of the time
func change_day():
	counter=counter+1 if counter<6 else 0
	current_day=days[counter]
