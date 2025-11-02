
# Oulu Bank TODO 

## Bank Account Tests for Deposit and Withdraw (Unit Tests)

- [x] When deposit using check or cash then bank balance increases.  
- [x] When deposit using transfer then charge fee to amount deposited.  
- [X] Depositing negative amount is not allowed. 
- [x] Withdrawing with insufficient balance results in penalty. 
- [x] Deposited amount is added to the transaction history. 
- [ ] Withdrawing the amount is added to the transaction history. 

## APRService Tests 

- [x] APR is calculated within expected range for valid SSN.
- [x] APR calculation fails for ssn with no credit score.  

## Mocking

- [x] APR service should call get credit score on credit score service
- [x] APR service does not call get credit score for invalid ssn   

## UITests 

- [x] User can calculate APR successfully for valid SSN. 
- [x] Displays error message when credit score was invalid or not found. 
