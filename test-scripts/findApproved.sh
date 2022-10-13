echo Determining Appoved Applications by invoking the DRL decision service: POST 'http://localhost:8080/api/find-approved'
echo 

echo "*** Results ***"
curl --location --request POST 'http://localhost:8080/api/find-approved' \
--header 'Content-Type: application/json' \
--data-raw '{
    "maxAmount": 5000,
    "loanApplications": [
        {
            "id": "ABC10001",
            "amount": 2000,
            "deposit": 100,
            "applicant": {
                "age": 45,
                "name": "John"
            }
        },
        {
            "id": "ABC10002",
            "amount": 5000,
            "deposit": 100,
            "applicant": {
                "age": 25,
                "name": "Paul"
            }
        },
        {
            "id": "ABC10015",
            "amount": 1000,
            "deposit": 100,
            "applicant": {
                "age": 12,
                "name": "George"
            }
        }
    ]
}
'
