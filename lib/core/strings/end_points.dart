class EndPoints {
  static const productionBaseUrl = "https://fatortakprodapi.azurewebsites.net/api/";
  static const stagingBaseUrl = "https://zinvoivedevapi.azurewebsites.net/api/";
  // auth
  static const login = 'Authenticate/login';
  static const register = 'Authenticate/register';
  static const validateSecurityCode = 'Authenticate/validatesecuritycode/';
  static const resendCode = 'Authenticate/Resend/';
  static const deleteUser = 'Users/';

  //company-registration
  static const registerCompany = 'CompanyRegistration/';
  static const getCompanyLookups = 'CompanyRegistration/getcompanyinfo-lookups/';
  static const uploadLogo = 'CompanyRegistration/postcompany-logo/';

  //invoices
  static const getInvoices = 'Invoices/getinvoices';
  static const singleInvoice = 'Invoices';
  static const getInvoiceLookups = 'Invoices/getInvoice-lookups';
  static const filterInvoices = 'Invoices/getinvoicelist';

  //customers
  static const getCustomers = 'Customers/getcustomers';
  static const singleCustomer = 'Customers';
  static const getCustomersLookups = 'Customers/getCustomer-lookups';

  //products
  static const getProducts = 'Items/getitems';
  static const addProduct = 'Items';
  static const editProduct = 'Items';
  static const getItemTypes = 'Items/getItem-lookups';

  //profile
  static const getProfile = 'Users/getuserdata';
  static const changePassword = 'Authenticate/change-password';
  static const getCompanyLookupsDataForProfile = 'Companies/getcompanyinfo-lookups';


  //branches
  static const companyBranches = 'Companies/getcompanybranchlist';
  static const editBranch = 'Companies/putcompanybranch/';
  static const addBranch = 'Companies/postcompanybranch';

  //roles
  static const companyRoles = 'Companies/getcompanyroleList';
  static const getSingleRole = 'Companies/getcompanyrole/';
  static const addRole = 'Companies/postcompanyrole';
  static const editRole = 'Companies/putcompanyrole/';
  static const getFeatures = 'Companies/getfeatures';

  //users
  static const companyUsers = 'Companies/getcompanyuserlist';
  static const getSingleUser = 'Companies/getcompanyuser/';
  static const getCompanyUserLookup = 'Companies/getcompanyuserlookup/';
  static const editUser = 'Companies/putcompanyuser/';
  static const addUser = 'Companies/postcompanyuser';

  //Statistics
  static const receivedInvoices ="Statistics/getreceivedinvoices-dashboard";
  static const submittedInvoices ="Statistics/getsubmittedinvoices-dashboard";

  //payment
  static const getSubscriptionPlans ="PaymentGateway/getsubscriptionplans";
  static const getcompanysubscription ="PaymentGateway/getcompanysubscription";
  static const getPaymentMethods ="PaymentGateway/getpaymentmethods";
  static const startSubscription ="PaymentGateway/startsubscription";
  static const executePayment ="PaymentGateway/executepayment_mobile";


  //ETA
  static const getETAConnections ="Companies/getcompany_etaconnection/";
  static const addETAConnections ="Companies/setcompany_etaconnection/";
  static const getETALookups ="Companies/getcompany_etaconnection_lookups";

  //Change Company
  static const getUserCompanies = 'Users/getusercompanies';
  static const changeCompany = 'Users/setuser_selected_company/';
}
