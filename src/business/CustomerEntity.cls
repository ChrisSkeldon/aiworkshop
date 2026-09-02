/*------------------------------------------------------------------------
  File        : CustomerEntity
  Purpose     : Business Entity for Customer data access
  Syntax      : 
  Description : 
  Author(s)   : 
  Created     : Tue Apr 15 11:54:46 CEST 2025
  Notes       : 
----------------------------------------------------------------------*/

USING Progress.Lang.*.
USING OpenEdge.BusinessLogic.BusinessEntity.

BLOCK-LEVEL ON ERROR UNDO, THROW.

CLASS business.CustomerEntity INHERITS BusinessEntity USE-WIDGET-POOL:
    {business/CustomerDataset.i}
    DEFINE DATA-SOURCE srcCustomer FOR Customer.

    CONSTRUCTOR PUBLIC CustomerEntity():
        SUPER(DATASET dsCustomer:HANDLE).
        VAR HANDLE[1] hDataSourceArray = DATA-SOURCE srcCustomer:HANDLE.
        VAR CHARACTER[1] cSkipListArray = [""].
        THIS-OBJECT:ProDataSource = hDataSourceArray.
        THIS-OBJECT:SkipList = cSkipListArray.
    END CONSTRUCTOR.

    METHOD PUBLIC LOGICAL GetCustomerByName(INPUT ipcCustomerName AS CHARACTER, OUTPUT DATASET dsCustomer):
        VAR CHARACTER cFilter.
        VAR LOGICAL lFound = FALSE.
        cFilter = "WHERE Customer.Name = '" + ipcCustomerName + "'".
        THIS-OBJECT:ReadData(cFilter).
        lFound = CAN-FIND(FIRST ttCustomer).
        RETURN lFound.
    END METHOD.

    METHOD PUBLIC LOGICAL GetCustomerByNumber(INPUT ipiCustNum AS INTEGER, OUTPUT DATASET dsCustomer):
        VAR CHARACTER cFilter.
        VAR LOGICAL lFound = FALSE.
        cFilter = "WHERE Customer.CustNum = " + STRING(ipiCustNum).
        THIS-OBJECT:ReadData(cFilter).
        lFound = CAN-FIND(FIRST ttCustomer).
        RETURN lFound.
    END METHOD.

    METHOD PUBLIC VOID CreateCustomer(INPUT-OUTPUT DATASET dsCustomer):
        THIS-OBJECT:CreateData(DATASET dsCustomer BY-REFERENCE).
    END METHOD.

    METHOD PUBLIC VOID UpdateCustomer(INPUT-OUTPUT DATASET dsCustomer):
        THIS-OBJECT:UpdateData(DATASET dsCustomer BY-REFERENCE).
    END METHOD.

    METHOD PUBLIC VOID DeleteCustomer(INPUT-OUTPUT DATASET dsCustomer):
        THIS-OBJECT:DeleteData(DATASET dsCustomer BY-REFERENCE).
    END METHOD.

    METHOD PUBLIC LOGICAL ValidateCustomer(INPUT-OUTPUT DATASET dsCustomer, OUTPUT errorMessage AS CHARACTER):
        VAR LOGICAL isValid = TRUE.
        FIND FIRST ttCustomer NO-ERROR.
        IF AVAILABLE ttCustomer AND ttCustomer.Name = "" THEN DO:
            isValid = FALSE.
            errorMessage = "Customer name cannot be empty".
        END.
        RETURN isValid.
    END METHOD.

    METHOD PUBLIC LOGICAL FindCustomersWithEmptyName(OUTPUT DATASET dsCustomer):
        VAR CHARACTER filter.
        VAR LOGICAL found = FALSE.
        filter = "WHERE Customer.Name = ''".
        THIS-OBJECT:ReadData(filter).
        found = CAN-FIND(FIRST ttCustomer).
        RETURN found.
    END METHOD.

    METHOD PUBLIC LOGICAL FindNextCustomerWithEmptyName(OUTPUT DATASET dsCustomer):
        DEFINE VARIABLE found AS LOGICAL NO-UNDO INIT FALSE.
        FIND NEXT ttCustomer WHERE ttCustomer.Name = "" NO-ERROR.
        found = AVAILABLE ttCustomer.
        RETURN found.
    END METHOD.
END CLASS.
