public with sharing class DemoCardController {
    
    @AuraEnabled
    public static List<Account> getAccounts(){
        try {
            return [SELECT Id, Name From Account];
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}