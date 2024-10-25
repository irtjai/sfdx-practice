public with sharing class AccountController {
    @AuraEnabled
    public static void updateAccount(String accId)){
        try {
            Account acc = new Account(Id=accId);
            acc.Name = 'Company Acc';
            acc.Site = 'Test';
            acc.BillingAddress = 'Mumbai';
            acc.AccountSource = 'Other';
            Update acc;

        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}