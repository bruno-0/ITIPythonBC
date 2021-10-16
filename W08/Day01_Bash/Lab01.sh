#! /bin/bash






#Read and Validate data from two seprate files [invoice.txt ,invoice_details.txt]  before insert it to the database

#Entries Validation
#        1.Sufficent Parameters.
#	 2.Checking if customer name is valid.
#	 3.Checking if total is valid.
#	 4.Checking if date is valid.
#	 5.Checking if item name is valid.
# 	 6.Checking quantity data is valid.
#	 7.Checking units data is valid.


#Exit Codes
#        1.Invalid parameters.
#        2.customer name not valid.
#        3.Total isn't a valid number.
#        4.Date is not valid.
#	 5.Item name is not valid.
#	 6.Quantity not valid.
#	 7.Unit not valid.



## Checking if we got two files to validate 

if [[ ${#} -ne 2 ]]
then
    echo "Invalid Parameters"
    exit 1
fi

## Aquire the first file, and capture it's Line to start validate the contents of each row before insert it into the database
INV=${1}
Lines=$(cat $INV)

for line in $Lines
do

	ID=$(echo ${line} | awk -F',' '{print $1}')
	NAME=$(echo ${line} | awk -F',' '{print $2}')
	TOTAL=$(echo ${line} | awk -F',' '{print $3}')
	DATE=$(echo ${line} | awk -F',' '{print $4}')

## Check name validation

COUNT=$(echo ${NAME} |  egrep -c -v "[^a-zA-Z]+")
    if [ ${COUNT} -ne 1 ]
    then
        echo "customer name is not a valid "
        exit 2
    fi	


##Check Total amount is greater than 0

SUM=$(echo ${TOTAL} |  egrep -c -v "[^0-9]+")
    if [ ${SUM} -ne 1 ]
    then
        echo "Total isn't a valid number"
        exit 3
    fi

##Check Date is valid

    VDDATE=$(echo ${DATE} | egrep -c -v "^[0-9]{4}-(0[1-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])$")
	if [ ${VDDATE} -ne 1 ]
	then
		echo "Date is not valid"
		exit 4
	fi


#set the value of the database
DATABASE="postgres"

## Insert into Database.
#psql -h localhost -p 5432 -d $DATABASE -c "INSERT INTO invoice(name, total, date) VALUES ('${NAME}','${TOTAL}', '${DATE}')"

##Checking our insertion
#psql -h localhost -p 5432 -d $DATABASE -c "SELECT * FROM invoice;"

	
done





## Aquire the second file, and capture it's Line to start validate the contents of each row before insert it into the database

DETAILS=${2}
#	echo "$DETAILS"

Lines=$(cat $DETAILS)
#	echo "$Lines"

for line in $Lines
do

        INVOICE_ID=$(echo ${line} | awk -F',' '{print $1}')
        ITEM_NAME=$(echo ${line} | awk -F',' '{print $2}')
        QUANTITY=$(echo ${line} | awk -F',' '{print $3}')
        UNIT=$(echo ${line} | awk -F',' '{print $4}')

	#echo "$ITEM_NAME"
	#echo "$QUANTITY"
	#echo "$UNIT"


## Check Item Name is valid

VDNAME=$(echo ${ITEM_NAME} |  egrep -c -v "[^a-zA-Z]+")
    if [ ${VDNAME} -ne 1 ]
    then
        echo "Item name is not valid "
        exit 5
    fi


## Check Quantity data is valid

 VDQ=$(echo ${QUANTITY} |  egrep -c -v "[^0-9]+")
    if [ ${VDQ} -ne 1 ]
    then
        echo "Quantity not valid"
        exit 6
    fi


##Check UNIT date is valid

VDUNIT=$( echo ${UNIT} | egrep -c -v "[^a-zA-Z/]")
	if [ ${VDUNIT} -ne 1 ]
	then
		echo "Unit not valid"
		exit 7
	fi




#set the value of the database
DATABASE="postgres"

## Insert into Database.

#psql -h localhost -p 5432 -d $DATABASE -c "INSERT INTO invoice_details(inv_id, item, quantity, unit) VALUES ('${INVOICE_ID}','${ITEM_NAME}', '${QUANTITY}', '${UNIT}')"

##Checking our insertion
#psql -h localhost -p 5432 -d $DATABASE -c "SELECT * FROM invoice_details;"


done

exit 0
