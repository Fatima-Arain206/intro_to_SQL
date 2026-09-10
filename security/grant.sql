-- Role for users who see masked data
CREATE ROLE MaskedDataViewers;
GRANT SELECT ON Customers TO MaskedDataViewers;

-- Role for users who see unmasked data
CREATE ROLE UnmaskedDataViewers;
GRANT SELECT ON Customers TO UnmaskedDataViewers;
GRANT UNMASK ON Customers TO UnmaskedDataViewers;

-- Add users to appropriate roles
ALTER ROLE MaskedDataViewers ADD MEMBER SupportStaff;
ALTER ROLE UnmaskedDataViewers ADD MEMBER ComplianceOfficer;