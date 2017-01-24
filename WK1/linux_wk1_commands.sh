#!/bin/sh
set -x

USERNAME="jon"
PASSWORD="123456"
GROUPNAME="mahisfot"
PATH_PROJECT="$HOME/work/workshop-linux"

# Creating Home Path Script Excecution to go there and excute all the following commands
if [ ! -d $PATH_PROJECT ]; then
  mkdir -p $PATH_PROJECT
fi

cd $PATH_PROJECT

# 1- Create User
echo "***** Creating user $USERNAME *****"
useradd $USERNAME
echo "***** Verifiy that User $USERNAME is in the list *****"
cut -d: -f1 /etc/passwd

# 2- Change the user password
echo "***** Changing Password for USERNAME *****"
echo "$USERNAME:$PASSWORD" | chpasswd

# 3- Remove the user created
echo "***** Removing User $USERNAME created *****"
userdel $USERNAME
echo "***** Verifiy that User $USERNAME is not in the list *****"
cut -d: -f1 /etc/passwd

# 4- Create a group
echo "***** Creating a Group  $GROUPNAME *****"
groupadd mahisoft

# 5- Add a group to a newly created user
echo "***** Creating user $USERNAME *****"
useradd $USERNAME
echo "***** Assing group $GROUPNAME to user $USERNAME *****"
usermod -a -G $GROUPNAME $USERNAME
echo "***** Id form user $USERNAME to see $USERGROUP assigment *****"
id $USERNAME
echo "***** View group $GROUPNAME to user $USERNAME *****"
groups $USERNAME

# 6- Delete the group
echo "***** Deleting Group  $GROUPNAME *****"
groupdel $GROUPNAME
echo "***** Id form user $USERNAME to see $USERGROUP deleted *****"
id $USERNAME
echo "***** View group $GROUPNAME deleted from user $USERNAME *****"
groups $USERNAME

# 7- Change the primary group of the user
echo "***** Creating two Groups $GROUPNAME and $SECONDGRUOPNAME *****"
groupadd $GROUPNAME
groupadd $SECONDGRUOPNAME
echo "***** Assing second group $SECONDGRUOPNAME as primary to user $USERNAME *****"
usermod -a -G $GROUPNAME $USERNAME
id $USERNAME
usermod -g $SECONDGRUOPNAME $USERNAME
echo "***** View group $SECONDGRUOPNAME as primary to user $USERNAME *****"
id $USERNAME

echo "***** Deleting everything to clear environment *****"
groupdel $USERNAME
userdel $USERNAME
groupdel $SECONDGRUOPNAME
groupdel $GROUPNAME

# 8- Add several users in one command
echo "***** Creating two Users $USERNAME $SECONDUSERNAME and one Group $GROUPNAME*****"
useradd $USERNAME
useradd $SECONDUSERNAME
groupadd $GROUPNAME
echo "***** Adding 2 Users to Group $GROUPNAME ******"
gpasswd -M $USERNAME,$SECONDUSERNAME $GROUPNAME
echo "***** View that those Users are in the Group $GROUPNAME *****"
cat /etc/group | grep $GROUPNAME

echo "***** Deleting everything to clear environment *****"
groupdel $GROUPNAME
userdel $SECONDUSERNAME

# 9- As a regular user show your user name
echo "***** Changing to User $USERNAME ******"
sudo -u $USERNAME whoami

echo "***** Deleting everything to clear environment *****"
userdel $USERNAME

# 10- Query last some user has been logged in
echo "***** Query last some user has been logged in *****"
echo "Login as a user already created and run the command -> lastlog"

# 11- Modify the expiration date of a user
echo "***** Modify the expiration date of a user *****"
echo "See the details from a User with command: chage -l $USERNAME"
echo "Change the date of expiration with command: chage -E 2017-02-14 $USERNAME"
echo "See the details changed from a User with command: chage -l $USERNAME"

# 12- Change multiple user passwords
echo "***** Change multiple user passwords *****"
echo "First write the command: chpasswd and press ENTER"
echo "Add a line with: $USERNAME:$PASSWORD and press ENTER"
echo "Add a line with: $SECONDUSERNAME:$PASSWORD and press ENTER"
echo "Press keys control + d"	
echo "Execute login command with the two users and passwords to check if they are working"

# 13- Modify some information of the user
echo "***** Modify some information of the user *****"
echo "Change USERNAME running the command: usermod -l $NEWUSERNAME $OLDUSERNAME"
echo "Verify that you can log in as $NEWUSERNAME excecuting the command: login $NEWUSERNAME"

# 14- As an admin show who is logged in
echo "***** As an admin show who is logged in *****"
echo "As a root run the command: login $USERNAME"
echo "Open a new terminal and log in as a root"
echo "Run the command as a root: w"


