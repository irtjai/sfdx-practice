public with sharing class DemoCardController {
    
    @AuraEnabled
    public static List<Account> getAccounts(){
        try {
            return [SELECT Id, Name From Account];
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled
    public static List<contact> getContacts(){
        try {
            return [SELECT Id, LastName, FirstName From Contact];
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}