public with sharing class DemoCardController {
    
    @AuraEnabled
    public static List<Account> getAccounts(){
        try {
            return [SELECT Id, Name,AccountNumber From Account];
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    // create new account
    @AuraEnabled
    public static void CreateAccount(){
        try {
            Account acc = new Account();
            acc.Name = 'Company Acc';
            acc.Site = 'Test';
            acc.BillingAddress = 'Mumbai';
            acc.Industry = 'Other';
            Insert acc;

            system.debug('Insert Account commit...');

        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }  
    
    @AuraEnabled
    public static void updateAccountInfo(String accId)){
        try {
            Account acc = new Account(Id=accId);
            acc.Name = 'Company Acc';
            acc.Site = 'Test';
            acc.BillingAddress = 'Mumbai';
            acc.Industry = 'Other';
            Update acc;

            system.debug('Update Account Info...');

        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    } 

    public static void getHelper(){
        system.debug('@@@@@ Helper method added.');
    }

}