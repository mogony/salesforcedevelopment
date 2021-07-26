public with sharing class AccountController {
    public static List<Account> getAllActiveAccounts() {
        return [SELECT Name,Address__c,Quantity_Students__c,Level_of_Education__c FROM Account WHERE RecordType.name = 'School Account'];
    }

    public static void assignment1() {
        List<Account> accs = getAllActiveAccounts();
        for(Integer i = 0; i < accs.size(); i++) {
            System.debug(accs[i]);
        }
    }

    public static void assignment2() {
        List<Account> accs = new List<Account>();
        String[] loe = new String[]{'hbo', 'havo-vwo', 'wo'};
        for(Integer i = 0; i < 3; i++) {
            Account a = new Account(
                Name = 'Foo ' + i,
                Address__c = 'Amsterdam',
                RecordTypeId = '01209000000ZZyxAAG', 
                Level_of_Education__c = loe[i]
            );
            accs.add(a);
        }
        for ( Account school : accs) {
            System.debug('Added: ' + school);
        }
        try {
            insert accs;
        } catch(DmlException e) {
            System.debug(
                'An unexpected error has occurred: ' + e.getMessage());
        }
    }

    public static void assignment3() {
        List<Account> accs = new List<Account>();
        String[] loe = new String[]{'hbo', 'havo-vwo', 'wo'};
        for(Integer i = 0; i < 3; i++) {
            Account a = new Account(
                Name = 'Bar ' + i,
                Address__c = 'Utrecht',
                RecordTypeId = '01209000000ZZyxAAG', 
                Level_of_Education__c = loe[i]
            );
            accs.add(a);
        }
        for ( Account school : accs) {
            System.debug('Added: ' + school);
        }
        try {
            insert accs;
        } catch(DmlException e) {
            System.debug(
                'An unexpected error has occurred: ' + e.getMessage());
        }
    }

    public static void assignment4n5(String city) {
        List<Account> schools = [SELECT Name,Address__c,Quantity_Students__c,Level_of_Education__c FROM Account WHERE RecordType.name = 'School Account' AND Address__c = :city AND Level_of_Education__c = 'wo'];
        for ( Account school : schools) {
            System.debug(school);
        }
    }
    
    public static void assignment6() {
        List<Account> schools = [SELECT Name,Address__c,Quantity_Students__c,Level_of_Education__c FROM Account WHERE RecordType.name = 'School Account' AND Address__c LIKE '%Den Haag%' AND Quantity_Students__c >= 10000];
        for ( Account school : schools) {
            System.debug(school);
        }
    }
}