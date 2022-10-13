echo Determining Loan Eligibility by invoking the DMN decision service: POST 'http://localhost:8081/api/LoanEligibility'
echo 

echo "*** Results ***"
curl --location --request POST 'http://localhost:8081/api/LoanEligibility' \
--header 'Content-Type: application/json' \
--header 'Accept: application/json' \
--data-raw '{
    "Client": {
        "age": 43,
        "salary": 1950,
        "exiting payments": 100
    },

    "Loan": {
        "duration": 15,
        "installment": 180
    },

    "SupremeDirector": "Yes",
    "Bribe": 1000
}'