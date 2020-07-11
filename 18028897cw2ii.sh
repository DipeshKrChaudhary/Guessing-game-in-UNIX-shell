#!/bin/bash

#BestOne function declare
BestOne(){	
	PS3="Please, select the number from the choosen player code.: " #provide a custom prompt for the user to select a value
	select players in $p1 $p2 $p3
	do 
		if [ -z "$players" ] #checks weather user entered codes are from list
		then
			echo ""
			echo -e "Invalid player code number! Please, select from list. \a"
			echo ""
			BestOne
		else
			echo 
		fi

	case $players in #conditions if user input are one of those
		"PK" ) 
		cat PK ;; #opening the description file of Parash Khadka
		"VK" )
		cat VK ;; 
		"RT" )
		cat RT ;;
		* )
        echo ""
		echo -e "Player profile not found! \a"
		echo ""
		echo "============RESTARTING THE GAME============"
		Country ;;   #callig Country function if player profile is not found
	esac

    #function if user want to play again
	PlayAgain(){
		echo ""
		echo ""
		echo -e "Do you want to play again? \nyes\nno"
		echo ""
		read ask
		if [[ $ask == yes ]]
		then
			Country
		elif [[ $ask == no ]]
		then
			echo ""
			echo "Thank you for playing." 
		else
			echo ""
			echo -e "Enter valid option \a"
			PlayAgain #calling PlayAgain function if input is incorrect
		fi
	}

	PlayAgain
	
	break

done
}

#Choose function declare
Choose(){
	echo ""
	echo -e "Choose code of three player out of five seperated by space.: \c"
	read p1 p2 p3
	players=($p1 $p2 $p3) #storing the input of user
	if [[ ${#players[@]} -eq 3 ]] #checking weather the input is equal to 3 
	then
		echo ""
	else
		echo ""
		echo -e "Please enter only three code not more or not less! \a"
		echo ""
		Choose
	fi	

	for p in ${players[@]};  
	do
		if [ $p == PK ] || [ $p == VK ] || [ $p == DW ] || [ $p == BS ] || [ $p == RT ] #checking the code are given from list
		then
			if [ $p1 == $p2 ] || [ $p1 == $p3 ] || [ $p2 == $p3 ] #checing if use has enter same code twice
			then
				echo ""
				echo -e "You cannot enter same code more than once! \a"
				Choose
			fi
		else
			echo ""
			echo -e "Please, enter correct code from list only! \a"
			echo ""
			Choose
		fi
	done
}

#function for dislpaying list of five players of country team 
Player(){
	echo ""
	echo ""
	echo "^^^^^^^^^^^^^^LEVEL 2^^^^^^^^^^^^^^^^^"
	echo "________________________________________"
	echo "****************************************"
	echo "          PLAYERS OF CRICKET"
	echo "****************************************"
	echo "          PLAYER           CODE"
	echo "----------------------------------------"
	echo "          Paras Khadka     PK"
	echo "          Virat Kohli      VK"
	echo "          David Warner     DW"
	echo "          Ben   Stokes     BS"
	echo "          Ross  Taylor     RT"
	echo "_________________________________________"
	echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
	echo ""
	echo ""
			
}

#asking user to select one country code
CooseCountry(){
	
	until [ "$team" == "NEP" ] #runs loop until correct team is entered
	do
		echo ""
		echo -e "Which is the best team in cricket? (Please, enter country code.): \c"
	    read team
		
		if [[ "$team" == "NEP" ]] #if correct team is entered than country description is displayed
		then
			echo ""
			echo ""
			echo "Congrulation you have enter right answer!"
			echo "-------------------------------------------------------------------------------------------"
	        echo "Nepal is the greatest team in cricket." 
	        echo "The Nepal national cricket team represent the country of Nepal in the international cricket." 
	        echo "Nepal were awarded Twenty20 International (T20I) status by the ICC in June 2014."
	        echo -e "On 15 March 2018, Nepal gained One day International (ODI) status for first time, \nafter winning the first playoff match in 2018 Cricket World Cup Aualifier.\n"
	        echo "-------------------------------------------------------------------------------------------"
		else
			if [ "$team" == "AUS" ] || [ "$team" == "BAN" ] || [ "$team" == "NEP" ] || [ "$team" == "IND" ] || [ "$team" == "ENG" ]
			then
				echo ""
				echo -e "You have enter wrong answer. \a"
				echo "        Try again!"
			else
				echo ""
				echo -e "Invalid country code! Please enter code from list. \a"
			fi		
		fi 
	done
	team="" #emptying the user input
	
}

#Country function declare 
Country(){
	echo ""
	echo ""
	echo "^^^^^^^^^^^^^^LEVEL 1^^^^^^^^^^^^^^^^^^"
	echo "________________________________________"
	echo "****************************************"
	echo "            CRICKET TEAMS               "
	echo "****************************************"
	echo "            COUNRTY       CODE"
	echo "----------------------------------------"
	echo "            Australia      AUS"
	echo "            Bangladesh     BAN"
	echo "            Nepal          NEP"
	echo "            India          IND"
	echo "            England        ENG"
	echo "_________________________________________"
	echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
	echo ""
	echo ""
	

	CooseCountry #calling CooseCountry function
	Player       #calling Player function
	Choose       #calling Choose function
	BestOne      #calling BestOne function

	
}

#Program starts from here
#Condition if the user starts the program with program name and first name and the user id number
if [[ $1 != "" && $2 != "" ]]; #if condtion for checking both parameter is empty or not
then
	fName=$1 #storing 1st argumnet in fName
	idNo=$2  #storing 2nd agrument in idNo
	

	while [[ $try -lt 5 ]]; #loop used to count up to 5
	do
		echo -e "" #echo for display text
		echo -e ""
		echo -e  "Please, enter secret key to enter in the game: \c" 
		read key #key will store input provided by user
		if [[ $key == 4 ]]; #secret key is 1234 / checking weather secret key is correct
		then #welocomes users
			echo "****************WELCOME TO THE GAME************"
			echo "****************Mr/ms. $fName*********************"
			echo "****************ID no. $idNo******************"
			echo "***Login date. $(date)****"
			Country #calling Country function
			break
		else
			if [[ $try == 4 ]]; #if user enteres wrong secret key
			then
				echo -e "<<<<<<<<<<Incorrect secret key<<<<<<<<<< \a"
				echo -e ">>>>>>>>>>Too many attempts!>>>>>>>>>>>> \a"
			else
				echo ""
				echo -e "<<<<<<<<<<Incorrect secret key<<<<<<<<<< \a"

			fi
			
		fi
	 let try++
	done
else
	echo ""
	echo -e "Please, enter your first name and Id number with file name! \a"
fi



