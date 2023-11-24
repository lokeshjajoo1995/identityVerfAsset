/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 11-24-2023
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public class GetRecordIdSet {  
   
    @InvocableMethod(label='Get Record Set used' description='Returns set of record Id against whom against whom auth')  
    public static list<list<String>> getrecordSet(QueryParameters[] queryParams){
        list<String> result = new list<String>();
        try{
            String fieldsToQuery = queryParams[0].fieldsToQuery;
            fieldsToQuery = fieldsToQuery?.substring(0, fieldsToQuery.length()-1);
            string query = 'Select '+ fieldsToQuery + ' FROM ' +  queryParams[0].objectApiName + ' WHERE Id=\'' + queryParams[0].recordId+'\'';
            sObject[] recordList = database.query(query);
            if(!recordList.isEmpty()){
                sObject obj = recordList[0];
                Map<String, Object> fieldsToValue = obj.getPopulatedFieldsAsMap();
                system.debug(fieldsToValue);
                for(String keys: fieldsToValue.keySet()){
                    if(keys != 'RecordTypeId'){
                        result.add((String)fieldsToValue.get(keys));
                    }
                }
            }
           
        }catch(Exception e){
            throw e;
        }
        //return result;
        return new List<List<String>>{result};
    }
   
    /* Input parameters for the Apex action */
    public class QueryParameters{
        @InvocableVariable(label='Api name of the Primary Object' required = true )
        public string objectApiName;
       
        @InvocableVariable(label='API names of the recordId fields to query(Comma separated)' required = true)
        public string fieldsToQuery;
       
        @InvocableVariable(label='Record Id of Primary Object' required = true)
        public string recordId;
       
    }
   
    /* Output parameters of the Apex action */
    public class QueryResults{
        @InvocableVariable(label='List of records')
		public list<String> result;        
    }

}