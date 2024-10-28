public with sharing class DemoCardController {
    
    @AuraEnabled
    public static List<Account> getAccounts(){
        try {
            return [SELECT Id, Name,AccountNumber, Site,Description, Fax From Account];
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled
    public static void updateAccount(String accId)){
        try {
            Account acc = new Account(Id=accId);
            acc.Name = 'Company Acc';
            acc.Site = 'Test';
            acc.BillingAddress = 'Mumbai';
            acc.Industry = 'Other';
            Update acc;

            system.debug('Update Account commit...');

        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }   

}