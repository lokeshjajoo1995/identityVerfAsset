/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 11-24-2023
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
@isTest
private class TestGetRecordIdSet{

	@testSetup static void setup(){
		String dateString = String.valueof(Datetime.now())
        .replace(' ', '')
        .replace(':', '')
        .replace('-', '');
		String uniqueName = dateString+'@test.org';
		Account a = new Account(name='test acc',phone='9494146144');
        insert a;
        Contact con = new Contact(accountid=a.id,lastname=uniqueName,email=uniqueName);
        insert con;
	}

	@isTest static void testMethod1() {
		List<Contact> conList = [select id from contact limit 1];
		String recordId = conList[0].id;
		GetRecordIdSet.QueryParameters qryParam = new GetRecordIdSet.QueryParameters();
		qryParam.objectApiName = 'Contact';
		qryParam.recordId=recordId;
		qryParam.fieldsToQuery = 'Id,AccountId,';
		List<GetRecordIdSet.QueryParameters> qryParamList = new List<GetRecordIdSet.QueryParameters>();
		qryParamList.add(qryParam);
		Test.startTest();
		GetRecordIdSet.getrecordSet(qryParamList);
		Test.stopTest();
	}
}