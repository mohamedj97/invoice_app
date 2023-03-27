class EndPoints {
  static const productionBaseUrl = "";
  static const stagingBaseUrl = "https://zinvoivedevapi.azurewebsites.net/api/";

  static const base = 'https://zinvoivedevapi.azurewebsites.net/api/';

  // auth
  static const login = 'Authenticate/login';
  static const register = 'Authenticate/register';
  static const validateSecurityCode = 'Authenticate/validatesecuritycode/';


  //invoices
  static const getInvoices = 'Invoices';
  static const getInvoiceLookups = 'Invoices/getInvoice-lookups';
  static const filterInvoices = 'Invoices/getinvoicelist';

  //customers
  static const getCustomers = 'Customers';
  static const getCustomersLookups = 'Customers/getCustomer-lookups';

  //products
  static const getProducts = 'Items';
  static const addProduct = 'Items';
  static const editProduct = 'Items';
  static const getItemTypes = 'Items/getItem-lookups';

  //profile
  static const getProfile = 'Users/getuserdata';
  static const changePassword = 'Users/change-password';


  //Statistics
  static const receivedInvoices ="Statistics/getreceivedinvoices-dashboard";
  static const submittedInvoices ="Statistics/getsubmittedinvoices-dashboard";

}
