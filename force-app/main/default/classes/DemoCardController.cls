public with sharing class DemoCardController {
    
    @AuraEnabled
    public static List<Account> getAccounts(){
        try {
            return [SELECT Id, Name,AccountNumber, Site From Account];
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
            acc.AccountSource = 'Other';
            Update acc;

            contact con = new contact();
            con.AccountId = acc.Id;
            con.LastName = 'Arun';
            Insert con;
            getBillingAddress(acc.Id);
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    public static void getBillingAddress(String accId){
        String id = accId;
    }
}