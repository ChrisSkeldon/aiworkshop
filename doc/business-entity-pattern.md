# ABL Business Entity Architecture Pattern

The Business Entity pattern separates UI, business logic, and database access in OpenEdge ABL applications.

## Layers

- UI windows handle user interaction and call business entity methods.
- Business entities inherit from `OpenEdge.BusinessLogic.BusinessEntity`, own datasets and data sources, and implement validation and CRUD operations.
- The database layer is accessed through data sources attached to business entities.

## Customer Entity

A customer entity includes `CustomerDataset.i`, defines `DATA-SOURCE srcCustomer FOR Customer`, passes `DATASET dsCustomer:HANDLE` to `SUPER()`, and assigns the data-source and skip-list arrays.

Read operations build a `WHERE` filter, call `ReadData()`, and return whether the dataset contains a record. Create, update, and delete operations pass datasets by reference to the parent methods. Updates should enable temp-table tracking changes and validate before persistence.

Use named buffers for direct database access and use `dump/sports2000.df` as the database schema.
