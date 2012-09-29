for combo in $(cat vendor/replicant/jenkins-build-targets)
do
    add_lunch_combo $combo
done
