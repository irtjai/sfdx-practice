public with sharing class AccountController {
    @AuraEnabled
    public static void updateAccount(String accId)){
        try {
            Account acc = new Account(Id=accId);
            acc.Name = 'Company Acc';
            acc.Site = 'Test';
            acc.BillingAddress = 'Delhi';
            acc.AccountSource = 'Other';
            Update acc;

            system.debug('@@@ testing commit 1');
            system.debug('@@@ testing commit 2');
            system.debug('@@@ testing commit 3');

        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}