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
        for(Integer j = 0; j < accs.size(); j++) {
            System.debug(accs[j]);
        }
        try {
            insert accs;
        } catch(DmlException e) {
            System.debug(
                'An unexpected error has occurred: ' + e.getMessage());
        }
    }
}