/*------------------------------------------------------------------------
  File        : EntityFactory
  Purpose     : Factory for creating singleton instances of business entities
  Syntax      : 
  Description : Implements the Singleton pattern for business entity classes
  Author(s)   : 
  Created     : Tue Apr 15 12:01:20 CEST 2025
  Notes       : 
----------------------------------------------------------------------*/

USING Progress.Lang.*.
USING business.CustomerEntity.
USING business.EntityFactory.

BLOCK-LEVEL ON ERROR UNDO, THROW.

CLASS business.EntityFactory USE-WIDGET-POOL:
    VAR PRIVATE STATIC EntityFactory objInstance.
    VAR PRIVATE CustomerEntity objCustomerEntityInstance.

    CONSTRUCTOR PRIVATE EntityFactory():
    END CONSTRUCTOR.

    METHOD PUBLIC STATIC business.EntityFactory GetInstance():
        IF objInstance = ? THEN
            objInstance = NEW business.EntityFactory().
        RETURN objInstance.
    END METHOD.

    METHOD PUBLIC CustomerEntity GetCustomerEntity():
        IF objCustomerEntityInstance = ? THEN
            objCustomerEntityInstance = NEW CustomerEntity().
        RETURN objCustomerEntityInstance.
    END METHOD.

    METHOD PUBLIC VOID ResetInstances():
        IF VALID-OBJECT(objCustomerEntityInstance) THEN
            DELETE OBJECT objCustomerEntityInstance.
        objCustomerEntityInstance = ?.
    END METHOD.
END CLASS.
