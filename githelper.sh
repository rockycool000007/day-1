!#/bin/bash

echo " Enter one of the following options : 
        1. Initialize git 
	2. Pull the latest code
	3. Push the code to remote repository
	4. Merge the code
	5. Create new branch
	6. Clone the code"

V_INIT_PATH="/opt/code/"
V_PROJECT_PATH="/opt/code/session1-git/"
V_REPO_REFERENCE="origin"

read V_OPTION
echo "$V_OPTION"
#echo "${V_OPTION}" works too

# If else loop for the option user inputs
if [ "$V_OPTION" -eq "1" ]; then
	echo "Initializing git repository"
	cd "$V_INIT_PATH"
	git init

elif [ "$V_OPTION" -eq "2" ]; then
	echo "Enter Branch Name : " 
	read V_BRANCH_NAME
	echo "Pulling latest code from ${V_BRANCH_NAME}"
	# git --git-dir=/opt/code/session1-git/.git pull origin "$V_BRANCH_NAME"
	cd "$V_PROJECT_PATH"
	git pull origin "$V_BRANCH_NAME"

elif [ "$V_OPTION" -eq 3 ]; then
	echo "Confirm to push the code : (Y/N)"
	read V_CONFIRM_PUSH
	if [ "$V_CONFIRM_PUSH" = "Y" ]; then
		echo "Enter message to commit the code : "
		read V_COMMIT_MESSAGE
		echo "Enter branch name : "
		read V_BRANCH_NAME
		cd "$V_PROJECT_PATH"
		git add *
		git commit -m "$V_COMMIT_MESSAGE"
		git push -u "$V_REPO_REFERENCE" "$V_BRANCH_NAME" 
	fi

elif [ "$V_OPTION" -eq "5" ]; then
	echo "Enter the new branch name : "
	read V_NEW_BRANCH
	cd "$V_PROJECT_PATH"
	git branch "$V_NEW_BRANCH"
	git push "$V_REPO_REFERENCE" "$V_NEW_BRANCH"
	echo "Do you want to checkout the new branch ? (Y/N) "
	read V_CHECKOUT_BRANCH_OPT
	
	if [ "$V_CHECKOUT_BRANCH_OPT" = "Y" ]; then
		git checkout "$V_NEW_BRANCH"
	fi

elif [ "$V_OPTION" -eq "6" ]; then
	echo "Enter the repository url to clone: "
	read V_REPO_URL
	cd "$V_INIT_PATH"
	git clone "$V_REPO_URL"
	echo The repository has been cloned from "$V_REPO_URL"
fi


# Check if the operation succeeded using the exit code
if [ "$?" -eq "0" ]; then
	echo "The operation was successful"
fi
